Return-Path: virtio-comment-return-1321-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 66D57985EDD
	for <virtio-comment@lists.oasis-open.org>; Thu, 18 Jun 2020 08:22:26 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
Date: Thu, 18 Jun 2020 10:21:49 +0200
Message-Id: <20200618082150.17476-3-david@redhat.com>
In-Reply-To: <20200618082150.17476-1-david@redhat.com>
References: <20200618082150.17476-1-david@redhat.com>
MIME-Version: 1.0
Subject: [virtio-comment] [PATCH v2 2/3] conformance: Reference RPMB Driver Conformance
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
To: virtio-comment@lists.oasis-open.org
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>, David Hildenbrand <david@redhat.com>, Yang Huang <yang.huang@intel.com>
List-ID: <virtio-comment.lists.oasis-open.org>

We forgot to reference the driver conformance.

Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Cc: Yang Huang <yang.huang@intel.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 conformance.tex | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/conformance.tex b/conformance.tex
index ed7d77f..ea48d2d 100644
--- a/conformance.tex
+++ b/conformance.tex
@@ -24,7 +24,8 @@ \section{Conformance Targets}\label{sec:Conformance / Con=
formance Targets}
 \ref{sec:Conformance / Driver Conformance / SCSI Host Driver Conformance},
 \ref{sec:Conformance / Driver Conformance / Input Driver Conformance},
 \ref{sec:Conformance / Driver Conformance / Crypto Driver Conformance},
-\ref{sec:Conformance / Driver Conformance / Socket Driver Conformance} or
+\ref{sec:Conformance / Driver Conformance / Socket Driver Conformance},
+\ref{sec:Conformance / Driver Conformance / RPMB Driver Conformance} or
 \ref{sec:Conformance / Driver Conformance / IOMMU Driver Conformance}.
     \item Clause \ref{sec:Conformance / Legacy Interface: Transitional Dev=
ice and Transitional Driver Conformance}.
   \end{itemize}
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

