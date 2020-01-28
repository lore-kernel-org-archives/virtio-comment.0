Return-Path: virtio-comment-return-1035-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id EEF02985F50
	for <virtio-comment@lists.oasis-open.org>; Tue, 28 Jan 2020 14:33:33 +0000 (UTC)
From: Vitaly Mireyno <vmireyno@marvell.com>
Date: Tue, 28 Jan 2020 14:33:27 +0000
Message-ID: <BN6PR1801MB20679FE659AB57DA515F6459C50A0@BN6PR1801MB2067.namprd18.prod.outlook.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [virtio-comment] [PATCH] virtio-net: Add support for the flexible
 driver notification
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, Jason Wang <jasowang@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>


>-----Original Message-----
>From: virtio-comment@lists.oasis-open.org <virtio-comment@lists.oasis-
>open.org> On Behalf Of Michael S. Tsirkin
>Sent: Monday, 27 January, 2020 20:48
>To: Vitaly Mireyno <vmireyno@marvell.com>
>Cc: Stefan Hajnoczi <stefanha@redhat.com>; virtio-comment@lists.oasis-
>open.org; Jason Wang <jasowang@redhat.com>
>Subject: [EXT] Re: [virtio-comment] [PATCH] virtio-net: Add support for th=
e
>flexible driver notification
>
>On Mon, Jan 27, 2020 at 05:00:03PM +0000, Vitaly Mireyno wrote:
>>
>> >-----Original Message-----
>> >From: Michael S. Tsirkin <mst@redhat.com>
>> >Sent: Monday, 27 January, 2020 17:34
>> >To: Vitaly Mireyno <vmireyno@marvell.com>
>> >Cc: Stefan Hajnoczi <stefanha@redhat.com>;
>> >virtio-comment@lists.oasis- open.org; Jason Wang
>> ><jasowang@redhat.com>
>> >Subject: [EXT] Re: [virtio-comment] [PATCH] virtio-net: Add support
>> >for the flexible driver notification
>> >
>> >On Mon, Jan 27, 2020 at 12:49:48PM +0000, Vitaly Mireyno wrote:
>> >>
>> >> >-----Original Message-----
>> >> >From: Stefan Hajnoczi <stefanha@redhat.com>
>> >> >Sent: Monday, 27 January, 2020 11:50
>> >> >To: Vitaly Mireyno <vmireyno@marvell.com>
>> >> >Cc: virtio-comment@lists.oasis-open.org; Michael S. Tsirkin
>> >> ><mst@redhat.com>; Jason Wang <jasowang@redhat.com>
>> >> >Subject: [EXT] Re: [virtio-comment] [PATCH] virtio-net: Add
>> >> >support for the flexible driver notification
>> >> >
>> >> >On Sun, Jan 26, 2020 at 12:10:28PM +0000, Vitaly Mireyno wrote:
>> >> >> Currently, the driver notification (available buffer
>> >> >> notification) has a fixed
>> >> >structure.
>> >> >> If VIRTIO_F_NOTIFICATION_DATA has been negotiated, it includes:
>> >> >> vqn,
>> >> >next_off and next_wrap.
>> >> >> If notify_off_multiplier > 0, the VQ number can be derived by
>> >> >> the device
>> >> >from the Queue Notify address, so vqn may be redundant.
>> >> >>
>> >> >> Some devices benefit from receiving an additional data with
>> >> >> driver
>> >> >notifications (because of the specific hardware implementation).
>> >> >This data can optionally replace the vqn field in the driver notific=
ation
>structure.
>> >> >> In its simplest form, it would be sufficient for this data to be
>> >> >> a per-device
>> >> >constant value.
>> >> >>
>> >> >>
>> >> >> Signed-off-by: Vitaly Mireyno <vmireyno@marvell.com>
>> >> >> ---
>> >> >>  content.tex | 24 ++++++++++++++++++++++++
>> >> >>  1 file changed, 24 insertions(+)
>> >> >
>> >> >Hi Vitaly,
>> >> >Can you give a concrete example of how devices can use this feature?
>> >> >
>> >> >The reason I'm a little unsure is that the PCI capability only
>> >> >provides a single notify_data value per device.  That same value
>> >> >is then passed back to the device in the notify write.
>> >> >
>> >> >If there is just a single constant value per device, why is it
>> >> >necessary to involve the driver at all?  Doesn't the device
>> >> >already know its own magic value and it doesn't really need the
>> >> >driver to pass the
>> >value back to it?
>> >> >
>> >> >Stefan
>> >> >
>> >>
>> >> This will help HW devices that share the same memory space between
>> >virtqueue notifications and other types of notifications. The virtio
>> >driver will always use the value that will tell the HW that it's a virt=
queue
>notification.
>> >> Of course, the feature can be extended, such that there will be a
>> >> value
>> >configurable per virtqueue (which is a generalization of the vqn
>> >field). I just didn't want to complicate it further, without a real-lif=
e
>justification.
>> >
>> >I would like to see a bit more detail about these other types of
>> >notifications then.
>> >
>>
>> Other notification types could be control-plane notifications, for examp=
le
>adding MAC/VLAN filter. These types of notifications will not be sent by t=
he
>virtio driver, but rather by a vendor driver in the vDPA framework.
>> Another example is offloaded RDMA notifications.
>> The thing is that the HW doesn't have a "mode" configuration that can
>distinguish between virtio and other modes. The HW only reacts to the
>notification data, which is expected to include all the relevant informati=
on.
>
>If it's control plane, isn't the natural way to do this is by mapping a se=
parate
>range of addresses though?
>
>It might be a good idea to add extra data in the notifications but wasting=
 these
>bits on control plane things seems like a weird design choice.
>

You are right, but the control plane is only an example. It's mainly design=
ed to be used for other offloaded protocols data plane notifications, and s=
ince the HW infrastructure is already there, the control plane may as well =
use it.
Sharing the same address range helps reducing the PCI BAR size.

>
>> >
>> >>
>> >> >> diff --git a/content.tex b/content.tex index 06bb4ca..265dc12
>> >> >> 100644
>> >> >> --- a/content.tex
>> >> >> +++ b/content.tex
>> >> >> @@ -965,6 +965,9 @@ \subsubsection{Notification structure
>> >> >> layout}\label{sec:Virtio Transport Options  struct virtio_pci_noti=
fy_cap
>{
>> >> >>          struct virtio_pci_cap cap;
>> >> >>          le32 notify_off_multiplier; /* Multiplier for
>> >> >> queue_notify_off. */
>> >> >> +        le16 notify_data; /* The data to be placed in the vqn fie=
ld */
>> >> >> +        u8 notify_data_valid;
>> >> >> +        u8 padding; /* Pad to a dword */
>> >> >>  };
>> >> >>  \end{lstlisting}
>> >> >>
>> >> >> @@ -984,6 +987,9 @@ \subsubsection{Notification structure
>> >> >> layout}\label{sec:Virtio Transport Options  the same Queue
>> >> >> Notify address
>> >> >for all queues.
>> >> >>  \end{note}
>> >> >>
>> >> >> +If \field{notify_data_valid} !=3D 0, the driver will set the
>> >> >> +\field{vqn} field in the available buffer notification
>> >> >> +structure to the
>> >> >\field{notify_data} value.
>> >> >> +
>> >> >>  \devicenormative{\paragraph}{Notification capability}{Virtio
>> >> >> Transport Options / Virtio Over PCI Bus / PCI Device Layout /
>> >> >> Notification
>> >> >capability}  The device MUST present at least one notification capab=
ility.
>> >> >>
>> >> >> @@ -1020,6 +1026,12 @@ \subsubsection{Notification structure
>> >> >> layout}\label{sec:Virtio Transport Options  cap.length >=3D
>> >> >> queue_notify_off * notify_off_multiplier + 4  \end{lstlisting}
>> >> >>
>> >> >> +The device MAY set \field{notify_data_valid} to any non-zero
>> >> >> +value, to request the driver to set the \field{vqn} to the
>> >\field{notify_data} value.
>> >> >> +If the device sets \field{notify_data_valid} to a non-zero
>> >> >> +value, it MUST set \field{notify_data} to a valid value.
>> >> >> +For a normal operation, the device MUST set
>> >> >> +\field{notify_data_valid} to
>> >> >zero.
>> >> >> +
>> >> >>  \subsubsection{ISR status capability}\label{sec:Virtio
>> >> >> Transport Options / Virtio Over PCI Bus / PCI Device Layout /
>> >> >> ISR status capability}
>> >> >>
>> >> >>  The VIRTIO_PCI_CAP_ISR_CFG capability @@ -1519,6 +1531,18 @@
>> >> >> \subsubsection{Available Buffer Notifications}\label{sec:Virtio
>> >> >> Transport Option  See \ref{sec:Virtio Transport Options / Virtio
>> >> >> Over PCI Bus / PCI Device Layout / Notification capability}  for
>> >> >> how to calculate the
>> >> >Queue Notify address.
>> >> >>
>> >> >> +\drivernormative{\paragraph}{Available Buffer
>> >> >> +Notifications}{Virtio Transport Options / Virtio Over PCI Bus /
>> >> >> +PCI-specific Initialization And Device Operation / Available
>> >> >> +Buffer Notifications} If VIRTIO_F_NOTIFICATION_DATA has been
>> >> >> +negotiated, and if
>> >> >\field{notify_data_valid} !=3D 0, the driver MUST set the
>> >> >\field{vqn} field of the available buffer notification structure
>> >> >to the \field{notify_data}
>> >value.
>> >> >> +
>> >> >> +\begin{note}
>> >> >> +If \field{notify_off_multiplier} > 0, the virtqueue number can
>> >> >> +potentially be derived by the device from the Queue Notify
>> >> >> +address, so \field{vqn} may be redundant. Some devices benefit
>> >> >> +from receiving the additional data with driver notifications
>> >> >> +(because of the specific
>> >> >hardware implementation).
>> >> >> +\end{note}
>> >> >> +
>> >> >>  \subsubsection{Used Buffer Notifications}\label{sec:Virtio
>> >> >> Transport Options / Virtio Over PCI Bus / PCI-specific
>> >> >> Initialization And Device Operation / Used Buffer Notifications}
>> >> >>
>> >> >>  If a used buffer notification is necessary for a virtqueue, the
>> >> >> device would
>> >> >typically act as follows:
>> >> >> --
>> >> >>
>> >> >> This publicly archived list offers a means to provide input to
>> >> >> the OASIS Virtual I/O Device (VIRTIO) TC.
>> >> >>
>> >> >> In order to verify user consent to the Feedback License terms
>> >> >> and to minimize spam in the list archive, subscription is
>> >> >> required before posting.
>> >> >>
>> >> >> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
>> >> >> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
>> >> >> List help: virtio-comment-help@lists.oasis-open.org
>> >> >> List archive:
>> >> >> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.oasis
>> >> >> -2D
>> >> >> open.org_archives_virtio-
>> >2Dcomment_&d=3DDwIFAg&c=3DnKjWec2b6R0mOyPaz7xt
>> >> >>
>>
>>fQ&r=3DlDHJ2FW52oJ3lqqsArgFRdcevq01tbLQAw4A_NO7xgI&m=3DV_WFWAet
>W
>> >bHu0u2N
>> >> >>
>>
>>hwNHEqFKyE_y6sUMeJcHqURDeoA&s=3DxTzOJ9VTGfxRUMJf0A4unV7kB_hd
>Ml
>> >oGKMKrQ
>> >> >> hnSJKc&e=3D
>> >> >> Feedback License:
>> >> >> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__www.oasis-
>> >2Dop
>> >> >> en.org_who_ipr_feedback-
>> >5Flicense.pdf&d=3DDwIFAg&c=3DnKjWec2b6R0mOyPaz7
>> >> >>
>>
>>xtfQ&r=3DlDHJ2FW52oJ3lqqsArgFRdcevq01tbLQAw4A_NO7xgI&m=3DV_WFWAe
>t
>> >WbHu0u
>> >> >>
>>
>>2NhwNHEqFKyE_y6sUMeJcHqURDeoA&s=3DvL3tJ_XMSNJwV8gDnLft9liDG6oS
>V
>> >HLNhdd
>> >> >> MUe4ZZNI&e=3D
>> >> >> List Guidelines:
>> >> >> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__www.oasis-
>> >2Dop
>> >> >> en.org_policies-2Dguidelines_mailing-
>> >2Dlists&d=3DDwIFAg&c=3DnKjWec2b6R0
>> >> >>
>>
>>mOyPaz7xtfQ&r=3DlDHJ2FW52oJ3lqqsArgFRdcevq01tbLQAw4A_NO7xgI&m=3DV
>_
>> >WFWAe
>> >> >>
>>
>>tWbHu0u2NhwNHEqFKyE_y6sUMeJcHqURDeoA&s=3DA444Hd_Yb4aycXM5Ids
>B
>> >41E4xDmF
>> >> >> M7c3G7m8tQZCvBg&e=3D
>> >> >> Committee:
>> >> >> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__www.oasis-
>> >2Dop
>> >> >>
>>
>>en.org_committees_virtio_&d=3DDwIFAg&c=3DnKjWec2b6R0mOyPaz7xtfQ&r=3DlD
>> >HJ2
>> >> >>
>>
>>FW52oJ3lqqsArgFRdcevq01tbLQAw4A_NO7xgI&m=3DV_WFWAetWbHu0u2Nh
>w
>> >NHEqFKyE
>> >> >>
>>
>>_y6sUMeJcHqURDeoA&s=3DVA420pM5tOIIqUWH7lCMCkm2zbEbtBBOvotp9g
>W
>> >r9QM&e=3D
>> >> >> Join OASIS:
>> >> >> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__www.oasis-
>> >2Dop
>> >> >>
>>
>>en.org_join_&d=3DDwIFAg&c=3DnKjWec2b6R0mOyPaz7xtfQ&r=3DlDHJ2FW52oJ3lq
>q
>> >sAr
>> >> >>
>>
>>gFRdcevq01tbLQAw4A_NO7xgI&m=3DV_WFWAetWbHu0u2NhwNHEqFKyE_y6
>s
>> >UMeJcHqUR
>> >> >> DeoA&s=3DhVpH-MUm5o9XpvEa6BOWraE8-45dGcCFvBhGRITH_nE&e=3D
>> >> >>
>
>
>This publicly archived list offers a means to provide input to the OASIS V=
irtual
>I/O Device (VIRTIO) TC.
>
>In order to verify user consent to the Feedback License terms and to minim=
ize
>spam in the list archive, subscription is required before posting.
>
>Subscribe: virtio-comment-subscribe@lists.oasis-open.org
>Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
>List help: virtio-comment-help@lists.oasis-open.org
>List archive: https://urldefense.proofpoint.com/v2/url?u=3Dhttps-
>3A__lists.oasis-2Dopen.org_archives_virtio-
>2Dcomment_&d=3DDwIFAg&c=3DnKjWec2b6R0mOyPaz7xtfQ&r=3DlDHJ2FW52oJ3lq
>qsArgFRdcevq01tbLQAw4A_NO7xgI&m=3DZwtynokTxS59JQ6NCjDu8EpKsv1ZL-
>7pzZ7LKd4663I&s=3D6ej9qQAg0jeBVJNhzfumR3Q7eLhFNNWLpz5Zlk9KIVM&e=3D
>Feedback License: https://urldefense.proofpoint.com/v2/url?u=3Dhttps-
>3A__www.oasis-2Dopen.org_who_ipr_feedback-
>5Flicense.pdf&d=3DDwIFAg&c=3DnKjWec2b6R0mOyPaz7xtfQ&r=3DlDHJ2FW52oJ3lqq
>sArgFRdcevq01tbLQAw4A_NO7xgI&m=3DZwtynokTxS59JQ6NCjDu8EpKsv1ZL-
>7pzZ7LKd4663I&s=3Divzoy5NStwJg3_x8GzB-XNSOykSYt1Sy7Yr9w4JZ7ts&e=3D
>List Guidelines: https://urldefense.proofpoint.com/v2/url?u=3Dhttps-
>3A__www.oasis-2Dopen.org_policies-2Dguidelines_mailing-
>2Dlists&d=3DDwIFAg&c=3DnKjWec2b6R0mOyPaz7xtfQ&r=3DlDHJ2FW52oJ3lqqsArgFR
>dcevq01tbLQAw4A_NO7xgI&m=3DZwtynokTxS59JQ6NCjDu8EpKsv1ZL-
>7pzZ7LKd4663I&s=3DQi0rg76WzE90Oienx5UWxgIAWu27yejzprteF-WguqM&e=3D
>Committee: https://urldefense.proofpoint.com/v2/url?u=3Dhttps-
>3A__www.oasis-
>2Dopen.org_committees_virtio_&d=3DDwIFAg&c=3DnKjWec2b6R0mOyPaz7xtfQ&
>r=3DlDHJ2FW52oJ3lqqsArgFRdcevq01tbLQAw4A_NO7xgI&m=3DZwtynokTxS59JQ6
>NCjDu8EpKsv1ZL-
>7pzZ7LKd4663I&s=3DN9LxnUJBE6Ev1UGHjD8vbFhIWML8NF5PnVVS7N2KYSE&e=3D
>Join OASIS: https://urldefense.proofpoint.com/v2/url?u=3Dhttps-
>3A__www.oasis-
>2Dopen.org_join_&d=3DDwIFAg&c=3DnKjWec2b6R0mOyPaz7xtfQ&r=3DlDHJ2FW52o
>J3lqqsArgFRdcevq01tbLQAw4A_NO7xgI&m=3DZwtynokTxS59JQ6NCjDu8EpKsv1
>ZL-
>7pzZ7LKd4663I&s=3D1euFBF86OgTr6gTGn0dUY8oY8bh6DqUoWGX4ag2Kcs0&e=3D


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

