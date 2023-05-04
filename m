Return-Path: <virtio-comment-return-5760-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AD2CC7EE21
	for <virtio-comment@archiver.kernel.org>; Thu,  4 May 2023 08:21:37 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id BEDA11318CB
	for <virtio-comment@archiver.kernel.org>; Thu,  4 May 2023 08:21:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B3A809866B9
	for <virtio-comment@archiver.kernel.org>; Thu,  4 May 2023 08:21:36 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id A9D4598663F; Thu,  4 May 2023 08:21:36 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 99616986640
	for <virtio-comment@lists.oasis-open.org>; Thu,  4 May 2023 08:21:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683188495; x=1685780495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WQRf5FWc8h91El1/Dzp07anAXabpgv2augiS3cZvLRw=;
        b=Qtk/dNVlRrwTuAQSJ4S30HCt0W1FVBNJzSAOjNqT6V5ftacWmyXZBwmZ2fA5B4K1UY
         rEUncJNOrht3gFYd/9dGzgCb7V6B1I4hyD+qYALeGkDVjC+O4ouQtSkhqTVHErXsoGxp
         23V4acqrI1uSV+0yH3FtoHBRfW+YTWezpPnltfQts/tuC+yEW/qagocap/cAA725enpo
         GBwkjP3TPmEZsuPLO1VIoxwKcFP52BIJtTrnbMznkVm2YioKFw2MCVnua2ykS3ZYCwGA
         qg4ajm31h3EO8MpDU4WUy3SRrCSl5Qq3QIMjFt7amXAkF+pybk205XeyhC/voDdeX4Xs
         73jA==
X-Gm-Message-State: AC+VfDywvhA5XM96JYG44LezE3ZoJZEfC6ywZd5Fe4uBBW/54XqjDHVx
	MgsL9SqsBc0g0FIbjN8nJ/0xUg==
X-Google-Smtp-Source: ACHHUZ5ngufVryyiGfhzCVsR1Wy2kOCWYIT8eAa6sZ94k506DyC+tyHZqWhXFmuhEeEpZO+RlNSuDA==
X-Received: by 2002:a17:90a:5d8c:b0:246:a5d8:cb73 with SMTP id t12-20020a17090a5d8c00b00246a5d8cb73mr1663431pji.14.1683188495065;
        Thu, 04 May 2023 01:21:35 -0700 (PDT)
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
Date: Thu,  4 May 2023 16:19:03 +0800
Message-Id: <20230504081910.238585-5-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230504081910.238585-1-pizhenwei@bytedance.com>
References: <20230504081910.238585-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] [PATCH v2 04/11] transport-fabrics: introduce Stream Transmission

Stream transmission is used for stream oriented communication(Ex TCP),
also add virtio-blk read/write 8K example.

Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
---
 transport-fabrics.tex | 229 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 229 insertions(+)

diff --git a/transport-fabrics.tex b/transport-fabrics.tex
index b88acfd..c02cf26 100644
--- a/transport-fabrics.tex
+++ b/transport-fabrics.tex
@@ -88,3 +88,232 @@ \subsubsection{Segment Descriptor Definition}\label{sec:Virtio Transport Options
 \end{tabular}
 
 Depending on the opcode, a Command contains zero or more structure virtio_of_vring_desc.
+
+\subsubsection{Buffer Mapping Definition}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Buffer Mapping Definition}
+Virtio Over Fabrics defines two types of buffer mapping rules.
+
+\paragraph{Stream Transmission}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Commands Definition / Stream Transmission}
+Command, Segment Descriptors, and buffer are transmitted in a stream within a
+connection. The layout in stream:
+
+\begin{lstlisting}
+CMDx contains 0 descriptor, CMDy contains (n - m + 1) descriptors and buffer:
+
+     +-----+     +-----++-----+     +-----++-----+
+ ... | CMDx| ... | CMDy||DESCm| ... |DESCn|| BUF | ...
+     +-----+     +-----++-----+     +-----++-----+
+
+COMPx contains 0 descriptor, COMPy contains (k - j + 1) descriptors and buffer:
+
+     +-----+     +-----++-----+     +-----++-----+
+ ... |COMPx| ... |COMPy||DESCj| ... |DESCk|| BUF | ...
+     +-----+     +-----++-----+     +-----++-----+
+\end{lstlisting}
+
+An example of a virtio-blk write 8K request(total size: sizeof(Command) +
+4 * sizeof(Descriptor) + 8208):
+\begin{lstlisting}
+ COMMAND            +------+
+                    |opcode|  ->  virtio_of_op_vring
+                    +------+
+                    |cmd id|  ->  10
+                    +------+
+                    |length|  ->  8208
+                    +------+
+                    |ndesc |  ->  4
+                    +------+
+                    |rsvd  |
+                    +------+
+
+ DESC0              +------+
+              +-----|addr  |  -> 0
+              |     +------+
+              |     |length|  -> 16 (virtio blk write command)
+              |     +------+
+              |     |id    |  -> 0
+              |     +------+
+              |     |flags |  -> 0
+              |     +------+
+              |
+ DESC1        |     +------+
+              | +---|addr  |  -> 16
+              | |   +------+
+              | |   |length|  -> 4096
+              | |   +------+
+              | |   |id    |  -> 1
+              | |   +------+
+              | |   |flags |  -> 0
+              | |   +------+
+              | |
+ DESC2        | |   +------+
+              | | +-|addr  |  -> 4112
+              | | | +------+
+              | | | |length|  -> 4096
+              | | | +------+
+              | | | |id    |  -> 2
+              | | | +------+
+              | | | |flags |  -> 0
+              | | | +------+
+              | | |
+ DESC3        | | | +------+
+              | | | |addr  |  -> 0
+              | | | +------+
+              | | | |length|  -> 1
+              | | | +------+
+              | | | |id    |  -> 3
+              | | | +------+
+              | | | |flags |  -> VIRTIO_OF_DESC_F_WRITE
+              | | | +------+
+              | | |
+ DATA         +-+-+>+------+  -> 0
+                | | |......|
+                +-+>+------+  -> 16
+                  | |......|
+                  +>+------+  -> 4112
+                    |......|
+                    +------+  -> 8208
+\end{lstlisting}
+
+The Completion of this request(total size: sizeof(Completion) +
+1 * sizeof(Descriptor) + 1):
+\begin{lstlisting}
+ COMPLETION         +------+
+                    |status|  ->  VIRTIO_OF_SUCCESS
+                    +------+
+                    |cmd id|  ->  10
+                    +------+
+                    |ndesc |  ->  1
+                    +------+
+                    |rsvd  |
+                    +------+
+                    |value |  -> 1 (value.u32)
+                    +------+
+
+ DESC0              +------+
+                  +-|addr  |  -> 0
+                  | +------+
+                  | |length|  -> 1
+                  | +------+
+                  | |id    |  -> 3
+                  | +------+
+                  | |flags |  -> VIRTIO_OF_DESC_F_WRITE
+                  | +------+
+                  |
+ DATA             |>+------+  -> 0
+                    |......|
+                    +------+  -> 1
+\end{lstlisting}
+
+Another example of a virtio-blk read 8K request(total size: sizeof(Command) +
+4 * sizeof(Descriptor) + 16):
+\begin{lstlisting}
+ COMMAND            +------+
+                    |opcode|  ->  virtio_of_op_vring
+                    +------+
+                    |cmd id|  ->  14
+                    +------+
+                    |length|  ->  16 (virtio blk read command)
+                    +------+
+                    |ndesc |  ->  4
+                    +------+
+                    |rsvd  |
+                    +------+
+
+ DESC0              +------+
+                  +-|addr  |  -> 0
+                  | +------+
+                  | |length|  -> 16
+                  | +------+
+                  | |id    |  -> 0
+                  | +------+
+                  | |flags |  -> 0
+                  | +------+
+                  |
+ DESC1            | +------+
+                  | |addr  |  -> 0
+                  | +------+
+                  | |length|  -> 4096
+                  | +------+
+                  | |id    |  -> 1
+                  | +------+
+                  | |flags |  -> VIRTIO_OF_DESC_F_WRITE
+                  | +------+
+                  |
+ DESC2            | +------+
+                  | |addr  |  -> 0
+                  | +------+
+                  | |length|  -> 4096
+                  | +------+
+                  | |id    |  -> 2
+                  | +------+
+                  | |flags |  -> VIRTIO_OF_DESC_F_WRITE
+                  | +------+
+                  |
+ DESC3            | +------+
+                  | |addr  |  -> 0
+                  | +------+
+                  | |length|  -> 1
+                  | +------+
+                  | |id    |  -> 3
+                  | +------+
+                  | |flags |  -> VIRTIO_OF_DESC_F_WRITE
+                  | +------+
+                  |
+ DATA             +>+------+  -> 0
+                    |......|
+                    +------+  -> 16
+\end{lstlisting}
+
+The Completion of this request(total size: sizeof(Completion) +
+3 * sizeof(Descriptor) + 8193):
+\begin{lstlisting}
+ COMPLETION         +------+
+                    |status|  ->  VIRTIO_OF_SUCCESS
+                    +------+
+                    |cmd id|  ->  14
+                    +------+
+                    |ndesc |  ->  3
+                    +------+
+                    |rsvd  |
+                    +------+
+                    |value |  -> 8193 (value.u32)
+                    +------+
+
+ DESC0              +------+
+              +-----|addr  |  -> 0
+              |     +------+
+              |     |length|  -> 4096
+              |     +------+
+              |     |id    |  -> 1
+              |     +------+
+              |     |flags |  -> VIRTIO_OF_DESC_F_WRITE
+              |     +------+
+              |
+ DESC1        |     +------+
+              | +---|addr  |  -> 4096
+              | |   +------+
+              | |   |length|  -> 4096
+              | |   +------+
+              | |   |id    |  -> 2
+              | |   +------+
+              | |   |flags |  -> VIRTIO_OF_DESC_F_WRITE
+              | |   +------+
+              | |
+ DESC2        | |   +------+
+              | | +-|addr  |  -> 8192
+              | | | +------+
+              | | | |length|  -> 1
+              | | | +------+
+              | | | |id    |  -> 3
+              | | | +------+
+              | | | |flags |  -> VIRTIO_OF_DESC_F_WRITE
+              | | | +------+
+              | | |
+ DATA         +-+-+>+------+  -> 0
+                | | |......|
+                +-+>+------+  -> 4096
+                  | |......|
+                  +>+------+  -> 8192
+                    |......|
+                    +------+  -> 8193
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

