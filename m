Return-Path: <virtio-comment-return-7906-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C37CCDB474
	for <virtio-comment@archiver.kernel.org>; Mon, 23 Oct 2023 10:51:33 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id B89AF1CA257
	for <virtio-comment@archiver.kernel.org>; Mon, 23 Oct 2023 10:51:32 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id AD7D5986917
	for <virtio-comment@archiver.kernel.org>; Mon, 23 Oct 2023 10:51:32 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id A3C10986671; Mon, 23 Oct 2023 10:51:32 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 94E35986674
	for <virtio-comment@lists.oasis-open.org>; Mon, 23 Oct 2023 10:51:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698058291; x=1698663091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nlUsC2IjV9S086RqpiiIwnc/pj0CqIwo002RlsyxrBw=;
        b=Bf/Hd2BbqcJ6QHjzeQdaWtEXAuNneUmY60atOYYgo6n3XUqI9T9qKTEUdjGHipAi2o
         zqINOcMp5rYbDwaATZcRFdnY/2p9aAKzGi3BMFpUfyMuX9nKrouKFZdkyBd/MGw2M4cB
         QjlspCYm1vDfMx67T4cLskfRi2vUYDrr85uIedRrBIz+s9WCirjJT20qMFvNBgiATHzu
         GEIfeypH+lBpXp8N8ZxYv1c1/NeH/x7ib88EUp1RsyRjUB8EnzMfrKY43p5xhk8E2dtt
         +xh3KYydQz8tQ1leQAofGdLKJ7pCnZ1DycyAJzEzeEJccbZuEVG7L2bJjaR8lV+oBv3M
         f7IA==
X-Gm-Message-State: AOJu0Yw5CpiKeocxikbIDM7bsRpqtekVuiO8ZQV3WUsMqpNgPtVht028
	RIriHDAXFH/emjP1Eq4I8u7DJA==
X-Google-Smtp-Source: AGHT+IEDls7of4xmF416l1viOxj4VdM5ByC3TiZjnTd5Me3wfbHmdiEm/op7B+vVlZ3L2omCJaQI3w==
X-Received: by 2002:a05:6a21:3d87:b0:17a:d560:5d13 with SMTP id bj7-20020a056a213d8700b0017ad5605d13mr6731736pzc.22.1698058291094;
        Mon, 23 Oct 2023 03:51:31 -0700 (PDT)
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
Date: Mon, 23 Oct 2023 18:46:41 +0800
Message-Id: <20231023104647.290759-2-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231023104647.290759-1-pizhenwei@bytedance.com>
References: <20231023104647.290759-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] [PATCH v5 1/7] transport-fabrics: introduce Virtio Over Fabrics overview

In the past years, virtio supports lots of device specifications by
PCI/MMIO/CCW. These devices work fine in the virtualization environment.

Introduce Virtio Over Fabrics transport to support "network attached
peripheral devices". With this transport, Many Virtio based devices
work over fabrics. Note that the balloon device may not make sense,
shared memory regions won't work.

Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
---
 content.tex           |  1 +
 transport-fabrics.tex | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 33 insertions(+)
 create mode 100644 transport-fabrics.tex

diff --git a/content.tex b/content.tex
index 0a62dce..4140966 100644
--- a/content.tex
+++ b/content.tex
@@ -637,6 +637,7 @@ \chapter{Virtio Transport Options}\label{sec:Virtio Transport Options}
 \input{transport-pci.tex}
 \input{transport-mmio.tex}
 \input{transport-ccw.tex}
+\input{transport-fabrics.tex}
 
 \chapter{Device Types}\label{sec:Device Types}
 
diff --git a/transport-fabrics.tex b/transport-fabrics.tex
new file mode 100644
index 0000000..d10be2a
--- /dev/null
+++ b/transport-fabrics.tex
@@ -0,0 +1,32 @@
+\section{Virtio Over Fabrics}\label{sec:Virtio Transport Options / Virtio Over Fabrics}
+
+Virtio Over Fabrics (Virtio-oF) enables operations over fabrics that rely
+primarily on message passing.
+
+Virtio-oF uses a reliable connection to transmit data. The reliable
+connection facilitates communication between entities playing the following roles:
+
+\begin{itemize}
+\item A Virtio-oF initiator functions as a Virtio-oF client.
+The Virtio-oF initiator sends commands and associated data from the driver
+to the Virtio-oF target.
+\item A Virtio-oF target functions as a Virtio-oF server.
+The Virtio-oF target forwards commands to the device and sends completions
+and associated data back to the Virtio-oF initiator.
+\end{itemize}
+
+Virtio-oF has the following features:
+
+\begin{itemize}
+\item A Virtio-oF target is allowed to be connected by 0 or more Virtio-oF initiators.
+\item A Virtio-oF initiator is allowed to connect to a single Virtio-oF target only.
+A Virtio-oF device instance is a virtio device that the Virtio-oF initiator is
+accessing through the Virtio-oF target.
+\item There is a one-to-one mapping between the Virtio-oF queue and the reliable connection.
+\item There is one, and only one, Virtio-oF control queue for a Virtio-oF device instance.
+The Virtio-oF control queue is used to execute control commands,
+for example, to get the Virtio Device ID.
+\item There is a one-to-one mapping between virtqueue and Virtio-oF virtqueue
+which executes the bulk data transport on virtio devices.
+\item The arrival of data on the Virtio-oF queue indicates that a notification has arrived.
+\end{itemize}
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

