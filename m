Return-Path: <virtio-comment-return-7911-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC4CCC001E0
	for <virtio-comment@archiver.kernel.org>; Mon, 23 Oct 2023 10:51:51 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 46CEE42A77
	for <virtio-comment@archiver.kernel.org>; Mon, 23 Oct 2023 10:51:51 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4120198697E
	for <virtio-comment@archiver.kernel.org>; Mon, 23 Oct 2023 10:51:51 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 36D5B986670; Mon, 23 Oct 2023 10:51:51 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 28F8D986674
	for <virtio-comment@lists.oasis-open.org>; Mon, 23 Oct 2023 10:51:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698058310; x=1698663110;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2nXHnmfQkYZDmbE25in/RE05/DvwR8o6JAVQW8W9LRQ=;
        b=rJvGdNf1vdavF1MDcL2sxNZaKVFPfCWUFMFn1NxBI2AEEtpN2taH5ug7uc4RVqU5Ht
         TcLrUNHriSXy9Wr6PKAhwU70gJfiboHmY0AQPIT2jz9o/eyFa95fgHnl2rFVHZm6ezOY
         JPYh+VsA8OBBKz9nBZzdBr1xdW7PRWQ5lEaIxexOayxlfxouN6ueVWBPe/ylR3ivk4LE
         DnpufDHewosw4Qy+bn7Tw1/RPG3o+UYVluGMqGDTaNGjaJs0hR0eo0qyf3s8KkOuCsup
         vb08a8cNeRM3ZDe8NodopUKEY8Br1+P6g0L0Dr5tcnoO7DRDh4M/GMbNjhvmrw3V8Jxd
         Jt4g==
X-Gm-Message-State: AOJu0YydCDSAxvgY7Uq00E3C7u/SlEm5kaRC5o8g3h0laNIrMSFJkm7o
	Gc8/FBFEiNE+IK/2I+TKmtE7nw==
X-Google-Smtp-Source: AGHT+IEs5uQLMZNzQ1Mj3LKWQuqek+n0aiSCElcQa+P4tu5hbj8PaRmi4RGJiBUMZpOuJzRiMDugbA==
X-Received: by 2002:a05:6a20:72a5:b0:17b:40:cccd with SMTP id o37-20020a056a2072a500b0017b0040cccdmr15882848pzk.6.1698058309747;
        Mon, 23 Oct 2023 03:51:49 -0700 (PDT)
From: zhenwei pi <pizhenwei@bytedance.com>
To: stefanha@redhat.com,
	parav@nvidia.com,
	mst@redhat.com,
	jasowang@redhat.com
Cc: virtio-comment@lists.oasis-open.org,
	houp@yusur.tech,
	zhouhuaping.san@bytedance.com,
	xinhao.kong@duke.edu,
	raphael.norwitz@nutanix.com,
	zhenwei pi <pizhenwei@bytedance.com>
Date: Mon, 23 Oct 2023 18:46:46 +0800
Message-Id: <20231023104647.290759-7-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231023104647.290759-1-pizhenwei@bytedance.com>
References: <20231023104647.290759-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] [PATCH v5 6/7] transport-fabrics: add device initialization

Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
---
 transport-fabrics.tex | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/transport-fabrics.tex b/transport-fabrics.tex
index b458812..4e571be 100644
--- a/transport-fabrics.tex
+++ b/transport-fabrics.tex
@@ -759,3 +759,36 @@ \subsubsection{RDMA}\label{sec:Virtio Transport Options / Virtio Over Fabrics /
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

