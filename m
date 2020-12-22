Return-Path: virtio-comment-return-1582-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 938D9985E84
	for <virtio-comment@lists.oasis-open.org>; Tue, 22 Dec 2020 07:30:47 +0000 (UTC)
References: <20201218042302.8884-1-jasowang@redhat.com>
 <20201221223338.7b5a21e6.pasic@linux.ibm.com>
 <bbd75f21-4a17-f3df-3c0e-3633a93d0599@redhat.com>
 <20201222075005.69d1cc6e.pasic@linux.ibm.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <ed5c4298-cdd4-55d7-20c6-e57d4f92f752@redhat.com>
Date: Tue, 22 Dec 2020 15:30:31 +0800
MIME-Version: 1.0
In-Reply-To: <20201222075005.69d1cc6e.pasic@linux.ibm.com>
Subject: Re: [virtio-comment] [PATCH RFC] virtio: introduce
 VIRTIO_F_DEVICE_STOP
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
To: Halil Pasic <pasic@linux.ibm.com>
Cc: stefanha@redhat.com, virtio-comment@lists.oasis-open.org, mst@redhat.com, eperezma@redhat.com, sgarzare@redhat.com
List-ID: <virtio-comment.lists.oasis-open.org>


On 2020/12/22 =E4=B8=8B=E5=8D=882:50, Halil Pasic wrote:
> On Tue, 22 Dec 2020 10:36:41 +0800
> Jason Wang <jasowang@redhat.com> wrote:
>
>> On 2020/12/22 =E4=B8=8A=E5=8D=885:33, Halil Pasic wrote:
>>> On Fri, 18 Dec 2020 12:23:02 +0800
>>> Jason Wang <jasowang@redhat.com> wrote:
>>>
>>>> This patch introduces a new status bit DEVICE_STOPPED. This will be
>>>> used by the driver to stop and resume a device. The main user will be
>>>> live migration support for virtio device.
>>>>
>>> Can you please provide some more background information, or point
>>> me to the appropriate discussion?
>>>
>>> I mean AFAIK migration already works without this driver initiated
>>> drain. What is the exact motivation? What about the big picture? I
>>> guess some agent in the guest would have to make the driver issue
>>> the DEVICE_STOP.
>>
>> This is not necessary if the datapath is done inside qemu and when
>> migration is initiated by qemu itself.
>>
>> But it's a must for using virtio-device as a backend for emulated virtio
>> devices (e.g vhost-vDPA). In this case, qemu needs to stop the device
>> then it can safely synchronize the state from them.
>>
> You say, in this case qemu needs to stop the device, which makes sense
> (it also has to do this when the datapath is implemented in qemu), but
> AFAIU DEVICE_STOPPED is initiated by the guest and not by qemu. I'm
> confused.


It's initiated by Qemu. Guest is unware of live migration.


>
> I'm still curious about how the different components in the stack
> (guest OS, qemu, vdpa-vhost in host kernel, the PCI function) are
> supposed to interact.


It works like:

 From Qemu point of view, vhost-vDPA is just another type of vhost=20
backend. Qemu needs to stop virtio (vhost) before it can do migration.=20
So we require vDPA devices to have the ability of stopping or pausing=20
its datapath. If the vDPA device is by chance the virtio-PCI device, it=20
needs an interface for receiving stop/resume command from the driver.

So the devce stop/resume command was sent from Qemu to vhost-VDPA, then=20
to vDPA parent which could be a virtio-PCI device in this case.


>
>>>> Signed-off-by: Jason Wang <jasowang@redhat.com>
>>>> ---
>>>>    content.tex | 26 ++++++++++++++++++++++++--
>>>>    1 file changed, 24 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/content.tex b/content.tex
>>>> index 61eab41..4392b60 100644
>>>> --- a/content.tex
>>>> +++ b/content.tex
>>>> @@ -47,6 +47,9 @@ \section{\field{Device Status} Field}\label{sec:Basi=
c Facilities of a Virtio Dev
>>>>    \item[DRIVER_OK (4)] Indicates that the driver is set up and ready =
to
>>>>      drive the device.
>>>>   =20
>>>> +\item[DEVICE_STOPPED (32)] When VIRTIO_F_DEVICE_STOPPED is negotiated=
,
>>>> +  indicates that the device has been stopped by the driver.
>>>> +
>>> AFAIU it is not only about indicating stopped, but also requesting to b=
e
>>> stopped.
>>>
>>> More importantly, that must not be set immediately, in a sense that the
>>> one side initiates some action by requesting the bit to be set, and the
>>> other side must not set the bit before the action is performed.
>>
>> Yes.
>>
>>
>>> We also
>>> seem to assume that every device implementation is capable of performin=
g
>>> this trick.
>>
>> A dedicated feature bit is introduced for this.
>>
> This is not about the feature bit, but about the mechanism. But your
> subsequent answers explain, that this is nothing unusual, and then
> we should be fine.
>  =20
>>> Is it for hardware devices (e.g. PCI) standard to request an
>>> operation by writing some value into a register, and get feedback bout
>>> a non-completion by reading different value that written,
>>
>> This is not ununsal in other devices. And in fact, the FEATURES_OK works
>> like this:
>>
>> """
>>
>> The device MUST NOT offer a feature which requires another feature which
>> was not offered. The device SHOULD accept any valid subset of features
>> the driver accepts, otherwise it MUST fail to set the FEATURES_OK device
>> status bit when the driver writes it.
>>
>> """
>>
> Thanks for the pointer. I intend to have another look at how FEATURES_OK
> works, and how similar this is to DEVICE_STOPPED.


My understanding is that for both of them, driver can try to set the bit=20
by writing to the status register but it's the device that decide when=20
to set the bit.


>
>> We've already had several hardware implementation of virtio-pci devices
>> from different vendors. I didn't hear any complain about such kind of
>> design.
>>
>>
>>>    and about the
>>> completion, by reading the same value as written?
>>
>> After after DEVICE_STOPPED is read from device the driver can assume the
>> device is stopped.
>>
> How is whether the device has already stopped or is still in the middle
> of stopping supposed/expected to affect the drivers behavior? Does the
> driver actually care?


Yes, in the case of live migration. If device takes too longs time to be=20
stopped. Qemu may simple fail the migration.


>
>>>
>>>>    \item[DEVICE_NEEDS_RESET (64)] Indicates that the device has experi=
enced
>>>>      an error from which it can't recover.
>>>>    \end{description}
>>>> @@ -58,8 +61,9 @@ \section{\field{Device Status} Field}\label{sec:Basi=
c Facilities of a Virtio Dev
>>>>    \ref{sec:General Initialization And Device Operation / Device
>>>>    Initialization}.
>>>>    The driver MUST NOT clear a
>>>> -\field{device status} bit.  If the driver sets the FAILED bit,
>>>> -the driver MUST later reset the device before attempting to re-initia=
lize.
>>>> +\field{device status} bit other than DEVICE_STOPPED.  If the
>>>> +driver sets the FAILED bit, the driver MUST later reset the device
>>>> +before attempting to re-initialize.
>>>>   =20
>>>>    The driver SHOULD NOT rely on completion of operations of a
>>>>    device if DEVICE_NEEDS_RESET is set.
>>>> @@ -70,12 +74,28 @@ \section{\field{Device Status} Field}\label{sec:Ba=
sic Facilities of a Virtio Dev
>>>>    recover by issuing a reset.
>>>>    \end{note}
>>>>   =20
>>>> +The driver MUST NOT set or clear DEVICE_STOPPED when DRIVER_OK is not
>>>> +set. In order to stop the device, the driver MUST set DEVICE_STOPPED
>>>> +first and re-read status to check whether DEVICE_STOPPED is set by th=
e
>>>> +device. In order to resume the device, the driver MUST clear
>>>> +DEVICE_STOPPED first and read status to ensure whether DEVICE_STOPPED
>>>> +is cleared by the device.
>>>> +
>>>>    \devicenormative{\subsection}{Device Status Field}{Basic Facilities=
 of a Virtio Device / Device Status Field}
>>>>    The device MUST initialize \field{device status} to 0 upon reset.
>>>>   =20
>>>>    The device MUST NOT consume buffers or send any used buffer
>>>>    notifications to the driver before DRIVER_OK.
>>>>   =20
>>>> +The device MUST ignore DEVICE_STOPPED when DRIVER_OK is not set.
>>>> +
>>>> +When driver is trying to set DEVICE_STOPPED, the device MUST not
>>> The when driver trying to set DEVICE_STOPPED is a bit soft as a
>>> duration. For example consider virtio-ccw, at the moment when the drive=
r
>>> issues the ssch to set status, the device still does not know about it.
>>
>> I need more context on this, if it works like this, when or how can
>> device know the status has been changed? (E.g how reset or other status
>> bit is supposed to work?)
> I think we have a misunderstanding here. The device  will eventually
> learn about the drivers request to write the status, it is just not
> instantaneous. It is like when you turn the light switch on, it takes
> some amount of time for the current to reach the lightbulb.


I see, so it looks not a problem since device is not required to be=20
stopped immediately if driver write to that bit.


>
>> It looks like a transport limitation if we can't guarantee this. Similar
>> issue were met in the PCIE Endpoint device, but it can be workaround by
>> designing a new transport.
>>
> I don't think we have a problem with virtio-ccw here.


Agree.


>
>>>> +process new avail requests and MUST complete all requests that is
>>>> +currently processing before setting DEVICE_STOPPED.
>>> I would like to have a more precise definition of 'new avail requests'
>>> and 'requests that is currently processing'.
>>
>> Good point. How about something like:
>>
>> The device MUST stop reading requests from descriptor area or driver
>> area and MUST complete all in flight requests before setting DEVICE_STOP=
PED.
>>
>> To be 100% accurate, it looks to me we need to mention device
>> implementation internals or pseudo code. I start with "in flight" but
>> Stefan wants a more accurate one. Reading the spec I found "in flight"
>> has been used in:
>>
>> """
>>
>> The driver SHOULD NOT rely on completion of operations of a device if
>> DEVICE_NEEDS_RESET is set. Note: For example, the driver can=E2=80=99t a=
ssume
>> requests in flight will be completed if DEVICE_NEEDS_RESET is set, nor
>> can it assume that they have not been completed. A good implementation
>> will try to recover by issuing a reset.
>>
>> """
>>
> My problem is, that one can look at this from the drivers or from the
> devices perspective. From the drivers perspective, every buffer that has
> been made available but haven't been marked as used, is essentially a
> request in flight.


Not a native speaker, but the sentence starts from "The device" so it=20
should be the perspective of device.


>
>  From the device perspective, and probably from migration perspective, th=
e
> in-flight requests are those that were submitted to some kind of a
> backend. I.e. available requests that are just sitting on the queue, but
> weren't  submitted to the backend, can sit around, and get submitted
> after the migration. It seems that what we want is the following: while
> the DEVICE_STOPPED is set, there are no requests in the backend (i.e.
> all requests submitted prior have completed, and no more request are
> submitted to it).


Yes. but do we need to mention something like "backend" in the spec? It=20
sounds like a implementation detail.


>
> BTW how about s/stop/drain? I think drain has more of this 'finish
> what you are doing' while stop can be 'stop in the middle of it, whatever
> you are doing'.


It might be better. But drain may fit more for a queue not a device. We=20
had stuffs other than queue e.g as Stefan pointed out, we should keep=20
config space unchanged (and no config interrupt) after the device is=20
stopped.


>
>> So we are probably fine.=C2=A0 Any idea or suggestion are more than welc=
omed.
>>
>>
> I will think about it some more.


Thanks


>
>>>> +
>>>> +The device MUST keep the config space unchanged when DEVICE_STOPPED i=
s
>>>> +set.
>>> Here you have the set by driver which is actually requesting the stop
>>> operation, and set by device which indicted that the stop operation
>>> was successfully performed by the device.
>>
>> Exactly.
>>
>> Thanks
>>
> Thank you for all the exlanations!
>
> Regards,
> Halil
>
> [..]
>
> This publicly archived list offers a means to provide input to the
> OASIS Virtual I/O Device (VIRTIO) TC.
>
> In order to verify user consent to the Feedback License terms and
> to minimize spam in the list archive, subscription is required
> before posting.
>
> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> List help: virtio-comment-help@lists.oasis-open.org
> List archive: https://lists.oasis-open.org/archives/virtio-comment/
> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-l=
ists
> Committee: https://www.oasis-open.org/committees/virtio/
> Join OASIS: https://www.oasis-open.org/join/
>


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

