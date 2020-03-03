Return-Path: virtio-comment-return-1116-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7C5D6985F11
	for <virtio-comment@lists.oasis-open.org>; Tue,  3 Mar 2020 15:13:55 +0000 (UTC)
From: Vitaly Mireyno <vmireyno@marvell.com>
Date: Tue, 3 Mar 2020 15:13:48 +0000
Message-ID: <BN6PR1801MB206749FB666EB02B4BF1F88EC5E40@BN6PR1801MB2067.namprd18.prod.outlook.com>
References: <BN6PR1801MB206760610CCB18D39E8FA71FC5EC0@BN6PR1801MB2067.namprd18.prod.outlook.com>
In-Reply-To: <BN6PR1801MB206760610CCB18D39E8FA71FC5EC0@BN6PR1801MB2067.namprd18.prod.outlook.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: [virtio-comment] RE: [PATCH] virtio-net: Fix VIRTIO_NET_F_GUEST_HDRLEN feature
 definition.
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
To: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

Requesting the TC vote.
Fixes: https://github.com/oasis-tcs/virtio-spec/issues/72

>-----Original Message-----
>From: virtio-comment@lists.oasis-open.org <virtio-comment@lists.oasis-open=
.org> On Behalf Of Vitaly
>Mireyno
>Sent: Monday, 24 February, 2020 10:15
>To: virtio-comment@lists.oasis-open.org
>Cc: Michael S. Tsirkin <mst@redhat.com>; Jason Wang <jasowang@redhat.com>
>Subject: [EXT] [virtio-comment] [PATCH] virtio-net: Fix VIRTIO_NET_F_GUEST=
_HDRLEN feature
>definition.
>
>External Email
>
>----------------------------------------------------------------------
>Fix driver and device requirements with regards to the VIRTIO_NET_F_GUEST_=
HDRLEN feature -
>'hdr_len' must be accurate only for TSO/UFO packets.
>
>
>Signed-off-by: Vitaly Mireyno <vmireyno@marvell.com>
>---
> content.tex | 4 ++++
> 1 file changed, 4 insertions(+)
>
>diff --git a/content.tex b/content.tex
>index b91a132..2f71f8f 100644
>--- a/content.tex
>+++ b/content.tex
>@@ -3354,10 +3354,12 @@ \subsubsection{Packet Transmission}\label{sec:Devi=
ce Types / Network
>Device / De  been negotiated:
> \begin{itemize}
> \item If the VIRTIO_NET_F_GUEST_HDRLEN feature has been negotiated,
>+=09and \field{gso_type} differs from VIRTIO_NET_HDR_GSO_NONE,
> =09the driver MUST set \field{hdr_len} to a value equal to the length
> =09of the headers, including the transport header.
>
> \item If the VIRTIO_NET_F_GUEST_HDRLEN feature has not been negotiated,
>+=09or \field{gso_type} is VIRTIO_NET_HDR_GSO_NONE,
> =09the driver SHOULD set \field{hdr_len} to a value
> =09not less than the length of the headers, including the transport
> =09header.
>@@ -3379,6 +3381,7 @@ \subsubsection{Packet Transmission}\label{sec:Device=
 Types / Network
>Device / De  been negotiated:
> \begin{itemize}
> \item If the VIRTIO_NET_F_GUEST_HDRLEN feature has been negotiated,
>+=09and \field{gso_type} differs from VIRTIO_NET_HDR_GSO_NONE,
> =09the device MAY use \field{hdr_len} as the transport header size.
>
> =09\begin{note}
>@@ -3387,6 +3390,7 @@ \subsubsection{Packet Transmission}\label{sec:Device=
 Types / Network
>Device / De
> =09\end{note}
>
> \item If the VIRTIO_NET_F_GUEST_HDRLEN feature has not been negotiated,
>+=09or \field{gso_type} is VIRTIO_NET_HDR_GSO_NONE,
> =09the device MAY use \field{hdr_len} only as a hint about the
> =09transport header size.
> =09The device MUST NOT rely on \field{hdr_len} to be correct.
>--
>
>This publicly archived list offers a means to provide input to the OASIS V=
irtual I/O Device (VIRTIO) TC.
>
>In order to verify user consent to the Feedback License terms and to minim=
ize spam in the list archive,
>subscription is required before posting.
>
>Subscribe: virtio-comment-subscribe@lists.oasis-open.org
>Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
>List help: virtio-comment-help@lists.oasis-open.org
>List archive: https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists=
.oasis-
>2Dopen.org_archives_virtio-
>2Dcomment_&d=3DDwIFAg&c=3DnKjWec2b6R0mOyPaz7xtfQ&r=3DlDHJ2FW52oJ3lqqsArgFR=
dcevq01tbLQAw4
>A_NO7xgI&m=3Ds2vGdCsfEuMUdZHoeL9LV3F8NllsMi5EEA7xgPtCySY&s=3DZtW2HQ5wF6tUD=
mDeIim_cKxjP
>jZnmNjoQGjuQvwIlOk&e=3D
>Feedback License: https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__w=
ww.oasis-
>2Dopen.org_who_ipr_feedback-
>5Flicense.pdf&d=3DDwIFAg&c=3DnKjWec2b6R0mOyPaz7xtfQ&r=3DlDHJ2FW52oJ3lqqsAr=
gFRdcevq01tbLQAw4
>A_NO7xgI&m=3Ds2vGdCsfEuMUdZHoeL9LV3F8NllsMi5EEA7xgPtCySY&s=3DAZTZGyXdBgyRh=
FsqZ1-
>kjNGh8AbJO2BIXii6q04saHE&e=3D
>List Guidelines: https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__ww=
w.oasis-
>2Dopen.org_policies-2Dguidelines_mailing-
>2Dlists&d=3DDwIFAg&c=3DnKjWec2b6R0mOyPaz7xtfQ&r=3DlDHJ2FW52oJ3lqqsArgFRdce=
vq01tbLQAw4A_NO7
>xgI&m=3Ds2vGdCsfEuMUdZHoeL9LV3F8NllsMi5EEA7xgPtCySY&s=3DX2nk_0Ai93ogh9npaB=
pUQ892KeTF4ybf
>eVoPZF7FilI&e=3D
>Committee: https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__www.oasi=
s-
>2Dopen.org_committees_virtio_&d=3DDwIFAg&c=3DnKjWec2b6R0mOyPaz7xtfQ&r=3DlD=
HJ2FW52oJ3lqqsArgF
>Rdcevq01tbLQAw4A_NO7xgI&m=3Ds2vGdCsfEuMUdZHoeL9LV3F8NllsMi5EEA7xgPtCySY&s=
=3DTvkAqDitaPL
>AsrovTf56zDSopHU-8oZLYg2cvJOTaUk&e=3D
>Join OASIS: https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__www.oas=
is-
>2Dopen.org_join_&d=3DDwIFAg&c=3DnKjWec2b6R0mOyPaz7xtfQ&r=3DlDHJ2FW52oJ3lqq=
sArgFRdcevq01tbLQ
>Aw4A_NO7xgI&m=3Ds2vGdCsfEuMUdZHoeL9LV3F8NllsMi5EEA7xgPtCySY&s=3DKy2KClCJih=
mZaDJ4bf8vVt--
>cL5YSDkVEaTUoGsySa0&e=3D


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

