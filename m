Return-Path: <virtio-comment-return-7880-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E33A0CDB474
	for <virtio-comment@archiver.kernel.org>; Fri, 20 Oct 2023 12:33:53 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 3819B120D5C
	for <virtio-comment@archiver.kernel.org>; Fri, 20 Oct 2023 12:33:53 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2DD0C986980
	for <virtio-comment@archiver.kernel.org>; Fri, 20 Oct 2023 12:33:53 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 2151E98693B; Fri, 20 Oct 2023 12:33:53 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C955998696E
	for <virtio-comment@lists.oasis-open.org>; Fri, 20 Oct 2023 12:33:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VCNNMwEApfh4x5VcuKjsA+782pFX1EKIebBXAheTtZMtoKu6mRGXIQjLc8fYZ77WmdwXJtdYfCxSZ20iyuEenE3GnKrJpKPzY9WRXpS9I7bfK/ZrFuJoE7omVh34UJ/KKjTnEtzL4ykvdfckIYFyNMMR/Rah+wvoHwGhZ9qLW+frIcs+Kqf9KeaPkYIAgsM2AYfHigcacDsPd0SfjaK/hvjS2okuVib2TPJPUqG+Iy1KzVF58OhiNzNyUazcS9iNsOX3eoxoDwZEcIQbRWMe3LKFzCEgt+SySWRHz66FpHSteZ9y+/AhINEuw+DDy01s/eufjlxHCFM4qZqYKwJ4Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d2KzbKEk7jpOMLS1zFtgcldEGAWbFohohHyPugqtSbE=;
 b=O7eqQqDcueYE8N2ckjAcPTumhMRVy3SjE0z0+AW+QFsAU4zUflUyUSbVRlU08WNZG9+4AYy3aDKwN/sP6OzFelP+DBVxVfl7QXRSW1DlgR8K4dRtEBdldpZLrRzp/Knk3t4L0p0lQvWltVh81Td4O2fEyxIhpuSVCShvgyXBIBLDJgmz/7wvdAkEmBiWI1KGe4v3nCe7hlfEUH6oPkdT/PmwZX0WRd2Wsywlj2xaQDrJnZkovg4/U5UoPqG02+pIg6GWWIP+Pu99hOBQDyF6ssXPo3ngp72SdZRAKdCZHDmaBjdfyp0w//crWk+sprRNqWjx1/CrtvtZa90IEGWlHQ==
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
Date: Fri, 20 Oct 2023 15:33:00 +0300
Message-ID: <20231020123303.1209289-4-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E5:EE_|PH0PR12MB5498:EE_
X-MS-Office365-Filtering-Correlation-Id: 8684bb9f-2d1f-4e58-6886-08dbd168cbd7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GpJ3LFDqWMDqqKCj6mD33gRnywAzr/FHeRcXDZsJeBY3FYyIIVlnaCPh9TlULrAWtXI7qBVdvIszIEGhC5OoQp44TcmlaiXr5zhIzid6MQdS1blzLSEJ9+2Ut5LCUhDZsmGFDqCCjTPL3RhpJL+iT0bk0Ztkd3UOt5V2nlGmQS5yp5iWK68xUpQ3qjKaQpEHFqLFYB43Lcp4mu5xpcehRg7UCD6zAdKy78EI9y4rV6RE5rOkDyAWcqzw54shvd9baKV5NAiUT6giEoSEx7GNSGhe8isgG5ebV2rKTKVeP2HeJhJNZWUWcd5CHBcFdKJSFdDJeJ+6s20IT0Q2iRcO3fMlvBs/S5DPWnRdqsAgZDDw/u+bc+356hWHXun9gSyN5A+/dlJICtuhdsAC5Ll8kJ0RhFsTr4QpVAMRl+rh4RXPs86cECE0HxSGpio/wH/GwJafK7TO5ViXswj6iHwV7kyCpwM9wBmL01u9eo97BkRBe4gJVjngH1bfNCLeEbN7g4rxLHcsWyLxS9GW5FE3g9804kY+gEa05ORcXMHNcLhtASdwBPuHw7VCSpVBM65lrpBio/XnsIDeovcA9ztoQBiG0ln7ZyoAtO7bGahzqveM0C8tt7dn/lBJ/WwAKWGDQRNOYniYafrvWJ30SFlc1a6s6qzBaU3mfLKvENH8xCJGlkBeaI2B0kb7vtR8FguLbPJ637VwSKOf5fIwx6mm/6xNu3qZ4m7qh+/+nk6e0btYvq/xJ77I6gWn8QeqjAXb7Gb8ayOISqxfbU9lqcaxVEimZJh0qEpTjYZS6VLevOE=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(39860400002)(346002)(376002)(396003)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(82310400011)(40470700004)(36840700001)(46966006)(40460700003)(16526019)(26005)(1076003)(336012)(6666004)(426003)(36860700001)(83380400001)(47076005)(5660300002)(41300700001)(4326008)(8676002)(2906002)(8936002)(966005)(478600001)(70586007)(70206006)(54906003)(316002)(110136005)(7636003)(356005)(82740400003)(86362001)(2616005)(40480700001)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2023 12:33:42.8346
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8684bb9f-2d1f-4e58-6886-08dbd168cbd7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5498
Subject: [virtio-comment] [PATCH v2 3/6] virtio-net: Add flow filter group life cycle commands

All the flow filters are managed in the flow filter group. The
device can have one or more flow filter groups. Each flow filter
group has its own priority. The group priority which
defines the packet processing order in the flow filter domain.

Add commands to add and delete the flow filter group.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/179
Signed-off-by: Parav Pandit <parav@nvidia.com>
Signed-off-by: Heng Qi <hengqi@linux.alibaba.com>
---
 device-types/net/description.tex | 33 ++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index b94daed..9087d36 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -1199,6 +1199,11 @@ \subsubsection{Flow Filter}\label{sec:Device Types / Network Device / Device Ope
 filter group, a packet may find a match to multiple flow filters. In such
 scenario, a flow filter with the highest priority is applied first to the
 packet, if there is no match, the next higher priority flow filter is applied.
+The driver adds and deletes the flow filter group using a control
+virtqueue commands \ref{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Flow Filter / Flow Filter Group Add}
+and
+\ref{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Flow Filter / Flow Filter Group Delete}
+respectively.
 
 \paragraph{Flow Filter Virtqueue}\label{sec:sec:Device Types / Network Device / Device Operation / Flow Filter / Flow Filter Virtqueue}
 
@@ -2065,6 +2070,8 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
 #define VIRTIO_NET_CTRL_FF 7
  #define VIRTIO_NET_CTRL_FF_CAP_GET 0
  #define VIRTIO_NET_CTRL_FF_MATCH_CAP_GET 1
+ #define VIRTIO_NET_CTRL_FF_GROUP_ADD 2
+ #define VIRTIO_NET_CTRL_FF_GROUP_DEL 3
 \end{lstlisting}
 
 \subparagraph{Flow Filter Capabilities Get}\label{sec:Device Types / Network Device / Device Operation / Control Virtqueue / Flow Filter / Flow Filter Capabilities Get}
@@ -2135,6 +2142,32 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
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

