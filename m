Return-Path: <virtio-comment-return-6370-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 643D0EB64DB
	for <virtio-comment@archiver.kernel.org>; Mon, 19 Jun 2023 08:35:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id B024644364
	for <virtio-comment@archiver.kernel.org>; Mon, 19 Jun 2023 08:35:31 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C8235986812
	for <virtio-comment@archiver.kernel.org>; Mon, 19 Jun 2023 08:35:30 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 6523C986815; Mon, 19 Jun 2023 08:35:30 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4DEA098639E
	for <virtio-comment@lists.oasis-open.org>; Mon, 19 Jun 2023 08:34:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687163641; x=1689755641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=37oNXvoPwf10cVD8N5hV7hkK4y8OSc8cYxwmKzvlbM0=;
        b=dR/4YhcScn2ePdPsVNvk4BwBr/R4ZG/BD9Nk2y8a7pGwwcERZldD9r1QwPzfLzsRWZ
         rJ8mYhTD8frFwNogEZZh9BjjNpcx5euJgJZFvfphCAtfF3qvqVHCAJk2bQOow0suFZ2X
         06gKTCfx5vrKYA6hmoqM/zlufDVCbxsCzfjK3yqDWSfCJsZi44098BlANWTDZ8uigHo8
         J76rVJp58TVcQDohnNebm5u7CjYrg2e1nS8Z7JfotJEjQsQeiNUVY/d1bOkhSa+AtSFd
         ceiia5QyqMOlrTUyoMy7VH5Qc4nPxPncubohc9u/c95Z+dHycwu3iCQ+B06swAVGjNs8
         ZdCg==
X-Gm-Message-State: AC+VfDyczzP+X+kMkIWiPuObXG9lxLyeu2F1MD2zLjx7Gi35q6Wb4zS2
	4Hw/6Gy9s7M2LvHlwnsM4jsaIZSfriJOvEZum3g=
X-Google-Smtp-Source: ACHHUZ77/z6h5eBXE3WWlf003wLHiZWICik2WyaK6jeEOJyYt5v11vDNFrFZ/VVBzEMUugVQc3u5CA==
X-Received: by 2002:a17:90a:4d88:b0:25c:18ad:6b82 with SMTP id m8-20020a17090a4d8800b0025c18ad6b82mr11742135pjh.21.1687163640749;
        Mon, 19 Jun 2023 01:34:00 -0700 (PDT)
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
Date: Mon, 19 Jun 2023 16:31:26 +0800
Message-Id: <20230619083131.1544999-3-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230619083131.1544999-1-pizhenwei@bytedance.com>
References: <20230619083131.1544999-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] [PATCH v3 2/7] transport-fabrics: introduce Virtio-oF Qualified Name

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

