Return-Path: <virtio-comment-return-3330-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9C996986599
	for <virtio-comment@lists.oasis-open.org>; Fri,  5 Aug 2022 10:02:39 +0000 (UTC)
From: Zhu Lingshan <lingshan.zhu@intel.com>
Date: Fri,  5 Aug 2022 17:53:43 +0800
Message-Id: <20220805095343.486546-5-lingshan.zhu@intel.com>
In-Reply-To: <20220805095343.486546-1-lingshan.zhu@intel.com>
References: <20220805095343.486546-1-lingshan.zhu@intel.com>
MIME-Version: 1.0
Subject: [virtio-comment] [PATCH V3 RESEND 4/4] Add transport vq number for virtio blk and net
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"; x-default=true
To: jasowang@redhat.com, mst@redhat.com, cohuck@redhat.com, sgarzare@redhat.com, stefanha@redhat.com, nrupal.jani@intel.com, Piotr.Uminski@intel.com, hang.yuan@intel.com
Cc: virtio-comment@lists.oasis-open.org, Zhu Lingshan <lingshan.zhu@intel.com>
List-ID: <virtio-comment.lists.oasis-open.org>

This commit add the queue number of the transport virtqueue
for virtio_blk and virtio_net

Signed-off-by: Jason Wang <jasowang@redhat.com>
Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>
---
 content.tex | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/content.tex b/content.tex
index be632d1..ba129d4 100644
--- a/content.tex
+++ b/content.tex
@@ -3777,6 +3777,7 @@ \subsection{Virtqueues}\label{sec:Device Types / Netw=
ork Device / Virtqueues}
 \item[2(N-1)] receiveqN
 \item[2(N-1)+1] transmitqN
 \item[2N] controlq
+\item[2N+1] transportq
 \end{description}
=20
  N=3D1 if neither VIRTIO_NET_F_MQ nor VIRTIO_NET_F_RSS are negotiated, oth=
erwise N is set by
@@ -3784,6 +3785,8 @@ \subsection{Virtqueues}\label{sec:Device Types / Netw=
ork Device / Virtqueues}
=20
  controlq only exists if VIRTIO_NET_F_CTRL_VQ set.
=20
+ transportq only exists if VIRTIO_F_TRANSPT_VQ set
+
 \subsection{Feature bits}\label{sec:Device Types / Network Device / Featur=
e bits}
=20
 \begin{description}
@@ -5363,11 +5366,14 @@ \subsection{Virtqueues}\label{sec:Device Types / Bl=
ock Device / Virtqueues}
 \item[0] requestq1
 \item[\ldots]
 \item[N-1] requestqN
+\item[N] transportq
 \end{description}
=20
  N=3D1 if VIRTIO_BLK_F_MQ is not negotiated, otherwise N is set by
  \field{num_queues}.
=20
+ transportq only exists if VIRTIO_F_TRANSPT_VQ set.
+
 \subsection{Feature bits}\label{sec:Device Types / Block Device / Feature =
bits}
=20
 \begin{description}
--=20
2.35.3


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

