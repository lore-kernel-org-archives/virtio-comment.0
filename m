Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2070.outbound.protection.outlook.com [40.107.236.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE4B6193073
	for <virtio-comment@lists.linux.dev>; Thu,  6 Jun 2024 10:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717669257; cv=fail; b=ZlbLcBLaBjh4QdB5TcWXNIhqvk6ZRQkquPwp1Abec3tixRayJYplRmKbrflHmnSOn3o6Q4cmn6zL1S6n6vQQT8sobWCUFeZrqdO9FUeD/Vw7i8wWqFCqZZOj7wCstGig10TM+82FWbxK0NAof8GLvW1z9OkIqCF7DoBmhbOfrNU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717669257; c=relaxed/simple;
	bh=vwjbkwFY5F3F8hpUdI9s5PP82Cvp5q4pdXWt/tzguqE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Tw3oh31JplZeQCJcs3BTSvFFOAoTX+RYIqScL1101PnXir+laFUovcSJwrC11BCh2jRMO7xxHZEVqd38CFiZCoRePiPGlkWLyudUuVlanPCu4CdCgre/KnKeO73bRNIlgyg4d5zgWLZ785vJjxplkMjhHZ9fk+0uE6tzm9X4fG8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=KCHvQYIx; arc=fail smtp.client-ip=40.107.236.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="KCHvQYIx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CORWbKh6DFAx3uEsNgameOqfASJaXK6jQcY86dAh4KiUi+DEnfvvIUOTVkZM4LKJ/g9EgGOvWzKfn1YUOiN86UmsBjdBrtolrPnhgHQVJJLvgSvBhNgOMKmggagHeJEgepGqXNHriWGClT+UYoajwMghqA0bI0fxrdXsu3duAwMa8bBKSg1RBbQijvx34RfTkPsKswtQGzvkc2ifB17qYhNoeesGdD0Hs48+8s/CQx5uFLf6k8t5zlpMrT8NN8XV/QKlBLMevTRJndlFi61QSy43iA5ImxNR0sFSjmN4Zfpz2ayPfmDGJeIYji3NRCKNbIU4FPKz0zBb248fQ6kJYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o0yhV6GEGa/FE6HWPsUc2lYIlz1MWHzl4N4+ikMsV70=;
 b=n8PYZaDWePwZ4EyJOlYxwfpqiJh13/GKcns6T88L8BbnvYEyHHwu4FwZ4wvCDtvzoZnlSKcuwC+Nt8Q4W1RtOV0ePw8fXo/qqBy2UE0zqdMBJJ/a5Jk8SV7iQ5Urm0HT/tyHcUCPufNTbfCkHDd4rqUps++PzprpBjaeqObkRVCOZ1oogh2j5V7Av26Hp5GHhRuM7PSxvhdOQhl8mCflydhNa/ar0OTqxm6kIU7ibHQr3FNkSV7dEQteF1Sh4SMFWX9VI8bjKkX+m8RCPPDGQQwFlUKsvqn0IhuL+yqX+7aK8J91lic8J4r6KbG64VRy26XCLyE0DDReIAMghKanfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o0yhV6GEGa/FE6HWPsUc2lYIlz1MWHzl4N4+ikMsV70=;
 b=KCHvQYIxNhJ18kkD3HAv1dWXR/3F4NI3fA97us5tInNuiYtzX8eYZ5T7jqDfhP+v6dV/AZ0MalJjIEevSQbXQy+I6kW+bptYrnJbUucrbn84Wv0AIA1I9kPY3VTR67FQVSEtvOlxUV1AfoLQLTcRAt86p1+vyQDvKFbeDMDbJwEplJoqqIxA0Q6AD58SqMSWLE4uSO5qeliCLeuel2bVHoJ4aM6r3m1MdAyFWWQ9XapEiqWOfXdcWAmI/yvaSdazWtEd4sJhA/82ecCy1W+miz1Vq6UD8HZ/iuu3wccUW/cE0+wnRrtFqIPjmbe5dqU4P21nXJXWiGKRtc46AnNlsQ==
Received: from DS7PR03CA0310.namprd03.prod.outlook.com (2603:10b6:8:2b::9) by
 IA1PR12MB9030.namprd12.prod.outlook.com (2603:10b6:208:3f2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.33; Thu, 6 Jun
 2024 10:20:52 +0000
Received: from CY4PEPF0000FCC0.namprd03.prod.outlook.com
 (2603:10b6:8:2b:cafe::db) by DS7PR03CA0310.outlook.office365.com
 (2603:10b6:8:2b::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7656.20 via Frontend
 Transport; Thu, 6 Jun 2024 10:20:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000FCC0.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.15 via Frontend Transport; Thu, 6 Jun 2024 10:20:52 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 6 Jun 2024
 03:20:35 -0700
Received: from vr-arch-host06.mtvr.labs.mlnx (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Thu, 6 Jun 2024 03:20:33 -0700
From: Parav Pandit <parav@nvidia.com>
To: <virtio-comment@lists.linux.dev>, <mst@redhat.com>, <cohuck@redhat.com>
CC: <shahafs@nvidia.com>, <xuanzhuo@linux.alibaba.com>,
	<yuri.benditovich@daynix.com>, Parav Pandit <parav@nvidia.com>
Subject: [PATCH v6 2/3] virtio-net: Clarify the size of the struct virtio_net_hdr for tx
Date: Thu, 6 Jun 2024 13:20:13 +0300
Message-ID: <20240606102014.2103986-3-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240606102014.2103986-1-parav@nvidia.com>
References: <20240606102014.2103986-1-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC0:EE_|IA1PR12MB9030:EE_
X-MS-Office365-Filtering-Correlation-Id: 2501c557-9acc-497a-6832-08dc861257fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|1800799015|376005|36860700004|82310400017;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Fpr2d+ZjumCGFgbkty03xHBuPZktot1HFddl7wp39RNV9sl/jqpIOVXPTWA6?=
 =?us-ascii?Q?cZP9YgPk/R1vhiInjI/G02O+zDpJpFeHtXQQLb8R3r9ofUACNLl1Ed+X+4tk?=
 =?us-ascii?Q?CGJv/q1ZwImU/0QvuIzsrJ8B/D5ZMuOLY+nFCMXm04kF42QlsjMScqN6t8sT?=
 =?us-ascii?Q?gJIIcMuZ6Tl8YBz7V3+D/uoaHPdGBMhBcDb4jJIqrcnZ+lerO6IrIpL1AKT9?=
 =?us-ascii?Q?vEwb2Xxsj7V1wJHA51S5BM6EQIN42jjBx7ppagcFblhJJusLzbhQv/T3UE5E?=
 =?us-ascii?Q?WdVvUvBYdvdG0P+Rg8IMv7f03TFPchbaIc5ThcdDrLmrttd7ZiK420cBdhSI?=
 =?us-ascii?Q?Coxpgad6lKJ3gzZ/1FZV46TudlLWu/1jbADDby+BtmGwJmi1BCVZn94b/CVJ?=
 =?us-ascii?Q?w6JhDteOR7CaoNJM/A3daysohM/EC48/hkQajDuIeLDoUcAo/aV97Y4ecuAJ?=
 =?us-ascii?Q?3bWsIVKxPh2SZg8BhgxmpNlP3DYeqQrVcJbiN24TsUoQNlGsov4Zji1vdHCw?=
 =?us-ascii?Q?OnRRyM2TkuLc4W3aTaQFYWGluWfmMDflq6vM+RFrIzDCxoAnjwgIRKgTk4aX?=
 =?us-ascii?Q?S4mMa0uDzt0MIvgC1T/2O+muyQju7Bbl6A+sNPe90GN5mHkgYcUa2Q7A9SvY?=
 =?us-ascii?Q?XMhvp2qhtehuBOivsmMoOMxdHuGAC+zmxJHB60NJi8FMg0xvDReanLfzWYP1?=
 =?us-ascii?Q?UN9VtJOSJNucPBsp6zLOU1opTAEI9m7/AW06KcHqU7jy8Ml6HO+lsOV+tsIn?=
 =?us-ascii?Q?/gC3C3zPzjs/U+wCj0esDYoYZ2u5aGlEpZSbto0l8RYM0PPYRyMt3Mu9J0PB?=
 =?us-ascii?Q?hC++i72OYwGfky1CKrA7LH3x/cUNxjwkOoVTQdGQ1Ize+7zB6pSA1EW0YWBm?=
 =?us-ascii?Q?BtiV1AZlroZcKWip9l3UJT1P94XA19vtKhrrjQvs48zIkXVHdka1oXfLqS2a?=
 =?us-ascii?Q?q0peKdqf+G1qY5GPXQOPfwwKJuIlRQ7UYc+g/cMCRztPSphDJaAohdfUgA28?=
 =?us-ascii?Q?YlaikETHDuFxSS1vguHeKNE4w+MlOvQ50IYj1P/2tvTinuNKY8LowZPvJ6ri?=
 =?us-ascii?Q?gUB4+EnMb4uXY9nFB93aSGQ7ciKYeSl9278JxfCz+umIWUBRMMGtif2H8Td1?=
 =?us-ascii?Q?p5hV0QcTRjk63qGtFfbtcfILFtKYY4j58uaFyuprFsOJsRdG72Nxb2VpW8di?=
 =?us-ascii?Q?ANlf7ZqBe+y4HyqVtJpokJO+OohZ2hmEcte7T+N6EbYWvdrZhqTxAZjwA39b?=
 =?us-ascii?Q?Qhjc/7c3WP/VpXQiv+GCk7Io4jl1Klyi/3GRu4hFN5D8U/FlbWM23UwXlxT+?=
 =?us-ascii?Q?HI3uiICuxHmNGquJbU0c2q/ZS5d3TS9OcRLjSIvYykGgXtgvAyDx4ApqeA+f?=
 =?us-ascii?Q?ODaJ78W3IxezRFBPulka0jr0uyjyN14SxDQ4sxtniesf0t8wIw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(1800799015)(376005)(36860700004)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2024 10:20:52.2054
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2501c557-9acc-497a-6832-08dc861257fc
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCC0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9030

The feature VIRTIO_NET_F_HASH_REPORT only applies to the receive side.
However, when VIRTIO_NET_F_HASH_REPORT feature was introduced, it was
not clarified that the size of the struct virtio_net_hdr on the packet
transmission also uses higher size when VIRTIO_NET_F_HASH_REPORT is
negotiated.

Explicitly clarify this.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/183
Reviewed-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Signed-off-by: Parav Pandit <parav@nvidia.com>

---
changelog:
v2->v3:
- rephrase tx to refer to the rx side virtio_net_hdr consideration
- addressed comments from Xuan
- replaced 'field' with 'structure'
v0->v1:
- addressed comments from Xuan to rewrite tx normative
---
 device-types/net/description.tex | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index d8271fc..d24ffb7 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -531,6 +531,9 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
 
 \drivernormative{\paragraph}{Packet Transmission}{Device Types / Network Device / Device Operation / Packet Transmission}
 
+For the transmit packet buffer, the driver MUST use the size of the
+structure \field{struct virtio_net_hdr} same as the receive packet buffer.
+
 The driver MUST set \field{num_buffers} to zero.
 
 If VIRTIO_NET_F_CSUM is not negotiated, the driver MUST set
-- 
2.34.1

