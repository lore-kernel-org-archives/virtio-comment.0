Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2060.outbound.protection.outlook.com [40.107.236.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 538D5524C9
	for <virtio-comment@lists.linux.dev>; Tue, 21 May 2024 12:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716294620; cv=fail; b=REVhaD17Q4y+xstOFAJF6WIn51br6Euo4ixZTrNkRd3PAseWODSpeG5LzxCDMUsyi+jX6rshphl5PCzQ6VLEYgeZnCW5qMaaj/B7KQSziqDRyotNj4uvvEzATJAIyEoCroP4HpiORePvVxgyXtjLgiF7wBt2WaFpXtpvuMOLnLQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716294620; c=relaxed/simple;
	bh=8OZWmnSNdK0y+BqVTbIR58WHMpePaz6lk4dnrTfAZ8I=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BTKEPK5tY02Oa0daELOcT7Bx88Fq5F0E3ashZI3inSdOc4hOHk0yr/eVUZbQAp5YfDDZG6Gz4Yg0j2znQ5rzyPe9tGzJoJhRErGAPEwO6gjE+GkSW38+2/UpYHSUqjs7AFxEAMBTDt/so2eShEEISZoI2uFGPk2Dcw9APjuhFYo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=LgUb2C4l; arc=fail smtp.client-ip=40.107.236.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="LgUb2C4l"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OSVJ/tEtW8oHUpUW/mhU5SOILsFedjlKQrS2/EP0oXVc3E5vV9YJVt47qMLW6khXd1L5PpK1D69B5wiUaAPK0CA3d3TB0yg5uUSWCoh2bh5YzjEHTU10RiP+48DxuVHYAdFUrFSuZpEzPe62SYTQLPZH1wtm/jY0WK21UTfbEF/iPK4cRN3CheX57M5AYFUULp6jdtq/qvu3XoUt0kifdRoy03e3++q+i9Ny4VuojZC7o6cxF0W38e+E7/BGV31mFUt+4JHNRM/23navkwQM65mhZxnBsvIfM7BYtiFPUascu0L3+Q+WCUlFa1kiGLqShtWApcWSfwTbhlAQEQY4jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OuoxdxgXCdA9Fx1onJBmNMdogjKdmgcXm2NoGlPIVFQ=;
 b=OzJNIQVZG0DNBeNSK+3usK9wgJKQiK5zfcKCZI+HbDCeIktKBnNRJJDOyf5DVap9Mqq/t9pQguTqvDOZKQzjncSaLhYyXcdX5WnLSkobYzW7oNXzaxVhso57IvWRDRpDoHzsrPYlfhiNsS1Boemym68OdBh5sAtQD0A1CdW9PZRINvKxypqL4jA9XSIr52IaEt0fjY9qeDaWzONO6Mv8xHg0G3CYpeMUuPx6FzQokgcxXb+4n1QD+NHIX5rKT8x3xR3XG0WJR7bFAkmUVMF1omyGrNy/s5mNTFHGT3WtlOhT0yJ+U9ouYki046mC20xeLVqVKEuQpEyZ0+d3PfWtlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OuoxdxgXCdA9Fx1onJBmNMdogjKdmgcXm2NoGlPIVFQ=;
 b=LgUb2C4lzgZroDwfdP7MssSXshbZUMIoXne5JtteemkSL7xTU9ruY/53AaBTpu3FwSQDYKgIkK5cqakksqfui0OHEKbTaR/yirA8wWiMxfkC3CJsR0Cc3rJPwkXsXvzkhEUmc+VgOlWrwqCpdRj+hHNsw9qw5oY9YKqEhTsq3m4jk83DScFxnKUHnQdD1XvEVNPGlIMFlP9+CcO++FqFLH4cJyU3fqlcOncCCptUo78J51QJEUU0AB0sVVOlSw8zQtlmH2nAtGFDLP2uNks1G/WZyir0QZrWkHRqxlwaDatoVZEGhTiouFCOOYhhiatwJmBG2mir4BwwA7z6wt9MrQ==
Received: from SA9P223CA0016.NAMP223.PROD.OUTLOOK.COM (2603:10b6:806:26::21)
 by LV8PR12MB9110.namprd12.prod.outlook.com (2603:10b6:408:18b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Tue, 21 May
 2024 12:30:15 +0000
Received: from SN1PEPF000252A0.namprd05.prod.outlook.com
 (2603:10b6:806:26:cafe::df) by SA9P223CA0016.outlook.office365.com
 (2603:10b6:806:26::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36 via Frontend
 Transport; Tue, 21 May 2024 12:30:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SN1PEPF000252A0.mail.protection.outlook.com (10.167.242.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7611.14 via Frontend Transport; Tue, 21 May 2024 12:30:15 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 21 May
 2024 05:29:57 -0700
Received: from vr-arch-host06.mtvr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 21 May 2024 05:29:54 -0700
From: Parav Pandit <parav@nvidia.com>
To: <virtio-comment@lists.linux.dev>, <mst@redhat.com>, <cohuck@redhat.com>
CC: <hengqi@linux.alibaba.com>, <sburla@marvell.com>, <shahafs@nvidia.com>,
	<si-wei.liu@oracle.com>, <peter.hilber@opensynergy.com>,
	<jasowang@redhat.com>, <xuanzhuo@linux.alibaba.com>, Parav Pandit
	<parav@nvidia.com>
Subject: [PATCH v10 01/13] admin: Introduce self group
Date: Tue, 21 May 2024 15:29:25 +0300
Message-ID: <20240521122937.2004180-2-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240521122937.2004180-1-parav@nvidia.com>
References: <20240521122937.2004180-1-parav@nvidia.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A0:EE_|LV8PR12MB9110:EE_
X-MS-Office365-Filtering-Correlation-Id: 279773ce-5bb4-4b31-fcc9-08dc7991c48b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|82310400017|1800799015|36860700004|376005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VxCdY1j6V5zg0B2GXF6dg84wlo7Kp0BUlUn9lil5r16DyTGK/vE/NEPHfqdr?=
 =?us-ascii?Q?ldqws+FhTm4tmqkmGXPBJ42hy/Xxt7QhdTYURnO1iZCTzS+3TT1GaQvihPar?=
 =?us-ascii?Q?7EROot13dBx/bX+E6qOJvMGD177fT0ud1xSCoINuaabLUIZpLO+zDjwhv4Rl?=
 =?us-ascii?Q?43jKrTY+1by+MkLnvxdt5f9wfuyZNUtvIQx/P3TGHgkVIun6bfaDwtFYrzO3?=
 =?us-ascii?Q?dRUu4Fk+aS4PnPDuZDd2gz2D5t00OHNLShfCC8WpEICvZvuNEwLtZHHC4Z8S?=
 =?us-ascii?Q?SiFUc+UYOU8qSo9LOfHsFvRRCX22ZHNfVqV8VH/baVlhsr/UCBu0qX5NMThu?=
 =?us-ascii?Q?spv+UuLs2mn9nNkZqE5Tr5Dv23fDAkLVvVqZooZ2qiW979LGoFZ3dzqVR+ed?=
 =?us-ascii?Q?f7qz6GuzdwmxJNi8A/pWRCGZThF3oEtV97pO16S7ZpizUIuUIviCvUleC6yU?=
 =?us-ascii?Q?BgoqcZ+IoFuzDhnfHEKerxJkqbpnzL8XyWzf7Fr27Cf5yrwnPRfMYXBnib2a?=
 =?us-ascii?Q?k6UKioSdZ7XI1lJUjv4GZ9rMW4RKwLdzalpqxzvoIhVT8PtuGOfn9SMoOg5Y?=
 =?us-ascii?Q?cuEwxceRwRWD+i37I4vyiEER9gIInFo6ou6qFE/VlaQAC0J4aXrCvdmHZeVe?=
 =?us-ascii?Q?/C54k06l6gTAxwYOqm5xaNE5LckJjzSUvwZt6LNzFXkGJCPcK4mnMVp+fohv?=
 =?us-ascii?Q?dG0zDtm7PKEFQ4IMF10+C6Ok6sBF5SyODdC8GbfETBipxJvkZNSniqy/sNi9?=
 =?us-ascii?Q?8RoRDDYzb27AnowznvicbrnIB6tWm2OUgEe3cGHYzJFX+tsm8Ub4f6wyzdI1?=
 =?us-ascii?Q?q3fW/2AaXhlIDeOO2VtC75o18gwd+CUpvag0qF4+kpAsmh6F0xlifyFhlTdG?=
 =?us-ascii?Q?2mwHVPuig1yZUc5AWNUeoROOqK9I7zpny/uA8bv8Ld6xwwn0ZeLlEy70hmYu?=
 =?us-ascii?Q?SQ7yJC+h9TLkjUrm2ItrGJ8P6CYS81xYmkb8SDVveYzqAAandEkrGhxJU6yD?=
 =?us-ascii?Q?Wrpk9qKROKul1r7LDcgWIt1QjFmfnrTPAVxVNDUk2xMsIrfLz8Bv90enhMnG?=
 =?us-ascii?Q?b05vGNg5nL8GolltkDGrVe915U1FZOCZ/xeQA5p9e1Jga0595odqqW5obxqB?=
 =?us-ascii?Q?28TmZzsnn8eGIg0JkMSnoY6I+TpFooZ4AV32o82eFQaJJwS8jHhDt/vZiTrd?=
 =?us-ascii?Q?O62s+hFR+08BV4BK+EzSeCN0Dlm0tjATClGEcsHS/LR41S/+h4x4ZdaUbphu?=
 =?us-ascii?Q?5s5/dVExujMFfab5CLJ+vnMNtIh9nrgwjcWrxy5/QUHyJJfGEVPk9/7J3kMG?=
 =?us-ascii?Q?N1fVc2K2HBwwvBANNT/LmKtRRYTKWNgYfOPIxfPqI5dDJ9vA+PiX9u+sY4Jf?=
 =?us-ascii?Q?bySDoRPDcPhSzRK7GyFKKKrHfbjT?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(82310400017)(1800799015)(36860700004)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2024 12:30:15.3088
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 279773ce-5bb4-4b31-fcc9-08dc7991c48b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000252A0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9110

Define self group to control the self device itself.

Subsequent patches introduces the concept of device capabilities
and device resources which utilizes the self group to access
capabilities and uses device resources to refer to the device itself.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/179
Signed-off-by: Parav Pandit <parav@nvidia.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
changelog:
v9->v10:
- rephrase the self group description
- removed duplicate description sentence
---
 admin.tex | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/admin.tex b/admin.tex
index 0803c26..44e0f83 100644
--- a/admin.tex
+++ b/admin.tex
@@ -1,7 +1,10 @@
 \section{Device groups}\label{sec:Basic Facilities of a Virtio Device / Device groups}
 
 It is occasionally useful to have a device control a group of
-other devices. Terminology used in such cases:
+other devices (the group may occasionally include the device
+itself) within a group. The owner device itself is not a
+member of the group (except in the special case of the self group).
+Terminology used in such cases:
 
 \begin{description}
 \item[Device group]
@@ -10,7 +13,7 @@ \section{Device groups}\label{sec:Basic Facilities of a Virtio Device / Device g
         or owner, the device controlling the group.
 \item[Member device]
         a device within a group. The owner device itself is not
-	a member of the group.
+	a member of the group except for the \field{Self group type}.
 \item[Member identifier]
         each member has this identifier, unique within the group
 	and used to address it through the owner device.
@@ -37,6 +40,11 @@ \section{Device groups}\label{sec:Basic Facilities of a Virtio Device / Device g
 
 The following group types, and their identifiers, are currently specified:
 \begin{description}
+\item[Self group type (0x0)]
+This device group includes the owner device itself and no other devices.
+The group type identifier for this group is 0x0.
+The member identifier for this group has a value of 0x0.
+
 \item[SR-IOV group type (0x1)]
 This device group has a PCI Single Root I/O Virtualization
 (SR-IOV) physical function (PF) device as the owner and includes
@@ -78,6 +86,7 @@ \subsection{Group administration commands}\label{sec:Basic Facilities of a Virti
         /* Device-readable part */
         le16 opcode;
         /*
+         * 0       - Self
          * 1       - SR-IOV
          * 2-65535 - reserved
          */
-- 
2.34.1

