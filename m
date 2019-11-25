Return-Path: virtio-comment-return-950-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 471C0985DB8
	for <virtio-comment@lists.oasis-open.org>; Mon, 25 Nov 2019 18:34:40 +0000 (UTC)
From: Yuri Benditovich <yuri.benditovich@daynix.com>
Date: Mon, 25 Nov 2019 20:34:30 +0200
Message-Id: <20191125183430.1686620-1-yuri.benditovich@daynix.com>
Subject: [virtio-comment] [PATCH] virtio-net: (spelling only) support for receive-side scaling
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
To: virtio-comment@lists.oasis-open.org, mst@redhat.com
List-ID: <virtio-comment.lists.oasis-open.org>

Additional patch for previous 'v4 virtio-net: define support for
receive-side scaling' - contains only spelling fixes.

Signed-off-by: Yuri Benditovich <yuri.benditovich@daynix.com>
---
 content.tex | 60 ++++++++++++++++++++++++++---------------------------
 1 file changed, 30 insertions(+), 30 deletions(-)

diff --git a/content.tex b/content.tex
index 7a7abd2..01be7df 100644
--- a/content.tex
+++ b/content.tex
@@ -2897,11 +2897,11 @@ \subsection{Device configuration layout}\label{sec:=
Device Types / Network Device
 Three following fields, \field{rss_max_key_size}, \field{rss_max_indirecti=
on_table_length}
 and \field{supported_hash_types} only exist if VIRTIO_NET_F_RSS is set.
=20
-Field \field{rss_max_key_size} specifies maximal supported length of RSS k=
ey in bytes.
+Field \field{rss_max_key_size} specifies the maximal supported length of R=
SS key in bytes.
=20
 Field \field{rss_max_indirection_table_length} specifies maximal number of=
 16-bit entries in RSS indirection table.
=20
-Field \field{supported_hash_types} contains bitmask of supported RSS hash =
types.
+Field \field{supported_hash_types} contains the bitmask of supported RSS h=
ash types.
=20
 Hash types applicable for IPv4 packets:
 \begin{lstlisting}
@@ -2921,7 +2921,7 @@ \subsection{Device configuration layout}\label{sec:De=
vice Types / Network Device
 #define VIRTIO_NET_RSS_HASH_TYPE_TCP_EX            (1 << 7)
 #define VIRTIO_NET_RSS_HASH_TYPE_UDP_EX            (1 << 8)
 \end{lstlisting}
-For exact meaning of VIRTIO_NET_RSS_HASH_TYPE_ flags see \ref{sec:Device T=
ypes / Network Device / Device Operation / Control Virtqueue / Receive-side=
 scaling (RSS) / RSS hash types}.
+For the exact meaning of VIRTIO_NET_RSS_HASH_TYPE_ flags see \ref{sec:Devi=
ce Types / Network Device / Device Operation / Control Virtqueue / Receive-=
side scaling (RSS) / RSS hash types}.
=20
 \devicenormative{\subsubsection}{Device configuration layout}{Device Types=
 / Network Device / Device configuration layout}
=20
@@ -3722,12 +3722,12 @@ \subsubsection{Control Virtqueue}\label{sec:Device =
Types / Network Device / Devi
=20
 \paragraph{Device operation in multiqueue mode}\label{sec:Device Types / N=
etwork Device / Device Operation / Control Virtqueue / Device operation in =
multiqueue mode}
=20
-This specification defines following modes that a device MAY implement for=
 operation with multiple transmit/receive virtqueues:
+This specification defines the following modes that a device MAY implement=
 for operation with multiple transmit/receive virtqueues:
 \begin{itemize}
 \item Automatic receive steering as defined in \ref{sec:Device Types / Net=
work Device / Device Operation / Control Virtqueue / Automatic receive stee=
ring in multiqueue mode}.
- If a device supports such mode, it offers VIRTIO_NET_F_MQ feature bit.
+ If a device supports this mode, it offers the VIRTIO_NET_F_MQ feature bit=
.
 \item Receive-side scaling as defined in \ref{devicenormative:Device Types=
 / Network Device / Device Operation / Control Virtqueue / Receive-side sca=
ling (RSS) / RSS processing}.
- If a device supports such mode, it offers VIRTIO_NET_F_RSS feature bit.
+ If a device supports this mode, it offers the VIRTIO_NET_F_RSS feature bi=
t.
 \end{itemize}
=20
 A device MAY support one of these features or both. The driver MAY negotia=
te any set of these features that the device supports.
@@ -3741,7 +3741,7 @@ \subsubsection{Control Virtqueue}\label{sec:Device Ty=
pes / Network Device / Devi
  #define VIRTIO_NET_CTRL_MQ_RSS_CONFIG          1 (for configurable receiv=
e steering)
 \end{lstlisting}
=20
-If more than one multiqueue mode negotiated, the resulting device configur=
ation is defined by the last command sent by the driver.
+If more than one multiqueue mode is negotiated, the resulting device confi=
guration is defined by the last command sent by the driver.
=20
 \paragraph{Automatic receive steering in multiqueue mode}\label{sec:Device=
 Types / Network Device / Device Operation / Control Virtqueue / Automatic =
receive steering in multiqueue mode}
=20
@@ -3792,7 +3792,7 @@ \subsubsection{Control Virtqueue}\label{sec:Device Ty=
pes / Network Device / Devi
=20
 \devicenormative{\subparagraph}{Automatic receive steering in multiqueue m=
ode}{Device Types / Network Device / Device Operation / Control Virtqueue /=
 Automatic receive steering in multiqueue mode}
=20
-The device after initialization of reset MUST queue packets only on receiv=
eq1.
+After initialization or reset, the device MUST queue packets only on recei=
veq1.
=20
 The device MUST NOT queue packets on receive queues greater than
 \field{virtqueue_pairs} once it has placed the
@@ -3805,13 +3805,13 @@ \subsubsection{Control Virtqueue}\label{sec:Device =
Types / Network Device / Devi
 (necessarily when not using the legacy interface) little-endian.
=20
 \paragraph{Receive-side scaling (RSS)}\label{sec:Device Types / Network De=
vice / Device Operation / Control Virtqueue / Receive-side scaling (RSS)}
-A device offers feature VIRTIO_NET_F_RSS if it supports RSS receive steeri=
ng with Toeplitz hash calculation and configurable parameters.
+A device offers the feature VIRTIO_NET_F_RSS if it supports RSS receive st=
eering with Toeplitz hash calculation and configurable parameters.
=20
 A driver queries RSS capabilities of the device by reading device configur=
ation as defined in \ref{sec:Device Types / Network Device / Device configu=
ration layout / RSS}
=20
 \subparagraph{Setting RSS parameters}\label{sec:Device Types / Network Dev=
ice / Device Operation / Control Virtqueue / Receive-side scaling (RSS) / S=
etting RSS parameters}
=20
-Driver sends VIRTIO_NET_CTRL_MQ_RSS_CONFIG command using following format =
for \field{command-specific-data}:
+Driver sends a VIRTIO_NET_CTRL_MQ_RSS_CONFIG command using the following f=
ormat for \field{command-specific-data}:
 \begin{lstlisting}
 struct virtio_net_rss_config {
     le32 hash_types;
@@ -3826,34 +3826,34 @@ \subsubsection{Control Virtqueue}\label{sec:Device =
Types / Network Device / Devi
 Field \field{hash_types} contains a bitmask of allowed hash types as
 defined in \ref{sec:Device Types / Network Device / Device Operation / Con=
trol Virtqueue / Receive-side scaling (RSS) / RSS hash types}.
=20
-Field \field{indirection_table_mask} is a mask to be applied to calculated=
 hash to produce index in \field{indirection_table array}.
+Field \field{indirection_table_mask} is a mask to be applied to the calcul=
ated hash to produce an index in \field{indirection_table} array.
 Number of entries in \field{indirection_table} is (\field{indirection_tabl=
e_mask} + 1).
=20
-Field \field{unclassified_queue} contains 0-based index of receive virtque=
ue to place unclassified packets in. Index 0 corresponds to receiveq1.
+Field \field{unclassified_queue} contains the 0-based index of receive vir=
tqueue to place unclassified packets in. Index 0 corresponds to receiveq1.
=20
-Field \field{indirection_table} contains array of 0-based indices of recei=
ve virtqueus. Index 0 corresponds to receiveq1.
+Field \field{indirection_table} contains an array of 0-based indices of re=
ceive virtqueus. Index 0 corresponds to receiveq1.
=20
 A driver sets \field{max_tx_vq} to inform a device how many transmit virtq=
ueues it may use (transmitq1\ldots transmitq \field{max_tx_vq}).
=20
 \subparagraph{RSS hash types}\label{sec:Device Types / Network Device / De=
vice Operation / Control Virtqueue / Receive-side scaling (RSS) / RSS hash =
types}
=20
-The device calculates hash on IPv4 packets according to the field \field{h=
ash_types} of virtio_net_rss_config structure as follows:
+The device calculates the hash on IPv4 packets according to the field \fie=
ld{hash_types} of the virtio_net_rss_config structure as follows:
 \begin{itemize}
-\item If VIRTIO_NET_RSS_HASH_TYPE_TCPv4 is set and the packet has TCP head=
er, the hash is calculated over following fields:
+\item If VIRTIO_NET_RSS_HASH_TYPE_TCPv4 is set and the packet has a TCP he=
ader, the hash is calculated over the following fields:
 \begin{itemize}
 \item Source IP address
 \item Destination IP address
 \item Source TCP port
 \item Destination TCP port
 \end{itemize}
-\item Else if VIRTIO_NET_RSS_HASH_TYPE_UDPv4 is set and the packet has UDP=
 header, the hash is calculated over following fields:
+\item Else if VIRTIO_NET_RSS_HASH_TYPE_UDPv4 is set and the packet has a U=
DP header, the hash is calculated over the following fields:
 \begin{itemize}
 \item Source IP address
 \item Destination IP address
 \item Source UDP port
 \item Destination UDP port
 \end{itemize}
-\item Else if VIRTIO_NET_RSS_HASH_TYPE_IPv4 is set, the hash is calculated=
 over following fields:
+\item Else if VIRTIO_NET_RSS_HASH_TYPE_IPv4 is set, the hash is calculated=
 over the following fields:
 \begin{itemize}
 \item Source IP address
 \item Destination IP address
@@ -3861,23 +3861,23 @@ \subsubsection{Control Virtqueue}\label{sec:Device =
Types / Network Device / Devi
 \item Else the device does not calculate the hash
 \end{itemize}
=20
-The device calculates hash on IPv6 packets without extension headers accor=
ding to the field \field{hash_types} of virtio_net_rss_config structure as =
follows:
+The device calculates the hash on IPv6 packets without extension headers a=
ccording to the field \field{hash_types} of the virtio_net_rss_config struc=
ture as follows:
 \begin{itemize}
-\item If VIRTIO_NET_RSS_HASH_TYPE_TCPv6 is set and the packet has TCPv6 he=
ader, the hash is calculated over following fields:
+\item If VIRTIO_NET_RSS_HASH_TYPE_TCPv6 is set and the packet has a TCPv6 =
header, the hash is calculated over the following fields:
 \begin{itemize}
 \item Source IPv6 address
 \item Destination IPv6 address
 \item Source TCP port
 \item Destination TCP port
 \end{itemize}
-\item Else if VIRTIO_NET_RSS_HASH_TYPE_UDPv6 is set and the packet has UDP=
v6 header, the hash is calculated over following fields:
+\item Else if VIRTIO_NET_RSS_HASH_TYPE_UDPv6 is set and the packet has a U=
DPv6 header, the hash is calculated over the following fields:
 \begin{itemize}
 \item Source IPv6 address
 \item Destination IPv6 address
 \item Source UDP port
 \item Destination UDP port
 \end{itemize}
-\item Else if VIRTIO_NET_RSS_HASH_TYPE_IPv6 is set, the hash is calculated=
 over following fields:
+\item Else if VIRTIO_NET_RSS_HASH_TYPE_IPv6 is set, the hash is calculated=
 over the following fields:
 \begin{itemize}
 \item Source IPv6 address
 \item Destination IPv6 address
@@ -3885,23 +3885,23 @@ \subsubsection{Control Virtqueue}\label{sec:Device =
Types / Network Device / Devi
 \item Else the device does not calculate the hash
 \end{itemize}
=20
-The device calculates hash on IPv6 packets with extension headers accordin=
g to the field \field{hash_types} of virtio_net_rss_config structure as fol=
lows:
+The device calculates the hash on IPv6 packets with extension headers acco=
rding to the field \field{hash_types} of the virtio_net_rss_config structur=
e as follows:
 \begin{itemize}
-\item If VIRTIO_NET_RSS_HASH_TYPE_TCP_EX is set and the packet has TCPv6 h=
eader, the hash is calculated over following fields:
+\item If VIRTIO_NET_RSS_HASH_TYPE_TCP_EX is set and the packet has a TCPv6=
 header, the hash is calculated over the following fields:
 \begin{itemize}
 \item Home address from the home address option in the IPv6 destination op=
tions header. If the extension header is not present, use the Source IPv6 a=
ddress.
 \item IPv6 address that is contained in the Routing-Header-Type-2 from the=
 associated extension header. If the extension header is not present, use t=
he Destination IPv6 address.
 \item Source TCP port
 \item Destination TCP port
 \end{itemize}
-\item Else if VIRTIO_NET_RSS_HASH_TYPE_UDP_EX is set and the packet has UD=
Pv6 header, the hash is calculated over following fields:
+\item Else if VIRTIO_NET_RSS_HASH_TYPE_UDP_EX is set and the packet has a =
UDPv6 header, the hash is calculated over the following fields:
 \begin{itemize}
 \item Home address from the home address option in the IPv6 destination op=
tions header. If the extension header is not present, use the Source IPv6 a=
ddress.
 \item IPv6 address that is contained in the Routing-Header-Type-2 from the=
 associated extension header. If the extension header is not present, use t=
he Destination IPv6 address.
 \item Source UDP port
 \item Destination UDP port
 \end{itemize}
-\item Else if VIRTIO_NET_RSS_HASH_TYPE_IP_EX is set, the hash is calculate=
d over following fields:
+\item Else if VIRTIO_NET_RSS_HASH_TYPE_IP_EX is set, the hash is calculate=
d over the following fields:
 \begin{itemize}
 \item Home address from the home address option in the IPv6 destination op=
tions header. If the extension header is not present, use the Source IPv6 a=
ddress.
 \item IPv6 address that is contained in the Routing-Header-Type-2 from the=
 associated extension header. If the extension header is not present, use t=
he Destination IPv6 address.
@@ -3911,21 +3911,21 @@ \subsubsection{Control Virtqueue}\label{sec:Device =
Types / Network Device / Devi
=20
 \drivernormative{\subparagraph}{Setting RSS parameters}{Device Types / Net=
work Device / Device Operation / Control Virtqueue / Receive-side scaling (=
RSS) }
=20
-A driver MUST NOT send VIRTIO_NET_CTRL_MQ_RSS_CONFIG command if the featur=
e VIRTIO_NET_F_RSS has not been negotiated.
+A driver MUST NOT send the VIRTIO_NET_CTRL_MQ_RSS_CONFIG command if the fe=
ature VIRTIO_NET_F_RSS has not been negotiated.
=20
 A driver MUST fill \field{indirection_table} array only with indices of en=
abled queues. Index 0 corresponds to receiveq1.
=20
-Number of entries in \field{indirection_table} (\field{indirection_table_m=
ask} + 1) MUST be a power of two.
+The number of entries in \field{indirection_table} (\field{indirection_tab=
le_mask} + 1) MUST be a power of two.
=20
 A driver MUST use \field{indirection_table_mask} values that are less than=
 \field{rss_max_indirection_table_length} reported by a device.
=20
 A driver MUST NOT set any VIRTIO_NET_RSS_HASH_TYPE_ flags that are not sup=
ported by a device.
=20
 \devicenormative{\subparagraph}{RSS processing}{Device Types / Network Dev=
ice / Device Operation / Control Virtqueue / Receive-side scaling (RSS) / R=
SS processing}
-The device MUST determine destination queue for network packet as follows:
+The device MUST determine the destination queue for network packets as fol=
lows:
 \begin{itemize}
-\item Calculate hash of the packet as defined in \ref{sec:Device Types / N=
etwork Device / Device Operation / Control Virtqueue / Receive-side scaling=
 (RSS) / RSS hash types}
-\item If the device did not calculate the hash for specific packet, the de=
vice directs the packet to the receiveq specified by \field{unclassified_qu=
eue} of virtio_net_rss_config structure (value of 0 corresponds to receiveq=
1).
+\item Calculate the hash of the packet as defined in \ref{sec:Device Types=
 / Network Device / Device Operation / Control Virtqueue / Receive-side sca=
ling (RSS) / RSS hash types}
+\item If the device did not calculate the hash for a specific packet, the =
device directs the packet to the receiveq specified by \field{unclassified_=
queue} of virtio_net_rss_config structure (value of 0 corresponds to receiv=
eq1).
 \item Apply \field{indirection_table_mask} to the calculated hash and use =
the result as the index in the indirection table to get 0-based number of d=
estination receiveq (value of 0 corresponds to receiveq1).
 \end{itemize}
=20
--=20
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
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lis=
ts
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

