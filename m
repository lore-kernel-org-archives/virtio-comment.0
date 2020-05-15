Return-Path: virtio-comment-return-1246-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A338B986050
	for <virtio-comment@lists.oasis-open.org>; Fri, 15 May 2020 13:28:00 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
Date: Fri, 15 May 2020 15:27:50 +0200
Message-Id: <20200515132751.62332-3-david@redhat.com>
In-Reply-To: <20200515132751.62332-1-david@redhat.com>
References: <20200515132751.62332-1-david@redhat.com>
MIME-Version: 1.0
Subject: [virtio-comment] [PATCH 2/3] conformance: Reference RPMB Driver Conformance
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
To: virtio-comment@lists.oasis-open.org
Cc: David Hildenbrand <david@redhat.com>, Yang Huang <yang.huang@intel.com>
List-ID: <virtio-comment.lists.oasis-open.org>

We forgot to reference the driver conformance.

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
2.25.4


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

