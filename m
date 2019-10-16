Return-Path: virtio-comment-return-871-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A68F4985DFB
	for <virtio-comment@lists.oasis-open.org>; Wed, 16 Oct 2019 07:50:47 +0000 (UTC)
From: Yuri Benditovich <yuri.benditovich@daynix.com>
Date: Wed, 16 Oct 2019 10:50:32 +0300
Message-Id: <20191016075032.83600-2-yuri.benditovich@daynix.com>
In-Reply-To: <20191016075032.83600-1-yuri.benditovich@daynix.com>
References: <20191016075032.83600-1-yuri.benditovich@daynix.com>
Subject: [virtio-comment] [PATCH v2 1/1] virtio-net: define support for receive-side scaling
To: virtio-comment@lists.oasis-open.org, mst@redhat.com
List-ID: <virtio-comment.lists.oasis-open.org>

Fixes https://github.com/oasis-tcs/virtio-spec/issues/48
Added support for RSS receive steering mode.

Signed-off-by: Yuri Benditovich <yuri.benditovich@daynix.com>
---
 conformance.tex |   2 +
 content.tex     | 181 ++++++++++++++++++++++++++++++++++++++++++++++--
 2 files changed, 177 insertions(+), 6 deletions(-)

diff --git a/conformance.tex b/conformance.tex
index 0ac58aa..01449c5 100644
--- a/conformance.tex
+++ b/conformance.tex
@@ -101,6 +101,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
 \item \ref{drivernormative:Device Types / Network Device / Device Operation / Control Virtqueue / Gratuitous Packet Sending}
 \item \ref{drivernormative:Device Types / Network Device / Device Operation / Control Virtqueue / Automatic receive steering in multiqueue mode}
 \item \ref{drivernormative:Device Types / Network Device / Device Operation / Control Virtqueue / Offloads State Configuration / Setting Offloads State}
+\item \ref{drivernormative:Device Types / Network Device / Device Operation / Control Virtqueue / Receive-side scaling (RSS) }
 \end{itemize}
 
 \conformance{\subsection}{Block Driver Conformance}\label{sec:Conformance / Driver Conformance / Block Driver Conformance}
@@ -257,6 +258,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
 \item \ref{devicenormative:Device Types / Network Device / Device Operation / Control Virtqueue / Setting MAC Address Filtering}
 \item \ref{devicenormative:Device Types / Network Device / Device Operation / Control Virtqueue / Gratuitous Packet Sending}
 \item \ref{devicenormative:Device Types / Network Device / Device Operation / Control Virtqueue / Automatic receive steering in multiqueue mode}
+\item \ref{devicenormative:Device Types / Network Device / Device Operation / Control Virtqueue / Receive-side scaling (RSS) / RSS processing}
 \end{itemize}
 
 \conformance{\subsection}{Block Device Conformance}\label{sec:Conformance / Device Conformance / Block Device Conformance}
diff --git a/content.tex b/content.tex
index 679391e..1e0c9b0 100644
--- a/content.tex
+++ b/content.tex
@@ -2811,6 +2811,9 @@ \subsection{Feature bits}\label{sec:Device Types / Network Device / Feature bits
 \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)] Set MAC address through control
     channel.
 
+\item[VIRTIO_NET_F_RSS(60)] Device supports RSS (receive-side scaling)
+    with Toeplitz hash calculation and configurable hash parameters for receive steering
+
 \item[VIRTIO_NET_F_RSC_EXT(61)] Device can process duplicated ACKs
     and report number of coalesced segments and duplicated ACKs
 
@@ -2840,6 +2843,7 @@ \subsubsection{Feature bit requirements}\label{sec:Device Types / Network Device
 \item[VIRTIO_NET_F_MQ] Requires VIRTIO_NET_F_CTRL_VQ.
 \item[VIRTIO_NET_F_CTRL_MAC_ADDR] Requires VIRTIO_NET_F_CTRL_VQ.
 \item[VIRTIO_NET_F_RSC_EXT] Requires VIRTIO_NET_F_HOST_TSO4 or VIRTIO_NET_F_HOST_TSO6.
+\item[VIRTIO_NET_F_RSS] Requires VIRTIO_NET_F_MQ
 \end{description}
 
 \subsubsection{Legacy Interface: Feature bits}\label{sec:Device Types / Network Device / Feature bits / Legacy Interface: Feature bits}
@@ -2854,7 +2858,7 @@ \subsubsection{Legacy Interface: Feature bits}\label{sec:Device Types / Network
 \subsection{Device configuration layout}\label{sec:Device Types / Network Device / Device configuration layout}
 \label{sec:Device Types / Block Device / Feature bits / Device configuration layout}
 
-Three driver-read-only configuration fields are currently defined. The \field{mac} address field
+Device configuration fields are listed below, they are read-only for a driver. The \field{mac} address field
 always exists (though is only valid if VIRTIO_NET_F_MAC is set), and
 \field{status} only exists if VIRTIO_NET_F_STATUS is set. Two
 read-only bits (for the driver) are currently defined for the status field:
@@ -2875,14 +2879,49 @@ \subsection{Device configuration layout}\label{sec:Device Types / Network Device
 VIRTIO_NET_F_MTU is set. This field specifies the maximum MTU for the driver to
 use.
 
+Two following fields, \field{speed} and \field{duplex} are reserved.
 \begin{lstlisting}
 struct virtio_net_config {
         u8 mac[6];
         le16 status;
         le16 max_virtqueue_pairs;
         le16 mtu;
+        le32 speed;
+        u8 duplex;
+        u8 rss_max_key_size;
+        le16 rss_max_indirection_table_length;
+        le32 rss_supported_hash_types;
 };
 \end{lstlisting}
+\label{sec:Device Types / Network Device / Device configuration layout / RSS}
+Three following fields, \field{rss_max_key_size}, \field{rss_max_indirection_table_length}
+and \field{rss_supported_hash_types} only exist if VIRTIO_NET_F_RSS is set.
+
+Field \field{rss_max_key_size} specifies maximal supported length of RSS key in bytes.
+
+Field \field{rss_max_indirection_table_length} specifies maximal number of 16-bit entries in RSS indirection table.
+
+Field \field{rss_supported_hash_types} contains bitmask of supported RSS hash types.
+
+Hash types applicable for IPv4 packets:
+\begin{lstlisting}
+#define VIRTIO_NET_RSS_HASH_TYPE_IPv4              (1 << 0)
+#define VIRTIO_NET_RSS_HASH_TYPE_TCPv4             (1 << 1)
+#define VIRTIO_NET_RSS_HASH_TYPE_UDPv4             (1 << 2)
+\end{lstlisting}
+Hash types applicable for IPv6 packets without extension headers
+\begin{lstlisting}
+#define VIRTIO_NET_RSS_HASH_TYPE_IPv6              (1 << 3)
+#define VIRTIO_NET_RSS_HASH_TYPE_TCPv6             (1 << 4)
+#define VIRTIO_NET_RSS_HASH_TYPE_UDPv6             (1 << 5)
+\end{lstlisting}
+Hash types applicable for IPv6 packets with extension headers
+\begin{lstlisting}
+#define VIRTIO_NET_RSS_HASH_TYPE_IP_EX             (1 << 6)
+#define VIRTIO_NET_RSS_HASH_TYPE_TCP_EX            (1 << 7)
+#define VIRTIO_NET_RSS_HASH_TYPE_UDP_EX            (1 << 8)
+\end{lstlisting}
+For exact meaning of VIRTIO_NET_RSS_HASH_TYPE_ flags see \ref{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Receive-side scaling (RSS) / RSS hash types}.
 
 \devicenormative{\subsubsection}{Device configuration layout}{Device Types / Network Device / Device configuration layout}
 
@@ -3684,14 +3723,16 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
 depending on the packet flow.
 
 \begin{lstlisting}
-struct virtio_net_ctrl_mq {
-        le16 virtqueue_pairs;
-};
-
 #define VIRTIO_NET_CTRL_MQ    4
  #define VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET        0
+ struct virtio_net_ctrl_mq_pairs_set {
+        le16 virtqueue_pairs;
+ };
+
  #define VIRTIO_NET_CTRL_MQ_VQ_PAIRS_MIN        1
  #define VIRTIO_NET_CTRL_MQ_VQ_PAIRS_MAX        0x8000
+
+ #define VIRTIO_NET_CTRL_MQ_RSS_CONFIG          1
 \end{lstlisting}
 
 Multiqueue is disabled by default. The driver enables multiqueue by
@@ -3701,7 +3742,11 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
 transmitq1\ldots transmitqn and receiveq1\ldots receiveqn where
 n=\field{virtqueue_pairs} MAY be used.
 
-When multiqueue is enabled, the device MUST use automatic receive steering
+After the driver enabled multiqueue and if the feature VIRTIO_NET_F_RSS is negotiated,
+the driver MAY execute VIRTIO_NET_CTRL_MQ_RSS_CONFIG command to set exact parameters for
+RSS receive steering.
+
+When multiqueue is enabled and the device feature VIRTIO_NET_F_RSS is not negotiated, the device MUST use automatic receive steering
 based on packet flow. Programming of the receive steering
 classificator is implicit. After the driver transmitted a packet of a
 flow on transmitqX, the device SHOULD cause incoming packets for that flow to
@@ -3709,6 +3754,10 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
 no packets have been transmitted yet, the device MAY steer a packet
 to a random queue out of the specified receiveq1\ldots receiveqn.
 
+When multiqueue is enabled and the device feature VIRTIO_NET_F_RSS is negotiated, the device MUST use RSS receive steering
+according to the configuration provided by the driver as defined in \ref{devicenormative:Device Types / Network Device / Device Operation / Control Virtqueue / Receive-side scaling (RSS) / RSS processing}.
+In case when multiqueue is enabled but the driver did not provide RSS configuration yet, the device SHOULD use automatic receive steering or reasonable internal RSS configuration.
+
 Multiqueue is disabled by setting \field{virtqueue_pairs} to 1 (this is
 the default) and waiting for the device to use the command buffer.
 
@@ -3741,6 +3790,126 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
 according to the native endian of the guest rather than
 (necessarily when not using the legacy interface) little-endian.
 
+\paragraph{Receive-side scaling (RSS)}\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Receive-side scaling (RSS)}
+The device indicates presence of this feature if it supports RSS receive steering with Toeplitz hash calculation and configurable parameters.
+
+\subparagraph{Querying RSS capabilities}\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Receive-side scaling (RSS) / Querying RSS capabilities}
+
+Driver queries RSS capabilities of the device by reading device configuration as defined in \ref{sec:Device Types / Network Device / Device configuration layout / RSS}
+
+\subparagraph{Setting RSS parameters}\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Receive-side scaling (RSS) / Setting RSS parameters}
+
+Driver sends VIRTIO_NET_CTRL_MQ_RSS_CONFIG command using following format for \field{command-specific-data}:
+\begin{lstlisting}
+struct virtio_net_rss_config {
+    le32 hash_types;  (bitmask of allowed hash types)
+    le16 indirection_table_length; (number of queue indices in indirection_table array)
+    le16 unclassified_queue; (queue to place unclassified packets in)
+    le16 indirection_table[indirection_table_length];
+    u8 hash_key_length;
+    u8 hash_key_data[hash_key_length];
+};
+
+\end{lstlisting}
+\subparagraph{RSS hash types}\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Receive-side scaling (RSS) / RSS hash types}
+
+The device calculates hash on IPv4 packets according to the field \field{hash_types} of virtio_net_rss_config structure as follows:
+\begin{itemize}
+\item If VIRTIO_NET_RSS_HASH_TYPE_TCPv4 is set and the packet has TCP header, the hash is calculated over following fields:
+\begin{itemize}
+\item Source IP address
+\item Destination IP address
+\item Source TCP port
+\item Destination TCP port
+\end{itemize}
+\item Else if VIRTIO_NET_RSS_HASH_TYPE_UDPv4 is set and the packet has UDP header, the hash is calculated over following fields:
+\begin{itemize}
+\item Source IP address
+\item Destination IP address
+\item Source UDP port
+\item Destination UDP port
+\end{itemize}
+\item Else if VIRTIO_NET_RSS_HASH_TYPE_IPv4 is set, the hash is calculated over following fields:
+\begin{itemize}
+\item Source IP address
+\item Destination IP address
+\end{itemize}
+\item Else the device does not calculate the hash
+\end{itemize}
+
+
+The device calculates hash on IPv6 packets without extension headers according to the field \field{hash_types} of virtio_net_rss_config structure as follows:
+\begin{itemize}
+\item If VIRTIO_NET_RSS_HASH_TYPE_TCPv6 is set and the packet has TCPv6 header, the hash is calculated over following fields:
+\begin{itemize}
+\item Source IPv6 address
+\item Destination IPv6 address
+\item Source TCP port
+\item Destination TCP port
+\end{itemize}
+\item Else if VIRTIO_NET_RSS_HASH_TYPE_UDPv6 is set and the packet has UDPv6 header, the hash is calculated over following fields:
+\begin{itemize}
+\item Source IPv6 address
+\item Destination IPv6 address
+\item Source UDP port
+\item Destination UDP port
+\end{itemize}
+\item Else if VIRTIO_NET_RSS_HASH_TYPE_IPv6 is set, the hash is calculated over following fields:
+\begin{itemize}
+\item Source IPv6 address
+\item Destination IPv6 address
+\end{itemize}
+\item Else the device does not calculate the hash
+\end{itemize}
+
+
+The device calculates hash on IPv6 packets with extension headers according to the field \field{hash_types} of virtio_net_rss_config structure as follows:
+\begin{itemize}
+\item If VIRTIO_NET_RSS_HASH_TYPE_TCP_EX is set and the packet has TCPv6 header, the hash is calculated over following fields:
+\begin{itemize}
+\item Home address from the home address option in the IPv6 destination options header. If the extension header is not present, use the Source IPv6 address.
+\item IPv6 address that is contained in the Routing-Header-Type-2 from the associated extension header. If the extension header is not present, use the Destination IPv6 address.
+\item Source TCP port
+\item Destination TCP port
+\end{itemize}
+\item Else if VIRTIO_NET_RSS_HASH_TYPE_UDP_EX is set and the packet has UDPv6 header, the hash is calculated over following fields:
+\begin{itemize}
+\item Home address from the home address option in the IPv6 destination options header. If the extension header is not present, use the Source IPv6 address.
+\item IPv6 address that is contained in the Routing-Header-Type-2 from the associated extension header. If the extension header is not present, use the Destination IPv6 address.
+\item Source UDP port
+\item Destination UDP port
+\end{itemize}
+\item Else if VIRTIO_NET_RSS_HASH_TYPE_IP_EX is set, the hash is calculated over following fields:
+\begin{itemize}
+\item Home address from the home address option in the IPv6 destination options header. If the extension header is not present, use the Source IPv6 address.
+\item IPv6 address that is contained in the Routing-Header-Type-2 from the associated extension header. If the extension header is not present, use the Destination IPv6 address.
+\end{itemize}
+\item Else skip IPv6 extension headers and calculate the hash as defined above for IPv6 packet without extension headers
+\end{itemize}
+
+
+\drivernormative{\subparagraph}{Setting RSS parameters}{Device Types / Network Device / Device Operation / Control Virtqueue / Receive-side scaling (RSS) }
+
+A driver MUST NOT set RSS parameters if the feature VIRTIO_NET_F_RSS has not been negotiated.
+
+A driver MUST NOT set RSS parameters before it successfully enabled operation with multiple queues.
+
+A driver MUST fill \field{indirection_table} array only with indices of enabled queues.
+
+An \field{indirection_table_length} MUST be power of two.
+
+A driver MUST NOT set any VIRTIO_NET_RSS_HASH_TYPE_ flags that are not supported by device.
+
+\devicenormative{\subparagraph}{RSS processing}{Device Types / Network Device / Device Operation / Control Virtqueue / Receive-side scaling (RSS) / RSS processing}
+If the device reports support for VIRTIO_NET_F_RSS it MUST support keys of at least 40 bytes and indirection table of at least 128 entries.
+
+The device MUST determine destination queue for network packet as follows:
+\begin{itemize}
+\item Calculate hash of the packet as defined in \ref{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Receive-side scaling (RSS) / RSS hash types}
+\item If the device did not calculate the hash for specific packet, the device directs the packet to the queue specified by \field{unclassified_queue} of virtio_net_rss_config structure
+\item Apply mask of (indirection_table_length - 1) to the calculated hash and use the result as the index in the indirection table to get 0-based number of destination receive queue
+\end{itemize}
+
 \paragraph{Offloads State Configuration}\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Offloads State Configuration}
 
 If the VIRTIO_NET_F_CTRL_GUEST_OFFLOADS feature is negotiated, the driver can
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

