Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2056.outbound.protection.outlook.com [40.107.237.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C94144D0F
	for <virtio-comment@lists.linux.dev>; Tue,  4 Jun 2024 13:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717507826; cv=fail; b=u6DfzvQAR64Rc2wt0B6qA8LXM2TSgOJY/6wl/n2YYTDJe1gZwXBCju+WBBXp6lv6itAMf9tB0n3hDxWbZmuAB4f175uHhus40N65cYmsVDVdZPZnUy5zIwwAYQbkVBH2OmWzcoaFwXB/0wYB8VioJ0AuXX056lfgEPFuqQMnoec=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717507826; c=relaxed/simple;
	bh=aqwJwEbZdpZbRcfZAJEFA79UxX8kEntF+zRLctfoAPY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bOCYN1WM3XUxMyHq7o8sP4iTDuJT6bhGKsu0HK7PrNYt9HdQS6lfHola+W2i/TYPhOywpZOosLxKAz5GHqydR03tSZh/qaYThQ9e8cuHDZtDh10FC9QDZPCqswa/HlZS/v0NJhG94l+UFj8Af6p0yKSp6jBRPMhPwh5qcpdRRAY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=p92SmvBy; arc=fail smtp.client-ip=40.107.237.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="p92SmvBy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aNNEpvd0T+Bayz7hqY8qZVf7j821bDjYmy3Hm1dit1SPYwJ6LQcnE2Hou2gDoa8tnVGEnK7+EE42F2CAXoChOSjAvVXcn+eM/O0aDirV0s1jdaHfd77vQl9aD2Q7oK8mJpRtY3f4uB2rcUlDDP6pqWQZ/3kVKM6c5YTlzbzDtr/Ul/27vo8DxrsM3Aw+utAyoW8gkE0BAh21nU62WRiOYBufMcfkb2sD62maLM925LNM/MpD9iCN//rrMEOp3J2UgpumWnYmLDMkedgissg1CfPgDiou/KzqUffW6MDat1EsAvP9N3H3NmrSflxxAKfz4/wNpSNEqmHYQkiKQscgoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OUILtvXswazc2pf4xQ9wRZhr/bn+wKBdQERs4JUGKWE=;
 b=muiSC/0F3MoAJfgLAQBr0f+kKjqGwxpn8QiRgecclh4pHHXvEViXx6zn/G3ltlZBuw6N2D/WPPHbYJVQ0Vd/xxRvzXoPeIXLxxkPjJ0sMbUChSgUz9i2q33F+r9vCgIEErErBexK0pkgYiyWjAWO5afAaxnXk9Kgqlo/3zlcKCMJJauxQKB1Svb+1sjR/2XGZf1g0qSlB10KeTQaU+2DCeUPHq0SWM4g5YkyCk31bDPBRtq39hCR7dEBoICF1Mjd6vMrAZgM5BFPR0yEZecntiRR6Z7AL6gR/NfEPKv/6eL6kMl8T2LYhCR37Fuq0G+CyLCDuqiLEqyB+kduwXyyjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OUILtvXswazc2pf4xQ9wRZhr/bn+wKBdQERs4JUGKWE=;
 b=p92SmvByFyj8FE8JPq6GD0JIoFaxaknVYxy5JZiQpemlq6PLvpGli2Qye6nSxI6/DBGDGJxIKxYdqCP+D5wWr8qejuMpu6iV2s7uyGE0caD4K7Iz/gNTTQO95PSHBPah+S7UiESKBlnpYTfHyPiUbi8edeDjIFEABuEmSgXjFiYsSCVotI3gqzppVcsywx1sEv7yQuQ/+QFodS/eCHZwMppqjAI/K+T2L1JipVGvXFsvWzFrgxn84Y8Ojeiu8gRipkZH/3MOc/vQIGNUJvEo+gE6r7+CMpgoPtRGb4GBLQSIbRcvxr4ayPtFHilVUQFH306oaqw27Enb6U9P6SNsiw==
Received: from BY3PR05CA0034.namprd05.prod.outlook.com (2603:10b6:a03:39b::9)
 by IA1PR12MB6307.namprd12.prod.outlook.com (2603:10b6:208:3e5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21; Tue, 4 Jun
 2024 13:30:08 +0000
Received: from SJ5PEPF000001D3.namprd05.prod.outlook.com
 (2603:10b6:a03:39b:cafe::4a) by BY3PR05CA0034.outlook.office365.com
 (2603:10b6:a03:39b::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7656.16 via Frontend
 Transport; Tue, 4 Jun 2024 13:30:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ5PEPF000001D3.mail.protection.outlook.com (10.167.242.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.15 via Frontend Transport; Tue, 4 Jun 2024 13:30:07 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 4 Jun 2024
 06:29:54 -0700
Received: from vr-arch-host06.mtvr.labs.mlnx (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 4 Jun 2024 06:29:50 -0700
From: Parav Pandit <parav@nvidia.com>
To: <virtio-comment@lists.linux.dev>, <mst@redhat.com>, <cohuck@redhat.com>
CC: <hengqi@linux.alibaba.com>, <sburla@marvell.com>, <shahafs@nvidia.com>,
	<si-wei.liu@oracle.com>, <peter.hilber@opensynergy.com>,
	<jasowang@redhat.com>, <xuanzhuo@linux.alibaba.com>, Parav Pandit
	<parav@nvidia.com>
Subject: [PATCH v11 10/13] virtio-net: Add flow filter group, classifier and rule resource objects
Date: Tue, 4 Jun 2024 16:29:00 +0300
Message-ID: <20240604132903.2093195-11-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D3:EE_|IA1PR12MB6307:EE_
X-MS-Office365-Filtering-Correlation-Id: df6dc69c-8bd9-496b-10c9-08dc849a73b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|82310400017|36860700004|376005|1800799015;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AU/HLqSKMgVQtstLGcbZUpevEWPGOrHB+3AvypRfD055CDgLboKd+1qFpBVF?=
 =?us-ascii?Q?2OY6fXDzCfUp4ountYO8+xpvzG3u+Sb3uA7kH1ix8FwLum7uorutMIcSwKcY?=
 =?us-ascii?Q?mg0kpDRTh2yVw7dypBDuveNEDfnn1/wLl8+uXFcngESaxPbUSFCa/cNmZ95A?=
 =?us-ascii?Q?IiDzfND1BfTgIOZ8MBoKMIhavFXjMD05pHAtlfGBulskAJPooXftJqZXh93S?=
 =?us-ascii?Q?Zw2Zj8U4rL1gHfQt3R/rPVrFWWvjC8SRG8k3Nt+ExiYiQrhGCh4YbKqrdJUd?=
 =?us-ascii?Q?Ckq2BfTfmKrrJtB6nxiOEoBk5z1fWEcXiuwzo+5KB9uEgMO1UkDcw8IwmpwJ?=
 =?us-ascii?Q?tyUUljot8RuNOD6z/pphv+IaxWjIxCfRW04tTA4dbgStZ/IMVzJS8KsMajOP?=
 =?us-ascii?Q?qL20AB+JdjrLKVcR3EKOefmEBxU3Ac3d1jGrvnmtCEpomtnnsppicwYY6FlU?=
 =?us-ascii?Q?aOZTpZLhxx7iCRre0Uc7h17VnsI80tIo0EJH3ady1ygkJowQRHtKQ8TPVfQS?=
 =?us-ascii?Q?bTNlbwGRBhairilSAzqJ5vWBgE0jnAk1mQcvhmaBKuTKn0KPyOaJNok3pL0T?=
 =?us-ascii?Q?A1+7yBdKc2N62JH1schlcBNJnDJgKcT9Mv2qtkDhisDLJ6Cr50K+fsXujz4h?=
 =?us-ascii?Q?0LRBHmyDABMwcekRSlWF2vhOUSoOFIr5rBTfpfafBm4TD8hKsWP0JCvOSPpT?=
 =?us-ascii?Q?VO0i07ay2/dtfZdqnY398BKGSJMqZRkD09NumMFnyxpK9rJIdx1Vx/6LTh2/?=
 =?us-ascii?Q?CFmWjzNl9egOFWBxDTd8IQj7NHdzD2Y76OAeUvlDFK1vaIUt5/MmBZSUgKKU?=
 =?us-ascii?Q?HnH8sXlUHA0cUjM7+sYU5dfIwh+beeeOsekO3cViI7kdrpePkBs3viiUivUN?=
 =?us-ascii?Q?tZEbILNbxhYVKwgTBG9kRsdq6vGvxHhJ6IczU0EgxYNbHRkQ4c5rNozdjsm0?=
 =?us-ascii?Q?r0TNtVjM352rCSeZ44uPrQBQXeOGLCuKcXFoD5moQOn7fjNh6TXMNv3t9SCQ?=
 =?us-ascii?Q?5j9NGMddseTNiYZeBXZYRB0EHD6ig7JaPAE9gYvyxIB68Uej8+cKEwzMaPPR?=
 =?us-ascii?Q?u4LUxtNF2TFC3J5+4Rz0ZKJ1TaLHV3F1nQnwUCdzhiypR4DIDY5brNeyvnLh?=
 =?us-ascii?Q?Cljjc3LRyMyhLhKqGaqKf9xWc+K02y2SMsYvourRIoiR86oXhRDjZWSg2eDV?=
 =?us-ascii?Q?zPOqxs+ErD0p36n0aIuI61qgd7JBm75dwfeI56WTQvQ3ykgK3fP1l0KeO2my?=
 =?us-ascii?Q?CQWqQYopOyB7sJSSMKZuVi80lc8cJSBVhw/6OOmGL1N3AmNyy2w1gZILUBdP?=
 =?us-ascii?Q?7VdHpfFPYO/YTpUhd3dVdw+ZbRKpdx4vRzukT54I1eQ7RV80b0EcSrUGl5UO?=
 =?us-ascii?Q?zFh5ObQG8tlOvKmHbrSazHyxFLtg25Lu9a1gpFldBemp1AaAaA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(82310400017)(36860700004)(376005)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2024 13:30:07.7653
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df6dc69c-8bd9-496b-10c9-08dc849a73b4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001D3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6307

Flow filter rules depend on the flow filter group resource object.
The device can have one or more flow filter groups. Each flow filter
group has its own order. The group order defines the packet
processing order in the flow filter domain.

Define flow filter classifier object which consists of one
or multiple types of packet header fields to consider
for matching. A mask can match on partial field or whole
field if the device supports partial masking for a given
mask type.

Define flow filter rule resource which consists of
match key, reference to group and mask objects and
an action.

Currently it covers the most common filter types and value
of Ethernet header, IPV4 and IPV6 headers and TCP and UDP headers.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/179
Signed-off-by: Parav Pandit <parav@nvidia.com>
Signed-off-by: Heng Qi <hengqi@linux.alibaba.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

---
changelog:
v9->v10:
- rephrase from 'resource' to 'resource object'
- renamed and rephrase 'forward' to 'direct'
- skipped dest_ prefix from the action
- removed union and kept the reserved1 for future extension
- added text for reserved and reserved1 future extension for example for switch port
  or next rule object id or some other object
- simplified structures for single key and single action
- flow rule to refer to the flow filter mask resource object
- removed specific type and key specific fields
v6->v7:
- plenty of grammar corrections suggested by Cornelia
- adapt to generic device resource framework
- addressed comments from Cornelia
- reworded the description for group delete command
- rebased the series on top of generic resource framework
v2->v3:
- removed references to flow filter virtqueues
- removed one partial sentence
- added text for delete request
- aligned request and opcode values to just say request in the defines
v1->v2:
- squashed with match fields definition patch of v1
- added length to the flexible array definition struct to benefit
  from future runtime length bound checkers listed in
  https://people.kernel.org/kees/bounded-flexible-arrays-in-c
- renamed value to key
- addressed comments from Satananda
- merged destination and action to one struct
v0->v1:
- reworded add flow request text to consider optional mask
- replaced respond with set
- added mask flag to the type
---
 device-types/net/description.tex | 173 +++++++++++++++++++++++++++++++
 introduction.tex                 |   8 ++
 2 files changed, 181 insertions(+)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index a299c32..4084bfb 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -417,6 +417,22 @@ \subsection{Device and driver capabilities}\label{sec:Device Types / Network Dev
 \hline
 \end{tabularx}
 
+\subsection{Device resource objects}\label{sec:Device Types / Network Device / Device resource objects}
+
+The network device has the following resource objects.
+
+\begin{tabularx}{\textwidth}{ |l||l|X| }
+\hline
+type & Name & Description \\
+\hline \hline
+0x0200 & \hyperref[par:Device Types / Network Device / Device Operation / Flow filter / Resource objects / VIRTIO_NET_RESOURCE_OBJ_FF_GROUP]{VIRTIO_NET_RESOURCE_OBJ_FF_GROUP} & Flow filter group resource object \\
+\hline
+0x0201 & \hyperref[par:Device Types / Network Device / Device Operation / Flow filter / Resource objects / VIRTIO_NET_RESOURCE_OBJ_FF_CLASSIFIER]{VIRTIO_NET_RESOURCE_OBJ_FF_CLASSIFIER} & Flow filter mask object \\
+\hline
+0x0202 & \hyperref[par:Device Types / Network Device / Device Operation / Flow filter / Resource objects / VIRTIO_NET_RESOURCE_OBJ_FF_RULE]{VIRTIO_NET_RESOURCE_OBJ_FF_RULE} & Flow filter rule object \\
+\hline
+\end{tabularx}
+
 \subsection{Device Operation}\label{sec:Device Types / Network Device / Device Operation}
 
 Packets are transmitted by placing them in the
@@ -2673,6 +2689,163 @@ \subsubsection{Flow filter}\label{sec:Device Types / Network Device / Device Ope
 \end{tabularx}
 \end{table}
 
+\paragraph{Resource objects}
+\label{par:Device Types / Network Device / Device Operation / Flow filter / Resource objects}
+
+\subparagraph{VIRTIO_NET_RESOURCE_OBJ_FF_GROUP}\label{par:Device Types / Network Device / Device Operation / Flow filter / Resource objects / VIRTIO_NET_RESOURCE_OBJ_FF_GROUP}
+
+A flow filter group contains between 0 and \field{rules_limit} rules, as specified by the
+capability VIRTIO_NET_FF_RESOURCE_CAP. For the flow filter group object both
+\field{resource_obj_specific_data} and
+\field{resource_obj_specific_result} are in the format
+\field{struct virtio_net_resource_obj_ff_group}.
+
+\begin{lstlisting}
+struct virtio_net_resource_obj_ff_group {
+        le16 group_priority;
+};
+\end{lstlisting}
+
+\field{group_priority} specifies the priority for the group. Each group has a
+distinct priority. For each incoming packet, the device tries to apply rules
+from groups from higher \field{group_priority} value to lower, until either a
+rule matches the packet or all groups have been tried.
+
+\subparagraph{VIRTIO_NET_RESOURCE_OBJ_FF_CLASSIFIER}\label{par:Device Types / Network Device / Device Operation / Flow filter / Resource objects / VIRTIO_NET_RESOURCE_OBJ_FF_CLASSIFIER}
+
+A classifier is used to match a flow filter key against a packet. The
+classifier defines the desired packet fields to match, and is represented by
+the VIRTIO_NET_RESOURCE_OBJ_FF_CLASSIFIER device resource object.
+
+For the flow filter classifier object both \field{resource_obj_specific_data} and
+\field{resource_obj_specific_result} are in the format
+\field{struct virtio_net_resource_obj_ff_classifier}.
+
+\begin{lstlisting}
+struct virtio_net_resource_obj_ff_classifier {
+        u8 count;
+        u8 reserved[7];
+        struct virtio_net_ff_selector selectors[];
+};
+\end{lstlisting}
+
+A classifier is an array of \field{selectors}. The number of selectors in the
+array is indicated by \field{count}. The selector has a type that specifies
+the header fields to be matched against, and a mask.
+See \ref{lst:Device Types / Network Device / Device Operation / Flow filter / Device and driver capabilities / VIRTIO_NET_FF_SELECTOR_CAP / virtio_net_ff_selector}
+for details about selectors.
+
+The first selector is always VIRTIO_NET_FF_MASK_TYPE_ETH. When there are multiple
+selectors, a second selector can be either VIRTIO_NET_FF_MASK_TYPE_IPV4
+or VIRTIO_NET_FF_MASK_TYPE_IPV6. If the third selector exists, the third
+selector can be either VIRTIO_NET_FF_MASK_TYPE_UDP or VIRTIO_NET_FF_MASK_TYPE_TCP.
+For example, to match a Ethernet IPv6 UDP packet,
+\field{selectors[0].type} is set to VIRTIO_NET_FF_MASK_TYPE_ETH, \field{selectors[1].type}
+is set to VIRTIO_NET_FF_MASK_TYPE_IPV6 and \field{selectors[2].type} is
+set to VIRTIO_NET_FF_MASK_TYPE_UDP; accordingly, \field{selectors[0].mask[0-13]} is
+for Ethernet header fields, \field{selectors[1].mask[0-39]} is set for IPV6 header
+and \field{selectors[2].mask[0-7]} is set for UDP header.
+
+When there are multiple selectors, the type of the (N+1)\textsuperscript{th} selector
+affects the mask of the (N)\textsuperscript{th} selector. If
+\field{count} is 2 or more, all the mask bits within \field{selectors[0]}
+corresponding to \field{EtherType} of an Ethernet header are set.
+
+If \field{count} is more than 2:
+\begin{itemize}
+\item if \field{selector[1].type} is, VIRTIO_NET_FF_MASK_TYPE_IPV4, then, all the mask bits within
+\field{selector[1]} for \field{Protocol} is set.
+\item if \field{selector[1].type} is, VIRTIO_NET_FF_MASK_TYPE_IPV6, then, all the mask bits within
+\field{selector[1]} for \field{Next Header} is set.
+\end{itemize}
+
+If for a given packet header field, a subset of bits of a field is to be matched,
+and if the partial mask is supported, the flow filter
+mask object can specify a mask which has fewer bits set than the packet header
+field size. For example, a partial mask for the Ethernet header source mac
+address can be of 1-bit for multicast detection instead of 48-bits.
+
+\subparagraph{VIRTIO_NET_RESOURCE_OBJ_FF_RULE}\label{par:Device Types / Network Device / Device Operation / Flow filter / Resource objects / VIRTIO_NET_RESOURCE_OBJ_FF_RULE}
+
+Each flow filter rule resource object comprises a key, a priority, and an action.
+For the flow filter rule object,
+\field{resource_obj_specific_data} and
+\field{resource_obj_specific_result} are in the format
+\field{struct virtio_net_resource_obj_ff_rule}.
+
+\begin{lstlisting}
+struct virtio_net_resource_obj_ff_rule {
+        le32 group_id;
+        le32 classifier_id;
+        u8 rule_priority;
+        u8 key_length; /* length of key in bytes */
+        u8 action;
+        u8 reserved;
+        le16 vq_index;
+        u8 reserved1[2];
+        u8 keys[][];
+};
+\end{lstlisting}
+
+\field{group_id} is the resource object ID of the flow filter group to which
+this rule belongs. \field{classifier_id} is the resource object ID of the
+classifier used to match a packet against the \field{key}.
+
+\field{rule_priority} denotes the priority of the rule within the group
+specified by the \field{group_id}.
+Rules within the group are applied from the highest to the lowest priority
+until a rule matches the packet and an
+action is taken. Rules with the same priority can be applied in any order.
+
+\field{reserved} and \field{reserved1} are reserved and set to 0.
+
+\field{keys[][]} is an array of keys to match against packets, using
+the classifier specified by \field{classifier_id}. Each entry (key) comprises
+a byte array, and they are located one immediately after another.
+The size (number of entries) of the array is exactly the same as that of
+\field{selectors} in the classifier, or in other words, \field{count}
+in the classifier.
+
+\field{key_length} specifies the total length of \field{keys} in bytes.
+In other words, it equals the sum total of \field{length} of all
+selectors in \field{selectors} in the classifier specified by
+\field{classifier_id}.
+
+For example, if a classifier object's \field{selectors[0].type} is
+VIRTIO_NET_FF_MASK_TYPE_ETH and \field{selectors[1].type} is
+VIRTIO_NET_FF_MASK_TYPE_IPV6,
+then selectors[0].length is 14 and selectors[1].length is 40.
+Accordingly, the \field{key_length} is set to 54.
+This setting indicates that the \field{key} array's length is 54 bytes
+comprising a first byte array of 14 bytes for the
+Ethernet MAC header in bytes 0-13, immediately followed by 40 bytes for the
+IPv6 header in bytes 14-53.
+
+When there are multiple selectors in the classifier object, the key bytes
+for (N)\textsuperscript{th} selector are set so that
+(N+1)\textsuperscript{th} selector can be matched.
+
+If \field{count} is 2 or more, key bytes of \field{EtherType}
+are set according to \hyperref[intro:IEEE 802 Ethertypes]{IEEE 802 Ethertypes}
+for VIRTIO_NET_FF_MASK_TYPE_IPV4 or VIRTIO_NET_FF_MASK_TYPE_IPV6 respectively.
+
+If \field{count} is more than 2, when \field{selector[1].type} is
+VIRTIO_NET_FF_MASK_TYPE_IPV4 or VIRTIO_NET_FF_MASK_TYPE_IPV6, key
+bytes of \field{Protocol} or \field{Next Header} is set as per
+\field{Protocol Numbers} defined \hyperref[intro:IANA Protocol Numbers]{IANA Protocol Numbers}
+respectively.
+
+\field{action} is the action to take when a packet matches the
+\field{key} using the \field{classifier_id}. Supported actions are described in
+\ref{table:Device Types / Network Device / Device Operation / Flow filter / Device and driver capabilities / VIRTIO_NET_FF_ACTION_CAP / flow filter rule actions}.
+
+\field{vq_index} specifies a receive virtqueue. When the \field{action} is set
+to VIRTIO_NET_FF_ACTION_DIRECT_RX_VQ, and the packet matches the \field{key},
+the matching packet is directed to this virtqueue.
+
+Note that at most one action is ever taken for a given packet. If a rule is
+applied and an action is taken, the action of other rules is not taken.
+
 \subsubsection{Legacy Interface: Framing Requirements}\label{sec:Device
 Types / Network Device / Legacy Interface: Framing Requirements}
 
diff --git a/introduction.tex b/introduction.tex
index 0d84927..9c57af8 100644
--- a/introduction.tex
+++ b/introduction.tex
@@ -63,6 +63,14 @@ \section{Normative References}\label{sec:Normative References}
 	IEEE Standard for Ethernet,
 	\newline\url{https://doi.org/10.1109/IEEESTD.2022.9844436},
 	IEEE 802.3-2022\\
+	\phantomsection\label{intro:IEEE 802 Ethertypes}\textbf{[IEEE 802 Ethertypes]} &
+	IEEE 802 Ethertypes,
+	\newline\url{https://www.iana.org/assignments/ieee-802-numbers/ieee-802-numbers.xhtml},
+	IANA\\
+	\phantomsection\label{intro:IANA Protocol Numbers}\textbf{[IANA Protocol Numbers]} &
+	IANA Protocol Numbers,
+	\newline\url{https://www.iana.org/assignments/protocol-numbers},
+	IANA\\
 	\phantomsection\label{intro:SAM}\textbf{[SAM]} &
         SCSI Architectural Model,
         \newline\url{http://www.t10.org/cgi-bin/ac.pl?t=f&f=sam4r05.pdf}\\
-- 
2.34.1

