Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2088.outbound.protection.outlook.com [40.107.220.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C46341C62
	for <virtio-comment@lists.linux.dev>; Mon, 16 Sep 2024 09:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726477999; cv=fail; b=quT8x0AoAPjBiMVE4ymUWszQJ8rK2xp5nwyqxYJa6D/MPNml/DaTGAqvqUVWzTNM7IiOdi1zUJDANZR5/sMjRrA84NuJdRrycDpNvwBo/QrlM6+mU1lXN64UJMrEP7nNwBakcztLRJr7t4wezJqO4RCYKEk/jhP7zzObgJobihk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726477999; c=relaxed/simple;
	bh=aWLoov7W/cSfgFIPEToKvI7u4L+nTN+xMWNEZEM7V5w=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=oK3ZM2e46W3tGoFOFqgIaDdmtD1Xe3E9LReHAgt9enKJLVqsT4NaYz0fj+svETP30FG81Di2Wvrn5UDxT0SGX5TiqZd1Z9sLTxnf48Et3pZO8AfC7PUx3a5bd7Qc6unDdoEahBq3ffZeyYHlwXcrHdkCfs39iiQWQIfxoaTQhjk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ZU6+YmBb; arc=fail smtp.client-ip=40.107.220.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZU6+YmBb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y2yLJ/D6C7/fZX/3irAlU1vR29fghqBa2ylAqWze0NnINn+NuBJAkbkrsY7BDc13wWCXmc/nedqK4umsV5o/1kwNBPUHgqJoTRRZG3SLEXHk6RhZ+5Tae3hTkJSZudqaNAUCl83c/5kGAR5+VCw3143vVAyAXCIKC79kAFWB3bO2eo8x3055BKvlWU/bQ3OIhhA8ZHVFpc7jsJs5voQ8zpfTbw6kthGJ3zIy+o0mSvG47fFBBXgp20fZvtocnZpFdrbmylJkBmmy9qvL4xNVcfMA88p1sEPuOkGt7Cr+KnDl28eDUPYgejgq/+HonPnfs7CeJt750MWc9KYJ0tjWLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TA0jtAaRMCH8ql8gBJy0fdNWmquEskwC0LTvSdm27kA=;
 b=pxrG5xiAtIbfNpk6MH6QJ1O9BgUc4sGScBvzFLeqMadWc23ahZwJUUDAmtlEtGqEC5W7MibuZOS3uMykg0kqofuky5MPBxDahc3q1oGo8Fwjlyv3GQG8uuJgvYPpv+HqpzFC7Cs9EsHMG1p7H6oxDTwhKk6TY935TfFyqluUQXSYB3/QsWfUIFoXc8K40vOWYaEnM/ec2tei3i69Qrgb7sAgbc55Imki4OfUdTIkpNxwNHjYGrDCR2//i50iAt5Lc3w+2yJdRCIMfUswYTjr1h/JLIleAXTThiowzHJIvrbj+8lft07i2zcsQXrYdIZxL08DxOWIWcitU7QdYaX1Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TA0jtAaRMCH8ql8gBJy0fdNWmquEskwC0LTvSdm27kA=;
 b=ZU6+YmBbNtAcWMyonFHY62Pk62nD8W8EoUvoVFAz8IhfP8BpIyTWeuLh/A9HQ171okWhMvyrpVdHUbQba9wujMl0jvKrtiY4YlBQjKABPBPuyrg35tNXsau8uatQjGFF9TnlmvxQhIuY/3JN+6AM/vOeDy6/dBzY3OisDCUaQtHOIvVn6ngrGse7+cv5eyxSJGtmLaTdhSWVsv/0jfx7XhSQmAirVWY8Lz0Lxk4FZEdx2zWGCOSSS3ep0B5cBpRlo8NpbbsE3ZoP6fkA9AQYucRsggVFwKtPyFUmGjE6vgeB3ONM4hr/bxdstDMw/tuFPUJcYgMGlFNAOKTIRYcUKA==
Received: from IA0PR12MB8713.namprd12.prod.outlook.com (2603:10b6:208:48e::7)
 by LV2PR12MB5920.namprd12.prod.outlook.com (2603:10b6:408:172::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.23; Mon, 16 Sep
 2024 09:13:13 +0000
Received: from IA0PR12MB8713.namprd12.prod.outlook.com
 ([fe80::9fc9:acc2:bdac:a04a]) by IA0PR12MB8713.namprd12.prod.outlook.com
 ([fe80::9fc9:acc2:bdac:a04a%5]) with mapi id 15.20.7962.022; Mon, 16 Sep 2024
 09:13:12 +0000
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"cohuck@redhat.com" <cohuck@redhat.com>, Shahaf Shuler <shahafs@nvidia.com>
Subject: RE: [PATCH v1 0/5] Assorted editorial fixes
Thread-Topic: [PATCH v1 0/5] Assorted editorial fixes
Thread-Index: AQHbB+XG22bbSO6HhUGnjAsPwWCkVbJZvB6ggABavQCAAAqWIA==
Date: Mon, 16 Sep 2024 09:13:12 +0000
Message-ID:
 <IA0PR12MB8713D569E4018FC92CE7D365DC602@IA0PR12MB8713.namprd12.prod.outlook.com>
References: <20240916030835.68178-1-parav@nvidia.com>
 <IA0PR12MB87130A72951032F2936544B1DC602@IA0PR12MB8713.namprd12.prod.outlook.com>
 <20240916043440-mutt-send-email-mst@kernel.org>
In-Reply-To: <20240916043440-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR12MB8713:EE_|LV2PR12MB5920:EE_
x-ms-office365-filtering-correlation-id: 514ee703-142d-4e8c-68ae-08dcd62fca82
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?3hvMr9RQV/sLbroxyjYGe/sRGi30Ya/26D5TUvXbCj+5eL6xIboKL+3/976N?=
 =?us-ascii?Q?bU7MgRZoceiuCjXTgJMhS2kFz9d0AurW54U8LZ2/0vr1sQvV6wzopCYtvNuE?=
 =?us-ascii?Q?pW4qI+YYsVmYITjFZdRK0h0iu7Qa5k+B6VWtvHYX8C5g6oLMjb5YAkZHtKLn?=
 =?us-ascii?Q?EMLYlD8RuJGhO9LHsy5Tty/AbiMkiu9hWWaBq2buzb/wTgnjKmLci3rbRsf3?=
 =?us-ascii?Q?3L9ZgsRYtaK3MUdkSSQAKdRDWyCjaToYNmpLEh70wGloTYLyT6jVSfdTPmKw?=
 =?us-ascii?Q?0ne1PZ29WcpRvrPpWt62gpJ8Mww9s+03jdF3B++B0+X0SdukFDm0YCdrfT6a?=
 =?us-ascii?Q?62llXGLypjQfEoZXU8nrkxh3CT6+nAPMskatqOtnEMmTDusgs5yBfJN4we18?=
 =?us-ascii?Q?QT7YRLbUX7Rx2wMhqfNaiPpnGkkD+2uZAXEs6nQdftpa1ML+REzbP23jGwKx?=
 =?us-ascii?Q?BEQixZWjh8UBIBoGNU5tpp+xQsa6WcbebxuDGydQ1JGzjUX/+gRjdIpvd6U6?=
 =?us-ascii?Q?Lz3Y9V9346552Qb7y84m7EBgtfjBzrupb7pfz4UpRX1sRvstmX1FOEOHIdbB?=
 =?us-ascii?Q?9LWAyMnAzCjtfT0y2r8MPwvxrWblpfQ+CnxBpNmPP5IGF3mP6OTDXbNu4TY9?=
 =?us-ascii?Q?r2s3ARwELyyjoCu/PVqLPIGDwdzLi6+luHkTrolCWlP+sztq890GynLMTtpL?=
 =?us-ascii?Q?a8l4GvESirWjm5ODn5daVNdJ6VdSsGJdnH3s1Zpg3sWUocEjPQ/7eBydQW1e?=
 =?us-ascii?Q?BI1ZJd9uqSbJgtQkoj5fr2hld1opEs3Seb6cY3XtCbb3v/x4w/hRK2wy4JCH?=
 =?us-ascii?Q?ABH99aqvLfMvRdVIawI2RZOeMLONbCA3ZP2cVuFAfJXLpJNbRwSPc11WtuKz?=
 =?us-ascii?Q?BU9xOHbDvrsBsX7Gt1XaOAZdqK18bcUz009w7sJIT8VJqyIDMD0uaFrAblVP?=
 =?us-ascii?Q?vNlrk3u69PUijRIwxoUiS38aYgKauifWkATZNEtkf5luKcWZppNgtgVcT7wT?=
 =?us-ascii?Q?EdXecDJGVSIfDDf675bThTFSQQjjbyKDpi4zichGEvsIul5qnJd0kYifmUFL?=
 =?us-ascii?Q?xnhtN305IbSPcrKqpkQapNfWVLlDE6uAYPzFNyKFQU1ZvZG58A0VZwdKULKq?=
 =?us-ascii?Q?y3Ipu8BRH4ovQb5EMl9YcZ2v6t8ZyWmfL6ihldcxCeAFoeEWNsDnUtzP2ZPO?=
 =?us-ascii?Q?SXcPKD4GuGDchy3iqVpqO+fLeymeFyRIm0nMjiVRQUJd3UQW6fIFHo0mRpt6?=
 =?us-ascii?Q?JvQsSs1dsYbbN9xKEWxG2SBNqSdpwRccPXkQkEjWtZTg1/4SHygfi7/afl4p?=
 =?us-ascii?Q?DBIHa+2LHRU4gSJMBay+OnKNJCWZ9H0csQTi3FTkaiLrZBeg9lLfQsPplQlK?=
 =?us-ascii?Q?6aIMIz4=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8713.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?rdx0yvFxA4ic2q7rcRGYh+wLkwqXCUnVND8DOs6jUkLujEj86D9eLserkkbi?=
 =?us-ascii?Q?xGnR8ABnL5N5ILMY+IcH09Y3+6Xiqq5r8iYRgLQ6Evsl/c7rTcYqtDhyE17T?=
 =?us-ascii?Q?dhq6f+JQzCTf/+ItLalZWyy1mwL9r5f6w2+ZlyZJQogN9KZCB7c5fsDD21ns?=
 =?us-ascii?Q?ZesVE2nYxoTydf7fEsjOKThMrzqhXpy8NQ50Dl96UYcSzJs7s2sfjpqY8+BF?=
 =?us-ascii?Q?Xwqf/oS5AGAT331gPkE6g1WhagbAI5qRgvMk9OUjzZQxmRpaHB2JViSJnla+?=
 =?us-ascii?Q?zLxrJ03enjSPyx4URO5sWe70jCFJionkuvwi3g6iX7299u4zSxb6h0pCcgvF?=
 =?us-ascii?Q?CIEEAjlqjeEMNf+fVrjWlXpcKWavHEioi9JZPJTxnwu3BQPfJAJlLefnIyUN?=
 =?us-ascii?Q?tDlNjJeg5X6f5cNDi1GxVqaYQJ/NIQAgv/BdjZmNfWO3fPPiGqBGlBuapEsb?=
 =?us-ascii?Q?e9O8vPiqavr6KMmuI7nu8UU1njCVKPzMINIkBQcNdJDnkDdQGRBrdkn3mB8F?=
 =?us-ascii?Q?XCiOctpmlnRtDlRd1gZZIi56FhdHp6nBTwDQaZWB+L/J0iXyL2XD/zq3F5ib?=
 =?us-ascii?Q?ATQsqu7213dYxfef/3+qnGyhNwAZjQFVWgOvBvEnKr4o30EE7ddfbO/xpwiV?=
 =?us-ascii?Q?fn+SAxSUFCOk1hWN0pEbYw0WMZoO1/j1Y7c4heUqi6wXJfjUY77vdNb5SsEX?=
 =?us-ascii?Q?Ap1sIQQ8I7bHAYCItK0uFudC74iaaSscrgBc0ZH/9DwjCsAeGsdCcFuYPbUR?=
 =?us-ascii?Q?ud4R6hwOQRaxlIe3MdoXQIo9yb8oyDLWhrcUFpwTRyT3YUSLYRa+5mw9wN21?=
 =?us-ascii?Q?D+eXG3HJtvY4Hkdn0zMvlBKUGBbyJutHgpJIN/5iQvOtinDIba7f36ZN/0Nl?=
 =?us-ascii?Q?zWoJf9SN1PKfyK5nzA4lH0dtxzUU222PYrXOFwUk58z20kGLpUkcwkef2oC9?=
 =?us-ascii?Q?SaTJVA7339xGLV7ocdAWFSu+WvewVP8hnvbF57BDVWPf5M+QYr/uud+SzVNn?=
 =?us-ascii?Q?D+wc8tjk7Y7Fhxt52O/1Rr9qfz7YUyOV4BXKZAME9XrY3g6UoSQhffXxl7E7?=
 =?us-ascii?Q?FpPiCrjFTtcwnSMBDt1Xs6eEvtBxl69sS96uLRlGQ4GtRqkG1Irh7VgQuLzE?=
 =?us-ascii?Q?CoDApnxXqrVX8uiT1wbffCrvycK4FYunat9RNitjxQ6af8vakZZm5BUBEeqc?=
 =?us-ascii?Q?HE+rGHF+eOrBPX860h8hbG/QuR3OiWdFi15goq+MlK2BAXZWz0no+Ez28qKu?=
 =?us-ascii?Q?j5MjWQEaLwaZVZrvWgillQS9LvfWFb+LWjdYbTIwyZ/gAbTC/ZLoQQ27ciwl?=
 =?us-ascii?Q?Uf2FbvozDiDuwrE9qrP6x5fX1dTKwSXfSBYvJNIjwGNJ7pNUDXLIbvN0+XrC?=
 =?us-ascii?Q?fFGhKLOGvROokmGOu9zZxPG2baJXOgErz8Mu0Vq/HDk7QD41mt+5VWTsRNQS?=
 =?us-ascii?Q?21doa6utyubinRkLeSHNbRaCnV3ftRpL8zUcQiAMk8xym+zcy3HLA/+nGM4Z?=
 =?us-ascii?Q?YPQRg1PzS5TjMdy4APXWJ896tVZlR7egGwxeFyUqpdxVSjCB9L5LYbEsnUKL?=
 =?us-ascii?Q?aJa434yTtnCCnx7T7Jk=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8713.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 514ee703-142d-4e8c-68ae-08dcd62fca82
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2024 09:13:12.8572
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UrdqG1PuBHfIJEeq9VuAGRUMnQjR909vDVx22quE5Pdryua2mP+Gqjb71oML4JYTKTML55dilNB/ms6OGSsS1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5920



> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Monday, September 16, 2024 2:05 PM
>=20
> On Mon, Sep 16, 2024 at 03:11:10AM +0000, Parav Pandit wrote:
> > Hi Michael, Cornelia,
> >
> > > From: Parav Pandit <parav@nvidia.com>
> > > Sent: Monday, September 16, 2024 8:39 AM
> > > To: virtio-comment@lists.linux.dev; mst@redhat.com;
> > > cohuck@redhat.com
> > > Cc: Shahaf Shuler <shahafs@nvidia.com>; Parav Pandit
> > > <parav@nvidia.com>
> > > Subject: [PATCH v1 0/5] Assorted editorial fixes
> > >
> > > This series covers assorted editorial fixes to fix name, adding
> > > missing struct and fix spelling errors.
> > >
> > > changelog:
> > > v0->v1:
> > > - added Reviewed-by of Matias Ezequiel Vara Larsen
> > > - added github issue link
> > >
> >
> > Please open a voting ballot for these fixes.
> > The github link is:
> > https://lore.kernel.org/virtio-comment/20240916030835.68178-1-
> parav@nv
> > idia.com/T/#t
>=20
> yes but everyone is at plumbers/kvm forum.
> Pls request it in a week's time, ok?
Ok. thanks.

>=20
> >
> >
> > > Parav Pandit (5):
> > >   device-parts: editorial: Add missing struct keyword
> > >   device-parts: editorial: Fix metadata type name
> > >   crypto: editorial: Fix spelling errors
> > >   gpu: editorial: Fix spelling errors
> > >   common: editorial: Fix spelling errors
> > >
> > >  admin-cmds-device-parts.tex         |  6 +++---
> > >  admin.tex                           |  2 +-
> > >  content.tex                         |  4 ++--
> > >  device-types/crypto/description.tex | 10 +++++-----
> > >  device-types/gpu/description.tex    |  4 ++--
> > >  5 files changed, 13 insertions(+), 13 deletions(-)
> > >
> > > --
> > > 2.34.1

