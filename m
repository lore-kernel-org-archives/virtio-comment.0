Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012019.outbound.protection.outlook.com [52.101.71.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 169FD20F087
	for <virtio-comment@lists.linux.dev>; Thu, 17 Apr 2025 22:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744929656; cv=fail; b=D3Jkctk3uN6AcFxi5316vxdb+09c9sr86YCNDdktzUDXPCG/VUkQFKFInClCehg4/R1PoGcNVV/OTgo85JLBb03ET6g9zV4u8wViNggT57kQDq+mnuW6aHJ0DB5CPMs8oDtQUbOFxUiFnuqRbSj1YafSzAMh8Ox8IRLQy+3fI8c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744929656; c=relaxed/simple;
	bh=skkKlh9VV88joEWH+VnPpIaLU/KCdL4fEerQxB3kPK0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=aze+UZaUp8bX0z75VoBUG20dsBe2rFwrND++G3IRMxpYWxZeazWupylXyN2N1Mc5nOgcw0g0mW57+QVH87JSitqR3Grs6s6bsBkAbTBDTiOER99f+hDlUkMShjZYkxpKHv9dDxMlI0UJfEE1XMBnuF3jihYdt5IIT8T/XDp8rYo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com; spf=fail smtp.mailfrom=nokia-bell-labs.com; dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b=YlajfoZb; arc=fail smtp.client-ip=52.101.71.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b="YlajfoZb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VDEehoYa2cQamETvIC5SUgj+B3Yzra+FaECLDhrCqpCz3ojnERF2FQlDykpubSdyqfYsks59WHOF4uoms6wnnsSKhbvMOfSmb1viWhRmewAQf2+PB5akxk94N+nZLPjJx8IFHx1CmdB+bNR0IO+9i9dPWWcPA7hATh87tCLe/eQIlV+nZCUCIKjeUh18LxQdNz0BlLd9yADI83LGcn1hjgUAu18ly0nAI1uc8IClFJS3lA5pCorG8t+JTOsNUWtu/QCT7iBDdpgEAAVq0okBBAvZ2BG5o4LkpsmZDCmS3NlKOaoU09qKc+ctjpzqtkklSObKtzbS4AExjQY/fqB3WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LMYUSjXm2d+HfI/+qA7UfC/fUNQMM32115RYFWohLXE=;
 b=UeCAvv4J+V3+gZmo/lDSkSLDoj68mMuikWGByHVL2nVUGrHC/0tglZ4pAHhdX1gp5SV2OzYJMMWz/t+Yxjgv+qCe25+uBLOwWgnjVzZJ20GlMotoSzJ/MEwOrEWK/fX4c3VSU8zLNot8R98OjwqU4B31UQCF89Fzji9uQ/6Q1TMgyl2lBCTT0j278lgVAYNN3UJVhv7vo/u2dfTr+CLmIAus0QO79qT8aRt4/0X1UbQfYidGbE/HzJ/nKJ24u2K3hqvy4BB56ickwIcJZRIT26DbL5bnNN9/qoKg0F7aqF+Ve/hiYqTxFxNoN4z4wF1PcUc3nRUZKKHMsZY+4VE8Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 131.228.2.20) smtp.rcpttodomain=apple.com smtp.mailfrom=nokia-bell-labs.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nokia-bell-labs.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia-bell-labs.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LMYUSjXm2d+HfI/+qA7UfC/fUNQMM32115RYFWohLXE=;
 b=YlajfoZbJwrSLIroB/BGyG+e2QKVz2qXGFJOWtHnPXrxAum8lpAqT0OVOac07Am7LS2+5vkHd5QqqB9hOAcSYuvoq1SzXs/yEBgpnZSwPiPiOW01fgod5eLCWcbQ9UO8B2B0vhE0DO2v6Bb9vOnLSEapPs3pUZLjF7AJjRo0r+J8wTQGmTHFrA/G+7V/k7w3Z72FYiJYubxKZCt36WdZMDskuCpc7rZIvwq9bEDu6U+XdS4St22u5X59kSCJr1kYY+EymUuwa+1LApek3ZUBzO7wHJ9cydKf9krQb1wRZGEn5qEEQMySAJpon5XAtEZwU4f3OmtwyFqkqLdSkXCN1A==
Received: from DUZPR01CA0167.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b3::8) by GV1PR07MB8949.eurprd07.prod.outlook.com
 (2603:10a6:150:8b::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.43; Thu, 17 Apr
 2025 22:40:50 +0000
Received: from DB1PEPF000509E5.eurprd03.prod.outlook.com
 (2603:10a6:10:4b3:cafe::31) by DUZPR01CA0167.outlook.office365.com
 (2603:10a6:10:4b3::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.22 via Frontend Transport; Thu,
 17 Apr 2025 22:40:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 131.228.2.20)
 smtp.mailfrom=nokia-bell-labs.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nokia-bell-labs.com;
Received-SPF: Pass (protection.outlook.com: domain of nokia-bell-labs.com
 designates 131.228.2.20 as permitted sender) receiver=protection.outlook.com;
 client-ip=131.228.2.20; helo=fihe3nok0734.emea.nsn-net.net; pr=C
Received: from fihe3nok0734.emea.nsn-net.net (131.228.2.20) by
 DB1PEPF000509E5.mail.protection.outlook.com (10.167.242.55) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.12
 via Frontend Transport; Thu, 17 Apr 2025 22:40:50 +0000
Received: from sarah.nbl.nsn-rdnet.net (sarah.nbl.nsn-rdnet.net [10.0.73.150])
	by fihe3nok0734.emea.nsn-net.net (Postfix) with ESMTP id 247B7200A3;
	Fri, 18 Apr 2025 01:40:49 +0300 (EEST)
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
Subject: [PATCH v8 0/2] Update ECN and Add AccECN feature
Date: Fri, 18 Apr 2025 00:40:42 +0200
Message-Id: <20250417224044.21348-1-chia-yu.chang@nokia-bell-labs.com>
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
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E5:EE_|GV1PR07MB8949:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 7549beda-b6e9-498e-050f-08dd7e00e750
X-LD-Processed: 5d471751-9675-428d-917b-70f44f9630b0,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?nxjE8blQ7NF0ecIdojla/HLNJhdstm8PULOTkbE3x0dFbufATZ6m4JNQhCgJ?=
 =?us-ascii?Q?l5S/qrym8sZ5Fm3qolUUNQqWb2qwmQBLYnwv9lPVc61iEKLQ5oKtDfMQ1Oz8?=
 =?us-ascii?Q?odG1aWPXC+/X+sMBQPEfvochjImuwORG7XnVkZO4QQufp1A3EfAt3l/kNuso?=
 =?us-ascii?Q?wkocE0RTxhQVXMVs4opfzIXqRMVJNL/LGyHGPw1C6k9jZBD5AxL3HYEckDS2?=
 =?us-ascii?Q?aT8ddDSTYDs2EoE8/N/Wq6NgqdMlV/9NcTPjMJCj1Xo9ynJatHhdM7ZJbUdc?=
 =?us-ascii?Q?xjouzotE7hTs5h8n40P4lHl6V9NWOu3FmC4hyAxYuhCtiZZO5h8vOUEemcx1?=
 =?us-ascii?Q?d9Iju3WC5UWCwAqU82OWaNHbLawr2r7W4FZ6IxUGrqe5qX/9C1VVBE0+Y1hA?=
 =?us-ascii?Q?KxUpqVWRUm3YCRoFfM5UI05cRcQKEuyh6gxyDumE0ANR681nVsII9GJ1JpxK?=
 =?us-ascii?Q?aIInziInTaDWZi+3MetToYXkuHmlDRxE3mLANDd23UXqWNcpsxKXB66MU579?=
 =?us-ascii?Q?bdrhXSs/Y8YY4+A8oJXaYSaK/hFu5nX6ve+MmG0FzRBgGlsCT4m8pv/iFnd1?=
 =?us-ascii?Q?+H0BBO43m5yimxoVk55PY2jep0pFqjS92nCEM9R7pIvxve+uhp+00ptaelHS?=
 =?us-ascii?Q?wgVEn4Hj8OzV8zADjDhlUhg+85V4d00uHYCfuSQnUZi/EKt21rKe7nz5bip6?=
 =?us-ascii?Q?M5WG1wkoVbhuD32exPkx+NCgjuFm988Ck6TJlG9hl7prUCMrahPxYimklJKu?=
 =?us-ascii?Q?BkLM3MXqAfP4JugjiXdkOvPV9X+Dyd5J4+9NRRnT3z2BXHdqZNr24LDT37ml?=
 =?us-ascii?Q?2ALC/5Jy2JyLjgLv+HxlUoQIbMD3I/lxieUo7wreOd+8WXToGnsAhIN0POeX?=
 =?us-ascii?Q?SYES48SiTHxRcnFFgVIaZ+tdBBHy8ksFu8cMU55lUwFr0cI8euuziis2lp8u?=
 =?us-ascii?Q?tXjzPPs44yatMhtIqNkPLZP+zjw4BMTiWSj+WfvbMZmwNWw8glJrZ2DCOK7B?=
 =?us-ascii?Q?7VrJIPtYGAB9rPMTiKt2Gk+v+qZRY0T+7OSA2Q0hxItNmWeNCx/YTc0oQw6C?=
 =?us-ascii?Q?hFGtKiLx6YNNu4T9Slv5feJMdrW+CnJlL2WEqTneTo4e2ZWSEzrfq0urJcsV?=
 =?us-ascii?Q?lSpp2CriAVAjzkeERQDPPXGGyKU7i5cSowte46tDAFGDSHyFbHLcL+2JfiNg?=
 =?us-ascii?Q?Olr/AAShElDAK56pVftSeQdDK3GEgE9o/shEl4oYte4LNa7FPsRfVcwbAEvH?=
 =?us-ascii?Q?7wgQH4gD05FX7rybM4nlisdnyEReHsR0X+jjR1lk8d0wQInc4YlxTak5sham?=
 =?us-ascii?Q?hC7SuqqM4NrE8uJ89snA9UYl5FimndWdRqu4oQJjWrM6V8LP7OJ3Z830dCBP?=
 =?us-ascii?Q?235x9p80Lwwsu2LHdWh8HgAu/qp8BDylm/qMKWmAP7fOt5WTNUxmwxGafXik?=
 =?us-ascii?Q?LEwIRnPm7aTRCfaU5tCqKKarhYxcgRHBvu0WgUsd5kjdT18KDN8UVZZz0gVk?=
 =?us-ascii?Q?8htrIBykxiWoIgd57rpsTWrFi5DLcqmG/Y0WprA9BmFTQJOh4B+v4qW1gw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:131.228.2.20;CTRY:FI;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:fihe3nok0734.emea.nsn-net.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(7416014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: nokia-bell-labs.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 22:40:50.1421
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7549beda-b6e9-498e-050f-08dd7e00e750
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5d471751-9675-428d-917b-70f44f9630b0;Ip=[131.228.2.20];Helo=[fihe3nok0734.emea.nsn-net.net]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509E5.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR07MB8949

From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>

  Please find ECN and AccECN patch v8:

v8 (17-Apr-2025)
- Further typo fixing

v7 (15-Apr-2025)
- Fix typos in AccECN patch (Michael S. Tsirkin <mst@redhat.com>)

v6 (14-Apr-2025)
- Shrink descriptions and make more reference to RFC3168 ECN and AccECN

v5 (06-Mar-2025)
- Update feature bits of VIRTIO_NET_F_HOST_ACCECN(69) and VIRTIO_NET_F_GUEST_ACCECN(70)

v4 (05-Mar-2025)
- Update commit message of AccECN patch
- Add reference to RFC3168 ECN and Accurate ECN
- Simplify feature bit descriptinos to avoid duplication of text

v3 (21-Feb-2025)
- Separate the original patch into 2 different patches
- Fix several reabase issues in v2

v2 (17-Feb-2025)
- Rebase the patch on top of v1.4 virtio-spec

Best Regards,
Chia-Yu

Chia-Yu Chang (2):
  virtio-net: Fix ECN feature descriptions
  virtio-net: Define Accurate ECN feature in virtio-spec

 device-types/net/description.tex | 77 ++++++++++++++++++++++----------
 introduction.tex                 |  6 +++
 2 files changed, 60 insertions(+), 23 deletions(-)

-- 
2.34.1

