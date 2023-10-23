Return-Path: <virtio-comment-return-7908-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57F65CDB474
	for <virtio-comment@archiver.kernel.org>; Mon, 23 Oct 2023 10:51:40 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id BB32C2A88A
	for <virtio-comment@archiver.kernel.org>; Mon, 23 Oct 2023 10:51:39 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B364098694F
	for <virtio-comment@archiver.kernel.org>; Mon, 23 Oct 2023 10:51:39 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id A998D98666C; Mon, 23 Oct 2023 10:51:39 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9BF28986676
	for <virtio-comment@lists.oasis-open.org>; Mon, 23 Oct 2023 10:51:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698058298; x=1698663098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sp4mWz0EXA5hjSLzu5g1/ElmKe7oyOxwBs6i1WFkNTo=;
        b=xQNMKDO4jH4xAbC6qYiKSs3SeFxGAHGDJCUOaWD5ToymnRfJvGP0SuuoakYiWYyVLo
         PEN2DcAwWO2f80F5zCPETTP/2v9XZW1Sxr7/2U32GPf1mMn8wz2VvpP/sVCcHUV9oKIn
         mUR+VfGlxOyixBOrJ65Tap9LJ0iA8puUrH6jZR6aKJm9OUXM+w0axfliNdGaDZjhZ+LR
         G3HHSGgWyAAFmJvR4AfdT89gPwIHgtyBkQFupWBwo5Zuxgh2aInLK3umz4+ilSAvLDVF
         +LfFnt3YpYm5W/68Qx0C0CblOrvreGJSD/41yzfrIrhDbbGcPDyNDUwxt/AqjWCBHzHI
         jq+A==
X-Gm-Message-State: AOJu0Yy34egW5yepOVf1Q6uD/igt5dbRMvkYUP9j+MGyOoz8fgtMDz09
	qf+A9zStzo/YpPNIohnk/hUwYw==
X-Google-Smtp-Source: AGHT+IHhu0teR42IFs9Ba584S2VZrY96if3PM0GwaasLaOEYYfeIQnf9oM+Tw+mgapAdSXGoYbfFEg==
X-Received: by 2002:a05:6358:a50:b0:168:ea01:7fe7 with SMTP id 16-20020a0563580a5000b00168ea017fe7mr251530rwb.22.1698058298408;
        Mon, 23 Oct 2023 03:51:38 -0700 (PDT)
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
Date: Mon, 23 Oct 2023 18:46:43 +0800
Message-Id: <20231023104647.290759-4-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231023104647.290759-1-pizhenwei@bytedance.com>
References: <20231023104647.290759-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] [PATCH v5 3/7] transport-fabrics: introduce Virtio-oF Protocol Data Unit

Introduce Virtio-oF PDU for Virtio-oF queue, add Stream Data Transfers
and Keyed Data Transfers mechanism.

Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
---
 transport-fabrics.tex | 68 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/transport-fabrics.tex b/transport-fabrics.tex
index 54d7558..d562b2c 100644
--- a/transport-fabrics.tex
+++ b/transport-fabrics.tex
@@ -45,3 +45,71 @@ \subsection{Virtio-oF Qualified Name}\label{sec:Virtio Transport Options / Virti
 \item The maximum name is 256 bytes in length, including the NUL character.
 \item There is no strict style limitation.
 \end{itemize}
+
+
+\subsection{Protocol Data Unit}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Protocol Data Unit}
+This section defines Virtio-oF Protocol Data Unit (PDU) for both the Virtio-oF control queue and Virtio-oF virtqueue.
+
+Virtio-oF PDU is a unit of information exchanged between a Virtio-oF initiator and a Virtio-oF target:
+\begin{itemize}
+\item A request Virtio-oF PDU from Virtio-oF initiator to Virtio-oF target contains command and associated data, if present.
+\item A response Virtio-oF PDU from Virtio-oF target to Virtio-oF initiator contains completion and associated data, if present.
+\end{itemize}
+
+\subsubsection{Stream Data Transfers}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Protocol Data Unit/ Stream Data Transfers}
+Stream-based (i.e. TCP/IP) Virtio-oF queue transfers Virtio-oF PDUs in a streaming fashion.
+
+The layout in a stream:
+\begin{lstlisting}
+PDUx and PDUz contain a command only, PDUy contains a command and data:
+
+     +----+     +---------+     +----+
+     |PDUx|     |   PDUy  |     |PDUz|
+ ... +----+ ... +----+----+ ... +----+ ...
+     |CMD |     |CMD |Data|     |CMD |
+     +----+     +---------+     +----+
+
+PDUl contains completion only, PDUm and PDUn contain completion and data:
+
+     +----+     +---------+     +---------+
+     |PDUl|     |   PDUm  |     |   PDUn  |
+ ... +----+ ... +----+----+ ... +----+----+ ...
+     |COMP|     |COMP|Data|     |COMP|Data|
+     +----+     +---------+     +---------+
+\end{lstlisting}
+
+\subsubsection{Keyed Data Transfers}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Protocol Data Unit/ Keyed Data Transfers}
+Message-based (i.e. RDMA) Virtio-oF queue transfers Virtio-oF PDUs in a message fashion, and uses the following structure to describe the remote data:
+
+\begin{lstlisting}
+struct virtio_of_keyed_desc {
+        /* the remote address of data */
+        le64 addr;
+        /* the length of data */
+        le32 length;
+        /* the key to access the remote data */
+        le32 key;
+};
+\end{lstlisting}
+
+A Virtio-oF control queue supports 1 keyed descriptor, and a Virtio-oF virtqueue supports 1 or more keyed descriptors.
+
+The PDUs of messages:
+\begin{lstlisting}
+PDUx contains a command only, PDUy contains a command and 1 descriptor,
+and PDUz contains a command and k - j + 1 descriptors.
+
+     +----+     +---------+     +--------------------+
+     |PDUx|     |   PDUy  |     |        PDUz        |
+ ... +----+ ... +----+----+ ... +----+-----+---+-----+ ...
+     |CMD |     |CMD |DESC|     |CMD |DESCj|...|DESCk|
+     +----+     +---------+     +----------+---+-----+
+
+PDUl, PDUm, and PDUn contain completion only.
+
+     +----+     +----+     +----+
+     |PDUl|     |PDUm|     |PDUn|
+ ... +----+ ... +----+ ... +----+ ...
+     |COMP|     |COMP|     |COMP|
+     +----+     +----+     +----+
+\end{lstlisting}
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

