Return-Path: virtio-comment-return-918-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C8DFD985CD2
	for <virtio-comment@lists.oasis-open.org>; Sun, 17 Nov 2019 06:24:53 +0000 (UTC)
From: Vitaly Mireyno <vmireyno@marvell.com>
Date: Sun, 17 Nov 2019 06:24:46 +0000
Message-ID: <BN6PR1801MB2067CD889CB99CF85BBE3299C5720@BN6PR1801MB2067.namprd18.prod.outlook.com>
References: <BN6PR1801MB20677716657B6B2E7992C1A8C57E0@BN6PR1801MB2067.namprd18.prod.outlook.com>
In-Reply-To: <BN6PR1801MB20677716657B6B2E7992C1A8C57E0@BN6PR1801MB2067.namprd18.prod.outlook.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: [virtio-comment] [PATCH v3] virtio-net: Add support for correct hdr_len field.
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
To: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/57

>-----Original Message-----
>From: virtio-comment@lists.oasis-open.org <virtio-comment@lists.oasis-
>open.org> On Behalf Of Vitaly Mireyno
>Sent: Tuesday, 5 November, 2019 17:26
>To: virtio-comment@lists.oasis-open.org
>Cc: Michael S. Tsirkin <mst@redhat.com>; Jason Wang
><jasowang@redhat.com>
>Subject: [EXT] [virtio-comment] [PATCH v3] virtio-net: Add support for cor=
rect
>hdr_len field.
>
>Incorporated more v1 comments
>
>Changes from v2:
> * Added device implementation note for using hdr_len
>
>Signed-off-by: Vitaly Mireyno <vmireyno@marvell.com>
>---
> content.tex | 56 +++++++++++++++++++++++++++++++++++++++++++-----
>-----
> 1 file changed, 46 insertions(+), 10 deletions(-)
>
>diff --git a/content.tex b/content.tex
>index b1ea9b9..5d3f865 100644
>--- a/content.tex
>+++ b/content.tex
>@@ -2811,6 +2811,9 @@ \subsection{Feature bits}\label{sec:Device Types /
>Network Device / Feature bits  \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)]
>Set MAC address through control
>     channel.
>
>+\item[VIRTIO_NET_F_GUEST_HDRLEN(59)] Driver can provide the exact
>\field{hdr_len}
>+    value. Device benefits from knowing the exact header length.
>+
> \item[VIRTIO_NET_F_RSC_EXT(61)] Device can process duplicated ACKs
>     and report number of coalesced segments and duplicated ACKs
>
>@@ -3095,12 +3098,21 @@ \subsubsection{Packet
>Transmission}\label{sec:Device Types / Network Device / De
>   into smaller packets. The other gso fields are set:
>
>   \begin{itemize}
>-  \item \field{hdr_len} is a hint to the device as to how much of the hea=
der
>+  \item If the VIRTIO_NET_F_GUEST_HDRLEN feature has been negotiated,
>+    \field{hdr_len} indicates the header length that needs to be replicat=
ed
>+    for each packet. It's a number of bytes from beginning of the packet
>+    to beginning of the transport payload.
>+    Otherwise, if the VIRTIO_NET_F_GUEST_HDRLEN feature has not been
>negotiated,
>+    \field{hdr_len} is a hint to the device as to how much of the
>+ header
>     needs to be kept to copy into each packet, usually set to the
>     length of the headers, including the transport header\footnote{Due to
>various bugs in implementations, this field is not useful  as a guarantee =
of the
>transport header size.
> }.
>
>+  \begin{note}
>+  Some devices benefit from knowledge of the exact header length.
>+  \end{note}
>+
>   \item \field{gso_size} is the maximum size of each packet beyond that
>     header (ie. MSS).
>
>@@ -3173,9 +3185,20 @@ \subsubsection{Packet
>Transmission}\label{sec:Device Types / Network Device / De  desired MSS.
>
> If one of the VIRTIO_NET_F_HOST_TSO4, TSO6 or UFO options have -been
>negotiated, the driver SHOULD set \field{hdr_len} to a value -not less tha=
n the
>length of the headers, including the transport -header.
>+been negotiated:
>+\begin{itemize}
>+\item If the VIRTIO_NET_F_GUEST_HDRLEN feature has been negotiated,
>+=09the driver MUST set \field{hdr_len} to a value equal to the length
>+=09of the headers, including the transport header.
>+
>+\item If the VIRTIO_NET_F_GUEST_HDRLEN feature has not been
>negotiated,
>+=09the driver SHOULD set \field{hdr_len} to a value
>+=09not less than the length of the headers, including the transport
>+=09header.
>+\end{itemize}
>+
>+The driver SHOULD accept the VIRTIO_NET_F_GUEST_HDRLEN feature if it
>+has been offered, and if it's able to provide the exact header length.
>
> The driver MUST NOT set the VIRTIO_NET_HDR_F_DATA_VALID and
>VIRTIO_NET_HDR_F_RSC_INFO bits in \field{flags}.
>@@ -3187,12 +3210,25 @@ \subsubsection{Packet
>Transmission}\label{sec:Device Types / Network Device / De  device MUST
>NOT use the \field{csum_start} and \field{csum_offset}.
>
> If one of the VIRTIO_NET_F_HOST_TSO4, TSO6 or UFO options have -been
>negotiated, the device MAY use \field{hdr_len} only as a hint about the -
>transport header size.
>-The device MUST NOT rely on \field{hdr_len} to be correct.
>-\begin{note}
>-This is due to various bugs in implementations.
>-\end{note}
>+been negotiated:
>+\begin{itemize}
>+\item If the VIRTIO_NET_F_GUEST_HDRLEN feature has been negotiated,
>+=09the device MAY use \field{hdr_len} as the transport header size.
>+
>+=09\begin{note}
>+=09Caution should be taken by the implementation so as to prevent
>+=09malicious driver from attacking the device by setting incorrect hdr_le=
n.
>+=09\end{note}
>+
>+\item If the VIRTIO_NET_F_GUEST_HDRLEN feature has not been
>negotiated,
>+=09the device MAY use \field{hdr_len} only as a hint about the
>+=09transport header size.
>+=09The device MUST NOT rely on \field{hdr_len} to be correct.
>+
>+=09\begin{note}
>+=09This is due to various bugs in implementations.
>+=09\end{note}
>+\end{itemize}
>
> If VIRTIO_NET_HDR_F_NEEDS_CSUM is not set, the device MUST NOT  rely
>on the packet checksum being correct.
>--
>
>This publicly archived list offers a means to provide input to theOASIS Vi=
rtual
>I/O Device (VIRTIO) TC.In order to verify user consent to the Feedback Lic=
ense
>terms andto minimize spam in the list archive, subscription is requiredbef=
ore
>posting.Subscribe: virtio-comment-subscribe@lists.oasis-
>open.orgUnsubscribe: virtio-comment-unsubscribe@lists.oasis-open.orgList
>help: virtio-comment-help@lists.oasis-open.orgList archive:
>https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.oasis-
>2Dopen.org_archives_virtio-
>2Dcomment_&d=3DDwIFAg&c=3DnKjWec2b6R0mOyPaz7xtfQ&r=3DlDHJ2FW52oJ3lq
>qsArgFRdcevq01tbLQAw4A_NO7xgI&m=3DlWqsPbOUMgzkEVyF16L3g079hplmK
>1phL1e6LJfAuy4&s=3DDSMXwXJqsTFsEujJH_jBRVoynoKrcp44osbLODkEc_I&e=3D
>Feedback License: https://urldefense.proofpoint.com/v2/url?u=3Dhttps-
>3A__www.oasis-2Dopen.org_who_ipr_feedback-
>5Flicense.pdf&d=3DDwIFAg&c=3DnKjWec2b6R0mOyPaz7xtfQ&r=3DlDHJ2FW52oJ3lqq
>sArgFRdcevq01tbLQAw4A_NO7xgI&m=3DlWqsPbOUMgzkEVyF16L3g079hplmK1
>phL1e6LJfAuy4&s=3D3slcwaEeqEevZXayoGcRCvapa4lifnZRMDbgpjb9PYI&e=3D List
>Guidelines: https://urldefense.proofpoint.com/v2/url?u=3Dhttps-
>3A__www.oasis-2Dopen.org_policies-2Dguidelines_mailing-
>2Dlists&d=3DDwIFAg&c=3DnKjWec2b6R0mOyPaz7xtfQ&r=3DlDHJ2FW52oJ3lqqsArgFR
>dcevq01tbLQAw4A_NO7xgI&m=3DlWqsPbOUMgzkEVyF16L3g079hplmK1phL1e6
>LJfAuy4&s=3DAVsGR-ggaGUy0qsBz5HWmNguI4IVOHfF2y3TDaIZbXw&e=3D
>Committee: https://urldefense.proofpoint.com/v2/url?u=3Dhttps-
>3A__www.oasis-
>2Dopen.org_committees_virtio_&d=3DDwIFAg&c=3DnKjWec2b6R0mOyPaz7xtfQ&
>r=3DlDHJ2FW52oJ3lqqsArgFRdcevq01tbLQAw4A_NO7xgI&m=3DlWqsPbOUMgzkEV
>yF16L3g079hplmK1phL1e6LJfAuy4&s=3DKbIcN3spGyCBBx1CR4KU94G4XMWnL7
>Cc1t_iZu12VeQ&e=3D Join OASIS:
>https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__www.oasis-
>2Dopen.org_join_&d=3DDwIFAg&c=3DnKjWec2b6R0mOyPaz7xtfQ&r=3DlDHJ2FW52o
>J3lqqsArgFRdcevq01tbLQAw4A_NO7xgI&m=3DlWqsPbOUMgzkEVyF16L3g079hpl
>mK1phL1e6LJfAuy4&s=3DIEdPsXzJLvjJuJJ3KfKVQBZvyIOsBC6qKuJQp9evAwM&e
>=3D


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

