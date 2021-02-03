Return-Path: virtio-comment-return-1705-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9633C9865E8
	for <virtio-comment@lists.oasis-open.org>; Wed,  3 Feb 2021 00:30:17 +0000 (UTC)
Date: Wed, 3 Feb 2021 01:30:08 +0100
From: Halil Pasic <pasic@linux.ibm.com>
Message-ID: <20210203013008.0777873f.pasic@linux.ibm.com>
In-Reply-To: <CY4PR1801MB207233E0BCF16A0820EA51A9C5AF9@CY4PR1801MB2072.namprd18.prod.outlook.com>
References: <CY4PR1801MB207233E0BCF16A0820EA51A9C5AF9@CY4PR1801MB2072.namprd18.prod.outlook.com>
MIME-Version: 1.0
Subject: Re: [virtio-comment] [PATCH v3] virtio-net: fix Driver Notification
 description related to VIRTIO_F_NOTIF_CONFIG_DATA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
To: Vitaly Mireyno <vmireyno@marvell.com>
Cc: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, "Michael S. Tsirkin" <mst@redhat.com>, Ariel Elior <aelior@marvell.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Thu, 7 Jan 2021 17:39:48 +0000
Vitaly Mireyno <vmireyno@marvell.com> wrote:

> Incorporated comments for the "[PATCH v9] virtio-net: Add support for the=
 flexible driver notification structure".
> Made Driver Notifications description more consistent throughout the docu=
ment wrt VIRTIO_F_NOTIF_CONFIG_DATA.
>=20
> Changes from v2:
>  * Reworked 'vqn' name and definition
>=20

First sorry for being late.

>=20
> Signed-off-by: Vitaly Mireyno <vmireyno@marvell.com>
> ---
>  content.tex        | 30 ++++++++++++++----------------
>  notifications-be.c |  2 +-
>  notifications-le.c |  2 +-
>  3 files changed, 16 insertions(+), 18 deletions(-)
>=20
> diff --git a/content.tex b/content.tex
> index 00bc050..19f09d9 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -337,8 +337,12 @@ \section{Driver Notifications} \label{sec:Virtqueues=
 / Driver notifications}
>  notification to the device.
> =20
>  When VIRTIO_F_NOTIFICATION_DATA has not been negotiated,
> -this notification involves sending the
> -virtqueue number to the device (method depending on the transport).
> +this notification involves sending to the device the virtqueue token
> +(method depending on the transport).

I don't think changing the word order is a good idea. I would prefer
'this notification involves sending the virtqueue token to the device'

> +if VIRTIO_F_NOTIF_CONFIG_DATA has not been negotiated, the virtqueue tok=
en is

This is a new sentence. You should start it with a capital letter.

> +the virtqueue number to be notified

To be notified is off here. I believe it can be omitted, or we need
something like 'the virtqueue number of the virtqueue to be notified'

> +if VIRTIO_F_NOTIF_CONFIG_DATA has been negotiated, the virtqueue token i=
s

This is probably supposed to be a new sentence as well, but you lack
both the period and the capital initial letter.

> +the queue notification data of the virtqueue to be notified.
> =20

[..]

I will have a look at the rest tomorrow.

Regards,
Halil

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

