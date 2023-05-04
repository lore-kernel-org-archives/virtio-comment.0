Return-Path: <virtio-comment-return-5763-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8494FC7EE21
	for <virtio-comment@archiver.kernel.org>; Thu,  4 May 2023 08:21:51 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id DCAA4157EEB
	for <virtio-comment@archiver.kernel.org>; Thu,  4 May 2023 08:21:50 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D11309866B6
	for <virtio-comment@archiver.kernel.org>; Thu,  4 May 2023 08:21:50 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id C851098663F; Thu,  4 May 2023 08:21:50 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B89CD98667D
	for <virtio-comment@lists.oasis-open.org>; Thu,  4 May 2023 08:21:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683188509; x=1685780509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=egMLM8IYdt+9eyEM2YiFFLdutvVIe1BlO8/5VKpS3Kk=;
        b=IYa4vqiWllVkSj/aYczNvVZ/UC3NrUX5DZd1ht1ooNyJURXZT2RWvDyanHyKqfvhJK
         Pg8oerAVL7pU33u2hiMeB9z3vMeVyR6mt6xGrINhxjP33KIjJ9MMRrkh4QtJZLO6QqH3
         amkmakfWg2zC4IKhXaOmCqJHCUPaj4I1g5hMOpqJW5mwrJtFVVhRwrVmP+blmz+iKgRx
         +sVbkCYHnYrEaMsgprO+B/2oCiS/C3CaB3K/ikhA1sl85I0uKX1wHoA5yWJpDlOkjpc/
         +0YY60BE6eBXCqM+znWLgVuHWwAMe2LacPFTSQ3Uuy6eqGYRboiEr8KBH5WuFwQKfrXy
         VnKQ==
X-Gm-Message-State: AC+VfDyHpVu6Ea2uzSekO7YXdQkHYOff+h+++y9wP/ofK1UufwZy8jud
	gCGGzMVgMNPjhcQTlcLDOS5cKw==
X-Google-Smtp-Source: ACHHUZ6XHl0jYbUP5ICw2edO/YdjkqzpEG9Fpe8XSmLtfxJuS7nPw2q/eisLraKCumm/PgwgdT+lyw==
X-Received: by 2002:a17:90a:12cb:b0:24e:113d:db82 with SMTP id b11-20020a17090a12cb00b0024e113ddb82mr1416300pjg.8.1683188509411;
        Thu, 04 May 2023 01:21:49 -0700 (PDT)
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
Date: Thu,  4 May 2023 16:19:07 +0800
Message-Id: <20230504081910.238585-9-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230504081910.238585-1-pizhenwei@bytedance.com>
References: <20230504081910.238585-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] [PATCH v2 08/11] transport-fabrics: introduce status of completion

Define status of completion, currently status 0-114 has the same
meaning to the linux error code, because these status are used for
many years, they are clear and friendly to linux system developers
(even for other platform developers).

Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
---
 transport-fabrics.tex | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/transport-fabrics.tex b/transport-fabrics.tex
index 026ff5f..f563c3e 100644
--- a/transport-fabrics.tex
+++ b/transport-fabrics.tex
@@ -838,3 +838,38 @@ \subsubsection{Opcodes Definition}\label{sec:Virtio Transport Options / Virtio O
 
 virtio_of_op_set_config is used to set the config of a device for control queue only.
 The initiator MUST issue a \nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Commands Definition / Config Command} with specified offset and bytes and value fields.
+
+\subsubsection{Status Definition}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Status Definition}
+This section defines status for Virtio Over Fabrics Completion.
+
+\begin{lstlisting}
+#define VIRTIO_OF_SUCCESS       0
+#define VIRTIO_OF_EPERM         1
+#define VIRTIO_OF_ENOENT        2
+#define VIRTIO_OF_EIO           5
+#define VIRTIO_OF_ENXIO         6
+#define VIRTIO_OF_E2BIG         7
+#define VIRTIO_OF_ENOMEM        12
+#define VIRTIO_OF_EACCES        13
+#define VIRTIO_OF_EFAULT        14
+#define VIRTIO_OF_EBUSY         16
+#define VIRTIO_OF_EEXIST        17
+#define VIRTIO_OF_ENODEV        19
+#define VIRTIO_OF_EINVAL        22
+#define VIRTIO_OF_ERANGE        34
+#define VIRTIO_OF_ENOSYS        38
+#define VIRTIO_OF_ECHRNG        44
+#define VIRTIO_OF_EUNATCH       49
+#define VIRTIO_OF_EBADE         52
+#define VIRTIO_OF_EBADR         53
+#define VIRTIO_OF_EBADRQC       56
+#define VIRTIO_OF_ENODATA       61
+#define VIRTIO_OF_EPROTO        71
+#define VIRTIO_OF_EBADMSG       74
+#define VIRTIO_OF_ENOTUNIQ      76
+#define VIRTIO_OF_EREMCHG       78
+#define VIRTIO_OF_EUSERS        87
+#define VIRTIO_OF_EOPNOTSUPP    95
+#define VIRTIO_OF_EALREADY      114
+#define VIRTIO_OF_EQUIRK        4096
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

