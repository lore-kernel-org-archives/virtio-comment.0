Return-Path: <virtio-comment-return-7907-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA4ECCDB474
	for <virtio-comment@archiver.kernel.org>; Mon, 23 Oct 2023 10:51:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 059542AD54
	for <virtio-comment@archiver.kernel.org>; Mon, 23 Oct 2023 10:51:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id F0DD998697A
	for <virtio-comment@archiver.kernel.org>; Mon, 23 Oct 2023 10:51:35 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id E809698666D; Mon, 23 Oct 2023 10:51:35 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DAD22986670
	for <virtio-comment@lists.oasis-open.org>; Mon, 23 Oct 2023 10:51:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698058295; x=1698663095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1gqzK1hey+I7H3k4EaY/j/cnm7PNbVvcdHQ7GPsksUU=;
        b=opvztpLdhEdo2fmFhOcsQdIsg7nXUM53YGXPE7kz3WN1QxTthbem64JJIBuABCakNf
         6CFLJM13QUybrQ1T2UBGmQb6GCbVlPIdL8Fzwc/6YvkYwPYfgaBp/iwAPxACHd8BSPQl
         X2eXhmG5f0NojmSDIQ83QLrzHFwDfF7bySNjM/7rWVwZsTwKMkTLRvTWfuei4cT2U+Ya
         2ZEbNoQ1uWn1PV2hoTxXB6R/A15JNyJTqc5qKyVqPlfYjj47HjQJwPODI0nyMNHWncbX
         YvaEEgRLFJ5A+Qz6y8gz2lttMgIeU1YVheLOri2S5kyCDrmez42fIf5qCxg1Rmyxxrv9
         zHLw==
X-Gm-Message-State: AOJu0YwMlFeggHpRAOeTgvTytm7LeNE+8bDm3vVqJRdvKmC2611E4MfS
	YRWNHTekhgxz2LtEgcTrsbtF1A==
X-Google-Smtp-Source: AGHT+IGXKOb/LOpL+gc/Y2Pf2SYQsJP1dBQcdzaA1uJ3Ke4OhRal5hBZkC91w1Xnvbx8gitUIiRFDA==
X-Received: by 2002:a05:6870:b682:b0:1d5:a980:9caa with SMTP id cy2-20020a056870b68200b001d5a9809caamr11643959oab.29.1698058294712;
        Mon, 23 Oct 2023 03:51:34 -0700 (PDT)
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
Date: Mon, 23 Oct 2023 18:46:42 +0800
Message-Id: <20231023104647.290759-3-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231023104647.290759-1-pizhenwei@bytedance.com>
References: <20231023104647.290759-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] [PATCH v5 2/7] transport-fabrics: introduce Virtio-oF Qualified Name

Add VQN section. The VQN is a little different from iSCSI/NVMe-oF on
style limitation. Because iSCSI/NVMe-of is storage specific protocol,
the full string IQN(for iSCSI/iSER) and NQN(for NVMe-oF) represents
a "storage access address". However, Virtio Over Fabrics works as
transport layer rather than device layer, a URL style string is better
to Virtio Over Fabrics. For example:
virtio-rdma://192.168.1.100:8549/blk-device/nvme-pool/849a39ad-8d7b-4a7a-adb6-e7407ace532c
virtio-tcpip://192.168.1.110/blk-device/hdd-pool/238151a7-acd7-4621-bbdf-382ddbccb6a1
virtio-tcpip://192.168.1.100:8549/crypto-device/25307f22-e5a8-4ea2-b7ca-79f5c3bebc3c
...

A human readable VQN is helpful to maintain/debug/distinguish.
Note that this section only defines the "VQN" schema.
For a process, the following two are both fine:
~# ./foo --full-url virtio-rdma://192.168.1.100:8549/blk-device/nvme-pool/849a39ad-8d7b-4a7a-adb6-e7407ace532c
~# ./foo --transport rdma --address 192.168.1.100 --port 8549
  --tvqn blk-device/hdd-pool/238151a7-acd7-4621-bbdf-382ddbccb6a1

Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
---
 transport-fabrics.tex | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/transport-fabrics.tex b/transport-fabrics.tex
index d10be2a..54d7558 100644
--- a/transport-fabrics.tex
+++ b/transport-fabrics.tex
@@ -30,3 +30,18 @@ \section{Virtio Over Fabrics}\label{sec:Virtio Transport Options / Virtio Over F
 which executes the bulk data transport on virtio devices.
 \item The arrival of data on the Virtio-oF queue indicates that a notification has arrived.
 \end{itemize}
+
+
+\subsection{Virtio-oF Qualified Name}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Virtio-oF Qualified Name}
+Virtio-oF Qualified Names (VQNs) are used to uniquely describe a Virtio-oF initiator
+or a Virtio-oF target for identification.
+
+A VQN is encoded as a string of Unicode characters with the following properties:
+
+\begin{itemize}
+\item The encoding is UTF-8 (refer to RFC 3629).
+\item The characters dash('-'), dot ('.') and slash('/') are used in formatting.
+\item The string is NUL terminated.
+\item The maximum name is 256 bytes in length, including the NUL character.
+\item There is no strict style limitation.
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

