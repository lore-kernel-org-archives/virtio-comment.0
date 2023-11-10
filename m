Return-Path: <virtio-comment-return-8326-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D56BC4167D
	for <virtio-comment@archiver.kernel.org>; Fri, 10 Nov 2023 12:39:42 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id DFE1B74A1C
	for <virtio-comment@archiver.kernel.org>; Fri, 10 Nov 2023 12:39:39 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9BE80986D52
	for <virtio-comment@archiver.kernel.org>; Fri, 10 Nov 2023 12:39:39 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 6A120986D58; Fri, 10 Nov 2023 12:39:39 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 45E66986D1C
	for <virtio-comment@lists.oasis-open.org>; Fri, 10 Nov 2023 12:39:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WFeGMQl/f0mxaGf3+Gpn6a/d0/IzrUwf0Zs7e652CLnq2F3Rvj6v0LlAZ/7LAHHyJLClckAZ3Av+pqxARXQ9PFNv6MR9dwqgvjIuI/JJgOPWMYDgdkSXsGp1QtHWwuijyzMKqP9JjMpeT2JDCHDbUg5UaDkaNXy1agoslziECDAC36BMum+pn+uTjH65n7kKIyQa/pa3kVCOK4XcmPemcNxLxD21VtxbpepWPxhdslr31GToVMUkfAUygct8D44IN1CM3oamgMqsoh28wvG9IuEPxPQfX86EAwLzeLbBYIGY7SHAPi16FaHnApSWs3+/nsA+P33KtCoFbyVy/1Vjfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IVzPXCfyi/5LWSDLcoddNejclVQqh0QxTyTDc3BhAqY=;
 b=So25m2lhsI4K2maVPbHVXIpTvf0GS+tYzbpOdZ904InK+mbH9Dly8PSYFrwjPsGSUAkPDkbIdP2c7GZXkXlb7fjw+0zmPs50pIOD3bsi6tvbdUl5ujL84g0XbKVyQb+t3svYaIM3S0WGDZqlJ3vpeHv7mGGFyqexhYXXfl7Ep9F1k70HkgHzULb+7Xp+Qy6z1Oz4km8AAtiq3BntbK54yctPrmu2QgVRA2bgZeLe5HOvAnz/PxcsNZbvcooawkz0ojgfUeuCOfF/e2eFvV6rntRl6Xc8PovV22u2czio000JPc+jKftzVRtonjYzWdwR37d7SK50JLx6HsXknK8LHA==
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
Date: Fri, 10 Nov 2023 14:38:51 +0200
Message-ID: <20231110123853.2093309-4-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00003445:EE_|DS0PR12MB8443:EE_
X-MS-Office365-Filtering-Correlation-Id: 1dd59570-da60-48db-f772-08dbe1ea18cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gDh/rYJ9Ss2pBwicfHaXZbqqQ6c7SfMhsHppSr8ZXoJV8S7VoOhGDyTK6m9oOteGICgYbzqwSyHWtMrINh+62DpLxxbzTocQOLkh7q03yEGbmXcWQ5knVXgh89F4jvB+lTHtZq+XnjfJVYujnaN1WkLhJUrhhNtO2UaO5Hrrb+btTOlDpzIikBmGg6zRctEVv0CLlXGK6tkFQefvIKrhL6D1LXolPvRaSKgkGyuSa7bRdvRjGu0PB4Bg9R44w2B2uC/ckjfo+gYRFiUoflzGXVwqRNidU3jSbTkIq1x00SnaXY7nxpgqSJEFBHQAvRnUIfxqsIpVLbfwg685fzxzefhAtFKcRdc11OiR6bcbmt8yD0LMT/NhTf5Q/flZy5vtL7mpdsNBxPElyUE4ZhmufMtli6s+lbfMef1EZb6GrbHNFtpQHmFeFSy1QPw8b+wA26I09H1rDMccoN57qE9qoonNK2sG8LKx7COOAlTYMjX078r3WdrDLEXpy5SdlCjWqoIpCLVr6mijQOBubV2E0PAgjbLmCyC1dVPrk0jbiIG8HztBAPcUMEuIEjgyAi2seEXzJkaZJA/DZMQqtPQ3GJoawkjjhu74Agv2s5nKZdeDYKwVV7IAotl4olWlQ02WHzTUKGeL33ffQv2JXQ0G2O7gSPhCrjXxWf6b29DdIfpnrTLCs/g/yCl0xu9Gh4Mq8TPoWtRo6Qr6ZfezQgmjSq125qm7HnGfrhkCXESXP3ekSlpTVLiqDyRhRv5Y9yj2s/K8Z5hCO6nLvzoqdwRm1jeDWESQjV1ZYUbylfp00YA=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(136003)(39860400002)(396003)(230922051799003)(1800799009)(82310400011)(64100799003)(451199024)(186009)(36840700001)(46966006)(40470700004)(316002)(8936002)(6666004)(8676002)(4326008)(478600001)(966005)(41300700001)(16526019)(2616005)(54906003)(26005)(40480700001)(5660300002)(70206006)(70586007)(1076003)(2906002)(110136005)(336012)(426003)(40460700003)(83380400001)(36756003)(47076005)(36860700001)(82740400003)(356005)(86362001)(7636003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2023 12:39:35.6399
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dd59570-da60-48db-f772-08dbe1ea18cd
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003445.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8443
Subject: [virtio-comment] [PATCH v6 3/5] virtio-net: Add flow filter group life cycle commands

All the flow filters are managed in the flow filter group. The
device can have one or more flow filter groups. Each flow filter
group has its own priority. The group priority which
defines the packet processing order in the flow filter domain.

Add commands to add and delete the flow filter group.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/179
Signed-off-by: Parav Pandit <parav@nvidia.com>
Signed-off-by: Heng Qi <hengqi@linux.alibaba.com>
---
 device-types/net/description.tex | 36 ++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index eccd8d6..31c8c35 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -1190,6 +1190,11 @@ \subsubsection{Flow Filter}\label{sec:Device Types / Network Device / Device Ope
 filter group, a packet may find a match to multiple flow filters. In such
 scenario, a flow filter with the highest priority is applied first to the
 packet, if there is no match, the next higher priority flow filter is applied.
+The driver adds and deletes the flow filter group using a control
+virtqueue commands \ref{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Flow Filter / Flow Filter Group Add}
+and
+\ref{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Flow Filter / Flow Filter Group Delete}
+respectively.
 
 \paragraph{Packet Processing Order}\label{sec:sec:Device Types / Network Device / Device Operation / Flow Filter / Packet Processing Order}
 
@@ -2533,12 +2538,17 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
 \item the driver can send commands VIRTIO_NET_CTRL_FF_CAP_GET and
 VIRTIO_NET_CTRL_FF_MATCH_CAP_GET to query the flow filter
 capabilities of the device.
+\item the driver can send commands VIRTIO_NET_CTRL_FF_GROUP_ADD
+and VIRTIO_NET_CTRL_FF_GROUP_DEL for adding and deleting the
+flow group.
 \end{itemize}
 
 \begin{lstlisting}
 #define VIRTIO_NET_CTRL_FF 7
  #define VIRTIO_NET_CTRL_FF_CAP_GET 0
  #define VIRTIO_NET_CTRL_FF_MATCH_CAP_GET 1
+ #define VIRTIO_NET_CTRL_FF_GROUP_ADD 2
+ #define VIRTIO_NET_CTRL_FF_GROUP_DEL 3
 \end{lstlisting}
 
 \subparagraph{Flow Filter Capabilities Get}\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Flow Filter / Flow Filter Capabilities Get}
@@ -2596,6 +2606,32 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
 Each array entry of \field{types} represents supported match fields of
 the packet by the device.
 
+\subparagraph{Flow Filter Group Add}\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Flow Filter / Flow Filter Group Add}
+
+The command VIRTIO_NET_CTRL_FF_GROUP_ADD adds a new flow filter
+group with the supplied group identifier \field{id} with assigned
+priority \field{priority}.
+
+\begin{lstlisting}
+struct virtio_net_ctrl_ff_group_add {
+        le16 priority;	/* higher the value, higher priority */
+        le16 id;
+};
+\end{lstlisting}
+
+\subparagraph{Flow Filter Group Delete}\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Flow Filter / Flow Filter Group Delete}
+
+The command VIRTIO_NET_CTRL_FF_GROUP_DEL deletes the
+flow filter group that has been previously added using command
+VIRTIO_NET_CTRL_FF_GROUP_ADD. Flow filter group is
+identified using a group identifier \field{id}.
+
+\begin{lstlisting}
+struct virtio_net_ctrl_ff_group_del {
+        le16 id;
+};
+\end{lstlisting}
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

