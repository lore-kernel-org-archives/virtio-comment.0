Return-Path: virtio-comment-return-1115-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7A3BC985F0F
	for <virtio-comment@lists.oasis-open.org>; Tue,  3 Mar 2020 14:48:39 +0000 (UTC)
Date: Tue, 3 Mar 2020 09:48:25 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20200303094608-mutt-send-email-mst@kernel.org>
References: <BN6PR1801MB20670FFA71429EEB721E8053C5EA0@BN6PR1801MB2067.namprd18.prod.outlook.com>
 <20200226120948-mutt-send-email-mst@kernel.org>
 <84e330dc-cd7b-1521-ad04-e4dcafdc951b@redhat.com>
 <20200227050623-mutt-send-email-mst@kernel.org>
 <dc35aa1c-b5eb-29f0-81fc-564b9873f100@redhat.com>
MIME-Version: 1.0
In-Reply-To: <dc35aa1c-b5eb-29f0-81fc-564b9873f100@redhat.com>
Subject: Re: [virtio-comment] [PATCH v3] virtio-net: Add support for the
 flexible driver notification structure
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
To: Jason Wang <jasowang@redhat.com>
Cc: Vitaly Mireyno <vmireyno@marvell.com>, "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, Ariel Elior <aelior@marvell.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Thu, Feb 27, 2020 at 06:20:43PM +0800, Jason Wang wrote:
>=20
> On 2020/2/27 =E4=B8=8B=E5=8D=886:11, Michael S. Tsirkin wrote:
> > On Thu, Feb 27, 2020 at 06:05:30PM +0800, Jason Wang wrote:
> > > On 2020/2/27 =E4=B8=8A=E5=8D=881:10, Michael S. Tsirkin wrote:
> > > > On Wed, Feb 26, 2020 at 02:54:36PM +0000, Vitaly Mireyno wrote:
> > > > > > -----Original Message-----
> > > > > > From: Jason Wang <jasowang@redhat.com>
> > > > > > Sent: Wednesday, 26 February, 2020 5:13
> > > > > > To: Vitaly Mireyno <vmireyno@marvell.com>; virtio-comment@lists=
.oasis-open.org
> > > > > > Cc: Michael S. Tsirkin <mst@redhat.com>; Ariel Elior <aelior@ma=
rvell.com>
> > > > > > Subject: [EXT] Re: [virtio-comment] [PATCH v3] virtio-net: Add =
support for the flexible driver
> > > > > > notification structure
> > > > > >=20
> > > > > > ---------------------------------------------------------------=
-------
> > > > > >=20
> > > > > > On 2020/2/26 =E4=B8=8A=E5=8D=8812:30, Vitaly Mireyno wrote:
> > > > > > > Currently, the driver notification (available buffer notifica=
tion) has a fixed structure.
> > > > > > > If VIRTIO_F_NOTIFICATION_DATA has been negotiated, it include=
s: vqn, next_off and next_wrap.
> > > > > > > If notify_off_multiplier > 0, the VQ number can be derived by=
 the device from the Queue Notify
> > > > > > address, so vqn may be redundant.
> > > > > > > Some devices benefit from receiving an additional data with d=
river notifications. This data can
> > > > > > optionally replace the vqn field in the driver notification str=
ucture.
> > > > > > > In its simplest form, it would be sufficient for this data to=
 be a per-device constant value.
> > > > > > >=20
> > > > > > > Changes from v2 - Defined a new feature flag instead of a PCI=
-specific flag.
> > > > > > >=20
> > > > > > > Signed-off-by: Vitaly Mireyno <vmireyno@marvell.com>
> > > > > > > ---
> > > > > > >     content.tex | 34 ++++++++++++++++++++++++++++++++++
> > > > > > >     1 file changed, 34 insertions(+)
> > > > > > >=20
> > > > > > > diff --git a/content.tex b/content.tex index b91a132..5223d5c=
 100644
> > > > > > > --- a/content.tex
> > > > > > > +++ b/content.tex
> > > > > > > @@ -965,6 +965,8 @@ \subsubsection{Notification structure lay=
out}\label{sec:Virtio Transport
> > > > > > Options
> > > > > > >     struct virtio_pci_notify_cap {
> > > > > > >             struct virtio_pci_cap cap;
> > > > > > >             le32 notify_off_multiplier; /* Multiplier for
> > > > > > > queue_notify_off. */
> > > > > > > +        le16 notify_data; /* Data to be placed in the vqn fi=
eld */
> > > > > > > +        le16 padding; /* Pad to a dword */
> > > > > > >     };
> > > > > > >     \end{lstlisting}
> > > > > > >=20
> > > > > > > @@ -984,6 +986,21 @@ \subsubsection{Notification structure la=
yout}\label{sec:Virtio Transport
> > > > > > Options
> > > > > > >     the same Queue Notify address for all queues.
> > > > > > >     \end{note}
> > > > > > >=20
> > > > > > > +\field{notify_data} is the data that the driver will set in =
the
> > > > > > > +\field{vqn} field in the available buffer notification, if
> > > > > > > +VIRTIO_NET_F_NOTIF_EXTRA_DATA has been negotiated.
> > > > > > > +
> > > > > > > +\begin{note}
> > > > > > > +If \field{notify_off_multiplier} > 0, the virtqueue number c=
an
> > > > > > > +potentially be derived by the device from the Queue Notify a=
ddress,
> > > > > > > +so \field{vqn} may be redundant. Some devices benefit from r=
eceiving
> > > > > > > +the additional data with driver notifications. An example co=
uld be a
> > > > > > > +hardware device implementing multiple protocols (with virtio=
 being
> > > > > > > +one of them), so extra notification data could serve as a no=
tification type indication or a protocol
> > > > > > indication.
> > > > > > > +Another example could be using shared hardware memory space =
for
> > > > > > > +driver notifications for multiple virtio devices in a truste=
d environment.
> > > > > > > +\end{note}
> > > > > > > +
> > > > > > >     \devicenormative{\paragraph}{Notification capability}{Vir=
tio Transport Options / Virtio Over PCI Bus
> > > > > > / PCI Device Layout / Notification capability}
> > > > > > >     The device MUST present at least one notification capabil=
ity.
> > > > > > >=20
> > > > > > > @@ -1020,6 +1037,10 @@ \subsubsection{Notification structure =
layout}\label{sec:Virtio Transport
> > > > > > Options
> > > > > > >     cap.length >=3D queue_notify_off * notify_off_multiplier =
+ 4
> > > > > > >     \end{lstlisting}
> > > > > > >=20
> > > > > > > +If VIRTIO_NET_F_NOTIF_EXTRA_DATA has been negotiated, the de=
vice MUST
> > > > > > > +set \field{notify_data} to a valid value, and SHOULD set
> > > > > > > +\field{notify_off_multiplier} > 0.
> > > > > > > +
> > > > > > >     \subsubsection{ISR status capability}\label{sec:Virtio Tr=
ansport
> > > > > > > Options / Virtio Over PCI Bus / PCI Device Layout / ISR statu=
s
> > > > > > > capability}
> > > > > > >=20
> > > > > > >     The VIRTIO_PCI_CAP_ISR_CFG capability @@ -1519,6 +1540,14=
 @@
> > > > > > > \subsubsection{Available Buffer Notifications}\label{sec:Virt=
io Transport Option
> > > > > > >     See \ref{sec:Virtio Transport Options / Virtio Over PCI B=
us / PCI Device Layout / Notification
> > > > > > capability}
> > > > > > >     for how to calculate the Queue Notify address.
> > > > > > >=20
> > > > > > > +\drivernormative{\paragraph}{Available Buffer Notifications}=
{Virtio
> > > > > > > +Transport Options / Virtio Over PCI Bus / PCI-specific Initi=
alization
> > > > > > > +And Device Operation / Available Buffer Notifications} The d=
river SHOULD accept the
> > > > > > VIRTIO_NET_F_NOTIF_EXTRA_DATA feature if it has been offered.
> > > > > >=20
> > > > > >=20
> > > > > > I think we need use "MUST" here?
> > > > > >=20
> > > > > Wouldn=E2=80=99t it break the existing drivers then?
> > > > I agree, we can't declare existing drivers non-conformant by fiat.
> > > > Certainly not for a boutique feature like this.
> > >=20
> > > I may miss something but I think device won't work correctly if this =
feature
> > > is not negotiated?
> > >=20
> > > Thanks
> > That would depend on the device. Device can always fail FEATURES_OK
> > if it doesn't support existing drivers.
> > I really need to address https://github.com/oasis-tcs/virtio-spec/issue=
s/71
> > so people know what to expect ...
>=20
>=20
> That's my understanding as well.
>=20
> E.g for IOMMU_PLATFORM, device can still work if it the feature is not
> negotiated so we use "SHOULD" in the spec.
>=20
> But for this feature, there's no way except for failing the negotiation, =
so
> "MUST" seems correct.
>=20
> Thanks

That would depend on the device. Some devices could work without the
extra data in the kick, just with worse performance.
So I feel this is device's job to enforce this bit,
not driver's.


>=20
> >=20
> > > >=20
> > > > > > Other looks good to me.
> > > > > >=20
> > > > > > Thanks
> > > > > >=20
> > > > > >=20
> > > > > > > +
> > > > > > > +If VIRTIO_NET_F_NOTIF_EXTRA_DATA has been negotiated, the dr=
iver MUST
> > > > > > > +set the \field{vqn} field of the available buffer notificati=
on
> > > > > > > +structure to the \field{notify_data} value.
> > > > > > > +
> > > > > > >     \subsubsection{Used Buffer Notifications}\label{sec:Virti=
o Transport
> > > > > > > Options / Virtio Over PCI Bus / PCI-specific Initialization A=
nd Device
> > > > > > > Operation / Used Buffer Notifications}
> > > > > > >=20
> > > > > > >     If a used buffer notification is necessary for a virtqueu=
e, the device would typically act as follows:
> > > > > > > @@ -2895,6 +2924,10 @@ \subsection{Feature bits}\label{sec:De=
vice Types / Network Device /
> > > > > > Feature bits
> > > > > > >     \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)] Set MAC address thr=
ough control
> > > > > > >         channel.
> > > > > > >=20
> > > > > > > +\item[VIRTIO_NET_F_NOTIF_EXTRA_DATA(57)] Driver provides an =
extra data with
> > > > > > > +    available buffer notifications, to aid in notification p=
rocessing by the
> > > > > > > +    device.
> > > > > > > +
> > > > > > >     \item[VIRTIO_NET_F_GUEST_HDRLEN(59)] Driver can provide t=
he exact \field{hdr_len}
> > > > > > >         value. Device benefits from knowing the exact header =
length.
> > > > > > >=20
> > > > > > > @@ -2934,6 +2967,7 @@ \subsubsection{Feature bit requirements=
}\label{sec:Device Types /
> > > > > > Network Device
> > > > > > >     \item[VIRTIO_NET_F_CTRL_MAC_ADDR] Requires VIRTIO_NET_F_C=
TRL_VQ.
> > > > > > >     \item[VIRTIO_NET_F_RSC_EXT] Requires VIRTIO_NET_F_HOST_TS=
O4 or
> > > > > > VIRTIO_NET_F_HOST_TSO6.
> > > > > > >     \item[VIRTIO_NET_F_RSS] Requires VIRTIO_NET_F_CTRL_VQ.
> > > > > > > +\item[VIRTIO_NET_F_NOTIF_EXTRA_DATA] Requires VIRTIO_F_NOTIF=
ICATION_DATA.
> > > > > > >     \end{description}
> > > > > > >=20
> > > > > > >     \subsubsection{Legacy Interface: Feature bits}\label{sec:=
Device
> > > > > > > Types / Network Device / Feature bits / Legacy Interface: Fea=
ture
> > > > > > > bits}
> > > > > > > --
> > > > > > >=20
> > > > > > > This publicly archived list offers a means to provide input t=
o the
> > > > > > > OASIS Virtual I/O Device (VIRTIO) TC.
> > > > > > >=20
> > > > > > > In order to verify user consent to the Feedback License terms=
 and to
> > > > > > > minimize spam in the list archive, subscription is required b=
efore
> > > > > > > posting.
> > > > > > >=20
> > > > > > > Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> > > > > > > Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> > > > > > > List help: virtio-comment-help@lists.oasis-open.org
> > > > > > > List archive:
> > > > > > > https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.=
oasis-2Dope
> > > > > > > n.org_archives_virtio-2Dcomment_&d=3DDwIFaQ&c=3DnKjWec2b6R0mO=
yPaz7xtfQ&r=3Dl
> > > > > > > DHJ2FW52oJ3lqqsArgFRdcevq01tbLQAw4A_NO7xgI&m=3D94BRvyqIARqVJ-=
yydsIqG25_z
> > > > > > > AUHjeENww-NxeMs_s8&s=3DfspKS4uA_CyM-S4HrR6GdJbvttjkX5iCygZvcy=
be_qs&e=3D
> > > > > > > Feedback License:
> > > > > > > https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__www.oa=
sis-2Dopen.
> > > > > > > org_who_ipr_feedback-5Flicense.pdf&d=3DDwIFaQ&c=3DnKjWec2b6R0=
mOyPaz7xtfQ&r
> > > > > > > =3DlDHJ2FW52oJ3lqqsArgFRdcevq01tbLQAw4A_NO7xgI&m=3D94BRvyqIAR=
qVJ-yydsIqG25
> > > > > > > _zAUHjeENww-NxeMs_s8&s=3DsskV_Q0nV6odmu9tb3_QO4sJgxQQfA7SDNkD=
bhCPgZ0&e=3D
> > > > > > > List Guidelines:
> > > > > > > https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__www.oa=
sis-2Dopen.
> > > > > > > org_policies-2Dguidelines_mailing-2Dlists&d=3DDwIFaQ&c=3DnKjW=
ec2b6R0mOyPaz
> > > > > > > 7xtfQ&r=3DlDHJ2FW52oJ3lqqsArgFRdcevq01tbLQAw4A_NO7xgI&m=3D94B=
RvyqIARqVJ-yy
> > > > > > > dsIqG25_zAUHjeENww-NxeMs_s8&s=3D0FDuoPUSirLgEwBf7ATkyVMaalFeB=
6N0-vhpOnkB
> > > > > > > vWY&e=3D
> > > > > > > Committee:
> > > > > > > https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__www.oa=
sis-2Dopen.
> > > > > > > org_committees_virtio_&d=3DDwIFaQ&c=3DnKjWec2b6R0mOyPaz7xtfQ&=
r=3DlDHJ2FW52oJ
> > > > > > > 3lqqsArgFRdcevq01tbLQAw4A_NO7xgI&m=3D94BRvyqIARqVJ-yydsIqG25_=
zAUHjeENww-
> > > > > > > NxeMs_s8&s=3DraC15yZMnr9y9Iv5_woorP7Bq2OQiO-uybPhgqzNtlE&e=3D
> > > > > > > Join OASIS:
> > > > > > > https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__www.oa=
sis-2Dopen.
> > > > > > > org_join_&d=3DDwIFaQ&c=3DnKjWec2b6R0mOyPaz7xtfQ&r=3DlDHJ2FW52=
oJ3lqqsArgFRdce
> > > > > > > vq01tbLQAw4A_NO7xgI&m=3D94BRvyqIARqVJ-yydsIqG25_zAUHjeENww-Nx=
eMs_s8&s=3DGw
> > > > > > > VYWNwNZr7MFb5jJ7acLULJni1uMlwLgWBgiTSrp74&e=3D
> > > > > > >=20
> > > > This publicly archived list offers a means to provide input to the
> > > > OASIS Virtual I/O Device (VIRTIO) TC.
> > > >=20
> > > > In order to verify user consent to the Feedback License terms and
> > > > to minimize spam in the list archive, subscription is required
> > > > before posting.
> > > >=20
> > > > Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> > > > Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> > > > List help: virtio-comment-help@lists.oasis-open.org
> > > > List archive: https://lists.oasis-open.org/archives/virtio-comment/
> > > > Feedback License: https://www.oasis-open.org/who/ipr/feedback_licen=
se.pdf
> > > > List Guidelines: https://www.oasis-open.org/policies-guidelines/mai=
ling-lists
> > > > Committee: https://www.oasis-open.org/committees/virtio/
> > > > Join OASIS: https://www.oasis-open.org/join/
> > > >=20


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

