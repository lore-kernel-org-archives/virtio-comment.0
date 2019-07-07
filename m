Return-Path: virtio-comment-return-782-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3E96C98424C
	for <virtio-comment@lists.oasis-open.org>; Sun,  7 Jul 2019 12:28:38 +0000 (UTC)
From: Yuri Benditovich <yuri.benditovich@daynix.com>
Date: Sun,  7 Jul 2019 15:28:28 +0300
Message-Id: <20190707122828.914730-1-yuri.benditovich@daynix.com>
Subject: [virtio-comment] [PATCH] virtio-net: define support for controlled steering mode
To: virtio-comment@lists.oasis-open.org, mst@redhat.com
List-ID: <virtio-comment.lists.oasis-open.org>

Introducing feature bit and set of control commands
for steering mode configuration.
---
 content.tex | 109 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 109 insertions(+)

diff --git a/content.tex b/content.tex
index 8f0498e..3515ed1 100644
--- a/content.tex
+++ b/content.tex
@@ -2732,6 +2732,9 @@ \subsection{Feature bits}\label{sec:Device Types / Network Device / Feature bits
 \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)] Set MAC address through control
     channel.
 
+\item[VIRTIO_NET_F_CTRL_STEERING_MODE(61)] Device supports selectable
+    steering mode and/or control of steering mode parameters.
+
 \item[VIRTIO_NET_F_RSC_EXT(61)] Device can process duplicated ACKs
     and report number of coalesced segments and duplicated ACKs
 
@@ -2761,6 +2764,7 @@ \subsubsection{Feature bit requirements}\label{sec:Device Types / Network Device
 \item[VIRTIO_NET_F_MQ] Requires VIRTIO_NET_F_CTRL_VQ.
 \item[VIRTIO_NET_F_CTRL_MAC_ADDR] Requires VIRTIO_NET_F_CTRL_VQ.
 \item[VIRTIO_NET_F_RSC_EXT] Requires VIRTIO_NET_F_HOST_TSO4 or VIRTIO_NET_F_HOST_TSO6.
+\item[VIRTIO_NET_F_CTRL_STEERING_MODE] Requires VIRTIO_NET_F_MQ.
 \end{description}
 
 \subsubsection{Legacy Interface: Feature bits}\label{sec:Device Types / Network Device / Feature bits / Legacy Interface: Feature bits}
@@ -3700,8 +3704,113 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
 MUST format \field{offloads}
 according to the native endian of the guest rather than
 (necessarily when not using the legacy interface) little-endian.
+\paragraph{Controlled steering mode}\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Controlled steering mode}
+Device indicates presence of this feature if it supports selectable/configurable steering modes.
+\subparagraph{Querying and setting steering mode}\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Controlled steering mode / Querying and setting steering mode}
+There are two kinds of defined commands: GET and SET.
+
+For both types of commands driver sends output buffer containing \field{virtio_net_ctrl}, as defined by the \ref{sec:Device Types / Network Device / Device Operation / Control Virtqueue}.
+
+For GET commands driver provides input for response structure defined for respective GET command.
+
+Each response structure includes first byte for \field{ack} code of regular response for control command.
+
+Driver uses following value as \field{class} for all the commands related to steering control
+\begin{lstlisting}
+#define VIRTIO_NET_CTRL_STEERING_MODE              6
+\end{lstlisting}
+To query available steering modes driver uses following value as \field{command}
+
+Device responds with \field{ack} following by bitmask designating supported steering modes
+
+\begin{lstlisting}
+#define VIRTIO_NET_CTRL_SM_GET_SUPPORTED_MODES    0
+/* automatic steering mode (default defined by the device) */
+#define STEERING_MODE_AUTO                         (1 << 0)
+/* RSS (Receive Side Scaling): input queue defined by
+   calculated hash and indirection table */
+#define STEERING_MODE_RSS                          (1 << 1)
+struct virtio_net_supported_steering_modes {
+    u8 ack;
+    u8 steering_modes;
+};
+\end{lstlisting}
+
+For all operation related to specific steering mode driver uses following value as \field{command}
+and uses following structure for \field{command-specific-data}
+\begin{lstlisting}
+#define VIRTIO_NET_CTRL_SM_CONTROL                1
+
+struct virtio_net_steering_mode_control {
+    u8 steering_mode;
+    u8 mode_command;
+};
+\end{lstlisting}
+In case of \field{steering_mode}=STEERING_MODE_AUTO the value of \field{mode_command} is ignored.
+
+In case of \field{steering_mode}=STEERING_MODE_RSS possible values of \field{mode_command} are:
+\begin{lstlisting}
+#define VIRTIO_NET_SM_CTRL_RSS_SET                       0
+#define VIRTIO_NET_SM_CTRL_RSS_GET_SUPPORTED_FUNCTIONS   1
+#define VIRTIO_NET_SM_CTRL_RSS_GET_SUPPORTED_HASHES      2
+\end{lstlisting}
+Response on VIRTIO_NET_SM_CTRL_RSS_GET_SUPPORTED_FUNCTIONS is a structure containing bitmask value:
+\begin{lstlisting}
+struct virtio_net_supported_hash_functions {
+    u8 ack;
+    u8 supported_hash_functions;
+};
+#define VIRTIO_RSS_HASH_FUNCTION_TOEPLITZ          (1 << 0)
+#define VIRTIO_RSS_HASH_FUNCTION_SYMMETRIC         (1 << 1)
+\end{lstlisting}
+Response on VIRTIO_NET_SM_CTRL_RSS_GET_SUPPORTED_HASHES command  is a structure containing bitmask values:
+
+Device reports supported hash types separately for IPv4 and IPv6.
+\begin{lstlisting}
+struct virtio_net_supported_hashes {
+    u8  ack;
+    u8  hash_types_v4;
+    u8  hash_types_v6;
+    u8  max_key_length;
+    /* maximal number of 16-bit entries */
+    le16  max_indirection_table_len;
+};
+#define VIRTIO_NET_SM_HASH_SUPPORT_IP              (1 << 0)
+#define VIRTIO_NET_SM_HASH_SUPPORT_IP_EX           (1 << 1)
+#define VIRTIO_NET_SM_HASH_SUPPORT_TCP             (1 << 2)
+#define VIRTIO_NET_SM_HASH_SUPPORT_TCP_EX          (1 << 3)
+#define VIRTIO_NET_SM_HASH_SUPPORT_UDP             (1 << 4)
+#define VIRTIO_NET_SM_HASH_SUPPORT_UDP_EX          (1 << 5)
+\end{lstlisting}
+For VIRTIO_NET_SM_CTRL_RSS_SET command driver sends following structure:
+\begin{lstlisting}
+struct virtio_net_rss_conf {
+    u8  hash_types_v4; /* one or more of VIRTIO_NET_SM_HASH_SUPPORT bits*/
+    u8  hash_types_v6; /* one or more of VIRTIO_NET_SM_HASH_SUPPORT bits*/
+    u8  hash_function; /* one of VIRTIO_RSS_HASH_FUNCTION*/
+    u8  hash_key_length;
+    le16 indirection_table_length;
+    /* queue to place unclassified packets in */
+    le16 default_queue;
+    /* le16 indirection_table[indirection_table_length] */
+    /* u8   hash key data[hash_key_length]*/
+};
+\end{lstlisting}
+\drivernormative{\subparagraph}{Querying and setting steering mode}{Device Types / Network Device / Device Operation / Control Virtqueue / Controlled steering mode / Querying and setting steering mode}
+
+A driver MUST NOT use commands of steering mode control if
+the feature VIRTIO_NET_F_CTRL_STEERING_MODE has not been negotiated
+and before it successfully enabled operation with multiple queues.
+
+A driver MUST fill \field{indirection_table} array only with indices of active queues.
+
+A \field{indirection_table_length} MUST be power of two.
+\devicenormative{\subparagraph}{RSS Toeplitz implementation}{Device Types / Network Device / Device Operation / Control Virtqueue / Controlled steering mode / Querying and setting steering mode }
+If device reports support for VIRTIO_RSS_HASH_FUNCTION_TOEPLITZ:
 
+It MUST support keys of at least 40 bytes and indirection table of at least 128 entries.
 
+The device applies mask of (indirection_table_length - 1) to the calculated hash and uses the result as the index in the indirection table to get index of destination receive queue.
 \subsubsection{Legacy Interface: Framing Requirements}\label{sec:Device
 Types / Network Device / Legacy Interface: Framing Requirements}
 
-- 
2.17.2


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

