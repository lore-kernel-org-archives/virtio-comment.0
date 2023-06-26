Return-Path: <virtio-comment-return-6511-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B3BFEB64DC
	for <virtio-comment@archiver.kernel.org>; Mon, 26 Jun 2023 07:28:35 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id C3B3542592
	for <virtio-comment@archiver.kernel.org>; Mon, 26 Jun 2023 07:28:34 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B8377986426
	for <virtio-comment@archiver.kernel.org>; Mon, 26 Jun 2023 07:28:34 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id AC5B3986394; Mon, 26 Jun 2023 07:28:34 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9BD73986407
	for <virtio-comment@lists.oasis-open.org>; Mon, 26 Jun 2023 07:28:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687764513; x=1690356513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bhVpu+9zEG4MDbDbIJW1FbHkgIXH3JlWovg014jXbHI=;
        b=KRBJh/FYein77x0/J6tCCEWW1UvUv0itLpiWQTsW9nZZZLryGB7nwEn+xlZ1foBvtJ
         gKGMx/o4/9qgrWhso+4ZzFscZyBVPL6RlR5QWfkRYqgHNsVd0e8SJxNznxUbXF4lgHID
         4m25xLfLcpfHbIN/eAdqKUJA9Cd8xMe3rJhVZlgd/V4EZhypkEdXJFuyMBREma5h+Jjc
         h8C7Bqd0S9EEzH0FQQ3IIC/m/mtvsuJy2TnbkKiAi4ennfoZoo9wYbhzLBnnDt8eqV2+
         8CPNQ8B+/f5cNP/6Na9XVSw1kkoMOPNPOdjy8ezx8FRb2LFlrnyNhe+rmMLrpnUcUXKW
         ImXw==
X-Gm-Message-State: AC+VfDyoQbrwH9V+HCc/kX4TXcUAmyvsXqwqN7jbciXmkBPlVdVlosF3
	VHsirQ42/xjnJa+pZyP3eJF84A==
X-Google-Smtp-Source: ACHHUZ4mt4OJQAkboU0Me4PabvA/jr5hOrC/Om0S/v0oU34QHJLYYu7lP5cwR/n7cz+ppVJjazWiFg==
X-Received: by 2002:a05:6808:1992:b0:3a0:ff3a:72f3 with SMTP id bj18-20020a056808199200b003a0ff3a72f3mr13558406oib.2.1687764513167;
        Mon, 26 Jun 2023 00:28:33 -0700 (PDT)
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
Date: Mon, 26 Jun 2023 15:25:49 +0800
Message-Id: <20230626072551.1709389-6-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230626072551.1709389-1-pizhenwei@bytedance.com>
References: <20230626072551.1709389-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] [PATCH v4 5/7] transport-fabrics: introduce transport binding

Add TCP/IP, TLS TCP/IP, RDMA transports.

Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
---
 transport-fabrics.tex | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/transport-fabrics.tex b/transport-fabrics.tex
index 3fd9e8e..75e4855 100644
--- a/transport-fabrics.tex
+++ b/transport-fabrics.tex
@@ -729,3 +729,29 @@ \subsubsection{Opcodes}\label{sec:Virtio Transport Options / Virtio Over Fabrics
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
+\item The Virtio-oF target reads the remote data by RDMA SEND.
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

