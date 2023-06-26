Return-Path: <virtio-comment-return-6513-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54DE9EB64DA
	for <virtio-comment@archiver.kernel.org>; Mon, 26 Jun 2023 07:28:42 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id BE65244346
	for <virtio-comment@archiver.kernel.org>; Mon, 26 Jun 2023 07:28:41 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B81CD98641E
	for <virtio-comment@archiver.kernel.org>; Mon, 26 Jun 2023 07:28:41 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id B2E51986382; Mon, 26 Jun 2023 07:28:41 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A1EC9986385
	for <virtio-comment@lists.oasis-open.org>; Mon, 26 Jun 2023 07:28:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687764520; x=1690356520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MognQWW19qIkKqSEqnYdAAqD2dFlhPSOl1AjWUXiDfw=;
        b=atKGv3TKGmkoAea18+4tAjc8ePKujPqXbYXScs7mMBBJisNHVOwJIc6o6us+ZNEuyB
         7/1bOSNSk6zvAguNq4dFDk8gzfwyMIS06SCPdyRxLuyVsFHqBhq62sUKx7upzV1PUMl4
         gm7ZZ9buZmnwszHHH5+u4HJDh85P59B8ruTwQAjJddDZ4XMZViFQ/QEoNpxWBgoixsif
         8xKYHECRjyl9aeb3R+9dNsn/XJDRRiOPWdY4m8av+hBxwMDv07Dv/mz2n0d/eX0g1Jla
         aN+S8CJIIxZxrVZiKo9tezO8z1J9C41wRvzed9FgbuC9QSy63tWXi2HQHjjIE7Y1sRLQ
         VOSA==
X-Gm-Message-State: AC+VfDxqifFlruq7Z1dsC9gI6rnvkCHSvgh878BTO1tiyjXYlyYMZkPz
	TEDOW3pkNIikf+PQSUXC+42Tiw==
X-Google-Smtp-Source: ACHHUZ6rBu75/pqvuU8V6nGAQt29pTSEySOZcmGoCNdqM4ACVCHvuxk1Awi/FX3cn1WW+C84hy0U8w==
X-Received: by 2002:a05:6808:2096:b0:3a0:6540:794c with SMTP id s22-20020a056808209600b003a06540794cmr9031708oiw.19.1687764520461;
        Mon, 26 Jun 2023 00:28:40 -0700 (PDT)
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
Date: Mon, 26 Jun 2023 15:25:51 +0800
Message-Id: <20230626072551.1709389-8-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230626072551.1709389-1-pizhenwei@bytedance.com>
References: <20230626072551.1709389-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] [PATCH v4 7/7] transport-fabrics: introduce keyed eager buffers

The Virtio-oF device instance can expose keyed eager buffers, the Virtio-oF
initiator can write device-readable virtqueue buffers and send VQ command
in a single RTT on the fabric, this makes better performance.

Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
---
 transport-fabrics.tex | 81 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/transport-fabrics.tex b/transport-fabrics.tex
index f7f29cf..b0ccfb1 100644
--- a/transport-fabrics.tex
+++ b/transport-fabrics.tex
@@ -194,6 +194,8 @@ \subsubsection{Opcodes}\label{sec:Virtio Transport Options / Virtio Over Fabrics
 #define virtio_of_op_get_feature           0x0004
 #define virtio_of_op_set_feature           0x0005
 #define virtio_of_op_get_keyed_num_descs   0x0100
+#define virtio_of_op_get_keyed_eager_buf   0x0102
+#define virtio_of_op_vq_keyed_eager_buf    0x0ffe
 #define virtio_of_op_vq                    0x0fff
 #define virtio_of_op_get_vendor_id         0x1000
 #define virtio_of_op_get_device_id         0x1001
@@ -349,6 +351,9 @@ \subsubsection{Opcodes}\label{sec:Virtio Transport Options / Virtio Over Fabrics
 \begin{lstlisting}
 /* support virtio_of_op_get_keyed_num_descs to get the maximum number of keyed descriptors */
 #define VIRTIO_OF_F_KEYED_NUM_DESCS            0
+
+/* support virtio_of_op_get_keyed_eager_buf to get the eager buffers of the Virtio-oF virtqueues */
+#define VIRTIO_OF_F_KEYED_EAGER_BUF            1
 \end{lstlisting}
 
 \paragraph{Set Feature Command}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Commands Definition / Opcodes / Set Feature Command}
@@ -407,6 +412,82 @@ \subsubsection{Opcodes}\label{sec:Virtio Transport Options / Virtio Over Fabrics
 };
 \end{lstlisting}
 
+\paragraph{Get Keyed Eager Buffers Command}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Commands Definition / Opcodes / Get Keyed Eager Buffers Command}
+A Virtio-oF virtqueue may expose 0 or more keyed buffers that allow the Virtio-oF initiator to write directly to the Virtio-oF device instance.
+The Keyed Eager Buffers mechanism reduces round-trip time on the fabrics.
+The Get Keyed Eager Buffers Command is used to get the eager buffers of a Virtio-oF virtqueue,
+and it is executed on the Virtio-oF control queue.
+
+The structure of the Get Keyed Deager Buffers Command structure is as follows:
+\begin{lstlisting}
+struct virtio_of_command_get_keyed_eager_buf {
+        /* opcode is virtio_of_op_get_keyed_eager_buf */
+        le16 opcode;
+        /* unique ID for all in-flight commands */
+        le16 command_id;
+        /* the Virtio-oF virtqueue index */
+        le16 vq_index;
+        /* the maximum number of eager buffer descriptors to obtain */
+        u8 descs;
+        u8 reserved[9];
+};
+\end{lstlisting}
+
+The Get Keyed Eager Buffers Body is a contiguous memory of \texttt{descs} elements (virtio_of_keyed_desc type).
+
+The structure of the Get Keyed Eager Buffers Completion is as follows:
+\begin{lstlisting}
+struct virtio_of_completion_get_keyed_eager_buf {
+        le16 status;
+        le16 command_id;
+        /* the number of eager buffer descriptors */
+        u8 descs;
+        u8 reserved[11];
+};
+\end{lstlisting}
+
+Note: multiple keyed eager buffers compose a logical memory range sequentially.
+To locate a position within the range, use the offset and length values as follows:
+\begin{lstlisting}
+    +-----------+-----------+     +-----------+
+    |addr0, len0|addr1, len1| ... |addrN, lenN|
+    +-----------+-----------+     +-----------+
+                   |                    |
+                   \---offset, length---/
+\end{lstlisting}
+
+\paragraph{VQ Keyed Eager Buffers Command}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Commands Definition / Opcodes / VQ Keyed Eager Buffers Command}
+The Virtio-oF initiator must write device-readable virtqueue buffers into the Virtio-oF virtqueue eager buffers,
+then issue The VQ Keyed Eager Buffers Command to transmit virtqueue buffers.
+This command is executed on the Virtio-oF virtqueue only.
+
+The structure of the VQ Keyed Eager Buffers Command structure is as follows:
+\begin{lstlisting}
+struct virtio_of_command_vq_keyed_eager_buf {
+        /* opcode is virtio_of_op_vq_keyed_eager_buf */
+        le16 opcode;
+        /* unique ID for all in-flight commands */
+        le16 command_id;
+        /* the offset of Virtio-oF virtqueue eager buffers */
+        le32 out_offset;
+        /* the length of device-readable virtqueue buffers */
+        le32 out_length;
+        /* the length of device-writable virtqueue buffers */
+        le32 in_length;
+};
+\end{lstlisting}
+
+The structure of the VQ Keyed Eager Buffers Completion is as follows:
+\begin{lstlisting}
+struct virtio_of_completion_vq_keyed_eager_buf {
+        le16 status;
+        le16 command_id;
+        /* the length of virtqueue buffers from Virtio-oF target */
+        le32 length;
+        u8 reserved[8];
+};
+\end{lstlisting}
+
 \paragraph{VQ Command}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Commands Definition / Opcodes / VQ Command}
 The VQ Command is used to transmit virtqueue buffers for Virtio-oF virtqueue only.
 
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

