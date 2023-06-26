Return-Path: <virtio-comment-return-6512-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7C83EB64D7
	for <virtio-comment@archiver.kernel.org>; Mon, 26 Jun 2023 07:28:38 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 4E18C42A6D
	for <virtio-comment@archiver.kernel.org>; Mon, 26 Jun 2023 07:28:38 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 484E6986413
	for <virtio-comment@archiver.kernel.org>; Mon, 26 Jun 2023 07:28:38 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 3522098638D; Mon, 26 Jun 2023 07:28:38 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 24A98986393
	for <virtio-comment@lists.oasis-open.org>; Mon, 26 Jun 2023 07:28:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687764517; x=1690356517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZQZXqICNIQi2Uito4yQ8RIoIe+iPmlkV9Za6hEGXiEQ=;
        b=DpStjEcrO2HjUhEuasJO3/8NSywjOhbvDwd0iqCtCV8q3LeyT0c8uDS2VDZCz2BjKV
         EPuNJ158A1/0Vi7zngunKv+aPKe/BPL0GRFPoNC8Bf6g0bNKLmeplisqNPn7kDvNEtOd
         JjZ96gMNrIrEqc+6qANMZgRunNEsbXGq5ny/XRr2BMrkPDTVdZHFeKRi8kMb8y8B7QJp
         F7e3WTvhkkr6/pZ0B/kEJbgbbd4wZlJDsWbf0VMayViA+Br6FdC4VTl9gG5gKhY0xfhy
         TveMyHRaZQE9yl6CJ6VTkIqwEjauf2shaw6sGBNE1ObcmdoP/RlljA+w7uisZSv8afSa
         ugJA==
X-Gm-Message-State: AC+VfDwsRxbBEwTw587/VFhTI2Nlyxdmg6EmIOkHS1icUJ/eilcBnBaJ
	Ta8jcV2SJ7IdDb8Fg/6KigCaXQ==
X-Google-Smtp-Source: ACHHUZ51WU66Q6uoYVy7Us/siEcw2RlGnV08dJKcNQjddslS0cAbOqxXJ16ByjMJj7GxefeBQO18pw==
X-Received: by 2002:a17:90a:1a51:b0:262:bf76:ad99 with SMTP id 17-20020a17090a1a5100b00262bf76ad99mr3297173pjl.47.1687764516728;
        Mon, 26 Jun 2023 00:28:36 -0700 (PDT)
From: zhenwei pi <pizhenwei@bytedance.com>
To: stefanha@redhat.com,
	parav@nvidia.com,
	mst@redhat.com,
	jasowang@redhat.com
Cc: virtio-comment@lists.oasis-open.org,
	houp@yusur.tech,
	helei.sig11@bytedance.com,
	zhouhuaping.san@bytedance.com,
	xinhao.kong@duke.edu,
	zhenwei pi <pizhenwei@bytedance.com>
Date: Mon, 26 Jun 2023 15:25:50 +0800
Message-Id: <20230626072551.1709389-7-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230626072551.1709389-1-pizhenwei@bytedance.com>
References: <20230626072551.1709389-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] [PATCH v4 6/7] transport-fabrics: add device initialization

Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
---
 transport-fabrics.tex | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/transport-fabrics.tex b/transport-fabrics.tex
index 75e4855..f7f29cf 100644
--- a/transport-fabrics.tex
+++ b/transport-fabrics.tex
@@ -755,3 +755,36 @@ \subsubsection{RDMA}\label{sec:Virtio Transport Options / Virtio Over Fabrics /
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

