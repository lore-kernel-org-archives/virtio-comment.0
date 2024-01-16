Return-Path: <virtio-comment-return-8947-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDD72C47077
	for <virtio-comment@archiver.kernel.org>; Tue, 16 Jan 2024 05:51:09 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 13D894128E
	for <virtio-comment@archiver.kernel.org>; Tue, 16 Jan 2024 05:51:09 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DEBDB9865D0
	for <virtio-comment@archiver.kernel.org>; Tue, 16 Jan 2024 05:51:08 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id C562198402B; Tue, 16 Jan 2024 05:51:08 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B5047986561
	for <virtio-comment@lists.oasis-open.org>; Tue, 16 Jan 2024 05:51:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MFzgiVfGN0D5b9JJHcASob3u/COUXEs8SNc4TkJpwMPUkNknsdRTk9W6ClHyhZILbrgT6/3o/newTS5eqopN/0wpnmSqSv7M5c9CP0M6YYXu4yObEAGzi5zsbapm6ne4Ni60wb/A/aAqF78fDq3MX4IVgymGrZbeG+11TWDFP9Xz1Aa4rMNulHMmEK9tIfVw60e05jeRNF62NUAzKioTbv+XTXV1gtFsHJ9rSpvj2HMUJfaxTl31ktttrfkqdQS61mkasi2X4+KNCpzOYJB9A0zod6Mds9Obwf1jygPaBc6QpHIioYewR/Ay9r/Unf9q/oMCUedy+6/SxNsd5De6HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LJ5TXUStg+jCI6nDIu0ARPbeLhtcw4Z6R+jEikchgs0=;
 b=IxStXrb5tMrQIke5U8De/kjURjrVgC0IxqyWjw7J/vCxZd0aOwpT+xIowRjgGh84RCpb4ZfdZPgZUK1qSyAtScBISB5Jm71ijYT8qrhTMYgrtj7pbXdpwUg1Vpt9vkE6fqsCglWnRm3klWl/T9WZL1dna8R1PIsIfkrbKYlXWMpucOUE5vZBaupcwBx1gDw21ur0Ya6THthzFA7VkJXaiMjRZSGZUKmyT7RzQZTuE0UxpzLt/D0Fo9cLR23GXwtVlVqZ7mw5lc4eiM4+X04DLhwoz6u7rw6ROxS5c5KKRGmMtdukNqBuCMHVM1v+N0Pr62sUz3HIuxCQsIkj8TKYfQ==
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
CC: <shahafs@nvidia.com>, Parav Pandit <parav@nvidia.com>
Date: Tue, 16 Jan 2024 07:50:30 +0200
Message-ID: <20240116055030.3546276-1-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0DF:EE_|CH0PR12MB8531:EE_
X-MS-Office365-Filtering-Correlation-Id: aa269621-4a70-4834-a41c-08dc16572130
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	llHWcNV89Zw5QlXUJHQmnd8/xcnOmDsZ1SqyUjyNfnQtbL82ECvsk7FyGu3JFUnWwmqQgofR/7xoSx00pDjAqxyiXZjkmEmnDTaSCP3PyK6cPx9vM9GlgowtjDx512lI/8P/uSjYUACYzAtrHKBmYoUVAe5FIjRnJ3VuHPXxD7SDqas8/6SJ1Z7nP6zE6y2naU4LqCWH+CDdvmIffboRBf8K6BcFfoci2izwwixdXc5GRF3jwOYZXurCpXRPrbksrQHB73zVMh+w0R7/OV49zC8x5WpAE2AD/uhniVJlGxf+fcZymIm8pK4DJDZSRfs21E82DH/PzNEYHXfj1+FCyWzUcgD4hfwD/T0d0FlOlFupkT0rEKvJlYJNzosOIGx97UhcDPwqiYKMDmVCJEJdouDpqVYINANMp6ULHQfUB8EkKjNlPEHbno+lnt3qEl6fZozX8pWTju0MmNvc5dEMf1HCOScGbmu+ZZa4jgAA4uOZJaOHdEgutS4azgugcSwcLpZKndyMIfIDZDDBNoU76vkIhwQSzPgwWkURoY7pznj9fAcG+HQjj1o3I84LCoWEAs8ObRbNgJnKqUOs41IEmnTp8tCmLfLBX9PZeoznKWwcVjndqqilsksa3ZuCdb8rAG3+G5YgRpdXhnXITCF66j0qBWo4CI6Y8zLknkYTl329f/5aySohYY5mjbFG5gSJYrzqwbJhZQ9nASu//k29X5mLxr/ZoMm2b2L2Az8sDlE9ekKjwwH+uueRNur9MIHDmmL/23bZNhW5zWsACyHeTA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(396003)(376002)(39860400002)(136003)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(82310400011)(40470700004)(36840700001)(46966006)(107886003)(47076005)(1076003)(26005)(2616005)(336012)(426003)(16526019)(83380400001)(7636003)(356005)(36860700001)(41300700001)(82740400003)(8676002)(8936002)(110136005)(70206006)(316002)(5660300002)(54906003)(2906002)(6666004)(4326008)(966005)(478600001)(70586007)(36756003)(86362001)(40460700003)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2024 05:51:05.2694
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa269621-4a70-4834-a41c-08dc16572130
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0DF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8531
Subject: [virtio-comment] [PATCH] virtio-net: Annotate virtio_net_hdr as field

At several places struct virtio_net_hdr missed out the field
annotation. Add it.

Signed-off-by: Parav Pandit <parav@nvidia.com>
---
This patch is on top of [1].

[1] https://lists.oasis-open.org/archives/virtio-comment/202401/msg00070.html

---
 device-types/net/description.tex | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index 294fa62..0cc03fc 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -434,11 +434,11 @@ \subsection{Device Operation}\label{sec:Device Types / Network Device / Device O
 
 \subsubsection{Legacy Interface: Device Operation}\label{sec:Device Types / Network Device / Device Operation / Legacy Interface: Device Operation}
 When using the legacy interface, transitional devices and drivers
-MUST format the fields in struct virtio_net_hdr
+MUST format the fields in \field{struct virtio_net_hdr}
 according to the native endian of the guest rather than
 (necessarily when not using the legacy interface) little-endian.
 
-The legacy driver only presented \field{num_buffers} in the struct virtio_net_hdr
+The legacy driver only presented \field{num_buffers} in the \field{struct virtio_net_hdr}
 when VIRTIO_NET_F_MRG_RXBUF was negotiated; without that feature the
 structure was 2 bytes shorter.
 
@@ -731,7 +731,7 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
   chains them together to form a single packet in a way similar to
   how it would store it in a single buffer spread over multiple
   descriptors.
-  The other buffers will not begin with a struct virtio_net_hdr.
+  The other buffers will not begin with a \field{struct virtio_net_hdr}.
 
 \item If
   \field{num_buffers} is one, then the entire packet will be
@@ -2330,7 +2330,7 @@ \subsubsection{Legacy Interface: Framing Requirements}\label{sec:Device
 
 When using legacy interfaces, transitional drivers which have not
 negotiated VIRTIO_F_ANY_LAYOUT MUST use a single descriptor for the
-struct virtio_net_hdr on both transmit and receive, with the
+\field{struct virtio_net_hdr} on both transmit and receive, with the
 network data in the following descriptors.
 
 Additionally, when using the control virtqueue (see \ref{sec:Device
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

