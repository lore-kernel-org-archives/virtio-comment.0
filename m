Return-Path: <virtio-comment-return-8327-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0F27C4332F
	for <virtio-comment@archiver.kernel.org>; Fri, 10 Nov 2023 12:39:45 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 61AE26D08
	for <virtio-comment@archiver.kernel.org>; Fri, 10 Nov 2023 12:39:45 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5BA1C986D4D
	for <virtio-comment@archiver.kernel.org>; Fri, 10 Nov 2023 12:39:45 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 50F8A986D10; Fri, 10 Nov 2023 12:39:45 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 426E9986D06
	for <virtio-comment@lists.oasis-open.org>; Fri, 10 Nov 2023 12:39:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=etG5Ondi/5XiButFBU1NfxTU8ek8z3sFN01ufPJWPPnDQtGsrpqDQVAVdeIRLT+YwNbeaYc7MomcGDqHTHqPGbHCNiBJehQOMqPFjQRVDaTza0mch7uIz3FjViLd7kb2PfNS80bUsL2uJAE6qpjSyoUBO2kzVrmhStvRLi3wAhjxBAEjDAYykGXRVr5XFczWkP1YUHKzAqmkvvgrRYGKk6GhsRMstYYMYUQDLuIOo2NVF5Mx6p8V66raIspLFQZWBgFbB+IIagGMvyNYz76QsYVkbyKlXyG8+EbXvVf4TDm8p+dsxnPkgPw5szbUDDRsCrfLZS+wnod0wAUcE9IGuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=raf6sILKazCq303ykMfViB9AYMJ9ZW2YT/IW4twfEjs=;
 b=LCAPk4SawD4mH6lpI6IA6b0lFHKXTRnlDtMnZeX9g6seqBYxn/0k15VqypMgq2LdjomKhXEMuPzMahZ3lzZcdZX/WntcVP2BFwkwzhlknrzLDCNOBYAusPdYAPHC8VJFE5hQkIe1zK17yLoociGFaTf+7fAsSH+Mmm9+LD1wCPz3WPEQvfEhndk4iqIyOaeO47K9lhFZVTDqNYhBtMQcc0HznLXVfbJbIBb69jktA9xdpUU4WoALBehd9W99yu6HcLyHKS/m/jGvCEM36wgMeI79AMSj78i9L1O9Cfk61iO56GZlZ7qxK/5Qry/s1roEj8RGL0/Risy2qyRQh3kJCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.oasis-open.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
From: Parav Pandit <parav@nvidia.com>
To: <virtio-comment@lists.oasis-open.org>, <mst@redhat.com>,
	<cohuck@redhat.com>
CC: <sburla@marvell.com>, <shahafs@nvidia.com>, <si-wei.liu@oracle.com>,
	<xuanzhuo@linux.alibaba.com>, Parav Pandit <parav@nvidia.com>, Heng Qi
	<hengqi@linux.alibaba.com>
Date: Fri, 10 Nov 2023 14:38:52 +0200
Message-ID: <20231110123853.2093309-5-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231110123853.2093309-1-parav@nvidia.com>
References: <20231110123853.2093309-1-parav@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003445:EE_|LV2PR12MB6015:EE_
X-MS-Office365-Filtering-Correlation-Id: d1a5df27-f9eb-4e39-824d-08dbe1ea1a5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YbB8HVa60DlmqkcRNZWu5Mnbdfpn0ORXEBa8nzDf+cGNLbVLhG8CHyG9BlYCXUEP5EDnVvcob7wAfb+DwJsnhdYz+oCU6IhvbYMa39y95s8TBPt7M89HBgDWXJrtP13L7UOBUnnbkb9cAM/6LglLsbBf44ChLx9RMhyT+Fi9cFjofjlJNygk3a3bBy7B4mAeVIG26Jf7hpP9iE6gKvxgNq4IDLE5jsHMYX0i5smUYvdKJLfB9g6O7njGpknHUUIPsxkyMUWX8IgKknnq7nmlK5uyjChRQcjKpf0LGkAKmUnawBBYhluPiOlQRytqYnTlsGp98ZGoWqE0pjVfDm8c/tlLo2tPreP5THT6AnFtu4SU0+dOpZoG1cJaxUCtt70ECOSPCnbDTV01SmtIdCovSWrcV1WfMTh1JulYbV5H4WC8Z3kdvqVFY6PhVGZbzQSu6lMH5agFjcTXEL9Y2WzSGppSwYWrBOYSv145SeaKdVofBnq7/YuRPE7pIWp0JjfBGdz4P216yUQPtbM+NmrosKEwzRd5midvvKUHiYRQrg1ARkjfx1X2yMuCL+Zv7K5gK51HA6NWArc+jvv042BVfmToTgbBs0q6VYhhWuB1f+4VXGZK8ZwjI31ERZgXA6asOGMc4kwfkFC6CVfqm7lmYVinuhHBaW/FnynnZFUYVUM++HR3j3oQmDohiD2GRz5uv91Kd8iA5IpKj2VuTs0AmlMYDq+NMlcMDiCtSuWUSG6GB3oSEKHmhjiLmXutcW/xvGOKU6j+T8CnZJjpWcsgPVth4dRpHQJxiJmi9VNAknY=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(39860400002)(346002)(396003)(376002)(230922051799003)(1800799009)(82310400011)(186009)(451199024)(64100799003)(46966006)(36840700001)(40470700004)(966005)(26005)(2616005)(426003)(40460700003)(1076003)(336012)(70586007)(70206006)(82740400003)(16526019)(478600001)(36756003)(54906003)(316002)(110136005)(6666004)(8676002)(2906002)(40480700001)(30864003)(356005)(4326008)(8936002)(83380400001)(36860700001)(41300700001)(7636003)(86362001)(5660300002)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2023 12:39:38.2492
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d1a5df27-f9eb-4e39-824d-08dbe1ea1a5e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003445.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB6015
Subject: [virtio-comment] [PATCH v6 4/5] virtio-net: Add flow filter match entry, action and requests

Define flow filter match key for the defined types.

Currently it covers the most common filter types and value
of Ethernet header, IP addresses, TCP and UDP ports.

Define generic flow filter add and delete requests and its transport
using a control virtqueue command and flow filter virtqueue(s).

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/179
Signed-off-by: Heng Qi <hengqi@linux.alibaba.com>
Signed-off-by: Parav Pandit <parav@nvidia.com>

---
changelog:
v2->v3:
- removed references to flow filter virtqueues
- removed one partial sentence
- added text for delete request
- aligned request and opcode values to just say request in the defines
v1->v2:
- squashed with match fields definition patch of v1
- added length to the flexible array defintion struct to benefit
  from future runtime length bound checkers listed in
  https://people.kernel.org/kees/bounded-flexible-arrays-in-c
- renamed value to key
- addressed comments from Satananda
- merged destination and action to one struct
v0->v1:
- reworded add flow request text to consider optional mask
- replaced respond with set
- added mask flag to the type
---
 device-types/net/description.tex | 211 ++++++++++++++++++++++++++++++-
 1 file changed, 208 insertions(+), 3 deletions(-)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index 31c8c35..c1a08f8 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -33,9 +33,6 @@ \subsection{Virtqueues}\label{sec:Device Types / Network Device / Virtqueues}
 controlq is optional; it only exists if VIRTIO_NET_F_CTRL_VQ is
 negotiated.
 
-The flow filter virtqueues are optional; it may exists only if VIRTIO_NET_F_FLOW_FILTER
-is negotiated and if the device reports such capability.
-
 \subsection{Feature bits}\label{sec:Device Types / Network Device / Feature bits}
 
 \begin{description}
@@ -1244,6 +1241,50 @@ \subsubsection{Flow Filter}\label{sec:Device Types / Network Device / Device Ope
 };
 \end{lstlisting}
 
+\begin{lstlisting}
+struct virtio_ff_match_entry {
+        le16 type;
+        u8 mask_present;
+        u8 key_mask_len; /* sum of length of fields key and mask */
+        le64 fields_bmap;
+        u8 key[];
+        u8 mask[]; /* optional, only present when mask_present is set to 1 */
+};
+
+struct virtio_ff_match {
+       u8 num_entries; /* indicates number of valid entries */
+       u8 reserved[7];
+       struct virtio_ff_match_entry entries[];
+};
+
+#define VIRTIO_NET_FF_DEST_TYPE_RQ 0
+
+struct virtio_ff_action_forward {
+        u8 dest_type;
+        u8 reserved[3];
+        union {
+                le16 vq_index;
+                le32 reserved1;
+        };
+};
+
+#define VIRTIO_NET_FF_ACTION_DROP 0
+#define VIRTIO_NET_FF_ACTION_FORWARD 1
+
+struct virtio_ff_action_entry {
+        u8 action;
+        u8 len; /* indicates the length of value in bytes */
+        u8 value[];
+};
+
+struct virtio_ff_action {
+        u8 num_entries; /* indicates number of valid entries */
+        u8 reserved[7];
+        struct virtio_ff_action_entry entries[];
+};
+
+\end{lstlisting}
+
 The \field{type} corresponds to following table:
 
 \begin{tabular}{|l|l|l|}
@@ -1290,6 +1331,21 @@ \subsubsection{Flow Filter}\label{sec:Device Types / Network Device / Device Ope
 \hline
 \end{tabular}
 
+For the \field{type} of VIRTIO_NET_FF_ETH_HDR, the match entry
+\field{key} and \field{mask} are in following format:
+
+\begin{lstlisting}
+struct virtio_net_ff_match_eth_hdr {
+        u8 dmac[6];
+        u8 smac[6];
+        le16 ether_type;
+};
+\end{lstlisting}
+
+The \field{dmac} is valid when VIRTIO_NET_FF_DST_MAC is set.
+The \field{smac} is valid when VIRTIO_NET_FF_SRC_MAC is set.
+The \field{ether_type} is valid when VIRTIO_NET_FF_ETHER_TYPE is set.
+
 For the \field{type} of VIRTIO_NET_FF_VLAN_TAG_HDR, VLAN tag fields
 are represented by a bitmap in \field{fields_bmap} are following:
 
@@ -1318,6 +1374,20 @@ \subsubsection{Flow Filter}\label{sec:Device Types / Network Device / Device Ope
 \hline
 \end{tabular}
 
+For the \field{type} of VIRTIO_NET_FF_IPV4_HDR, match entry
+\field{key} and \field{mask} are in following format:
+
+\begin{lstlisting}
+struct virtio_net_ff_match_ipv4_hdr {
+        le32 reserved[3];
+        le32 sip;
+        le32 dip;
+};
+\end{lstlisting}
+
+The \field{sip} is valid when VIRTIO_NET_FF_SRC_IPV4 is set.
+The \field{dip} is valid when VIRTIO_NET_FF_DST_IPV4 is set.
+
 For the \field{type} of VIRTIO_NET_FF_IPV6_HDR, header fields
 are represented by a bitmap in \field{fields_bmap} are following:
 
@@ -1333,6 +1403,20 @@ \subsubsection{Flow Filter}\label{sec:Device Types / Network Device / Device Ope
 \hline
 \end{tabular}
 
+For the \field{type} of VIRTIO_NET_FF_IPV4_HDR, match entry
+\field{key} and \field{mask} are in following format:
+
+\begin{lstlisting}
+struct virtio_net_ff_match_ipv6_hdr {
+        le32 reserved[2];
+        u8 sip[16];
+        u8 dip[16];
+};
+\end{lstlisting}
+
+The \field{sip} is valid when VIRTIO_NET_FF_SRC_IPV6 is set.
+The \field{dip} is valid when VIRTIO_NET_FF_DST_IPV6 is set.
+
 For the \field{type} of VIRTIO_NET_FF_TCP_HDR, header fields
 are represented by a bitmap in \field{fields_bmap} are following:
 
@@ -1348,6 +1432,20 @@ \subsubsection{Flow Filter}\label{sec:Device Types / Network Device / Device Ope
 \hline
 \end{tabular}
 
+For the \field{type} of VIRTIO_NET_FF_TCP_HDR, match entry
+\field{key} and \field{mask} are in following format:
+
+\begin{lstlisting}
+struct virtio_ndr_ff_match_tcp_hdr {
+        le16 sport;
+        le16 dport;
+        le32 reserved[4];
+};
+\end{lstlisting}
+
+The \field{sport} is valid when VIRTIO_NET_FF_SRC_TCP_PORT is set.
+This \field{dport} is valid when VIRTIO_NET_FF_DST_TCP_PORT is set.
+
 For the \field{type} of VIRTIO_NET_FF_UDP_HDR, header fields
 are represented by a bitmap in \field{fields_bmap} are following:
 
@@ -1363,6 +1461,88 @@ \subsubsection{Flow Filter}\label{sec:Device Types / Network Device / Device Ope
 \hline
 \end{tabular}
 
+For the \field{type} of VIRTIO_NET_FF_UDP_HDR, match entry
+\field{key} and \field{mask} are in following format:
+
+\begin{lstlisting}
+struct virtio_ndr_ff_match_udp_hdr {
+        le16 sport;
+        le16 dport;
+        le32 reserved;
+};
+\end{lstlisting}
+
+The \field{sport} is valid when VIRTIO_NET_FF_SRC_UDP_PORT is set.
+This \field{dport} is valid when VIRTIO_NET_FF_DST_UDP_PORT is set.
+
+\paragraph{Flow Filter Request}
+\label{sec:Device Types / Network Device / Device Operation / Flow Filter / Flow Filter Request}
+
+Two flow filter requests are supported by the device.
+
+\begin{itemize}
+\item Add or replace a flow filter using a request \field{struct virtio_net_ff_add}.
+
+\item Delete an existing flow filter using a request \field{struct virtio_net_ff_del}.
+
+\end{itemize}
+
+\begin{lstlisting}
+#define VIRTIO_NET_FF_REQ_ADD 0
+#define VIRTIO_NET_FF_REQ_DEL 1
+
+struct virtio_net_ff_add {
+        u8 request; /* VIRTIO_NET_FF_REQ_ADD */
+        u8 priority;	/* higher the value, higher priority */
+        u16 group_id;
+        le32 id;
+        struct virtio_ff_match match;
+        struct virtio_ff_action action;
+};
+
+struct virtio_net_ff_del {
+        u8 request;  /* VIRTIO_NET_FF_REQ_DEL */
+        u8 reserved[3];
+        le32 id;
+};
+
+struct virtio_net_ff_result {
+        le16 status;
+};
+
+#define VIRTIO_NET_FF_RESULT_OK 0
+#define VIRTIO_NET_FF_RESULT_ERR 1
+
+struct virtio_net_ff_req {
+        /* Device-readable part */
+        union {
+                struct virtio_net_ff_add add;
+                struct virtio_net_ff_del del;
+        };
+        /* Device-writable part */
+        struct virtio_net_ff_result result;
+};
+\end{lstlisting}
+
+When adding a flow filter entry using request \field{struct virtio_net_ff_add},
+the \field{match.match_entries} indidates number of valid array entries \field{match.entries}.
+For each of the valid entry in \field{match.entries}, the field \field{type}
+and \field{key} are in the format described in
+\ref{sec:Device Types / Network Device / Device Operation / Flow Filter / Match Types and Fields}.
+When the \field{mask_present} is set, the field \field{mask} is present and it has
+exact same format as \field{key}.
+
+The field \field{key_mask_len} represents the total length of fields
+\field{key} and \field{mask}.
+
+Previously added flow filter entry can be deleted by the driver using
+VIRTIO_NET_FF_REQ_DEL request.
+
+When the device completes the request, \field{status} is updated
+by the device; when the request is successful, \field{status} is
+set to VIRTIO_NET_FF_RESULT_OK, on error, \field{status} is
+set to VIRTIO_NET_FF_RESULT_ERR.
+
 \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue}
 
 The driver uses the control virtqueue (if VIRTIO_NET_F_CTRL_VQ is
@@ -2541,6 +2721,8 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
 \item the driver can send commands VIRTIO_NET_CTRL_FF_GROUP_ADD
 and VIRTIO_NET_CTRL_FF_GROUP_DEL for adding and deleting the
 flow group.
+\item the driver can send command VIRTIO_NET_CTRL_FF_REQ to
+add or delete flow filter.
 \end{itemize}
 
 \begin{lstlisting}
@@ -2549,6 +2731,7 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
  #define VIRTIO_NET_CTRL_FF_MATCH_CAP_GET 1
  #define VIRTIO_NET_CTRL_FF_GROUP_ADD 2
  #define VIRTIO_NET_CTRL_FF_GROUP_DEL 3
+ #define VIRTIO_NET_CTRL_FF_REQ 4
 \end{lstlisting}
 
 \subparagraph{Flow Filter Capabilities Get}\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Flow Filter / Flow Filter Capabilities Get}
@@ -2632,6 +2815,28 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
 };
 \end{lstlisting}
 
+\subparagraph{Flow Filter Requests}\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Flow Filter / Flow Filter Requests}
+
+The flow filter requests are transported using command
+VIRTIO_NET_CTRL_FF_REQ command.
+
+\begin{lstlisting}
+struct virtio_net_ctrl_ff_req {
+        union {
+                struct virtio_net_ff_add add;
+                struct virtio_net_ff_del del;
+        };
+};
+
+\end{lstlisting}
+
+The \field{command-specific-data} is in format of
+\field{struct virtio_net_ctrl_ff_req}.
+
+When the flow filter request command is successful, the
+\field{command-specific-result} is in format of
+\field{struct virtio_net_ff_result}.
+
 \subsubsection{Legacy Interface: Framing Requirements}\label{sec:Device
 Types / Network Device / Legacy Interface: Framing Requirements}
 
-- 
2.34.1


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

