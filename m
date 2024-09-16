Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2063.outbound.protection.outlook.com [40.107.102.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DBEA107A0
	for <virtio-comment@lists.linux.dev>; Mon, 16 Sep 2024 03:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726456158; cv=fail; b=BdXB/OpKNgX3ENpHSzEwrEacPVc/AnKqS7hUezgnkgnE260X+8jSAivddQdpYovq6TTQXbB6jiq1aiz+kd26lNGKjhdPm+GwqsCMedPKOscqEu3ihCiWY/T2py+UON7v9QFDgzQzVRfss5XuS66Wg7HQhr60LV8DOzW1nmaecCI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726456158; c=relaxed/simple;
	bh=ZTfnfm47By8ZX9G6hj5BW1bU9ZLS7EsvyDXcQm+B8AA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s0+XDFYRsBY1IxxIXJ8dWrN1ruUGTPSH70b/whuEL4zepoSwLJ3zUprrfznVa3aGa2lMPlcEboRL9Arl4yqTFfwrh/EP4GyYEY8qIxovQ40I0ml7F14ltlzGuJMD9YxRHVOFEv7bgUBf5hX8KbbRf7h3DUwi2u+fe5NDBpmXUmI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=H7tTznZp; arc=fail smtp.client-ip=40.107.102.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="H7tTznZp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RW7+YtkqkWvl0py6LKyobCDjY6fAt8r4mfJjNUSqSSdqm14E9tM7pIYoZH1MvrW+gqNHN7vN1xLNXHusIVWZfYBWyBJivQHYqWcxNcrsr9slhDDX+2AL0aWDXZZvHPxQ+x9WV2kSVunSvvw575ZEvvsXQ9OhsxDaudbjMtCDFBRNa4JfrTSRYux++sfkBC9O3L8njkXeFrtcAYcue2FIMTD0Gy0Neae80epJEQB2xoYgqUQBjmlJ4GV2wsx4z6VsAejQCF5vCiHCKspYqHUjsUgmytdihYOYZEl/q6SsxDByCPwk3lVKLG0/MArRSd+X2uJTZiv9NNGIOy9QiE+06g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5LG8PxgqGQ29gZSgZQ2MzQmcrN3xve0o/YXkBHzTuME=;
 b=T0ADFeKQ7EKv4G8XALPYTRhfgUcgSCs0VC/gQhsvyhv5KvXf1AQfzDP5DCfK62KSJPmPh2LDIdC1OUtUek5CEp2259ddjTh20AI/KVHlSjDY8z0RSzGTs4KWpYBeM4goInyIyMA/JqaWEKBKFIWWUDcA+nHU9qw8V1AfmRgK2G1QmGJFzdeQ8b2mx1KKnwyfQJVKwuIPHJ3jhdK7hh9vBy1SdZ6eKgszgISGj4PSp8HXwrybmAlobXs/Qvix4gVMov+UlksHZiyBX4+3/PxxoOA0u0V7tBZcH7I9PpfVo/RcK8arndGed3SwMQR0caJlLLfeySjvKj+6sOzO+//5Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5LG8PxgqGQ29gZSgZQ2MzQmcrN3xve0o/YXkBHzTuME=;
 b=H7tTznZpnXUFv86MBBRkguDoQUnrMOFgQC0pBeK2Omxb0WDPXpQzXtwf9nVBhQoP2dk3jct3jgyB8FTYUMCDb3ktNjD/l/pQE99vez+m8YjyiHXGLmGBnaoGEn5Jc8mL9a+1IiwSRSKGKLk72FqHZq14ckKZAkMetUfH/qtNEms//J+no3/RtCvpQnPZNk5ZmuSZwB1O1I+O7rIAtLgpZCnO/CjCqw0/etDbAJPjkELlODtbUXvqqynW5AyKx2+QFv16Jh/99hWhlKO5GgQ95MaluVhSnjBWwckFO7MjCRJeDRP3qn8VH8pchOE2/aafVj88MeMXI/FqwcCZ8Yo6GA==
Received: from BN9PR03CA0606.namprd03.prod.outlook.com (2603:10b6:408:106::11)
 by SN7PR12MB7179.namprd12.prod.outlook.com (2603:10b6:806:2a7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.23; Mon, 16 Sep
 2024 03:09:10 +0000
Received: from BN1PEPF00004685.namprd03.prod.outlook.com
 (2603:10b6:408:106:cafe::14) by BN9PR03CA0606.outlook.office365.com
 (2603:10b6:408:106::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24 via Frontend
 Transport; Mon, 16 Sep 2024 03:09:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN1PEPF00004685.mail.protection.outlook.com (10.167.243.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.13 via Frontend Transport; Mon, 16 Sep 2024 03:09:09 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 15 Sep
 2024 20:08:58 -0700
Received: from vr-arch-host06.mtvr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Sun, 15 Sep 2024 20:08:56 -0700
From: Parav Pandit <parav@nvidia.com>
To: <virtio-comment@lists.linux.dev>, <mst@redhat.com>, <cohuck@redhat.com>
CC: <shahafs@nvidia.com>, Parav Pandit <parav@nvidia.com>, "Matias Ezequiel
 Vara Larsen" <mvaralar@redhat.com>
Subject: [PATCH v1 4/5] gpu: editorial: Fix spelling errors
Date: Mon, 16 Sep 2024 06:08:34 +0300
Message-ID: <20240916030835.68178-5-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00004685:EE_|SN7PR12MB7179:EE_
X-MS-Office365-Filtering-Correlation-Id: cd36b3bf-2bc7-4bc8-7850-08dcd5fcef23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?E1bxmjEtrq4bAiv2mIch2NGl5n7IvyWxDP56c087TvhsKjB0PPriCqt9GoDK?=
 =?us-ascii?Q?C9CoH/QRJS3bOhYLV01tOz+w1y54s1/2JhXhp5dBo7PC75CUqCKW4lCpnjqM?=
 =?us-ascii?Q?Tb91g00n2p+F68RyxtFJbQcTY3AxCm0AZBc4n0nEA4bGxyLpP7Yw6+673idp?=
 =?us-ascii?Q?gsW5tRECLvhE8Y/dVVhXnNRY/tcVzSqydbb5QDEwQIBZDxxDz6CQx09s+HgA?=
 =?us-ascii?Q?KKD8AmGLdbkd+oKpF+zSLjLrBw3gTDpRormejODvXGgoA8ogfIpGDu/uW4hL?=
 =?us-ascii?Q?eodcfqmg17s7zUMdPrH2gIQ7ZQcqLoZBicwUdZ5e9QRiQE8bezqPy1XlaMoO?=
 =?us-ascii?Q?lHZqP0RC+W3eZDGnAi9vUcY95pb4fIwi7tXxiIiNJAmph3AT3GuIRre9SURS?=
 =?us-ascii?Q?dn7dq5/Ca2TPb+Si9mQSsYRvCF813nIyjjHfETOukIAhrQlvwyigQVCJ7IqD?=
 =?us-ascii?Q?gNwpG9P/2s1/OjEj1eFjAKO2Dz+L1axBF9i3Y7h2xxFY62U47dFmgGhAbkyb?=
 =?us-ascii?Q?K163/oM+R6bqhlbN38NPLQ4O/VDNMpxYzftOdNYmy4drVQZACLlQo0v/T4Ac?=
 =?us-ascii?Q?ug3PYSOgi70htrgs6kI9Y45dCZGQCuAhPgCvzbQlH/va5CJeKrTxe8z/z6x6?=
 =?us-ascii?Q?0qj48dVQUjIPOfNr2YiPQF9iNoOAgyrdLkHnGGdViHHeBWourXzyOqf/FEqV?=
 =?us-ascii?Q?ybKfbknR2TgZrE0D4N1wCFAXw726W+xX4+GJ3aOI6AsriKQyc8zadfaq3xr8?=
 =?us-ascii?Q?uDgdGVrOIeZYjZbtYnv32NwJArHqHOzHqJQK3/w8tYZl2QAPDCpvQ67N492d?=
 =?us-ascii?Q?jGoQdQS2evP+074/SnthSXvLMS+btTR7CT5/RVjwQ8WoJmrh0Ihusi4Qw4xy?=
 =?us-ascii?Q?OHj9gr20inzTddbVk351ZIvIxa8xxGSg2VAwlaJXV73vOnLNmPTaqauNAC7B?=
 =?us-ascii?Q?ZJ57ZmbvBneHy6D48pBbJzzWIGMdcBMqLfzL7dYsixlOYTZReU3B0CMzfYMv?=
 =?us-ascii?Q?5KTjBeQxY05i5FW9WcL22GTVerCcak+9iNGucIFWjnyuMYgnPg02lZgBzlBF?=
 =?us-ascii?Q?NJLYJDLOrFwZ+NMC8vH2oDHHcEmjrS36VWI4ZcQlN4SqoCnWAPoNmGiuEUFz?=
 =?us-ascii?Q?jF09MTTpUqi5kPB+aBL6B3IMu1LjsnDOaLR3UZqerBpftP4SJImL1nzTaGBp?=
 =?us-ascii?Q?nUYJeEaFpX2PJepDouOsBPIX+5uDslxUF3H+JO9Y+IFozpPrRZbg7jWqDayw?=
 =?us-ascii?Q?7YdRMCzojRfC/zf9CVIYSC2G1q29243w8yaYfbYoF3TYw9KirWY3gI6xru00?=
 =?us-ascii?Q?/KQinNlGQoF9OzBOSM2v8nMAMt5026HwB2RGkIG0V6U4HN9tna9+OG0EnKCx?=
 =?us-ascii?Q?X8+byKYZ2wKvUU2FGW3BFUiQYBN38RD9VX1A56ZxrZ2CAJr2Wimfk3zMl18+?=
 =?us-ascii?Q?bBxdofEf3dO+C6UBJHcP1MXadFF5wL6h?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2024 03:09:09.7196
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd36b3bf-2bc7-4bc8-7850-08dcd5fcef23
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004685.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7179

Fix spelling errors.

Branch: virtio-1.4
Fixes: fed64230bf31 ("Add virtio gpu device specification.")
Fixes: https://github.com/oasis-tcs/virtio-spec/issues/205
Reviewed-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Signed-off-by: Parav Pandit <parav@nvidia.com>
---
 device-types/gpu/description.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/device-types/gpu/description.tex b/device-types/gpu/description.tex
index 66e4873..ba4ea76 100644
--- a/device-types/gpu/description.tex
+++ b/device-types/gpu/description.tex
@@ -166,7 +166,7 @@ \subsubsection{Device Operation: Multihead setup}
 
 \devicenormative{\subsubsection}{Device Operation: Command lifecycle and fencing}{Device Types / GPU Device / Device Operation / Device Operation: Command lifecycle and fencing}
 
-The device MAY process controlq commands asyncronously and return them
+The device MAY process controlq commands asynchronously and return them
 to the driver before the processing is complete.  If the driver needs
 to know when the processing is finished it can set the
 VIRTIO_GPU_FLAG_FENCE flag in the request.  The device MUST finish the
@@ -345,7 +345,7 @@ \subsubsection{Device Operation: controlq}\label{sec:Device Types / GPU Device /
 display).
 
 The \field{enabled} field is set when the user enabled the display.
-It is roughly the same as the connected state of a phyiscal display
+It is roughly the same as the connected state of a physical display
 connector.
 
 \item[VIRTIO_GPU_CMD_GET_EDID] Retrieve the EDID data for a given
-- 
2.34.1

