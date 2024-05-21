Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2063.outbound.protection.outlook.com [40.107.244.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B00770FD
	for <virtio-comment@lists.linux.dev>; Tue, 21 May 2024 12:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716294657; cv=fail; b=AtALItB6qW5NzwsBtZ3bzMjpDM3M9ZoLWMYNd2moq4rA/jH+ZiTLkvvDXdGqZe5e2/jgI58JXBw52SZrHfbUuC2tygHPF3pstyKzuQ5DNZbODHtvtlrQHSzgKhAmm/UTP/WYWEX3NtN3JqM+debi6ka6V49Vf+wln65F4XO7Kdg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716294657; c=relaxed/simple;
	bh=AQq3Mv4FTMblAoinfajmeb1RnnDuDlyUVUbwZ+Eujo0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F4na4wWqgDb1TKsP81+LyyWN8KhKQY+GYJKiDXVhetw9mBV/2lfc/DhcEWPlJmN5zZ14KArfyRV9vyiHTFJXfg2wLTPqEqkUy023+hDsYHEBLd85ZMq7wpqeDmXqTmf3C74Iqo7jfMVp0evk/4lJ9/rr0liEK8qUpjG47c2s/os=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=lRlTmsdS; arc=fail smtp.client-ip=40.107.244.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="lRlTmsdS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OxV8tTcW4q90u73SHbRFV/TUCawu7ZNi7N8z5plSRWk0rzJ9JWSUQxkZOCDXOPY4AY2FBut54sbS9EH+PqHffbADyKF82O+SV6UWCK/RjeuNEk3T0Ue2XXBBQEdDABSvUKvTicpt4Ph0CDLx4tfPNUgCKAEg3AhRT9kAzXFaOdIif63OffDnWcK8BTy4ivfiqDvotQJ5HTunPUOUMlNAn0RguvP+W0SjMumo/MMOANMuOm+WszkjkWsb+4dx/NeiFfiJjtYN9hmC4RxfevM4snvrZhw4qRAqfyrlvlvrkggCwQ59e3I2hUtfft3yrWlJo9xZcXHUtg2OiOxKlByJzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tQvx42ar7asP5hpAXBeMQrVJIi+0sKxJk90fJ9HMVPw=;
 b=hAPEIneDYm/4BlSvk7J/63QwiYngq4ntvMzGq0K1FgvAwxXTts3iAraKpSSxY/xhJkSPOwCTbxVOW+YgrALpUtXS+TlKecVbDMAdCbgqX3obHpclEFEcJwYXqvSr6XGqlSwOQ/LDGcIeEmPOKnarC7h9ZsUfwJEEP63rdntF9QSqRHfJzEuetDEbFa+lWUFP3iiZIWX1rEFpx15v06vf6ZpSaA953EyCvoerRjvOxQPAG6wIz06a4CN28+oaLJfvlZARp4hJeFImkSX/vJBMx/Lyw3QmoZWcGD4P/RLUXjtkKVrFedykt76ge7RQff+F2KRFd1pslW442L0r9dbYqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tQvx42ar7asP5hpAXBeMQrVJIi+0sKxJk90fJ9HMVPw=;
 b=lRlTmsdSb0XUvvGNHofiqFkiNGoWhi87nLvzQnaaBcWnWuYWniW2Goc11X2GZoSQxZHt5X2oOvPbbuFMvG04meAl1pS8x/DQtstzZr4PXTnXjsOvaa3hefEved3T3rCsZdp4YmwcdWkM+3NewuFd8i3u9ed9HOdKX++YjDW2bXgtcAUZiKWMR9OwRnaKs47I4dxUvLJuAHD6jm3cdg9LjAjlMWRAkttGZ+FFQFVrCt1rDvWXBmdys6PO4SAM/jUSVMOa7EFhURdHTJUihoKjz0b1EufK3cUufc14GZcc1e0+hXAIsQ9nLkMB9DKJRMETC8QTmRltJpIEHewAPSIbBQ==
Received: from PH0PR07CA0067.namprd07.prod.outlook.com (2603:10b6:510:f::12)
 by IA0PR12MB7674.namprd12.prod.outlook.com (2603:10b6:208:434::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Tue, 21 May
 2024 12:30:46 +0000
Received: from SN1PEPF000252A0.namprd05.prod.outlook.com
 (2603:10b6:510:f:cafe::31) by PH0PR07CA0067.outlook.office365.com
 (2603:10b6:510:f::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36 via Frontend
 Transport; Tue, 21 May 2024 12:30:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SN1PEPF000252A0.mail.protection.outlook.com (10.167.242.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7611.14 via Frontend Transport; Tue, 21 May 2024 12:30:45 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 21 May
 2024 05:30:23 -0700
Received: from vr-arch-host06.mtvr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 21 May 2024 05:30:19 -0700
From: Parav Pandit <parav@nvidia.com>
To: <virtio-comment@lists.linux.dev>, <mst@redhat.com>, <cohuck@redhat.com>
CC: <hengqi@linux.alibaba.com>, <sburla@marvell.com>, <shahafs@nvidia.com>,
	<si-wei.liu@oracle.com>, <peter.hilber@opensynergy.com>,
	<jasowang@redhat.com>, <xuanzhuo@linux.alibaba.com>, Parav Pandit
	<parav@nvidia.com>
Subject: [PATCH v10 08/13] virtio-net: Add theory of operation for flow filter
Date: Tue, 21 May 2024 15:29:32 +0300
Message-ID: <20240521122937.2004180-9-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A0:EE_|IA0PR12MB7674:EE_
X-MS-Office365-Filtering-Correlation-Id: ee6f0c5b-247d-4f00-fc25-08dc7991d6cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|82310400017|376005|36860700004|1800799015;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eCdK7cYUUUSk1/JgPrtWdA0Is74S0SFt8+bFnraeUG77e1ByBc3daF2I5eCs?=
 =?us-ascii?Q?SgrZiAHTN++LnGYtBsdOKReIX+xLLj1J5TNlmfhwApZBsP3lhoOa8dHnsTAT?=
 =?us-ascii?Q?Gj8mqkjrOn34Dje2VWKt8PtSL+lSW9yfVkAe5oSSkIeIIBJTBSBM240qw/Wo?=
 =?us-ascii?Q?HPvjAgC1dKguLJa2EBR4pXD/JRapFDI7ay/jX2nE7qiCf71PilmFxEq9uUDo?=
 =?us-ascii?Q?0ckBPHOliE9mbz2Nltxrzzy6iijn7rvWqedxtnbmvg7EJn0co9Qi8ua4C1kM?=
 =?us-ascii?Q?/5vcM5ZqpREZRZf3ID14yZ1L3cqWUv+JYbgUapHB2Rubyt2PdM19NSBOI9MU?=
 =?us-ascii?Q?PgZsDt9E+cjOH1Db+jGdRYnbOwbEys78h2yUioD2bNWdiFiHUSyWgTWL2Hrk?=
 =?us-ascii?Q?XLQJhonfHyArZZtk2QvaHeKAD3TYzHXG+vRnYpSL5ocQifnmqthGYd6CndWF?=
 =?us-ascii?Q?c4wDGZGjQi7m8FNdZjE4REKne7qcyQAxan+jyixbQX67Hoq+zHVkOMWmpSg6?=
 =?us-ascii?Q?COcP5lM6zMVb6gdFpduj0/lqIUri4TY0O9moXTo7I5tzglTV7EYy8ZwbEdfb?=
 =?us-ascii?Q?qqUMSEQHr0vjgQVSeRHHgas2fgdhX8RhfG08hy2yY++qEmTLv4LLANO/bxEW?=
 =?us-ascii?Q?ij0RV1BTt8Bb7sB2uj0ynvpnpcXEsdqckCagQ/7ouA2FFcYIs00stponLEvz?=
 =?us-ascii?Q?W38pe5Qi8YyQqlv5iYX+o8JOJVE8KeoopiTQpc7fTj4P5Ly883qcdz6i/uJc?=
 =?us-ascii?Q?bNTUHeS9sjvJ+1hEgdGwWDDsuxUrp1l+l+TFu4ExnKvMFiaZC5xm9J7FVSKX?=
 =?us-ascii?Q?qFvnTXPe+GfMNtCSHiDMwv0EQQls68lbL+4N10PFS2uD0pY32o3qXp4NSOXL?=
 =?us-ascii?Q?57jT9z+NkMEBv3+Oybp5Ev4x0K8QdpANAIZdNls/xXCLas6WZW8v1V0yTZbo?=
 =?us-ascii?Q?WIv/IaYjfVs4y0jBS8jtpra2JWXi/MgSj8al6bWjYE9dyD3Ia0p0Cut6UBuh?=
 =?us-ascii?Q?I5Pi34o2yQIRsc4ziGKpStUC+PT8vVCLm9gUrPokLV6SGCGU982kzeNnLs2a?=
 =?us-ascii?Q?KYgH3NBZ193YdOZ+pm+cmcOYSO0lp+SJaWKe0uVViKlHa9UBYINNdIRY5ico?=
 =?us-ascii?Q?HTwxTRvRh+Us26Isuran0EidoktLL4mQ/IZAlng7sblmKb1YCt1EUHhyO6G0?=
 =?us-ascii?Q?8Z468SrXUDKNib3PpRy4aeTvwh9J03IfOCMik6BwyRNSKSocEHtu6+VtKN2I?=
 =?us-ascii?Q?bc+hd9TE9SKGSbN/VLxkPzojuW7dxyZleXYazXRyL8qXgc8vYq2bghQYAkJj?=
 =?us-ascii?Q?1h74bDzYGg5z0JehDLuuPPNI785LeAo6W7/MmHP537UBYRJb3TV1DllB/02f?=
 =?us-ascii?Q?hfm8jxovmd4rzFVL5J/zuuPD31G6?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(82310400017)(376005)(36860700004)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2024 12:30:45.9025
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee6f0c5b-247d-4f00-fc25-08dc7991d6cc
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000252A0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7674

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

