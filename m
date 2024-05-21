Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2046.outbound.protection.outlook.com [40.107.244.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8834628E7
	for <virtio-comment@lists.linux.dev>; Tue, 21 May 2024 12:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716294662; cv=fail; b=kV6j2ajGZdhpJOd1LtBXNj/U8EU8ovij/WBI5pOjjxzcaMVVpsM2uZl6CLdXUWnk2mKjhxMeqYKpypwXiyNyuatoehiwzw3q+Nq3JxA+dVA05uQeAqp0KsBzhDz3RUDw2JU9MVrz2KwQ3sfTAadhubdx4hhslXMqj54+OPyqpTE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716294662; c=relaxed/simple;
	bh=xvXc8wvpUJQf2sjAAimpaZzI8nJ4P+PlncYRN92KHZE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ughQdxpeXSvreC0HUmtZKTY3kTqNEPO5c87UBlRnx3WlGtKLpH/BKZApoRHA2AFkad04rQQnRaMkaLN7JK9hPREzgtpdGpREtJhM9ABd/aULpVQric0cv09bnTWMReLoxCHWYnIu4fM1dV49iCDBxBKqIK0vyf/P7t1M31z3gp8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Kdnr3GXW; arc=fail smtp.client-ip=40.107.244.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Kdnr3GXW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bwfTrxW2h2IgscSZiG7eMGyfe3mYhJs6gehqWsROgrLvgJAiniApPJkF89TkRxiay3YA3/2cR8jrOO84tWtW6YsT4s5BEZ2igPcCq5qQ9OH9xeH9Uh+1ibIOIzIsOhjsg6IQG7WpR1etjMp/32eFZa7arsMAKhqKei/DLulDUd+lQLnKBhZ3p/Ta8zUHjU00u7eakzXs5pJ5ktP6Dn8oPP2HDBDQ5rj25QQMDvWjpeI8aP8RBDwAruyDRwA75V1bLwgzql0gatBB45YhceOIpTRsW9Y6wA2nWUmHn94RpWzkITcDRxDg5834gSYukbv3FANfVS+pWIhYJZYmNKcdgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/VUUR7j4/mtEPSb0JSjgbTIkGhkougQ29RvyL3gzVLQ=;
 b=QVn9fYpbKHdXhEJaTSLBh2kuBSl7oRpjNSvyx4vkBWS91hx3ZA4BNNlFG9TIRK3FJwFgTfkQkf2HvHDKzf/0It67lYoZjRoFrZWHOoWwnbHpoA+uXjoXo/qJuurGCH6S3nys6FqPdUCHN+7WHmYqMUiaEfsisWcTMWyYAvbjXfj8quteBaYIe9baKT0N6tBR/JfdHrR/XKUngUSVqzBiuSRYpiWRKashN2zhlB3MCdoQYyxlHjeb6vqmrRGout29eqGxagcS4LMLdYDHoNVdzwpkhuMYSYmL48NhpJY+MZ9bFWJgxVS5VjLQ33yfxjcdLO7EErZvEAExFeOXFSOBQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/VUUR7j4/mtEPSb0JSjgbTIkGhkougQ29RvyL3gzVLQ=;
 b=Kdnr3GXWa/fI5aZ9RkZ/7R42ro4cXngBPpdWDDDUBvfO1JQ3Jfy5Njlzdx3WeE4gndHJb+RhK5szaOOZzPqs2y06Y6w1Y+DB09KEcccPbrIVEyBgGc1wD+KY49v5Zm8vyvKL7Ku0oqbMO69Zzkqy64ywiL9K6ep0tznfpjQ+vE+oQ7zLsN7JPGO+sm/JTzHuIBYyRXzdl+QS4hDoPm5J8yONeTrg6idnJEU8SX/1RfSr+in98E9+/hUVzjMsfww3JS+2TWCyA4y7pEVTZVM2GZKWsD/5TTSMLwew0VMgx/vzwuzTG7tnibsTcO4ICwk6YITrPfckwA5FLtyOTawx7w==
Received: from MN2PR15CA0020.namprd15.prod.outlook.com (2603:10b6:208:1b4::33)
 by BL3PR12MB6425.namprd12.prod.outlook.com (2603:10b6:208:3b4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Tue, 21 May
 2024 12:30:55 +0000
Received: from BL6PEPF00022575.namprd02.prod.outlook.com
 (2603:10b6:208:1b4:cafe::3a) by MN2PR15CA0020.outlook.office365.com
 (2603:10b6:208:1b4::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35 via Frontend
 Transport; Tue, 21 May 2024 12:30:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL6PEPF00022575.mail.protection.outlook.com (10.167.249.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7611.14 via Frontend Transport; Tue, 21 May 2024 12:30:55 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 21 May
 2024 05:30:30 -0700
Received: from vr-arch-host06.mtvr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 21 May 2024 05:30:26 -0700
From: Parav Pandit <parav@nvidia.com>
To: <virtio-comment@lists.linux.dev>, <mst@redhat.com>, <cohuck@redhat.com>
CC: <hengqi@linux.alibaba.com>, <sburla@marvell.com>, <shahafs@nvidia.com>,
	<si-wei.liu@oracle.com>, <peter.hilber@opensynergy.com>,
	<jasowang@redhat.com>, <xuanzhuo@linux.alibaba.com>, Parav Pandit
	<parav@nvidia.com>
Subject: [PATCH v10 10/13] virtio-net: Add flow filter group, classifier and rule resource objects
Date: Tue, 21 May 2024 15:29:34 +0300
Message-ID: <20240521122937.2004180-11-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF00022575:EE_|BL3PR12MB6425:EE_
X-MS-Office365-Filtering-Correlation-Id: cb1e4c2d-199d-48bc-2180-08dc7991dc73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|82310400017|36860700004|376005|1800799015;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZA9mFcyaeCp46xq92FhJgFu6PHFz/Tc6O1vfh7IqzEdu7Wr6yIx3nLIWoonS?=
 =?us-ascii?Q?dLSJw2NgWbPqYznDp2QF4PC/w0/65iOfRbCany8TSWdn1v9V0gKGpFm0A5wn?=
 =?us-ascii?Q?S8lF1MIusEQmwr8tya3XR6du5uj8Z5/5H1/1DbxDbWOLku41knzQcfJUIFIs?=
 =?us-ascii?Q?rWG3F0kPrYgpC9B0F4X4xBjQpLFHaricKMzQc+k+y9OdarHkUA4mAVliFwz7?=
 =?us-ascii?Q?TMU14mHY87ba6CUJcSFqEoOVy1FHHUPHNBA3ZSTBBu4JdH+48sa5nFcJ5pvF?=
 =?us-ascii?Q?6xJEuk8y7BY/+TYjyX4tT3SZZptnwKV8yPCvpvwkgrZPvrI496IssbvQRatc?=
 =?us-ascii?Q?hYrZQRlV4GEkY0iBSlwFFjfSAT6wYQ2dcBDsuakRCnxMFxyrqJWhuAiCdnhE?=
 =?us-ascii?Q?nirCVIvKDEKlrk3CtRfKNQj+PoagI/9oHBaromVMR8E8THU30TrPHMbWXk9w?=
 =?us-ascii?Q?8QGwvCT3xCNAgxGmR/ZVUXRRskcJNxuj8bda8unYPiA+CaHTm/AfctFiZVDS?=
 =?us-ascii?Q?2GkZDLVRsUVT+T1EYh3TkMMWTQMMrYB5QRLb76Zhvnp3KVk4ROjVszYrQEF8?=
 =?us-ascii?Q?131iwt+58lxj0H2yhuFTTXaScNeJCZ1vLCTx5PyaxQiS8Kb0sqwGl+1O5YFb?=
 =?us-ascii?Q?BM93vu5XZFFxDHnXJx2+vrRiG881UCGjhEf+DAIth3R1gz40z9YJ2FAyKA89?=
 =?us-ascii?Q?T+pQ6T/DWZQL1QHn6ZK4aYloVkLm6whvf59SD6cJCEl98gGunNoIbCdRgvAq?=
 =?us-ascii?Q?0besRRKrUj5kzcvkYUdX8Kbqj2XDj737BjuSlsCShtcHGaDM7N062XxMkni7?=
 =?us-ascii?Q?kW39UK4Es+dINu5asQfWjWFyJ0ofq53b+AFbWbOUPqSzP68s3R4Y7VVl+YcR?=
 =?us-ascii?Q?HTkvRD1zUC4PZVV56dl8bU5yEAsyz+83P4oSnBk/pmrdSoVjn+SWf3Vi1VVm?=
 =?us-ascii?Q?IQMVMkIP4XOLHZVqi1omydxPQrXYmQzA7PrfsVZde+UUIL2zPpRHCNu+mnXm?=
 =?us-ascii?Q?KDK0ace2s4QmNHAr5C4V4DBqLFV9WJ5YZYFoOo6MRERnG5UOhsq+Oy2Zwhem?=
 =?us-ascii?Q?7uuFGnyF1OXNDf3FQcouLvkBAeKq4juL4r5YNg/aozMPaiCHtzeLVPH2gEFe?=
 =?us-ascii?Q?mYo2VziZBuC68+OHI5cLE1r6ZvDQ8t57zwGtv3P/OS6Q2EOnAf9o0hhEKDlX?=
 =?us-ascii?Q?vX8x6jtC6EZVVe5q/UGhrCBZDOwnpOX84Ns5weM5/tJt+38SlD6MvoklhElf?=
 =?us-ascii?Q?/JQvb19ZTby/qMAl1COJ7CfoB1FB3nsxbCGmQfczhoOCdELVPx+/qNFZfDhX?=
 =?us-ascii?Q?D08Jhfaa9tz817w/rWdnZ8QcH3TD8kOg3T4N4YRM0dN53Y04KqY7tu93YgAW?=
 =?us-ascii?Q?BoIfJevV4rY6Znm0suyF/z0cPaqH?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(82310400017)(36860700004)(376005)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2024 12:30:55.3488
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb1e4c2d-199d-48bc-2180-08dc7991dc73
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF00022575.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6425

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
index 1d22503..6168c96 100644
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

