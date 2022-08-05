Return-Path: <virtio-comment-return-3320-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 86EF798641B
	for <virtio-comment@lists.oasis-open.org>; Fri,  5 Aug 2022 06:35:49 +0000 (UTC)
From: Cyril Germond <cgermond@kalray.eu>
References: <001a01d8a828$df564200$9e02c600$@kalray.eu>
 <CAJs=3_Ax+LoPT-SXbFFcRhuEQ+eyMrqxc8PMkJMQkRgt_1qqEQ@mail.gmail.com>
In-Reply-To: <CAJs=3_Ax+LoPT-SXbFFcRhuEQ+eyMrqxc8PMkJMQkRgt_1qqEQ@mail.gmail.com>
Date: Fri, 5 Aug 2022 08:35:44 +0200 (CEST)
Message-ID: <003401d8a895$974e1560$c5ea4020$@kalray.eu>
MIME-Version: 1.0
Subject: RE: [virtio-comment] [PATCH] virtio-net : Fix virtio_net_hdr struct
 size when VIRTIO_NET_F_HASH_REPORT feature is negociated.
Content-Type: text/plain; charset=utf-8
Content-Language: en-us
Content-Transfer-Encoding: quoted-printable
To: Alvaro Karsz <alvaro.karsz@solid-run.com>
Cc: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

Hello
You are right indeed - my mistake.
It might even be better (at least less error-prone)  to refer to the=20
sifeof(virtio_net_hdr) in case new fields get added in the future.

In the meantime, here is updated proposal.
BR
Cyril
---
 content.tex    | 4 ++--
 split-ring.tex | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/content.tex b/content.tex
index e863709..95b0425 100644
--- a/content.tex
+++ b/content.tex
@@ -3620,8 +3620,8 @@ \subsubsection{Setting Up Receive=20
Buffers}\label{sec:Device Types / Network Devi
 features are used, the maximum incoming packet
 will be to 65550 bytes long (the maximum size of a
 TCP or UDP packet, plus the 14 byte ethernet header), otherwise
-1514 bytes.  The 12-byte struct virtio_net_hdr is prepended to this,
-making for 65562 or 1526 bytes.
+1514 bytes.  The 12-byte (or 20-byte if VIRTIO_NET_F_HASH_REPORT feature=
=20
has been negotiated) struct virtio_net_hdr is prepended to this,
+making for 65562 or 1526 bytes (respectively 65570 and 1534 bytes if=20
VIRTIO_NET_F_HASH_REPORT has been negotiated).

 \drivernormative{\paragraph}{Setting Up Receive Buffers}{Device Types /=20
Network Device / Device Operation / Setting Up Receive Buffers}

diff --git a/split-ring.tex b/split-ring.tex
index de94038..6f93c9e 100644
--- a/split-ring.tex
+++ b/split-ring.tex
@@ -128,10 +128,10 @@ \subsection{Legacy Interfaces: A Note on Virtqueue=20
Endianness}\label{sec:Basic F
 \subsection{Message Framing}\label{sec:Basic Facilities of a Virtio Device=
=20
/ Virtqueues / Message Framing}
 The framing of messages with descriptors is
 independent of the contents of the buffers. For example, a network
-transmit buffer consists of a 12 byte header followed by the network
+transmit buffer consists of a 12 (or 20 if VIRTIO_NET_F_HASH_REPORT featur=
e=20
has been negociated) byte header followed by the network
 packet. This could be most simply placed in the descriptor table as a
-12 byte output descriptor followed by a 1514 byte output descriptor,
-but it could also consist of a single 1526 byte output descriptor in
+12 (or 20) byte output descriptor followed by a 1514 byte output=20
descriptor,
+but it could also consist of a single 1526 (or 1534) byte output descripto=
r=20
in
 the case where the header and packet are adjacent, or even three or
 more descriptors (possibly with loss of efficiency in that case).

--

-----Original Message-----
From: Alvaro Karsz <alvaro.karsz@solid-run.com>
Sent: Thursday, August 4, 2022 9:24 PM
To: Cyril Germond <cgermond@kalray.eu>
Cc: virtio-comment@lists.oasis-open.org
Subject: Re: [virtio-comment] [PATCH] virtio-net : Fix virtio_net_hdr struc=
t=20
size when VIRTIO_NET_F_HASH_REPORT feature is negociated.

Hi,
The header size is 20 bytes if VIRTIO_NET_F_HASH_REPORT is negotiated.

struct virtio_net_hdr {
        u8 flags;
        u8 gso_type;
        le16 hdr_len;
        le16 gso_size;
        le16 csum_start;
        le16 csum_offset;
        le16 num_buffers;
        le32 hash_value;        (Only if VIRTIO_NET_F_HASH_REPORT=20
negotiated)
        le16 hash_report;       (Only if VIRTIO_NET_F_HASH_REPORT=20
negotiated)
        le16 padding_reserved;  (Only if VIRTIO_NET_F_HASH_REPORT=20
negotiated) };


To declare a filtering error, please use the following link :=20
https://www.security-mail.net/reporter.php?mid=3D62c2.62ec1d06.258ee.0&r=3D=
cgermond%40kalray.eu&s=3Dalvaro.karsz%40solid-run.com&o=3DRe%3A+%5Bvirtio-c=
omment%5D+%5BPATCH%5D+virtio-net+%3A+Fix+virtio_net_hdr+struct+size+when+VI=
RTIO_NET_F_HASH_REPORT+feature+is+negociated.&verdict=3DC&c=3Ded2662797903b=
4423f528eab3fae6cc47b606e8b






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

