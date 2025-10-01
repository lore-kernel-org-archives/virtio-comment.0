Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010007.outbound.protection.outlook.com [52.101.69.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A018B27586C
	for <virtio-comment@lists.linux.dev>; Wed,  1 Oct 2025 07:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759304064; cv=fail; b=f8tnFOX8/nM0acjat2nIF7THBaCD8Kz4ASUazOwEsxrBMpbDOjHaFX6yv4TWXhEYNfr287nowjHYPZZ/26AtldHdP7dPuHPTzkDkiji1HKa4MRjk2mRxIOFi4ez6+aEiMwTJxbsjfaA1dBTu4nTeYnJYmGFVTcUoHkUXMsJZx+8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759304064; c=relaxed/simple;
	bh=1VFeufNNFwLl2SKwN09BLcC82l2zj9GcTaxO0lrGvLE=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=UPANkaqw7gpI54VfA6Pz1+dPl6b/m6Ljh3sxn6qCXT69yGeOh8k9fXljmm4gCy/BxMLm8UgjIRQNBKrW9p5aAWVVWUGVl4zzZg6DP/SCwZ1yxDTeR7Tq5j3ebIsH5mK3IkMvoM8lzIuNJQT52XFaKmXmQAGConVGv3ipPcSIXiQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com; spf=fail smtp.mailfrom=nokia-bell-labs.com; dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b=oe2x8F/D; arc=fail smtp.client-ip=52.101.69.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b="oe2x8F/D"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O3QJ/THVu6rzuaG+zg5g+q3tM2pWstn9see1QgxsLF2nZ/5+CPYXyhah3LeC8jh3wXwzsvdMKii8AR9IaGzTV9i5d/AhCPGk7gXH5aUpnhRLOcdlFcokXS1v+lqd8Wgomi8JUD+QUhpaFHrMMQga6Z0g+pHqlEJyvNZs5d+06tBYeNRP3WMXLDisvD3p+LDAi5JTQMHc14eA3T8OivwVhWObIHi72YlHRK68BmI3esf5BHJTgDykdurIfBUOLe89+pZM6kRzOuR3m0jQ8Gffx021Hz26GhpIKyx046Q55txrHsiDiappNiEBdF8njviCyTtWP02tYuWPavbiQxk+iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1VFeufNNFwLl2SKwN09BLcC82l2zj9GcTaxO0lrGvLE=;
 b=pARgwb50nj/3LhLztxhHGxVpDADTJzpufl6pVCI7Sfn9yhjQ97YS9KQcIRsltUzIoduTeSda0MLp2dKktnz1ZNrzRqXvrr20WrUUPzlbqfzH3uNuf4zA6HmXC96pC7crllVkh6xlKJl/exq+PcLt+8Ow5MYaIbkRMvclZ6iJ13rzrSR9FywLNq3Ee/bUqIwcWRrtqo9rvdDTfyzvg1yb1LSePYf17S7W5oao8swdxFpnocPGQ5EXHW5L0Uw4xT8vpV+dkZZP9WxDlzetGpMvQPu6brSl7JVxBolY/jxnvwMsfBVKRwpbRbilpMeREzoI+tx3idp/20JcXiGizegZQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia-bell-labs.com; dmarc=pass action=none
 header.from=nokia-bell-labs.com; dkim=pass header.d=nokia-bell-labs.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia-bell-labs.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1VFeufNNFwLl2SKwN09BLcC82l2zj9GcTaxO0lrGvLE=;
 b=oe2x8F/DLVPkg5ZdcCs21u/l0dES7daQCj007Go2TPXEHETwdEKJ9sBh2aJdlSkOGNslZ/ZcqjmnUofIUVab1opOtTssGaxPx03EjatqY715QFxqraFgmcCH2u+VCuHC/kHUM8VVQ4cHdTOxGxy7Gp3QSByRbdv7YkItoTEIspQ6/8pXKxttEQChkCKVnwwLxENmyPIbAhy06lixmA+psMcId9iAVmemN/qPY7DQAGXtqJBgzCaiojLaUTKnovZCch7OYywaQRfsOanoU2LW9IRr9+DuyvV7ywxzpIvOrNV8PXqhX8QDDo+8RTutxwdMPZb1opTDPEroUrzG6JDJjg==
Received: from PAXPR07MB7984.eurprd07.prod.outlook.com (2603:10a6:102:133::12)
 by PAXPR07MB7902.eurprd07.prod.outlook.com (2603:10a6:102:132::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Wed, 1 Oct
 2025 07:34:18 +0000
Received: from PAXPR07MB7984.eurprd07.prod.outlook.com
 ([fe80::b7f8:dc0a:7e8d:56]) by PAXPR07MB7984.eurprd07.prod.outlook.com
 ([fe80::b7f8:dc0a:7e8d:56%2]) with mapi id 15.20.9160.017; Wed, 1 Oct 2025
 07:34:18 +0000
From: "Chia-Yu Chang (Nokia)" <chia-yu.chang@nokia-bell-labs.com>
To: Parav Pandit <parav@nvidia.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>, "mst@redhat.com" <mst@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>, "mvaralar@redhat.com"
	<mvaralar@redhat.com>, "jasowang@redhat.com" <jasowang@redhat.com>,
	"xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>,
	"eperezma@redhat.com" <eperezma@redhat.com>, "ij@kernel.org" <ij@kernel.org>,
	"ncardwell@google.com" <ncardwell@google.com>, "Koen De Schepper (Nokia)"
	<koen.de_schepper@nokia-bell-labs.com>, "g.white@cablelabs.com"
	<g.white@cablelabs.com>, "vidhi_goel@apple.com" <vidhi_goel@apple.com>,
	"ingemar.s.johansson@ericsson.com" <ingemar.s.johansson@ericsson.com>,
	"mirja.kuehlewind@ericsson.com" <mirja.kuehlewind@ericsson.com>
Subject: RE: [PATCH v10 1/2] virtio-net: Fix ECN feature descriptions
Thread-Topic: [PATCH v10 1/2] virtio-net: Fix ECN feature descriptions
Thread-Index:
 AQHcDRMrginf6nv65kWiLWJ393AYBrSqEH4AgACeHQCAALjzAIAAY1+ggAExSICAADU0YA==
Date: Wed, 1 Oct 2025 07:34:18 +0000
Message-ID:
 <PAXPR07MB79847467B33487A8F0CA5ED5A3E6A@PAXPR07MB7984.eurprd07.prod.outlook.com>
References: <20250814120118.81787-1-chia-yu.chang@nokia-bell-labs.com>
 <20250814120118.81787-2-chia-yu.chang@nokia-bell-labs.com>
 <CY8PR12MB7195670B68CC8F454DA821C6DC1BA@CY8PR12MB7195.namprd12.prod.outlook.com>
 <PAXPR07MB79843798615E61FA134A5428A31BA@PAXPR07MB7984.eurprd07.prod.outlook.com>
 <5f1f310d-8a17-414b-ac70-80028832a78b@nvidia.com>
 <PAXPR07MB7984310A505E7EDDCA0CBFA6A31AA@PAXPR07MB7984.eurprd07.prod.outlook.com>
 <CY8PR12MB719523226B3E785B8433C823DCE6A@CY8PR12MB7195.namprd12.prod.outlook.com>
In-Reply-To:
 <CY8PR12MB719523226B3E785B8433C823DCE6A@CY8PR12MB7195.namprd12.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia-bell-labs.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR07MB7984:EE_|PAXPR07MB7902:EE_
x-ms-office365-filtering-correlation-id: a8811485-3c0c-4742-debe-08de00bcee38
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|921020|38070700021|13003099007;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?IJ0ZS52kH3I5MUs1SaDSgxpGwz8cWtRVRrHMDFhOlxvbM2FOQbr9VhHrkMlf?=
 =?us-ascii?Q?f00VFq1+JOJ4JRzhOg6t3UFPu/ohwTLRAtK3rcMj4J3hJRRo1FocRs8YXEc8?=
 =?us-ascii?Q?P8HP6HKCarBiHPGA/lKHnqx7G7TUJ5jJn6f9AvlZALEP/7a+Xbob4uAlpfQ3?=
 =?us-ascii?Q?k4yBHAgSAaVCZHllAw+OqKC/tjhJwpsQQb8J/9OvqzqIsEACq+iRSrIAZtxE?=
 =?us-ascii?Q?tPSahkwEIWxldwsYlLFOGQcpB7DsGC8oWFPsXo9BKA2vZTRhIThNZAU1TLvG?=
 =?us-ascii?Q?HMIISQsye7yrmFo1jBB/1SFwbkIsTEq8pVrgMIr13c0XjjPqzilGN5PfUT1D?=
 =?us-ascii?Q?btsZvGxsV2n/37y64JDlyu2akiX/JXtCNddDQFL01kJe3rMNRDfC/5mVQBLb?=
 =?us-ascii?Q?Z3Z3vSu7Gz0fqqqW+Mtoz0h1ui8Bd1VUH04hIhom6iuaO6N7/J7HPuh/slDW?=
 =?us-ascii?Q?N7v6sXy4WMUojspeR0kZJmiqvDdMU5H8GHqzIiWUMMYvavlSoVRM4r/J9aEh?=
 =?us-ascii?Q?GOxZf/9vPVlzuE1JWsdMalZgWNl5NAiwc5Y3UchV99StxzEk/LhssorEtSQ7?=
 =?us-ascii?Q?UD+GfsY3v2bNaLAZ4pW1NUkiNFIt3mm/B/uPhQkJxCbqC8y3Cj3Yc7DnwbhL?=
 =?us-ascii?Q?IBYXCPf5LlHhcuDoT9ShAHJ2aggAGRfCtuQwKmIWaTclFsBWCCwsSt9Axaxs?=
 =?us-ascii?Q?lWkb+ceiChmErR9a6nnmrPKidfzeWvROUc8lqm9YWKbNcyWA0AiRsRa6bJGv?=
 =?us-ascii?Q?cgXEAYpvZUhnO6jkL4VG4cenePB0MMXR+kbTqDFNRjGn+QNag6cBazn9dSEP?=
 =?us-ascii?Q?WNbtCjEZqB7YIsb0bM2tzFiMKOuPUbKBjPmPX7btsT+a+v5SARgalqRfwxcb?=
 =?us-ascii?Q?nzIG97g2Xw8aJ2Wd0FXeUssDB0cwkhIfo7GXoT7WRPPTM5Qu1oYg6R/e/UtP?=
 =?us-ascii?Q?zFJjGEGRb0LuCLIbV9XLbCrO4iOQSC+zk9orh7OJ1G4W2D9PWco7DVPEFXvb?=
 =?us-ascii?Q?oGVpuOgAhe40QeQYiH3L/2qirtlPkN+YpvNSRReA6Ln5cCbW3TyedRqEDvIP?=
 =?us-ascii?Q?/CtZKUsShKhHJo0bOJsezlmsU2NuOjhAC0fH1GT5ayZ2TtJjQhZ3pWSXvoTm?=
 =?us-ascii?Q?OfEhLz/eVWBkITZdQ78BbDSzOg3rkeLPQ16iRn/3cVV05DCNe9UJ4buOm/u/?=
 =?us-ascii?Q?6iDp9ISctcAtTD5FbhZ2V6m7galuq/slvsOHnHtSunQ/jtpRhfkn7WLwDHlX?=
 =?us-ascii?Q?amiQqVcQxcLbLSiVeVdUt79srOKL6nhhLD8wZ1m0RHY15I1WoknRfaOsH6+1?=
 =?us-ascii?Q?WVx4icJqkiHAq8SNgPjSOghADQNKiYRMdjojhLhB/ux8M9euvobGtNvdxiwI?=
 =?us-ascii?Q?BrD6BDRvNXyZHLXgmvA3wb+1gqbtLEgW61yG45Fk0UV77FHSwCuiBWQfj4Ib?=
 =?us-ascii?Q?8CPwjm34WlMCN2UKUDmqvOUjMQ8QRAyf+yY083KKd0LIkdN2N8WR92p0eka+?=
 =?us-ascii?Q?r2nTrZW2Sse/IWw=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR07MB7984.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020)(38070700021)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?rRcLesd/wAQgjRcW5H1zbivNzZGX3QaedoXcX52SNeJ6jJBb6WGsi3WtY9Y1?=
 =?us-ascii?Q?lsTjZxh1z+MKxC64RYnSypIiss1O777jFTuTK3NI8ImY3mB2KtdQPMzZkgzM?=
 =?us-ascii?Q?oyM9mMtHbmAj241AtdLaN5pwcy1dZBrr7pmn9T4uY+8fAA63IULrF9JHtL7C?=
 =?us-ascii?Q?rJ7XcPDULDXxB4hmfwyWNo2UXAzOdyWVhVK8rNoqpsWbQBDPoTHmmTrDJLgu?=
 =?us-ascii?Q?UC6VYsm4n2nw66/0Yknkpk6kNLv/e+yzRkkG8jSUjNnPDNcCzete4Jv4Q530?=
 =?us-ascii?Q?Gc/tt4D+1+/BSohB5ZZjS8P+9ujJGAPBhuC5uZLbm5c6j9oqNmjdi5hiiMSy?=
 =?us-ascii?Q?x3jLxi9r2giFnW2gkJQAA80RnfJLVEcbn8av4VEYI6BsYV69B248VePTlDsM?=
 =?us-ascii?Q?gq/OMbDsVyLBgJc8K//bnGYGwBKG3dbtoiEfeLbi4/ZW4zm6crzFeWtdDSIs?=
 =?us-ascii?Q?HOfO6ZXx8ZrNYIpcv/o6SfK2DOTcpyWwWOUPnbx5xqsJvZebazKYRT/cQs6B?=
 =?us-ascii?Q?acjJEYesbbGk/6qQqj6cNAkRLMXs1jwgGnBot8qdG7PrWE9Xc1gcE0c1wEUz?=
 =?us-ascii?Q?FVW816ACHk45kGjVgsnElLgv4yRqgZI54yxQK9qKCUlxM2M9JPLUQjgbsT+6?=
 =?us-ascii?Q?Xkr4UFl05erttJkdhWqel2kpt7/oYvmfMnOdLFZvi4MvPm4X1vEkeqPzLD2t?=
 =?us-ascii?Q?0izoEZz7QKqzGIXJLfti9IPckb/q8hcCncLapg+cI2WpnE4P++Jftqk0L2zb?=
 =?us-ascii?Q?XFpnKBDAx1x1fGV7beMm+v/zMt/11/zyPCze5QGm6U2QeRjuyNJWEiTaOwcR?=
 =?us-ascii?Q?Mqd0oJC6T2mDkiztsI2ZQLaRMYM9Q9kx2soZ4qf85HTKtv2xKAHaD8kjukO9?=
 =?us-ascii?Q?Kf514AMuUUSD/Q+BE7w6RQwZKcZcY/wkeq8d6+iT8iFE+Vdo6IN3rk5gOxDF?=
 =?us-ascii?Q?ghrmsU767F63jHF9HLREL1OyoHNRdYHzTQXSVHEGlYipH7arVA85lDblqeGl?=
 =?us-ascii?Q?4daO2ItHLcEjA9HBQbA8jQWOjMj232s2rQRzdsE4uLKM/VhYW3dTDiCkZSCP?=
 =?us-ascii?Q?xieQBMedaTZFdfhZCAXE+43RDxzeqvubkVCME4JqPfvWtpy42941vtIhcTZB?=
 =?us-ascii?Q?vCqSQg/kC1t1negnkWRsUyJ1aaK7wSBXmz1ssImo5JWfH3L270mM3WfJqXRx?=
 =?us-ascii?Q?7R7pnyVWMm0E/l7ZC1ACdUieEgWtQKPW6ysdwm18iM8QTrBf7zO+RdOTOmgf?=
 =?us-ascii?Q?QrGHHsi2o1S5LW7q7cWsjm5lq8+7YFgRCKyRIxJvZDD/OGLIs1qkPFZjL3sm?=
 =?us-ascii?Q?oGQPM73o4M6eAXK/SbzlbwfyKaJyy3GieLjSqIJZmXKvOCWBACwzj6ZdmDAE?=
 =?us-ascii?Q?BGQ/7SLir7te8PLbp5qzRM2cqSJK+UrC2wmOfP07GH14WAcTWcfAN3vZtLDK?=
 =?us-ascii?Q?g2G3I8UL4MT3Y9R8edyIGAvs8DoXBGr1c4HSpcgW9Og0p0Eeq8LGFd0sGlkZ?=
 =?us-ascii?Q?i6FgG2ln6wdCzXFnGgpjb76mm2kC8Atttqvynkj3eKbuDhbVN7CSDhfogCPF?=
 =?us-ascii?Q?IYBB3EVLXVFcUIWzYMYWJB6ckHbxNzBtso1xTkMLXjM2nTAZnBoTQ4Am7f3/?=
 =?us-ascii?Q?YtSCV6Ll6oQTjnIQlcO+E+U=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: nokia-bell-labs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR07MB7984.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8811485-3c0c-4742-debe-08de00bcee38
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2025 07:34:18.3606
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nK3Wd7r+M+tbiwf0riaCLy6lPd92Z/zDS5pWLATIhmYr6WVimtkNslH22BP6T+/uUSNddgc+XvN41GvBKjO41sYYVmATcL+MBaUJt/vgpUVNVt3Y1qY18wo6L19/xT+2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR07MB7902

> -----Original Message-----
> From: Parav Pandit <parav@nvidia.com>=20
> Sent: Wednesday, October 1, 2025 6:24 AM
> To: Chia-Yu Chang (Nokia) <chia-yu.chang@nokia-bell-labs.com>; virtio-com=
ment@lists.linux.dev; mst@redhat.com; cohuck@redhat.com; mvaralar@redhat.co=
m; jasowang@redhat.com; xuanzhuo@linux.alibaba.com; eperezma@redhat.com; ij=
@kernel.org; ncardwell@google.com; Koen De Schepper (Nokia) <koen.de_schepp=
er@nokia-bell-labs.com>; g.white@cablelabs.com; vidhi_goel@apple.com; ingem=
ar.s.johansson@ericsson.com; mirja.kuehlewind@ericsson.com
> Subject: RE: [PATCH v10 1/2] virtio-net: Fix ECN feature descriptions
>=20
>=20
> CAUTION: This is an external email. Please be very careful when clicking =
links or opening attachments. See the URL nok.it/ext for additional informa=
tion.
>=20
>=20
>=20
> > From: Chia-Yu Chang (Nokia) <chia-yu.chang@nokia-bell-labs.com>
> >
> > > -----Original Message-----
> > > From: Parav Pandit <parav@nvidia.com>
> > > Sent: Tuesday, September 30, 2025 6:15 AM
> > > To: Chia-Yu Chang (Nokia) <chia-yu.chang@nokia-bell-labs.com>;
> > > virtio-comment@lists.linux.dev; mst@redhat.com; cohuck@redhat.com;=20
> > > mvaralar@redhat.com; jasowang@redhat.com;
> > xuanzhuo@linux.alibaba.com;
> > > eperezma@redhat.com; ij@kernel.org; ncardwell@google.com; Koen De=20
> > > Schepper (Nokia) <koen.de_schepper@nokia-bell-labs.com>;
> > > g.white@cablelabs.com; vidhi_goel@apple.com;=20
> > > ingemar.s.johansson@ericsson.com; mirja.kuehlewind@ericsson.com
> > > Subject: Re: [PATCH v10 1/2] virtio-net: Fix ECN feature=20
> > > descriptions
> > >
> > >
> > > CAUTION: This is an external email. Please be very careful when=20
> > > clicking
> > links or opening attachments. See the URL nok.it/ext for additional=20
> > information.
> > >
> > >
> > >
> > > On 29-09-2025 11:14 pm, Chia-Yu Chang (Nokia) wrote:
> > > >> -----Original Message-----
> > > >> From: Parav Pandit <parav@nvidia.com>
> > > >> Sent: Monday, September 29, 2025 9:48 AM
> > > >> To: Chia-Yu Chang (Nokia) <chia-yu.chang@nokia-bell-labs.com>;
> > > >> virtio-comment@lists.linux.dev; mst@redhat.com;=20
> > > >> cohuck@redhat.com; mvaralar@redhat.com; jasowang@redhat.com;=20
> > > >> xuanzhuo@linux.alibaba.com; eperezma@redhat.com; ij@kernel.org;=20
> > > >> ncardwell@google.com; Koen De Schepper (Nokia)=20
> > > >> <koen.de_schepper@nokia-bell-labs.com>;
> > > >> g.white@cablelabs.com; vidhi_goel@apple.com;=20
> > > >> ingemar.s.johansson@ericsson.com; mirja.kuehlewind@ericsson.com
> > > >> Subject: RE: [PATCH v10 1/2] virtio-net: Fix ECN feature=20
> > > >> descriptions
> > > >>
> > > >>
> > > >> CAUTION: This is an external email. Please be very careful when=20
> > > >> clicking
> > links or opening attachments. See the URL nok.it/ext for additional=20
> > information.
> > > >>
> > > >>
> > > >>
> > > >> Hi,
> > > >>
> > > >>> From: chia-yu.chang@nokia-bell-labs.com=20
> > > >>> <chia-yu.chang@nokia-bell- labs.com>
> > > >>>
> > > >>> From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
> > > >>>
> > > >>> Clarify that the VIRTIO_NET_HDR_GSO_ECN gso_type flag does not=20
> > > >>> mean that TCP has IP-ECN set; instead, it identifies that the=20
> > > >>> TCP CWR flag is set and will be cleared from the second segment=20
> > > >>> of an
> > aggregated segment.
> > > >>>
> > > >> Above text is seems to be clarified only in commit message, not=20
> > > >> in the
> > spec changes below.
> > > >> Can you please add it in the actual spec wording, including
> > requirements?
> > > > Hi Parav,
> > > >
> > > > This is to fix current error in virtio spec:
> > > > "VIRTIO_NET_HDR_GSO_ECN is a flag within the VIRTIO_NET_HDR
> > structure that indicates the TCP header of a packet has its Explicit=20
> > Congestion Notification (ECN) bit set, signifying congestion in the net=
work"
> > >
> > > I am unable to find the above cited text in virtio spec.
> > >
> > > Do I miss to find above text in the spec?
> > >
> > >
> > > What I read in spec is:
> > >
> > > The driver SHOULD NOT send to the device TCP packets requiring=20
> > > segmentation offload which have the
> > >
> > > Explicit Congestion Notification bit set, unless the=20
> > > VIRTIO_NET_F_HOST_ECN feature is negotiated, in
> > >
> > > which case the driver MUST set the VIRTIO_NET_HDR_GSO_ECN bit in
> > gso_type.
> >
> > Yes, you are right.
> >
> > > > TCP header does not have ECN bit, and this flag shall indicate the=
=20
> > > > CWR bit
> > of TCP header is set when doing the GSO for the first packet.
> > > > The corresponding texts in RFC3168 are "When the TCP data sender=20
> > > > is
> > ready to set the CWR bit after reducing the congestion window, it=20
> > SHOULD set the CWR bit only on the first new data packet that it transm=
its."
> > > >
> > > > So, do you think adding above texts in the commit message is ok?
> > >
> > > Yes, but only commit message is not enough. We need equivalent text=20
> > > in
> > the description and in driver + device requirement section.
> > >
> > > Something like,
> > >
> > > When the device is transmitting packets of gso_type of segmentation=20
> > > type
> > A, B, or C, and if driver requested gso_type of HOST_ECN, the device=20
> > must set the ECN bits in the IP header and CWR bit in the TCP header=20
> > in the first data packet of the TCP or UDP segments.
> > >
> >
> > I think the text changes are already proposed below.
> >
> > Or you can refer to my original email for better comparison:
> > https://eur03.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fyhb=
t
> > .net%2Flore%2Fvirtio-comment%2F5f1f310d-8a17-414b-ac70-80028832a78b%40
> > nvidia.com%2FT%2F%23mc1750dcc26d74c9b19939c4e86dae8bbade6ec78&data=3D05=
%
> > 7C02%7Cchia-yu.chang%40nokia-bell-labs.com%7C2db0adbd1fec45d22af008de0
> > 0a252ae%7C5d4717519675428d917b70f44f9630b0%7C0%7C0%7C63894889434827775
> > 4%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIs
> > IlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3D9=
W
> > 4P5JaFU7sBOhC7C6jqpo07Xp6TrkrcgIIIJkJtkZ4%3D&reserved=3D0
> >
> Above link indicates to follow the requirements from section 6.1.2 of RFC=
 3168.
> Section 6.1.2 largely describes how TCP state machine to set the CWR bits=
.
> It does not describe when doing GSO on tx, how first and non_first packet=
s to be prepared by the device.
> GSO of virtio net is stateless operation and segmentation does not intera=
ct with RTT.
>=20
> If I understand it right,
> The requirement from the device is that if 64KB segmentation offload is d=
one with mtu of 4K, out of 16 packets, only the first TCP pkt to have ECN a=
nd CWR bits set.
>=20
> If yes, then we need to spell that out in the virtio spec requirements se=
ction and description.
>=20
> Similar wording to apply in patch_2 for accecn too.

Thanks and Yes, your understand is right.

But if I remember correctly in our previous v5, one of the reviewer suggest=
ed:
"1) It looks like the GSO requirement is not explicit described in the RFC =
3168, so if it's need to be inferred from that RFC, it's probably not the c=
harge of virtio spec.
2) If GSO requirement is clear in the RFC 3168, there's no need to repeat i=
t again."

The email thread can be found: https://lore-kernel.gnuweeb.org/virtio-comme=
nt/CACGkMEv2VQA6E6JjmC4jf+oHK9np_+FJzJ_5i4Td51FCYu+iPA@mail.gmail.com/T/#m2=
c34446bdc71be042f0cef5dd4d30becd323f55e

So, could you suggest which section we shall modify the virtio spec?




