Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2075.outbound.protection.outlook.com [40.107.20.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E75211922ED
	for <virtio-comment@lists.linux.dev>; Thu,  6 Mar 2025 17:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741281575; cv=fail; b=fwm6FE+9G+3QUumyOLvW21IT2kN0vsRuTMtNTMS8bXscSIfTkv30OU9uDG2w+2BBBDeM9JDDzzR9mv44gzlELyCyMIZPBWO1haajdfs0/dis63fm8ApIBF0BwlCDfqObFhp+TJp8a+b7bgvkzPqK2ww45QSdXVxsafaD+TSSKyY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741281575; c=relaxed/simple;
	bh=VmE7GmHdNHE24Pb63On9JXJ3Ks/pSd7Uv9J/mnSoXCA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=ttTZKdp42/CX+n8uJUFZGRuMZAIguSiRgcxCyEekqK/i7Qh1UPRmfMyuJz6/u77za7hXWks20NrXnZ7dKDRNF1KTkmOAT02YElr+C8rdN6vL59r/MEk/aigkuZEEh3M77NfxJy2IRGM4iSIIXWO5Yhb9btcXJe3hrvpmgQ717r8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com; spf=fail smtp.mailfrom=nokia-bell-labs.com; dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b=Utf0JjwR; arc=fail smtp.client-ip=40.107.20.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b="Utf0JjwR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FQfnYJsk5jSYP38SxuWX0Vq+Ttr7QobBcq0yZbIWs8Et9LLf5S6wDe8NqwJWLnYdGGu8DKj/9FaLtJN9E8wEbq/m1eWQUoN17W3cIousnX80l1DtWQ6pZFYEItFWpomd4PxhhHupYIcMdUHiZrhBM/N25goM2lUu1aIjPRbJ2NFdGeWEl67zmLhqVL+QnidjFvE6h8SkSlAAr131S7P1hUMSTaFObI5QmbPAwEI8jCT+L5VQ4VmXMukhaX+vQUoLV3ggtpmwLnU1RzWwaf7BKGeJ/8v6J6tUKZu5gv26ClD4qd8dqFO+kr1cWadG+aLhIOZPJn+gYdR54xNMsu5uHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SgjO5CxZWQ4/UucCXQcg+v6Ua2q3mHUfyuxtZcA4hG4=;
 b=A3dwicX9mHLmGfHPAp9c4PuW3E7z5WMoGUkubMzZM6V0WQw3S/Uq0r6aHl7toTlha2tWNIFjQPlO7iJXJEYNyoYF1KPa5N4/ACvlx83Dec168EcfsASzHJsJ6Nh+oxTDcS1aTdcdqbE8VrdoeNFQHRP5q5Ci90YnspIJL0kqFewiJyqh6k3tSs71kDBOJxol52vp3JhSmawQTABgmKAfqnypoMRK7/dJRcPP/l9yyU3j+F2REvMb10dQGJQkCiqJsBhmVpTPRDsbJbldja7x5jOxY6PpVTmdElPhHMzTOXtOfTsoRMinZttZVeZ+5aJDbk1YMu1XD51W3YpGyZ8t2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 131.228.6.101) smtp.rcpttodomain=nokia-bell-labs.com
 smtp.mailfrom=nokia-bell-labs.com; dmarc=temperror action=none
 header.from=nokia-bell-labs.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia-bell-labs.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SgjO5CxZWQ4/UucCXQcg+v6Ua2q3mHUfyuxtZcA4hG4=;
 b=Utf0JjwRg3EeNxYRme0ug29K49G+CXHYa5MTShyzh4F4CmbELnumVo5KF2YWwd5Gd8h3edRc/VmfBEPmn9HLK0rqyZLwaWzMw4wsYVoLFSINh1/hN1ox7DT89gWHy5bU8RUWejLzgYCMl6JfsKqDECT6YmpGsdsc6pwgT5hECgnpCtV3WELy8gWL1iCOHd9ELPerMjMr/K+q9N6oNDINxDNQLfCd3M6/o0470hrr2UHcjiOgLJ0uP/KdbNdanE5BQLuDkaMxG5jRDm1Y6U5BJhr8idIjNICn1/yzIKgEYzZ+WEi+2eVOgj6TfGM80xQyM8j2YQOEwJS3YAK9VoUL1w==
Received: from AS9PR06CA0510.eurprd06.prod.outlook.com (2603:10a6:20b:49b::35)
 by DBBPR07MB7577.eurprd07.prod.outlook.com (2603:10a6:10:1eb::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.19; Thu, 6 Mar
 2025 17:19:29 +0000
Received: from AM2PEPF0001C714.eurprd05.prod.outlook.com
 (2603:10a6:20b:49b:cafe::a4) by AS9PR06CA0510.outlook.office365.com
 (2603:10a6:20b:49b::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.17 via Frontend Transport; Thu,
 6 Mar 2025 17:19:29 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 131.228.6.101) smtp.mailfrom=nokia-bell-labs.com; dkim=none (message not
 signed) header.d=none;dmarc=temperror action=none
 header.from=nokia-bell-labs.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of nokia-bell-labs.com: DNS Timeout)
Received: from fr712usmtp1.zeu.alcatel-lucent.com (131.228.6.101) by
 AM2PEPF0001C714.mail.protection.outlook.com (10.167.16.184) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8511.15 via Frontend Transport; Thu, 6 Mar 2025 17:19:27 +0000
Received: from sarah.nbl.nsn-rdnet.net (sarah.nbl.nsn-rdnet.net [10.0.73.150])
	by fr712usmtp1.zeu.alcatel-lucent.com (GMO) with ESMTP id 526HJJ0E004528;
	Thu, 6 Mar 2025 17:19:20 GMT
From: chia-yu.chang@nokia-bell-labs.com
To: virtio-comment@lists.linux.dev, mst@redhat.com, cohuck@redhat.com,
        mvaralar@redhat.com, jasowang@redhat.com, xuanzhuo@linux.alibaba.com,
        eperezma@redhat.com, ij@kernel.org, ncardwell@google.com,
        koen.de_schepper@nokia-bell-labs.com, g.white@cablelabs.com,
        vidhi_goel@apple.com, ingemar.s.johansson@ericsson.com,
        mirja.kuehlewind@ericsson.com
Cc: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
Subject: [PATCH v5 0/2] Update ECN and Add ACCECN feature
Date: Thu,  6 Mar 2025 18:19:15 +0100
Message-Id: <20250306171917.90460-1-chia-yu.chang@nokia-bell-labs.com>
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
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C714:EE_|DBBPR07MB7577:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 483c653e-4d64-4edc-c89d-08dd5cd30c87
X-LD-Processed: 5d471751-9675-428d-917b-70f44f9630b0,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?E5YeJ50s+bPYCCa4zVA2q5+8IUpHQIjHpB1VeJ7f1+eVjrdfRSlGc+ZT8JFO?=
 =?us-ascii?Q?tIGW7IlglBOzyfCNw0vbRLhHrncO3GNygUoMKLrl+5m158Lr2HFgKDD/9ikW?=
 =?us-ascii?Q?xkGGrY4nlNagIWanY+Uc278KRhfDRGjgy2Idq6++nRYyVH60C+5q2VqGiThj?=
 =?us-ascii?Q?AG4I4NPtQnp4f4LunalH/zX9+FSGTLR+TjJ+V+HGx8BDUyTVdGHRxaObSYPJ?=
 =?us-ascii?Q?NE+qRSpX9lmQmlpPQ/kfPcJ/Go/JVeeDfzeF0+3lt5PUiUpNdLtpnym9UFrH?=
 =?us-ascii?Q?SKa4tFr0pEICFjnx6EP84/n+O16v0ynQaylxRsUSM1FUUYrjv1cdQgQyiBmT?=
 =?us-ascii?Q?EE87Fg7HGSgzmj5DyiHc1t2F0c4VGc4j8hpoPejZ9Pj8aGdM8lvQqr1m2fbc?=
 =?us-ascii?Q?Gu2B6yPgFUeNEx9YWnADoBfeAsmehjh19Pp9xOlgBpdfe5Ecf/SA+O9lhtN3?=
 =?us-ascii?Q?lU9RaIDOWmwbGG2/iGjnGIvSMCnIi9TYr2wc9oslN3hhTc8fY0njgY3udcvF?=
 =?us-ascii?Q?iRsFS7nwqOy+f75dKz62cLcrTBgEG+cf6HD0UxDrOnT11AFhDnyhBJdV75UI?=
 =?us-ascii?Q?WXROpMKERLoycdBJSVt3eicmb9qyzcuOhpiprW9G7pZcZjKRrEAqL/w73Odb?=
 =?us-ascii?Q?5jw1dBsGCutL5Nxw5jKA390i1kSveEzzrEpmiZGQAHt+lDw9J5Xqef2/wqbA?=
 =?us-ascii?Q?47lPiSNBB2OckSr77UnqVgP4Ua/I5BUg0M7+0hgoJjFeXqaz4GQwK0+qGAAu?=
 =?us-ascii?Q?aYecncRK/xzOb46lC1kCr1iPXX9spqsgcFkYIyyPqZH6CSQRpHw2k/GsdqzY?=
 =?us-ascii?Q?B58LGWXqB7NSmuNbQ17kosEbbW403ROZdmIbMXwtrnvRKOVA+llqzVQxeE5H?=
 =?us-ascii?Q?6bCImzoQSPj3B1zaphl+m08uQGbSDoLGLaDvECPIpfNJEvHTm6MJCX3uQmGc?=
 =?us-ascii?Q?HOf63SWGH4ureAjkkzzW7/KyeCAxeA4Tn9xlbVQuvRJP+y1EF4vQD12WZUo7?=
 =?us-ascii?Q?LJ18t8c15SVTsKxJdXviS82cVBmkB+nOAL/qGRBpeWuuSiiw9OHntYRqZ8jv?=
 =?us-ascii?Q?Ly0in/VXJfCC+HLI3IvgQTT3/wGaqtoH6m8di764XzYwNTCjRgCDr6ZM3Btl?=
 =?us-ascii?Q?0YiL6xLGMGty2elMoys6Hi0XMsKdHPFhXQCElZ73cZA/tgBYkIY2+xpRKdta?=
 =?us-ascii?Q?D4eSYpP8MXEQKB4ld3sejbHx2wYr9s9GzZ5lpL879AZE7UnUNzZiYHj3e9q9?=
 =?us-ascii?Q?cEmlJaMqHcqqxusZEMeoQwdvH7hAmal5I5MyPmYHTTgA2cQLEQioXvvQZye4?=
 =?us-ascii?Q?p7iBO5LdgvyfBh2XoAMN6nZJvxpBdkcodqLQPtupC5fgj51WEnLj+sz5A0T2?=
 =?us-ascii?Q?kkIIAIFAe4E88wpV1cp2kHAt5PTNK62CvVrXxK3E4RKOvNJUJN66v6gkGFjK?=
 =?us-ascii?Q?uExB86GQ+f6OwJjd7OGnPKtujaWnDvo55/y/fpxJQ3x1v/QFGGCSPUyj+R5s?=
 =?us-ascii?Q?BsBrJDaf9K6a47b1UYRXVLh8PRmPJk4KJJTz?=
X-Forefront-Antispam-Report:
 CIP:131.228.6.101;CTRY:FI;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:fr712usmtp1.zeu.alcatel-lucent.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(7416014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: nokia-bell-labs.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 17:19:27.3308
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 483c653e-4d64-4edc-c89d-08dd5cd30c87
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5d471751-9675-428d-917b-70f44f9630b0;Ip=[131.228.6.101];Helo=[fr712usmtp1.zeu.alcatel-lucent.com]
X-MS-Exchange-CrossTenant-AuthSource: AM2PEPF0001C714.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR07MB7577

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

