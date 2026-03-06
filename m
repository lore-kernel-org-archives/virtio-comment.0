Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010029.outbound.protection.outlook.com [52.101.84.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B85035B64E
	for <virtio-comment@lists.linux.dev>; Fri,  6 Mar 2026 10:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.29
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772792231; cv=fail; b=OOr6nO8mH533H6A7Gy02loacC67MDUNS1vstVgewuEAgzTj0iCwbsFHt3hQtp3QV9Oa4LnflceaoXDgwBdhVVf4ie7PLO2BrzLS/Kc/wxPBozOLxD8wiVOTpYpL+JFOdLX5U0/J+y2CLXxlxcHgQxHK6w6mRz76Qddkp/2V8org=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772792231; c=relaxed/simple;
	bh=janwEJ0S4BcEhPYyjpKOyRZyydKUU4nkgAxK0cUy0A4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=i//Tp74E+qRI2gLHww4pZDYPc5IQO08CRK5tokbhww8uqxSdxRgkuPlSgiy7Rl9Pu+lCYdVyYv8YUMeCfhGmGCDI0UHejCb64SeIP/WbH+qNKy6482y8PPLfFAlWFTOapXoJauwh5m9u/YWusd4PGiI/fmv924buXXvLN6gqCdc=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=m8eULfe1; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=m8eULfe1; arc=fail smtp.client-ip=52.101.84.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="m8eULfe1";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="m8eULfe1"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Z+6ftu8zeKQbXQikLD/sSfkyjKTahIrMIv9PYB/rml7h8Qe4ooyydZ3ov1iiiJRE0Bcu7bW9t6birsd0leScpl80ylevIsYGwyzOWdOsm0s+SHZyj5tgBEUHXYTPLZvbH2DYolJPle0ns6clowvRm/tt8DM4Q6qjIhnhoelifJ5iEaprgk04Br2iOo6UD4rm3jL7Ucv5S5dgWUQ5vqsB7njMkD0q1j1AIJoIHQz0yy4AwGZljnD9+MX0o9yCZOf6Rnj9hdjvSqwcxcnaGw5SAae/rxLuZALVCguMh/im+MMGSKmLY9+Ec7D+PNj6FeIJpRZxw6VLknF2CqtT0BxyQA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gQKCOdhTu6wJWVnth83v1ZqTbnz4LBUhfhwnTMZkp+M=;
 b=UpIKxeuZ4+MgdDB0yUgvHoSctvnDw0rW+2pONWgDUMZkx1fSRB/J2EC0rLb+x3MfHsVDpxr7WQST/MS3w4t4zRvZyyQQe5n1ZOEsOnGJqjn93iZLlHCtWB5TMv+5PXMau1jyLMWgjbRpZk4EHykdcX/4CN8tMAh5ZV1O8VMKyc7J1u7R5ZnGWbSbsIHo0TaEb7+KTEHZsPZQsuztBw2mSrBJMxVGkg/x+GlxC/HBWizY8sxMppw0Eq4PRcNJam3O8WZauIbRkuIyo3zOGbFSpbUkRnwV3BiMzx4+kvyTXniTu4HefWwl85YI9n1IKr+qG+ECEqTJvEwFPv4UQBk0gQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=immunant.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gQKCOdhTu6wJWVnth83v1ZqTbnz4LBUhfhwnTMZkp+M=;
 b=m8eULfe19czy1iaG7x5ivjPEE6j9e5t8CEa3GeLukfNEaOdtpWL7wo4W45V6jKBAyquNvvsjXtbWDQne6aDTky7nt00c/AicFT71s7eHRcVHoTTO1FWUjWHB23F6EhWJX3IZzZL11RBp4YJTzix6bgGfAq1sCDL97vittBPuPi8=
Received: from CWLP265CA0526.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:18c::14)
 by DU0PR08MB9797.eurprd08.prod.outlook.com (2603:10a6:10:446::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Fri, 6 Mar
 2026 10:17:00 +0000
Received: from AMS0EPF00000194.eurprd05.prod.outlook.com
 (2603:10a6:400:18c:cafe::13) by CWLP265CA0526.outlook.office365.com
 (2603:10a6:400:18c::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.19 via Frontend Transport; Fri,
 6 Mar 2026 10:16:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF00000194.mail.protection.outlook.com (10.167.16.214) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.18
 via Frontend Transport; Fri, 6 Mar 2026 10:16:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MW6A/zimwz8id5637rFTreTTSjXHDF7qwzMRRZHGO8PCoZGttc9Cl8+j+6nc/cnKZqr2+wRCb+GbSQjybZJFeMqNp+iP3IuZ/9Jho1MPmOyUCWOmJloW5eBOaka5B1ldvBm5BxDdwurSwTXYo/kPLdFr83wDdavsKAn/PAAm3wh7bWnJMVdPRGY8P6VqBqNqqxFYYR9e7qc0oDKeE+KsITcYptWUJeJjGPslCJzUR5QYJF3tfOzuWRno4JKFwYA92UiIObh8xGLTWMlH6gvTErR/4QtL/FczauaZbdjcHXLXlYWNjAHQFHA0OO40VWmsncrGt8iQoHkSF080ZCqcGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gQKCOdhTu6wJWVnth83v1ZqTbnz4LBUhfhwnTMZkp+M=;
 b=LZchg311jMGaKnkQzTR9aFtYok+e6YdRZlf2gVBdWDYAVkUihEcSrzJoIukv4MThC9a6hpbBhhHbLFXMnUmXSDkJsoKwmD4oA56asSTdOUq10HG1sU4NeRp4hlFbmM9rvF0y6/VEqH2NSoQXtTxtsDUatQnjlzVRl+j5f0CP8wVcY7oi4W5pEsgOZnoNeY+N5FWzzCm3MwuwOR06h7LEO/tgv2j2nKmi8BgehWlgxFfQwteyT1Rw63GwVnYNQtpe5bCnpUNSlmH0C9u6STrH4ej+nmNfhMk+yCbD+K6YODKTAT+08C/MvWJ/sWsOZdMpr5jKHBpK+iuvWId8GO4qQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gQKCOdhTu6wJWVnth83v1ZqTbnz4LBUhfhwnTMZkp+M=;
 b=m8eULfe19czy1iaG7x5ivjPEE6j9e5t8CEa3GeLukfNEaOdtpWL7wo4W45V6jKBAyquNvvsjXtbWDQne6aDTky7nt00c/AicFT71s7eHRcVHoTTO1FWUjWHB23F6EhWJX3IZzZL11RBp4YJTzix6bgGfAq1sCDL97vittBPuPi8=
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by GV4PR08MB11275.eurprd08.prod.outlook.com (2603:10a6:150:2eb::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Fri, 6 Mar
 2026 10:15:55 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%4]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 10:15:55 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Andrei Homescu <ah@immunant.com>
CC: "Bill Mills (bill.mills@linaro.org)" <bill.mills@linaro.org>,
	"alex.bennee@linaro.org" <alex.bennee@linaro.org>,
	"arnaud.pouliquen@foss.st.com" <arnaud.pouliquen@foss.st.com>,
	"edgar.iglesias@amd.com" <edgar.iglesias@amd.com>, "viresh.kumar@linaro.org"
	<viresh.kumar@linaro.org>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>, Armelle Laine <armellel@google.com>,
	=?iso-8859-1?Q?Arve_Hj=F8nnev=E5g?= <arve@android.com>, Ayrton Munoz
	<adm@immunant.com>, "ayrton@google.com" <ayrton@google.com>, Andrei Homescu
	<ahomescu@google.com>
Subject: Re: [PATCH RFC v2 1/1] virtio-msg: Add virtio-msg, a message based
 virtio transport layer
Thread-Topic: [PATCH RFC v2 1/1] virtio-msg: Add virtio-msg, a message based
 virtio transport layer
Thread-Index: AQHcrQlLysg74l+ZHk2KzSlnonD7CbWhJmeAgAAj6AA=
Date: Fri, 6 Mar 2026 10:15:54 +0000
Message-ID: <E989448A-A3F5-4F5D-841D-1A42DA169056@arm.com>
References:
 <CAGynJTUcVGL9mRVirKo1R8RK1Ftz7fy3HhF2STdXg-FwjPJLSA@mail.gmail.com>
 <1D3EEEFF-BA9D-4A33-A824-A903480FF940@arm.com>
In-Reply-To: <1D3EEEFF-BA9D-4A33-A824-A903480FF940@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.400.21)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|GV4PR08MB11275:EE_|AMS0EPF00000194:EE_|DU0PR08MB9797:EE_
X-MS-Office365-Filtering-Correlation-Id: 269a9573-27a5-4295-1ebe-08de7b697fc8
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 0Ev8YvP7jKFh4ue8GxRAK0omehyxeh2CVCZOqhP+35//K6oMJaoL3E5eHyaMZDJM9bAyspFCF+aFvYMLxoIM37PWjlp2bQ9yYyh4kmJT+DyrlBOnCNZRMq5O8FJlUhLLCMq1qtlY/5HiAGmPym71MTslr1Bnzn9Ka+yeOeBLeBHa/43B7wQp68WnCVeWdfgqWI1GcWb9T7N7vFPK7vkmFkRpgft4II4MgigF5/fYwGHf1QJsh8GeXfj2aGoFpsuS0wS/7q9h2EFjiel1nIcP3Nsg3vOfFZjgIWJj5maq8iVVzgn1L9vcibxICw0SwTrpfZ6NS4fR/Dba2W5ISjkjdSZvAw9JfcU07oDSqtYpwwgKxkHNpYZhqMJtsiuWYUwRsykRuY7HcZ4HcmSRzHhOzYvH0GLWoxpc0o380AyDO8+RK/hJ6a4eQ5Dr5eodwS4/g6LhHSzghGKJ4+Q5UkNyBvqtRab4nwNsQbWH8deQnmONmF59Q5quIeRkGwDHLr59GRY5qPbyhRgUEifQruTLJ96Kx2Zzgnz6fedr5zA+KEkQZN/FqBIqD/IPve5Pyq9NpJBWAfhqw3pv/sRRcooPIGtSiTPT+xq7WDIT9Aw+a95EPmke/ocyYaEAYAwhmGN6A+9wl8DAIuzHQw17yMDdSzthUBTAL1hlKZwoet0pHTd74u1qIrF4WXh5oJIE3vVSd/GDG9OFUQzn5R5vWvjGLny2/ZpsPx/dclwW90KYxoUiWLWhm0G3lh9RBgIFSCDOjgQw+7t6P2Td1dRNhfEiQ1usXM8LFZTjmoKJTL8x3QQ=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <BC6BAA34DB65074E9891FA2717F76700@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR08MB11275
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF00000194.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2ae6fc37-d92f-4946-e4dc-08de7b695a53
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|35042699022|14060799003|376014|7416014|1800799024|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	kI4dHf6rfmCpYF+XXSjYlgf9xtCEAsH+1w2gX3cfeeLqDzEaj6k8KHCHyJWCen1suZ5YZmNOi1iwGYwLgOd4Y1CGqm1iPzubWuTXpwpMgBnnwa2IWi7/KTILiQGW6Ga8UDOoqhqAA26HGlq2LZUWtAbYD4Mmtg2KGl8N06oRwsxrz/U2w3qzZEwgVcwkzGq7VlCZUv56VK8VrO6FXMuIUPkLuBmGM5uzGvXcLJ1U5CF0mbcxoVOwLjm0wzOMctuimdiQfr0EE6lQuHbKX/gRdfYvqP8jndPt57CxzgCMc0vhUBtP+hYDwCfSdVAew7ywXXYhLd6ayWilBdI/fOz4WHYuwVF0Ryf7RfstRUTb03oPYg39EWfMo9m+3f8YiThwiWZSfG2WsVe7DNdMM+wYYppVBtYclA+r/DlViTf1gjTfmrhfIvrcNkvmNTjk2dv+ID/Iutv0BO16vGPP1dnc2YuBKYpbadjOrFHAVdraS0IKovukzWKvCPvNHgvYXKjpH9eW1bbwnjUBu7t5V8PPr9pBy5viPA9O7k8+pLt+ViTHc5dN46HXYPZ7nVsLjZClYNuN5r5kEGLqKs1ixXiT5Fgr9buN5PPXxNMWc5XOtY41w2YFp2SXHg3wDY/fcJrpJGfEXKZHghgAnzsGz2BzavHvEL4Xb89R6+BDgO1vCxyneE/c/KoebqLtVNhnXGOINu0gTYYWpVWwyR+2ZWtK2Mz6TikE5klfkEFH+/ByYg3+5KBrd7ah7pGg8dhBq0zr0oX5OeJvfmHTcR9oUnJsKg==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(35042699022)(14060799003)(376014)(7416014)(1800799024)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	kEo2lILF4wyd5RL/8xSo8YM5wZyqYZ5uPafLi1gPGgdIaQ16eCj5/Ht8OOPiFTluk2JWwAvLH/SM0hXBiIY0RAPUIoGXxHW0UDAQc0WzNq3vuc8+DTWv782nqlx4XWXyndFGF+ZHDwWalwmvrKFgbFTUOIgJSzThHDSOUEQweeqWo5NnMy5P9EDOfclNqpI+gin/Z9EF4jizBay3RMGmQJT8y+WOpgqNdZrej3Q6RVzclApjvC2mniU1wFBxofibCPwOegQklE5VfydPhDUCOHr2h3I48WLq/4mDahh9vpWSHPm3SwpjdnAFlK9+xEdRTf4f7V70mjdlzSlmfnMq+hpiEEkAg2meQ606425xRkzzMmNRuv4giGN6r3cycM6O884gormr9QKE/DxygoGP3Xhf3q+o2J7Tyd7rxoq79hcRQsG83+TB1aXPvnuWRWs/
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 10:16:57.7709
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 269a9573-27a5-4295-1ebe-08de7b697fc8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000194.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9797

Hi Andrei,

> On 6 Mar 2026, at 09:07, Bertrand Marquis <Bertrand.Marquis@arm.com> wrot=
e:
>
> Hi Andrei,
>
>> On 6 Mar 2026, at 02:33, Andrei Homescu <ah@immunant.com> wrote:
>>
>> Some minor comments below based on the Trusty implementation of
>> virtio-msg, and potential future issues for implementers:
>>
>>> +  \item \textbf{Number of Feature Bits}: Indicates how many bits (orga=
nized in
>>> +    32-bit blocks) the device uses for feature negotiation.
>> I think v1 required this to be a multiple of 32, and would reject
>> invalid values (might be misremembering).
>> IMHO it would be simpler for implementers if this was "number of
>> feature blocks" instead, like in other places.
>> Is there a specific reason it is "bits" here?
>
> Yes definitely and i think this was already pointed out by someone.
>
> It does make sense to clear this up and have this work on 32bit blocks an=
d
> have a number of blocks in the header.
>
> I think at some point we had discussion on the implementation impact as g=
iving
> a number of blocks here but a size in the header will require to do a con=
version
> where having this saying number of bits could make implementation a bit s=
impler.
>
> But looking at this more deeply i think the multiply by 4 and round up sa=
ying that
> unused/invalid feature bits have to be 0 is making the wording and logic =
simpler.
>
> Unless someone has arguments for having here number of bits, i will make =
this
> coherent and use 32bit blocks here.
>
>>
>>> +The driver \emph{MAY} issue new \msgref{SET_VQUEUE} for virtqueues tha=
t have not
>>> +yet be setup.  If the VIRTIO_F_RING_RESET feature has been negotiated,
>>> +individual virtqueues can be reset and then optionally re-configured.
>> This implies that the device should reject SET_VQUEUE for queues that
>> have already been setup?
>> Or could a vqueue be configured multiple times?
>
> We had several discussions on the subject and there will be an enable add=
ed in set_vqueue.
> So the idea will be that as along as a queue is not enabled you can recon=
figure it.
> Once the queue is enabled, you have to reset it to re-configure it.
>
>>
>>> +\msgdef{SET_CONFIG}
>>> +
>>> +This message is sent by the virtio-msg transport driver and requires a
>>> +response from the device.
>>> +
>>> +\begin{tabular}{|l|l|l|l|}
>>> +\hline
>>> +Type & Offset & Size (bytes) & Content \\
>>> +\hline \hline
>>> +Request & 0 & 4 & Configuration generation count \\
>>> +& 4 & 4 & Configuration offset in bytes \\
>>> +& 8 & 4 & Number of bytes \\
>>> +& 12 & ... & Configuration data \\
>>> +\hline
>>> +Answer & 0 & 4 & New Configuration generation count \\
>> Is this a copy of the generation count from the request, or the actual
>> value from the device?
>
> This is the actual value from the device after the config changes have
> been done.
>
>>
>>> +& 4 & 4 & Configuration offset in bytes \\
>>> +& 8 & 4 &  Number of bytes, or 0 if rejected \\
>>> +& 12 & ... & Configuration data \\
>> Is this empty in the "if rejected" case, or a copy of the request data?
>> My interpretation is "empty", but perhaps this should be specified.
>
> I would say this is empty right now.
> It could optimize things and prevent a GET_CONFIG if we return the data
> but as the data modified might be outside of the area touched by SET_CONF=
IG
> I think it would make things complex to say that you can get an error and=
 a different
> area of data that was modified (and device does not know what is the cach=
e status
> on the other side).
>
> So I would say empty unless someone has an other idea.
>
>>
>>> +\busdef{GET_DEVICES}
>>> +
>>> +This message is sent by the virtio-msg driver side bus and requires a =
response
>>> +from the device side bus.
>>> +
>>> +\begin{tabular}{|l|l|l|l|}
>>> +\hline
>>> +Type & Offset & Size (bytes) & Content \\
>>> +\hline \hline
>>> +Request & 0 & 2 & Offset \\
>>> +        & 2 & 2 & Number of device numbers requested \\
>>> +\hline
>>> +Answer & 0 & 2 & Offset \\
>>> +       & 2 & 2 & Number of device numbers in the answer \\
>> How should a driver handle the case where a misbehaving device sends
>> back more devices than requested? (in other words, if this value is
>> greater than the device count in the request)
>
> In theory there is nothing wrong in the device deciding to use the full p=
ayload
> it can transfer. This is not really expected but I do not see a valid arg=
ument
> to reject that.
>
>> Or is that not misbehaving?
>
> I would say it is a bit weird but still compliant to the spec.

In fact i am having second thoughts on this one.
The request explicitly came with an offset and number of devices so the
answer must honor the request.

So I think we must:
- consider a device answering with something bigger than the request as
misbehaving (non spec compliant)
- allow small answer if there are no devices in part of the area requested
to prevent sending big zero data when possible.

Cheers
Bertrand

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
