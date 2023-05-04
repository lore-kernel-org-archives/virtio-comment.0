Return-Path: <virtio-comment-return-5767-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56348C7EE21
	for <virtio-comment@archiver.kernel.org>; Thu,  4 May 2023 08:22:02 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id C098F2B055
	for <virtio-comment@archiver.kernel.org>; Thu,  4 May 2023 08:22:01 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id AD7D59866BE
	for <virtio-comment@archiver.kernel.org>; Thu,  4 May 2023 08:22:01 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id A3B72983EB5; Thu,  4 May 2023 08:22:01 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 93B7198667D
	for <virtio-comment@lists.oasis-open.org>; Thu,  4 May 2023 08:22:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683188520; x=1685780520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YqdTiaru0+TQnFbLq54zSn02SAvukcsWLZT5Shoy9/w=;
        b=ko3oafIPJE3hBX63irrep2MbDx8bEaqZ/WE0rZKR9c9P23inKRY+MW7JLAXEApigmQ
         qin67+aA6qkhKycL9JeXhmR+g17L8T9eKlOT15PPAT73pQ2kmZc1qhWxvqhnbj7izPxV
         /mJkVtDl+odqdr7IOi7elHXhyXP1AmB7X9wcroTme6FYcvGqYhQAU+848THYFBgdJ4QO
         VSgboyPFbZCD1e1dPMwvG5jupT1jkEnIU6rqx/LoIo+D9/5z+I7Xk1e/o/922Qqx5BxW
         aR7sAvLcayJdvfbPbjFTMba7GoOuz5WO7Eg9cIP6MNmemk0RvabLSUzjLpsCubkxA1Cl
         PX7Q==
X-Gm-Message-State: AC+VfDwqaklVZrfQt+EjdPt+YRIcu80D9tE3284mjAb6s2wDuffUVNUX
	9mc8Z2gpqXKgSbKmjFABnKyaAw==
X-Google-Smtp-Source: ACHHUZ7nzGH4uzYLlHtF4KP6sNJLiuuYkFPmGLn7ian6pv4aVnMGcKEJK5ZQEmsLgG2SGqzPHGwY5A==
X-Received: by 2002:a17:90a:d34e:b0:24e:5a5a:1050 with SMTP id i14-20020a17090ad34e00b0024e5a5a1050mr1334627pjx.24.1683188520065;
        Thu, 04 May 2023 01:22:00 -0700 (PDT)
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
Date: Thu,  4 May 2023 16:19:10 +0800
Message-Id: <20230504081910.238585-12-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230504081910.238585-1-pizhenwei@bytedance.com>
References: <20230504081910.238585-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] [PATCH v2 11/11] transport-fabrics: support inline data for keyed transmission

Add transport feature 'virtio_of_feature_stream_size' to negotiate
the inline data size. Lots of Virtio device protocol has small size
field(typically, 'status' to indicate the result of request), to
reduce the network RTT, support inline data for keyed transmission.

Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
---
 transport-fabrics.tex | 113 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 113 insertions(+)

diff --git a/transport-fabrics.tex b/transport-fabrics.tex
index af35622..1e76bc6 100644
--- a/transport-fabrics.tex
+++ b/transport-fabrics.tex
@@ -496,6 +496,117 @@ \subsubsection{Buffer Mapping Definition}\label{sec:Virtio Transport Options / V
                     +------+
 \end{lstlisting}
 
+For effective transmission, stream Segment Descriptors and keyed Segment
+Descriptors are allowed to use together in a single command.
+
+\begin{itemize}
+\item The initiator MAY discover the maximum stream transmission size of a
+command supported by target. See \ref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Opcodes Definition / virtio_of_op_get_feature}~\nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Opcodes Definition / virtio_of_op_get_feature}.
+\item The initiator MAY set the maximum stream transmission size of a command
+supported by initiator. See \ref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Opcodes Definition / virtio_of_op_set_feature}~\nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Opcodes Definition / virtio_of_op_set_feature}.
+\end{itemize}
+
+An example of 16 bytes maximum stream transmission size supported by target,
+and 1 byte maximum stream transmission size supported by initiator, a virtio-blk
+read 8K request(total size: sizeof(Command) + 4 * sizeof(Descriptor) + 16):
+\begin{lstlisting}
+ COMMAND            +------+
+                    |opcode|  ->  virtio_of_op_vring
+                    +------+
+                    |cmd id|  ->  100
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
+                  | |addr  |  -> 0xffff012345670000
+                  | +------+
+                  | |length|  -> 4096
+                  | +------+
+                  | |id    |  -> 1
+                  | +------+
+                  | |flags |  -> VIRTIO_OF_DESC_F_KEYED | VIRTIO_OF_DESC_F_WRITE
+                  | +------+
+                  | |key   |  -> 0x1238
+                  | +------+
+                  |
+ DESC2            | +------+
+                  | |addr  |  -> 0xffff012345671000
+                  | +------+
+                  | |length|  -> 4096
+                  | +------+
+                  | |id    |  -> 2
+                  | +------+
+                  | |flags |  -> VIRTIO_OF_DESC_F_KEYED | VIRTIO_OF_DESC_F_WRITE
+                  | +------+
+                  | |key   |  -> 0x1239
+                  | +------+
+                  |
+ DESC3            | +------+
+                  | |addr  |  -> 0xffff012345673000
+                  | +------+
+                  | |length|  -> 1
+                  | +------+
+                  | |id    |  -> 3
+                  | +------+
+                  | |flags |  -> VIRTIO_OF_DESC_F_KEYED | VIRTIO_OF_DESC_F_WRITE
+                  | +------+
+                  | |key   |  -> 0x1233
+                  | +------+
+                  |
+ DATA             +>+------+  -> 0
+                    |......|
+                    +------+  -> 16
+\end{lstlisting}
+
+The target MAY handle Command, reads 16 bytes from request described by DESC0,
+writes the remote addresses of DESC1/DESC2, then responses Completion(total
+size: sizeof(Completion) + sizeof(Descriptor) + 1):
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
+Note that the target is allowed to write the remote address of DESC3 and
+response Completion only in this example.
+
 \subsubsection{Commands Definition}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Commands Definition}
 This section defines command structures for Virtio Over Fabrics.
 
@@ -751,6 +862,8 @@ \subsubsection{Opcodes Definition}\label{sec:Virtio Transport Options / Virtio O
 \hline
 virtio_of_feature_max_segment & 0x0 & Get the maximum segments within a Vring Command supported by target \\
 \hline
+virtio_of_feature_stream_size & 0x1 & Get the target/set the initiator stream buffer size of a Command \\
+\hline
 \end{tabular}
 
 \paragraph{virtio_of_op_set_feature}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Opcodes Definition / virtio_of_op_set_feature}
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

