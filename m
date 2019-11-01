Return-Path: virtio-comment-return-897-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E1E1F985CF7
	for <virtio-comment@lists.oasis-open.org>; Fri,  1 Nov 2019 04:09:46 +0000 (UTC)
Date: Fri, 1 Nov 2019 00:09:40 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20191031235120-mutt-send-email-mst@kernel.org>
References: <BN6PR1801MB2067FA1E7C89A81371DC0DB9C5630@BN6PR1801MB2067.namprd18.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <BN6PR1801MB2067FA1E7C89A81371DC0DB9C5630@BN6PR1801MB2067.namprd18.prod.outlook.com>
Subject: Re: [virtio-comment] Re: [PATCH] virtio-net: Add equal-sized receive
 buffers feature
To: Vitaly Mireyno <vmireyno@marvell.com>
Cc: Jason Wang <jasowang@redhat.com>, "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
List-ID: <virtio-comment.lists.oasis-open.org>

On Thu, Oct 31, 2019 at 10:46:55AM +0000, Vitaly Mireyno wrote:
> The feature is limited to receive buffers only.
> A driver decides on receive buffer length. The only limitation is that th=
is length has to be the same for all receive virtqueue buffers.
> The driver configures receive buffer length to the device during device i=
nitialization, and the device reads it and may use it for optimal operation=
=2E=20
> No changes for transmit buffers.
>=20
> -----Original Message-----
> From: virtio-comment@lists.oasis-open.org <virtio-comment@lists.oasis-ope=
n.org> On Behalf Of Jason Wang
> Sent: Thursday, 31 October, 2019 12:15
> To: Vitaly Mireyno <vmireyno@marvell.com>; virtio-comment@lists.oasis-ope=
n.org
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Subject: [virtio-comment] Re: [PATCH] virtio-net: Add equal-sized receive=
 buffers feature
>=20
>=20
> On 2019/10/31 =E4=B8=8B=E5=8D=885:23, Vitaly Mireyno wrote:
> > Some devices benefit from working with receive buffers of a predefined =
constant length.
> > Add a feature for drivers that allocate equal-sized receive buffers, an=
d devices that benefit from predefined receive buffers length.
> >
> > Signed-off-by: Vitaly Mireyno <vmireyno@marvell.com>
> > ---
> >   content.tex | 29 +++++++++++++++++++++++++++--
> >   1 file changed, 27 insertions(+), 2 deletions(-)
>=20
>=20
> Is there any other networking device that has this feature?
>=20
>=20
> >
> > diff --git a/content.tex b/content.tex index b1ea9b9..c9e67c8 100644
> > --- a/content.tex
> > +++ b/content.tex
> > @@ -2811,6 +2811,10 @@ \subsection{Feature bits}\label{sec:Device Types=
 / Network Device / Feature bits
> >   \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)] Set MAC address through control
> >       channel.
> >  =20
> > +\item[VIRTIO_NET_F_CONST_RXBUF_LEN(58)] Driver allocates all receive b=
uffers
> > +    of the same constant length. Device benefits from working with
> > +    receive buffers of equal length.
> > +

Problem is, I don't think linux will use this for skbs since it breaks
buffer accounting. This is because it is important to make skbs
as small as you can. So even if you see "device would benefit"
there is no way to balance this with the benefit to linux.
How do you know which benefit is bigger?

You also never explained how does device benefit. My guess is this
allows device to calculate the # of descriptors to fetch
that are needed for a packet. Right?
Assuming this, I think a rough estimate should be enough.
If device fetches too much it can discard extra, if it does not
fetch enough it can fetch extra.

Let us not forget that express packets are 256 bytes so
up to 16 descriptors fit in a packet, there is no
benefit most of the time in knowing whether e.g. 1 or 2
descriptors are needed.


Let us not forget these are buffers, not descriptors.

So device does not really know the exact # of descriptors:
current drivers do 1 descriptor per buffer but nothing
prevents more.


Thoughts?


> >   \item[VIRTIO_NET_F_RSC_EXT(61)] Device can process duplicated ACKs
> >       and report number of coalesced segments and duplicated ACKs
> >  =20
> > @@ -2854,8 +2858,8 @@ \subsubsection{Legacy Interface: Feature bits}\la=
bel{sec:Device Types / Network
> >   \subsection{Device configuration layout}\label{sec:Device Types / Net=
work Device / Device configuration layout}
> >   \label{sec:Device Types / Block Device / Feature bits / Device=20
> > configuration layout}
> >  =20
> > -Three driver-read-only configuration fields are currently defined.=20
> > The \field{mac} address field -always exists (though is only valid if=
=20
> > VIRTIO_NET_F_MAC is set), and
> > +The driver-read-only \field{mac} address field always exists (though=
=20
> > +is only valid if VIRTIO_NET_F_MAC is set), and
> >   \field{status} only exists if VIRTIO_NET_F_STATUS is set. Two
> >   read-only bits (for the driver) are currently defined for the status =
field:
> >   VIRTIO_NET_S_LINK_UP and VIRTIO_NET_S_ANNOUNCE.
> > @@ -2875,12 +2879,17 @@ \subsection{Device configuration layout}\label{=
sec:Device Types / Network Device
> >   VIRTIO_NET_F_MTU is set. This field specifies the maximum MTU for the=
 driver to
> >   use.
> >  =20
> > +The device-read-only field \field{rx_buf_len} only exists if
>=20
>=20
> Should be driver-read-only.
>=20
>=20
> > +VIRTIO_NET_F_CONST_RXBUF_LEN is negotiated. This field specifies the=
=20
> > +receive buffers length.
> > +
> >   \begin{lstlisting}
> >   struct virtio_net_config {
> >           u8 mac[6];
> >           le16 status;
> >           le16 max_virtqueue_pairs;
> >           le16 mtu;
> > +        le32 rx_buf_len;
> >   };
> >   \end{lstlisting}
> >  =20
> > @@ -2933,6 +2942,13 @@ \subsection{Device configuration=20
> > layout}\label{sec:Device Types / Network Device
> >  =20
> >   A driver SHOULD negotiate the VIRTIO_NET_F_STANDBY feature if the dev=
ice offers it.
> >  =20
> > +A driver SHOULD accept the VIRTIO_NET_F_CONST_RXBUF_LEN feature if off=
ered.
> > +
> > +If VIRTIO_NET_F_CONST_RXBUF_LEN feature has been negotiated, the=20
> > +driver MUST set \field{rx_buf_len}.
>=20
>=20
> I think it's device that set the field?

Makes more sense for the driver, but if you want this set
e.g. before buffers are added, you must say so.

>=20
> > +
> > +A driver MUST NOT modify \field{rx_buf_len} once it has been set.
> > +


This seems very unflexible. I can see how e.g. XDP would benefit from
big buffers while skbs benefit from small buffers.

This calls for ability to change this.

> >   \subsubsection{Legacy Interface: Device configuration layout}\label{s=
ec:Device Types / Network Device / Device configuration layout / Legacy Int=
erface: Device configuration layout}
> >   \label{sec:Device Types / Block Device / Feature bits / Device config=
uration layout / Legacy Interface: Device configuration layout}
> >   When using the legacy interface, transitional devices and drivers @@=
=20
> > -3241,6 +3257,11 @@ \subsubsection{Setting Up Receive Buffers}\label{se=
c:Device Types / Network Devi
> >   If VIRTIO_NET_F_MQ is negotiated, each of receiveq1\ldots receiveqN
> >   that will be used SHOULD be populated with receive buffers.
> >  =20
> > +If VIRTIO_NET_F_CONST_RXBUF_LEN feature has been negotiated, the=20
> > +driver MUST initialize all receive virtqueue descriptors \field{len}=
=20
> > +field with the value configured in \field{rx_buf_len} device=20
> > +configuration field, and allocate receive buffers accordingly.
> > +
> >   \devicenormative{\paragraph}{Setting Up Receive Buffers}{Device=20
> > Types / Network Device / Device Operation / Setting Up Receive=20
> > Buffers}
> >  =20
> >   The device MUST set \field{num_buffers} to the number of descriptors=
=20
> > used to @@ -3396,6 +3417,10 @@ \subsubsection{Processing of Incoming Pa=
ckets}\label{sec:Device Types / Network
> >   checksum (in case of multiple encapsulated protocols, one level
> >   of checksums is validated).
> >  =20
> > +If VIRTIO_NET_F_CONST_RXBUF_LEN has been negotiated, the device MAY=20
> > +use \field{rx_buf_len} as a buffer length (instead of reading it from=
=20
> > +virtqueue descriptor \field{len} field).
>=20
>=20
> Is this safe? What if driver submit a small buffer, then device can read =
more than what is allowed?
>=20
> Thanks
>=20
>=20
> > +
> >   \drivernormative{\paragraph}{Processing of Incoming
> >   Packets}{Device Types / Network Device / Device Operation /
> >   Processing of Incoming Packets}
> > --
>=20
>=20
> This publicly archived list offers a means to provide input to theOASIS V=
irtual I/O Device (VIRTIO) TC.In order to verify user consent to the Feedba=
ck License terms andto minimize spam in the list archive, subscription is r=
equiredbefore posting.Subscribe: virtio-comment-subscribe@lists.oasis-open.=
orgUnsubscribe: virtio-comment-unsubscribe@lists.oasis-open.orgList help: v=
irtio-comment-help@lists.oasis-open.orgList archive: https://urldefense.pro=
ofpoint.com/v2/url?u=3Dhttps-3A__lists.oasis-2Dopen.org_archives_virtio-2Dc=
omment_&d=3DDwIFaQ&c=3DnKjWec2b6R0mOyPaz7xtfQ&r=3DlDHJ2FW52oJ3lqqsArgFRdcev=
q01tbLQAw4A_NO7xgI&m=3DKkXMgr3LRg5F7_7jB6uHCHA2n_Tn6303zez2N4VkSfU&s=3DZvYu=
Xs3LuhkeJxW_zoADv1L4RisDyGH_vp7scO91w9s&e=3D Feedback License: https://urld=
efense.proofpoint.com/v2/url?u=3Dhttps-3A__www.oasis-2Dopen.org_who_ipr_fee=
dback-5Flicense.pdf&d=3DDwIFaQ&c=3DnKjWec2b6R0mOyPaz7xtfQ&r=3DlDHJ2FW52oJ3l=
qqsArgFRdcevq01tbLQAw4A_NO7xgI&m=3DKkXMgr3LRg5F7_7jB6uHCHA2n_Tn6303zez2N4Vk=
SfU&s=3D7Hf-O4ss-rLdNJsAbIOg5ruheBcfAYFdXWuks_HJfFQ&e=3D List Guidelines: h=
ttps://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__www.oasis-2Dopen.org_=
policies-2Dguidelines_mailing-2Dlists&d=3DDwIFaQ&c=3DnKjWec2b6R0mOyPaz7xtfQ=
&r=3DlDHJ2FW52oJ3lqqsArgFRdcevq01tbLQAw4A_NO7xgI&m=3DKkXMgr3LRg5F7_7jB6uHCH=
A2n_Tn6303zez2N4VkSfU&s=3D7oMwlBy4fdYwjT2_f9BTwHRm2GFtIYL-x8e4C0jlrpM&e=3D =
Committee: https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__www.oasis=
-2Dopen.org_committees_virtio_&d=3DDwIFaQ&c=3DnKjWec2b6R0mOyPaz7xtfQ&r=3DlD=
HJ2FW52oJ3lqqsArgFRdcevq01tbLQAw4A_NO7xgI&m=3DKkXMgr3LRg5F7_7jB6uHCHA2n_Tn6=
303zez2N4VkSfU&s=3D-K2akZ06PY7r4TquQY4T4UWdZ6JyAsBDFZIEZFNsWHk&e=3D Join OA=
SIS: https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__www.oasis-2Dope=
n.org_join_&d=3DDwIFaQ&c=3DnKjWec2b6R0mOyPaz7xtfQ&r=3DlDHJ2FW52oJ3lqqsArgFR=
dcevq01tbLQAw4A_NO7xgI&m=3DKkXMgr3LRg5F7_7jB6uHCHA2n_Tn6303zez2N4VkSfU&s=3D=
lR1SlzXT71tjw7DDuD6XaHefJQSTBCAvRcdp45ureB8&e=3D=20
>=20

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
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf=0D
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists=0D
Committee: https://www.oasis-open.org/committees/virtio/=0D
Join OASIS: https://www.oasis-open.org/join/

