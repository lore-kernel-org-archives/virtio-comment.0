Return-Path: virtio-comment-return-1320-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A8E29985EDD
	for <virtio-comment@lists.oasis-open.org>; Thu, 18 Jun 2020 08:22:21 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
Date: Thu, 18 Jun 2020 10:21:48 +0200
Message-Id: <20200618082150.17476-2-david@redhat.com>
In-Reply-To: <20200618082150.17476-1-david@redhat.com>
References: <20200618082150.17476-1-david@redhat.com>
MIME-Version: 1.0
Subject: [virtio-comment] [PATCH v2 1/3] conformance: make driver conformance list easier to read and maintain
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
To: virtio-comment@lists.oasis-open.org
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>, David Hildenbrand <david@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

Let's define it just like the device conformance list.

Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 conformance.tex | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/conformance.tex b/conformance.tex
index b6fdec0..ed7d77f 100644
--- a/conformance.tex
+++ b/conformance.tex
@@ -15,7 +15,17 @@ \section{Conformance Targets}\label{sec:Conformance / Co=
nformance Targets}
   \begin{itemize}
     \item Clause \ref{sec:Conformance / Driver Conformance}.
     \item One of clauses \ref{sec:Conformance / Driver Conformance / PCI D=
river Conformance}, \ref{sec:Conformance / Driver Conformance / MMIO Driver=
 Conformance} or \ref{sec:Conformance / Driver Conformance / Channel I/O Dr=
iver Conformance}.
-    \item One of clauses \ref{sec:Conformance / Driver Conformance / Netwo=
rk Driver Conformance}, \ref{sec:Conformance / Driver Conformance / Block D=
river Conformance}, \ref{sec:Conformance / Driver Conformance / Console Dri=
ver Conformance}, \ref{sec:Conformance / Driver Conformance / Entropy Drive=
r Conformance}, \ref{sec:Conformance / Driver Conformance / Traditional Mem=
ory Balloon Driver Conformance}, \ref{sec:Conformance / Driver Conformance =
/ SCSI Host Driver Conformance}, \ref{sec:Conformance / Driver Conformance =
/ Input Driver Conformance}, \ref{sec:Conformance / Driver Conformance / Cr=
ypto Driver Conformance}, \ref{sec:Conformance / Driver Conformance / Socke=
t Driver Conformance} or \ref{sec:Conformance / Driver Conformance / IOMMU =
Driver Conformance}.
+    \item One of clauses
+\ref{sec:Conformance / Driver Conformance / Network Driver Conformance},
+\ref{sec:Conformance / Driver Conformance / Block Driver Conformance},
+\ref{sec:Conformance / Driver Conformance / Console Driver Conformance},
+\ref{sec:Conformance / Driver Conformance / Entropy Driver Conformance},
+\ref{sec:Conformance / Driver Conformance / Traditional Memory Balloon Dri=
ver Conformance},
+\ref{sec:Conformance / Driver Conformance / SCSI Host Driver Conformance},
+\ref{sec:Conformance / Driver Conformance / Input Driver Conformance},
+\ref{sec:Conformance / Driver Conformance / Crypto Driver Conformance},
+\ref{sec:Conformance / Driver Conformance / Socket Driver Conformance} or
+\ref{sec:Conformance / Driver Conformance / IOMMU Driver Conformance}.
     \item Clause \ref{sec:Conformance / Legacy Interface: Transitional Dev=
ice and Transitional Driver Conformance}.
   \end{itemize}
 \item[Device] A device MUST conform to four conformance clauses:
--=20
2.26.2


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

