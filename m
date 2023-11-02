Return-Path: <virtio-comment-return-8117-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2511CC4332F
	for <virtio-comment@archiver.kernel.org>; Thu,  2 Nov 2023 13:22:07 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 724702ACBF
	for <virtio-comment@archiver.kernel.org>; Thu,  2 Nov 2023 13:22:06 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6470B986C0A
	for <virtio-comment@archiver.kernel.org>; Thu,  2 Nov 2023 13:22:06 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 5AD67986BFE; Thu,  2 Nov 2023 13:22:06 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4DB24986BFF
	for <virtio-comment@lists.oasis-open.org>; Thu,  2 Nov 2023 13:22:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kuMRDL36N+DEExXsrcmXEYSRM9TKpXze3Jy7Z7Ed2PyQ0GdKhnU/W1+izuckxILsssdPSnlD9AUuUMNQKTTEg3G9Ue/jqGwc+6zXBHm8eNR4OIx/DzZyfZIRSvsG3cbfGWQEMMK088noKMxQpv81EsfS54+PSPMNKFRVu0wMku6FE6fzODefLI2ujFJDeK400nt8CrZW+slvXcU3zZYIDchPsEQVffhGmOEaZv1yMcbMCWG4/pd+skKdr9lQFyAx9bW/MO/FpeNZjQdyVTJR88ugJ+7YrGMw5cMrql8WuAeMpM18pYVkMvLWg2z+DwJWbNRUlrrpde14hxcxtFJCLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DH15dSDckXcc/6gvGVhINGCXKh3f4/SFbfHV7umLlZs=;
 b=nfzqvwp4UWgDXLME89o5grIV1Zjdz1ph06JWk5uz+pBAELv0SKtobQBTfvia/GOpWYTAIrsslCwy7DI23vaULnlm7VJn9OhoJt/ckL4aQXEpuPPTHs4Y4yhWRnMhdJ6qGGZ5MvZXIS61BB6H6tidNxCGXP4IX/jF5dFf3+TmiipseZsGtSbA+AuT/IuSSoO0deIRB7DlwzN1ZwwSnOHX6NBISFNHOThlrZimK9L3lWMUZcunDRKdPGiqpGBiBaIPsTKh15NFkpKx6+ebUo8fbKuP5jOYCD+lHHvkXU8whKYrA3Vy0y8XTi1qw+RqXit9TnCHEhcDdC9WMzxMGawYAQ==
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
CC: <sburla@marvell.com>, <shahafs@nvidia.com>, <si-wei.liu@oracle.com>,
	<xuanzhuo@linux.alibaba.com>, Parav Pandit <parav@nvidia.com>
Date: Thu, 2 Nov 2023 15:20:47 +0200
Message-ID: <20231102132052.1864964-1-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD1:EE_|DM6PR12MB4893:EE_
X-MS-Office365-Filtering-Correlation-Id: 29bad3e4-9701-43e5-898e-08dbdba6b2d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	O5CHZ95MvGoTpVqr8MEvIydKZAb6CBED51Rtc/gpvokeE9qG6WTjyp4yRn12Hiv0Orryla5mzL9+PSjAhep4QFaqr0XvcCyaFOBkMgkIFSiiBLD9Sj5ryU6zEyn4OsFO1w34RvxtIePFZM4qQ1kdCAGnOnAshNZbolrh/9H1jKiLJXO37DhGMqzuNAA0WgkLJQfXYVdAsRjsAIRpZaIGFMTygrMLkJtJoaVjbk72HFneBssEGHz44qbCEtytINcCOHay/nyFraROai03JbENpjtMPkUsBLuxbzEEXJheqWdi2wg+um+h4O4cFAp0GLdySaoFjW69qMr7SOEGNOV+xvsYFh9xIj7mlLjaByEDSyF3+gCx5KmpX1DM39vpfmqbq4T21DdCD4NVXuJ5RUs+ed/fsWMcJA6qdKeuOXENpAGU8LvA4/h5J6lSZUy1fynPCg6GMs2iHH1z+lFbqILykadB2f+am6BJxTPHrav/WeM2F+DJ5J1X60w19qWr0Fw7u4Lv/0SKckfyloAoghrLcTMAUjNG4B1qyUxfSBtr7/NqjymJkeGFA+HTBeRZoRG7uBLmakT7yyOmIwoMLanm1HVW3P9/mNJCLhDnz6u7kqxl1m5faiuleOk9IF9+oMFdgyAlRF4oKc5STNXBYQePfv94L4NFuiRREmReMrFBGXqptwyzqL6ae8mBmUIsybNNgOn5EL5d7c162lVny4vb7CIOhWlmJHxbPZ7PGh9oLNX9pHAqMcxbRBQBveRIDqK/ujivasdDVs8EIIW431BrCCO6jJJIlhQi7Nwn5Xl2wTGedKfcCSNTTdd09wbE/wuK
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(39860400002)(136003)(346002)(396003)(230922051799003)(186009)(82310400011)(1800799009)(64100799003)(451199024)(36840700001)(40470700004)(46966006)(47076005)(36860700001)(40480700001)(83380400001)(7636003)(356005)(40460700003)(336012)(426003)(2616005)(82740400003)(107886003)(41300700001)(2906002)(86362001)(966005)(5660300002)(36756003)(8936002)(8676002)(4326008)(70206006)(54906003)(316002)(110136005)(70586007)(16526019)(26005)(478600001)(1076003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2023 13:22:01.2716
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 29bad3e4-9701-43e5-898e-08dbdba6b2d0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4893
Subject: [virtio-comment] [PATCH v4 0/5] virtio-net: Support flow filter for receive packets

(Internal)
I removed the references to flow filter virtqueues due to missing support
for dynamic virtqueues.
Please check if this looks ok.

Once we add the dynamic vq support, arfs will be able to benefit from it
as well.

I will send to mailing list once you ack it.

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
v3->v4:
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

