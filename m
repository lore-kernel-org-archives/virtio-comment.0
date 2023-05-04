Return-Path: <virtio-comment-return-5758-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64DBBC7EE21
	for <virtio-comment@archiver.kernel.org>; Thu,  4 May 2023 08:21:30 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id B83A211B66E
	for <virtio-comment@archiver.kernel.org>; Thu,  4 May 2023 08:21:29 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id AF1AD9866B5
	for <virtio-comment@archiver.kernel.org>; Thu,  4 May 2023 08:21:29 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id A484E9866A4; Thu,  4 May 2023 08:21:29 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 945AB9866AE
	for <virtio-comment@lists.oasis-open.org>; Thu,  4 May 2023 08:21:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683188488; x=1685780488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ppgI6birWv1K9Zuj3GXg4GdX4Ls/cXB9XTOZp/0eC5E=;
        b=QxHC586IQqn5n4wNzaEq+DqENqXW1X4HQmbYaCJMD/U8An5Lwha0iNr3hQZQ97gj4l
         hBNWmuwQk4fOh0o2xw87L2+yn/ed4YbkfIfluYMs13QHpB9eJrJGn0Bh6rJG8W0H8ZdZ
         OCFjL5DZAl0cUTEvKBhD+JZ9lC5uzTiNrgdWJ+Q0s5eTX4v709QWA89BnaZvtujAqGFG
         MW8HTj9ABNF8MYfawFNFePqt9RpVUW0DTal8tBsG4kZMkr1sgnCxTp9M36FsDY6MKDoz
         cx+TDWjPDjo3W1NiMNcXTzaj8HVbuwxXsdjeqZevBFq1VShQBdt4l3ByJWRj5TUkJxY0
         GQyQ==
X-Gm-Message-State: AC+VfDwTEFRltoqMmeG6wzuaZi+tDqkcVSAo8Czebog+TZPJ53L6/Ite
	rXE6vxUlr9Qub1FrS94gawt7V4iUaHABbJRCKB5nWA==
X-Google-Smtp-Source: ACHHUZ6Todx2b/ODgjS85yQXl/wNEEmK941Zm1HcU0s96PXPRx8rZEvUpmvmgTao3yxFRi1/DlHy+w==
X-Received: by 2002:a17:90b:888:b0:24e:4b1c:74d2 with SMTP id bj8-20020a17090b088800b0024e4b1c74d2mr1264260pjb.32.1683188488023;
        Thu, 04 May 2023 01:21:28 -0700 (PDT)
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
Date: Thu,  4 May 2023 16:19:01 +0800
Message-Id: <20230504081910.238585-3-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230504081910.238585-1-pizhenwei@bytedance.com>
References: <20230504081910.238585-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] [PATCH v2 02/11] transport-fabrics: introduce Virtio Qualified Name

Add VQN section. The VQN is a little different from iSCSI/NVMe-oF on
style limitation. Because iSCSI/NVMe-of is storage specific protocol,
the full string IQN(for iSCSI/iSER) and NQN(for NVMe-oF) represents
a "storage access address". However, Virtio Over Fabrics works as
transport layer rather than device layer, a URL style string is better
to Virtio Over Fabrics. For example:
virtio-of://blk-resource/nvme-pool/849a39ad-8d7b-4a7a-adb6-e7407ace532c
virtio-of://blk-resource/hdd-pool/238151a7-acd7-4621-bbdf-382ddbccb6a1
...
virtio-of://crypto-resource/25307f22-e5a8-4ea2-b7ca-79f5c3bebc3c

A hunam readable VQN is helpful to maintain/debug/distinguish.

Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
---
 transport-fabrics.tex | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/transport-fabrics.tex b/transport-fabrics.tex
index 0dc031b..26b0192 100644
--- a/transport-fabrics.tex
+++ b/transport-fabrics.tex
@@ -29,3 +29,19 @@ \section{Virtio Over Fabrics}\label{sec:Virtio Transport Options / Virtio Over F
 initiator to generate a host interrupt. It is the responsibility of the host
 fabric interface to generate host interrupts.
 \end{itemize}
+
+\subsection{Virtio Qualified Name}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Virtio Qualified Name}
+Virtio Qualified Names (VQNs) are used to uniquely describe an initiator or a
+target for the purposes of identification.
+
+A VQN is encoded as a string of Unicode characters with the following
+properties:
+
+\begin{itemize}
+\item The encoding is UTF-8 (refer to RFC 3629).
+\item The characters dash('-'), dot ('.'), slash('/') and colon(':') are used
+in formatting.
+\item The maximum name is 256 bytes in length.
+\item The string is null terminated.
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

