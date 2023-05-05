Return-Path: <virtio-comment-return-5811-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A3C5C77B7F
	for <virtio-comment@archiver.kernel.org>; Fri,  5 May 2023 15:41:33 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 936AB157757
	for <virtio-comment@archiver.kernel.org>; Fri,  5 May 2023 15:41:32 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 83A77986742
	for <virtio-comment@archiver.kernel.org>; Fri,  5 May 2023 15:41:32 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 78E029866BC; Fri,  5 May 2023 15:41:32 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D0966986704
	for <virtio-comment@lists.oasis-open.org>; Fri,  5 May 2023 15:41:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: G-xkez5hO5iyuhsQRQKW0g-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683301258; x=1685893258;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hrLDYm0tWFX3og+TOXpTdZLvlimTZWf1SkPsKWu4K7M=;
        b=XjPFCIfCIZQ49qzf437+wdncbHYDI25Ye+1U3SWNOhrQ+uUeg5aUwpM5mYcwO8Ql/U
         awUZ7XcExiuWbvTuD3PZUbIRcE5Y6DS0XTYR5ljEKdTYHGXwWCw1GWZxEgrRzKXTnkBP
         WLnjQOG5J28DRTYpm7DzjSlmOp9Me5Z3hvLSSnb7XrI5A8TjwdwFo0J2Z6ijlJDSHxsD
         MHL/Ed43jA2Dp7aC7bZJ4x1NyOKjI5SG6HF88asSKKvFs6iip5mXdI8EQ6V4fMytxdP7
         lrVYEYTbvM0RFw3UMmzu2ctJ4FokNxn+ugBfqz9gc+32WXHnJ3zJWZI3s/MYl7OB75Fy
         QIXQ==
X-Gm-Message-State: AC+VfDzg86LxxhJnSF1v5dnTWSeNqKHNvRKKgfu34Wb2KKijFmGU+Xlc
	D4OFtAkjDFHgR8MGGy+we/Nhn/LwYcYJqe6hxIAQB79brAvSlOw1MvfPMeuif7xrWeoMu+/rLVG
	QnWpRt/AJzPbyBvcHjKzUo3nBsRM+IuFqRs+OveNzUPJyqCjzZYn/YZDzcg8ZvDBotXtM6Te3TY
	545PCEINVimS0=
X-Received: by 2002:adf:f183:0:b0:2fe:f2d1:dcab with SMTP id h3-20020adff183000000b002fef2d1dcabmr1621422wro.58.1683301258509;
        Fri, 05 May 2023 08:40:58 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5SqbYI3pn33Vj57EIVe6xLzSPTdhiPALQs+drOYuQ9m7bGYJMp2Soo1q40q8R0EpNKeZcrqg==
X-Received: by 2002:adf:f183:0:b0:2fe:f2d1:dcab with SMTP id h3-20020adff183000000b002fef2d1dcabmr1621395wro.58.1683301258161;
        Fri, 05 May 2023 08:40:58 -0700 (PDT)
Date: Fri, 5 May 2023 11:40:54 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: virtio-comment@lists.oasis-open.org, virtio-dev@lists.oasis-open.org,
	jasowang@redhat.com, mst@redhat.com, cohuck@redhat.com,
	sgarzare@redhat.com, stefanha@redhat.com, nrupal.jani@intel.com,
	Piotr.Uminski@intel.com, hang.yuan@intel.com
Cc: virtio@lists.oasis-open.org, Jiri Pirko <jiri@nvidia.com>,
	Zhu Lingshan <lingshan.zhu@intel.com>, pasic@linux.ibm.com,
	Shahaf Shuler <shahafs@nvidia.com>, Parav Pandit <parav@nvidia.com>,
	Max Gurtovoy <mgurtovoy@nvidia.com>
Message-ID: <2ce496d32bf090cb7858b31736a4e37515e1e0d2.1683301091.git.mst@redhat.com>
References: <cover.1683301091.git.mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <cover.1683301091.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] [PATCH v13 06/10] mmio: document ADMIN_VQ as reserved

Adding relevant registers needs more work and it's not
clear what the use-case will be as currently only
the PCI transport is supported. But let's keep the
door open on this.
We already say it's reserved in a central place, but it
does not hurt to remind implementers to mask it.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Parav Pandit <parav@nvidia.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Max Gurtovoy <mgurtovoy@nvidia.com>

---

changes in v12:
	drop "as of now" to address comment by parav
---
 transport-mmio.tex | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/transport-mmio.tex b/transport-mmio.tex
index f884a2c..5680fc4 100644
--- a/transport-mmio.tex
+++ b/transport-mmio.tex
@@ -562,3 +562,15 @@ \subsection{Legacy interface}\label{sec:Virtio Transport Options / Virtio Over M
 \end{enumerate}
 
 Notification mechanisms did not change.
+
+\subsection{Features reserved for future use}\label{sec:Virtio Transport Options / Virtio Over MMIO / Features reserved for future use}
+
+Devices and drivers utilizing Virtio Over MMIO
+do not support the following features:
+\begin{itemize}
+
+\item VIRTIO_F_ADMIN_VQ
+
+\end{itemize}
+
+These features are reserved for future use.
-- 
MST


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
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

