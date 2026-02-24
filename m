Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011015.outbound.protection.outlook.com [52.101.70.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD72267B89
	for <virtio-comment@lists.linux.dev>; Tue, 24 Feb 2026 17:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.15
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771953711; cv=fail; b=Lacy6edbondCTyEX2dAelD7VnCTJD2j6pqSjkj9jG8O/FAHzHKOUQZg7phkA88vhwSoozoN8zNL2Sxuf5uiZseiPEb+Jmw2Akz2fM7HCNT0xAFWEypKNdQz9MYGlhRkl8Ln279TTuGb4mJ9+0ktdd+2M99uWoTVAuFZYH3I9Mxg=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771953711; c=relaxed/simple;
	bh=DrofHSsHnOCFxhVtB6IUAmI38yDJjetyiTdks2WbQJA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=UvuoUs/4eJok6m088tRhM5TkUTVeoD45dolv/xKyyDvfEhhDFzMDpT/p+OHtydp+aX8SsncM4oVTuoFMOP3ptIXMFkc+FQGWVrttAWZ60EJi2TKtQyxQHaQo81lcyNQOwSKpEzfmQ1p9v3k/ODl12VjYTCUSbnnNZEPpMPI2Pj0=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=G4cnzYGR; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=G4cnzYGR; arc=fail smtp.client-ip=52.101.70.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="G4cnzYGR";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="G4cnzYGR"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=GM4YAskerd2ZnNBo9jgK8GhgFQONjQN6lbUvbq6PGXlrAAhvisgImlKY6W0Dod0vzkQmcA9ajFFNqHeTRbbyC9Lgaivb5pIO6fSUlErHkQDDUEZCtvpZwM9q2R4Xn011NxL2pPAy+RP7CZB/z3xRB7UV+XxxS8ra/zaeg8TdXOSL6wk4LqJ94wUChmhMF2sE54Jtpgw3gEtzBO8D55etyiUezoRa4E9n3sBr2TAoSbI05eFvCxBEwos/EVGw26k+WpsoGaFN6Au5zGe2iZICeYYVRJGj2eUlpJ0H9yhFSpdqmUSyT0YfZ5qVK2Om5aHHl/TXouIAGT/lQAqWLiMTVg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2FKwKOZ8/CIO/7klB03QjFXEyRmzKKYvmKMKxK6EEw4=;
 b=N3ucUcZEg7w6PiMoWgUF9CHZUKGKHdjsUEbn1gBUxJNgyVgeKNa/ASgBG9FXlBjIO14DYYUy7inJBjdc0Ux5oND9Qw/zyI7005AAcRx1nCexu72LDy3fYAz/Sw3FDb5MIg+rKg5WigOF4BOCtMCz5ScuHH98Va+5WjcxoeCnKk6w9U2y/K1GUPrbb+wbAc0A1gzVv0PuvmUhbhVfVkcAqtz5lQI2i+yxDehOQxFTkzsQwM5u4xs7UJv3Ctt970LzqyEO+suIMhD7/L1SNgeCRhyY0aMiZATRU+H7p8Fzba8oiFdg7+drXdhIosLS+uL0yiXCFNxPuM+dItl9ik4m3g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2FKwKOZ8/CIO/7klB03QjFXEyRmzKKYvmKMKxK6EEw4=;
 b=G4cnzYGR977RSHhr4/aLgRwh/lQtkEL84OZp1j4aEaiK3L4aP6kpAKqXGbtSm9sBqNlkdv0b9WY3ZLy6P0PuxlU78RCm38d4/zDd+bIDWTd3GWgkzyFL5tlLdvPwBGeXevTH7GDB/mQNrKh55b2XFMnqlFoQKs9iOol4qFk/Nt4=
Received: from DUZP191CA0033.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f8::29)
 by PAXPR08MB7351.eurprd08.prod.outlook.com (2603:10a6:102:229::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 17:21:44 +0000
Received: from DB5PEPF00014B97.eurprd02.prod.outlook.com
 (2603:10a6:10:4f8:cafe::69) by DUZP191CA0033.outlook.office365.com
 (2603:10a6:10:4f8::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Tue,
 24 Feb 2026 17:21:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B97.mail.protection.outlook.com (10.167.8.235) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.12
 via Frontend Transport; Tue, 24 Feb 2026 17:21:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A6v6L3Rm014HCjNZzaCX6iqZz2Xt4otUDtZwbd+YkyYOFz+OV1UMtNgAlJIZ1PgSuLXT5rPDj6ypBUKCfGD5p8ww2w40a9ipCNqwQIe6C8vDhamKiITKa8Gj3gtnz1Q4rUIFj68Gqvz5MFAezKXg1G/WQfdc8EABo2uN9kIiPLqfnQ1I4QrEGvfQeDDaZpnoOI9+8s+sZY/UBzDOxSKj33FtV9UNb5JgdlktRVpokqEAaJkeAbQM1K7jLNWbp3NzQ2r42TCVfByv/QUPi3SX1pzgKK7RBBBncW/Qg5ECc2Z3Zhgz5j0x/jA3gjlUt+ko4jBdkkWNX3fZjV0i+Fx7zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2FKwKOZ8/CIO/7klB03QjFXEyRmzKKYvmKMKxK6EEw4=;
 b=uJYtI/8fiWXTNwgVaTpcajo4+Vjevm9GdBL8eYvY8XDu/4jYgx7CUD276OH8amW/LYzWISNTOaLihMmqJZZa6mB7ljsmFkk1utMiM9xUbrF8seUZ0SQYhFjgykunjKs/w/QTZjrruHdAXJXPIkYtzaR7AtqZd4YZrVTqoLMEuiF+RgcOEnyYfSE7dw/oX1Xx4eSOlr6Ll1YDx9xd2tz/tcSdYnDS28SAxA0tudwGSQvQ4iTk1TqkKQfR5geIcPnWYlwWDgqQzyrZIFuXdhIZhWmGdsWGVPIfhLrYGZqGdnZwQCKNAH0pA4v65EyfgGnv25+76P/kxzigNsfZvrPGog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2FKwKOZ8/CIO/7klB03QjFXEyRmzKKYvmKMKxK6EEw4=;
 b=G4cnzYGR977RSHhr4/aLgRwh/lQtkEL84OZp1j4aEaiK3L4aP6kpAKqXGbtSm9sBqNlkdv0b9WY3ZLy6P0PuxlU78RCm38d4/zDd+bIDWTd3GWgkzyFL5tlLdvPwBGeXevTH7GDB/mQNrKh55b2XFMnqlFoQKs9iOol4qFk/Nt4=
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by PAWPR08MB11389.eurprd08.prod.outlook.com (2603:10a6:102:50f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Tue, 24 Feb
 2026 17:20:41 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%4]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 17:20:39 +0000
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
Thread-Index: AQHcjuFmIzYveS1Rqkq8YyoL1D1kt7WSRDwAgAABvgA=
Date: Tue, 24 Feb 2026 17:20:39 +0000
Message-ID: <84625A5E-87C8-41FC-A673-BECFEDBB5F29@arm.com>
References: <20260126163230.1122685-1-bill.mills@linaro.org>
 <20260126163230.1122685-3-bill.mills@linaro.org>
 <2a935201-a198-4ca2-ac93-22bd295214c7@gmail.com>
In-Reply-To: <2a935201-a198-4ca2-ac93-22bd295214c7@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.300.41.1.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|PAWPR08MB11389:EE_|DB5PEPF00014B97:EE_|PAXPR08MB7351:EE_
X-MS-Office365-Filtering-Correlation-Id: 35545d9f-e853-4fc0-a837-08de73c92e72
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?hOt3pb7VQH4ZeVip2M6+Sq2HWLEcomKtpRxP1rDGrq3r1TuwGl6CfqTghC+B?=
 =?us-ascii?Q?6BEf9el4WV5DA3bAR/JsZo+fNXaFsIz3ggr4kifhboBXzfeEywfzb00qadfg?=
 =?us-ascii?Q?J0NRBnkFk9CUvOXdRDbtyosAKwaWgLtWLjO7cHcmzYEspc1yf29SB3x4kZe6?=
 =?us-ascii?Q?aKjwpU7ZCFO1Jio++2J+F0hF/TpEr1tLGqnLveeTRmm9xS9HTvB39i1PM/y+?=
 =?us-ascii?Q?/eStB9osCluWqvVmzzZxhTItc+z3FGa2zPd0y9ySd9fhAKLw9XfNZ1hFrNkQ?=
 =?us-ascii?Q?ftpzW0+kLHJW5S7K5KQip39Ah8JmCwWLXXpS5zfgAG2MkAXSOaBeduq12Mcs?=
 =?us-ascii?Q?Q8pvDFCKCZguUR4uszYiemtO6xKWOHLvPZkS8EphFj9zDMbfHF/m66uE8nMf?=
 =?us-ascii?Q?/6QcORmDr1Eexh6V0Ok4eslfYb5EMceZJlUi+ZrNgiN31bGHRUXTldXkg9nl?=
 =?us-ascii?Q?2zswvQwC8aXXGfO3el/F4U0td7J2pjKkahrwvJAH/G1cA2uFTpc1fTZ+Jk37?=
 =?us-ascii?Q?e5TUSEtrFcHcZ9rOh9bN06/gj95dPwXqXXM1lMmpZNUqKUDs01VwZxtXSVKP?=
 =?us-ascii?Q?m01ClughUKNgx1R30QQVbf3jIQDYJQLlAL/xtF7Nk+nlbyJTResrGvXI18Xq?=
 =?us-ascii?Q?jSK9vbVZdqfxS5/yhnfhXFR24glXOVezpm3LKtB4EdHwcyx6NKkxR0EUNrBH?=
 =?us-ascii?Q?JSePZQ/Rfy+anPBdkBJkZfGzbz+yPKSbUzxd2Rnm+s41noOlROo0grJU8neI?=
 =?us-ascii?Q?Wr3K29jCM8qsVD+vUzFsv5FPuIibY/tbOp58YSSVsaFTEbfVBVBVK/nPsARn?=
 =?us-ascii?Q?Piu5l9G2sH949lkoZOOm+ZGmlW/mXg6XD521bvFFhOR62wQpPS1ZaOh203dc?=
 =?us-ascii?Q?9DtN4oAOaiapbRPs/VSeuwMP1EFgDSyo3oPV9VcWiYjALm5T6hXKbi8I2zAT?=
 =?us-ascii?Q?GmQMoSQMS11TaONiFwtXvxs30YaUiRcSm7xT5m23bKnAOD9OqGA08/DyndTT?=
 =?us-ascii?Q?CjSVbZoMMubd7NFJVOwMbvYHUswFrGafrEVJz0yPPEKqj5/UQur197uxwTZJ?=
 =?us-ascii?Q?VqZ326jMPNmnA5F/MWKLAWNfwbk7qGgeW2HDHQBJj6Um9Q1ScGdnx9GwBiLq?=
 =?us-ascii?Q?VmCEWRI7RYVoLQ5hER3uuisAFQ2ZBPGtId5iEPrmgQwyZRHgDuWcMndS0SAk?=
 =?us-ascii?Q?yIJDmu8PhDMV+IIECVPGZDIYfq6aOrLFui9jJMc44747kCX6u9XeI3z1oQrr?=
 =?us-ascii?Q?gMitjT1bmWqaLW0oMms0mPQM7Fu+tVj1EdQAXvvOLqp7wVaZGNq2NX11XIGQ?=
 =?us-ascii?Q?FJ4FLAsLSYccsjzpzSHUNPWO6p51gBzdONlRR8vfL+WjRRwcA6sokB6NIiOz?=
 =?us-ascii?Q?Ayzly1OOfw86z8VxszDD9mQ1e3k/lpFLAdr3jkhyXYgbCS2YqvFmRCl1oFrG?=
 =?us-ascii?Q?RkhwAlLj8g/OlBK/0IYlJtbkRbFOjbQ5hdocZ2acxBMTlfSedep7rK5foZvv?=
 =?us-ascii?Q?IJ6AHkgXRbPO83FDcX9lwzcUqEhB4RXaqsiRtz3I/dwGBrd1vHzA26+WtiHJ?=
 =?us-ascii?Q?0RtLvYxofTbQEkQX/N+ExMCuRSbmCIHXp7XTciQV3XCQ8HAV+HUhFv+hMay2?=
 =?us-ascii?Q?+L6/F3A4Z6L1zU3aoUoqGG8=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E44AC6C94E1D9348A79450842D5BC528@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB11389
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B97.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b7bf4e43-3538-44b4-7490-08de73c9080a
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|14060799003|1800799024|82310400026|35042699022|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iIfs6H0UzI/au3QtgVLTlZvo2+dPDKMOxRAlwnFdBqHY2/TG+I+Ns136k289?=
 =?us-ascii?Q?40+nypCPJ/OC2qIOgkSrMnXvM5SLqS70V7iSjO6z4u8zgMTaZfqPnwY2HMnC?=
 =?us-ascii?Q?KiBsZGmp1oC1/BfULhLSXeBBktS1WpuxcqEB16GTi5JO1kMrKBw6F+lUUrVF?=
 =?us-ascii?Q?HXT1f2acYDn4+x2e5lWnOkh77nwW8Im3zeXPd7rGerl4X78CfwK4gdR+qoWm?=
 =?us-ascii?Q?BKCZOGGu2OcC6/Yg4qI1seqTHrc6yOK8QscnpoWb7MHSoSSimqW/orAvpbk3?=
 =?us-ascii?Q?KLKVgA9pYn+Rd9r8SFb7kpIgXE4xyjkG9LBOfySIBxAFcd0Cbxsmo0iRLQa/?=
 =?us-ascii?Q?niz3cvn7WTeGV3xGPbxgrDWSofFDq+75+ommrHWYUTf7zsv2xer6qRnQWz4S?=
 =?us-ascii?Q?29mOyPZWXZtiC9QuI/+MWiR1wQyiIJ4TqemtClUhb5zV3DjWYJJ2jK7j2xbw?=
 =?us-ascii?Q?jmhRx0SPQZrtrg0EH74hJeMpZfZFiCjc5mqSuTaM2+BoiEmOrNy1prTCfuCo?=
 =?us-ascii?Q?HIJIbOEpUn+F6JP5q7tU1oJ7gqDBkspYGX1MNvZTbfofciwrdiMxUQrHseIF?=
 =?us-ascii?Q?ulcaYtfapn1EqedQxj/AaHhskzn0xSosdGaOHIivyd1PHZVp3eMZAL7Dvzs+?=
 =?us-ascii?Q?bNDEO1xpCNfhQ/cTP3XIrgvGbFzMsM5MKjue3N5FxRa35GSB07Soi6+NWwc8?=
 =?us-ascii?Q?2gQ/LyBvWU/jb9NUiuhzZNgp/Fi/h5Rp0tSU/NcQVBg9naWqe6qyTjVgiIxY?=
 =?us-ascii?Q?an55bYepy7dMOfmlFN/3wqCFysgfEZkSa1APtE806yA1D/EeiRf20N5zFSVm?=
 =?us-ascii?Q?8sgFZc9l6CFfLuh/53+lp0B6tn009B19nEpCh6G0SUUtBtRix1mIEinJDxEZ?=
 =?us-ascii?Q?WPz/hXSS4ig8Hc/VmbzArcNa6IkkEAEP6FiKGkyW0wFZt11XGsMh5K+/qyGE?=
 =?us-ascii?Q?1oNnxnhtZ/SM/mlG4PH8x3/FJgNyD5a8SJFeCLXEdCRVaBjQZWEEbodOXoVE?=
 =?us-ascii?Q?B+/B/s/ysHF2kPNCPt0KmL/Lch3DoeeK6JwlnvP3AKXLZdhK1aLKH1GL1Bfl?=
 =?us-ascii?Q?6bPi0ui501Z+keXUXbnaVq5RiqdFu4osm4fsFtNlPytyI+8ttHE9Z1cOCFOW?=
 =?us-ascii?Q?I9k4gU8mKov/Q+A/dHVzywl87CbLmi00VD2YtJoVY0VrjHeCfeJ+dJqFmaQG?=
 =?us-ascii?Q?HOuNGx4Sq7DKttuqCku14Wf1wPl/4fbUodIUtchp3fPYD1MdhMi6LyM/5hDG?=
 =?us-ascii?Q?KjNBJht5nQIKsOIlP30WlTWJdt4vXMi8Ls858gVQ8gRjLmCPdW1+ugpIZn5i?=
 =?us-ascii?Q?FqMXa9M/+sw0AMaoFz5a+ep3RX+WKST0e3dgonp0Aboucr26rJKZOZyfDfBJ?=
 =?us-ascii?Q?qnzLWmfVDiJvXQ0qHiROLQAz8/DXaWxzFm7lVkBreQKx5JZeI9uAFla3wZJC?=
 =?us-ascii?Q?YMzejntkoS7C4hkoaRSy5rTer2Cw3EhbKIdtfdzG6QsRDxKzCaPTWpXtpjCE?=
 =?us-ascii?Q?xAAdfz8z4vVLsO/JXeAEQ+5BaybRSGB/KkjasGGklmwhtW27zzWb6DSx9lLM?=
 =?us-ascii?Q?jXkN7bB416YCCYZjDkIp/ntzeSQG8BwIqcknM/mbq7jd1QDjYmbsqEabWjN0?=
 =?us-ascii?Q?qBpT46qfvNBQjX62ntDAvVfehqVpdQzrxIQPhZ7P5FB9ydh5gBrlFkKfpYJm?=
 =?us-ascii?Q?p8mNHg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(14060799003)(1800799024)(82310400026)(35042699022)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ldmp1A2x3iIFK/4abpZpMH0/VROFbH7SG1iJ1/tmsQC1P9S6EL2Eydvxuh8wu0WMjeMR/E7WCR/gRG17LcTtehaP0b+fxzwkcUZRQtlYiKQuhj2eSe9x49iNrgoYBwzRkKFgWYIy6i5pAblFpI5JmrE7QkQ+1ee+paLCVKzY8rCRZbtoxcxYOXtkfHN21p7Wepx7Lkn/aFoRpf8gsQHARal8oK6XEmDqSmb42ogI6gFYDhbWadtPXCL4ikAl5t1iEiqBgzA1nzuQtMFcVnxS/MJ87p6giKIsb1o95VQKuHrMRd4H7WDSXQS7uxT5iQm4tbsIeusKoppp3M1V5lB8Zo42Gdz+zEXK1FklMp7iviDNVVVn2Xrh8uLy+H7VRmzUjQjGV4JnzBMzxnLgiWbIFb3psKvq1TljbPypx2Yt24/amgGuYPkyQNl17aCiiJpJ
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 17:21:43.7055
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 35545d9f-e853-4fc0-a837-08de73c92e72
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B97.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7351

Hi Demi,

> On 24 Feb 2026, at 18:14, Demi Marie Obenour <demiobenour@gmail.com> wrot=
e:
>
> On 1/26/26 11:32, Bill Mills wrote:
>> Add a new transport layer that is based on messages.
>>
>> This transport layer still uses virtqueues as the other transport layers=
 do
>> but implements transport layer operations by sending and receiving messa=
ges
>> instead of the "MMR" reads and writes used in virtio-mmio and virtio-pci=
.
>>
>> This transport is useful when the device and driver are both implemented=
 in
>> software but the trap and emulate operations of virtio-mmio and virtio-p=
ci
>> can not be used.
>>
>> This transport is intended to be used in many situations, including:
>> * between a host processor and its co-processors
>> * between two different systems (not SMP) connected via PCIe
>> * between normal and secure worlds
>> * host to vm
>> * vm to vm
>
> (snip)
>
>> +As described in Sections
>> +\ref{sec:Virtio Transport Options / Virtio Over Messages / Device Opera=
tion / Driver Notifications}
>> +and
>> +\ref{sec:Virtio Transport Options / Virtio Over Messages / Device Opera=
tion / Device Notifications},
>> +runtime notifications (\msgref{EVENT_AVAIL}, \msgref{EVENT_USED}, and
>> +\msgref{EVENT_CONFIG}) may be delivered in-band or via equivalent out-o=
f-band
>> +mechanisms.
>
> Sending these notifications out of band should almost always be more
> efficient.  Under Xen, one should use per-virtqueue, per-direction
> event channels.  KVM has irqfd and ioeventfd, and the loopback
> transport can use per-virtqueue eventfds or io_uring queues.  I would
> be quite surprised if FF-A and PCI did not have similar mechanisms
> that could be used.
>
> I recommend removing these from the spec and expecting buses to
> provide their own notification mechanism.

Busses can have more efficient way and can map that other real interrupts o=
r xen events
but the bus has to create a fake message back to the transport to keep the =
interface
coherent.

In ffa case we do use notifications but we still use messages as those can =
be more
efficient in some cases (indirect messages) and we have a limited number of=
 notifications.
In ffa we have a also a transfer system using a FIFO which can hold several=
 events at a time
preventing several ping/pong.

We do let the door open so that a bus can choose how to do this but we keep=
 the message
(even fake) between the bus and the transport to have a transport independe=
nt and handling
the OS specific way of signaling the drivers.

Does that answer your question ?

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
