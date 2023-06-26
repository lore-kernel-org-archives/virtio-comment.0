Return-Path: <virtio-comment-return-6509-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EC90EB64DC
	for <virtio-comment@archiver.kernel.org>; Mon, 26 Jun 2023 07:28:29 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 8CBB21FF8A
	for <virtio-comment@archiver.kernel.org>; Mon, 26 Jun 2023 07:28:28 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7E6F2986412
	for <virtio-comment@archiver.kernel.org>; Mon, 26 Jun 2023 07:28:28 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 74EB898636F; Mon, 26 Jun 2023 07:28:28 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 63505986367
	for <virtio-comment@lists.oasis-open.org>; Mon, 26 Jun 2023 07:28:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687764502; x=1690356502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=37oNXvoPwf10cVD8N5hV7hkK4y8OSc8cYxwmKzvlbM0=;
        b=BQdXGrgv4p25Nw4i5MX6P2r8M/MRgExlMVcK/MvCHMznED1NwDxvOw+9atmIw+DY4B
         +tmc2eO6hdjwt8W9XpubWRhUG2+o52kKF5m7qJRn3WqGDdLnK5aQFHsrLlZ/Q2Jpe68p
         lNcQL/sbkarAXbmOyZIb1vx14S/ZXsBfO+Q1e9rAfdjFfNrR8pjWOoMR/1lyY48KMsT2
         x8Ayf7lSsBdlgl2eBmEtMsJ7dA6FPILctz82OMz7p55FaG0cMFps49WZyTWgVccAG8nG
         zNxhYSwtN6u+N6m1brL0ud4tGdQOV2mhMLA0z06o/ylMMTo0Nsd1nTLG4KOOPIf3EFY5
         PDNw==
X-Gm-Message-State: AC+VfDyoeX84xeNIFMyAFxaKEowLNHDWteHexA/rrk5ZFO0qkeyqBHGY
	iCpbKVi9vYLfDDbgoqOYjGdjIkRMW7/2FKmKsKY=
X-Google-Smtp-Source: ACHHUZ6du+drrev+c/fTFooRFNCz7LBuchN/+kK31L3uNfpvqsbma2pqOWQhDW2hmwb6jEYuhm+1XQ==
X-Received: by 2002:a17:90b:1a8b:b0:262:fba6:59b5 with SMTP id ng11-20020a17090b1a8b00b00262fba659b5mr682363pjb.24.1687764501904;
        Mon, 26 Jun 2023 00:28:21 -0700 (PDT)
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
Date: Mon, 26 Jun 2023 15:25:46 +0800
Message-Id: <20230626072551.1709389-3-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230626072551.1709389-1-pizhenwei@bytedance.com>
References: <20230626072551.1709389-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] [PATCH v4 2/7] transport-fabrics: introduce Virtio-oF Qualified Name

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

A hunam readable VQN is helpful to maintain/debug/distinguish.
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

