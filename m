Return-Path: <virtio-comment-return-7910-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE0E2C004C0
	for <virtio-comment@archiver.kernel.org>; Mon, 23 Oct 2023 10:51:47 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 31D1A216A8
	for <virtio-comment@archiver.kernel.org>; Mon, 23 Oct 2023 10:51:47 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 23F2098697B
	for <virtio-comment@archiver.kernel.org>; Mon, 23 Oct 2023 10:51:47 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 181D3986670; Mon, 23 Oct 2023 10:51:47 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0A84D986671
	for <virtio-comment@lists.oasis-open.org>; Mon, 23 Oct 2023 10:51:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698058306; x=1698663106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HClKnRjrY5Y4qpjx0a9is32E7CI8bvGwIYSj9Qe8LJ8=;
        b=nMxu6vRO7z4EntJ20lId7pizoZ+IqFV3GHtSxK/4AMnbmSJ+xV57T6QJJJaFo4IodJ
         j00sIspz8IoRt0fj+f6Sts6BjTN/kYPNmfw6U+7znx4Mc05RTMPpg/XUKZN2WH6c0MUa
         A3jp3DWIKUM0SOSO3PCCTpgAvUBjPFWBEF4IBLE880X4tgnU6FbubuYfSncouzciODIH
         MUxpDe9cV73UjFfs6pqSvFfAaV7dO3qy6cQkSmmej9W/FxgMXJFIcRzWhUgSi1s57GWp
         VtR1NgD4pleAhi5zGrgbd6/BkcRxb1+OmY0ouQpBDM6B4KIbUtSS8Q6oi+YNu9/SroTz
         h8uA==
X-Gm-Message-State: AOJu0Yy8I7ntVnUad6Z6Ew3IoKQKpC8VNnShPN2cS5BKk0DZ2n1DyJdM
	+w7G3fq6SBdEZIA+fbJLqq65tQ==
X-Google-Smtp-Source: AGHT+IEpIv5mtl3lNS6Ys7MhnNaK4uNCoKnTpXy/wQZ0ScV37zCT1+WgOeuXRiioRH89k4lYtMxBOA==
X-Received: by 2002:a05:6870:10d8:b0:1ea:2e2c:e9e7 with SMTP id 24-20020a05687010d800b001ea2e2ce9e7mr9102601oar.59.1698058305956;
        Mon, 23 Oct 2023 03:51:45 -0700 (PDT)
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
Date: Mon, 23 Oct 2023 18:46:45 +0800
Message-Id: <20231023104647.290759-6-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231023104647.290759-1-pizhenwei@bytedance.com>
References: <20231023104647.290759-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] [PATCH v5 5/7] transport-fabrics: introduce transport binding

Add TCP/IP, TLS TCP/IP, RDMA transports.

Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
---
 transport-fabrics.tex | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/transport-fabrics.tex b/transport-fabrics.tex
index d794b16..b458812 100644
--- a/transport-fabrics.tex
+++ b/transport-fabrics.tex
@@ -733,3 +733,29 @@ \subsubsection{Opcodes}\label{sec:Virtio Transport Options / Virtio Over Fabrics
 \paragraph{Keepalive Completion}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Commands Definition / Opcodes / Keepalive Completion}
 A Keepalive Completion is used as a health check mechanism to detect when a Virtio-oF initiator becomes unavailable, it is used by a Virtio-oF device instance for the Virtio-oF control queue only.
 Once the Virtio-oF initiator becomes unavailable, the Virtio-oF target should destroy the Virtio-oF device instance and associated resources.
+
+
+\subsection{Transport Binding}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Transport Binding}
+
+\subsubsection{TCP/IP}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Transport Binding / TCP IP}
+Virtio-oF supports both TCP/IPv4 and TCP/IPv6, it uses
+\nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Protocol Data Unit/ Stream Data Transfers}.
+A TCP/IP based Virtio-oF target uses port 8549 (CRC-16/ARC of "Virtio") by default.
+
+\subsubsection{TLS TCP/IP}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Transport Binding / TLS TCP IP}
+Virtio-oF supports both TLS v1.2 and TLS v1.3 over the underlying TCP/IPv4 and TCP/IPv6, it uses
+\nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Protocol Data Unit/ Stream Data Transfers}.
+A TLS TCP/IP based Virtio-oF target uses port 8549 (CRC-16/ARC of "Virtio") by default.
+
+\subsubsection{RDMA}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Transport Binding / RDMA}
+Virtio-oF supports RDMA, it uses
+\nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Protocol Data Unit/ Keyed Data Transfers}.
+A RoCEv2 based Virtio-oF target uses UDP port 8549 (CRC-16/ARC of "Virtio") by default, and a iWARP based Virtio-oF target uses TCP port 8549 by default.
+
+RDMA uses the following operations:
+\begin{itemize}
+\item The Virtio-oF initiator sends a PDU by RDMA SEND.
+\item The Virtio-oF target reads the remote data by RDMA READ.
+\item The Virtio-oF target writes the remote data by RDMA WRITE.
+\item The Virtio-oF target sends a PDU by RDMA SEND.
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

