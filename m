Return-Path: virtio-comment-return-1577-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id F11EE985D14
	for <virtio-comment@lists.oasis-open.org>; Mon, 21 Dec 2020 21:33:47 +0000 (UTC)
Date: Mon, 21 Dec 2020 22:33:38 +0100
From: Halil Pasic <pasic@linux.ibm.com>
Message-ID: <20201221223338.7b5a21e6.pasic@linux.ibm.com>
In-Reply-To: <20201218042302.8884-1-jasowang@redhat.com>
References: <20201218042302.8884-1-jasowang@redhat.com>
MIME-Version: 1.0
Subject: Re: [virtio-comment] [PATCH RFC] virtio: introduce
 VIRTIO_F_DEVICE_STOP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
To: Jason Wang <jasowang@redhat.com>
Cc: stefanha@redhat.com, virtio-comment@lists.oasis-open.org, mst@redhat.com, eperezma@redhat.com, sgarzare@redhat.com
List-ID: <virtio-comment.lists.oasis-open.org>

On Fri, 18 Dec 2020 12:23:02 +0800
Jason Wang <jasowang@redhat.com> wrote:

> This patch introduces a new status bit DEVICE_STOPPED. This will be
> used by the driver to stop and resume a device. The main user will be
> live migration support for virtio device.
>=20

Can you please provide some more background information, or point
me to the appropriate discussion?

I mean AFAIK migration already works without this driver initiated
drain. What is the exact motivation? What about the big picture? I
guess some agent in the guest would have to make the driver issue
the DEVICE_STOP.

> Signed-off-by: Jason Wang <jasowang@redhat.com>
> ---
>  content.tex | 26 ++++++++++++++++++++++++--
>  1 file changed, 24 insertions(+), 2 deletions(-)
>=20
> diff --git a/content.tex b/content.tex
> index 61eab41..4392b60 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -47,6 +47,9 @@ \section{\field{Device Status} Field}\label{sec:Basic F=
acilities of a Virtio Dev
>  \item[DRIVER_OK (4)] Indicates that the driver is set up and ready to
>    drive the device.
> =20
> +\item[DEVICE_STOPPED (32)] When VIRTIO_F_DEVICE_STOPPED is negotiated,
> +  indicates that the device has been stopped by the driver.
> +

AFAIU it is not only about indicating stopped, but also requesting to be
stopped.

More importantly, that must not be set immediately, in a sense that the
one side initiates some action by requesting the bit to be set, and the
other side must not set the bit before the action is performed. We also
seem to assume that every device implementation is capable of performing
this trick. Is it for hardware devices (e.g. PCI) standard to request an
operation by writing some value into a register, and get feedback bout
a non-completion by reading different value that written, and about the
completion, by reading the same value as written?


>  \item[DEVICE_NEEDS_RESET (64)] Indicates that the device has experienced
>    an error from which it can't recover.
>  \end{description}
> @@ -58,8 +61,9 @@ \section{\field{Device Status} Field}\label{sec:Basic F=
acilities of a Virtio Dev
>  \ref{sec:General Initialization And Device Operation / Device
>  Initialization}.
>  The driver MUST NOT clear a
> -\field{device status} bit.  If the driver sets the FAILED bit,
> -the driver MUST later reset the device before attempting to re-initializ=
e.
> +\field{device status} bit other than DEVICE_STOPPED.  If the
> +driver sets the FAILED bit, the driver MUST later reset the device
> +before attempting to re-initialize.
> =20
>  The driver SHOULD NOT rely on completion of operations of a
>  device if DEVICE_NEEDS_RESET is set.
> @@ -70,12 +74,28 @@ \section{\field{Device Status} Field}\label{sec:Basic=
 Facilities of a Virtio Dev
>  recover by issuing a reset.
>  \end{note}
> =20
> +The driver MUST NOT set or clear DEVICE_STOPPED when DRIVER_OK is not
> +set. In order to stop the device, the driver MUST set DEVICE_STOPPED
> +first and re-read status to check whether DEVICE_STOPPED is set by the
> +device. In order to resume the device, the driver MUST clear
> +DEVICE_STOPPED first and read status to ensure whether DEVICE_STOPPED
> +is cleared by the device.
> +
>  \devicenormative{\subsection}{Device Status Field}{Basic Facilities of a=
 Virtio Device / Device Status Field}
>  The device MUST initialize \field{device status} to 0 upon reset.
> =20
>  The device MUST NOT consume buffers or send any used buffer
>  notifications to the driver before DRIVER_OK.
> =20
> +The device MUST ignore DEVICE_STOPPED when DRIVER_OK is not set.
> +
> +When driver is trying to set DEVICE_STOPPED, the device MUST not

The when driver trying to set DEVICE_STOPPED is a bit soft as a
duration. For example consider virtio-ccw, at the moment when the driver
issues the ssch to set status, the device still does not know about it.

> +process new avail requests and MUST complete all requests that is
> +currently processing before setting DEVICE_STOPPED.

I would like to have a more precise definition of 'new avail requests'
and 'requests that is currently processing'.

> +
> +The device MUST keep the config space unchanged when DEVICE_STOPPED is
> +set.

Here you have the set by driver which is actually requesting the stop
operation, and set by device which indicted that the stop operation
was successfully performed by the device.

> +
>  \label{sec:Basic Facilities of a Virtio Device / Device Status Field / D=
EVICENEEDSRESET}The device SHOULD set DEVICE_NEEDS_RESET when it enters an =
error state
>  that a reset is needed.  If DRIVER_OK is set, after it sets DEVICE_NEEDS=
_RESET, the device
>  MUST send a device configuration change notification to the driver.
> @@ -6553,6 +6573,8 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved =
Feature Bits}
>    \item[VIRTIO_F_NOTIFICATION_DATA(38)] This feature indicates
>    that the driver passes extra data (besides identifying the virtqueue)
>    in its device notifications.
> +  \item[VIRTIO_F_DEVICE_STOP(39)] This feature indicates that the
> +  driver can stop and resume the device.
>    See \ref{sec:Virtqueues / Driver notifications}~\nameref{sec:Virtqueue=
s / Driver notifications}.
>  \end{description}
> =20


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

