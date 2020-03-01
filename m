Return-Path: virtio-comment-return-1112-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0AADE98423F
	for <virtio-comment@lists.oasis-open.org>; Sun,  1 Mar 2020 08:55:27 +0000 (UTC)
Date: Sun, 1 Mar 2020 03:55:18 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20200301085437.804801-1-mst@redhat.com>
MIME-Version: 1.0
Subject: [virtio-comment] [PATCH] virtio-net/rss: maximal -> maximum
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
To: virtio-comment@lists.oasis-open.org
Cc: Yuri Benditovich <yuri.benditovich@daynix.com>
List-ID: <virtio-comment.lists.oasis-open.org>

Maximal can mean "local as opposed to a global maximum".  Rest of the
spec says maximum everywhere.  Let's be consistent.

Cc: Yuri Benditovich <yuri.benditovich@daynix.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---

Going to apply this under the minor cleanups rule.

 content.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/content.tex b/content.tex
index b91a132..91735e3 100644
--- a/content.tex
+++ b/content.tex
@@ -2999,9 +2999,9 @@ \subsection{Device configuration layout}\label{sec:De=
vice Types / Network Device
 Three following fields, \field{rss_max_key_size}, \field{rss_max_indirecti=
on_table_length}
 and \field{supported_hash_types} only exist if VIRTIO_NET_F_RSS is set.
=20
-Field \field{rss_max_key_size} specifies the maximal supported length of R=
SS key in bytes.
+Field \field{rss_max_key_size} specifies the maximum supported length of R=
SS key in bytes.
=20
-Field \field{rss_max_indirection_table_length} specifies the maximal numbe=
r of 16-bit entries in RSS indirection table.
+Field \field{rss_max_indirection_table_length} specifies the maximum numbe=
r of 16-bit entries in RSS indirection table.
=20
 Field \field{supported_hash_types} contains the bitmask of supported RSS h=
ash types.
=20
--=20
MST


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

