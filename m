Return-Path: <virtio-comment-return-7198-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96CFDC71133
	for <virtio-comment@archiver.kernel.org>; Fri, 18 Aug 2023 04:36:58 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 180F9613CF
	for <virtio-comment@archiver.kernel.org>; Fri, 18 Aug 2023 04:36:58 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0AA77986651
	for <virtio-comment@archiver.kernel.org>; Fri, 18 Aug 2023 04:36:58 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 0101C986447; Fri, 18 Aug 2023 04:36:58 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 681999866DE;
	Fri, 18 Aug 2023 04:36:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NzP68dJPBRjYvXOjI2XJbHvxcr52v5SNHtaX+EKe0BdkVjfSjZGew2ke3jOKfkCFysonry6LxpBEXDABr8KvGH5tCrWgNNhA9x0gCx7G5E6zBIkIzNH16THjy8/6quJq/VGMI7G1cyGBR+ugHPA3b/JRqox9vgNoluCBeHffYbSes4is/KQnlvbjIeI7qrYfK/OrnVF/CnJlldiXiWQzEc1h95Odm8+ltLACOEUZKEgvkz6H8JeUBbM3376HHM8Nnu7fB7ds4syPGQVMfuLa2FAgwJllK6uFRDfuXRYqHbboNeKywEA7s1Sq8zdYxtqXM3keC3cxMyD2X0/Q88yafg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CxNCdPY5BZmHVLT40xuTBvMYnCcPg8Eo6G/468ekyJM=;
 b=a5jJv2jMxS3vVWYEYiFHsPhTKtvCRrnnn5yAcbEwt5y4fSRIf+YhmfCaJfUHucxJJ4ftPbhZ9M007yMM8FPT7A/R+fdtaPtIiZjQKXbEUzqGSHtQfiq+iOhlBwPcrBBlh9CKY5uZZKI7lni2pI85Rh0ZbdAIYZvT+bX00tAFPkG6Ion8zclx8GKziNEUHMETndZ4mEqQLLYi/tEYmZNUt7bra+Y4eb+GFVs70LB57MkUMf/m/lqHl1bGjSwM2I/3c32wo+f4dx0j8hyDpCoSgy3oVjJZbl4DQVhiSfQ1K+JNkj71RwRqo/7cL1Q2GcuEfrXTYQubaOlKysa9rwRPaw==
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
Date: Fri, 18 Aug 2023 07:35:55 +0300
Message-ID: <20230818043557.496964-6-parav@nvidia.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20230818043557.496964-1-parav@nvidia.com>
References: <20230818043557.496964-1-parav@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.37]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE34:EE_|DM6PR12MB4204:EE_
X-MS-Office365-Filtering-Correlation-Id: b71758c9-1714-4950-4a26-08db9fa4b176
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0wa0QaV+gkzRzxElxpFjRIoURd8jdnHzOCHdzYytYruP9Mi6QHS0ecQekcQTsMOsxh7pUMgm3/HvDaGqRLWXnVNZvCZH+n6b9GBekWRCDo8+dBhBSwQf+hEq6WnRLd2HrMD/uSi4VWLJ9qZXrgG7uz5IRmf9vGuORNOHn3s+PNG/6iZ72wZa33xkbgf9q/7h6wxLv0j9XO7fdFhflKE55e3zQo7oo28pj2x7iAw9c2QRXFl3Jb44u1pTNeedKLKIBUyt/dObIj3ja8H8p0G5wTaxH+Q00rgRD6/X7fj5/+4AVK1phViYRw5V9NtowORHJs/lsDFjxDXTRe/JM0BR/+vYqKhSS6lUIeRGL435i1/n3ImRb/FQeW6Y7RHAFmPejeJCmAO5v5KfnZd9gi8U1rMWw3ouhioa6V36KOxMhCDthw30JGF94GvaJA3RcBySKDE1n2fm0nkEnMI4gKDQ9nKB2lVakbsTdFixyZoqCrwWy8lUtgQgAxyu1NP5hsY/0QO6VFnV6kjPqMk0b70pqg7I0SATYfVol0Ukxe5ZLt+bdow3Zb5dxMrpl6iAfhvAte7BD078BWhMKR3IvjqSQgT8/18SyJFaBxD60omUsRCDAfx3vxalsp5pBMHP8n14RDKEiHGeYVLV2ptQW/+QOjdu3ERWsDQM+QdVk7z+D59fxvErmbHY8JLvJ6Wi1YMECWAL5/JRPCv5bpRBO1GavVayTmiZj9Af+30znkNeL4+48azzaXghlwBZmM2Vr7z3
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(376002)(136003)(396003)(39860400002)(451199024)(1800799009)(82310400011)(186009)(40470700004)(36840700001)(46966006)(86362001)(36756003)(82740400003)(356005)(7636003)(40480700001)(107886003)(2616005)(5660300002)(110136005)(16526019)(70586007)(478600001)(70206006)(6666004)(54906003)(316002)(26005)(1076003)(4326008)(8676002)(8936002)(41300700001)(40460700003)(47076005)(336012)(36860700001)(83380400001)(426003)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2023 04:36:30.2735
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b71758c9-1714-4950-4a26-08db9fa4b176
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE34.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4204
Subject: [virtio-comment] [PATCH requirements v5 5/7] net-features: Add n-tuple receive flow filters requirements

Add virtio net device requirements for receive flow filters.

Signed-off-by: Parav Pandit <parav@nvidia.com>
Signed-off-by: Satananda Burla <sburla@marvell.com>
Signed-off-by: Heng Qi <hengqi@linux.alibaba.com>
---
changelog:
v4->v5:
- Rewrote cvq and flow filter vq mutual exclusive text
- added cvq command to enable flow filters on cvq
- made commands more refined for priority, opcode and more
- Addressed comments from Heng
- restructured interface commands
v3->v4:
- Addressed comments from Satananda, Heng, David
- removed context specific wording, replaced with destination
- added group create/delete examples and updated requirements
- added optional support to use cvq for flor filter commands
- added example of transporting flow filter commands over cvq
- made group size to be 16-bit
- added concept of 0->n max flow filter entries based on max count
- added concept of 0->n max flow group based on max count
- split field bitmask to separate command from other filter capabilities
- rewrote rx filter processing chain order with respect to existing
  filter commands and rss
- made flow_id flat across all groups
v1->v2:
- split setup and operations requirements
- added design goal
- worded requirements more precisely
v0->v1:
- fixed comments from Heng Li
- renamed receive flow steering to receive flow filters
- clarified byte offset in match criteria
---
 net-workstream/features-1.4.md | 163 +++++++++++++++++++++++++++++++++
 1 file changed, 163 insertions(+)

diff --git a/net-workstream/features-1.4.md b/net-workstream/features-1.4.md
index 72b4132..330949c 100644
--- a/net-workstream/features-1.4.md
+++ b/net-workstream/features-1.4.md
@@ -9,6 +9,7 @@ together is desired while updating the virtio net interface.
 1. Device counters visible to the driver
 2. Low latency tx and rx virtqueues for PCI transport
 3. Virtqueue notification coalescing re-arming support
+4  Virtqueue receive flow filters (RFF)
 
 # 3. Requirements
 ## 3.1 Device counters
@@ -181,3 +182,165 @@ struct vnet_rx_completion {
    notifications until the driver rearms the notifications of the virtqueue.
 2. When the driver rearms the notification of the virtqueue, the device
    to notify again if notification coalescing conditions are met.
+
+## 3.4 Virtqueue receive flow filters (RFF)
+0. Design goal:
+   To filter and/or to steer packet based on specific pattern match to a
+   specific destination to support application/networking stack driven receive
+   processing.
+1. Two use cases are: to support Linux netdev set_rxnfc() for ETHTOOL_SRXCLSRLINS
+   and to support netdev feature NETIF_F_NTUPLE aka ARFS.
+
+### 3.4.1 control path
+1. The number of flow filter operations/sec can range from 100k/sec to 1M/sec
+   or even more. Hence flow filter operations must be done over a queueing
+   interface using one or more queues.
+2. The device should be able to expose one or more supported flow filter queue
+   count and its start vq index to the driver.
+3. As each device may be operating for different performance characteristic,
+   start vq index and count may be different for each device. Secondly, it is
+   inefficient for device to provide flow filters capabilities via a config space
+   region. Hence, the device should be able to share these attributes using
+   dma interface, instead of transport registers.
+4. Since flow filters are enabled much later in the driver life cycle, driver
+   will likely create these queues when flow filters are enabled.
+5. Flow filter operations are often accelerated by device in a hardware. Ability
+   to handle them on a queue other than control vq is desired. This achieves near
+   zero modifications to existing implementations to add new operations on new
+   purpose built queues (similar to transmit and receive queue). Some devices
+   may not support flow filter queues and may want to support flow filter operations
+   over existing cvq, this gives the ability to utilize an existing cvq.
+   Therefore,
+   a. Flow filter queues and flow filter commands on cvq are mutually exclusive.
+   b. When flow filter queues are supported, the driver should use the flow filter
+      queues flow filter operations.
+      (Since cvq is not enabled for flow filters, any flow filter command coming
+      on cvq must fail).
+   c. If driver wants to use flow filters over cvq, driver must explicitly
+      enable flow filters on cvq via a command, when it is enabled on the cvq
+      driver cannot use flow filter queues. This eliminates any synchronization
+      needed by the device among different types of queues.
+6. The filter masks are optional; the device should be able to expose if it
+   support filter masks.
+7. The driver may want to have priority among group of flow entries; to facilitate
+   the device support grouping flow filter entries by a notion of a flow group.
+   Each flow group defines priority in processing flow.
+8. The driver and group owner driver should be able to query supported device
+   limits for the receive flow filters.
+9. Query the flow filter capabilities of the member device by the owner device
+   using administrative command.
+
+### 3.4.2 flow operations path
+1. The driver should be able to define a receive packet match criteria, an
+   action and a destination for a packet. For example, an ipv4 packet with a
+   multicast address to be steered to the receive vq 0. The second example is
+   ipv4, tcp packet matching a specified IP address and tcp port tuple to
+   be steered to receive vq 10.
+2. The match criteria should include exact tuple fields well-defined such as mac
+   address, IP addresses, tcp/udp ports, etc.
+3. The match criteria should also optionally include the field mask.
+4. Action includes (a) dropping or (b) forwarding the packet.
+5. Destination is a receive virtqueue index.
+6. Receive packet processing chain is:
+   a. filters programmed using cvq commands VIRTIO_NET_CTRL_RX,
+      VIRTIO_NET_CTRL_MAC and VIRTIO_NET_CTRL_VLAN.
+   b. filters programmed using RFF functiionality.
+   c. filters programmed using RSS VIRTIO_NET_CTRL_MQ_RSS_CONFIG command.
+   Whichever filtering and steering functionality is enabled, they are applied
+   in the above order.
+7. If multiple entries are programmed which has overlapping filtering attributes
+   for a received packet, the driver to define the location/priority of the entry.
+8. The filter entries are usually short in size of few tens of bytes,
+   for example IPv6 + TCP tuple would be 36 bytes, and ops/sec rate is
+   high, hence supplying fields inside the queue descriptor is preferred for
+   up to a certain fixed size, say 96 bytes.
+9. A flow filter entry consists of (a) match criteria, (b) action,
+    (c) destination and (d) a unique 32 bit flow id, all supplied by the
+    driver.
+10. The driver should be able to query and delete flow filter entry
+    by the flow id.
+
+### 3.4.3 interface example
+
+1. Flow filter capabilities to query using a DMA interface such as cvq
+using two different commands.
+
+```
+struct virtio_net_rff_cmd {
+	u8 class; /* RFF class */
+	u8 commands; /* 0 = query cap
+		      * 1 = query packet fields mask
+		      * 2 = enable flow filter operations over cvq
+		      * 3 = add flow group
+		      * 4 = del flow group
+		      * 5 = flow filter op.
+		      */
+	u8 command-specific-data[];
+};
+
+/* command 1 (query) */
+struct flow_filter_capabilities {
+	le16 start_vq_index;
+	le16 num_flow_filter_vqs;
+	le16 max_flow_groups; /* valid group id = max_flow_groups - 1 */
+	le16 max_group_priorities; /* max priorities of the group */
+	le32 max_flow_filters_per_group;
+	le32 max_flow_filters; /* max flow_id in add/del 
+				* is equal = max_flow_filters - 1.
+				*/
+	u8 max_priorities_per_group;
+	u8 cvq_supports_flow_filters_ops;
+};
+
+/* command 2 (query packet field masks) */
+struct flow_filter_fields_support_mask {
+	le64 supported_packet_field_mask_bmap[1];
+};
+
+```
+
+2. Group add/delete cvq commands:
+
+```
+/* command 3 */
+struct virtio_net_rff_group_add {
+	le16 priority;	/* higher the value, higher priority */
+	le16 group_id;
+};
+
+
+/* command 4 */
+struct virtio_net_rff_group_delete {
+	le16 group_id;
+
+```
+
+3. Flow filter entry add/modify, delete over flow vq:
+
+```
+struct virtio_net_rff_add_modify {
+	u8 flow_op;
+	u8 priority;	/* higher the value, higher priority */
+	u16 group_id;
+	le32 flow_id;
+	struct match_criteria mc;
+	struct destination dest;
+	struct action action;
+
+	struct match_criteria mask;	/* optional */
+};
+
+struct virtio_net_rff_delete {
+	u8 flow_op;
+	u8 padding[3];
+	le32 flow_id;
+};
+
+```
+
+### 3.4.4 For incremental future
+a. Driver should be able to specify a specific packet byte offset, number
+   of bytes and mask as math criteria.
+b. Support RSS context, in addition to a specific RQ.
+c. If/when virtio switch object is implemented, support ingress/egress flow
+   filters at the switch port level.
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

