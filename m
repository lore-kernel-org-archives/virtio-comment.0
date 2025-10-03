Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012048.outbound.protection.outlook.com [40.107.209.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0DC81720
	for <virtio-comment@lists.linux.dev>; Fri,  3 Oct 2025 10:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759488068; cv=fail; b=evpP1ELJ6YtLJv3lPWrkMkYKPuxv56HT6HzzZjb5pK+rs38GuSk83SpnISAFMxCrsMR1148WrJ7Ct9JplZGLjnGmsg4zyVtGJxAOlnlKYfyN138NcY8WkyLxu6KeoUACahSvQIhNdFrJiqeAXB02nZhXOdmSNGl1Wf2Vk+PQZbU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759488068; c=relaxed/simple;
	bh=NfrlBICRdI9fQwYNQPDsioHG6+ag5cdgZWVQDJUM+pQ=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=GHnZtVzQqfstlxExVgOfN//T5KO/keiZLRKJLMx25KrFuaAShgXEG87b+gnEsITh0V3RP5RwNpAooaYFkoJ6X2GT0ghq4WX6Cml3Ubon7wxnXLsERtUnBh5CqslwJpC6ASeNE6k3iUfQzgjmZu2mrwx9pa7ge/dGKEkN4RUZfoU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=GIOLJTNc; arc=fail smtp.client-ip=40.107.209.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="GIOLJTNc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dtP0uHY7x4uus1461cjdKcpW3E7TlGoQNenfmNuo3ExPwEPOfOSWj3rrGeqnBIv0lP+q/Q37aR/8qw10EBRZ3R4DpkIgbkENTuYaG2rWTR2NWOV4jL3gprcVRPXovU/087zIQAD6zo/stLDJFw1/QWa+1zCCj6LBjfYRb4/YaKidb9Q7SG9dD+k1DQAsmM/AOqHN4qhalOCNrfbZzvXZ++OaDo35WI0cSWN0XF8dtzdkbHAGQV/DFeZ3OVHHTBoksAD5mS90xIVWNe06xIK7sEgPZItinsUPwlqhH4lysPkM2GyHp+Z2jF7rSzBM6dBQQeJSC43G+3CEDz8Jl2pmZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=56vf5z5BG8AH7/YuUNquhUAZ8lmmHkFmM52mDqe5Kh4=;
 b=ZHpN//QV+HSi0u8JAmr0E63cHfvLpsWMa/1qAeHvJQtd/sBAtU5BHhjActrkOpFzKXxVbiJCKyV5puMwMZQIYLlJVSA5GykzrvXLH1xMsScYf2lYg2oeDOH3hEbCw47arSk8EJ2DV2i3Q/Do7OtScc0Q+Tar0SnioH4E3vGrWb9NBI2KOWqnZVQXFZR4SapTCW6VS8l0NPyH6TsN9bDeooXUXR3M0zKvwpCf4stP6dux/Ob9WZWgK+6ozq94MhN7rOvZdcy3waujnhjHzs1yK8VriP1JoHSrV5FjQLJHYnECilPPuXmY6vNQRXzBs97dPCNnswBX5bVTGsgip+qxRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=56vf5z5BG8AH7/YuUNquhUAZ8lmmHkFmM52mDqe5Kh4=;
 b=GIOLJTNcPDx5hcj0SeTy5W12NRIUJlkH7pK134YajMH4H7tXeKRvB7nBT2MoJumq5k1Qma0zs8A+ZdW1P4uUE1116VC20tbbLklIr4aaDd4jjz842VaePQk13Tabkfforc6DSXWWdopMHgZiR1K0pHUsBwzKXI4qchnKIonb6+mZm6iFbaOwtWD+c0oJeznrKGk+MnVZtAcKEkN1Oy1oXX1GKXzGsG7ZnWuELDST5OKTOqSUtKSeSV+hz1axkq8Bm2Y17mMgPfr93Cvvi1Tg/IyfT4cdolXWkW0ob3Eat9K7O1nQKaxjt1QOo/8CE9fPSYiI9CKDXHCgVfnmPFlSZw==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by SJ5PPF183341E5B.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::98c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.18; Fri, 3 Oct
 2025 10:41:00 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::e571:5f76:2b46:e0f8]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::e571:5f76:2b46:e0f8%5]) with mapi id 15.20.9160.015; Fri, 3 Oct 2025
 10:40:59 +0000
From: Parav Pandit <parav@nvidia.com>
To: "Chia-Yu Chang (Nokia)" <chia-yu.chang@nokia-bell-labs.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"mst@redhat.com" <mst@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>,
	"mvaralar@redhat.com" <mvaralar@redhat.com>, "jasowang@redhat.com"
	<jasowang@redhat.com>, "xuanzhuo@linux.alibaba.com"
	<xuanzhuo@linux.alibaba.com>, "eperezma@redhat.com" <eperezma@redhat.com>,
	"ij@kernel.org" <ij@kernel.org>, "ncardwell@google.com"
	<ncardwell@google.com>, "Koen De Schepper (Nokia)"
	<koen.de_schepper@nokia-bell-labs.com>, "g.white@cablelabs.com"
	<g.white@cablelabs.com>, "vidhi_goel@apple.com" <vidhi_goel@apple.com>,
	"ingemar.s.johansson@ericsson.com" <ingemar.s.johansson@ericsson.com>,
	"mirja.kuehlewind@ericsson.com" <mirja.kuehlewind@ericsson.com>
Subject: RE: [PATCH v10 1/2] virtio-net: Fix ECN feature descriptions
Thread-Topic: [PATCH v10 1/2] virtio-net: Fix ECN feature descriptions
Thread-Index:
 AQHcDRMxc7D2+BxJGUa3jiZ0uZVtV7SqECZQgACnIACAALBIAIAAa1mAgAEnxVCAADbEAIAANhWAgAAbXICAAwZbwA==
Date: Fri, 3 Oct 2025 10:40:59 +0000
Message-ID:
 <CY8PR12MB71959308B23EFE2A920D8B20DCE4A@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20250814120118.81787-1-chia-yu.chang@nokia-bell-labs.com>
 <20250814120118.81787-2-chia-yu.chang@nokia-bell-labs.com>
 <CY8PR12MB7195670B68CC8F454DA821C6DC1BA@CY8PR12MB7195.namprd12.prod.outlook.com>
 <PAXPR07MB79843798615E61FA134A5428A31BA@PAXPR07MB7984.eurprd07.prod.outlook.com>
 <5f1f310d-8a17-414b-ac70-80028832a78b@nvidia.com>
 <PAXPR07MB7984310A505E7EDDCA0CBFA6A31AA@PAXPR07MB7984.eurprd07.prod.outlook.com>
 <CY8PR12MB719523226B3E785B8433C823DCE6A@CY8PR12MB7195.namprd12.prod.outlook.com>
 <PAXPR07MB79847467B33487A8F0CA5ED5A3E6A@PAXPR07MB7984.eurprd07.prod.outlook.com>
 <CY8PR12MB719518C4A8F3EE03690E44B1DCE6A@CY8PR12MB7195.namprd12.prod.outlook.com>
 <PAXPR07MB79845B9580C4D17590E8C2DEA3E6A@PAXPR07MB7984.eurprd07.prod.outlook.com>
In-Reply-To:
 <PAXPR07MB79845B9580C4D17590E8C2DEA3E6A@PAXPR07MB7984.eurprd07.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|SJ5PPF183341E5B:EE_
x-ms-office365-filtering-correlation-id: 03f12b62-6b13-48e4-a7b3-08de026957ae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|10070799003|366016|376014|7416014|921020|38070700021|13003099007;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?hGAA3hHdVwBOWK30QCdm6e8mNQBLHC4zXco+lbUiqOaiAJgrjJO/UHNWD+oH?=
 =?us-ascii?Q?ad2l6zEQhP7io4BIbKidMyXwWcF9gDbGIHlHVkkLxeBn/VEihT9wub5ZBHt8?=
 =?us-ascii?Q?i2fdKSF/4cb5RK6MuAwMLnefUNzyIsIbaILjMszBXqC9eYIkH+ukAHKXaTfv?=
 =?us-ascii?Q?AzTfJNsvRltAG4WbbQbHWIVayQRO11CGNMd160Ug1/QxlNrZJENFdW890E16?=
 =?us-ascii?Q?WjFB60yHcnCOQIseBeRdZSXBtGRb3pqV7jb62B2Gv0sHkIezscqjYGLXZ6Aj?=
 =?us-ascii?Q?Ocb7idHyzHFvv9P56tTdWMx3qxYSUhhi4TuSM5xf6nzJxgpENcQvGCeGD+Mp?=
 =?us-ascii?Q?6+aakpW2SVCsRyw0GF6GE2WaU3MCTDlmlXCBsQGDHXCb43tc7kqMyEJTi3Yz?=
 =?us-ascii?Q?L0bgnHbl4LZjuVBtEe5Gz4SpixOZdKFNpVyzjWgnW6S9uVwCcYmLI6d+2UxX?=
 =?us-ascii?Q?l7IPXQGLDZgAv2DzcVQfnhhyoDa1XbB0A6XpR0JH4Kfz8vd+PBS6eKrzY/EW?=
 =?us-ascii?Q?RqSc74kZf+RkjnVl1o41CB9cp8XXoRkAp4YUfEHFxKrejnB2jqIkBOTKOgWO?=
 =?us-ascii?Q?Vp5v+Z9qCWKo9LLwT9GhlWHUJ0kyk0/zp0v7QqXa23mO1K6U++rHaaocZ3Yx?=
 =?us-ascii?Q?WdVaomuiN47M7WeF0MtyrsFro9yGdf/sG0f6JLTDSH5OLWlHCf14GjtP4ioZ?=
 =?us-ascii?Q?9hBZ0Q2URknFbLr25ccJGx+8IxWK1rRqlyXcH8L2kwTE0nYUpx9mgv7heS3T?=
 =?us-ascii?Q?aEMFwy8W8e1zFy3aDW0kEsEz1IJ7rLWHTMNHCeG4E2WUZ8kt1Gi9zH+JzRCi?=
 =?us-ascii?Q?VMeSDsVJ4SOryLyrbBtSgsG4Zlu5wkKVCjVojqnG1eFoN6d8Z1szDOuhrTeY?=
 =?us-ascii?Q?ONa+3tDROdvHILcVP0tArip5YmrqZaOgymt1oVG47ujUPeGpqOq5RXl2yklV?=
 =?us-ascii?Q?MIKwQNc9oQjfXO5/POb1dZf7ktQcN0NuBoJJU6nxFUJuFgkJ1f9rU8QK3KHF?=
 =?us-ascii?Q?kh5hdzPEu96su2tTabE4DYMNxLSqvmsxrbl+sTnMiqEcXdQmArVw0jn414M1?=
 =?us-ascii?Q?yQorWb0YvM5nzAzHoboAPBE+pdQyz/9N1BDJuQLPkKRaJC31IzdtWOAjdSg3?=
 =?us-ascii?Q?+4KVa0RAPvOjThy/ZInfNi0yJTnmNx7wAzNh3mDHFg13NQZ7o9+S1xX6P7K8?=
 =?us-ascii?Q?Ob23KyqVPgIguLecykIPu/rqfcbaYLDOzDeT/VS8cDuEPeWPAi4+x8zgq7ww?=
 =?us-ascii?Q?rZTu6AOestVcewqu4QnVwzNF6zn9aLHUSTRWknTpcf54ztwaq/8a4e8X/Hul?=
 =?us-ascii?Q?Xfx9pwsCSoOicNMY49a2+joWgUpFlBbhJUqNTuGol0xHoTl+G0E55c0EI0/j?=
 =?us-ascii?Q?FDRzy/bPJUs38sKPM15jop2f9V0D1+hREujAdob97NzGU64zrY7EYa2cZD+Z?=
 =?us-ascii?Q?9ZdY6FpB4V7EOZ6snsAPnYBv3FpT8jIVEZlOT2xz6l990kxvetBu/1MYJD+7?=
 =?us-ascii?Q?c/da75vCj3/y7bRh4U30GbXxxjpDEowkWFLP4ofPZKa3oh/oYB9NmWB0sA?=
 =?us-ascii?Q?=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(7416014)(921020)(38070700021)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Y6Qj7ARdAcywK7K/3KaH6370U76nDTP1myxbb5IhkqU+XpNByV3M9cWulI+m?=
 =?us-ascii?Q?CMqGNbhJWrqJ5YP5hDHn1AJuLCF/1k4dkcVHCQn/iK9RZVoz0wlBfSBlPypm?=
 =?us-ascii?Q?Zr+Rnsfv/Yyn+yF5alqyP7qE4k7MKjs2fgT0ZhLcQM6bu56yHqRl/4XynPN8?=
 =?us-ascii?Q?IYhpk2up3vcD4COw4kxPhFbeR4SQxOt4fEQERZo5IENlIoAbNohI4aK5Hh++?=
 =?us-ascii?Q?0G1YRmP9WaZqkQXKbB1pr7VuPWan9Lrd9wNQOWIBdG+sm5QSgo3AgtwEkQkM?=
 =?us-ascii?Q?ghrFRr9fsRcwoQw4YCd5YAyW8UYaHHJalLWB0/D6XXlYOg9Qoxl6bJh5Iww0?=
 =?us-ascii?Q?qzUSqaC/5S39c1JHE31BOmAc+Euz9c7iNxCmwbGDDm0W0USX0uI30+jn4EuP?=
 =?us-ascii?Q?cgF1kX/NpQAF2QzzST22bCR8ADGAeOvW/D+Taj0u+cOpmyU5EC96BuxuU7kH?=
 =?us-ascii?Q?qH/Xvwe32T7FdT95gd2lM/h2DGnInwBiMMHYfaTmc0frq3fo8Kyfcb/PdSmb?=
 =?us-ascii?Q?Gf7aJJfFOfalQvTR6Ul+tqw/HsWVQRmddocePuRPJj1xaD08TbpYeHesfuXx?=
 =?us-ascii?Q?bNPmkYgtHPrJXuzJV9aXvIVFDaLCK9jdW8c6eTtNZY9LYj11QeUHxyJti0Ax?=
 =?us-ascii?Q?gYl/6braZgvL5v9/uDI8+TAvzh107Z0Ukg/W0AErMsnPPBSFLA8BsP4EosAi?=
 =?us-ascii?Q?eRVevVZIW4iLOEEq341lddFeXpT5whenkLz4yhaYyzAeL68GwzbYNFtmOXlM?=
 =?us-ascii?Q?7WgiwROUCiwMm9MM1UaCIRXIinoIUHNL3+rPivZAYyrAmutuIyNhU/tmCOws?=
 =?us-ascii?Q?+jw3mGcyVL/EeZxWK6u1toYWJE1NW0N5VE+bNZBSYVd6UL6A+MGpeZlcqTmB?=
 =?us-ascii?Q?VYOC9ogyGE/yRH9z9F8HUY1UmhQIWOlRZ+VbXX88oy4X9Lu6E0uD7V9Gade6?=
 =?us-ascii?Q?f32PFLP7A69cj5/+cWkeXNpdDlL8Lio2djmkk8UC7cOey1M4v/0Bb9OMsjEd?=
 =?us-ascii?Q?q3Z2PhJbQmEl4IQ54IUpMGg1DMgrj4N1/UrZyK5TDdwsO3MIoiuURLHRkPa5?=
 =?us-ascii?Q?Sm3hvnYQrt5JFpCMiK6H/l4IKJR5mz67NPdHWnUeepyiJrJEEV4L3J8xcA8b?=
 =?us-ascii?Q?H0xeFjvCprJuZgQ5/4rmnNzY0siZoBKLkZN3n5aNqGlSc55180ZgnV4DjVf7?=
 =?us-ascii?Q?ZXzO3xx6hw/8I+GKmbXcYJ5m4GX2MIk5NUoZ53EVwmB2mrFDo9fBHJCMt4P0?=
 =?us-ascii?Q?mL+H8DRFQPgB+ErlCbfzstFY6qg3uLn9NWCzWlGG2+HRTI3cfsp415ZyPPhA?=
 =?us-ascii?Q?hP/v1gygAp6YECyiyIkgRuN2esL3VkTuVZ97iqxONyGfB5b78r2icIUPc9ie?=
 =?us-ascii?Q?96Xj2tLAVuH4tgHA/qQtQxP93INfk3AXgj8pJcpZL0XX+33oTI7BswFx1NV/?=
 =?us-ascii?Q?BLdVjFq2CEFc4VEp3N1GgRv6xU1/N3/QPRWr+8sVRrKHb7U4LaIB6Aqof2Lf?=
 =?us-ascii?Q?TdrNcZl5btdulnF7NlxBifK01OOfRdchQV/nGqRsjlslFVIJtzj9xa2KhUdU?=
 =?us-ascii?Q?igA4GE6LAro4L+RU1nAz0cD9jIDWJ8463FM0ve+X7VL72RNxIWoLM6QuztJY?=
 =?us-ascii?Q?CAFzGYUj2Shs5Ot1d9RzsC8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB7195.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03f12b62-6b13-48e4-a7b3-08de026957ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2025 10:40:59.8398
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nie2pwHWd/9P7TkdKGLffq2Nni8L2RnxTAgg4NRjSKxtC6xykH5tUSPAMu8mydfi4VWqWVDEpGyNDN9lN4RqPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF183341E5B



> From: Chia-Yu Chang (Nokia) <chia-yu.chang@nokia-bell-labs.com>
> Sent: 01 October 2025 05:56 PM
>=20
> > -----Original Message-----
> > From: Parav Pandit <parav@nvidia.com>
> > Sent: Wednesday, October 1, 2025 12:51 PM
> > To: Chia-Yu Chang (Nokia) <chia-yu.chang@nokia-bell-labs.com>;
> > virtio-comment@lists.linux.dev; mst@redhat.com; cohuck@redhat.com;
> > mvaralar@redhat.com; jasowang@redhat.com;
> xuanzhuo@linux.alibaba.com;
> > eperezma@redhat.com; ij@kernel.org; ncardwell@google.com; Koen De
> > Schepper (Nokia) <koen.de_schepper@nokia-bell-labs.com>;
> > g.white@cablelabs.com; vidhi_goel@apple.com;
> > ingemar.s.johansson@ericsson.com; mirja.kuehlewind@ericsson.com
> > Subject: RE: [PATCH v10 1/2] virtio-net: Fix ECN feature descriptions
> >
> >
> > CAUTION: This is an external email. Please be very careful when clickin=
g links
> or opening attachments. See the URL nok.it/ext for additional information=
.
> >
> >
> >
> > > From: Chia-Yu Chang (Nokia) <chia-yu.chang@nokia-bell-labs.com>
> > > Sent: 01 October 2025 01:04 PM
> > >
> > > > -----Original Message-----
> > > > From: Parav Pandit <parav@nvidia.com>
> > > > Sent: Wednesday, October 1, 2025 6:24 AM
> > > > To: Chia-Yu Chang (Nokia) <chia-yu.chang@nokia-bell-labs.com>;
> > > > virtio-comment@lists.linux.dev; mst@redhat.com; cohuck@redhat.com;
> > > > mvaralar@redhat.com; jasowang@redhat.com;
> > > xuanzhuo@linux.alibaba.com;
> > > > eperezma@redhat.com; ij@kernel.org; ncardwell@google.com; Koen De
> > > > Schepper (Nokia) <koen.de_schepper@nokia-bell-labs.com>;
> > > > g.white@cablelabs.com; vidhi_goel@apple.com;
> > > > ingemar.s.johansson@ericsson.com; mirja.kuehlewind@ericsson.com
> > > > Subject: RE: [PATCH v10 1/2] virtio-net: Fix ECN feature
> > > > descriptions
> > > >
> > > >
> > > > CAUTION: This is an external email. Please be very careful when
> > > > clicking
> > > links or opening attachments. See the URL nok.it/ext for additional
> > > information.
> > > >
> > > >
> > > >
> > > > > From: Chia-Yu Chang (Nokia) <chia-yu.chang@nokia-bell-labs.com>
> > > > >
> > > > > > -----Original Message-----
> > > > > > From: Parav Pandit <parav@nvidia.com>
> > > > > > Sent: Tuesday, September 30, 2025 6:15 AM
> > > > > > To: Chia-Yu Chang (Nokia) <chia-yu.chang@nokia-bell-labs.com>;
> > > > > > virtio-comment@lists.linux.dev; mst@redhat.com;
> > > > > > cohuck@redhat.com; mvaralar@redhat.com;
> jasowang@redhat.com;
> > > > > xuanzhuo@linux.alibaba.com;
> > > > > > eperezma@redhat.com; ij@kernel.org; ncardwell@google.com; Koen
> > > > > > De Schepper (Nokia) <koen.de_schepper@nokia-bell-labs.com>;
> > > > > > g.white@cablelabs.com; vidhi_goel@apple.com;
> > > > > > ingemar.s.johansson@ericsson.com;
> > > > > > mirja.kuehlewind@ericsson.com
> > > > > > Subject: Re: [PATCH v10 1/2] virtio-net: Fix ECN feature
> > > > > > descriptions
> > > > > >
> > > > > >
> > > > > > CAUTION: This is an external email. Please be very careful
> > > > > > when clicking
> > > > > links or opening attachments. See the URL nok.it/ext for
> > > > > additional information.
> > > > > >
> > > > > >
> > > > > >
> > > > > > On 29-09-2025 11:14 pm, Chia-Yu Chang (Nokia) wrote:
> > > > > > >> -----Original Message-----
> > > > > > >> From: Parav Pandit <parav@nvidia.com>
> > > > > > >> Sent: Monday, September 29, 2025 9:48 AM
> > > > > > >> To: Chia-Yu Chang (Nokia)
> > > > > > >> <chia-yu.chang@nokia-bell-labs.com>;
> > > > > > >> virtio-comment@lists.linux.dev; mst@redhat.com;
> > > > > > >> cohuck@redhat.com; mvaralar@redhat.com;
> > > > > > >> jasowang@redhat.com; xuanzhuo@linux.alibaba.com;
> > > > > > >> eperezma@redhat.com;
> > > ij@kernel.org;
> > > > > > >> ncardwell@google.com; Koen De Schepper (Nokia)
> > > > > > >> <koen.de_schepper@nokia-bell-labs.com>;
> > > > > > >> g.white@cablelabs.com; vidhi_goel@apple.com;
> > > > > > >> ingemar.s.johansson@ericsson.com;
> > > mirja.kuehlewind@ericsson.com
> > > > > > >> Subject: RE: [PATCH v10 1/2] virtio-net: Fix ECN feature
> > > > > > >> descriptions
> > > > > > >>
> > > > > > >>
> > > > > > >> CAUTION: This is an external email. Please be very careful
> > > > > > >> when clicking
> > > > > links or opening attachments. See the URL nok.it/ext for
> > > > > additional information.
> > > > > > >>
> > > > > > >>
> > > > > > >>
> [...]
> > Virtio spec requirements are clearly written.
> > So just by referring to RFC 3168 is as blurry as today in context of GS=
O.
> >
> > At best possibly it can be written as "device SHOULD do ECN and CWR in =
first
> pkt.. and subsequent packets SHOULD have cleared".
> >
> > If that is not aligning, than better to not make it more blurry.
> > ACCECN feature bit can be more crisply defined in that case.
>=20
> OK, then could you let us know if we make below changes in the next versi=
on,
> are they clear enough for virtio spec?
>=20
>=20
> 1. VIRTIO_NET_F_GUEST_ECN (9): Driver can receive TSO with the CWR flag
> set. This CWR flag is only applied to the first packet, and the CWR flag =
of
> subsequent packets should be cleared.
>=20
> 2. VIRTIO_NET_F_HOST_ECN (13): Device can receive TSO with the CWR flag
> set. This CWR flag is only applied to the first packet, and the CWR flag =
of
> subsequent packets should be cleared.
>=20
> 3. If the driver negotiated the VIRTIO_NET_F_HOST_ECN feature, the
> VIRTIO_NET_HDR_GSO_ECN bit in gso_type indicates that the CWR flag of the
> TCP packet applied only to the first packet and is cleared in subsequent
> packets.
>=20
> 4. The driver SHOULD NOT send to the device TCP packets requiring
> segmentation offload with the CWR flag set ONLY for to the first packet a=
nd
> cleared in subsequent packets, unless the VIRTIO_NET_F_HOST_ECN feature i=
s
> negotiated, in which case the driver MUST set the VIRTIO_NET_HDR_GSO_ECN
> bit in gso_type.
>=20
> 5. The device SHOULD NOT send to the driver TCP packets requiring
> segmentation offload with the CWR flag set ONLY for to the first packet a=
nd
> cleared in subsequent packets, unless the VIRTIO_NET_F_GUEST_ECN feature
> is negotiated, in which case the driver MUST set the
> VIRTIO_NET_HDR_GSO_ECN bit in gso_type.
>=20

Also, while it is good to document existing behaviour of the spec, devices =
and drivers,
I believe that ACCECN need not have to wait for the documentation of existi=
ng GSO_ECN.

However, I am bit puzzled with the Linux kernel commit [1] of yours that hi=
nts that ACCECN may not need any special handling.

You described,

    If NIC is completely unaware of RFC3168 ECN (doesn't support
    NETIF_F_TSO_ECN) or its TSO engine can be set to not touch CWR flag
    despite supporting also NETIF_F_TSO_ECN, TSO could be safely used
    with AccECN on such NIC. This should be evaluated per NIC basis
    (not done in this patch series for any NICs).

Based on above commit log, can we say that when existing GSO_ECN is not neg=
otiated, ACCECN can work as_is without the patch_2?

[1] commit 023af5a72ab16 ("gso: AccECN support")
