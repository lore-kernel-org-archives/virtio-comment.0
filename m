Return-Path: <virtio-comment-return-7299-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6EE5EEB572
	for <virtio-comment@archiver.kernel.org>; Sat,  9 Sep 2023 14:32:51 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 266AA613CA
	for <virtio-comment@archiver.kernel.org>; Sat,  9 Sep 2023 14:32:51 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2253C986663
	for <virtio-comment@archiver.kernel.org>; Sat,  9 Sep 2023 14:32:51 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 16B93986636; Sat,  9 Sep 2023 14:32:51 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id F2D81986647
	for <virtio-comment@lists.oasis-open.org>; Sat,  9 Sep 2023 14:32:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l/hOVfgOdBBNWh9ZPGgFZRN2j2PrtRfWlWqca+GRNI9qLobp4z9mF9bfx3paXvSF1B5+4RtJx32qHaTukdr30//jLv6jwhfSYT8Svamct4FCAShuhTcBN9DOLrAJ6BaQPRV0C2Lch2JBpyU48rbwpY4RfOfWzyzTOh0KNOlAjX1tP3p4Vwrs4XdII5Y8IBkHwM1fx2hkS7jZrw9oy84JlS9U1dstdOCf6T5kboeV17D/XafOtOimTvjKm+AljCIhXuKtydvlUCdJIVKqVhEMSIpm4LVpbdA4PopTzmDQNnIlH3nZTQ2jKU5z+t6a8sMJK3a6ODzwMWxOsDkSqTCscQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vpn3b1m6wInFHUAjdADF1m3hDSCPvvyVYLeoIpcQbaw=;
 b=DRr6Gc+UnAkPeXiVWXMuUNn6ZwJOKwz20fhNZOEVUrnZ9OMEUDIyAJ7vwH7Ohibx8jjYlzm55E6HWc1lyO0dBXMg5Gnpxia2wO2Zs5fDC62qJ6NxpEgBJt2Yo6NIm12/KPhFLUJKZrYOOOcNOe73wl1fCWZ0FeBosMLylMYU94erfp9zlCbJ/h5LDRpNQMG4seoIfbwJg8xq50e/VEIn1m9CrDI3uOy5XQuXPPSeDPrR7DN1PBPy8YQJqlYUq8JT96Ix/T7xlWbWL3sABSR9K5gyBF38RrekHkE+iVXMhLUPDC32VswsAi5+b6dtQsmp/FPcWk+J4bB5BtvV55/UHQ==
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
CC: <hengqi@linux.alibaba.com>, <xuanzhuo@linux.alibaba.com>,
	<shahafs@nvidia.com>, Parav Pandit <parav@nvidia.com>
Date: Sat, 9 Sep 2023 17:32:16 +0300
Message-ID: <20230909143218.524481-1-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529F:EE_|LV2PR12MB5845:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e46c81b-7536-4152-283e-08dbb141a254
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tFHA+CfWgh8Z342KBvWllCalaIHuhntmYZmHsEhdWmyPbDuxoZJK+TRpsS5wIg92kLc1CuG9zzlUWZComenAhGQGfIPY3ISH5EPpbWuF3vKWUMTJtPUP5ixpHn4/iqUytGt09ad2lr3Sb/0ljgXPKGY6KfjUBRaP0euNoDY+lPUWKRiZP1WqYAIagClSHPM9u01S3mUV7GEU25UssebkXun8fSZSthCSxBYlMZHLPHfrk+S9UZkh281gxCdtSodnBINoKAhFLvPxAvzK6X9/jZiUJgYLsyRTCP5wm+efoSjm4tE9EJg/KsAO+ukaZI4oAwvPljEk4bq/Wa3haeCMsx5nS8K1pF7UiNCfVWYzEpz15mU5BCSrQ8/ykGWdkoZcBhD2feTxoAL5j21rDFC1zelb+48uMifqJCkZrjYb38+hjFcJIknXU4WCV9O7aaaGXQp419pzU7iwIPsrqRu8IxySNyNlYuT/3BPR8VSyfskWFb0CbXOC/wQAcl+ereMDz0/4uuahyQKQJY7TwlUr38I42R2E4WFvXm6ASfjWG24ZgXRswfhetmhXG7LEGYC/mSim/rFMJai9z87cZ/dhyf0SBJpgcW8Uj/Y3PC1hrs5GsgCptCXprreuGWWG/Xo6BF9uutlVbD8HPEg8eZ+poXP5aMfWeqdp6NGNh9hnySgee3Gy1SBNltExEV57evyXzdSDYsBGSdt8NxX7A1H15TY5bgFUHbOLyuSPEAcW7ZE/pR2lRnbcwGm2a36kk3iOLEt7jn+kA6fROO0tRBb7DO1QXkA4hYtNxtYNDyz5e9I=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(136003)(346002)(39860400002)(396003)(186009)(451199024)(1800799009)(82310400011)(46966006)(36840700001)(40470700004)(8676002)(2906002)(40460700003)(36756003)(86362001)(82740400003)(5660300002)(7636003)(356005)(40480700001)(36860700001)(47076005)(8936002)(4326008)(83380400001)(426003)(336012)(26005)(16526019)(41300700001)(1076003)(107886003)(2616005)(6666004)(316002)(478600001)(966005)(110136005)(54906003)(70586007)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2023 14:32:45.6065
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e46c81b-7536-4152-283e-08dbb141a254
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002529F.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5845
Subject: [virtio-comment] [PATCH 0/2] Support enabling virtqueue after DRIVER_OK

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
2. Dynamically create the net device tx/rxq when device is
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

As side effect, it also enables driver to not consume MSI-X vectors for
the PCI device at driver load time and utilize(enable) individual vector
when needed. This further helps on some cpus at high scale where a
interrupt line may not be available from the platform.

[1] https://lists.oasis-open.org/archives/virtio-comment/202308/msg00263.html
[2] https://lists.oasis-open.org/archives/virtio-comment/202306/msg00097.html

Patch summary:
==============
patch-1 fixes to add virtqueue reset conformance references
patch-2 adds VIRTIO_F_RING_DYNAMIC feature bit, requirements

Please review.

Signed-off-by: Parav Pandit <parav@nvidia.com>

Parav Pandit (2):
  conformance: Add missing virtqueue reset conformance references
  content: Support enabling virtqueue after DRIVER_OK stage

 conformance.tex |  4 ++++
 content.tex     | 54 ++++++++++++++++++++++++++++++++++++++++++++++---
 2 files changed, 55 insertions(+), 3 deletions(-)

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

