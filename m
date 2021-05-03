Return-Path: virtio-comment-return-1842-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5C6F9986360
	for <virtio-comment@lists.oasis-open.org>; Mon,  3 May 2021 09:02:48 +0000 (UTC)
MIME-Version: 1.0
References: <20201218042302.8884-1-jasowang@redhat.com>
In-Reply-To: <20201218042302.8884-1-jasowang@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 3 May 2021 11:02:08 +0200
Message-ID: <CAJaqyWdCXEJFwKAU7SgnGdDQQ5OqcA-47-Be7uvyv9w+nGNmcg@mail.gmail.com>
Subject: [virtio-comment] Re: [PATCH RFC] virtio: introduce VIRTIO_F_DEVICE_STOP
Content-Type: text/plain; charset="UTF-8"
To: Jason Wang <jasowang@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, virtio-comment@lists.oasis-open.org, Michael Tsirkin <mst@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Fri, Dec 18, 2020 at 5:23 AM Jason Wang <jasowang@redhat.com> wrote:
>
> This patch introduces a new status bit DEVICE_STOPPED. This will be
> used by the driver to stop and resume a device. The main user will be
> live migration support for virtio device.
>
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> ---
>  content.tex | 26 ++++++++++++++++++++++++--
>  1 file changed, 24 insertions(+), 2 deletions(-)
>
> diff --git a/content.tex b/content.tex
> index 61eab41..4392b60 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -47,6 +47,9 @@ \section{\field{Device Status} Field}\label{sec:Basic Facilities of a Virtio Dev
>  \item[DRIVER_OK (4)] Indicates that the driver is set up and ready to
>    drive the device.
>
> +\item[DEVICE_STOPPED (32)] When VIRTIO_F_DEVICE_STOPPED is negotiated,
> +  indicates that the device has been stopped by the driver.
> +
>  \item[DEVICE_NEEDS_RESET (64)] Indicates that the device has experienced
>    an error from which it can't recover.
>  \end{description}
> @@ -58,8 +61,9 @@ \section{\field{Device Status} Field}\label{sec:Basic Facilities of a Virtio Dev
>  \ref{sec:General Initialization And Device Operation / Device
>  Initialization}.
>  The driver MUST NOT clear a
> -\field{device status} bit.  If the driver sets the FAILED bit,
> -the driver MUST later reset the device before attempting to re-initialize.
> +\field{device status} bit other than DEVICE_STOPPED.  If the
> +driver sets the FAILED bit, the driver MUST later reset the device
> +before attempting to re-initialize.
>
>  The driver SHOULD NOT rely on completion of operations of a
>  device if DEVICE_NEEDS_RESET is set.
> @@ -70,12 +74,28 @@ \section{\field{Device Status} Field}\label{sec:Basic Facilities of a Virtio Dev
>  recover by issuing a reset.
>  \end{note}
>
> +The driver MUST NOT set or clear DEVICE_STOPPED when DRIVER_OK is not
> +set. In order to stop the device, the driver MUST set DEVICE_STOPPED
> +first and re-read status to check whether DEVICE_STOPPED is set by the
> +device. In order to resume the device, the driver MUST clear
> +DEVICE_STOPPED first and read status to ensure whether DEVICE_STOPPED
> +is cleared by the device.
> +
>  \devicenormative{\subsection}{Device Status Field}{Basic Facilities of a Virtio Device / Device Status Field}
>  The device MUST initialize \field{device status} to 0 upon reset.
>
>  The device MUST NOT consume buffers or send any used buffer
>  notifications to the driver before DRIVER_OK.
>
> +The device MUST ignore DEVICE_STOPPED when DRIVER_OK is not set.
> +
> +When driver is trying to set DEVICE_STOPPED, the device MUST not
> +process new avail requests and MUST complete all requests that is
> +currently processing before setting DEVICE_STOPPED.
> +
> +The device MUST keep the config space unchanged when DEVICE_STOPPED is
> +set.
> +
>  \label{sec:Basic Facilities of a Virtio Device / Device Status Field / DEVICENEEDSRESET}The device SHOULD set DEVICE_NEEDS_RESET when it enters an error state
>  that a reset is needed.  If DRIVER_OK is set, after it sets DEVICE_NEEDS_RESET, the device
>  MUST send a device configuration change notification to the driver.
> @@ -6553,6 +6573,8 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
>    \item[VIRTIO_F_NOTIFICATION_DATA(38)] This feature indicates
>    that the driver passes extra data (besides identifying the virtqueue)
>    in its device notifications.
> +  \item[VIRTIO_F_DEVICE_STOP(39)] This feature indicates that the
> +  driver can stop and resume the device.
>    See \ref{sec:Virtqueues / Driver notifications}~\nameref{sec:Virtqueues / Driver notifications}.
>  \end{description}
>
> --
> 2.25.1
>

Hi!

After implementing a small POC for this in QEMU/virtio-pci vdpa
device, I think that the standard should specify what state the driver
[1] is allowed to change, if any, and what fields are valid for the
driver to query (like device status or virtqueue state).

As a proposal, I think all the device config status should freeze (as
"the device is not allowed to change") when paused, and the driver
must be able to read all of it.

Regarding writing to the device config, the straightforward solution
is to not allow them, and mandate the driver to go through a full
reset cycle in my opinion. The only exception should be the queue
selector: Writing to it by the driver has the obvious consequences.
This way, the device does not need to check for changes on the resume,
it could be tricky. However maybe there are some use cases where to
change just a field through this method could be faster than the whole
device reset.

I can think in another approach: The device supports to write some
fields (for example, just virtqueue addresses and virtqueue size, or
some feature flags), but any other change would lead to the device to
report DEVICE_NEEDS_RESET. This has the mentioned advantages of
reducing latencies (as transactions) in case of device re-usage, but
at the cost of increasing complexity. Any opinion about if it is worth
it?

Thanks!

[1] From the device's point of view, so I mean QEMU here.


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
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

