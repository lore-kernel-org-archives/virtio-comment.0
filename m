Return-Path: virtio-comment-return-981-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B9FF9986039
	for <virtio-comment@lists.oasis-open.org>; Tue,  3 Dec 2019 18:32:21 +0000 (UTC)
From: Yuri Benditovich <yuri.benditovich@daynix.com>
Date: Tue,  3 Dec 2019 20:32:12 +0200
Message-Id: <20191203183212.1721642-1-yuri.benditovich@daynix.com>
Subject: [virtio-comment] [PATCH] virtio-net: define feature of per-packet RSS hash delivery
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
To: virtio-comment@lists.oasis-open.org, mst@redhat.com
List-ID: <virtio-comment.lists.oasis-open.org>

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/66
Conditional extending of virtio header structure to deliver
packet's hash and hash type used for calculation.

Signed-off-by: Yuri Benditovich <yuri.benditovich@daynix.com>
---
 content.tex | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/content.tex b/content.tex
index 01be7df..44975e4 100644
--- a/content.tex
+++ b/content.tex
@@ -2811,6 +2811,9 @@ \subsection{Feature bits}\label{sec:Device Types / Ne=
twork Device / Feature bits
 \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)] Set MAC address through control
     channel.
=20
+\item[VIRTIO_NET_F_HASH_REPORT(58)] Device can report per-packet hash valu=
e
+    and a type of calculated hash
+
 \item[VIRTIO_NET_F_RSS(60)] Device supports RSS (receive-side scaling)
     with Toeplitz hash calculation and configurable hash parameters for re=
ceive steering
=20
@@ -2844,6 +2847,8 @@ \subsubsection{Feature bit requirements}\label{sec:De=
vice Types / Network Device
 \item[VIRTIO_NET_F_CTRL_MAC_ADDR] Requires VIRTIO_NET_F_CTRL_VQ.
 \item[VIRTIO_NET_F_RSC_EXT] Requires VIRTIO_NET_F_HOST_TSO4 or VIRTIO_NET_=
F_HOST_TSO6.
 \item[VIRTIO_NET_F_RSS] Requires VIRTIO_NET_F_CTRL_VQ.
+\item[VIRTIO_NET_F_HASH_REPORT] Requires VIRTIO_NET_F_RSS.
+
 \end{description}
=20
 \subsubsection{Legacy Interface: Feature bits}\label{sec:Device Types / Ne=
twork Device / Feature bits / Legacy Interface: Feature bits}
@@ -3071,6 +3076,8 @@ \subsection{Device Operation}\label{sec:Device Types =
/ Network Device / Device O
         le16 csum_start;
         le16 csum_offset;
         le16 num_buffers;
+        le32 hash_value; (Only if VIRTIO_NET_F_HASH_REPORT negotiated)
+        le16 hash_type; (Only if VIRTIO_NET_F_HASH_REPORT negotiated)
 };
 \end{lstlisting}
=20
@@ -3330,6 +3337,15 @@ \subsubsection{Processing of Incoming Packets}\label=
{sec:Device Types / Network
   set: if so, device has validated the packet checksum.
   In case of multiple encapsulated protocols, one level of checksums
   has been validated.
+\item If VIRTIO_NET_F_HASH_REPORT was negotiated and a device has calculat=
ed
+  a hash for the packet, \field{hash_value} contains calculated hash value=
 and
+  \field{hash_type} contains exact hash type.
+
+  If the hash was not calculated, \field{hash_type} contains zero.
+
+  For defined hash types and their meaning, see \ref{sec:Device Types / Ne=
twork Device / Device configuration layout / RSS}.
+
+  For the procedure of hash calculation, see \ref{sec:Device Types / Netwo=
rk Device / Device Operation / Control Virtqueue / Receive-side scaling (RS=
S) / RSS hash types}.
 \end{enumerate}
=20
 Additionally, VIRTIO_NET_F_GUEST_CSUM, TSO4, TSO6, UDP and ECN
@@ -3909,6 +3925,14 @@ \subsubsection{Control Virtqueue}\label{sec:Device T=
ypes / Network Device / Devi
 \item Else skip IPv6 extension headers and calculate the hash as defined a=
bove for IPv6 packet without extension headers
 \end{itemize}
=20
+If VIRTIO_NET_F_HASH_REPORT was negotiated, the device reports calculated =
hash information in fields of virtio_net_hdr as follows:
+
+Exact hash type is populated in \field{hash_type}
+
+Hash value is populated in \field{hash_value}
+
+If, due to any reason, the device did not calculate the hash, it sets \fie=
ld{hash_type} to zero.
+
 \drivernormative{\subparagraph}{Setting RSS parameters}{Device Types / Net=
work Device / Device Operation / Control Virtqueue / Receive-side scaling (=
RSS) }
=20
 A driver MUST NOT send the VIRTIO_NET_CTRL_MQ_RSS_CONFIG command if the fe=
ature VIRTIO_NET_F_RSS has not been negotiated.
--=20
2.17.2


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

