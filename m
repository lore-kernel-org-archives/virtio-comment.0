Return-Path: <virtio-comment-return-5759-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0322C7EE21
	for <virtio-comment@archiver.kernel.org>; Thu,  4 May 2023 08:21:33 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 0F632126C2F
	for <virtio-comment@archiver.kernel.org>; Thu,  4 May 2023 08:21:33 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 033FC9866B4
	for <virtio-comment@archiver.kernel.org>; Thu,  4 May 2023 08:21:33 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id EF66F98663F; Thu,  4 May 2023 08:21:32 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DF33E986640
	for <virtio-comment@lists.oasis-open.org>; Thu,  4 May 2023 08:21:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683188491; x=1685780491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3qgSGNS8D5YhAPzObxCpGcEt4bKFfv9ETJXRniOGXV0=;
        b=VIivCTjCMOuhHmlcIlnlgq9Ui0QikXJ1IGDHKyDnsP37iGz6VWDIdG9IhLJkjz7pI9
         CDlBipUcQtjEaWmYxCLnfET4J2ALH90wY2VPQ0z4nb/0GvFrwlKjFv18hS19LCSd//wB
         NckuyZ7/YNpQXVRgVog3LPsR0a029GVjp3zuGHwdhMwCP55aoMmN0rrIGCV9eva6d8r6
         6fX1M/Cas+NkBhMidQdWRsSbKLCGGpbFwK7yCPpA1OwoT3zll4JyT/LkIu+uvBJhCmcC
         T3bAyzi5FaP0tAmRqwvIinbzbZLvPYkwm5xEQi3pfrys3fdH71JLVqYv6ykjILziLN/6
         EI6A==
X-Gm-Message-State: AC+VfDyTBa8bp9KwW3xzvnqa8867Yw7EXDe+201cenX019dSdp3/4ds6
	TU4z8EWkALmbnKnx7qZezCwcqA==
X-Google-Smtp-Source: ACHHUZ4UTisQr1niTXn8hXbloo3kqp1PuXx+UwXJE9q2YxB7oAs6nvRyW5D9pDMPcdGk1K1Nz4RkHg==
X-Received: by 2002:a17:90a:ba18:b0:247:6022:9595 with SMTP id s24-20020a17090aba1800b0024760229595mr1216745pjr.45.1683188491527;
        Thu, 04 May 2023 01:21:31 -0700 (PDT)
From: zhenwei pi <pizhenwei@bytedance.com>
To: parav@nvidia.com,
	mst@redhat.com,
	stefanha@redhat.com,
	jasowang@redhat.com
Cc: virtio-comment@lists.oasis-open.org,
	houp@yusur.tech,
	helei.sig11@bytedance.com,
	xinhao.kong@duke.edu,
	zhenwei pi <pizhenwei@bytedance.com>
Date: Thu,  4 May 2023 16:19:02 +0800
Message-Id: <20230504081910.238585-4-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230504081910.238585-1-pizhenwei@bytedance.com>
References: <20230504081910.238585-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] [PATCH v2 03/11] transport-fabircs: introduce Segment Descriptor Definition

Introduce segment descriptor to describe the Virtio device buffer
segments.

Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
---
 transport-fabrics.tex | 43 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/transport-fabrics.tex b/transport-fabrics.tex
index 26b0192..b88acfd 100644
--- a/transport-fabrics.tex
+++ b/transport-fabrics.tex
@@ -45,3 +45,46 @@ \subsection{Virtio Qualified Name}\label{sec:Virtio Transport Options / Virtio O
 \item The string is null terminated.
 \item There is no strict style limitation.
 \end{itemize}
+
+\subsection{Transmission Protocol}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol}
+This section defines transmission protocol for Virtio Over Fabrics. All the
+fields use little endian format.
+
+\subsubsection{Segment Descriptor Definition}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Segment Descriptor Definition}
+Virtio Over Fabrics uses the following structure to describe data segment:
+
+\begin{lstlisting}
+struct virtio_of_vring_desc {
+        le64 addr;
+        le32 length;
+        /* This marks the unique ID within a command, no limitation among inflight commands */
+        le16 id;
+        /* This marks a buffer as keyed transmission (otherwise stream transmission) */
+#define VIRTIO_OF_DESC_F_KEYED     1
+        /* This marks a buffer as device write-only (otherwise device read-only). */
+#define VIRTIO_OF_DESC_F_WRITE     2
+        le16 flags;
+        le32 key;
+};
+\end{lstlisting}
+
+The structure virtio_of_vring_desc is used for both keyed transmission
+(i.e. RDMA) and stream transmission(i.e. TCP). The fields is described as follows:
+
+\begin{tabular}{ |l|l|l| }
+\hline
+Field & keyed transmission & stream transmission \\
+\hline \hline
+addr & Start address of remote memory buffer & Start address within the stream buffer \\
+\hline
+length & The length of remote memory buffer & The length of buffer within the stream \\
+\hline
+id & The ID of this descriptor & The ID of this descriptor \\
+\hline
+flags & both keyed transmission and stream transmission supported & stream transmission only \\
+\hline
+key & Key of the remote Memory Region & Ignore \\
+\hline
+\end{tabular}
+
+Depending on the opcode, a Command contains zero or more structure virtio_of_vring_desc.
-- 
2.25.1


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

