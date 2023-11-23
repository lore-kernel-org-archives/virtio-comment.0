Return-Path: <virtio-comment-return-8565-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D593CC61D85
	for <virtio-comment@archiver.kernel.org>; Thu, 23 Nov 2023 09:22:07 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 3A85F3E574
	for <virtio-comment@archiver.kernel.org>; Thu, 23 Nov 2023 09:22:07 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2A643986941
	for <virtio-comment@archiver.kernel.org>; Thu, 23 Nov 2023 09:22:07 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 1ED0B9868A2; Thu, 23 Nov 2023 09:22:07 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1178C9868A4
	for <virtio-comment@lists.oasis-open.org>; Thu, 23 Nov 2023 09:22:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P0yZ3xBpVvxiCgvni0uzUyALmDIyU7wBiW1Rgf1jD+p/I9Ne0m+LyUJZefvi6EPATa6bZXPHQVBhAPbPkYu7mmQgkqsBtqhpyXfnJMY59871yosUr+zkrbaKPEFvpwXbYz8CeBDM5pdF+2DtFukAXHz58ZxkOYVX2ObyGNOd/+24D+1X/Eaiu/6/b+cZCwLTJRNfzQQW3zFWBPXcaQw+BfnxxZ3TYW4f+pmzO17zTtfQ/Tb1kpTcvdiHPX53UxW5Kt21YQf9Fbmtx01cBsotWQcbCGRoCQXAWaB+XzFVadHX4n0jz1MmqDEvtT8km8fa2yxtpIJ23m2JJILgP6iTIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h0MzVgbve4oEuOdblEvuKMLB6HHCwjZXcmXFE7P2gn8=;
 b=FA/B/zOKTi+3md1szsIM5jrQp7V4jRk5vIb2paKIEAkGv3cB7DJyLMkWApAm4DrDgA2xQU3iSM7RzhLJgbcdX18ZCst3HhyCFvq0K8GHuG3iWCU+kE4CmK1Qd1vfqiD1UuPVxXVu83NUi/PktlLgGKJc5XaWDw/NBmn3ub77aaERf2J8CjvkRaq/D0rPs56P6J/D/C0Nvm3PI2MUxckJZLWXHYTN5wvYrEy4jnh197Cp43upAPP9blNFSVJBv8rMgngSwIFkIiZVfNWEUszQvTouFl074jumeewwLztOKPf7Yux1h/63A0ucqsesY/31omJcVfuYLHAMVGW5yIQuyg==
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
	<xuanzhuo@linux.alibaba.com>, Parav Pandit <parav@nvidia.com>
Date: Thu, 23 Nov 2023 11:21:14 +0200
Message-ID: <20231123092119.2718448-1-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529F:EE_|DS0PR12MB8200:EE_
X-MS-Office365-Filtering-Correlation-Id: 72233c8d-cad7-4e81-3638-08dbec05a6d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	i2FkM/VQN/QYzrqJTLhNj/FDK7yXNj0u6LA6dEVYLq9AYAB/6QTijW2X+/AL5zSq5x9TC/aCXAxFS+B545OgJJDeGQYMFs/G2J86xlGWAc+bkPJGQKPPdaW3kvfI8m5AvkwhCi4S5tu9Rc5xsHaKkmvBQfuExGOsL1FYEvOTueAxP6ToWh93cSVTlLzbWrtWTkkKuPUME2ab7XA8LmExqAREwI7nQhMm04zzkQt6FgP8bok5IGqTvNvdre2goVeBTwKPpknDog5JkzJdZuvHkQixlLW5fskdJh4fFAnm0KgHgQMum2WujRAv3IzedgbVCAeZ/GazQq4QrAcfGowO1CLAxDoysb6dhm0aedd4VCylo8H/WQoj7enfWUsPgVq0t27Io6gb8huaqXthX0h5cu+SUH192m8KdZljtvbUAG+103MUEVVnr2f513mfq9cOk+TefcYh3HghkxmCN20kxwikE5bux6E28ZKe/L2TiTRwivdeEl4dufKF2N2ZRSHNKk/wcx8VFZTuIQ/z1RAkP+PoWtXwvvHyFE46EIdj2MOrmSebz5s4EhhTQVAdPhvuABVnVXH3g1BOwCB7zAFsFdiHaPVN3LVBvsXeULsrgKARxfm+lHYBnFGsng5YYaYNFMfhyeAquL1EMMDP5pXyh60xKGM7TUn5hyPJswD8vWnGLoxrDa20S5gbSRvtl1ebOfmvToq3Vy7sfEoMVOvaXQTQA77GdBVSDBdtqOmFUREPXHVhWFgDQfvZLGxW8Xov2uUIZgm5PWEI7VVW6KEw8qFc5kU6DGFgJ0X/8xx3vGaUs1+6ASP/GQEeuL7VQBgI
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(136003)(346002)(376002)(39860400002)(230922051799003)(82310400011)(1800799012)(186009)(64100799003)(451199024)(46966006)(36840700001)(40470700004)(40480700001)(5660300002)(8676002)(4326008)(8936002)(41300700001)(2906002)(70206006)(40460700003)(316002)(54906003)(110136005)(70586007)(47076005)(478600001)(26005)(966005)(107886003)(36756003)(16526019)(86362001)(1076003)(2616005)(426003)(356005)(336012)(83380400001)(7636003)(36860700001)(6666004)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2023 09:22:01.9371
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72233c8d-cad7-4e81-3638-08dbec05a6d1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002529F.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8200
Subject: [virtio-comment] [PATCH v7 0/5] virtio-net: Support flow filter for receive packets

Summary:
========
This series improves virtio net receive packet steering to forward/steer
packets to specific RQ.

This basic functionality will enable Linux ethtool steering, Accelerated
receive flow steering (ARFS) as starting point, and more use cases in
future.

Problem statement:
==================
Currently packet allow/drop interface has few limitations.

1. Driver cannot add or delete an individual entry for mac and vlan.
2. Driver cannot select mac+vlan combination for which
    to allow/drop packet.
3. Driver cannot not set other commonly used packet match fields
    such as IP header fields, TCP, UDP, SCP header fields.
4. Driver cannot steer specific packets based on the match
   fields to specific receiveq.
5. Driver do not have multiple or dedicated virtqueues to
    perform flow filter requests in accelerated manner in
    the device.

Solution:
=========
Flow filter as a generic framework to overcome above limitations.

Overview:
=========
A flow filter defines the flow based on one or more match fields
of the packet, defines an action like drop/forward to RQ.

The flow filters are organized in flow filter groups so that their
processing can be ordered when multiple applications wants to use it.

Flow filters requests can be transported via control vq or dedicated
flow filter virtqueue so that it does not get intermixed with other
slow operations of cvq.

Flow filter requirements addressed by this series is worked by virtio
community at [1].

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/179

It uses updated control vq command format from [2].

[1] https://lists.oasis-open.org/archives/virtio-comment/202308/msg00263.html
[2] https://lists.oasis-open.org/archives/virtio-comment/202310/msg00047.html

Patch summary:
==============
patch-1 adds theory of operation description for flow filter
patch-2 adds device capabilities cvq commands
patch-3 adds group add/delete commands
patch-4 adds flow filter match key, action and requests to transport via vq
patch-5 adds device and driver requirements

Please review.

Changelog:
==========
v6->v7:
- fixed plenty of grammar suggestions from Cornelia
- had to drop Michael's suggestion on placing things in net config space
  because:
  a. its huge in size
  b. different across member devices
  c. creating new dma interface adds more registers and duplicates functionality
     of cvq
  d. existing cvq provides single comm channel for get and set all rarely accessed
     config attributes and capabilities, provides single place for device implmentation
     to to get/set/query
  e. matches with recent net statistics cvq commands
v5->v6:
- pick next unique bit 65 as to avoid conflict with rss context feature
- fixed missing conformance links
- removed white spaces at end of line
v3->v5:
- removed left over dependencies of flow filter virtqueues
- removed partial sentence
v2->v3:
- removed dependency on dynamic queue infrastucture which is
  not yet ready
v1->v2:
- addressed comments from Satananda
- squashed with match fields definition patch of v1
- added length to the flexible array definition struct to benefit
  from future runtime length bound checkers listed in
  https://people.kernel.org/kees/bounded-flexible-arrays-in-c
- renamed value to key
- addressed comments from Satananda
- merged destination and action to one struct
- added vlan type match field
- kept space for types between l2, l3, l4 header match types
- renamed mask to mask_supported with shorter width
- made more fields reserved for future
- addressed comments from Heng
- grammar correction
- added field to indicate supported number of actions per flow
  filter match entry
- added missing documentation for max_flow_priorities_per_group
- fixed comments from Heng
- grammar corrections
- spelling corrections
- fixed spelling from initializaton to initialization
- added more requirements for multiple actions

v0->v1:
- addressed comments from Satananda
- added device requirement to return non zero value in fields_bmap
- added device requirement to not repeat filter type in response
- added driver requirement to order filter match field as it
  appears in the packet
- added device requirement to fail group delete command on existing
  flow entries
- added mask field in the type to indicate supported mask by device
  and also in later patch to use it to indicate mask on adding
  flow filter. As a result removed the mask_supported capability
  field

Parav Pandit (5):
  virtio-net: Add theory of operation for flow filter
  virtio-net: Add flow filter capabilities read commands
  virtio-net: Add flow filter group life cycle commands
  virtio-net: Add flow filter match entry, action and requests
  virtio-net: Add flow filter device and driver requirements

 device-types/net/description.tex        | 631 ++++++++++++++++++++++++
 device-types/net/device-conformance.tex |   1 +
 device-types/net/driver-conformance.tex |   1 +
 3 files changed, 633 insertions(+)

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

