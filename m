Return-Path: <virtio-comment-return-8042-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E05FC4332F
	for <virtio-comment@archiver.kernel.org>; Mon, 30 Oct 2023 13:20:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id DE70C26A44
	for <virtio-comment@archiver.kernel.org>; Mon, 30 Oct 2023 13:20:35 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B2341986B42
	for <virtio-comment@archiver.kernel.org>; Mon, 30 Oct 2023 13:20:35 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 92088986B34; Mon, 30 Oct 2023 13:20:35 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 82482986B35
	for <virtio-comment@lists.oasis-open.org>; Mon, 30 Oct 2023 13:20:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mKEo9Y1YwvjCuAvTQDswtWjJWMa5XsfFnV5rNlkzjQxSbC1y45k1UUdC8H5O58onY7kYDlEEQieYig/yCqqNY92Rli4ZnIqS7wCfqvw1NtNskO5Z2UM5DW7DRqcDQHAhhJ5tSSfFezmS0RtFgdmtHA6yOkxWH6BNe5lGuS0zIQRkWhtc/kWU7w6sCSfYDrmOIf8uPl4HHWu+kShJsrpZ95mJ95sifMC1/uQLZojaxfj3ZRY8LIBoqAzhrykr85kB2eVkSJZh0huq2opSrz9kGOZhGv6Wk3NqDgpWyIbaL0lZlmUiotQQq5Uc5EVye5cHP49B2Y+iShQya6zFdNFT6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KuDqw71JPPqXpC2N5rF2n+LtmgRzPOfo9XbQNVd2fq8=;
 b=kCA/JeKLhddQktA4P8TB0QeUPZ3fdkE5fQjHi52E9PvU1hiBE015fO61jrxNBh/C60ioj0tJK9Yq6OWk3Nnqr5F7cWVP9acsRocXOiu6746Wqdw+7LZNj5RxMQmXmFZkBVvDsnLMLAOMtcURnB0er/cmVHJDVGYkwlSBEd2GrLKiPF3ck113wXY6yoJcHrQDixmHs6AuosY4psjo8jgchmDgHgvEC3WVP4YRN9T+kogYsY8PXXOcCjYzGBw2hejwEuNOC4PWeMvtx7pfVGMooGh+Lrf4GpsTOzuCTatIS45gcw5vHpwwIZt5xx/9+Q8tjwZybyn4D8M4qv7sjhzDSQ==
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
CC: <sburla@marvell.com>, <shahafs@nvidia.com>, <maorg@nvidia.com>,
	<yishaih@nvidia.com>, <lingshan.zhu@intel.com>, <jasowang@redhat.com>, "Parav
 Pandit" <parav@nvidia.com>
Date: Mon, 30 Oct 2023 15:19:51 +0200
Message-ID: <20231030131959.1386107-1-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017094:EE_|CYYPR12MB8872:EE_
X-MS-Office365-Filtering-Correlation-Id: bc700220-ecbe-4b2e-b198-08dbd94afec2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	00cPR6mhX50cm1T56yBhtDTbFaznM49M7vayeRoX38DXyGi2BZNfS0lOOLHu8OsnCELjNvlJ3lNQZB0r6IJMPPZTZuNOkYFrm7LxKFkGEXs+8nEX4nfN6TAps1FBZJzJb1SaN4q+3Kg+6YqPxv3My/KSGaZOfUWrfQe5MkX9BSVQqwPL2zhzy2ZNtRpg8FZjLFDOWbDNmv2G0yt9P12mCB/Oi/a9fX/e3A6MTNCt1lCnmo9z3gKRY3li0/tQ4o4WPx7m+lpFV7nVuJfkRiKtVs4jqlpjdEIG4kmd3W1kPuSGgzBnthU5c8v8icuLki/OzrAtz6Q78olgfxsuIby4hDzwfVug+lBp6d7JIsRBzoSNdagJTP6848NtshAxaFiTKJHbJprKxmJWsJcenvpjTESla6fxz9NWJws+WBy9mjew4Pc8xzKL19n7fmVpLc8alUHVsB9MezKPY4WL4m01H6s7yNsoi1mdwcHBBur5K/eY+B8IUDBU87Omgevw3nfRZcPUeNE62XCIHZZnk7lGUkNQ7sTyzXXyfmCW0Hk9WUlmDx8+LiRsQzapIr4HxiNeY5RFO3ZS2cfPHNMnETQ7+iYFXWkU/OHEtvbX5nqpGD9RNJUMos1B1vA2OSD+DQIvacfCXhjY0LzRrtnMeVB0lqsxFtTXM9cBbIShGx6jceL83BJjsTMNNq0Mm3hC/adib7zOfLgLJqTvDsSZVHJma7h+nuZdXltbvMSBdnQ9vLlTsXyrD1+XVz5LWMNOa07JxJKVCX9ky14d6ZOjKnfAirYWkIAnQt2xazNKdPBnKPU=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(396003)(136003)(39860400002)(346002)(230922051799003)(82310400011)(64100799003)(186009)(451199024)(1800799009)(36840700001)(40470700004)(46966006)(66899024)(1076003)(26005)(16526019)(2616005)(40480700001)(40460700003)(86362001)(36756003)(7636003)(356005)(82740400003)(426003)(47076005)(83380400001)(336012)(2906002)(478600001)(107886003)(36860700001)(6666004)(8936002)(4326008)(8676002)(54906003)(316002)(110136005)(70586007)(41300700001)(5660300002)(966005)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2023 13:20:32.6474
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc700220-ecbe-4b2e-b198-08dbd94afec2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017094.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8872
Subject: [virtio-comment] [PATCH v3 0/8] Introduce device migration support commands

This series introduces administration commands for member device migration
for PCI transport; when needed it can be extended for other transports
too.

It takes inspiration from the similar idea presented at KVM Forum at [1].

Use case requirements:
======================
1. A hypervisor system needs to provide a PCI VF as passthrough
   device to the guest virtual machine and also support live
   migration of this virtual machine.
   A passthrough device has typically only PCI configuration space
   and MSI-X table emulated by hypervisor. No virtio native interface
   offered by the virtio member device is trapped and/or emulated.
   This includes utilizing member device's native virtio common and
   device config region, device specific cvq, data vqs without any
   VMEXIT from the guest virtual machine and without any device type
   specific code in hypervisor; this is because it is already present
   in the owner and member device natively as unified interface for
   guest virtual machines, containers and may be more use cases.
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

This can also be useful for accessing member devices using some variant
of only data path acceleration instead of of major passthrough functionality.

In future, for nested environment may be able to utilize the same
infrastructure with VF capable of supporting nested VF with SR-IOV
capability.

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

Please review.

Changelog:
==========
v2->v3:
- updated cover letter to reflect the use for passthrough and for
  only data path acceleration
- updated cover letter to utilize same infra for nested
- Addressed comments from Michael
- updated read context command to not depend on returned data
  length for closing the read context stream, instead depend on
  explicit read response with zero length
- fixed copy paste errors in write context command for fields
  description
- added device and driver normatives for {_START,_END}_MARKER fields
- wrote member VF device instead of VF device
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

 admin-cmds-device-migration.tex | 672 ++++++++++++++++++++++++++++++++
 admin.tex                       |  40 +-
 content.tex                     |   1 +
 device-context.tex              | 241 ++++++++++++
 4 files changed, 947 insertions(+), 7 deletions(-)
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

