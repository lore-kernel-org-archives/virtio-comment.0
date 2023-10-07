Return-Path: <virtio-comment-return-7605-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28E67E81E1F
	for <virtio-comment@archiver.kernel.org>; Sat,  7 Oct 2023 05:15:33 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 9616C1FF87
	for <virtio-comment@archiver.kernel.org>; Sat,  7 Oct 2023 05:15:32 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 860AE986892
	for <virtio-comment@archiver.kernel.org>; Sat,  7 Oct 2023 05:15:32 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 7A72D986842; Sat,  7 Oct 2023 05:15:32 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6C379986844
	for <virtio-comment@lists.oasis-open.org>; Sat,  7 Oct 2023 05:15:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gc1I9X2C3M0Hc2D+6P8kQ3B1CJU3YFUdg6iN6KbejDHQHLtym0opXDIBoNnr35BfHrdie5N3EcBYCaohyDSayvA5pF8m2SVkfTvi8jNeF2M7kmxlB9wHdBkqX5LW5O5mxNgS+qPtUTaZCmp3M/HDM1mKfRr1jdl0bH7V962XN4dSfSjAbM8U4ngFw1l0rLAUBoSxFVlmiLrKfsr0t1OdFfVqjZN++V2XInUqmnhKh6aG2LxVruoS3YOrV8XohfIfhFq15oU2QKs9ZN8dlbqFIgk7cIS00WIfhIc9qnH2wj4HLvvjbPsaRppPe23leJW+POgmlYz2Z53MjnmLPTEuDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BJqSK43B8KbTD2vSyMsM6IWwsUN338vVYUfvNvuz2M0=;
 b=Te1Y9tABRHarYT8lqaiNGvgY3dZwNF6mKdqy9Clc0EJEExnxP1xKP4cmS+YYe+dbmHX8uwZKU/QJDafZBiZePFMHi5fxzNEN44nDoFuRCf/tQbMxoM+BcWYbLNNPNvqfoFn1Yd6JOh609NDrVswLfKX9hvioM9beOR31tixYhgodcOPYpwOGJIcpBI/AP+bVTlN7a8YGkpHoakyrZSHFnmmT+FBCseEFCiV8XW0QQRxaHvPOzrQ0IGCF9wySaVUK4tvkwpe2OEriWZcgrpnIOeKsCDm/4yBpI/BQnYzha5d+KIgDnqcojYutZVN9suG4KSuZkvBJ8sEbguB0y6SiWQ==
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
Date: Sat, 7 Oct 2023 08:14:40 +0300
Message-ID: <20231007051443.460148-5-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD3:EE_|DS0PR12MB6631:EE_
X-MS-Office365-Filtering-Correlation-Id: 0612f6fc-88cf-415f-e049-08dbc6f469ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TckdozhmFnbrEnK0NYV+k07BGTOi/Kuhw3+K36JTVBTpQF0pH85/0BtajsqVGEPr7z6q2wn5Yre789fj++ZkEhSz/hmf6iy3pOpE2NAlpiVZyVlcDSClcyXCohiG7MRpu/Y++YZhzHJCpCxany9GdgK+GktnzxoO+8LKxngFdMI9RQgS1KdQkVVK/arQwYCAdidKSy1RIj7D/WFhY88F/GlIbNrvAnshRF1jkjgRdn/YCoAGiQiOpTHtkack8QkLBzJF9+K8+14BXn2U7JIrLimTi9Bvo+jX6vLt31IWzI3rJRuGxpCA+D9XajTPRsHkPR6rKcyAOYbHsuV/5WkJCPRO2nHWuK0mPHu3u4fWWRxgYahHHQQh90U9DWSIqPp+uasxzIUgWJeMrCTGOFDVvuwEp7AmTY+t/UtmOcWCd7Rf/49L/ANeYE2flHXTVfQP+JkwbpyfAeanm5S/87TEH3no903eb+RMOPezIPQ6CRJdCCoL1nqpPy9nhnJRviOfQuDGf4klmnrc3uKh773Y5uJEMC7QLh0lDFGZutu3FFKtEWoz13fXE2oBBabFY8pXSjcj19zt9bJi/4KMWEC7fy/WaMSXE11n+c9ClyffNKp8245c+lbfZ30QjTBlcfB4/acb6RB15DkgN5cj+r6Kv4GxzNHATwxUC0qVKUEbnwnhLEwrMPBS4TAi7dP8H3DGVxJiifCmsZePgrfnUlBejbMymkQKhvqUvZ/Zq1nLA16YsSZtopC0guucBwq6rWP1uIf2t8mSH9F0Gc7LIFrYQ8P9c4BbkKFT9f8dW8hAXUE=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(346002)(396003)(376002)(136003)(230922051799003)(64100799003)(451199024)(186009)(82310400011)(1800799009)(46966006)(36840700001)(40470700004)(1076003)(40460700003)(36756003)(86362001)(40480700001)(7636003)(356005)(82740400003)(36860700001)(26005)(16526019)(47076005)(426003)(336012)(2906002)(83380400001)(966005)(6666004)(2616005)(478600001)(8676002)(4326008)(8936002)(70586007)(41300700001)(316002)(70206006)(5660300002)(54906003)(110136005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2023 05:15:25.3102
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0612f6fc-88cf-415f-e049-08dbc6f469ec
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6631
Subject: [virtio-comment] [PATCH v1 4/7] virtio-net: Add flow filter transport set command

Flow filter requests can be either sent using a control virtqueue
or using one or more flow filter virtqueues.
The driver can choose one of the transport based on device capability.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/179
Signed-off-by: Parav Pandit <parav@nvidia.com>
Signed-off-by: Heng Qi <hengqi@linux.alibaba.com>
---
 device-types/net/description.tex | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index c7306b6..17d4f15 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -1180,6 +1180,8 @@ \subsubsection{Flow Filter}\label{sec:Device Types / Network Device / Device Ope
 at a time, i.e. either control virtqueue or flow filter virtqueues.
 Once the driver sets the flow filter request transport in the device,
 the driver can send flow filter request using the enabled transport.
+The driver selects the flow filter transport using control vq command
+\ref{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Flow Filter / Flow Filter Transport Mode Set}.
 
 The flow filters are grouped using a flow filter group. Each flow filter
 group has a priority. The device first applies the flow filters of the highest
@@ -2048,6 +2050,7 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
  #define VIRTIO_NET_CTRL_FF_MATCH_CAP_GET 1
  #define VIRTIO_NET_CTRL_FF_GROUP_ADD 2
  #define VIRTIO_NET_CTRL_FF_GROUP_DEL 3
+ #define VIRTIO_NET_CTRL_FF_TRANSPORT_MODE_SET 4
 \end{lstlisting}
 
 \subparagraph{Flow Filter Capabilities Get}\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Flow Filter / Flow Filter Capabilities Get}
@@ -2140,6 +2143,25 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
 };
 \end{lstlisting}
 
+\subparagraph{Flow Filter Transport Mode Set}\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Flow Filter / Flow Filter Transport Mode Set}
+
+The command VIRTIO_NET_CTRL_FF_TRANSPORT_MODE_SET sets the
+transport mode for flow filter requests in the device.
+
+\begin{lstlisting}
+struct virtio_net_ctrl_ff_transport_set {
+        u8 mode;
+};
+
+#define VIRTIO_NET_FF_TRANSPORT_CVQ 0
+#define VIRTIO_NET_FF_TRANSPORT_FFVQ 1
+\end{lstlisting}
+
+The \field{mode} when set to 0, it indicates the driver will use
+control virtqueue for transporting flow filters requests; when the
+\field{mode} is set to 1, it indicates that the driver will use
+flow filter virtqueue(s) for transporting flow filter requests.
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

