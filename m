Return-Path: <virtio-comment-return-6369-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91303EB64DC
	for <virtio-comment@archiver.kernel.org>; Mon, 19 Jun 2023 08:35:32 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id E29D342597
	for <virtio-comment@archiver.kernel.org>; Mon, 19 Jun 2023 08:35:30 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 71DAA9865B6
	for <virtio-comment@archiver.kernel.org>; Mon, 19 Jun 2023 08:35:30 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id E30F898640B; Mon, 19 Jun 2023 08:35:29 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2D1F0986399
	for <virtio-comment@lists.oasis-open.org>; Mon, 19 Jun 2023 08:33:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687163636; x=1689755636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e6pCWE1bLSVs1o0At2WaN2zF00aRYkDdCGOG10x1zl4=;
        b=NOB3Yb3dLUgKs+uxzq8ZpVhQch+TtVMqRp8fTKC4dAyr5HKQ3EWabQuonhhd+pKGXF
         9LldPc+F9xMen3gNbk/uoAYy7RwULZ1ZpE7BD09fm8itJ1BwIM2+4vj3zGM3CzvcHDMO
         j7p54QE3WHyFTrd/kT4RQFG9Pos/uIQYdCvxkePHX1rrFdQQ+rOGF9L6yiLMgR9/FMLA
         SNz0PNqB6HYqeyDwLAiGqvrmqoJyOwvKirqElCcNOkiBRTmrJUW9VQtipAH4hDLWpqpJ
         PljbNeTLH4RCvF4i0Py6P8TDfD5d0CTJK5QYRhrBNDFRrAcfaRr1VvgTHf7IUEbabg+j
         e9+Q==
X-Gm-Message-State: AC+VfDzQ9PWxhfSLWil2ksZ+sgdMeu3Ovstfn1dqnz7yjbgEEEHigG+c
	pq4gcVpBU8ATuHrZlO+WsX1VSw==
X-Google-Smtp-Source: ACHHUZ5kpIWnP+nCrt1ZFiDXmJxK4kAZFBALnIrU3FM9BG6wWazeIG0KNDKWdBxA0y6VZWZPPuA3Mg==
X-Received: by 2002:a17:90b:4384:b0:25e:e11f:e094 with SMTP id in4-20020a17090b438400b0025ee11fe094mr4387757pjb.20.1687163636415;
        Mon, 19 Jun 2023 01:33:56 -0700 (PDT)
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
Date: Mon, 19 Jun 2023 16:31:25 +0800
Message-Id: <20230619083131.1544999-2-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230619083131.1544999-1-pizhenwei@bytedance.com>
References: <20230619083131.1544999-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] [PATCH v3 1/7] transport-fabrics: introduce Virtio Over Fabrics overview

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
index d2ab9eb..bbbd79e 100644
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

