Return-Path: <virtio-comment-return-7881-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E018CDB474
	for <virtio-comment@archiver.kernel.org>; Fri, 20 Oct 2023 12:35:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 0008E157EEC
	for <virtio-comment@archiver.kernel.org>; Fri, 20 Oct 2023 12:35:35 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id EC42F986939
	for <virtio-comment@archiver.kernel.org>; Fri, 20 Oct 2023 12:35:35 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id E145298692F; Fri, 20 Oct 2023 12:35:35 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 77D8A986983
	for <virtio-comment@lists.oasis-open.org>; Fri, 20 Oct 2023 12:33:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nl41IwHUF1pKVo0O+TBkBNVOm/X/wHuPB++pc8QYiNJ1sqhkCc7eh2htwhdvB6nNpVo8S3aToChJYRRtrV4nlCtMrt9lIHiOybMNqtNFIhWdAaTXZ91ugfB/eO9IkSbRhTTCv+i1N7d7cCAqiNEsSvte20/t16O4mKkcUj/0RE6jUJ3/ewRjB686UY0Maa1vAStucG3UI2PpbtGVbZUm/35XaR/Ddg9w/N6yxNsK0EkgaXpDkpb+ZFJfCVWZ3VlBQ+s1g7u0o8TKmf1ocIujRFfM3orvpTP3JSI1PfcJ8dj68MDy/wCQyQOvm3KPdrMZ5oIz8Oj1RnbZ62/wbApDLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eb6YPIXNQjEQUqz9WN4CD+ew1UzDix20xmc599wX2Og=;
 b=D4lVRUzvcO2/rtp0OtxBpSzX2osOFQXebY2D5pRW9sKNVhqtNzrjfI9rv7IsFTEjX4cqiNZkaKq0ZaIwOSqfzN3P1Vx22I3I4KjwVnLC0aKzT37r35mwVwJ2WvCaZpmjwRj9royPpjniKeoY2GS+am8kqYFjt4oxbkR6Npo9QpGBkpFFrNrrUk+JWOwvebd57aESowF/k5BUmFqKRrz6PF1MDi4z1pPx55hsfvwqRUFv/D6K5IOaLRygDqHsSQtel+ChHpb/LNeZapIwm9RdlF7he5L6iI4/sSxvr/qx6nGbYq65wgFxRUbNscBcx+0DnIMHnX20RbrFqp0QjU7Z/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.oasis-open.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
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
Date: Fri, 20 Oct 2023 15:33:02 +0300
Message-ID: <20231020123303.1209289-6-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231020123303.1209289-1-parav@nvidia.com>
References: <20231020123303.1209289-1-parav@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003448:EE_|IA1PR12MB7733:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b92dc34-29b9-4c34-603b-08dbd168ce4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	O2mg5h/WvAr2ShKme6AbkoOtHVBTfTQ7U+o023vuBTTSudt2s5XvGs2YK7LEja4gD/nJ4VI3f0E0x+/XUOhvdlBL4WujgpTX578hsE/YE+52sI5elUgPFwVJlbeXqXVgH9EYiNq1eo7/xadG4biaplcKCqhBgQhcS4Wv06JppXAQPmh7D/GIXbT8JnBGPREL+014JD2vb95g/IA1kv5wOuZa4xVUnfvMeGdBzVl+kbq8SP5Zc7p2+mSn79zSA4L1mQgAk1jq6F2cyct9Qw2vTe76Wy1/KCkn6IgcKiPSFN6UMKH5Ne43ZcJwk6XSF8k1ITEXMqzV6SicLX5zoWPS8xxbPL2zKxy+5PXNqfLNlXb41ACxVih5AOvgOSlnVBnfNnliRNde9/lVm+4uMs5h/ilCP4iSiuT/7jcIClLVHdjrDm1xOBaYtC0YfvuZsDeHNsHAQPbvDJVyAidqYCugpc+MABxeyg0DKUCNwM2qU5cpzS9MX+eMkSaOFXPdwsSzZDhXtDkpQPvAfBtNUe9Fs7ylSOMnenXqPQDGh3gdHpE4QQgdHUENybyCo6AHrq6+6jUhHnGju5dk10Ns74e+H4bRwMEMCf1VXfSmyeDA1uFSFMLRAER5Aw5RV86hWd2CuZ25jLPOQzKLYK3P89YzP9djDpNI8EAjMoI0o0MgRW5pBcxpEwAkVjQdoNRd2Zb3VnAts+S6ciu9GM9xeByGybHmVsKFCeTG4u197HajQXkwiO/t5/zBT7OQunsyMGO5qD94xlDO5uBSIYD8mldZnO9DtDjjHiijtj4u+vPZmwE=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(39860400002)(396003)(376002)(346002)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(82310400011)(46966006)(40470700004)(36840700001)(8936002)(40460700003)(47076005)(40480700001)(26005)(426003)(70586007)(478600001)(36756003)(83380400001)(7636003)(2616005)(356005)(1076003)(336012)(82740400003)(4326008)(16526019)(54906003)(5660300002)(110136005)(966005)(70206006)(6666004)(41300700001)(316002)(2906002)(86362001)(8676002)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2023 12:33:46.9476
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b92dc34-29b9-4c34-603b-08dbd168ce4d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003448.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7733
Subject: [virtio-comment] [PATCH v2 5/6] virtio-net: Add flow filter match entry, action and requests

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
index 5ed095a..ba7026e 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -1277,6 +1277,50 @@ \subsubsection{Flow Filter}\label{sec:Device Types / Network Device / Device Ope
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
@@ -1323,6 +1367,21 @@ \subsubsection{Flow Filter}\label{sec:Device Types / Network Device / Device Ope
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
 
@@ -1351,6 +1410,20 @@ \subsubsection{Flow Filter}\label{sec:Device Types / Network Device / Device Ope
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
 
@@ -1366,6 +1439,20 @@ \subsubsection{Flow Filter}\label{sec:Device Types / Network Device / Device Ope
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
 
@@ -1381,6 +1468,20 @@ \subsubsection{Flow Filter}\label{sec:Device Types / Network Device / Device Ope
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
 
@@ -1396,6 +1497,89 @@ \subsubsection{Flow Filter}\label{sec:Device Types / Network Device / Device Ope
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
+#define VIRTIO_NET_FF_OP_ADD 0
+#define VIRTIO_NET_FF_OP_DEL 1
+
+struct virtio_net_ff_add {
+        u8 op; /* VIRTIO_NET_FF_REQ_OP_ADD */
+        u8 priority;	/* higher the value, higher priority */
+        u16 group_id;
+        le32 id;
+        struct virtio_ff_match match;
+        struct virtio_ff_action action;
+};
+
+struct virtio_net_ff_del {
+        u8 op;  /* VIRTIO_NET_FF_REQ_OP_DEL */
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
+When the flow filter request is sent using a flow filter virtqueue,
+the descriptors points to \field{struct virtio_net_ff_req}.
+
+When adding a flow filter entry using request \field{struct virtio_net_ff_add},
+the \field{match.match_entries} indidates number of valid array entries \field{match.entries}.
+for each of the array entry the
+For each of the valid entry in \field{match.entries}, the field \field{type}
+and \field{key} are in the format described in
+\ref{sec:Device Types / Network Device / Device Operation / Flow Filter / Match Types and Fields}.
+When the \field{mask_present} is set, the field \field{mask} is present and it has
+exact same format as \field{key}.
+
+The field \field{key_mask_len} represents the total length of fields
+\field{key} and \field{mask}.
+
+When the device completes the request, \field{status} is updated
+by the device; when the request is successful, \field{status} is
+set to VIRTIO_NET_FF_RESULT_OK, on error, \field{status} is
+set to VIRTIO_NET_FF_RESULT_ERR.
+
 \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue}
 
 The driver uses the control virtqueue (if VIRTIO_NET_F_CTRL_VQ is
@@ -2074,6 +2258,7 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
  #define VIRTIO_NET_CTRL_FF_GROUP_ADD 2
  #define VIRTIO_NET_CTRL_FF_GROUP_DEL 3
  #define VIRTIO_NET_CTRL_FF_TRANSPORT_MODE_SET 4
+ #define VIRTIO_NET_CTRL_FF_REQ 5
 \end{lstlisting}
 
 \subparagraph{Flow Filter Capabilities Get}\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Flow Filter / Flow Filter Capabilities Get}
@@ -2189,6 +2374,30 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
 \field{mode} is set to 1, it indicates that the driver will use
 flow filter virtqueue(s) for transporting flow filter requests.
 
+\subparagraph{Flow Filter Requests}\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Flow Filter / Flow Filter Requests}
+
+When the driver has successfully set flow filter transport mode as control
+virtqueue using command VIRTIO_NET_CTRL_FF_TRANSPORT_MODE_SET, the
+flow filter requests are transported using command
+VIRTIO_NET_CTRL_FF_REQ over a control virtqueue.
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

