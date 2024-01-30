Return-Path: <virtio-comment-return-9051-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82595C46CD2
	for <virtio-comment@archiver.kernel.org>; Tue, 30 Jan 2024 14:08:15 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 03CF160F4B
	for <virtio-comment@archiver.kernel.org>; Tue, 30 Jan 2024 14:08:15 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id F39CD98687B
	for <virtio-comment@archiver.kernel.org>; Tue, 30 Jan 2024 14:08:14 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id E8A3B986687; Tue, 30 Jan 2024 14:08:14 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7C7519868CC
	for <virtio-comment@lists.oasis-open.org>; Tue, 30 Jan 2024 14:08:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OeYBMTZwfRoamBy3DcjtBRHIZXUFcSN8VndkO48vgL/mVCgXeqeSc6A36uOVwkJKcw//Eqt2lFwzNSaW8MEHPaY5YuNyHOASkfJgf/2rvtEOLeK9iOgcnjA5v92hjG5VhmX8oIj0VFzXLuZPKm9JWjEIcO3jIBJt2/8c3hSHaOLeIvKD7FltliXNNwM0hAdNFTsGi1fa5o+VuUZxrPfZcNOmfVj/AphSmtBc5gYJP77H2llIeP09nE/rwcLwS8MR30aWw8HixbRieQGjSpIjvTfu/WglsaJA7cmMZyBcLGGp2DaK0lbAM2actVnFCpcnkcUoUvJZEkplb7OE7vUpUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8DXnPotUe+VHv1eiDLUilyv5hPOZ12EljrDAZ+h/Wdo=;
 b=gSsOg6zBTOC72q0KEFm8JL45v8EDJ2bMBAAQwFc2BspDnhYRn5NBWnjjtMzMHSsS/z2mjI6i1DxKNucdhbVKBroCw3trTYJE2e1X4w108Gik8nw1hjHCe6E0w8/y1e4ajQI9BtsrUbrDNdxwjvrT0UszaE4PZ8rD04XMgmQrGNDphxUefxCudPNnfb1/9QenWRJ3Uysy75dAhxqg49sQxPjiOHEJIxbdAUoquV1fkx7B6q1AW18U5LLCN9Lr0f4LTLIy4c3FbjdGRkKvR+3fm+RFlkBlerMpfzNaUQ6CoImKKte3LTJVAMuOSdbJihTxAtCbugp3f+vm6NIW2sRYGw==
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
CC: <hengqi@linux.alibaba.com>, <sburla@marvell.com>, <shahafs@nvidia.com>,
	<si-wei.liu@oracle.com>, <peter.hilber@opensynergy.com>,
	<jasowang@redhat.com>, <xuanzhuo@linux.alibaba.com>, Parav Pandit
	<parav@nvidia.com>
Date: Tue, 30 Jan 2024 16:06:41 +0200
Message-ID: <20240130140642.406882-13-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240130140642.406882-1-parav@nvidia.com>
References: <20240130140642.406882-1-parav@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECDA:EE_|DS0PR12MB7876:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e4ced53-2208-474f-540a-08dc219cdb99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XS0SHLS2jooKydlQOTi/iTApMOVlBFISrsS5hJtUubWRN6GkRkElpv+ePKe70yw4BDoH98tPeV1t9jRNmM1eB1J//gHWi5zz0iqrPww/MjToSfEp/3p4lmvOc+x32lz2HgHZR70hz3j3ueysYhbdDEx/rLbDqkK/7YbJPZupubx11G2OzHaH3tQRDH6dyF8H4fyuwnQpIImoYoUM7KrgQV8nn4DkV59JFljmGQ9jvjXZpyBSQOtlWUnhSSUvAZCujDew/HQmu7NDb0LdiGiQObKjZeCvv/AQqIdEjuM4Htq5PuXRxJ+irfxaor7vt4m9iC2jC1DgsOSHZMUNhI35Ko4q8Rl/zYoea7dk04YwwwflP7APIDfKqGvwTGkK10f8pjGFOgawA6L0VswxFstgfzu6X0yZYoyt1D+cHqyTs6GMTcfNZPZMJN0L8jG3P6SReXpd2+z2rB7LnCA/4usDsbE+OXW5uiktPwGSVBT1vRcaTMhOxEp4pn8uiIzXvJzEEIZmDgF8ESsOWiedVXCOmTpwCKYuO0Tw0hWdT/iX/fRkxYX7sYSuVPyfnhOjvSQ2kkxN7nPl/JQawD5nf4SpaScCINm/Qr39UqQmurmAFq0khrcw/hE7eHdeaM8qa1e38lKwMRZbav5VYSQ5igHwWjl0h1nTK9LdK/0r/i19yZR0v5gSNByi4duBAKJgHAzI2S9FhFVtApGHBjVDweAriZZjK+xDNb3LFD+zxHISmqquoKqkccPFhJZr2ZIUfQuPcF6jT/+N0MV3/sbR2EHs5ZvDbuZ4XmHBSb2IQz1C/9w=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(396003)(346002)(39860400002)(136003)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(82310400011)(46966006)(40470700004)(36840700001)(41300700001)(1076003)(2616005)(6666004)(107886003)(336012)(83380400001)(16526019)(426003)(8936002)(8676002)(5660300002)(26005)(4326008)(7636003)(316002)(478600001)(70586007)(54906003)(86362001)(110136005)(70206006)(36860700001)(966005)(82740400003)(356005)(47076005)(36756003)(40480700001)(2906002)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2024 14:07:56.0610
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e4ced53-2208-474f-540a-08dc219cdb99
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECDA.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7876
Subject: [virtio-comment] [PATCH v8 12/13] newdevice: Improve the appendix chapter heading to reflect the content

Current appendix chapter already covers useful notes for creating
new device types and also for extending the device in
'device improvements' section.

The chapter heading was not reflecting the notation for extending the
existing device. This sometimes creates confusion/misinterpretation to readers.

Hence fix the heading to reflect the written sections.

While at it, remove the empty lines at the end of the file.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/179
Signed-off-by: Parav Pandit <parav@nvidia.com>
---
 newdevice.tex | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/newdevice.tex b/newdevice.tex
index 28e1c7b..93feb71 100644
--- a/newdevice.tex
+++ b/newdevice.tex
@@ -1,9 +1,9 @@
-\chapter{Creating New Device Types}\label{sec:Creating New Device Types}
+\chapter{Creating New Device Types or Extending the Device}\label{sec:Creating New Device Types or Extending the Device}
 
 Various considerations are necessary when creating a new device
-type.
+type or when extending the device functionality.
 
-\section{How Many Virtqueues?}\label{sec:Creating New Device Types / How Many Virtqueues?}
+\section{How Many Virtqueues?}\label{sec:Creating New Device Types or Extending the Device / How Many Virtqueues?}
 
 It is possible that a very simple device will operate entirely
 through its device configuration space, but most will need at least one
@@ -13,7 +13,7 @@ \section{How Many Virtqueues?}\label{sec:Creating New Device Types / How Many Vi
 receive input, and one which the driver places buffers to
 transmit output.
 
-\section{What Device Configuration Space Layout?}\label{sec:Creating New Device Types / What Device Configuration Space Layout?}
+\section{What Device Configuration Space Layout?}\label{sec:Creating New Device Types or Extending the Device / What Device Configuration Space Layout?}
 
 Device configuration space should only be used for initialization-time
 parameters.  It is a limited resource with no synchronization between
@@ -26,14 +26,14 @@ \section{What Device Configuration Space Layout?}\label{sec:Creating New Device
 writable by the driver.  Therefore, no writeable field which triggers an
 action ought to be wider than 32 bits.
 
-\section{What Device Number?}\label{sec:Creating New Device Types / What Device Number?}
+\section{What Device Number?}\label{sec:Creating New Device Types or Extending the Device / What Device Number?}
 
-Device numbers can be reserved by the OASIS committee: email
+Device numbers for the new devices can be reserved by the OASIS committee: email
 virtio-dev@lists.oasis-open.org to secure a unique one.
 
 Meanwhile for experimental drivers, use 65535 and work backwards.
 
-\section{How many MSI-X vectors?  (for PCI)}\label{sec:Creating New Device Types / How many MSI-X vectors?  (for PCI)}
+\section{How many MSI-X vectors?  (for PCI)}\label{sec:Creating New Device Types or Extending the Device / How many MSI-X vectors?  (for PCI)}
 
 Using the optional MSI-X capability devices can speed up
 interrupt processing by removing the need to read ISR Status
@@ -51,7 +51,7 @@ \section{How many MSI-X vectors?  (for PCI)}\label{sec:Creating New Device Types
 number of vectors as possible, or disabling MSI-X capability
 altogether.
 
-\section{Device Improvements}\label{sec:Creating New Device Types / Device Improvements}
+\section{Device Improvements}\label{sec:Creating New Device Types or Extending the Device / Device Improvements}
 
 Any change to device configuration space, or new virtqueues, or
 behavioural changes, should be indicated by negotiation of a new
@@ -63,5 +63,3 @@ \section{Device Improvements}\label{sec:Creating New Device Types / Device Impro
 can use a single bit, but if one feature makes sense without the
 others they should not be gratuitously grouped together to
 conserve feature bits.
-
-
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

