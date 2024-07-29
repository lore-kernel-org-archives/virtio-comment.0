Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2088.outbound.protection.outlook.com [40.107.237.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D81892B9A1
	for <virtio-comment@lists.linux.dev>; Mon, 29 Jul 2024 05:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722229481; cv=fail; b=J7D84FLUAUp5nF7MOtD3WesSunrhI5feXZnDxcgtbp+5DQZfcHidj8KDTegqD/1o7LRdJ4DMV+WQPkIcExvDjExu2DiXayJhM3iaVsi3H6AoI0sZWJbrAtucYLCBsbwOwvBlEKKRZBs9nc/EwH4kRrWvjXqZQj3nL/5C6y4TJg0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722229481; c=relaxed/simple;
	bh=+3XU46YVXrmSLkDueS57lZ2c8yPd5vvwMishBCTTGy4=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=uTf7mCEkbi80HvhO7nziI2eJ5MAFblCD+8wMAUomf8ABXhqLEIj6VVqZgSlEX+TwirMGOpsl0Jsa6Z9ERlqt7Ubf50SSiEGr6bxk6f4ydxCrVdPa9EkWGRgoYDoRyRXUEtBFajVQIe/UhYSHgCbl87ZYBHt0vfoQWIlq0PmW8fw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=LU283ETn; arc=fail smtp.client-ip=40.107.237.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="LU283ETn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d/lAtgVdDb/XiyH+GVJjIXV03h6G0RTljpFRacG1j0d2uuXyUdrcFvQK/JfgSRvDJaD7JRlPkC+vWehPiTS6juJDvqXz2TyMcDCKRgTqv4LCbxXaorBtXbQ4UGsSKOosfqd/0ddt9gmv4AnVR9KZHdBqbOt91Jhq1kPmMtpXZS/1gWIh9Cp5EtPPcmD2YcV4qZG2kibUQ+1Hai/SW2SBM5Jt6QLWAQGsdBz7x3M1vaOMixU3I9cvS70hpztH+aQRGqGKQkrKvuL1Nj3Uf+Rc0BLleTj/Ct9/e1shMKtpcM/UrU06V0bRiZRzFPN7k+tndP9IZ4Hn0gx776tMQ1H/Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jQ2/inlTltr4M93MdX/lvQgK+B6P0AwKAgScLgw8R1A=;
 b=YTDI8SPstoRewkyWfoQMsrdcPus/t2E5tD9EGhdWkDl0Yv3QtMYccJpWIaleTSDamATW3WWUjeECM2QG3NphqZJCL7LwlLtCnPZfkS0FEwej+nSHe9xSbd57k/4N0m1RUvGSCW6Rw3opqSvadjsMyjm9SQEijqG3NGFWAQgfHr9E8CqzohpIAIIBapwvh3EZUKjeq6ksAMq/ByD1Dgu0lXvc5UuVBjtUWOFN3nyaoCR1izV8MAV1LCwS5Z4L2B5HOoT+s+ZCHM0TuBDM2qRC+xkmHJe+XAsByRo2VCPUaTOy6ludSauF5vlIILHzdnamXXazCbXLq5U3lnqZ6LeK0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jQ2/inlTltr4M93MdX/lvQgK+B6P0AwKAgScLgw8R1A=;
 b=LU283ETnQaBEtnk5pQ418oDG6pEZdL7Ak02RdjT+XH+ZqnoEn0R7nFtsueSbkhiMLolc/SjJVeFqRu+7+eFkH/lsEWNX6FgNWecwCJd5OSeKU22Mw3wq2SvK4oYcqDWjNqoe22qi+lnIa6KMpn0E+wShWunpI6A9Z1eXWmOx3jLtEKEN6H1zXkvcv6X3C1a39wHQs6LPJUvR4dw8PnEcglf+v+vUHjDzumbC53Lehsa4lByQt1aOE+2WD8BTG+VNwooDKRbiiKtYZ5e+NH+6WDWvsyH993kRCW4N2qg++XRp538eUz/NOs/FBpLiSB86dyflUeGuHZPjps2UHTMLkQ==
Received: from PH0PR12MB5481.namprd12.prod.outlook.com (2603:10b6:510:d4::15)
 by CH0PR12MB8507.namprd12.prod.outlook.com (2603:10b6:610:189::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.26; Mon, 29 Jul
 2024 05:04:36 +0000
Received: from PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd]) by PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd%4]) with mapi id 15.20.7807.026; Mon, 29 Jul 2024
 05:04:35 +0000
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>
Subject: RE: [PATCH 0/9] html fixes
Thread-Topic: [PATCH 0/9] html fixes
Thread-Index: AQHa1tcDU/DybVhHiUaZuiXTWjfCurINO6xA
Date: Mon, 29 Jul 2024 05:04:35 +0000
Message-ID:
 <PH0PR12MB548142C2FCF7E856295BCE25DCB72@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <cover.1721061782.git.mst@redhat.com>
In-Reply-To: <cover.1721061782.git.mst@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|CH0PR12MB8507:EE_
x-ms-office365-filtering-correlation-id: ab17910f-1d47-4a70-c531-08dcaf8bf09d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?usQelzo0KVP72hvK6llsm6WJSOykCDZDyepKCE3AW4neB332M9OfsAPS+KUB?=
 =?us-ascii?Q?7WRqRsKIaAYKtmtqI75XstOXbkn6kzcHaCuWtuw2qoYw8QYYlUFHLWWu0x0E?=
 =?us-ascii?Q?k6frfRJcyDDALM7Camz1v31v1eRRyYhC6xZ0RbX/zWVJGnXs0VbYUv+3tC2x?=
 =?us-ascii?Q?X9RZbCkA8KLsJe9u4rP6h96VYo1Zp2RAk88x17YLiH0emAMXoYivTHW3n1/P?=
 =?us-ascii?Q?xpfjw6JcRATpsaSFz1uwHtskyC5JdoUWt7QfdIKDakCRbPKKO1UC02XTjJEo?=
 =?us-ascii?Q?anXVR931DravnpxxuyrnC3PiHaInXRls62Ms9zV0fHPcII1Mh9g6MFxiflaz?=
 =?us-ascii?Q?606hnS7jYqS9haALQZeU9AgAbWsCxkR45BK3vMArlkIX9sEEu/V7L+Eckzmh?=
 =?us-ascii?Q?a+aYLxcTAwuszoinZcf5Of8oPF3a9Z+F1p9xNxuXkujDkiHF+Ha/S2yf3MfB?=
 =?us-ascii?Q?0bdjaqdUzcEkP7qstH4qbD/ePM1DQdfrS7jFtAJuOJD8aUKXo/4820q8Yh1p?=
 =?us-ascii?Q?t+G2XQ4aJQSMvCGiiz3C795EoGQ1/IQ1h4Ic5Ht3ufm+DF6uzCFAh2zgpK+P?=
 =?us-ascii?Q?w0pIebSkYr8+r8uZs7wPEFSNe0ifOOj3cEV8JZb94hX9bAF85tyYPPcKRSCI?=
 =?us-ascii?Q?nh14BkNQdVcK6Jvu1uNYhrQkyfuAPld2nrSjNsadGaNAnKvou086EqqkDaIp?=
 =?us-ascii?Q?1iCVpkW5auJkbPnKC7T2Qquzng7CT/x13qAonmtoHptpZk/Qp0mBxzaB/Hxa?=
 =?us-ascii?Q?jQoSZuRSVMXFBdyyrEcD81fw1nw+WRHrR/SRBSJ3RzCYNS36Jf+N3VSQcrrA?=
 =?us-ascii?Q?RqKub4W3xbl2C8wlSmJvfcEN2MvLF4w64biwUjNBwdI19zc9UbJY95kIzeib?=
 =?us-ascii?Q?OriyFyfN1YXNsAQUPKViB+G6KRuNVXjPnU7Pwl+2q4jeNQvpHliA7ZXmv/Wj?=
 =?us-ascii?Q?w1kr1LEIgvHAAtJ3DQY+pIJubazfFIbcQKgsoZ2Og0Mv+ulqH96wiPJQc2WQ?=
 =?us-ascii?Q?h04yqGYIZaQHzyLPQeyoCqtJ0FJhWv0+PIpZPkrtS5bDMnmuds0IE/P0dmoV?=
 =?us-ascii?Q?NOgnEK6TMYtWqZ7QLQ8Agxel2JBX0fSS+l+niJkbaX7B9xJTb8EadN1UKDiq?=
 =?us-ascii?Q?8XTfO8HyNSeYxsXqSQglWhDJ9dcRQr6I6xWKTN0n7nj0gBUrZmlzbX4uNlHv?=
 =?us-ascii?Q?G1qv+PUAL47xonzj6hWsXEdwHH1YSd6hS2wxm5PmJAui3qJbtI4An06ZWXZp?=
 =?us-ascii?Q?wyUTiLl4wyGv2UCC4l8NU64LEYMrGB37SCcw6QUw4LGyyyvW1LGiGg/Z/A76?=
 =?us-ascii?Q?eEWoDwwEtX1t0KaFg/TegGthlgSz3vBIbU+xeJGlHPn5Go/wtFJlCFoFmtri?=
 =?us-ascii?Q?6k1FubDnNjSptxvF4gou16OV3C7tHncdYBb+PhoS9Q4Oaj0z/g=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?ULxwF35xq3VQ7x1+kkok8lSalzNcBlXK/NUcghooqtmmEVK7MBLF5bA5+Dif?=
 =?us-ascii?Q?lUAc7XgxKyBNo7I/+oUKZ3Sx4a9cerVZ+wYMJ3tWKXn6WKxodi5kw4fTZQwN?=
 =?us-ascii?Q?lxH+Wa0dc20LdJYcHD+qSQAL0Es8FJCoH9i7VX0wCK6fD9dmwDLgqrdCSEUT?=
 =?us-ascii?Q?yPvwgPAJCnUPgwfwVLcvze57sRfoPUotmA2ITXh89EgMUsWenb7ut2DILp5k?=
 =?us-ascii?Q?VJ4Qb6uS0h+7h1wuGMV7kFdgZktpsMG5RQIUv0quq0orGx4pxLm8RR1SM4Lf?=
 =?us-ascii?Q?pY9QZRXCEkXx11x3aGIC7ab74SJX6PYlh+GVnF80gUxSG0x5iOPuZpVzuDq1?=
 =?us-ascii?Q?3EsyR40ZjN1vNFO0KaKtbE26Sa038THWgspMu8Bt0VDQTFmeYAdSZpx0kBMe?=
 =?us-ascii?Q?ge94+kbREfixXEziEIWbE/FV1gPFcaJ4Sac+V0pwka6z+gCgDma6zx2ebl8b?=
 =?us-ascii?Q?auff8kC4WUIVGy21DFrQuy7hSEOjyoCMqvk9+yd7dwqaf3AJ1bagKzRyu0r8?=
 =?us-ascii?Q?xxvy9pEergV87tNMm0OCpm1Zh+SY71PEjfV5oPxntj4We1YrmcAalXexc2uk?=
 =?us-ascii?Q?i17BQdPc2UFHZlc7+8A353JsaAwqnkYs4CUtnOwvY4qVEUVA3n8sEa+gGgvn?=
 =?us-ascii?Q?0GzJ8bhFN+uKZoxw2Ps+NQuS5hDlrM7HSPd6/NiY1Hto134DqkE7ln18fTe6?=
 =?us-ascii?Q?ctFtoVFHn6IzDFX8JFMJSERL22ySPsFKKxH5RtNvo0Ndsj+YLa78r8BZGwy4?=
 =?us-ascii?Q?A323af1bV9tY6sNRiNGG81zr12WeGbk0HQCsYkSJjHXmmYjzsXe9RMsdkXqP?=
 =?us-ascii?Q?Iay4ZLB2KIoGIJdQkozJR0L8/3KBMQEY4fR8pa4gF+xZds8nPeOJFFGZb6v8?=
 =?us-ascii?Q?wSuTKHvG7j0VY1fSD3h4WqclwBbcaxYIw4ID8c4zrVWzEonGqI99tLjDyyDj?=
 =?us-ascii?Q?KWfOHjTuWe2vNbPWB3xrfaYslQOAIxWWYULLOPym11Eps/gHCQJkmBlDKryh?=
 =?us-ascii?Q?TV6Crzam/f2Vb/TmUTaePleL8d4TzNR85WOFqtzP8OT8k+26xgrJ+iUSJcP0?=
 =?us-ascii?Q?bTds3TqWeWUVLtIJtkAnDQnD5X0kgFA4BbMqFabWqYDFDN6VmDzAbg9An5kR?=
 =?us-ascii?Q?Lcmq/EPLbZS6UAK7PA7PjaAhYm+T4MyytDXOFOgRZbmsRfyl1m779422P3Wh?=
 =?us-ascii?Q?qrot84rm+OZo2gOxuz/aEcypoplmkEkNaPMFZVe+CZul1VmMo4jb6sCYV2kH?=
 =?us-ascii?Q?kVRfkCfYTGiK3an/DRdx8B9xNgC9cLIaGPXvrr2zxBe8d3+p/4xcBZmSxlxs?=
 =?us-ascii?Q?xNS9HZrp1DNkEIX02mTZkGhkUnrNWQRh8FvOTDb5dRhXf8buHJNdWwjaaLFu?=
 =?us-ascii?Q?h9rdwbfmQhjHDxf/4bid02r7lSTzN7ziCA8uZOEg562z7q3L/qW9n3aZQ3sc?=
 =?us-ascii?Q?RRk1kfShS4wN8T/uIRwmVuuM8iyYzb0fYBvhJrmPf0B569G+6mO1sySeN4fW?=
 =?us-ascii?Q?gUXwGAqFcnIYtVKWVbx93K5B9ngcxoMGgzvp55krZabvyouSjp9ebWp1G2G9?=
 =?us-ascii?Q?DzCy+bLSXqmFmRYcppY=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab17910f-1d47-4a70-c531-08dcaf8bf09d
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2024 05:04:35.1467
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4a3uLf+JFAogrrwixYI8pyByFNhmt92xy5LVMahv+P6H5QZOFYuE6eBMbCFoC6xIjWnDNkkd5LpNFxOsBwFHEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8507


> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Monday, July 15, 2024 10:19 PM
> To: virtio-comment@lists.linux.dev
> Subject: [PATCH 0/9] html fixes
>=20
> this fixes a ton of issues around makehtml and makediff.
>=20
> Michael S. Tsirkin (9):
>   makediff: look in subjects only
>   makediff: cherry pick table env change
>   admin: switch to tabularx
>   admin-cmds-device-parts: switch to tabularx
>   device-parts: switch to tabularx
>   admin-cmds-resource-objects: switch to tabularx
>   virtio: replace xltabular with ltablex
>   makediff: cherry pick switch to tabularx
>   admin: get rid of _ in labels
>=20
>  admin-cmds-capabilities.tex      |  8 +++---
>  admin-cmds-device-parts.tex      | 18 ++++++-------
>  admin-cmds-legacy-interface.tex  | 10 ++++----  admin-cmds-resource-
> objects.tex  | 14 +++++-----
>  admin.tex                        | 36 +++++++++++++-------------
>  device-parts.tex                 | 28 ++++++++++----------
>  device-types/can/description.tex |  6 ++---  device-types/net/descriptio=
n.tex |
> 44 ++++++++++++++++----------------
>  makediff.sh                      |  4 ++-
>  virtio.tex                       |  2 +-
>  10 files changed, 86 insertions(+), 84 deletions(-)
>=20
> --
> MST
>=20

Back from a long travel, couldn't respond before.
I verified further. Changes looks good.
Thanks a lot Michael.
