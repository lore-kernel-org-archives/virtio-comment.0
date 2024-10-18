Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2041.outbound.protection.outlook.com [40.107.220.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A870B42AAE
	for <virtio-comment@lists.linux.dev>; Fri, 18 Oct 2024 13:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729257494; cv=fail; b=BEkxZQckTPqQ6NxtSOxrHg0bGJcJ+QlYp5+kUu9lDJktwK+DqYfegmB0ejpb57sBvugzFdscCMVT2AvK2L8iCjrjPAnQnZm8PbVQC28PwkaW0vAexbucAd5kk/LO9erUMg73FK+N1xx9crn/tLHylGvHaTRmM7ylPQ0aXA2MH/I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729257494; c=relaxed/simple;
	bh=tWCCypwetI+WcAbhoxyQs3ED1GZcOpfzfOL4eAtHA10=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=i2n62hPEhDfrO44bbKtfD/i0judTRwxWuQdZmR58dkG4vxIyDX8ApyNs9Ml433ctq8jtdsLqpD1ycdl8OQ00pa/qUrT1Vd2nAGMgxwjYMaTYrOoCJkmi0Nx3ptaWN8YXY9ZKNIQ6s8ltZxgQKfvwjhBdNdyOGIEdxlEUs7V2taE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=YAVfVDia; arc=fail smtp.client-ip=40.107.220.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="YAVfVDia"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IcZJn0crKHdPr4B3pPJJbtd2yHXwJRuPZsDmXf8XkAfux8rMUOd5Qgy7aTIaHXLJrTwArH4cRZkxtkmfgo59lQudqvbuB/4a4KdzBxczisVPQw3i5DadM8bbCXQMb8sAcPAxTqNnhOsmbVJE0Ycj76/GVb0zNQDNT0FaDGIwesxC42ywttqeiujtDiQY2RzYQL2bI59wITV+v5GT4I0eXhJQgvckW9KoUllGIgKmun+T5jJ7GSNRSdUSzeeRJhkumWRcP8FTJh0KrvLX9fQ1BFRFVLFrkyK4No6Tu2xFgF9zcVnHl+WLfahKokX1vtZmOwtNT4UpleNjeTWDcUDKbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PRmgVdXI+2CCvE7ZPilmvp90Nwm54R+6PJiAr7ICwLQ=;
 b=TTRRdmXPFJ0IyuCc6/vqOodwAiErGuNGVQA9a8VN6K3ZfhbQTkv5/YhvdpKTjBsN4oaoTph+6aYjiFhITCftI8TK/mwRmNnipEbAhitPyjdXikn3gXwSIaKFuu1mG68h56J2rh+CDayUidFavZ5a7uFsQ7zRSs2AgRtfRxvwHiUPaWXVuPRii/tmp0UqR+nutAkL2a9f+wsX87RfX5NH36YA+cH+6PLkJbWE+bXGf/VLqV5by8voEYbC2bNOXT7UVkh8u5hPM3WoH+HH5VekkzupnfRpyQXG3zVVRw1pOGrVzfNacjPmgHwBFaB0F/BRsO9jOOnf4aXU6x4S/6t/Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PRmgVdXI+2CCvE7ZPilmvp90Nwm54R+6PJiAr7ICwLQ=;
 b=YAVfVDia5QBmqWH7BofL86YtlG95BTSkEG2rnIl2NCl03ehYMB6PUikEACaupujOh4BmUpJPLpnmhRGDHHrOLy0KvBxRiO9zPLcF1CaYjoi6hCJkFD8GcSvHltds7wQr4WMw2oKWFedqfZfruMDRngAjIO8uWeXSKzpcU47bqODooyR4RYdrFOtOGzrxmnWMRJLAxGtz3HzNoT5L3V+sbzaohiOPVEzvrUGdnaoRRqxJ4445/LXljVXpc2l5ZgjWvEDVZ6y3doWLoeYal+c2dM2H4nQG0jm/CCXQ4b62FHuJNoDu5rNiB2Y2j+M8++/o0l/cfkV5JxAqA0MyNXitYg==
Received: from BLAPR03CA0136.namprd03.prod.outlook.com (2603:10b6:208:32e::21)
 by PH8PR12MB8606.namprd12.prod.outlook.com (2603:10b6:510:1ce::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Fri, 18 Oct
 2024 13:18:06 +0000
Received: from BN1PEPF0000467F.namprd03.prod.outlook.com
 (2603:10b6:208:32e:cafe::21) by BLAPR03CA0136.outlook.office365.com
 (2603:10b6:208:32e::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.23 via Frontend
 Transport; Fri, 18 Oct 2024 13:18:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN1PEPF0000467F.mail.protection.outlook.com (10.167.243.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8069.17 via Frontend Transport; Fri, 18 Oct 2024 13:18:05 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 18 Oct
 2024 06:17:56 -0700
Received: from vr-arch-host06.mtvr.labs.mlnx (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Fri, 18 Oct 2024 06:17:54 -0700
From: Parav Pandit <parav@nvidia.com>
To: <virtio-comment@lists.linux.dev>, <mst@redhat.com>, <cohuck@redhat.com>,
	<mvaralar@redhat.com>
CC: <shahafs@nvidia.com>, Parav Pandit <parav@nvidia.com>
Subject: [PATCH 0/3] virtio-net: Define cvq configuration related device parts
Date: Fri, 18 Oct 2024 16:17:38 +0300
Message-ID: <20241018131741.443635-1-parav@nvidia.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000467F:EE_|PH8PR12MB8606:EE_
X-MS-Office365-Filtering-Correlation-Id: 5773a86f-ab29-4d6c-c874-08dcef774d81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EcbKIEL+Z9RkP5HdfTijzXx5egbWrgRYlu1m2gF+Eg3I7wxDHBF/7uu+AVKa?=
 =?us-ascii?Q?ECOQtz/DeF8qo8etovRMLaJrcrbmY93lX/qe0eJiML2K2A+w214t2wym0qRg?=
 =?us-ascii?Q?tkE3XxjX2q9RhxikuptywMRb+2h4K8JwT32qG8AvmVj8i9oiGvptxMUOktn2?=
 =?us-ascii?Q?sMPnj/U2xscsgVOSV3qFlqeER1J93/Y5E8oCNMNuVO8ZdFQYq5eC/JKWeGVM?=
 =?us-ascii?Q?IISqVsKuJRmVFnn6kLdHxFONT9gR9fOumA4HzaIIISnaZLym8hgcRq2eS7u4?=
 =?us-ascii?Q?LKaXJd9HnyGD4Vo6r2PzSW1BKDCdm6Dq3LaOsjJIEfMp+eONL1ch9sZDY35b?=
 =?us-ascii?Q?gDd9HongOSEWsYGjtGPliuTVfM12G9MC2/SEBOyez2MC9FZVicWWsZ+m9bgb?=
 =?us-ascii?Q?FbeimUD7x3znKWzNmITfbuAkPIwLxN22IcJljiIny4PLxke9mdRsALP08MSO?=
 =?us-ascii?Q?DkqfPBxOiXITpIEl+uUkHWywY9F4iW5PWcfC1vBxunPKiEtybu/FhrOuFerE?=
 =?us-ascii?Q?Jiy8MG4fV+VOna1wgat5YdXOA5EbFBPJxO2iYz7MGIdNENPRj2p+x6Tigv0t?=
 =?us-ascii?Q?fc5RfHndoJVUqZhPuJr6QZAwCJ6MdHqBZ83fjL4yZnEDOkgJ3/2XYCMPqGkC?=
 =?us-ascii?Q?N9M3VbKSDWB01a2cj/8f6d0YFe27YETrr0L5DvCz8B3PgAbA6M6W27LYFhVn?=
 =?us-ascii?Q?1YIx7N0FGy3/nqHpsiYDb6ph51v9hcHS5B1Bb/ehDuWrR0iEoOMJ4/ICd5s8?=
 =?us-ascii?Q?DkUhPGQIlyTFsHR9rvIt3mLyDDqgYktpT5M+WJBmXnw3ZcudL2BZom78uzZI?=
 =?us-ascii?Q?UpVDnqA0J9Bh/xItawF2lxj9KftM1Ro5oR7Q6gYM50KavQPiaCbKLso4OBA/?=
 =?us-ascii?Q?RGW/OfGmCtaRfEZktnxak1IqxQO9p7QEuZFveQ5uzDuwUYfrA9EyClErLz04?=
 =?us-ascii?Q?HK3skCPjo8lM9neJP3BvEZbS42xoOBzy2B9fsO+tbRM7SZPUxTznI/MkPuNI?=
 =?us-ascii?Q?4bvnAuP9zYbnm4xFSaeCOrme54VqrPMK5vZNr40nlwBOxBCldOyJJdKT2+Rt?=
 =?us-ascii?Q?wzBH7NtHvtUYhVrihpR01hVPUpSATwXGt42zPGpAu6Ur1m6WZw+LvpotPZ/0?=
 =?us-ascii?Q?GbDKVqTHEHL6zWb9llnzp4qErc3fSylI3W+zR6lV3UZ17/t92IDYn8UkrLOJ?=
 =?us-ascii?Q?qxXAB0A2r0Kxqz1rMvi2Ow2Njm3kk9AuiEDPmeI9SQJVjvMCTwS47ozPPS4N?=
 =?us-ascii?Q?cIdV4OpXzHBG9s7aCd0zbnLQ4AaluMNDccUyoB8QvjLJ9z5+GAAOoZ8UrfkT?=
 =?us-ascii?Q?DFS0ZVTAA8QnQEdaQ70z4EckYBFjyP1e373dXuvDY4zrPSANArD6eoWZTXdh?=
 =?us-ascii?Q?DJDHLmcGl2xwNYB7bTry2wVPGMpqaTWv9pld36+cyciIY0r/2w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2024 13:18:05.8234
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5773a86f-ab29-4d6c-c874-08dcef774d81
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0000467F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB8606

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

Patch summary:
patch-1 fixes a duplicate part name
patch-2 adds device type specific raw selector
patch-3 defines several cvq command related device parts

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/209

Parav Pandit (3):
  device-parts: editorial: Replace duplicated part type
  device-parts: Add device type specific raw selector
  virtio-net: Define cvq configuration related device parts

 device-parts.tex                 |  6 ++-
 device-types/net/description.tex | 90 ++++++++++++++++++++++++++++++++
 2 files changed, 95 insertions(+), 1 deletion(-)

-- 
2.34.1

