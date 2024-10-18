Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2051.outbound.protection.outlook.com [40.107.223.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6152B20E328
	for <virtio-comment@lists.linux.dev>; Fri, 18 Oct 2024 12:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729254944; cv=fail; b=lyE/Nde7i24jTNiXqtSEit4sflVv+BzmANyuOhAU/hG1Zv22yPhNIOIL8W0mMgBv1DmnoENSOZlCuABsTO/C2Hdnal7SBA4G+gS7zzrQiTgGMCG4yBEv6OIZup0n3AlLUKedpmI86by6vTy2WDHkhgkBkdgpb3aFdCjmnr9b5Fc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729254944; c=relaxed/simple;
	bh=2ZRQIQ2l/Ytf24fuwVZcoZAJug4jKA+pRtuzFlpRrfM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qJ7pdOqmzCTQjdHLdvqn10cThWX3CmOoiRhhKM3lmXBB+6/Lx2uTjiZTcABToquV1lmwHAiTxEThLHxscGaUcqhj0orpYdJ52kpxbX95+NeM/6/3ERHcn9LT9V43NzJ+C7Km3gFJRZhzPOOolcy9GrLjLORL3TPezSpV3eADsQk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=AUfTZt/d; arc=fail smtp.client-ip=40.107.223.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="AUfTZt/d"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DfrR3621mFgULT1zp1JnVq85K7ZLgjPGM1hxW3jTLtUn0Pxs2iUFDItOJqCDYegcUoRxroAovz17CAOCg7Iv+1Yo9yb2a8NRA/dX3UZa8Um49fHxGsg+lT2iv2jmpvScyQm+G2sTQhGXi+9qsYtLh3pQnVDLoKrXyxAJn/nQtc419Ly8W30ChBuQ0yjwz1JpYzDp1V+T96dfzCK+4nNjitT6ivR4piBAi8TtpdoAqjMPbrwI5+9zRtKMkuXie9aMam53p0fNUYtWixqwOzGa71JJTMRMU893GGVsHhey/Flf8dEPdo4IXNB5hX8QM3TfsyN3MVFQHtUX6NoSWW5XEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pAtgX2I121AIal9OORUMeYaci/p7tbKxk4gYPr0LKXI=;
 b=x0Un1yU0urMyC3axwyFFVz4W+qPvM2ISL7QnTTZatEiVKW4w5E49alyxQZ2t8+I0Et0xpFFubjNzn3usmqQqGqvojW7eRNIWhufgFDj48jpPho8RNn7FnazEOxIvBzYuqCS3m/ThA2B5l66DKzkJh24yOLDxP78nXOMFo7UtWQvosoUeLz+4zVl+HtxoMKQADoEI+WsoZJ14SPo2ktcTRS7b5xmVP/e6K3bOh5w5fXUdrOUfzKZ1r7RieLqIvcvVdrvx+QI4XoSPeUyg/f0u6ZjEprnJftjUnKL/1uHO34z9q6AUjmpfG5OFG8ZGbG1P1qJXCI9+VR1OmuP9B/dfmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pAtgX2I121AIal9OORUMeYaci/p7tbKxk4gYPr0LKXI=;
 b=AUfTZt/dVLCbFOh2X/cDIwNBLggf9kRfn6ZvoDruXH6BVnSZbs/22Xlf452qP6ThUJD9kWID8bgFp/UAFBqGxbQ1kK7S9olMvs9xqK+WV47Ad6cFnAuyU9pafq1uHlfbTHHPbIQ4SgNhvojbeJbOz8dCb8D7NRh6PUwYN5KShv8WZ6eVhNyo3lMNIEE2icUDsQVCPRelv+tHFm06kGgU4TDp8nNuR/CypXy91ci0ilEmt4/usZGs3V8DkjJ4Q+tYd3IRmalJja45TP6z6WnUgq3+tPAQAqM8GloSZMTHRrfdOoiB82tVmEMjXhBfTgkPQ9JJmafrtbrCyAzJeygmdw==
Received: from BN9PR03CA0391.namprd03.prod.outlook.com (2603:10b6:408:111::6)
 by BY5PR12MB4113.namprd12.prod.outlook.com (2603:10b6:a03:207::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.24; Fri, 18 Oct
 2024 12:35:35 +0000
Received: from BN3PEPF0000B071.namprd04.prod.outlook.com
 (2603:10b6:408:111:cafe::57) by BN9PR03CA0391.outlook.office365.com
 (2603:10b6:408:111::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.20 via Frontend
 Transport; Fri, 18 Oct 2024 12:35:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN3PEPF0000B071.mail.protection.outlook.com (10.167.243.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8069.17 via Frontend Transport; Fri, 18 Oct 2024 12:35:33 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 18 Oct
 2024 05:35:17 -0700
Received: from vr-arch-host06.mtvr.labs.mlnx (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Fri, 18 Oct 2024 05:35:15 -0700
From: Parav Pandit <parav@nvidia.com>
To: <virtio-comment@lists.linux.dev>, <mst@redhat.com>, <cohuck@redhat.com>,
	<mvaralar@redhat.com>
CC: <shahafs@nvidia.com>, Parav Pandit <parav@nvidia.com>
Subject: [PATCH v1] virtio-net: editorial: Annotate structure field
Date: Fri, 18 Oct 2024 15:35:01 +0300
Message-ID: <20241018123501.432708-1-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B071:EE_|BY5PR12MB4113:EE_
X-MS-Office365-Filtering-Correlation-Id: 728b7673-a5fa-4235-c2fc-08dcef715c5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yViA4sWoFoFM9dqbihqU/ykI0A5ang9BWrACxeBlxlVEyUW7zpDE6HXNbSbu?=
 =?us-ascii?Q?s6tlRkTkjtEcYdbnV3BrpxCsORJR0jPUQGF1J2SmppvWF9YwMsCdtkHopXo4?=
 =?us-ascii?Q?rmnAX3atO59qiYqQBYCLP03ceO+xwik+Mp7P3vmjGgVcFSABvSuem9vjEXlT?=
 =?us-ascii?Q?wd0ZWWiv+o1PHB/WWiSa30VwBImSc5BfRv6KmIGNCtXgdkEjn6Bj+QSbp5qZ?=
 =?us-ascii?Q?+o2d5zNJMDFO5GFaPjM4aFMSHoXXLg4juP7A7R1JFpB8a0HbDtwJDnLXP4l/?=
 =?us-ascii?Q?evVwqEHcFQjrLenS5IQdCvsSITS6E3vUYPZIbr+OkiYdd3neIMf0djU4IzWv?=
 =?us-ascii?Q?KAVHYbDMGDG6hu+AytdbfBwTqxSRGmT/aD8a5EMLtUpUC5WU5dVbeu+P4R5o?=
 =?us-ascii?Q?SrNzcAkcsr1dgwHL7l5t8r20F+Ae19EeP4wocp/UF0hvVVKQKn6fuWtU1Dd5?=
 =?us-ascii?Q?9siitV+BnUzuA5Plq41I2Cj6h5fCEl5D7rq/qr95EvIOljogUikTcGi3/+Nf?=
 =?us-ascii?Q?P14jYa52rwXIg2j7siK4unEvsgXjsjpQ19snK1fSWiJinx37DcuDfNeDZpLR?=
 =?us-ascii?Q?xasMEvA6CB50RV49tLNGdhEDU77QjISM5W4TgQu68zKkjN3fav2vrd3JaKN8?=
 =?us-ascii?Q?mSyZF1FdO28MjZC4dOd973ZgJV27P7OyFpw4NdCsx/59MFC7oz6GB+Gpafss?=
 =?us-ascii?Q?yC3gOflmwaoXhX9XY4K3Ui30/O2iXQk6xCbCzFOnTj0dRa75awV/ZRLYn9Jo?=
 =?us-ascii?Q?MU2gEvRns2AxdNYWaOyqzXyWBo75Fu3nazj3damim4iMT4FhKh7JXLoCVfHr?=
 =?us-ascii?Q?MIEWktBd6RWDsWeKy6v4Rrg8vQSxUknNTKObCjVMlkFj4anuycrdULR4QbuZ?=
 =?us-ascii?Q?7oE3IIIPfHt7nHvTYBaG+syFWLo7b6M2vM5vElnEmpFG8VkCZlYzTK/BZhj3?=
 =?us-ascii?Q?m1N7wWy3XNcJFYWO1hchg9tC2r/AVhtcvwlwHDip215JGFbsmAZYYNrTwuTR?=
 =?us-ascii?Q?a3cJsV23yPAjTXidF2DFengxx2AowMiwiSxurFnZ20i7ZYqPdN1+LCEYeEAs?=
 =?us-ascii?Q?0bDN8RCvkVaWUpTN1PfTABbDL8MXfBX1YKSY9m5pvV6o+Q9r/RXVrq0Fcmk+?=
 =?us-ascii?Q?ycswUywEf5jiEldNmBfsu9W5KlVhdkasHeVuGdseqbCnaBcRj+quesTh8dIi?=
 =?us-ascii?Q?iLMXUuP+n/y4wABUVJ0aTliv9hMkVA70PSLpb25kXnhXECOokTSdgUc/IEPK?=
 =?us-ascii?Q?vqL1ZH0hhSJB1871o7b10DJJLurxdbZJGtEEBGGOCXfWhTmlhcC/9KxsEM2Y?=
 =?us-ascii?Q?QVughxhsbRs4t8tIVEFPaWkTEXYK5GbVN/Weta0u5g6DFQwY4yI/z0i3VOQY?=
 =?us-ascii?Q?fHRbLNyAlSCRKArZzDYIDvCvW/aajRm355ez9vooowP2SPFXkA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2024 12:35:33.7859
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 728b7673-a5fa-4235-c2fc-08dcef715c5f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B071.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4113

Field command-specific-data is a structure field. Annotate it
as a field so that generated pdf shows it accordingly.

Signed-off-by: Parav Pandit <parav@nvidia.com>

---
changelog:
v0->v1:
- addressed comments from Stefano
- fixed more places which were missing the annotation
---
 device-types/net/description.tex | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index b2a0d39..e45ecbd 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -1217,7 +1217,7 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
 #define VIRTIO_NET_ERR    1
 \end{lstlisting}
 
-The \field{class}, \field{command} and command-specific-data are set by the
+The \field{class}, \field{command} and \field{command-specific-data} are set by the
 driver, and the device sets the \field{ack} byte and optionally
 \field{command-specific-result}. There is little the driver can
 do except issue a diagnostic if \field{ack} is not VIRTIO_NET_OK.
@@ -1255,13 +1255,13 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
 commands:
 \begin{itemize}
 \item VIRTIO_NET_CTRL_RX_PROMISC turns promiscuous mode on and
-off. The command-specific-data is one byte containing 0 (off) or
+off. The \field{command-specific-data} is one byte containing 0 (off) or
 1 (on). If promiscuous mode is on, the device SHOULD receive all
 incoming packets.
 This SHOULD take effect even if one of the other modes set by
 a VIRTIO_NET_CTRL_RX class command is on.
 \item VIRTIO_NET_CTRL_RX_ALLMULTI turns all-multicast receive on and
-off. The command-specific-data is one byte containing 0 (off) or
+off. The \field{command-specific-data} is one byte containing 0 (off) or
 1 (on). When all-multicast receive is on the device SHOULD allow
 all incoming multicast packets.
 \end{itemize}
@@ -1271,24 +1271,24 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
 commands:
 \begin{itemize}
 \item VIRTIO_NET_CTRL_RX_ALLUNI turns all-unicast receive on and
-off. The command-specific-data is one byte containing 0 (off) or
+off. The \field{command-specific-data} is one byte containing 0 (off) or
 1 (on). When all-unicast receive is on the device SHOULD allow
 all incoming unicast packets.
 \item VIRTIO_NET_CTRL_RX_NOMULTI suppresses multicast receive.
-The command-specific-data is one byte containing 0 (multicast
+The \field{command-specific-data} is one byte containing 0 (multicast
 receive allowed) or 1 (multicast receive suppressed).
 When multicast receive is suppressed, the device SHOULD NOT
 send multicast packets to the driver.
 This SHOULD take effect even if VIRTIO_NET_CTRL_RX_ALLMULTI is on.
 This filter SHOULD NOT apply to broadcast packets.
 \item VIRTIO_NET_CTRL_RX_NOUNI suppresses unicast receive.
-The command-specific-data is one byte containing 0 (unicast
+The \field{command-specific-data} is one byte containing 0 (unicast
 receive allowed) or 1 (unicast receive suppressed).
 When unicast receive is suppressed, the device SHOULD NOT
 send unicast packets to the driver.
 This SHOULD take effect even if VIRTIO_NET_CTRL_RX_ALLUNI is on.
 \item VIRTIO_NET_CTRL_RX_NOBCAST suppresses broadcast receive.
-The command-specific-data is one byte containing 0 (broadcast
+The \field{command-specific-data} is one byte containing 0 (broadcast
 receive allowed) or 1 (broadcast receive suppressed).
 When broadcast receive is suppressed, the device SHOULD NOT
 send broadcast packets to the driver.
@@ -1330,7 +1330,7 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
 many addresses.
 }. This table is set using the class
 VIRTIO_NET_CTRL_MAC and the command VIRTIO_NET_CTRL_MAC_TABLE_SET. The
-command-specific-data is two variable length tables of 6-byte MAC
+\field{command-specific-data} is two variable length tables of 6-byte MAC
 addresses (as described in struct virtio_net_ctrl_mac). The first table contains unicast addresses, and the second
 contains multicast addresses.
 
@@ -1339,7 +1339,7 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
 accepts (and if VIRTIO_NET_F_MAC has been negotiated,
 this will be reflected in \field{mac} in config space).
 
-The command-specific-data for VIRTIO_NET_CTRL_MAC_ADDR_SET is
+The \field{command-specific-data} for VIRTIO_NET_CTRL_MAC_ADDR_SET is
 the 6-byte MAC address.
 
 \devicenormative{\subparagraph}{Setting MAC Address Filtering}{Device Types / Network Device / Device Operation / Control Virtqueue / Setting MAC Address Filtering}
@@ -1406,7 +1406,8 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
 \end{lstlisting}
 
 Both the VIRTIO_NET_CTRL_VLAN_ADD and VIRTIO_NET_CTRL_VLAN_DEL
-command take a little-endian 16-bit VLAN id as the command-specific-data.
+command take a little-endian 16-bit VLAN id as the
+\field{command-specific-data}.
 
 VIRTIO_NET_CTRL_VLAN_ADD command adds the specified VLAN to the
 VLAN filter table.
@@ -3036,10 +3037,10 @@ \subsubsection{Legacy Interface: Framing Requirements}\label{sec:Device
 \item for all commands, use a single 2-byte descriptor including the first two
 fields: \field{class} and \field{command}
 \item for all commands except VIRTIO_NET_CTRL_MAC_TABLE_SET
-use a single descriptor including command-specific-data
+use a single descriptor including \field{command-specific-data}
 with no padding.
 \item for the VIRTIO_NET_CTRL_MAC_TABLE_SET command use exactly
-two descriptors including command-specific-data with no padding:
+two descriptors including \field{command-specific-data} with no padding:
 the first of these descriptors MUST include the
 virtio_net_ctrl_mac table structure for the unicast addresses with no padding,
 the second of these descriptors MUST include the
-- 
2.34.1

