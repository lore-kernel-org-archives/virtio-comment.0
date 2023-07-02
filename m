Return-Path: <virtio-comment-return-6674-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B317EB64DA
	for <virtio-comment@archiver.kernel.org>; Sun,  2 Jul 2023 23:44:58 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 9E5977AEC6
	for <virtio-comment@archiver.kernel.org>; Sun,  2 Jul 2023 23:44:49 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9095998658F
	for <virtio-comment@archiver.kernel.org>; Sun,  2 Jul 2023 23:44:49 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 84D3498643D; Sun,  2 Jul 2023 23:44:49 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 717AF986721;
	Sun,  2 Jul 2023 23:44:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A/Bt6iEJUZHt0vYofsFmL4LCItewxKJXRdHz4svAQ3MliXYZQwiEXZtrFs7eDGGYmlm1X+GFJtTlHCdY5ozGDy1Uw2Qjxje8Cwbv6eKb9F546DGTgvkCsXBAB1BhIcGRm5h2VPQwDb7YrIasw+qTO7JsegEPsYTAeI01THsmhDzjTt8xHkUGUzNy8/NFf45O3DMKeT40SDhkXMTcW/w/s9ObCEARf0YXMvlyTChtSmQ06Q+XB70ZYYhSlAgNjABYjdO6W8AySqhFVbx2GqssoFDHl234xPK/ujRWsazUAd+2/EkPLz9BGXjkeHuEL6cL1R5aFFsw9537Nr5I+F8FLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RLy2rRx47+nczc4C2mW7Uezr9JCTy8kDcR8SNYZ0D54=;
 b=c7XkWNOdBQw4lAgtgVTiFx6zx4SuxZSDwUItPZS0Y9VGA/pKOye5ZSXcB1PMRi4Ti+pOAFQgK/FJ+GxbCXFyjH8uxVcQ5w9tB2NH8mOyXlmmZGU67kMuUrOvuClMtb4iOppdaxnvoG4wvIynnG/sd2PNx9PL4Sgli25veoFxGE2tu8XjnD8sPAbGC8oQYeVzSzd8EH3V5KSJOKC4AmdyvhtN4Ivo3wycaAEZJIH3XDdvothzG/5iI/0LS13N0mCCNkI1yL7C7so6JgT89N7Bpkp268z28aIVEebMLtJt/zjI6/UOJckFd8Tdau/A2oHVxvHhZ/dxep/EFUS4lmMtUQ==
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
To: <virtio-comment@lists.oasis-open.org>
CC: <shahafs@nvidia.com>, <hengqi@linux.alibaba.com>,
	<virtio@lists.oasis-open.org>, Parav Pandit <parav@nvidia.com>
Date: Mon, 3 Jul 2023 02:44:08 +0300
Message-ID: <20230702234410.47546-6-parav@nvidia.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20230702234410.47546-1-parav@nvidia.com>
References: <20230702234410.47546-1-parav@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT098:EE_|CH2PR12MB5017:EE_
X-MS-Office365-Filtering-Correlation-Id: 912b4345-d92a-41d2-bb67-08db7b564885
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	37P/zDGVfgXVK90rsAXxf8+47tMGojQOV56cumS2Al8vl9TWG2edtnUxwEAXNqddq/VqA4nwb1u0IhPXuuSkbmRPumo4d7awPSTkhtsnXF5YGCDR+Wle0kt1SC5+0QheNTQur/sAsw2bXh8SmCfs7TaK/MpFdi6OjcjDBEhdxQKrG5op3xUNOJNdxZOoEd68qqBxNEXij/cL7ftQhyMqDZOLlXoTrBMRrL2XDtCslkkDsC+QQTlEq2X1LK+9xCHoM4RDlyCdFf69c0AaW9nuOt/NyqPkjtA/LWX5Rdom2wCiaU+b1yO+Of3tP6GNxZ5qNIcaBbhA2OzSx7+spyS6PwAEbOhC5x0hfKuBaY4xgEKbcPLQkZqE7uz2IpVcSGujZX7haRNL+kjtM91lDMx5Od/s14Ki5X/hyqLmGmjA5NKMHh0OlsuF82WxNV8rFd/HpNDDho8OyQzoBl4d/64nuww9VvoAApAeZZaufp935E7UsNwaUNMQ2g7NzSkJaeylTXIVBVcEyRWD2ZtujYCC0uGBgyV6RH36TKXVvwo/eUloJ2XRKtuGHBuxawckG+lGC0Fw0hFqfy69mjBD2nZRVuqH0QWakyXuUj+J4OEgmmGkP1NKaqKrtq6T0WkVooU+22swsT2pXvrRubXEUSd3CVJLwIa0PFZM3fBAKrERp1HY31tacWQtl+si8CxQFg64Y3xbttX5vnx2NU2U4jtDlbTC5nhnGV0+LcUb8sYXA2NrFvoDxXiyLNQXXVhLaOS+
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(346002)(136003)(396003)(451199021)(40470700004)(46966006)(36840700001)(186003)(82740400003)(336012)(426003)(478600001)(16526019)(26005)(1076003)(107886003)(86362001)(2616005)(6666004)(36860700001)(4326008)(6916009)(316002)(70206006)(70586007)(54906003)(7636003)(356005)(47076005)(83380400001)(5660300002)(41300700001)(40460700003)(2906002)(40480700001)(36756003)(8676002)(8936002)(82310400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2023 23:44:31.6247
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 912b4345-d92a-41d2-bb67-08db7b564885
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT098.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB5017
Subject: [virtio-comment] [PATCH REQUIREMENTS v2 5/7] net-features: Add n-tuple receive flow filters requirements

Add virtio net device requirements for receive flow filters.

Signed-off-by: Parav Pandit <parav@nvidia.com>
---
changelog:
v1->v2:
- split setup and operations requirements
- added design goal
- worded requirements more precisely
v0->v1:
- fixed comments from Heng Li
- renamed receive flow steering to receive flow filters
- clarified byte offset in match criteria
---
 net-workstream/features-1.4.md | 98 ++++++++++++++++++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/net-workstream/features-1.4.md b/net-workstream/features-1.4.md
index a34556c..ae40ee8 100644
--- a/net-workstream/features-1.4.md
+++ b/net-workstream/features-1.4.md
@@ -9,6 +9,7 @@ together is desired while updating the virtio net interface.
 1. Device counters visible to the driver
 2. Low latency tx and rx virtqueues for PCI transport
 3. Virtqueue notification coalescing re-arming support
+4  Virtqueue receive flow filters (RFF)
 
 # 3. Requirements
 ## 3.1 Device counters
@@ -169,3 +170,100 @@ struct vnet_rx_completion {
    generated notification. 
 2. When the driver enables the notification coalescing reporting, the device
    to notify again if notification coalescing conditions are met.
+
+## 3.4 Virtqueue receive flow filters (RFF)
+0. Design goal:
+   To filter and/or to steer packet based on specific pattern match to a
+   specific context to support application/networking stack driven receive
+   processing.
+1. Two use cases are: to support Linux netdev set_rxnfc() for ETHTOOL_SRXCLSRLINS
+   and to support netdev feature NETIF_F_NTUPLE aka ARFS.
+
+### 3.4.1 control path
+1. The number of flow filter operations/sec can range from 100k/sec to 1M/sec
+   or even more. Hence flow filter operations must be done over a queueing
+   interface using one or more queues.
+2. The device should be able to expose one or more supported flow filter queue
+   count and start vq index to the driver.
+3. High rate flow filter operations are supposed to operate that can make device
+   implementation of it in hardware accelerated manner. Hence transporting them
+   using a flow vq being different than control vq is needed.
+3. The driver should be able to query such capability over a DMA interface to
+   save on the device memory of the device config space region.
+4. Since flow filters are enabled much later in the driver life cycle, driver
+   will likely create these queues when flow filters are enabled.
+5. The device should be able to expose if it support filter masks.
+6. The driver may want to have priority among group of flow rules; to facilitate
+   the device support grouping flow filter rules by a notion of a group. Each
+   group defines priority in processing flow.
+
+### 3.4.2 flow operations path
+1. The driver should be able to define a receive packet match criteria, an
+   action and a destination for a packet. For example, an ipv4 packet with a
+   multicast address to be steered to the receive vq 0. The second example is
+   ipv4, tcp packet matching a specified IP address and tcp port tuple to
+   steered to receive vq 10.
+2. The match criteria should include exact tuple fields well-defined such as mac
+   address, IP addresses, tcp/udp ports, etc.
+3. The match criteria should also optionally include the field mask.
+4. The match criteria may optionally also include specific packet byte offset
+   pattern, match length, mask instead of RFC defined fields.
+   length, and matching pattern, which may not be defined in the standard RFC.
+5. Action includes (a) dropping or (b) forwarding the packet.
+6. Destination location is a receive virtqueue index or rss context.
+7. The device should process RFF rules before RSS rules, i.e., when there is a
+   miss on the RFF rule, RSS rule applies if RSS configuration exists.
+8. If multiple rules are programmed which has overlapping attributes for a
+   received packet, the driver to define the location/priority of the rule.
+9. The filter rule add/delete entries are usually short in size of few tens of
+   bytes, for example IPv6 + TCP tuple would be 36 bytes, and ops/sec rate is
+   high, hence supplying fields inside the queue descriptor is preferred for
+   up to a certain fixed size, say 56 bytes.
+10. The driver should be able to query flow filter table entries programmed in
+    the device by the flow id.
+11. The driver should be able to add the entry for attributes (a) match
+    criteria, (b) action, (c) destination and (d) assign a unique id of 32 bits.
+12. The driver should be able to delete the flow filter rule entry via a unique id.
+13. A group member device should be able to query the attributes of the flow
+    filter rules that device supports.
+14. The driver and group owner driver should be able to query supported device
+    limits for the flow rule entries.
+15. Filter rule operation completion to be reported via a completion queue
+    interface.
+
+### 3.4.3 interface example
+
+7. Flow filter capabilities to query using a DMA interface:
+
+```
+struct flow_filter_capabilities {
+	u8 flow_groups;
+	u16 num_flow_filter_vqs;
+	u16 start_vq_index;
+	u32 max_flow_filters_per_group;
+	u32 max_flow_filters;
+	u64 supported_packet_field_mask_bmap[4];
+};
+
+```
+
+1. Flow filter rule add/modify, delete:
+
+struct virtio_net_rff_add_modify {
+	u8 flow_op;
+	u8 group_id;
+	u8 padding[2];
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
+	u8 group_id;
+	u8 padding[2];
+	le32 flow_id;
+};
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

