Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2058.outbound.protection.outlook.com [40.107.94.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4683C3D982
	for <virtio-comment@lists.linux.dev>; Sat,  7 Sep 2024 17:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725731329; cv=fail; b=uRqpsmRE3OAFXQAjnShu/uOAiFyiBL4c5o+RA6U9NlLEhQANgSq8z0LCFLNWCgG6fOnZvaCMiBDQXoQqaAGzbhJpeGsv30RpwLI0b/4oymQLNVSMtKWkX8WymNXQzTNYx4m9IgHxX1CXCvvr1xnaZA0v87QLoq9K0uTADRIUJdc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725731329; c=relaxed/simple;
	bh=G8NfMMZkl/fNOdUF256yfWMzi2KvdiCqwBXjcq0bYFM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PjxOAQniZ+a04LEy1BFVMOFQTP9zmA/VkQrJTKNNQ/Me/gjJLvAx63MSTI9YbIl/lSfjwnY3Cms+m/TH9UcMn5/vVovqD3dSEEuxU9lJGTieNBBkR8suJYm6XVHQs3gFNRQTOg9Sm93Zz/s2v7oPLGHqzlff1AtsrqpLs/l3SLs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=kb5M1iqB; arc=fail smtp.client-ip=40.107.94.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="kb5M1iqB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RSmnU4dHAAET4hOntxiZ3Ff477nzDNBIHXZ55VdvmADI2gv2OW2S9RWDkEFb6BatwYC3fTbWtrq8EO0IPcwhW/kRfBfeGCxvL5QL11XAf/CjuxRtR+/S8OgK96WGNECm3K2kgXuWYl0zfCVdyRdqiur5WIqC2iJTUfPbCarY1GumGzSEzTwkNW5FLlahK5xQ5SWYZQuwBzYuZmu95JBt/KLH6bYjcBG2oYoT/+f99y8xEPw8ORm4DcfVwTEvqsPeMPQVupr6YeqcSGnJOts2InsA5bvViY0IlXPbvxmJSInWAizhlCYROl2rw600MmkN7/W/a2nzwzn2jb8sotD1dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uKuWIY7cARW28vUjTklczc/JfsVbRd9RND8AesglF0k=;
 b=SgIp2rATv9xx72QoAR6T9ndiYJL7QxBGpUwjXsuYpDDYsk90taPOlhEpSlKgpVguJlgHKrPK6S+Y0FHkiv5bCM1kOy3ls3USja7v8bmSxaF/2XEiZa522VBUGFe9JVy5BFOmWqNW1k1gSsxcsYAzNtHcSdZ0Ie5hi3NpRLcq0BUeZcweP2rpdwxkTe/vEfXPJpegYS8VYnGs3OB74oXnPncKqr5s3ateabZRVVc4OByFEGqaXKzIEfO7qlKe9ZzgCVmDCf3BGwUseCCmtm83syStXE6rPRi//Dw0tZO7NBL2dufZ6tLkD0aGB7Cb/H5se8jJEJSIQx7muYGMmRfdgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uKuWIY7cARW28vUjTklczc/JfsVbRd9RND8AesglF0k=;
 b=kb5M1iqBg5FRncb/Rg7qJx+4tw5yIoHd6hgUCEkv/VO75SEZHSVAJ/DL35j6DRxWHxweQSlATiy9izD48M3wqsBJXH/aH8pX7mr+9VV94kCkM3N07PafVbwzuUdGmbEnZep0H0G/0J9F7vtLe0yiyfnvKl03tzlzgYEUrkRIvsUaC7GZVM5sVQgWGk7CCx3ANgQgfSrxarLndseF163shGXIlkUvNHsu5l16B5u3jSvCUDnHmUzW4b66cP2SsHLSEyCALKxfVqb0QY8pQGAEt1VHBnJgBrTfOqNNX0W58GjiziJqWVjhcMOnOdsR/lLmY9dQHhC/Xc0GcKE2vsrrfw==
Received: from BN0PR04CA0023.namprd04.prod.outlook.com (2603:10b6:408:ee::28)
 by CY8PR12MB7659.namprd12.prod.outlook.com (2603:10b6:930:9f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17; Sat, 7 Sep
 2024 17:48:44 +0000
Received: from BN1PEPF00004687.namprd05.prod.outlook.com
 (2603:10b6:408:ee:cafe::35) by BN0PR04CA0023.outlook.office365.com
 (2603:10b6:408:ee::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17 via Frontend
 Transport; Sat, 7 Sep 2024 17:48:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN1PEPF00004687.mail.protection.outlook.com (10.167.243.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.13 via Frontend Transport; Sat, 7 Sep 2024 17:48:44 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sat, 7 Sep 2024
 10:48:38 -0700
Received: from vr-arch-host06.mtvr.labs.mlnx (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Sat, 7 Sep 2024 10:48:36 -0700
From: Parav Pandit <parav@nvidia.com>
To: <virtio-comment@lists.linux.dev>, <mst@redhat.com>, <cohuck@redhat.com>
CC: <shahafs@nvidia.com>, Parav Pandit <parav@nvidia.com>
Subject: [PATCH 0/3] editorial: Fix spelling errors
Date: Sat, 7 Sep 2024 20:48:16 +0300
Message-ID: <20240907174819.778971-1-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00004687:EE_|CY8PR12MB7659:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e0e0404-43f8-48ca-7874-08dccf65516d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AoAMUwcmqJyUFTA+xgCyMA+sdf69FAs7A2cdr234LmBN3Wh5NtLYVavpCruN?=
 =?us-ascii?Q?ie2hfqV6q/375hT5ziV3ucq03S66INbS2SLaKAmy4p9CsBFX1q5hfYaZktNI?=
 =?us-ascii?Q?zw+cn35zUBdS196XMghyxAzwwwJWUdIh8W5qPNeuVXCm30O0sQFTQYNFvCrr?=
 =?us-ascii?Q?qPW7rzTUxWkvngw4N6zLzlmI+gg5GCl3iBbt7y1rn4yBJGTUR06Yz6TEWHOK?=
 =?us-ascii?Q?0hF3rMc7EGuWZoPoMREa5RnwBpVY+bSl/zloO06yaTYX7BqJhZBeP+dTLYNM?=
 =?us-ascii?Q?NuSIDVn0dEq86+n/hWVtJoXj+vdeziN0wEApmFDej8FcZ9+m1wzMazvUivTu?=
 =?us-ascii?Q?ycur4F+B7wHodE3pH+XWE0KPzvivLy3W076AYktsp61fjC0LvM5rY5pLpOwd?=
 =?us-ascii?Q?HWhIozot/foaolgu5/i8zyCCc+TiCvFiM5mdp3Lyb6yj0MFahmhV42NUidLh?=
 =?us-ascii?Q?lK92WpIdgrXern+9ympU6b+xZ9j5idNSjJvKtIUp2gKGZ7VOPT7jNbIIYl7W?=
 =?us-ascii?Q?IQid7bivoA1CAVQyGktI6OVGGLA+tM5KdYTeZI6RyM5nkEuodhzky2UuGF7L?=
 =?us-ascii?Q?CoKmpa38Pw7YqQJrwfftCrsajFLCLCVewJBgHwi0qbQelS4eczekiIVd4Ekk?=
 =?us-ascii?Q?biApuncLVZMOV9F4XgYOvod7Q+T13yqZoU75xDNPhJaBm73iKNvvlGUZ55Yj?=
 =?us-ascii?Q?ZimQxf+3pjKV7VolqHGjDMOjnRO2pTwg8B0XfXWDwzL6JnrvNJ9ClKMvs39C?=
 =?us-ascii?Q?hWSLkj3YuJAH1X+bY/Q2XV7DWbZwtTQ5f6Qtnioc6z6D35/jnmgokfJHgIvO?=
 =?us-ascii?Q?O+RCY3tvugxqu++oaEc0VidVT2FuDSvj4k56Sr1FkFQjdl5b3gvlW/prMkIY?=
 =?us-ascii?Q?3YWq6sHFyEshJfCPpRNsD4IOCnWwNEfWl8xJT479h82NdvxQate4iEc43AM8?=
 =?us-ascii?Q?joQociyVpeEjnSR846QFK0QXIjlioK6K2c67RZh7NKfv3aWat+ncBj7KJbXM?=
 =?us-ascii?Q?J6iDqpynJusLOLZtwuHHpH0ekEKH+Hl5z8jIpGV/AMdoD+IYT70RF3NthAmw?=
 =?us-ascii?Q?wt1NwbccJg6LeTe3E36F7ywP+EBFkqISgWNsm4Mck357JzNrlNLN/mMaeCHq?=
 =?us-ascii?Q?Rs0xJK89Dwka1zF7ZQAuxBjICyBtbHHbsZgSvDAbWjydjy1odp3owbZj16zU?=
 =?us-ascii?Q?QdP2gvHY5zRnbt9IfP5ynRpjUFqDctM2z9tWCKlkLKbc0Ccjlum7VC41By9p?=
 =?us-ascii?Q?rk96TgTrVRJwygOVmygIkC/A5LGcSkHf1E/SyP0PDndYP0woV4rMsyOGjFot?=
 =?us-ascii?Q?oRJYkAeeKgEuphxGqkKLArC0IHU6TiGZcJahVrjF9CBQOc0pbPalnqnt1zIu?=
 =?us-ascii?Q?Br/0u8jMy4SxiiI8Pb6dQGrIeolN7HwcebofP5NcsRRi+kOCr1+odMwOrHAZ?=
 =?us-ascii?Q?RmyKC/vE4w9MkBv7/kmeXBa6ar2oap55?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2024 17:48:44.2511
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e0e0404-43f8-48ca-7874-08dccf65516d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004687.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7659

Fix spelling errors in gpu device, crypto device and in
common portion of the specification.

Parav Pandit (3):
  crypto: editorial: Fix spelling errors
  gpu: editorial: Fix spelling errors
  common: editorial: Fix spelling errors

 admin.tex                           |  2 +-
 content.tex                         |  4 ++--
 device-types/crypto/description.tex | 10 +++++-----
 device-types/gpu/description.tex    |  4 ++--
 4 files changed, 10 insertions(+), 10 deletions(-)

-- 
2.34.1

