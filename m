Return-Path: <virtio-comment-return-5765-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 500D6C7EE23
	for <virtio-comment@archiver.kernel.org>; Thu,  4 May 2023 08:21:55 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id AF16619090A
	for <virtio-comment@archiver.kernel.org>; Thu,  4 May 2023 08:21:54 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A570B9866BE
	for <virtio-comment@archiver.kernel.org>; Thu,  4 May 2023 08:21:54 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 9BAFD9866AE; Thu,  4 May 2023 08:21:54 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8B6369866B7
	for <virtio-comment@lists.oasis-open.org>; Thu,  4 May 2023 08:21:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683188513; x=1685780513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ps1/qz4Be2QT8DKEMv/W43eRj1H4eqOOH+zQYyBUvHo=;
        b=FXmaNyxq1JMlCqu8alSG3+v8U8g8rNz/hdvRr6wYTjei10+lsxFu9IQepWJJYitXLJ
         U0byPMAy1KoYMkR1CLamHstA9OCIsjPC6Oz4WgGA7lRAQbfwAere03TUwCmEhlKhPYui
         fSZ787LMyvIh68xDJGnUk4wR9xGfM+9Bb4+F73CVbsEtVd1tfNhrJd/mvUlsrZFn1KAv
         7kdBDXuiaJdmZKuZ1xrsFsnV/B3Iyv98s3zvYavom9yRcNfc5CS3lB+T6XfNhoEaKWMb
         RQ/xosV0E21YQdb1eALkieSt+aFR9ozQbpYFX5mf3aNgTiZUMbJNIiDbW5wN/A013LND
         GgeA==
X-Gm-Message-State: AC+VfDx2t54+8S7oK4/KXL12C++wDbPPkbiEkXKZCmqFoHq9W3gDe16O
	fr+VGWSnAyZJspdZoTX7F83RJw==
X-Google-Smtp-Source: ACHHUZ6d6lcKUibHDZX3xYUWxCcBC7IXpgsikwnKXPwnphYyzOK4n6QJ4Auk7Pi9DcIJJDFiK4V2dw==
X-Received: by 2002:a17:90a:3807:b0:246:9c75:351a with SMTP id w7-20020a17090a380700b002469c75351amr1341256pjb.12.1683188512930;
        Thu, 04 May 2023 01:21:52 -0700 (PDT)
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
Date: Thu,  4 May 2023 16:19:08 +0800
Message-Id: <20230504081910.238585-10-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230504081910.238585-1-pizhenwei@bytedance.com>
References: <20230504081910.238585-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] [PATCH v2 09/11] transport-fabrics: add TCP&RDMA binding

Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
---
 transport-fabrics.tex | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/transport-fabrics.tex b/transport-fabrics.tex
index f563c3e..c47a744 100644
--- a/transport-fabrics.tex
+++ b/transport-fabrics.tex
@@ -873,3 +873,12 @@ \subsubsection{Status Definition}\label{sec:Virtio Transport Options / Virtio Ov
 #define VIRTIO_OF_EALREADY      114
 #define VIRTIO_OF_EQUIRK        4096
 \end{lstlisting}
+
+\subsection{Transport Binding}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Transport Binding}
+\subsubsection{TCP}\label{sec:Virtio Transport Options / Virtio Over Fabrics / ransport Binding / TCP}
+TCP MUST use \ref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Commands Definition / Stream Transmission}
+~\nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Commands Definition / Stream Transmission}.
+
+\subsubsection{RDMA}\label{sec:Virtio Transport Options / Virtio Over Fabrics / ransport Binding / RDMA}
+RDMA MUST use \ref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Commands Definition / Keyed Transmission}
+~\nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Commands Definition / Keyed Transmission}.
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

