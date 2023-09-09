Return-Path: <virtio-comment-return-7289-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C815FEEB580
	for <virtio-comment@archiver.kernel.org>; Sat,  9 Sep 2023 14:29:40 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 0447AC623E
	for <virtio-comment@archiver.kernel.org>; Sat,  9 Sep 2023 14:29:40 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D7A85986636
	for <virtio-comment@archiver.kernel.org>; Sat,  9 Sep 2023 14:29:39 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id BF797986608; Sat,  9 Sep 2023 14:29:39 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id AD9FF98660D
	for <virtio-comment@lists.oasis-open.org>; Sat,  9 Sep 2023 14:29:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bt/1AC4pjjAaoqTn2av8sb/e7PzepFdLIZYv8MERFMTmpTwWPmb7c6fhzX6+32f5OYHfLjdS7X1RDCVnKX+Fbyc1FCYLY5eXJmW2KfVmfs1dTJqj/wbQR11SzSFe1kkcOdMxOe3/4FHfIKU83xHsoTVgwJjmiLR3q/fLTGjS/LzLZvsme6X4TJNFkf52OuwNsK8rqs77H9HdF1LYJnoIGlR9RNPwtxHZTcDAAb1bA6oO9xfn2C9ulwa/c/JCwr99F9QE9tzR7/+GyuK2rnOCPoaSpc/zHPSFuvGmec3JOOP/VgEfzprGalutw+NL+TVnZotRuFWVWteshwbejFlQZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LRsufTnb7zIhVMI/taan9jN14/bbyqiSNQuodv9JI0s=;
 b=iKCxNtF/+FPsP4QSkszXufJyQSgwyStTLJTz2SfcKlAHRjQWaLO0wI0GQLsOeslRZfvecz/WCIbzf23tTxUiF0qizeO52GyVrqW0n/C+OXJB//00k2YudSl+buqTa0woZRc7N5Goa/lzB30l1jtVyFalgdjGBJygGH+6DHgr7fGqxgB0nuifK4geir3xJx1++71qKDQTBU+6P8b+7A+cRHHVGo8AMLRA/OMq8+1n46sxWkpkXVPO8JzgpBQDkZYsTU7IVwCSHf6VrcojIFdgnzGeYPgQR5OuVNr0LTfPzm2bSajJTYGz8Epgfju7+k/DUX2/50DhoqvQziVmUllyjA==
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
Date: Sat, 9 Sep 2023 17:29:03 +0300
Message-ID: <20230909142911.524407-1-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529D:EE_|CH3PR12MB8658:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e0bbdc5-daf1-4ddc-dcbb-08dbb141303c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DIUTeg8dr3RIU4WD1+9W0IIFBRAE8UWtEDhV8uYNNXli6AxPC2M05I7NFvhsdCUD3zuBL1HLWsaIYocVSJT55Lr0LVToxmaYY/cx8wiyPYkt5IcKemVLPP5shRY3rNzWTqJh27RZhdjDDZgXdrGbNC52xYFDGvJHwycB0KQXV7+WF1qqZ64HRDT5cW9DW29REpekDCmSRUXusQ/S8/GQVTaHL0AVMyT/2DEQL6VMwCgoi896TS/epXSad5EY4H6gjueHKjHvPQi5vDz/LiKtbs9ZVpS64M/AuuDC2Aw55NBuAnIje5g2yZ5AowsEFy0lP89Xby0jQFZxcDHqEInuyF3VHwlJ3M1mFEu7AZRRRZB1VQd0UDBgu9USVFYvQLVE9bQVuioWYD7pJGvfN/ihkHRz9KkTowj2wt6iFw6WcmBt2HDpJzjqNMIVe7UX2Z/Zm9Rj/vq8+O4pq/YPbAZbFfrHjCdBgRQX15t+tdaQAIEwWFd+LcLnx/aQvUPYZ1k0eMYbIRzlsZhwVjNUuy17EuoYHX3kdp+SPWkLbr1Cy+vnBPZwE36r+boQ0uVfAWkhDmVlXQKn9IN+MomUKzuM3a6Rnj+6HOX6cGWfNdgMCoGYuhrmR+X75b0CSsSmz2OcviIhW/TLoGPnpiQghKTrCQDQFKFVz1q03ftAWMyDaE4hsTnkxR9AidFDSU0fmnzXU+ECgNgmiDEsp2zF6fO8/CEqBSblOuHjQAIv7BWi97DV2QVRgB+aMe2b0fo62+YT/o48+ieKvg2jy5ebHN5+p+UQeoOO9KTtxBhY2wYOsMw=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(39850400004)(396003)(376002)(136003)(451199024)(1800799009)(82310400011)(186009)(36840700001)(40470700004)(46966006)(4326008)(8676002)(8936002)(16526019)(26005)(2616005)(107886003)(83380400001)(1076003)(5660300002)(336012)(47076005)(426003)(36860700001)(40480700001)(41300700001)(40460700003)(70206006)(70586007)(6666004)(54906003)(7636003)(478600001)(110136005)(316002)(966005)(86362001)(82740400003)(2906002)(36756003)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2023 14:29:34.1780
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e0bbdc5-daf1-4ddc-dcbb-08dbb141303c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002529D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8658
Subject: [virtio-comment] [PATCH 0/8] Introduce device migration supporting commands

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

In next version v1, more detailed device context will be defined
along with requirements.

It also takes inspiration from the similar idea presented at KVM Forum
at [1].

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
 device-context.tex              | 107 ++++++
 4 files changed, 713 insertions(+), 7 deletions(-)
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

