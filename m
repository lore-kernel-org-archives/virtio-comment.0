Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013066.outbound.protection.outlook.com [40.107.162.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC712C1788
	for <virtio-comment@lists.linux.dev>; Fri, 20 Feb 2026 08:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.66
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771576900; cv=fail; b=R99mE52V5rP+elJIWYaxpDSQDyEWWMkeExaYoNBAsLpUtVSODZ/i7mqI0xXfVXiLJN9q6yy4r0g9v7qt6rpIHV/FQArxYcehJSETit9ebD9Og4JWZtyOTEKl4cez2+ID+ff0ozMN96G4sETxTVSqc2z8cg9ZEstcG/R1uw8uoFk=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771576900; c=relaxed/simple;
	bh=Ne3O/B+6JeBiKDIAyUFGummZ2PM5z4MdbjEZz3kMXS4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=B73sOKZgJJwjo9X5oNpQBnrFeaS+aJawrucoHlLleN2Body4Yo9FdQmWxVN8TBM1+ISbupD66sSLvhgRIHpYRZtJ6Mv6Jez/JAXwOz+htMKVTmHyiI4PEkVVxPP/6VYT0gsJL+unxUZCgy4rWwt3gPykwlclbwOgVHqNUxqY/CM=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=jUjpR8ky; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=jUjpR8ky; arc=fail smtp.client-ip=40.107.162.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="jUjpR8ky";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="jUjpR8ky"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=j9cp3Mee5abzrxFMBRQGMVrHZoQ9V0WjAa9tni7NLMXPt5nC1I6rxHzehU+u5iP4pt7hcPSCqvTlDCzRt6AHCW4G/FbyE7o+nlF87VMOWLHBgSf1HP8hOtBAlSMmGuQqKnE0HbRNYNP8TLBWoOPZmcqgk+FDYi/d3e/yNPqdlBHZGSnGM9wKTaUEfq6VvfwypM7v1f0Y3qXktG+3BL27ylvp6bMolN1YcNx+RV3F8X09JZukZacSe1hfIt/J2mixEoxnawWTFobyfzNlbzdFYjabr/Tv5NaPTIQrv6ZTNuHko+7MN76reWjfVbXAXBNjRIm3/A2Kx9XTEiRVHUEngQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AqfoBEgL78x0Xhg7yf9Cr/bESjnCH7bnfTTvJJv7qRQ=;
 b=GP5Dbu3Tx6PJf6CGwlYhmCmLrskyu033Skja6E+DqdoZpN6fuINxDLm1ad1QVPdkw70ztLpN3bPSkprV8G2Y/9gTHU2AqVvz1GZYm2HxixolJz5+Hy1RFnquuVk7C+OO9aTwoFVhjfRxBlKT0qYmFMu3cvYO4Vulg1kJjOti7rnHKRxZo8mB84z29+7k/XgzoI5/lIjGXpSKYnQ2p0WOZAPqQCAPeX6kVKa7PV6ufOqT4W7bn55el70G5CThdTypRrG85gMdtixCIqugU1ROnpAYPBwka1qUR0hotABU6sEiMjNwXofPKJ8auFKTIGQ+rlhMUmQPiT8CPi0Ca3ObqQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=nvidia.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AqfoBEgL78x0Xhg7yf9Cr/bESjnCH7bnfTTvJJv7qRQ=;
 b=jUjpR8ky1Rf6gR5J76YsjGYLQ8xNGEy+zuYUeVrufm7hx1m0Tw+f9R9oruw2zBFhOm9G3ByeuiA6bBHt/PTWLnDGRE9gOO9JlGs0/ak63Z/mXXaQ4bQ+QvOnqtPkIqM+HlNqVvCLlD9dK1J7brlcT4XZGy9SNh1sBbwVg8Bj91M=
Received: from DUZPR01CA0326.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::25) by AS2PR08MB8622.eurprd08.prod.outlook.com
 (2603:10a6:20b:55d::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Fri, 20 Feb
 2026 08:41:34 +0000
Received: from DU2PEPF00028D02.eurprd03.prod.outlook.com
 (2603:10a6:10:4ba:cafe::c1) by DUZPR01CA0326.outlook.office365.com
 (2603:10a6:10:4ba::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.16 via Frontend Transport; Fri,
 20 Feb 2026 08:41:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D02.mail.protection.outlook.com (10.167.242.186) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.12
 via Frontend Transport; Fri, 20 Feb 2026 08:41:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=unV27hjM/PDmEc3srbqA0IJlA6gkKsCDX9SLqAxcxOqNs93Yo/PIf2qALstMCqtUg0LDPm3Gp8vMAU52wouWj8TpCaTIv8n1a/T2XpYCusngMTykw2u4wl0zCiothIeoIVhk0R1f7skiq6NnAYJDftQiawqB++i/QbG6GA5migJUr8uuDKG8ckR7KyEs/QrX5H0xgMfhkajwhGWk5XJjnlt2vYK3AbEIe8NGz8zZ5RLkBWsnILjeFbR7vhyLf2I/WnTutM+MEZOkN1tiP4GPTKFTZ1rMsjSF4oI6VU/SD4n179lNh1CWO7cCA6UgcPz3aLvmkIwnPdZnmlaiKR5vUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AqfoBEgL78x0Xhg7yf9Cr/bESjnCH7bnfTTvJJv7qRQ=;
 b=BZ4bsZjyL+iElvLEjIzAb14f9nkJxh12yUJt7BT8AyobPMoYM/8M5Z/Cq4xD5rqOUjBt2I5JlgsTXnlKc0UyrZ6WJJd16Ey5IjsHiNDBUcex5u3Hws397kAtkWZhVVVU/IvVNSxsibQhP57ITMf90+xd2YlEFl3WDDe/seheAAoFouiia0OcTdN834oSmjWQBduGFKWxoQOVCGipGIpIbmPmMcJehqT7a9sIzgamCNL66P89KuWzd9IpT/Lo+gogA5CnoFy36Cdms0HIqD95xWJr+eSOmXV4XktR2KLpeSp0JmC9Czmarm1ZUkyX9P9+3osJgdUUgBuQ9949SIb8+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AqfoBEgL78x0Xhg7yf9Cr/bESjnCH7bnfTTvJJv7qRQ=;
 b=jUjpR8ky1Rf6gR5J76YsjGYLQ8xNGEy+zuYUeVrufm7hx1m0Tw+f9R9oruw2zBFhOm9G3ByeuiA6bBHt/PTWLnDGRE9gOO9JlGs0/ak63Z/mXXaQ4bQ+QvOnqtPkIqM+HlNqVvCLlD9dK1J7brlcT4XZGy9SNh1sBbwVg8Bj91M=
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by AS8PR08MB8490.eurprd08.prod.outlook.com (2603:10a6:20b:567::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Fri, 20 Feb
 2026 08:40:28 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%4]) with mapi id 15.20.9632.015; Fri, 20 Feb 2026
 08:40:28 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Parav Pandit <parav@nvidia.com>
CC: "Bill Mills (bill.mills@linaro.org)" <bill.mills@linaro.org>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>, "Edgar E .
 Iglesias" <edgar.iglesias@amd.com>, Arnaud Pouliquen
	<arnaud.pouliquen@foss.st.com>, Viresh Kumar <viresh.kumar@linaro.org>, Alex
 Bennee <alex.bennee@linaro.org>, Armelle Laine <armellel@google.com>
Subject: Re: [PATCH v1 0/4] virtio-msg transport layer
Thread-Topic: [PATCH v1 0/4] virtio-msg transport layer
Thread-Index: AQHcjuFkYi+cgIzLc0OakdFLCJk7FbWAwh4AgAqpM4A=
Date: Fri, 20 Feb 2026 08:40:28 +0000
Message-ID: <478DE38A-8581-4113-9467-227DA3E0D134@arm.com>
References: <20260126163230.1122685-1-bill.mills@linaro.org>
 <SJ0PR12MB680610C1B53CA4E8B4470411DC61A@SJ0PR12MB6806.namprd12.prod.outlook.com>
In-Reply-To:
 <SJ0PR12MB680610C1B53CA4E8B4470411DC61A@SJ0PR12MB6806.namprd12.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.300.41.1.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|AS8PR08MB8490:EE_|DU2PEPF00028D02:EE_|AS2PR08MB8622:EE_
X-MS-Office365-Filtering-Correlation-Id: 71df3541-2977-4d2b-954f-08de705bda83
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021|7142099003;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?EtqGxtMmy60BoYZ1d9bmgKaq4p/cGvIgzj7bRJvNRD5JL2FbnSXXtTuAW3QD?=
 =?us-ascii?Q?Qy/FeMixZUAtbMwD41APIkKL15nDVSthRisHCt9sk9i0EzR2FBz23Y5oov8/?=
 =?us-ascii?Q?2RTzwrtrz+eM2NJ5qxiUP0WT9ITIF8ivaCUP5aeI591xGC6JT+buqbvJzK+K?=
 =?us-ascii?Q?WBAS8PW6+AH/BZrlCue0RPePtrP25zUVcd8RgM2DzNJZfbRhyUS2LRgoM4/5?=
 =?us-ascii?Q?AX2ClP5KLgIat8z1CqCn1AHKmhIws9V6O3eJCSABrmC9P0GUkBbHfgMeuVM4?=
 =?us-ascii?Q?75iBCM9m/yN8q7PAeBKpXVnF6ljq84ti60Z9Tz7pzo3YzMoILKNK1OnoIgda?=
 =?us-ascii?Q?QGCs2/sg2Nv3ZWm1HxSqsiC14JA0C0apuRW/YNu9I2dYvShTov0jgwb97pAG?=
 =?us-ascii?Q?VrwMPLGOkjGH6/69I8uaxWK6g9wJQ6x+RiKIPxhDzdFjCq/YZmk0L2ZOzQ+O?=
 =?us-ascii?Q?dKKnPA4GZeOdyuSvg9jzXZBQ0bJc4ya+nLKEFGbIDHHh6Qo6MXDMoH5LxTwy?=
 =?us-ascii?Q?GSDboK60dM/527ss7kdLbCMVEKWNBNDplRHGUlFdJqdMxC2/A+0wIRfo7DZ2?=
 =?us-ascii?Q?qfaXWvfAw043mOKGbHGHojOtOhCAp+W4dLQRKUk9OWTkHUikTBUAQGrbIW11?=
 =?us-ascii?Q?j2NnTYTbsGi4uW9TUshkbJjbfv7GeeRQ2uWhK2aV0hmuaJS+ko8V++zGGi27?=
 =?us-ascii?Q?PluhCYwDc4AXZVHt7aDzTQRjLqu+wl/+6Idh+q7+YDDb1zGoMgJvX3qlc+HJ?=
 =?us-ascii?Q?JjIXkMZSqbtKSk9fdYhy4RyUx58FHp0zucA8m6lseVqNWqrXA9dK4ihhGs12?=
 =?us-ascii?Q?Qy5+BpK19YjtZ543uyQjjDRMKb9IUIDExnTOgYb8M2GNm/mkthvpLpAbMoNj?=
 =?us-ascii?Q?EtGadGEMkAwXtsJfcTn0h1LVTvniO9kqQ4R7fnNzsHlrbDve/+pafAU3qGw5?=
 =?us-ascii?Q?KdehZJCipgsxcbV8w/SZsNg+KktPO08Wxi/tvvwiNGajusMNfU1yLKhsHKlZ?=
 =?us-ascii?Q?ix5PnVdgwa7rOUd05U406KXyi0Fwh3bEoO1xKEg6OdoyVixUdaW0Lce9vP1I?=
 =?us-ascii?Q?U4FbQe+rbYctsZIarFnzoLLOH+wg4F9FAaoW0N4/Y9NEDZdgBUbU4GBFLxxT?=
 =?us-ascii?Q?9qE5o3eS0iu8GnbkbeGIFTSkmLqGsZ9PUQxTNCDEp2jy/RRv2GgiWlmnhEgi?=
 =?us-ascii?Q?fsFfb/NQBTx2SLJmAHkyIQKeisZZXB6J4vFJaCbGsu5S4KBiebt3CkfBrVp+?=
 =?us-ascii?Q?H31uQ+T6P1XTNgBEKOx3mjzfFeLAYm4D3fBJSnXklDOQnYUxlvETNX4sEJhp?=
 =?us-ascii?Q?B7Y4c1N2YJ3pXAQpkbXdIqcPkP0p6LHKuPFGl1fuEQ3K8pi/5wMJucdPuxD+?=
 =?us-ascii?Q?C6jy3lfDtkr5Pyx4YOV1pc4EyM+Iot35hMI/1qmFvTGraEZbB4cHOqw/hEtC?=
 =?us-ascii?Q?A7hUBZXNwniLW6ijiwqBSRjImvrYzTMjSJ78l2MdMbsWAciiIe/mNVCHJNV7?=
 =?us-ascii?Q?Tigtew79Zvb3K9mbV4lY6N5NA6ta/iqJU27PRbc3u+/PUahcywJAS+JQpuyP?=
 =?us-ascii?Q?6FHjL2IsJCPN+bQZMHb4W05Y+0tZq/E/YViahMNU?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(7142099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <6F72A0369D519046AA358D399B4A0D4B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8490
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D02.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e26bbfc2-9fac-497d-4436-08de705bb34a
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|1800799024|35042699022|82310400026|36860700013|376014|7142099003|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fYn+h0krp3y0rjNaOfaHMl/tGavU8yNb2R/z9E+pHVTBNCLQW4Zga1/M7+JF?=
 =?us-ascii?Q?PIH5GkacGRyNIktQm1+Khk51Ckqwg5Tu3jSMRB/OP3gbp0x98iAV4lM0SvMk?=
 =?us-ascii?Q?TqhaLsrg6sRResDcVzyz9scpDCTwQok/v4TN0YYtfqW/dYSMuaT7qV0VCWdV?=
 =?us-ascii?Q?v+2CiiqCcYnInuUyNW7N00TOPXYmhrT9UH99StvgsvtMww5ul5tOo95/2GeA?=
 =?us-ascii?Q?7X05+7YVBSc0vZyPae83aNlEpbCK7CyW3oZO+aEmqt9n7Bkw2I5hbzrniV4T?=
 =?us-ascii?Q?vBPgWN/zfTZB31hsPJ4A1lrgiiWGpXu/koqxfjhBz806P4ZDiO6mg/F0TOT1?=
 =?us-ascii?Q?hIUtBGnTAyx0ZcTJGVNugn8O1IU9T0p5z4Gxb7v4r2zMEWCp+8dZP8VjasBz?=
 =?us-ascii?Q?JIkl9h/QsD1u/d5kfGDy0YsdimIKOOiAT2bjwj9RnVDQV2BN2TCNb7RVPa2U?=
 =?us-ascii?Q?mmakOnEe2YRnGHX0gxYT4dXDvQGMRIIfiK7U4Fjzy6hte2KhZMP1l4uHImHY?=
 =?us-ascii?Q?3kc9oFpqWRDS0T3ytbNgumTKFmCUZtpywnHMUinlmjXNcO9WySStcx5Bm7Lv?=
 =?us-ascii?Q?5ApxUn1Mm+f84gzqpLqe5oP2Ew05nDjkKYcWeeqgEfI33BC9KWBogtD4VaYt?=
 =?us-ascii?Q?x9OahcEeTdi2DCXsxfbHzW4v9ym8SD3fQgtnm0UoWIyJy+Wp7ZljlyM0IhBZ?=
 =?us-ascii?Q?8lakfhlbWlqo+sIeVOOZYSl6zSU5Av7tybvLgLK1C+tamtcELGV5YwR0o3E+?=
 =?us-ascii?Q?d3l/ashJQPAeOmFEG4hd2f147S7U+I5RK/5aNG0p3W3fhn/EKelaUOZRHmcp?=
 =?us-ascii?Q?U4sNxp2hcJU4tAwgHoIeKbOtLGDWDG3FcmHoSuoyQBPnoe8aXdSdPFsHrvUU?=
 =?us-ascii?Q?AgGrk1SdIdCaSEj7Vuf0q9XDlsxWeXiLqGhvvY5XqD0egN5DV1gZ4yvL6xJS?=
 =?us-ascii?Q?ruQhKCU3vPCLojVVEJyBUxKJcRDQLoG3wRgedkDAcrBUDE0/mPeQI2wS39mX?=
 =?us-ascii?Q?UD0qksUEhuzvIBJ/ipSpRTpJo7iHDy3qbTSuKp92uUNhq95kOrFhHJ6JfWaG?=
 =?us-ascii?Q?bYgq8IV2k9Ih7gs6mtGqCFS1K9oOlo/hLzqrgcPhsdXEzOiY1bHhARb6kCYh?=
 =?us-ascii?Q?J7MNK7HSDffUnDFDfZKW6jQ86oyz5khyNoLjI/Rel0Dv/kr8m5WhoE6F9vDR?=
 =?us-ascii?Q?D5/wRbqWest+GDtgcjtI9f7RzrM4HF50zbSbSZVU3x4dG9+NheODXDOmN0po?=
 =?us-ascii?Q?HSItyq99IrSVXRbuz35N1tbNRqEM7tzlA18GDt9lE8U38hL3exXtpoybJJ7y?=
 =?us-ascii?Q?TO8jDlpW5qJenEbz1/SPNkFMsLw60+OmPUwcpF4xfim54u1Rug+DUKvGCr/p?=
 =?us-ascii?Q?jkbGt5ga/g6OOnq3eae6Gk0clyboU7FEoalbhDl8AV6lynE5fNEE5HMAtyx1?=
 =?us-ascii?Q?WJFgWIgzoRG+Ckqy0vtcX5oHi7jv1AWWukbpck80hy3qMGP8mYUSAVde6N5v?=
 =?us-ascii?Q?0sXO9umc4bcHOtRp2+ZpNYiAgB+oiK4mSn7B2UGYiUDbn6zmETBMn3LKzZ1l?=
 =?us-ascii?Q?J+wAcL1QuXz2EJY+VRdImNJF+8U2uadEffMFmjTs4OCc/gnREDc6wyi/d0xc?=
 =?us-ascii?Q?Pl4bj71kus2H0u7+BMryYbE=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(1800799024)(35042699022)(82310400026)(36860700013)(376014)(7142099003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	7FIe2xs/ZG7pnspTWVuQyKEu+gp9QIIgoWo0oaRn0N0jD2e8OgBp9xpUYTX8TCsYIaBr9XF1gNOaQPGGmrRjRHCJX+sCqo5GdWaHkM3TNHBsGS9vhXURhw2ZIO2BOQAPox2zpDgasVi9ctPEitT62FpuB5v2SefJ/PBOtypNzGytndvSmziURsF5p9zTLxZc0fSVoXhP/vliDwqE7j42/eDC0mhWRNdNG0wAI9PqcGw+h4rgmnVU28/SNRc1tJ1x2jtjgscaV3tqoJsFpFWD6EG16dN082uumnaq20/shIKGVAG+u85JQQ9r5rlraRIbqQVnBkCvdUWLh3GuWHIllN8hjoefNP7Luk8uTbu+vbUWke56M80eBmUUvc1KbZ5a5ygjShxCTJ1883mxZb1lHUqeKoGm0b6uMEvvrHYAsBOm49mXWjJLJiSuEoH/JWHV
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 08:41:34.2506
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 71df3541-2977-4d2b-954f-08de705bda83
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D02.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8622

Hi Parav,

> On 13 Feb 2026, at 14:52, Parav Pandit <parav@nvidia.com> wrote:
>
> Hi Bill,
>
>> From: Bill Mills <bill.mills@linaro.org>
>> Sent: 26 January 2026 10:02 PM
>>
>> This series adds the virtio-msg transport layer.
>>
>> The individuals and organizations involved in this effort have had diffi=
culty in
>> using the existing virtio-transports in various situations and desire to=
 add one
>> more transport that performs its transport layer operations by sending a=
nd
>> receiving messages.
>>
>> Implementations of virtio-msg will normally be done in multiple layers:
>> * common / device level
>> * bus level
>>
>> The common / device level defines the messages exchanged between the dri=
ver
>> and a device. This common part should lead to a common driver holding mo=
st
>> of the virtio specifics and can be shared by all virtio-msg bus implemen=
tations.
>> The kernel implementation in [3] shows this separation. As with other tr=
ansport
>> layers, virtio-msg should not require modifications to existing virtio d=
evice
>> implementations (virtio-net, virtio-blk etc). The common / device level =
is the
>> main focus of this version of the patch series.
>>
>> The virtio-msg bus level implements the normal things a bus defines
>> (enumeration, dma operations, etc) but also implements the message send =
and
>> receive operations. A number of bus implementations are envisioned,
>> some of which will be reusable and general purpose. Other bus implementa=
tions
>> might be unique to a given situation, for example only used by a PCIe ca=
rd
>> and its driver.
>>
>> The standard bus messages are an effort to avoid different bus implement=
ations
>> doing the same thing in different ways for no good reason. However the
>> different environments will require different things. Instead of trying =
to
>> anticipate all needs and provide something very abstract, we think
>> implementation specific messages will be needed at the bus level. Over t=
ime,
>> if we see similar messages across multiple bus implementations, we will =
move to
>> standardize a bus level message for that.
>>
>
> I would review more, had first round of sparse review.
> Please find few comments/questions below.
>
> 1. device number should be 32-bit in struct virtio_msg_header.
> From SIOV_R2 experiences, we learnt that some uses have use case for more=
 than 64k devices.
> Also mapping PCI BDF wont be enough in 16-bits considering domain field.

That is a very interesting feedback, we will definitely take this into acco=
unt.
We will have to decide how big and I will answer that in Demi's mail as the=
re might be some drawbacks with
having very big sizes for the device ID.

In any case this point was raised by you, Peter and Demi and we will defini=
tely handle it in v2.

>
> 2. msg_size of 16-bits for 64KB-8 bytes is too less for data transfer.
> For example, a TCP stream wants to send 64KB of data + payload, needs mor=
e than 64KB data.
> Needs 32-bits.

The point of the transport is not to transfer data, this should be done usi=
ng virtqueues.
Transport is only there to allow access to registers, features and configur=
ation, the main transfers are to
be done using virtqueues and i would not expect a network driver to use MMI=
O registers to write network
packet payloads but to use virtqueues for that (as vsock or net is doing).

So the msg_size here is just to fit transport specific requests.

>
> 3. BUS_MSG_EVENT_DEVICE to have symmetric name as ADDED and REMOVED (inst=
ead of READY)
> But more below.

Good point, we will check that to make this coherent with other transports.

>
> 4. I dont find the transport messages to read and write to the driver mem=
ory supplied in VIRTIO_MSG_SET_VQUEUE addresses to operate the virtqueues.
> Dont we need VIRTIO_MEM_READ, VIRTIO_MEM_WRITE request and response?

Equivalent of virtio_mem_read/write is provided by GET/SET CONFIG which all=
ows you to access the configuration area.
So those are the equivalent of mem_read/write.
Does that answer your question ?

> Also, the queue notification message is missing at bus level.

Queue notifications are provided by event_avail and event_used messages.

> But I dont think queue notification via message good idea anyway.

As said in the spec, a bus can handle this using MSI or interrupts and gene=
rate the messages in the interface
between the bus and the transport. It is not an hard requirement to have th=
ose done using messages transfered and
the bus can do what it wants, but it must inform the transport using a mess=
age.

> We rather need a more higher-level message for virtqueues.
> Such as posting the descriptors to device. And this should translate into=
 a VIRTIO_MSG_DESC_SEND or bus specific binding.
> Without this msg transport is incomplete.

I am not completely understanding what you mean here, are your concerns cov=
ered by the event messages ?

>
> 5. msg_id to be renamed to msg_opcode, and token to be renamed to msg_id =
as it identifies the msg (as written in the description) in

We went back and forth on the naming, msg_id could be misunderstood as mess=
age opcode.
I guess we will have to find the best consensus here.

>
> 6. Bus requirements ordering is too strict for implementing any performan=
t data path as data response may not be in same order as request for reads.

This was pointed out in an other mail and i agree here.
I will investigate how we could make this a feature bit which i think could=
 be a good solution.

>
> 7. VIRTIO_MSG_SET_VQUEUE does not have bit field for individual addresses=
.

Set vqueue has an index to specify the virtqueue index but you have to spec=
ific all fields in one go that is true.
Do you need a solution where you could set some fields to a specific value =
to say "keep current" and only update part of the vqueue configuration ?

> This requires caching all the values on the driver side before sending th=
e transport request.
> I think it is time for virtio spec to shift to virt queue create and dest=
roy model using the admin queue interface.
> and no need to bring this VIRTIO_MSG_SET_VQUEUE legacy to new transport b=
indings.
> It may require more plumbing, but it is cleaner interface when a new tran=
sport binding is created.

Admin queue useable with the message transport but I would be interested to=
 understand exactly
the model you are referring to with create/destroy model.
Could you elaborate a bit so that i could understand what messages you woul=
d expect and how this would work ?

>
> 8. We should have the message response header for req-resp method with st=
atus code.
> (even though they are plain MMIO writes for pci).
> As opposed to that, proposed messages are doing composite tasks, hence we=
 need the status response.

You want an error code in the header, is that what you mean ?
We went into this discussion while designing this, the main issue is that m=
ost drivers could not handle an
error as this is something not possible in MMIO or PCI so we decided instea=
d to say that in case of error
a valid answer must be generated (all 0 when doing get_config for example).

>
> 9. virtio stack cannot handle hotplug devices today, at least Linux.
> So if the intention is to fit into such a system, DEVICE_BUS_STATE_REMOVE=
D will not be enough.
> A graceful method is needed.

Hotplug could be handled, remove is more problematic in Linux (you could de=
clare a new device instance
at any time and this should work).

Could you give more details on what a graceful method would need ?

Regards
Bertrand

>
>> We are working on a few reusable bus implementations:
>>
>> * virtio-msg-ffa based on Arm FF-A interface for use between:
>>  * normal world and secure world
>>  * host and VM or VM to VM
>>  * Can be used w/ or with out a hypervisor
>>  * Any Hypervisor that implements FF-A can be used
>>  * We have this working with pKVM and Xen
>>  * We have this working with Trusty and OP-TEE
>>
>> * virtio-msg-amp for use between heterogenous systems
>>  * The main processors and its co-processors on an AMP SOC
>>  * Two or more systems connected via PCIe
>>  * Minimal requirements: bi-directional interrupts and
>>    at least one shared memory area
>>  * hvac-demo has 2 demos of this
>>  * This is working on two hardware platforms
>>
>> * virtio-msg-loopback for userspace implemented devices
>>  * Allows user space to provide devices to its own kernel
>>  * This is similar to fuse, cuse or loopback block devices but for virti=
o
>>  * hvac-demo has a demo
>>
>> We also anticipate a few more:
>>
>> * virtio-msg-xen specific to Xen
>>  * Usable on any Xen system (including x86 where FF-A does not exist)
>>  * Using Xen events and page grants
>>
>> * virtio-msg over admin virtqueues
>>  * This allows any virtio-pci device that supports admin virtqueues to a=
lso
>>    support a virtio-msg bus that supports sub devices
>>  * [We are looking for collaborators for this work]
>>
>> Changes since RFC2:
>>
>> Spec Functional:
>> * Made the common message header 8 bytes and added a token for optional =
use
>>  when parallel outstanding requests are possible
>> * Made the 8 byte fields align to 8 byte offsets.
>>  This effects the {SET,GET}_VQUEUE messages
>> * Many conformance cases have been tightened.
>>
>> Spec Editorial:
>> * Major restructure to better align with virtio spec
>>  * Conformance model now matches other transports
>>  * Use C structures to define messages instead of tables
>> * Added a section to describe how responses are matched to requests
>>  This includes the use of the new token field
>> * Redefined / better described error handling between transport and bus
>>  layers to eliminate the need for the bus to generate fake response mess=
ages
>> * Included editorial feedback from RFC2
>>
>> Eco-system:
>> * Added virtio-msg-loopback demo
>> * Arm has published the first draft of the virtio-msg over FFA spec [6]
>> * virtio-msg over FFA has been demonstrated with both Trusty and OP-TEE
>>  secure world
>> * LKML RFC has been sent [7]
>> * QEMU RFC has been sent [8]
>>
>> This is the first non-RFC patch series. The known short comings have bee=
n
>> addressed. We ask for review in earnest on this series and thank you for
>> any feedback you can provide.
>>
>> Background info and work in progress implementations:
>> * HVAC project page with intro slides [1]
>> * HVAC demo repo w/ instructions in README.md [2]
>> * Kernel w/ virtio-msg common level and ffa support [3]
>> * QEMU w/ support for one form of virtio-msg-amp [4]
>> * Portable RTOS library w/ one form of virtio-msg-amp [5]
>>
>> In addition to the QEMU system based demos in the hvac-demo repo, we als=
o have
>> two hardware systems running:
>> * AMD x86 + AMD Arm Versal connected via PCIe
>> * ST STM32MP157 A7 Linux using virtio-i2c provided by M4 Zephyr
>>
>> Please note that although the demos work, a few have not been aligned
>> with this version of the spec.
>>
>> [1]
>> https://linaro.atlassian.net/wiki/spaces/HVAC/overview
>> 05%7C02%7Cparav%40nvidia.com%7Cf7f430294c37485df25808de5cf88d95%7C43083d=
15727340c1b7db39efd9ccc17a%7C0%7C0%7C6390
>> 50419790817373%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwL=
jAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIs
>> IldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DJnCO8QgAIiyGAprBLkprUd8A3162wCFpmG=
ic3JKoHXo%3D&reserved=3D0
>> [2] https://github.com/wmamills/hvac-
>> demo&data=3D05%7C02%7Cparav%40nvidia.com%7Cf7f430294c37485df25808de5cf88=
d95%7C43083d15727340c1b7db39efd9ccc17a%7C0%7
>> C0%7C639050419790868944%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUs=
IlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIj
>> oiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DXeBuS8Hr%2FDETKfSyidKKGo=
Gq6OTUcOYoeSGDouUMcf4%3D&reserved=3D0
>> [3]
>> https://git.kernel.org/pub/scm/linux/kernel/git/vireshk%252
>> Flinux.git%2Flog%2F%3Fh%3Dvirtio%2Fmsg&data=3D05%7C02%7Cparav%40nvidia.c=
om%7Cf7f430294c37485df25808de5cf88d95%7C43083d1
>> 5727340c1b7db39efd9ccc17a%7C0%7C0%7C639050419790913867%7CUnknown%7CTWFpb=
GZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIw
>> LjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7=
C&sdata=3DPuLq68Y0ZNCYbfrgDZlipfm44xHZp1%2F%2
>> BLu%2FaKQBBB%2Fo%3D&reserved=3D0
>> [4] https://github.com/edgarigl/qemu/commits/edgar/virtio-
>> msg-
>> rfc%2F&data=3D05%7C02%7Cparav%40nvidia.com%7Cf7f430294c37485df25808de5cf=
88d95%7C43083d15727340c1b7db39efd9ccc17a%7C0%
>> 7C0%7C639050419790960971%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWU=
sIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFO
>> IjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DxyowKD9KG3IasQTiYCzfCR=
GqCLSF%2Fa1g4%2F2%2ByKb1OoA%3D&reserved=3D0
>> [5] https://github.com/arnopo/open-amp/commits/virtio-
>> msg%2F&data=3D05%7C02%7Cparav%40nvidia.com%7Cf7f430294c37485df25808de5cf=
88d95%7C43083d15727340c1b7db39efd9ccc17a%7C0
>> %7C0%7C639050419791007707%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydW=
UsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkF
>> OIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3D69OwO2wXi0%2FEhDDSR2u=
LG2iis5RYzI%2FLnlfkcRYao9o%3D&reserved=3D0
>> [6] https://documentation-/
>> service.arm.com%2Fstatic%2F68f647791134f773ab3f0a7c&data=3D05%7C02%7Cpar=
av%40nvidia.com%7Cf7f430294c37485df25808de5cf88d9
>> 5%7C43083d15727340c1b7db39efd9ccc17a%7C0%7C0%7C639050419791052848%7CUnkn=
own%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRy
>> dWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D=
%7C0%7C%7C%7C&sdata=3DcD5VqKnTuIFqlN2XV3j%2FHQ
>> Wvsz8UVe5PM0ZjMU3o0sM%3D&reserved=3D0
>> [7]
>> https://lore.kernel.org/all/cover.1753865268.git.viresh.kumar@linar
>> o.org%2F&data=3D05%7C02%7Cparav%40nvidia.com%7Cf7f430294c37485df25808de5=
cf88d95%7C43083d15727340c1b7db39efd9ccc17a%7C
>> 0%7C0%7C639050419791093596%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRyd=
WUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsI
>> kFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DNmhmL%2BuyVqnpHT5r9=
EfI2uzPf9LSXLga7bUw3FO5x4w%3D&reserved=3D0
>> [8] https://mail.gnu.org/archive/html/qemu-devel/2025-
>> 10%2Fmsg07438.html&data=3D05%7C02%7Cparav%40nvidia.com%7Cf7f430294c37485=
df25808de5cf88d95%7C43083d15727340c1b7db39efd
>> 9ccc17a%7C0%7C0%7C639050419791139232%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1=
hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJ
>> XaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DosI1FttOO=
9%2B01e%2B5EtwnYe%2Fl1%2BIvFjH%2Blyz2ipM3RM
>> Q%3D&reserved=3D0
>>
>> Bertrand Marquis (2):
>>  virtio-msg: add new command for bus normative
>>  virtio-msg: add conformance entries in conformance chapter
>>
>> Bill Mills (2):
>>  virtio-msg: Add virtio-msg, a message based virtio transport layer
>>  virtio-msg: link virtio-msg content
>>
>> commands.tex      |    3 +-
>> conformance.tex   |  105 ++-
>> content.tex       |    1 +
>> transport-msg.tex | 1640 +++++++++++++++++++++++++++++++++++++++++++++
>> 4 files changed, 1746 insertions(+), 3 deletions(-)
>> create mode 100644 transport-msg.tex
>>
>> --
>> 2.34.1
>>
>

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
