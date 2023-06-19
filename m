Return-Path: <virtio-comment-return-6373-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F04AEB64DB
	for <virtio-comment@archiver.kernel.org>; Mon, 19 Jun 2023 08:35:43 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 7F53F613E1
	for <virtio-comment@archiver.kernel.org>; Mon, 19 Jun 2023 08:35:32 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 09BE598683C
	for <virtio-comment@archiver.kernel.org>; Mon, 19 Jun 2023 08:35:32 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id AC175986888; Mon, 19 Jun 2023 08:35:31 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B8D0F9863A9
	for <virtio-comment@lists.oasis-open.org>; Mon, 19 Jun 2023 08:34:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687163652; x=1689755652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b1KjHIr32jI7aZLSip+zikMJrY8d5lSCl0GcpO3Ws8A=;
        b=AwvZUfpdcTkVv1ckfZ4zPKcLzNHlA2kOJJhWpa6CHIszq7Q+Xvn1hEBUPDCX5KyQd8
         lr8aYKmgjhRHL2nBdOd4myszAff9oZ4GKPAN2aBbFHgWGJjoLS1P1UVD4PtXdDcyniyd
         HJPkfSKB2Kw9CoMmWFthdey2TKNQ+yXz3il5/MDdtpOB0BltOx1eQY52SRmo+sOjZhOu
         T1FeMXvybGwU2f/M4Hrjm+kD+/uUn8yIGP4A2B92YMMLDQs/5GPi+iFWL1e+3IcKljww
         t+v0hE08VSNSbmuMt/sa6vjTZ+A/gPvkKOXbg3uZlnY17X8Ov3Lt0qxB8Pse+T8dewYC
         pECg==
X-Gm-Message-State: AC+VfDypFcj/6JPZY2votUrELp7AYq+9j+fV7Fmt6l53uU5J03hSRrNr
	HLXIncReYfPuABUbMGyyGj9QFkQ3kbEvgMuLr5g=
X-Google-Smtp-Source: ACHHUZ6pzPCeOCaD1bzWNaj+JyAK8O68MmyrZ3Hc/vp47IY6/zzx/uYT0izG2LywHzZH1rdYNWPTYg==
X-Received: by 2002:a05:6808:2224:b0:398:4ad8:5ce6 with SMTP id bd36-20020a056808222400b003984ad85ce6mr11076502oib.30.1687163652525;
        Mon, 19 Jun 2023 01:34:12 -0700 (PDT)
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
Date: Mon, 19 Jun 2023 16:31:29 +0800
Message-Id: <20230619083131.1544999-6-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230619083131.1544999-1-pizhenwei@bytedance.com>
References: <20230619083131.1544999-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] [PATCH v3 5/7] transport-fabrics: introduce transport binding

Add TCP/IP, TLS TCP/IP, RDMA transports.

Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
---
 transport-fabrics.tex | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/transport-fabrics.tex b/transport-fabrics.tex
index 0891fc0..629e1f6 100644
--- a/transport-fabrics.tex
+++ b/transport-fabrics.tex
@@ -739,3 +739,29 @@ \subsubsection{Opcodes}\label{sec:Virtio Transport Options / Virtio Over Fabrics
         u8 reserved[12];
 };
 \end{lstlisting}
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

