Return-Path: <virtio-comment-return-5761-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FEABC77B7C
	for <virtio-comment@archiver.kernel.org>; Thu,  4 May 2023 08:21:41 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 5E474142D46
	for <virtio-comment@archiver.kernel.org>; Thu,  4 May 2023 08:21:40 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 55E5A9866B8
	for <virtio-comment@archiver.kernel.org>; Thu,  4 May 2023 08:21:40 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 4C5FE983EB5; Thu,  4 May 2023 08:21:40 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 38EFF98663F
	for <virtio-comment@lists.oasis-open.org>; Thu,  4 May 2023 08:21:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683188498; x=1685780498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VmnQVBgXKjPMWE19J7QvVOYwNG/TxTtMFvSwN5o+KsE=;
        b=EwrrZsSaT9r0CqMxzYtI2tlsC6xFXkxlp1ALNZ6i84Rec5LX27OXJQ2YwxSrkGy4rd
         /9n7g5b4ocayudT5BBbiBKwbviRrQk5VXzQCuEQw4XnBuuGz9O0r35QQTgnKHesy1qSx
         b3Gfpi66g8Sg96DPxe2AbBaFp7z4tGl3pJC4BRJRvLT0YtI6Hoiaz+AiTTH5Lq/fjnc5
         szqF0PpnpP1ndoc+zLK76Agh5zhPF0t1O+dbbolXFNBbhGm0qgw76la7oVq908phwZ7h
         SkXo9zm+58xx3IQD+JCRzEskx0lozAhpyNo14hEK8HJbVKhQjz576zgPKzTBImrTWgSP
         i4NA==
X-Gm-Message-State: AC+VfDxDP5B5NUg1Ooecp2nTfT7DId7TaQNDu/m7ANL70IbaEEtWVlAY
	KFDjTU0BqEiVampz89MX2jrOXQ==
X-Google-Smtp-Source: ACHHUZ5+Wb9aLk1Cy/W5A15t1CAdRt5uX5WjEPVAGoWVsWsFKCWAWTuPGlsRNqpvOWyTtoFNCfUpEg==
X-Received: by 2002:a17:90a:6308:b0:24e:473e:71c3 with SMTP id e8-20020a17090a630800b0024e473e71c3mr1341162pjj.19.1683188498562;
        Thu, 04 May 2023 01:21:38 -0700 (PDT)
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
Date: Thu,  4 May 2023 16:19:04 +0800
Message-Id: <20230504081910.238585-6-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230504081910.238585-1-pizhenwei@bytedance.com>
References: <20230504081910.238585-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] [PATCH v2 05/11] transport-fabrics: introduce Keyed Transmission

Keyed transmission is used for message oriented communication(Ex RDMA),
also add virtio-blk read/write 8K example.

Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
---
 transport-fabrics.tex | 178 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 178 insertions(+)

diff --git a/transport-fabrics.tex b/transport-fabrics.tex
index c02cf26..7711321 100644
--- a/transport-fabrics.tex
+++ b/transport-fabrics.tex
@@ -317,3 +317,181 @@ \subsubsection{Buffer Mapping Definition}\label{sec:Virtio Transport Options / V
                     |......|
                     +------+  -> 8193
 \end{lstlisting}
+
+\paragraph{Keyed Transmission}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Commands Definition / Keyed Transmission}
+Command and Segment Descriptors are transmitted in a message within a
+connection, and buffer is transmitted by remote memory access.  The layout in message:
+
+\begin{lstlisting}
+CMDx contains 0 descriptor, CMDy contains (n - m + 1) descriptors:
+
+     +-----+     +-----++-----+     +-----+
+ ... | CMDx| ... | CMDy||DESCm| ... |DESCn| ...
+     +-----+     +-----++-----+     +-----+
+
+COMPx contains 0 descriptor, COMPy contains 0 descriptor:
+
+     +-----+     +-----+
+ ... |COMPx| ... |COMPy| ...
+     +-----+     +-----+
+\end{lstlisting}
+
+An example of a virtio-blk write 8K request(message size: sizeof(Command) +
+4 * sizeof(Descriptor)):
+\begin{lstlisting}
+ COMMAND            +------+
+                    |opcode|  ->  virtio_of_op_vring
+                    +------+
+                    |cmd id|  ->  10
+                    +------+
+                    |length|  ->  0
+                    +------+
+                    |ndesc |  ->  4
+                    +------+
+                    |rsvd  |
+                    +------+
+
+ DESC0              +------+
+                    |addr  |  -> 0xffff012345670000
+                    +------+
+                    |length|  -> 16 (virtio blk write command)
+                    +------+
+                    |id    |  -> 0
+                    +------+
+                    |flags |  -> VIRTIO_OF_DESC_F_KEYED
+                    +------+
+                    |key   |  -> 0x1234
+                    +------+
+
+ DESC1              +------+
+                    |addr  |  -> 0xffff012345671000
+                    +------+
+                    |length|  -> 4096
+                    +------+
+                    |id    |  -> 1
+                    +------+
+                    |flags |  -> VIRTIO_OF_DESC_F_KEYED
+                    +------+
+                    |key   |  -> 0x1236
+                    +------+
+
+ DESC2              +------+
+                    |addr  |  -> 0xffff012345673000
+                    +------+
+                    |length|  -> 4096
+                    +------+
+                    |id    |  -> 2
+                    +------+
+                    |flags |  -> VIRTIO_OF_DESC_F_KEYED
+                    +------+
+                    |key   |  -> 0x1238
+                    +------+
+
+ DESC3              +------+
+                    |addr  |  -> 0xffff012345677000
+                    +------+
+                    |length|  -> 1
+                    +------+
+                    |id    |  -> 3
+                    +------+
+                    |flags |  -> VIRTIO_OF_DESC_F_KEYED | VIRTIO_OF_DESC_F_WRITE
+                    +------+
+                    |key   |  -> 0x1239
+                    +------+
+\end{lstlisting}
+
+The target handles Command, reads the remote addresses of DESC0/DESC1/DESC2,
+writes the remote address of DESC3, then responses Completion:
+\begin{lstlisting}
+ COMPLETION         +------+
+                    |status|  ->  VIRTIO_OF_SUCCESS
+                    +------+
+                    |cmd id|  ->  10
+                    +------+
+                    |ndesc |  ->  0
+                    +------+
+                    |rsvd  |
+                    +------+
+                    |value |  -> 1 (value.u32)
+                    +------+
+\end{lstlisting}
+
+Another example of a virtio-blk read 8K request(message size: sizeof(Command) +
+4 * sizeof(Descriptor)):
+\begin{lstlisting}
+ COMMAND            +------+
+                    |opcode|  ->  virtio_of_op_vring
+                    +------+
+                    |cmd id|  ->  10
+                    +------+
+                    |length|  ->  0
+                    +------+
+                    |ndesc |  ->  4
+                    +------+
+                    |rsvd  |
+                    +------+
+
+ DESC0              +------+
+                    |addr  |  -> 0xffff012345670000
+                    +------+
+                    |length|  -> 16 (virtio blk write command)
+                    +------+
+                    |id    |  -> 0
+                    +------+
+                    |flags |  -> VIRTIO_OF_DESC_F_KEYED
+                    +------+
+                    |key   |  -> 0x1234
+                    +------+
+
+ DESC1              +------+
+                    |addr  |  -> 0xffff012345671000
+                    +------+
+                    |length|  -> 4096
+                    +------+
+                    |id    |  -> 1
+                    +------+
+                    |flags |  -> VIRTIO_OF_DESC_F_KEYED | VIRTIO_OF_DESC_F_WRITE
+                    +------+
+                    |key   |  -> 0x1236
+                    +------+
+
+ DESC2              +------+
+                    |addr  |  -> 0xffff012345673000
+                    +------+
+                    |length|  -> 4096
+                    +------+
+                    |id    |  -> 2
+                    +------+
+                    |flags |  -> VIRTIO_OF_DESC_F_KEYED | VIRTIO_OF_DESC_F_WRITE
+                    +------+
+                    |key   |  -> 0x1238
+                    +------+
+
+ DESC3              +------+
+                    |addr  |  -> 0xffff012345677000
+                    +------+
+                    |length|  -> 1
+                    +------+
+                    |id    |  -> 3
+                    +------+
+                    |flags |  -> VIRTIO_OF_DESC_F_KEYED | VIRTIO_OF_DESC_F_WRITE
+                    +------+
+                    |key   |  -> 0x1239
+                    +------+
+\end{lstlisting}
+
+The target handles Command, reads the remote address of DESC0, writes the remote
+addresses of DESC1/DESC2/DESC3, then responses Completion:
+\begin{lstlisting}
+ COMPLETION         +------+
+                    |status|  ->  VIRTIO_OF_SUCCESS
+                    +------+
+                    |cmd id|  ->  10
+                    +------+
+                    |ndesc |  ->  0
+                    +------+
+                    |rsvd  |
+                    +------+
+                    |value |  -> 8193 (value.u32)
+                    +------+
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

