Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2059.outbound.protection.outlook.com [40.107.220.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 298E2524C9
	for <virtio-comment@lists.linux.dev>; Tue, 21 May 2024 12:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716294246; cv=fail; b=hsY84YC7iz9LMAgy3/gm90c+C0XFoiqJGkJz8sm1xABTL0rX3Aw2tP5wHWRI6uh5RKCBsMwxWr+1ZqSHAjbXELBMnHY/ETEYvYbo0ZU9uFtx+NLkXjr63BJAzsbUh8NG/HpLx7QfGP509LdZ88UrGm8Zrswiw0tPwct+EYumQCg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716294246; c=relaxed/simple;
	bh=U/F+wUathAB3z/yqR+mEWJEef2i8fBvQ3HIZKJLBhTM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nVDq3KkIRK23gbQKdAM7yKHU+88tYloGQ0o2t1Y2IL0TyR8C/lVt/DAIti1bEr78IcFcjPESJQvN105/OingFIfHVy4UYVX0kBcBrHvFT/PQqclZ0mzXWP8MnMMSBY8UHhPCLYYLP3emvuhyykKt8/PMH4IXkMbU6vfZ8XlWVFM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=IbiOpePv; arc=fail smtp.client-ip=40.107.220.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="IbiOpePv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IWZ7+U9joUJvkZeYZm2rHx2615qGAfg33VPqLMRz/L35sIYWibq7y1dRBbyZ6PzFksm2wL2b+XMHHy1HIGg5WYJ9Bp1iQ5Izu+mJOMxCxm90Ocd8LqPgweNLIL6zKckw7lcHoyPVsq6E1qkhbALiS/YVJqYQsG2gE4hiEf5kpBcTlPLtXPvQg1s9Y5sMHutDJAPAhLRhv8M5Bvr8Ej3Fkdx430nm6BwzkomjRx/S3/GIrIw+yAT9oRpBR4Jzb7QR6Tef+iizHjJLte+xzUUYYMRnNkC1CnmzBvStyLIhHGBS2t76PdJ+6OYkj/+EBbHwMIsOHDnSg+pbZdjROoYEeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ndd3CsNgPkm53y7PvSeVBoUERfFyfbf+v1KUIlHzk0=;
 b=EuqnHGyx7FfKz6dzeDTp4d1tmAmiSOkuCNuWJz9zvuO9rubEGueN4NcowfgGBLwdP8+k2FUrftEOfjC8238F1qi3el41R/ap06R/msueSsEX0hdsBGWPcu5Z5NSqGiDyhJ7bVK5JEbEij2Irg8jaypI2W9O529PWQwqvzzTg1kPxqu8DVIIyAvlrEdC3oEkc66Do62nMBaZZ5dUo/3nZQZtN+r+CNeTfW7aWXxx48N0sWL6xbrcvPtRbz7HdQ4jPBhw4TfP1+ylWHsxF3B5ajzNINmnNhbUr95x/kD/UWGSrbE72pVxFHHKAKc258xjQfv/KpFOILx9peMi+w3NtyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ndd3CsNgPkm53y7PvSeVBoUERfFyfbf+v1KUIlHzk0=;
 b=IbiOpePvRCRkUX81D4voPEP4ZMpfXNYR00gWsMSXwYNXxFBQEvt+vsq1DEnAUDSsF6knuLHmXPkwcTHn9MoukUtizcxDVi1TqzlFdNWcAz2FM4zeugiTmvooG9dAwdQCqg9vsVJ2FRkQmtxkLMuBe3oPSj6cJvNIC7546EU7PF/xFKoEBVsH/kMzpL/VRFM0w7uk5F/T4/Z8uyCfVOh57pgpzw6htNtaYQpRBjDwk79sjFXVTpRSs1OXxBx0VapsgF/q8A/lpLSJE0W3pHJ9ESiJeH3Vuc5cAjUFqz+frYDPj49VXXg9T1+iccbiaTNwET45KvsY0MgWWdBboakjiw==
Received: from SJ0PR05CA0090.namprd05.prod.outlook.com (2603:10b6:a03:332::35)
 by SJ0PR12MB6733.namprd12.prod.outlook.com (2603:10b6:a03:477::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Tue, 21 May
 2024 12:23:59 +0000
Received: from CO1PEPF000042A9.namprd03.prod.outlook.com
 (2603:10b6:a03:332:cafe::7c) by SJ0PR05CA0090.outlook.office365.com
 (2603:10b6:a03:332::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.16 via Frontend
 Transport; Tue, 21 May 2024 12:23:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1PEPF000042A9.mail.protection.outlook.com (10.167.243.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7611.14 via Frontend Transport; Tue, 21 May 2024 12:23:58 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 21 May
 2024 05:23:41 -0700
Received: from vr-arch-host06.mtvr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 21 May 2024 05:23:39 -0700
From: Parav Pandit <parav@nvidia.com>
To: <virtio-comment@lists.linux.dev>, <mst@redhat.com>, <cohuck@redhat.com>
CC: <shahafs@nvidia.com>, <xuanzhuo@linux.alibaba.com>,
	<yuri.benditovich@daynix.com>, Parav Pandit <parav@nvidia.com>
Subject: [PATCH v5 3/3] virtio-net: Annotate virtio_net_hdr as field
Date: Tue, 21 May 2024 15:23:03 +0300
Message-ID: <20240521122303.2004122-4-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240521122303.2004122-1-parav@nvidia.com>
References: <20240521122303.2004122-1-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000042A9:EE_|SJ0PR12MB6733:EE_
X-MS-Office365-Filtering-Correlation-Id: 511bb7fd-1504-4143-6570-08dc7990e423
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|1800799015|82310400017|376005|36860700004;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yiNPdcAluyDAYVAMH/ARan2zDQmALryQGst2xYszEw4cFoC98RlgR1sIf7dk?=
 =?us-ascii?Q?V5qIwfLMPfoJ1rGmqZPsgfdbY3BDp8vec71DqBzsFPyC6iLlvpxt2qKcyh6b?=
 =?us-ascii?Q?vkFyDm9wJftsGQy10cGTWJ3w0DIcAT7NPPcxvnsouEa8zJj6r6tJr2gijZ5Q?=
 =?us-ascii?Q?pFDaqLf/FbTfqmnuCvh7AAolVsLy2HyhIzlxreNFMCLGrYw2QOPK3N3gVaL6?=
 =?us-ascii?Q?Ei0TFjvd9g+dsseGqE9i11ujf5W6zG73za1yKbdtT/Ed6y/mDalKrbYGV7Mv?=
 =?us-ascii?Q?MR7nlL4Af4jLtnpUkCZ/7+IMYmeKcWrY3YbooI3NirQIr0HX6Y6EDFeHHWEU?=
 =?us-ascii?Q?hWLKa8JMlY0bUdPLY19Rcd+7oJdDPvqeXrz0i8XIn5fJpYj1R0hYmv7TSkJr?=
 =?us-ascii?Q?QiKA2ByCpTEv/IdTWV7i4WJKTH+2XlzKREyJ16A2R+XMbLIwnV6Pp+MgW64E?=
 =?us-ascii?Q?Su1Nz7DsKJ2JGoY1riOhvD58A+0i2X2/dfWSGV+vSAqZtsBYJ/JTFb+aPE20?=
 =?us-ascii?Q?FsZ8u65tRUF9QFSsPd+FL8O26ieFmtWdNIzYAA7HB1XVKGtzj1Gyk9ceZ/R2?=
 =?us-ascii?Q?X7mRGXScgv8PY5fR3HGX0c/CGWU8nWYo0JZCnvKDuggr/EjJB2xWGSuwjAJc?=
 =?us-ascii?Q?LtRDtk6QaEo2JJ3i/W2mQHt6Cjpl3jYI/sam2CQgw89NTC0qlXsUnQOXjG3b?=
 =?us-ascii?Q?NnFy3eHAEJurcWQqv7S0CX3FQ0YhAt73WyAug1K+9d2+UrSUUiV963VKTRui?=
 =?us-ascii?Q?HvJ8a/mInd/SrbD0xd7eyp3UpHX9dutz7FX/laZ7L8OcH4P0b937Zb+Ao9TY?=
 =?us-ascii?Q?DQ3S49Hmc8B/IAwqqEuuCwoczxZ9EsSnx0DnNAsrmOVzRF/qgxK6cB3cQA5r?=
 =?us-ascii?Q?igA09ljBDqD+fFlt7Bwro5N+TeLZyFQA/00fqUElpyKwGlULpAXsA3AdHsej?=
 =?us-ascii?Q?xsNJ7aSn0L64TVf9TQsboOvdjlJW70cMTgtxUA68nGPDlaIuDO7O4SZvETTi?=
 =?us-ascii?Q?oOGYvDuH5XOCLhuiB6A3TWoqMB7cHcz1K5K6crmT4/EP3C0mQ7CeEkIg7y+w?=
 =?us-ascii?Q?EGVeYrkfnxjLkMcJnf5Mp761vNWEtKO6zVNB0IIgRAj2aWKYhZgOzXJDZ/IC?=
 =?us-ascii?Q?op1dHf6S8F7sw8F2yOGYXBvg+S9qjGYGMmjpqcV7n9Cujh9glt0aRDLjwC2C?=
 =?us-ascii?Q?U6s66fpp+cO+z5LWUrHiKhFU0b61ZMy4vwui0RGiZHO6ucgNH3tyTE0xQu4N?=
 =?us-ascii?Q?RVPvLrN/2zbwhg6Jl3JLvMx4Ktyoi1zYGxG5fl3nuMYmSNiyoHd2mkwm4+pz?=
 =?us-ascii?Q?ufSm5wqhNZVIAmwv7wuY1zdTWwZCwwuu1/irqygY1WekrYFpinDN2eg6KHWj?=
 =?us-ascii?Q?WM9M6tTADuqkvedcP80lomZwfFRS?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(1800799015)(82310400017)(376005)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2024 12:23:58.8606
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 511bb7fd-1504-4143-6570-08dc7990e423
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042A9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6733

At several places struct virtio_net_hdr missed out the field
annotation. Add it.

Signed-off-by: Parav Pandit <parav@nvidia.com>
---
 device-types/net/description.tex | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index 38992b0..e65cdd5 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -437,11 +437,11 @@ \subsection{Device Operation}\label{sec:Device Types / Network Device / Device O
 
 \subsubsection{Legacy Interface: Device Operation}\label{sec:Device Types / Network Device / Device Operation / Legacy Interface: Device Operation}
 When using the legacy interface, transitional devices and drivers
-MUST format the fields in struct virtio_net_hdr
+MUST format the fields in \field{struct virtio_net_hdr}
 according to the native endian of the guest rather than
 (necessarily when not using the legacy interface) little-endian.
 
-The legacy driver only presented \field{num_buffers} in the struct virtio_net_hdr
+The legacy driver only presented \field{num_buffers} in the \field{struct virtio_net_hdr}
 when VIRTIO_NET_F_MRG_RXBUF was negotiated; without that feature the
 structure was 2 bytes shorter.
 
@@ -735,7 +735,7 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
   chains them together to form a single packet in a way similar to
   how it would store it in a single buffer spread over multiple
   descriptors.
-  The other buffers will not begin with a struct virtio_net_hdr.
+  The other buffers will not begin with a \field{struct virtio_net_hdr}.
 
 \item If
   \field{num_buffers} is one, then the entire packet will be
@@ -2416,7 +2416,7 @@ \subsubsection{Legacy Interface: Framing Requirements}\label{sec:Device
 
 When using legacy interfaces, transitional drivers which have not
 negotiated VIRTIO_F_ANY_LAYOUT MUST use a single descriptor for the
-struct virtio_net_hdr on both transmit and receive, with the
+\field{struct virtio_net_hdr} on both transmit and receive, with the
 network data in the following descriptors.
 
 Additionally, when using the control virtqueue (see \ref{sec:Device
-- 
2.34.1

