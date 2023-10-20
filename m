Return-Path: <virtio-comment-return-7876-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5383C001DF
	for <virtio-comment@archiver.kernel.org>; Fri, 20 Oct 2023 12:33:38 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 1F8DC7C92D
	for <virtio-comment@archiver.kernel.org>; Fri, 20 Oct 2023 12:33:38 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E8348986936
	for <virtio-comment@archiver.kernel.org>; Fri, 20 Oct 2023 12:33:37 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id D045498692F; Fri, 20 Oct 2023 12:33:37 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id BFF86986930
	for <virtio-comment@lists.oasis-open.org>; Fri, 20 Oct 2023 12:33:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kcUyXUZOtO+J11/0WaU7JN0ygbhmPwKOqZ45Cjt5fNPY9CzyejoKJrEQoexSCBf8bBwCPbPZHEdsKH768lC1lxhmABwCaZ2bLB5pqqZkC9wjmfmI4j9h+Q7zNrNU5LWD8TYZNCiu1qhr8/IKZH/WQwGU45I4qJoCeQYevxQBY+35bhzCl0PJLWWRc19UelOFt7eKISwyithGwp+JilFySW56/qXZRnZQMJohwEAoR7sHPivKvretxnlTf5CE3TKmhY3LQUvak3/cQZkOfWLKmkoyW6xg4Hqg7j6mJL6l3Mwrs+jbjdlgge45czszL6+eW2N++MiQpDeVfgDam58B/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pbJhs1XxJH13OG3kMx0DnjjPSOs+wdbBx3BoxzaKG+I=;
 b=jPhmg/kzTPTUW+lDYbV38q42RDaXdT43/I3Fa401t7a47yWpk8XESuJE+eQ1K4JjmvhuhJ41teAwgDefQ1UjaW726Jmj0xsxNbrH/1pqzC4RAxHPK1iz/XTBWs84MljY0WHLAUgbrrnCxxeJ/BK9fHA/kXWAIIUl+zdQDvfJPZe2B7Pnc8Tux0eL3REnFHr7My0MUglwj9+U9s8azQCPTUgj8mIrva0lBpTrfFSUPiOwe6xeWeXIu+d8YAalD40iN/45N3EyC9lkVCRK3iumWuLch8msEvTfBDnnes3/r3MC2DTcF/UvkLkPbom62QraPZ1JjnADF28zEQN4Aq6dHQ==
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
To: <virtio-comment@lists.oasis-open.org>, <mst@redhat.com>,
	<cohuck@redhat.com>
CC: <sburla@marvell.com>, <shahafs@nvidia.com>, <si-wei.liu@oracle.com>,
	<xuanzhuo@linux.alibaba.com>, Parav Pandit <parav@nvidia.com>
Date: Fri, 20 Oct 2023 15:32:57 +0300
Message-ID: <20231020123303.1209289-1-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E8:EE_|DS7PR12MB5767:EE_
X-MS-Office365-Filtering-Correlation-Id: c23876d7-ba3c-493e-3be3-08dbd168c5e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3w08nfDNAUrlbGapaWzudYkhr4cDH4htlzUAJbc3kB7tKYLB4V1iVWy6u20e3VVM2hfQJs0birc5QmeznWO5AhvOYgHEJHPCzXIY6hrHGmxmnhB8qXvtTLYUVHX7d9ch2OlRKK0OOYuLKUjB5UGQDdqvL2GSqnwdSWz+H7aMSyk8YXu/DooPDc9ei/dW8FEFHSovpUC+Dd+XeS2kHZFn0t0sD55WHP0ZhyRJWBt3IVQYWXHbC4oed4ZIZYDELwXBAlTcIu06DCXLh1QTPbidS/JbBiU75sFSrbOETutS5c3UG8vivTqzwXzPqgi2NB+quMqNw/PPTKNzNri+xBQgcZeFL+rV3/uS8grDOkAyZKLcmTMo447jbMXe/8iQEe3zFwJyoYa1akO3r4CU9XF/lJKeZLBnALv3hPleominkgG5KNcV1i4xFMrnCd0vVTDCCSl9P1AOc1Hp68a22P0Zs7YOO4yLKpB9dFJEBYAhgeJ8sWAbJzDHakTX1t09Um76TMo7cyW3+s2G9x3Rzcz68vS6+MzhRahIBr7XsxeVTrbzVlFQp15e2gyX9mL9z8ad4BP8PKDAogxkF7+tjFRj65e9Fy3se+hIRkw1Cy6yRCA/4+dhGMXBXk+7s9szqDc4dcEspxwmIdjXn8Q+OmYFmQisv2DoP8OW8VSXOOhE/SZovQu5qhCbvp5xxz2Pz7Kbre2ha0SmtRMSdPKGr9BgRKT53ny2j9tWtA3BFeHczFspnNVi2XKmGWKCo1HPChLMVasX+NGf8jC2F276I3X7z/5IhIkCNwpbFYODhjCf4VE=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(396003)(39860400002)(346002)(376002)(230922051799003)(186009)(82310400011)(64100799003)(451199024)(1800799009)(36840700001)(40470700004)(46966006)(40480700001)(36756003)(8936002)(26005)(40460700003)(1076003)(110136005)(54906003)(70586007)(86362001)(6666004)(82740400003)(356005)(426003)(7636003)(336012)(316002)(2906002)(83380400001)(16526019)(2616005)(107886003)(8676002)(478600001)(966005)(4326008)(70206006)(41300700001)(36860700001)(47076005)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2023 12:33:32.9123
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c23876d7-ba3c-493e-3be3-08dbd168c5e6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5767
Subject: [virtio-comment] [PATCH v2 0/6] virtio-net: Support flow filter for receive packets

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

This series utilizes enhancements proposed in [2] and [3].
It uses updated control vq command format from [3].
It uses new _DYNAMIC feature to create queues when needed and
saves guest and device resources.

[1] https://lists.oasis-open.org/archives/virtio-comment/202308/msg00263.html
[2] https://lists.oasis-open.org/archives/virtio-comment/202310/msg00183.html
[3] https://lists.oasis-open.org/archives/virtio-comment/202310/msg00047.html

Patch summary:
==============
patch-1 adds theory of operation description for flow filter
patch-2 adds device capabilities cvq commands
patch-3 adds group add/delete commands
patch-4 adds transport set command
patch-5 adds flow filter match key, action and requests to transport via vq
patch-6 adds device and driver requirements

Please review.

Changelog:
==========
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

Parav Pandit (6):
  virtio-net: Add theory of operation for flow filter
  virtio-net: Add flow filter capabilities read commands
  virtio-net: Add flow filter group life cycle commands
  virtio-net: Add flow filter transport set command
  virtio-net: Add flow filter match entry, action and requests
  virtio-net: Add flow filter device and driver requirements

 device-types/net/description.tex | 730 ++++++++++++++++++++++++++++++-
 1 file changed, 729 insertions(+), 1 deletion(-)

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

