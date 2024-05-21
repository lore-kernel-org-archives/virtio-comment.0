Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2070.outbound.protection.outlook.com [40.107.220.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE616CDAF
	for <virtio-comment@lists.linux.dev>; Tue, 21 May 2024 12:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716294634; cv=fail; b=TE2/T9rFNIN5PClzohwgt/+huiNiF5ANYA38T6jxifGPG8UcdD8yKssTco6YAiZtRWXi/tSL7sULiyDx+3vsT2ccyjK4pIsHXMtxMqxurLIavPoER5ZIa9ijNt0G5BiqUNdBnOZH7qvSEOMh4sw2Cw7ETU/x40a0u1T0daW8N9A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716294634; c=relaxed/simple;
	bh=iu9GzXqZebCX5VPaOD7sPtAv4NiElZFfmrIT3Jg6qM8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lqXBRokRua2jN/6aSPw0y6b39NMHqmia5RW4cqO4hn+FjRJYp6oYu/hW6YDDOdDGv6PUTv2Zb7TdAKtLlFRjUAw7FuOMoWKPayOAclYM07YojupCy97MRkHyY22pH7f9XSuPYmprLlt/DExH/GZehB+XuVUQIwbTSEz3LZFKuZk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=fbPxk8yJ; arc=fail smtp.client-ip=40.107.220.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="fbPxk8yJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fZaUjwAayykAzZf1Fwno0/H6ELYkJ8kM1wn/8LyikicpaRd0RmmRabKHS1W4dfVMmx4WsTv17IIJ/+VK17e506fRDjrNtQoH034Ef9tTTGwKcII7Dv89+9xVgB2l6GsiJWDCLg8bDdFV7rGxkH9nbfRRvKwet0fOEKjXFXy+7gRLh0nJPGPerDzsUnUaKBYm+mmvCqHfIcKElUvAYFxsrUHzDwjWhA78y4Cm6uoOreuSjFKTlbZ26Ah1ppxyNGjqbC3Qd9KNpdk1PRhXHU5ilWpUK1pH8VQD6AV1E/ovJfxDmZXcwn8lPGk+5VZAdxmk10ayE9t92jfHpPDC0Y7hmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+n6BoHhsB7MlTjAecX1t6YdZ8GV1LmD7LHgAnJk4TiA=;
 b=kYAuOrTvYwSvu5J5Np3gFgRpx3rc5EFwT5Pa96UiRz9/MOfsDuEkURyTTNUbp0jAtbCRwo823Q+RviuJzOuT3hYCxpK9n9S2/QzjY5k+mtsuKdlsSsOQ9ZB4sX4QbdnGRieL9DdCBC5jLRXHdyls7GpcvzmeLbRX+PtyNMYs5qrqz+ls5rXai1uv8T6KS2zd+B1NwSqHWuwWZh94PMG9UbVWdCqKLSXHeBYNfLMl5GFE5jkJeB/h92VvFFL36+EAL9KPkd6Qg5qYpVy20Hfxizu9oDNCBrXKEfnLCmnrGRYdI8IMmiA6VrR/eu2RTa6B1OpF/uEqNxEWggcRVgujDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+n6BoHhsB7MlTjAecX1t6YdZ8GV1LmD7LHgAnJk4TiA=;
 b=fbPxk8yJ17YLF5VFZQ8SNUAh4Ny5pL3vC/1ba6Pr0nKwnwOE2ugx6HOnKIIqQFs240y9lxmNCXBJ/JL1UVQqIRcZ4tgfZzj7U5Lmz47JGjDgCRxZCc52zbHp/Gu+WIIIIRzWaaxSF9Kbhod8L0raEon4gRurQOynhtTIcw+9Ti75OAFdV6aT96k8fCF6mKkJQUrlce3BZeseUtJ7Y55lZK+tdvC1E/WQ0Z1AyHfPFKT/oTYLV3PN+Ou+qT/ADR43WhltGX/8hGNVyT5r9ZzqNF78JeUh2/mv9Zj+txznTBc/09nAaW52TDBuwkvwPzD+RUqTxwglPUHvbMwUpU4SqQ==
Received: from BL0PR03CA0034.namprd03.prod.outlook.com (2603:10b6:208:2d::47)
 by DM4PR12MB5844.namprd12.prod.outlook.com (2603:10b6:8:67::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Tue, 21 May
 2024 12:30:28 +0000
Received: from BL6PEPF00022574.namprd02.prod.outlook.com
 (2603:10b6:208:2d:cafe::31) by BL0PR03CA0034.outlook.office365.com
 (2603:10b6:208:2d::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36 via Frontend
 Transport; Tue, 21 May 2024 12:30:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL6PEPF00022574.mail.protection.outlook.com (10.167.249.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7611.14 via Frontend Transport; Tue, 21 May 2024 12:30:27 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 21 May
 2024 05:30:12 -0700
Received: from vr-arch-host06.mtvr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 21 May 2024 05:30:08 -0700
From: Parav Pandit <parav@nvidia.com>
To: <virtio-comment@lists.linux.dev>, <mst@redhat.com>, <cohuck@redhat.com>
CC: <hengqi@linux.alibaba.com>, <sburla@marvell.com>, <shahafs@nvidia.com>,
	<si-wei.liu@oracle.com>, <peter.hilber@opensynergy.com>,
	<jasowang@redhat.com>, <xuanzhuo@linux.alibaba.com>, Parav Pandit
	<parav@nvidia.com>
Subject: [PATCH v10 05/13] admin: Add capability admin commands
Date: Tue, 21 May 2024 15:29:29 +0300
Message-ID: <20240521122937.2004180-6-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240521122937.2004180-1-parav@nvidia.com>
References: <20240521122937.2004180-1-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF00022574:EE_|DM4PR12MB5844:EE_
X-MS-Office365-Filtering-Correlation-Id: 4282b543-a167-4537-d3d8-08dc7991cc01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|82310400017|36860700004|376005|1800799015;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KgTQ28xAHhjINcoSEFyPTqPNxLsElCbFeVSA9H7T5r1zvQKUUoOa1TLH4OLL?=
 =?us-ascii?Q?dtYOyNkgTGAXboYZlnrND+pYIURWd/SSqDsLOEyMwkVeuYiXx2e1R5o3qW+f?=
 =?us-ascii?Q?9NdRxSd+1ifn95aS4rIA7rBTT7cThLitb9p204QLmHlYmqJlmm0IeJPcMka+?=
 =?us-ascii?Q?1+/zWdpGADj7m8EWiy8AAvWPpG27Ev9/LwSMU2t1xtZmS2BLPk+TfzOSk59R?=
 =?us-ascii?Q?eJBq7+nNp2S8/t8Wvil6lV4jU4iJaqKwhFMj4fGrSvE+ukN/mGnIsv35GdUN?=
 =?us-ascii?Q?xzIZRyaYvtDyjA2u+75RXJxWhC3rQfnKXRV95p/C0x+TP1ehjVX6OWzLK0zB?=
 =?us-ascii?Q?McfRRyVxNgSVJPkA49qsvZJl9Okov8azEA7/a9OKA4kioFHNSI8E3IHK/MWz?=
 =?us-ascii?Q?yc+yAbpUy27huPmAkQCfPe8BqskVt0dITjZc7Ak7aJcAkZ6GEfrOk8dpPOO/?=
 =?us-ascii?Q?XOkzr1Ep3xKGGc/W82u4ubTRioy2S2mHwLGYJ/mB5lcbSiFxe76fubFXcF7r?=
 =?us-ascii?Q?0CKeqIgmeJfwIsrz5+h2mywAq9K1nuZwr9DDL7ed7m+Hgcnm8FRslgLdqrpm?=
 =?us-ascii?Q?yFMLhUi1qDjJSwYBo+MKhfIDzsCaqhrmAj9xTjVL9Yy5mB4ZdCeFqk5Atj5I?=
 =?us-ascii?Q?6lOUso+bGNBfgAZKs5NJxBwEZnR3D/kV2Gd3qi5NJTusnzNdfBdqmCAwm7BX?=
 =?us-ascii?Q?zeTC74Vob0qfWkNRZ6PnLRrti+u7S+74ZebEdR8dEQEqA/mnAF04w4YxUhzf?=
 =?us-ascii?Q?a2/VF8jr3jMNwXXxdU2UgBPtI4KUyc85rgII+9fuVk8QyCGogN8nMHBEyLNR?=
 =?us-ascii?Q?2eWkYr11J3BKDNWW/JQIyt6LK5nWLokytanRHZWii4KZUhcciCXrHvCn9k3A?=
 =?us-ascii?Q?QaAlH/hjO9FHQhob0C7Ro2kwVnrDRDlYtNsnrK/ROUUc8BlxR8VC4BglBqIM?=
 =?us-ascii?Q?97ldXl8vP6HeUZTwJig3cqjdR+Wr3DB0tC4sj8vQbI1I8GcFlDroMrpY1+hr?=
 =?us-ascii?Q?1cHJ3urG+UV4ZlrgRY9wO9UFryujoiWfY0kpmhi5fWjjrUqSvbZoIyxqQoMz?=
 =?us-ascii?Q?6rU2GY0IiAI7QL2BO3eGKRqBf6V6IBSuU1TgGqHAnxopPlZVM7StF0fGTgf2?=
 =?us-ascii?Q?+GWrc5RXUBe8ElAWlDcTSgzMAm4qnrnxIF/C8ey888+G484JPVFaytaXOJtI?=
 =?us-ascii?Q?sEUSCsHBc1+V38jXowwpMjOiXw1KpDTj31eQTHhaudhuLDodWstu8BJmKEi0?=
 =?us-ascii?Q?TT9euPkHpOdFdTKjoZngZoY8yTdbjedoEdYKgFHqi8MPo6VJ1EfgqcZ69nm1?=
 =?us-ascii?Q?vyThqBRqNBBKFNDSOM7YfvdOwM6TvQQG1ZoCoo6M2iU2jvRGzbMCpnvgOpq6?=
 =?us-ascii?Q?n7ZhFzZe2Wlo5gooKeqcACc9c18L?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(82310400017)(36860700004)(376005)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2024 12:30:27.7628
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4282b543-a167-4537-d3d8-08dc7991cc01
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF00022574.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5844

Add three capabilities related administration commands.
First to get the device capability.
Second to set the driver capability.
Third for the driver to discover which capabilities can be accessed.

Even though the current series restricts device capability reading
to the self group type, same structure and command format etc will
be reusable in future to read the capability from the owner device
and also to set the device capability via owner device using
new DEV_CAP_SET command.

Resource objects are introduced in subsequent patch which utilizes
the capability, however some description around resource object
limit is covered in this patch to keep things simple.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/179
Signed-off-by: Parav Pandit <parav@nvidia.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
changelog:
v9->v10:
- removed white space at end of line
- squashed the dedicated patch of status code with the usage patch (this one)
- renamed read/write caps to device_get_cap/driver_set_cap
- restrict get and set command to only self group
- supported_caps renamed to cap_id query
- removed length from the get/set/query commands as it can be derived
- renamed cid to id as its part of the cap command structure
---
 admin-cmds-capabilities.tex | 196 ++++++++++++++++++++++++++++++++++++
 admin.tex                   |  12 ++-
 conformance.tex             |   2 +
 virtio.tex                  |   1 +
 4 files changed, 210 insertions(+), 1 deletion(-)

diff --git a/admin-cmds-capabilities.tex b/admin-cmds-capabilities.tex
index ef9481c..07b8ddb 100644
--- a/admin-cmds-capabilities.tex
+++ b/admin-cmds-capabilities.tex
@@ -32,3 +32,199 @@ \subsubsection{Device and driver capabilities}\label{sec:Basic Facilities of a V
 indefinite growth of a single capability, it is expected that new
 functionality will lead to the creation of new capability rather
 than expanding existing ones.
+
+Capabilities are categorized into two ranges by their IDs, as listed:
+
+\begin{table}[H]
+\caption{Capability ids}
+\label{table:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device and driver capabilities / capability ids}
+\begin{tabularx}{\textwidth}{ |l|X| }
+\hline
+Id & Description  \\
+\hline \hline
+0x0000-0x07ff & Generic capability for all device types \\
+\hline
+0x0800-0x0fff & Device type specific capability \\
+\hline
+0x1000 - 0xFFFF & Reserved for future \\
+\hline
+\end{tabularx}
+\end{table}
+
+Device type specific capabilities are described separately for each device
+type under \field{Device and driver capabilities}.
+
+The device and driver capabilities commands are currently defined for self group
+type.
+
+\begin{enumerate}
+\item VIRTIO_ADMIN_CMD_CAP_ID_LIST_QUERY
+\item VIRTIO_ADMIN_CMD_DEVICE_CAP_GET
+\item VIRTIO_ADMIN_CMD_DRIVER_CAP_SET
+\end{enumerate}
+
+\paragraph{VIRTIO_ADMIN_CMD_CAP_ID_LIST_QUERY}\label{par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device and driver capabilities / VIRTIO_ADMIN_CMD_CAP_ID_LIST_QUERY}
+
+This command queries the bitmap of capability ids
+listed in \ref{table:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device and driver capabilities / capability ids}.
+
+For the command VIRTIO_ADMIN_CMD_CAP_ID_LIST_QUERY, \field{opcode} is set to 0x7.
+\field{group_member_id} is set to zero.
+
+This command has no command specific data.
+
+\begin{lstlisting}
+struct virtio_admin_cmd_query_cap_id_result {
+        le64 supported_caps[];
+};
+\end{lstlisting}
+
+When the command completes successfully, \field{command_specific_result}
+is in the format \field{struct virtio_admin_cmd_query_cap_id_result}.
+
+\field{supported_caps} is an array of 64 bit values in little-endian byte
+order, in which a bit is set if the specific capability is supported.
+Thus, \field{supported_caps[0]} refers to the first 64-bit value in this
+array corresponding to capability ids 0 to
+63, \field{supported_caps[1]} is the second 64-bit value corresponding to
+capability ids 64 to 127, etc. For example, the array of size 2 including
+the values 0x3 in \field{supported_caps[0]} and 0x1 in
+\field{supported_caps[1]} indicates that only capability id 0, 1
+and 64 are supported.
+The length of the array depends on the supported capabilities - it is
+large enough to include bits set for all supported capability ids,
+that is the length can be calculated by starting with the largest
+supported capability id adding one, dividing by 64 and rounding up.
+In other words, for VIRTIO_ADMIN_CMD_CAP_ID_LIST_QUERY the length of
+\field{command_specific_result} will be
+$DIV_ROUND_UP(max_cap_id, 64) * 8$ where DIV_ROUND_UP is integer division
+with round up and \field{max_cap_id} is the largest available capability id.
+
+The array is also allowed to be larger and to additionally include an arbitrary
+number of all-zero entries.
+
+\paragraph{VIRTIO_ADMIN_CMD_DEVICE_CAP_GET}\label{par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device and driver capabilities / VIRTIO_ADMIN_CMD_DEVICE_CAP_GET}
+
+This command gets the device capability for the specified capability
+id \field{id}.
+
+For the command VIRTIO_ADMIN_CMD_DEVICE_CAP_GET, \field{opcode} is set to 0x8.
+\field{group_member_id} is set to zero.
+
+\field{command_specific_data} is in format
+\field{struct virtio_admin_cmd_cap_get_data}.
+
+\begin{lstlisting}
+struct virtio_admin_cmd_cap_get_data {
+        le16 id;
+        u8 reserved[6];
+};
+\end{lstlisting}
+
+\field{id} refers to the capability id listed in \ref{table:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device and driver capabilities / capability ids}.
+\field{reserved} is reserved for future use and set to zero.
+
+\begin{lstlisting}
+struct virtio_admin_cmd_cap_get_result {
+        u8 cap_specific_data[];
+};
+\end{lstlisting}
+
+When the command completes successfully, \field{command_specific_result}
+is in the format \field{struct virtio_admin_cmd_cap_get_result} responded
+by the device. Each capability uses different capability specific
+\field{cap_specific_data} and is described separately.
+
+\paragraph{VIRTIO_ADMIN_CMD_DRIVER_CAP_SET}\label{par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device and driver capabilities / VIRTIO_ADMIN_CMD_DRIVER_CAP_SET}
+
+This command sets the driver capability, indicating to the device which capability
+the driver uses. The driver can set a resource object limit capability that is smaller
+than or equal to the value published by the device capability.
+If the capability is a set of flags, the driver sets the flag bits that are set
+in the device capability; the driver does not set any flag bits that are not
+set by the device.
+
+For the command VIRTIO_ADMIN_CMD_DRIVER_CAP_SET, \field{opcode} is set to 0x9.
+\field{group_member_id} is set to zero.
+The \field{command_specific_data} is in the format
+\field{struct virtio_admin_cmd_cap_set_data}.
+
+\begin{lstlisting}
+struct virtio_admin_cmd_cap_set_data {
+        le16 id;
+        u8 reserved[6];
+        u8 cap_specific_data[];
+};
+\end{lstlisting}
+
+\field{id} refers to the capability id listed in \ref{table:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device and driver capabilities / capability ids}.
+\field{reserved} is reserved for future use and set to zero.
+
+There is no command specific result.
+When the command completes successfully, the driver capability is updated to
+the values supplied in \field{cap_specific_data}.
+
+\devicenormative{\paragraph}{Device and driver capabilities}{Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device and driver capabilities}
+
+If the device supports capabilities, it MUST support the commands
+VIRTIO_ADMIN_CMD_CAP_ID_LIST_QUERY,
+VIRTIO_ADMIN_CMD_DRIVER_CAP_SET, and
+VIRTIO_ADMIN_CMD_DEVICE_CAP_GET.
+
+For the VIRTIO_ADMIN_CMD_DRIVER_CAP_SET command,
+\begin{itemize}
+\item the device MUST support the setting of resource object limit driver capability to a
+value that is same as or smaller than the one reported in the device
+capability,
+\item the device MUST support the setting of capability flags bits to
+all or fewer bits than the one reported in the device capability;
+\end{itemize}
+this is applicable unless specific capability fields are explicitly
+stated as non-writable in the VIRTIO_ADMIN_CMD_DEVICE_CAP_GET command.
+
+The device MAY complete the command VIRTIO_ADMIN_CMD_DRIVER_CAP_SET with
+\field{status} set to VIRTIO_ADMIN_STATUS_EINVAL,
+if the capability resource object limit is larger than the value reported by the
+device's capability, or the capability flag bit is set, which is not set in
+the device's capability.
+
+The device MUST complete the commands VIRTIO_ADMIN_CMD_CAP_ID_LIST_QUERY,
+VIRTIO_ADMIN_CMD_DRIVER_CAP_GET, and VIRTIO_ADMIN_CMD_DRIVER_CAP_SET
+with \field{status} set to VIRTIO_ADMIN_STATUS_EINVAL if the commands are not
+for the self group type.
+
+The device SHOULD complete the commands VIRTIO_ADMIN_CMD_CAP_ID_LIST_QUERY,
+VIRTIO_ADMIN_CMD_DRIVER_CAP_GET, VIRTIO_ADMIN_CMD_DRIVER_CAP_SET with
+\field{status} set to VIRTIO_ADMIN_STATUS_EINVAL if the commands are not for the
+self group type.
+
+The device SHOULD complete the command VIRTIO_ADMIN_CMD_DRIVER_CAP_SET with
+\field{status} set to VIRTIO_ADMIN_STATUS_EBUSY if the command requests to disable
+a capability while the device still has valid resource objects related to the
+capability being disabled.
+
+The device SHOULD complete the comands VIRTIO_ADMIN_CMD_DEVICE_CAP_GET and
+VIRTIO_ADMIN_CMD_DRIVER_CAP_SET with \field{status} set to
+VIRTIO_ADMIN_STATUS_ENXIO if the capability id is not reported
+in command VIRTIO_ADMIN_CMD_CAP_ID_LIST_QUERY.
+
+Upon a device reset, the device MUST reset all driver capabilities.
+
+\drivernormative{\paragraph}{Device and driver capabilities}{Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device and driver capabilities}
+
+The driver MUST send the command VIRTIO_ADMIN_CMD_DRIVER_CAP_SET before
+using any resource objects that depend on such a capability.
+
+In VIRTIO_ADMIN_CMD_DRIVER_CAP_SET command, the driver MUST NOT set
+\begin{itemize}
+\item the resource object limit value larger than the value reported
+by the device in the command VIRTIO_ADMIN_CMD_DEVICE_CAP_GET,
+\item flags bits which was not reported by the device in the command
+VIRTIO_ADMIN_CMD_DEVICE_CAP_GET,
+\item array entries not reported by the device in the command
+VIRTIO_ADMIN_CMD_DEVICE_CAP_GET.
+\end{itemize}
+
+The driver MUST NOT disable any of the driver capability using the command
+VIRTIO_ADMIN_CMD_DRIVER_CAP_SET when related resource objects
+are created but not destroyed.
diff --git a/admin.tex b/admin.tex
index c93c74c..c8b3de4 100644
--- a/admin.tex
+++ b/admin.tex
@@ -136,7 +136,13 @@ \subsection{Group administration commands}\label{sec:Basic Facilities of a Virti
 \hline
 0x0006 & \hyperref[par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Legacy Interface / VIRTIO_ADMIN_CMD_LEGACY_NOTIFY_INFO]{VIRTIO_ADMIN_CMD_LEGACY_NOTIFY_INFO} & Query the notification region information \\
 \hline
-0x0007 - 0x7FFF & - & Commands using \field{struct virtio_admin_cmd}    \\
+0x0007 & \hyperref[par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device and driver capabilities / VIRTIO_ADMIN_CMD_CAP_ID_LIST_QUERY]{VIRTIO_ADMIN_CMD_CAP_ID_LIST_QUERY} & Query the supported device capabilities bitmap \\
+\hline
+0x0008 & \hyperref[par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device and driver capabilities / VIRTIO_ADMIN_CMD_DEVICE_CAP_GET]{VIRTIO_ADMIN_CMD_DEVICE_CAP_GET} & Get the device capabilities \\
+\hline
+0x0009 & \hyperref[par:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device and driver capabilities / VIRTIO_ADMIN_CMD_DRIVER_CAP_SET]{VIRTIO_ADMIN_CMD_DRIVER_CAP_SET} & Set the driver capabilities \\
+\hline
+0x000a - 0x7FFF & - & Commands using \field{struct virtio_admin_cmd}    \\
 \hline
 0x8000 - 0xFFFF & - & Reserved for future commands (possibly using a different structure)    \\
 \hline
@@ -162,10 +168,14 @@ \subsection{Group administration commands}\label{sec:Basic Facilities of a Virti
 \hline \hline
 00   & VIRTIO_ADMIN_STATUS_OK    & successful completion  \\
 \hline
+06   & VIRTIO_ADMIN_STATUS_ENXIO & no such capability \\
+\hline
 11   & VIRTIO_ADMIN_STATUS_EAGAIN    & try again \\
 \hline
 12   & VIRTIO_ADMIN_STATUS_ENOMEM    & insufficient resources \\
 \hline
+16   & VIRTIO_ADMIN_STATUS_EBUSY     & device busy \\
+\hline
 22   & VIRTIO_ADMIN_STATUS_EINVAL    & invalid command \\
 \hline
 other   & -    & group administration command error  \\
diff --git a/conformance.tex b/conformance.tex
index 183c059..8b77eba 100644
--- a/conformance.tex
+++ b/conformance.tex
@@ -99,6 +99,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
 \item \ref{drivernormative:General Initialization And Device Operation / Device Initialization}
 \item \ref{drivernormative:General Initialization And Device Operation / Device Cleanup}
 \item \ref{drivernormative:Reserved Feature Bits}
+\item \ref{drivernormative:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device and driver capabilities}
 \end{itemize}
 
 \conformance{\subsection}{PCI Driver Conformance}\label{sec:Conformance / Driver Conformance / PCI Driver Conformance}
@@ -181,6 +182,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
 \item \ref{devicenormative:Basic Facilities of a Virtio Device / Packed Virtqueues / Scatter-Gather Support}
 \item \ref{devicenormative:Basic Facilities of a Virtio Device / Shared Memory Regions}
 \item \ref{devicenormative:Reserved Feature Bits}
+\item \ref{devicenormative:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device and driver capabilities}
 \end{itemize}
 
 \conformance{\subsection}{PCI Device Conformance}\label{sec:Conformance / Device Conformance / PCI Device Conformance}
diff --git a/virtio.tex b/virtio.tex
index 7c52a40..3bb5c14 100644
--- a/virtio.tex
+++ b/virtio.tex
@@ -39,6 +39,7 @@
 \usepackage{underscore}
 \usepackage{xstring}
 \usepackage{enumitem}
+\usepackage{float}
 \IfFileExists{ellipsis.sty}{\usepackage{ellipsis}}{
 \message{!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!}
 \message{LaTeX Warning: Missing ellipsis.sty: dots (...) will look ugly}
-- 
2.34.1

