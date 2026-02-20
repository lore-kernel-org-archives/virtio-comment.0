Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012066.outbound.protection.outlook.com [52.101.66.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB833101A8
	for <virtio-comment@lists.linux.dev>; Fri, 20 Feb 2026 08:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.66
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771577602; cv=fail; b=C6UM+8EoDHJzViQsjvSxWFBLds1z9uoWHAG7j9jt1G4eccNj8e2qwIsFRZBOMyycC8B6GTYqV64RiOZLEsZLSNPObG7Xjoko20dXPcA6OieABMU2nDK4nIwBfwxluP73U6eeskT32bc3MieiGxRt66GDo7HAO/jCu0so7FRaA+U=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771577602; c=relaxed/simple;
	bh=Pjy7/zh7FB/ZgvbTzG9yxPmX8UsyVdqd1cy2Ft0bSEo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ai2Z4CQ/pVTFqBfwQHx08fhThtu8CWQsWJY+G6ybebwzz+5B4oRQo808HMLBTTxCwrB3CA3FUo3Vbwb9s+SKIPdtsuOHai83gZFTiC9nGwb1l1prlxRE212r+Of7G+gl8vqi3OEp5tlZNyrZlpBXA/OjNJI0RHEssJQ4lbGG8zI=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=JWW4Itdz; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=JWW4Itdz; arc=fail smtp.client-ip=52.101.66.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="JWW4Itdz";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="JWW4Itdz"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=GZeI1D1NoSGo2+7DToIrzFq1/UVmupNR7ihXpZMptSPb3CvBmk95Q/ymlLUeGpkdSm53M83bSO+wh+irQW0mM6P4be+y7FjZtfHza3e+1bgnlh73ga2B6vfyWnyKrmp1fjIeMvINO7B4iqMyr8P23cXC9vw+sLpfHVoa54IeWYTR4FTO2+PBtHZY2IERa6RYQPoCMmFCM5dfUlkFw+KfNQZOiKAEzkueoT22tR6mqi7NO1UMZQvBzw3vFE7ITQR4l/8Umt3qspMavr0SFLa7SS7+IM2FEcRsAkFqIsR1nRepI5xSW+46uVcBeh5ixgEnbroYRALsl4M3hV7wuIP8NQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OOQTJDLC2tbOV3INjgl26lsApktbX/67BLk89oYpDcw=;
 b=u9GDEQ/dU0eeh0BWrY8xpsvk0WY1PCnxiIL5uVLEU8Nh5qYM/wnUx4gP1BBu8a39OGObrMordjG0lFaEH6lpPiE3ZK9pS/TaUz11Rn42PcCBRUyurL3addLdQIszE7AduyNAwShKFGivUH27tqQH+UelkxG5bF0T2ENpvCrfu9cJtl1jeH+tXe3zwzqNNX+25ZsK9ybO6JF5FO3ZZioH4XEvYikO+oSKcvf2TI2/6ZFKb1Sa6iKDjDU6mxbjNHf6Hmx3wAisP5KJWWZ5XbQ6cFzSGTX5E1OE61B9BC1i0t4OkUncFMFtBOGUFXxX3P8ds2rQG7yQtE9Kpuv8h4eSMA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OOQTJDLC2tbOV3INjgl26lsApktbX/67BLk89oYpDcw=;
 b=JWW4Itdzemn5VdtoNGPw0bmamJO5h9629GN7N7G0vhrYs9xay/OAqimCzXM+qEnL0TyQwNR7Imo/8qKKptG2MC5rgh3gMo1RDOm96i6X+ci17kfdMc/wGNujyTXv1E1oDkGYnAoKG38r7lZ6Twz2SCYYmRThA+EKFGtKA53JpbQ=
Received: from AS9PR04CA0162.eurprd04.prod.outlook.com (2603:10a6:20b:530::22)
 by VI0PR08MB11842.eurprd08.prod.outlook.com (2603:10a6:800:316::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Fri, 20 Feb
 2026 08:53:12 +0000
Received: from AM3PEPF0000A78E.eurprd04.prod.outlook.com
 (2603:10a6:20b:530:cafe::fd) by AS9PR04CA0162.outlook.office365.com
 (2603:10a6:20b:530::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.16 via Frontend Transport; Fri,
 20 Feb 2026 08:53:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A78E.mail.protection.outlook.com (10.167.16.117) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.12
 via Frontend Transport; Fri, 20 Feb 2026 08:53:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Egcob2pc9pGLJoFmk+U+gQO7xxl3jWGxWADb2iAORsIZkLst9fXxT1727+3eb3CvfD/ZIuJW74Gzp6EAmz+BvRQG4DLNkJrNjEmN5q0uZIfErEwIKjv8ci2/Qcw3zGVibLakLEfgvDhp0MfsWihz+MhsZ+zsr2aAO1/cRdwyrE/3YPiWAIGHFQp/t12k9k41VHlEFyfucGTKpVhi4MtkoAbmGRhgJqERzCZdtIHymClsjBcCHXJLRz/0ZSRXhlNN94PlXGfw/wLc/FN0/a8BwJSTseDTmPShPdQYsP3K+frd9B2jY+VPhzkmj1Rs/970YpWf7RcNrr5pAcGCWhk86A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OOQTJDLC2tbOV3INjgl26lsApktbX/67BLk89oYpDcw=;
 b=vyUa4yUnMnZOK23K9crxlM6mcfimPAMnMoX8iBZutRyi33/SgIVFac5PznZ73EF/E9T79gO+FIQeIvpahFwUCknnDz5DRftryPgk/uz/rV3EDmfWK8UpGsqi37h/vghtjvT4yhZfw8693WlCndRcppOh+hU1E4w4LrkHReMbFfoCbhIEZ+FYnqtGDk1MRbXWeaC1D0HJuCCuhVrY6QTJtni358e7qWxLeM0v+Z9GsNwW7m5X0jVemMLsuB8PQS6Hng/oiRkiFYzShMqQIe9SOQSaPbZVSPogANdLTtvKBh6nsZlDySnj4pj1xXtkZKiV5dMzBRej5dbhvr2IPRHAIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OOQTJDLC2tbOV3INjgl26lsApktbX/67BLk89oYpDcw=;
 b=JWW4Itdzemn5VdtoNGPw0bmamJO5h9629GN7N7G0vhrYs9xay/OAqimCzXM+qEnL0TyQwNR7Imo/8qKKptG2MC5rgh3gMo1RDOm96i6X+ci17kfdMc/wGNujyTXv1E1oDkGYnAoKG38r7lZ6Twz2SCYYmRThA+EKFGtKA53JpbQ=
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by VI1PR08MB5456.eurprd08.prod.outlook.com (2603:10a6:803:12d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Fri, 20 Feb
 2026 08:52:07 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%4]) with mapi id 15.20.9632.015; Fri, 20 Feb 2026
 08:52:07 +0000
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
Thread-Index: AQHcjuFmIzYveS1Rqkq8YyoL1D1kt7WBGrsAgApT2IA=
Date: Fri, 20 Feb 2026 08:52:07 +0000
Message-ID: <EC730EB8-9CEB-4B50-9295-2E1A908E22EF@arm.com>
References: <20260126163230.1122685-1-bill.mills@linaro.org>
 <20260126163230.1122685-3-bill.mills@linaro.org>
 <6b4a7cfe-15bc-45cf-9fdf-ae99aafbfc15@gmail.com>
In-Reply-To: <6b4a7cfe-15bc-45cf-9fdf-ae99aafbfc15@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.300.41.1.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|VI1PR08MB5456:EE_|AM3PEPF0000A78E:EE_|VI0PR08MB11842:EE_
X-MS-Office365-Filtering-Correlation-Id: ce1bfa6f-c91d-42a2-d9f8-08de705d7a75
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|1800799024|7142099003|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?45ogk+V9SPV8sxANXutcxdvW94mvDwFZtyicGuF5Gv01Ohd9oTDxTa/GwEpN?=
 =?us-ascii?Q?M/kIZVl+NbPj9cr3D/JO56KHXugPbItzRjsvAImsFiR10VdD3Z7dpTT2t6HA?=
 =?us-ascii?Q?ey99oLUVdxJE5g6CNRNldr6GUMc1IutU1Bj6lmwO/3vTc3C9gj3IN89nArv9?=
 =?us-ascii?Q?8Y9jlxLN7pWQEfrdcpXEEnsWOSc97CA7jXRbM2iUuPqKjCxklVTAEHruIW4H?=
 =?us-ascii?Q?ZQX8YJG6Kt688SmEKg9mcS/dMLjgFnraKpNQ2e44+HSc5HjjNn7hTj+YTgo9?=
 =?us-ascii?Q?72Ed5wCuF431hxBde3aBvHOGPWX1mTLUhXB6V9sK9+N010R6XzC457jRhMis?=
 =?us-ascii?Q?pAoqiyzIqPJjS3J4xtS9U1ePZxsa3kmssoQbjdQoEmnIcmTYRY4jOL8vIIoH?=
 =?us-ascii?Q?0nEKinX2MTUTOvWMo7pta5d6W1rPzaMdX4M2K7hej5pU9m38oNDKFRuDmOJH?=
 =?us-ascii?Q?++Mb2NxQVDgBsMTTSYzu89Ipw0dNI0tHHnpR2wCXOgmaYDSXCxT5WQJFBPHo?=
 =?us-ascii?Q?Y8IIFGKYnoXTgE/wf1tN66Hp9l/t5q36seacdcqDvt9fYdoNiYJdAgth3rha?=
 =?us-ascii?Q?jbh97g1DA10vlEVN4BHoRKpCfW9X6QsbpyQo6SPETYJfwhJKZjio/qv2/KE/?=
 =?us-ascii?Q?Hwf8/hADLS3K68NXo5yLvW4DPNsUlUkh89g4tsZQvJTB0CAPecmNYGp474JP?=
 =?us-ascii?Q?TtXCOD6HhlbsmRZzz4IFnTSRosKUJYY1Iig0HwTWY6v2dOwuFQ2r4cmZoE9B?=
 =?us-ascii?Q?PwGIYVx0Bn4mFI9a3/qizVIn+CrFNoheh1ECnKL8wrv7hC/1TEtu4GBKcrPQ?=
 =?us-ascii?Q?tPjaOggFH5FtTrdqM9mB3jLOaW2BQewpwI5zOtsRY2ceq9k0qWHXsGy6R8S5?=
 =?us-ascii?Q?vdoZNI2lZmoGJUMppeloWEH27tgaV4JVueLvqwrbtnNGtTqsBkT22wyL2VzT?=
 =?us-ascii?Q?dSR+sABu+sugAizqOQtgKRTY7+ViddJYL//JKZK4e1HPHUlTope7v24F/A9I?=
 =?us-ascii?Q?l8jFyn9hSTDWkep9nf80Vugjwk5VCec5MDQ7MqY4YeV1R/GZgj7QTL66uQOD?=
 =?us-ascii?Q?C4T+za6Vs05SDK4lr2+qm6WcI8Vtg/Zgw5YEM2FOabtzmh/Gtl4ADEOUVLh0?=
 =?us-ascii?Q?kGNgG5+KTuXFy95eGnlPdXd4PKV+TGtjGMIr6XRe4bofPSgdtJLNGEHWdIv+?=
 =?us-ascii?Q?unuiHzAFyJ+/wimPIQbnGuXszPa9LXAQkw6WWo65mHqGIksN6WVAJn8czZie?=
 =?us-ascii?Q?EJeo81DBSbgs9BLkq1myY4psJoMaJEsmC6GztdLMK3uNPra77f5g7nHa59gW?=
 =?us-ascii?Q?CniZvCIFN3vpSvdACoV1nCjbUZin/EhTI3YcyaKAfwy07/0Mtkau3ayrE7Sc?=
 =?us-ascii?Q?qQXhaJosuIcsZ+9tKBu1qVEOzdm6daj6DSD8P1TWNw1/1RZYZUvbanjq9FvE?=
 =?us-ascii?Q?hw7s1C5fDWDsZ+4h/aEJKp7w71JiEo/DX49MsAKH82cRXlcCgJPmj+hbhKDL?=
 =?us-ascii?Q?fKUb4TvgU/rMxksTBFwJf3Or7m3o4j6OaJekM1ul3BTeCjRCUL7ZGGTYYtgS?=
 =?us-ascii?Q?dsr6kMbYuQZHlVYdy4+Mtnatv8KkEHvaxakp+3TlQqfNG7FVGCyWibHfwjos?=
 =?us-ascii?Q?AueeF7AFJw1mn9TaLI14ok0=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7142099003)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <88399AC90AB14A4F920F14E21EDF8BA1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5456
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A78E.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2adfe3ea-fd81-4c95-eaf5-08de705d53dc
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|1800799024|36860700013|14060799003|82310400026|376014|7142099003|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1GAHACwtlO17q1oiGC/0G27TBnhFBd2YKXBZVQUSr8Lw/8k9PlDYKXigit8D?=
 =?us-ascii?Q?qbRw8JSoU1WPIh4kJF5o1EHN9QawJBLGjuW8OnsYCgEHAok3nkwXc/DV6GSD?=
 =?us-ascii?Q?B4O+uWqK0Pgp+M+fHfPU/B0uKrcco+yV3+5XsktxGlbXb3OhZskKk1VNlwgi?=
 =?us-ascii?Q?ta6qAyMH4uNZa8cSFmU3KlcrBnnsZFgsqCxvstxpN7vwim/yyyKb5gUBGqPU?=
 =?us-ascii?Q?Akjjnv48yxxBKIXxD6q+5TBHNMhWAXPIchNAp1McVYWz43e2Xbv8CH9tYTCb?=
 =?us-ascii?Q?pqznxABcSlSsyJKU7aY05UbdJ4+OS52DKf4iAUbQSg4kjUNQQze6clTMJPxc?=
 =?us-ascii?Q?k9lBOBftyryXJ/IXnXeXnDzH9ybx3l9kKzBP+08qeXbZEQbNEIiaYnXSYKif?=
 =?us-ascii?Q?gGKEE2dOoTfhWeqopK8I2KmUvvJt93UsfCvVzz1J9AWGUpBrhBDhYFCfDHB+?=
 =?us-ascii?Q?xhFTCJcif1Ra7ZZoaU7crssyuc5/foujHzYz1DNECWTiackUl2GVaE3bjJVm?=
 =?us-ascii?Q?6EuaO4YBrm0c2qJQMVESFyW4FRFRlpJkGsG+WR9nFHGhXv7IGZNl94bj825n?=
 =?us-ascii?Q?3/Fo0H5SiqXO/+KT89pekyMge7FmMTSoMGl+MsFGsaBf1szipOs42czF2IZI?=
 =?us-ascii?Q?z3pbvKjlAXfKhExfuw/TEln1Xymh+C0yIHVuFqMWHkT3eUDfoWYZqKaQSirf?=
 =?us-ascii?Q?FamfqneHW4Vfd0+GNylk0nd/WN6npVUQyIxTJ+U5zHvrBzLmgB8RK+Ml7vAq?=
 =?us-ascii?Q?hxsdrDjTsHjc13x7b8si4WexXKCDu3zqMEicWL6mbL4eA9exE+nGmCZhsJDQ?=
 =?us-ascii?Q?n8m6NODD93+9LSLSUlHbelciKtglr6s2DU0AtFiFUHmYxZiIBEjsnnqkeHmV?=
 =?us-ascii?Q?J7jnC2fmpfPoN99qI+WkhA0H1SkfKg+DU/t1bSDfzmwmeBm2G1nnq4Mc1Y9C?=
 =?us-ascii?Q?X9n6umU+vDmaNUgy4VxmwTubdfl+4YX6tU3LNiSJt7fpF3wIqWzF2lS/FJRA?=
 =?us-ascii?Q?RztDu9t1UYx1IJpRkWZ1T3rahU+R+yzy0Rprr2O2wg4qTiwwhVtoaYWapQ2w?=
 =?us-ascii?Q?yJBoweAK1Yjs3CK6Z3+U7IFSzrD8duOzRPphqX5/d6BDc+LrVCFzTviYoxj1?=
 =?us-ascii?Q?kb8coE9bHTZU4gIVTKkNRaUSHpAr6qhHfm7A+bVQ9WkJNs/K1xRYQRGxj7la?=
 =?us-ascii?Q?t9xUNG/TKLjy4r2ucCgVnhjmNeUr8JHAC4sFv3woBRKM5XPwkqo4hElOVuy0?=
 =?us-ascii?Q?hfm8bhtt/8LBDkQyeDjllsp1EtFHFhyYnyoVwIcfZg3i1KWrl+NeAjODIr8G?=
 =?us-ascii?Q?lzm4LmkyxL1fKf1W1ALw3Jqc55zuLeuInv3S6HYcWYd6kkTtaZFJ2IrkIPDD?=
 =?us-ascii?Q?XuzHpCdgpa6plx98Zc27boL+eTBt20JtKC3BFpAcDRwb1LsKiKTt3S6X3ozt?=
 =?us-ascii?Q?waGQVRnT0r93ACGGOamgzdPGiySsYQ9ApgI1s7qPy4e8cXaZLz5xGk8Hyof2?=
 =?us-ascii?Q?kCDqhjXqCK6yxtyNi7mPYE5xMbPZ8GOPC+lT7GcXTJVX9mZyDpqpS/arPCJB?=
 =?us-ascii?Q?ri+l8CSpwn0buIwF3Ly74ko26wgtZCLIMO+0iQYwJZWNxXRqG9l6Fi7XEfwf?=
 =?us-ascii?Q?yEbP9Nku1aKI4EHMms50lTtdspy/SkwOzv5Q7YfY7zr1ubfL12LTz6+0+IT6?=
 =?us-ascii?Q?kh39uQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(1800799024)(36860700013)(14060799003)(82310400026)(376014)(7142099003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	VY1P7HN608c0uTpR370XM6TyrULGeljFz7Ja2qBmv9O8ZnI3TOKGGV1h2VPNlwXUiUf+UvSDKZRNNg3+fmdicrWPmQHrVLIGdmvcLZV33Ubc5SzEFRilEKXXCqJ1IlPCcIR0BrFNnqKVSYeBftb8jFIprnLpbL1bq0kbW4EwPGT4dQSEr4XsxAd29WW5NkOTTSNVmvk+OC+HFwfGFAMNco6Ls0rdR86Xq969WYYmYxOjt4y8dD3FpETpyYvaaTASycutxbnn0asaO/5JFlmRt9P5I6gYY9te+uT6Y1iEfdHu9k1ZaJg+JhPIU1uoUAPokoB3cFu779aTnaFZwkD2beoewsHR+Kf1CPOYWPlWPGY/YbK1/OWwy9BZH77jM2vf9yaEzQfb1kMXVY+syDQhFvhT+uFaf1x0XoQBnyOE43GGWXhnGZD00yClANt+Q0T9
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 08:53:12.1019
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce1bfa6f-c91d-42a2-d9f8-08de705d7a75
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A78E.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB11842

Hi Demi,

> On 13 Feb 2026, at 20:09, Demi Marie Obenour <demiobenour@gmail.com> wrot=
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
>
> (snip)
>
>> +\subsubsection{Message Ordering}
>> +\label{sec:Virtio Transport Options / Virtio Over Messages / Basic Conc=
epts / Ordering}
>> +
>> +Transport messages fall into two classes: requests (which expect respon=
ses) and
>> +events (which are one-way). Drivers and devices rely on the bus to pres=
erve the
>> +relative ordering of request/response pairs for each device number; the=
y do not
>> +interpret the \field{token} field directly.
>
> I expect that this requires all messages for a given device to be
> processed sequentially, which is not going to be fast.  At the very
> least, messages on different virtqueues should be able to be processed
> out of order.
>
> I would have some sort of stream identifier that is made visible to
> the bus layer.  This would map to a QUIC stream, a single ring buffer,
> or something else that ensures in-order delivery.  Messages with
> different stream identifiers may be processed out of order.

We have the token meant to be used to reorder messages or make them corresp=
ond to a request.

Now we choosed on the first version to enforce the order to prevent having =
something that would not
work in the existing virtio implementation where drivers are not designed t=
o handle this (configuration
space access is done in order and is not expected to get answers coming bac=
k randomly when reading it).

Now I do agree that this could be a place for performance optimization and =
it would be possible to (as pointed
out by Mickael) introduce this as a feature bit so that implementation coul=
d support that or not and disable it.
This could be handled at bus level or directly on the device side.

>
>> +\busnormative{\paragraph}{Message Ordering}{Virtio Transport Options / =
Virtio Over Messages / Basic Concepts / Ordering / Bus}
>> +\begin{itemize}
>> +  \item For each device number, a bus implementation MUST deliver respo=
nses to
>> +        the driver in the same order that it forwarded the correspondin=
g
>> +        requests to the device.
>> +  \item A bus implementation MUST ensure that every request forwarded t=
o a
>> +        device results in exactly one response delivered to the driver =
(unless
>> +        the request is defined as an event).
>> +\end{itemize}
> What is the reason for the device/driver distinction here?
> Intuitively, I expect both requests and responses to just be messages
> at the bus layer.

At the bus layer there are only requests and responses but at the end on th=
e device
side you only get requests that you have to answer or event that you send. =
There is
no case of request send by the device side which would require an answer fr=
om the
driver side.
This why we have this here but we could relax it if you think this could be=
 useful.

>
> (snip)
>
>> +\devicenormative{\paragraph}{Feature Negotiation}{Virtio Transport Opti=
ons / Virtio Over Messages / Device Initialization / Device Features / Devi=
ce}
>> +\begin{itemize}
>> +  \item When handling \msgref{GET_DEVICE_FEATURES}, a device MUST retur=
n zero
>> +        for any requested bits that fall outside the number of feature =
bits it
>> +        implements.
>> +  \item After receiving \msgref{SET_DRIVER_FEATURES}, a device MUST upd=
ate its
>> +        internal feature mask to match the acknowledged set and MUST re=
flect
>> +        acceptance or rejection by leaving the FEATURES\_OK bit set or =
clearing
>> +        it in the status returned by \msgref{SET_DEVICE_STATUS}.
>> +\end{itemize}
>
> What should the device do if it doesn't support the feature?

This is what we meant to say with acceptance/rejection. If something is not=
 accepted
the FEATURES_OK bit will not be set in the message returned.
Maybe we need rephrasing to make that clearer ?

>
>> +\subsubsection{Device Configuration}
>> +\label{sec:Virtio Transport Options / Virtio Over Messages / Device Ini=
tialization / Device Configuration}
>> +
>> +Drivers use \msgref{GET_CONFIG} to read portions of the configuration s=
pace by
>> +supplying an offset and length; the device returns the requested data p=
lus the
>> +current configuration generation count. Writing is performed via
>> +\msgref{SET_CONFIG}, which carries the same offset/length along with th=
e
>> +driver's notion of the generation count and the new data.
>
> I think this should come with a (non-normative) note that the use of
> configuration space is discouraged if the data can instead be sent
> over a virtqueue.  For MMIO and PCI transports, the configuration
> space is slightly more convenient as it is accessed synchronously,
> but for the message transport, reads are also asynchronous unless
> the driver spins or sleeps until getting a reply.

Good point, we will add something in v2.

>
>> +\drivernormative{\paragraph}{Device Configuration}{Virtio Transport Opt=
ions / Virtio Over Messages / Device Initialization / Device Configuration =
/ Driver}
>> +\begin{itemize}
>> +  \item A driver MUST ensure that the offset and length in each
>> +        \msgref{GET_CONFIG} or \msgref{SET_CONFIG} request stay within =
the
>> +        configuration size reported by \msgref{GET_DEVICE_INFO}.
>> +  \item A driver MUST include its most recently observed configuration
>> +        generation count in a \msgref{SET_CONFIG} request and SHOULD re=
-read the
>> +        configuration (via \msgref{GET_CONFIG}) if the request is rejec=
ted for a
>> +        generation mismatch.
>> +\end{itemize}
>> +
>> +\devicenormative{\paragraph}{Device Configuration}{Virtio Transport Opt=
ions / Virtio Over Messages / Device Initialization / Device Configuration =
/ Device}
>> +\begin{itemize}
>> +  \item A device MUST reject a \msgref{SET_CONFIG} request whose genera=
tion
>> +        count does not match its current value and MUST indicate the re=
jection
>> +        in the response.
>> +  \item A device MUST return the current configuration generation count
>> +        alongside any data returned via \msgref{GET_CONFIG}.
>> +\end{itemize}
>> +
>> +\subsubsection{Virtqueue Configuration}
>> +\label{sec:Virtio Transport Options / Virtio Over Messages / Device Ini=
tialization / Virtqueue Configuration}
>> +
>> +Drivers query virtqueue parameters with \msgref{GET_VQUEUE}, configure =
them via
>> +\msgref{SET_VQUEUE}, and optionally reset them using \msgref{RESET_VQUE=
UE} (if
>> +VIRTIO\_F\_RING\_RESET is negotiated). Each queue is typically configur=
ed by
>> +reading its maximum size, provisioning descriptor/available/used buffer=
s, and
>> +then calling \msgref{SET_VQUEUE} with the chosen size and guest-physica=
l
>> +addresses.
>> +
>> +\drivernormative{\paragraph}{Virtqueue Configuration}{Virtio Transport =
Options / Virtio Over Messages / Device Initialization / Virtqueue Configur=
ation / Driver}
>> +\begin{itemize}
>> +  \item A driver MUST use \msgref{GET_VQUEUE} to determine the maximum =
queue
>> +        size and confirm that a queue is inactive before programming it=
.
>> +  \item A driver MUST ensure the queue size provided in \msgref{SET_VQU=
EUE} does
>> +        not exceed the maximum reported by the device and MUST supply v=
alid
>> +        descriptor/driver/device addresses before enabling the queue.
>> +  \item If VIRTIO\_F\_RING\_RESET has been negotiated and a queue requi=
res
>> +        reinitialization, the driver SHOULD use \msgref{RESET_VQUEUE} b=
efore
>> +        reprogramming it.
>> +\end{itemize}
>
> Why SHOULD and not MUST?

Ack

>
>> +\devicenormative{\paragraph}{Virtqueue Configuration}{Virtio Transport =
Options / Virtio Over Messages / Device Initialization / Virtqueue Configur=
ation / Device}
>> +\begin{itemize}
>> +  \item A device MUST report accurate maximum queue sizes in \msgref{GE=
T_VQUEUE}
>> +        and MUST persist the parameters supplied via \msgref{SET_VQUEUE=
} (size,
>> +        descriptor, driver, and device addresses).
>> +  \item When \msgref{RESET_VQUEUE} is issued (and VIRTIO\_F\_RING\_RESE=
T is
>> +        negotiated), the device MUST quiesce the queue, release any res=
ources
>> +        associated with it, and allow the driver to reconfigure it.
>> +\end{itemize}
>
> What should a device do if it gets a request that a driver is
> forbidden from making?  Untested corner-cases tend to be a good
> source of security vulnerabilities, so defining behavior in all cases
> seems better.

This is to be handled at the bus level which should return an error to the =
transport.
FF-A bus defines an error message so that the sender bus when receiving it =
back
for a request can give an error back to the transport.

Maybe we should describe this model in non normative way in the spec ?


>
>> +\subsubsection{Status Information}
>> +\label{sec:Virtio Transport Options / Virtio Over Messages / Device Ini=
tialization / Status Information}
>> +
>> +Drivers query the device status via \msgref{GET_DEVICE_STATUS} to obser=
ve
>> +progress or detect errors, and they drive the Virtio status transitions=
 via
>> +\msgref{SET_DEVICE_STATUS}. Writing zero to the status field resets the=
 device,
>> +invalidating any configuration or virtqueue state.
>> +
>> +\drivernormative{\paragraph}{Status Handling}{Virtio Transport Options =
/ Virtio Over Messages / Device Initialization / Status Information / Drive=
r}
>> +\begin{itemize}
>> +  \item A driver SHOULD read the device status via \msgref{GET_DEVICE_S=
TATUS}
>> +        when diagnosing errors or determining whether the device is rea=
dy to
>> +        move to the next initialization phase.
>> +  \item A driver MUST use \msgref{SET_DEVICE_STATUS} to drive the devic=
e through
>> +        the virtio-defined status states and MUST write 0 to request a =
device
>> +        reset when needed.
>> +\end{itemize}
>> +
>> +\devicenormative{\paragraph}{Status Handling}{Virtio Transport Options =
/ Virtio Over Messages / Device Initialization / Status Information / Devic=
e}
>> +\begin{itemize}
>> +  \item Upon receiving a \msgref{SET_DEVICE_STATUS} write of 0, a devic=
e MUST
>> +        reset its internal state, invalidate existing configuration and
>> +        virtqueue settings, and present the status field as 0.
>> +  \item A device MUST report its current status accurately via
>> +        \msgref{GET_DEVICE_STATUS}, including whether the FEATURES\_OK =
bit has
>> +        been accepted or cleared.
>> +\end{itemize}
>
> This is fine if all messages are processed in-order, but that is very
> bad for performance (see above).  As soon as out-of-order message
> handling becomes possible, a race condition will arise: replies and
> notifications from before the reset can arrive after the reset.
>
> I thknk solving this requires either having a generation or stream
> number in each message, or delegating reset to the bus layer.

The token is meant for that and as said in other mails, we will investigate=
 the solution to
introduce a feature bit to enable/disable out-of-order to leave a door open=
 to such optimizations.

>
> (snip)
>
>> +\subsubsection{Device Notifications}
>> +\label{sec:Virtio Transport Options / Virtio Over Messages / Device Ope=
ration / Device Notifications}
>> +
>> +\msgref{EVENT_CONFIG} and \msgref{EVENT_USED} provide asynchronous noti=
fications
>> +from the device (or device-side bus) to the driver. The bus may forward=
 these
>> +messages in-band or synthesize them based on other signals such as inte=
rrupts
>> +or polling.
>> +
>> +\devicenormative{\paragraph}{Device Notifications}{Virtio Transport Opt=
ions / Virtio Over Messages / Device Operation / Device Notifications / Dev=
ice}
>> +\begin{itemize}
>> +  \item A device (or device-side bus) MUST send \msgref{EVENT_CONFIG} w=
henever
>> +        it makes a configuration change or status update that becomes v=
isible to
>> +        the driver. The message MUST include the new configuration gene=
ration
>> +        count and MAY include the updated configuration data.
>
> I would change the second line to a MUST, to avoid a round trip.

Ack.

>
>> +  \item If the configuration data is omitted from \msgref{EVENT_CONFIG}=
, the
>> +        device SHOULD include the relevant offsets/lengths so the drive=
r can
>> +        re-fetch the data via \msgref{GET_CONFIG}.
>
> This makes this clause unnecessary.

Ack.

>
>> +  \item A device SHOULD send \msgref{EVENT_USED} to inform the driver w=
hen
>> +        buffers on a virtqueue have been consumed, unless the device re=
lies on
>> +        an alternative, agreed-upon completion mechanism.
>
> Why SHOULD and not MUST?

If polling is used, there might be cases where this will never be sent.
Maybe this should be a MUST with something like "unless polling is used" or=
 something
like that.

>
>> +\end{itemize}
>
> (snip)
>
>> +\msgdef{GET_VQUEUE}
>> +
>> +\msgref{GET_VQUEUE} returns information about a specific virtqueue, inc=
luding
>> +its maximum size, current size, and, if already configured, the descrip=
tor,
>> +driver, and device area addresses.
>> +
>> +\begin{lstlisting}
>> +struct virtio_msg_get_vqueue_req {
>> +        le32 index; /* virtqueue index */
>> +};
>> +
>> +struct virtio_msg_get_vqueue_resp {
>> +        le32 index;        /* echoed virtqueue index */
>> +        le32 max_size;     /* maximum queue size */
>> +        le32 cur_size;     /* current size (0 if unconfigured) */
>> +        le32 reserved;     /* must be zero */
>> +        le64 desc_addr;    /* descriptor area address */
>> +        le64 driver_addr;  /* driver area address */
>> +        le64 device_addr;  /* device area address */
>> +};
>> +\end{lstlisting}
>> +
>> +\devicenormative{\paragraph}{GET\_VQUEUE}{Virtio Transport Options / Vi=
rtio Over Messages / Transport Messages / VIRTIO_MSG_GET_VQUEUE / Device}
>> +\begin{itemize}
>> +  \item A device MUST report accurate maxima and current queue sizes fo=
r each
>> +        virtqueue and MUST return zero as the current size if the queue=
 has not
>> +        yet been configured.
>> +\end{itemize}
>> +
>> +\msgdef{SET_VQUEUE}
>> +
>> +\msgref{SET_VQUEUE} programs a virtqueue's size and buffer addresses. T=
he driver
>> +selects a queue index, supplies the desired size (not exceeding the max=
imum
>> +reported via \msgref{GET_VQUEUE}), and provides guest-physical addresse=
s for the
>> +descriptor, driver, and device areas.
>
> Is the intention to still require shared memory?

Shared memory can be used and we have a message for that.

To be able to use virtqueues and dma between device and driver memory must =
be made accessible
to the other side as it is the case for other transports.

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
