Return-Path: <virtio-comment-return-7607-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F6C8E94133
	for <virtio-comment@archiver.kernel.org>; Sat,  7 Oct 2023 05:15:47 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id B0C9A6E6CE
	for <virtio-comment@archiver.kernel.org>; Sat,  7 Oct 2023 05:15:46 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9F708986835
	for <virtio-comment@archiver.kernel.org>; Sat,  7 Oct 2023 05:15:46 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 96417986351; Sat,  7 Oct 2023 05:15:46 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D6A9B986843
	for <virtio-comment@lists.oasis-open.org>; Sat,  7 Oct 2023 05:15:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WmCI/NKq3gxTSt42JZYQqyvNkyxZd8OgvSv273TBDtG/zltjGfFIB9axlPPWTooZVh4OhgGubZplBJ9K69C/nVqGru+EI+EucbNit+aCJj4kZiw/6zitI+ktW2utP7JRkDL/gxaQI36p1/WvsQuJQ3jaYcg3dcP5kcFa3Y8X+ovjtaWM9SUoKm6JKlxA0zIAP5E9yZCQxwVSbRcQuZyCoXCpbBwQoop8/GkFDdRn6PkrdJRxP6FFjeIez7RWSe3RqGnJQ773P45hOnekDyTGuatHjmvOzvqrM24+FMvfbo87/zIUZW1oqVcZ0DAKcuCHAdeLx4FKBxjERk4/T4VdVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fx/cYXISpiBWnczVJf2iDhPU/yM9m1HRovgukFaN0M0=;
 b=FLGVbRDIs8k1pP4mJ4BKZK0BWIFGpRnHBYA3i6YU7RkfA5RzvG39dF+IO8Pv8daAR7JRK/giB3QXCZHhOBmxf+1XzKZGAHLI/M68QVd+eko/NbzLiwUV2R6ATLYTn/NwAtlN0xxo2xQrW8j7IUqXafkQCTIKzb+98NeiIKU4WQZHrZy5f2M1ol604s/qb7pRm4Ill4FFXpFTx6VPs9o+KIPpnDFh5b4fZ+deh4OF6ZmAGbDNGA5WWmPEJYo8jfgwLsQ77SEVF6yVi/gWvKZx5k+wOvPHI6Hzk11hrKRy291E2JjR0d8g60F7gXTVyRT3xqjHoRJ7YvYhR/Nk//k3MQ==
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
Date: Sat, 7 Oct 2023 08:14:42 +0300
Message-ID: <20231007051443.460148-7-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231007051443.460148-1-parav@nvidia.com>
References: <20231007051443.460148-1-parav@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD3:EE_|DS7PR12MB6047:EE_
X-MS-Office365-Filtering-Correlation-Id: 28cf7c77-c05f-4f7c-04f5-08dbc6f46d5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Rbc41euovsyV+sv0iPJaew/t8ey+StX/QpzaMSWZ02c4mHHIWppvuyR3Rw6+Cl26fCv6oiRv1QScP6lYXKfQIzTzxMX+iYnxUhmLWWDEVaxaN6qZQBNZw26gRinaPfVTs3g6Z+T+a5Hjujl9uLurJFfffMlex5TOKjXdjZP8YV5jPnOqfkgPIGpP3cPt33herncRdZuplBkNjWs8lJRWfZO58hehPsCku+f3cZNlPF9KCSR7B7AnvF5BhTKsleNxJeQA4v+mNNp+mgoW99R6lF85Nh3OZcP8gcnQrDwR5DVKg0mRF1BFrBiZbkjsMa4AeWQN53lBThYPBu7eZ5Im8sR8LrdiJnnrqrfJwE+qzEmLRnwBmcIN0RYGojy9gXp+VcQlO5P8TH4I1yFT0IqfEnXDyFGe3yYVTx6h6wfj46zhvBSid/9eo9OOY3KLvuG8ksbeG1WtCVH0oJE0RF5oPwom6ImwhaAit+vh1KxAccnQPH/o3iBzq52E4awe9KEFAozHIyUWhgZlxzBO5DqCjki/WWH9oOXpPOua696LJk/aicVwvZXJNqTk3RpYVABe9JFKRWJS2Qunk0La945umjPXinlUMD29idSrV5npLy+lntBQCiWdeYxFFCES5B5BZsuCpX9ZIZP6mBy+RL0gt3owlLQL1/xvI+FM4pqPbQzL7hZ3cUweCrMGmL+dAgwCGLaakVyExAVTMK0Bp+/HjPEFERhEyAg10M3huFh7A5siNHCLGvFPtMKjXWZzde8pbyDu53shlDs93cIWCil7tFG5Gmb59QEEl4iP+SPR9lM=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(376002)(136003)(39860400002)(396003)(230922051799003)(64100799003)(186009)(82310400011)(1800799009)(451199024)(46966006)(40470700004)(36840700001)(16526019)(40480700001)(54906003)(26005)(4326008)(8936002)(1076003)(316002)(41300700001)(8676002)(36756003)(2616005)(426003)(70586007)(336012)(82740400003)(356005)(6666004)(7636003)(86362001)(36860700001)(478600001)(47076005)(70206006)(110136005)(40460700003)(2906002)(966005)(83380400001)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2023 05:15:31.0914
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 28cf7c77-c05f-4f7c-04f5-08dbc6f46d5f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6047
Subject: [virtio-comment] [PATCH v1 6/7] virtio-net: Add flow filter requests

Define generic flow filter add and delete requests and its transport
using a control virtqueue command and flow filter virtqueue(s).

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/179
Signed-off-by: Heng Qi <hengqi@linux.alibaba.com>
Signed-off-by: Parav Pandit <parav@nvidia.com>

---
changelog:
v0->v1:
- reworded add flow request text to consider optional mask
- replaced respond with set
---
 device-types/net/description.tex | 123 +++++++++++++++++++++++++++++++
 1 file changed, 123 insertions(+)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index 19d1655..cf2836d 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -1452,6 +1452,104 @@ \subsubsection{Flow Filter}\label{sec:Device Types / Network Device / Device Ope
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
+        struct virtio_net_ff_match_value mask;	/* optional, only exists if mask in type is set to 1. */
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
+by the device; when the request is successful, \field{status} is
+set to VIRTIO_NET_FF_RESULT_OK, on error, \field{status} is
+set to VIRTIO_NET_FF_RESULT_ERR.
+
+When the driver sets the \field{mask} to 1 in
+\field{struct virtio_net_ff_match_type}, the \field{mask} is present in
+\field{struct virtio_net_ff_match_field}. When the mask is present in
+the flow filter, for the match \field{type}, the mask is applied first to the
+packet fields before comparing the match result.
+
 \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue}
 
 The driver uses the control virtqueue (if VIRTIO_NET_F_CTRL_VQ is
@@ -2130,6 +2228,7 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
  #define VIRTIO_NET_CTRL_FF_GROUP_ADD 2
  #define VIRTIO_NET_CTRL_FF_GROUP_DEL 3
  #define VIRTIO_NET_CTRL_FF_TRANSPORT_MODE_SET 4
+ #define VIRTIO_NET_CTRL_FF_REQ 5
 \end{lstlisting}
 
 \subparagraph{Flow Filter Capabilities Get}\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Flow Filter / Flow Filter Capabilities Get}
@@ -2241,6 +2340,30 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
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

