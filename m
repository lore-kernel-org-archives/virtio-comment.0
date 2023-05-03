Return-Path: <virtio-comment-return-5716-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 771DCC77B75
	for <virtio-comment@archiver.kernel.org>; Wed,  3 May 2023 12:58:42 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 993FB2AC46
	for <virtio-comment@archiver.kernel.org>; Wed,  3 May 2023 12:58:41 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 891819865A3
	for <virtio-comment@archiver.kernel.org>; Wed,  3 May 2023 12:58:41 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 7A319986589; Wed,  3 May 2023 12:58:41 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5DE3B98658B
	for <virtio-comment@lists.oasis-open.org>; Wed,  3 May 2023 12:58:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683118718; x=1685710718;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NFeux/Hx73hWytv6mIyq/ZHlgI1+uhR+s1ru4nhltJA=;
        b=Fd+JT1cw9D5KBsPN8dya1pEQ1pIBhCXZRAU8eF7GdzdXz4um2NKxZ0u0rG+71pTSfs
         VTd0g/wZbCXcFJy6sfuZrTj7lVQREaBlqj8GaXzDhgt4Ul3/+2mBaA4CZaDq+Bu+Xa/F
         dJODkbEVhM0QG2F6khf0jq50qBvbUIHp8DIQji40uMgjYqBq5kDwA7QND8kjuIcCtBgp
         qVtf7DDZpRZa3heXsMCP700vc86JLB3q/blAAi4aKUcEIyiNTleg3OljDB3XZwv4RE2V
         pFbOUAMx+s28EJi6mbtVchmtbdzolWfIcHEpY1es8XiENKvqRv8Jf27qQrc6LboNHbzR
         6Hbw==
X-Gm-Message-State: AC+VfDwaYQP1jQ7xlrjT2jOJnRdtuY+c1h2JQqtok//ukrR9zh2axMH5
	wcMhCifLIqFaC3Qqnpok7URKhA==
X-Google-Smtp-Source: ACHHUZ508AiOSbnCBr04GLL73AUD7lGtFu8p4mfI5MSEQW2Ry5ssYApwp1uf5ikCFwDGLCo0DRc87Q==
X-Received: by 2002:a17:902:7402:b0:1a6:961e:fcfe with SMTP id g2-20020a170902740200b001a6961efcfemr2004906pll.30.1683118717596;
        Wed, 03 May 2023 05:58:37 -0700 (PDT)
From: zhenwei pi <pizhenwei@bytedance.com>
To: mst@redhat.com,
	parav@nvidia.com,
	stefanha@redhat.com,
	jasowang@redhat.com
Cc: virtio-comment@lists.oasis-open.org,
	houp@yusur.tech,
	helei.sig11@bytedance.com,
	zhenwei pi <pizhenwei@bytedance.com>
Date: Wed,  3 May 2023 20:58:07 +0800
Message-Id: <20230503125807.475394-1-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] [PATCH] transport-fabrics: introduce Virtio Over Fabrics

In the past years, virtio supports lots of device specifications by
PCI/MMIO/CCW. These devices work fine in the virtualization environment.

Introduce Virtio Over Fabrics transport to support "network defined
peripheral devices". With this transport, Many Virtio based devices
transparently work over fabrics. Note that the balloon device may not
make sense. Shared memory regions won't work.

Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
---
 content.tex           |    1 +
 transport-fabrics.tex | 1022 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 1023 insertions(+)
 create mode 100644 transport-fabrics.tex

diff --git a/content.tex b/content.tex
index cff548a..f899c3a 100644
--- a/content.tex
+++ b/content.tex
@@ -582,6 +582,7 @@ \chapter{Virtio Transport Options}\label{sec:Virtio Transport Options}
 \input{transport-pci.tex}
 \input{transport-mmio.tex}
 \input{transport-ccw.tex}
+\input{transport-fabrics.tex}
 
 \chapter{Device Types}\label{sec:Device Types}
 
diff --git a/transport-fabrics.tex b/transport-fabrics.tex
new file mode 100644
index 0000000..dbabce5
--- /dev/null
+++ b/transport-fabrics.tex
@@ -0,0 +1,1022 @@
+\section{Virtio Over Fabrics}\label{sec:Virtio Transport Options / Virtio Over Fabrics}
+
+This section defines specification to Virtio that enables operation over other
+interconnects. A central goal of Virtio Over Fabrics is to maintain consistency
+with the PCI device, so Virtio based devices transparently work over PCI or
+fabrics.
+
+Virtio Over Fabrics uses reliable connection to transmit data, the reliable
+connection betweens two rules:
+
+\begin{itemize}
+\item An initiator functions as an Virtio Over Fabrics client. An initiator
+typically serves the same purpose to a machine as a Virtio device, issues
+commands to remote side.
+\item A target functions as an Virtio Over Fabrics server. An target typically
+handles commands from the initiator side and responses completions.
+\end{itemize}
+
+Virtio Over Fabrics has the following differences from the PCI based
+specification:
+
+\begin{itemize}
+\item There is a one-to-one mapping between virtqueue and the reliable
+connection which executes the vring data transmission.
+\item An additional control connection is required to execute control commands
+which is similar to read/write register on a PCI device.
+\item Virtio Over Fabrics does not define an interrupt mechanism that allows an
+initiator to generate a host interrupt. It is the responsibility of the host
+fabric interface to generate host interrupts.
+\end{itemize}
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
+\end{itemize}
+
+\subsection{Transmission Protocol}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol}
+This section defines transmission protocol for Virtio Over Fabrics. All the
+fields use little endian format.
+
+\subsubsection{Segment Descriptor Definition}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Segment Descriptor Definition}
+Virtio Over Fabrics uses the following structure to describe data segment:
+
+\begin{lstlisting}
+struct virtio_of_vring_desc {
+        le64 addr;
+        le32 length;
+        /* This marks the unique ID within a command, no limitation among inflight commands */
+        le16 id;
+        /* This marks a buffer as keyed transmission (otherwise stream transmission) */
+#define VIRTIO_OF_DESC_F_KEYED     1
+        /* This marks a buffer as device write-only (otherwise device read-only). */
+#define VIRTIO_OF_DESC_F_WRITE     2
+        le16 flags;
+        le32 key;
+};
+\end{lstlisting}
+
+The structure virtio_of_vring_desc is used for both keyed transmission
+(i.e. RDMA) and stream transmission(i.e. TCP). The fields is described as follows:
+
+\begin{tabular}{ |l|l|l| }
+\hline
+Field & keyed transmission & stream transmission \\
+\hline \hline
+addr & Start address of remote memory buffer & Start address within the stream buffer \\
+\hline
+length & The length of remote memory buffer & The length of buffer within the stream \\
+\hline
+id & The ID of this descriptor & The ID of this descriptor \\
+\hline
+flags & both keyed transmission and stream transmission supported & stream transmission only \\
+\hline
+key & Key of the remote Memory Region & Ignore \\
+\hline
+\end{tabular}
+
+Depending on the opcode, a Command contains zero or more structure virtio_of_vring_desc.
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
+
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
+                  | |flags |  -> VIRTIO_OF_DESC_F_WRITE
+                  | +------+
+                  | |key   |  -> 0x1233
+                  | +------+
+                  |
+ DATA             +>+------+  -> 0
+                    |......|
+                    +------+  -> 16
+\end{lstlisting}
+
+The target handles Command, reads 16 bytes from request described by DESC0,
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
+command_id field of a Command, and the target MUST specifies the same Command ID
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
+See \ref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Opcodes Definition / virtio_of_op_get_feature}~\nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Opcodes Definition / virtio_of_op_get_feature}
+and \ref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Opcodes Definition / virtio_of_op_set_feature}~\nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Opcodes Definition / virtio_of_op_set_feature}.
+\item The driver/device features. This is used to negotiate Virtio Based device
+features which is similar to PCI based device.
+See \ref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Opcodes Definition / virtio_of_op_get_device_feature}~\nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Opcodes Definition / virtio_of_op_get_device_feature}
+and \ref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Opcodes Definition / virtio_of_op_set_driver_feature}~\nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Opcodes Definition / virtio_of_op_set_driver_feature}.
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
+
+\subsubsection{Opcodes Definition}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Opcodes Definition}
+This section defines command opcodes for Virtio Over Fabrics:
+
+\begin{lstlisting}
+#define virtio_of_op_connect               0x0000
+#define virtio_of_op_discconnect           0x0001
+#define virtio_of_op_get_feature           0x0002
+#define virtio_of_op_set_feature           0x0003
+#define virtio_of_op_keepalive             0x0004
+#define virtio_of_op_vring                 0x0fff
+#define virtio_of_op_get_vendor_id         0x1000
+#define virtio_of_op_get_device_id         0x1001
+#define virtio_of_op_get_generation        0x1002
+#define virtio_of_op_get_status            0x1004
+#define virtio_of_op_set_status            0x1005
+#define virtio_of_op_get_device_feature    0x1006
+#define virtio_of_op_set_driver_feature    0x1007
+#define virtio_of_op_get_num_queues        0x1008
+#define virtio_of_op_get_queue_size        0x100a
+#define virtio_of_op_get_config            0x100c
+#define virtio_of_op_set_config            0x100d
+\end{lstlisting}
+
+\paragraph{virtio_of_op_connect}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Opcodes Definition / virtio_of_op_connect}
+
+virtio_of_op_connect is used to connect a target for both control queue and virtqueue.
+The initiator MUST issue a \nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Commands Definition / Connect Command}
+and specify the ndesc field as 1, also contains 1 structure virtio_of_vring_desc
+filled by structure virtio_of_command_status.
+
+\paragraph{virtio_of_op_discconnect}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Opcodes Definition / virtio_of_op_discconnect}
+
+virtio_of_op_discconnect is used to disconnect a target for both control queue and virtqueue.
+The initiator MUST issue a \nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Commands Definition / Common Command}.
+
+\paragraph{virtio_of_op_get_feature}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Opcodes Definition / virtio_of_op_get_feature}
+
+virtio_of_op_get_feature is used to get features of target for control queue only.
+The initiator MUST issue a \nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Commands Definition / Feature Command}.
+
+\begin{tabular}{ |l|l|l| }
+\hline
+Feature Select & Value & Description \\
+\hline
+virtio_of_feature_max_segment & 0x0 & Get the maximum segments within a Vring Command supported by target \\
+\hline
+virtio_of_feature_stream_size & 0x1 & Get the target/set the initiator stream buffer size of a Command \\
+\hline
+\end{tabular}
+
+\paragraph{virtio_of_op_set_feature}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Opcodes Definition / virtio_of_op_set_feature}
+
+virtio_of_op_set_feature is used to set features of initiator for control queue only.
+The initiator MUST issue a \nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Commands Definition / Feature Command}.
+
+\paragraph{virtio_of_op_keepalive}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Opcodes Definition / virtio_of_op_keepalive}
+
+virtio_of_op_keepalive is used to keep alive with the target for control queue only.
+The initiator MUST issue a \nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Commands Definition / Common Command}.
+
+\paragraph{virtio_of_op_vring}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Opcodes Definition / virtio_of_op_vring}
+
+virtio_of_op_vring is used to transmit buffer for both control queue and virtqueue.
+The initiator MUST issues \nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Commands Definition / Vring Command}
+and specify the ndesc field as the number of buffer segments,
+also contains ndesc structure virtio_of_vring_desc.
+Each structure virtio_of_vring_desc is filled by each buffer segment one by one.
+
+\paragraph{virtio_of_op_get_vendor_id}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Opcodes Definition / virtio_of_op_get_vendor_id}
+
+virtio_of_op_get_vendor_id is used to get vendor id for control queue only.
+The initiator MUST issue a \nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Commands Definition / Common Command},
+and reads from value field of Completion as le32.
+
+\paragraph{virtio_of_op_get_device_id}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Opcodes Definition / virtio_of_op_get_device_id}
+
+virtio_of_op_get_device_id is used to get device id for control queue only.
+The initiator MUST issue a \nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Commands Definition / Common Command},
+and reads from value field of Completion as le32.
+
+\paragraph{virtio_of_op_get_generation}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Opcodes Definition / virtio_of_op_get_generation}
+
+virtio_of_op_get_generation is used to get config generation for control queue only.
+The initiator MUST issue a \nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Commands Definition / Common Command},
+and reads from value field of Completion as le32.
+
+\paragraph{virtio_of_op_get_status}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Opcodes Definition / virtio_of_op_get_status}
+
+virtio_of_op_get_status is used to get device status for control queue only.
+The initiator MUST issue a \nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Commands Definition / Common Command},
+and reads from value field of Completion as le32.
+
+\paragraph{virtio_of_op_set_status}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Opcodes Definition / virtio_of_op_set_status}
+
+virtio_of_op_set_status is used to set device status for control queue only.
+The initiator MUST issue a \nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Commands Definition / Common Command},
+and specify the value field of Common Command as le32.
+
+\paragraph{virtio_of_op_get_device_feature}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Opcodes Definition / virtio_of_op_get_device_feature}
+
+virtio_of_op_get_device_feature is used to get device feature for control queue only.
+The initiator MUST issue a \nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Commands Definition / Feature Command},
+and reads from value field of Completion as le64.
+
+The initiator uses feature_select field to select which feature bits to get. Value 0x0 selects Feature Bits 0 to 63, 0x1 selects Feature Bits 64 to 128, etc.
+
+\paragraph{virtio_of_op_set_driver_feature}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Opcodes Definition / virtio_of_op_set_driver_feature}
+
+virtio_of_op_set_driver_feature is used to set driver feature for control queue only.
+The initiator MUST issue a \nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Commands Definition / Feature Command},
+and specify the value field of Common Command as le64.
+
+The initiator uses feature_select field to select which feature bits to set.
+Value 0x0 selects Feature Bits 0 to 63, 0x1 selects Feature Bits 64 to 128, etc.
+
+\paragraph{virtio_of_op_get_num_queues}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Opcodes Definition / virtio_of_op_get_num_queues}
+
+virtio_of_op_get_num_queues is used to get the number of queues for control queue only.
+The initiator MUST issue a \nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Commands Definition / Common Command},
+and reads from value field of Completion as le16.
+
+\paragraph{virtio_of_op_get_queue_size}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Opcodes Definition / virtio_of_op_get_queue_size}
+
+virtio_of_op_get_queue_size is used to get the size of a specified queue for control queue only.
+The initiator MUST issue a \nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Commands Definition / Queue Command} with specified queue_id,
+and reads from value field of Completion as le16.
+
+\paragraph{virtio_of_op_get_config}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Opcodes Definition / virtio_of_op_get_config}
+
+virtio_of_op_get_config is used to get the config of a device for control queue only.
+The initiator MUST issue a \nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Commands Definition / Config Command} with specified offset and bytes,
+and reads from value field of Completion.
+
+The bytes field supports only:
+
+\begin{itemize}
+\item 1, then the initiator reads from value field of Completion as u8
+\item 2, then the initiator reads from value field of Completion as le16
+\item 4, then the initiator reads from value field of Completion as le32
+\item 8, then the initiator reads from value field of Completion as le64
+\end{itemize}
+
+\paragraph{virtio_of_op_set_config}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Opcodes Definition / virtio_of_op_set_config}
+
+virtio_of_op_set_config is used to set the config of a device for control queue only.
+The initiator MUST issue a \nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Commands Definition / Config Command} with specified offset and bytes and value fields.
+
+The bytes field supports only:
+
+\begin{itemize}
+\item 1, then the initiator specifies the value field of Config Command as u8
+\item 2, then the initiator specifies the value field of Config Command as le16
+\item 4, then the initiator specifies the value field of Config Command as le32
+\item 8, then the initiator specifies the value field of Config Command as le64
+\end{itemize}
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
+
+\subsection{Transport Binding}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Transport Binding}
+\subsubsection{TCP}\label{sec:Virtio Transport Options / Virtio Over Fabrics / ransport Binding / TCP}
+TCP MUST use \ref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Commands Definition / Stream Transmission}
+~\nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Commands Definition / Stream Transmission}.
+
+\subsubsection{RDMA}\label{sec:Virtio Transport Options / Virtio Over Fabrics / ransport Binding / RDMA}
+RDMA MUST use \ref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Commands Definition / Keyed Transmission}
+~\nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Commands Definition / Keyed Transmission}.
+
+\subsection{Device Initialization}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Device Initialization}
+\begin{enumerate}
+\item The control queue MUST be established firstly, once the reliable
+connection is ready, the initiator MUST issue
+\nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Opcodes Definition / virtio_of_op_connect}
+to create association with the target.
+\item The initiator SHOULD issue
+\nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Opcodes Definition / virtio_of_op_get_feature}
+to discover the capabilities offered by the target.
+\item The initiator SHOULD issue
+\nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Opcodes Definition / virtio_of_op_set_feature}
+to negotiate the capabilities.
+\item The initiator SHOULD continue initialization like PCI base devices, i.e. issue
+\nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Opcodes Definition / virtio_of_op_get_vendor_id}
+to get the vendor ID.
+\item After discovering the number of virtqueues by
+\nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Opcodes Definition / virtio_of_op_get_num_queues},
+the initiator SHOULD create virtqueue one by one by
+\nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Opcodes Definition / virtio_of_op_connect}.
+\item The virtqueue SHOULD issue
+\nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Opcodes Definition / virtio_of_op_vring}
+to transmit buffer.
+\end{enumerate}
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

