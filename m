Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2086.outbound.protection.outlook.com [40.107.244.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D515145A1D
	for <virtio-comment@lists.linux.dev>; Tue,  4 Jun 2024 13:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717507822; cv=fail; b=g97yXc3XfrdS6wREF2Xzx1Q0a93oMCvXESJrClk4QI1G0o9Dh6dM+v53oEsD3Wq79MacTGCJ0MfjiKJ87OluXYxg+DzyLfAeoLIQ5Kao+kIiqnMZye6A45NoEYf09DWQPJC3mFGQeSNGKg6Kwoi4dj0atJAp3OQiiJOf8HzssJA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717507822; c=relaxed/simple;
	bh=bJ21CFqxNzHdSd8ZGZac3cL08oLHLBX5/ZZU4KUqUo4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cvbw6x/sgc224rO9hedIw137A8DkPBQ7zBX5Uq12dlBnnYXuU+XKrJLUfMx9UUenFPxZEd61CJg/kl4Tfb7zQv5lKfTRi9YQzxYPBpo35bvc5G9GoaqOAEnIj6D5WnwRHLR5viKTv3gB/rM9UJtzI+HZCMcLxhEulifyG8tF5GQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=JFx63hDH; arc=fail smtp.client-ip=40.107.244.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="JFx63hDH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UyvSzvo+Lcc8g4A7W1tHOYDZtei5+UBTJAtoNnhdgHbJZWjoSEKOJaX8jnNcS8oC4ybSQeVSFUC8Zs+P9HHCIWmP2nqFDO6fdnlIxDSZ2f2/vz+qt95f3V7B07WDACZKV7d+2sJtMBZ5WkrR9eheIE1yqVo+Zx/NZ0lQ+EtLKhAptZ6g2Xn6Xj1Nk4jOo83USSW6/IDzmO7Q8Sa5jiAehllooSE8UyAJ6QmFlba0e9sGphZB9alISG1Fi4i7rHIoJIYdIIgspUUUM3DnTGDKzxwYwsKpLcIfNT0j89Baanh15Uj916ksM1l4o3f9wvxBV80MRr7Byx1iJ7cJQn0MbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Ke1XEMrRDJQ3tzRCObJf6SUQxWqVw8LFZthh278fNE=;
 b=fXyqWsKry/jhfTcPwRVxUgLZ6iIJMgI2kYszxRtjWHQF1SYCQjdWZWWLGTWrfuSVivMtIPEtv7ypg48whhir5TKXbynguPdn4h/PIToWS0a0fxGyFsRTy/ezZD1vMIYLsHkpT1pcJ+tMqrc5DIyyclTZAUhUn6BruLpMtVkp3gRzUgXR+bOFDRv5HcKuHobbKFZIB7H2O+ctguOa1QzsYiNHVbiBMAsTEEaQzpeEEbgc+3+yNanMbeyC4cDjhCbLhcGftQkSrbqLZOV1wVYshJC2UGPauDT4fs+AgAw+DDQY7nK90uoksQa10Iuy8MxZz/5+LniUmnX4UdKEXrEznw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Ke1XEMrRDJQ3tzRCObJf6SUQxWqVw8LFZthh278fNE=;
 b=JFx63hDHjCELDKrB6jOvriOIep/N1x1tk7hLMUhQqo3piK4NTjO4hNUXd4bXPBsCldzHSZDxmO0WiehDO419v/m5GEQxacA3zpvtXo4Y6s6pPmnof1dXgn1K8/JWPW2OwNfR/6HD6S56u6GdgWmkOSjcwG6iGqzImGy5tjuEsPshy9ML4FHXH0u1JfLpbupNeObq96q7LHfk2FjLpLxqOTQlsDLnNM0Vo/bF3mz7dvLWFgXfWLe6qJRbCmvI9bRy7drCaeHcJEePEzIqLxvDTcWbnoHwwqKu7Ef40SAO558F1OJv2eswyNQU8FpfO99R2lbfiTL/ho7Fi5W57ufN6w==
Received: from BYAPR04CA0015.namprd04.prod.outlook.com (2603:10b6:a03:40::28)
 by PH7PR12MB7871.namprd12.prod.outlook.com (2603:10b6:510:27d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.27; Tue, 4 Jun
 2024 13:30:16 +0000
Received: from SJ5PEPF000001D5.namprd05.prod.outlook.com
 (2603:10b6:a03:40:cafe::a3) by BYAPR04CA0015.outlook.office365.com
 (2603:10b6:a03:40::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.30 via Frontend
 Transport; Tue, 4 Jun 2024 13:30:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ5PEPF000001D5.mail.protection.outlook.com (10.167.242.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.15 via Frontend Transport; Tue, 4 Jun 2024 13:30:16 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 4 Jun 2024
 06:30:04 -0700
Received: from vr-arch-host06.mtvr.labs.mlnx (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 4 Jun 2024 06:30:00 -0700
From: Parav Pandit <parav@nvidia.com>
To: <virtio-comment@lists.linux.dev>, <mst@redhat.com>, <cohuck@redhat.com>
CC: <hengqi@linux.alibaba.com>, <sburla@marvell.com>, <shahafs@nvidia.com>,
	<si-wei.liu@oracle.com>, <peter.hilber@opensynergy.com>,
	<jasowang@redhat.com>, <xuanzhuo@linux.alibaba.com>, Parav Pandit
	<parav@nvidia.com>
Subject: [PATCH v11 13/13] newdevice: Extend informative guidance on capability, resource objects
Date: Tue, 4 Jun 2024 16:29:03 +0300
Message-ID: <20240604132903.2093195-14-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D5:EE_|PH7PR12MB7871:EE_
X-MS-Office365-Filtering-Correlation-Id: ba19de21-dc0c-4e37-0f49-08dc849a78aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|82310400017|1800799015|36860700004|376005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NihUKYSwufzaYKnETVOR3JY2ZIINZ0TsUTfdwXj/gDhVOGSmVu1ZDjRhOXZa?=
 =?us-ascii?Q?qttWR1bI8Eew4bTGWviLAOEFMAmo6iOkg1dA8E0sZaK+ehEOWFIutuBo6xR4?=
 =?us-ascii?Q?VmBNy6B80mxUk75fdBDttMuuZUDSr9UlVT95adAP38OJyOixSFmc2Btvrr47?=
 =?us-ascii?Q?Z58ia5WKBi7yEGn17XsJ/pgbBwwV89YReyNloeeCEGoxEZXdflPJVvp2ZKsS?=
 =?us-ascii?Q?qmQz5S6ita9Hxr1KRyoq8hV44wS8Hji0wegtVliZuq/6U/4sUinbIE6mMote?=
 =?us-ascii?Q?8VF5QbQjRqfPMEDwBRvrnmSS9/nZ+j+NX190AoYbJiiiuJBzh3cj2PGxMdFg?=
 =?us-ascii?Q?HiIsvufkZZHsqj2bMalCPnqs3bGngDzW6cjEaSbjaJTo7O02eSYEbGQadB99?=
 =?us-ascii?Q?E2n8r614EeIk9vK1iJKnrSOyzQMDtnmckKGcqK88KoDt9LzNSnCuPNZL4+FM?=
 =?us-ascii?Q?dSIY4+pykreBiYuUwwlFBAVHDkh+g2c0NksW08d8jDzp75xw1WWSnPtph+hw?=
 =?us-ascii?Q?X4Yy9XXr4B3WIRCyqu/YnhmbpRPcuSXXCX1TOeFVTgqTgEJvlNDCax7lRZ+4?=
 =?us-ascii?Q?wRNi+Rge+hu+AnBAEh/ahrZr0HOjkdcsu7DvFtigoEYfP7cPxdGp7AXE85zW?=
 =?us-ascii?Q?j1QaqyU9X40P3z24DwNy8BptDW2D/fS2VbDlMYlec64FzyXv86+MxUQmG210?=
 =?us-ascii?Q?CdGaTw+mn2qIKMeuPV3ZwSCa7kRmQWWE7AItZ1TyqrQSK3/kehS6doNPnDKN?=
 =?us-ascii?Q?K6E5mB+7RMs1dWgDIPin9mUr88yJ8T/oHAx9xd2rrbqdKFHawd0zasRZE6ok?=
 =?us-ascii?Q?VITWxdZwRKErc4ZgI2U+4TBzFSGKWTszVkLPKyBMfyFR6IuZQ5YlwenVaE2D?=
 =?us-ascii?Q?Wnt5q14gsDXpb5WvXHdBjhNIR1gJy+/7gyYau7bPlYLy5ftE3ccmFIlMi053?=
 =?us-ascii?Q?wPnq3KhacK211ZlW9OjO1EiHUoGJREHBXzfA+JGMKoV4sBoKYMkKz9YYkB12?=
 =?us-ascii?Q?LOXV20HurWYqxJWB79i5laPpBvt2Fk8mZxJn6rJGsawrdkpIMD3nfify0FaI?=
 =?us-ascii?Q?9bSphmtGJj9nNY0QNWwX/4HO+EPeRgRNsp0qn4aEV3u5Gm5fFbHs6zr3faKH?=
 =?us-ascii?Q?AiSjscP//zBRq9LAwUesKnCHXkDRg1X/V21D43seWpFTjZZ55KHo5esIQtzQ?=
 =?us-ascii?Q?4WzhuOH3S9mgPMM+nbboTqUcNwBHW4ZMsBAj1IXKEJCkMmk1UiicZSmfoGyd?=
 =?us-ascii?Q?EGntqJfLPH2ZC1cWH3sFphq9ufSXTgFxi2bSHuztU0NbNVCbt395WgTLzaOy?=
 =?us-ascii?Q?KwKJ6mYlilGfCVt0plwQrGCr4Br9R+5Dp6n0HMZnRfmlzDxOGQKKsL1BruuK?=
 =?us-ascii?Q?P71/sIwYFByXU/sRy6yUilXTxMDu?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(82310400017)(1800799015)(36860700004)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2024 13:30:16.2758
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ba19de21-dc0c-4e37-0f49-08dc849a78aa
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001D5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7871

Add few informative guidance/notes about which use cases to use
device and driver capabilities and device resource objects.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/179
Signed-off-by: Parav Pandit <parav@nvidia.com>
---
internal changelog:
- only sending last patch-12 to avoid the flood
- added back resource limit sentence along with resource object
- replaced administrative -> administration
- replaced admin virtqueue -> administration virtqueue
- replaced admin -> administration
- replaced utilize -> use
changelog:
v9->v10:
- updated examples
v7->v8:
- improved the examples and text for usage of device capabilities
  and device resources
- added more Q&A to clarify the resources and capabilities
---
 newdevice.tex | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/newdevice.tex b/newdevice.tex
index 4f43554..c18689f 100644
--- a/newdevice.tex
+++ b/newdevice.tex
@@ -26,6 +26,27 @@ \section{What Device Configuration Space Layout?}\label{sec:Creating New Device
 writable by the driver.  Therefore, no writeable field which triggers an
 action ought to be wider than 32 bits.
 
+\section{When to use device resource object?}\label{sec:Creating New Device Types or Extending the Device / When to use device resource object?}
+Device resource objects are best suited to represent device resources used
+dynamically by the driver. Limits on resource usage appear as limit
+fields in a device capability.
+
+\section{When to use the capabilities?}\label{sec:Creating New Device Types or Extending the Device / When to use the capabilities?}
+Capabilities allow the device and the driver to negotiate support and resources
+used for specific functionality. For example, for a networking device, a
+capability can represent the limit on the number of flow filter groups. In
+another example, a capability can represent the allowed flow filter classifiers.
+
+\section{When to use administration virtqueue vs control virtqueue?}\label{sec:Creating New Device Types or Extending the Device / When to use administration virtqueue vs control virtqueue?}
+Any new device configuration, through device capabilities and resources as
+either implicit or driver-created resource objects, should preferably use
+administration commands via the administration virtqueue. Furthermore, even for devices with a
+control virtqueue for configuration, implementing new functionality using
+administration commands that leverage generic infrastructure is desirable.
+
+Future enhancements may involve provisioning member devices using
+standardized administration commands that reuse existing capability structures.
+
 \section{What Device Number?}\label{sec:Creating New Device Types or Extending the Device / What Device Number?}
 
 Device numbers can be reserved by the OASIS committee: email
-- 
2.34.1

