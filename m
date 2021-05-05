Return-Path: virtio-comment-return-1849-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 88E199864EC
	for <virtio-comment@lists.oasis-open.org>; Wed,  5 May 2021 13:16:43 +0000 (UTC)
Date: Wed, 5 May 2021 09:16:31 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20210505090731-mutt-send-email-mst@kernel.org>
References: <20201218042302.8884-1-jasowang@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201218042302.8884-1-jasowang@redhat.com>
Subject: [virtio-comment] Re: [PATCH RFC] virtio: introduce VIRTIO_F_DEVICE_STOP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Jason Wang <jasowang@redhat.com>
Cc: stefanha@redhat.com, virtio-comment@lists.oasis-open.org, eperezma@redhat.com, sgarzare@redhat.com
List-ID: <virtio-comment.lists.oasis-open.org>

On Fri, Dec 18, 2020 at 12:23:02PM +0800, Jason Wang wrote:
> This patch introduces a new status bit DEVICE_STOPPED. This will be
> used by the driver to stop and resume a device. The main user will be
> live migration support for virtio device.
> 
> Signed-off-by: Jason Wang <jasowang@redhat.com>

I have been thinking about this whole approach.

While yes it's possible to have the hypervisor poke
at the device while device is not reset, e.g. by
blocking guest access to device, while device can
still DMA into guest memory, this is at least unusual
and seems somewhat fragile.

I think normally live migration would belong in a PF as opposed to the VF.

As such, how about for starters we prototype this
as part of a vendor specific capability of a PF?
This will also show-case how to add vendor specific capabilities
to devices.


Longer term it would be nice to come up with all kind of PF
related functionality in the spec too, but I think that should
be part of a more comprehensive/extensible approach
since it's not limited to live migration concerns.
For example the way qemu handles control vq of a nic
in software creates problems, couldn't we inject
the relevant commands through PF somehow?


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

