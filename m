Return-Path: <virtio-comment-return-8566-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECD01C61D85
	for <virtio-comment@archiver.kernel.org>; Thu, 23 Nov 2023 09:22:13 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 541E22A8F3
	for <virtio-comment@archiver.kernel.org>; Thu, 23 Nov 2023 09:22:13 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4749E9868BD
	for <virtio-comment@archiver.kernel.org>; Thu, 23 Nov 2023 09:22:13 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 3BBB09868A2; Thu, 23 Nov 2023 09:22:13 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2E4CF9868A5
	for <virtio-comment@lists.oasis-open.org>; Thu, 23 Nov 2023 09:22:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cBIqvx7DT4SgM1GFfkGWnDFAqLZGWTU0Txu1W6xLTe4lJ+oE2UFzyknGkcjijJbT0nv5rolF9EXJsFJpY9/4OSwnAHb0A1wv1RhwN5fRylEcFT7LnjYoAyJzgojLr/w/D+WiI1WutCv+5rX0lTi9nTJXmCsYmmv6EMcdA+Os+roFfXF/xBo6TRUiRF3FlP26oHgEeXWS31XCRSD3iCCTJFI9DmelHKfdZnnIMrEEPW6F7uBU2cIX5aHTZ1xOnHPYCK5rsAkewlFyZ3x5xF7RZSYfkuUeTNjkdf2agK2tlPYjGWAy8q1Mrt5MCBWz1Lx88daEJPBIVR3p5JRytPRpIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jSw2Z2TDsYcB+wDVNvMo2UQzTV5zU7ND3bE2WR8NFVo=;
 b=Dclv9DshzhTOxgIsK0ns7S4qT2cPvpafH0dwQ83GNZaju/nWoYoR0mfmigBpaMF1Enb2VahyGY6IU2GxkpsfosN8cxM2VyvdM+ahwYyCgELLNMtqdAuq7DYrmzed9Kp9lXrsgNuJKSZiYiX2b/4xFk5pmm9Gum1X8sWhZsuNrvVqcjc2g1lmQJ+P/GPPPRB5IzcGhgT88eK08z4B9YqnL18/eGdgmz+OO/VE9KejUMmlrfouM6Ub7yiJr1lYoi7w7CanehNs2CNhOsZI5anOMC49BsXLdXslgG5gjPT4l1ZpvS+pjGtV60nTS430bRKZWeqg0IU01JQxoFPzI9qo/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.oasis-open.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
From: Parav Pandit <parav@nvidia.com>
To: <virtio-comment@lists.oasis-open.org>, <mst@redhat.com>,
	<cohuck@redhat.com>
CC: <sburla@marvell.com>, <shahafs@nvidia.com>, <si-wei.liu@oracle.com>,
	<xuanzhuo@linux.alibaba.com>, Parav Pandit <parav@nvidia.com>, Heng Qi
	<hengqi@linux.alibaba.com>
Date: Thu, 23 Nov 2023 11:21:18 +0200
Message-ID: <20231123092119.2718448-5-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231123092119.2718448-1-parav@nvidia.com>
References: <20231123092119.2718448-1-parav@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD8:EE_|DM4PR12MB5343:EE_
X-MS-Office365-Filtering-Correlation-Id: a6e625bd-4e3d-4948-05cc-08dbec05aafc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CLTcsSgKR0WE6LKKHYdbss5sHFz1vk1dW63CsyPU0q6rahrI/+NtDOGcyHbhRT5GPezCP4r3AorpI8b7DBmnjBRlTx9oD5qagk4YzZnCvv7E9CG62mNlTi25uqsDSFUkwRVVuMz6+MFf40QlmMa/Wif70xg3ctXi/990eDHf0Yco2jwotpJRTKwP3nE89tIYWV3XBz79Y5RFZzkYZFiJL5bUVDQfiNP0UEbVD39ZPLFYlLjcTmcoWSvuNuDI+4lXbRqbVn6D9PlXW8IOMRUoX7aUuN976w9z8mzIjwnueuBACGvGtAMZOsQ6QnvVp8p2xGqfifhiL+Pp0MZvwk6t/BrgQFTBytPLAz9X3/FfR0ge2YLvrXRX8hIbCimEUqpcbutVdNKtHgDeoB5E51aUGkGuyn4HgS0eCveWxvJwqaOWJivkjPKjtFzN07baXV37Mkmtp/j5nqga47W6UwYh6HbX6rAcExb5YF8LYvoeMjRzOkAPVz0xlbxv+klyX5hzMemCWeRWzBFwUIkTEpL+4yQyRKeIlHkfAl4FCvruPJeLIowK4lcDk4CcTss3HSUxi7BDb79yQNHNr+oX0mrCSZxMM4PwK0Q2JnL6/XbkccEP3IUtsqLKMOX10aoT4egHohwAb7T95NOMQM6gmHI+KZnbJHmllaLA5f6qNJsOVvzCO66LxCjB66HTmhkr56vKk3v1FLruzO394KuibxWnFd3naLK6kLxHkY6IG6/8LqyNKSstM1uvmVBra2TtskbyWGV09ShUe7ORHIZcYUHZZqywtNnoGWBCL9IKm/Eq/30=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(396003)(376002)(346002)(230922051799003)(186009)(451199024)(82310400011)(1800799012)(64100799003)(36840700001)(40470700004)(46966006)(1076003)(2616005)(82740400003)(40460700003)(336012)(426003)(83380400001)(26005)(16526019)(54906003)(316002)(70586007)(70206006)(110136005)(478600001)(966005)(6666004)(356005)(7636003)(40480700001)(5660300002)(47076005)(41300700001)(2906002)(86362001)(36860700001)(36756003)(4326008)(8936002)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2023 09:22:08.8504
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a6e625bd-4e3d-4948-05cc-08dbec05aafc
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5343
Subject: [virtio-comment] [PATCH v7 4/5] virtio-net: Add flow filter match entry, action and requests

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
v6->v7:
- plenty of grammar corrections suggested by Cornelia
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
 device-types/net/description.tex | 209 +++++++++++++++++++++++++++++++
 1 file changed, 209 insertions(+)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index e766b12..e7e80ab 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -1242,6 +1242,50 @@ \subsubsection{Flow Filter}\label{sec:Device Types / Network Device / Device Ope
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
@@ -1288,6 +1332,21 @@ \subsubsection{Flow Filter}\label{sec:Device Types / Network Device / Device Ope
 \hline
 \end{tabular}
 
+For the \field{type} of VIRTIO_NET_FF_ETH_HDR, the match entries
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
+\field{dmac} is valid when VIRTIO_NET_FF_DST_MAC is set.
+\field{smac} is valid when VIRTIO_NET_FF_SRC_MAC is set.
+\field{ether_type} is valid when VIRTIO_NET_FF_ETHER_TYPE is set.
+
 For the \field{type} of VIRTIO_NET_FF_VLAN_TAG_HDR, VLAN tag fields
 are represented by a bitmap in \field{fields_bmap} as follows:
 
@@ -1316,6 +1375,20 @@ \subsubsection{Flow Filter}\label{sec:Device Types / Network Device / Device Ope
 \hline
 \end{tabular}
 
+For the \field{type} of VIRTIO_NET_FF_IPV4_HDR, the match entries
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
+\field{sip} is valid when VIRTIO_NET_FF_SRC_IPV4 is set.
+\field{dip} is valid when VIRTIO_NET_FF_DST_IPV4 is set.
+
 For the \field{type} of VIRTIO_NET_FF_IPV6_HDR, header fields
 are represented by a bitmap in \field{fields_bmap} as follows:
 
@@ -1331,6 +1404,20 @@ \subsubsection{Flow Filter}\label{sec:Device Types / Network Device / Device Ope
 \hline
 \end{tabular}
 
+For the \field{type} of VIRTIO_NET_FF_IPV4_HDR, the match entries
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
+\field{sip} is valid when VIRTIO_NET_FF_SRC_IPV6 is set.
+\field{dip} is valid when VIRTIO_NET_FF_DST_IPV6 is set.
+
 For the \field{type} of VIRTIO_NET_FF_TCP_HDR, header fields
 are represented by a bitmap in \field{fields_bmap} as follows:
 
@@ -1346,6 +1433,20 @@ \subsubsection{Flow Filter}\label{sec:Device Types / Network Device / Device Ope
 \hline
 \end{tabular}
 
+For the \field{type} of VIRTIO_NET_FF_TCP_HDR, the match entries
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
+\field{sport} is valid when VIRTIO_NET_FF_SRC_TCP_PORT is set.
+\field{dport} is valid when VIRTIO_NET_FF_DST_TCP_PORT is set.
+
 For the \field{type} of VIRTIO_NET_FF_UDP_HDR, header fields
 are represented by a bitmap in \field{fields_bmap} as follows:
 
@@ -1361,6 +1462,89 @@ \subsubsection{Flow Filter}\label{sec:Device Types / Network Device / Device Ope
 \hline
 \end{tabular}
 
+For the \field{type} of VIRTIO_NET_FF_UDP_HDR, the match entries
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
+\field{sport} is valid when VIRTIO_NET_FF_SRC_UDP_PORT is set.
+\field{dport} is valid when VIRTIO_NET_FF_DST_UDP_PORT is set.
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
+\field{match.match_entries} indidates the number of valid array entries
+\field{match.entries}.
+For each of the valid entry in \field{match.entries}, the fields \field{type}
+and \field{key} are in the format described in
+\ref{sec:Device Types / Network Device / Device Operation / Flow Filter / Match Types and Fields}.
+When \field{mask_present} is set, the field \field{mask} is present and has
+exact same format as \field{key}.
+
+The field \field{key_mask_len} represents the total length of fields
+\field{key} and \field{mask}.
+
+Previously added flow filter entries can be deleted by the driver using
+the VIRTIO_NET_FF_REQ_DEL request.
+
+When the device completes the request, \field{status} is updated
+by the device; when the request is successful, \field{status} is
+set to VIRTIO_NET_FF_RESULT_OK, on error, \field{status} is
+set to VIRTIO_NET_FF_RESULT_ERR.
+
 \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue}
 
 The driver uses the control virtqueue (if VIRTIO_NET_F_CTRL_VQ is
@@ -2539,6 +2723,8 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
 \item the driver can send commands VIRTIO_NET_CTRL_FF_GROUP_ADD
 and VIRTIO_NET_CTRL_FF_GROUP_DEL for adding and deleting the
 flow group.
+\item the driver can send the command VIRTIO_NET_CTRL_FF_REQ to
+add or delete flow filter.
 \end{itemize}
 
 \begin{lstlisting}
@@ -2547,6 +2733,7 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
  #define VIRTIO_NET_CTRL_FF_MATCH_CAP_GET 1
  #define VIRTIO_NET_CTRL_FF_GROUP_ADD 2
  #define VIRTIO_NET_CTRL_FF_GROUP_DEL 3
+ #define VIRTIO_NET_CTRL_FF_REQ 4
 \end{lstlisting}
 
 \subparagraph{Flow Filter Capabilities Get}\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Flow Filter / Flow Filter Capabilities Get}
@@ -2629,6 +2816,28 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
 };
 \end{lstlisting}
 
+\subparagraph{Flow Filter Requests}\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Flow Filter / Flow Filter Requests}
+
+The flow filter requests are transported using the 
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

