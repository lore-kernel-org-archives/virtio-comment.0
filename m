Received: from refb01.tmes.trendmicro.eu (refb01.tmes.trendmicro.eu [18.185.115.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E4B54FA9
	for <virtio-comment@lists.linux.dev>; Thu, 23 May 2024 10:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=18.185.115.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716458533; cv=fail; b=uklbiYiw5VqBftPYK9zmyfK0AODinZBOANDHxVPPo2q/zlLyounyAdHZWScKfi/Fe628WUsB3QeY6vLWFkSGGz46IJEoGk0AKIc4+sx4mnirJsoEk00JDOgQ7k+bwOUdZ1+UKH7tM1/i0sulWRcM4V7xiu0RMoL5cMaxH/BlNUc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716458533; c=relaxed/simple;
	bh=jXTxRXOm2cYWLdjliw6om+eaja4ILFZTbvWfpuGTls8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=RU6aiS9AOVS5fxArN+cHc+d38NFfDiBDR+DMsGg0za6zclsUyaOJhkBJSmWFF1CvJ5gCy9yPJ5s2jkv6rp10NUezAgFoBQrP/KjxgxZusYVgq6lclb6Ow2Hhue0BiYI2SDR0u9vXWus80Z3MZdbHBw+J+HKkl42Hg8iKwzvgvdE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com; spf=pass smtp.mailfrom=opensynergy.com; dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b=K3ylvm4X; arc=fail smtp.client-ip=18.185.115.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensynergy.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b="K3ylvm4X"
Received: from 104.47.11.169_.trendmicro.com (unknown [172.21.19.34])
	by refb01.tmes.trendmicro.eu (Postfix) with ESMTPS id A6F56101371C9
	for <virtio-comment@lists.linux.dev>; Thu, 23 May 2024 09:42:15 +0000 (UTC)
Received: from 104.47.11.169_.trendmicro.com (unknown [172.21.199.142])
	by repost01.tmes.trendmicro.eu (Postfix) with SMTP id B5E0F10000C43
	for <virtio-comment@lists.linux.dev>; Thu, 23 May 2024 09:42:07 +0000 (UTC)
X-TM-MAIL-RECEIVED-TIME: 1716457323.380000
X-TM-MAIL-UUID: 32dc4dfd-7ff5-45ab-88de-ecbf0d960e06
Received: from DEU01-FR2-obe.outbound.protection.outlook.com (unknown [104.47.11.169])
	by repre01.tmes.trendmicro.eu (Trend Micro Email Security) with ESMTPS id 5CF1E10072459
	for <virtio-comment@lists.linux.dev>; Thu, 23 May 2024 09:42:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UJU5erU1upWi9EdS1GFyfr4HKoFivVAgBEODpZb/ppLfwGzOP/hf5VrqDIdE5302FdaJ3ELjH9ee2D2duxNqw1zu5zQ6xv9eLNkIiehIc4kQ8gWumGiF5X8GYJcE+wU4mHoZVFOTq4Pbaw15PzugY9fZz/7O5WfkjgRLeNzLheLsxQcbdFt+FGGo6OwZ4DKzRwlQB27NwYTMRqOa2Y6icbdhnSP7ydAFlVh7+362TU85NoXWU38NqlvwKUx9He3pxQoxRedypw/ohyn01N+7TssX8aMG887h/49Ii3V1wEZkbysUOBnIT4aM7aZKnSiZBvrk1qpkjhw3nyx7ojICSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Gbh9HuFFI+H2pgEWI6osUDwZu2x77l24Cjtqg2dpnw=;
 b=lm21FmgoMOHuzO0lsEEOk1h0C8HzoXDmIVjyqoKwqbSKEZiGRmv7jDNj6KXfwE72eBpMhZa5HCrIREljkYBoLmnuELyPN5yb394m7ThLedmo3SpYKbzhHtwQabiIE3QgUI/O4eci9NWuW4Q3fVltmz4KJ7MG/gCSkhB7dBbmDUNKCVibIVpUFSAmz4subXqPDqxJMwpHbpP319gzKFGMZFTVqPZpyGQu2cdmUNwkaakl2smFrRq8ss9byUG0sOsZOayMxfWuoZh8RlOyAWc59Ixz8B5oMk2C3foQ3eeREMbLc5UpVunKKAqq4z42HnKvmHduNEWdPT5GYK2q/SvS2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 213.61.166.92) smtp.rcpttodomain=lists.linux.dev
 smtp.mailfrom=opensynergy.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensynergy.com; dkim=none (message not signed);
 arc=none (0)
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 213.61.166.92)
 smtp.mailfrom=opensynergy.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensynergy.com;
Received-SPF: Fail (protection.outlook.com: domain of opensynergy.com does not
 designate 213.61.166.92 as permitted sender) receiver=protection.outlook.com;
 client-ip=213.61.166.92; helo=SR-MAIL-03.open-synergy.com;
From: Aiswarya Cyriac <aiswarya.cyriac@opensynergy.com>
To: virtio-comment@lists.linux.dev
Cc: Aiswarya Cyriac <aiswarya.cyriac@opensynergy.com>
Subject: [PATCH] Reserve device ID 48 for Virtio USB host controller device
Date: Thu, 23 May 2024 11:41:34 +0200
Message-Id: <20240523094134.554857-1-aiswarya.cyriac@opensynergy.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF0001E9C1:EE_|BEXP281MB0182:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b779337f-3769-4d5f-f8ee-08dc7b0c9908
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|82310400017|1800799015|36860700004|376005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?shr37/wC3O3oObs6sx1g5UcPbPpSA3NxmCunaey1spqCKDWb5Fk9bqcoOXjm?=
 =?us-ascii?Q?d03Z5ygoVKxK6SUHHNriWSDH8wHLdGua0a+xuz2mq5BjsRZsEkhGmS2LdTye?=
 =?us-ascii?Q?Pov1FNqH0fRW3bExj1CS1dnIc23VteOWBk7uQPBV/+LrdBYK24WkQtIHgPqk?=
 =?us-ascii?Q?rB8owhAqQgD3exZGMV5b0M7Xt5XKI/egD+piUGO7sR4P4b2TOeXA1gDobHhi?=
 =?us-ascii?Q?7rS86k1rmVwUT6o7ulqA8/hM0ckVyTY2Kik/2+a6xfdanOOpcFGzUtJZOCbQ?=
 =?us-ascii?Q?QeA88z1bjit6uBlFfN2KZ8I68oZwt0hqe7WYRsNSlFxiy931ADxEOHQ+DcNC?=
 =?us-ascii?Q?xtwVBWhCcz2zi+j0R/8rfKYOF4R+cwbMRSlhG7Vzu+eu0QzQ98MWvFZJJ4/6?=
 =?us-ascii?Q?9H5oEy/AQ8gjPh2uwSWOxPbJSad1VygmLoV0MOsOv9hzGC0qB+oPgsr/XnY1?=
 =?us-ascii?Q?bbJI12E0tq4qy4AM6cOykDZRH4ponPHZk2IxkcqHkQbWWivcy11sGEucy6Gk?=
 =?us-ascii?Q?LVddrJSgGVEg5K7Dk1KYDNmJ0Q5wmcsqXzlfBPtfCjWeiSJgACW6ZtmJr/br?=
 =?us-ascii?Q?njyoms59ZZqnZVeJyEMSHW12QIloV7qqqcCKjEi1kFeCB0/sdHHIGikOBw6q?=
 =?us-ascii?Q?jXpih7sGguhZyyWo4bD3XVZGoPf/ls4guqb70gQC044eWyqC+VOPY1UJhFP0?=
 =?us-ascii?Q?Vko/hgyzrZvBXSgyTe08OD7TKdGZyescX4NJXOYec0WpoVDvj98/WJ6iucXn?=
 =?us-ascii?Q?9O+iUP892ao6WMjefrtDbhD9e9VPWGV0h/4E2aOkhloM7DYJZjNaA3VdqaxP?=
 =?us-ascii?Q?4Ev04gDQbt4MXyj/8oVJGhzFsTg7RPkH3iakzHVG3zmA0JaFD8Y7MUIDjVAs?=
 =?us-ascii?Q?8oxSpUqRigMsn1onNR+Yb45NvQ2ERItmp71y+y96d3sgjfqPYe9FXm3bC25h?=
 =?us-ascii?Q?3zVWfmAOhfPh+yDaDX/2NWAZWm4180ryYwGUmAOYAZ4YG8+6LOp03pKesxsN?=
 =?us-ascii?Q?FQ1y9jm58z4ztlhDOHSSjySGQJ9mr+Nn95RLy43KQ7oa6gNfuXtQ05K5VGcY?=
 =?us-ascii?Q?eo6q59mU2kyAXK9zVsgbwrniQF/QIhv+frsckAThhERRDgraoJrlMh9c1gy7?=
 =?us-ascii?Q?ghE1xHl++fkfOqo25sP+TmJXhon6renC+S9tNHg7UKJYUL1JAxIprGdd841G?=
 =?us-ascii?Q?AEWwo4E+O7EL8LxTWP2OkCvWghSsL/OCqbI7nEJEHyiJkDxnEsQ/68+PM7dH?=
 =?us-ascii?Q?96oyFPkNYFcYXwk7JKEsn1OReRQLWBfQxaAk4FI/2oWJ6ktqe7oAUs2rOOEP?=
 =?us-ascii?Q?iL/9EJpo7HsxSk3Lf8/pWQNAN8ccEMP0byZu6fpPI5HXQF/hQk2FA7+BbEnV?=
 =?us-ascii?Q?0S7AU/s/5jZkA51SRM223aDyNtJG?=
X-Forefront-Antispam-Report:
	CIP:213.61.166.92;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SR-MAIL-03.open-synergy.com;PTR:exchangeconnector.opensynergy.com;CAT:NONE;SFS:(13230031)(82310400017)(1800799015)(36860700004)(376005);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2024 09:42:01.6000
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b779337f-3769-4d5f-f8ee-08dc7b0c9908
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=800fae25-9b1b-4edc-993d-c939c4e84a64;Ip=[213.61.166.92];Helo=[SR-MAIL-03.open-synergy.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF0001E9C1.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BEXP281MB0182
X-TM-AS-ERS: 104.47.11.169-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.1.1023-28404.006
X-TMASE-Result: 10-0.860800-4.000000
X-TMASE-MatchedRID: Eg8aHm4JSTW6TyUO/xKZhRG/G68S0AmWG6vAF77GsJZrIVA3IGfCC6DE
	DQa+uiKUWL15ehCslD56F32OFjccDQc1P0sfSEsd4Yw04rOVQ57aPuPIIqmcJ/p4OuSy0UFxr54
	JIx46I6SihsUobKWcAf6kpTgRY45JqDtmjlQ4FGkGhuFLY/rERHGDuy8y1qkuSPqUqJpSCRuino
	YECchmW9GkHijZiQHV0NZeLxFYiHCqehZX1XtDxA==
X-TMASE-XGENCLOUD: bf440e68-432e-4375-9c8d-ea1b62784231-0-0-200-0
X-TM-Deliver-Signature: 2EBADAB54C6D12C8285894913087EC36
X-TM-Addin-Auth: juj52PvF2/D/3xJmsUQkqmAQcdxFkM4JEHs54snQ3Lgl0Y4YmYp4YP7qOvg
	yu6SDL0T1nbP3rA4u1G0dvkp6kFlmTrAO215aT6PSiZqDi1OJYlyV3/ga5+cPG2m1IO1oAyDauB
	m6cWNKdfv+nuvjrBZBumvULGKvDffgPtFw5Zj2hck08z+GEHV8bGHuKDQDU36+FGELsCXbOed4x
	SVFY1hQKVJj3F2kV9JbtFLx7yahujYdLszi1c+H9cdyK+nwpe0kWY9pBYY/5XU9Eq0+0aRAagXs
	imm3nrvYWZ1pxM9EG2KJR1M+1Ajh1nAaeyQa.qrIlql7SQP/f33Sl4RXML2aSOoZoUU2EpRWff/
	m48EUi0G+qTbbgO6r4fi6Nv84QSiJFLFGfx40H5R4K2J2HdA2JZR25IsDS6jK/VtyR2j4dzc8d5
	1kQyNOGwmyBruyGi3K7SBC7LKtDdvCDVzE2ecM+jxayEFf1ChSwU0XHSExf8JTCqzwPH913bPuA
	ltA0QMF2cFYVVIdvsRUthBZZLQXVqCocLs+w9btzgTfalbFpyPlIjYwSKkiR2T9+tP6gBvT5N0I
	8i0DHK0ZxeAjpBpN/Bz//OHFyb27xCcgL4+QAe2rtWcPY11grhxIaXd/prpd9QMptVqTg8GgFwA
	VqWA==
X-TM-Addin-ProductCode: EMS
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=opensynergy.com;
	s=TM-DKIM-20210503141657; t=1716457327;
	bh=jXTxRXOm2cYWLdjliw6om+eaja4ILFZTbvWfpuGTls8=; l=772;
	h=From:To:Date;
	b=K3ylvm4Xdo7R/oTjmubeznbVHZLMhPHUhvFkdAh4EyFPRgMup7vHFdFvDwmPT40VX
	 p0QmSzSEVH5hBRJGLrn8pCYlnF2sVdSEI0fMmDyYdu9YgtM3PFESk+6t76v0/LmkEA
	 AFBhNQkREwJ8ihg1WSfgS00Ec5amHd9EYag3/oe5sIr2SBXtXXInInmJ5ccNdf1lcA
	 sHCQuVxyvkfJejXJOOwUeQCKaWmbr5fha4Ptk2K/e/42FdtfDol6j4SsOTBm4yg9ZH
	 7BE87yVGl1WXKrvhsGnVeUdWfsqIY3Zqj+vSb0DirwBsskpe2bgLmLkAGHTKM11vE7
	 fvEeavvN+P7Gg==

The Virtio USB host controller device allows USB peripheral devices connected
to a host port to be connected to the guest. The host controller device can
have one or more ports, and it allows the guest to have virtual ports corresponding
to physical ports in the host.

Signed-off-by: Aiswarya Cyriac <aiswarya.cyriac@opensynergy.com>
---
 content.tex | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/content.tex b/content.tex
index 0a62dce..dfbccc1 100644
--- a/content.tex
+++ b/content.tex
@@ -739,6 +739,8 @@ \chapter{Device Types}\label{sec:Device Types}
 \hline
 45         &   SPI master \\
 \hline
+48         &   USB host controller \\
+\hline
 \end{tabular}
 
 Some of the devices above are unspecified by this document,
-- 
2.43.2

