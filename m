Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2047.outbound.protection.outlook.com [40.107.101.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77FBF145A1D
	for <virtio-comment@lists.linux.dev>; Tue,  4 Jun 2024 13:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717507820; cv=fail; b=sQHO6as2a0i7vBYcFy0zVpm0FpkYhoBgbw/MyLyLY/SMRsp6r020RqfXk8ThD+ouczstL0VYZd8M133hPr2FvrejihK7IBK9xuvZKQSHc7IBYGqYQSucADrZOZRsbdWsQAG+2WpUyKcV/xtbO2M68f0mPsHFMLYqJ8pAjaRmQMs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717507820; c=relaxed/simple;
	bh=TsnBG8dsSYPafngndWLMoFXFTSTv2ccklzLVMRlt17I=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g2Txw+UrUnzQG/M5K6W4vesBqkFT5EwPqHrRG5f+i+Nr/SQZ9IEJp8ZyCY/5S+zWxKBq33IO8rU4TLvEYc9oXuzIPLtnW0vMVmPCiZP5/+sJrtWSQAQSE5VFOhaYfXuctfQkdm/31/DtZZKtqwjknhDBLweh5Nkfk8OSjrtkwcg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=o2JPGG4s; arc=fail smtp.client-ip=40.107.101.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="o2JPGG4s"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dTc1rgo9nux8F06QRCqlclXnJ8ZnPytFdMQeAaW2p0FO+X3NVfTnUaBWWNyjLUs2rgd8zs7LbH/7eR8PvirOQTdtE+aEukuveFBu7LooxieWH9ENEDEmBhLlN8U3bf2cNPO8giIO7/+o/shuI6IocS7Ct4/bPdRB9ljs6VQz6wtcdVuCyADE8OPhFgbP12LCH1lGzZ1ZHC32dkgv8Ic5USpiW8/AVC8+AYFPzxTZ0GFt8NGEFJIVwnw4zc8QmIimtWQq+9ZA0I/m1MHi6Q8xpRpKKHwlyMEE7++wP4zOwvMxaODX56yfJEtpiI+itavONY0Z4gFWVimeBoMCtBVfYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wYokwVPwfHyrdiNTc/8lKNzfC2QrqxSUHheVYYVaTgU=;
 b=iqzE1mfLHmJ1rkB4qoWHiexehbHNauhQseuuSlmL1JLig0C9eq8SzBL/XiVkYtlpJiMKD8PD00hKe5GJP9p4Mr5/0tMoCpIV4iCA64R3WXqXNRTfpVlQ0D/SsvR5VKT7mzJtESOXCxArzdKcGo+YiqH8zix3HkXZM5h8FKigBxl8bzaFY350MdQ5OaQ/m4nTvH1p1STn4+HCsbfJnZbdbs3MBSoO6DJOhbvq+cooiSNl/xHu9DWRlvNIKaSs+m8gPLlnwHBrLPnXf0iGZ/y92yfti4hqhPGNCl1fdiIPN09gNHnDhVfegQTpg5CRV2z3E8i1UeRG10KOJafksI+fQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wYokwVPwfHyrdiNTc/8lKNzfC2QrqxSUHheVYYVaTgU=;
 b=o2JPGG4sMkV/d2EhIfRwMNWIQxU0izR8cYmMEHqa1Aferv18O1Zc5gfODoUw5AAdsOj7RpMDlmNhDTI+WEhWOhJ3DH2RwMEaMuIJrgfUA4vZCt3Y9jsEnHpljiBaxX+k3f7jkqUCrihjThSPiMdF6yt7007/uuw0QN5ExkUAQrkYZjjZ7p802QWo2cMTHjLhetqLHHO4y/c0WeCdLDb50tXGP1WONPLkAjlY5097CHFgx6Mq3thWYyoMSjB140iUNNucUK4WJFXcRbckjVVSH+h/6TwoP9Zyp4lndUZ37MQQs/mGeYCntPhMY8/nrT3ZNZmUESBEmYyCw8RqQjFZ1A==
Received: from BYAPR04CA0032.namprd04.prod.outlook.com (2603:10b6:a03:40::45)
 by BL1PR12MB5996.namprd12.prod.outlook.com (2603:10b6:208:39c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.25; Tue, 4 Jun
 2024 13:30:12 +0000
Received: from SJ5PEPF000001D5.namprd05.prod.outlook.com
 (2603:10b6:a03:40:cafe::23) by BYAPR04CA0032.outlook.office365.com
 (2603:10b6:a03:40::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.31 via Frontend
 Transport; Tue, 4 Jun 2024 13:30:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ5PEPF000001D5.mail.protection.outlook.com (10.167.242.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.15 via Frontend Transport; Tue, 4 Jun 2024 13:30:11 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 4 Jun 2024
 06:30:00 -0700
Received: from vr-arch-host06.mtvr.labs.mlnx (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 4 Jun 2024 06:29:57 -0700
From: Parav Pandit <parav@nvidia.com>
To: <virtio-comment@lists.linux.dev>, <mst@redhat.com>, <cohuck@redhat.com>
CC: <hengqi@linux.alibaba.com>, <sburla@marvell.com>, <shahafs@nvidia.com>,
	<si-wei.liu@oracle.com>, <peter.hilber@opensynergy.com>,
	<jasowang@redhat.com>, <xuanzhuo@linux.alibaba.com>, Parav Pandit
	<parav@nvidia.com>
Subject: [PATCH v11 12/13] newdevice: Improve the appendix chapter heading to reflect the content
Date: Tue, 4 Jun 2024 16:29:02 +0300
Message-ID: <20240604132903.2093195-13-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240604132903.2093195-1-parav@nvidia.com>
References: <20240604132903.2093195-1-parav@nvidia.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D5:EE_|BL1PR12MB5996:EE_
X-MS-Office365-Filtering-Correlation-Id: 69809cb3-aa18-4e38-cf25-08dc849a75de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|82310400017|36860700004|376005|1800799015;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bW1o01cVwkKhUXDTmAkVVnBK6R68Htb+CYIF2p3ywU5Xth5KHkg/wnv0X72r?=
 =?us-ascii?Q?jQ3tuvgiMBlt4Ql5zVhGIxFgFuHw32M7/byuKSxXMJSlXs+Ted0aFbr1oqf4?=
 =?us-ascii?Q?Y3CGXdY+q1KdCbdww6w71siz9ZL8oPe1v1z41wXCIub6xcnQ3qkLkz8vWPoj?=
 =?us-ascii?Q?ursIv2Sr99Wy8mIbdg+bOrfS5nVhnwqSwYyvp6ccGy8X2RQP/xyWjmwK3jp5?=
 =?us-ascii?Q?i/Q3Hd4F0LZnQoULGIQXVNrYmdH6xK/664MfjYsdRcAitq+OOpY70mHWPIaS?=
 =?us-ascii?Q?B5H0doIB7axk5lAXLe8X2p9/j3YBrIhu8/wf34kp4Y8ZJ7F0N2tF88wqbsOK?=
 =?us-ascii?Q?TxSBd2dL1HmiNHbS7FRpURy5HJ4iKKd+1hlCe9vRExi0xFPRWEUdSTgsdhyX?=
 =?us-ascii?Q?bxBgf2ndZH1UDjPBC2YArEZl/bSAO3DYHdRJovn8WpP4S48BDDZWtWK0VHjl?=
 =?us-ascii?Q?K3lh1ObLyolIyMCNR/zFm3ryGExOCp9TpyQHYKj+wNN3WC2/l6JoIlTap//V?=
 =?us-ascii?Q?K59qS6keiaSnywiZ3aHXKRburna8wM3/zioj7JXzaGYFbpXB2RGBFjDvLSyc?=
 =?us-ascii?Q?gYglAaY1ZSuuL72u4VuiQsMSnCeZ1eRvevGN8JiLH4eCR8t1UFMx6FEIvPdy?=
 =?us-ascii?Q?YtVLDgoqFr6BE5lVcPVXLRW8/YcRGhPhhPJ/SV3U+5x5SYH0z/GMlJfMHRCG?=
 =?us-ascii?Q?v/XaXC8NppsaSheSj6qzTjtqbASvYS1Kf5J4Orzenxxx8mFecxBfDT3ZZN1X?=
 =?us-ascii?Q?htiAx/UnjuFk7ycFkTYcJ1IuB6jU8TWPrUXt+vShbIL6ElTTTap6i82ueDMC?=
 =?us-ascii?Q?dAtaimuS6ekf2coPHEUYQ0NJHgHWYatNx7M68aT/+eIX3yprRu8TPUy4SpBe?=
 =?us-ascii?Q?TThvu8rC0hk9WjePLV40NxjU4V44GjDAuNg3ywT49hbNXqrZ0tvGcU3qGfIY?=
 =?us-ascii?Q?euoydNAq9FXj6NnfsE8KlDpjWFnQ2TP5s3Gk/3HA/nBzsfHrgJv8OPhyhJRI?=
 =?us-ascii?Q?MANYz4kvpbXz4YkE1HHAH0gnVvYfNvqsjDcbAIPUG9yt4Laguyb1bZU5VqYB?=
 =?us-ascii?Q?WmOWzSklY0/X/FiTrvyKiN3nqfRtR2ShXPj0OyL0u9OmkoETHiJ0o5UyLG1o?=
 =?us-ascii?Q?fR3HIgpOqSOO+61bUvIcItDMeIMwx20X6jWqEMP+CHEOvdDsyOc2bB1+ATfo?=
 =?us-ascii?Q?JlkpHHZ6OXBXa7dV+WOErjM/fBWILkEo0K/6mXZ/9c1WYzaMNk5Qq6Z2n/Y5?=
 =?us-ascii?Q?5JKSn9+IWNlVnlQF55r42tlFBFxclT9QOb1T/oj0X3H2T0DUoJY4akYRf+j7?=
 =?us-ascii?Q?Qi37lVoG+4Mde1mQh7UI+Hr0Z5cF2owAugYdrE9IqSWncIdBfsNWzZFNfxgg?=
 =?us-ascii?Q?8zhYlQreNJXFoZcY96u8o6Pzxyxr?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(82310400017)(36860700004)(376005)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2024 13:30:11.2915
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 69809cb3-aa18-4e38-cf25-08dc849a75de
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001D5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5996

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
 newdevice.tex | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/newdevice.tex b/newdevice.tex
index ed0124b..4f43554 100644
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
@@ -26,7 +26,7 @@ \section{What Device Configuration Space Layout?}\label{sec:Creating New Device
 writable by the driver.  Therefore, no writeable field which triggers an
 action ought to be wider than 32 bits.
 
-\section{What Device Number?}\label{sec:Creating New Device Types / What Device Number?}
+\section{What Device Number?}\label{sec:Creating New Device Types or Extending the Device / What Device Number?}
 
 Device numbers can be reserved by the OASIS committee: email
 virtio-comment@lists.linux.dev (after subscribing through
@@ -34,7 +34,7 @@ \section{What Device Number?}\label{sec:Creating New Device Types / What Device
 
 Meanwhile for experimental drivers, use 65535 and work backwards.
 
-\section{How many MSI-X vectors?  (for PCI)}\label{sec:Creating New Device Types / How many MSI-X vectors?  (for PCI)}
+\section{How many MSI-X vectors?  (for PCI)}\label{sec:Creating New Device Types or Extending the Device / How many MSI-X vectors?  (for PCI)}
 
 Using the optional MSI-X capability devices can speed up
 interrupt processing by removing the need to read ISR Status
@@ -52,7 +52,7 @@ \section{How many MSI-X vectors?  (for PCI)}\label{sec:Creating New Device Types
 number of vectors as possible, or disabling MSI-X capability
 altogether.
 
-\section{Device Improvements}\label{sec:Creating New Device Types / Device Improvements}
+\section{Device Improvements}\label{sec:Creating New Device Types or Extending the Device / Device Improvements}
 
 Any change to device configuration space, or new virtqueues, or
 behavioural changes, should be indicated by negotiation of a new
@@ -64,5 +64,3 @@ \section{Device Improvements}\label{sec:Creating New Device Types / Device Impro
 can use a single bit, but if one feature makes sense without the
 others they should not be gratuitously grouped together to
 conserve feature bits.
-
-
-- 
2.34.1

