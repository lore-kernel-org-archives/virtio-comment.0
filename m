Return-Path: <virtio-comment-return-7127-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B65BC001DE
	for <virtio-comment@archiver.kernel.org>; Tue, 15 Aug 2023 07:46:38 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 8651455C3
	for <virtio-comment@archiver.kernel.org>; Tue, 15 Aug 2023 07:46:37 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7C13A9865D9
	for <virtio-comment@archiver.kernel.org>; Tue, 15 Aug 2023 07:46:37 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 72284986371; Tue, 15 Aug 2023 07:46:37 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 436B99863A5;
	Tue, 15 Aug 2023 07:46:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YE2g1gg6viNtVdEd0hGLeS7p8/gG95PMocD46ZoXx77dig3m/go0fmT3ay1B+ndeSOXSLN9w9EGd/D35K8QKsfOpn5w/9+bKffV5X15lWtpY6TLP3Rv29sBX1kOfcQ2GOGTteAuRwdzD1lnFbLF5wk5gf9ccMUCF6KokOKuT1xvIY8gMx6hpmsy2DCIX017dgaNN9ZvmIbPDY57m09jQZD9FuBy4LYN/sqUmul6nHktdTkI4DSG/GoGCyrxxsEpcKYRWq29bC0HZRIJk8sA/v/rPVgbsqgRdar0YaRSe7F9Gyq8Z3ira8Wz7c08A1u4KrQMYVf2upEjTFmwGyDZY/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B5ammFmYEz1Jy7XiQXwr5j0zYSCva0XKzNKYV6fxPqk=;
 b=MmYoTccYUgluXIjR5pSSTECD0T0MCx/h98qzLtVk50szkUpPrqM/bzxz1i37+iupC3KS8DfMCeCSranS362u7+RTMvUW/S8NRUwrkjiBs5+Sr4zLv7BwWbyuR+cBW/9En33o3iebD6jxT05cY6OSsbjhlegv92ck9k1mLbX4TCUBXv+iRudxZB2NknVHby8BJE0YsnI4JZgSWXQAX3dmDNrOjEVpxk9jCPvGKbbIIYz6ONDi/PAbBSWscfUgN1Mw6+mdE4nv2+7qUnMqcaMED32EFnRAcmXxeSQI//jeF4tphCJLUTgV9L5VYpw33Dc6fRSuOP64NC/YbvN/OYH7FA==
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
To: <virtio-comment@lists.oasis-open.org>, <hengqi@linux.alibaba.com>,
	<david.edmondson@oracle.com>, <xuanzhuo@linux.alibaba.com>,
	<sburla@marvell.com>
CC: <shahafs@nvidia.com>, <virtio@lists.oasis-open.org>, Parav Pandit
	<parav@nvidia.com>
Date: Tue, 15 Aug 2023 10:45:55 +0300
Message-ID: <20230815074600.473933-3-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE30:EE_|MW4PR12MB7437:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f777e86-9e89-4e29-769d-08db9d63bac2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	F6gnn+UJ3B/tDWVZ1JShRQjAu4qwPFMSZHi8B8xkw2g08X67mqaKjeGPoICfcnsXMsMUhfCayoYZ5ppzkP6L2fRcGDiqGDPimv8ISuObT0JyZzJ39kU1H5EOsl46vZpAkg1QiatqGgemc89ly6JU+nX4c++SRkUA0xT/h02UVW3KwBH2Jbx4sp2uBgjV60tBhn8GSSivGgfCO46ykgWcdnK/I9pUDNl8cyqqWsG/qPju87SqzSQwditwOXeSk0zGs2aNYjq8fGOiT0iOYyOD1Jal7VQyqgJj0BotySOdkGoYuTAGsSg8cDb1bKwHjllUaHXSJppFcYS483wLdjI+3zKTkt/AkBCfBCrno/cFcHQReNWdAwX1U4kgOlmlebnsljtrPTTJIouvEU0cOHAFtnDqRiDvSLYrA5FaGviZRiXRNqsja1QRJZ1xB8whfHMZtTjJPCw/GMK9Ptl8Eb+u5Hqm1XPmAbfdZvs4aqqU5WB/XpGlN5dyN6y6DeEFYnNYlgd3wYYSIgWs6gFEPyBXtFXEgrUWY9Jg5NdleDopPEjsY/iFfiEhB+1VASm9YFerGwrr5PS28a1dazSbYXcLZ6ofjS6eUTEGqFB10kNrR7+1JnHGPWVgyZ6ctYBSldWbQEP36rFHn5svnw9U45y2QEimDwTx9yeXX1rOxRp6cRIL/OEZ2Gh16Y0WzeBbqC13UI4NZyWkPb3qs2/+KnWOWg9IVoMoIfNkiDh3OKBJ+m9zDpW4m+qJYFPSEWivqiO6qkKtBQtjjBYNM9t04Q2/Hw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(39860400002)(346002)(396003)(1800799006)(186006)(82310400008)(451199021)(36840700001)(40470700004)(46966006)(40480700001)(26005)(40460700003)(1076003)(107886003)(2616005)(2906002)(7636003)(966005)(41300700001)(36756003)(8936002)(8676002)(4326008)(356005)(82740400003)(70206006)(70586007)(110136005)(316002)(54906003)(5660300002)(6666004)(478600001)(83380400001)(36860700001)(16526019)(47076005)(336012)(426003)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2023 07:46:26.2593
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f777e86-9e89-4e29-769d-08db9d63bac2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE30.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7437
Subject: [virtio-comment] [PATCH requirements v4 2/7] net-features: Add low latency transmit queue requirements

Add requirements for the low latency transmit queue.

Signed-off-by: Parav Pandit <parav@nvidia.com>
---
chagelog:
v3->v4:
- Addressed comments from David
- rewrote timestamp and completions pcie transcation requirement
v1->v2:
- added generic requirement to inline the request content
  along with the descriptor for non virtio-net devices
- added requirement to inline the header content along
  with the descriptor for virtio flow filter queue as two
  features are similar
v0->v1:
- added design goals for which requirements are added
---
 net-workstream/features-1.4.md | 88 ++++++++++++++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/net-workstream/features-1.4.md b/net-workstream/features-1.4.md
index c2b1cc8..40fa07f 100644
--- a/net-workstream/features-1.4.md
+++ b/net-workstream/features-1.4.md
@@ -7,6 +7,7 @@ together is desired while updating the virtio net interface.
 
 # 2. Summary
 1. Device counters visible to the driver
+2. Low latency tx virtqueue for PCI transport
 
 # 3. Requirements
 ## 3.1 Device counters
@@ -41,3 +42,90 @@ together is desired while updating the virtio net interface.
 More counters discussed in [1].
 
 [1] https://lists.oasis-open.org/archives/virtio-comment/202308/msg00176.html
+
+## 3.2 Low PCI latency virtqueues
+### 3.2.1 Low PCI latency tx virtqueue
+0. Design goal
+   a. Reduce PCI access latency in packet transmit flow
+   b. Avoid O(N) descriptor parser to detect a packet stream to simplify device
+      logic
+   c. Reduce number of PCI transmit completion transactions and have unified
+      completion flow with/without transmit timestamping
+   d. Avoid partial cache line writes on transmit completions
+
+1. Packet transmit descriptor should contain data descriptors count without any
+   indirection and without any O(N) search to find the end of a packet stream.
+   For example, a packet transmit descriptor (called vnet_tx_hdr_desc
+   subsequently) to contain a field num_next_desc for the packet stream
+   indicating that a packet is located in N data descriptors.
+
+2. Packet transmit descriptor should contain segmentation offload-related fields
+   without any indirection. For example, packet transmit descriptor to contain
+   gso_type, gso_size/mss, header length, csum placement byte offset, and
+   csum start.
+
+3. Packet transmit descriptor should be able to place a small size packet that
+   does not have any L4 data after the vnet_tx_hdr_desc in the virtqueue memory.
+   For example a TCP ack only packet can fit in a descriptor memory which
+   otherwise consume more than 25% of metadata to describe the packet.
+
+4. Packet transmit descriptor should be able to place a full GSO header (L2 to
+   L4) after header descriptor and before data descriptors. For example, the
+   GSO header is placed after struct vnet_tx_hdr_desc in the virtqueue memory.
+   When such a GSO header is positioned adjacent to the packet transmit
+   descriptor, and when the GSO header is not aligned to 16B, the following
+   data descriptor to start on the 8B aligned boundary.
+
+5. An example of the above requirements at high level is:
+
+```
+struct virtio_packed_q_desc {
+   /* current desc for reference */
+   u64 address;
+   u32 len;
+   u16 id;
+   u16 flags;
+};
+
+/* Constant size header descriptor for tx packets */
+struct vnet_tx_hdr_desc {
+   u16 flags; /* indicate how to parse next fields */
+   u16 id; /* desc id to come back in completion */
+   u8 num_next_desc; /* indicates the number of the next 16B data desc for this
+		      * buffer.
+		      */
+   u8 gso_type;
+   le16 gso_hdr_len;
+   le16 gso_size;
+   le16 csum_start;
+   le16 csum_offset;
+   u8 inline_pkt_len; /* indicates the length of the inline packet after this
+		       * desc
+		       */
+   u8 reserved;
+   u8 padding[];
+};
+
+/* Example of a short packet or GSO header placed in the desc section of the vq
+ */
+struct vnet_tx_small_pkt_desc {
+   u8 raw_pkt[128];
+};
+
+/* Example of header followed by data descriptor */
+struct vnet_tx_hdr_desc hdr_desc;
+struct vnet_data_desc desc[2];
+
+```
+
+6. Ability to zero pad the transmit completion when the transmit completion is
+   shorter than the CPU cache line size.
+
+7. Ability to write per packet timestamp and also write multiple
+   transmit completions using single PCIe transcation.
+
+8. A generic feature of the virtqueue, to contain such header data inline for virtio
+   devices other than virtio-net.
+
+9. A flow filter virtqueue also similarly need the ability to inline the short flow
+   command header.
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

