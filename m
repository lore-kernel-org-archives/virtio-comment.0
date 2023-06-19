Return-Path: <virtio-comment-return-6375-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A37C8EB64D9
	for <virtio-comment@archiver.kernel.org>; Mon, 19 Jun 2023 08:35:48 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 2A9767A096
	for <virtio-comment@archiver.kernel.org>; Mon, 19 Jun 2023 08:35:33 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id BDA4A986849
	for <virtio-comment@archiver.kernel.org>; Mon, 19 Jun 2023 08:35:32 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 8BF7A9865D6; Mon, 19 Jun 2023 08:35:32 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 611029863BD
	for <virtio-comment@lists.oasis-open.org>; Mon, 19 Jun 2023 08:34:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687163660; x=1689755660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yy68BheDvaLj/deSUlIRRRxApvxN1HIDXNzfqK4NNNQ=;
        b=CVJpJZaN3PuXTgUSDJ222Zcvd6t5zmWtgnXf69bI2K/0ltGDP7HtSRC0EIMVZlVQT4
         dzeesTRhZIH+4p+Xy8NMrxYHZxyxnPEQESlTzxa3rT7UCoHM9eN2DnrmYy4352BZTCGh
         T/W9GRcvsJe6SyzdYXZOYyy8JQiEX9ePitV+9ziabLktB4wUniHr9R6bW0Py5MWeTp9T
         WmKTuuqcMqIhNODDFuDyEkbEHPOypvJl8aw/kznQVllsUTapiiRn24K0XQvjgj3ft4YA
         T/rcAD8eMrA/wR1JmXEYI65bxcxaZBK1kHBUR85wn221x4dAOK2EQ8f8WxVXq+YZAtsT
         NTcA==
X-Gm-Message-State: AC+VfDwPhlqd3KJyn7mPM+sdAe6CD4QEEbFaSfG7STJk3MAjIJjbYMCY
	lv7y1p5SJ3+Laz2OVk0A1d1uYQ==
X-Google-Smtp-Source: ACHHUZ4i2CUdhyLmryB4LX7GASo+WmVLTsSDldmSVd9otfJa4Aj8OlN92bqazNQdsTINoUv6tlPwfQ==
X-Received: by 2002:a17:90b:4b12:b0:25b:e0f8:7dbb with SMTP id lx18-20020a17090b4b1200b0025be0f87dbbmr4701819pjb.6.1687163659866;
        Mon, 19 Jun 2023 01:34:19 -0700 (PDT)
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
Date: Mon, 19 Jun 2023 16:31:31 +0800
Message-Id: <20230619083131.1544999-8-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230619083131.1544999-1-pizhenwei@bytedance.com>
References: <20230619083131.1544999-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] [PATCH v3 7/7] transport-fabrics: introduce keyed eager buffers

The Virtio-oF device instance can expose keyed eager buffers, the Virtio-oF
initiator can write device-readable virtqueue buffers and send VQ command
in a single RTT on the fabric, this makes better performance.

Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
---
 transport-fabrics.tex | 81 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/transport-fabrics.tex b/transport-fabrics.tex
index 41a24d6..d915b19 100644
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
+        u8 reserved[13];
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

