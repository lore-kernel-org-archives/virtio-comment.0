Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2066.outbound.protection.outlook.com [40.107.96.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2ED6146D71
	for <virtio-comment@lists.linux.dev>; Tue,  4 Jun 2024 13:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717507812; cv=fail; b=HY+OsxnzIjfnRRsKg9mBvNUazvYAs5F2N28lVXXiNECrS0ER85Zjs/uS169fenUV+pzXMeR4wGA6MUCKTzg6wYQ8rtW6w6SdSvk68Nc7VB796tRFEHOtooHzr0WZkfRy4ICOyy6rnyZopzryg8OurNjR9BDFtyllBIVaS4YCMN4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717507812; c=relaxed/simple;
	bh=AQq3Mv4FTMblAoinfajmeb1RnnDuDlyUVUbwZ+Eujo0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d5IzP0ZHpVc2wjJiWeuurxaQypH9UHYtxIqoDsTkFnO2r6N5oPjAEEjeu5E6AUoTQbtzHTjiOtEUBytRCvQchPJdSz4jWIugWtJyhJL/JadLvj4qCdicv8YKsYIvBPULfMgdh97V98xjJc6tC0jGPtAjeTB++sd3gTlRx9m3kz4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Geix8zSo; arc=fail smtp.client-ip=40.107.96.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Geix8zSo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZBQPAKjJBPY94NnAwprPx9TykFAywff4kmB/dHCcry0HDFCS8Sw6WYC1hbjEMLqX8tpcBlk+klM81idhRc5dd2D8cIIqlCyTFTdXcC2Ouz0rrrYsDz8Mmw0VmyQHnafjglCxJzAACP7vy4zA4fq6oA3y4Z/unQ6MWr7ABI1Uj33ZXKvgwX+YuTP3zVWEBxTp01CA8Xe1dbZ7ZjpZHn3Y48sNw4CwOtk6RjBoBQhuVZ3caNOwP3KsDUAKScXSh3XkqLXj23LOfRcTZRWhwKrvw9tuz43l1iWW4hXCC8doXVXBPBC2Ut+Eeae3ve+J5wG2yz22PxtTr5GSBPWJCL4Slg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tQvx42ar7asP5hpAXBeMQrVJIi+0sKxJk90fJ9HMVPw=;
 b=cCxUyOnQ7qdgmGtsodob+IydtwCrooItGq8pJ0ouZ1C1DEUOJnO8ADeXc7pWOTMpAgeMjJ9Gw8ZhZry6gEYbop5fAs8KSOw0S+nMTgrEfKhqMneiTcGDT+BM1bLkAA2zWw7ZuBonRRm7WMdodOuO1nMW86JhEdJRjLjNhHh4lLt5vMA+fsqxliT+WMHLqVNZFuexZDD4NKnJo9tv9S5odVew8/A/igGIUHpLRCgU/YABlB4Pdfuoxmy7u9+ygnMnA4FL8FvIS4YGrdIrkRjU7Kcq9yCK1lWQJf/JId8D8q/f1jZw8JUGzCAVmCAh26Vy4ruEE2rD71/AfiWa37weaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tQvx42ar7asP5hpAXBeMQrVJIi+0sKxJk90fJ9HMVPw=;
 b=Geix8zSoerdHIQXXJpXlNP+6CFJrNjyff+/U/11UDwlGPNxj1M6u5JAFAYcwGU48tyclhPtLbYgpQiz4/uc59x1e69N3jAZBat4yvUGve0ivO8gkmLb81QyQjK8ss+bP/g7kQQ8vBMmxq26/XbaVNBkk4jL81KnsGEhZSGErH3CnlwPLPchITyuGEQKeirssSzwoUDXDV7uvk3pmU0Crf3kQeEFfylgNrgbYpcAfs7dZyxqan+AglBpMjLHCrimZ9IZe99CToyll2UcmkMS2U3NNTJm+p9d7QL4blJA2znW7MnzYYyKJT/D8wwqOqL3rqPYBAfF9cGzoHX2QTVFtQg==
Received: from BY5PR17CA0022.namprd17.prod.outlook.com (2603:10b6:a03:1b8::35)
 by IA1PR12MB6410.namprd12.prod.outlook.com (2603:10b6:208:38a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.19; Tue, 4 Jun
 2024 13:30:02 +0000
Received: from SJ5PEPF000001D6.namprd05.prod.outlook.com
 (2603:10b6:a03:1b8:cafe::51) by BY5PR17CA0022.outlook.office365.com
 (2603:10b6:a03:1b8::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.29 via Frontend
 Transport; Tue, 4 Jun 2024 13:30:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ5PEPF000001D6.mail.protection.outlook.com (10.167.242.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.15 via Frontend Transport; Tue, 4 Jun 2024 13:30:02 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 4 Jun 2024
 06:29:47 -0700
Received: from vr-arch-host06.mtvr.labs.mlnx (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 4 Jun 2024 06:29:44 -0700
From: Parav Pandit <parav@nvidia.com>
To: <virtio-comment@lists.linux.dev>, <mst@redhat.com>, <cohuck@redhat.com>
CC: <hengqi@linux.alibaba.com>, <sburla@marvell.com>, <shahafs@nvidia.com>,
	<si-wei.liu@oracle.com>, <peter.hilber@opensynergy.com>,
	<jasowang@redhat.com>, <xuanzhuo@linux.alibaba.com>, Parav Pandit
	<parav@nvidia.com>
Subject: [PATCH v11 08/13] virtio-net: Add theory of operation for flow filter
Date: Tue, 4 Jun 2024 16:28:58 +0300
Message-ID: <20240604132903.2093195-9-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D6:EE_|IA1PR12MB6410:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c05e017-4087-414d-c4ed-08dc849a702b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|82310400017|1800799015|376005|36860700004;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?u9nN0VUUOF9cXGwONocVqn8gAUbthB1La/fHadP4Qz6BURBPkYAJenV2DY1l?=
 =?us-ascii?Q?Fho69HFcofTqHrNEja8FQKhlgQ2vSY21ShQ9YSbJQRMn/co+5H+w+F5GMqct?=
 =?us-ascii?Q?Ls2HOQzlK2xPHA9PgcL03aOIppeDelg3OMIaJDu2HK5xPBOMytB5xs09BnBp?=
 =?us-ascii?Q?OlXBKNTlIqN9T1jnojePgefJ5GkMOF6m5UEB/0ZScl/a1aSOkVHPVZnfWTCc?=
 =?us-ascii?Q?djUWcegluzdsFZhm3rTYU1lwvD9OR6q6dgm1X8iw/n70mauIxX97K/yVutgr?=
 =?us-ascii?Q?ZpHLxF/GcFzHokKsWdSWHPvxEaJKFqL13emqvjFCsl3S0E1dovgkRw9zonmk?=
 =?us-ascii?Q?BREjf4WbOHT1iKRQwMGgHajksv3vDbMJd5lBKCsFSqFRpvT1rOGjrQbIi2Ka?=
 =?us-ascii?Q?uClRdXUKT44VBh0HBZB30YZbxvYn8YzArGFWTBdlqgjgnabxg8ru0TzJPuHs?=
 =?us-ascii?Q?sOUuPeFvKjxezzYG4wHDNmbbjEj4e34ALmH41JTTFTR1Bnst/9KumBv3BnCW?=
 =?us-ascii?Q?Kb6Zrz4apTUIRbR0FM/qQKb4LqX+oPJpw8zakGyXFM5uihKulP1nBiqAm07A?=
 =?us-ascii?Q?cBrFAEMwtd7dcIPRa1w05WKP3o5QRtGIQp5JloNIeUcOHVYB16DM+lJi/AjG?=
 =?us-ascii?Q?lEQG335Ws1t5F49HX0MPcFyXHlLRKFguYj/L2LSX4gG9FwvLj/DB7eWEG5V2?=
 =?us-ascii?Q?NECdm/SIBnnSKQwBHpjPVMZ8zeV0YSf2Uja43Jpc/cpjWcRUn/QRoaqVDcwU?=
 =?us-ascii?Q?mwtjh//cevhdzN3Con5OPOw+5O1Fase+CmXSZxo+lmtkGWGTg/MaLTu2i7a2?=
 =?us-ascii?Q?Qo7nNUEXkmPQ2D/o0Dfh92jTuC+AWwutDXLsUQTb2GmwpsSd23JHOVdBsiOS?=
 =?us-ascii?Q?LuaoJjIwBPL2v50N93tX6PEWIa8bn0gL5GIiuuNcSAw/6S6gOv5Ns3mnYn+M?=
 =?us-ascii?Q?4zeBNFcnztKh1N/H4v0E7fTn5CKQKc8qSu19zEI0pTfc0NrBNXx4msajs2K2?=
 =?us-ascii?Q?vJ4pvp6PUA92dch4i+aP86R8Vx9WNNvgfn0LCFtSBlw+FPiTxuXKmwz4hKBx?=
 =?us-ascii?Q?xii+azJvjNt1Hm4qEHQVCj8YjQy/XZaLDNZ3s0jOdho9P64EfoQM9Pbqzpqg?=
 =?us-ascii?Q?v0V8IZLwomLcvFVX4HiAka3Lvdf9jhLh3w4DI4OCej3ADrmaWAkLd67opP/Z?=
 =?us-ascii?Q?x7D23cPd/2M4UOnqXj5UiJxD+/eMTONyau4EeclDcKLrO9dRiICHZ6onMeDJ?=
 =?us-ascii?Q?GiOnOpHTTUPHzu8MpZQwMewZcmUUOcCXrnJo+c48LkUloFYqGoq7DWZ14Fym?=
 =?us-ascii?Q?0s55n+cVNFBkoIAC/32m55AiVEkZKFMA2+FtDDx03KcvdrpVpvwyaPgbNOu7?=
 =?us-ascii?Q?h5kedbyyDuqTzMNqfCKFQv/gmtfe?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(82310400017)(1800799015)(376005)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2024 13:30:02.1045
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c05e017-4087-414d-c4ed-08dc849a702b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001D6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6410

Currently packet allow/drop interface has following limitations.

1. Driver can either select which MAC and VLANs to consider
for allowing/dropping packets, here, the driver has a
limitation that driver needs to supply full mac
table or full vlan table for each type. Driver cannot add or
delete an individual entry.

2. Driver cannot select mac+vlan combination for which
to allow/drop packet.

3. Driver cannot not set other commonly used packet match fields
such as IP header fields, TCP, UDP, SCP header fields.

4. Driver cannot steer specific packets based on the match
fields to specific receiveq.

5. Driver do not have multiple or dedicated virtqueues to
   perform flow filter requests in accelerated manner in
   the device.

Flow filter as a generic framework overcome above limitations.

As starting point it is useful to support at least two use cases.
a. ARFS
b. ethtool ntuple steering

In future it can be further extended for usecases such as
switching device, connection tracking or may be more.

The flow filter has following properties.

1. It is an extendible object that driver can create, destroy.
2. It belongs to a flow filter group.
3. Each flow filter rule is identified using a unique id,
   has priority, match key, destination(rq) and action(allow/drop).
4. Flow filter key also refers to the mask to learn which fields
   of the packets to match.

This patch adds theory of operation for flow filter functionality.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/179
Signed-off-by: Parav Pandit <parav@nvidia.com>
Signed-off-by: Heng Qi <hengqi@linux.alibaba.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
changelog:
v9->v10:
- updated to refer to device resource object
v6->v7:
- addressed comments from Cornelia
- plenty of grammar corrections suggested by Cornelia
- removed stale reference to flow filter virtqueue
- removed incorrect stale hunk of a label
- removed dependency on feature bit and control vq
- rebased to use device capabilities and device resources
v4->v5:
- to avoid feature bit overlap with rss context patch, pick next
  unique bit 65
v3->v4:
- removed flow filter virtqueue section as dynamic queues are
  not supported currently
v2->v3:
- removed dependency on the dynamic queue creation as the
  infrastructure is not yet ready
v1->v2:
- fixed comments from Heng
- grammar corrections
- spelling corrections
---
 device-types/net/description.tex | 68 ++++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index e65cdd5..58d0692 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -2411,6 +2411,74 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
 of the driver's records. In such cases, the driver should allocate additional
 space for the \field{command-specific-result} buffer.
 
+\subsubsection{Flow filter}\label{sec:Device Types / Network Device / Device Operation / Flow filter}
+
+A network device can support one or more flow filter rules. Each flow filter rule
+is applied by matching a packet and then taking an action, such as directing the packet
+to a specific receiveq or dropping the packet. An example of a match is
+matching on specific source and destination IP addresses.
+
+A flow filter rule is a device resource object that consists of a key,
+a processing priority, and an action to either direct a packet to a
+receive queue or drop the packet.
+
+Each rule uses a classifier. The key is matched against the packet using
+a classifier, defining which fields in the packet are matched.
+A classifier resource object consists of one or more field selectors, each with
+a type that specifies the header fields to be matched against, and a mask.
+The mask can match whole fields or parts of a field in a header. Each
+rule resource object depends on the classifier resource object.
+
+When a packet is received, relevant fields are extracted
+(in the same way) from both the packet and the key according to the
+classifier. The resulting field contents are then compared -
+if they are identical the rule action is taken, if they are not, the rule is ignored.
+
+Multiple flow filter rules are part of a group. The rule resource object
+depends on the group. Each rule within a
+group has a rule priority, and each group also has a group priority. For a
+packet, a group with the highest priority is selected first. Within a group,
+rules are applied from highest to lowest priority, until one of the rules
+matches the packet and an action is taken. If all the rules within a group
+are ignored, the group with the next highest priority is selected, and so on.
+
+The driver controls the flow filter rule, classifier and group resource objects using
+administration commands described in
+\ref{sec:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device resource objects}.
+
+\paragraph{Packet processing order}\label{sec:sec:Device Types / Network Device / Device Operation / Flow filter / Packet processing order}
+
+Note that flow filter rules are applied after MAC/VLAN filtering. Flow filter
+rules take precedence over steering: if a flow filter rule results in an action,
+the steering configuration does not apply. The steering configuration only applies
+to packets for which no flow filter rule action was performed. For example,
+incoming packets can be processed in the following order:
+
+\begin{itemize}
+\item apply steering configuration received using control virtqueue commands
+      VIRTIO_NET_CTRL_RX, VIRTIO_NET_CTRL_MAC and VIRTIO_NET_CTRL_VLAN.
+\item apply flow filter rules if any.
+\item if no filter rule applied, apply steering configuration received using command
+      VIRTIO_NET_CTRL_MQ_RSS_CONFIG or as per automatic receive steering.
+\end{itemize}
+
+Some incoming packet processing examples:
+\begin{itemize}
+\item If the packet is dropped by the flow filter rule, RSS
+      steering is ignored for the packet.
+\item If the packet is directed to a specific receiveq using flow filter rule,
+      the RSS steering is ignored for the packet.
+\item If a packet is dropped due to the VIRTIO_NET_CTRL_MAC configuration,
+      both flow filter rules and the RSS steering are ignored for the packet.
+\item If a packet does not match any flow filter rules,
+      the RSS steering is used to select the receiveq for the packet (if enabled).
+\item If there are two flow filter groups configured as group_A and group_B
+      with respective group priorities as 4, and 5; flow filter rules of
+      group_B are applied first having highest group priority, if there is a match,
+      the flow filter rules of group_A are ignored; if there is no match for
+      the flow filter rules in group_B, the flow filter rules of next level group_A are applied.
+\end{itemize}
+
 \subsubsection{Legacy Interface: Framing Requirements}\label{sec:Device
 Types / Network Device / Legacy Interface: Framing Requirements}
 
-- 
2.34.1

