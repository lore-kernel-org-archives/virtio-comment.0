Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2042.outbound.protection.outlook.com [40.107.220.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7190A623
	for <virtio-comment@lists.linux.dev>; Sat, 15 Feb 2025 06:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739599952; cv=fail; b=ggN+6mX/wjTSbec8jEr3E4iT6ge5w8cgR1cyszyBLwheiTdfpatIN4dJhsa0kFqSIWjtzm+0v8Vjby8NkQSSWjEpPiMUBGm3vvN3RMFVknFar3ckNTiGh2lQZipgcjEbfle1yvbt90iUq6DdJoWyMNVtCBrSZ2M1IC65R3wb6z8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739599952; c=relaxed/simple;
	bh=lO3Sit5pb5UkGbmuEJNCEzxWJ74dH6U9PJKTgE/8KfQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ea6LABBBcOll4Bn/sB5f+GLuK7e7qwTRrtglGc7FI7oFDUNTYr9VcX/74l/jOlbVQ3GYvx5m0Ex6XC4rJ84pb5hKvy7djUctvMRO8ZHXBJRGAhM0PzVB+3ttdPIk7yYHkCVz+eHA+xT82ZsA5GGnjHZ47nNT4BIRaqtboUBlEjg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=O0fjFk8t; arc=fail smtp.client-ip=40.107.220.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="O0fjFk8t"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fWDruR38y2zxsZ59tr54yQYhTgq8YiPhgT9GbRQGc8hFDKgDZDB6yt/KHwYHvyu3IZPk097cUWYtdD/ZufqIG8//TActkPV+m30/ompz9ro1YFumkj4JNqJk9IBa1XT2VGGpceX0kLieCa+1mLEGfDEw5KHk2FK8KC/nCgM2kgzcwo+lEuodk1E7oA7FOFRETjYZDyRFxFzbffs/ULwt6FtX0N7QC6ZPhvHVl4DZOTc/Xhz0lMTlntjO7qPkbrd6eIn2Yf7AUpvB/WfICbvAFkr6IvXi6BMpV70o3VjoUFCxCMRPTh25tSX+Y9KXkTT1k63p4bHhOozGNuUigS2z4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wGrgzlmhQTjhmecb5AXLeVX/iq7NcNUGIj6J/wZv2ds=;
 b=cRg4vhaCJ+xH2zgC0SmKwQNOMJXDTntydTxQtzXADEh2b5Gj74kBQPvsZRmxzUswPqdDzUI+FV6gc9LWX7aFSjDvcDattFeTYLlBum2mYVkyXjm7bJyK1SW4PnvbGWEDvARWgiyeS4BoWIgmPQavj5U+vHYDULUEckBywekPxcDnACgbhqNn6lqBskbqrafjk7eCE0yi2h5eSsnds279+2H/rDb1NHDo6qbZBKTeoEDahbRa52dCWJDmWRUiB/nRiRCcZIjT1dvecUBffwyrQHFmVnd0YaR+OvC7IqXdIA+/RMl34k95ex0JLNO02QA48qxFPlLDwdTSXad+eTrrhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wGrgzlmhQTjhmecb5AXLeVX/iq7NcNUGIj6J/wZv2ds=;
 b=O0fjFk8tppzwQzx89yIqSHD9Yi1TmGh0c33YfIc5DIggSRKIjulT6n3xXDG6M6lq6L5AEJoI+cV/YJufESZYtFFPYSeJHn885yEOvtoX3M9wdC4L/+6rycHnsgwE3M3w/pqPMJXFh+sxPoLUAnrsamJptyC4tX1UKcxRYM1bS3pSM7ecflbfveVIYM373457yEm/6cg5cpZyxsxqTVSZHNgSm04ARQM8STqcpJnJkTEZ/JaJa23mp1rdnOLvVCKlJeAgbZp3XxPI7XrXHxim+VL12p1e98jSrdbU8rs+QA7BfgmmIRtV6stxd3GfEFysmTbUaLmpAj8Ljmzxc8izlQ==
Received: from BN8PR04CA0013.namprd04.prod.outlook.com (2603:10b6:408:70::26)
 by SN7PR12MB7298.namprd12.prod.outlook.com (2603:10b6:806:2ae::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Sat, 15 Feb
 2025 06:12:26 +0000
Received: from BN3PEPF0000B371.namprd21.prod.outlook.com
 (2603:10b6:408:70:cafe::d) by BN8PR04CA0013.outlook.office365.com
 (2603:10b6:408:70::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.16 via Frontend Transport; Sat,
 15 Feb 2025 06:12:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN3PEPF0000B371.mail.protection.outlook.com (10.167.243.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8466.0 via Frontend Transport; Sat, 15 Feb 2025 06:12:25 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 14 Feb
 2025 22:12:13 -0800
Received: from vr-arch-host06.mtvr.labs.mlnx (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 14 Feb 2025 22:12:11 -0800
From: Parav Pandit <parav@nvidia.com>
To: <virtio-comment@lists.linux.dev>, <mst@redhat.com>, <cohuck@redhat.com>,
	<mvaralar@redhat.com>
CC: <shahafs@nvidia.com>, Parav Pandit <parav@nvidia.com>
Subject: [PATCH v1] virtio-net: Rename selectors_limit to classifiers_limit
Date: Sat, 15 Feb 2025 08:11:58 +0200
Message-ID: <20250215061158.21053-1-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B371:EE_|SN7PR12MB7298:EE_
X-MS-Office365-Filtering-Correlation-Id: 9548b225-0263-47df-69ae-08dd4d87b81e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qaDJd3uF5bEqTsPmTCi95C6qUDshnodsACJij0UKcjqZnXTDj2GueZ+79oV/?=
 =?us-ascii?Q?sq0BDIwmPAoNzjqdLC1p8m/V/nAUk4LoFbuLgjFiQMLZEltIWXsZxnKxdYVS?=
 =?us-ascii?Q?9/Su2sO5wdz6KEDJjMnLN6OiTMb1HDx9xWSs+Y0SW7t0OJRGFRGQfexvqsQk?=
 =?us-ascii?Q?m96RLuVNxB7Q1bKTpolkNViqEESmwDQ2hgI6cWnh2pLf5R4uQF8lKQLZEuQL?=
 =?us-ascii?Q?DfI5cLugPPvsz5QW1Fijj2gDzW/a6iHsdVzgBNmtAM/HgVRW+AtnOhFMcj0S?=
 =?us-ascii?Q?xFVY301xhcZo4LPnHWaEGjctIVAdIBIAarWGW53s0WmCE+GDD61k5ZlPKXVC?=
 =?us-ascii?Q?tQt+oIcOZyZH53Q3VzoiCAUxC61mTOCXl+JtrStn663FtU/vMRCy5umt1dFK?=
 =?us-ascii?Q?SY9r7GN8nA2Rr1ieFjdo24VKxbuIJiulYXoRvTtFxDRRSR4oRlrem6MJ/YK+?=
 =?us-ascii?Q?i+dH3jGUSZ4fVNvxcUPzJXhQZqeT+PeesKdsrO35nBrwyYKm+o1HM5yfXKGM?=
 =?us-ascii?Q?mgV+C3lhol4gNsfeamJftXQrriNRrjEl+7Gm+aVSNYPMEehcCnNAnZjb15xd?=
 =?us-ascii?Q?fl3ldmU3wHL7h3MZEL0VKraZ78ygSFGExAA0weGEnt0QlPfxU46S7qkr12fG?=
 =?us-ascii?Q?O+pd5qwFgFkSbzWc9P1sXQbPAMssj1YbBLdRGwluCg10qeJp38DWlSaaoqNC?=
 =?us-ascii?Q?/7vE7k8ZB35Qq52FuJDuILzI5MTNC+uGCm6F+GT8tIl+PWFxGOGRaxcmjx4z?=
 =?us-ascii?Q?Fp0FsTQmjiRCEaxoEGnPgFJhVzAo/WNI3TrUyl2jl21nGFVojrRmEFm3IuKE?=
 =?us-ascii?Q?zIfkEslIsMSHgEnlZXU1Aem85IjRtXBOu5Peg8uIR015TaB2U1fN89oXjyzJ?=
 =?us-ascii?Q?P5k8wdfO1o6P7LUrP84vE1R0PYqKaH5Bhz4jLJaUjQrbV3VG4xg1t1QZVRSY?=
 =?us-ascii?Q?ccR0vIruzlwHTw8MYBSo8ZYsXnmy6puILHSaNt9vSjTtztmHNS2/EosdWhBH?=
 =?us-ascii?Q?Ck7ZitR2jxxxdFNabQU4Zgq7Fjcg1wlBhYgGVRV81UniVBeQkN5wpIV+bo28?=
 =?us-ascii?Q?LOx0RVQJf0HDKV2Hn1g+RTac/wfMEYm3TiM/amrIoBufAeJ5C70xd4BL/vjm?=
 =?us-ascii?Q?TozpFlYyR58LnJ5SWgz4hUCAGQXpSDeLq/Os32W+uF+7RKnhfEZ2bTuCoGuq?=
 =?us-ascii?Q?0B2CRn/ry+G9ciAauo9TpJyYxAvuLHkPpRpOirc9ylcJ+ZSdB/vaqcj+JnVY?=
 =?us-ascii?Q?hfBvzuze3EgoYGt7vkqXx8MrHgRXM6HD6/Helq+JlaY9TMCS2lYSm0Hq//sg?=
 =?us-ascii?Q?ny4zMnKPSkKrbMPaOvSeqKlPqbV27oPK+6f1LbjHufmkko3KLjmx2S1rXp3Q?=
 =?us-ascii?Q?2tZjxXbX8weLjSORQ5d/s2VrrzxzmvyKSlx9cprMknuCZjdXYgKxmP2caIZn?=
 =?us-ascii?Q?FV6B7WIXh4VUOpnyC2xYdQSVAhIYudOhQ+iy6Ml9fQJlXL/vvWV/voqBvOo9?=
 =?us-ascii?Q?E6BWkAOseE+fBAs=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2025 06:12:25.9371
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9548b225-0263-47df-69ae-08dd4d87b81e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B371.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7298

A classifier object consists of one or more selectors. The number of
selectors per classifier object is already annotated in the field
selectors_per_classifier_limit.

The field selectors_limit is intended to reflect the limit of
classifier objects. Hence, rename it to classifiers_limit.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/215
Fixes: 3b7b7371dbed ("virtio-net: Add flow filter device and driver requirements")
Fixes: 899bb0ca24d8 ("virtio-net: Add flow filter capability")
Signed-off-by: Parav Pandit <parav@nvidia.com>
---
changelog:
v0->v1:
- fixed to replace description of selectors to classifiers
---
 device-types/net/description.tex | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index b546cd7..21bb548 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -2957,7 +2957,7 @@ \subsubsection{Flow filter}\label{sec:Device Types / Network Device / Device Ope
 \begin{lstlisting}
 struct virtio_net_ff_cap_data {
         le32 groups_limit;
-        le32 selectors_limit;
+        le32 classifiers_limit;
         le32 rules_limit;
         le32 rules_per_group_limit;
         u8 last_rule_priority;
@@ -2965,8 +2965,8 @@ \subsubsection{Flow filter}\label{sec:Device Types / Network Device / Device Ope
 };
 \end{lstlisting}
 
-\field{groups_limit}, and \field{selectors_limit} represent the maximum
-number of flow filter groups and selectors, respectively, that the driver can create.
+\field{groups_limit}, and \field{classifiers_limit} represent the maximum
+number of flow filter groups and classifiers, respectively, that the driver can create.
  \field{rules_limit} is the maximum number of
 flow fiilter rules that the driver can create across all the groups.
 \field{rules_per_group_limit} is the maximum number of flow filter rules that the driver
@@ -3310,7 +3310,7 @@ \subsubsection{Flow filter}\label{sec:Device Types / Network Device / Device Ope
 command VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE when the resource \field{type} is
 VIRTIO_NET_RESOURCE_OBJ_FF_CLASSIFIER, if the number of flow filter selector
 objects in the device exceeds the configured driver capability
-\field{selectors_limit}.
+\field{classifiers_limit}.
 
 The device SHOULD set \field{status} to VIRTIO_ADMIN_STATUS_EBUSY for the
 command VIRTIO_ADMIN_CMD_RESOURCE_OBJ_DESTROY for a flow filter group when
-- 
2.34.1

