Return-Path: <virtio-comment-return-7580-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCB34E784AD
	for <virtio-comment@archiver.kernel.org>; Mon,  2 Oct 2023 05:16:30 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 1FD5129FD0
	for <virtio-comment@archiver.kernel.org>; Mon,  2 Oct 2023 05:16:30 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 034C09866B5
	for <virtio-comment@archiver.kernel.org>; Mon,  2 Oct 2023 05:16:30 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id D67BA983FE6; Mon,  2 Oct 2023 05:16:29 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C0C0D98667B
	for <virtio-comment@lists.oasis-open.org>; Mon,  2 Oct 2023 05:16:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gwMRcCy0plTaYKyozFDkzoE9Y+/9R9FacdwhkB4bxQJemBjnD+ccmKXVWm7qmXuKQLzoC7YBi+Myg5vuJa9T6jS21fdtS2FvTIjWKzZ1HmfQZQPLWGmeuplPywtYM0ISe+Lpd+18Hn/FByQ0PBIC+glL2G3S3jOJhhMNRRBDU008t/bb+R+jXIXh/XqErmSjruw+oORi+oJNGhIco0cmJwL2pJR7ATkgIW0KNO5v7qVQF8DHNZ+YBz1ygg/+64lm9nBCAmpw3ZF4AbcxDSiwBQqeSlGiWM/NMTumLuxZ/M1vHDxIZkOtMCG5N9zUa34zxqg7+NMUDTe45g7tLleEug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j5FiTdApqjqAOzWdN+rOmB75fv0jDEYyE1n2sX1AACA=;
 b=UDG9ocNfWFaDgghbtRCdLYBNC20NQkKnbIrIKTrNqamf0/Zx4JH0TAzbteS/PARdJaLyPg+RlL5cRLqTJe4bfyROCOeIFVJxG8d+onBN8tSUeU01xax4DpPfTZTKCKxrBpcxcCgSmy0Ia7ST89+1u0b+yiUnDbA/XAQ2SDracjO4SKiJ8vGY29hAdkXDnT3/dMw63JSveuKH1TV9uDIYX81Pza1DXZhWEOQdlFErDHr0Xt5qLgXOOj5vs9RhbP0sAYS62CP9X3RTn5RpNGJMqUIBq09SfnvG201IHMmpbPMYImr7Cu8zVJjhX/j0vXnFYrAC/nTXFg/n39C9JCh0sw==
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
CC: <hengqi@linux.alibaba.com>, <xuanzhuo@linux.alibaba.com>,
	<shahafs@nvidia.com>, Parav Pandit <parav@nvidia.com>
Date: Mon, 2 Oct 2023 08:15:59 +0300
Message-ID: <20231002051601.6626-1-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail202.nvidia.com (10.129.68.7)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989EA:EE_|SN7PR12MB7953:EE_
X-MS-Office365-Filtering-Correlation-Id: 7309121c-7c4b-4573-ca91-08dbc306bad8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DMg69b1nKXr1aSAa7wJAm6k7bwNDpwgFUQlVBcy522nuwwtUXAo5I8nCYgUsCRG3LDJyxM4WnNyw8TiIxrhjhU+0aaw1TUdSOsXkuD2X9j/uKaz0+wjHhV32qEzUB0nwwFn8MJ800t4IPw3LfMNEPbTrWGuj8kDDx2ylbtYCQo/JDtmYZQxIigWFCOWuX0bp5ey0X+T4i/BW5t4uLI/FPaEHrlBIjwBEjX/xE5Igy+gNUbYemNyZmlaZ6zvR0g+iSvdwWsr6hpVLybZEgxb/lQLMaTcBPDRbmVvNY5S9I+gdltaD3NAjIX9zOqQSj3cXJVle0Fsenkxl43uar/7TmfDslfOhGOMwEEZjTNeDjO6LXL7+rAmeTVqfzzgK/LDSowEPgCTo1FI81HH24ZqUtKSXcKz0hSkXpxmovAWUrZJw9txiKbu264V7jBF3bnQSwrazRR9clLE2imQYG0zrYxJM1Ftx0HA5ETe08i8ca1JSJStEx91k+5Cx1/nxO6k/O5EYUXzcU3usJcYfB9foPu6ZyXROH9bKj1NqpXpCp9Uumd8BIn3l0mVQxzoSpBUNd39ULogS4UWOtSk8kwY7o4YUALsqphFFomC5+EF4AUgtOnDDt+yaFiUmYWSq02OZdoOCMfcpMHCCkIWiChhPo/0NlEYnaex8jHSn98hTVWJ5zJRktY3pEeCE8aJJenjbfNzYCDpZxHttJAPzUIvfHLv/AXhB41L8RzBfNMAKQp39xCH4n+YhRChSHwx4itkcAWIHcqWqeJpTyZiiNm6+gs/xNrLIGChWEK4JZDA4r0j5pUorGBJVbtM1ZmnUvSEf
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(346002)(376002)(39860400002)(396003)(230922051799003)(82310400011)(64100799003)(451199024)(1800799009)(186009)(46966006)(36840700001)(40470700004)(316002)(54906003)(8676002)(4326008)(8936002)(1076003)(26005)(107886003)(41300700001)(36756003)(40480700001)(2616005)(478600001)(70586007)(426003)(16526019)(70206006)(966005)(336012)(356005)(83380400001)(36860700001)(82740400003)(86362001)(7636003)(6666004)(47076005)(110136005)(40460700003)(2906002)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2023 05:16:27.3953
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7309121c-7c4b-4573-ca91-08dbc306bad8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989EA.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7953
Subject: [virtio-comment] [PATCH v3 0/2] Support enabling virtqueue after DRIVER_OK

Summary:
========
This patch enables driver to create virtqueues after DRIVER_OK
status bit is set.

This patch take the inspiration from the thread [2] with credits to
Eugenio PÃrez.

Details:
========
Currently, a virtqueue must be enabled before driver has set the
DRIVER_OK status bit.

spec citation to section "Driver Requirements: Device Initialization"

"Perform device-specific setup, including discovery of virtqueues
for the device, optional per-bus setup, reading and possibly writing
the device’s virtio configuration space, and population of virtqueues."

This implies that a virtqueue must be enabled before reaching the
DRIVER_OK stage. There was no explicit mention about ability to
enable the virtqueue after DRIVER_OK stage.

In following usecases, creating a virtqueue after DRIVER_OK phase is
desired.

Use cases:
=========
1. Dynamically create aq when administrative commands to be used.
ate the net device tx/rxq when device is
   opened when deploying for a container.
   In a container, number of virtqueues to be used may be <= max queues.
3. Dynamically create flow filter queues of netdevice when
   ARFS or ethtool filters are enabled as listed in [1].
4. Dynamically create rtc functionality related read virtqueue only
   when net device when timestamping to be used.
5. When XDP program is set, one can create additional XDP specific
   queues without affecting existing queues.

Hence, This patch introduces an existing queue enable and disable
(aka reset) facility and a new feature bit to explicitly indicate such
support by the device.

With this feature, drivers can skip optional queues creation during
driver init time. For example, a Linux net device driver
can create/destroy the transmit and receive queues when net device's
ndo_open() and ndo_stop() callbacks are invoked respectively.

[1] https://lists.oasis-open.org/archives/virtio-comment/202308/msg00263.html
[2] https://lists.oasis-open.org/archives/virtio-comment/202306/msg00097.html

Patch summary:
==============
patch-1 fixes to add virtqueue reset conformance references
patch-2 adds VIRTIO_F_RING_DYNAMIC feature bit, requirements

Please review.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/177

---
changelog:
v2->v3:
- github issue link updated
v1->v2:
- fixed comments from Michael
- reduced device and driver normatives (simplified)
- replace 'a virtqueue' to 'the virtqueues'
- reworded to remove 'interested'
- avoided repeated 'device initialization text', replaced with
  DRIVER_OK status bit language
- avoided confusing text around 'MAY' in the requirements
- replaced 'the queue' to 'specific virtqueues'
- replaced queue to virtqueue
- simplified commit log to talk about msix
v0->v1:
- fixed comments from Xuan
- removed blank lines
- fixed wrong requirement link to device in driver section


Parav Pandit (2):
  conformance: Add missing virtqueue reset conformance references
  content: Support enabling virtqueue after DRIVER_OK stage

 conformance.tex |  4 ++++
 content.tex     | 49 ++++++++++++++++++++++++++++++++++++++++++++++---
 2 files changed, 50 insertions(+), 3 deletions(-)

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

