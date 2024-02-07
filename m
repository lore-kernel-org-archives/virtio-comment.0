Return-Path: <virtio-comment-return-9084-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CAA1C4828D
	for <virtio-comment@archiver.kernel.org>; Wed,  7 Feb 2024 07:24:40 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id DD2FD12EAE1
	for <virtio-comment@archiver.kernel.org>; Wed,  7 Feb 2024 07:24:39 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D7EDD986951
	for <virtio-comment@archiver.kernel.org>; Wed,  7 Feb 2024 07:24:39 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id CD15B9868E7; Wed,  7 Feb 2024 07:24:39 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 593F1986911
	for <virtio-comment@lists.oasis-open.org>; Wed,  7 Feb 2024 07:24:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Br4S3+wP7SmU+41jzsfujufoAixg7DvkvMqs/LMsEKg2qjkSFKjmd5SWaRb7z33FcgcSsoJ+RL1yOeCGaco/n9iIA8tRapI8vMyGfF1M+vnxl20V1CcgOTzoCQQ53NuHXl0QfO5md60UuSJN9NHVbTxf4FFmObZcITwAReNZATQAUf+NPScLKhJlH/s8W5RXR54CMjoO1wykrIxE94HOSsgcAnlQWciraL9cXQQ/jz1nqIRjqUhtxkQ4G9Qwmv0TuXrrbWwsg9lPeuzK62Ua/MIzzY4OjXfHWAssNflKFDSF8nn1nCaBfdwlu5fTdDyLOxHeBP0KD7aMoSjZkqtSfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zHuN5uqBiha2UwHZEjFycA6ay8Qw3pvmEc9LiF0iHV4=;
 b=icoFXgXiJO8oUja3FSqp+fpHSHLVHUvBoPsxYA+/cIP63ZoEXgq5vCtU6VLoj/KZ6qrwrXcAmLxf5Lk94UYrVpNF1GpxV71BHWDOMzIBRNX/hUOKh+yBa+BYPHdXgwom8Xt/Ym+fn8AYVj12hJ2JwynBaNswxGwrtRqyY540ywPs1htJXKM8jKUv1pjTYxXqoRQyVWSXOvbT8V2c+A6gRsYxAB9GM56NqfriBaK7QIvTrxDu+j6a34Yc09V6g+L+OVl++CCTYqdxT2m4mSOFDjGSCEXjS6B8X19DSm6ywGbSDrlABXhcVw+OxzoRxdAkFEQsid8EXloFKPOvfzs1Tw==
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
Date: Wed, 7 Feb 2024 09:23:32 +0200
Message-ID: <20240207072336.477606-10-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240207072336.477606-1-parav@nvidia.com>
References: <20240207072336.477606-1-parav@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003439:EE_|CH2PR12MB4905:EE_
X-MS-Office365-Filtering-Correlation-Id: 566c704e-0dc1-4f34-418b-08dc27add608
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aPnV1tTXTZrD3/pbd5QDeidWweXDHSLeHUawpFIPwevU4+Bu2nNpGtTgjtby2OukU+XlKgyMUmYl4dzKE+V5vXOUpPGgaR9C+2eR6qLiFHQkloUGUbg83hy8vhq6JHbgLymU1QkZ/G3s9U3CYfVsxI/6dg7W6PJimiyA198IC0oEmbNvHI6wsE7/0xHtP2ca+OHE+1RSXZa84cg5oLyJzKe/I54Pdjb/QCILgB7gv7BWX/Wq2eEyM9YeBviSc4lVLU2huOD9jieQyzT0B5PmJpKKpCquTlaZXENS2sCugPpWWjRiNVGmHPi6JeFNKp/1gDNvdOvEltKnS1d9ynoV9SydwmCJd9046X+pv9xOpwqBFqoKfoHrZP58DJ3fgwHjUKCGzeOvi6Y4fx52yR1M4+/sS5fM2zy7PFm3mn7TkkOpDlRb32sDlKAQP7a1QdS4RCm/ND6KFQF7erEqE3p3bpodd0OAs3Gw+BG+OFGOG8frrlvAXQ//GSSsby3hrJIruL88qWBep03/Ob6AfrD61u0hztcEihqt5dIfvzWTSjSmxoQE+yxf70bjV3J6tnBkav6+kRTGyGpXlCM6zg6czLKWcnwn+B/qaNEmZEAxvr1eLcjDk85O3ruSTqjNgKteGa6g91M0QI9U7DGVf2yCxzrHVX59tD5Vn3rNCaiE4CmXE334/Ixo4JPw7LlQzs5wUdTCekWExDxF/KOaXye4C+EhgKLfHK8O4kKmzbKgBfcz5iuv/fBsRDWp8IjVJIOH/373cGEnf7sqI2TrptYP7H52/YMQf8QxcdFmhr3EpFg=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(136003)(346002)(39860400002)(396003)(230922051799003)(186009)(64100799003)(1800799012)(82310400011)(451199024)(36840700001)(46966006)(40470700004)(336012)(26005)(7636003)(16526019)(2616005)(1076003)(107886003)(40480700001)(966005)(426003)(40460700003)(2906002)(5660300002)(82740400003)(4326008)(8676002)(83380400001)(356005)(36756003)(86362001)(478600001)(6666004)(47076005)(8936002)(36860700001)(41300700001)(70206006)(54906003)(110136005)(316002)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2024 07:24:35.2052
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 566c704e-0dc1-4f34-418b-08dc27add608
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003439.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4905
Subject: [virtio-comment] [PATCH v9 09/13] virtio-net: Add flow filter group resource

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

