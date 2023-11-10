Return-Path: <virtio-comment-return-8314-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EA6AC4332F
	for <virtio-comment@archiver.kernel.org>; Fri, 10 Nov 2023 12:32:28 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id CEABB71C92
	for <virtio-comment@archiver.kernel.org>; Fri, 10 Nov 2023 12:32:27 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id BF374986D10
	for <virtio-comment@archiver.kernel.org>; Fri, 10 Nov 2023 12:32:27 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id B47E8986D03; Fri, 10 Nov 2023 12:32:27 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A74C6986D04
	for <virtio-comment@lists.oasis-open.org>; Fri, 10 Nov 2023 12:32:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GYfuBJ0WecNgNAzA9Jxkwctxmn29wd1XPILlilyJbT8PhRWmbD8eRxBFdyKMmkAkGJ0caSpP9sSgur1qW4RgYiPqeo4LNdxOL9My4MYQvuVcY+2vdsaqx1qB8wJ4aq8Vo9jgGi8OlB6swK7XtTNLlYAn+bsrhS4FP6Ry6HywivIB0FWKJWfH7Xq16TMBZa4g/cotPuc5M6eVYVYjE8k96sm6Mh8LtHhz9+vkbHo4YeJfO/SK4hlsJPDV+lOH2tKyovjEaPz2pWqx3eU64Ao51HZUoDm4YzQjDYvWqCJYEvOuQJbh0hj7cUQhfgxYMH3dak+bayxaknVhqLF6WoYvIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H2HRCIquCnqXX0DGN0WYNZ0uUVZqed9FABIsvR0L9VY=;
 b=gd4NGcwkgmRwrbjOP4SMgPWqZaS/y1NiiBQ7FbDCZa9uLAsy4gzs93/YRC0JdFUNXl7bVvleITi6oSkUgH+H3+ppCfg+2wkVISQ3l8gWOPSrTsXWA7W/wICpKo78MmiChBFRx7nblS+0Ha5TKWKkLSszyMimFm+eDqEvkPVAxMeciE1GkmVejrcV0INHAiGYLx8Ufab9QNgbBtxuBvPge+QI9WJRRvdN1tlyQtVp8o1N6tpDoj/SmueHNV3aiBPWh66+bgnpA+tbr3man32mjJUPJqtnCrjyu2TTQEFXxGTskzhdEOjZ2eAIiOZKoJs/gdzsa8ebunQxuPrJhd6z2w==
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
CC: <sburla@marvell.com>, <shahafs@nvidia.com>, <maorg@nvidia.com>,
	<yishaih@nvidia.com>, <lingshan.zhu@intel.com>, <jasowang@redhat.com>, "Parav
 Pandit" <parav@nvidia.com>
Date: Fri, 10 Nov 2023 14:31:52 +0200
Message-ID: <20231110123200.2082779-1-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DC:EE_|DM4PR12MB5985:EE_
X-MS-Office365-Filtering-Correlation-Id: 9095e117-bc46-4ca4-4f9b-08dbe1e917b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	22zyabLRO+0NUaFm3SQKCC7WnXv6hWxa8poWG3x6cJjmHAzJ7IVnmSs21ZV7ZW3jW03XmeJtokmGgUuKjAhfID5p4f2d+0JnVXPSdj1mQFpOyJ1g20XnW4akWz6PE96aRMtpYk8FJD9ZzmlXVIPFr/o84Oc4O2/8X4veSGp/L1FTu7ifjQs3sy/N2p8TIeGJGfNTUymlZB3qLB3OLAkqqfPLFgsDaeEvfz/1gamshrvUWHjPICyNT8HpPaopEYD/9A9uEg8lX0f3wl7ogkD/5jOENgva4dctD0wec87fz4NYSLT2grbL8Wgt0oRFmhNmeFyu3VFT6LnrECfbT1Y3eeAw0+/jaKAkjUXpbshoWdG+tyRZjqZu6lvmKw7xhn2OXNMF7XY8+NbLKDAYTY2NvpCkg0gzLspHRgn8tYSyuk27E+3sp6X6+huZqWWh2Jj/bK6TWWASmRvtKpfa5hBon5T2wz9PZ8B8tsKQs4OR716SW8WIdODgaf50VJT7MxiaJRpWoXjJu+dYu4NeI6tXpoS7+VSyw+fpm4qVNfd0WV+7VYIcneB4xvEDW7geYn5BhiVbyy8Cq1UnJ2EJtqCIyQkwjIckYS+MEMtW133JzAGrgnAsoBx5iAn180GOpSAZoKaACYANOZ+uG/QzmUXzffdkOj+XcX/VMnBPq0rUygoBvla6CeX2MqR8OHVTFDYEXsXTxrm24LFv/BXOSrmZQ+UTVtXVsinYRVoEyodI0W3AUMCmjZlFe1wVS9zl7h2gcZQAitoo83qlAk/uqJzh5mw5xwXzFrSWqExtE+8WchXnqLdGycRLHoAl9py7z+POtu6HYL11RWlXWafNwigETw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(396003)(376002)(39860400002)(136003)(230922051799003)(451199024)(82310400011)(186009)(64100799003)(1800799009)(46966006)(40470700004)(36840700001)(356005)(7636003)(66899024)(41300700001)(5660300002)(36860700001)(40460700003)(2906002)(36756003)(86362001)(82740400003)(426003)(2616005)(4326008)(83380400001)(8936002)(8676002)(966005)(316002)(54906003)(70206006)(336012)(1076003)(107886003)(26005)(16526019)(110136005)(70586007)(478600001)(40480700001)(6666004)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2023 12:32:24.3235
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9095e117-bc46-4ca4-4f9b-08dbe1e917b8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099DC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5985
Subject: [virtio-comment] [PATCH v4 0/8] Introduce device migration support commands

This series introduces administration commands for member device migration
for PCI transport; when needed it can be extended for other transports
too.

It takes inspiration from the similar idea presented at KVM Forum at [1].

Use case requirements:
======================
1. A hypervisor system needs to provide a PCI VF as directly mapped
   device to the guest virtual machine and also support live
   migration of this virtual machine.
   A direct mapped device has typically only PCI configuration space
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
3. A virtual machine may have other PCI directly mapped device
   which may also interact with the virtio device.
4. A hypervisor runs a generic device type agnostic driver with
   extension to support device migration.
5. A PCI VF direct mapped device needs to support transparent
   device reset and PCI FLR while the device migration is
   ongoing.
6. A owner driver do not involve in device operations mediation
   for the direct mapped device at virtio interface level.
7. Mechanism is generic enough that applies to large family of
   virtio devices and it does not involve trapping any virtio
   device interfaces for the direct mapped devices.

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
of only data path acceleration instead of direct mapped functionality.

In future, for nested environment may be able to utilize the same
infrastructure with VF capable of supporting nested VF with SR-IOV
capability. Such novel approach is also being worked in industry at [2].

Page write recording functionality is optional for the device.
If platform supports it, it can be used from the platform, if not
if the device supports it, it can be used from the device.

Example basic flow:
===================
Source hypervisor:
1. Instructs device to start tracking pages it is writing
2. Periodically query the addresses of the written pages
3. Suspend the device operation
4. Read the device context and transfer to destination hypervisor

Destination hypervisor:
5. Write the device context received from source
6. Resume the device that has newly written device context

Example advance flow with small downtime:
=========================================
Source hypervisor:
1. Instructs device to start tracking pages it is writing
2. Read current device context and transfer to deestination hypervisor
   a. Destination hypervisor writes and setup the device
3. Periodically query the addresses of the written pages
3. Suspend the device operation
4. Read the final device context and transfer to destination hypervisor

Destination hypervisor:
5. Write the incremental device context received from source
6. Resume the device that has newly written device context
   (likely very small context that containly only virtqueues descriptor
    indices, in-flight descriptors indices)

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
v3->v4:
- updated commit message to be more precise for mapping
  a PCI VF member device to guest virtual machine
- skipped adding msix table and pba table as they are mainly
  programmed by hypervisor which has the knowledge of vcpus
  and contains system specific encoded information which may be
  different on destination hypervisor
- moved vq enabled field to vq config struct so that it can be used
  for packed vq and split vq uniformly.
- reduce length in the field tlv from 64-bit to 32-bit to be realistic
- added missing num_entries in the feature bits tlv
- fixed copy paste error on structure for
  VIRTIO_DEV_CTX_VQ_SPLIT_DEV_OWN_DESC field
- corrected discard field type location and enum values
- enhanced queue context
- made device context read command more flexible for device
  implementations
- improved read command to be finish quickly during freeze mode
  to have lowest possible downtime
- improved description for query supported fields command and
  device context to report the length in it
- moved read context command dependency on output field
- added remaining context size bytes in read response so that
  after the device mode is changed to freeze, the driver can
  get most accurate information quickly to decide when to stop
  reading the context from the device
- relaxed device context formation and processing to simplify the
  device implementation
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
[2] https://netdevconf.info/0x17/sessions/talk/unleashing-sr-iov-offload-on-virtual-machines.html

Parav Pandit (8):
  admin: Add theory of operation for device migration
  admin: Redefine reserved2 as command specific output
  device-context: Define the device context fields for device migration
  admin: Add device migration admin commands
  admin: Add requirements of device migration commands
  admin: Add theory of operation for write recording commands
  admin: Add write recording commands
  admin: Add requirements of write reporting commands

 admin-cmds-device-migration.tex | 690 ++++++++++++++++++++++++++++++++
 admin.tex                       |  40 +-
 content.tex                     |   1 +
 device-context.tex              | 258 ++++++++++++
 4 files changed, 982 insertions(+), 7 deletions(-)
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

