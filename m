Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2089.outbound.protection.outlook.com [40.107.220.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90966EB41
	for <virtio-comment@lists.linux.dev>; Tue, 21 May 2024 12:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716294664; cv=fail; b=DaaQrbJI4q5+TjsYL5gp0wj1IL/MV3CNVM6a1BpiyK/XnaYysRSkaTnclCbzIynZzFivlvTxdA192hpz5FASvV6dFbZHZ8rY4Ey+feUkIdGkz4GIsTVjmtGPDdIMUvOTqlt4xoboykT5FpmZ9b0RdAEpVSeec7QHHM2UYsLES9A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716294664; c=relaxed/simple;
	bh=g8vPVQpRVqQ0GTHeyAWAdu/V7zOCAoV2bUI126h2rYs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QUPdpFq5byRthZ0/SAkLdfG6eyx1X7Z1oOTC2M4wUFOUxx+gC0V2RT7cZt8MGj5W8ONx869pladfQufURjg8TiYgliS6X5KtRayNL/J3ZhlVFKrAlHuXNmZSl61GRPlOSlpLnGw7mBzG8S1+ldR9fwOjh6uOqvW6ZccQdhwS0CU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=bC1US6wV; arc=fail smtp.client-ip=40.107.220.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="bC1US6wV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aQB3wutViKa74Er/Bjueaic6P1sxfKTy0J/5m6OkXdu10ITj6gy3fqRfD0XFX+bi4ueHLiYlwqnx28z35eGtZXVm4GXKsehS2hhCcuQbNypsubZWCOBfvyOwFcd2/T1nf2H6zFZZW4qaP04ZZXlwbIxlRaGSvw5AgtRr1WwPA23X8Rttnw7PmbcaVg9WwrrdbI6psWOz5gYjBbBZmZ0JfQWPcVqLi9taHm9/3K1Ecua9qOoIopm8Ywm/gPkxn8UNQc+qTbrISwu98nXhEq2T6xXeoALXadjGLYybwxOfUCudm1VPXGbP7L0bv/2RFskXVXQ8FlUlGMSuKicyvFVqUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8DXnPotUe+VHv1eiDLUilyv5hPOZ12EljrDAZ+h/Wdo=;
 b=PqrnXZg4SWybp/ulBlXaABJrFwdpn0+Va0+lfeUgafAMkpiHR5uWBCQdHHjaP+MPJ0mN0PrkdOxubDjgAfqwBMNPW9tOnacX76MhdWCmTyUZ0JXd0p82JyR6g0uIwC15i2+as/ehqi0e7aXoIas9x9Wnk080DVlJcnRjgM8rC00CGCYYiQ8onxjwpWVCYnnyRVlyl9XRS8OwlLh6ecqEOmdiOBiuSmmgvteYEzSAG2XUEj02l90QZCtNAgpQwHSIqrFGtg5h6E2CQ7dxvqNC97nmqIlCdPURKhutR/4UN+z9h8zbajNaFeOtlbPfNk3trcNbni2fMCqUHNsF3tFCtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8DXnPotUe+VHv1eiDLUilyv5hPOZ12EljrDAZ+h/Wdo=;
 b=bC1US6wVWI0UCNz9oE8y5eqFUH8zqnFn8jTXoM5kheaMKVQsrLBFOH2nRcWy3C8V9drvo8mXz9XLuxZtvPnk7f31M92XJkGojVA1uHj8KD001ZaQ2K91NxtLv8hKpbSzlFrAQuBl9kqdlsQgcXtS/Kan++JDg19FS4yk5lbqYmx53ccnv+LOQFviXE9wjnyNbQbM3QOAtdUpeBEHRF61Oc/kOBjeDNbsym3MKphhdc8M69u4JiQaVN1wsBVjKvyMy/vdMPl4ZJCfW/6AKCXiMLZ6cQOBDxwJW0LvBEwpu33b3PzLuXN6yompB5gKnc300Zl96E696jFE/UdhFOH6cQ==
Received: from MN2PR14CA0011.namprd14.prod.outlook.com (2603:10b6:208:23e::16)
 by LV2PR12MB5967.namprd12.prod.outlook.com (2603:10b6:408:170::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Tue, 21 May
 2024 12:30:59 +0000
Received: from BL6PEPF00022570.namprd02.prod.outlook.com
 (2603:10b6:208:23e:cafe::ff) by MN2PR14CA0011.outlook.office365.com
 (2603:10b6:208:23e::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36 via Frontend
 Transport; Tue, 21 May 2024 12:30:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL6PEPF00022570.mail.protection.outlook.com (10.167.249.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7611.14 via Frontend Transport; Tue, 21 May 2024 12:30:59 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 21 May
 2024 05:30:37 -0700
Received: from vr-arch-host06.mtvr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 21 May 2024 05:30:33 -0700
From: Parav Pandit <parav@nvidia.com>
To: <virtio-comment@lists.linux.dev>, <mst@redhat.com>, <cohuck@redhat.com>
CC: <hengqi@linux.alibaba.com>, <sburla@marvell.com>, <shahafs@nvidia.com>,
	<si-wei.liu@oracle.com>, <peter.hilber@opensynergy.com>,
	<jasowang@redhat.com>, <xuanzhuo@linux.alibaba.com>, Parav Pandit
	<parav@nvidia.com>
Subject: [PATCH v10 12/13] newdevice: Improve the appendix chapter heading to reflect the content
Date: Tue, 21 May 2024 15:29:36 +0300
Message-ID: <20240521122937.2004180-13-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF00022570:EE_|LV2PR12MB5967:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c4b3598-9d79-49c9-505e-08dc7991dee1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|376005|36860700004|1800799015|82310400017;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?viA88cj6EqeSAWdAU5Ah6lV2u0iAM9lB/js3HNUOrOErcUaBGO6bXjswFBxJ?=
 =?us-ascii?Q?PlsD31VqZRaitws7u3SFd0zNAc9f69NZkGeikoILPKWhypIkAOnvdjee1UU4?=
 =?us-ascii?Q?eW5bTBJ8LPcdM0YGN+8qc/L7YBxfTJLnUJ2yZk9rx4CNYQLg3jGbSbu27SLz?=
 =?us-ascii?Q?CcTFZ6CNab15X8rkiebOE2i6c/Z2Xk94ooKEPXdJAO2ALXsajPutgD6FDENY?=
 =?us-ascii?Q?lZRgLw0COjzyyv/J10YoZYLwlCPJ88wPmKykahw0jaCs+qlY0VffU0iWdm7D?=
 =?us-ascii?Q?2bMbyUUj2qpHCw/0VDZ+YAHlCaN/gvgWZwMvHEE4Am2oWRAHqhjkGoW1Vf/H?=
 =?us-ascii?Q?B/76UVmoMG8A1K38LZeNFkOh7vKMzjmM3ur1OVOGDzduZUkQyvaN7Kyc14gP?=
 =?us-ascii?Q?TM7e9JhJ6z3WCEszD3Y6nABRTENumK0PLecJM3cWAQh/eolLUWxXPzitGyF/?=
 =?us-ascii?Q?eQt511YfgTtkBttfse9DMQOT1gVTeYvvnjKesuctKzhZL1zET9SAYWbvqnr6?=
 =?us-ascii?Q?G5PfmYydS5mW9LbYQTGXEhILs5fbLbMIj26q7xUWcqxne8vFRxlXbEiVN0Ai?=
 =?us-ascii?Q?pubIfrCg39ovk2d0MvzPbMHUx3+8bCjedJXWChFjYgRpWr1ib+F+YQ47nGMk?=
 =?us-ascii?Q?X/P9zeT37MgCR1/yywH7fFmNU0YizNJyBio1Whci955H8OYvHSGzMGmyMCTi?=
 =?us-ascii?Q?lqY9945fTsuIh+2LHe8+zLW8vFNSWoWVoqquG30R+nANwVk5AfnehDV3zrfr?=
 =?us-ascii?Q?diKmfyOdmumL+hOu0Qb0qFIxf2Zd68ZyV7inXgi+EGm9kzOwVGcvgnK/tKz7?=
 =?us-ascii?Q?cRQNGq8IK1gNCMYJCtrE1JYxtqZ+BCoF9aZpbWTSFcyyN+rBjT8LU6z3YbER?=
 =?us-ascii?Q?NPu0O+Ntez4vyCIFWD/0yRiZr0apcxB+gdVN3LFAwBosjPvIe86U/SGV/DVz?=
 =?us-ascii?Q?PKpNSr/F4xZUvmpIXws99wOOwiy4JgJT7Ad5lzqR0CXPIGcSUnliZstYp1Do?=
 =?us-ascii?Q?6QmTaCfqtbJTYRkR9OLuasBVstGa/vVXRECILtxY3ef+mHad83gC9Jvo1vpg?=
 =?us-ascii?Q?olbLrjucNa/XCl5e/NNiP1q8Gsa5EkEsrtwYbj5yhEAHVJoSTITQi9nmetq5?=
 =?us-ascii?Q?hQLVR8WOJZ4AsPUnQ+HB7GqsxDXI4zXWIaxMZjWufIKabBvQssP/2VqGz5h3?=
 =?us-ascii?Q?p7Dq1vVexrFnqkvK1C0lkfG+z3SZUhT+YobY4Zj+1Uow66kStf6dfS9ZbbBN?=
 =?us-ascii?Q?CHKssBszt9dRaFjkLOQBhegm+XRGgXgmQu1GkMwouhpDJVjj3sPAAk6NtDRB?=
 =?us-ascii?Q?ZAkCfNE+3PLsVqj85AYHBSixXPUXsJarM+3JLOyojB/q6y/Hy0+KYYrMRRKy?=
 =?us-ascii?Q?Bq6GIHcf7/vgwWj6jTdOk+UqXfnt?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(376005)(36860700004)(1800799015)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2024 12:30:59.4263
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c4b3598-9d79-49c9-505e-08dc7991dee1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF00022570.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5967

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

