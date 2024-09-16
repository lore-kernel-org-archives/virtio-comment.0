Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2062.outbound.protection.outlook.com [40.107.93.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 586BF1798C
	for <virtio-comment@lists.linux.dev>; Mon, 16 Sep 2024 03:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726456156; cv=fail; b=IEmH5A4+Z5WHyyjP5OukNg9rH6lcWtsTq9LtJnFwT/mnD/TaDbsr8vtpD5L2KmK3+1KNjeA8LiUf3bIGntxEzya7s6r4IpYi3dYVlV4gMutejUJ2QMbBAlGyU+kobls72U6Y/0YluKy9yAG+/g5SSq4PWL/jKsdTYu0tEH74Z9E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726456156; c=relaxed/simple;
	bh=VkJZA5SNOp41ED0sP1cvKj94hw1LmpeJ9KMKcEHNuaU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DFd/Me/oWoex6MxmZDNq1CL5IkQ3ZyWjsGskmL8La8pPeijzegDpnBg6xe/SxEAaUx6ubcH5TdscHHLI/JU6HwWxMNqydIXTv/VKknKrSY23HIf0C/9uzY2/3zpRHHouH4v5/5Itn7jXA4WxrqBPTn7+n3/r7RwsXCuHHjD1cBA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Fgjf/i5z; arc=fail smtp.client-ip=40.107.93.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Fgjf/i5z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xxIGxxS0KMFnx1o4ts2NoAGuv7hGCtmbNu8FjU5qVDNtXBCoBFFFgF6zKr+RvKY0R1a6ART8Tjpk3VSJN+EjAHTSEHSAFqHcJBcULrvXU0H0n46AyZAjJE2WyXcG+2du72SOyxyIWAXJk8vKRAf1FkVucVoaExVIe2MxBa6UKuDLUoDYfug4Xi3A47co9aYTBzLX93PowDUE5rXkgmWzOlhbpwO1EJKlieKKDx+VusDS60boV++zMf8uwO5EGVgxwsMAXKN4GVbGzKi1NUHdcaMiqJia7X7+Tw3pJFXeX5y0Aws1nyops3M+gT74n3O1tPStEtLGNN/AGEFLkqifBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7V1b6Ur2W2ZrYk9ZzTWHuVEdQoyZcu1QY5sqKCqftqU=;
 b=S+XZ98bSapoh4+CktAtg9XWGaHOeW3X+tqjeAloUJ8MQP+nbfun9qrSgc+6jPF4hpSe7KvpfKvGM1P76R8o/xnlUlvp9X/BIZC+ys+3mnVohpschZhwzkqai/n2ee2B9VRy0DSo4XHMC77M7i+wiy/yphgOfFNcrLMqd4rEmmdq/OvoperZ7gG4EU0GQEX6e+ZUwdF/qtDtLxPpMbNIPLcj8jeEKuyf+abK8drYenn6vzV23c2Uxdp33164+wASRh1YtylmrDHzD0HWG74BoTNfOhQQRTx9lqr6pLubJkhhSxE+w+dNonT5BYMXRWt6+EQSNb9nXv4rbrwy8EHvSaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7V1b6Ur2W2ZrYk9ZzTWHuVEdQoyZcu1QY5sqKCqftqU=;
 b=Fgjf/i5zZu/b10airum009ddBuSZ+51GVD/yyfeihbaADnlrzeMXjhi4sKO/bsZq3Z7OmKeyVRbP2XQGj6slS9kJ5ZiJto5482fblIkoguReHlNo3n4msOnqpWAecOykbM58O9ESWpRGZsEDs9lZkXwThDlE3dCoChSvoJXYcSH4knSmbm8QnrXXvl41VqaD9iS2vM7eDHbRgRNyUemJqCpVj6dfNi5oFS+D06PKohffXCI1L1aqLvFD3SK8djoMJnRC/VsTY//6KFpXbpMMNSr3j2WHt95ExCWxNzwEmn7BVh66bDm49u4KIZaxiRzXnWaIzPtpRHUSi85p8CU+ZQ==
Received: from BN0PR04CA0187.namprd04.prod.outlook.com (2603:10b6:408:e9::12)
 by IA0PR12MB8225.namprd12.prod.outlook.com (2603:10b6:208:408::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.23; Mon, 16 Sep
 2024 03:09:12 +0000
Received: from BN1PEPF0000467F.namprd03.prod.outlook.com
 (2603:10b6:408:e9:cafe::9d) by BN0PR04CA0187.outlook.office365.com
 (2603:10b6:408:e9::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.28 via Frontend
 Transport; Mon, 16 Sep 2024 03:09:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN1PEPF0000467F.mail.protection.outlook.com (10.167.243.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.13 via Frontend Transport; Mon, 16 Sep 2024 03:09:12 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 15 Sep
 2024 20:09:00 -0700
Received: from vr-arch-host06.mtvr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Sun, 15 Sep 2024 20:08:58 -0700
From: Parav Pandit <parav@nvidia.com>
To: <virtio-comment@lists.linux.dev>, <mst@redhat.com>, <cohuck@redhat.com>
CC: <shahafs@nvidia.com>, Parav Pandit <parav@nvidia.com>, "Matias Ezequiel
 Vara Larsen" <mvaralar@redhat.com>
Subject: [PATCH v1 5/5] common: editorial: Fix spelling errors
Date: Mon, 16 Sep 2024 06:08:35 +0300
Message-ID: <20240916030835.68178-6-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240916030835.68178-1-parav@nvidia.com>
References: <20240916030835.68178-1-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF0000467F:EE_|IA0PR12MB8225:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e7f0fd2-f40f-4962-bb9d-08dcd5fcf078
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LUufsqSPN/ZIH+DXEaQDt02B7gnlt5k+mTjk2o3KGnWgRaJwLVAxIttxdZoZ?=
 =?us-ascii?Q?YwgELl7L5tVs6r4/64q2OnSgrgXjOwe3LZAp3Zb2/Hiqtr9BkDGgQu7NlFTh?=
 =?us-ascii?Q?88jvJsa27ScG3RCarNwDEAOmHwbSD6pqpA+jurspzqTGztYY18Ic55JNm6qn?=
 =?us-ascii?Q?/IIIwWS3sYZI1lVYVpDU3/DBBu7LlF2uMKIDkD5xEYRAfGLHLKiA9Hd6Z7Xo?=
 =?us-ascii?Q?pZrtuIfvGpDBJp8Y2/L0OIkE3V32jdfqOxQMBOj2daVoQqdWyuPou7yOIF4c?=
 =?us-ascii?Q?8wzxqDswidR0m+4uIE9fJ/Dy8YuZ997NR/6b2iBw36iAUU7szKO8UvvRgpbA?=
 =?us-ascii?Q?lYrCv0+xOH24wpHKubkasPExpvShD1g/sjUrgkQPIFObA7Ri+UpaDi6ek5/n?=
 =?us-ascii?Q?oDYmX5ys1Q3EK+tjuEmQo2FK+Taq7q3W+DEIY4miUZqhacw7ltq+pnQIa3kT?=
 =?us-ascii?Q?fPYUmfrmbbFpQGKaz+ieptUbJLo9EYASEXIldsFJDwhrO3CGCZFBl3JAAW6S?=
 =?us-ascii?Q?MLw5FuppoqUNw9/cL/3IwOhIvAI2b77KcvH8dNx4JVXp1MyX2GvykM88lk8y?=
 =?us-ascii?Q?19t4/OjeGScO3QMgYClmbheFj1mbl1MsxIchXDv0Kqivwnx5vraVFxWewM7A?=
 =?us-ascii?Q?IvhL6qnXDwQ0zcDFe64tNZj91+raFdc1/mQwRB40MhLdaNZFRKRfXR9BnCXs?=
 =?us-ascii?Q?I5+f6n5nRfEtQs5b4156a0C3oP96gtpG1z+/fzliWThCOBKmENALdAtu5th4?=
 =?us-ascii?Q?yZWDTkTRHaaU9xDx1+Gsv1YM4mwv40LKhFirR7/Sy04JTfLt4VHD3ES896F5?=
 =?us-ascii?Q?8/sMKA/wgxJRox2iVedyj1MZWsU92MUH9EfSBRtlP0BK6pkfQ7FoBcYs1cKY?=
 =?us-ascii?Q?ApbWp/gn3h/HGJHIxgj/oI+CxeCd90R9vCMV/x+J+rh3wcV9XVRHM+f04iiC?=
 =?us-ascii?Q?jUSpROESZ+w1ZngaMFILugley3SYTBPXbqa0prgWayE0N9Lj5cGE49MzFS60?=
 =?us-ascii?Q?as/knXBR4qcW+9oBMavOhn8inLRohrDZJMqltCPKad0Dyem40YgR3QYPPgEq?=
 =?us-ascii?Q?/zS9cxb9vIi61dpH8lwbUi4CXEoqTE6hBl4ze7SfTfiEmmIzLlBB5EXmvEsp?=
 =?us-ascii?Q?Rd+OOJjtrpbF5e2ZEQ28M3Cz4Qb+xgFAMIRYLLHG68DIJfzjOZqd8/EieJYu?=
 =?us-ascii?Q?xWu+LOJ6mrb/eBuQiX1SeQ5/BW2O3FM1LBgn6uBmgpl0tbkp7WoQRuzxPjKB?=
 =?us-ascii?Q?nq5PsVuvZ76bBYTy5Re/RghJqXGkY6o84nXtpwKlQwPs/vtXwLd5wbYU7gN7?=
 =?us-ascii?Q?2xxvbxcu0iC2qlPPAb1IbR4WieVtA26OQRlxiASg50M/xjsGwiWf+u26SYmi?=
 =?us-ascii?Q?mbNppNw2ZYf1ZddHQG6QE5CWXzxPkzP8s4Gk2YSpLqoeek4XQ72q4wUyHzCr?=
 =?us-ascii?Q?fjlcw3KYb36x8hm5BkyqoV+vMWMR+FDG?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2024 03:09:12.0811
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e7f0fd2-f40f-4962-bb9d-08dcd5fcf078
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0000467F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8225

Fix spelling errors.

Branch: virtio-1.4
Fixes: 5f1a8ac61c15 ("admin: introduce virtio admin virtqueues")
Fixes: 68f66ff7a3d9 ("content: define what an exported object is")
Fixes: ef16b644cc25 ("content.tex: spec text converted to latex")
Fixes: https://github.com/oasis-tcs/virtio-spec/issues/205
Reviewed-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Signed-off-by: Parav Pandit <parav@nvidia.com>
---
 admin.tex   | 2 +-
 content.tex | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/admin.tex b/admin.tex
index 95054ed..845ca02 100644
--- a/admin.tex
+++ b/admin.tex
@@ -496,7 +496,7 @@ \section{Administration Virtqueues}\label{sec:Basic Facilities of a Virtio Devic
 than one administration virtqueue.
 
 If VIRTIO_F_ADMIN_VQ has been negotiated, an owner device exposes one
-or more adminstration virtqueues. The number and locations of the
+or more administration virtqueues. The number and locations of the
 administration virtqueues are exposed by the owner device in a transport
 specific manner.
 
diff --git a/content.tex b/content.tex
index 12f9224..c5e7d5a 100644
--- a/content.tex
+++ b/content.tex
@@ -493,7 +493,7 @@ \section{Driver Notifications} \label{sec:Basic Facilities of a Virtio Device /
 \section{Exporting Objects}\label{sec:Basic Facilities of a Virtio Device / Exporting Objects}
 
 When an object created by one virtio device needs to be
-shared with a seperate virtio device, the first device can
+shared with a separate virtio device, the first device can
 export the object by generating a UUID which can then
 be passed to the second device to identify the object.
 
@@ -508,7 +508,7 @@ \section{Exporting Objects}\label{sec:Basic Facilities of a Virtio Device / Expo
 \chapter{General Initialization And Device Operation}\label{sec:General Initialization And Device Operation}
 
 We start with an overview of device initialization, then expand on the
-details of the device and how each step is preformed.  This section
+details of the device and how each step is performed.  This section
 is best read along with the bus-specific section which describes
 how to communicate with the specific device.
 
-- 
2.34.1

