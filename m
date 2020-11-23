Return-Path: virtio-comment-return-1534-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id AAF899841C7
	for <virtio-comment@lists.oasis-open.org>; Mon, 23 Nov 2020 16:16:50 +0000 (UTC)
Date: Mon, 23 Nov 2020 17:16:42 +0100
From: Halil Pasic <pasic@linux.ibm.com>
Message-ID: <20201123171642.2da4abfa.pasic@linux.ibm.com>
In-Reply-To: <BN6PR1801MB20674853EEEB69E982B02C8BC5EE0@BN6PR1801MB2067.namprd18.prod.outlook.com>
References: <BN6PR1801MB20674853EEEB69E982B02C8BC5EE0@BN6PR1801MB2067.namprd18.prod.outlook.com>
MIME-Version: 1.0
Subject: Re: [virtio-comment] [PATCH v9] virtio-net: Add support for the
 flexible driver notification structure.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
To: Vitaly Mireyno <vmireyno@marvell.com>
Cc: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, Ariel Elior <aelior@marvell.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Thu, 5 Nov 2020 22:41:42 +0000
Vitaly Mireyno <vmireyno@marvell.com> wrote:

> When the driver is required to send an available buffer notification to t=
he device, it sends the virtqueue number to be notified.
> With this new feature, the device can optionally provide a per-virtqueue =
value for the driver to use in driver notifications, instead of the virtque=
ue number.
> Some devices may benefit from this flexibility by providing, for example,=
 an internal virtqueue identifier, or an internal offset related to the vir=
tqueue number.
>=20
> Changes from v8:
>  * Incorporated comments for v8:
>      - moved the feature from a network device to a global section
>      - few minor changes
>=20
> Signed-off-by: Vitaly Mireyno <vmireyno@marvell.com>
> ---
>  content.tex | 46 +++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 45 insertions(+), 1 deletion(-)
>=20
> diff --git a/content.tex b/content.tex
> index 91735e3..bf50bfd 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -824,6 +824,7 @@ \subsubsection{Common configuration structure layout}=
\label{sec:Virtio Transport
>          le64 queue_desc;                /* read-write */
>          le64 queue_driver;              /* read-write */
>          le64 queue_device;              /* read-write */
> +        le16 queue_notify_data;         /* read-only for driver */
>  };
>  \end{lstlisting}
> =20
> @@ -890,6 +891,19 @@ \subsubsection{Common configuration structure layout=
}\label{sec:Virtio Transport
> =20
>  \item[\field{queue_device}]
>          The driver writes the physical address of Device Area here.  See=
 section \ref{sec:Basic Facilities of a Virtio Device / Virtqueues}.
> +
> +\item[\field{queue_notify_data}]
> +        This field exists only if VIRTIO_F_NOTIF_CONFIG_DATA has been ne=
gotiated.
> +        The driver will use this value to put it in the 'virtqueue numbe=
r' field
> +        in the available buffer notification structure.
> +        See section \ref{sec:Virtio Transport Options / Virtio Over PCI =
Bus / PCI-specific Initialization And Device Operation / Available Buffer N=
otifications}.
> +        \begin{note}
> +        This field provides the device with flexibility to determine how=
 virtqueues
> +        will be referred to in available buffer notifications.
> +        In a trivial case the device can set \field{queue_notify_data}=
=3Dvqn. Some devices
> +        may benefit from providing another value, for example an interna=
l virtqueue
> +        identifier, or an internal offset related to the virtqueue numbe=
r.
> +        \end{note}
>  \end{description}
> =20
>  \devicenormative{\paragraph}{Common configuration structure layout}{Virt=
io Transport Options / Virtio Over PCI Bus / PCI Device Layout / Common con=
figuration structure layout}
> @@ -940,7 +954,7 @@ \subsubsection{Common configuration structure layout}=
\label{sec:Virtio Transport
> =20
>  \drivernormative{\paragraph}{Common configuration structure layout}{Virt=
io Transport Options / Virtio Over PCI Bus / PCI Device Layout / Common con=
figuration structure layout}
> =20
> -The driver MUST NOT write to \field{device_feature}, \field{num_queues},=
 \field{config_generation} or \field{queue_notify_off}.
> +The driver MUST NOT write to \field{device_feature}, \field{num_queues},=
 \field{config_generation}, \field{queue_notify_off} or \field{queue_notify=
_data}.
> =20
>  If VIRTIO_F_RING_PACKED has been negotiated,
>  the driver MUST NOT write the value 0 to \field{queue_size}.
> @@ -1519,6 +1533,15 @@ \subsubsection{Available Buffer Notifications}\lab=
el{sec:Virtio Transport Option
>  See \ref{sec:Virtio Transport Options / Virtio Over PCI Bus / PCI Device=
 Layout / Notification capability}
>  for how to calculate the Queue Notify address.
> =20
> +\drivernormative{\paragraph}{Available Buffer Notifications}{Virtio Tran=
sport Options / Virtio Over PCI Bus / PCI-specific Initialization And Devic=
e Operation / Available Buffer Notifications}
> +If VIRTIO_F_NOTIF_CONFIG_DATA has been negotiated:
> +\begin{itemize}
> +\item If VIRTIO_F_NOTIFICATION_DATA has not been negotiated, the driver =
MUST use the
> +\field{queue_notify_data} value instead of the virtqueue index.
> +\item If VIRTIO_F_NOTIFICATION_DATA has been negotiated, the driver MUST=
 set the
> +\field{vqn} field to the \field{queue_notify_data} value.
> +\end{itemize}
> +\subsubsection{Available Buffer Notifications}\label{sec:Virtio Transpor=
t Options / Virtio Over PCI Bus / PCI-specific Initialization And Device Op=
eration / Available Buffer Notifications}

Whith your patch applied on top of current master I get something like this

"""
\subsubsection{Available Buffer Notifications}\label{sec:Virtio Transport O=
ptions / Virtio Over PCI Bus / PCI-specific Initialization And Device Opera=
tion / Available Buffer Notifications}

When VIRTIO_F_NOTIFICATION_DATA has not been negotiated,
the driver sends an available buffer notification to the device by writing
the 16-bit virtqueue index
of this virtqueue to the Queue Notify address.

When VIRTIO_F_NOTIFICATION_DATA has been negotiated,
the driver sends an available buffer notification to the device by writing
the following 32-bit value to the Queue Notify address:
\lstinputlisting{notifications-le.c}

See \ref{sec:Virtqueues / Driver notifications}~\nameref{sec:Virtqueues / D=
river notifications}
for the definition of the components.

See \ref{sec:Virtio Transport Options / Virtio Over PCI Bus / PCI Device La=
yout / Notification capability}
for how to calculate the Queue Notify address.

\drivernormative{\paragraph}{Available Buffer Notifications}{Virtio Transpo=
rt Options / Virtio Over PCI Bus / PCI-specific Initialization And Device O=
peration / Available Buffer Notifications}
If VIRTIO_F_NOTIF_CONFIG_DATA has been negotiated:
\begin{itemize}
\item If VIRTIO_F_NOTIFICATION_DATA has not been negotiated, the driver MUS=
T use the
\field{queue_notify_data} value instead of the virtqueue index.
\item If VIRTIO_F_NOTIFICATION_DATA has been negotiated, the driver MUST se=
t the
\field{vqn} field to the \field{queue_notify_data} value.
\end{itemize}

\subsubsection{Used Buffer Notifications}\label{sec:Virtio Transport Option=
s / Virtio Over PCI Bus / PCI-specific Initialization And Device Operation =
/ Used Buffer Notifications}
"""

The device normative section and the preceding text are IMHO in
contradiction. The former says  the driver sends a 16-bit virtqueue
index unconditionally, the later says if if VIRTIO_F_NOTIFICATION_DATA
has been negotiated then use queue_notify_data, instead (thus
referencing the non-normative content).

IMHO we need a normative section that fully describes all the available
cases.

I think we can do this on top.

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

