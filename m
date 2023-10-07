Return-Path: <virtio-comment-return-7601-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D46BE94133
	for <virtio-comment@archiver.kernel.org>; Sat,  7 Oct 2023 05:15:15 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 6F1502AFF8
	for <virtio-comment@archiver.kernel.org>; Sat,  7 Oct 2023 05:15:14 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5434398682C
	for <virtio-comment@archiver.kernel.org>; Sat,  7 Oct 2023 05:15:14 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 39BC9986351; Sat,  7 Oct 2023 05:15:14 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 220EB98682A
	for <virtio-comment@lists.oasis-open.org>; Sat,  7 Oct 2023 05:15:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ifx/AwwfATq25pkKW5htp1FlDjuJYUCoH8gXS62du0ZnGzRkQPts2o08lQLIYFUYXLxg0T5aYuX0fUsB1IgItOoE82mBn+I6kBxBqNeG6LCOHjE0jrI5gTUV0RnPGyLmgxPgNrxTLuDmvUNQVxrF7a+Hhm2cxbS5RBMqZ/s1njgfO/kz7pDMRoQ3JEp9i5fDvk5D3ZYLcKCGHiYHEULOjyjGccDSaEwDKscX6dFZY1DkFA/xYZ/hKgZfRQNFqBeJmUuxEbiTjNRCM/Dmz1inbs2kGO3DRJ2/kMmLG2f2rvLVlQeFa6yf/eaPPz6lDcbysqlpkQiDDlk7Cd/bi8k2FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nz7jlrvqupvp3GWA5uSUhMHcXL2TwNVUqmPfliez12s=;
 b=Q7I6mpXksAAC55JudlEJc5dIzkg/MD1gVqg8Rjbo02kJUmIa7ZScX1KYJ1Wdc29T4//EjvxWvsrEvjuulXmAYMX/OHKYwZy+mRMtrqINZ3vEYVlL7yRleRQ0W7WIuq306suXxNwuofGdVibmlJLD6lx1s9p9gqKQdar1reCp037ctYB4iqRodklX8WuA680bHoP27e4RoyY5CgrxiriOpVnh297PwgkenisdhVcfB0cOdoAZillGNRIREq7ge1oHTz5ig2VB+pJCikYOSgJDJYO7A1TJaPrNwjLGcn5Dz1wSDsP4QvwQwfGlzzMFS5BiFs9wcoTuki0B+Q1lyO7H8Q==
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
To: <virtio-comment@lists.oasis-open.org>, <mst@redhat.com>,
	<cohuck@redhat.com>
CC: <sburla@marvell.com>, <shahafs@nvidia.com>, <si-wei.liu@oracle.com>,
	<xuanzhuo@linux.alibaba.com>, Parav Pandit <parav@nvidia.com>
Date: Sat, 7 Oct 2023 08:14:36 +0300
Message-ID: <20231007051443.460148-1-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD2:EE_|SN7PR12MB6912:EE_
X-MS-Office365-Filtering-Correlation-Id: d13e8e80-1d4b-4160-2107-08dbc6f46126
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oj/TjxAATslHOLSzQBXRBSEEG6rqQnu4CarUaS/Z0mx6LVAnf0hFt7eIdJa38TspLaZSjgVPEE/6NJJu2R4XEHU8InIRgn1ycwyvSyldjiRR/F2Rd8PP20EzTc3FcOYpZeyx7U4ihMgkiSJpBVpEJk8E1F9ROnI5Qb5rY7Nk9LlO4pjrleZKMqyXwN6NiFeMLuuyrWoBAIE6/IhQN9od/ApT6/pdySGpCMuAdhS25tpmUHxp6WQFBWh/epZMgpAv4eH9wgLZpLpz5ENGuoyoiluck4x+S4tY0THoWRWjNu6YvdflpiTjCeBl5j7rg1CZqB/Xlhoti18Ifhfjy4eMNrtXcLjZiBLk/M0HB4OBxAbHZdT1NVuondRneteL1sGsDuBhdIvHi0dns6n9WPiSng2kx7y5cBfjvzFRdvFsb+/2GiTSMkg+tk3RbSMjS+ewLwGkPyn4VALT4UCX6vrj0Qo0Yayol5c1kAx/f3KGdEEe7iNov4vKYIUtMqCHnPpA8YUWh4aiGVtZiz3XksDZS0mb9sotNZipayY4vmZO2isZIZqFyOvMh0wNyIGa1hpE77jzEo+c8qV4j8jsYLfTCY4D1jz90I6sEPqGKVP1ZZNBG2OFDonfVkL5s/Gp7/rGfGzG2FGKID9dVuQqmvAKlTJUfdL3GR+bue+1CW9sr8AqZ0xlUycsbuXbzNP1Do6IR7hEqGPVPoIjQ5nwQXQVAAG1uCP+Hdoi3+ryAgoHLYsZymnF154ZazQ8fHbM6Yl4940k/sVO/tkCkmyRpmVCKYO/+gfLey/5tR3uJZ8CTGxCWdYNn34h+B1TLG2p5Kxg
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(39860400002)(376002)(346002)(396003)(230922051799003)(186009)(82310400011)(64100799003)(451199024)(1800799009)(40470700004)(36840700001)(46966006)(7636003)(2906002)(36756003)(110136005)(2616005)(478600001)(336012)(47076005)(8936002)(107886003)(16526019)(316002)(83380400001)(6666004)(70206006)(8676002)(70586007)(82740400003)(5660300002)(26005)(426003)(966005)(40480700001)(1076003)(86362001)(41300700001)(4326008)(356005)(36860700001)(40460700003)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2023 05:15:10.5234
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d13e8e80-1d4b-4160-2107-08dbc6f46126
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6912
Subject: [virtio-comment] [PATCH v1 0/7] virtio-net: Support flow filter for receive packets

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
Flow filter as generic framework to overcome above limitations.

Overview:
=========
A flow filter defines the flow based on one or more match fields
of the packet, defines an action like drop/forward to RQ.

The flow filters are organized in flow filter groups so that they
can be ordered when multiple applications wants to use it.

Flow filters requests can be transported via control vq or dedicated
flow filter virtqueue so that it does not get intermixed with other
slow operations of cvq.

Flow filter requirements addressed by this series is worked by virtio community at

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/179

This series utilizes enhancements proposed in [2] and [3].
It uses updated control vq command format from [3].
It uses new _DYNAMIC feature to create queues when needed and
saves guest and device resources.

[1] https://lists.oasis-open.org/archives/virtio-comment/202308/msg00263.html
[2] https://lists.oasis-open.org/archives/virtio-comment/202309/msg00236.html
[3] https://lists.oasis-open.org/archives/virtio-comment/202309/msg00227.html

Patch summary:
==============
patch-1 adds theory of operation description for flow filter
patch-2 adds device capabilities cvq commands
patch-3 adds group add/delete commands
patch-4 adds transport set command
patch-5 adds packet match fields and values
patch-6 adds flow filter requests to transport via vq
patch-7 adds device and driver requirements

Please review.

Changelog:
==========
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

Parav Pandit (7):
  virtio-net: Add theory of operation for flow filter
  virtio-net: Add flow filter capabilities read commands
  virtio-net: Add flow filter group life cycle commands
  virtio-net: Add flow filter transport set command
  virtio-net: Add flow filter match values
  virtio-net: Add flow filter requests
  virtio-net: Add flow filter device and driver requirements

 device-types/net/description.tex | 687 ++++++++++++++++++++++++++++++-
 1 file changed, 686 insertions(+), 1 deletion(-)

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

