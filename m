Return-Path: virtio-comment-return-1095-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E6248985C01
	for <virtio-comment@lists.oasis-open.org>; Mon, 24 Feb 2020 08:15:14 +0000 (UTC)
From: Vitaly Mireyno <vmireyno@marvell.com>
Date: Mon, 24 Feb 2020 08:15:02 +0000
Message-ID: <BN6PR1801MB206760610CCB18D39E8FA71FC5EC0@BN6PR1801MB2067.namprd18.prod.outlook.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: [virtio-comment] [PATCH] virtio-net: Fix VIRTIO_NET_F_GUEST_HDRLEN feature definition.
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
To: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

Fix driver and device requirements with regards to the VIRTIO_NET_F_GUEST_H=
DRLEN feature - 'hdr_len' must be accurate only for TSO/UFO packets.


Signed-off-by: Vitaly Mireyno <vmireyno@marvell.com>
---
 content.tex | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/content.tex b/content.tex
index b91a132..2f71f8f 100644
--- a/content.tex
+++ b/content.tex
@@ -3354,10 +3354,12 @@ \subsubsection{Packet Transmission}\label{sec:Devic=
e Types / Network Device / De
 been negotiated:
 \begin{itemize}
 \item If the VIRTIO_NET_F_GUEST_HDRLEN feature has been negotiated,
+=09and \field{gso_type} differs from VIRTIO_NET_HDR_GSO_NONE,
 =09the driver MUST set \field{hdr_len} to a value equal to the length
 =09of the headers, including the transport header.
=20
 \item If the VIRTIO_NET_F_GUEST_HDRLEN feature has not been negotiated,
+=09or \field{gso_type} is VIRTIO_NET_HDR_GSO_NONE,
 =09the driver SHOULD set \field{hdr_len} to a value
 =09not less than the length of the headers, including the transport
 =09header.
@@ -3379,6 +3381,7 @@ \subsubsection{Packet Transmission}\label{sec:Device =
Types / Network Device / De
 been negotiated:
 \begin{itemize}
 \item If the VIRTIO_NET_F_GUEST_HDRLEN feature has been negotiated,
+=09and \field{gso_type} differs from VIRTIO_NET_HDR_GSO_NONE,
 =09the device MAY use \field{hdr_len} as the transport header size.
=20
 =09\begin{note}
@@ -3387,6 +3390,7 @@ \subsubsection{Packet Transmission}\label{sec:Device =
Types / Network Device / De
 =09\end{note}
=20
 \item If the VIRTIO_NET_F_GUEST_HDRLEN feature has not been negotiated,
+=09or \field{gso_type} is VIRTIO_NET_HDR_GSO_NONE,
 =09the device MAY use \field{hdr_len} only as a hint about the
 =09transport header size.
 =09The device MUST NOT rely on \field{hdr_len} to be correct.
--

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

