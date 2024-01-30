Return-Path: <virtio-comment-return-9046-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 076CDC46CD2
	for <virtio-comment@archiver.kernel.org>; Tue, 30 Jan 2024 14:07:57 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 735E3157EEB
	for <virtio-comment@archiver.kernel.org>; Tue, 30 Jan 2024 14:07:56 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 681B39868CA
	for <virtio-comment@archiver.kernel.org>; Tue, 30 Jan 2024 14:07:56 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 5CC20986886; Tue, 30 Jan 2024 14:07:56 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4E0E79868B4
	for <virtio-comment@lists.oasis-open.org>; Tue, 30 Jan 2024 14:07:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XR6ZuVe1UkDC4ZJQjwn0hVMjQ8STjmr7RRv+hS/9kBlM4QEDCxjWlvvfXNZ7kiuxEpRyi5ryXNaZL+vkFMlo1tn6JYSVSlixQ+rLGR+pLjdITyYiYhnnefDcP5YAHnAvnOh9DS9oJoQO3FIBSC/KAhqiR5ng1sVz/nbD2T/WFETRLqnmytdIKboK/ShbewEmqlvTlrdpte7YTjCSXY1txNHn1gwcd7Dq+guxT6GbIP9xrTXTVQ7ql18VGgI5xoEplBgrvxTyb8Wmzd3uMpO/xolFpwlCYeOKIV8qtZZvZQxyMYEjVG/t+d8Lp5am9j5+hRI8OCGQB7vf3C11BSvDUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zHuN5uqBiha2UwHZEjFycA6ay8Qw3pvmEc9LiF0iHV4=;
 b=bc538P1gEuWrX2zOewNEpmBMVB63VNABYI+S6YLsl5jkAWK5XQnIIRcrD1dkrlFF7C8JYfcFS0L7sDvqO/9Ax0WM38W4/xrgHtFyAXLbSNVUD9xE7YF3kGONeg2U0aF6hjSvUhTWk6SPqznQPfCSQy+OBAPjvvTrGwFOPaEpA9PCsxWIjwJTq+boV5U0Z/xhkWfEnmVb9xWwBbqU6Q/d6vaR0z/2MzHh6weA6WMM2q+wesVVaYL9W1txX8g5wdfW9zwnwvOqBWo1CPPSoQc5nly598tS8LpjrDwb7chcCdn3KCIwNaeR57O2TYncR9eVwg2qby3qKDnSh9ISs3MnUA==
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
CC: <hengqi@linux.alibaba.com>, <sburla@marvell.com>, <shahafs@nvidia.com>,
	<si-wei.liu@oracle.com>, <peter.hilber@opensynergy.com>,
	<jasowang@redhat.com>, <xuanzhuo@linux.alibaba.com>, Parav Pandit
	<parav@nvidia.com>
Date: Tue, 30 Jan 2024 16:06:38 +0200
Message-ID: <20240130140642.406882-10-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240130140642.406882-1-parav@nvidia.com>
References: <20240130140642.406882-1-parav@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4F:EE_|DS0PR12MB6414:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f533803-3ddf-4d06-263e-08dc219cd409
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	v0FXRQfLqvr9nxWkvPykifnW0vRZXduLdhZ2+4JJiDFQ+GN9KKQzGGPFeA8la68ZTk5lp+RZSX0dv8bFYZw8aY4EuJmumAq1yaFdWY0szic8zpAv0xUx+9GgT/r0c4fFLLuqLzGeKN5C94bBFSqv5QNYcjsU21kC5Y8k1dzBqDVIaJ1R0mWmQZ1G3g3dVogEJ2Y57Wi6PmOwwJxx39ijXCHh4N+nImK5BAPICO7eZER3XHZNLDGo1PoJM9y79Hkl4xtYnyGWloX5QAMOal9V9Dfkr6J0t5Rv05yMmYWQteJMm+K5BNRgjR8d+z725O5DD/eKCtOwL2mhPJ4I8W0CQeRXT0rhITgtqFxf98wWO6Cyz9LEhmvJPygwOMwmqrFpengflDvLuyAMiGAMR6nAiZ734k5CeiqFqe2nxakO+SNjgDHSnZKCjH/2x6SLdQDG4qiWLWURibNht+7qGFm3bp865N40UOEhbxUZti+CBDcQzwVdDbf4Xb7QjXS+PcA45or0wsLMHDyIuCijVZM2LRtVSqaZhqZKVDgqdlMRzRa6Ntm0AGzQH2ivPtoSNewsgbRXWSC8MDkNzOmBGBIe2CQtQFLwmvrXrApDS3+4Pk7WSSuIJsBIiKato34l1UlJ8mVbpBW7CxQdMkSr8jr7w3aznfywx6VT4+j9tGdxlwsTfNFsEITrm+lp8pM2zwXCsGT8+fAgXyXzXj98/wnY+bbrHAi5Epl3h2+SMpAllmuVJpBnRqE6L1ZmEOvIB1ZaMkTAMAFnWuKS42RfNbXoiZGE8OMq50TM9UWb2zI8L0I=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(136003)(39860400002)(396003)(346002)(230922051799003)(64100799003)(82310400011)(1800799012)(186009)(451199024)(46966006)(36840700001)(40470700004)(36756003)(54906003)(316002)(8936002)(86362001)(5660300002)(110136005)(8676002)(966005)(70206006)(70586007)(4326008)(36860700001)(2906002)(83380400001)(426003)(107886003)(26005)(41300700001)(16526019)(47076005)(2616005)(82740400003)(478600001)(1076003)(6666004)(7636003)(336012)(356005)(40460700003)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2024 14:07:43.4345
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f533803-3ddf-4d06-263e-08dc219cd409
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA4F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6414
Subject: [virtio-comment] [PATCH v8 09/13] virtio-net: Add flow filter group resource

A flow filter group resource holds the flow filter rules.
The device can have one or more flow filter groups. Each flow filter
group has its own priority. The group priority defines the packet
processing order in the flow filter domain.

Add resource definition for flow filter group.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/179
Signed-off-by: Heng Qi <hengqi@linux.alibaba.com>
Signed-off-by: Parav Pandit <parav@nvidia.com>

---
changelog:
v6->v7:
- addressed comments from Cornelia
- reworded the description for group delete command
- rebased the series on top of generic resource framework
---
 device-types/net/description.tex | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index efe363b..05979e7 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -472,14 +472,33 @@ \subsubsection{Flow Filter Match Capabilities}\label{sec:Device Types / Network
 is supported or not.
 
 \field{num_types} indicates the length of the array \field{types}.
-Each array entry of \field{types} represents the fields of the packet
-which are supported for matching by the device.
-
 Each array entry of \field{types} represents packet match fields.
 
 For each \field{type} the \field{fields_bmap} indicates supported fields
 of the packet header which can be matched.
 
+\subsection{Device Resources}\label{sec:Device Types / Network Device / Device Resources}
+
+\begin{tabularx}{\textwidth}{ |l||l|X| }
+\hline
+type & Name & Description \\
+\hline \hline
+0x0200 & VIRTIO_NET_RESOURCE_FF_GROUP & Flow filter group \\
+\hline
+\end{tabularx}
+
+\subsubsection{Flow Filter Group}\label{sec:Device Types / Network Device / Device Resources / Flow Filter Group}
+
+For the device resource VIRTIO_NET_RESOURCE_FF_GROUP, the
+\field{resource_specific_data} is in the format of
+\field{struct virtio_net_resource_ff_group}.
+
+\begin{lstlisting}
+struct virtio_net_resource_ff_group {
+        le16 priority;	/* higher priority groups are processed first */
+};
+\end{lstlisting}
+
 \subsection{Device Operation}\label{sec:Device Types / Network Device / Device Operation}
 
 Packets are transmitted by placing them in the
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

