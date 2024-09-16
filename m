Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2056.outbound.protection.outlook.com [40.107.92.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98424134BD
	for <virtio-comment@lists.linux.dev>; Mon, 16 Sep 2024 03:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726456147; cv=fail; b=purrlXWbD8awn+tWOsOHVy/+Kp+4OD4FK/foyXHZIue/xom9elgqdCHYynEKGPN/E/exS6j5dN0bJIzmcYbJtASoyOZQ8eoDEZw7hjoj430emktId35xAY7JZwgZh6CjKHTQRQKsJykjLJFBjcyVKG7UP/61fP0b4qFOczqZnTs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726456147; c=relaxed/simple;
	bh=UWpKb4dm+fUcnN9GJ11XudmLV6MRpqHxH+bBHCHuX/4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eaU6cOnb+ec2j9pPF3Okkou7SOd8LFIU5oUIwdnh+z2uYsl1lDTNpobCD7/Hhs5D7lW1PXfzRtynjYVajzu1OPfI+wuNn2wLLpoSXvtUMF3UROGZRSW8D/FvXoV1wyZMNpIuGm/duxfw0WNDLpsgxldqSB7KsTAXH+Nag6DANs0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=hRBdTIRs; arc=fail smtp.client-ip=40.107.92.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="hRBdTIRs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uhT6whGhH/8mEqY/11TX/rC0uQeBkhm4qV1UYtbulddix0OcSeTHWCs+UMIgCahT1kDg/G5wFxdZLIQHoAkWA3a4vNWXM016SfmGUp+6BsQUn6gtIeJA9cZZZ9o8H+QTFnLrpGReXsZeecombm/42onphL3HxpmE809QflVXumbB6AXfwhHDlOpf9BRMnh68gfJfp3x0ccZOBeWogYiunyjA4A8CwmUdTdRci6UjvVGHLjrRMnMRYhbMZTRcLGfE6jaPf7mJ+ezPCnBAke3ZZio5sJjWFxT8igqh54tFyUCj4QpFaynSkoBAfywDXzcGo8a3Dq8oii48dYMeGpe/Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rp5p+9Xh7r+KNk+r7XIm8+aTpzIRyblJc2cu9D9n2Tg=;
 b=Db5RusOtzsC8iGtk6OOhYiym24+Og7m+owzrxxoNLaCb+FNpmBad3B3IelQ0SW+Fu6Et0QTYgby7w3BZ55i+Y7BS3Qy8FiPXTNfp1fgGvvh5AfgHgoWoo59u5CkJpFPkTvGEm9OFSjfbkIqtNVO4Gqcu8e2eR1auIeFEfNH8luc/IaFd+CVPoYy/cXaSjp3NIBHnbGv9vYvPQXDyMxW2Y4wmwlBkEj+fYy4VWQgBk+JYHDXt9sdBH8Ug03IPguO1waO9kr5Q9BHewlXQEU6/Iz6UWHz+EJgVgtj5kqBOHW+s6R5qsUDsXiKn3yRPsapAWrl5ceM1ojmnfKiHEu8OAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rp5p+9Xh7r+KNk+r7XIm8+aTpzIRyblJc2cu9D9n2Tg=;
 b=hRBdTIRsYyVq5+PAAIe9FZbmA89GpZueRtZPUzFR9L4UlIYaEkrCMntYdMI9vJORy3gP/p8TqQU5QKfrTcOmoGJCUHJLfuhLqd481wQN554/+caGe4Mf6LchQtOJIkhvXAWmj41/Og3QNNYAzDpM5EIy5amDEWEYJEkjHrtmTRPdzt6t4+8tTwvppZivB2IClSwHY7XELfs7r9QgjVwZtfc/iDrkk7waMwD8mADpXwdJSjOMzfbTHjkn8zM7fEku2gJMrJSFprcyyYmNpjgEu4cTL8jyBSHvIBMPCxmgikcnV/x+5Z6B2eUkM+FFAkoIKfbcwDh4LFdL2+jEURV0Rw==
Received: from SA9PR10CA0019.namprd10.prod.outlook.com (2603:10b6:806:a7::24)
 by SA1PR12MB7270.namprd12.prod.outlook.com (2603:10b6:806:2b9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.23; Mon, 16 Sep
 2024 03:09:01 +0000
Received: from SN1PEPF0002636E.namprd02.prod.outlook.com
 (2603:10b6:806:a7:cafe::79) by SA9PR10CA0019.outlook.office365.com
 (2603:10b6:806:a7::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.30 via Frontend
 Transport; Mon, 16 Sep 2024 03:09:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SN1PEPF0002636E.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.13 via Frontend Transport; Mon, 16 Sep 2024 03:09:00 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 15 Sep
 2024 20:08:56 -0700
Received: from vr-arch-host06.mtvr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Sun, 15 Sep 2024 20:08:54 -0700
From: Parav Pandit <parav@nvidia.com>
To: <virtio-comment@lists.linux.dev>, <mst@redhat.com>, <cohuck@redhat.com>
CC: <shahafs@nvidia.com>, Parav Pandit <parav@nvidia.com>, "Matias Ezequiel
 Vara Larsen" <mvaralar@redhat.com>
Subject: [PATCH v1 3/5] crypto: editorial: Fix spelling errors
Date: Mon, 16 Sep 2024 06:08:33 +0300
Message-ID: <20240916030835.68178-4-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636E:EE_|SA1PR12MB7270:EE_
X-MS-Office365-Filtering-Correlation-Id: b183146b-18c8-48c4-fefb-08dcd5fce9d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WGVr6cAKJCCk62ybWbnvPA+ATnLKfPk6GnDm/4YIowxHC8ma6bYFBzXjB2ZJ?=
 =?us-ascii?Q?2tbKT9kweu4qOUGmHMrR8L3NGRUwpkI3ilRJLdbiqLjKbVk68ipFmCImZX+w?=
 =?us-ascii?Q?S6nqUPTxJj++/eL1XzJ+N4+ke1ViLtkgc7f+i6MnTi+8yII9OaOhgMXbmuEp?=
 =?us-ascii?Q?ESlFTicIrhCWKMnq+DQzjb4HN7rA+EpPKLNVRzHmKomVvOxMMF2nIhueU8qq?=
 =?us-ascii?Q?K+77eEjYJCz6NWKWYVHaC+oWF+KYorMZEMbB0Mjry5asEwPVnb6BFijD1Rxs?=
 =?us-ascii?Q?6Z0O7ry+7LsIFbZRzaHGUxZ7MOpqx0Xe8D2bvaSB/9cT7ClHyOb0N6kZ3+FU?=
 =?us-ascii?Q?2j8ssVA8R9xsIo7TmMfmpVJCyJZ4AKzPHJstQUTkSm/vMz0Haj6PZYaNqQ9e?=
 =?us-ascii?Q?bXZAKz6cX9oD1ox9oAXH9r5c6SfQ2hkSfGFSQ1iY04MTnT+iU4IMw6UzLwwd?=
 =?us-ascii?Q?W7wbpHvwn3OGFoyfZ0XBnqVwBKTn3f3g5nr/mF4iptRYHijCjLjQltZifK2m?=
 =?us-ascii?Q?b0pJjTO8OEJLGX176JbfT6/KFOvoGfGOAh48P4+fqQV6d9tTi7L2ehlRhSOM?=
 =?us-ascii?Q?RwLLzp6aFCLh098XpZHpMHP0/Po5jWc1w3xtQ9doCIzRlHGb2/MwXXX/HBeA?=
 =?us-ascii?Q?eegKgtPuQ3PCuYYWF58awiHskPkDLaOvBU9ukw0wh6o5A9jO5SW9zdKcPd28?=
 =?us-ascii?Q?vZmbC8/f9maaxo1ZdMWVsOrcbOycLpoJ3AdYt/Mx1kZNepXlIDG8eZopKey5?=
 =?us-ascii?Q?2C6tqrflr8Z2gsvZpTJsyqOZRfLT11YlhRkvoMFbuvBmCWzsj6Dn5ygzQySZ?=
 =?us-ascii?Q?3bYHXd2cRQzqCYp3+iD32m4I23Sh2C/4VZdLtLP0GmlOUnxdLBc0YhwV5lm+?=
 =?us-ascii?Q?2drYvLQsQFl3/8oevdqsfGbEvsOEiEnPJ3UVuILDR/4FaQFJAaW4pLqRoPUC?=
 =?us-ascii?Q?wRdZbM4FCBOMaeQUrJfW8IVS/9LDAlMixbJdnnWM1GgpTh8XyB8ax5fwAFch?=
 =?us-ascii?Q?0K9ufSl99cd8Nu/5GhiR4cCjFssGbXiD01Gox6quu0AR53F7V7gqY+eRDThe?=
 =?us-ascii?Q?hRsIJBFBtiGAdkesp+UQTP/4bPU1opROj7dyRd2r2jSrEiorA4YIWRje3jTI?=
 =?us-ascii?Q?HDlFZkeRBcCFm/nMo5R8bKOoU9LjJwqVTvPp7ROJkDxrmyM80slrl/8ViWEt?=
 =?us-ascii?Q?mr1mYY9CZj5oPWZw4sQq1aKtT3wZ9J8ZKUBA9kb+E/a1+7kZ2oim2yWcevSm?=
 =?us-ascii?Q?W3Ftmf8uB1/p+eiC5mMTiX5S3anThqQo8b0UvfBP7htKrvSzNCvwndzziDmG?=
 =?us-ascii?Q?ZqGq0gcTDXZLv1vRN32RabPkN7R3x5u0JPVxJD9/Z46bgRYHdot6o+WDm9Gd?=
 =?us-ascii?Q?B0+FyaeU+BZVeHo7XZBMzxF4T+M4UXQ0qEVzYqYBMbA/R0t8lSUDwJo73/1R?=
 =?us-ascii?Q?QgJXp8fxictxjiv2eagMzkOvvP+SeIZB?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2024 03:09:00.9624
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b183146b-18c8-48c4-fefb-08dcd5fce9d0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002636E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7270

Fix spelling errors.

Branch: virtio-1.4
Fixes: a385dd3366a2 ("virtio-crypto: Add virtio crypto device specification")
Fixes: https://github.com/oasis-tcs/virtio-spec/issues/205
Reviewed-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Signed-off-by: Parav Pandit <parav@nvidia.com>
---
 device-types/crypto/description.tex | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/device-types/crypto/description.tex b/device-types/crypto/description.tex
index 5705e26..e053cc7 100644
--- a/device-types/crypto/description.tex
+++ b/device-types/crypto/description.tex
@@ -424,11 +424,11 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Crypto Device / Devic
 
 \field{header} is a general header (see above).
 
-\field{op_flf} is the opcode (in \field{header}) specific fixed-length paramenters.
+\field{op_flf} is the opcode (in \field{header}) specific fixed-length parameters.
 
 \field{flf_len} depends on the VIRTIO_CRYPTO_F_REVISION_1 feature bit (see below).
 
-\field{op_vlf} is the opcode (in \field{header}) specific variable-length paramenters.
+\field{op_vlf} is the opcode (in \field{header}) specific variable-length parameters.
 
 \field{vlf_len} is the size of the specific structure used.
 \begin{note}
@@ -509,7 +509,7 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Crypto Device / Devic
 \subparagraph{Session operation: HASH session}\label{sec:Device Types / Crypto Device / Device
 Operation / Control Virtqueue / Session operation / Session operation: HASH session}
 
-The fixed-length paramenters of HASH session requests is as follows:
+The fixed-length parameters of HASH session requests is as follows:
 
 \begin{lstlisting}
 struct virtio_crypto_hash_create_session_flf {
@@ -1386,7 +1386,7 @@ \subsubsection{Symmetric algorithms Operation}\label{sec:Device Types / Crypto D
 \end{itemize*}
 
 The length of \field{op_type_flf} is fixed to 40 bytes, the data of unused
-part (if has) will be ingored.
+part (if has) will be ignored.
 
 \field{op_type_vlf} is the \field{op_type} specific parameters, it MUST starts
 with or be one of the following structures:
@@ -1536,7 +1536,7 @@ \subsubsection{Symmetric algorithms Operation}\label{sec:Device Types / Crypto D
 \end{itemize*}
 
 The length of \field{op_type_flf} is fixed to 72 bytes, the data of unused
-part (if has) will be ingored.
+part (if has) will be ignored.
 
 \field{op_type_vlf} is the \field{op_type} specific parameters, it MUST starts
 with or be one of the following structures:
-- 
2.34.1

