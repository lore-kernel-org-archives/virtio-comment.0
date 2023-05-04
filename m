Return-Path: <virtio-comment-return-5766-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A51A8C7EE21
	for <virtio-comment@archiver.kernel.org>; Thu,  4 May 2023 08:21:58 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 03E6E1CA249
	for <virtio-comment@archiver.kernel.org>; Thu,  4 May 2023 08:21:58 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id F06F19866C0
	for <virtio-comment@archiver.kernel.org>; Thu,  4 May 2023 08:21:57 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id E74AC983EB5; Thu,  4 May 2023 08:21:57 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D672C98663F
	for <virtio-comment@lists.oasis-open.org>; Thu,  4 May 2023 08:21:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683188516; x=1685780516;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rlcQcnJQp/prI/m6lqICd5KLU63q7IuJZJqi3K72XgA=;
        b=i6yA8RR+OJRKqAuBWmhqEOwyrO62FVVxQoQ3/oNlXR76FB0fgl3q/Ag1H4yA1b5the
         J0MSKlB58ExtlMvliRZyv38L/7AYHsI6RQBRn+q3CsM9Irv1s+wYMJSXD8mKkolFapSo
         /4TOzvdIn/RzI6qlQQSW+XBm3ZR+WUjW6XXXfiI/BQ3mbLoeNSbyDz1dfkLq7+KMNUzu
         a3rfDfE2SJ1tQK6xkgCrw2XjSiUvjIy1FIbC/q6bb+6UXqTxm/5V8wHzwIagyfQnDGD2
         f2nV0halx0+1tLmIWpbfbVO4oTuY3eXX6ygJB7Z8Rj8Y28m6mnMhtDEV3Y0GSlUNWnW8
         F9KA==
X-Gm-Message-State: AC+VfDyeIcoImZdni1ApdP0s0r5zC3tBJqq5+oYcziasx/dZsB47DLQA
	hFTZ4J1HvINnwdCt/uAZt5dDUw==
X-Google-Smtp-Source: ACHHUZ6CaemauHlORZXU7/L1Evq4YpMi1MN0fDpJsxhYSY0I16A9GCazmY//uCBziBISLFRWG6lkbg==
X-Received: by 2002:a17:90b:1911:b0:24e:3c23:9654 with SMTP id mp17-20020a17090b191100b0024e3c239654mr1237350pjb.44.1683188516515;
        Thu, 04 May 2023 01:21:56 -0700 (PDT)
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
Date: Thu,  4 May 2023 16:19:09 +0800
Message-Id: <20230504081910.238585-11-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230504081910.238585-1-pizhenwei@bytedance.com>
References: <20230504081910.238585-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] [PATCH v2 10/11] transport-fabrics: add device initialization

Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
---
 transport-fabrics.tex | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/transport-fabrics.tex b/transport-fabrics.tex
index c47a744..af35622 100644
--- a/transport-fabrics.tex
+++ b/transport-fabrics.tex
@@ -882,3 +882,27 @@ \subsubsection{TCP}\label{sec:Virtio Transport Options / Virtio Over Fabrics / r
 \subsubsection{RDMA}\label{sec:Virtio Transport Options / Virtio Over Fabrics / ransport Binding / RDMA}
 RDMA MUST use \ref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Commands Definition / Keyed Transmission}
 ~\nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Commands Definition / Keyed Transmission}.
+
+\subsection{Device Initialization}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Device Initialization}
+\begin{enumerate}
+\item The control queue MUST be established firstly, once the reliable
+connection is ready, the initiator MUST issue
+\nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Opcodes Definition / virtio_of_op_connect}
+to create association with the target.
+\item The initiator SHOULD issue
+\nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Opcodes Definition / virtio_of_op_get_feature}
+to discover the capabilities offered by the target.
+\item The initiator SHOULD issue
+\nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Opcodes Definition / virtio_of_op_set_feature}
+to negotiate the capabilities.
+\item The initiator SHOULD continue initialization like PCI base devices, i.e. issue
+\nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Opcodes Definition / virtio_of_op_get_vendor_id}
+to get the vendor ID.
+\item After discovering the number of virtqueues by
+\nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Opcodes Definition / virtio_of_op_get_num_queues},
+the initiator SHOULD create virtqueue one by one by
+\nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Opcodes Definition / virtio_of_op_connect}.
+\item The virtqueue SHOULD issue
+\nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Opcodes Definition / virtio_of_op_vring}
+to transmit buffer.
+\end{enumerate}
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

