Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2051.outbound.protection.outlook.com [40.107.243.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E6DB4C62B
	for <virtio-comment@lists.linux.dev>; Tue, 21 May 2024 12:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716294664; cv=fail; b=QpbpXCRKRA+4xdPU2Q0JUsUbjpAnp+8JxcI8EFrP1p+xwbTdZjd2bPSdtAanfhyd9lFL0ikZDPsZa0fX80sEtGfHwTMaN5TxrcyOsdr3z1W40Qwfe2CSSRCtg8lvCh+lKt3HolriNm3AZB7jzOgkKu/6BCRz2cmf7c509dbAqVw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716294664; c=relaxed/simple;
	bh=RwZe+etIX5uBIlt4by2f66MZLv1rtynYZ9MC4TW22NY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b5NkN/6Vat32KBJ56aaUuifOeCYN+gdA8IqwEQwpZeOxk+GkTMbcZa5MwGqyUwrMdiJBb+eD/F8kudYjz596Rz79nok/TzIzAGgL1Fl3xPA52IEUXR4dCo4qxjseSfkE7JD1x5s0GDpjvzx0iSqxX2iMQt6CBlluRWj3h82welA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=oTMANWJ0; arc=fail smtp.client-ip=40.107.243.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="oTMANWJ0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kwX8Kh7p5F3rKkq2fp3fmRFjQbkUz7p1mpP33ys6RqmaOjdgsB8m8DmXvdylTC98BKKxnd1J+a5WR34ojfmDlBrTS1lc7PjJJHTbzzwOfT7nxcJs8hsRBcMlZNs6xWcfoBK8wO/RjaxcU5dwmlqWM/2KVugmHA8jxWdjtmsKpu+5iMTaL/W5h3daOGtXggJwto8xXi4zD/8LrJML1Bn87zD6U8v57JocQf+2fObsnSkB2eAWzfUN4UhMNsukPzDzhfwFBs3a/Hdn1xwQDeu43Vn42FR+7jeBl+pjk/Biez0IYHAX1Tab2elnCnu0ds6biVyNHXepeA6t9z1sS6YLaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ikok1UtQSAZcjlDfV8v1MkSG+8hYd2zt76JkVWHxU0I=;
 b=Ttk4gjwlcHascB3rEkOMPPcri7jtspATyvw1Ll12f998M7q7iN1l2nwjSyLquy1uNLAreoA57Dd7zpmGkzhsXha4zig6AxB8ruHowvlOHdUbccnlxe5wNXKabBWwdeWqo3uhyb9zjrXdgj59bkP+skS3n037vM91STaiPkSTwz4McPRAUfaEDcdHh9ado15NhJxvQ404TiROsniq1zEXGEcZDSNDczJVc9hLAGtMrvETdGE6+5e/NC5MX+kHtC3UIIBgmbNOgPj7AJt62pRpOqWaWU2A0ep0n1mEii8OcM30O/e+91LLlONnq6T1LClSLfysEtC1sdp6Sa9YB783Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ikok1UtQSAZcjlDfV8v1MkSG+8hYd2zt76JkVWHxU0I=;
 b=oTMANWJ0AwT0sc4gSrFN525KWsdPUptQzImA+Vo1uErobf18f3UWLnPZItv/8/kCmqMj7Dmn1rTmvhTBic6KIm3vQxOsaLi117L6tt7ouCZbNtyDPJ/CJmqLj49ncZlfhKdODpIIuPfHN7fPaBd1hA5pXAOS7m66buRmjJJCp1/oX44cjsOeNd/1Lwp70yYhLkvmpgC5YmPl7w3phttEp8u7QHf5j2X3fk+tOJYDObWC47yqOCOGgkOzAp/ud3/ELDpj9K0YSFqujl6i+vHtQO0x36PRoQoiELkCq6AhkyQ68IAGl2wPNgYDitGLiuGW/JC32TqHNJcT0WIjs0sh8g==
Received: from PH8PR02CA0011.namprd02.prod.outlook.com (2603:10b6:510:2d0::10)
 by CY8PR12MB7562.namprd12.prod.outlook.com (2603:10b6:930:95::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Tue, 21 May
 2024 12:30:58 +0000
Received: from SN1PEPF0002529F.namprd05.prod.outlook.com
 (2603:10b6:510:2d0:cafe::e9) by PH8PR02CA0011.outlook.office365.com
 (2603:10b6:510:2d0::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36 via Frontend
 Transport; Tue, 21 May 2024 12:30:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SN1PEPF0002529F.mail.protection.outlook.com (10.167.242.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7611.14 via Frontend Transport; Tue, 21 May 2024 12:30:57 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 21 May
 2024 05:30:33 -0700
Received: from vr-arch-host06.mtvr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 21 May 2024 05:30:30 -0700
From: Parav Pandit <parav@nvidia.com>
To: <virtio-comment@lists.linux.dev>, <mst@redhat.com>, <cohuck@redhat.com>
CC: <hengqi@linux.alibaba.com>, <sburla@marvell.com>, <shahafs@nvidia.com>,
	<si-wei.liu@oracle.com>, <peter.hilber@opensynergy.com>,
	<jasowang@redhat.com>, <xuanzhuo@linux.alibaba.com>, Parav Pandit
	<parav@nvidia.com>
Subject: [PATCH v10 11/13] virtio-net: Add flow filter device and driver requirements
Date: Tue, 21 May 2024 15:29:35 +0300
Message-ID: <20240521122937.2004180-12-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529F:EE_|CY8PR12MB7562:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b527b3f-fcb6-484c-a63b-08dc7991ddb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|82310400017|376005|36860700004|1800799015;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iglSCPYK37kLxTgpRg7JCwopLG8U6c1HC8JxmGOXM+dvmqiqbjTCK8ID53hG?=
 =?us-ascii?Q?D9RbK6FKeRFL/ZBMyAUfe/URiFIdOfeVLT+APvAG1k1Q1jR+LiabdEiHVY6P?=
 =?us-ascii?Q?DiF9zzGqTMYXw+KtfnvQae4CoxNMIQYfC3mhDkF5rUKEia4TnJePOCuhJX6d?=
 =?us-ascii?Q?LYWkhPWGGpvhxagHu0EahUomPrQci/ipz7artZf3gwFJSY+/AhmM9AcumQvV?=
 =?us-ascii?Q?pkqxXHQmanhC+oG/aA+yBkS0zNvoK3OuC1DqhtS+bIsvGQknKi6XDNV81ElU?=
 =?us-ascii?Q?qGMuZLR3FRYNsQPSx/uoSh5A5qb9Vul78/fi31fy8snV5bVzuJUahOUHYZt+?=
 =?us-ascii?Q?+cWe03dOUWL5XdKRJjjqn+SRpHnWcR2eY+pr8LfYU0+m/2ze5ngC69UY8QjR?=
 =?us-ascii?Q?MPLguVluyl3mr6gvThL+1QM0/EtSkiE1ONYAUsWkC4Gxn2N0BFcM+cBhhbfm?=
 =?us-ascii?Q?VZmbe+FBWxggGV1Wsg8P8QR91Nuea61P1BbLErD0+YcC/NhsU+EjUEVfORLs?=
 =?us-ascii?Q?e2ZKqUiiBG6a1HlrtLnQnFmkNCbSt3HQKTB4ublPZGaayDrCWpzenf2MsO2Z?=
 =?us-ascii?Q?FS87/W1Crz1Fyp7XuYhcsBXRVWh+BXNjNuN4X5TkKBPDhRUn7hWurDyR/hXQ?=
 =?us-ascii?Q?uQoA86wwcHjRKuX9gZlpBkR439yFKCZdMKn7Lqj9X5vfg5ge34xUladUTyz1?=
 =?us-ascii?Q?n/7VwVdf5nkitd268iY98lpHaQURt7VbN0jEpQLpsVLk81eiOj84Vd5YF8pG?=
 =?us-ascii?Q?ObfHKY/nPBsyDT+G2iq2pQBPlJ2y6Jf8rFmCPdKcYr4qVvWR8cdHH3xRxzcW?=
 =?us-ascii?Q?UqqF7JYfS4AQltfCUNE6SLtTIITCnZSlEaoEku1b1F3DqdnLpINOiZEnUFpe?=
 =?us-ascii?Q?yjxNyukcLlQbDRMz2HsMDESNqQpJ39EeGmH1lERld4gTbFYEKDy+v+ijjPv5?=
 =?us-ascii?Q?/rXLPxnyvqTXkgtcVtnINQBqxvDgCyIZrbfKelg7S2+2LlzfGZ0ncTqEzZnD?=
 =?us-ascii?Q?75C0oxMj6EMaqxvPXMZSzUIsIIkIOWWKdHoZJFsiBtMKE08t9PdPEXYyWhJ9?=
 =?us-ascii?Q?bhKe+EiEbZd2Y/IxKwv/FJGrv4HV1VpCI+IfaCSXve0XVBCSpIpZf6RP4En3?=
 =?us-ascii?Q?R+qScY1c3DSYhLJINPQdj0FgMQkktOMr/Orw7cUT88g/xf5z26JHGZ96OVf8?=
 =?us-ascii?Q?bhKBV79Qjep8nCB8RQ4YZnqHpoINX+0J5J+NzBDvmg1HtYt3tWvbxNxMW621?=
 =?us-ascii?Q?ySzT8KQT4sXYH1IYd0ibdEvSvmS/xcCfcGEajPLft8mhMotkcQL7jGUf5/Y2?=
 =?us-ascii?Q?kP3DoVC5nekgSsJeWbQ7eVt6OzudttBeb2OkQoCPoh1pZikhKcysQ3gzMNp7?=
 =?us-ascii?Q?JeIsdzvD8i3qAH4nLjwhUaaeX064?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(82310400017)(376005)(36860700004)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2024 12:30:57.5471
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b527b3f-fcb6-484c-a63b-08dc7991ddb6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002529F.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7562

Add device and driver flow filter requirements.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/179
Signed-off-by: Parav Pandit <parav@nvidia.com>
Signed-off-by: Heng Qi <hengqi@linux.alibaba.com>
---
changelog:
v9->v10:
- rephrase from 'resource' to 'resource object'
v6->v7:
- added device normatives for valid ranges
- rebased to use capabilities and resources
v5->v6:
- removed white spaces from end of line
- added missing conformance links
v2->v3:
- removed dependency on the dynamic queue creation as the
  infrastructure is not yet ready
v1->v2:
- fixed comments from Heng
- fixed spelling from initializaton to initialization
- added more requirements for multiple actions
v0->v1:
- addressed comments from Satananda
- added device requirement to return non zero value in fields_bmap
- added device requirement to not repeat filter type in response
- added driver requirement to order filter match field as it
  appears in the packet
- added device requirement to fail group delete command on existing
  flow entries
---
 device-types/net/description.tex        | 174 ++++++++++++++++++++++++
 device-types/net/device-conformance.tex |   1 +
 device-types/net/driver-conformance.tex |   1 +
 3 files changed, 176 insertions(+)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index 6168c96..a5a3971 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -2846,6 +2846,180 @@ \subsubsection{Flow filter}\label{sec:Device Types / Network Device / Device Ope
 Note that at most one action is ever taken for a given packet. If a rule is
 applied and an action is taken, the action of other rules is not taken.
 
+\devicenormative{\paragraph}{Flow filter}{Device Types / Network Device / Device Operation / Flow filter}
+
+When the device supports flow filter operations,
+\begin{itemize}
+\item the device MUST set VIRTIO_NET_FF_RESOURCE_CAP, VIRTIO_NET_FF_SELECTOR_CAP
+and VIRTIO_NET_FF_ACTION_CAP capability in the \field{supported_caps} in the
+command VIRTIO_ADMIN_CMD_CAP_SUPPORT_QUERY.
+\item the device MUST support the administration commands
+VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE,
+VIRTIO_ADMIN_CMD_RESOURCE_OBJ_MODIFY, VIRTIO_ADMIN_CMD_RESOURCE_OBJ_QUERY,
+VIRTIO_ADMIN_CMD_RESOURCE_OBJ_DESTROY for the resource types
+VIRTIO_NET_RESOURCE_OBJ_FF_GROUP, VIRTIO_NET_RESOURCE_OBJ_FF_CLASSIFIER and
+VIRTIO_NET_RESOURCE_OBJ_FF_RULE.
+\end{itemize}
+
+When any of the VIRTIO_NET_FF_RESOURCE_CAP, VIRTIO_NET_FF_SELECTOR_CAP, or
+VIRTIO_NET_FF_ACTION_CAP capability is disabled, the device SHOULD set
+\field{status} to VIRTIO_ADMIN_STATUS_Q_INVALID_OPCODE for the commands
+VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE,
+VIRTIO_ADMIN_CMD_RESOURCE_OBJ_MODIFY, VIRTIO_ADMIN_CMD_RESOURCE_OBJ_QUERY,
+and VIRTIO_ADMIN_CMD_RESOURCE_OBJ_DESTROY. These commands apply to the resource
+\field{type} of VIRTIO_NET_RESOURCE_OBJ_FF_GROUP, VIRTIO_NET_RESOURCE_OBJ_FF_CLASSIFIER, and
+VIRTIO_NET_RESOURCE_OBJ_FF_RULE.
+
+The device SHOULD set \field{status} to VIRTIO_ADMIN_STATUS_EINVAL for the
+command VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE when the resource \field{type}
+is VIRTIO_NET_RESOURCE_OBJ_FF_GROUP, if a flow filter group already exists
+with the supplied \field{group_priority}.
+
+The device SHOULD set \field{status} to VIRTIO_ADMIN_STATUS_ENOSPC for the
+command VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE when the resource \field{type}
+is VIRTIO_NET_RESOURCE_OBJ_FF_GROUP, if the number of flow filter group
+objects in the device exceeds the lower of the configured driver
+capabilities \field{groups_limit} and \field{rules_per_group_limit}.
+
+The device SHOULD set \field{status} to VIRTIO_ADMIN_STATUS_ENOSPC for the
+command VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE when the resource \field{type} is
+VIRTIO_NET_RESOURCE_OBJ_FF_CLASSIFIER, if the number of flow filter selector
+objects in the device exceeds the configured driver capability
+\field{selectors_limit}.
+
+The device SHOULD set \field{status} to VIRTIO_ADMIN_STATUS_EBUSY for the
+command VIRTIO_ADMIN_CMD_RESOURCE_OBJ_DESTROY for a flow filter group when
+the flow filter group has one or more flow filter rules depending on it.
+
+The device SHOULD set \field{status} to VIRTIO_ADMIN_STATUS_EBUSY for the
+command VIRTIO_ADMIN_CMD_RESOURCE_OBJ_DESTROY for a flow filter classifier when
+the flow filter classifier has one or more flow filter rules depending on it.
+
+The device SHOULD fail the command VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE for the
+flow filter rule resource object if,
+\begin{itemize}
+\item \field{vq_index} is not a valid receive virtqueue index for
+the VIRTIO_NET_FF_ACTION_DIRECT_RX_VQ action,
+\item \field{priority} is greater than or equal to
+      \field{last_rule_priority_per_group},
+\item \field{id} is greater than or equal to \field{rules_limit} or
+      greater than or equal to \field{rules_per_group_limit}, whichever is lower,
+\item the length of \field{keys} and the length of all the mask bytes of
+      \field{selectors[].mask} as referred by \field{classifier_id} differs,
+\item the supplied \field{action} is not supported in the capability VIRTIO_NET_FF_ACTION_CAP.
+\end{itemize}
+
+When the flow filter directs a packet to the virtqueue identified by
+\field{vq_index} and if the receive virtqueue is reset, the device
+MUST drop such packets.
+
+Upon applying a flow filter rule to a packet, the device MUST STOP any further
+application of rules and cease applying any other steering configurations.
+
+For multiple flow filter groups, the device MUST apply the rules from
+the group with the highest priority. If any rule from this group is applied,
+the device MUST ignore the remaining groups. If none of the rules from the
+highest priority group match, the device MUST apply the rules from
+the group with the next highest priority, until either a rule matches or
+all groups have been attempted.
+
+The device MUST apply the rules within the group from the highest to the
+lowest priority until a rule matches the packet, and the device MUST take
+the action. If an action is taken, the device MUST not take any other
+action for this packet.
+
+The device MAY apply the rules with the same \field{rule_priority} in any
+order within the group.
+
+The device MUST process incoming packets in the following order:
+\begin{itemize}
+\item apply the steering configuration received using control virtqueue
+      commands VIRTIO_NET_CTRL_RX, VIRTIO_NET_CTRL_MAC, and
+      VIRTIO_NET_CTRL_VLAN.
+\item apply flow filter rules if any.
+\item if no filter rule is applied, apply the steering configuration
+      received using the command VIRTIO_NET_CTRL_MQ_RSS_CONFIG
+      or according to automatic receive steering.
+\end{itemize}
+
+When processing an incoming packet, if the packet is dropped at any stage, the device
+MUST skip further processing.
+
+When the device drops the packet due to the configuration done using the control
+virtqueue commands VIRTIO_NET_CTRL_RX or VIRTIO_NET_CTRL_MAC or VIRTIO_NET_CTRL_VLAN,
+the device MUST skip flow filter rules for this packet.
+
+When the device performs flow filter match operations and if the operation
+result did not have any match in all the groups, the receive packet processing
+continues to next level, i.e. to apply configuration done using
+VIRTIO_NET_CTRL_MQ_RSS_CONFIG command.
+
+The device MUST support the creation of flow filter classifier objects
+using the command VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE with \field{flags}
+set to VIRTIO_NET_FF_MASK_F_PARTIAL_MASK;
+this support is required even if all the bits of the masks are set for
+a field in \field{selectors}, provided that partial masking is supported
+for the selectors.
+
+\drivernormative{\paragraph}{Flow filter}{Device Types / Network Device / Device Operation / Flow filter}
+
+The driver MUST enable VIRTIO_NET_FF_RESOURCE_CAP, VIRTIO_NET_FF_SELECTOR_CAP,
+and VIRTIO_NET_FF_ACTION_CAP capabilities to use flow filter.
+
+The driver SHOULD NOT remove a flow filter group using the command
+VIRTIO_ADMIN_CMD_RESOURCE_OBJ_DESTROY when one or more flow filter rules
+depend on that group. The driver SHOULD only destroy the group after
+all the associated rules have been destroyed.
+
+The driver SHOULD NOT remove a flow filter classifier using the command
+VIRTIO_ADMIN_CMD_RESOURCE_OBJ_DESTROY when one or more flow filter rules
+depend on the classifier. The driver SHOULD only destroy the classifier
+after all the associated rules have been destroyed.
+
+The driver SHOULD NOT add multiple flow filter rules with the same
+\field{rule_priority} within a flow filter group, as these rules MAY match
+the same packet. The driver SHOULD assign different \field{rule_priority}
+values to different flow filter rules if multiple rules may match a single
+packet.
+
+For the command VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE, when creating a resource
+of \field{type} VIRTIO_NET_RESOURCE_OBJ_FF_CLASSIFIER, the driver MUST set:
+\begin{itemize}
+\item \field{selectors[0].type} to VIRTIO_NET_FF_MASK_TYPE_ETH.
+\item \field{selectors[1].type} to VIRTIO_NET_FF_MASK_TYPE_IPV4 or
+      VIRTIO_NET_FF_MASK_TYPE_IPV6 when \field{count} is more than 1,
+\item \field{selectors[2].type} VIRTIO_NET_FF_MASK_TYPE_UDP or
+      VIRTIO_NET_FF_MASK_TYPE_TCP when \field{count} is more than 2.
+\end{itemize}
+
+For the command VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE, when creating a resource
+of \field{type} VIRTIO_NET_RESOURCE_OBJ_FF_CLASSIFIER, the driver MUST set:
+\begin{itemize}
+\item \field{selectors[0].mask} bytes to all 1s for the \field{EtherType}
+       when \field{count} is 2 or more.
+\item \field{selectors[1].mask} bytes to all 1s for \field{Protocol} or \field{Next Header}
+       when \field{selector[1].type} is VIRTIO_NET_FF_MASK_TYPE_IPV4 or VIRTIO_NET_FF_MASK_TYPE_IPV6,
+       and when \field{count} is more than 2.
+\end{itemize}
+
+For the command VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE, the resource \field{type}
+VIRTIO_NET_RESOURCE_OBJ_FF_RULE, if the corresponding classifier object's
+\field{count} is 2 or more, the driver MUST SET the \field{keys} bytes of
+\field{EtherType} in accordance with
+\hyperref[intro:IEEE 802 Ethertypes]{IEEE 802 Ethertypes}
+for either VIRTIO_NET_FF_MASK_TYPE_IPV4 or VIRTIO_NET_FF_MASK_TYPE_IPV6.
+
+For the command VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE, when creating a resource of
+\field{type} VIRTIO_NET_RESOURCE_OBJ_FF_RULE, if the corresponding classifier
+object's \field{count} is more than 2, and the \field{selector[1].type} is either
+VIRTIO_NET_FF_MASK_TYPE_IPV4 or VIRTIO_NET_FF_MASK_TYPE_IPV6, the driver MUST
+set the \field{keys} bytes for the \field{Protocol} or \field{Next Header}
+according to \hyperref[intro:IANA Protocol Numbers]{IANA Protocol Numbers} respectively.
+
+The driver SHOULD set all the bits for a field in the mask of a selector in both the
+capability and the classifier object, unless the VIRTIO_NET_FF_MASK_F_PARTIAL_MASK
+is enabled.
+
 \subsubsection{Legacy Interface: Framing Requirements}\label{sec:Device
 Types / Network Device / Legacy Interface: Framing Requirements}
 
diff --git a/device-types/net/device-conformance.tex b/device-types/net/device-conformance.tex
index c71341e..d88484c 100644
--- a/device-types/net/device-conformance.tex
+++ b/device-types/net/device-conformance.tex
@@ -17,4 +17,5 @@
 \item \ref{devicenormative:Device Types / Network Device / Device Operation / Control Virtqueue / Inner Header Hash}
 \item \ref{devicenormative:Device Types / Network Device / Device Operation / Control Virtqueue / Device Statistics}
 \item \ref{devicenormative:Device Types / Network Device / Device Operation / Control Virtqueue / RSS Context}
+\item \ref{devicenormative:Device Types / Network Device / Device Operation / Flow filter}
 \end{itemize}
diff --git a/device-types/net/driver-conformance.tex b/device-types/net/driver-conformance.tex
index 7081ec3..d346b88 100644
--- a/device-types/net/driver-conformance.tex
+++ b/device-types/net/driver-conformance.tex
@@ -17,4 +17,5 @@
 \item \ref{drivernormative:Device Types / Network Device / Device Operation / Control Virtqueue / Inner Header Hash}
 \item \ref{drivernormative:Device Types / Network Device / Device Operation / Control Virtqueue / Device Statistics}
 \item \ref{drivernormative:Device Types / Network Device / Device Operation / Control Virtqueue / RSS Context}
+\item \ref{drivernormative:Device Types / Network Device / Device Operation / Flow filter}
 \end{itemize}
-- 
2.34.1

