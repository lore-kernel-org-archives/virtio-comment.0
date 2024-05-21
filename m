Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2080.outbound.protection.outlook.com [40.107.237.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA5E6CDC0
	for <virtio-comment@lists.linux.dev>; Tue, 21 May 2024 12:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716294242; cv=fail; b=Uq3xvP0+vN3Q7okJPu1Vd5kcYKqbUN3lcQ8G8DhUdlu0O3M4HB4Kux4ivQckxw/DIv7zmKfv+X05PZB5XUCdeZ8VQRPlCv+kH0HqJ96OHdjHqU+TOg6M+m7+mccaR84GMMzJSXWlLjcnk0mieR+B02iq/HJATijvXUv4ACk60uw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716294242; c=relaxed/simple;
	bh=DLlFKI1yJRmrn9oFSoDINOVsCIr2OHMJEBX6d2rvHdI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=e0q7yayVoDXb4neHvcL9ZiuuMW1EReiY86/47JUzT9ljnGj78JX15omo9e7tuxCr5otZQZLRk2SNFnZsuYOCoWXuQuCABY0WbCBUPHxup2phhNlLR9c/qDM6p7x5ef7+LH0Ok6xYesexEQU19q1ip5itWnp/E3hn4shTIhboyc0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=L+ZqiGgl; arc=fail smtp.client-ip=40.107.237.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="L+ZqiGgl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EkH5eDoU2XkmwDP3x0G+S0F8H/FKnbtEg5DPCriai/rToE7i4IbWtwuf8tdrMrbr5C/Bg3gm92q1nxyLNoZAGAIpJQgO7248sSTf3bDKvLeFlCCxF8kjy1/FX7NyuNeNftEKjA31b7rW1LBkJ2+bp2BOo2G1C6G14Y7XJJBtI/1PocgSs/sX6XhhJQ1iZGwO4zzdk7hNy+T+1LOH+Y2OE5Rw3PLJIdAVG4C31RMhn1+6wW8mOJgXBYjXxYmVO/uThCkLniQVHVgK+XbJ3FPQkvGPwyc+PlWliGOe+Z1XhkRABAWOTez+/ftN+pv7ow/iVAQOQwwa1HoLDPVf6ilsfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=buUvnvkSOGKH6kZieLD5OEQLXrDphuGmD7MN0gpY08U=;
 b=YLNxsBkXmr1tsQjocH1Vc9hsrbIIY1Tkh0Qb7D2pZxX8t5tMhComQT1UOG0KFKgLABu46gylAVyqfRL7mLhlRaUzqL4w6DliFYq/kQyZWiOqKr7oGyHeeRmNmb6qTHLjAFMksNRlxNGvrQVBgD1ldvAjjDwGNAgOKQojEKi7wKMIwf47UUeuHqPd4zVwWtPIMW7xxBYAYCzqzcSEnflRZHUTDf+xfPJlEJ+TF3lfrSI+SoH7fuqwzxQmhFjy0syZG0BeQL8ZH+Gu3sp1m8g95wcHU9sCQZqHiJ9oTaOc7jZnPYG43k66Fe5chbE7bOx0O0pnxqAgKLnQ2UBDZ9YE1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=buUvnvkSOGKH6kZieLD5OEQLXrDphuGmD7MN0gpY08U=;
 b=L+ZqiGglXsiV12exnEVby2/iTT0pt+6Y8Z6enIwFv9+coIAwMTVx137WMuewCARELjPSNgceMYo1gyV0F7QWO+yMT0gwCnK2jnbLosJDnG6ev2STk63kVhJM9nDYLAfcAAr4OvF7zQ/n2uDdUdwO5TWeCAHITs4LRDZTgsK5f3HT/Sd69hBVz6fpCi7Ebpgw/ygrfgB+tl7w3bIErgkPZYCwmPH4wPMccOeaoC+cyelr/6QviNNNckiZ/VcVeurVntc1x/BF1EV8u2KhT9xJOV1U0WcZspl35/Qpcr1/g/lg63tMkHenuZDPVIQl1B5FFKklEzrOf5tHn6bM3v/HtA==
Received: from BN9PR03CA0193.namprd03.prod.outlook.com (2603:10b6:408:f9::18)
 by CH3PR12MB8755.namprd12.prod.outlook.com (2603:10b6:610:17e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.30; Tue, 21 May
 2024 12:23:56 +0000
Received: from BN3PEPF0000B374.namprd21.prod.outlook.com
 (2603:10b6:408:f9:cafe::f0) by BN9PR03CA0193.outlook.office365.com
 (2603:10b6:408:f9::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.34 via Frontend
 Transport; Tue, 21 May 2024 12:23:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN3PEPF0000B374.mail.protection.outlook.com (10.167.243.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.0 via Frontend Transport; Tue, 21 May 2024 12:23:56 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 21 May
 2024 05:23:34 -0700
Received: from vr-arch-host06.mtvr.labs.mlnx (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 21 May 2024 05:23:31 -0700
From: Parav Pandit <parav@nvidia.com>
To: <virtio-comment@lists.linux.dev>, <mst@redhat.com>, <cohuck@redhat.com>
CC: <shahafs@nvidia.com>, <xuanzhuo@linux.alibaba.com>,
	<yuri.benditovich@daynix.com>, Parav Pandit <parav@nvidia.com>
Subject: [PATCH v5 0/3] virtio-net: Clarify virtio_net_hdr size and rx buffer size
Date: Tue, 21 May 2024 15:23:00 +0300
Message-ID: <20240521122303.2004122-1-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B374:EE_|CH3PR12MB8755:EE_
X-MS-Office365-Filtering-Correlation-Id: 048d909c-8353-4590-2f2f-08dc7990e291
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|1800799015|376005|36860700004|82310400017;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bFAQIDLpni4ZAVOOqm9R0vn6Yp/918BNuWHxph290REB5fEFbEARm35wq4j/?=
 =?us-ascii?Q?QQgoy1eEMIGWs7MBLFULWmYY30pViZQOq7sxDXCUP3QT6Ijd06T1BoPTwT8L?=
 =?us-ascii?Q?Q3qS2gYLBXSHb2jEFEBEGjfg3+vt4IYiLGdtfU2cOdQ7t9Gv81DqVSJUV0tU?=
 =?us-ascii?Q?SffUeNRA4F41+ccKZ4QCgyaBimly+pnfKjsyF82nDPIhMfStPR8VNYU5FLrC?=
 =?us-ascii?Q?rE6bWXKJZKjdVgcywyOrSISe42ErS3VTCHCR7v1eWnmd9itxSPEpAiiBQw4o?=
 =?us-ascii?Q?8xQ5zI2FOSHUsWvi7Bmf0LD3xuejo1RR71ZR9mDq+jPvCp7iAoguC3+AttOy?=
 =?us-ascii?Q?42pvBIX+EV4h4o5t2t/xVcOfowVD/iwjd/EuUa7A1sbaPLaQlKYO75lWGYC5?=
 =?us-ascii?Q?l6TH8U6bJKz3ha061h0+CgCb4ch8uq7xM8VbTdbUWMStgYtzs2cHccpcWvBW?=
 =?us-ascii?Q?++WHijsKB1vhsOeUWCcWgx0PPCG8LjMrFLZBpDFkfVlW/yx0fOOkK3tIN0N3?=
 =?us-ascii?Q?q+FzarT654mO/JYlwKrwkzNiFfGDayRh2BqLNRMzbfRBrJJi6a3JXXWwHyks?=
 =?us-ascii?Q?CCmTUvIE2WDmfypDCO9uj8G5L+HCjyvpED1szgFodwdb59QVhXj+b9mwIIOl?=
 =?us-ascii?Q?Hd9/Cnah6ii12zZbK9CWs1tPUnji3XGVMv2fllI12cjuRLKaoZzmCxu5nrG9?=
 =?us-ascii?Q?N9YJNDiPzSDDMOcBjDXUUxKelobsY8C6UcSWkFzebD4ZTM0yy7oC4ipBefjZ?=
 =?us-ascii?Q?vCY+TYqUO5OHnAOQJ207NJTSsuzGfGdU9G4emS1MhA4UkVovZR7N8KJ2gNUM?=
 =?us-ascii?Q?OXuS5H2hNkw63BwT2w2kBt+j7KmjofACpqeTw1+wjQp34AlxPjysEGr1YEve?=
 =?us-ascii?Q?MkROoU8EeOOoIy9r9FbYPE+kWnVAKZ1313DX0Awmh2G5O2A/t2gmA9HWew9u?=
 =?us-ascii?Q?+5Y7mKTrxrg1AmXIgnzv5Vp7OSOHDh6Mbd/p2HxQn8ICwuA+XMXSFlRQ441w?=
 =?us-ascii?Q?SKmOf/wq2ih5tIcQGBpSrjw26WZ5LSP1Jnp/qGGrJ/Cz1Rf2WoeXePm0u7Pk?=
 =?us-ascii?Q?s6+PN5iyLgdA1ylqOoGYX7Ys4Gz7c5Pt4/xMxT/L0mEVkjowxpZ5P6JM86o0?=
 =?us-ascii?Q?QEDzmfolgCa95FAsNu5hCshyEw0UjUQ3F2eHezQ0HWKZgBNZvvhiK055rQR/?=
 =?us-ascii?Q?9h0VId0Zg4V7f7Qxv2qwQuMmfgU4bUUOJb5FwLRoyUS5ioOC6nD5VRL6y1/O?=
 =?us-ascii?Q?WkIppuuNx4RWhWCvFYCSnZb1t1MoOabqEJE/DnlrYN5uk7O6Pgd+/rkTsT6A?=
 =?us-ascii?Q?AzU+CJX/OcHmgoZ6jS+Dz8B/eurM5YmY+cq4VXpt27v4zc2SwL0YC4L/kth9?=
 =?us-ascii?Q?UtBDy7CKFNVMg8L5I3mv2G5GwZ8Z?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(1800799015)(376005)(36860700004)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2024 12:23:56.1153
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 048d909c-8353-4590-2f2f-08dc7990e291
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B374.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8755

There are few small issues around size of receive buffer and size of the
struct virtio_net_hdr as following.

1. VIRTIO_NET_F_HASH_REPORT is only applicable on the rx side processing.
   However it changes the size of the struct virtio_net_hdr for the tx side
   as well. This was not clarified when VIRTIO_NET_F_HASH_REPORT feature was
   introduced.

2. Receive buffer size calculation description and requirements did not
   reflect negotiation of VIRTIO_NET_F_HASH_REPORT.

3. Receive buffer size calculation was incorrect for ipv6 guest gso feature.

Above issue 2 was reported in [1].
Since issue 2 and 3 both touches the same set of requirements and description,
they are updated under a new issue along with tx side fix as well touching the
clarification needed for VIRTIO_NET_F_HASH_REPORT.

Hence above three issues are fixed under issue of [2].

Patch summary:
patch-1 fixes receive side description and requirement
patch-2 adds transmit side clarification for VIRTIO_NET_F_HASH_REPORT
patch-3 to fix virtio_net_hdr annotation

changelog:
v4->v5:
- added vnet hdr structure annotation patch
v3->v4:
- addressed comments from Cornelia
- rephrase for virtio_net_hdr size calculation
v2->v3:
- addressed comments from Cornelia and Xuan
- added virtio_net_hdr inclusion description in buffer size calculation text
- rephrase tx to refer to the rx side virtio_net_hdr consideration
- addressed comments from Xuan
- replaced 'field' with 'structure'
v1->v2:
- addressed comments from Cornelia
- rephrase buffer size wording without explicit length of virtio_net_hdr
  at 3 places.
- replaced otherwise to ', otherwise'
- rephrase non normative to write as driver normative
v0->v1:
- addressed comments from Xuan to rewrite tx normative


Parav Pandit (3):
  virtio-net: Fix receive buffer size calculation text
  virtio-net: Clarify the size of the struct virtio_net_hdr for tx
  virtio-net: Annotate virtio_net_hdr as field

 device-types/net/description.tex | 37 ++++++++++++++++++++++----------
 1 file changed, 26 insertions(+), 11 deletions(-)

-- 
2.34.1

