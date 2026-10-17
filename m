Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010047.outbound.protection.outlook.com [52.101.193.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AED647C10D
	for <virtio-comment@lists.linux.dev>; Sat, 17 Oct 2026 11:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792237617; cv=fail; b=HtCakxd/ZtzjC4PG1vbY+NhkiTFvq8EAKZczCOYI+xVk+fReTHRMIGY4C3NeAdlKpY8jteIUOnoJrVXitiTmFC7IOtRoTeur/mezDIZo8Bi1CEwJVDRQbvAGziypXRJ4gqc4vl497/5IXKfLTK4prXKEXqlO+L44YUitqJw0/eg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792237617; c=relaxed/simple;
	bh=6nAUmZ2PhP8d7B/6c90nzzHv0bPCi61nSbOFs1noHBs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AhPkmcBHm/Rr+hxUZ6OmDLIC8RS0Hzp2OlAFt+5EeRxKzTy4qcq8g8yCI20CYcY0yklPasTwQSZ0E1+tJEeHY3k1+VXx0F28C7EP64EjMHqdUEpavJ1d9I3QGGb7++aUpzTs2zOaTTntq/7EFhFoyzs+/DuhQRsgSO+xbNLIaPY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=VOPw79CV; arc=fail smtp.client-ip=52.101.193.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="VOPw79CV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D+tPFaE405f1BhJBIB3FhYY5m29tx52cgVUa/z9v1lbmraISuCVZJsiKqwtNv3Ql4NRl11p+Zr6GWmparO/zmobUyl0gxPuHpOtaXgtz6nUyTiHnkIKrqLOZ5pBXdvYmugfpMPzztzEEnEEXST1FrKzDtfxGpONrEYKiXqicAnrubs9HqN1SE0M+te6h1VbgvGv5jdL+RCmm2hPM+wExbXR5xEFiUM0ThKyekq8wKc6PwRzeGoJWc4TlZsYGwljD/qQEzXYvLA91ORwx9jDM9V8fvmM7JUtczAwIH9I63Q9VghCaR19xdakVqvnHwjvBgGPuzTBbwP+vEPn5DfmHrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K7mB10wrmrjNU5Sup1UCLC/FbVppqTVG/nG/eCNYLDQ=;
 b=JedSSfT/bN3pomvf9SoD9aTxLbEFKcHRjY2D5WDRj0uPudsLO8rBp9uISN1gxC9li52oRcvIcokDk1ZPliq7JqHkrWs1/C/cjJt0Bt8MI04Pt3MW3hmGMaZ3Zy5krMnacV8qX+9BWJPKhwSBmPoO0+CAYo3ceh69FOO6VbFdP+F+ed/m83gfupLkcDQZuoDmWZt/LkLBSP3ckDRL9/48FlNt3SzJp+N6BYWJEg7M/YmpNN/x37wheomXKLQuaxh82hZLRz1zxFkEhys/PIWBzA81JVyAqk5YgQhmp2D36Ny29I3PRaQJz8M5Yws6LZQIIDG88muzzs+PYsCHMPckDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K7mB10wrmrjNU5Sup1UCLC/FbVppqTVG/nG/eCNYLDQ=;
 b=VOPw79CV/R6plZZCOhvkZJhGrLhx0XUz1AGMo9mWiUib6sXH0Y5/4OQFx6hJEkEJJwY5yFMau3XT/af+xIenEM2nY99Bge2H4F1AfkB5LDel8Otm3kV8Pws9uQKIEuCtqZ7sT0yNhDJfMtQgwATsVY11BKhfJzAXE29Lx2IN5P9v/C0K9BJYW8g6VqpQZBK86hWyTUjiRKJ4mz5IcjLJ/BujAL0EEiuBQxfb7BOKsRCd9vVGk0MX7Qo7YXkJbdJSWwo7b57txRGLbpyGXwrDuDAyMqOnG2eF2lmcQLCf5WbcmEuPRY4J72paa0fJsSgir+rG8CJdAUlPk/IxyN1xYQ==
Received: from SJ0PR03CA0215.namprd03.prod.outlook.com (2603:10b6:a03:39f::10)
 by MW4PR12MB7215.namprd12.prod.outlook.com (2603:10b6:303:228::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Sat, 17 Oct
 2026 11:46:50 +0000
Received: from CO1PEPF00018865.namprd03.prod.outlook.com
 (2603:10b6:a03:39f:cafe::79) by SJ0PR03CA0215.outlook.office365.com
 (2603:10b6:a03:39f::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.17 via Frontend Transport; Sat,
 17 Oct 2026 11:46:49 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1PEPF00018865.mail.protection.outlook.com (10.167.249.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Sat, 17 Oct 2026 11:46:49 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Sat, 17 Oct
 2026 04:46:34 -0700
Received: from mec-arch-host11.tlv01.nbulabs.nvidia.com (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sat, 17 Oct 2026 04:46:31 -0700
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, virtio-comment
	<virtio-comment@lists.linux.dev>, Cornelia Huck <cohuck@redhat.com>
CC: Max Gurtovoy <mgurtovoy@nvidia.com>, Linlin Zhang
	<linlin.zhang@oss.qualcomm.com>, <neeraj.soni@oss.qualcomm.com>, "Stefan
 Hajnoczi" <stefanha@redhat.com>, Parav Pandit <parav@nvidia.com>
Subject: [PATCH 4/6] admin: Reference transport specific administration virtqueue discovery
Date: Sat, 17 Oct 2026 14:45:54 +0300
Message-ID: <20261017114556.1701355-5-parav@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261017114556.1701355-1-parav@nvidia.com>
References: <20261017114556.1701355-1-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF00018865:EE_|MW4PR12MB7215:EE_
X-MS-Office365-Filtering-Correlation-Id: 991dc616-085f-4b59-7c2d-08df2c44549d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|82310400026|36860700016|56012099006|11063799006|10067099003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	6/39piQohERrl6PE/npxm0+Xx6XKQQZt4lM0MnLJ1ZJXzEeXa9cFyUI6wx3i2QHO32Xr+BydWXtHfTrGuokDL3eow5ExCCAPQBzGTOOK8OrN4BiGdr9FuHiffo2IYAcprwz+MY1P0ZUBbTsp62wnYroBqKvLOW2HLIx2MxqQt6dDXOT3hg0VOKsMVYBzJMvk38JFTCOkXZh4UR1Ki9k5UG6dqN6Jc/NXgBFkcYBXQaIt4IOPtOh/FFNmUFTEkZrcFPI+/+eeTT/R5PM17ckcjFyErwHn8CcLYUqLwrKCyUUoV3EougxMwlJSdpEe5OjYetHCVE3eR3DysAmkSWy+PQCm6sEnsMD6JNeU8du0w13bs9gbHS1AZjsyFan5vSO9ngLi5XYBLOPU3qBq/0OfZBKgqHwtRO6zTyPL1Tki5hwyziVxO9cyllBSpKafkel5qJUgtshC5uSy2hZSzqkxkpIn1EzsZS2TKbPEq0w3cXUFZ772Eg+TBwDd8lov5uo/p/oQ/0aROF04RaFjspUOp8iCIe8WoN2MbygZ8ecmjSNjM6R1SLvhg8+ix6gqS4keHCuVcj81l/NC0pXC4/n7/nQNXvvsg4Srd/V2zjktB2iCEySQZEWBlxz7QDL9estWmz/NAgTQCl9FbT+F2qETbEn+zbMf5pXirG6/eT76UhxOBYfyMfn9keXXb+67mFZNhTMJLCibGYuB7G09WEskTQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(82310400026)(36860700016)(56012099006)(11063799006)(10067099003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	GMZgIREA8/f/ZcX6Q6ZQupyMyrhCwUpjQNo6v+XpzuPw4v5fdOM/XKLazWrnHtly7EbfPQBivCLE72cbITVvj2KGebz2WXYGKXiIpbaRGmuCINTByJCFZCiKuEwCAJmSEHlSm2mILyuUF7EfcD6DVgV7mQmRT1/dJqHiCQuoMtPOZSv6HE5NulKdt3+z/+PL3FnBcJm+4r7M56z21vtvxqBoYgh99tKPRy/24QBkZKCN8eshEIV+6y6boIb4sydmFsKe2zgbSxVkVTYsrrrIdBhN4UvEOSG9pBK7G7S9xWQ94QNPoyvPPXlLr3DxPEYmuUEUfWm8lUUp/Ze6WNNKSZ34VZvZIkgnURBV7IZsuCEGrQ0DbEO23/1ls/EWo5Jhr3uqbCWohIDlKsqZOyOuy2m2NqzMD5Gadf/vtvcjBSfp+lCyKIBQqnp93Lhi1OOT
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2026 11:46:49.7346
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 991dc616-085f-4b59-7c2d-08df2c44549d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF00018865.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7215

The administration virtqueues section states that the number and
locations of administration virtqueues are exposed in a transport
specific manner, without pointing to where this is described.

Now that both the PCI and the MMIO transports describe it, add
references to the respective transport sections.

Signed-off-by: Parav Pandit <parav@nvidia.com>
---
 admin.tex | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/admin.tex b/admin.tex
index cfca5e3..a639c17 100644
--- a/admin.tex
+++ b/admin.tex
@@ -493,7 +493,11 @@ \section{Administration Virtqueues}\label{sec:Basic Facilities of a Virtio Devic
 If VIRTIO_F_ADMIN_VQ has been negotiated, an owner device exposes one
 or more administration virtqueues. The number and locations of the
 administration virtqueues are exposed by the owner device in a transport
-specific manner.
+specific manner, see
+\ref{sec:Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Common configuration structure layout}~\nameref{sec:Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Common configuration structure layout}
+for the PCI transport and
+\ref{sec:Virtio Transport Options / Virtio Over MMIO / MMIO-specific Initialization And Device Operation / Administration Virtqueues}~\nameref{sec:Virtio Transport Options / Virtio Over MMIO / MMIO-specific Initialization And Device Operation / Administration Virtqueues}
+for the MMIO transport.
 
 The driver enqueues requests to an arbitrary administration
 virtqueue, and they are used by the device on that same
-- 
2.43.0

