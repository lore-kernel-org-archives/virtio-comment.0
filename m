Return-Path: virtio-comment-return-1144-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 67C6A985D19
	for <virtio-comment@lists.oasis-open.org>; Tue, 17 Mar 2020 18:03:56 +0000 (UTC)
From: Vitaly Mireyno <vmireyno@marvell.com>
Date: Tue, 17 Mar 2020 18:03:49 +0000
Message-ID: <BN6PR1801MB2067BA854A6F0E606A0AD0D1C5F60@BN6PR1801MB2067.namprd18.prod.outlook.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [virtio-comment] [PATCH v5] virtio-net: Add support for the
 flexible driver notification structure
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
To: Cornelia Huck <cohuck@redhat.com>, Halil Pasic <pasic@linux.ibm.com>
Cc: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, Ariel Elior <aelior@marvell.com>
List-ID: <virtio-comment.lists.oasis-open.org>

Ok, will try to fix all the comments and post a new patch.

Few comments inline.

>-----Original Message-----
>From: Cornelia Huck <cohuck@redhat.com>
>Sent: Monday, 16 March, 2020 12:15
>To: Halil Pasic <pasic@linux.ibm.com>
>Cc: Vitaly Mireyno <vmireyno@marvell.com>; virtio-comment@lists.oasis-open=
.org; Michael S. Tsirkin
><mst@redhat.com>; Jason Wang <jasowang@redhat.com>; Ariel Elior <aelior@ma=
rvell.com>
>Subject: [EXT] Re: [virtio-comment] [PATCH v5] virtio-net: Add support for=
 the flexible driver
>notification structure
>
>External Email
>
>----------------------------------------------------------------------
>[Was on PTO; I already commented on the ballot for this issue, but let me =
be more verbose here.]
>
>On Wed, 11 Mar 2020 18:43:41 +0100
>Halil Pasic <pasic@linux.ibm.com> wrote:
>
>> On Tue, 10 Mar 2020 08:42:14 +0000
>> Vitaly Mireyno <vmireyno@marvell.com> wrote:
>>
>> > Currently, the driver notification (available buffer notification) has=
 a fixed structure.
>> > If VIRTIO_F_NOTIFICATION_DATA has been negotiated, it includes: vqn, n=
ext_off and next_wrap.
>> > If notify_off_multiplier > 0, the VQ number can be derived by the devi=
ce from the Queue Notify
>address, so vqn may be redundant.
>>
>> May or may not be redundant depending on what transport is used! For
>> the Channel I/O transport it is not redundant, because there is no
>> such thing like Qeueue Notify address or notify_off_multiplier.
>>

Right. This is PCI specific.

>> We do have space left in GPR3 which host the notification data, but
>> for the VIRTIO_NET_F_NOTIF_EXTRA_DATA feature to work with ccw, we
>> would need to introduce yet another notification data format.
>>
>> For that silicone whose features Vitaly is trying to bring into the
>> spec, ccw is very unlikely to matter. But then there was a discussion
>> on other future uses, which make me worry.
>>
>> BTW the normative statements for VIRTIO_NET_F_NOTIF_EXTRA_DATA seem to
>> be all PCI specific. How are other transports supposed to react? Not
>> accept the feature?
>>
>> Conny, what is your opinion on this new feature and mechanism?
>
>
>Agreed, we should not hide the definition of the feature in the pci sectio=
n. What we can have is a
>transport-specific format defined here, and a definition for the feature r=
eferring to transport-specific
>details.
>
>>
>> Actually my knowledge of PCI is not sufficient to understand why would
>> a device play this strange cookie game (making the driver send some
>> device specific constant for each notification). But that does not matte=
r.
>>
>> I guess there will be kernel patches for this. Or are there some
>> already? Can the implementer please put me in cc?
>>

The plan is that kernel patches will follow the spec change. Will keep you =
in the loop.

>> Regards,
>> Halil
>>
>> >
>> > Some devices benefit from receiving an additional data with driver not=
ifications. This data can
>optionally replace the vqn field in the driver notification structure.
>> > In its simplest form, it would be sufficient for this data to be a per=
-device constant value.
>> >
>> > Changes from v4 - articles fix-up.
>> >
>> > Signed-off-by: Vitaly Mireyno <vmireyno@marvell.com>
>> > ---
>> >  content.tex | 33 +++++++++++++++++++++++++++++++++
>> >  1 file changed, 33 insertions(+)
>> >
>> > diff --git a/content.tex b/content.tex index b91a132..08e6111 100644
>> > --- a/content.tex
>> > +++ b/content.tex
>> > @@ -965,6 +965,8 @@ \subsubsection{Notification structure
>> > layout}\label{sec:Virtio Transport Options  struct virtio_pci_notify_c=
ap {
>> >          struct virtio_pci_cap cap;
>> >          le32 notify_off_multiplier; /* Multiplier for
>> > queue_notify_off. */
>> > +        le16 notify_data; /* Data to be placed in the vqn field */
>> > +        le16 padding; /* Pad to a dword */
>> >  };
>> >  \end{lstlisting}
>> >
>> > @@ -984,6 +986,21 @@ \subsubsection{Notification structure
>> > layout}\label{sec:Virtio Transport Options  the same Queue Notify addr=
ess for all queues.
>> >  \end{note}
>> >
>> > +\field{notify_data} is the data that the driver will set in the
>> > +\field{vqn} field in the available buffer notification, if
>> > +VIRTIO_NET_F_NOTIF_EXTRA_DATA has been negotiated.
>
>Referring to the feature here is fine.
>
>> > +
>> > +\begin{note}
>> > +If \field{notify_off_multiplier} > 0, the virtqueue number can
>> > +potentially be derived by the device from the Queue Notify address,
>> > +so \field{vqn} may be redundant. Some devices benefit from
>> > +receiving additional data with driver notifications. An example
>> > +could be a hardware device implementing multiple protocols (with
>> > +virtio being one of them), so the extra notification data could serve=
 as a notification type indication
>or a protocol indication.
>> > +Another example could be using shared hardware memory space for
>> > +driver notifications for multiple virtio devices in a trusted environ=
ment.
>> > +\end{note}
>
>This seems like a mix of generic and pci-specific considerations.
>
>> > +
>> >  \devicenormative{\paragraph}{Notification capability}{Virtio
>> > Transport Options / Virtio Over PCI Bus / PCI Device Layout / Notifica=
tion capability}  The device
>MUST present at least one notification capability.
>> >
>> > @@ -1020,6 +1037,9 @@ \subsubsection{Notification structure
>> > layout}\label{sec:Virtio Transport Options  cap.length >=3D
>> > queue_notify_off * notify_off_multiplier + 4  \end{lstlisting}
>> >
>> > +If the device offers VIRTIO_NET_F_NOTIF_EXTRA_DATA, it MUST set
>> > +\field{notify_off_multiplier} > 0 in at least one capability.
>
>Also pci-specific, so also fine.
>
>> > +
>> >  \subsubsection{ISR status capability}\label{sec:Virtio Transport
>> > Options / Virtio Over PCI Bus / PCI Device Layout / ISR status
>> > capability}
>> >
>> >  The VIRTIO_PCI_CAP_ISR_CFG capability @@ -1519,6 +1539,14 @@
>> > \subsubsection{Available Buffer Notifications}\label{sec:Virtio
>> > Transport Option  See \ref{sec:Virtio Transport Options / Virtio
>> > Over PCI Bus / PCI Device Layout / Notification capability}  for how t=
o calculate the Queue Notify
>address.
>> >
>> > +\drivernormative{\paragraph}{Available Buffer Notifications}{Virtio
>> > +Transport Options / Virtio Over PCI Bus / PCI-specific
>> > +Initialization And Device Operation / Available Buffer Notifications}=
 The driver SHOULD accept the
>VIRTIO_NET_F_NOTIF_EXTRA_DATA feature if it has been offered.
>
>This should go into a generic section. We can assume that the feature is a=
vailable for both device and
>driver for a given transport.
>
>> > +
>> > +If VIRTIO_NET_F_NOTIF_EXTRA_DATA has been negotiated and
>> > +\field{notify_off_multiplier} > 0, the driver MUST set the
>> > +\field{vqn} field of the available buffer notification structure to t=
he \field{notify_data} value.
>
>This seems fine to keep here.
>
>> > +
>> >  \subsubsection{Used Buffer Notifications}\label{sec:Virtio
>> > Transport Options / Virtio Over PCI Bus / PCI-specific
>> > Initialization And Device Operation / Used Buffer Notifications}
>> >
>> >  If a used buffer notification is necessary for a virtqueue, the devic=
e would typically act as follows:
>> > @@ -2895,6 +2923,10 @@ \subsection{Feature bits}\label{sec:Device
>> > Types / Network Device / Feature bits  \item[VIRTIO_NET_F_CTRL_MAC_ADD=
R(23)] Set MAC
>address through control
>> >      channel.
>> >
>> > +\item[VIRTIO_NET_F_NOTIF_EXTRA_DATA(57)] Driver provides extra data w=
ith
>> > +    available buffer notifications, to aid in notification processing=
 by the
>> > +    device.
>
>This seems fine.
>
>> > +
>> >  \item[VIRTIO_NET_F_GUEST_HDRLEN(59)] Driver can provide the exact \fi=
eld{hdr_len}
>> >      value. Device benefits from knowing the exact header length.
>> >
>> > @@ -2934,6 +2966,7 @@ \subsubsection{Feature bit
>> > requirements}\label{sec:Device Types / Network Device  \item[VIRTIO_NE=
T_F_CTRL_MAC_ADDR]
>Requires VIRTIO_NET_F_CTRL_VQ.
>> >  \item[VIRTIO_NET_F_RSC_EXT] Requires VIRTIO_NET_F_HOST_TSO4 or
>VIRTIO_NET_F_HOST_TSO6.
>> >  \item[VIRTIO_NET_F_RSS] Requires VIRTIO_NET_F_CTRL_VQ.
>> > +\item[VIRTIO_NET_F_NOTIF_EXTRA_DATA] Requires VIRTIO_F_NOTIFICATION_D=
ATA.
>> >  \end{description}
>> >
>> >  \subsubsection{Legacy Interface: Feature bits}\label{sec:Device
>> > Types / Network Device / Feature bits / Legacy Interface: Feature
>> > bits}
>
>The new feature needs more discussion in the networking device section.
>Probably something like:
>- Describe the general mechanism (send some extra data with
>  notifications); the 'multiple protocols' example from the note would
>  make sense here.
>- Mention that the actual layout of the notification data is
>  transport-specific. (I think it should also be optional for a
>  transport to support this feature.)
>- Add a normative section that the driver SHOULD accept the feature
>  (moved from the pci section).
>
>Does that make sense?


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

