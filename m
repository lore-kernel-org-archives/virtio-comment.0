Return-Path: virtio-comment-return-1767-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7B5FE985E23
	for <virtio-comment@lists.oasis-open.org>; Mon, 22 Mar 2021 03:47:41 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 22 Mar 2021 11:47:17 +0800
Message-Id: <20210322034717.35135-3-jasowang@redhat.com>
In-Reply-To: <20210322034717.35135-1-jasowang@redhat.com>
References: <20210322034717.35135-1-jasowang@redhat.com>
MIME-Version: 1.0
Subject: [virtio-comment] [PATCH V2 2/2] virtio-pci: implement VIRTIO_F_QUEUE_STATE
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable
To: mst@redhat.com, virtio-comment@lists.oasis-open.org
Cc: eperezma@redhat.com, lulu@redhat.com, rob.miller@broadcom.com, pasic@linux.ibm.com, sgarzare@redhat.com, cohuck@redhat.com, jim.harford@broadcom.com, Jason Wang <jasowang@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

This patch adds two new le16 fields to common configruation structure
to support VIRTIO_F_QUEUE_STATE.

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 content.tex | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/content.tex b/content.tex
index af39111..adfc279 100644
--- a/content.tex
+++ b/content.tex
@@ -914,6 +914,8 @@ \subsubsection{Common configuration structure layout}\l=
abel{sec:Virtio Transport
         le64 queue_driver;              /* read-write */
         le64 queue_device;              /* read-write */
         le16 queue_notify_data;         /* read-only for driver */
+        le16 queue_avail_state;         /* read-write */
+        le16 queue_used_state;          /* read-write */
 };
 \end{lstlisting}
=20
@@ -993,6 +995,16 @@ \subsubsection{Common configuration structure layout}\=
label{sec:Virtio Transport
         may benefit from providing another value, for example an internal =
virtqueue
         identifier, or an internal offset related to the virtqueue number.
         \end{note}
+
+\item[\field{queue_avail_state}]
+        This field exists only if VIRTIO_F_QUEUE_STATE has been
+        negotiated. The driver sets and gets the available state of
+        the virtqueue here (see \ref{sec:Virtqueues / Virtqueue State}).
+
+\item[\field{queue_used_state}]
+        This field exists only if VIRTIO_F_QUEUE_STATE has been
+        negotiated. The driver sets and gets the used state of the
+        virtqueue here (see \ref{sec:Virtqueues / Virtqueue State}).
 \end{description}
=20
 \devicenormative{\paragraph}{Common configuration structure layout}{Virtio=
 Transport Options / Virtio Over PCI Bus / PCI Device Layout / Common confi=
guration structure layout}
--=20
2.24.3 (Apple Git-128)


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

