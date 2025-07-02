Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2077.outbound.protection.outlook.com [40.107.236.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E191EDA12
	for <virtio-comment@lists.linux.dev>; Wed,  2 Jul 2025 08:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751446486; cv=fail; b=Pcd1Y7e4+K6JMNsi6udS3RBgNr7lj20kZaEEl85A9zlXdQSzcp4opho4ukUCwexqccGmcwVRBSKUfaeFGXfSl/NBlwPkvMsAVmFvDDbEjOxru+ygKObCjRyNOOMvB75U9sBVBJBeiBAj92kyMMBiJVxhZf8p0s6JJBT2IbM5qc0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751446486; c=relaxed/simple;
	bh=F7UYPRKsUA5YdGQrMRcrUrVf1Stb8m1TaJoT6AfErdk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NhPx58KwuyTwBFqBtFxd9UXCpUq0YiP0i+F04AWc4aEw3jO9REAXCWSeCEiNFo+O9QHRSsagMRHYL04kj4d5/jWanUBI7SY7ps3msQd3wMd07C8eJQojz+tP9q7S1wt3QAnOrm99sSKj8Qmsi4uw1PaNENsBd8KTzMVllM0duFc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=OenprmtG; arc=fail smtp.client-ip=40.107.236.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="OenprmtG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ugTMXoKSA5sDbnljpN5yzfWtNUcRPYLVbUG5aQQ1EpoQxDM/G/YriZds8JZyB1ZrC9qpXKr15YIRfPFyGwqwOqbFadxKUDpIEDr98/Gw0GQlzJvvjw9vXyn29N6enAD8/Y96xIzCEDfVd1MJEWXUrKKPpH/1EkOeCbpCnR2PCXoticdSKlR3byIWfqXemRueAGjXveth1WwI+rX5KWGKFHsyyAmSFchMQN4Uz8O2S9DzoJl0EDSBclJEV6cIHNlgvv9tY7Bud8y1gLral3nL4Q/jN5lDffigbEMjH5cFL6jO8B7K9F+TsR6AVd81iEbltjb+3iORq3KQhWG1dfh6Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IfWyBcj8F6v6HDeQ+2bPksfqI3Lb2Oj9TGnbm4UXl30=;
 b=SDDYlgMhVi3zxsXKCc6brTK6aSwJuKl53uxEzeDGoO1UnZndf+kTEy/HIxLP8baCZv6viUBBnKY5IhdI9zqoOMw9PWR1Ei2sNbRAYnJOhVVoTakFCj9T5lpbVvhgxleNoow+Exz43KCQRkm1REZxFW2owHRyqXaPpRObMlWyKXnzfsJ42R8fG5sfD72ySPQ5g/EPMt8eEmxRPhhgn9pfYSp3WJ+/N58xBDSaVjQakBuLwpX57ACka1Blb4l5SLs3ip/uhQyHv52FvuIx/XBhe4gYTlZMun1PmNxCUsvOOiMa7lK989bfzdPMzO3uv3xRIIMv5/joekAUG4Wu8fwSTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IfWyBcj8F6v6HDeQ+2bPksfqI3Lb2Oj9TGnbm4UXl30=;
 b=OenprmtGfUua5K2ZDn3FW+QaEsTgH4ixc7Epz9W6Ubf2+SQ5EqwcZfg97E34ieAly8honXr1i/7/OB3X5nfdFTWhG3VAX+ZfcdBZc4Sew1nvitYBTZFM/ZLxf9lmr51+ZOBLdiwcLc5JVhqzz2lUHW31BpnttSr7ZNoy1QIN9v0=
Received: from BYAPR07CA0088.namprd07.prod.outlook.com (2603:10b6:a03:12b::29)
 by DS0PR12MB6655.namprd12.prod.outlook.com (2603:10b6:8:d0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Wed, 2 Jul
 2025 08:54:42 +0000
Received: from CO1PEPF000066E9.namprd05.prod.outlook.com
 (2603:10b6:a03:12b:cafe::64) by BYAPR07CA0088.outlook.office365.com
 (2603:10b6:a03:12b::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.19 via Frontend Transport; Wed,
 2 Jul 2025 08:54:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000066E9.mail.protection.outlook.com (10.167.249.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Wed, 2 Jul 2025 08:54:41 +0000
Received: from fedora.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 2 Jul
 2025 03:54:39 -0500
From: Zhu Lingshan <lingshan.zhu@amd.com>
To: <mst@redhat.com>, <cohuck@redhat.com>, <jasowang@redhat.com>
CC: <virtio-comment@lists.linux.dev>, <Ray.Huang@amd.com>, Zhu Lingshan
	<lingshan.zhu@amd.com>
Subject: [PATCH v4 0/3] Implement virtio SUSPEND and RESUME feature
Date: Wed, 2 Jul 2025 16:54:18 +0800
Message-ID: <20250702085421.342224-1-lingshan.zhu@amd.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E9:EE_|DS0PR12MB6655:EE_
X-MS-Office365-Filtering-Correlation-Id: b4ce3e7f-1650-42b8-28f7-08ddb946158f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/rQbv9JJHRa0F0d2M0nAPxisRcvwwrUzv2nQSQkkW9dNq0x/GrpbClcn6c1z?=
 =?us-ascii?Q?9tg3f0nI6UxNb6Cb9rze3FIaptRPqiIFqBK14Y22KUga/H4fOqP/3aOsbUSL?=
 =?us-ascii?Q?WQaiH30wonO/LVFxauaTsXhSUQW+e2cpN8uFUqnU4u2ODDxiqtXhLqA2Us72?=
 =?us-ascii?Q?7ncZrlKaTSVaHmtX2s6uYR6VJ7WcN+leVmwTOWkDzpCs5euWvAw686j92yar?=
 =?us-ascii?Q?ePmmXqAPhLrzeQzd+bMBK163JuluUJ+2GXkHFwxPQdwBjPbUOp7SP4oJ6dA2?=
 =?us-ascii?Q?/ZaRA8rZda+CYYGBPTXRi7a8euS9RMTiOAqR4/inTQbVn/ZR6H+TGqCL6Zcj?=
 =?us-ascii?Q?i/RmhSmy107XXdl08kYYsPtSbxSUqEOg8GEwd3yN6DOeOFJVCMG6WNKMQ2Vx?=
 =?us-ascii?Q?1mGIIBDKbGiKGra9lXqrrYsewR1Mpj+wrsEBXQNQ5Fe1YQ2IYRtr+bg3nKlU?=
 =?us-ascii?Q?UTYDnyrn4yXPBiNl2jLzrJ5wLB++U7y82y4JAyf73vsMIR4EYG8O3KIUwdLx?=
 =?us-ascii?Q?4AIfhlAxy2qHWacZ+U1M1v0ZLOHQxDvFk4JUgcsiekGdWKWB/Zj6xMpGUsCZ?=
 =?us-ascii?Q?uaAiHMUxd6E5ty3X8mF1lOtEvDOY5cbfV7PwVczB2L2oSggB55aKdl+0OYqr?=
 =?us-ascii?Q?s41qYAUfXGPgKAWI9oGIK4LUZYFfDq0jFVOgK5GhymZRDgmVvtLYHa/jSCQ8?=
 =?us-ascii?Q?GOLiFMP1HPdtzZTsqbo+IWuP1Ge2hD8/suBRSeBIJmvYwAFuwfyvvJAsN8Cq?=
 =?us-ascii?Q?BGr+hCV0thuDd/9850+mG86fTpEpL5pjWf96f1CF6kxOC+qJ4t7UccqzQfM+?=
 =?us-ascii?Q?HLvZ5Cx6PyBF8fmQeHHDq3o2NJJoGyCe2eNeWUB2SumlkB8DL7RuiKBYaZX9?=
 =?us-ascii?Q?enlNqmp9dyq+2q7xIwNK4ONFemMkjePQCmIG65El36QtjR3ur84aSGhNLw0g?=
 =?us-ascii?Q?9jUgyjBkjoi3dzBxICe5xLthlqwFG9kysy50T5195XVpV6QE4V2OKloT5Rbr?=
 =?us-ascii?Q?Tf/m6C1ItVAplK5xOPw0+uPo19UbdxpFitSr02qGccunghnbZV2FARp5wIbv?=
 =?us-ascii?Q?3wiszg9vicYky1YyCMC362LWEkyY46Y1mVQanhan8/uVWIdxbFC0RYdfK/CG?=
 =?us-ascii?Q?RZ2MuDFtPOePKNiVST1V8mtWu3Xs45djxBqps1qZtIEBHEkRGyhmavMWAYij?=
 =?us-ascii?Q?y9yt2EOFQfHiPpwVHWybCaGLwCQ9k4FJeZJDkRzJTdtAweiE7SxjskjBybfr?=
 =?us-ascii?Q?UM7z1a5QhfVdivRsS2Y65CrfC8KyLhAecmQW20PGvMs+iuhRBhQlpCCMiQPY?=
 =?us-ascii?Q?0uas+eFi5qI6igRcHwoeRJgdORymVHGCJ/1Lrc5rJrYva2z0xiy1Hi+q+kHL?=
 =?us-ascii?Q?leAqMhTEJTfwlGHibsuyiL2wedJDvd4G0D5HidiVSGs3OaZkOw0ZTmked3G6?=
 =?us-ascii?Q?I1vslg7TkRvJasBpO8Xtt5s6nr6qYFGP7BBABjFWrrbYZxW1Q9jZnZNB1bvn?=
 =?us-ascii?Q?X6CikeVn61b5eUk40pFWkpHGmTLf3CE03TDXtjT/jC5WfLh05UyFPo06Uw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 08:54:41.5686
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b4ce3e7f-1650-42b8-28f7-08ddb946158f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066E9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6655

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

 content.tex | 73 ++++++++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 64 insertions(+), 9 deletions(-)

-- 
2.49.0

