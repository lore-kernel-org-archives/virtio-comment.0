Return-Path: virtio-comment-return-1576-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3DE18985E00
	for <virtio-comment@lists.oasis-open.org>; Mon, 21 Dec 2020 11:06:19 +0000 (UTC)
Date: Mon, 21 Dec 2020 12:06:11 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
Message-ID: <20201221110611.pag5nlxuegduefov@steredhat>
References: <20201218042302.8884-1-jasowang@redhat.com>
 <20201218101526.7vswmw2uop3elupm@steredhat>
 <09450b38-6254-0c70-1b3e-ed6f09f99c58@redhat.com>
MIME-Version: 1.0
In-Reply-To: <09450b38-6254-0c70-1b3e-ed6f09f99c58@redhat.com>
Subject: [virtio-comment] Re: [PATCH RFC] virtio: introduce VIRTIO_F_DEVICE_STOP
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
To: Jason Wang <jasowang@redhat.com>
Cc: stefanha@redhat.com, virtio-comment@lists.oasis-open.org, mst@redhat.com, eperezma@redhat.com
List-ID: <virtio-comment.lists.oasis-open.org>

On Mon, Dec 21, 2020 at 11:08:37AM +0800, Jason Wang wrote:
>
>On 2020/12/18 =E4=B8=8B=E5=8D=886:15, Stefano Garzarella wrote:
>>On Fri, Dec 18, 2020 at 12:23:02PM +0800, Jason Wang wrote:
>>>This patch introduces a new status bit DEVICE_STOPPED. This will be
>>>used by the driver to stop and resume a device. The main user will be
>>>live migration support for virtio device.
>>>
>>>Signed-off-by: Jason Wang <jasowang@redhat.com>
>>>---
>>>content.tex | 26 ++++++++++++++++++++++++--
>>>1 file changed, 24 insertions(+), 2 deletions(-)
>>>
>>>diff --git a/content.tex b/content.tex
>>>index 61eab41..4392b60 100644
>>>--- a/content.tex
>>>+++ b/content.tex
>>>@@ -47,6 +47,9 @@ \section{\field{Device Status}=20
>>>Field}\label{sec:Basic Facilities of a Virtio Dev
>>>\item[DRIVER_OK (4)] Indicates that the driver is set up and ready to
>>>=C2=A0 drive the device.
>>>
>>>+\item[DEVICE_STOPPED (32)] When VIRTIO_F_DEVICE_STOPPED is negotiated,
>>>+=C2=A0 indicates that the device has been stopped by the driver.
>>>+
>>
>>Just for curiosity, why 32 and not 16?
>>Is there any rule for high bits and low bits of Device Status field?
>
>
>I'm not sure. I just spot that DEVICE_NEEDS_RESET (with DEVICE prefix)=20
>is using 64.
>
>
>>
>>>\item[DEVICE_NEEDS_RESET (64)] Indicates that the device has experienced
>>>=C2=A0 an error from which it can't recover.
>>>\end{description}
>>>@@ -58,8 +61,9 @@ \section{\field{Device Status}=20
>>>Field}\label{sec:Basic Facilities of a Virtio Dev
>>>\ref{sec:General Initialization And Device Operation / Device
>>>Initialization}.
>>>The driver MUST NOT clear a
>>>-\field{device status} bit.=C2=A0 If the driver sets the FAILED bit,
>>>-the driver MUST later reset the device before attempting to=20
>>>re-initialize.
>>>+\field{device status} bit other than DEVICE_STOPPED.=C2=A0 If the
>>>+driver sets the FAILED bit, the driver MUST later reset the device
>>>+before attempting to re-initialize.
>>>
>>>The driver SHOULD NOT rely on completion of operations of a
>>>device if DEVICE_NEEDS_RESET is set.
>>>@@ -70,12 +74,28 @@ \section{\field{Device Status}=20
>>>Field}\label{sec:Basic Facilities of a Virtio Dev
>>>recover by issuing a reset.
>>>\end{note}
>>>
>>>+The driver MUST NOT set or clear DEVICE_STOPPED when DRIVER_OK is not
>>>+set. In order to stop the device, the driver MUST set DEVICE_STOPPED
>>>+first and re-read status to check whether DEVICE_STOPPED is set by the
>>>+device. In order to resume the device, the driver MUST clear
>>>+DEVICE_STOPPED first and read status to ensure whether DEVICE_STOPPED
>>>+is cleared by the device.
>>>+
>>>\devicenormative{\subsection}{Device Status Field}{Basic=20
>>>Facilities of a Virtio Device / Device Status Field}
>>>The device MUST initialize \field{device status} to 0 upon reset.
>>>
>>>The device MUST NOT consume buffers or send any used buffer
>>>notifications to the driver before DRIVER_OK.
>>>
>>>+The device MUST ignore DEVICE_STOPPED when DRIVER_OK is not set.
>>>+
>>>+When driver is trying to set DEVICE_STOPPED, the device MUST not
>>>+process new avail requests and MUST complete all requests that is
>>>+currently processing before setting DEVICE_STOPPED.
>>>+
>>>+The device MUST keep the config space unchanged when DEVICE_STOPPED is
>>>+set.
>>
>>Maybe here we can specify if "DEVICE_STOPPED is set by the driver"=20
>>or when the device set it after completing all the requests.
>
>
>Good point. Since the bit is offered by device, so "set by the device=20
>" might be better.

Yeah, I agree.

>
>
>>
>>>+
>>>\label{sec:Basic Facilities of a Virtio Device / Device Status=20
>>>Field / DEVICENEEDSRESET}The device SHOULD set DEVICE_NEEDS_RESET=20
>>>when it enters an error state
>>>that a reset is needed.=C2=A0 If DRIVER_OK is set, after it sets=20
>>>DEVICE_NEEDS_RESET, the device
>>>MUST send a device configuration change notification to the driver.
>>>@@ -6553,6 +6573,8 @@ \chapter{Reserved Feature=20
>>>Bits}\label{sec:Reserved Feature Bits}
>>>=C2=A0 \item[VIRTIO_F_NOTIFICATION_DATA(38)] This feature indicates
>>>=C2=A0 that the driver passes extra data (besides identifying the virtqu=
eue)
>>>=C2=A0 in its device notifications.
>>>+=C2=A0 \item[VIRTIO_F_DEVICE_STOP(39)] This feature indicates that the
>>>+=C2=A0 driver can stop and resume the device.
>>>=C2=A0 See \ref{sec:Virtqueues / Driver=20
>>>notifications}~\nameref{sec:Virtqueues / Driver notifications}.
>>>\end{description}
>>>
>>
>>Since the completion of in-flight requests can take time (I'm=20
>>thinking of block devices), should we consider a notification when=20
>>the device completes all the pending requests and set=20
>>DEVICE_STOPPED.
>>
>>Something similar to the notification when DEVICE_NEEDS_RESET is set.
>
>
>I'm not sure, but it looks even more complicated. Driver may do a=20
>periodic polling or fail the operation (like migration) when the=20
>request is not completed soon.
>

I agree that colud be more complicated for the device point of view.
Since the driver is asking the device to stop, perhaps it makes sense=20
for it to periodically check the status.

In case the driver decides to abort the operation (e.g. migration), can=20
it clear the bit if the device hasn't set it yet or should it wait until=20
the device has stopped?
Maybe we should clarify this as well.

Thanks,
Stefano


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

