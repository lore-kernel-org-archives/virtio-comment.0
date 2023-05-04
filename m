Return-Path: <virtio-comment-return-5762-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE07DC77B7C
	for <virtio-comment@archiver.kernel.org>; Thu,  4 May 2023 08:21:44 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 147331462C5
	for <virtio-comment@archiver.kernel.org>; Thu,  4 May 2023 08:21:44 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0B2869866C0
	for <virtio-comment@archiver.kernel.org>; Thu,  4 May 2023 08:21:44 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 0310E9866B1; Thu,  4 May 2023 08:21:44 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E6F1A9866B5
	for <virtio-comment@lists.oasis-open.org>; Thu,  4 May 2023 08:21:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683188502; x=1685780502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O452Xqy04xSz7kE56vFvcsKbLigsrs0uGOpRr/9m/6Q=;
        b=C67XxMfK2tkuOXXeMzThtQh8hutRJwhwf8s/JoUZH/UuYxHrV9AN7zajT0wB2ZJt9y
         R+aUUasmH1pu3Z5ZjGouYsyaJGVTZN4QDVc0WTE/1pnSz9eG3x3cqS0KrLKJ5mx0byY4
         hNXJB6tK+5/wKt8K+ChMWckUKBfN+t7bqNHYiK1r4HeTVoqpvAKbHLVZfelWwJoAa7bC
         l6gOZAz0jWeIudmLb807PpfD38OkmCVPi3DDId+/Z/cse6AlVXWVKVEKa/hpLG2D5JBa
         WnU3+TkQFi3stb/uxohwQnp3Tmo66hNh/2yi8bk3MIoB+/TGraTwVd0458my8/H7/ca3
         47zw==
X-Gm-Message-State: AC+VfDzlYycJGHgSM+Gv7kd3N9TRRHo+sy3HVtC7LIPER7Hjz6NhDFLM
	qy2zkFImyZHZCGEcOiDPt4hddA==
X-Google-Smtp-Source: ACHHUZ6t2VeGTk9Ve8w3WjZaMArQd42mYSJb7FbMIbuvXQfp9cc75tYh0Ni5/TnZwXe6yp9E3/ECBQ==
X-Received: by 2002:a05:6a20:a11b:b0:ef:242d:54e3 with SMTP id q27-20020a056a20a11b00b000ef242d54e3mr1763849pzk.21.1683188502222;
        Thu, 04 May 2023 01:21:42 -0700 (PDT)
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
Date: Thu,  4 May 2023 16:19:05 +0800
Message-Id: <20230504081910.238585-7-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230504081910.238585-1-pizhenwei@bytedance.com>
References: <20230504081910.238585-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] [PATCH v2 06/11] transport-fabrics: introduce command set

Introduce command structures for Virtio-oF.

Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
---
 transport-fabrics.tex | 209 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 209 insertions(+)

diff --git a/transport-fabrics.tex b/transport-fabrics.tex
index 7711321..37f57c6 100644
--- a/transport-fabrics.tex
+++ b/transport-fabrics.tex
@@ -495,3 +495,212 @@ \subsubsection{Buffer Mapping Definition}\label{sec:Virtio Transport Options / V
                     |value |  -> 8193 (value.u32)
                     +------+
 \end{lstlisting}
+
+\subsubsection{Commands Definition}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Commands Definition}
+This section defines command structures for Virtio Over Fabrics.
+
+A common structure virtio_of_value is fixed to 8 bytes and MUST be used as one
+of the following format:
+
+\begin{itemize}
+\item u8
+\item le16
+\item le32
+\item le64
+\end{itemize}
+
+\paragraph{Command ID}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Commands Definition / Command ID}
+There is command_id(le16) field in each Command and Completion:
+
+\begin{itemize}
+\item Generally the initiator allocates a Command ID and specifies the
+command_id field of a Command, and the target MUST specify the same Command ID
+in command_id field of Completion.
+\item The initiator MUST guarantee each Command ID is unique in the inflight Commands.
+\item Command ID 0xff00 - 0xffff is reserved for control queue to delivery asynchronous event.
+\end{itemize}
+
+The reserved Command ID for control queue is defined as follows:
+
+\begin{tabular}{ |l|l| }
+\hline
+Command ID & Description \\
+\hline \hline
+0xffff & Keepalive. The initiator SHOULD ignore this event \\
+\hline
+0xfffe & Config change. The initiator SHOULD generate config change interrupt to device \\
+\hline
+0xff00 - 0xfffd & Reserved \\
+\hline
+\end{tabular}
+
+\paragraph{Connect Command}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Commands Definition / Connect Command}
+The Connect Command is used to establish Virtio Over Fabrics queue. The control
+queue MUST be established firstly, then the Connect command establishes an
+association between the initiator and the target.
+
+The Target ID of 0xffff is reserved, then:
+\begin{itemize}
+\item The Target ID of 0xffff MUST be specified as the Target ID in a Connect
+Command for the control queue.
+\item The target SHOULD allocate any available Target ID to the initiator,
+and return the allocated Target ID in the Completion.
+\item The returned Target ID MUST be specified as the Target ID, and the Queue ID
+MUST be specified in a Connect Command for the virtqueue.
+\end{itemize}
+
+The Connect Command has following structure:
+
+\begin{lstlisting}
+struct virtio_of_command_connect {
+        le16 opcode;
+        le16 command_id;
+        le16 target_id;
+        le16 queue_id;
+        le16 ndesc;
+#define VIRTIO_OF_CONNECTION_TCP     1
+#define VIRTIO_OF_CONNECTION_RDMA    2
+        u8 oftype;
+        u8 padding[5];
+};
+\end{lstlisting}
+
+The Connect commands MUST contains one Segment Descriptor and one structure
+virtio_of_command_connect to specify Initiator VQN and Target VNQ,
+virtio_of_command_connect has following structure:
+
+\begin{lstlisting}
+struct virtio_of_connect {
+        u8 ivqn[256];
+        u8 tvqn[256];
+        u8 padding[512];
+};
+\end{lstlisting}
+
+\paragraph{Feature Command}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Commands Definition / Feature Command}
+
+The control queue uses Feature Command to get or set features. This command is used for:
+
+\begin{itemize}
+\item The initiator/target features. This is used to negotiate transport layer features.
+\item The driver/device features. This is used to negotiate Virtio Based device
+features which is similar to PCI based device.
+\end{itemize}
+
+The Feature Command has following structure:
+
+\begin{lstlisting}
+struct virtio_of_command_feature {
+        le16 opcode;
+        le16 command_id;
+        le32 feature_select;
+        le64 value;        /* ignore this field on GET */
+};
+\end{lstlisting}
+
+\paragraph{Queue Command}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Commands Definition / Queue Command}
+
+The control queue uses Queue Command to get or set properties on a specific queue.
+The Queue Command has following structure:
+
+\begin{lstlisting}
+struct virtio_of_command_queue {
+        le16 opcode;
+        le16 command_id;
+        le16 queue_id;
+        u8 padding6;
+        u8 padding7;
+        struct virtio_of_value value;   /* ignore this field on GET */
+};
+\end{lstlisting}
+
+
+\paragraph{Config Command}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Commands Definition / Config Command}
+
+The control queue uses Config Command to get or set configure on device.
+The Config Command has following structure:
+
+\begin{lstlisting}
+struct virtio_of_command_config {
+        le16 opcode;
+        le16 command_id;
+        le16 offset;
+        u8 bytes;
+        u8 padding7;
+        struct virtio_of_value value;        /* ignore this field on GET */
+};
+\end{lstlisting}
+
+The bytes field supports on Get only:
+
+\begin{itemize}
+\item 1, then the initiator reads from value field of Completion as u8
+\item 2, then the initiator reads from value field of Completion as le16
+\item 4, then the initiator reads from value field of Completion as le32
+\item 8, then the initiator reads from value field of Completion as le64
+\end{itemize}
+
+The bytes field supports on Set only:
+
+\begin{itemize}
+\item 1, then the initiator specifies the value field of Config Command as u8
+\item 2, then the initiator specifies the value field of Config Command as le16
+\item 4, then the initiator specifies the value field of Config Command as le32
+\item 8, then the initiator specifies the value field of Config Command as le64
+\end{itemize}
+
+\paragraph{Common Command}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Commands Definition / Common Command}
+
+The control queue uses Common Command to get or set common properties on
+device(i.e. get device ID). The Common Command has following structure:
+
+\begin{lstlisting}
+struct virtio_of_command_common {
+        le16 opcode;
+        le16 command_id;
+        u8 padding4;
+        u8 padding5;
+        u8 padding6;
+        u8 padding7;
+        struct virtio_of_value value;        /* ignore this field on GET */
+};
+\end{lstlisting}
+
+
+\paragraph{Vring Command}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Commands Definition / Vring Command}
+
+Both control queue and virtqueue use Vring Command to transmit buffer.
+The Vring Command has following structure:
+
+\begin{lstlisting}
+struct virtio_of_command_vring {
+        le16 opcode;
+        le16 command_id;
+        /* Total buffer size this command contains(not include command&descriptors). */
+        le32 length;
+        /* How many descriptors this command contains */
+        le16 ndesc;
+        u8 padding[6];
+};
+\end{lstlisting}
+
+\paragraph{Completion}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Commands Definition / Completion}
+
+The target responses Completion to the initiator to report command status,
+device properties, and transmit buffer. The Completion has following structure:
+
+\begin{lstlisting}
+struct virtio_of_completion {
+        le16 status;
+        le16 command_id;
+        /* How many descriptors this completion contains */
+        le16 ndesc;
+        u8 rsvd6;
+        u8 rsvd7;
+        struct virtio_of_value value;
+};
+\end{lstlisting}
+
+Note that Virtio Over Fabrics does not define an interrupt mechanism, generally
+the initiator receives a Completion, it SHOULD generate a host interrupt
+(if no interrupt suspending on device).
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

