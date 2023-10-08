Return-Path: <virtio-comment-return-7609-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B543E95A67
	for <virtio-comment@archiver.kernel.org>; Sun,  8 Oct 2023 11:26:21 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 9F56942A6D
	for <virtio-comment@archiver.kernel.org>; Sun,  8 Oct 2023 11:26:20 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8DBE99864AF
	for <virtio-comment@archiver.kernel.org>; Sun,  8 Oct 2023 11:26:20 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 79B33986380; Sun,  8 Oct 2023 11:26:20 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 65E43986481
	for <virtio-comment@lists.oasis-open.org>; Sun,  8 Oct 2023 11:26:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z/DWCpXQcUhWm4m9/MnAJinEGuOySsnkOfFeW7xpbTh9fvoYsCdOOxCctEIQoTKbB7UGwLt8hMaA/pGOwvE+9l6XJGDudfrg88D+aKcUsk0HalLunxCV70zH26KTH/hTxRUa9UB9gM1aVoDX+4+FpsLtj3qju9TKEiOc+V+tncKwsing+sIVOcafN9rOMXIKcO2S7FLafaWsMsOXkZ3RR5En3+7VeKqj0uKxhtDB+rUpnQmVf+iau5Wq59puLFm5aqgza733VTLBpkHZO1YZSfdLS0pP90f0cpr2xbMi3MBNUnAGoj2LX94VhHpgja8SQ+DbGF95PBESt8K/ncFrJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dOArr/fjEDxIFzxZf9Tdtv5/yHVInAveXkvEQOPUaBs=;
 b=cv+Mu5khlN1za1LR1at5IrynV4zGz6U4Hf1tnCzKhhpTzjsWM3KNLTdFREYtKZATq6i0pN5XWSd4qnU2Lu/hfMS4OUjeLGGI+nIyPTFUBa42gofaCXLahBClyusDU6We9Db8f81pYgw6qAi+tK3duL2+vKcz9rr0TDPy9uce8lKgpNk6H5p4lsFOyCvcLPQ9sseluHk9o18g9OEkKIdALR9f6qTI5tRcbBGIRvGumYUUu3mXabMXfV+LotMKXMB/Gh5iECam7FoRf1vO7YX1p3TUvEREN0ph9WL5yf+zspKYhpDe/elv4FF7HvcZbDFO1kP7ktDTtLYQbEhQErWk3A==
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
CC: <sburla@marvell.com>, <shahafs@nvidia.com>, <maorg@nvidia.com>,
	<yishaih@nvidia.com>, Parav Pandit <parav@nvidia.com>
Date: Sun, 8 Oct 2023 14:25:47 +0300
Message-ID: <20231008112555.473895-1-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AE:EE_|DM4PR12MB5376:EE_
X-MS-Office365-Filtering-Correlation-Id: e6764850-6708-45b6-582b-08dbc7f16236
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wnR7fKxrNVWvJPz1kRQnZLSC9Tnz30U8KGQcVA+9pT2RBkF1bQF4CDikibZK9btUKuCjkLpFHbMhL5xQ89uIdRCXHTK/PQd1T8X/p0wVNijyK+Hv2qMAsv3Rt2x2WZzkXjmM/tKZBvNXJMcOdNTLj02w8RHneaftPoW+IfcQYb4OhjQnK5uhjpCQHMkuXyCZHtl0zz/BKv5+A0aPMCNJu6iw03ZDit0yib12iai2R2uXNAhypBUDBM6KNk9b3pOja3iwTEVtR7DFj1iCHtma0iCLdk4SFEMWHD292XL6qy0/T9vlOXBnMditmnn5VrJ3JqFGJdnEDXo8055cv0egtJJjG2p7XvgU6BRMesV39sOHaEONTcfwEwmNO2Ply6uR5hiZt1L5gZst/JTzO3T/cg/Mfgb8WeVS0qooMeYvciFVxTvzFrfb9KhSeYaekPBJOSO1NKPzQse1vDSSpOHOX8VIYjSZ8wYdFIGhpKV67SvES1M5XB7EX6h4rvCiIdGI93sTtJQ7Uxi8KGeOncrzGAE+REIQlax/vh5Cl/n02QwVVzGepjYVXbMML97jgPaL6ly51bu6CV1dQW14WiYvkmDb/+3gZxn8xaw6/JNNImQ7HTmal280lYEHIa0/0IYnqDbwevmQBH1j/qJImMBUbdfE3VJmqFVo18O6QOxowOVkHDYufWNZLT1g/UKSvN/gZexRR0ZUQyer8luJ4/lFDiBXC3aa/gx2Bh7DKFiYeFpL9brXJweKC1s9ulZfk+ISEuVlKde0/xZtl9IsdBpwATHtMK0fnorFS0gvgRvgqTM=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(39860400002)(396003)(136003)(376002)(230922051799003)(451199024)(186009)(64100799003)(82310400011)(1800799009)(40470700004)(46966006)(36840700001)(40480700001)(40460700003)(83380400001)(1076003)(107886003)(2616005)(336012)(426003)(16526019)(26005)(47076005)(36860700001)(316002)(110136005)(54906003)(70206006)(70586007)(8936002)(8676002)(4326008)(5660300002)(41300700001)(6666004)(2906002)(82740400003)(966005)(478600001)(36756003)(356005)(7636003)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2023 11:26:15.1050
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e6764850-6708-45b6-582b-08dbc7f16236
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042AE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5376
Subject: [virtio-comment] [PATCH v1 0/8] Introduce device migration support commands

This series introduces administration commands for member device migration
for PCI transport; when needed it can be extended for other transports
too.

Use case requirements:
======================
1. A hypervisor system needs to provide a PCI VF as passthrough
   device to the guest virtual machine and also support live
   migration of this virtual machine.
2. A virtual machine may have one or more such passthrough
   virtio devices.
3. A virtual machine may have other PCI passthrough device
   which may also interact with virtio device.
4. A hypervisor runs a vendor agnostic driver with extension
   to support device migration.
5. A PCI VF passthrough device needs to support transparent
   device reset and PCI FLR must while the device migration is
   ongoing.
6. A owner driver do not involve in device operations mediation
   for the passthrough device at virtio interface level.
7. Mechanism is generic enough that applies to large family of
   virtio devices and it does not involve trapping any virtio
   device interfaces for the passthrough devices.

Overview:
=========
Above usecase requirements is solved by PCI PF group owner driver
facilitating the member device migration functionality using
administration commands.

There are three major functionalities.

1. Suspend and resume the device operation
2. Read and Write the device context containing all the information
   that can be transferred from source to destination to migrate to
   a member device
3. Track pages written by the device during device migration is
   ongoing

This comprehensive series introduces 4 infrastructure pieces
covering PCI transport, peer to peer PCI devices, page tracking (aka dirty page
tracking) and generic device context.

1. Device mode get,set (active, stop, freeze)
2. Device context read and write
3. Defines device context
4. Write reporting to track page addresses

This series enables virtio PCI SR-IOV member device to member device
migration. It can also be used to/from migrate from PCI SR-IOV member
device to software composed PCI device if/when needed which can
parse and compose software based PCI virtio device.

Example flow:
=============
Source hypervisor:
1. Instructs device to start tracking pages it is writing
2. Periodically query the addresses of the written pages
3. Suspend the device operation
4. Read the device context and transfer to destination hypervisor

Destination hypervisor:
5. Write the device context received from source
6. Resume the device that has newly written device context

Patch summary:
==============
patch-1: Adds theory of operation for device migration commands 
patch-2: Redefine reserved2 to command output field
patch-3: Defines short device context for split virtqueues
patch-4: Adds device migration commands
patch-5: Adds requirements for device migration commands
patch-6: Adds theory of operation for write reporting commands
patch-7: Adds write reporting commands
patch-8: Adds requirements for write reporting commands

It also takes inspiration from the similar idea presented at KVM Forum
at [1].

Changelog:
==========
1. Enrich device context to cover device configuration layout, feature bits
2. Fixed alignment of device context fields
3. Added missing Sign-off for the joint work done with Satananda
4. Added link to the github issue

Please review.

[1] https://static.sched.com/hosted_files/kvmforum2022/3a/KVM22-Migratable-Vhost-vDPA.pdf


Parav Pandit (8):
  admin: Add theory of operation for device migration
  admin: Redefine reserved2 as command specific output
  device-context: Define the device context fields for device migration
  admin: Add device migration admin commands
  admin: Add requirements of device migration commands
  admin: Add theory of operation for write recording commands
  admin: Add write recording commands
  admin: Add requirements of write reporting commands

 admin-cmds-device-migration.tex | 574 ++++++++++++++++++++++++++++++++
 admin.tex                       |  38 ++-
 content.tex                     |   1 +
 device-context.tex              | 142 ++++++++
 4 files changed, 748 insertions(+), 7 deletions(-)
 create mode 100644 admin-cmds-device-migration.tex
 create mode 100644 device-context.tex

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

