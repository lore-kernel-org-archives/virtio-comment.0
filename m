Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2041.outbound.protection.outlook.com [40.107.223.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F4185184
	for <virtio-comment@lists.linux.dev>; Fri,  4 Jul 2025 10:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751624293; cv=fail; b=EBTixWXAA5dN/brIoEgQq1sKNc/V2tLieob4hPyG7o1d+TbonBvOmAa/G+tpreg0oF8UdXA48wQ21fKu9Kj5HV7dYYlp3QNnywWiFJ3jOoJA8ttY228Cp9Q4NDqAKoTgoKHr98ZHfto/VIu8yCzWDjKVIAjSLyQjq9Xg3gEYXME=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751624293; c=relaxed/simple;
	bh=F0xEhoK5DPciLvpgMP6au7Ko0VkWngFlhZnfGaBOK0Q=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ifOJgXfCi+TUwMEkxVNf/v/nychP7bRQIwCVSge04izKeLuScURLg4UlFepQl7jMqvzjKmU75F5SZjaiOBjIU8WO7+tqjq09AiQR/0qNf+EAyuoSai9nnUyLLsN1nu/TKUh9Ix88tdQdEIUVbXF7qGjdIgOHfj1t6ygkveNsigU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=uygtIAsp; arc=fail smtp.client-ip=40.107.223.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="uygtIAsp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jAtZrfUYiljwEES30oTRyLqU4pfpMEQawdnhQxwTiOnjFVhxEIEAhUq8gjdmELWDlNP61MlO0UN3HiIMPJ5P3y89jp2B6Y3Moakgh8F0+f9yT8TBjLM4eN+QPSPcoHlD9oKFPK01NTMMQ9W2twl61ljpftDrhhM5fwTL1P44b91xVE+ETM1czm/UpNpvCvTStNPLLZe/X0sILs9pNhYHydw9di55gonpM+umorrityZ7Fj2uvL1+Dp81JgaZNUvTZir6sNXKMSFRLRzTp3yHZdRXAZhjXBelJJBiVFzWBCGO5rb7nB4zXvmqULSjcnM4G/Ys4pmMw6gZmKB2icuakA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y3Pm5KyXCD9QNkXYCDBn93yFabYnihKPsHtWTgPSZ1Y=;
 b=ho2b2fTcdUYFmc0NgrIsObA54BVeMatzQKJvYWTM2VK2AqgCUXJ1yzrTqxkG3HpyWf3HIMQetOQBzn1e3s86g7QbWvoWqHfNe/k3YG2yJTl1bW2EKzXJs7UKdAY69RdxC9LY9XT0hr859ijUD4zacftrs+K1VCK2c8Wpn7U5bCymOJa6SMyjZTqfSE63pXOSYhnzqvKsn9k7ZEcHM9CyOcYz0fEwyvnJQbcYKRHBor9jJjNfO+sgt5iLMnK5jJi6dZ008uuwztI5vT0n9HWGEo/aHfBcuk2d+VLPePW8C5SYyoy2yabYRq7D+8iK/welNsa0Qc6NVSUDhnVF/cCqEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y3Pm5KyXCD9QNkXYCDBn93yFabYnihKPsHtWTgPSZ1Y=;
 b=uygtIAspP7EFv8YO/gNqmo9cqtrzzhA//s3ZYHtBAYBK7+Xz3d93J/OdRVRW9SZ/zwvEgriFU+SsN5njzjE0eqraKLjPyY8IpnyeHg/37gfoHOcEUOWTO0LV0fvmiyk31kiJvpmHd//ZfVOPLFry8/jXJpY2TYTg+iIBleSBUw4=
Received: from DM6PR12CA0017.namprd12.prod.outlook.com (2603:10b6:5:1c0::30)
 by CH3PR12MB7740.namprd12.prod.outlook.com (2603:10b6:610:145::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.21; Fri, 4 Jul
 2025 10:18:09 +0000
Received: from DS3PEPF000099D8.namprd04.prod.outlook.com
 (2603:10b6:5:1c0:cafe::65) by DM6PR12CA0017.outlook.office365.com
 (2603:10b6:5:1c0::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.23 via Frontend Transport; Fri,
 4 Jul 2025 10:18:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099D8.mail.protection.outlook.com (10.167.17.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Fri, 4 Jul 2025 10:18:09 +0000
Received: from fedora.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 4 Jul
 2025 05:18:06 -0500
From: Zhu Lingshan <lingshan.zhu@amd.com>
To: <mst@redhat.com>, <cohuck@redhat.com>, <jasowang@redhat.com>
CC: <virtio-comment@lists.linux.dev>, <Ray.Huang@amd.com>, Zhu Lingshan
	<lingshan.zhu@amd.com>
Subject: [PATCH v5 0/3] Implement virtio SUSPEND and RESUME feature
Date: Fri, 4 Jul 2025 18:17:36 +0800
Message-ID: <20250704101739.354522-1-lingshan.zhu@amd.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D8:EE_|CH3PR12MB7740:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ce3d981-9de9-44f4-68a2-08ddbae41304
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PzRsrnJcC8hYketrIozmowKLE0kMNCf26+5eaSPJg5hsufQmWAyU7ISc4hlJ?=
 =?us-ascii?Q?MPjflL5rBcCTpo9d2/ihAbyYU5pHaGqyumCEiZSRfVlwuKtQacXSaVV8toX4?=
 =?us-ascii?Q?aNgPAlJt6eZQsqryQdICjH9QAlapT9fOSSLYo7AoF2FZzV0DU1mCCHOgNGI2?=
 =?us-ascii?Q?Nh0Gk4EiBxXVFFO/S91xHQDfJfAJ0xX0ac6OPsyDlLNsnUQm5SFPaJHfSKJs?=
 =?us-ascii?Q?CsFcNCcQMekdSUnVC5/LE0hrwX0BYZ+7K0BVOB4A91VBrfClqId/l4BWZg2A?=
 =?us-ascii?Q?OFbM6Zw1OR3GJUoQLbpg9CKBYCkxxlnotYK2AzUjmu6Y948vpik+e/oAA/N7?=
 =?us-ascii?Q?IG/GNlQk1J9COQWzk9CpmNwrtAaBKl3tI7qkjgMjCAHM+jjPIEbFS/mq7lgX?=
 =?us-ascii?Q?W0dkfqawgmaZ3HAEmEJ74AAeGk2o111fpzzrTVpjqKCi4Vc7OvVPoeQIrKw3?=
 =?us-ascii?Q?8jsue68vNpATRk0iIOW/Pro17/dIYFzS/b25P5DU5Rhscnbz4pCkM32ECSUZ?=
 =?us-ascii?Q?+wJcAd3h+HZ/G/WJs9thiA3JNDTHqML6qp4Bl9N70STgFApNJ6Wnmx6glZPo?=
 =?us-ascii?Q?UlU32/T0ShpTYGRJIWHj1g69brkVLzIQRBwPKbUWq867XvEWts+AfDwEL5wR?=
 =?us-ascii?Q?MGTCeCqmFIBJtcuM550qMxR2cDZyz/PdkozaAEWHR3tyv0pfjnrd6la6Guqw?=
 =?us-ascii?Q?b3RDZt7FM6YXmlklVGwYWE5AHAlke8lg4Fm7VUK0c+Xgjo32xpk4IZ2n+aeY?=
 =?us-ascii?Q?9mtrd0tZcBkPi2CJbMl58A/KiYGQ3WJns3DkR4cxaUNQCF+i/cz0sXQ1O0pN?=
 =?us-ascii?Q?vhZ/8xCke3L/eW/OVDMFl/W5mZvBaVl/7eJlsP4UFZZzvF7c6CRpWB4S/umK?=
 =?us-ascii?Q?yCPfoXjMXUQuh/dbiKCzsUGjcTLYOXMzLrcH8HXQtmpW+h1/bpqOwDMG3wqO?=
 =?us-ascii?Q?Jx0TtFZkK65QuRlX3omUe3trPj5F2SRnUKyJ+zik9+W3d++LZBCm1Vt7I57B?=
 =?us-ascii?Q?N4G2nLL4mQCW7HkNHvos7LKs73CoNqp+1vbJB1qMszZ7keizVoO/zJ6OARBK?=
 =?us-ascii?Q?+HTnkq2TzezvJlCAM0QhzzUNQvIOYqfUE1hU86Ur74S883kup+E6VFJIVGkd?=
 =?us-ascii?Q?5Opn7lVC29ZMZ5AEmCbRjQbbihiCiNb2sqB40OBTodsm0HaKs+ww4FG/tBSK?=
 =?us-ascii?Q?eBZEdBd4RFUyD00QfHcqpnBzyA9RcPpWv/dQXbvqKIzMgSeuCSZBzAnu3dVR?=
 =?us-ascii?Q?mMIIgy7Dcmz3iSLW3EnL2aqNfaVG09DT604kc2ziYnAgBdugH+2dslhoUxoz?=
 =?us-ascii?Q?1P9BCSuYb1cFjFcpWC8RNJ8YLMZL6tPBLapm5E5CyC7TX93MDKPT2O60xfD2?=
 =?us-ascii?Q?U42xJzt3Nd2/kUYXcm8CqU1Sqrqvz7VS7lK3IPOa7kuJWDbIb1LQe6mgqMBe?=
 =?us-ascii?Q?pS6loRnDg1r+bPPFtW8C/o8dRQ2S5npwQNrF+pOXPJvy6q2jebRpjUf/cinh?=
 =?us-ascii?Q?OOSKJ0S0mGIMtoDzQZxgHew5yPjOhnzGrYK0QeByouMOSWyTEsw9toWAbQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 10:18:09.0037
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ce3d981-9de9-44f4-68a2-08ddbae41304
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099D8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7740

This series implements SUSPEND and RESUME feature
for virtio devices. This feature could be used
to perform live migration or take snapshots
of the devices.

This series re-orders the device status
bits, and documents feature bit 42.

Github issue link:
https://github.com/oasis-tcs/virtio-spec/issues/229

Zhu Lingshan (3):
  virtio: re-order device status bits
  virtio: document feature bit 42
  virtio: introduce SUSPEND and RESUME feature

 content.tex | 77 ++++++++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 68 insertions(+), 9 deletions(-)

-- 
2.49.0

