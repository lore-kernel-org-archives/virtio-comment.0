Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2056.outbound.protection.outlook.com [40.107.223.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC5B80BFC
	for <virtio-comment@lists.linux.dev>; Sat, 17 Aug 2024 05:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723872016; cv=fail; b=prH5caUNhZCiPagVp8XPsk9ssLzU46mF1Xt53S5e0dPDs8KvTK6E0QrLCgWO/yN/XQZ8jAgS7iWA0P6bSFwiHcgrnufJrkByRPVP3fb3iUM2y0gBjv+dBm/WQ/BzQoy2XfYhfG6K0wIekFHMrzU3GOkry6vNem4hBZKnz2rdw3I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723872016; c=relaxed/simple;
	bh=cVWg0jq46j2kOIzwv1Gd288VvneHoPPWysvilmmqMms=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qJIoZ7hUIwHE5qtM54IiC5BeVmJrLm2Y44zUtCkLou6YdkgwxDeosxHlRv9KQjn/Z+NZmrVbbRIXzuma+TLvzrHCivgh8iyWXW+EsjTPUM9EH8lvUhA4/52rS81mTTzmMeQBocwGXhp6IKi10ECbMX4BayVBKtVotfhDQkkMFqU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=lWxkGRaF; arc=fail smtp.client-ip=40.107.223.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="lWxkGRaF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sSqbHo/g7C0E+2NNqBU5fiwp3SQqhKudcihW+7wqi2VLhk3J/+XEf0PY9UCTsP6c9hjwSNXuHVj+Trt46l7HVLrv27aI0+/UQKI6nAFYcNyAFTCT4GBvVkSDrscaRe2XzjnCkPIfWzl1iJZlhFGFI5n7Dxila5nekCbrVUo1Zq/J3JYsNG3TvT7yRauKdH4WYWz2eDSXNmPSg3V9P16Bbw7rdtoS+d6zHG2A/Zki82XGlp7hxCqZ/8+XcIIxDb3OPBOiYnMy7ZcGA1Z6P9MVUh3TGpRhUcI0zY3APyNXTjgdjE7zSxAktU6K2lxfsPqKT1zrrYQ4wPLgGK95R0fwcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g1SsUseOFPM8wGYLwwMH8ZzgYrnYpsdwWmR34gDxSYM=;
 b=a/r/sncoqMHDEVXufpygvvhN3EBMoklnZOPoKkzF2SwBZWI9TSI/LomDbz65Vnhb7gfXoRz2pe1R8K7/me0e2H+F6z0d/gAeX4bW5LVTsC+Y+PPHhOzt3oxE5n1uIulVDCZlzMhG+6Ch1Vq5HwX/p4xfv0UHtrvv3vDbfRicPQcPPoOc7L4eULpfHex9Loz4kRFPwXWiIu1mVGOu5FkOulBT8P3fWqY6dYEF4u5zEKrDtD0QOpJAK7auUEeax+wlQQ1YaDqZkveLhcsIhbdoeXZLlF6BGxenPHG/KgFZ/q/Anm4kEfpKrEuCw9uppfrsF6lRaQMLMBTpAARIFMbBqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g1SsUseOFPM8wGYLwwMH8ZzgYrnYpsdwWmR34gDxSYM=;
 b=lWxkGRaFOtxyO2xMFSWO9BJZohf55yWBTFQMbOOs8/fKOFXFnXRcjcmZ7rm4PvwbUDmEvjw2QHOKPdfpZQeIgFuBNNx4ektKiJGRQm8/Abxt8n2XsAtgj6HqbJpM1A45QAeyK6D1hOt0bOGURHMQr0ki3pz5TpBbbP3qq9mIn5YyFqqCUCj2nGPjF0WYh2yRLULT4s1qZwi4l4dqCj3scV68CmdYqrc0fZvzf/4BFGARGsm0as4NlN4NlV8NnDgQYXLcHdUToXxrmLQS6eI+8QbG8jgUJU1fcD+o+pRgRmd93ylV7mZLCIUdPkQW8CHSSmBFqNokY4Mu7jIlk8vL2Q==
Received: from IA0PR12MB8713.namprd12.prod.outlook.com (2603:10b6:208:48e::7)
 by SA1PR12MB8968.namprd12.prod.outlook.com (2603:10b6:806:388::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.20; Sat, 17 Aug
 2024 05:20:12 +0000
Received: from IA0PR12MB8713.namprd12.prod.outlook.com
 ([fe80::9fc9:acc2:bdac:a04a]) by IA0PR12MB8713.namprd12.prod.outlook.com
 ([fe80::9fc9:acc2:bdac:a04a%5]) with mapi id 15.20.7849.021; Sat, 17 Aug 2024
 05:20:11 +0000
From: Parav Pandit <parav@nvidia.com>
To: Parav Pandit <parav@nvidia.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>, "mst@redhat.com" <mst@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>
CC: Shahaf Shuler <shahafs@nvidia.com>
Subject: RE: [PATCH] device-parts: editorial: Add missing struct keyword
Thread-Topic: [PATCH] device-parts: editorial: Add missing struct keyword
Thread-Index: AQHa4ZiS6LYVkEntMEu355oh/ZaHrbIiDX+wgAj5ZkA=
Date: Sat, 17 Aug 2024 05:20:11 +0000
Message-ID:
 <IA0PR12MB871323ED310832DCBD1B6F46DC822@IA0PR12MB8713.namprd12.prod.outlook.com>
References: <20240729092005.425107-1-parav@nvidia.com>
 <IA0PR12MB87139A44E0C8184D583EE15CDC842@IA0PR12MB8713.namprd12.prod.outlook.com>
In-Reply-To:
 <IA0PR12MB87139A44E0C8184D583EE15CDC842@IA0PR12MB8713.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR12MB8713:EE_|SA1PR12MB8968:EE_
x-ms-office365-filtering-correlation-id: 21b56ca9-db70-459e-983f-08dcbe7c44af
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?lEBsRip/+lIMIlVMSSd7Mxfkcf4thb/p2eBk0FCqwI5ZbvIyOhZhmjzMlDaz?=
 =?us-ascii?Q?iGjpiCP3tof59BhihpaBfcEbBGfChpznHLRZaWa43z4NPtDRwilzzYd5mQcS?=
 =?us-ascii?Q?sFJcr2fDsES9lT0xUvQklyL/lziloMVv7PZJNoefMrA/TtSQUrdCVnwu0IF6?=
 =?us-ascii?Q?C6VBwMFSqjJWVGlHBzjtmyUI05j40+YBDXcsL//wLNwHRsUrdLd68YCJSZGe?=
 =?us-ascii?Q?8NTBN+KW2zjtjhwZVRylqLYdUSgdwhRMkh900N1REdko/CP+c5lnOHj+f2lj?=
 =?us-ascii?Q?k6c8F+69vGNYUU1NQGDbW/srnNqQx3bpqhEeF0BV5o21FiX3Wl4Z54Uc5WjE?=
 =?us-ascii?Q?YmMIl74YTRh3q9R5371YSIKNUx56fgEqZdgZohJyPwuemSZc3gvl8Mp1wvZe?=
 =?us-ascii?Q?wy1Crg3ql8avEnIHsiuXVn7LMUfUsyEhgiBYO0mLkbjfi3N+SupK7uNl7UDa?=
 =?us-ascii?Q?26KHqk1sNm3/uBNwkJQ8hHNAQrkAOK/c2w2UcldVxl5JthUe15J2Kt8+5YyF?=
 =?us-ascii?Q?8yQ6jfGWGjDtd0Rr0OeEYbR43/RjJBGAnvNYrbbpeU8o7Na1ng5pxCJVwKyJ?=
 =?us-ascii?Q?dRmQwv2wrUYNHD0ygJE8cYyQ/Iei3fgw5Qtc5WwKvShBLW+Z1XQqnMycKFZP?=
 =?us-ascii?Q?Rc6ZdkyJxcslK3jFsbAPU0a394E3Cgi2OQK/zVCh2w340P0qCdQgvpQK7NOf?=
 =?us-ascii?Q?WC0C8EKOW6QkuvFVXP3K5ZuPP0usTBepR0vYxGty6qVu3RUj60ITvVGS4KCp?=
 =?us-ascii?Q?8X1qRunBSeUICHCxJVncnpED+Gh7SwZZmym58f6Ashp5Yf9iwcp6U+WkAGtb?=
 =?us-ascii?Q?ypboMrONd6C0sHzJakLIzra6YPBtiJ4Cz7epuNuzTGs5iqc6A0fczqp8zZO5?=
 =?us-ascii?Q?6Ep5frSYm6hSloV8hrLY6wgAC9yxOg3g1UVMSW3kPKTCP+n3JR0kyR/SOZkD?=
 =?us-ascii?Q?PAVsLOyYTP0yZ9CiXPt8BUMjxIMyvo61wQhyPB002buT2rGwesp0YrN6KAme?=
 =?us-ascii?Q?iqLezVO2sX8UkLkqB6+giGFm2bxbysx11yKIDJiPk8nZg8Qrm4J0TD9mlfav?=
 =?us-ascii?Q?ZIiQ82P53J/XJ/xkUhLl9A4sutMlJGlTSjBJsbzoJpl/XlrBjYzDJwjKG1UF?=
 =?us-ascii?Q?jKAB9TobdYqYa6Azh6OvnA5bFP48FS/pa7MkOIGcJg6KBdnKoIOPCNU2S/C/?=
 =?us-ascii?Q?7w0Lwl2ugCFp+jvlPOnKMkAq1QSU1yA6gGx3KnqsSOARL475wFPhwknX/XLV?=
 =?us-ascii?Q?aJB+j/2Ta9s/c5WCtt41doCoKOZhNy/JeNLsq33zV6i9JpluOrc5c1Xc9k8C?=
 =?us-ascii?Q?rkyMgTGCpWPu9sZC8wZ+IZtJXdZmn/Klq3+I03d3qlN3EdCIK8yz6XzicHBK?=
 =?us-ascii?Q?1QPK3xcyeKVcudK5z/6lgGWzrYmPebqUJEmVjGhJwYq2aMqdlg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8713.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?3MoY+GkWPGvh1ozfNpbU1XHcyt0w3nU/oUzvWVg3zkdwrYjQKA/9CY783R1f?=
 =?us-ascii?Q?vN4F8kqgJgbkBk8H4wPRAwGOqZYl81SwpQ6JW5rtngBVTBR1WBjhx/nN4FC2?=
 =?us-ascii?Q?j+nUA4RQI/qlLR86vhljA6qfytEs1+pg72PdAGLbK6kFjKGuaLsgWvCog4uI?=
 =?us-ascii?Q?CA5TnX7k5PXk5P6siE7Bh2LS3eqvg61JYRgrwvKEypEm63KkJ7d3PQy8MKP4?=
 =?us-ascii?Q?1WidIQ82XxaiYDd3EvNLo8AfXOzxoKsHsae8DqBjE1njHkg95tu8h8+NSAwp?=
 =?us-ascii?Q?XsjV0Xu+8Z77ezo0FDebr3RsfIZKISV5XRLuAVOfQy0MyLoQCw6J2gRvWYTX?=
 =?us-ascii?Q?7xYIPm9rvAYqFTl2gKxv8FV99m8cSqb4e2MTVeEd/rcH3Fg+YCy5+tVODjPs?=
 =?us-ascii?Q?PHnucxR6QmbS8vLpsu9g8IRjonnlAlIzdMvtqdWv75T4xhuTBuABRmYo5W5w?=
 =?us-ascii?Q?9scvoS4kMSyQYDkvR+xpNzfIGtmM1tPQFpPAUFJM0QTl3K5LwNYoFH8SbLdE?=
 =?us-ascii?Q?rPYuyOgzH8neqjNciLlL9w5w2/Sx5Pug4kEbzFJlOiygSfUDfK5l31BPCfHb?=
 =?us-ascii?Q?hH7OiRR9cuZL3O99ofKdvya9X9H1ruFMSSVCowz7AL/WQwmfo4rFazjuMw8c?=
 =?us-ascii?Q?MJMtIdExiWQbtV8DmeIR5LnP0HseYx4LMRdyNA3u4s7ldiPxJiBKzkGzFzlr?=
 =?us-ascii?Q?rClmdDiyJ0RTsN/i5po4EEcW979NnOSPqwVnSnnzhWUrBhOyV4P6FbM2M468?=
 =?us-ascii?Q?mfwuh1U8OeSC+/mLGvFyN2ZIQ8fv2Sb/b4vLZh5hEmPbiajgyQQ2avHOljj9?=
 =?us-ascii?Q?XoVkM9DjfYHDhLvJT7KiBrrT4A9psvOWNTBUl620smT4vYFwHK7uAjo/vDSc?=
 =?us-ascii?Q?ZLhXRDM+DqqkvYvglHN4F5cm3Bh4fPYZM6m597I8hrlx7MSMszFhQ+PkZ6N8?=
 =?us-ascii?Q?vKESDbw6neMzOhm7UTIFSpz6DREl5mzLn6cEgbJ5t3pYd0nxWJkkgWtwuYqm?=
 =?us-ascii?Q?2yZqIKG8e7X6hO7TyzFMcJGFNgxq45RRuT60bmPcYhRqHGuUE9ZYYMTbEs8G?=
 =?us-ascii?Q?++ERiBrvsxppfiF5zCnQb3L+Ucq3AGeeZ6CDiufJwIVqPuCBCwa1NYdnDmsU?=
 =?us-ascii?Q?WziUsVxAmHyDgnFyqOX3TCPLRV1SKNK2rsbXfpOBFQVOwjEZ7fmH1DlOx3rK?=
 =?us-ascii?Q?+JbFn0HuwbzlLUoYgkXR3qlNAEcNwtoEMffxIyZhhuexz5+K2FDe9HVmvFzr?=
 =?us-ascii?Q?SqzL5hG9OMwiBPbmXHlnrZrzzmp2IoBWadF6fcla9HZiyFMy2XYWxHDrKMzv?=
 =?us-ascii?Q?dnvHhyG7ImEVI1NnFghp02Ty/be2qY3x+RHpS5R23Lx0rA0/FDvXYLo/KRDH?=
 =?us-ascii?Q?wLqO52zbGJEAmASfW37bqWrCJONgMoxGaA21wMEs0rIj352HSTtQzphU8++T?=
 =?us-ascii?Q?4MwskqG8ndTZIHGE+a7U4WqTFVQ0Vf3o18xf9CRoAHDExISt765q0y7auppA?=
 =?us-ascii?Q?QpBuAKdv5yKpQkXaMICa9lk4NaH8Cbh58mP0bc/zrLIub2fYKnqMnGFi2zM7?=
 =?us-ascii?Q?dw5Eqcb0Q9cQGXbT6gs=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 21b56ca9-db70-459e-983f-08dcbe7c44af
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2024 05:20:11.6946
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4DZwYFMiGFDWGmPsoDjo026ty0mWHnDuJ9rFClOahgusIJOWRPmfvuRiLIZ7pApyzqQ7LoPnXFugZRd0sfiA9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8968

Hi Michael,

> -----Original Message-----
> From: Parav Pandit <parav@nvidia.com>
> Sent: Sunday, August 11, 2024 5:48 PM
> To: virtio-comment@lists.linux.dev; mst@redhat.com; cohuck@redhat.com
> Cc: Shahaf Shuler <shahafs@nvidia.com>
> Subject: RE: [PATCH] device-parts: editorial: Add missing struct keyword
>=20
> Hi Michael, Cornelia,
>=20
> > -----Original Message-----
> > From: Parav Pandit <parav@nvidia.com>
> > Sent: Monday, July 29, 2024 2:50 PM

Can you please take this fix for 1.4 branch?

> > To: virtio-comment@lists.linux.dev; mst@redhat.com;
> cohuck@redhat.com
> > Cc: Shahaf Shuler <shahafs@nvidia.com>; Parav Pandit
> > <parav@nvidia.com>
> > Subject: [PATCH] device-parts: editorial: Add missing struct keyword
> >
> > 'struct' keyword was missing in the definition.
> > Add it.
> >
> > Branch: virtio-1.4
> > Fixes: aa4f6f06 ("admin: Add admin commands for device parts")
> > Signed-off-by: Parav Pandit <parav@nvidia.com>
>=20
> Can you please take this fix for the 1.4 branch?
>=20
> > ---
> >  admin-cmds-device-parts.tex | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/admin-cmds-device-parts.tex b/admin-cmds-device-parts.tex
> > index
> > 4c88045..27d8251 100644
> > --- a/admin-cmds-device-parts.tex
> > +++ b/admin-cmds-device-parts.tex
> > @@ -131,7 +131,7 @@ \subsubsection{Device parts}\label{sec:Basic
> > Facilities of a Virtio Device / Dev
> >                          le32 count;
> >                          le32 reserved;
> >                  } hdr_list_count;
> > -                {
> > +                struct {
> >                          le32 count;
> >                          le32 reserved;
> >                          struct virtio_dev_part_hdr hdrs[];
> > --
> > 2.34.1
>=20

