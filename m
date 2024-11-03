Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2083.outbound.protection.outlook.com [40.107.220.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3660D800
	for <virtio-comment@lists.linux.dev>; Sun,  3 Nov 2024 05:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730610943; cv=fail; b=XKWtgOVPBQXsc/K8Sk+shRdmGVitsgt7FVIKHkandRurPSkHf4MLAyLqcS0Zen8vPV0RLlmH9OV0fafmqWL1yyUJR9tTZvR4pbx8YXVk0qy8NPIhEw8+DTip0M72Zuj96Y0jw3pIz7yPc0rnwOTqSP+oWAcl9FWKO/zdWmX214E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730610943; c=relaxed/simple;
	bh=QAEDFHVdExkU2Fk12OmESFXhNxrlqdkbfr13qIagHvA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bEHClR3gFiD4xJigF6xlmTN+KtyJ7L6yBwFByWrPY0ZOKvQj/ClpmXuQhL3itmqzrISXQSpjVvt1ZGe9BTW0XRkdI6BDXaYY57BpZybvBeclgHYK61x6iz59yuKcH3JAy2KfBMmLmUTFbL4HAaozcAiKz23xt+neJG37neXTCt0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=tjGB2Hns; arc=fail smtp.client-ip=40.107.220.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="tjGB2Hns"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=spq426CK1EGl0VF2rkfM6ywCgOumrBbyezxvEuUqQNrus7EQV+BBdEvitCmpkADBK0jr6NV84HurfrS+vvFgpFTd5Kbs5ir/qrKfHOBVqP3xZFtufmkUp39ulGwFx/qt/JI4DTsYDyEL12YW+Fpq4XgBRf7KFcVQS5VGHQ4N1+klQnhfM6fXgM0E0gWNrNGqrjIUmIK4wpMGa5cqSDB1bfRG4gD0ENuPgh1Kcvc32pSEXBi0gQ4p8Cna5rsLoxI4OIyvn4OVtxEuPwQxP870A3jPQ/7H3CQdsuE/oKVJ8Gy2WIOlcMWbca8y0AO7JU72jC4TJH77icqqj0RlN2TSNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ueqjDU5Ll5eFgvx5RvhAkfBKjsFsi9zpedDublFzLhU=;
 b=bX7UzENQqKomrwFQ8qTU08ddoI62s4TNy2NvvTV+WbVSnNYzG8AW/+zIAbvxANCATWPjdmsDnZXzqBfnlUSxh483P+09FYoj+htpO6GDThfYA7sjH+WBitBnkEaaq423yvzovfmSQUBVC5HJRsPVYng4OiYGjD/eIlfE/X10tbpfZ8lPIGdDuwd6NM3GowVf+2qjvlYIAKSzWEyED5VDiNigTpPkt6tMXYLMBsh1kzxK7kWlCvTYV8vBcp2KiSTtgYrHGyYidIOLwrmTWtFRMSPFlNSfVfxFRAe67GHHlBNs3JoqcvoL4PQrGK9SNMjjLiAB6Y1EwnzfFuaqcqEXKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ueqjDU5Ll5eFgvx5RvhAkfBKjsFsi9zpedDublFzLhU=;
 b=tjGB2HnsCTbMreLsTUbXD7IOQ4WPpSV3kntILadZuCiD6PrA7ny+OEHRoqYaV2sxvIdEY1202fKDwi952eCo9YYj6xMpMH0KnsZkjNVAwY7wDPWctfRT2A9p0K6+lOZNxyPoKOpr5U1vaC4iHP+CCQ8PfiZlDHdzxuDfikOBHh5P8K+u+vpAVdArKbNCbIjqXYPQknegjtPBlBDRKVfbtIcfSUVVjJoctanV2lwnJh3dsq9KOo5xVw9AbF6fDGHr6rM5WLgs01uno469w6W/EvHOVrg7b8rBkhUGx3CHEYpqROUvQ/dFpSrGCl+v3VxNAQkJcQuxgMTRVehz1sX2BA==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by DS0PR12MB7745.namprd12.prod.outlook.com (2603:10b6:8:13c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.23; Sun, 3 Nov
 2024 05:15:35 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd%6]) with mapi id 15.20.8093.027; Sun, 3 Nov 2024
 05:15:34 +0000
From: Parav Pandit <parav@nvidia.com>
To: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"mst@redhat.com" <mst@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>,
	"mvaralar@redhat.com" <mvaralar@redhat.com>
CC: Shahaf Shuler <shahafs@nvidia.com>
Subject: RE: [PATCH v1 0/3] virtio-net: Define cvq configuration related
 device parts
Thread-Topic: [PATCH v1 0/3] virtio-net: Define cvq configuration related
 device parts
Thread-Index: AQHbIuUcyic5cbQ3fUmq2WRmML0oPbKlGCDA
Date: Sun, 3 Nov 2024 05:15:34 +0000
Message-ID:
 <CY8PR12MB7195C35953E319E1881718BFDC502@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20241020114141.451478-1-parav@nvidia.com>
In-Reply-To: <20241020114141.451478-1-parav@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|DS0PR12MB7745:EE_
x-ms-office365-filtering-correlation-id: 0a79eb54-22e7-4a53-cc44-08dcfbc68bbf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?p9LvGr9bye8pt+t8oJrTyjwWYPMHhCImtNOgy9MGMf3zaB0GPFHx4zBl+rNz?=
 =?us-ascii?Q?gtRSQV0ILiYSpaWsomy11y/6T5YmYjI/q4wTeNxfcbAs/PnuLiTG9nG/qWY+?=
 =?us-ascii?Q?eGemODpRL50ICAMbGRA6KCkIvrq6nowTCsFEfdcvyZOVTRrYbOnlw0ridJrx?=
 =?us-ascii?Q?pl5Tmlf0e4r7jYFNU0n1fxSC8aVxMh/zSmS5QxoXxbjkdFAdxwqJ5TFnKvNa?=
 =?us-ascii?Q?szPC1VyJslQrbNTLt11+iKcHQU8wsygu7XU0VuA6Qu+YU6v3KEN5pt1+3/Pj?=
 =?us-ascii?Q?y6uynecc0tcRTkJx/t7ivpevAYCW1fkmjlFqImss1EhG8bXJfDEak2EM8vFJ?=
 =?us-ascii?Q?YK90AQzalV1pkYvPjPZfz/qn8/aHP1aDYNUa3732sqEQJ0Y+//1S35hlEPlB?=
 =?us-ascii?Q?zaWciVKzN/+rQ6j21wM1VodV0XSSkSAPI7tuCzq6CY8lF0pcyDMtRFNvdcjQ?=
 =?us-ascii?Q?nVA0/inafUw6Lp3AKza+6JGzMYHD69mgqPKbk1ruAWIyZdobC4L0s1p5DIkg?=
 =?us-ascii?Q?Gdpdms5zrQ7YHPqzc/NwMNAclMItbg08VnGRM7RMhyTy/Z/B8ACdT5yh9RNz?=
 =?us-ascii?Q?YXelFufPa9bNvoGRCBXAveB/YUS52ZK8N0gKGv8aUIBxcrgf4wQJgg7GntPY?=
 =?us-ascii?Q?uulBt+OK8kE+4cjNW08gU1Egr4aGT6vyDtPRmBOSjHS6ENxVY0gw4G4UU2Tm?=
 =?us-ascii?Q?BjmHHPAY4xbWWWFst8iVvrIo6TEP3PnOibfxR0FT1svSNpo9OVg+N+FMuEIf?=
 =?us-ascii?Q?GnAbzQLL6BM9s+M5A3Cr4tVBE1I9KzqybE9TRGqrXjPj0TjRy6se7n6C9apX?=
 =?us-ascii?Q?II74Od5hekE2xjrHs2jG/R0Uz3rcHuP9/lrJ4nZTzFn7PHE7QYSqHSDi3UYO?=
 =?us-ascii?Q?P1SBS+GcqV0ddWYv5Tc9SIeF+ZQLttkFOunpCmqQ3W8yk5FKBazj5LHy+eR3?=
 =?us-ascii?Q?6H/z2fE5KlHbKLweo1Nlf/HihyCJcgtBA93XLIIdbiqcCOVhgRRgmtYSi0U1?=
 =?us-ascii?Q?Z346IiqrBbdZz2oWZYzLEFc+IHhwKE3anyscl+P3fGtE5ShGlcrcMCICqkOE?=
 =?us-ascii?Q?wRx/5DFClkXTnWwRUgUpYL6J8BajAHNlKxHuzAV4hDSeF+liLDG7Ngtlz1nj?=
 =?us-ascii?Q?Ll5zZBcCRRyxb8uM5+mm5pPENAXEeuJxnPG19x7MKuYvXxUYmNuUKnxtnifX?=
 =?us-ascii?Q?rxCbkcbq7jyv+Vgdd1Ce8DCi59x/QW/+1lCUULHauYwOt3hFPQSgCM1gd0MT?=
 =?us-ascii?Q?D2xo4UaeWjFLrKax+U8vXDcM+/fsBR0Hj3SKxFWa6uZpKBKBSFpmHEcEgtdw?=
 =?us-ascii?Q?ZZkP/6DfrP57n3hF3th20BRT?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?lTAxflsQwFzowp5IDQwDg44l3HE65DxL7V1tCgiJJdXpvTYyia9I4I66DbPj?=
 =?us-ascii?Q?o8DOfLKo8TkaCztPyflvXCAnnhqYjlo/RSYEEXx+7XR+phrQ7A8E7V7vMrQj?=
 =?us-ascii?Q?3xDXK+7J86knbB7T+yV6jZQE3Qtqx/QzNtgL0WscyWO6sU9Unv2EkG3JLFUb?=
 =?us-ascii?Q?wBubXTT5D70Aw1YrX9NSPyqw4nC3lFY1/1vi/0yq5foJY0x7S4oAIc36lAt0?=
 =?us-ascii?Q?1PKfvi2mhtfJtttmeghKGFJnnARQi544y6m31a1dtTTS6terN6YgKAW8aa74?=
 =?us-ascii?Q?sPe7R/ZEyWZbVOEzor2TxcJ8T1OkdFpxpPTAyjo3piFskieJBQrCUa4ZLJc9?=
 =?us-ascii?Q?OiMcSneQpcjXnADywTiF7nuKlZzwM/DlgrmtreJOksT2P4i5zpoVo5gwLyG6?=
 =?us-ascii?Q?QFid8bqB4npRP5SgoOSbpNP5jX3V0jY9i9WDIRDoFMVXufcxsF5bgWMl7wQr?=
 =?us-ascii?Q?YnI1e3FGOeRIe/UHUgKkzeS//aUWCqY9GuRkUot+UVxyG5SX3p+gSe8Nl02U?=
 =?us-ascii?Q?k39nzM/gdIt7zyWniszkugvoo9t+vsrlFfpLwS3qvMFo+ZN4mmNazdWeB/ZP?=
 =?us-ascii?Q?B/1C6UgXq5gmc6nqFNlI/d8dNCVREXdeTQpskgITkf5UGdZWh/L9Jcc43rTi?=
 =?us-ascii?Q?wSom6EuVHGFomjObmuK7WCAuJnkhDHKyZsXlipkBTGMfCYhxnS+JyGCELwTL?=
 =?us-ascii?Q?g5T9Jz/V4tHZOm/sGCf9RSLFpj5AhpZMbCMo+4tWyQeJQL1yJgbqmFIyi9LV?=
 =?us-ascii?Q?Iq+2wagpT4nqyxcU9COAvbPWX1sdCl1y47Vb1GObO/BQDxYyk6msCDaWhDPJ?=
 =?us-ascii?Q?nPPJ01G528x96+qLO6+IMuA+nH6DMCmVf9TjQSt0HQwdDhcMpUBG+9d4CHi+?=
 =?us-ascii?Q?z28zxEgJ/Fp0Z/aomdRf9vXVvS52Zhr+tmFi3XjoFcBb04UgLnxYtOYrcqkI?=
 =?us-ascii?Q?OiGjsvLY/M7g6c0flIvdnMMLEZqy/PtVrCVreAcA6tBPxdduNk7CUaXYqhCL?=
 =?us-ascii?Q?gO353UvvD6ayVKogt6U2e2PDxEf/1dNi8H+SNO2qUOgNrQUVZ6Q77R1D536J?=
 =?us-ascii?Q?+vuuoOmD0ZluZrzoQltlWTiYoCLaACAPnni9moBT3uFNW0XLXYSke6WsvfUL?=
 =?us-ascii?Q?13Nxvctfa7UtWKRULgzRi3Os6a+WTfMXWg1X8odaSbyxarh5kngj3NUuQ5PI?=
 =?us-ascii?Q?I4b30qO/XQ4u9/vZ3GqGD0m5HecQXvdomnb9JdQ0L2LZSion/DUYqWVpUxjd?=
 =?us-ascii?Q?JOLFKUyHuj5vT6vysKx9NqCn/hehuVqT/62QwEn8P6D1trvzUmVLgPdusPp/?=
 =?us-ascii?Q?PVLna7hy6IwAsU2UkXqWKxRaaGdmPSZ4h1mMC2nSb9nCP2jcD5DKYHOo8vRW?=
 =?us-ascii?Q?3mAqTvCXuTDqtBB8h5Oshr7gRjhtd0TyXuc1nNV7l608eFfoUJ+OQFegfuBR?=
 =?us-ascii?Q?1HqItH42D/CrAEP4AeLu2d6lriuRKBNSeEPPpz9bh8AvGM6PF615fMBXkdfF?=
 =?us-ascii?Q?OLnoW0TYsM8ArvFrLBj/JCIIxPVEQGn446CNhQJDs4CEBUOcoWX3Ufnw3zQy?=
 =?us-ascii?Q?AzemLitxmfTYFaX7Jvw=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a79eb54-22e7-4a53-cc44-08dcfbc68bbf
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2024 05:15:34.6187
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8QJWHYnedi2HoEWgK+YdcU8FzEnIZ/Yv2aY0Zwa6lybOd/R8WWhexjksziluiR9/C7azo6F7w1rBg1894WhyzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7745

Hi Matias, Michael,

> From: Parav Pandit <parav@nvidia.com>
> Sent: Sunday, October 20, 2024 5:12 PM
> To: virtio-comment@lists.linux.dev; mst@redhat.com; cohuck@redhat.com;
> mvaralar@redhat.com
> Cc: Shahaf Shuler <shahafs@nvidia.com>; Parav Pandit <parav@nvidia.com>
> Subject: [PATCH v1 0/3] virtio-net: Define cvq configuration related devi=
ce
> parts
>=20
> virtio net driver sends the control virtqueue commands for device
> configuration. Such driver configuration is currently not captured in the
> device parts.
>=20
> This series adds several of such device parts which represents the networ=
k
> device specific configuration.
>=20
> It is done by utilizing the existing device parts structure.
> A new generic selector format is added to enable device type specific dev=
ice
> parts.
>=20
> This series also reuses the existing control virtqueue command structures=
,
> fields, and values to define the network device parts.
>=20
> Patch summary:
> patch-1 fixes a duplicate part name
> patch-2 adds device type specific raw selector
> patch-3 defines several cvq command related device parts
>=20
> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/209
>=20
> ---
> changelog:
> v0->v1:
> - fixed comments from Matias
> - fixed spelling of selectors
> - rewrote description of selector without writing the actual
>   part_type range along with description that it is device type
>   specific
>

These short fixes and improvements are reviewed now.
Can you please raise for the vote?

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/209

=20
> Parav Pandit (3):
>   device-parts: editorial: Replace duplicated part type
>   device-parts: Add device type specific raw selector
>   virtio-net: Define cvq configuration related device parts
>=20
>  device-parts.tex                 |  7 ++-
>  device-types/net/description.tex | 90
> ++++++++++++++++++++++++++++++++
>  2 files changed, 96 insertions(+), 1 deletion(-)
>=20
> --
> 2.34.1

