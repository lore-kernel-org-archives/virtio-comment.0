Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2066.outbound.protection.outlook.com [40.107.237.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0157146A9D
	for <virtio-comment@lists.linux.dev>; Tue,  4 Jun 2024 13:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717507813; cv=fail; b=tcG4VRlk0MlCGklrlXOGUL29++p9Qxm9yimu8VHTi9rUk8ntlH7FzgdvFIjFgJHvw/HLymEqChk4t45PZf7QOL6kZREgOcNhAAyAIWrTIEcgJ6XqShklBAJPOe2Xw3LwnD6OhCnDuLU22Vm1qQKrkDwO8Qzvh640Do9DlNQni3I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717507813; c=relaxed/simple;
	bh=Wteu6cnn8iObOg4M5pnyYsuBftn/t0/tKeOq2C5aQhE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=prcZx0MXe4cRkQjd3O4GRalawvPkuYEk7AyagQ6B/nIntDNipO6aOHfpQRvnjLrsT+XxOGvrLefEEtLUBzIdh2rP6b4DJfiFiWQ1jQeFHuCh3f8aqQjsH6bM8/6/7U+5zctvFW2pBQhWlRCdCASGvHGar+4R4iuOlOsSr/qPFzY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=FQXStsyy; arc=fail smtp.client-ip=40.107.237.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="FQXStsyy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eiOVHimLood9BBoCcV5sjF91iyS6VJnSIH6MA8qtqmIlt5kpZJYiKg/5o1aR96CfNxA7vBOcY4+ggmL3e6QAKQ7B+m6//y2+oaH0WdxdwtmWwfyHuVJobtiKBTShFApcejyPL3qnlY0nRg4ZJyBk1y+WfYneYJC3NthyciNrysMAI2axRUgk+66zYYsKnQGKpqwaAjiMVShSSOcua4L2r4laSrHvZZI1ZMZA60sg2vvoQ7x7P6mjZfQOjcz/iyWB1/SXzM2tLUDQOJWcbNioFp5fWqcG//asYSREODsKK2g7fUF0Q7ZF5bQogC+cBHhH3xkDQ2srfEk92fM409T4JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BrekobvF5EOEL4Cm4qt26kLmXXu16ebxoAEtjCKO0Lg=;
 b=HQyK+R8ko3r+4uwfpDtxNON6p5qxUifairRhykYCht/jJRvbVV1yN9oU92OIVRDsh1NlBLRdWLfSl1p1bOh6IfXHiR+2jxNsYSJCcGYK5Po3qDusOCVs/Qpj7NGEBh4LgrHnz63jEobwkv9ECZm7c2K+V4SByDxWkVXwp8owH8MYK7SZciNBq9jZFrTbV7DCN66G5MgFNXBDiExyt51YcrFKicllJx6p4ZgRornD2a2BabC9ZVOfdhLs01WNMUkSPsjTlJKtfbWxN2t3PtLRf1OGEX3zBFm8AGYv42TTp3nmRa2yW71ZT4ojygDfyAQTps7OBuZrMrrYDjq6/+79ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BrekobvF5EOEL4Cm4qt26kLmXXu16ebxoAEtjCKO0Lg=;
 b=FQXStsyyaGplk2M8buWmsCEmRVQkF00Sn/vkC2dCuzxok8cia+VqDMzBTy3ct5s2QzreYm8vlKR3xoMKDwStRGoNCgE6ZLoRGCj/tRAact8Nw+VJ0aMJpHt1BWY4EL7UNBivvMgOgPk6uMFwljyOeJg1k6SwDHzIVDE9EuqfYF45oWdJUIpAqM+hif2SmjKeVbUbm+7XyQN+aKPTRoGqYGhBG62FmLCHBzpXYVQhe4jlDhPqV+dQGmW8WDXLpaPhEeY2xInBjQzBY9jGBeerhxZ4/k7WH85aOzFGBWmBXQqfKeOsnFIhfcD7LHBkZDQy5l0hsgfpf3MLzud05KoWXA==
Received: from BY5PR17CA0003.namprd17.prod.outlook.com (2603:10b6:a03:1b8::16)
 by PH7PR12MB8055.namprd12.prod.outlook.com (2603:10b6:510:268::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.27; Tue, 4 Jun
 2024 13:30:07 +0000
Received: from SJ5PEPF000001D6.namprd05.prod.outlook.com
 (2603:10b6:a03:1b8:cafe::33) by BY5PR17CA0003.outlook.office365.com
 (2603:10b6:a03:1b8::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.29 via Frontend
 Transport; Tue, 4 Jun 2024 13:30:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ5PEPF000001D6.mail.protection.outlook.com (10.167.242.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.15 via Frontend Transport; Tue, 4 Jun 2024 13:30:06 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 4 Jun 2024
 06:29:57 -0700
Received: from vr-arch-host06.mtvr.labs.mlnx (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 4 Jun 2024 06:29:54 -0700
From: Parav Pandit <parav@nvidia.com>
To: <virtio-comment@lists.linux.dev>, <mst@redhat.com>, <cohuck@redhat.com>
CC: <hengqi@linux.alibaba.com>, <sburla@marvell.com>, <shahafs@nvidia.com>,
	<si-wei.liu@oracle.com>, <peter.hilber@opensynergy.com>,
	<jasowang@redhat.com>, <xuanzhuo@linux.alibaba.com>, Parav Pandit
	<parav@nvidia.com>
Subject: [PATCH v11 11/13] virtio-net: Add flow filter device and driver requirements
Date: Tue, 4 Jun 2024 16:29:01 +0300
Message-ID: <20240604132903.2093195-12-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240604132903.2093195-1-parav@nvidia.com>
References: <20240604132903.2093195-1-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D6:EE_|PH7PR12MB8055:EE_
X-MS-Office365-Filtering-Correlation-Id: a71d0171-7cf7-4a7f-e007-08dc849a730e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|1800799015|36860700004|376005|82310400017;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Sd0ldDDU6q4Q3dwDy5kj+1kDQ1m7uz9gxa8ubUeVuwnukwO9Mw9DQ0f1Utc6?=
 =?us-ascii?Q?V6HOpMMopt5OWDA7ayY3vw5B7xSnjS6fFX+Lfgu/dTLLY+p2D2ZL2FUDAfGd?=
 =?us-ascii?Q?DEszDLxnIS++10r/gYEqQhg7VRSXbO/SV/oGsZIPMdbDxF2e99ccarIuQqA8?=
 =?us-ascii?Q?fnrMsA6EgKqt1bbvB0LGam5ceTsQLLQg7mmZX7oYWBlaEIxoHwUS5OBn9lg+?=
 =?us-ascii?Q?hBySpczhfuJelp2o1uYnSdNYKVuoc3WTQ0zYz+oia9yMGWFAV1L64gwx+guO?=
 =?us-ascii?Q?PWnBqJf7NJA4lUOQlJgVqKWqAwHO/8sHz9mVNKc6tx4T7f/nTG8zycousj3e?=
 =?us-ascii?Q?97N2l2/9SSb944jzNW+d/kyBUjc+jV3KvS0f3V4Wh+6bUbbsKlERn+lsnl3j?=
 =?us-ascii?Q?0u0P8ZxwWF6zsrrtexlokRzFuaOPgANVEoSlXvdVObmx9zatlUYPTLN8CG8c?=
 =?us-ascii?Q?+6mDX+HNiIXTCnS3ZvQaat7UgSMXBYsF6NxsA4fCYScBxYYUMOWFCdqGseaS?=
 =?us-ascii?Q?nmq6d5zzugAmTB3IrnF753jKxpYwJZRPc/GLsqtpHu3ZJbATzZx70Tgu23Nt?=
 =?us-ascii?Q?1jUIgWh/Dv9jx4W9KuD9SA/u3wSBV3lhWtfIFIB2Iwl96xk+d0Z0GgOQ5ZAQ?=
 =?us-ascii?Q?qq22eQGaKuNVhnNku5bFGaZKGxR3L1ng1hTHEqqHO1EFarOJQdRvzyY/Vazu?=
 =?us-ascii?Q?wD+0CLJvitq95reyEKEfDGQv7fs9T4d7dh70TCCxx9I3eOtSBvveiCPmuRJG?=
 =?us-ascii?Q?FhbzFHubsbGNdlZmjK91exrnx95JL8Xplaog35ZiWOWeFmvqvyKTBbnltFNe?=
 =?us-ascii?Q?clKGfLbC76Rda0fvp8rB+tsvAy5+/PHwRut16lfAfhj0KKRKd++yox3YCvRA?=
 =?us-ascii?Q?8SlbekTEI48Ivc9FuGolQ9EuY0yNSsrqinyyVeh1r4rC+oVsK53FoTpDJsXc?=
 =?us-ascii?Q?8w6RepDqRroFOnj4jfdDxh/zQ3uNOdbfXF1HJ7aSOlorngG5tfJaTDY1qjGj?=
 =?us-ascii?Q?4G+LIO6bHdv/Rdbq60BMYXz6b97+eF+uQ1VrFubT3k7nnsWlH3dTVfQZUEY4?=
 =?us-ascii?Q?JkWUXffpOA5k9zfaLn/vum/LQqugRPJv8k7TtPxvXYkBsHIqZrNb/BzX3Cw0?=
 =?us-ascii?Q?ICbmP/m46kXK8yRqIPFe/mJDiO9PN/xUe50t9es3LowsyoKOiW8cPhVytBFH?=
 =?us-ascii?Q?3fVlWrCQ2glgNHDEGTj1BJWWw73+fRdbJ9Nt5DrZHY9zaWWNA4LAhaHEo6+Y?=
 =?us-ascii?Q?RcYW9D+NYlTboUw74l+OUJN38fPoNNbP6NnaF2Yelw0t25LdUh46kgeNL/de?=
 =?us-ascii?Q?tIiGIO1jSEn9mulhNkJ9h3SIBKY7XDJ+JUl7MIjfWytOxG6zLbEhYJuEEn+2?=
 =?us-ascii?Q?GBoeOD15Z7PzUa+tQn2OVEd0FSf3?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(1800799015)(36860700004)(376005)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2024 13:30:06.7608
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a71d0171-7cf7-4a7f-e007-08dc849a730e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001D6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8055

Add device and driver flow filter requirements.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/179
Signed-off-by: Parav Pandit <parav@nvidia.com>
Signed-off-by: Heng Qi <hengqi@linux.alibaba.com>
---
changelog:
v10->v11:
- renamed last_rule_priority_per_group to last_rule_priority
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
index 4084bfb..0ad6f1d 100644
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
+      \field{last_rule_priority},
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

