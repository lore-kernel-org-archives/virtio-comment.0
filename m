Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012059.outbound.protection.outlook.com [52.101.66.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77392190051
	for <virtio-comment@lists.linux.dev>; Thu,  6 Mar 2025 12:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741264867; cv=fail; b=k1Zkg1D4zAX5Dq3Req4O/uk67hd5IO2lsGmiYhcN/zbq3msEs8kDg182bp8njkfwIGPHYqjL5HSJaLbjprTqOIXufobxbcOqliy3k8XFr/OGzhgrLXa2C+R+tthJDE4SQaZVYiDv9w0Se1VSIQfo3UWRr7b3RDVt6CA/qIzH32w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741264867; c=relaxed/simple;
	bh=VmE7GmHdNHE24Pb63On9JXJ3Ks/pSd7Uv9J/mnSoXCA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=FrdbcQ7nDouSoxpwJaGUodRdwVVv8QhyWCAyeKxjvfX9X1ngPk6TS2K8le9KQc8ovVUTD3jK7LROi66Cl+Wotm0Bl/fPsnQfe+QSByRBqkE5LC4xMYz+0bcFgl7wZCyvM6he8yY3raglXt9Y5aE8M7O6zqTj39Dwaya99L6T0Wo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com; spf=fail smtp.mailfrom=nokia-bell-labs.com; dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b=IWK/M9Nw; arc=fail smtp.client-ip=52.101.66.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b="IWK/M9Nw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TzhETM1ePSXrVQC9OdCmv6diaT5MI/pL3IZ9bPlGQ78dnAmGtcvOBP6ZKwZmls6HNrLE84iz1MgQmkI2HZl1HjPIw9aAt40P/vRiOCYLQZllizqEx7F+w6i8TRMIMaRyQEnnxpohJEqehSSKK02t2h9w87q8g5iX1wWod5+/J7Z/qFIq6vZH8OS9qmHbGSOCr/QLqNtKFDdxqd1ueLyQasvFkJRi/uwxptaBCoNbCqgzXZdSUByu2Dv8xBok08W3ldBjn6pBxj3MAI1/NlNqWnU8TOCZV5l4pBMZ+7tsdJFIMd6EaUnG+SzJxh4Rd8XwjA1k0P5+2RLP4ZKiZwQqmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SgjO5CxZWQ4/UucCXQcg+v6Ua2q3mHUfyuxtZcA4hG4=;
 b=hpfwq3Mk3c/55c1Ocmqyr0x6YWcSqwSJlMQf2JgX2QZmyRp6QCyoVSL9+FrjGIiK2StHsUNYp+zoMnbhZVYOPhEJCnbvwWKUin46AnITAmXXG1Rm1ho5clTzcv2afNBqsfmdKMGv5CqbJOpXp6Cys16LY0S7+jR4eXl3nMUE/p2wgb3SNC4yKzBZF3LdJHirwJRNUr3m9GhRzOlHJW6pRIpqQesAAEzIBtDEVF3qbBMcXGn8Jj8cxB+hqlrWBQ7DiFiQwb5yBVFxP22RtkrOdvYI+7kBoscHhjx7zJPJMMORQHRPE8QM2qp2GN4HQ9NQtVY+kiDAC2QWq1DZxqaVgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 131.228.2.20) smtp.rcpttodomain=apple.com smtp.mailfrom=nokia-bell-labs.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nokia-bell-labs.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia-bell-labs.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SgjO5CxZWQ4/UucCXQcg+v6Ua2q3mHUfyuxtZcA4hG4=;
 b=IWK/M9NwUaFxQGGlCHs2Cehw58jDvvVdiygW67u96JI2vsuaMO07M4p2uYaRvnvyNxuosHe6pbhA2G/hyNxG1bW123AzkQTl7TiTVPL0X6PsWgy0I3oL7RciHoKSN3x5R3J0AlpChPS+GBrdH98ZFom9rxHHPqtbjnCGwhQjac3wP6UNkIVc5twwPe2KinqaQ4uXpDv1nBnrWEWxg59n9CaeLRs9fuGbCYJvT+lEpFG5YBIeiQdxZ8Azfh/srq+fgceWbgq5Hobxw7iz/qzU4hgDgfpRWbkjexOHbPzMBsTv1A02R+Wyv/Kdt77vWOX3GO8ogXD/MurIR07LWvFsfQ==
Received: from AM0PR02CA0132.eurprd02.prod.outlook.com (2603:10a6:20b:28c::29)
 by DB9PR07MB7148.eurprd07.prod.outlook.com (2603:10a6:10:210::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.19; Thu, 6 Mar
 2025 12:41:00 +0000
Received: from AM2PEPF0001C713.eurprd05.prod.outlook.com
 (2603:10a6:20b:28c:cafe::29) by AM0PR02CA0132.outlook.office365.com
 (2603:10a6:20b:28c::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.17 via Frontend Transport; Thu,
 6 Mar 2025 12:41:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 131.228.2.20)
 smtp.mailfrom=nokia-bell-labs.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nokia-bell-labs.com;
Received-SPF: Pass (protection.outlook.com: domain of nokia-bell-labs.com
 designates 131.228.2.20 as permitted sender) receiver=protection.outlook.com;
 client-ip=131.228.2.20; helo=fihe3nok0734.emea.nsn-net.net; pr=C
Received: from fihe3nok0734.emea.nsn-net.net (131.228.2.20) by
 AM2PEPF0001C713.mail.protection.outlook.com (10.167.16.183) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.15
 via Frontend Transport; Thu, 6 Mar 2025 12:41:00 +0000
Received: from sarah.nbl.nsn-rdnet.net (sarah.nbl.nsn-rdnet.net [10.0.73.150])
	by fihe3nok0734.emea.nsn-net.net (Postfix) with ESMTP id 0DDA623DE7;
	Thu,  6 Mar 2025 12:15:26 +0200 (EET)
From: chia-yu.chang@nokia-bell-labs.com
To: virtio-comment@lists.linux.dev,
	mst@redhat.com,
	cohuck@redhat.com,
	mvaralar@redhat.com,
	jasowang@redhat.com,
	xuanzhuo@linux.alibaba.com,
	eperezma@redhat.com,
	ij@kernel.org,
	ncardwell@google.com,
	koen.de_schepper@nokia-bell-labs.com,
	g.white@cablelabs.com,
	vidhi_goel@apple.com,
	ingemar.s.johansson@ericsson.com,
	mirja.kuehlewind@ericsson.com
Cc: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
Subject: [PATCH v5 0/2] Update ECN and Add ACCECN feature
Date: Thu,  6 Mar 2025 11:15:21 +0100
Message-Id: <20250306101523.88798-1-chia-yu.chang@nokia-bell-labs.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C713:EE_|DB9PR07MB7148:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e23161e8-46bf-457f-72a1-08dd5cac266e
X-LD-Processed: 5d471751-9675-428d-917b-70f44f9630b0,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|82310400026|1800799024|36860700013|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?ylJ9fiV7IcM12gqp0H2mEP51071zSgSShkyChT4a17vf3R7O+vPk4ozS757Q?=
 =?us-ascii?Q?hskOqkQxrUphaf8Ay2/Bk9dnX3UsDYk+Fai2EhhmTAZiZ1Q6goX01HE158TL?=
 =?us-ascii?Q?okkXaPAasVLxGpTk7uTZiLYXztTIaUSscljjsX8Dm+AAWuA4eSD0PgYgIHyg?=
 =?us-ascii?Q?ghtgyLvAhzwiH2DiC42HXBP0xPRbpuWb9N+2E6GhOvs94OKIzw31ZfbNg0ak?=
 =?us-ascii?Q?sKMgy8Y/o+NlDa2GhNOfbLY2pXVTITyjJMHAaHmR3moy8tcX4u5LLkSBRLm6?=
 =?us-ascii?Q?Q1C+R7awdN1Ytzxs0pI1iwGPVfQ9ytIHjVhcy2+6aM8d+ZgCSbgYTg/ILRyr?=
 =?us-ascii?Q?Ju2YcDwPxbrUT1j2EaLLPoDY6JdU2vsoY0BSf8HNLf+SPxmRQSdfVUi08z4H?=
 =?us-ascii?Q?S/1gMkD6tt5lk/Ta7LY2jLtUn9USvO0p4QSQ9ySZ0DFuVL1+2oaIj5l9GqQo?=
 =?us-ascii?Q?PX3aCLH4Ps1M24l34BqI81/9Bv0b3NlmiXYl1M71sHzL6bu4nWBa+dl6/gIN?=
 =?us-ascii?Q?u9hKCH18YK/JqQ0TTp6rUmbCkWHS04DpL3wo6v5tJskyaRRF0RHPeVA9LqIU?=
 =?us-ascii?Q?iLRRA0e9y3k199qP6mDt0xldc77Qz6mvO9z6EOTHSPO2wsYbVCExCi/FPmco?=
 =?us-ascii?Q?4AOWrQzKwIC2RLIpvZkZMAi0q5d0STnO7jW9c19Ii3adgMN6NgsloBBJuCve?=
 =?us-ascii?Q?CvakW0ow+bsLmIh3taCafBWuSZngF7TQH5bcFX4aVfUCyAdP50HUgyiavlGn?=
 =?us-ascii?Q?n5Tf9d6UIyUmdAA9QQnHcGknGvcderrwuQEMIoxZw3kwvT4g/HT8GAfDRROs?=
 =?us-ascii?Q?aB/9ZDrVrHG6o5IusLktnH4SB8/dRgciy4he6obzhmPQTEBpb8gvmza76sJy?=
 =?us-ascii?Q?EC1k7HOYkg0D4c3t601H7bKNLB1txkXpiGLkw8RmQeSKzR23mcA9ig2Eu85k?=
 =?us-ascii?Q?94PHZiitRzSzrtL7xok+rHgC1ix1+mF50DUXZk0oZNW1WppWhUjwyOplKurn?=
 =?us-ascii?Q?N4ufW8UrutC9nGZsFZ2+H4/6YKfwLszyN2YkniyC6UIeULtS9y+NdKop+K0Z?=
 =?us-ascii?Q?E1qiwGHbzGnnwaR3ssUavhwDB0a0k65ndFCybNIpcWA7X/VFvrz/w2icxTWR?=
 =?us-ascii?Q?j8qdUy5IMbxQFbTkuH6o2gU6vLQZnCg2CnFs5bDKd8hIpBdZe4q8DDI87mZr?=
 =?us-ascii?Q?PsLKGZ5IlU1zTRIJUt9GRTJUWCaTDJKzu8HUBPa8FiOPWyW/cgV/E5ELHOI0?=
 =?us-ascii?Q?MEGO7YmjVc0cMBRn07BKNnFv9znFcGefSoKL7JV2mzgyLLrky5o5CWcHbGe6?=
 =?us-ascii?Q?8L0Oec81dS/7oQgecMzs4eUclSEQe828K9xNfDAPKSM7K6ZYr/SPygNa4jAL?=
 =?us-ascii?Q?bHdWnfKV1Jl8xdGXRtCyzGrvY+xsZrpMA/Apu1i2FYyFJLQs1/9AafudaC8V?=
 =?us-ascii?Q?rL5jS6adPm66HqByJcpwivMLV2Lh09hIRW1teGlhucrPzpqR6PjU6Uw6sMjA?=
 =?us-ascii?Q?Nt93kCaNTlIEMDJUiH08QL3uP04haz2UGyCb?=
X-Forefront-Antispam-Report:
 CIP:131.228.2.20;CTRY:FI;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:fihe3nok0734.emea.nsn-net.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: nokia-bell-labs.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 12:41:00.4443
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e23161e8-46bf-457f-72a1-08dd5cac266e
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5d471751-9675-428d-917b-70f44f9630b0;Ip=[131.228.2.20];Helo=[fihe3nok0734.emea.nsn-net.net]
X-MS-Exchange-CrossTenant-AuthSource: AM2PEPF0001C713.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR07MB7148

From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>

Hello,

  Please find ECN and ACCECN feature patch v4.

v5
- Update feature bits of VIRTIO_NET_F_HOST_ACCECN(69) and VIRTIO_NET_F_GUEST_ACCECN(70)

v4
- Update commit message of AccECN patch
- Add reference to RFC3168 ECN and Accurate ECN
- Simplify feature bit descriptinos to avoid duplication of text

v3
- Separate the original patch into 2 different patches
- Fix several reabase issues in v2

v2
- Rebase the patch on top of v1.4 virtio-spec

Best Regards,
Chia-Yu

Chia-Yu Chang (2):
  virtio-net: Fix ECN feature descritpion
  virtio-net: define Accurate ECN feature in virtio-spec

 device-types/net/description.tex | 78 ++++++++++++++++++++++----------
 introduction.tex                 |  6 +++
 2 files changed, 61 insertions(+), 23 deletions(-)

-- 
2.34.1

