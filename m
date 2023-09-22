Return-Path: <virtio-comment-return-7525-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E09CE6FE32
	for <virtio-comment@archiver.kernel.org>; Fri, 22 Sep 2023 13:50:46 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 0243F6128F
	for <virtio-comment@archiver.kernel.org>; Fri, 22 Sep 2023 13:50:35 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 334089866BE
	for <virtio-comment@archiver.kernel.org>; Fri, 22 Sep 2023 13:50:34 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id F2B1B9866CB; Fri, 22 Sep 2023 13:50:33 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8F2E39866B0
	for <virtio-comment@lists.oasis-open.org>; Fri, 22 Sep 2023 13:49:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mi3p7KIsp0BiKY1LtPsU5H/qs2ut7AoJV85YaXMoMl/vt4OmQ+iD9lsotpUQkj3GXdt/OHSChC+fHME7ACmV0EJRkrv7Qi0gYjMBB0YeF31QXE9GFe8Ixnif413q4YG9atJeTO4xYnbiun9Oa6qieSp1kwsOfRoYSv4xvvnPqdl4e8SLtQViHQs4IiJw6fTPxH8XrPk0ckjyEnl7aY5G/BJOEHgcZi210P+r49JeiSt7xzvDG1SJEaQmUubHKYiCwTNV+WwhIXBje4FT8SBhWkrWvRg/mREE4GrV4LUkBWbhtEK/9Vd7U18AgfN2S6JI+jEXj0m7ndYlSWtPX2KM4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wEoMk9LJ4LnWeU2g+toBRAAAHzOlANuZCFjz09wzv90=;
 b=X6aC6UNhbMqKrByUmQhORLgM2k46m697i9ArZ/TyX8rYeAe+Ye2TpjVI0XHXCuhZX7lkMx5dae/umEkt3dsfaUlLuOQj7PVeUjQEZq34K1HRtlSncVgnbIZ3e5gD9S/eeIeM49Bkm621Jdu8K+PS94VnNCMfFOnOvl3iceYdfh4BSd/vJ8xL1/9CfXDl5cxaObO88CoDezep40iUlonaQ/6gIy1lmC1qFCyb73PuM7qUyu0BLlXGv6DmMg9LlsVe2BvBHUbk4Tu7XE5MNkjtLNymbm0JDhOmd3SJAc988nA8fRDhWJR42/pN1r3Ec+zN1iS6Zs1sc/h8h9rgK4XAtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.oasis-open.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
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
Date: Fri, 22 Sep 2023 16:48:37 +0300
Message-ID: <20230922134838.3718-7-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230922134838.3718-1-parav@nvidia.com>
References: <20230922134838.3718-1-parav@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail202.nvidia.com (10.129.68.7)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044EF:EE_|MW4PR12MB8609:EE_
X-MS-Office365-Filtering-Correlation-Id: f16c8f0c-9e9a-47f7-f325-08dbbb72bb69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4XQ16x+pEX+9404hTDk4NkYYIxd7ff/iw71woCMEvd3qs0SSy3MVCwNFQghHGLjBitNQ8Ut9QE8GqRIs+0YcT4xgCAXcPxgzvPD9B8PKXgrZbOx84+snjM4/fZqCIMOLc31PIl34u/fLjR3T2eU+ft9KmiTJjXRH0GRhxG4FdBngWCIaBbmtqZIPoytCwsMtiyAqi/23G5AS5XC+GP+INhgxcgjhJIpEpt9rktNWye1rsJy627X+0h46yFCFEIV4u7NA/I3XujH+dkEYKfmTZg2rPl/YzOkRrBFGwl93jc0gc5okU6fy2MN4yt/nx9syVgua7o0+kIfFrrvhEiPP9pUN9wWvFOsktYVC9SoBhV22iLIZObFqbH4qzDanqzmj+LgBCx3qgg4+mbT9E5Nd9ojlgLhhHTVL6NR76BscGfeOvHLjh+SAjh/lI3EjqqIas8zOx/OnAkEyB1kn5itQTy4evnO81dgrHgyNl7x5ni5Kg5WmtesWgeUeeENnl4ppm4ybrI4ZbTYEXzaUVBC6a1U66sHhNbSQZQNJcP8oA/g+sa0cr6EfGJtT7NLSwhWdh25h3YZ+ApQUT8S8CGvNNwjZt71GY9bE31JkOT26MAv+oVZRUnpl1Fc7BuFUTOSTCDIoTHD9GxPlQjSJlAuocqZuumvX8PCC4J8PQQyqrq0niy51GSsOpqKPcK8Nm9v7x+hbgTRUsDkeFnh8r7qPz5cEyyJikOI/02rn7I/yjtlIGRDRgLN19ph7bfR6Alsl3008coS2F5iCIOQkYSnFLkMLdXtBXV9X0+Xr3j08FpuUVT53L0ofIHX4CPzydlhL
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(346002)(376002)(396003)(39860400002)(1800799009)(451199024)(82310400011)(230921699003)(186009)(36840700001)(46966006)(40470700004)(36756003)(40460700003)(86362001)(41300700001)(40480700001)(8676002)(7636003)(5660300002)(83380400001)(36860700001)(356005)(16526019)(8936002)(4326008)(426003)(2616005)(26005)(1076003)(82740400003)(6666004)(47076005)(966005)(70586007)(478600001)(2906002)(70206006)(336012)(316002)(110136005)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2023 13:49:24.6443
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f16c8f0c-9e9a-47f7-f325-08dbbb72bb69
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044EF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB8609
Subject: [virtio-comment] [PATCH 6/7] virtio-net: Add flow filter requests

Define generic flow filter add and delete requests and its transport
using a control virtqueue command and flow filter virtqueue(s).

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/179
Signed-off-by: Heng Qi <hengqi@linux.alibaba.com>
Signed-off-by: Parav Pandit <parav@nvidia.com>
---
 device-types/net/description.tex | 117 +++++++++++++++++++++++++++++++
 1 file changed, 117 insertions(+)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index a3cbb29..a96e47a 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -1447,6 +1447,98 @@ \subsubsection{Flow Filter}\label{sec:Device Types / Network Device / Device Ope
 The \field{sport} is valid when VIRTIO_NET_FF_SRC_UDP_PORT is set.
 This \field{dport} is valid when VIRTIO_NET_FF_DST_UDP_PORT is set.
 
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
+struct virtio_net_ff_match_field {
+        struct virtio_net_ff_match_type type;
+        struct virtio_net_ff_match_value value;
+};
+
+struct virtio_net_ff_match_fields {
+        le32 num_entries;
+        struct virtio_net_ff_match_field match_entries[];
+};
+
+#define VIRTIO_NET_FF_DEST_RQ 0
+
+struct virtio_net_ff_dest {
+        u8 dest_type;
+        u8 reserved[3];
+        union {
+                le16 vq_index;
+                le32 reserved1;
+        };
+};
+
+struct virtio_net_ff_action {
+        u8 action;
+        u8 reserved[7];
+};
+
+#define VIRTIO_NET_FF_ACTION_DROP 0
+#define VIRTIO_NET_FF_ACTION_FORWARD 1
+
+struct virtio_net_ff_add {
+        u8 op;
+        u8 priority;	/* higher the value, higher priority */
+        u16 group_id;
+        le32 id;
+        struct virtio_net_ff_match_fields match;
+        struct virtio_net_ff_dest dest;
+        struct virtio_net_ff_action action;
+
+        struct virtio_net_ff_match_fields mask;	/* optional */
+};
+
+struct virtio_net_ff_del {
+        u8 op;
+        u8 padding[3];
+        le32 id;
+};
+
+#define VIRTIO_NET_FF_REQ__ADD 0
+#define VIRTIO_NET_FF_REQ__DEL 1
+
+struct virtio_net_ff_req_result {
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
+        struct virtio_net_ff_req_result result;
+};
+\end{lstlisting}
+
+When the flow filter request is sent using a flow filter virtqueue,
+the descriptors points to \field{struct virtio_net_ff_req}.
+
+In the field \field{match_entries}, for each of the array entry the
+field \field{value} and \field{type} are in the format described in
+\ref{sec:Device Types / Network Device / Device Operation / Flow Filter / Match Types and Fields}.
+
+When the device completes the request, \field{status} is updated
+by the device; when the request is successful, \field{status} is VIRTIO_NET_FF_RESULT_OK,
+when there is an error, \field{status} is VIRTIO_NET_FF_RESULT_ERR.
+
 \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue}
 
 The driver uses the control virtqueue (if VIRTIO_NET_F_CTRL_VQ is
@@ -2125,6 +2217,7 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
  #define VIRTIO_NET_CTRL_FF_GROUP_ADD 2
  #define VIRTIO_NET_CTRL_FF_GROUP_DEL 3
  #define VIRTIO_NET_CTRL_FF_TRANSPORT_MODE_SET 4
+ #define VIRTIO_NET_CTRL_FF_REQ 5
 \end{lstlisting}
 
 \subparagraph{Flow Filter Capabilities Get}\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Flow Filter / Flow Filter Capabilities Get}
@@ -2241,6 +2334,30 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
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
+\field{struct virtio_net_ff_req_result}.
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

