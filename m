Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011046.outbound.protection.outlook.com [52.101.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 123E319E97B
	for <virtio-comment@lists.linux.dev>; Wed, 25 Feb 2026 07:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.46
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772004444; cv=fail; b=Rii1m8iC1umv7baFq41HJDPDrvN74KIB3xt9s0IPQc/repOgPhV2V/xugMbRYxdB8e+7dr2Iy2onEETqeECzV1+/SeOtgzvydW4RX8f5BxY4eby6O35ug9/moL1SWhb9xLunTYUqvFDLrF6rU7kdjG7i9X2Gc7/KejrS6Q4RFLA=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772004444; c=relaxed/simple;
	bh=kVJ1+amOD3gBtrbzFA5GJrJczuMeH6uGBXQNcUy9vTA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Hn7w+JZj/H/FVgAYkuWPRV61Y4cbmKLRDbPSnZo+8yIV+ab3LmtS5yo2btTxok93d8Ns7w0XW+ETzuwoI2Ryx0bGWyjQk9qZLOLPrQa28rCZNjybQkrEjzmznTF+oGQa9hevFJ/75EYGTv1vDg5NfE+ocL7847XBDrjBpzg9Xi0=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=VFhKnw7V; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=VFhKnw7V; arc=fail smtp.client-ip=52.101.65.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="VFhKnw7V";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="VFhKnw7V"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=UBgR+WyNRzaXqQwglDjc2cjI3kIgbbok0YxvK44Oq65w6FEHKx1JyGo+MdAO13camhj8AzND5qSN2LXg51dvcAlRTGvsaQw6b8zkAs0PUFHcepIOWZcDTGEM8BdIovlKYQbYOBvulpAKY/YU87iWml6ecDbaykEmAx8avv9qfAUOFsCzl8ZDEscvEwjVrPaua4cuntSlBG79tJgE40OVGrWqaHRYN1BdgFKNhblh8dyz+7e/Dgo6dErXv+SYRg2VDnAglJZxWzpRYlf2prT/KYkjH+otBrE9pftrASYwTtBhAVp+KHsl48EY8F7IrY4HF6LooWqSHfXNmLlgTq+FsQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kfgXZwW+3uaGmskUwCXNkJlcFkE5XySvjEeHq39/1Ew=;
 b=WgIp/J8i4vBKX3cFZR7clSSG5oYLgqGl5BxyLSzIca+8/faRCaBlfNACLeEkX4bCIb/dAK0dG7EQs/vZRxzmLhAoyYcRaT59hNVeTwe8tayc1BkiBoeAu+yQJ9SB2cZCpXlMLTqoSqcSIdp4ZOAj656p6q59gKUA8Z3lR/lvXLbaPF4tLOhmYLokAP8yDJHaKUevsj6l7fqlRA1Ym7tVNBomc5rWJIEuyZDZzM2QE4YCHG6K6YdmTgO7UtqWRjRjN0PjNaVIRJgZlxiQbYlmLJxmsrZdlDyGBXs3+429XGLJCR0tDKb6njKlVXS64Zo91rqU7rxQoohNjzIfPA78dA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kfgXZwW+3uaGmskUwCXNkJlcFkE5XySvjEeHq39/1Ew=;
 b=VFhKnw7Vxpyl4PnM+iPo93sk9Rr2kT96rB1gdh72AzBW8vbmtMD90oPKqexVz9QRQJWZHz2UPa58O3G5BhKNNBrc5a/S+MeGfHWs9qvw/A9JZ7rIeCQMSgKAuMRkFxY0aczXZufkiHMblYCY/lFR2XgkhNGf+Yrrx1CoYw4MiAg=
Received: from AS4P251CA0013.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:5d2::18)
 by AS1PR08MB7514.eurprd08.prod.outlook.com (2603:10a6:20b:481::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.23; Wed, 25 Feb
 2026 07:27:13 +0000
Received: from AMS0EPF000001B7.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d2:cafe::cf) by AS4P251CA0013.outlook.office365.com
 (2603:10a6:20b:5d2::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.23 via Frontend Transport; Wed,
 25 Feb 2026 07:27:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001B7.mail.protection.outlook.com (10.167.16.171) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.12
 via Frontend Transport; Wed, 25 Feb 2026 07:27:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V7acG7of2IHazJMqCPK2OCfDaFQP3/p4+c1RqSLaCY3BH3swrrqSGMnuLQwMk7psGlxQqtXLFk2nu/AiWy6yE15iyvSTUN7/a2g1UMC1U9I0Wp8UqObt4GeSA2VX4+OHp5aPF4bV/1Ezo5GhJBGOrBi9uZYqjARjZqkdJgA8RlRQSf2lybkx3ZDbOo6z2V+eWOVtRRUPzPbXtJFaCY221HC6ezzCvW6gXrWnnUIVNNVoqb35Pm5VnSQ5FuNMjP7zHVBg0xj7EtmxbjUigagCmcsiezgN/I+G+Q2VocgEdk5KWmLooDCy/8e0gWzF/ixN4e5TSHHjzqfW2XZANRpIsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kfgXZwW+3uaGmskUwCXNkJlcFkE5XySvjEeHq39/1Ew=;
 b=NA0Wd5XzOGGyCfGRQcyZJY1OsIUcixpgi2EDifCrMmT0xm9b6RMeox9OtPoYE3Kef4+2M6fN9FGBgdNCnQLzbkVrpiLcKlv9hCKtlRvLREgHyMyhEBvf9jqTiE2Bpw95kkQ9VDky/iMD03MpT227vyhM1Pu1K298IXeogbRXp5KaAQpC/gQiPGVtKfOv9ieVvXhvNPrX+aKQINwinrcTTurz7X0P31lF3VhO/KiwW1zOf3zLRR6fAM4wAs9u8zyhyKemllykB1d6OtUqXgVpXBIXI6UAD51diiUzEMi7HVdjaWVC7XQwnJIRV9rTvnfEF+yPdi7MregR5WfHBxyj1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kfgXZwW+3uaGmskUwCXNkJlcFkE5XySvjEeHq39/1Ew=;
 b=VFhKnw7Vxpyl4PnM+iPo93sk9Rr2kT96rB1gdh72AzBW8vbmtMD90oPKqexVz9QRQJWZHz2UPa58O3G5BhKNNBrc5a/S+MeGfHWs9qvw/A9JZ7rIeCQMSgKAuMRkFxY0aczXZufkiHMblYCY/lFR2XgkhNGf+Yrrx1CoYw4MiAg=
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by DBAPR08MB5592.eurprd08.prod.outlook.com (2603:10a6:10:1a8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.23; Wed, 25 Feb
 2026 07:26:09 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%4]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 07:26:09 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Demi Marie Obenour <demiobenour@gmail.com>
CC: "Bill Mills (bill.mills@linaro.org)" <bill.mills@linaro.org>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>, "Edgar E .
 Iglesias" <edgar.iglesias@amd.com>, Arnaud Pouliquen
	<arnaud.pouliquen@foss.st.com>, Viresh Kumar <viresh.kumar@linaro.org>, Alex
 Bennee <alex.bennee@linaro.org>, Armelle Laine <armellel@google.com>
Subject: Re: [PATCH v1 2/4] virtio-msg: Add virtio-msg, a message based virtio
 transport layer
Thread-Topic: [PATCH v1 2/4] virtio-msg: Add virtio-msg, a message based
 virtio transport layer
Thread-Index: AQHcjuFmIzYveS1Rqkq8YyoL1D1kt7WSRDwAgAABvgCAAAdkgIAA5NcA
Date: Wed, 25 Feb 2026 07:26:09 +0000
Message-ID: <3FA3C45F-879C-453A-8ECD-54D75F6D03A7@arm.com>
References: <20260126163230.1122685-1-bill.mills@linaro.org>
 <20260126163230.1122685-3-bill.mills@linaro.org>
 <2a935201-a198-4ca2-ac93-22bd295214c7@gmail.com>
 <84625A5E-87C8-41FC-A673-BECFEDBB5F29@arm.com>
 <a733cc58-d40c-4524-a43a-2cc53be9a026@gmail.com>
In-Reply-To: <a733cc58-d40c-4524-a43a-2cc53be9a026@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.300.41.1.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|DBAPR08MB5592:EE_|AMS0EPF000001B7:EE_|AS1PR08MB7514:EE_
X-MS-Office365-Filtering-Correlation-Id: ff7ab375-837b-4bd4-93cf-08de743f4b4a
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?LHPkvFi/tKqlKvjOSz93EHBe3sI5V2pq5Al880oEJTVObVyrMbyJPXAOKV/s?=
 =?us-ascii?Q?TQR53uiCNUmAnjodvuWiA0zagvoUjdBrj9G1HI7E77SPqud2fniUjsqRV+4z?=
 =?us-ascii?Q?4FKFzk2DZ84yPmsUMFebcVPcpMsb7r9K/6UifOtkpNWau31pWoy1Qlol8/Ni?=
 =?us-ascii?Q?NIPh3d7ZpZjorWOuKV2qHVg4IJgFDyv6a6yCg5ai3NCcp5G8ZuKbAcAlcqT+?=
 =?us-ascii?Q?1zrNm05riC8oPOwfkoVkjurvwILS+dI9WtLfHBNEEOaMp7DmPEe6HsSBgI5C?=
 =?us-ascii?Q?XOxTnnQhpIy9d407kJXAH7dSQh3M5s27G3oJR5CQjsFxX/M2NOWakzKqqICn?=
 =?us-ascii?Q?WT1qEMlh0duDxAQEURGhqGWmWlaN1C42Sy1qsJHMWPfmQi2QrhcdOV30Dgmo?=
 =?us-ascii?Q?3SJf43mKpt3Usv92AMmRLCwxOgOTTWyuJhhzKf61c9HdaOUou2EWZ8yLMqL4?=
 =?us-ascii?Q?55OoA20s/cp/ofPZCpS9P5SG/OHlCFDVChECrcCAZW3W41aQB//lGjJSrJwx?=
 =?us-ascii?Q?fyT+Ot4c/KAlQwa7W8ZST1Qey/+lKjEzA9N9WWPikTnxiX81oNs3vQuWvjNt?=
 =?us-ascii?Q?1KzKBFmBrlxNpzJtAs9E2VxwDUlNF84l/h0uQpu01oE3ZkC4qzaNvnqrhQRt?=
 =?us-ascii?Q?QuaSD36yjHLILjRx30rGwkOKlYHA+nP24iP/M/kWhzUFfrfRJo1960EiRgZK?=
 =?us-ascii?Q?ViSMZS5KThwMU/kj5Yb6Way+prF1+B+Ry26gX/jzHCQHTPvygwlvwcl57hDT?=
 =?us-ascii?Q?dBywQXOMn1dTMO1rjE6ETlUeLrdoX0U/hIuR9u0HHsxopKEtt5KOL7DtvIxF?=
 =?us-ascii?Q?nnQWD6SdP49UcOtuN4MA2ECQrjR+M42hH6oHh/P0tWhDkx98zQC3YQho5YL3?=
 =?us-ascii?Q?OBiwFHCRbDO127zw9dJc+seruAH4qoIgxxQrT9sdihwxnWKfQZuAfkzlv5jg?=
 =?us-ascii?Q?bsgV72/RMp6vXfET9LieL13hCQHXoxJp05ynhOOulajRe7YH+/XHqF8JUjto?=
 =?us-ascii?Q?M8ZFhm2eKsseHQCzL4+ZaNfwzEX6EP4IrGwtkLz+sPmF1yykYVBoSIgwHURW?=
 =?us-ascii?Q?KyvK5kB10gAbh3hkVCUko+rjBgAevfBwPMekiwSnbNKwcCkSY970b8LPUnK+?=
 =?us-ascii?Q?FrQJ3Mu68kYMUOAgC9Dr2YgIGvhzSSNzBx5Mj8rwXh9LMazrkzdduS4zbfSz?=
 =?us-ascii?Q?XlOTxcZtdFX0aUcEUnUvS2j5xNtVm1HUhG5Z0Sui30cLClO0wUxOoDFZCQ4z?=
 =?us-ascii?Q?k2HkLsrviAdfmEOfb66XdX6FyW3VyfKhzTT0+VMvHEPRa7B9vMXAyF+INA/S?=
 =?us-ascii?Q?qu8fruXbXnz2vj+ehVWtjaFr7VlQoPdjfvnhS5U6RsEvojMHK5RGdgcucgmj?=
 =?us-ascii?Q?+Kz0Waqwz1gIhcruxL2CXNARIH9bORU+tP48qYZxN0g727T3JAudorfGJK/d?=
 =?us-ascii?Q?U6Ki2ZMEmGOHxI2cVSaLqvv14cUdmu4iYJjk+AIAd7a2RTlBrulqtQlFco0O?=
 =?us-ascii?Q?qMRk6vFr1YrYY0EfyysWbCBunFK9CNzSTBagF7MniojGt1U1A0JrSgQcKGC4?=
 =?us-ascii?Q?Raa3XqtARqxlceA+sLIZpr7ZBoYSMv5wqtnLIb+V1KQGTiRO0QjvZm1GtZyb?=
 =?us-ascii?Q?Qci4c+JMiySBJteLzhaqeJU=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <0830961A2D21ED489F38CB6E4C47AC2E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5592
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001B7.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5db6beb5-17d8-4db7-69f9-08de743f2561
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|14060799003|376014|36860700013|35042699022|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ompfh0OedQK/SaOThpQc2dLuLqHehLKmrJcrMzr0gZAy2I5RY9ZV0pTFQ/ZY?=
 =?us-ascii?Q?uB0UzvFiAXyenlRUS/WnZ97uhmnQ1prEjglgmUTFYOAvfXe1/Aw7NyT24yon?=
 =?us-ascii?Q?6w8HPEzjl6dByZEYdIxrTNwgIpwDHsf/eQqoIGWlhgrChXf3QiJPQJyqiePd?=
 =?us-ascii?Q?wVPaNfD7GVUO/gZO2DMYG+6LQ6sbNO4GaRao78t/nZSyZ1UKpivrb6/Fp6tq?=
 =?us-ascii?Q?goyu7tRHAG2x0Ih4ooSdTaoSs53CwTnqBz/V7lK8O3B6BBD94cSiA7fl/QW7?=
 =?us-ascii?Q?OeJhPbBo6zAKGx6BmhHi/QFt1SZQYmV5xpLdbAd3G3mKWnWajjbTZjm9vPHo?=
 =?us-ascii?Q?CJMQGCweXGYRIRrXGz82yq8vWC2WmFQohdTpJQsTloy+yhuhS7r91U7nM3z8?=
 =?us-ascii?Q?Cmo3vxubkjDVrODoK7cQbnpBXFtj7ztqbNS06ZD4jS7cZpqlvHfD+M8Kn8ks?=
 =?us-ascii?Q?D+Rr+m0NOOJKpDnyzLHugOHIziHP7Rd+uwYqTD6IsI4o/WRBJxWiP5Ebq6A5?=
 =?us-ascii?Q?s+ymX5GJD9hKjjaKUnsn1Qlh9SvbhG4lS7VrIGYwNBFM2urVDMAvOdNtEAHT?=
 =?us-ascii?Q?lB9uP8wC1hzfCmmdTuXMOlTf5xGUTa8iNunGCCRGE04r/VE3zlTbirraZtnz?=
 =?us-ascii?Q?ULbgqRNylQHCvacutdKMebh5xiD7Fsu77uSjJrBUs9d4OgaIQSE9NML4+rTU?=
 =?us-ascii?Q?rY4HSZyqmv2DahocBtfiZwxV47syFKysaGP5HStwAUydvwAJVH8PB1/Li/Sx?=
 =?us-ascii?Q?tRgsqlOEx26RvYUc0ntUFZkHCm3/aWQQ7Ql1cLJuwK5A3MsCd24nw+7ALem7?=
 =?us-ascii?Q?sOiCLa4UAgB9tVx0573pWcPBdpumquDAvIzIeX3DfZD8janJJr1NrgprCm4o?=
 =?us-ascii?Q?Q/XbWW8/Lat23sgid+zzDs638dGd4N1AE3n6PwTkGJH/2DP/g/9waUJHc3dW?=
 =?us-ascii?Q?fI0uGGc1dw7xmm6lwVM/0gT35TKe4TQ90zxOBYPnBVKhc6UXdfK97QUro2Sq?=
 =?us-ascii?Q?dYa5klnm790O154pKZAx7RgpozQWTd8B2DM6hDVIndGq/h1hmYuzUKdR97wb?=
 =?us-ascii?Q?yCEyqsxRckBlKj//hszyFdsXI4FUzLWNDpMD+BtgCSa6DngRX1tJlJ95K/EM?=
 =?us-ascii?Q?unOuJT2C3uKrqj6Vd0hWZIGrUu4YBxjkXeTkC5s4L6wS9MPhThEJD4oFyRgf?=
 =?us-ascii?Q?bKr2RnTgucYk8qiStIdvVJrkXogZxWQuRqtAbYIx6aQeg+oIAYfhlObEezsN?=
 =?us-ascii?Q?e9AGADcvV140mLUnxZVfsmTcdey1Odl7wqBBu/M7o0ZlRahjAUBSoys8gFFM?=
 =?us-ascii?Q?VN1nfKmYyUvGnfBG7Q7NkFyjVZ+pDxITblFObfv+pO3F8IOMfnQKDmSYz+m/?=
 =?us-ascii?Q?qlcBzDfAD0++t8V23g4CE5KeC+jAB6aiNhcx8zWdXbCdjtnPpGIxAv+H+Yxg?=
 =?us-ascii?Q?+jtJYc2hRdTh4G+6Pad5qdQZmBp6DsyAhndjg25DaB92PEGSjOFUhoIBRffO?=
 =?us-ascii?Q?TaaY82TXkhpmS4KX6TqLXTGs3N6RPQxB7vHdVkoDBVifmSCU82hvrB41sXZ4?=
 =?us-ascii?Q?rPwB0fImmf3svG2aBfnidf8U0HlZscN07TqPL5BMlSbGmqIvL4GBPCuWBPwn?=
 =?us-ascii?Q?HNqAaCA+rG1MXRmbdR9vDg2Rw+cLWNJE88HSCU/tUaY4WtfKl92CLtSwBLhS?=
 =?us-ascii?Q?6AQfmQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(14060799003)(376014)(36860700013)(35042699022)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	cQARUpwWp+4N0EwN9eYZ5IDqG0QNhLX6fI1WMI7T+3C6UTc0A2OPFuejMJ+JmNNbGH+dCalYWmTeEQ1zlDDHD1uKnRDbDDTY0Pxtj7WXhHY47RVYa//P3PWJWv4uR/g0G6kb/Mkv+csdf5XYi8f3bJghpNe7xOO2O/LRS/gq6dui61Y/l/oQDv89Ev2xYJEkI64FOkIrfzrnFx13jZsXacMT3H0WHRltrQb3MNTllYAhGUL2y1iD6ofPmhRjBz6GXQYB/DePBFKrPlSxtmEqDhvQeNPFSQuHOhC2H1Su5dxkhNvr0gQfRB2UIBBQFvYdeVqkzzj6vbLns1yH4sbFSNn4JB1IMzI8pKjH+vnyCBhWltdsqaiEuW00bGCWC8twQvp1NVO0IEYEbh9tPEVCxJMoV/ASF2LACZw9z7INpVojk5GlrViMvQ7IQy4EqRP5
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 07:27:12.7096
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff7ab375-837b-4bd4-93cf-08de743f4b4a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001B7.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7514

Hi Demi,

> On 24 Feb 2026, at 18:46, Demi Marie Obenour <demiobenour@gmail.com> wrot=
e:
>
> On 2/24/26 12:20, Bertrand Marquis wrote:
>> Hi Demi,
>>
>>> On 24 Feb 2026, at 18:14, Demi Marie Obenour <demiobenour@gmail.com> wr=
ote:
>>>
>>> On 1/26/26 11:32, Bill Mills wrote:
>>>> Add a new transport layer that is based on messages.
>>>>
>>>> This transport layer still uses virtqueues as the other transport laye=
rs do
>>>> but implements transport layer operations by sending and receiving mes=
sages
>>>> instead of the "MMR" reads and writes used in virtio-mmio and virtio-p=
ci.
>>>>
>>>> This transport is useful when the device and driver are both implement=
ed in
>>>> software but the trap and emulate operations of virtio-mmio and virtio=
-pci
>>>> can not be used.
>>>>
>>>> This transport is intended to be used in many situations, including:
>>>> * between a host processor and its co-processors
>>>> * between two different systems (not SMP) connected via PCIe
>>>> * between normal and secure worlds
>>>> * host to vm
>>>> * vm to vm
>>>
>>> (snip)
>>>
>>>> +As described in Sections
>>>> +\ref{sec:Virtio Transport Options / Virtio Over Messages / Device Ope=
ration / Driver Notifications}
>>>> +and
>>>> +\ref{sec:Virtio Transport Options / Virtio Over Messages / Device Ope=
ration / Device Notifications},
>>>> +runtime notifications (\msgref{EVENT_AVAIL}, \msgref{EVENT_USED}, and
>>>> +\msgref{EVENT_CONFIG}) may be delivered in-band or via equivalent out=
-of-band
>>>> +mechanisms.
>>>
>>> Sending these notifications out of band should almost always be more
>>> efficient.  Under Xen, one should use per-virtqueue, per-direction
>>> event channels.  KVM has irqfd and ioeventfd, and the loopback
>>> transport can use per-virtqueue eventfds or io_uring queues.  I would
>>> be quite surprised if FF-A and PCI did not have similar mechanisms
>>> that could be used.
>>>
>>> I recommend removing these from the spec and expecting buses to
>>> provide their own notification mechanism.
>>
>> Busses can have more efficient way and can map that other real interrupt=
s or xen events
>> but the bus has to create a fake message back to the transport to keep t=
he interface
>> coherent.
>>
>> In ffa case we do use notifications but we still use messages as those c=
an be more
>> efficient in some cases (indirect messages) and we have a limited number=
 of notifications.
>> In ffa we have a also a transfer system using a FIFO which can hold seve=
ral events at a time
>> preventing several ping/pong.
>>
>> We do let the door open so that a bus can choose how to do this but we k=
eep the message
>> (even fake) between the bus and the transport to have a transport indepe=
ndent and handling
>> the OS specific way of signaling the drivers.
>>
>> Does that answer your question ?
>
> I expect that most implementations will have a single queue in each
> direction for bus messages.  This means that sending bus messages will
> require taking a lock.  Sending virtqueue notifications out of band,
> without a corresponding bus message, will avoid taking the lock and
> therefore significantly improve scalability on multi-core systems.

FF-A implementation using FIFOs for transfer has been designed to use
2 lock-less queues (one in each direction) which should prevent those
kind of issues.

In any case the transport does not limit what you can do in any way. In
his design for system to system, Bill has designed something where
messages are transfered using queues but events are transferred using
out of band notifications and some extra info stored in a shared memory.

> For instance, a Xen transport can use per-virtqueue event channels
> and a KVM or MSHV transport can use per-virtqueue irqfds/ioeventfds.

It is definitely possible and the transport is not enforcing or denying any
way to do and is mentioning out of band:
- in Driver notifications: "the bus may translate EVENT_AVAIL into out-of-b=
and
  or deliver in-band; it MUST relay in-band if it does not translate; it MU=
ST NOT
  drop EVENT_AVAIL unless polling/equivalent is arranged."
- in Device notifications: "the bus may forward in-band or synthesize from =
other
  signals; it MUST forward (or equivalent) to the driver."

We even have a bus normative to say that NOTIFICATION_DATA should not
be negotiated if out of band notification is used.

But I agree we could benefit from a more explicit mention ...

>
> I strongly recommend language like the following:
>
> EVENT_CONFIG, EVENT_USED, and EVENT_AVAIL MAY be sent in-band or
> out-of-band.  The specification of a given bus MUST specify which
> is used.  If a bus specifies that out-of-band notifications are to
> be used, it MUST document how to send them.

so I will include something like that in the v2 of the spec.

Cheers
Bertrand

> --
> Sincerely,
> Demi Marie Obenour (she/her/hers)<OpenPGP_0xB288B55FFF9C22C1.asc>


IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
