Return-Path: virtio-comment-return-1578-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0C4DD985E82
	for <virtio-comment@lists.oasis-open.org>; Tue, 22 Dec 2020 02:36:57 +0000 (UTC)
References: <20201218042302.8884-1-jasowang@redhat.com>
 <20201221223338.7b5a21e6.pasic@linux.ibm.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <bbd75f21-4a17-f3df-3c0e-3633a93d0599@redhat.com>
Date: Tue, 22 Dec 2020 10:36:41 +0800
MIME-Version: 1.0
In-Reply-To: <20201221223338.7b5a21e6.pasic@linux.ibm.com>
Subject: Re: [virtio-comment] [PATCH RFC] virtio: introduce
 VIRTIO_F_DEVICE_STOP
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
To: Halil Pasic <pasic@linux.ibm.com>
Cc: stefanha@redhat.com, virtio-comment@lists.oasis-open.org, mst@redhat.com, eperezma@redhat.com, sgarzare@redhat.com
List-ID: <virtio-comment.lists.oasis-open.org>


On 2020/12/22 =E4=B8=8A=E5=8D=885:33, Halil Pasic wrote:
> On Fri, 18 Dec 2020 12:23:02 +0800
> Jason Wang <jasowang@redhat.com> wrote:
>
>> This patch introduces a new status bit DEVICE_STOPPED. This will be
>> used by the driver to stop and resume a device. The main user will be
>> live migration support for virtio device.
>>
> Can you please provide some more background information, or point
> me to the appropriate discussion?
>
> I mean AFAIK migration already works without this driver initiated
> drain. What is the exact motivation? What about the big picture? I
> guess some agent in the guest would have to make the driver issue
> the DEVICE_STOP.


This is not necessary if the datapath is done inside qemu and when=20
migration is initiated by qemu itself.

But it's a must for using virtio-device as a backend for emulated virtio=20
devices (e.g vhost-vDPA). In this case, qemu needs to stop the device=20
then it can safely synchronize the state from them.


>
>> Signed-off-by: Jason Wang <jasowang@redhat.com>
>> ---
>>   content.tex | 26 ++++++++++++++++++++++++--
>>   1 file changed, 24 insertions(+), 2 deletions(-)
>>
>> diff --git a/content.tex b/content.tex
>> index 61eab41..4392b60 100644
>> --- a/content.tex
>> +++ b/content.tex
>> @@ -47,6 +47,9 @@ \section{\field{Device Status} Field}\label{sec:Basic =
Facilities of a Virtio Dev
>>   \item[DRIVER_OK (4)] Indicates that the driver is set up and ready to
>>     drive the device.
>>  =20
>> +\item[DEVICE_STOPPED (32)] When VIRTIO_F_DEVICE_STOPPED is negotiated,
>> +  indicates that the device has been stopped by the driver.
>> +
> AFAIU it is not only about indicating stopped, but also requesting to be
> stopped.
>
> More importantly, that must not be set immediately, in a sense that the
> one side initiates some action by requesting the bit to be set, and the
> other side must not set the bit before the action is performed.


Yes.


> We also
> seem to assume that every device implementation is capable of performing
> this trick.


A dedicated feature bit is introduced for this.


> Is it for hardware devices (e.g. PCI) standard to request an
> operation by writing some value into a register, and get feedback bout
> a non-completion by reading different value that written,


This is not ununsal in other devices. And in fact, the FEATURES_OK works=20
like this:

"""

The device MUST NOT offer a feature which requires another feature which=20
was not offered. The device SHOULD accept any valid subset of features=20
the driver accepts, otherwise it MUST fail to set the FEATURES_OK device=20
status bit when the driver writes it.

"""

We've already had several hardware implementation of virtio-pci devices=20
from different vendors. I didn't hear any complain about such kind of=20
design.


>   and about the
> completion, by reading the same value as written?


After after DEVICE_STOPPED is read from device the driver can assume the=20
device is stopped.


>
>
>>   \item[DEVICE_NEEDS_RESET (64)] Indicates that the device has experienc=
ed
>>     an error from which it can't recover.
>>   \end{description}
>> @@ -58,8 +61,9 @@ \section{\field{Device Status} Field}\label{sec:Basic =
Facilities of a Virtio Dev
>>   \ref{sec:General Initialization And Device Operation / Device
>>   Initialization}.
>>   The driver MUST NOT clear a
>> -\field{device status} bit.  If the driver sets the FAILED bit,
>> -the driver MUST later reset the device before attempting to re-initiali=
ze.
>> +\field{device status} bit other than DEVICE_STOPPED.  If the
>> +driver sets the FAILED bit, the driver MUST later reset the device
>> +before attempting to re-initialize.
>>  =20
>>   The driver SHOULD NOT rely on completion of operations of a
>>   device if DEVICE_NEEDS_RESET is set.
>> @@ -70,12 +74,28 @@ \section{\field{Device Status} Field}\label{sec:Basi=
c Facilities of a Virtio Dev
>>   recover by issuing a reset.
>>   \end{note}
>>  =20
>> +The driver MUST NOT set or clear DEVICE_STOPPED when DRIVER_OK is not
>> +set. In order to stop the device, the driver MUST set DEVICE_STOPPED
>> +first and re-read status to check whether DEVICE_STOPPED is set by the
>> +device. In order to resume the device, the driver MUST clear
>> +DEVICE_STOPPED first and read status to ensure whether DEVICE_STOPPED
>> +is cleared by the device.
>> +
>>   \devicenormative{\subsection}{Device Status Field}{Basic Facilities of=
 a Virtio Device / Device Status Field}
>>   The device MUST initialize \field{device status} to 0 upon reset.
>>  =20
>>   The device MUST NOT consume buffers or send any used buffer
>>   notifications to the driver before DRIVER_OK.
>>  =20
>> +The device MUST ignore DEVICE_STOPPED when DRIVER_OK is not set.
>> +
>> +When driver is trying to set DEVICE_STOPPED, the device MUST not
> The when driver trying to set DEVICE_STOPPED is a bit soft as a
> duration. For example consider virtio-ccw, at the moment when the driver
> issues the ssch to set status, the device still does not know about it.


I need more context on this, if it works like this, when or how can=20
device know the status has been changed? (E.g how reset or other status=20
bit is supposed to work?)

It looks like a transport limitation if we can't guarantee this. Similar=20
issue were met in the PCIE Endpoint device, but it can be workaround by=20
designing a new transport.


>
>> +process new avail requests and MUST complete all requests that is
>> +currently processing before setting DEVICE_STOPPED.
> I would like to have a more precise definition of 'new avail requests'
> and 'requests that is currently processing'.


Good point. How about something like:

The device MUST stop reading requests from descriptor area or driver=20
area and MUST complete all in flight requests before setting DEVICE_STOPPED=
.

To be 100% accurate, it looks to me we need to mention device=20
implementation internals or pseudo code. I start with "in flight" but=20
Stefan wants a more accurate one. Reading the spec I found "in flight"=20
has been used in:

"""

The driver SHOULD NOT rely on completion of operations of a device if=20
DEVICE_NEEDS_RESET is set. Note: For example, the driver can=E2=80=99t assu=
me=20
requests in flight will be completed if DEVICE_NEEDS_RESET is set, nor=20
can it assume that they have not been completed. A good implementation=20
will try to recover by issuing a reset.

"""

So we are probably fine.=C2=A0 Any idea or suggestion are more than welcome=
d.


>
>> +
>> +The device MUST keep the config space unchanged when DEVICE_STOPPED is
>> +set.
> Here you have the set by driver which is actually requesting the stop
> operation, and set by device which indicted that the stop operation
> was successfully performed by the device.


Exactly.

Thanks


>
>> +
>>   \label{sec:Basic Facilities of a Virtio Device / Device Status Field /=
 DEVICENEEDSRESET}The device SHOULD set DEVICE_NEEDS_RESET when it enters a=
n error state
>>   that a reset is needed.  If DRIVER_OK is set, after it sets DEVICE_NEE=
DS_RESET, the device
>>   MUST send a device configuration change notification to the driver.
>> @@ -6553,6 +6573,8 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved=
 Feature Bits}
>>     \item[VIRTIO_F_NOTIFICATION_DATA(38)] This feature indicates
>>     that the driver passes extra data (besides identifying the virtqueue=
)
>>     in its device notifications.
>> +  \item[VIRTIO_F_DEVICE_STOP(39)] This feature indicates that the
>> +  driver can stop and resume the device.
>>     See \ref{sec:Virtqueues / Driver notifications}~\nameref{sec:Virtque=
ues / Driver notifications}.
>>   \end{description}
>>  =20


This publicly archived list offers a means to provide input to the
OASIS Virtual I/O Device (VIRTIO) TC.

In order to verify user consent to the Feedback License terms and
to minimize spam in the list archive, subscription is required
before posting.

Subscribe: virtio-comment-subscribe@lists.oasis-open.org
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
List help: virtio-comment-help@lists.oasis-open.org
List archive: https://lists.oasis-open.org/archives/virtio-comment/
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lis=
ts
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

