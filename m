Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2085.outbound.protection.outlook.com [40.107.94.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E9018BC20
	for <virtio-comment@lists.linux.dev>; Sun, 20 Oct 2024 11:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729424543; cv=fail; b=rZc8dLdPoAjlF8G26OtGn8cQLhuAmgPs3F+OUCZegKUJxF3sHfjBHFQFF9CwWEU/mOkMcnVBx9CrtEk/kS/liKulmAJ+7Frxu2aAtjNiYmlmxAD3FgzJY9mB5PKmDX7CPYkHDUmyFiuQefBq4SOZ4q+cQWmzAOT1MQGHmuVC3Zw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729424543; c=relaxed/simple;
	bh=KjOgIwde3WMa59J4sSIj99v8JgsYcEnnERlgPnShiKs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Fr0aTx9sIvUS5eYt1PMkFyH5VmOWU/8rTqoxA05uXIE1+Evi5CV8s4hHIYNADc7djkr1aasiEzKvGG6mdN+qOQCYfVCROD9CefMlpOaxVsN5GPcbycjMmljKyCf5tu1ge9eNrqTsNPwIDPUrtZERK4castyy6U0aoIRs2Z+LaDA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=lYKen9D8; arc=fail smtp.client-ip=40.107.94.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="lYKen9D8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IQ95fuYhjCWB/16p+xq0g2R7dYcSujo9fy/4S4DMMzR+Q0wNiFz3AzNx8UePvxygLKD06HfMWscYeydjs8x3c+xFiIJYH5cihb5OxG8l0G8nLjPxAPWtjDzASEoi8ET1h92VV9KB2FKDRTq4BeKvPYMaAiL8jh6/IPCXn7R8v8KiR+5Rj3daJpK2ubZkGuFRgNCCsKyuq+zgJyqckmUILZ/mrczlSLaYDHitFpX9FhHVIq2H+/gVAAbuQlFSOkvYnwjZs2kbMUdhdJfzdsWuAsaiJ+iuNTFt1yz9j04kDZS2p/NOMpyuIFrm2YGy71QgVWeFIe/L/6qoBZCHSdaxRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iOmYrokQL9j/O0mW4hRuhd9A+59V+jraqLdzRCyH8vg=;
 b=HNirVc09u+RellYft38515LXsTNLPUgvwTHfjkK3635ojtVubgsuodM6lT3Ms1mTyREzC8giBYcMorpLabC0UCNNOh5Wcmo8wzBCrho/wHYjxD+8PTw/qBXmV1DNTY8amcJJ/Qp9g3vvsUn9eUue2FmV0Yh/BBOtbsMyWMideWmkxN0sfqc14iq6KDv0yKrYQlWncV1XPFoFMQJObqFNvuH1nDLdgyAEic/FQgvQhx84Y6UHGCSNfF/CUJEqemezMiAM//c//6zJweFw2p9POIbNOiJ3UaCLomXsD+4HoXMNvCLJW9OUodLvG/+xRvD43GFD4hAuEwvVAKSjwIL2BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iOmYrokQL9j/O0mW4hRuhd9A+59V+jraqLdzRCyH8vg=;
 b=lYKen9D8ZXV+5IH5nIEN1OCMtGlLdzb0UrpEblNe28mGtvYdhxgYnIDHYHth52oPcwjQpBruwpaVARp5i6PEi0JqcFK2LrywtqixrAGU7fANNAPOM05odIcbsVKe9fbabXoi7kz7neJ7c2yBqSH1oHoAmtRaCTvD6iBa2WR2v5Wv/1X67EnEY2qzhaiYyW3KJaYWZAmuIfC0M6MYS5Qi/481AmwCajUSp5GXGZucRbxtN68/9BfPoYUtOFAeGNQ90AJV9nOi3AQlsmz+ETV0ErtNmkTh8pkelZ4YFZzBOEW+LP8VXYIyBrarYb7tAuJj/L7ywUrNWTIyGBCUgtJQtQ==
Received: from MN2PR16CA0062.namprd16.prod.outlook.com (2603:10b6:208:234::31)
 by IA1PR12MB8192.namprd12.prod.outlook.com (2603:10b6:208:3f9::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.26; Sun, 20 Oct
 2024 11:42:15 +0000
Received: from MN1PEPF0000ECD4.namprd02.prod.outlook.com
 (2603:10b6:208:234:cafe::12) by MN2PR16CA0062.outlook.office365.com
 (2603:10b6:208:234::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.23 via Frontend
 Transport; Sun, 20 Oct 2024 11:42:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 MN1PEPF0000ECD4.mail.protection.outlook.com (10.167.242.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8093.14 via Frontend Transport; Sun, 20 Oct 2024 11:42:14 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 20 Oct
 2024 04:42:04 -0700
Received: from vr-arch-host06.mtvr.labs.mlnx (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Sun, 20 Oct 2024 04:42:02 -0700
From: Parav Pandit <parav@nvidia.com>
To: <virtio-comment@lists.linux.dev>, <mst@redhat.com>, <cohuck@redhat.com>,
	<mvaralar@redhat.com>
CC: <shahafs@nvidia.com>, Parav Pandit <parav@nvidia.com>
Subject: [PATCH v1 3/3] virtio-net: Define cvq configuration related device parts
Date: Sun, 20 Oct 2024 14:41:41 +0300
Message-ID: <20241020114141.451478-4-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241020114141.451478-1-parav@nvidia.com>
References: <20241020114141.451478-1-parav@nvidia.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD4:EE_|IA1PR12MB8192:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c7a5d34-469d-4837-36a7-08dcf0fc3e75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cEFScVJWUHVCRXVWZnFmWnBacG1FUWJudHNKMENrN3ZGOXhDQW5zTGFVNFJ2?=
 =?utf-8?B?UXVHLzVMMWR6STVKeDFXU2NvdDA2NHNwVG1XWjU5b3RjVEgvcnM2ZDlLV3Vt?=
 =?utf-8?B?VHBXNGNWbVEwK1JqY3FORFFGZDdncG8wbm9xN01zWTZqUUhYU1ZWQm5sVnc2?=
 =?utf-8?B?VmNQL01oaytsR2xQamtDTnlKd1IwTnVHSFBMZnNmK0dRaGZFa0RadWkybVBI?=
 =?utf-8?B?VU9nZVVRL1VueVd3cXE4S0IxeExCQXdQbXZEY3lWYzAvWS9RZXk3OUlCa0ww?=
 =?utf-8?B?WG4rd0hMVFVoSW9nRDNHUTR5R2VvSHR5UDJIU1RSWlNVd1FyYTJKa1pnK2Mx?=
 =?utf-8?B?b1lXU0NUcjRwUGltWi9WSldpNHVPQXZ4Y0kxaVdQbVh6RU8rZmZlL0ppSzZq?=
 =?utf-8?B?QkgrOVBQQ1Z5SU9yWlBBd3p0RFhReGlldDJJYVQ2R0liZ3BtMWNWbWQzQlVp?=
 =?utf-8?B?Sms1czdPSU9kbkJyMjkzTkZ6NCtReUxNWXNqQWl2bDYza2tyU2hnQ0xjdnhw?=
 =?utf-8?B?ZU4vRzR2ZVRNdktHOXh0TjJhNXRmNVZ3ZXNnb3ZNNHg4VmFJa2swWDVwQWdU?=
 =?utf-8?B?NkxHdlRJeHRqeEZ3OGc1MTJOUWJvTG5yMnAwVEFGRkJYNkg4Ui9IbEl1eHVV?=
 =?utf-8?B?d01TMkRTQ1pxeU1ETlpycjhNMEh0NDVGMlRoOFhNWHhTSGlwNmxiSWhNd3F6?=
 =?utf-8?B?WHlzTXpiNDFabEtNTUZudkROTkZCRHlzbWc4SUJRbUJsaW5rZmQrQUFLaGNX?=
 =?utf-8?B?UG5kTUJMd0FncGVGeHh4K04rb0ZQN3pDcnVZdittbFMxUE51bmYwRG5scyt4?=
 =?utf-8?B?M3FCbHJlbTRnL2Z6NWJTb2RYWmRNaHp4MjJUcjA3SlpQMDZkVUZsY2h5Rlhp?=
 =?utf-8?B?R09FdVRHbGhqSzAyUnR0OU9FS3pIb21nRU5SUEFQclhVS0pFYUk2VkRpNUJx?=
 =?utf-8?B?TzVWb2ZaWG02WGhOMkhpb0ZRb1REQ2ZHSXlkTnVzZ3F5VE4yRWcxL05yTGlP?=
 =?utf-8?B?dng4aEhTQ2NhTnpMK1UyOCtqNUs2aERPaEpFTERpZ3dBKzFyNWhpRnFyRyt0?=
 =?utf-8?B?T1dralNzSHM0QXU1cDRWVHIzaWV6bFAxNTVXWlZlT0dJcVkvRlRXSE5jdjRp?=
 =?utf-8?B?MkxOb1ZzT1dVL3FqSmZPWVdVMk5RM3kxTEZERUxQVDhWZHBMODlNOUkrZEJv?=
 =?utf-8?B?WmtoM1RrUXhxV3c2dklUelFxTHIxV1I3ajhPcm5WQW9MeXdoRnlUMnVVc0sz?=
 =?utf-8?B?NmFWbDllVHJjSGp2clpqNnR0aGpFdjJGNTdsSDFSOGQ5Z1JyT0JOUTdlY1Nq?=
 =?utf-8?B?d2wzZzBTRG1HMDc4N1JCU05zWEtrQ0hBM0FhYldrMUVOWVRFMHZDc3N3SE92?=
 =?utf-8?B?bmNWWTE4dGhqcXVPUU00c2t6QlRMeVVwNnNEVXpHTmVQY3FvNXZ4cGRVSVNt?=
 =?utf-8?B?dkM2NXpzM3cyMFowUVc0VjVYQ2Z1UXJUOEtTTHFzRzVJRlRXUlFwcGwvemZ4?=
 =?utf-8?B?VnBLU2NVR1JaL2pPU01HTUNVRVBTbU9KNlVYbVdNNTB0ZDBkYjdDOFBuOXli?=
 =?utf-8?B?MUQwRkJFR1JUQ3dySkd2NXEzU1hwTjVLTy9VUE1vK1RNTnBqNXFHMzc4WElL?=
 =?utf-8?B?M1I4ckc0RU1vZnd2MXlMdzlacjdqVmNEQU5xU1JkaHZjRnZqcEZvU2ZDY3Y1?=
 =?utf-8?B?d29rUUhrZ0k1WUZnVldsQkR1ajlpenYzR253RjF2cEN2SlRlWUNuQ09CYUZh?=
 =?utf-8?B?MVFraEZHZjF3Q1VLWFpxN3ZoK2pqb3YzVTBGSklTTW5PcS9JR3NtbDJ3ODZQ?=
 =?utf-8?B?ZjVLbG9Ma2R2TlVFNjlhZUVFeHZNQWxMUjZwUm5JNTJOdkY4SGMveUhsMVp4?=
 =?utf-8?B?UjdBMC84N08xVytOUWZ3cWIzTjkvM2IwWGIvOFN4dkNOR1E9PQ==?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2024 11:42:14.8499
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c7a5d34-469d-4837-36a7-08dcf0fc3e75
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8192

virtio net driver sends the control virtqueue commands for
device configuration. Such driver configuration is currently
not captured in the device parts.

This series adds several of such device parts which represents
the network device specific configuration.

It is done by utilizing the existing device parts structure.
A new generic selector format is added to enable device type
specific device parts.

This series also reuses the existing control virtqueue command
structures, fields, and values to define the network device parts.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/209
Reviewed-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Signed-off-by: Parav Pandit <parav@nvidia.com>

---
changelog:
v0->v1:
- addressed comments from Matias
- fixed spelling of selectors
---
 device-types/net/description.tex | 90 ++++++++++++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index e45ecbd..9a87bfb 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -433,6 +433,96 @@ \subsection{Device resource objects}\label{sec:Device Types / Network Device / D
 \hline
 \end{tabularx}
 
+\subsection{Device parts}\label{sec:Device Types / Network Device / Device parts}
+
+Network device parts represent the configuration done by the driver using control
+virtqueue commands. Network device part is in the format of
+\field{struct virtio_dev_part}.
+
+\begin{tabularx}{\textwidth}{ |l||l|X| }
+\hline
+Type & Name & Description \\
+\hline \hline
+0x200 & VIRTIO_NET_DEV_PART_CVQ_CFG_PART & Represents device configuration done through a control virtqueue command, see \ref{sec:Device Types / Network Device / Device parts / VIRTIO-NET-DEV-PART-CVQ-CFG-PART} \\
+\hline
+0x201 - 0x5FF & - & reserved for future \\
+\hline
+\hline
+\end{tabularx}
+
+\subsubsection{VIRTIO_NET_DEV_PART_CVQ_CFG_PART}\label{sec:Device Types / Network Device / Device parts / VIRTIO-NET-DEV-PART-CVQ-CFG-PART}
+
+For VIRTIO_NET_DEV_PART_CVQ_CFG_PART, \field{part_type} is set to 0x200. The
+VIRTIO_NET_DEV_PART_CVQ_CFG_PART part indicates configuration performed by the
+driver using a control virtqueue command.
+
+\begin{lstlisting}
+struct virtio_net_dev_part_cvq_selector {
+        u8 class;
+        u8 command;
+        u8 reserved[6];
+};
+\end{lstlisting}
+
+There is one device part of type VIRTIO_NET_DEV_PART_CVQ_CFG_PART for each
+individual configuration. Each part is identified by a unique selector value.
+The selector, \field{device_type_raw}, is in the format
+\field{struct virtio_net_dev_part_cvq_selector}.
+
+The selector consists of two fields: \field{class} and \field{command}. These
+fields correspond to the \field{class} and \field{command} defined in
+\field{struct virtio_net_ctrl}, as described in the relevant sections of
+\ref{sec:Device Types / Network Device / Device Operation / Control Virtqueue}.
+
+The value corresponding to each part’s selector follows the same format as the
+respective \field{command-specific-data} described in the relevant sections of
+\ref{sec:Device Types / Network Device / Device Operation / Control Virtqueue}.
+
+For example, when the \field{class} is VIRTIO_NET_CTRL_MAC, the \field{command}
+can be either VIRTIO_NET_CTRL_MAC_TABLE_SET or VIRTIO_NET_CTRL_MAC_ADDR_SET;
+when \field{command} is set to VIRTIO_NET_CTRL_MAC_TABLE_SET, \field{value}
+is in the format of \field{struct virtio_net_ctrl_mac}.
+
+Supported selectors are listed in the table:
+
+\begin{tabularx}{\textwidth}{ |l|X| }
+\hline
+Class selector & Command selector \\
+\hline \hline
+VIRTIO_NET_CTRL_RX & VIRTIO_NET_CTRL_RX_PROMISC \\
+\hline
+VIRTIO_NET_CTRL_RX & VIRTIO_NET_CTRL_RX_ALLMULTI \\
+\hline
+VIRTIO_NET_CTRL_RX & VIRTIO_NET_CTRL_RX_ALLUNI \\
+\hline
+VIRTIO_NET_CTRL_RX & VIRTIO_NET_CTRL_RX_NOMULTI \\
+\hline
+VIRTIO_NET_CTRL_RX & VIRTIO_NET_CTRL_RX_NOUNI \\
+\hline
+VIRTIO_NET_CTRL_RX & VIRTIO_NET_CTRL_RX_NOBCAST \\
+\hline
+VIRTIO_NET_CTRL_MAC & VIRTIO_NET_CTRL_MAC_TABLE_SET \\
+\hline
+VIRTIO_NET_CTRL_MAC & VIRTIO_NET_CTRL_MAC_ADDR_SET \\
+\hline
+VIRTIO_NET_CTRL_VLAN & VIRTIO_NET_CTRL_VLAN_ADD \\
+\hline
+VIRTIO_NET_CTRL_ANNOUNCE & VIRTIO_NET_CTRL_ANNOUNCE_ACK \\
+\hline
+VIRTIO_NET_CTRL_MQ & VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET \\
+\hline
+VIRTIO_NET_CTRL_MQ & VIRTIO_NET_CTRL_MQ_RSS_CONFIG \\
+\hline
+VIRTIO_NET_CTRL_MQ & VIRTIO_NET_CTRL_MQ_HASH_CONFIG \\
+\hline
+\hline
+\end{tabularx}
+
+For command selector VIRTIO_NET_CTRL_VLAN_ADD, device part consists of a whole
+VLAN table.
+
+\field{reserved} is reserved and set to zero.
+
 \subsection{Device Operation}\label{sec:Device Types / Network Device / Device Operation}
 
 Packets are transmitted by placing them in the
-- 
2.34.1

