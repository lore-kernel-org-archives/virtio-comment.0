Return-Path: virtio-comment-return-1108-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E75E4985E3D
	for <virtio-comment@lists.oasis-open.org>; Thu, 27 Feb 2020 10:11:11 +0000 (UTC)
Date: Thu, 27 Feb 2020 05:11:01 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20200227050623-mutt-send-email-mst@kernel.org>
References: <BN6PR1801MB20670FFA71429EEB721E8053C5EA0@BN6PR1801MB2067.namprd18.prod.outlook.com>
 <20200226120948-mutt-send-email-mst@kernel.org>
 <84e330dc-cd7b-1521-ad04-e4dcafdc951b@redhat.com>
MIME-Version: 1.0
In-Reply-To: <84e330dc-cd7b-1521-ad04-e4dcafdc951b@redhat.com>
Subject: Re: [virtio-comment] [PATCH v3] virtio-net: Add support for the
 flexible driver notification structure
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
To: Jason Wang <jasowang@redhat.com>
Cc: Vitaly Mireyno <vmireyno@marvell.com>, "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, Ariel Elior <aelior@marvell.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Thu, Feb 27, 2020 at 06:05:30PM +0800, Jason Wang wrote:
>=20
> On 2020/2/27 =E4=B8=8A=E5=8D=881:10, Michael S. Tsirkin wrote:
> > On Wed, Feb 26, 2020 at 02:54:36PM +0000, Vitaly Mireyno wrote:
> > > > -----Original Message-----
> > > > From: Jason Wang <jasowang@redhat.com>
> > > > Sent: Wednesday, 26 February, 2020 5:13
> > > > To: Vitaly Mireyno <vmireyno@marvell.com>; virtio-comment@lists.oas=
is-open.org
> > > > Cc: Michael S. Tsirkin <mst@redhat.com>; Ariel Elior <aelior@marvel=
l.com>
> > > > Subject: [EXT] Re: [virtio-comment] [PATCH v3] virtio-net: Add supp=
ort for the flexible driver
> > > > notification structure
> > > >=20
> > > > -------------------------------------------------------------------=
---
> > > >=20
> > > > On 2020/2/26 =E4=B8=8A=E5=8D=8812:30, Vitaly Mireyno wrote:
> > > > > Currently, the driver notification (available buffer notification=
) has a fixed structure.
> > > > > If VIRTIO_F_NOTIFICATION_DATA has been negotiated, it includes: v=
qn, next_off and next_wrap.
> > > > > If notify_off_multiplier > 0, the VQ number can be derived by the=
 device from the Queue Notify
> > > > address, so vqn may be redundant.
> > > > > Some devices benefit from receiving an additional data with drive=
r notifications. This data can
> > > > optionally replace the vqn field in the driver notification structu=
re.
> > > > > In its simplest form, it would be sufficient for this data to be =
a per-device constant value.
> > > > >=20
> > > > > Changes from v2 - Defined a new feature flag instead of a PCI-spe=
cific flag.
> > > > >=20
> > > > > Signed-off-by: Vitaly Mireyno <vmireyno@marvell.com>
> > > > > ---
> > > > >    content.tex | 34 ++++++++++++++++++++++++++++++++++
> > > > >    1 file changed, 34 insertions(+)
> > > > >=20
> > > > > diff --git a/content.tex b/content.tex index b91a132..5223d5c 100=
644
> > > > > --- a/content.tex
> > > > > +++ b/content.tex
> > > > > @@ -965,6 +965,8 @@ \subsubsection{Notification structure layout}=
\label{sec:Virtio Transport
> > > > Options
> > > > >    struct virtio_pci_notify_cap {
> > > > >            struct virtio_pci_cap cap;
> > > > >            le32 notify_off_multiplier; /* Multiplier for
> > > > > queue_notify_off. */
> > > > > +        le16 notify_data; /* Data to be placed in the vqn field =
*/
> > > > > +        le16 padding; /* Pad to a dword */
> > > > >    };
> > > > >    \end{lstlisting}
> > > > >=20
> > > > > @@ -984,6 +986,21 @@ \subsubsection{Notification structure layout=
}\label{sec:Virtio Transport
> > > > Options
> > > > >    the same Queue Notify address for all queues.
> > > > >    \end{note}
> > > > >=20
> > > > > +\field{notify_data} is the data that the driver will set in the
> > > > > +\field{vqn} field in the available buffer notification, if
> > > > > +VIRTIO_NET_F_NOTIF_EXTRA_DATA has been negotiated.
> > > > > +
> > > > > +\begin{note}
> > > > > +If \field{notify_off_multiplier} > 0, the virtqueue number can
> > > > > +potentially be derived by the device from the Queue Notify addre=
ss,
> > > > > +so \field{vqn} may be redundant. Some devices benefit from recei=
ving
> > > > > +the additional data with driver notifications. An example could =
be a
> > > > > +hardware device implementing multiple protocols (with virtio bei=
ng
> > > > > +one of them), so extra notification data could serve as a notifi=
cation type indication or a protocol
> > > > indication.
> > > > > +Another example could be using shared hardware memory space for
> > > > > +driver notifications for multiple virtio devices in a trusted en=
vironment.
> > > > > +\end{note}
> > > > > +
> > > > >    \devicenormative{\paragraph}{Notification capability}{Virtio T=
ransport Options / Virtio Over PCI Bus
> > > > / PCI Device Layout / Notification capability}
> > > > >    The device MUST present at least one notification capability.
> > > > >=20
> > > > > @@ -1020,6 +1037,10 @@ \subsubsection{Notification structure layo=
ut}\label{sec:Virtio Transport
> > > > Options
> > > > >    cap.length >=3D queue_notify_off * notify_off_multiplier + 4
> > > > >    \end{lstlisting}
> > > > >=20
> > > > > +If VIRTIO_NET_F_NOTIF_EXTRA_DATA has been negotiated, the device=
 MUST
> > > > > +set \field{notify_data} to a valid value, and SHOULD set
> > > > > +\field{notify_off_multiplier} > 0.
> > > > > +
> > > > >    \subsubsection{ISR status capability}\label{sec:Virtio Transpo=
rt
> > > > > Options / Virtio Over PCI Bus / PCI Device Layout / ISR status
> > > > > capability}
> > > > >=20
> > > > >    The VIRTIO_PCI_CAP_ISR_CFG capability @@ -1519,6 +1540,14 @@
> > > > > \subsubsection{Available Buffer Notifications}\label{sec:Virtio T=
ransport Option
> > > > >    See \ref{sec:Virtio Transport Options / Virtio Over PCI Bus / =
PCI Device Layout / Notification
> > > > capability}
> > > > >    for how to calculate the Queue Notify address.
> > > > >=20
> > > > > +\drivernormative{\paragraph}{Available Buffer Notifications}{Vir=
tio
> > > > > +Transport Options / Virtio Over PCI Bus / PCI-specific Initializ=
ation
> > > > > +And Device Operation / Available Buffer Notifications} The drive=
r SHOULD accept the
> > > > VIRTIO_NET_F_NOTIF_EXTRA_DATA feature if it has been offered.
> > > >=20
> > > >=20
> > > > I think we need use "MUST" here?
> > > >=20
> > > Wouldn=E2=80=99t it break the existing drivers then?
> > I agree, we can't declare existing drivers non-conformant by fiat.
> > Certainly not for a boutique feature like this.
>=20
>=20
> I may miss something but I think device won't work correctly if this feat=
ure
> is not negotiated?
>=20
> Thanks

That would depend on the device. Device can always fail FEATURES_OK
if it doesn't support existing drivers.
I really need to address https://github.com/oasis-tcs/virtio-spec/issues/71
so people know what to expect ...

>=20
> >=20
> >=20
> > > > Other looks good to me.
> > > >=20
> > > > Thanks
> > > >=20
> > > >=20
> > > > > +
> > > > > +If VIRTIO_NET_F_NOTIF_EXTRA_DATA has been negotiated, the driver=
 MUST
> > > > > +set the \field{vqn} field of the available buffer notification
> > > > > +structure to the \field{notify_data} value.
> > > > > +
> > > > >    \subsubsection{Used Buffer Notifications}\label{sec:Virtio Tra=
nsport
> > > > > Options / Virtio Over PCI Bus / PCI-specific Initialization And D=
evice
> > > > > Operation / Used Buffer Notifications}
> > > > >=20
> > > > >    If a used buffer notification is necessary for a virtqueue, th=
e device would typically act as follows:
> > > > > @@ -2895,6 +2924,10 @@ \subsection{Feature bits}\label{sec:Device=
 Types / Network Device /
> > > > Feature bits
> > > > >    \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)] Set MAC address through =
control
> > > > >        channel.
> > > > >=20
> > > > > +\item[VIRTIO_NET_F_NOTIF_EXTRA_DATA(57)] Driver provides an extr=
a data with
> > > > > +    available buffer notifications, to aid in notification proce=
ssing by the
> > > > > +    device.
> > > > > +
> > > > >    \item[VIRTIO_NET_F_GUEST_HDRLEN(59)] Driver can provide the ex=
act \field{hdr_len}
> > > > >        value. Device benefits from knowing the exact header lengt=
h.
> > > > >=20
> > > > > @@ -2934,6 +2967,7 @@ \subsubsection{Feature bit requirements}\la=
bel{sec:Device Types /
> > > > Network Device
> > > > >    \item[VIRTIO_NET_F_CTRL_MAC_ADDR] Requires VIRTIO_NET_F_CTRL_V=
Q.
> > > > >    \item[VIRTIO_NET_F_RSC_EXT] Requires VIRTIO_NET_F_HOST_TSO4 or
> > > > VIRTIO_NET_F_HOST_TSO6.
> > > > >    \item[VIRTIO_NET_F_RSS] Requires VIRTIO_NET_F_CTRL_VQ.
> > > > > +\item[VIRTIO_NET_F_NOTIF_EXTRA_DATA] Requires VIRTIO_F_NOTIFICAT=
ION_DATA.
> > > > >    \end{description}
> > > > >=20
> > > > >    \subsubsection{Legacy Interface: Feature bits}\label{sec:Devic=
e
> > > > > Types / Network Device / Feature bits / Legacy Interface: Feature
> > > > > bits}
> > > > > --
> > > > >=20
> > > > > This publicly archived list offers a means to provide input to th=
e
> > > > > OASIS Virtual I/O Device (VIRTIO) TC.
> > > > >=20
> > > > > In order to verify user consent to the Feedback License terms and=
 to
> > > > > minimize spam in the list archive, subscription is required befor=
e
> > > > > posting.
> > > > >=20
> > > > > Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> > > > > Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> > > > > List help: virtio-comment-help@lists.oasis-open.org
> > > > > List archive:
> > > > > https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.oasi=
s-2Dope
> > > > > n.org_archives_virtio-2Dcomment_&d=3DDwIFaQ&c=3DnKjWec2b6R0mOyPaz=
7xtfQ&r=3Dl
> > > > > DHJ2FW52oJ3lqqsArgFRdcevq01tbLQAw4A_NO7xgI&m=3D94BRvyqIARqVJ-yyds=
IqG25_z
> > > > > AUHjeENww-NxeMs_s8&s=3DfspKS4uA_CyM-S4HrR6GdJbvttjkX5iCygZvcybe_q=
s&e=3D
> > > > > Feedback License:
> > > > > https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__www.oasis-=
2Dopen.
> > > > > org_who_ipr_feedback-5Flicense.pdf&d=3DDwIFaQ&c=3DnKjWec2b6R0mOyP=
az7xtfQ&r
> > > > > =3DlDHJ2FW52oJ3lqqsArgFRdcevq01tbLQAw4A_NO7xgI&m=3D94BRvyqIARqVJ-=
yydsIqG25
> > > > > _zAUHjeENww-NxeMs_s8&s=3DsskV_Q0nV6odmu9tb3_QO4sJgxQQfA7SDNkDbhCP=
gZ0&e=3D
> > > > > List Guidelines:
> > > > > https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__www.oasis-=
2Dopen.
> > > > > org_policies-2Dguidelines_mailing-2Dlists&d=3DDwIFaQ&c=3DnKjWec2b=
6R0mOyPaz
> > > > > 7xtfQ&r=3DlDHJ2FW52oJ3lqqsArgFRdcevq01tbLQAw4A_NO7xgI&m=3D94BRvyq=
IARqVJ-yy
> > > > > dsIqG25_zAUHjeENww-NxeMs_s8&s=3D0FDuoPUSirLgEwBf7ATkyVMaalFeB6N0-=
vhpOnkB
> > > > > vWY&e=3D
> > > > > Committee:
> > > > > https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__www.oasis-=
2Dopen.
> > > > > org_committees_virtio_&d=3DDwIFaQ&c=3DnKjWec2b6R0mOyPaz7xtfQ&r=3D=
lDHJ2FW52oJ
> > > > > 3lqqsArgFRdcevq01tbLQAw4A_NO7xgI&m=3D94BRvyqIARqVJ-yydsIqG25_zAUH=
jeENww-
> > > > > NxeMs_s8&s=3DraC15yZMnr9y9Iv5_woorP7Bq2OQiO-uybPhgqzNtlE&e=3D
> > > > > Join OASIS:
> > > > > https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__www.oasis-=
2Dopen.
> > > > > org_join_&d=3DDwIFaQ&c=3DnKjWec2b6R0mOyPaz7xtfQ&r=3DlDHJ2FW52oJ3l=
qqsArgFRdce
> > > > > vq01tbLQAw4A_NO7xgI&m=3D94BRvyqIARqVJ-yydsIqG25_zAUHjeENww-NxeMs_=
s8&s=3DGw
> > > > > VYWNwNZr7MFb5jJ7acLULJni1uMlwLgWBgiTSrp74&e=3D
> > > > >=20
> >=20
> > This publicly archived list offers a means to provide input to the
> > OASIS Virtual I/O Device (VIRTIO) TC.
> >=20
> > In order to verify user consent to the Feedback License terms and
> > to minimize spam in the list archive, subscription is required
> > before posting.
> >=20
> > Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> > Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> > List help: virtio-comment-help@lists.oasis-open.org
> > List archive: https://lists.oasis-open.org/archives/virtio-comment/
> > Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.p=
df
> > List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing=
-lists
> > Committee: https://www.oasis-open.org/committees/virtio/
> > Join OASIS: https://www.oasis-open.org/join/
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

