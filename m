Return-Path: <virtio-comment-return-8330-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3A0BC4332F
	for <virtio-comment@archiver.kernel.org>; Fri, 10 Nov 2023 12:41:15 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 454C360D47
	for <virtio-comment@archiver.kernel.org>; Fri, 10 Nov 2023 12:41:15 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3A968986D3B
	for <virtio-comment@archiver.kernel.org>; Fri, 10 Nov 2023 12:41:15 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 3022E986D0E; Fri, 10 Nov 2023 12:41:15 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2214B986D0F
	for <virtio-comment@lists.oasis-open.org>; Fri, 10 Nov 2023 12:41:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jEg9jgKqaCmhRxvhxEKZTany6CRx441Qh41zWjozfTYpgB4/cgQxgDJBtj6j3uoaAFfJN2QyvHHJM9AH5txsP9McGi0Kgv5VyI2gymfTLuM/LnVO2q/QCHo6+ISk27Jm+QqBit9rCB1dL3aB3+jfZqLVFO1K0MHtjMwsnGN6EBTkuX1pPKitQq9Mw0wzLL5Dp/HzeB5YC7yzdRfbNUq5TFMfHEncq60b3YLDubHcoq/kD9NQGrRNIlD8pzXJnnR2SKjBAPrlYtRLgacmZVBDFkgpFmxgrY1Rg1KcsOzwahwApe7p8vLOyNVfHDiAPNowMRXTa3GdIWnZcxHQnK2DOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N3O6NlrO+1xd6hpYI+QgWE9zy41WgRlHhTWlsSCJZC0=;
 b=cK0mv+01ijYMANlbyrNSEooKOPZIsjnuPODZ7G0RuLsB1VtsTEUY/M3rWyYXCTyVDiPkcjBpYqQGO+0W+dSl4ObzPaHNVWSaI75eQU0+mKDWE9cOYLydRRShGDgD2IDI6iuWDq3cftRiZnvCYueWFaHuxEqBHVQyey20FkhEnxQMsYQdvbXVIYnwwjR58djBSXyZMfkQ3N/W27yg0SuKSMYij6xO6hELUBdDkofA++JyBI7lKWqp5kaAp/cwyduYE06Jp6A619LROrmEAr9/I6zNKWJheeRl7oyRxsDA8KAN94gK5no00gviEsMemVmx8Ehf23QMDj8ZhZgF3GroYg==
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
CC: <shahafs@nvidia.com>, Parav Pandit <parav@nvidia.com>
Date: Fri, 10 Nov 2023 14:40:40 +0200
Message-ID: <20231110124040.2093394-3-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231110124040.2093394-1-parav@nvidia.com>
References: <20231110124040.2093394-1-parav@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD4:EE_|DS0PR12MB8477:EE_
X-MS-Office365-Filtering-Correlation-Id: 30585268-236b-4b63-3237-08dbe1ea521f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bH8T6eeFjXr+LjY0Aqd8WzTBPGvf++H1833RCCg2LjmOMFnX8Ezg6axKMiGUMs8+iuZgHept0pdpD+eRexfUaeqrelHkDBgIGOdExidTYC638nzFcegzJFB7/Yw9oxMbUSa4brdnXqveVRFSVvnGE3ZVdhbKZej68owf1Pc4iHaFjtNF+LbTHCehqsBv+VoOcP5ST2UhzagYFc9LysudFxQjAH36MleDPraqoGRh3oE2fQsNNNPJUxbLVEBDNc00jjP+s8IOR8Iynf/dywShAHgReaErey83xFNc07LsQhsHlUv2ytmmhAOkbJcDtUkjXGSksreBHdoMC4zhGlO+E7y2MYMjrPQbX9/9ZjK2T3tpGARTWQwOsYe+MdepZnGXMdXiJilq7Q11PtRVR4UPcXFhkQnUewwYHCNgfdYI6JMgmvJl18woJ39EKym6I7c6sLxVTwauskAOW205FmM13jicKbGhQwNpLPvkfOGUVk8af34tMux7Hp4aZ6JYDi9Cx6yXLaATZB3HgjL2jXSgaaKfXuARXEF/l5CtlNKNVpR6CJIVQJSOVgEgAwRgA0Yc+9fq8/Nd/lrKzWk+XwJi5/8kBhCHBcVZaPR5VX7Djd+QfiGSnj195M6d5py3r0QX32fDhYYygOh0U/LAr1rN5LhPft9+wEYpuEsQYVdIm9WeBQV8P5XHS4/sTZgg3FJAcFdqtZ6a7qVOelC53PkFFWld3hc/U68LPUfOdFfEMAbBykQrPHahUrZNGAu27V/hpAq0p4hsI00og3g4Wwg1Pw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(136003)(346002)(39860400002)(376002)(230922051799003)(64100799003)(82310400011)(186009)(451199024)(1800799009)(40470700004)(36840700001)(46966006)(316002)(41300700001)(8936002)(36756003)(2906002)(40480700001)(8676002)(4326008)(5660300002)(36860700001)(966005)(47076005)(356005)(54906003)(7636003)(86362001)(70206006)(40460700003)(336012)(16526019)(70586007)(26005)(82740400003)(1076003)(107886003)(2616005)(426003)(110136005)(6666004)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2023 12:41:11.7398
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 30585268-236b-4b63-3237-08dbe1ea521f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8477
Subject: [virtio-comment] [PATCH 2/2] virtio-net: Clarify the size of the struct virtio_net_hdr for tx

The feature VIRTIO_NET_F_HASH_REPORT only applies to the receive side.
However, when VIRTIO_NET_F_HASH_REPORT feature was introduced, it was
not clarified that the size of the struct virtio_net_hdr on the packet
transmission also uses higher size when VIRTIO_NET_F_HASH_REPORT is
negotiated.

Explicitly clarify this.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/183
Signed-off-by: Parav Pandit <parav@nvidia.com>
---
 device-types/net/description.tex | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index f5647d4..00ea58d 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -531,6 +531,12 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
 
 \drivernormative{\paragraph}{Packet Transmission}{Device Types / Network Device / Device Operation / Packet Transmission}
 
+If VIRTIO_NET_F_HASH_REPORT is not negotiated, the size of the field
+\field{struct virtio_net_hdr} is 12 bytes.
+
+If VIRTIO_NET_F_HASH_REPORT is negotiated, the size of the field
+\field{struct virtio_net_hdr} is 20 bytes.
+
 The driver MUST set \field{num_buffers} to zero.
 
 If VIRTIO_NET_F_CSUM is not negotiated, the driver MUST set
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

