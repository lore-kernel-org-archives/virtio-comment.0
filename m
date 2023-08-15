Return-Path: <virtio-comment-return-7130-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3664AC0015E
	for <virtio-comment@archiver.kernel.org>; Tue, 15 Aug 2023 07:46:47 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id BFDF579089
	for <virtio-comment@archiver.kernel.org>; Tue, 15 Aug 2023 07:46:45 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B71D1986445
	for <virtio-comment@archiver.kernel.org>; Tue, 15 Aug 2023 07:46:45 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id A806298644A; Tue, 15 Aug 2023 07:46:45 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id F347B986686;
	Tue, 15 Aug 2023 07:46:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AAdBBnLC3sm0i/n5LnWcLmUT4Mqrqwtl8vpdk+SyFGarTrZa/gPmYn701UF5l4i+nVSGMPq2edKMZogrGFOonWP6OpuLiAnRN78fVYAuT/HGTC0spXwwLPVKRYQRBzWm9UAK8mESgPhJ+B+6j1duKxag6RWUZma6zyO512wF1H584MjML+GXQSPQrIlJTksdWiGmi5CtqbUlRiHrz8Mjj8lF3c9Awnizl5LyBGBMgEVKMsTHRz4G8pVl4NNRe8QFKBZEvBzdgnonq2NjC8Nq6rbPqZ5ORvG0y6e166+NiCcF97PgSu9ha+lVCc9149JV/I7HvaLhsZyaYx0AkSY9vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4TR4hD4VkDMmr4sZIxWvTmDtCzvn/OkbOmdjeqTPpCA=;
 b=FSzDWK5690lEvBz7JLlHNsJGNoA4GnkTwLGajQ0UPXcQ4/uz75ZeJHROkDakiBP7tl/NKSxW1q9xN88dxndjWKixo2f8aej+gkF4p3MT16Fev3kEfe+1Lt+7OFvx5h6NIKdFnxiivoQAz2DsOThnCOuXiZJzm9ZJdOzcNTXO7haIWZ2tgxntt6V1ZmgIsBGPV7NxGa7f6W6I1ab20rM8mlSMQ0D8H2Jn4TqLrCKg1q7J88UVN6sjwBhIbPOyv1uJ5sG6lYuo2r6eZgt6orfD0nMo2i3gxN49s6KKX59MGT2OG6VvHCfoWZwuu1bWjYXq3seJFNs8KfyQfKmnEarDNw==
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
To: <virtio-comment@lists.oasis-open.org>, <hengqi@linux.alibaba.com>,
	<david.edmondson@oracle.com>, <xuanzhuo@linux.alibaba.com>,
	<sburla@marvell.com>
CC: <shahafs@nvidia.com>, <virtio@lists.oasis-open.org>, Parav Pandit
	<parav@nvidia.com>
Date: Tue, 15 Aug 2023 10:45:56 +0300
Message-ID: <20230815074600.473933-4-parav@nvidia.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20230815074600.473933-1-parav@nvidia.com>
References: <20230815074600.473933-1-parav@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.37]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044EE:EE_|PH8PR12MB8605:EE_
X-MS-Office365-Filtering-Correlation-Id: 98e49fff-2f25-49c3-efc9-08db9d63bdd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Tb1ZWpi8ChqebHi47IjEuiFekNmrKSBK8iS60Fgc3YSkniI/0X/vaKahNXCXCFsfyIn7qTQljwLE4YZOBUg2ncCkhtdVN1a/fyJ1kMqlOEE9v0KZQM/k2Ee7QArWc1fK3ons8M4oWEqz7l7ZyE1RqnXQEtiQHdeNuI5yBCXETeZ82ZeiGrg0PwxDSOAJYKOaxUT5jzexidgYm+1+Nt2A4E4koqyVsAUkX7mW0MBUoWgYSKoSLn5co8eq6VFvzYKaohDuDLsRRW4noETxVCh5tusBz0S0x2UzPdKuU83BEi014ZXBDwtlWDfJlPenXv66uPw1BHyYwRkxlXY2sGTpKOv1ZtqNcKzG4QhlDE6HJ1wcIRMk34IIp4zJpN5WENrAy/8U1eW2OcapI2E/8TP/U5vnK41dRQ/AedMRekZ3XdekRVRejLZy9VrEp29LvPVipNtpzymgHfi8kb7w6Tj1Q5hv7i33G8xo+dYCOfTxXUVw6v28nYnoMOBejIazWYaaCw3Xd09eSY5RZVkYqX9iR+3JaWzvBaPkyftg0bpIyKeUFBkTAOwohPEfnwbVyok+5CMX4miPNBYOVm/MLcDTpAYYQ6dUX3ovy/PQVke/VdIsDuDqAnHcn9m7q/fdvnJCNum92281x8+3uvlkM8DaOv1ekw6vBlImu620DOZrcjm4ZEnZ/M/K9U+xNWL4GKcFsRdHQLnBrkjJ3CqjxZrl2AvSAWtPkwWCsmC4K+13g4ouQBmZoZ8uQFgkloezarA4
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(346002)(396003)(376002)(451199021)(82310400008)(186006)(1800799006)(36840700001)(46966006)(40470700004)(40460700003)(336012)(426003)(16526019)(1076003)(26005)(107886003)(2616005)(83380400001)(36860700001)(47076005)(41300700001)(54906003)(70206006)(70586007)(2906002)(316002)(5660300002)(8936002)(8676002)(4326008)(478600001)(6666004)(110136005)(40480700001)(7636003)(356005)(82740400003)(86362001)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2023 07:46:31.4422
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98e49fff-2f25-49c3-efc9-08db9d63bdd6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044EE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB8605
Subject: [virtio-comment] [PATCH requirements v4 3/7] net-features: Add low latency receive queue requirements

Add requirements for the low latency receive queue.

Signed-off-by: Parav Pandit <parav@nvidia.com>
---
changelog:
v0->v1:
- clarified the requirements further
- added line for the gro case
- added design goals as the motivation for the requirements
---
 net-workstream/features-1.4.md | 45 +++++++++++++++++++++++++++++++++-
 1 file changed, 44 insertions(+), 1 deletion(-)

diff --git a/net-workstream/features-1.4.md b/net-workstream/features-1.4.md
index 40fa07f..72d04bd 100644
--- a/net-workstream/features-1.4.md
+++ b/net-workstream/features-1.4.md
@@ -7,7 +7,7 @@ together is desired while updating the virtio net interface.
 
 # 2. Summary
 1. Device counters visible to the driver
-2. Low latency tx virtqueue for PCI transport
+2. Low latency tx and rx virtqueues for PCI transport
 
 # 3. Requirements
 ## 3.1 Device counters
@@ -129,3 +129,46 @@ struct vnet_data_desc desc[2];
 
 9. A flow filter virtqueue also similarly need the ability to inline the short flow
    command header.
+
+### 3.2.2 Low latency rx virtqueue
+0. Design goal:
+   a. Keep packet metadata and buffer data together which is consumed by driver
+      layer and make it available in a single cache line of cpu
+   b. Instead of having per packet descriptors which is complex to scale for
+      the device, supply the page directly to the device to consume it based
+      on packet size
+1. The device should be able to write a packet receive completion that consists
+   of struct virtio_net_hdr (or similar) and a buffer id using a single DMA write
+   PCIe TLP.
+2. The device should be able to perform DMA writes of multiple packets
+   completions in a single DMA transaction up to the PCIe maximum write limit
+   in a transaction.
+3. The device should be able to zero pad packet write completion to align it to
+   64B or CPU cache line size whenever possible.
+4. An example of the above DMA completion structure:
+
+```
+/* Constant size receive packet completion */
+struct vnet_rx_completion {
+   u16 flags;
+   u16 id; /* buffer id */
+   u8 gso_type;
+   u8 reserved[3];
+   le16 gso_hdr_len;
+   le16 gso_size;
+   le16 csum_start;
+   le16 csum_offset;
+   u16 reserved2;
+   u64 timestamp; /* explained later */
+   u8 padding[];
+};
+```
+5. The driver should be able to post constant-size buffer pages on a receive
+   queue which can be consumed by the device for an incoming packet of any size
+   from 64B to 9K bytes.
+6. The device should be able to know the constant buffer size at receive
+   virtqueue level instead of per buffer level.
+7. The device should be able to indicate when a full page buffer is consumed,
+   which can be recycled by the driver when the packets from the completed
+   page is fully consumed.
+8. The device should be able to consume multiple pages for a receive GSO stream.
-- 
2.26.2


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

