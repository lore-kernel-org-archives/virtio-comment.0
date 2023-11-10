Return-Path: <virtio-comment-return-8323-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD0B2C4332F
	for <virtio-comment@archiver.kernel.org>; Fri, 10 Nov 2023 12:39:25 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 3236C21132
	for <virtio-comment@archiver.kernel.org>; Fri, 10 Nov 2023 12:39:25 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 015B4986D11
	for <virtio-comment@archiver.kernel.org>; Fri, 10 Nov 2023 12:39:24 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id D9167986D03; Fri, 10 Nov 2023 12:39:24 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CAB81986D04
	for <virtio-comment@lists.oasis-open.org>; Fri, 10 Nov 2023 12:39:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S9yYi1ocCptECHghQn5dY/12XuKLZ4kfbeeWzc0RvP8wkcr9a5n1yxpP4DE0HDx1iz4kzUcOdQXlg7nCe6E4ckX+cKZUzqst5z+Nmadx791IQhfh8yc2uAPeix4FV9vyScqpL8BkLlLI2v22KAv1z6iWTlNYL6bitDl86CA0s0dxgxEWth9wbFBUUMtHm5vG+B+2FNR2JicMFEXYUNKsTXRIh2qnqsAX51kE2ntknPA1fk+3kZ1d/+/hKiYRTt0S92azW6hJMa84WUGOvUo2lOegi+vxTiravOXEEBQB9+OOUu3rgaHWVsi9x5YsGttOaaftgqCGv2e7cCDs8aNiBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wRPWFeujiIZMSo8FMnHbIoNlF1M91CEeXzyKc8Fwthc=;
 b=PJpMabYHJ01ztw3dsxs24dZcAP5dNhLQk7vVe5P37DqOLWbed2UyuIw/7G+r/VsXG/3np6e4OdNGVBRO7hRsVak9V8w/Xk9hZRz0F8JVhiK4f6cxctWfqr9jrSQsqIIfRovGbLgU5Nha2cU7DjpVKwqpp9wWSCCgwFM3RAZ7TTADvZ+4V236oUx743DiMUAgzrx3/LWbdh8iK0DrrrhRYKwQsjLswX/7/o5rHU5PVlYlRGcvr4sW1YRTxkB0kH4T2Z5yDkBwXRipphAuCrPefFqQXuPzhquZp6n4iCJOR5tiJHRuxNH1Bnq9nm5dNULc12+Hwj3byv5ZHzBzjSArKg==
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
Date: Fri, 10 Nov 2023 14:38:48 +0200
Message-ID: <20231110123853.2093309-1-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003441:EE_|LV2PR12MB5918:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a11316a-0080-47c1-d828-08dbe1ea1076
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NUSP3dgU7tqbrXhN9ju7To2CdE7YkGq56lEg0M6/kiXN08cSh93c82+Pd44uF09lY4imnt4LXWu+F2KMunXDImTboFsbfrCHd82kVn5jE0RmfNm0eOiGi00EDvKWNPEzsJ4Ts8owBocgu0qpXNMkPA2hg24ADmifmewNsauEmPJr0d6t95MkUmqmIECbVh50vlsbkUu/XD7tKQ38oVe2fZxJw1T3RjT+ixwjpn31sMB1vwyc6tqRBrc/ruGIJq551I4YN7o3RM4BGotLE397SCRcIEi+QyQuw+pixt3PPYa58kxZaaI5m6BsIP+0GhaVjcPOEHqO7felwepNs8Uxjn1p09j6E0g36nrizwrbANwdztn7tqa6HmMD/lspH2VCLx+iMs+F5VaPi0MIlNPUnWRz9VvMEM4yNGAfa46z8n/j4FaNwyiVvybVoXuMAIi/rsSTG0lbHRs+ulkexwRV3GB89H47CCfpYYIEX/lA9bDb6Kl5p4Grk4/jxjuEy5Rkr2LFwnM4LPK6EV78Tu92jaTl1/V2Zgw8+xThwSN/j+lVCOMEHzOXZB/LvVe1bNzYCa5AnUKoE3vRpM4lvwid/pMn6jN3yrs/lyy6UyLpMCFcTvzZXVBorsHVt0plke2vgTCdFLrbFIQMMp/ZqhEq3Jf+Zt7fCt2fQWqSEkCjgvzFSfBBehXVoQ1m5rRXZM3or2uHtgj1yny8Q7l8UASGYUYafNKJHh8XBBVf6DzFBoY6B3v6rMLNqo1hAVW6K+XEozBHyx+ot2Ji/ppfPSlYTqX2Bo478f5GwyPRpA2ZImS1kQaX9pW3SSEqOEGK2E2n
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(39860400002)(136003)(396003)(230922051799003)(1800799009)(451199024)(186009)(82310400011)(64100799003)(40470700004)(46966006)(36840700001)(6666004)(110136005)(107886003)(316002)(2616005)(1076003)(54906003)(70586007)(40460700003)(8936002)(83380400001)(8676002)(40480700001)(4326008)(70206006)(16526019)(26005)(966005)(336012)(478600001)(426003)(36860700001)(2906002)(36756003)(5660300002)(47076005)(86362001)(7636003)(82740400003)(356005)(41300700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2023 12:39:21.6315
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a11316a-0080-47c1-d828-08dbe1ea1076
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003441.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5918
Subject: [virtio-comment] [PATCH v6 0/5] virtio-net: Support flow filter for receive packets

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

 device-types/net/description.tex        | 630 ++++++++++++++++++++++++
 device-types/net/device-conformance.tex |   1 +
 device-types/net/driver-conformance.tex |   1 +
 3 files changed, 632 insertions(+)

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

