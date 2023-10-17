Return-Path: <virtio-comment-return-7762-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4413CDB483
	for <virtio-comment@archiver.kernel.org>; Tue, 17 Oct 2023 20:07:21 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 1DA11750A4
	for <virtio-comment@archiver.kernel.org>; Tue, 17 Oct 2023 20:07:21 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D081D986886
	for <virtio-comment@archiver.kernel.org>; Tue, 17 Oct 2023 20:07:20 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id B088098687E; Tue, 17 Oct 2023 20:07:20 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 910F3986880
	for <virtio-comment@lists.oasis-open.org>; Tue, 17 Oct 2023 20:07:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CEO0PNrNU9F0Ep1aUlqINxHsM9c9P9Qzl4hsblgjR1bnYJpCX/sG/WW+ZePG0fbIElo/x6xgmqgaLz4k0wwipkqwXZvXmW2XP9iwB07SKZXEna9BuwlQU/Ij5oB2G49Q8uofNBUwnQ2SLFzvqzoxKDX+W5iOduZYJZQ3wenVl51ePeE0+Ea6uRZhryOi5k55IChJ3iyG5CPaJg5d/q70+sFz/R7gVOStN7Q2JkL0mBieixL9/vNvNXRBcTa3LbdeHcfwldUOYU+nhGrAR6H8jJQ/DhrXxLsmn1IPzdYPshgDO9sxbzePq+0VbMt9fQQ3qYVK8CNdDFFp/wISb+Q1Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TZv5ffBpqaBF3O+KtGQBpz+wgw/89Il2qLmaW/xLKOs=;
 b=CxsVdII0rBHcxvVWn1Q2MHU9HBe6Q8a0y6bAY9A+nKawwrnN/dYEbAiA/WyIgOrWQvLrpHl7DPYtceXmpljIAPa5QN/VgHxKPEh5N3+CmCbUrbYVRO3gwTzL7uGKyGVYmGDaUmuoXE6sJRgNqV2Y4GjD0e6fThTOi1YncLLZk4QPx5tYi/V8pozYUbHuO7eykWMI3nGdPKl1D8d6HB/gI2ThGKS0uSGLfUfAazD+riuoAIbQ6i+Uc0xkdWS4yQA16h1mdt6CBZVwQolgzA6ahkbehqtTGfi4iOKmwG0l8lN+0jJzuJXdY0m9I+mYCclP6oDGB2saDaVlXOIeOrWgwA==
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
CC: <sburla@marvell.com>, <shahafs@nvidia.com>, <maorg@nvidia.com>,
	<yishaih@nvidia.com>, <lingshan.zhu@intel.com>, <jasowang@redhat.com>, "Parav
 Pandit" <parav@nvidia.com>
Date: Tue, 17 Oct 2023 23:06:37 +0300
Message-ID: <20231017200645.779222-1-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003447:EE_|MW3PR12MB4364:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a24d2fe-4a27-42f7-f2b1-08dbcf4ca691
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pewdChnXxpgtwOzM8e3ZBpp160ENp25Pvne0UKxKaKrdKSZn34sKzNPS70VCnhTauZfTs2SgL0t1bbiUiRCWWiItPVtz3ss2sDDDhY4i4tYQ2+BwJSx6HwF4q7V028G5Fk0Td//Kjax3lxZ7EcU08GClZ+YYQImHIMbOPiwlpUgYnESW3bVtrUQXCbLE6Sc+1ui2DHdvM3nlWz/GztqWB2RxXAbfmfETFNqaeYtldmDB/a/9EV8wU7X+fIi7fQ2Ms365qi4CMJEGkUV96BBm3V6523+ICpXA9Q7S3vgTAilouOyY0hnSzWIn/ELLQIP00dNtlcP5n93Wx9DuK+L33t3kripxIqwjV+2hBbpoW6BjVOc3DHKDOAXZ3rwkbyXHDVEEtAJf/lj466SKbLaNDokTDmDVb65MMY8ojIOltaxO01b96EyaPUu6gcifFHx4rKMUH32o/dj7frtZMlh1uCDvZ1564GjgXjqSi3fp6JweiYNVFXAOMYTLojiKq8JOuBPdnJBXkkX5YhragEOcfwGAkJArIGLyESs/S6lfqx9nyPU4ktMsrZcc5AzD8fCmuPTyZ0JIWPAMzsDpU7k/61T/EoePHTmnTUU3Vk1J9eLd3HxmKKpVm2G6EhBqYFrbBSkTNZvTBleqNzYqEyfLRlCOz6b9oy544ZtzlR1RYjOAl1KRvjSVutgxojyL4PWzGL9pWEc5RuumoEk9l/DQwknydRR206tlwHQcWi+17Kkpl3ssmLFo38/gR4AvhXv72YUgstZm7Exta4zqG2KNJT2y9A87Wq1HL1PqYgTzgII=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(396003)(346002)(376002)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(82310400011)(36840700001)(40470700004)(46966006)(66899024)(966005)(316002)(40460700003)(70206006)(70586007)(54906003)(110136005)(16526019)(2616005)(1076003)(426003)(336012)(26005)(47076005)(107886003)(83380400001)(40480700001)(7636003)(356005)(36860700001)(86362001)(82740400003)(36756003)(478600001)(6666004)(2906002)(41300700001)(5660300002)(8676002)(4326008)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 20:07:12.0228
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a24d2fe-4a27-42f7-f2b1-08dbcf4ca691
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003447.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4364
Subject: [virtio-comment] [PATCH v2 0/8] Introduce device migration support commands

This series introduces administration commands for member device migration
for PCI transport; when needed it can be extended for other transports
too.

Use case requirements:
======================
1. A hypervisor system needs to provide a PCI VF as passthrough
   device to the guest virtual machine and also support live
   migration of this virtual machine.
   A passthrough device has typically only PCI configuration space
   and MSI-X table emulated. No virtio native interface offered
   by the virtio member device is trapped and/or emulated.
2. A virtual machine may have one or more such passthrough
   virtio devices.
3. A virtual machine may have other PCI passthrough device
   which may also interact with virtio device.
4. A hypervisor runs a generic device type agnostic driver with
   extension to support device migration.
5. A PCI VF passthrough device needs to support transparent
   device reset and PCI FLR while the device migration is
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
covering PCI transport, peer to peer PCI devices, page write tracking
(aka dirty page tracking) and generic virtio device context.

1. Device mode get,set (active, stop, freeze)
2. Device context read and write
3. Defines device context and compatibility command
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

Please review.

Changelog:
==========
v1->v2:
- Addressed comments from Michael and Jason
- replaced iova to page/physical address range in write recording commands
- several device specific requirements added to clarify, interaction of
  device reset, FLR, PCI PM and admin commands
- added device context fields query command to learn compatibility
- split device context field type range into generic and device specific
- added device context extension section to maintain backward and future
  compatibility
- several rewording in theory of operation
- added requirements to cover config space read/write interaction with
  device context commands
- added assumption about pci config space and msix table not present in
  device context, which can be added when hypervisor need them
v0->v1:
- enrich device context to cover device configuration layout, feature bits
- fixed alignment of device context fields
- added missing Sign-off for the joint work done with Satananda
- added link to the github issue

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

 admin-cmds-device-migration.tex | 641 ++++++++++++++++++++++++++++++++
 admin.tex                       |  40 +-
 content.tex                     |   1 +
 device-context.tex              | 189 ++++++++++
 4 files changed, 864 insertions(+), 7 deletions(-)
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

