Return-Path: virtio-comment-return-927-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C5ED0985E73
	for <virtio-comment@lists.oasis-open.org>; Wed, 20 Nov 2019 13:24:12 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
Date: Wed, 20 Nov 2019 14:23:59 +0100
Message-Id: <20191120132359.6626-1-cohuck@redhat.com>
MIME-Version: 1.0
Subject: [virtio-comment] [PATCH v2] virtio-net: add missing articles for new hdr_len feature
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
To: virtio-comment@lists.oasis-open.org
Cc: Vitaly Mireyno <vmireyno@marvell.com>, "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, Cornelia Huck <cohuck@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

And tweak a sentence slightly.

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---

v1->v2:
- add one more tweak [Stefan]

Note: I have not added definite articles to the feature description; _all_
features for virtio-net are described in that way, and we should add them
in one go should we decide to change that.

---
content.tex | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/content.tex b/content.tex
index 5d3f865956aa..fc59eea95716 100644
--- a/content.tex
+++ b/content.tex
@@ -3100,8 +3100,8 @@ \subsubsection{Packet Transmission}\label{sec:Device =
Types / Network Device / De
   \begin{itemize}
   \item If the VIRTIO_NET_F_GUEST_HDRLEN feature has been negotiated,
     \field{hdr_len} indicates the header length that needs to be replicate=
d
-    for each packet. It's a number of bytes from beginning of the packet
-    to beginning of the transport payload.
+    for each packet. It's the number of bytes from the beginning of the pa=
cket
+    to the beginning of the transport payload.
     Otherwise, if the VIRTIO_NET_F_GUEST_HDRLEN feature has not been negot=
iated,
     \field{hdr_len} is a hint to the device as to how much of the header
     needs to be kept to copy into each packet, usually set to the
@@ -3217,7 +3217,7 @@ \subsubsection{Packet Transmission}\label{sec:Device =
Types / Network Device / De
=20
 =09\begin{note}
 =09Caution should be taken by the implementation so as to prevent
-=09malicious driver from attacking the device by setting incorrect hdr_len=
.
+=09a malicious driver from attacking the device by setting an incorrect hd=
r_len.
 =09\end{note}
=20
 \item If the VIRTIO_NET_F_GUEST_HDRLEN feature has not been negotiated,
--=20
2.21.0


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

