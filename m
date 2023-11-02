Return-Path: <virtio-comment-return-8120-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC7E2C4332F
	for <virtio-comment@archiver.kernel.org>; Thu,  2 Nov 2023 13:29:05 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 18AE94454E
	for <virtio-comment@archiver.kernel.org>; Thu,  2 Nov 2023 13:29:05 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id ED4AB986C0A
	for <virtio-comment@archiver.kernel.org>; Thu,  2 Nov 2023 13:29:04 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id E3D31986BFF; Thu,  2 Nov 2023 13:29:04 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D4B1F986C00
	for <virtio-comment@lists.oasis-open.org>; Thu,  2 Nov 2023 13:29:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OuY1MWCd8w8TyZKTWJ4RGlA3YmWgng+/j53l4JYfkAGIeuqZWmSr0btElH+kYzR82H5OVVwcloo7/5RO5D0KBsVF6VFY7bCcN9ny1YUDORtxTNYcNfSU861H4h44hbg+bljUg5Vhqjyk7gHfaBkw1y8qqlHzXn2kwCPqjWePPWxG7rjUvwDcfH/QYWcY0ma1h5O8tMA7yX3Fbv2zAcKVv18sW2iVd0eLYlYoMZ4xaRyxEkKMuMEvPpPsHt54Wvlcz9lOjV90pdv+qLMesYtgcHoNrYVKrQxNuJ567LoZLooPhDvj1AV1FpsTvILV3mdE4UrXCfgodgTyU52sUji68g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UNnPljWoCUPJ6eBRzer/d/7urTyLZ02uJ3u3CCSNXi0=;
 b=lyAAUCSEBe6Bz2dlClkY9TTu0It5O8zirUbMULTKNyROuyT91g88Tr/nvZPEA3P+j6ZBqxAblIx9lD5XeKElTb0W3c3MZtYyzqIWxYOu8Nw3p2hEIsXHtXpe+SUSYYweRKC5eEAXooJ1m0VUM2IshvYmzGCPo7WMS3gu9T00IYUQRBEV7eOuxiIEdrz3OHnOfm4PYd4h9TbH6CGBrEd6JcSXHN5re9dt9cMs8EH5Xn7/zansU9Qhq0WUiKdVoFD9XHfGkC8LbQNzZGUOa6gNZRSm58o364fsLiZK/YXB50uOkGY6G61NzI1zZd4QhsQ+wFY9rKxK/DaWDVWWjU9unA==
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
Date: Thu, 2 Nov 2023 15:28:20 +0200
Message-ID: <20231102132825.1865068-1-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989EC:EE_|SJ1PR12MB6268:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ff3651f-086a-43c3-6d11-08dbdba7acd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ps1anu1P3LTRlqx9o5BagSoL0d3aqnBARZoBwmerwqmVkwiEL/eu2U1Zh5Z/4rXFb6cBxbT/AJI12VtExxS2EeA3TwsOnqVBpiXINzr13/uXtbzqeb7nYCIXNk0qfkbBq6e11+/rVPwkGnvhY8LALFpala/7yRuJKeettJrKeayuSpWxaimbbTef+pzJZaa6wzdGpUKhib+UG63pCEdj260zQUUfjQ/GB2g6W3vyqcq3qglZsS0TyuVwyucP/9Xo535tGIOPqccZH5sl3DxTRkn6NkkdOdq9xKnl/5pHJa7yQNN16MWfiqmOeGpr/CIAfsCcTYJaQTV9bc9xcOgSjFkq+ZzQIracBvA+cad1NxPrWl5dhKjhNT3yQ4IUe8Ugee96QqJRRzZKtUw1qTCfqM7y2EH9sZdS7SrgzSB9A6+NEI+09OzMGAMriiJeo4hDE9pvzkSsGkprDgTu/pLesEibCYC1CWkidh/3TnJKrVaCQrCu8bvDVWZtUqYaq5GyQ5BXn+xi8ijH0h4mE2SFHoTozqrRJ+OguCNSQ1dcrPbzp+nGTZYdYTaqoZ2wFib7D+KFXkQv5Qf7IP6AtEw9a+791nfwt4po06HFSHgG06Hd2s16/a5VwnmklvhjBKYTTFDJCdKKUsBemjJVCZLYFnJrv8ar1U9X9vbzn3VT9ExjRLybGm7zUU/7ogV6nnQf8LYr5gZV+8fJGUJEs9FiqO8Axl25l+UXkFn41uQ/U2z4SgZr1tf3pe0sNydcXTWqUV6W+Sd5D3AVxts/7gg6hAo2bO1TGkvPmwa6AE2NpoawIoQqdyiCvZWODbjIggMo
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(39860400002)(376002)(396003)(136003)(230922051799003)(64100799003)(451199024)(82310400011)(1800799009)(186009)(36840700001)(40470700004)(46966006)(36860700001)(6666004)(40480700001)(7636003)(47076005)(356005)(54906003)(82740400003)(966005)(4326008)(478600001)(316002)(8936002)(8676002)(2906002)(110136005)(70586007)(41300700001)(70206006)(83380400001)(1076003)(16526019)(107886003)(86362001)(26005)(5660300002)(2616005)(336012)(426003)(40460700003)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2023 13:29:00.7249
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ff3651f-086a-43c3-6d11-08dbdba7acd6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989EC.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6268
Subject: [virtio-comment] [PATCH v5 0/5] virtio-net: Support flow filter for receive packets

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

 device-types/net/description.tex | 630 +++++++++++++++++++++++++++++++
 1 file changed, 630 insertions(+)

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

