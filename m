Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2079.outbound.protection.outlook.com [40.107.94.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F80818452C
	for <virtio-comment@lists.linux.dev>; Fri, 18 Oct 2024 10:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729246574; cv=fail; b=cvE8xhH1P7SvtxOii7nIiNCRFafcn1UIJU8ofwhanT5evuKNVfGtnPpBeoPFTbHbgjMmdIXG+Zy4I30bDSm9aLu62YsUwACn4PVXTQyg33gAe9ol4H9E3B7d8FfMBEe54I/Ao67zv2SAZlygY+PK8NyQUXSGwBM2cf2MR3B5b/s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729246574; c=relaxed/simple;
	bh=mmSWlJfJeOeEJjVd4gV7YFKKeA8O0SOtNNfRGWcuvJQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=enPUfF4V18cQwzRw1CLp0uDn2ao3K/zQKAkqoAxNGX2YscIyffpL7ocakpoOCecPfvTsZMOSo5eUktDgbqApXbuDdeCFE2khgH+jbLfrq1q/3Z8kQ9VraKVO3MuXjTnrWv/VyeDJEj1qLbZQ4dn4q8qVZ3geg31W5S6Cp4FItkk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Fqw5lXvB; arc=fail smtp.client-ip=40.107.94.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Fqw5lXvB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QW8Qn0KfaY6GYoSu2uwACFI3Zwg0wZXW3+H/SYOD80n4n+s8jFeGvWnMqPfctpAXhrPMn+QyMlsixt24t1rxlweCsLl1iujCncGgwkjq4ru3diDBN3RKGrstjc3n8SmxThNAiaJBSdZtmkwurj1A36+r/ZD23mO6rrRSy5KvgHgjhWNmkO0Yt00doH8mAzCuqO7ofhL6/mSlNlPuaKANTVJuBl6Py9Ex2WmD/e3YurVI7zQx0yf01F5fuuJ++bIN9nzjcPZBQJ4vMO+gK3lvRoKNRe8qrskZaRToRT75OE36N3ax1TZGIHwswvxJV/d6pM+/5GLzdjvVdIaLnUM8fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MEFBr20EKer5ylwXHPhAEBLqix2GDVX6KoJBSihNboE=;
 b=iSzuBECOdIthVvjry6iZ0yMrMqdD8V7daeezqjdEyAeG7JvHdtkCSALWdoNluPRutWBoBlZVSj73Dp2afzRsZESE+w7XsZFJOBc0ClY6SaMCLvPmtY5c/cAOUdGL8BU9Ywh5Zp6dtVc7o7ehtJPrJAJnRZR7oRhHHuAmwjly3uQe8xLK9Kzm8Vx8zQirfsOZAYaoTyBcMGc/G4/Aa04fCeuFNAc+c9eKRjWuvGsgpxPUVWwagvtnLjRKzhmGuZQt81Dfbw+kr+6LY1iG/GwZsoWsvzEErOS+9HebwdJjIXfk1iP7Z9EPNvZK+czT/Foe5xuq9eupFCLNLp9Dfr9Mlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MEFBr20EKer5ylwXHPhAEBLqix2GDVX6KoJBSihNboE=;
 b=Fqw5lXvBHGFofVcZqUC41jyXWN/Q4DmOU8FqEVUKqn2aQgqZNDeGf7ZeOBZuXatwRpOVfLLyclkKtWVKRjSN+PLnf6LiZm6MV2KQ97GugIfehtRDDjAC5KYnYzOMrMDJvIoQptv7elxq+knn50DGY+TlJf3veDuYs7PpEB1bBRYu9WRt5GFiI/Gh+eBd1HGXm12MxOLPj/5C0oujE5REYHB6jFduJwbWQYc1UfR1X58VC1MeKuv0RvklkyN1b3Oqcx3g1yJpEXkZ4WAylG0G3qBVruUqN9bW/P0ic8pQOjCBzP2UnBod6O17O8EVB8iPDKP1Yo+5fN+ubZ4ng/9pIw==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by PH7PR12MB8039.namprd12.prod.outlook.com (2603:10b6:510:26a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Fri, 18 Oct
 2024 10:16:09 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd%6]) with mapi id 15.20.8069.016; Fri, 18 Oct 2024
 10:16:09 +0000
From: Parav Pandit <parav@nvidia.com>
To: Stefano Garzarella <sgarzare@redhat.com>
CC: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"mst@redhat.com" <mst@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>,
	"mvaralar@redhat.com" <mvaralar@redhat.com>, Shahaf Shuler
	<shahafs@nvidia.com>
Subject: RE: [PATCH] virtio-net: editorial: Annotate structure field
Thread-Topic: [PATCH] virtio-net: editorial: Annotate structure field
Thread-Index: AQHbIQ1WXGW60qxkSkuXwumh0aaK0rKMGFSAgAAyC3A=
Date: Fri, 18 Oct 2024 10:16:09 +0000
Message-ID:
 <CY8PR12MB7195C5BA3711596077E51860DC402@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20241018032432.398821-1-parav@nvidia.com>
 <yruwppfhsjvpk47oheqhux244k4z3jyacqdx5bvywehn2qfwyv@uu5di5rkspkt>
In-Reply-To: <yruwppfhsjvpk47oheqhux244k4z3jyacqdx5bvywehn2qfwyv@uu5di5rkspkt>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|PH7PR12MB8039:EE_
x-ms-office365-filtering-correlation-id: 66ccbabf-050d-40a7-f8ac-08dcef5de27e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?4h9XzN0u9L2Knk+Ys1m50eghZtDfG6tiJUzr13tbY+EZNRn/mJnhEuP0U9+J?=
 =?us-ascii?Q?Tq1SoRVgg8H2Hm2u00Zu1D4drS3nKtk21KKn888hvB4lp/dhIJpn1r4Tk1yU?=
 =?us-ascii?Q?WB0nRoJXt6hFsFejiwCzqlv19PKZUgZ0oRJsQzl+pJczDLV5sJqgtDTAxtyU?=
 =?us-ascii?Q?wG7PUgPZUiWDEf00NFMXdyu3kpkLJ6Hlye2nx4yZn0KCTO/Qz0kHPdmg/VsK?=
 =?us-ascii?Q?69XzUg9PSPAFJBu3kdGZjJy1CKef9+SL3hWwP3rrjjoEo2e9/lSjZURjrW7x?=
 =?us-ascii?Q?HCWROz2qEzP2WSbNotOnfputiDRQHUfkR6HmLcHZfr83HxlmWM6kvsyOasEn?=
 =?us-ascii?Q?xsYQvAXFM+xhd8ovJBiRYtakNv9kCywfj2SebnY92NZ5rt84JwFPwStCZ7xV?=
 =?us-ascii?Q?CfaP3L/PNtuIF9t3D3U4BKBbp0LFjSXONTrlY2iT7O01aFPCJ/tmp/hpQhH1?=
 =?us-ascii?Q?X9xdIrXPigchPd+1rR4SMBi2lkdA7FnmPQULignxhw2mpU00t1qj32sSTkp7?=
 =?us-ascii?Q?utfnxidrEi6BFW8+zNjQcYiV8NqNTgdRkkhYyh0BF8vSzd07Pu+sqO16jtml?=
 =?us-ascii?Q?iMnPhW+yjMcVfEAHh+TDbt58YFrTSkBK3DWPQ57JlC50YQCGf8MAN1QDrT8i?=
 =?us-ascii?Q?+vjCIu+YPKIObWuU030VTJCuBIvKmAW2RkT+Mylr2VBzxen1b99uDZjb7Aux?=
 =?us-ascii?Q?p+xs9Nfm0d3qZfOatrUFdmh1VUVLq5qyYQfDHmAtFsKOXzUwPH/GgtyWU0K+?=
 =?us-ascii?Q?2nyHTbRM7J/EVBU3qhQ4kRg9TE0+DNLW8GERRU7kFC21J+Aw4UWcq8oINYZl?=
 =?us-ascii?Q?91qanH+uyP0AZmDh6yJ9yTHuAuYQ0lQHhR7OlLntbj7S4rLNFnCr2+yEwT8s?=
 =?us-ascii?Q?2Lq3qMGgyWxCZvL37VrPBin0gje5ALOGxFXcy9uyZABAbchrZ/ap6oXxBStt?=
 =?us-ascii?Q?SHs2TieOukXxmK9v3uJ+wq5yxsQnB5h1TUXwtl1uQ0jBKz1aXIRv3nM28v5V?=
 =?us-ascii?Q?C8iPy6pASNM5ecn1/c0tiykFxriAJCmVBBY3n7D10cPTwCWqimP2fbC9ntVh?=
 =?us-ascii?Q?zlMZAxPGWt3yvMkyU101mZnFRdaazLEz5+XfeZTzfPfUVdCb8gTwSUcQvEUV?=
 =?us-ascii?Q?X+8J0GtXxuc3OmuCZGWi1fFcXNWQPA7r/jY+3uc3XT89U1qd3BQvFBJOKGEH?=
 =?us-ascii?Q?a0QB9mLDEUUhi3XCpn60V09ctzdSbHMGhyFTLy9XFwVrv1i5e+BGPIqXWm7E?=
 =?us-ascii?Q?RV8RP6NiS+l3QhiWiw1BE66GGc3SCWmvQAVSAqfxGMp0ZixQXEkxE7CcLwyn?=
 =?us-ascii?Q?3uomUa/geewODrEd/VK1vp3MKiVzOh4V1cAz6CuOI0vT7YYXdyQhiIExG5y7?=
 =?us-ascii?Q?BVuhAEY=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?BDU38pFFrOFo2386QHcl+6vb697NiozV2ONuCMD+0jAFpkbHCsIWgSLi2yOH?=
 =?us-ascii?Q?ZqLr33Dml1gKVPiF1UBxXmd4ilXuolYM4UzC8hoPlaO/45NH9cx8qNu8YNVX?=
 =?us-ascii?Q?LutLJ4qCLvuGeiJ4TZZF68EXKVbZ1R08fdPgds4QhgCDqozXPXPTt8qVHuvy?=
 =?us-ascii?Q?Ga/91V+O5fq7Zqm2kM/qPFvXurLlnEKoxEw0LWvC5NdUXFh5/aXOKNJyGzAY?=
 =?us-ascii?Q?OL4dAfQIlBpzRCfjJ8QxpbCU1folDmzsM85sgfy/z6xrgQO60gX45S+ZvDvJ?=
 =?us-ascii?Q?7yl1p5KIkdYHQ3nX0rWReSR3K3s+hqmgEJ9plT/mKvfYDFQNCKrG6Hwom0Wg?=
 =?us-ascii?Q?geZDELlGIzzaiAAGrBRyej4i/6Iuz5UtJF7KQ3BFL8ujCjUfdH9gxM9O7+iG?=
 =?us-ascii?Q?wBIteZymdZbjbrrdo6bdpw4oYF6o73evUwNxrYEduTFOlBy8e8kNzsj5+e0X?=
 =?us-ascii?Q?R6Gpw52qcqpd8C3ByrJei1G7Guq2PrTMiQJspV36V3hM3LUj8SXYruc+NWDd?=
 =?us-ascii?Q?ksIw1w8g+lEPLYY+xwH5iI1EHK9CsOqeJZwy8SxrvXXyS/AI5tNBzNjge1ap?=
 =?us-ascii?Q?Eigk4uDnXh1S0nbgXwJkzi12riRYUbEiGuQop4enriQhBhQFGpzqcCv+7twZ?=
 =?us-ascii?Q?OeePABMdyI0kivNzcCv+NvT6ZRZ6rg9K6bvAfsnJzWEjdWR2rrZlFYeJKWAo?=
 =?us-ascii?Q?M0K3MBVAdB8AIPxkZULQummZkO16NrDdHocJI+rFpKHrpFO/DcB0m3VuzBdk?=
 =?us-ascii?Q?6rk6VEDwsvjdAZUkrtrzZUaa7OM80L3skpdme8Yk+UAiKn4c+pGHBgNf08Rq?=
 =?us-ascii?Q?BZNtXvuaKxCbdYOUgF1HBtCqJLrxcu+TZR8uJODYlmikc0A4mzk9EU1cy+zq?=
 =?us-ascii?Q?uhKNiUbmn0Dhhx/l/KTxcW4lST3e9VgLk8ZflbVqPpWfsVjkUm+DNAr42oaL?=
 =?us-ascii?Q?gc1aK1l8UnrwPSUPxPvAG76AcSe+qa2U5YkXXt5yCJ1JHtfwG7vZE3dSsgMo?=
 =?us-ascii?Q?uKp62TGz8eQOCEOj8YaMkxN8VlQBzpSuqbH09st8/2U1TO+L+XgYcBxGXiBA?=
 =?us-ascii?Q?QIOetme58kifqZjarOGoOS2WViW2NGV3deOcfxEmmc+ZYDM2fiar3WEny/vP?=
 =?us-ascii?Q?TVdKUcKJR6SUTd+d8VPpVpcOskwtU5PK3ycxm3sEtUqHQ9kl+RhaSBBtTppI?=
 =?us-ascii?Q?cxKH2EpyuMTYrwmwodKip3sOkFlr/wKteEfXKd+AsLqyRUl0WoNfN7mIt6de?=
 =?us-ascii?Q?UCnbwR42QpGend1FLLqn+f1ZoTYrs+voTnitm7LVnE5PWW4y515wlaY2L/UG?=
 =?us-ascii?Q?dV+SNGbQBOjhDk7lNuuXS8c2wJH4XDuccX67sv92oRiRBzmDXvJ5lAh57bVy?=
 =?us-ascii?Q?pzrivb4zLVbw9VEPPItwsXPCrD89Tka90YR99KvhXo9LQk8ZEQ5QGzvkXAeZ?=
 =?us-ascii?Q?u4gQDIag2zogw93PGjfaVmPVgDMxXFC2FPaY/gj/d3EuO6fvd41Sxm+DOGOr?=
 =?us-ascii?Q?fbcY+43PXPhN2qLcxBdUitJX7bfjYD7h1K+3wsJHjph8qhjcHa9zTK/94/Hy?=
 =?us-ascii?Q?EJ/OzYs6FW448YSeM5U=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 66ccbabf-050d-40a7-f8ac-08dcef5de27e
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2024 10:16:09.0227
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZcjrEkuivXiBG2R6y0QHvFtP+6BSgGyTs/YNDn5ccM56e6dFXcA/4ZQONrIhghAvUzKydEPySRZEQsQEENOBFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8039

Hi Stefano,

> From: Stefano Garzarella <sgarzare@redhat.com>
> Sent: Friday, October 18, 2024 12:43 PM
>=20
> On Fri, Oct 18, 2024 at 06:24:32AM +0300, Parav Pandit wrote:
> >Field command-specific-data is a structure field. Annotate it as a
> >field so that generated pdf shows it accordingly.
> >
> >Signed-off-by: Parav Pandit <parav@nvidia.com>
> >---
> > device-types/net/description.tex | 2 +-
> > 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> LGTM:
>=20
> Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
>=20
>=20
> Just for curiosity, but do you know why for example in the sub-paragraph
> "Packet Receive Filtering"", just a few lines below, we don't use \field{=
} at all
> when we talk about "command-specific-data"?
>=20
Good point. I noticed those few places too now.  Sending v1 with the fixes.

> Looking in that document there are parts where we use \field{} and parts
> where we don't, is there a rule to follow? (To my knowledge for future
> reference)
Any structure field and structure name itself should be annotated as \field=
{} when referring in the description.

