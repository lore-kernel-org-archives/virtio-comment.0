Return-Path: virtio-comment-return-1156-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 143A498601F
	for <virtio-comment@lists.oasis-open.org>; Thu, 26 Mar 2020 11:26:24 +0000 (UTC)
Date: Thu, 26 Mar 2020 07:26:16 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20200326071301-mutt-send-email-mst@kernel.org>
References: <BN6PR1801MB206759357571FC19A34A1673C5F70@BN6PR1801MB2067.namprd18.prod.outlook.com>
 <20200326104320.24f49d5a.cohuck@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200326104320.24f49d5a.cohuck@redhat.com>
Subject: [virtio-comment] Re: [PATCH v7] virtio-net: Add support for the flexible driver
 notification structure.
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
To: Cornelia Huck <cohuck@redhat.com>
Cc: Vitaly Mireyno <vmireyno@marvell.com>, "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, Jason Wang <jasowang@redhat.com>, Ariel Elior <aelior@marvell.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Thu, Mar 26, 2020 at 10:43:20AM +0100, Cornelia Huck wrote:
> On Wed, 18 Mar 2020 18:29:19 +0000
> Vitaly Mireyno <vmireyno@marvell.com> wrote:
>=20
> > Currently, the driver notification (available buffer notification) has =
a fixed structure, which includes the virtqueue number.
> > For PCI transport, if notify_off_multiplier > 0, the VQ number can pote=
ntially be derived by the device from the Queue Notify address, so providin=
g virtqueue number as part of the data may be redundant.
> > Some devices benefit from receiving an additional data with driver noti=
fications. This data can optionally replace the vqn field in the driver not=
ification structure.
> > In its simplest form, it would be sufficient for this data to be a per-=
device constant value.
> >=20
> > Changes from v6:
> >  * The feature definition is moved to a generic section, referring to P=
CI-specific details.
>=20
> Thanks, this looks much better.
>=20
> >=20
> > Signed-off-by: Vitaly Mireyno <vmireyno@marvell.com>
> > ---
> >  content.tex | 52 ++++++++++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 52 insertions(+)
> >=20
> > diff --git a/content.tex b/content.tex
> > index b91a132..163c47e 100644
> > --- a/content.tex
> > +++ b/content.tex
> > @@ -965,6 +965,8 @@ \subsubsection{Notification structure layout}\label=
{sec:Virtio Transport Options
> >  struct virtio_pci_notify_cap {
> >          struct virtio_pci_cap cap;
> >          le32 notify_off_multiplier; /* Multiplier for queue_notify_off=
. */
> > +        le16 notify_data; /* Data to be placed in the vqn field */
> > +        le16 padding; /* Pad to a dword */
> >  };
> >  \end{lstlisting}
> > =20
> > @@ -984,6 +986,16 @@ \subsubsection{Notification structure layout}\labe=
l{sec:Virtio Transport Options
> >  the same Queue Notify address for all queues.
> >  \end{note}
> > =20
> > +\field{notify_data} is the data that the driver will set in the availa=
ble
> > +buffer notification (instead of the virtqueue number), if
> > +VIRTIO_NET_F_NOTIF_CONFIG_DATA has been negotiated.

I would mention the name of the field (vqn) here, and link
to sec:Virtqueues / Driver notifications.


> > +
> > +\begin{note}
> > +If \field{notify_off_multiplier} > 0, the virtqueue number can potenti=
ally be
> > +derived by the device from the Queue Notify address, so \field{vqn} ma=
y be
> > +redundant.

I feel this is confusing the reader more than it explains.
the field is always there. It's either the virtqueue number or
whatever we get from the device.

> > +\end{note}
> > +
> >  \devicenormative{\paragraph}{Notification capability}{Virtio Transport=
 Options / Virtio Over PCI Bus / PCI Device Layout / Notification capabilit=
y}
> >  The device MUST present at least one notification capability.
> > =20
> > @@ -1020,6 +1032,9 @@ \subsubsection{Notification structure layout}\lab=
el{sec:Virtio Transport Options
> >  cap.length >=3D queue_notify_off * notify_off_multiplier + 4
> >  \end{lstlisting}
> > =20
> > +If the device offers VIRTIO_NET_F_NOTIF_CONFIG_DATA, it MUST set
> > +\field{notify_off_multiplier} > 0 in at least one capability.
>=20
> Maybe s/capability/notification capability/ ?
>=20
> > +
> >  \subsubsection{ISR status capability}\label{sec:Virtio Transport Optio=
ns / Virtio Over PCI Bus / PCI Device Layout / ISR status capability}
> > =20
> >  The VIRTIO_PCI_CAP_ISR_CFG capability
> > @@ -1519,6 +1534,12 @@ \subsubsection{Available Buffer Notifications}\l=
abel{sec:Virtio Transport Option
> >  See \ref{sec:Virtio Transport Options / Virtio Over PCI Bus / PCI Devi=
ce Layout / Notification capability}
> >  for how to calculate the Queue Notify address.
> > =20
> > +\drivernormative{\paragraph}{Available Buffer Notifications}{Virtio Tr=
ansport Options / Virtio Over PCI Bus / PCI-specific Initialization And Dev=
ice Operation / Available Buffer Notifications}
> > +If VIRTIO_NET_F_NOTIF_CONFIG_DATA has been negotiated and
> > +\field{notify_off_multiplier} > 0, the driver MUST set the 'virtqueue =
number'
> > +field of the available buffer notification structure to the \field{not=
ify_data}
> > +value.
> > +
> >  \subsubsection{Used Buffer Notifications}\label{sec:Virtio Transport O=
ptions / Virtio Over PCI Bus / PCI-specific Initialization And Device Opera=
tion / Used Buffer Notifications}
> > =20
> >  If a used buffer notification is necessary for a virtqueue, the device=
 would typically act as follows:
> > @@ -2895,6 +2916,10 @@ \subsection{Feature bits}\label{sec:Device Types=
 / Network Device / Feature bits
> >  \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)] Set MAC address through control
> >      channel.
> > =20
> > +\item[VIRTIO_NET_F_NOTIF_CONFIG_DATA(57)] Driver provides extra data w=
ith
> > +    available buffer notifications, to aid in notification processing =
by the
> > +    device.
> > +
> >  \item[VIRTIO_NET_F_GUEST_HDRLEN(59)] Driver can provide the exact \fie=
ld{hdr_len}
> >      value. Device benefits from knowing the exact header length.
> > =20
> > @@ -4180,6 +4205,33 @@ \subsubsection{Legacy Interface: Framing Require=
ments}\label{sec:Device
> >  See \ref{sec:Basic
> >  Facilities of a Virtio Device / Virtqueues / Message Framing}.
> > =20
> > +\subsubsection{Driver Notifications}\label{sec:Device Types / Network =
Device / Device Operation / Driver Notifications}
> > +As mentioned in section \ref{sec:Virtqueues / Driver notifications}, w=
hen the
> > +driver is required to send an available buffer notification to the dev=
ice, it
> > +always sends the virtqueue number to be notified. The method of delive=
ring
> > +notifications is transport specific. With the PCI transport, the devic=
e can
> > +optionally provide a distinct per-virtqueue address for driver notific=
ations
> > +(Queue Notify address). In this case, the virtqueue number can potenti=
ally be
> > +derived by the device from the Queue Notify address. For devices, that=
 provide
> > +per-virtqueue Queue Notify addresses and are able to derive the virtqu=
eue number
> > +from that address, the virtqueue number in the notification data is re=
dundant.
>=20
> I would keep the remark that the queue number might be redundant with
> the PCI transport.

I feel redundant is too strong a word. If anything sending data we just
read from device back to it is definitely redundant.
Spec says send it so we send it.
Maybe say it can be ignored by the device?

> > +On the other hand, some devices can benefit from receiving additional =
data with
> > +driver notifications. An example could be a hardware device implementi=
ng multiple
> > +protocols (with virtio being one of them), so the extra notification d=
ata could
> > +serve as a notification type indication or a protocol indication.
>=20
> Hm... what about replacing the whole text above with
>=20
> "Driver notifications (\ref{sec:Virtqueues / Driver notifications})
> always contain at least the virtqueue number for which buffers are
> available. Some devices can benefit from receiving additional data with
> driver notifications. For example, a hardware device implementing
> multiple protocols (with virtio being one of them) could benefit from a
> notification type indication or a protocol indication."


My problem with both versions is that it talks about
"additional information" while in fact it's information that
comes from the device itself.

> > +
> > +VIRTIO_NET_F_NOTIF_CONFIG_DATA feature can be used with transports tha=
t support
> > +a similar driver notifications delivery method, and it allows providin=
g extra
> > +data by the driver to the device. The definition of the data, that the=
 driver
> > +provides to the device instead of the virtqueue number, is transport s=
pecific.
>=20
> What about:
>=20
> "The VIRTIO_NET_F_NOTIF_CONFIG_DATA feature indicates the availability
> of such additional data. The definition of the data to be provided by
> the driver during driver notification and the method for delivering it
> is transport specific."
>=20
> > +
> > +For more details about driver notifications over PCI see \ref{sec:Virt=
io
> > +Transport Options / Virtio Over PCI Bus / PCI Device Layout / Notifica=
tion capability}.
> > +
> > +\drivernormative{\paragraph}{Driver Notifications}{Device Types / Netw=
ork Device / Device Operation / Driver Notifications}
> > +The driver SHOULD accept the VIRTIO_NET_F_NOTIF_CONFIG_DATA feature if=
 it has
> > +been offered.
>=20
> I'd also add
>=20
> "If the VIRTIO_NET_F_NOTIF_CONFIG_DATA feature has been negotiated, the
> driver MUST provide the transport-specific additional data with driver
> notifications."
>=20
> > +
> >  \section{Block Device}\label{sec:Device Types / Block Device}
> > =20
> >  The virtio block device is a simple virtual block device (ie.
> > --
> >=20


This publicly archived list offers a means to provide input to the=0D
OASIS Virtual I/O Device (VIRTIO) TC.=0D
=0D
In order to verify user consent to the Feedback License terms and=0D
to minimize spam in the list archive, subscription is required=0D
before posting.=0D
=0D
Subscribe: virtio-comment-subscribe@lists.oasis-open.org=0D
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org=0D
List help: virtio-comment-help@lists.oasis-open.org=0D
List archive: https://lists.oasis-open.org/archives/virtio-comment/=0D
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf=
=0D
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lis=
ts=0D
Committee: https://www.oasis-open.org/committees/virtio/=0D
Join OASIS: https://www.oasis-open.org/join/

