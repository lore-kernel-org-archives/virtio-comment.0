Return-Path: <virtio-comment-return-6374-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D09F1EB64D9
	for <virtio-comment@archiver.kernel.org>; Mon, 19 Jun 2023 08:35:44 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id E0B6871C8D
	for <virtio-comment@archiver.kernel.org>; Mon, 19 Jun 2023 08:35:32 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 659DF986886
	for <virtio-comment@archiver.kernel.org>; Mon, 19 Jun 2023 08:35:32 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 345B59866F1; Mon, 19 Jun 2023 08:35:32 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A9F139863B0
	for <virtio-comment@lists.oasis-open.org>; Mon, 19 Jun 2023 08:34:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687163656; x=1689755656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=suv2AhpVL3+w2JzSghM9+6Zu7KoD2eXgspgdQqRL48E=;
        b=MQiQZ9tH68eUyelDkSymg4TCGddNVkgtE1QYPg/bj/DpkfKiuE6xYNs2W7g/olEuRz
         /TaJU/4BQLw8EY8BIbBda0p39p4MHasOJ4kzIKOcFmntiuv6PRF017pbcjFWC/DdOAvL
         QiqLnjIYl0B+vQhyrM3wKqrL2fehgxsVqK06sMtAVYhIYGETRaUJlCRTjBIo5/hiBd2m
         X13WTrc/A9EdSZ1d4XpoyjfhE3GopkfrjbtCI+a5PegNICvNypK7ogxMM4xLHNycstHN
         PrP734PY+6ipc3iJmeatl500+lWCI7Xf08G2jO7M/KRuGzEGysrYHGISiy6+ffcKkeoz
         HuxQ==
X-Gm-Message-State: AC+VfDxnJ9qSpbjqrzWxa7SLEmP/phtDs/0tmZEB6WVc00xJZSUK3MS5
	n6gKbs1AV1WEwcDiCZ+jLs+vQA==
X-Google-Smtp-Source: ACHHUZ6CWuiGxn1DMkMV4Ph/a3utgUJSkQ+Hpz+/dLlv6ocDJ0G11iiUX78/HNz6ggDBomuCcbBlzQ==
X-Received: by 2002:a17:90a:d90b:b0:25b:c91e:8bf2 with SMTP id c11-20020a17090ad90b00b0025bc91e8bf2mr6076305pjv.49.1687163656192;
        Mon, 19 Jun 2023 01:34:16 -0700 (PDT)
From: zhenwei pi <pizhenwei@bytedance.com>
To: stefanha@redhat.com,
	mst@redhat.com,
	parav@nvidia.com,
	jasowang@redhat.com
Cc: virtio-comment@lists.oasis-open.org,
	houp@yusur.tech,
	xinhao.kong@duke.edu,
	helei.sig11@bytedance.com,
	zhouhuaping.san@bytedance.com,
	zhenwei pi <pizhenwei@bytedance.com>
Date: Mon, 19 Jun 2023 16:31:30 +0800
Message-Id: <20230619083131.1544999-7-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230619083131.1544999-1-pizhenwei@bytedance.com>
References: <20230619083131.1544999-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] [PATCH v3 6/7] transport-fabrics: add device initialization

Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
---
 transport-fabrics.tex | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/transport-fabrics.tex b/transport-fabrics.tex
index 629e1f6..41a24d6 100644
--- a/transport-fabrics.tex
+++ b/transport-fabrics.tex
@@ -765,3 +765,36 @@ \subsubsection{RDMA}\label{sec:Virtio Transport Options / Virtio Over Fabrics /
 \item The Virtio-oF target writes the remote data by RDMA WRITE.
 \item The Virtio-oF target sends a PDU by RDMA SEND.
 \end{itemize}
+
+
+\subsection{Device Initialization}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Device Initialization}
+\begin{enumerate}
+\item The Virtio-oF control queue must be established first by connecting
+from the Virtio-oF initiator to the Virtio-oF target and issuing a
+\nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Commands Definition / Opcodes / Connect Command}
+to create a Virtio-oF device instance.
+\item Optionally, The Virtio-oF initiator issues a
+\nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Commands Definition / Opcodes / Get Feature Command}
+to discover the features offered by the Virtio-oF device instance.
+After feature negotiation, the Virtio-oF initiator also issues a
+\nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Commands Definition / Opcodes / Set Feature Command}
+to finalize features.
+\item The Virtio-oF initiator issues a
+\nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Commands Definition / Opcodes / Get Device ID Command}
+and
+\nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Commands Definition / Opcodes / Get Vendor ID Command}
+for virtio driver.
+\item During virtio device initialization, the Virtio-oF initiator issues a
+\nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Commands Definition / Opcodes / Get Status Command}
+and
+\nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Commands Definition / Opcodes / Set Status Command}.
+\item Optionally, The Virtio-oF initiator issues a
+\nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Commands Definition / Opcodes / Get VQ Size Command}
+to get the size of a Virtio-oF virtqueue.
+\item The Virtio-oF initiator issues a
+\nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Commands Definition / Opcodes / Connect Command}
+to establish a Virtio-oF virtqueue.
+\item The Virtio-oF initiator creates Virtio-oF virtqueues one by one, then issues a
+\nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Commands Definition / Opcodes / VQ Command}
+to supply virtqueue buffers to the Virtio-oF device instance on Virtio-oF virtqueues.
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

