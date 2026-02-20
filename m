Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013041.outbound.protection.outlook.com [52.101.83.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F68E3115B1
	for <virtio-comment@lists.linux.dev>; Fri, 20 Feb 2026 09:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.41
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771578213; cv=fail; b=aCQjdyX2yGuOFMWpNOQBz+TYPE7FrVhU8X8zkr2zC5cwftSog9Eb9kxWYEhKMD7FCGSEtxVPhwxOR4emGHHP86HhFtAr/1SRjRqA1n9w/g4hANz4Chz5C3PrGDQVylpDLnf35Y5nsy5HsRA279BW4Pm02+Ydlk5GZ2x8UQlhmVk=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771578213; c=relaxed/simple;
	bh=S6t4WljIn/bwQhnFuTyk8fHUkq3JB58NzX1Du9n15/E=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=H+8przWJIyz+7um7Flc6Xq/c5KACzasg9mZ5/zC0tjHUMKw5HCG6z7jqzOIyIaKAOZdyGiOXGvC5Yd+l8bI6bfa1B4T7p64AZEM9aee+UKJlpEvF/Wl9tQzckimW9ehQDoVmNCDzeCVDrpVDjEUMnYCFMLFieAsDgMjgW0NwUDQ=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=bFzDMk0m; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=bFzDMk0m; arc=fail smtp.client-ip=52.101.83.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="bFzDMk0m";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="bFzDMk0m"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=S+3ZV26NUk7RsTEWVOfeSjhgsAae6u0IXBNlx+KjX8CFusWdI0A5pXoDiyTQco4JQt1faDfI4dRs+Bj7ksB16gQ3WCLRkjBzP4hu48F/7EZsJ8+1qIlSOju1A0fcsPcmO7ysmlo8EoJevFp9fuT4nDlgT4ilnK0mm2gGcq/96CmIzs6UIpXML0atvkmG5Q8yfL1Mj8tT8ZzM8JHpErK6EXv2ICe8OR+zMfC0VovNnKq2rFG8tr+1BBSIMn23SKl+k7CQ5PvOPC+A27muRPiZIq/DPGSjvVp+ucNIepPwmfcrX4ywMN+qWLZ3jzB7a/cc1YBPq4sdHaE9hOa9iAMiUw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K2TZGiA0HqrUeId1eqmAmS4oLnj5oHzqSwJjupgKZ6g=;
 b=dRTWI7EVpbANQD9crjF24ToYG8K9pgRWvGojNLnp70wvjciievjO6tJLltzKC9yTa1A6BmNHvMIntIALUE8JyEH4YLLGVnZIoQqsiE6dJTav5Zd6m/6b5jzITKnVbcHTs/Qkqz+V5Q6y/zJ0J7GHPDjCtXwSY26gJ31z3WYwfRxJJ2Z1xsTkLvUk3EjLW+4qjjnab64FQBtn46W90g9TCP2QPpIsXSHzrgZ+ZRMsoxJB9XoZXxDWUU7rBFULehkmJwTOZ+wQsvt4NjqSUqQu+bSjJaKsEfci0FmC35icBQpCtTqUgbenZiGdyDtv+FEJHg90l5+t9Xx0whZF2fimnw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=nvidia.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K2TZGiA0HqrUeId1eqmAmS4oLnj5oHzqSwJjupgKZ6g=;
 b=bFzDMk0mJZkpOYMK0vwytq0xD2QFDCAAL4i5X2luznl2l7li5bJ4BK5wGNnc2NjZOhPZDtUrTL/G8B6++qKUMS1A5JSsBpuf13UO84lbHp2d6tYZX5oBNXkZF98zk4KJBejZ/D6zKNfHSuZxvPz+GuLxaDKuFKJAU/ZH5uH+NNw=
Received: from DB9PR02CA0028.eurprd02.prod.outlook.com (2603:10a6:10:1d9::33)
 by DU0PR08MB8017.eurprd08.prod.outlook.com (2603:10a6:10:3e4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Fri, 20 Feb
 2026 09:03:19 +0000
Received: from DU6PEPF0000A7E1.eurprd02.prod.outlook.com
 (2603:10a6:10:1d9:cafe::3c) by DB9PR02CA0028.outlook.office365.com
 (2603:10a6:10:1d9::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.15 via Frontend Transport; Fri,
 20 Feb 2026 09:03:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000A7E1.mail.protection.outlook.com (10.167.8.40) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.12 via
 Frontend Transport; Fri, 20 Feb 2026 09:03:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HMegpRVMFKof0haPjvWQ6nHc+0NmnlqI0htuXJmcpurhKMvoJXDatuQDEPh+TxAaDBJCxyZtzVGWgcbCrNmGK52O/ex/N1EniXoRJOqecohSktRgqJHC1c6ezfglAUuX47wk+iWnKmKTOxeUSetOpXxQewKB13JHSjxQbc0mG05BpD7+DBhhx9kxkfYEm+r1khzH3UE7Y3jWF+Nlv4PwEUbGwum2cuMYUkkgAi4f486uKnvNRHTsvNhToAc03vItOWpE8dPwVpE/wdqYPCHLTtsP3n7GduAxOVfjpyT8zql4zoamf3cthTHb+ZhgTNeshe7v9lxX/ylBlk5ZpQqSAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K2TZGiA0HqrUeId1eqmAmS4oLnj5oHzqSwJjupgKZ6g=;
 b=keAAs+dDeIgn4MiIOBgU6z6YNcKIEjPVJiQdySfvr1AWXYW3te0RwD8zt7wxKXD4rdQVzUl0Wux5K+ILFVMFnhcLfKmht6SY1Ql1cDLi8XaXKbvGJxlwKUWBNfnoJiY1YHac1DB5Cabgw4kRqPPZ2GU6TT+XILTx817Q5FnwbUtynkab2eOAyJsR7P3y0R2sN+/wwM8Iv6h3P3EmOfeUV+5R5hEuNyNuwfiTaPg60wC6WBXfIGKt+2ah0eBGJmol78mZHh2d2pnO7gvpxKD+fB+4RUmOde+TVXcFvA5YZfJXPssDK2OiYfthttob/U5XFUSr04YPG5dl80AxWnT2iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K2TZGiA0HqrUeId1eqmAmS4oLnj5oHzqSwJjupgKZ6g=;
 b=bFzDMk0mJZkpOYMK0vwytq0xD2QFDCAAL4i5X2luznl2l7li5bJ4BK5wGNnc2NjZOhPZDtUrTL/G8B6++qKUMS1A5JSsBpuf13UO84lbHp2d6tYZX5oBNXkZF98zk4KJBejZ/D6zKNfHSuZxvPz+GuLxaDKuFKJAU/ZH5uH+NNw=
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by AS2PR08MB9045.eurprd08.prod.outlook.com (2603:10a6:20b:5fd::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Fri, 20 Feb
 2026 09:02:12 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%4]) with mapi id 15.20.9632.015; Fri, 20 Feb 2026
 09:02:12 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Parav Pandit <parav@nvidia.com>
CC: "Michael S. Tsirkin" <mst@redhat.com>, "Bill Mills
 (bill.mills@linaro.org)" <bill.mills@linaro.org>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>, "Edgar E .
 Iglesias" <edgar.iglesias@amd.com>, Arnaud Pouliquen
	<arnaud.pouliquen@foss.st.com>, Viresh Kumar <viresh.kumar@linaro.org>, Alex
 Bennee <alex.bennee@linaro.org>, Armelle Laine <armellel@google.com>
Subject: Re: [PATCH v1 0/4] virtio-msg transport layer
Thread-Topic: [PATCH v1 0/4] virtio-msg transport layer
Thread-Index: AQHcjuFkYi+cgIzLc0OakdFLCJk7FbWAwh4AgAoWYICAAGnugIAALveA
Date: Fri, 20 Feb 2026 09:02:12 +0000
Message-ID: <C6374491-FCB1-421F-9273-16B9CB954F5B@arm.com>
References: <20260126163230.1122685-1-bill.mills@linaro.org>
 <SJ0PR12MB680610C1B53CA4E8B4470411DC61A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20260219185034-mutt-send-email-mst@kernel.org>
 <SJ0PR12MB6806F703CB616D184FCBE5B3DC68A@SJ0PR12MB6806.namprd12.prod.outlook.com>
In-Reply-To:
 <SJ0PR12MB6806F703CB616D184FCBE5B3DC68A@SJ0PR12MB6806.namprd12.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.300.41.1.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|AS2PR08MB9045:EE_|DU6PEPF0000A7E1:EE_|DU0PR08MB8017:EE_
X-MS-Office365-Filtering-Correlation-Id: a0314a1d-d837-45c0-16a8-08de705ee422
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|7142099003|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?mapa2BeUxOJonh0JBkQKJr8KZCSz+ZzMCqr0yWBG5Z8osI8ZphH07k2vtQRI?=
 =?us-ascii?Q?2NVvLcPmIu558Yma1i+9f15mzn7VI0k+94dIOSKJFsn9d+JKnwG2j4ncr768?=
 =?us-ascii?Q?9/pr3yT2Z2eme7FLgbWAkntQThP+zXDbuuNZ/ELRNZBTW1BPFByuVrbc+T0r?=
 =?us-ascii?Q?nbEbYJv2w/TifV/9JhfyQGzbQhSXKmGvxH2xZ4tbY7/ySGpUMYFs5NccG3Nh?=
 =?us-ascii?Q?3y1yAJH/mCbiZ+06Ain/ar0BGqhSLVFSzqFgQ/L4j0zbecZVTR1GSvzDM2/C?=
 =?us-ascii?Q?3s2XSvgJqfxo5JrwCBpdVlu6ilzwUldH24Z2QTFFARIE5dXg5T5hQjm6zwsb?=
 =?us-ascii?Q?WC+/YjC01DyUi3SB6wf1tcfj6Hb8oE2HdKjtn3MQqOZxgY34kCbhfwDEMYjp?=
 =?us-ascii?Q?pFpsWT4+t6O75MdRjDU25NlQ1K+2hUD9wnI2iOSDTcvWJdri8bUDP6CVx0Pf?=
 =?us-ascii?Q?ePeQV9prfGixs+oBUJ/fNCqnTZFzT0OMqBScyhPU50d6QAbVVNyKCeG39T1S?=
 =?us-ascii?Q?AOUkMBDJic4mEQgZi6AcJgTP5Ytr4MJ+/EVYweXv2V44W4tfYwuSSYuQGX8L?=
 =?us-ascii?Q?5JLVFgpBKmxKqqKm97dJGxu5mP9YT9+ZVNP4lzEzy8al4C45U8II51olRRoL?=
 =?us-ascii?Q?4LoNJSX9Kxop9QW4DZ/yeDBHTglAIaxOWUGgm/tuS+1mSNDeYynrh0HeRtfJ?=
 =?us-ascii?Q?kEw8BvsmrLkau8EJmxdPYK/0xmHZ4roG6PjE4wHZL6wLdmDQSU3qf3MRXPJ1?=
 =?us-ascii?Q?Q5iZuLbOJ++bYZEQQYTvQDV0UoOBBpBZdk3PUho7ihA0S3bDljdbfRcWMtOU?=
 =?us-ascii?Q?7MnIvZi6502UXnQVb/u9KkPRdUV1vItpCphX9dzs7q6XwPUCI+NQHY6mwp48?=
 =?us-ascii?Q?3esqaTb5VoLj5foGVyKJuqhWO2idu9/2wJGc5iJsMU+99SSW5CVSBI6g/lv7?=
 =?us-ascii?Q?ShUBSnuexzSv4ZpD3g+YXYsNo/uyZzZGbgc6FO5uCYErLCfqoag8D29Akg7Q?=
 =?us-ascii?Q?d2Z9u82Wuzb2mM1V+IaCkb9jmjWKnpnm646M45oL7/V5AIBYNZveJe9Pq+ug?=
 =?us-ascii?Q?eFheLieavpqlXYOXwPoJrimDAgoUHPZrqhiR+wg668AO44kGTJ6QunJK/E8k?=
 =?us-ascii?Q?wF7V31RUAR6HhkU90lJ8io1yWi60wT9K1y0OpesUHGn14VmGUd8RECNrhbtw?=
 =?us-ascii?Q?HYT/b8RNkOgvd1/tjls4BVmnT27cV64TAlvqA4F66pH2hZjyGiCmpSXhd2JW?=
 =?us-ascii?Q?VCPC37vaLcayftjGElZhOyIaHyvweRd1CecxXhF54uzIg6ZqoySE359S1N0i?=
 =?us-ascii?Q?lIbBjnQtK6xB+4gmseAbcwbX5BNcnNT9BKwZT/fGXFv/7QEsgPLNhBkPoS8l?=
 =?us-ascii?Q?ObIOKH7gQft1n9lcdtdC/RVsKgnQZnW06as4Gl0hapPObRScyn76CMfDlS30?=
 =?us-ascii?Q?65GygiKkZMmsl3XhCSs/Q79vw0KsxgpfsBonOyJ46F2neVSiogTlQLP0fr7o?=
 =?us-ascii?Q?0AeqSQo/UESXcPejcbMO9NriY4PTb5JXTcdkCQJkh40gTG6zshRnqq5szzyK?=
 =?us-ascii?Q?LLxEv/XGfU/DoeGpQsWWrpHFcUJJAFxKwznp6+y0?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7142099003)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B388BC990A7A7146B1326261A670EB2F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9045
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000A7E1.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	43313f82-4b19-4ba3-4fbc-08de705ebc46
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|35042699022|36860700013|14060799003|1800799024|13003099007|7053199007|7142099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+ncNcVxJbkhkmDl57bKzxOqHnPT1RdHchn8TQ0zVsVLz7+sWzlUJWFBLBgMz?=
 =?us-ascii?Q?GTWzhNuHR85b/d+3A5x28O6JMrtXvI5trvZlA/IKcwr2cX3BILEs1NshO74g?=
 =?us-ascii?Q?d0cTFZ9nGWkroy3I/QMzPz2khz3NVTBIL5xwoWyh47zyoYQdELkmO+Z0ifbH?=
 =?us-ascii?Q?+HHl7Jfk8OtMJHxKxqmfUAfd5QsIYUoZmPxuM17Z+xG3Td0kez2qEryZw2aS?=
 =?us-ascii?Q?Yjj56+5ykxfzIkU0uA3vV/YZKLebdPf31Shb3WWIivWBdFQvYou7c1Bb5At6?=
 =?us-ascii?Q?Ghe9f7wf5ZfKvz/O7XcWsVxfvbo+TRCuwg3WZ7zadgYXlvVlmZk9vftrZxqZ?=
 =?us-ascii?Q?HmRkAqIySbjmsLDFSU7cNc2B5kZcr3vVJv3TGwxYTOOgyufMTgZI8NF93Moy?=
 =?us-ascii?Q?sDsvPDKTCt40JOVAAvIW1JKvF+JYLfL8vDOmatevWJN2QSO6PoBD84Hp7hYq?=
 =?us-ascii?Q?w8f36YJnRL7Nd/HSsbttl0qcw9ojZY8SUxBUfBUkFLtiQyBONXANaDrJewmO?=
 =?us-ascii?Q?u8Ti0oKvzkgdl0G2B1C1PR5c/am81S+W70LchMAHjbezwDbgQHaSvcwUqhF3?=
 =?us-ascii?Q?t5SGKdd1sJQP/2TkwLQV76QCiTn+siZf3AYdGSIeYVIB0V/IIe19fyxDUNNr?=
 =?us-ascii?Q?yl2Qp5LQzOKTfLBjnGyY+Z5Zaur+UXN+RU0vJnqxMN6Pc8duewpo+yaDlcoD?=
 =?us-ascii?Q?1ixIruCggrp5LFu+cqc8MjEm4hFFY04ZZH63fF88L8Jtpfz8UWKMvF2KdVmP?=
 =?us-ascii?Q?USglHBuxybkaezld7lq0F36y8crefgkyAm+jp2OCgL1XCtO2yb0g5OSvED45?=
 =?us-ascii?Q?D402JuoPGJ4z/gC3Doil9JhhmNa/D8zMQ8Ft+IlxaT5/rnfL97Ix0HSWCLYT?=
 =?us-ascii?Q?tdTfkZglL/9BSLkrSsQdpHOmuygdr5gu0uCxD+++A4GMw5m/rbB5jpbivIL8?=
 =?us-ascii?Q?LO8BM4TrLgrzJTxtDm+T6wxG/+bX+nVJ8YFrHNocwWqW+brmKug7TFV/9Ewe?=
 =?us-ascii?Q?m0ZvNlxLhpZO/YQAEzakYIOJLKKI6xruir91LIhgOOZg/hhRWIFxEzXQcBl1?=
 =?us-ascii?Q?FJKmmD1oexXHETsRvHZjJsK34ICkRERqoZ5fXs12OdICPl00at9zB+y/f1Xo?=
 =?us-ascii?Q?fn3dLYJpnW0ZVnVNxDIxhoQ4lpk2nlD8asxA7+C25i7cs9uHrJPjmpiHCmx2?=
 =?us-ascii?Q?T266dKgNc9TtUwXcrIfqN7K2wmqXlK0HxyFRXxC5QytHjMfOcg1jNRB+rTaK?=
 =?us-ascii?Q?6X+wDZznOpSDA5WqnfVjwGbU/Hc6RTYQwkCV2dbPKGC3+wkdfVlbvdbIrF7m?=
 =?us-ascii?Q?Ip3vbV4zcpIFnzfZFKFE4B62q/c2T4Men93e7CRxRh4FxpmXrB0LPhypy4ID?=
 =?us-ascii?Q?cFrSLO24Z/GDX71XTaWukSXy+WBsAZHEkdCabyOv5mXyXZXVcGGghtPDeKXG?=
 =?us-ascii?Q?64oQ1LsK9NAlOJMqFG3Swq5V2dZ0P6umZ4KMe13pQRD6q1mTjoFfpb5sk4vV?=
 =?us-ascii?Q?lPFuve8FmMbTcDyaGhlKnC6QKMlFPAGmh2VeoXF+PJkmHl8eYrVjD0IKUlbC?=
 =?us-ascii?Q?1Dvp1uQohwujL5MC8asUvqD6RpuIvtjRHmyl7YLXTtXdG5H3OTrIGbDuQzZ0?=
 =?us-ascii?Q?eZYyHlkCRIOaQmhhZQsjfWE=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(35042699022)(36860700013)(14060799003)(1800799024)(13003099007)(7053199007)(7142099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	OEtxD4WY/9kU939KfRncq62nH4ae7otAwDuxg/X5BAMNvIK3CyLhAja8bUprNfzGnZOPKLRPo0YJPVC1xQJNyNEYpsEmnNB6JCvMf/JEKycSTK1hbQjO5W4U6MeFiYuLc8oBqE/2yVVjVNUWQHoqdOvHKRcn7oQm+SIcdm9lyKWPCxOKrofBWpSf8nsv3intT2mzD30Ua1pudnQ3gtoYKc0xUJNbyanGfYC7wn9tS0YvICI8Xm1gSnr6lk+E2YnhrM7lNIP0Tnwl+rCYDgHPuAh9bZBhQgDpjR75CAK0UQVs4P8KwF7ttRYCT3+RoKH3H4ySE6pUcWj/Cs7iuhhpnNy8uOTmtbFcoiJ+UEvWaaLEiGW5Qeh5jcEGqQ8t+ScelnWH3fclbii7v4osH9GMfeCZ3WpfNaR1YhLI9uNMRuQcCyaZBzQQIiMDjQGGxTee
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 09:03:18.8754
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0314a1d-d837-45c0-16a8-08de705ee422
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000A7E1.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8017

Hi Parav,

> On 20 Feb 2026, at 07:13, Parav Pandit <parav@nvidia.com> wrote:
>
>
>
>> From: Michael S. Tsirkin <mst@redhat.com>
>> Sent: 20 February 2026 05:25 AM
>>
>> On Fri, Feb 13, 2026 at 01:52:06PM +0000, Parav Pandit wrote:
>>> Hi Bill,
>>>
>>>> From: Bill Mills <bill.mills@linaro.org>
>>>> Sent: 26 January 2026 10:02 PM
>>>>
>>>> This series adds the virtio-msg transport layer.
>>>>
>>>> The individuals and organizations involved in this effort have had dif=
ficulty in
>>>> using the existing virtio-transports in various situations and desire =
to add one
>>>> more transport that performs its transport layer operations by sending=
 and
>>>> receiving messages.
>>>>
>>>> Implementations of virtio-msg will normally be done in multiple layers=
:
>>>> * common / device level
>>>> * bus level
>>>>
>>>> The common / device level defines the messages exchanged between the d=
river
>>>> and a device. This common part should lead to a common driver holding =
most
>>>> of the virtio specifics and can be shared by all virtio-msg bus implem=
entations.
>>>> The kernel implementation in [3] shows this separation. As with other =
transport
>>>> layers, virtio-msg should not require modifications to existing virtio=
 device
>>>> implementations (virtio-net, virtio-blk etc). The common / device leve=
l is the
>>>> main focus of this version of the patch series.
>>>>
>>>> The virtio-msg bus level implements the normal things a bus defines
>>>> (enumeration, dma operations, etc) but also implements the message sen=
d and
>>>> receive operations. A number of bus implementations are envisioned,
>>>> some of which will be reusable and general purpose. Other bus implemen=
tations
>>>> might be unique to a given situation, for example only used by a PCIe =
card
>>>> and its driver.
>>>>
>>>> The standard bus messages are an effort to avoid different bus impleme=
ntations
>>>> doing the same thing in different ways for no good reason. However the
>>>> different environments will require different things. Instead of tryin=
g to
>>>> anticipate all needs and provide something very abstract, we think
>>>> implementation specific messages will be needed at the bus level. Over=
 time,
>>>> if we see similar messages across multiple bus implementations, we wil=
l move to
>>>> standardize a bus level message for that.
>>>>
>>>
>>> I would review more, had first round of sparse review.
>>> Please find few comments/questions below.
>>
>> I'd like to comment that I think it makes sense to have a basic simple t=
ransport and
>> then add performance features on top as appropriate.
> Sounds good. Simple but complete is needed.

Agree.

>
>> So one way to address some of these comments is to show how
>> they can be addressed with a feature bit down the road.
>>
>>
>>> 1. device number should be 32-bit in struct virtio_msg_header.
>>>> From SIOV_R2 experiences, we learnt that some uses have use case for m=
ore than 64k devices.
>>> Also mapping PCI BDF wont be enough in 16-bits considering domain field=
.
>>>
>>> 2. msg_size of 16-bits for 64KB-8 bytes is too less for data transfer.
>>> For example, a TCP stream wants to send 64KB of data + payload, needs m=
ore than 64KB data.
>>> Needs 32-bits.
>>>
>>> 3. BUS_MSG_EVENT_DEVICE to have symmetric name as ADDED and REMOVED (in=
stead of READY)
>>> But more below.
>>>
>>> 4. I dont find the transport messages to read and write to the driver m=
emory supplied in VIRTIO_MSG_SET_VQUEUE addresses to operate
>> the virtqueues.
>>> Dont we need VIRTIO_MEM_READ, VIRTIO_MEM_WRITE request and response?
>>
>> surely this can be an optional transport feature bit.
>>
> How is this optional?

As said in a previous mail, we have messages already for that.
Please confirm if that answer your question.

> How can one implement a transport without defining the basic data transfe=
r semantics?

We did a lot of experiments and we are feature equivalent to PCI, MMIO or C=
hannel I/O.
If anything is missing, we are more than happy to discuss it and solve the =
issue.

> For example for TCP transporting, driver side OS is implementing header f=
ormat foo, and device side is using header format bar.
> How does it work?

As said, this is a use case I am expecting is working using virtqueue, not =
MMIO access and this is how virtio-net or vsock are working.
Maybe you are speaking of a use case we missed, could you elaborate ?

>
>>> Also, the queue notification message is missing at bus level.
>>> But I dont think queue notification via message good idea anyway.
>>> We rather need a more higher-level message for virtqueues.
>>> Such as posting the descriptors to device. And this should translate in=
to a VIRTIO_MSG_DESC_SEND or bus specific binding.
>>> Without this msg transport is incomplete.
>>
>> this too can be a basic method and upgrade to a different one
>> with a feature negotiation
>>
>>
>>> 5. msg_id to be renamed to msg_opcode, and token to be renamed to msg_i=
d as it identifies the msg (as written in the description) in
>>>
>>> 6. Bus requirements ordering is too strict for implementing any perform=
ant data path as data response may not be in same order as request
>> for reads.
>>
>> here too, relaxed ordering could be a feature bit.
>>
> Well the newly defined transport scheme is not even able to fit for the e=
xisting transport of PCI.
> The BAR for new transport definition can't be this low..

We think the new transport does bring features equivalent to PCI or MMIO bu=
t if we missed anything we
are more than happy to handle it.

>
> But before we go there, I would like to see the bus binding details for t=
he data transfer semantics.
> Without this simple thing is incomplete.

I tried to answer all your questions, if I missed something please tell me.

Regards
Bertrand

>
> Will wait for Bill to respond.
>
>>> 7. VIRTIO_MSG_SET_VQUEUE does not have bit field for individual address=
es.
>>> This requires caching all the values on the driver side before sending =
the transport request.
>>> I think it is time for virtio spec to shift to virt queue create and de=
stroy model using the admin queue interface.
>>> and no need to bring this VIRTIO_MSG_SET_VQUEUE legacy to new transport=
 bindings.
>>> It may require more plumbing, but it is cleaner interface when a new tr=
ansport binding is created.
>>>
>>> 8. We should have the message response header for req-resp method with =
status code.
>>> (even though they are plain MMIO writes for pci).
>>> As opposed to that, proposed messages are doing composite tasks, hence =
we need the status response.
>>>
>>> 9. virtio stack cannot handle hotplug devices today, at least Linux.
>>> So if the intention is to fit into such a system, DEVICE_BUS_STATE_REMO=
VED will not be enough.
>>> A graceful method is needed.
>>>
>>>> We are working on a few reusable bus implementations:
>>>>
>>>> * virtio-msg-ffa based on Arm FF-A interface for use between:
>>>>  * normal world and secure world
>>>>  * host and VM or VM to VM
>>>>  * Can be used w/ or with out a hypervisor
>>>>  * Any Hypervisor that implements FF-A can be used
>>>>  * We have this working with pKVM and Xen
>>>>  * We have this working with Trusty and OP-TEE
>>>>
>>>> * virtio-msg-amp for use between heterogenous systems
>>>>  * The main processors and its co-processors on an AMP SOC
>>>>  * Two or more systems connected via PCIe
>>>>  * Minimal requirements: bi-directional interrupts and
>>>>    at least one shared memory area
>>>>  * hvac-demo has 2 demos of this
>>>>  * This is working on two hardware platforms
>>>>
>>>> * virtio-msg-loopback for userspace implemented devices
>>>>  * Allows user space to provide devices to its own kernel
>>>>  * This is similar to fuse, cuse or loopback block devices but for vir=
tio
>>>>  * hvac-demo has a demo
>>>>
>>>> We also anticipate a few more:
>>>>
>>>> * virtio-msg-xen specific to Xen
>>>>  * Usable on any Xen system (including x86 where FF-A does not exist)
>>>>  * Using Xen events and page grants
>>>>
>>>> * virtio-msg over admin virtqueues
>>>>  * This allows any virtio-pci device that supports admin virtqueues to=
 also
>>>>    support a virtio-msg bus that supports sub devices
>>>>  * [We are looking for collaborators for this work]
>>>>
>>>> Changes since RFC2:
>>>>
>>>> Spec Functional:
>>>> * Made the common message header 8 bytes and added a token for optiona=
l use
>>>>  when parallel outstanding requests are possible
>>>> * Made the 8 byte fields align to 8 byte offsets.
>>>>  This effects the {SET,GET}_VQUEUE messages
>>>> * Many conformance cases have been tightened.
>>>>
>>>> Spec Editorial:
>>>> * Major restructure to better align with virtio spec
>>>>  * Conformance model now matches other transports
>>>>  * Use C structures to define messages instead of tables
>>>> * Added a section to describe how responses are matched to requests
>>>>  This includes the use of the new token field
>>>> * Redefined / better described error handling between transport and bu=
s
>>>>  layers to eliminate the need for the bus to generate fake response me=
ssages
>>>> * Included editorial feedback from RFC2
>>>>
>>>> Eco-system:
>>>> * Added virtio-msg-loopback demo
>>>> * Arm has published the first draft of the virtio-msg over FFA spec [6=
]
>>>> * virtio-msg over FFA has been demonstrated with both Trusty and OP-TE=
E
>>>>  secure world
>>>> * LKML RFC has been sent [7]
>>>> * QEMU RFC has been sent [8]
>>>>
>>>> This is the first non-RFC patch series. The known short comings have b=
een
>>>> addressed. We ask for review in earnest on this series and thank you f=
or
>>>> any feedback you can provide.
>>>>
>>>> Background info and work in progress implementations:
>>>> * HVAC project page with intro slides [1]
>>>> * HVAC demo repo w/ instructions in README.md [2]
>>>> * Kernel w/ virtio-msg common level and ffa support [3]
>>>> * QEMU w/ support for one form of virtio-msg-amp [4]
>>>> * Portable RTOS library w/ one form of virtio-msg-amp [5]
>>>>
>>>> In addition to the QEMU system based demos in the hvac-demo repo, we a=
lso have
>>>> two hardware systems running:
>>>> * AMD x86 + AMD Arm Versal connected via PCIe
>>>> * ST STM32MP157 A7 Linux using virtio-i2c provided by M4 Zephyr
>>>>
>>>> Please note that although the demos work, a few have not been aligned
>>>> with this version of the spec.
>>>>
>>>> [1]
>>>> https://linaro.atlassian.net/wiki/spaces/HVAC/overview
>>>>
>> 05%7C02%7Cparav%40nvidia.com%7Cf7f430294c37485df25808de5cf88d95%7C43083d=
15727340c1b7db39efd9ccc17a%7C0%7C0%7C6390
>>>>
>> 50419790817373%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwL=
jAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIs
>>>> IldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DJnCO8QgAIiyGAprBLkprUd8A3162wCFp=
mGic3JKoHXo%3D&reserved=3D0
>>>> [2] https://github.com/wmamills/hvac-
>>>>
>> demo&data=3D05%7C02%7Cparav%40nvidia.com%7Cf7f430294c37485df25808de5cf88=
d95%7C43083d15727340c1b7db39efd9ccc17a%7C0%7
>>>>
>> C0%7C639050419790868944%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUs=
IlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIj
>>>> oiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DXeBuS8Hr%2FDETKfSyidKK=
GoGq6OTUcOYoeSGDouUMcf4%3D&reserved=3D0
>>>> [3]
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/vireshk%252
>>>>
>> Flinux.git%2Flog%2F%3Fh%3Dvirtio%2Fmsg&data=3D05%7C02%7Cparav%40nvidia.c=
om%7Cf7f430294c37485df25808de5cf88d95%7C43083d1
>>>>
>> 5727340c1b7db39efd9ccc17a%7C0%7C0%7C639050419790913867%7CUnknown%7CTWFpb=
GZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIw
>>>>
>> LjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7=
C&sdata=3DPuLq68Y0ZNCYbfrgDZlipfm44xHZp1%2F%2
>>>> BLu%2FaKQBBB%2Fo%3D&reserved=3D0
>>>> [4] https://github.com/edgarigl/qemu/commits/edgar/virtio-
>>>> msg-
>>>>
>> rfc%2F&data=3D05%7C02%7Cparav%40nvidia.com%7Cf7f430294c37485df25808de5cf=
88d95%7C43083d15727340c1b7db39efd9ccc17a%7C0%
>>>>
>> 7C0%7C639050419790960971%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWU=
sIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFO
>>>>
>> IjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DxyowKD9KG3IasQTiYCzfCR=
GqCLSF%2Fa1g4%2F2%2ByKb1OoA%3D&reserved=3D0
>>>> [5] https://github.com/arnopo/open-amp/commits/virtio-
>>>>
>> msg%2F&data=3D05%7C02%7Cparav%40nvidia.com%7Cf7f430294c37485df25808de5cf=
88d95%7C43083d15727340c1b7db39efd9ccc17a%7C0
>>>>
>> %7C0%7C639050419791007707%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydW=
UsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkF
>>>> OIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3D69OwO2wXi0%2FEhDDSR=
2uLG2iis5RYzI%2FLnlfkcRYao9o%3D&reserved=3D0
>>>> [6] https://documentation-/
>>>>
>> service.arm.com%2Fstatic%2F68f647791134f773ab3f0a7c&data=3D05%7C02%7Cpar=
av%40nvidia.com%7Cf7f430294c37485df25808de5cf88d9
>>>>
>> 5%7C43083d15727340c1b7db39efd9ccc17a%7C0%7C0%7C639050419791052848%7CUnkn=
own%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRy
>>>>
>> dWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D=
%7C0%7C%7C%7C&sdata=3DcD5VqKnTuIFqlN2XV3j%2FHQ
>>>> Wvsz8UVe5PM0ZjMU3o0sM%3D&reserved=3D0
>>>> [7]
>>>> https://lore.kernel.org/all/cover.1753865268.git.viresh.kumar@linar
>>>>
>> o.org%2F&data=3D05%7C02%7Cparav%40nvidia.com%7Cf7f430294c37485df25808de5=
cf88d95%7C43083d15727340c1b7db39efd9ccc17a%7C
>>>>
>> 0%7C0%7C639050419791093596%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRyd=
WUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsI
>>>>
>> kFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DNmhmL%2BuyVqnpHT5r9=
EfI2uzPf9LSXLga7bUw3FO5x4w%3D&reserved=3D0
>>>> [8] https://mail.gnu.org/archive/html/qemu-devel/2025-
>>>>
>> 10%2Fmsg07438.html&data=3D05%7C02%7Cparav%40nvidia.com%7Cf7f430294c37485=
df25808de5cf88d95%7C43083d15727340c1b7db39efd
>>>>
>> 9ccc17a%7C0%7C0%7C639050419791139232%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1=
hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJ
>>>>
>> XaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DosI1FttOO=
9%2B01e%2B5EtwnYe%2Fl1%2BIvFjH%2Blyz2ipM3RM
>>>> Q%3D&reserved=3D0
>>>>
>>>> Bertrand Marquis (2):
>>>>  virtio-msg: add new command for bus normative
>>>>  virtio-msg: add conformance entries in conformance chapter
>>>>
>>>> Bill Mills (2):
>>>>  virtio-msg: Add virtio-msg, a message based virtio transport layer
>>>>  virtio-msg: link virtio-msg content
>>>>
>>>> commands.tex      |    3 +-
>>>> conformance.tex   |  105 ++-
>>>> content.tex       |    1 +
>>>> transport-msg.tex | 1640 +++++++++++++++++++++++++++++++++++++++++++++
>>>> 4 files changed, 1746 insertions(+), 3 deletions(-)
>>>> create mode 100644 transport-msg.tex
>>>>
>>>> --
>>>> 2.34.1
>>>>
>>>
>

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
