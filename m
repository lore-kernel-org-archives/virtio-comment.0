Return-Path: <virtio-comment-return-8125-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72BA5C4167D
	for <virtio-comment@archiver.kernel.org>; Thu,  2 Nov 2023 13:29:23 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id E7DAA790E9
	for <virtio-comment@archiver.kernel.org>; Thu,  2 Nov 2023 13:29:22 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DEA3E986C6B
	for <virtio-comment@archiver.kernel.org>; Thu,  2 Nov 2023 13:29:22 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id D49E7986C13; Thu,  2 Nov 2023 13:29:22 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C2E3A986C18
	for <virtio-comment@lists.oasis-open.org>; Thu,  2 Nov 2023 13:29:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=akFj3L84gZ+fcX04DQ07cgQ76fgLc7nZgahoo455AN+7XPe6sdaaCSNp09j5sbnAHLZKhGTjJ0qYUCOnf7bAYrpEvNPk0vsF+YjsBfPb8/y5gwVKA1tufi6I5uO/84mtBVBIx8QJ8u4ivjtVOaJMb4ch3ElZMY1wL0CwlJ3fQbRAKbTZy4gPdvbA4dRhUB/Pxb/+Ju1fXTTqJrh2MdPktIqNsv7avKmou8gZmV8JsjFbeGw5gFJXbb/qnpjkGbyo8rQwsbVsBmgXXUepkkujhkGfvlT8Rx81n6G3IN+4YgBeHRpNdlSiD457yE2k2yQ7xNgyKWhiQ2moNC3gssHxIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iqa3pK4TFysAqDlad4kU1EEDa/D5Q8n7wJw2i/dOeEo=;
 b=bGr8fA5E1Orco+eG5SBoVrZ+JfmsY34HtoeMvArcOlY2qVvPJoT6A9jp8qNNQAZnn78jBUi9rMAeEW6dG9S5vztVb7F/eeQ8/alcRoIkkHP7YUyIggZ18H+XRg2179YrHcLnM3VIpjCLBgtiSflQSePTKiyCKBAFRT2RLgJJe1SO0x1afvhOyp8HvLyoG1QghVbYxCSYfhGy4oM4IUjyyxH9nS4Iwot0dB/TBJQJGgknZpi4oFKI+Vesh8+Oi38mLCAkGrgDevz2bubJ7kqart7b2mVqp7tIRMX4gXefExkjp+9jRkOvNcD8IYSbQiu1NBgJMp6QGlFG6OaQB8nsXQ==
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
Date: Thu, 2 Nov 2023 15:28:24 +0200
Message-ID: <20231102132825.1865068-5-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231102132825.1865068-1-parav@nvidia.com>
References: <20231102132825.1865068-1-parav@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E5:EE_|DS7PR12MB6190:EE_
X-MS-Office365-Filtering-Correlation-Id: 816b11b5-d4ce-4e2e-9fe3-08dbdba7b26b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CRn5pvSqOw5CyPVWDk0ayuE15EV660J6kauu5tbZyVaj7oqi+j8jseKziXJKE9rLHZidrXN8e4fUObfuOZy040Dijo+2BTDBTPDH88YlxJG0aM9mSv3MrYWCZ8Yae0PXbRZSkIl+VQ51r8TF9LP2Mlu1RBWDRLVWKnNHNLBSDDXItA8jALlADLoPtNfql6HbagmoFQzamgLDDfgFB/gq3DSDFamtgcu7HIoZLB7lD93uLZT0qct+WXGKnsgLOIFh+9A1w5F6C/kmzBC5joNHm5r9Ab22ODiqz3IdEpMSngDEEgCgRgqmolwhDdt0e+FbDqnjKllKK+WWxkfa8VszeZbJNi0yCv8DM3o0+2eoTUyjDVJuSB/RUoLrJzQy7WPpgjC1dlYhftSEFSLWgIWkORNM21zDhAzipBCim0sfg18F0nX6gkuFziCnLe5kUyHq4X7YuywjcJAHOQB2uCQpVbN8wBaIpa0QgivzmkYPR/929cVEm41NjglweLohVPs+/fT+BlemRzsPYbUwk9S79JA4ObGscvE8flgtoGUf68pjQ8L3zGUmnYRM4ge1C5rD3wfX/yAO4rk665uHiinToezhIdZuDlPQwYvZYM5bltaoy8oX1WB8rENQGEEK189GgcLLqUQ7rHeU/zdMuZE3F2hQTZZWLaXf03CMO6Uw9oOZPQcFjpeOF/K9OLoAeRcGjmogh7MXZM1DN6AsYx7XxjtiUCR9NogjlyZ9PKAYYCzQioroM4blvbhBF8bPkWNEAgHiCbTwr6nMPji8TDVZhf6kixT3f3g/yqIztxiVcoU=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(396003)(376002)(346002)(136003)(230922051799003)(82310400011)(64100799003)(186009)(451199024)(1800799009)(40470700004)(36840700001)(46966006)(47076005)(83380400001)(26005)(2616005)(1076003)(16526019)(336012)(426003)(6666004)(54906003)(86362001)(966005)(316002)(110136005)(70586007)(70206006)(478600001)(7636003)(356005)(36860700001)(82740400003)(41300700001)(8676002)(4326008)(8936002)(36756003)(40480700001)(40460700003)(5660300002)(2906002)(30864003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2023 13:29:10.0913
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 816b11b5-d4ce-4e2e-9fe3-08dbdba7b26b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989E5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6190
Subject: [virtio-comment] [PATCH v5 4/5] virtio-net: Add flow filter match entry, action and requests

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
- added length to the flexible array definition struct to benefit
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
index f08253c..cbfc18d 100644
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

