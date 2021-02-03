Return-Path: virtio-comment-return-1710-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D8B1D9865FE
	for <virtio-comment@lists.oasis-open.org>; Wed,  3 Feb 2021 12:49:01 +0000 (UTC)
Date: Wed, 3 Feb 2021 13:48:52 +0100
From: Halil Pasic <pasic@linux.ibm.com>
Message-ID: <20210203134852.7a04ec26.pasic@linux.ibm.com>
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

We should probably replace almost all, if not all occurrences of
'virtqueue number' with virtqueue index. Before 396b195
("VIRTIO_F_NOTIFICATION_DATA: extra data to devices") we had a single
occurrence of 'virtqueue number' (in the ccw transport) and 8 occurrences
of 'virtqueue index'. With commit 396b195 we tarted using virtqueue
number for virtqueue index. I find virtqueue index better, because I
think one could mistake virtqueue number for the number of virtqueues.

> +this notification involves sending to the device the virtqueue token
> +(method depending on the transport).
> +if VIRTIO_F_NOTIF_CONFIG_DATA has not been negotiated, the virtqueue tok=
en is
> +the virtqueue number to be notified.
> +if VIRTIO_F_NOTIF_CONFIG_DATA has been negotiated, the virtqueue token i=
s
> +the queue notification data of the virtqueue to be notified.

The virtqueue token is confined to notifications, in a sense, that
for purposes other than notifications, we keep identifying the virtqueue
with it's virtqueue index, so maybe a 'virtqueue notification token'
would be an even better name.

Also how about rewording the above as:
The virtqueue [notification] token is defined as the virtqueue index if
VIRTIO_F_NOTIF_CONFIG_DATA has not been negotiated, and as the value of the
\field{queue_notify_data} field if VIRTIO_F_NOTIF_CONFIG_DATA has been nego=
tiated.

> =20
>  However, some devices benefit from the ability to find out the
>  amount of available data in the queue without accessing the virtqueue in=
 memory:
> @@ -349,7 +353,7 @@ \section{Driver Notifications} \label{sec:Virtqueues =
/ Driver notifications}
>  the following information:
> =20
>  \begin{description}
> -\item [vqn] VQ number to be notified.
> +\item [vq_tok] Virtqueue token
>  \item [next_off] Offset
>        within the ring where the next available ring entry
>        will be written.
> @@ -906,14 +910,14 @@ \subsubsection{Common configuration structure layou=
t}\label{sec:Virtio Transport
> =20
>  \item[\field{queue_notify_data}]
>          This field exists only if VIRTIO_F_NOTIF_CONFIG_DATA has been ne=
gotiated.
> -        The driver will use this value to put it in the 'virtqueue numbe=
r' field
> +        The driver will use this value to put it in the 'virtqueue token=
' field
>          in the available buffer notification structure.
>          See section \ref{sec:Virtio Transport Options / Virtio Over PCI =
Bus / PCI-specific Initialization And Device Operation / Available Buffer N=
otifications}.
>          \begin{note}
>          This field provides the device with flexibility to determine how=
 virtqueues
>          will be referred to in available buffer notifications.
> -        In a trivial case the device can set \field{queue_notify_data}=
=3Dvqn. Some devices
> -        may benefit from providing another value, for example an interna=
l virtqueue
> +        In a trivial case the device can set \field{queue_notify_data}=
=3Dvirtqueue number.
> +        Some devices may benefit from providing another value, for examp=
le an internal virtqueue
>          identifier, or an internal offset related to the virtqueue numbe=
r.
>          \end{note}
>  \end{description}
> @@ -1531,8 +1535,7 @@ \subsubsection{Available Buffer Notifications}\labe=
l{sec:Virtio Transport Option
> =20
>  When VIRTIO_F_NOTIFICATION_DATA has not been negotiated,
>  the driver sends an available buffer notification to the device by writi=
ng
> -the 16-bit virtqueue index
> -of this virtqueue to the Queue Notify address.
> +the 16-bit virtqueue token to the Queue Notify address.
> =20
>  When VIRTIO_F_NOTIFICATION_DATA has been negotiated,
>  the driver sends an available buffer notification to the device by writi=
ng

This stuff should IMHO be normative as well.

> @@ -1546,13 +1549,8 @@ \subsubsection{Available Buffer Notifications}\lab=
el{sec:Virtio Transport Option
>  for how to calculate the Queue Notify address.
> =20
>  \drivernormative{\paragraph}{Available Buffer Notifications}{Virtio Tran=
sport Options / Virtio Over PCI Bus / PCI-specific Initialization And Devic=
e Operation / Available Buffer Notifications}
> -If VIRTIO_F_NOTIF_CONFIG_DATA has been negotiated:
> -\begin{itemize}
> -\item If VIRTIO_F_NOTIFICATION_DATA has not been negotiated, the driver =
MUST use the
> -\field{queue_notify_data} value instead of the virtqueue index.
> -\item If VIRTIO_F_NOTIFICATION_DATA has been negotiated, the driver MUST=
 set the
> -\field{vqn} field to the \field{queue_notify_data} value.
> -\end{itemize}
> +If VIRTIO_F_NOTIF_CONFIG_DATA has been negotiated, the driver MUST use t=
he
> +\field{queue_notify_data} value as a queue notification data.
> =20

With the virtqueue [notification] token, defined as is (i.e. it is
always defined, regardless of whether any of VIRTIO_F_NOTIF_CONFIG_DATA
and VIRTIO_F_NOTIFICATION_DATA was negotiated, the driver MUST always use
the virtqueue [notification] token. Or am I wrong?

Besides this being the only driver normative, does not make sense. The
driver normative should also contain the extra requirements that
correspond to  VIRTIO_F_NOTIFICATION_DATA. Probably even more. I would
have to re-read the other normative sections to have a founded opinion.

Regards,
Halil

>  \subsubsection{Used Buffer Notifications}\label{sec:Virtio Transport Opt=
ions / Virtio Over PCI Bus / PCI-specific Initialization And Device Operati=
on / Used Buffer Notifications}
> =20
> @@ -6579,7 +6577,7 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved =
Feature Bits}
>    See \ref{sec:Virtqueues / Driver notifications}~\nameref{sec:Virtqueue=
s / Driver notifications}.
> =20
>    \item[VIRTIO_F_NOTIF_CONFIG_DATA(39)] This feature indicates that the =
driver
> -  uses the data provided by the device as a virtqueue identifier in avai=
lable
> +  uses the data provided by the device as a virtqueue token in available
>    buffer notifications.
>    As mentioned in section \ref{sec:Virtqueues / Driver notifications}, w=
hen the
>    driver is required to send an available buffer notification to the dev=
ice, it
> diff --git a/notifications-be.c b/notifications-be.c
> index 5be947e..6d36ee5 100644
> --- a/notifications-be.c
> +++ b/notifications-be.c
> @@ -1,5 +1,5 @@
>  be32 {
> -=09vqn : 16;
> +=09vq_tok : 16;
>  =09next_off : 15;
>  =09next_wrap : 1;
>  };
> diff --git a/notifications-le.c b/notifications-le.c
> index fe51267..b3fc284 100644
> --- a/notifications-le.c
> +++ b/notifications-le.c
> @@ -1,5 +1,5 @@
>  le32 {
> -=09vqn : 16;
> +=09vq_tok : 16;
>  =09next_off : 15;
>  =09next_wrap : 1;
>  };
> --
>=20
>=20
> This publicly archived list offers a means to provide input to the
> OASIS Virtual I/O Device (VIRTIO) TC.
>=20
> In order to verify user consent to the Feedback License terms and
> to minimize spam in the list archive, subscription is required
> before posting.
>=20
> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> List help: virtio-comment-help@lists.oasis-open.org
> List archive: https://lists.oasis-open.org/archives/virtio-comment/
> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-l=
ists
> Committee: https://www.oasis-open.org/committees/virtio/
> Join OASIS: https://www.oasis-open.org/join/
>=20


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

