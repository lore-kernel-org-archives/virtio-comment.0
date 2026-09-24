Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012011.outbound.protection.outlook.com [40.107.209.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB76C48E0E3
	for <virtio-comment@lists.linux.dev>; Thu, 24 Sep 2026 15:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790263791; cv=fail; b=H2fMXHG3sJJuo43SPa+IgI0dkhQCVocfYnIi4hTvd3b60nexuWHaVMh9adWADQqZ/EKkvNmggYYhfouGgpllmYK5+tcbuxivp9rDJzWEH7OF2p+qWIZwt5yBFYKLwouU/b/H2LXPsOdf3fULkjZGFO9KukCYfNVUVf65JuPTAgk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790263791; c=relaxed/simple;
	bh=lg4SCnJIlTfvZwMzFpecqTUcgVTMcNNX/ucppyh2lH8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C194kSDQGrUpVJ3MsCgsOj/zMEDlXoItEU6hEFlZwR+1lZgEIn4C4SwL8W4bQn9YvH1AxlXJAZVtHlak1wt5YysPMVnVfw1HEwQDhhspl1o2c0Aw38ClhDtWMvSnrleLw9mP3vvzgOAhmYFV2aiSjd7Ciq7j9OSsZTaq5iQT3Wg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=e7Wm0CiA; arc=fail smtp.client-ip=40.107.209.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="e7Wm0CiA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BdL4oGIhI6w4xzsEZcXrAXoRVx5aml/4sZ5r+sonhsbRFuog7MaKeUSRlSwmrPqDZJpefQiy0ZkHVCfSBIFwCFCxJysS2JZOAJWmVGVRs4yL1lxbsBNAQRXAQaJ9Xs0obXo7Den4mHr+aCheO/wrilA3hft0lDM28UpWRzoXJQ7IFqF5tP48wgpeCcwWoiGAvnEw29dpBrGD8TlEjI6eIQUev/2ccoQcxzteQK9FjFnck0USCGniqppQZYDwkqWeuq0OdpY4fiLBS+N2u007NL0N9eNv59uY1gRVwbrtyXchF+Dp5ks4gRp+PRj4kQQ34P213SsPGCwLruov56cepQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lg4SCnJIlTfvZwMzFpecqTUcgVTMcNNX/ucppyh2lH8=;
 b=ROQXr/UBlElnKJwDQnsvbdk5KvDuvZQFvQWiezB+0L1ztGpXCT4q3AqhO/UxTFYAHJ3WJKId68lYDJctpnWG0XiV26GufFPSx+0FGqox4fcXzjrOcnFHVUVsje/qvHeN/urFjActKvSaMuyVVYEVbiLQpY+kKZyY+9JvnD+0G1XzleqUQ0s6jnyvtDFs28FyE1k5AmxamwURjm5gVVUCiBndOIbCQz+FefighdW7yQlcmPQdf06H38F1UpIhMbn8exqJ7Zhn+18h0EW6a1nkOriE8Z6ZO+AFCyPvItrRYuPfx/mE1vw8PFYBIeMUIprYxcuPA8KYcJQAzUa76NlGoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lg4SCnJIlTfvZwMzFpecqTUcgVTMcNNX/ucppyh2lH8=;
 b=e7Wm0CiAYC73gy8k5RMlDToLDTKsfQViXxQXBR/ZlefwJnJID3Ui0tnFGaliyGG/M52EgN7+sI6nKSekR3mE++g6L+S8+Jya9Ri+yrhcIJSwe81nJf5BecoK3mwtD5QCbolLmsKupxjn7JHVby2QebqilhVHgCXh1QjGt0ILpGY=
Received: from BN9PR03CA0945.namprd03.prod.outlook.com (2603:10b6:408:108::20)
 by IA1PR12MB8517.namprd12.prod.outlook.com (2603:10b6:208:449::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 15:29:43 +0000
Received: from BN5PEPF0004698B.namprd02.prod.outlook.com
 (2603:10b6:408:108:cafe::19) by BN9PR03CA0945.outlook.office365.com
 (2603:10b6:408:108::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.16 via Frontend Transport; Thu,
 24 Sep 2026 15:29:43 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN5PEPF0004698B.mail.protection.outlook.com (10.167.245.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Thu, 24 Sep 2026 15:29:43 +0000
Received: from AUSALIEM01.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 24 Sep
 2026 10:29:40 -0500
From: Amanda Liem <Amanda.Liem@amd.com>
To: <virtio-comment@lists.linux.dev>
CC: <parav@nvidia.com>, <Nathaniel.McCallum@amd.com>, Amanda Liem
	<Amanda.Liem@amd.com>
Subject: Re: [PATCH] virtio-net: Add VIRTIO_NET_F_LABEL for a per-instance label
Date: Thu, 24 Sep 2026 10:28:56 -0500
Message-ID: <20260924152856.3326-1-Amanda.Liem@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <SJ0PR12MB68063B6C5A125573CE53A717DCA62@SJ0PR12MB6806.namprd12.prod.outlook.com>
References: <20260818170552.2127-1-Amanda.Liem@amd.com> <SJ0PR12MB68063B6C5A125573CE53A717DCA62@SJ0PR12MB6806.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN5PEPF0004698B:EE_|IA1PR12MB8517:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e51fa3c-bcc1-4edb-72df-08df1a50a861
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|23010399003|82310400026|376014|4143699003|11063799006|10067099003|56012099006|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	jB7W8w2ynD43qtjSE1oHhQb7glqUq32MsLQw293uyvqBFjBbvPlHHklEkpW3b+pBUoqd7v2ipgEu8dL5YmqYrlobLWizF6zs2LvnMzHzpXyEKJC+Oe1q8AmIFMQa8ZLvudRwcC5yl3tRqw6l47lrSV2jfbi1YinEn1gIP1VxBWCQntfboWumFPwdXxR1jLCoylXMpCZMrwmpTcE7fH9TP+St+zfRX+SV1QJM4in6lPvwHtdulFIpc0CN8btWL4ksF4ggOQs5JWw7gt46EDIieIU6utfNodDYXlX98HMObTuwz9S4ulk3j4/dVaGO+6b+EUVsZAupkm9+YEG44LIfJMLfxh7Yoxeu0lbEaWkUK/ZIhIA/SATfTRnmRr5dGnhvK88CzycxX5aCkcnqmBH+j+ca48+oLltJR35MUkKlAtPCWWEVJfjasW8bdeOsha/a+ApVQzzxpfToG71IXbEBtTChJ0kV9ZRfK1Nv/cw3lHQigKhB9rn3S5nrEx/EonG1uW97dAt4IDsRK9HoCMKdqLkvL//hTbfgr4IaB66yMV615CGZobP6fGEnmmG87R5B+8Irg4T7Gsq1KGbHUE5wPqYsXVVCO/p4zN+3YlQBm16g6rdgeX6Jl60tZLQfv0UUagrdul0TCSdk+Wf9S8P4/zYPSK39FkDV5LHN9dLlTAqj5OosVupdI8VCIapL+jYzpltB2oi1spLnHxHEMP0HXQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(23010399003)(82310400026)(376014)(4143699003)(11063799006)(10067099003)(56012099006)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	FVz7y3LhpQvrgLddifuVFvdkC6FRzLmM0e0jSAAPmlII1QIybvVlQ71/ZwnfygA+T2e18I3Xi+xrxt9a84rcIaMFp12sgbHKBAxaRbCwBI59R6VtvHkwkhGiGm5GMu2s6kdpKRNJY/jMxEpfScFlwpWTIop5rSMNkFyJ5/p+w+mXIQveOyJ6yVpjSoLdZAVm67vHuVpv+UZm0kvNphQW72fy1BLkDXcCD0TCp247R/q7tf6MnlrIOlYEmKs2OmaOCum/6+09RRsBwrIeyhFlTjF5/OzNM+I5DHPhpgbnvQUnXlAUwNgSmBHfDDUqmG4qHA6oi4XgFJa6QSj6HzFXP5MRDpoKYYXN61DRRMg0BdTkJndKIiMoXnzzuipXhcf1WpV81QZDXduR6grQq/lwFIjYoUcoWC34I6zRWNrYfU0R2yJu3gCdjxxinB0TuJAu
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 15:29:43.4138
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e51fa3c-bcc1-4edb-72df-08df1a50a861
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN5PEPF0004698B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8517

On Mon, Aug 18, 2026 at 17:16, Parav Pandit <parav@nvidia.com> wrote:
> Please add the motivation for this addition describing what problem
> exists and how does this addition solve it.

Will do - I'll add it to the commit message in v2. Our use case is a
confidential VM whose image author ships a trusted manifest of expected
interfaces - the guest uses the label as a lookup key to associate each
device with its manifest entry before applying config. The manifest, not
the label, holds the authority. The guest corroborates the label against
the manifest rather than trusting it on its own, so it is not a channel
the host can use to steer configuration.

We'd follow the spec change with a Linux virtio-net driver patch exposing
the label via sysfs, so userspace (our manifest evaluator included) can
consume it without manifest logic in the driver. The manifest is just one
consumer - virtio need not standardize its format.

> And also have you considered querying this field via CVQ.
> If yes, than please explain the motivation to place this in config
> space.

Yes, a control virtqueue query could convey the same value. We prefer
config space because the label is a small, static, read-only property that
can be read at device init without negotiating VIRTIO_NET_F_CTRL_VQ or
standing up a control virtqueue just to retrieve it. The footprint is
bounded - the fields exist only when the feature is negotiated, and the
label is a fixed 64-byte buffer read once. (The v1 mention of PCI/MMIO/CCW
wasn't meant to distinguish config space from CVQ - both are
transport-independent.)

v2 to follow.

Thanks,
Amanda
