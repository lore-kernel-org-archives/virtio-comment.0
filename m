Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012033.outbound.protection.outlook.com [40.107.200.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB3A358367
	for <virtio-comment@lists.linux.dev>; Sat, 17 Oct 2026 11:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792237603; cv=fail; b=Rcrc4BjTXIBthJkelslhifA2WCLj5ojPan5QlxOJqhbGBlnYiRW2hZHcx1stddumfZxs1NCydGQICNaptzweNuPQ9XeSb3C/fRTMFWMYFuSYRheBFIk5s6Si2nRpsKxHeygm/wpyrH2weTNuaR0rpTbplkD9spbVYyeVuOdQT3w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792237603; c=relaxed/simple;
	bh=iISYN5ZiNPKvFl148BPquh34VmOKqs2zaVD74j3fsPo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=e+PUHTCp3wqPUDiqimV/iu3qCAfHJdlCWh24hnOwSGxId5kS6FjQgz5eofILJmXsNcKSH9qQdcut2Tzwc3nyvHZBWzpBVrQ48lUdBmPqk9zHiQuA6UWAMHHqInvAwf3oSHu7AA93aHQ30GKHFlgEu6vAKa3x4UAR6vW1qLBZdWg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=C3JRInFX; arc=fail smtp.client-ip=40.107.200.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="C3JRInFX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lNG0J2IO367ILmJQcjgzGzpjSSzdFbaCdwS5Gz3arwy0qLg1TS/dLyvPNSfT1/W1xLD5RLpDICAmvfHxwXHkasRt79ejrNZFNFllJg7/PFVCkJ1jXcG+P9K8O7wOHEQEvnAp/I7tnKbECiZrxjljAYvL/apeFulbM0o+PNri5xcNG0Vq4vGfmJQT2EgzHkxWpUfaEjzmz1SR+gQNEh5ROPcG2PpSjLRlUhnnxEpEanaVTwYK4FS4nPun29wi+Nlr2GfY6UsN4EeJKv5sIvt5vcPRinm+9uF2geqrK0rf8JE/5MxkehMnIl+AioHntXLumwBvlyDjctsEvoXb4NafJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HktH1RRJ/hs42fBnt/OvQ7UZLgqcppLMgXL9YQ4IT3s=;
 b=LO0FBErf1lF1W+9BakVKZ3T+AtMhnbg0dYE002WOj98I/NdIkKXcp9/U8UQAEFOc8uD547W7ccyz1mpp5+/JRZVJGiqi99ErpQ6/iBTAaD71ZiRigV5slsiWLO+ZW/ct69831A5qkKuBppK1rJ0F5NdEPh/+4v02VJ422wFrdBc8YLNwbTkB9fR/GNr8zrjW3hnFqX3tm9FLeGplhK6Hc+d+fwpmv253yrNFmycdd0v3MbZ12DKejOPw+r2Y/IxyGNGWdchDW876xNKKC5y6Cy6/zrp5H0AJxxc+oy5ec5V6EGhOAEOWwRAH/LKOVozaC6A03yjXmtNoLg+7MmhU1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HktH1RRJ/hs42fBnt/OvQ7UZLgqcppLMgXL9YQ4IT3s=;
 b=C3JRInFXjehikAIDeP09UCbAy/cqxf6VkRMxwjQmBuEP3MuduafCwbVfYD92aBeEAuMUejEuoRxGQBjmypr7Z212ueAhenRXXdgoAF3q+sttaVd1nJyzDcXALNyL1DEBV2k2G1cZdUFMb3omNJQMMMX35nkLiDbay3TvOaettNUYwnaPL37oWqW7PQVdHIHoZPyYKZWYjksU5BL9jseURN1LoOfI0t+uo4w0EtYm4qGA61c/b0fLr/TISgjYZxPtEj1wtvMDBsSILb8FMqO6p+4fHCO+o1H12CcbVOUjfTJlJ6ghAgZuROxy2S+wZDYhrw/NoCTVQPih4uCS5mrpJw==
Received: from MW4PR04CA0359.namprd04.prod.outlook.com (2603:10b6:303:8a::34)
 by DM4PR12MB5892.namprd12.prod.outlook.com (2603:10b6:8:68::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.13; Sat, 17 Oct 2026 11:46:36 +0000
Received: from CO1PEPF00018868.namprd03.prod.outlook.com
 (2603:10b6:303:8a:cafe::94) by MW4PR04CA0359.outlook.office365.com
 (2603:10b6:303:8a::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.18 via Frontend Transport; Sat,
 17 Oct 2026 11:46:36 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1PEPF00018868.mail.protection.outlook.com (10.167.249.153) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Sat, 17 Oct 2026 11:46:36 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Sat, 17 Oct
 2026 04:46:23 -0700
Received: from mec-arch-host11.tlv01.nbulabs.nvidia.com (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sat, 17 Oct 2026 04:46:20 -0700
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, virtio-comment
	<virtio-comment@lists.linux.dev>, Cornelia Huck <cohuck@redhat.com>
CC: Max Gurtovoy <mgurtovoy@nvidia.com>, Linlin Zhang
	<linlin.zhang@oss.qualcomm.com>, <neeraj.soni@oss.qualcomm.com>, "Stefan
 Hajnoczi" <stefanha@redhat.com>, Parav Pandit <parav@nvidia.com>
Subject: [PATCH 0/6] transport-mmio: Support administration virtqueues
Date: Sat, 17 Oct 2026 14:45:50 +0300
Message-ID: <20261017114556.1701355-1-parav@nvidia.com>
X-Mailer: git-send-email 2.43.0
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
X-MS-TrafficTypeDiagnostic: CO1PEPF00018868:EE_|DM4PR12MB5892:EE_
X-MS-Office365-Filtering-Correlation-Id: a1cd7860-628f-4114-85d6-08df2c444c9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|23010399003|1800799024|36860700016|6133799003|10067099003|18002099003|3023799007|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	XlSpKZHUnWs8QBjGopOEc3u57KbkeYjhEy5gm8xhDg4h4t/oiIVjSk8ZkTFmTNQZzcZe4YSZfXdswjyhoajVXlN4G4xozGwBj2yyPKXkFf0r+cdkn9Eyu+U6Y5+lRrJvqW6O6Lzjjhx8n9AyNiqEDn3DKbncJjoQOuxkJlinuh2LpPXFdeVY6j7CEt9yv3FMAEwMMgHNEYc3tsFqclVQ9qA7+JZ9z67CMbJVq+WrTLMk8XQB/fpz5q1yRPaPEqitiQflBubNg59pqvcQvKHCOV+wM8nN4pxO1nKiZEd+uTIVamWxtvaJn8EeFlzHKeFzpG9LCltKaCtSw8oZt1YsfINmy8ZIIsmpnjxbwlQ9YQWyeuvZJeAZYr9UFHUObfL3VrWUp+wAKMaUCRCHZ8cflMh9T/d7YR/1GEyUjkEV9EvGMTsK9wJHO5ZfR0xKHBxr23Wh5tZUwZbYvP11BCgqhGuZwKaexulxp8OjRNygZBRtQl7lRHPkhm2os1N4iltNJ3moL8UgLEHJznQArpcVVMFvjcsbknJbu7UHNMG8Xuib9Y4tLR1MIOIYPEld/MkGwYG69yOeYH7z4OIGx+R1J+NSJP24lRtEG2S+JcW+WUoVjk4vtOCmdnCglwBeVDoWE2kxo597tilGcQwIkhVzIIdz2h3UlrpPi6T6ZajsA7vhYXeqKGpIZBLqh5zcoYGHhPHU+gDhoukFrr3lsKh1IQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(23010399003)(1800799024)(36860700016)(6133799003)(10067099003)(18002099003)(3023799007)(11063799006)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	jDTG4UlAa5/lMWOdHZeqCsKX1uSf3/YVigUpavSUTrjkHv2d6ko31gjhgKSMWn57bZRCcvbeC2FiBbB7as8gH9kv0gMFZC1Cq49J4XfTlOQovPqFF+qGJU/REYNFREfvti+QHTeePkY8w16BkDTDLyGMceuvSIV7rTpxTDkjG3A/8qqO6PITQ1d/1tL7N2mfMWr/A+tnrJA89L8D76W1JFdUMCAPwAjPS65HZWY8MoXM0thby76Gojdp8LxvRzHNvxxGrrDdCPJghJ/ErE7gJ24ysgAQn02oz872gWkUcnaAV2UvGoKHbhsaGNreU5vyxQJ/7lsgblUw69uTkA2qYJY+h2OmxvIkQxFCCkZm2oLtOIQu8nQNcp8DewIAh1uCFFwRVnitVrFDIfhrogUqc5YD3zLl1i9osReJ30Cg1ga2NVrl4uYsjcH6gHwjwPod
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2026 11:46:36.3736
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a1cd7860-628f-4114-85d6-08df2c444c9c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF00018868.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5892

Administration virtqueues and group administration commands are
defined in a transport independent way, but only the PCI transport
describes how a device exposes administration virtqueues. For
MMIO, VIRTIO_F_ADMIN_VQ is listed as reserved for future use.

Group administration commands for the Self group type, such as device
capabilities and device resource objects, are equally useful for
memory mapped virtio devices. This series adds administration
virtqueue support to the MMIO transport. Only the Self group type is
applicable to MMIO.

Two read-only registers are added in the unused range between
QueueReset and ConfigGeneration, mirroring the PCI admin_queue_index
and admin_queue_num fields:

  AdminQueueIndex (0x0c4) - index of the first administration virtqueue
  AdminQueueNum   (0x0c8) - number of administration virtqueues

Their presence is indicated by VIRTIO_F_ADMIN_VQ, so no new MMIO
Version is required and existing devices and drivers are unaffected.
Administration virtqueues are configured, enabled, reset and notified
like any other virtqueue.

Patch summary:
1. Introduce administration virtqueues for the MMIO transport, limited
   to the Self group type.
2. Add the AdminQueueIndex and AdminQueueNum registers.
3. Remove VIRTIO_F_ADMIN_VQ from the MMIO reserved features and update
   the feature bit description.
4. Reference the transport specific discovery from the generic
   administration virtqueues section.
5. Add the missing PCI driver requirement for admin_queue_index and
   admin_queue_num, which the spec already describes as valid only if
   VIRTIO_F_ADMIN_VQ has been negotiated.
6. Add MMIO device and driver requirements and conformance references.

Parav Pandit (6):
  transport-mmio: Introduce administration virtqueues
  transport-mmio: Add administration virtqueue registers
  transport-mmio: Remove ADMIN_VQ from features reserved for future use
  admin: Reference transport specific administration virtqueue discovery
  transport-pci: Add missing driver requirement for admin queue fields
  transport-mmio: Add administration virtqueue requirements

 admin.tex          |  6 ++-
 conformance.tex    |  2 +
 content.tex        |  3 ++
 transport-mmio.tex | 96 ++++++++++++++++++++++++++++++++++++++++------
 transport-pci.tex  |  3 ++
 5 files changed, 97 insertions(+), 13 deletions(-)

-- 
2.43.0

