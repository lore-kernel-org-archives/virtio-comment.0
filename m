Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012047.outbound.protection.outlook.com [52.101.66.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B693344DB9
	for <virtio-comment@lists.linux.dev>; Mon, 23 Feb 2026 07:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.47
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771832745; cv=fail; b=tBqjnxDVwZ58ICNb+WWlfiU05sLn1oDDJ9iltzAQOSTBvcw3Z4dcIL+MSKrE68UN5JVcKDfBEwJ5Bgn0LJNTHXt8TMihX/lbQEhcKTTR/OP6StkcEDKfWN+jw//2/q10nLghxfkG7zJO0jJV6CX0R+9aUCB4/JAuGLGsCkKKAWg=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771832745; c=relaxed/simple;
	bh=97P6l5IS6hdDaP4mgT5i/3dGfPcKDXTc9S6TrfGKB9M=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=q8v6QHTixPqt1W1okJkd20vuV+pXOXoCoi+vn0ju/4BLJa++iuW2wJerIB2dlGnN3myQd8J5DhVx1rfn9AdAtbRHfWspQqSvyXgJVlX6aYx5YWO5oBkUWOHqopy65TmMdJwc3XW7FimNK25wVT3kzu+ZBg0fS6i4YONxivs9oEQ=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=iX8PezwO; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=iX8PezwO; arc=fail smtp.client-ip=52.101.66.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="iX8PezwO";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="iX8PezwO"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=AWU7LB+2rM2U/MamXikW+O0hCX2kGLUEpL+aFV3jrYTAUTBPU7A4tWr+i05iQd+LyEnX3QlI9OiA2nomGDof88UZgNTm6/NMQy9krmpKiGwkZEfPCysTuOSeR4cH6Pvm4bc8DE5QINEnV19WIWy/5u8vpeOeouoyPughgg2dWYPVgaSO/En+WgtzwOX5rfMFe9PyhUVaryZXYHh0yNuAjM4UYZOBoES/QccvtcAiXNWY1pkU7hQQA82qbmxJOohutCMZNR7WyODwZgvMOPHvWAlwLufIUpV5KvVl3lUTCLzmPtBUpMS4/Dy4to2HZL+D13mqKG7MPEcobQLkAFtFJQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g5fN993ymCXszF6mm9Dej9trIU5nZHfvnhNQsbA5mP8=;
 b=LA4vh8QxPNCv8ukP0/BNqFuf13hRCS+hVIa+enF2lxiPNGPrSt8ydRQucNxpZ6d06gduTnkoWGDGdeatArCz6OfI9vNpKwTwJZU9+9I4u5Dbec0wXmZ5EOKYSdppapTbJ+CyNb9zJBhklHhFPZcH4TTOWWsLTuSR/qpeF5sLiRIyekXvd/I/K4lxkuzZr3zLnQQHZaRWT+8JsUx2BLho9QO9rN61yHq8QzeCR8wxBTnB+ZDlUDp2XvHSQ2BuxOcemabm1y1m+3d0nDcJnZSXVMjuNIEx5StdAq9FpzvNY/AdKAq6CJtB+M5dNLPlsggla8IlUZCUh0LTTO4VvFHwgw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g5fN993ymCXszF6mm9Dej9trIU5nZHfvnhNQsbA5mP8=;
 b=iX8PezwOfy1rYTCdlUw/qBLDM25JUYU/9tzB5lSVh9AceGZjmNmozHZjXQnkyop0jFbJNGIfLSwFcrmxffhAfc1xHLKdaoSJE33+j2DwY+WOdwn3Vr6KZeqjZ3ut+6DzPQ8jGG5MQsFSgarEQN3PRZ/WAByEsD7savdkcf8kwWo=
Received: from AS4P191CA0027.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:5d9::10)
 by AS8PR08MB6536.eurprd08.prod.outlook.com (2603:10a6:20b:31d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 07:45:33 +0000
Received: from AMS1EPF00000090.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d9:cafe::bf) by AS4P191CA0027.outlook.office365.com
 (2603:10a6:20b:5d9::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.21 via Frontend Transport; Mon,
 23 Feb 2026 07:45:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF00000090.mail.protection.outlook.com (10.167.242.87) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.12
 via Frontend Transport; Mon, 23 Feb 2026 07:45:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JRFfKSVuIFolot/v5iVKILGx0C86YE+m3i+ma7PU86Vf1DkHoEceNCylqxYjzeGutRfZNAYcNyPEKriz+nkXGEHk6PP79/r3OwjKlqeoIVdu1GrkH5GeGQL8slRERLFxImeBJEzWcEoamFGHnk2Wn+bwqwsmYgzihlYgVSKLDk3FMyNLDkNDpNvH022B754pb2xP0s574mz0ELmdIx98TBagx0sCNocmPoKsNua2jIs8Z925NrwxMpB4H0TUZOmBE91qusnzaFPQgeAY+QhJI1KRqB0aOvpfb7Bta4EA5tgUQgCvEKCpjOC5wOcNDnh+wHUgT38u7qyNuYByylIcsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g5fN993ymCXszF6mm9Dej9trIU5nZHfvnhNQsbA5mP8=;
 b=E8SawMcOWygg/N42UG4XKDh786yAua2aqqW8ItRqBL8nGPNkjiWZ0PZGRZa5hxoMfXlgs5vyswoWTwKQyr1RbzIVIeWm32QW2n+Fmq8rpU4UxSDbP0Yc0naWcWU53KpNgSf4Uqs0qYRmXlV8Gz5OzV10YeG2c2rT6faapkQZOtb3Fkx313VY4a72aw3CC9cC/8ZCJsc93j4WyNPDU9Zeg1KsHreKXMRx2JMKuQiFqbkWsSqdfrpdS+WNFObJ7GiVEhhQ9Ltr5Ii5VWPFhY36qrG0/xU8sVC+z8tQumJ/zkz/BV+P+TCq7zDhL4Rkve7UoRRzNhUlVAR9MEzp1IzGOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g5fN993ymCXszF6mm9Dej9trIU5nZHfvnhNQsbA5mP8=;
 b=iX8PezwOfy1rYTCdlUw/qBLDM25JUYU/9tzB5lSVh9AceGZjmNmozHZjXQnkyop0jFbJNGIfLSwFcrmxffhAfc1xHLKdaoSJE33+j2DwY+WOdwn3Vr6KZeqjZ3ut+6DzPQ8jGG5MQsFSgarEQN3PRZ/WAByEsD7savdkcf8kwWo=
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by GVXPR08MB10613.eurprd08.prod.outlook.com (2603:10a6:150:14e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 07:44:26 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%4]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 07:44:25 +0000
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
Thread-Index: AQHcjuFmIzYveS1Rqkq8YyoL1D1kt7WBGrsAgApT2ICAASCWAIADg36A
Date: Mon, 23 Feb 2026 07:44:25 +0000
Message-ID: <B073D556-8411-47DD-9A56-6BADFDA80C45@arm.com>
References: <20260126163230.1122685-1-bill.mills@linaro.org>
 <20260126163230.1122685-3-bill.mills@linaro.org>
 <6b4a7cfe-15bc-45cf-9fdf-ae99aafbfc15@gmail.com>
 <EC730EB8-9CEB-4B50-9295-2E1A908E22EF@arm.com>
 <9647c9bf-3f62-42fe-ad07-7e9dacc613dd@gmail.com>
In-Reply-To: <9647c9bf-3f62-42fe-ad07-7e9dacc613dd@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.300.41.1.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|GVXPR08MB10613:EE_|AMS1EPF00000090:EE_|AS8PR08MB6536:EE_
X-MS-Office365-Filtering-Correlation-Id: 8968dac9-0167-43d8-1198-08de72af866c
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|366016|7142099003|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?3hhAqNY2uB+LX8ZD1Nc2Ua6OBrGUMyu1zZLHd9aVCJ7hm6bY4dtCN70QI2fq?=
 =?us-ascii?Q?9/4AwK4H3hZ5h2feNHFy4da1eismPFFm/KTT38fvD+iDwPbPJ8UM9sonzQYn?=
 =?us-ascii?Q?lRhCS+plTwVGRSzjz5x7c1umtUvGCYPeg+acRB+ynqnj7HznEl/NCw0+TF4A?=
 =?us-ascii?Q?tbshxlkZrAwZjONQOJIt6O0Eugxfqf0oC6vq6NLH0A+WbiFHPgHuoPZJCaRQ?=
 =?us-ascii?Q?x6XJiHTqYNleFdj7DqGNYjOGmyoc2QGjCSRnsMQ6A9T7bR92bDzO/LfnY4LT?=
 =?us-ascii?Q?A2G/+k+/iJD+jm96gFHQWkdrm2hHUTSfUYqTytpLUHl3iLnOT1IxI8qLH8fl?=
 =?us-ascii?Q?Ea7eW19UZNz1fmxfUysX/GZKc5nGDNyNSa/Q6ZdZG3y5a59Cpgkj2sCfVfx3?=
 =?us-ascii?Q?CoPiZd1REvRl1KJLG3TElOupQMlSeMQRHAolAIRLwWlJZs9WO8XCTUpxqlg0?=
 =?us-ascii?Q?5wiSyS48P5U8EU5B/rIItuUqp+SCdoEUrjIooTnxjCp50k6Z2LyzH5+Dt5GR?=
 =?us-ascii?Q?JQPdCmtViXzGwkeNJXHcyyruMFRe+S2Ik1VWjI3wcRVnE7HIeKqSMOuBidDH?=
 =?us-ascii?Q?1p0P52L5v6uBA9jzFfFqWaDHdFmx40hKYYYvE+4s0FfnuVG8bhuHxM7RGCWz?=
 =?us-ascii?Q?SvtdpkutoebtNCv/YgqYH2otH/j8+/I1ugpsxumE0NbS3S68/EiniD88kumd?=
 =?us-ascii?Q?jmCShFQUc/I6atUt1X7Iqk6iYDcU7rlfkKspsSKHvdjnuf0GGq19UoRKSYto?=
 =?us-ascii?Q?OwUl0sQ7JKICzs/AeRtNq2y4fDMvyA+ZcN9Lb3B2RXQQ3yI8KkjIROktsxwF?=
 =?us-ascii?Q?txd6w1c7DFicdjdr1577NmUqPhXIgPsJWeUtFrtddMxIiG8pBPWnw+fdX6cV?=
 =?us-ascii?Q?AlixnORf+ute1+abY1yyFP7g19GFQMacjy5FVznWRjK5c3sGpemZiEqHys6m?=
 =?us-ascii?Q?2QpEo6mPur1zkBfMP/lKltiJEOMmSBus+uyYC6CyPBIK3rV8vZtOjpVbSXqt?=
 =?us-ascii?Q?5wMmM6xMxhKgtT3yOKyC4/fTgO8CzVDmMcmkwD13EorubO3RLUzGDNkg1afF?=
 =?us-ascii?Q?0hELXafP9YtjYH7g+aROP8sI5bh8lcrp232S+DcKgayO80btPDcmXwyMlMZY?=
 =?us-ascii?Q?6fSr/Tlut8GUs5+5oxHummcnlNmC+szlPGCMAV9Tj+gftKFUSIb++hdoFvfL?=
 =?us-ascii?Q?0JL7YQ+PAUUBOc+Zk2yVRbx5P5Naq1vrO/8qHeh1OQ8wnNiWp0w9Vm/sj18i?=
 =?us-ascii?Q?G8FUQWfkqpOj1D5c8DglPx7/yzJpnipIbnQhhUFG5IDl/9UVpC0y9i0xfbYX?=
 =?us-ascii?Q?bHl9P28Fwl6/cg1hIw4lYS9NqpbfVsWqn5kFFtR5guNG0X4McqF01KWObwEg?=
 =?us-ascii?Q?QMLWJm39qBaFSmvhbiYgX2mDQKOcAavZ0CfgiOfiu1LVaGTsqpuG7gnCFKsE?=
 =?us-ascii?Q?B/bQuKHwUtWiKsC0f9RXdzMGYBEF4O8j9w94GxdTk1x8RaAXt2VQaSEVkUTd?=
 =?us-ascii?Q?/vsCQ/kKfdt/iEesy+eF5XvaBfE7/llqv9yEio7HfeltpdRd/EFgAPc5gqC6?=
 =?us-ascii?Q?j3UgsiVPl17PcyPxk+76J4b5yokOoBHbrmuO8WlVGuGADdFbhxI5YgZNlhjM?=
 =?us-ascii?Q?BUWIunc0YKAybRglk+5sKDI=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7142099003)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <BD58B264F05A5148BF2E6CF3FF55C7E3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10613
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF00000090.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0f629542-ccc5-453b-df71-08de72af5e10
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|14060799003|376014|82310400026|35042699022|1800799024|7053199007|7142099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?irL0pR1o7T5jBJb9TUU4YiNKDtdmrZ34AdkVD16Vrod8pIPLf1DA6bOod+Na?=
 =?us-ascii?Q?xQpaywAjgnIylL7Dqno7+3Gw6cBzUqYE8XzLdVqyKLkfGzpGyN9PE94Uzrmm?=
 =?us-ascii?Q?GVNrDZKodxS0+/zxfOM13c+fZe5mEENCuoLRI1scb8idWUtFeWHHihLRxC3Y?=
 =?us-ascii?Q?k4lC/vZ+QzRq7QhGA/MeBF1gkKgnYQQqwrxkFZafyevqiTNIZ8XeXHX1huuT?=
 =?us-ascii?Q?0FYZbWCY7aKn6Ecg2mn/bGHA3hfVnivyzwDzrmQd0CN5BGZHVQFuLeLqX5gQ?=
 =?us-ascii?Q?7WsKlsUkW+c8or3l/eULeB+GbiBBjo9sWla0v6Gk3IPQyVdd0nr17uFVCcxS?=
 =?us-ascii?Q?0QI5RKfQ/dzzvdGkljblZ0FqeKYzbxnVuUTVOZqRidnXKGKbwlVEoWWOGrh4?=
 =?us-ascii?Q?QHzWDGXvykHb7yknZvGHsfMKNkc51re1LIA0Lfl3IkqUVA72izg0O2UAtIe2?=
 =?us-ascii?Q?e9DTQi+PFRelHgnx9s9zahrrJB0ZjnFWdpmp5E690oR7ioJQ0Z4ke0XRJT0i?=
 =?us-ascii?Q?iiT1FZhIIrzB8Wg0M57rG88CBLx46cB/C2RpBALfporj8ILP+IWzgC+2FAi+?=
 =?us-ascii?Q?zq80/MRWUWpfK/GvlI9yUJYjcPrWDMj9wBRBmzhEZZ7tyvHwwHgmaoi6op4j?=
 =?us-ascii?Q?VBhVZpGNOP4dLCxsQcHFYe7ieKk0EXWxwetjOEuMpnK3eLx6GljHHFKnA2jV?=
 =?us-ascii?Q?rB/J1ivn+f79tr7QkYODys4AYbN4x4viLz+/4RSbBnT3bhJT5/EETMtthnaE?=
 =?us-ascii?Q?IluhwKr1Bge2E+mxDTkb/vSx8j2XU27VSQRoaqheCF5vsdQ4cyBmx3F1iEgH?=
 =?us-ascii?Q?PPfLt6LPaoqiWndNN5BmxCMSN2Z0kfGD5fdzh7fEdq2sdXIPqtANMmyfkYX/?=
 =?us-ascii?Q?Zq/u4N5RmgVzAXQQ1sjsnJtpG3UKRvNw/RD5qPfgXFst7c8Dz3sjuqfJVdho?=
 =?us-ascii?Q?bybXwukCfsoDonGogB3XvMDVpPuE4V9zCe9TxlKx1/h2wL6lGQ5tmCI7dC5j?=
 =?us-ascii?Q?4eGXgI72VgEvhBHQbLibH3/x8SbZYPquRxVNONYfGUdTm8FipVLK01OkG34v?=
 =?us-ascii?Q?3N/E0ulhTd1Mq5RjwcOSaSCi2dH+L7qWi/4miTDFNa/XLxejOMN5b859YTW7?=
 =?us-ascii?Q?7OmdUOWK2P9c0/Y/GiIA+N53XDvI8gKAXSciH9qWyph6YZmcdMWFsrmTl17c?=
 =?us-ascii?Q?kegSGQPoJOdojflJ8TvGIvnA6jJxMg4LxHNRvynM8RfCchfIZ0GFMQucKMzt?=
 =?us-ascii?Q?wyxaO3I9FAxEIF2b3ea0n3XiMAanfolScr9MIz+IbhQBbo9/sR8rzRcVTMOK?=
 =?us-ascii?Q?eWhlfiGkJ7kORIHkTf5KzJnfjuatBzC3sqTp7g+visk6AZtSJlF1nDGZqpnW?=
 =?us-ascii?Q?CBq1UtQVK00D0YmIjDtj3VgYqDFrGh4/93bZdgcYvzsjl+orjLqb6ENiPg1P?=
 =?us-ascii?Q?SYd6z21OMRBDhOjw/I1ga9ajZLwYsBXC/7AADjBFuy9X1LuALGQuPwmJ5gbw?=
 =?us-ascii?Q?7aekYBWDjQGSB9sTiCiuc2xLTUCMxac0vI7PwdB97meLWCQHFpSI9CsOZurM?=
 =?us-ascii?Q?BqMs8JX+jtMcf/izsD23bVCxvLi/Oq2yutynkp1Eq5MKOvpUnQywpR5IB4sM?=
 =?us-ascii?Q?KIwaHA/OHdrOProy6F4quNXAEzqniwD8XVEVvswDlX9xlVi5iz3iQV0bj29k?=
 =?us-ascii?Q?E7dLxw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(14060799003)(376014)(82310400026)(35042699022)(1800799024)(7053199007)(7142099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	J5I6RKBbYfuY9wYQIDkovziwDhK8NFRk0NnCVXbTZ9vd1DP+mG9K51Zp05owcPqoa2ZqLaM7SsQ94M/SwbSsjQGrLWyXxrCDnBbwBycTcZJhx+YgjN+pabpb+nQrt7MoPOXPn2xpMfvsqjpf97MirClNyxM8mRnHJ4JhdqMfi/gfLBJVnTfxfBSgsyjVE2sEK7U8LDL8IOLZXAaPK254OyvAKG0AA9HOp6CRL3vpcB4xyW2yKV3/a+8dv1QdOJK1R11IDzXn4RPmLjc4K4/s8XRppYqXzl704icEre0bOUAS6zdsOKIpyyz9CJMqTy94ql+tk94j9taU2H6LyxcY73BHwGGNrScgzH9EwZyBaYnujF0aFtaJ3Ib/KO9jKbbXwgPpx3MgVT++1wYr+yz6uA+llyD1qH/xWInwLDvfaYFHh0HMPUOgIOZzIOPVBRm3
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 07:45:33.2264
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8968dac9-0167-43d8-1198-08de72af866c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000090.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6536

Hi Demi,

> On 21 Feb 2026, at 03:04, Demi Marie Obenour <demiobenour@gmail.com> wrot=
e:
>
> On 2/20/26 03:52, Bertrand Marquis wrote:
>> Hi Demi,
>>
>>> On 13 Feb 2026, at 20:09, Demi Marie Obenour <demiobenour@gmail.com> wr=
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
>>>
>>> (snip)
>>>
>>>> +\subsubsection{Message Ordering}
>>>> +\label{sec:Virtio Transport Options / Virtio Over Messages / Basic Co=
ncepts / Ordering}
>>>> +
>>>> +Transport messages fall into two classes: requests (which expect resp=
onses) and
>>>> +events (which are one-way). Drivers and devices rely on the bus to pr=
eserve the
>>>> +relative ordering of request/response pairs for each device number; t=
hey do not
>>>> +interpret the \field{token} field directly.
>>>
>>> I expect that this requires all messages for a given device to be
>>> processed sequentially, which is not going to be fast.  At the very
>>> least, messages on different virtqueues should be able to be processed
>>> out of order.
>>>
>>> I would have some sort of stream identifier that is made visible to
>>> the bus layer.  This would map to a QUIC stream, a single ring buffer,
>>> or something else that ensures in-order delivery.  Messages with
>>> different stream identifiers may be processed out of order.
>>
>> We have the token meant to be used to reorder messages or make them corr=
espond to a request.
>>
>> Now we choosed on the first version to enforce the order to prevent havi=
ng something that would not
>> work in the existing virtio implementation where drivers are not designe=
d to handle this (configuration
>> space access is done in order and is not expected to get answers coming =
back randomly when reading it).
>>
>> Now I do agree that this could be a place for performance optimization a=
nd it would be possible to (as pointed
>> out by Mickael) introduce this as a feature bit so that implementation c=
ould support that or not and disable it.
>> This could be handled at bus level or directly on the device side.
>
> This was made under the (mistaken) assumption that virtqueue data was
> also sent over messages.  An ordering requirement for that _would_
> be a performance problem.
>
> I do believe that virtqueue notifications (data available/data
> consumed) should be allowed to be received out of order.  There is no
> requirement that these be _sent_ in any particular order, so further
> reordering by the bus isn't going to make things worse.

Agree.
I will also find a place in the transport to clear up that virtqueue data i=
s not transmitted through
messages but normal DMA/shared memory to make things clear for the reader.

>
>>>> +\busnormative{\paragraph}{Message Ordering}{Virtio Transport Options =
/ Virtio Over Messages / Basic Concepts / Ordering / Bus}
>>>> +\begin{itemize}
>>>> +  \item For each device number, a bus implementation MUST deliver res=
ponses to
>>>> +        the driver in the same order that it forwarded the correspond=
ing
>>>> +        requests to the device.
>>>> +  \item A bus implementation MUST ensure that every request forwarded=
 to a
>>>> +        device results in exactly one response delivered to the drive=
r (unless
>>>> +        the request is defined as an event).
>>>> +\end{itemize}
>>> What is the reason for the device/driver distinction here?
>>> Intuitively, I expect both requests and responses to just be messages
>>> at the bus layer.
>>
>> At the bus layer there are only requests and responses but at the end on=
 the device
>> side you only get requests that you have to answer or event that you sen=
d. There is
>> no case of request send by the device side which would require an answer=
 from the
>> driver side.
>> This why we have this here but we could relax it if you think this could=
 be useful.
>
> I think this would be better written as a constraint on devices, rather t=
han as
> a constraint on buses.  Right now, it reads as if the bus is responsible =
for
> ensuring messages are replied to.

Makes sense, I will rephrase from device/driver point of view in the next v=
ersion.

>
>>>> +\devicenormative{\paragraph}{Feature Negotiation}{Virtio Transport Op=
tions / Virtio Over Messages / Device Initialization / Device Features / De=
vice}
>>>> +\begin{itemize}
>>>> +  \item When handling \msgref{GET_DEVICE_FEATURES}, a device MUST ret=
urn zero
>>>> +        for any requested bits that fall outside the number of featur=
e bits it
>>>> +        implements.
>>>> +  \item After receiving \msgref{SET_DRIVER_FEATURES}, a device MUST u=
pdate its
>>>> +        internal feature mask to match the acknowledged set and MUST =
reflect
>>>> +        acceptance or rejection by leaving the FEATURES\_OK bit set o=
r clearing
>>>> +        it in the status returned by \msgref{SET_DEVICE_STATUS}.
>>>> +\end{itemize}
>>>
>>> What should the device do if it doesn't support the feature?
>>
>> This is what we meant to say with acceptance/rejection. If something is =
not accepted
>> the FEATURES_OK bit will not be set in the message returned.
>> Maybe we need rephrasing to make that clearer ?
>
> I agree.
>
>>>> +\devicenormative{\paragraph}{Virtqueue Configuration}{Virtio Transpor=
t Options / Virtio Over Messages / Device Initialization / Virtqueue Config=
uration / Device}
>>>> +\begin{itemize}
>>>> +  \item A device MUST report accurate maximum queue sizes in \msgref{=
GET_VQUEUE}
>>>> +        and MUST persist the parameters supplied via \msgref{SET_VQUE=
UE} (size,
>>>> +        descriptor, driver, and device addresses).
>>>> +  \item When \msgref{RESET_VQUEUE} is issued (and VIRTIO\_F\_RING\_RE=
SET is
>>>> +        negotiated), the device MUST quiesce the queue, release any r=
esources
>>>> +        associated with it, and allow the driver to reconfigure it.
>>>> +\end{itemize}
>>>
>>> What should a device do if it gets a request that a driver is
>>> forbidden from making?  Untested corner-cases tend to be a good
>>> source of security vulnerabilities, so defining behavior in all cases
>>> seems better.
>>
>> This is to be handled at the bus level which should return an error to t=
he transport.
>> FF-A bus defines an error message so that the sender bus when receiving =
it back
>> for a request can give an error back to the transport.
>>
>> Maybe we should describe this model in non normative way in the spec ?
>>
>>
>>>
>>>> +\subsubsection{Status Information}
>>>> +\label{sec:Virtio Transport Options / Virtio Over Messages / Device I=
nitialization / Status Information}
>>>> +
>>>> +Drivers query the device status via \msgref{GET_DEVICE_STATUS} to obs=
erve
>>>> +progress or detect errors, and they drive the Virtio status transitio=
ns via
>>>> +\msgref{SET_DEVICE_STATUS}. Writing zero to the status field resets t=
he device,
>>>> +invalidating any configuration or virtqueue state.
>>>> +
>>>> +\drivernormative{\paragraph}{Status Handling}{Virtio Transport Option=
s / Virtio Over Messages / Device Initialization / Status Information / Dri=
ver}
>>>> +\begin{itemize}
>>>> +  \item A driver SHOULD read the device status via \msgref{GET_DEVICE=
_STATUS}
>>>> +        when diagnosing errors or determining whether the device is r=
eady to
>>>> +        move to the next initialization phase.
>>>> +  \item A driver MUST use \msgref{SET_DEVICE_STATUS} to drive the dev=
ice through
>>>> +        the virtio-defined status states and MUST write 0 to request =
a device
>>>> +        reset when needed.
>>>> +\end{itemize}
>>>> +
>>>> +\devicenormative{\paragraph}{Status Handling}{Virtio Transport Option=
s / Virtio Over Messages / Device Initialization / Status Information / Dev=
ice}
>>>> +\begin{itemize}
>>>> +  \item Upon receiving a \msgref{SET_DEVICE_STATUS} write of 0, a dev=
ice MUST
>>>> +        reset its internal state, invalidate existing configuration a=
nd
>>>> +        virtqueue settings, and present the status field as 0.
>>>> +  \item A device MUST report its current status accurately via
>>>> +        \msgref{GET_DEVICE_STATUS}, including whether the FEATURES\_O=
K bit has
>>>> +        been accepted or cleared.
>>>> +\end{itemize}
>>>
>>> This is fine if all messages are processed in-order, but that is very
>>> bad for performance (see above).  As soon as out-of-order message
>>> handling becomes possible, a race condition will arise: replies and
>>> notifications from before the reset can arrive after the reset.
>>>
>>> I thknk solving this requires either having a generation or stream
>>> number in each message, or delegating reset to the bus layer.
>>
>> The token is meant for that and as said in other mails, we will investig=
ate the solution to
>> introduce a feature bit to enable/disable out-of-order to leave a door o=
pen to such optimizations.
>
> See above.

Having a feature bit for this might be a good way to be future proof anyway=
 even though
i am not really sure the performance improvement would be noticeable when v=
irtqueues
are used as the main data patch.

I will investigate that as in my tests there could be corner cases which ar=
e tricky, for example:
- activate something using a config bit/value
- event resulting from this activation coming back before the write to conf=
ig is acknowledged

This might be a case that a driver has to handle anyway as it could happen =
in mmio or pci
but this could be more common as messages are asynchronous so an event coul=
d come
before the write is acknowledged.

>
> (snip)
>
>>>> +  \item A device SHOULD send \msgref{EVENT_USED} to inform the driver=
 when
>>>> +        buffers on a virtqueue have been consumed, unless the device =
relies on
>>>> +        an alternative, agreed-upon completion mechanism.
>>>
>>> Why SHOULD and not MUST?
>>
>> If polling is used, there might be cases where this will never be sent.
>> Maybe this should be a MUST with something like "unless polling is used"=
 or something
>> like that.
>
> What about this?
>
> +  \item A device MUST send \msgref{EVENT_USED} to inform the driver when
> +        buffers on a virtqueue have been consumed, unless the device rel=
ies on
> +        an alternative, agreed-upon completion mechanism such as polling=
.


Sound good, will use that.

>
>>>> +\end{itemize}
>>>
>>> (snip)
>>>
>>>> +\msgdef{GET_VQUEUE}
>>>> +
>>>> +\msgref{GET_VQUEUE} returns information about a specific virtqueue, i=
ncluding
>>>> +its maximum size, current size, and, if already configured, the descr=
iptor,
>>>> +driver, and device area addresses.
>>>> +
>>>> +\begin{lstlisting}
>>>> +struct virtio_msg_get_vqueue_req {
>>>> +        le32 index; /* virtqueue index */
>>>> +};
>>>> +
>>>> +struct virtio_msg_get_vqueue_resp {
>>>> +        le32 index;        /* echoed virtqueue index */
>>>> +        le32 max_size;     /* maximum queue size */
>>>> +        le32 cur_size;     /* current size (0 if unconfigured) */
>>>> +        le32 reserved;     /* must be zero */
>>>> +        le64 desc_addr;    /* descriptor area address */
>>>> +        le64 driver_addr;  /* driver area address */
>>>> +        le64 device_addr;  /* device area address */
>>>> +};
>>>> +\end{lstlisting}
>>>> +
>>>> +\devicenormative{\paragraph}{GET\_VQUEUE}{Virtio Transport Options / =
Virtio Over Messages / Transport Messages / VIRTIO_MSG_GET_VQUEUE / Device}
>>>> +\begin{itemize}
>>>> +  \item A device MUST report accurate maxima and current queue sizes =
for each
>>>> +        virtqueue and MUST return zero as the current size if the que=
ue has not
>>>> +        yet been configured.
>>>> +\end{itemize}
>>>> +
>>>> +\msgdef{SET_VQUEUE}
>>>> +
>>>> +\msgref{SET_VQUEUE} programs a virtqueue's size and buffer addresses.=
 The driver
>>>> +selects a queue index, supplies the desired size (not exceeding the m=
aximum
>>>> +reported via \msgref{GET_VQUEUE}), and provides guest-physical addres=
ses for the
>>>> +descriptor, driver, and device areas.
>>>
>>> Is the intention to still require shared memory?
>>
>> Shared memory can be used and we have a message for that.
>>
>> To be able to use virtqueues and dma between device and driver memory mu=
st be made accessible
>> to the other side as it is the case for other transports.
>
> Should these be I/O virtual addresses instead of guest physical addresses=
?

MMIO is using the term "physical address" and we should keep using the same=
 terminology as I/O virtual
might be wrongly interpreted. I will remove the guest part because this one=
 is misleading.

I have been using term "bus address" in the ffa bus specification to improv=
e the abstraction as in it
the "physical address" has nothing to do with any physical address but is a=
 common way to refer to
some memory so that it can be mapped on both side and virtual address be re=
trieved.
But here i think being coherent with other transports might be a better ide=
a.

What do you think ?

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
