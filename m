Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013047.outbound.protection.outlook.com [52.101.72.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FFE436C597
	for <virtio-comment@lists.linux.dev>; Wed,  4 Feb 2026 08:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.47
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770194074; cv=fail; b=sVhBUJ3XxJFGr5zCEAB1I40DHHdEBC/Y/4wA4tcNLRSbu7jd7mmPbKbB+oZKJq7ZF4ZU9hwI7FTlDHQmgZSOv0hOwYs3Z2AY0Ybj7h/H1vnVBojo3ntVp0htCwtkZVwU+7ICPLnw3uIgy/20+R5s4PYXXpjjFibTPomFPThF2Tc=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770194074; c=relaxed/simple;
	bh=Wqpu5EGZwLGJFT+Wy9b9TOVp32V+w6dtryqwxx+//04=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=eecUKAKSL+Tht33g4CuiY7KCPlJ6FMK7XFB+gqTt1UlOzCcd14DnhJQ011+Isae011ja/XhbWqW1imant/96AR9LaTdXZf1oOUu2NsGJhbVALhiAUbqaZnbNzm88l7AxoTynqFixEbeQ57MxwkQ2bZB1UaQPtAHGpHvSqZp6P1c=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=hq7N3FRu; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=hq7N3FRu; arc=fail smtp.client-ip=52.101.72.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="hq7N3FRu";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="hq7N3FRu"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=VCpyPaQCanrlZ93tQRqzM78XrulHs6IMYOZ5ZipS7b7SfyK/sClLWrGQ6SMRzccY70/h1ruEGb5zel7qd6fXE6W0ttluWhsHot//fxNBgD4F9IdShjdShR92OXUPpkp+mAw4QHVFa5pAluBHP1x9e0L/6ZHXy5zhkTvhKcdJ59QrgwTZijGjPx3A5LoE446GiVKtoB5pciiqePScENOxb3STey5G3E8pLxdA9O/frcWBaMdZW4Yt5rI/g4pvdE1gA5o7UjerAG9j0FLNFCtiuqgO77FLORSKXQ78JJe4cHFe6OPxAd2xHFprF3Vru/EiPmXnzqzjLzBLkgBz3tFWfA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wqpu5EGZwLGJFT+Wy9b9TOVp32V+w6dtryqwxx+//04=;
 b=ZjgeSQtJ1zprkAzCMjqCGK+vRe/A2mm5ny+Hc25h/ouMo7cvesFTERMBc6OXde6eBC2TEtjxZHG26hKxdFEZPQfjCf5cPAl2X0ddq9Z3xSgK2L37O2TNAWbsJ+hMuK2+muX/wpWqlTR7y5yB7hKjISRwP6AJOmAiXTWDe4q1zr6jzllWfgLfhHxRZ3TI/6NSHHXhBxCxlUSor6ewJTb2jlNRerDjtLtn/oscjNvp51ShczxOYf22MalIwyLsm3PLfG0X6k0xh50tCtXVyPYxXkFarQC/bsOyabsoD90F/l3pejOOB+pVe1OW/W7YVwvur/owYFr1PiLrGgpWsFVkRw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=redhat.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wqpu5EGZwLGJFT+Wy9b9TOVp32V+w6dtryqwxx+//04=;
 b=hq7N3FRuugdz4PAfiVuT0Q5bK8txYo1lD75K5K6FOZNKwcB4RrGTFu9sinHl/xZVlec8bUT6bKdLHcd5VpYIKdYwcg1sGuuAUO4l89Mki0VRyXulEnBWB61XjDNDKFWotqhPriIciiBG4Gj8wHbIGfnwSkJNMqxYzZR+G3xHJHo=
Received: from DUZPR01CA0100.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bb::8) by PR3PR08MB5740.eurprd08.prod.outlook.com
 (2603:10a6:102:87::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Wed, 4 Feb
 2026 08:34:28 +0000
Received: from DU6PEPF0000952A.eurprd02.prod.outlook.com
 (2603:10a6:10:4bb:cafe::3e) by DUZPR01CA0100.outlook.office365.com
 (2603:10a6:10:4bb::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.12 via Frontend Transport; Wed,
 4 Feb 2026 08:34:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000952A.mail.protection.outlook.com (10.167.8.11) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.10 via
 Frontend Transport; Wed, 4 Feb 2026 08:34:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p1pEpmnb2JgBe5tyZVMRj/Zkhgy+4yHV2zbnJ8W5uCumS4LVfwuJOtKOOrqRXnY3ymTP3KXJF26CFMqHRjd9vgtj3hwq4Lq09ntBJoXooxFZAHb9eJWYqxJL4mLVRlibZYkcSM4DKMNyBqeIJBQrIc4f8wMa5ZKLtTSFNxcYWxD8QHJCrMLCApb9uUs/xNgkEbvZQvMmdmGDaK62TctvePsxj4NINVeiVsQWgoq1PbLIrLKt28Yd5cJZKY/WrY0V/6LreP2IJ/+iCwmdTZBf02OyS+cMcEA84yw4g7H+nC/MHczz/n+KfoDrZRhXTqWHiuFXBLHGRXp1dXh2SX3trw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wqpu5EGZwLGJFT+Wy9b9TOVp32V+w6dtryqwxx+//04=;
 b=cyln0W7S2eVaSNtmJ6dLziE4feOD8LUjkH4YlN0mHF8zJGimJlu3dRimBmcbss8nHPc60lx1+XZzajBktrf8aSjY9p/mVDzPyArUu/vdSqzMnLfqavyeCuc3Pt6rtVKRozHYoi0PBD7vqgEO7gz3PvGnoq48kDWRJmq0pxsg5vwBFzvRoyOjKbA45/tQRHPPUkbC0nt6Qf3HOCOgApCZKqHgH1cA7drhd4Jovjnz9GNkzFLYm8GtqjSUYOJ6nffAwnlLaYL/EjnU2blZ1H9/JDesUKbEBZfGeVVDNHl0qhCyDmtsXL8UJfNFb3wGLOc50vX/llxEDWwAQK1AYfudQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wqpu5EGZwLGJFT+Wy9b9TOVp32V+w6dtryqwxx+//04=;
 b=hq7N3FRuugdz4PAfiVuT0Q5bK8txYo1lD75K5K6FOZNKwcB4RrGTFu9sinHl/xZVlec8bUT6bKdLHcd5VpYIKdYwcg1sGuuAUO4l89Mki0VRyXulEnBWB61XjDNDKFWotqhPriIciiBG4Gj8wHbIGfnwSkJNMqxYzZR+G3xHJHo=
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by DB9PR08MB6379.eurprd08.prod.outlook.com (2603:10a6:10:261::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Wed, 4 Feb
 2026 08:33:24 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%4]) with mapi id 15.20.9587.013; Wed, 4 Feb 2026
 08:33:24 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: "Bill Mills (bill.mills@linaro.org)" <bill.mills@linaro.org>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>, "Edgar E .
 Iglesias" <edgar.iglesias@amd.com>, Arnaud Pouliquen
	<arnaud.pouliquen@foss.st.com>, Viresh Kumar <viresh.kumar@linaro.org>, Alex
 Bennee <alex.bennee@linaro.org>, Armelle Laine <armellel@google.com>
Subject: Re: [PATCH v1 0/4] virtio-msg transport layer
Thread-Topic: [PATCH v1 0/4] virtio-msg transport layer
Thread-Index: AQHcjuFkYi+cgIzLc0OakdFLCJk7FbVxAh6AgAFB7QA=
Date: Wed, 4 Feb 2026 08:33:24 +0000
Message-ID: <A8BEAE8F-EFD5-47BB-A747-5D0CAE98F674@arm.com>
References: <20260126163230.1122685-1-bill.mills@linaro.org>
 <20260203081952-mutt-send-email-mst@kernel.org>
In-Reply-To: <20260203081952-mutt-send-email-mst@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.300.41.1.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|DB9PR08MB6379:EE_|DU6PEPF0000952A:EE_|PR3PR08MB5740:EE_
X-MS-Office365-Filtering-Correlation-Id: a188c332-7be8-4156-1d63-08de63c835fd
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?ddizfvnJazLDp7tjS7Kaj8K1ilqLJFIuXDdoUjaCTgug00RPA9Q/xNaSDFHG?=
 =?us-ascii?Q?OO+4PIv/9QUgRLLSei5utFgSBhV9iwkrxYwrafnjN/ew+0Mo0PWLpWn4YHW9?=
 =?us-ascii?Q?PGdIf0qu8deKxnpL/Z7ZXOz1yQQpYHeZSTYta229xGcqF6z5XgtEHpZ9FF5K?=
 =?us-ascii?Q?dEHshqb0/WkL+ywg8IcQJo1ru+iI4cchhWFUrAzVNxzR8DiiK0brYHfsu9NV?=
 =?us-ascii?Q?3bfxk1RGlMV+CoEiDIGr3IO6yklmSR+40MXVLpog5Bcik8AH/z4omywNEJKh?=
 =?us-ascii?Q?L4fyRSrTxFciy92q/29haZ5mtWCxIglGkaA1f/qoiLxLnXQlRUWfBLCSzOl/?=
 =?us-ascii?Q?CxNz4dswMPk1traFratUOfpGIE4e9pA+NG035WR0z3c6TTjOKyI/XdP2P4Zk?=
 =?us-ascii?Q?g9/ejDOvLS2OsyioWHSelhzxfymbAyltcAR1emqDBSRsuc7OiS24kCv2UWOl?=
 =?us-ascii?Q?53ndwu9AKoxDc2iGZft3p9zYDVGlNTB7SPVg/+XdXqSkajyPovGTqkdYi056?=
 =?us-ascii?Q?B5xGPfo9Ow/I85QchX0XB1pYv+uiXzTLK3E0XU1WexXvFcbW91yK656P9so4?=
 =?us-ascii?Q?IremfDRuMeoFyQXb61iZweBoh7dqpSlX8x2oveTIFDMVHewBqABCEzeYisd/?=
 =?us-ascii?Q?xdVfuu21jIXy5qkQbhDe3vbfH7CzSGCKSuWeCosTBhj3GJ2aSZxKPuJdRwAg?=
 =?us-ascii?Q?eEuo0xjOPOQIRQBr3fNpRPiw0ZxM54py4B+BwEteCULgz31bb4RdFHsxSLN+?=
 =?us-ascii?Q?QhlmB9mOsBdJ19Wrsbvaaj3ilZPg1qWpOvi1RcJK4G0XUW1uwHgoslUnBR2R?=
 =?us-ascii?Q?nRzRhkQhUaibG9S2JxZ3A+y7LOOGjyImKWO0xA9eIs+UGx5lpMvpvWd47d/F?=
 =?us-ascii?Q?j8ir4sLTUB7YIlLXhidjK1zPftbKGky31jsthKQJzSu7BW1TymlY1UmPyqDv?=
 =?us-ascii?Q?fJAZ33XBano1WmS5MaZPto1hdKzIemq7jMWchPNeuKuCkjjM+cbdPima7bmZ?=
 =?us-ascii?Q?RpNm7p37PDh3WvH9l2l2G2/jQj2ZIIub/v+RptDzgNin6cPAVWvLZeI2opJj?=
 =?us-ascii?Q?8nfM2I1Z1okD8F+Ad7lYytHn03wl+hfDxU7Ny+p4ROjy/XFgcxoiMm8jVFva?=
 =?us-ascii?Q?8Z+DryU+xQEHA6I+SeD0FA7nn+hHjbm9+U4FkexlWvyBcIbX7aBgnAq+ysLb?=
 =?us-ascii?Q?/7/kk36VDL8uSlDa93CU8wcyn/bJ8WdrY5OzkSEyRDRf/0nxS7WxOWeBhHP1?=
 =?us-ascii?Q?x2a/V30Gkq5pPar0N6olZbijZcyb25cb1HoFdCMNt5vo+bGHbx3deyKlduFW?=
 =?us-ascii?Q?LJ/D1y+2bGqaRU+Y+s+mqwVbzqtGnSouFWG2R7Jt0jxFuhUH6xhBjvNiJDcH?=
 =?us-ascii?Q?DMNyOfR/VX7ksQa7vtji3q21Pig6ZH/Z+R1prCmCehR/48LlJ1aUxb791skZ?=
 =?us-ascii?Q?sh0DDIX9MssqOHAMxxcgvsPi2kudMtMpfz80LWnnkATQfnoX6vD4yeki1Ts+?=
 =?us-ascii?Q?G3xZkOLX/Cc/3aOSTXp3bpqY5fmZu2jRdLP9r9E9YkS7YU6rIO8KzOvgGiZP?=
 =?us-ascii?Q?XF3rJqiZ5yLNx3xX7llZHrVOe8D6R5XqhZdiqSpQPebyjtVcexSroJbwP5ae?=
 =?us-ascii?Q?27/w3EpIxx3OjQNLDmMp590=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <92A12A520C60824D82F2B08CF841BB1E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6379
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000952A.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7afc7970-21ab-4730-aed2-08de63c80fe7
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|376014|1800799024|82310400026|14060799003|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2h6j5dG33KqVeeHbjDHycawrEjXMb9tuEXpFg7W8p0vxnZhydrah0j9R9W0/?=
 =?us-ascii?Q?eCu6F0mXqG391Y9svQwDFv4VrIHB2GuVXsJXRqkrhvbMEGDMYs4eactNcHFY?=
 =?us-ascii?Q?bQDnGhZzucuD5u77Hi5xCOsLFQ35woT6OjEZrTY0iLSe6iBDYPOIUhQ1Pr+U?=
 =?us-ascii?Q?nUFfKsYboJrUjMBDfEJVj0tE5D5BbpnW42AwHL3SZOOWntPwwZusTckWH4AW?=
 =?us-ascii?Q?n/stHxOv9lGZ9RTbKP7dIq7dqG7wmua7qyt3Cb4rkGqbKHLWuCtA9xGAbgO0?=
 =?us-ascii?Q?7Wr34Fwa3FqdLPVkAIkinVK6wVO5fHAqMx8Yxx+naWOXJ8EMICjXifWpaYEx?=
 =?us-ascii?Q?COuduwhJzsw3EfIJVDyRCopmKbLXj16926XULB44qV1UsC1l7/lUM0qqgAxh?=
 =?us-ascii?Q?31Nc9aIOg/0N+PCFhKFCX7lEIOEf/ppyjLEAgoUzeTqOpf8cfr/ldR1XyFB2?=
 =?us-ascii?Q?mgwv8+9j2kUCS1eOBWbDfUALSJ4TyiQ8h8TUnTHm3aFnyD8gPY/JI1ZACpI2?=
 =?us-ascii?Q?RpQuRjfLUhJEq5FhDJJ+GU5vpqXIjTBw2zWpH0o5N54wSU8oAr5ZnU5B1RUY?=
 =?us-ascii?Q?MeYjhF4Ukf9ne0mkGv4gj3Zhg9AyzMa3DEZ78NeXUl63FkxMSo4IA8A+nEnh?=
 =?us-ascii?Q?SZUFOFesZB7MdMjT8WHsT9HQkKjx5DiPLUMKqX5ya1xxGLivj+9ScISmp22c?=
 =?us-ascii?Q?3tJOGDqJ0jqvkYJcqGlXLuIgQwNVVnvdSf6x7cVgjgjIRqNunVJK5o+ZKt7T?=
 =?us-ascii?Q?9w6YRNRsI7qAeUs/4B8IWWi88FSsPcImcIEQ5TVxCnrlh5TRkJQ3NiUGgjhq?=
 =?us-ascii?Q?h+YjT6S266U/1NgN/7sHv5bugiQZM84hO+f815oAdXJtp1M2CzImPqKHCrni?=
 =?us-ascii?Q?ZkECQ9qLJJM02thDNuSwTGR50QjZQIMOmCQdRNFIWuO63v4B/sTzH/rR9lFX?=
 =?us-ascii?Q?925BIB1VPFScBgDgZb+39g/ApHeG7L5JFEVHWvz1y1KWrQHywg+Utsja7oBn?=
 =?us-ascii?Q?kzqGeufVxgaoPxymteplMCLrauxYdvjM4lDOg3unRDnRC1u4LzaQVujLwvN/?=
 =?us-ascii?Q?ER1jzaMOG0c83e5FoQ5MxlvGT8Zt6Ls1uyxgbZPhdYHNNlek0tb6NKMKE1CY?=
 =?us-ascii?Q?Rkhc5IUgmkksW+TezzqdoTtdu8VA1DN38VkqWf6hCH5tczIonnpuh3iu9utQ?=
 =?us-ascii?Q?C2jIwP6cVHSOUxAvvNXwV1f4ka6SQlsbJh6fBMdBDT35c54OUUVvFSJbVIM1?=
 =?us-ascii?Q?qecA4/Y5+mDzdS/e1zSaV2073+SdpI8weAwzk8XkTquoYxNz4uasSk1wFw9y?=
 =?us-ascii?Q?srcmkETkqQiAz3kP5twJ9LEY7H146k2lyqbf4CvPSvS3fM4ClvLzEMTfj2RX?=
 =?us-ascii?Q?2WADgOFHqFktUHKvyZ9QsmwHJsXFDege1IDQBThEsfkTWhQ0MEaPNxDso9pd?=
 =?us-ascii?Q?VrBM4DWCVqlfJP9qzvDup9XsDsC4JVe/w4wFlB3tHBIpqaUWgQUnhmTXS5XS?=
 =?us-ascii?Q?+LDOL3wfXbYN8fu7pMoi4fVNjVK2gvdg6CzqWkqqKZjgHZf5BPvyoF34pyhJ?=
 =?us-ascii?Q?pEbFUEY4CT2Uj/OP94eTGvctzDB1tT4K8xWuXy4G0gypOzAvBch7RaHXWEXa?=
 =?us-ascii?Q?+08xQCMjVJCt1YJg7J8YYoZM4fC9K4PCj42o3auvk+KBYJovEhfNGU2tBeuO?=
 =?us-ascii?Q?+TueWA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(376014)(1800799024)(82310400026)(14060799003)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/rgUKAcI4scByaYcHPfj8WdoWuT4g+M5fBiGzanDV7nE3MaaU2IA/IdXLhG+UBNt9oMy+gfYLA/LBUPZz5/c7kcQhfyuC5MtI1rmG485hHAQaIc9L1VDPjBwnFD9EDC1p/kJ0uRmA0QhuqAV1KDy3GehOR5fuOvY7X5NthWXtCF2GGYMBOArdvuEQvjQtoYvCka/IZH2OGIvWkyNXs3dThEq9tuLrszw87mpM2HT+tVliKX9tKVoNcZyVaUZRYdHpkqMFNNRi/5djRf3SYTXTauk6+1tvkwRz/iv1tzktaI4NSkYRQJHRK990uDjSRHcqbclzq8GAIo+dv906814naqzUQu6yYOcF7bXRaizdLDRG2KE//lfKtFl9JF2Mknq8BkqFS20G3srlJ5yuow59fIJYhX3BLa1h7f/cZAwetfd1Me46BXkMrCgBnJGp/ud
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 08:34:28.2561
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a188c332-7be8-4156-1d63-08de63c835fd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000952A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5740

Hi,

> On 3 Feb 2026, at 14:21, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Mon, Jan 26, 2026 at 11:32:26AM -0500, Bill Mills wrote:
>> This series adds the virtio-msg transport layer.
>>
>> The individuals and organizations involved in this effort have had diffi=
culty in
>> using the existing virtio-transports in various situations and desire to=
 add one
>> more transport that performs its transport layer operations by sending a=
nd
>> receiving messages.
>
> Is it arm and linaro, or more?
> If more, could we get some acks on list from the people involved?

Arm is also interested in virtio message for Various use cases including
the Android one and has been deeply involved in designing and writing
the specification (hence my signed-off in the patches of this serie).

Acked-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
