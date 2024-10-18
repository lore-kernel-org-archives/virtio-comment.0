Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2048.outbound.protection.outlook.com [40.107.96.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21D540862
	for <virtio-comment@lists.linux.dev>; Fri, 18 Oct 2024 13:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729257501; cv=fail; b=EP5D4Q9XT0A4CrzOrbiS433ujhlkzqg2C0VjBXenChiS6LT8NnC6tj5ix3oCOLrwcjidTbaVMpuDFhma1Tj/oo2MiJPAtN5rfXnzlp0Vkhyo8/7VexLnKLO9NGtWLvyoCPzKBQsm8nztsWWTcSrbEX90O8WPc8VNS38jI2eO40k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729257501; c=relaxed/simple;
	bh=V9B9ogJWzFntX8ViunER+WWtkGfm3XuwP6lG7sU++dQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GYPsVAqRTCLU8B7pSLvAbWwy63WbjH6yHvRJ/9GxfNJC8b9/HSc5RBn2t3suJgQsmuGS1c0cDeIfVa9FfkCWZO++FhbDXQjT48CPFDnnQB0E9LlFN417vLP3NKL+sJ6CBYxvbDhadF/mi/gxyIetD/Z5O4ghTdrbAC4/iJFZDfo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=cM8LBgLh; arc=fail smtp.client-ip=40.107.96.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="cM8LBgLh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CbFQK040jqw02JJ7aD5RTe5MbMqcxCPqgrUCuR9xX01pjItyHZF6y3+u4+qIAb0Wnb0MUkPSQAM59VftDbL5OOGIc3RF+QNSL2OTbW0BGYUYk3geCNSQoHUbUO3wtjhV48su/Vy5nxfcj3xGsBhruqy3nXUCfA9GiGc+9x/sNCIyPnP3lG0/9rUg+a73nWNwLD9Xy94IfQqqvkgKC7nRcgq2bLKwx8mpCIEFwoHmI333TENmmO4gITzN/gz9wMbkYcJE/AIs05cgysJlAZ7YqJ2CTMVegmxUnCWkoM+pM+AYWshIkossFYPVKAokqOCi106yhtVitVU+z/aJPqkBXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G5xKCs7HifJpkvl4UfHQyX/P0egp6Xd7acaeHrbrse4=;
 b=S+Hd9KrSfrTNdtLhTdRe1e/Nd6VHLZ5rN4C8uLsPcGBih7CQ66cIHiuXFkIQPzYqBUifweNXVo6k6G4Slw/ZeXHpFNsZC9P1oJzEq49j9MNrVTeNlbmiG8awC9njWXr8WId9JCAyWaz0iXIM9I/fJ1udvGcUHeZ3tWTpeJnfBMFxq/I9nIQuiw86nAHUbjPOEUDPZ5iNOiaLl/+TAknZ0PPpbbSMQtIHM9kbgEHi6McZLPC7emQ3Iqy+pes/uDHfml8i2tv1vGzYbqb2FkPGm/H02jmTSz5Q5trmBHxEZdcxYgwkgmIO1Ipdbdb1hVGLiA6nygxHmTNKN9p9Wicdsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G5xKCs7HifJpkvl4UfHQyX/P0egp6Xd7acaeHrbrse4=;
 b=cM8LBgLheLRTymC0gu/ugyjqkoNZbXmLzlOD/FvmI8ULK8qx0f1AndJBhsc90ZjmxxbObag+C8V9fD4/2b0+NhIJMfpRw/ColVl4oy5XFdonYv1mw/c9WUzDxe0GiWobO0szfVJpCpKUyciJiNQcO+OWh4TyktFYvxaNDxy/P27+kqA0uLFVtuvKa1z0nPpBhJ5gadxizz5MIlyGeEn480B2xmCsDypW1nZkDhLVcfVMz0r/BnZGX2dK+zHO1AzCrkZNecCIMGmMoMaetN1UkNFVdPZS1TWUZO+COu7w/t4H4855rFDoSqrK7mPkTyITjjaAiCjnrSO47mNMlYUItw==
Received: from BN1PR12CA0007.namprd12.prod.outlook.com (2603:10b6:408:e1::12)
 by SA0PR12MB4432.namprd12.prod.outlook.com (2603:10b6:806:98::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.23; Fri, 18 Oct
 2024 13:18:13 +0000
Received: from BL6PEPF00020E64.namprd04.prod.outlook.com
 (2603:10b6:408:e1:cafe::e1) by BN1PR12CA0007.outlook.office365.com
 (2603:10b6:408:e1::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.21 via Frontend
 Transport; Fri, 18 Oct 2024 13:18:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL6PEPF00020E64.mail.protection.outlook.com (10.167.249.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8069.17 via Frontend Transport; Fri, 18 Oct 2024 13:18:13 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 18 Oct
 2024 06:18:03 -0700
Received: from vr-arch-host06.mtvr.labs.mlnx (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Fri, 18 Oct 2024 06:18:01 -0700
From: Parav Pandit <parav@nvidia.com>
To: <virtio-comment@lists.linux.dev>, <mst@redhat.com>, <cohuck@redhat.com>,
	<mvaralar@redhat.com>
CC: <shahafs@nvidia.com>, Parav Pandit <parav@nvidia.com>
Subject: [PATCH 3/3] virtio-net: Define cvq configuration related device parts
Date: Fri, 18 Oct 2024 16:17:41 +0300
Message-ID: <20241018131741.443635-4-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241018131741.443635-1-parav@nvidia.com>
References: <20241018131741.443635-1-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E64:EE_|SA0PR12MB4432:EE_
X-MS-Office365-Filtering-Correlation-Id: c22bbc88-fd91-4f53-f67c-08dcef7751d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L3dLSmRIa1hEbzlUZ05GNnR6Q3lOaXlhYjg2MkJXem8vQ01nb1F6dWVxcHZT?=
 =?utf-8?B?cjRlb3BqM0FKUkowRms5b0EwK1B1WGZlNXZUM1NwRGpaQS9odldtZmY5bk4y?=
 =?utf-8?B?d2hpd0xDTC93dDA5RTFWWDdMaGsrbG8zdnJFY2Y5ajczcGtFazJUaTJ5K0cz?=
 =?utf-8?B?Wkd4MlJuLyt3WTEzQTR3TDJVSklCS2ZoeTZlRUtlaWdoaUpqQy9FNk1UdWsv?=
 =?utf-8?B?TStsMnFUSFBxV1JSZFZLZWQ5aWMzK2dOdHBOU1V2VUI0cTlVL1h6cTVNS3U5?=
 =?utf-8?B?R2N2d3c5SVF6ZHVwSHJmcVpvS3M2Wm5JOUhNMzcwSytNUlNhNWxKdzhXYnJB?=
 =?utf-8?B?UG5hK0tOMEhGbmhFZ24xa20yckk2aUJlcVJKT2dkdkhuVk4zaFFsc002VmQ5?=
 =?utf-8?B?TW42blFDakNOREFIRW0yQTdDbWgvRERYTnl0eWhlS1o1WCtGQTJ2Smd4d1dn?=
 =?utf-8?B?UHlzUnRMSFJzZGdqcmUzTXpBUUMxTFdXQzB6Rms1RVp5dHU2bDlTOWdoYTQy?=
 =?utf-8?B?SGMwUWg5b0FZRlBCellKdUJCYXQzZzdUNEgyTndyWGVNYU5WaHZVMThtTFcy?=
 =?utf-8?B?aGhLa2xsTTlON0c4Q0MwRDhKT2t4cloyYUVPOURyQVl1OElHSENZaHhobmc3?=
 =?utf-8?B?aVpzTGNZNkdxdkEzb0RaTXNuSC9seGVyaGVITWhJQlIrVTJXNGJENkM2c1JO?=
 =?utf-8?B?NmVjMnlxZGZGMzZKbkh3anF4RkVTd3o1dThvSFpVRWg2dWl3dmRxVUM0K1lU?=
 =?utf-8?B?eHFhRUlLbWIybVdaTXlMeFAwRko1NHFWZjJQMUtzRHNSWm5HTnBaSzRNa3Fv?=
 =?utf-8?B?d2YxSnRBUlpLeEtYQlVVYWhza1pKdFU1SXBXek55ckovdjBUVUlSanFlbXlM?=
 =?utf-8?B?QU9Pbi9yVy9yMTVBbmJGWEZKN3RBdnRnbDhyMWc2b29KcGxXbmVqRXEwdmF6?=
 =?utf-8?B?dGtPazZTaVdLUEV3MnFBLzJ0MlFOWDc0Qk53NmNVb3ZyeEJTMWdXLy9GMmRT?=
 =?utf-8?B?T3kwSkRsZFVWdUQvbWVqc1pkV1l5bnozUTQvVHlwekR5Qi93bWJ5M1cvdFN2?=
 =?utf-8?B?clU4b0RpdlJPdE0rV1RWV3J6TU9BM1V2RDRzMnJWaHdIcVIvam1xN3dwUStI?=
 =?utf-8?B?RmVzNEJlY1dIV0k4cDcxZXNaNDlmblBGK1g2cHUwZE1RWEVkR3RSQmUyNmNC?=
 =?utf-8?B?ViswOFBmS0xyMUNTenROYUlVN3QzRjhoYnJUejFyVHVvRTVBU1UrUTVwV3JT?=
 =?utf-8?B?TVkwNjRHcEQrQmtQQ3FWT2dGUmtvbk9nWHFTdWtpWDY5cmlrTkFOMzNyWExs?=
 =?utf-8?B?em1FamF5U2pGUGFpNkROU25uLzY2MjdEcU4wZnNBeDlGQlBJUVlqMDF0S0hC?=
 =?utf-8?B?SUwzY3hUU3hhejlGZkRoNUhpeDNvd0JZRzkxVXRSVEM4Y0o1Wk9jNTBqQVor?=
 =?utf-8?B?ZndEazFqb1pnN0tFZldBYWdIYms0cVdMeTkwZkVuLzU2ZVlzMGhHTmVlVit2?=
 =?utf-8?B?SG9ITnVzQUsxYWc4c1ZhQ3BSb3lpZ3NXN3AwWlhRUGtvTTFyUWp6Q1ZMRVBP?=
 =?utf-8?B?cGxGcXE2MnRxYXlqMVRRNGVOcVM3QURQMUtrckFDQWxDNENMdklnaGdyVzU5?=
 =?utf-8?B?OExxWTBwLzFHNU1sWjhQcHhNdzZQZUx4c3orQS9iMFI5OUs3blkvb0FhVTdU?=
 =?utf-8?B?SG9tejdJNCtJZ1k1NDFEQWpleEpGYlJpd3l2Rktja1hMOTJTTDBaVFhBT1Vs?=
 =?utf-8?B?ZFlEQ1JkeGZiZ2k3amZpT1FlTmtjaWNIL3lVWVY3SW1OTlRjK0hMVFd3VGRW?=
 =?utf-8?B?TWc1TElOZkRPbUhZVjJKbitGYW8ySExmVkFDQktoZFM3RHJnZzRrb1pER21z?=
 =?utf-8?B?Q253My9VczBmaEJkNVlNTnFVMWVDSENmNUdFUEhZdmdBMXc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2024 13:18:13.1056
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c22bbc88-fd91-4f53-f67c-08dcef7751d8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E64.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4432

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
Signed-off-by: Parav Pandit <parav@nvidia.com>
---
 device-types/net/description.tex | 90 ++++++++++++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index e45ecbd..a5c6975 100644
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
+Supported selctors are listed in the table:
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

