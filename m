Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010002.outbound.protection.outlook.com [52.101.46.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4AD1312816
	for <virtio-comment@lists.linux.dev>; Wed, 19 Nov 2025 08:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763540993; cv=fail; b=AaMeRQXH//dK3R6BCgg2EwPASVT1qpktg+VkQZ55vxIi0WnHPW2pPNGLn1TCSsSHUN8BaPeDiwKyjGH/tWYpdAYWQXIhJXxZYxNKQ4+LxPsN2gxt+wM40rYTj6XhE0kFT2TBbdDxOGNPDUvCy4D/tIDvK5Smm1dbYBmebXjTD9s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763540993; c=relaxed/simple;
	bh=rvF5qI2HVVa5r4EfAfJJpFPCsP8wicK7q6LbZlZTTWU=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Hqekv/tiymnQ1ySm+YjmD/YVW5GqJr4xqOSrA6uPUUKrxJRuaTji3/unVwvaNzCVR4IVxSBkwzxEeWeilAGigcKkEddkF0giRki6FGfhMSxjhAnKVVn4D4LKBO+WraWSdStxRrFPg2c7UaygxSWbi7EYhxfnQqTd8neWCfeLuO8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=P9kSgueh; arc=fail smtp.client-ip=52.101.46.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="P9kSgueh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JGeUrgtPLmYeO1lVWnc4Jp8j1MK1Sbzsj8otmwXFPe+qTlZ5RjeRI3vruFgcWchvAsCyg98R1oveTV80HbGt5UtvD+AeenVIUntwJ/tej3+Uqf85cyBQ6oHNZwez369C/4IxnUFcPBTnWJ1HbsaZOzC5scTalnD8zw6JnXl2FWmJOpcQ/9jFQiZeczlYhWgALrDRj3Qimips/yrRydJkiLkADiKqcDHuAdutrJSRPUCvpdr2jBfF221zoUlFSOk0OctipVKlHBSnnEpi84MG1+91PAGVq3PF3XdF9UCvqg7hpVW+TFYeV8SUEYIVZxHnQ9DqTXrtUPk/5DsA0dDqVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uRPLDTo1NaJOaEbKupMc6xKz7dKCb35ZJVQ+aGLadLY=;
 b=qRYgpweVAnwrdxcy4MoOm1xVwC8jaztkdhF/yBd5DLd7NEtSzzeKyB5nqIl6y+7hgQZLGfz1kbF2JCMT+LYgaWTr303cJvh5FFpgdiGuFCXwieLr3xWbpwNl3Z+8eL5DBmf6117Sbq8H1AGh9ekJ2hSKNE2PacCrcULlLOobeg8RqKJjL7o83tR65EUt9bXEqY1cGjzqHRbB9Ic9vJ7AiO65BHjYTgYydxtVqJIg6GdfCu3ZYZQbUQwRfhfkLNYlVZ2BDpIfz7eKBuSqw6U6fwFsdg9bAunf/XapA5R0PDLyX2DdzE5IJc2nJMCQhivsyxa0aEvOJGTziXVLzEIeqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uRPLDTo1NaJOaEbKupMc6xKz7dKCb35ZJVQ+aGLadLY=;
 b=P9kSguehodOCJODEfBz6E8P9YfT6Wt0qXT17FLjeHVSxZZfSYvVP7CdiTVpOheZ269RsuwaxoTypmySkfNMFDnRCmMPUl+7RTJwgCD76dD8HKHQtGmjcemlnOL7fhuEO9+lBoTpCMb4jXhLDh6OGDdLH43N0J1cS1fy9BVeXDnRr0GrLLU2H9NTlwruwWkx/Kvz1VJq90wdBQuGwA4rh4xZHsVJmzc5184ScAlugp0Xhf5GnteaPP7l5hNx3JkfAfAqgiX5kp9o7u7C2WgmmhB04GP+sYvAZQQ7INHSy4YFLDGv1AGOS2kK5JvgL9ArgiciCZ7G37G7PD3MYPvfX5A==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by SA1PR12MB8920.namprd12.prod.outlook.com (2603:10b6:806:38e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 08:29:49 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::e571:5f76:2b46:e0f8]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::e571:5f76:2b46:e0f8%5]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 08:29:48 +0000
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>
Subject: RE: [PATCH] net: pad virtio_net_ff_cap_data
Thread-Topic: [PATCH] net: pad virtio_net_ff_cap_data
Thread-Index: AQHcWS3SHpo/zCXMMkCfPCAfT6Qn6bT5qq7w
Date: Wed, 19 Nov 2025 08:29:48 +0000
Message-ID:
 <CY8PR12MB7195A3E4ED0AF590BEB0A629DCD7A@CY8PR12MB7195.namprd12.prod.outlook.com>
References:
 <0c8829841009a0094f24f87e013ff47e4d16721e.1763540610.git.mst@redhat.com>
In-Reply-To:
 <0c8829841009a0094f24f87e013ff47e4d16721e.1763540610.git.mst@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|SA1PR12MB8920:EE_
x-ms-office365-filtering-correlation-id: 69b35531-2ce2-4d0d-f315-08de2745cd8a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?vUuKJx/gR+GeZY64x8ZoJFa0gf6y1TZ1f8axI1PBTxuoPjAK0HH7OKTbBnr2?=
 =?us-ascii?Q?tx2R9qzhOJChWvdnUP8bnWSGhpPZl4HCC2IxGIn2oYVxM/wpZBf9nGScv2yR?=
 =?us-ascii?Q?emLbuiRZjH0CTJhfra3hcJyx5/XlGvBN4/MJibDWdMO4Qf8iPl1nTl4U7uvE?=
 =?us-ascii?Q?YcWKuZiu1L27W8ikDA3JNk35eTq16kj817F4VkbDYzEgrZuRdfMR9rkQR6FW?=
 =?us-ascii?Q?NuCwgJO85Deh7PQPhTytXeOnttLsP7A4BJFiHshcz2Er/gag3idfBjMBRymB?=
 =?us-ascii?Q?WIm5VOrGBe04jv3pqgItR1Uc+8s0WZUpaDhDXWcCZDjvhxSouswns23BsuqC?=
 =?us-ascii?Q?ruyqorvnD0VKHRbt80ThQCD8e2val5WLRIfLnlDBwSsHhN5CT/wuOlfiqXXv?=
 =?us-ascii?Q?+U61r5GM0FYJJREkzvzaKTjkS9R4GKTN3Z+222eJaJsyIMIvv3HGVeIbWOdQ?=
 =?us-ascii?Q?O4QjIHGM+dLyouLMsyHX0VatchvoArO4tLRRhLMXwbiq9Yst7Zqra3LtrnVJ?=
 =?us-ascii?Q?QTs4g6Qe/MvBD6VCoE2yfBXQzWeB60e2m2i0QyoPRim/RM5vpC9G7Ru/7yEt?=
 =?us-ascii?Q?o/e3gWMrD6/mYGXa9DHZaTaB4ghJQ+nQEEzuikztwgKjt2n30CsmFKG15JSW?=
 =?us-ascii?Q?yH7dZX59YOxajgLEPyyLLO5Odgyuc+cYgqa7B3tT7mFAIDbBLPx4ZXh1JhPP?=
 =?us-ascii?Q?7roHPFRYpoOoeMSZyYFYFEIWPzN1QauYDMPuzgoiaKhsNDEO0sKdOJMEQNam?=
 =?us-ascii?Q?swWrWCyf/REpn1GzcbS8k9+uKHEjS1JKqflwU0hM6084lHkWIoNbXRWPEzB1?=
 =?us-ascii?Q?wdOcXtdfbiAHve2BGSE1svlnriIPao4SFdZJ5GzDXRt8rK24LdGNJlQOJyXn?=
 =?us-ascii?Q?IFwkhnJUHB4DiiwS8j1ResLwc/5jyeguse8BgqZODpNp7w2U8L9zOVLWUCTF?=
 =?us-ascii?Q?RqnNE0xzT+Ahw4aDXjBKUZoUFLgN6xkJigQ7X0zAo/MrhcjY6O+nPxnFA2b9?=
 =?us-ascii?Q?07fxsXgXpkK7oLxVWLgubKJe04H+TSy3fssxK76taGgVrjwhqxVaIbxeSGbL?=
 =?us-ascii?Q?BFqmtkszXd14tkPp06HhFT/VKQwkM2Co6HeNCZHL60Vv0njKTWxmWPAh12rQ?=
 =?us-ascii?Q?rjpreGXU9h6JrfhZz1W9XNOVTYMRAca/QqOtfea8FUCC6LuBWG7mw7Toca12?=
 =?us-ascii?Q?GEapT3TytdOtzdfqaUn0+tAB/4ie5te1/iPDu1J1F2+jt2J+2xRbPN/jHhpC?=
 =?us-ascii?Q?LbQAM9Cr9cd84ueL2JrtHEe4jdEp2OF/Xp9DRvGAUy43A/ROGv9qrnBsAw+Q?=
 =?us-ascii?Q?6DqtermJI0WkFjO3YbkqkcbDES/fKfPJRI1mXOeiIVK8Jcw2PZo11E7du8QF?=
 =?us-ascii?Q?nSLBHF073rcFtybW5gzD1pXiojvdaIqYXtnofLuHxEXD33cESdUkN9Iw/6WH?=
 =?us-ascii?Q?AX7uoq8wmvnTGeiGrBjEj/gMV7/XAjaFkGjb0IEyCM7bUpy02bT3E6pq0yuO?=
 =?us-ascii?Q?V0ujCIrRZl2UrdvAJRWovLO7ErUrj88jLFy3?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Pqu9lRxbkEm3MEbSp2ouB5C6gAItVBsAMTL5od9TYxqq1FUE8TQytWLAP/Oq?=
 =?us-ascii?Q?EccAnLgy7fdCUOzp2opGj+czhbDYXyMTyHeiXEjh0YBJCzabUMJiDQpscYik?=
 =?us-ascii?Q?H2BboTWwXwtjXcNNHsUMHbYMuaDPQpI24AqEsjnbpuTVzrM0uNc46L9Dk1Xj?=
 =?us-ascii?Q?O3kLRrsQ5VYHPU9y9VF4shPG9atJZr3/mTfefbfkgs4gIe805TAQHY8R4EUi?=
 =?us-ascii?Q?M5SqegPvsD7HW6BoJ9IRFlQ1U8ZrM2o9mMENas1T/zwtS4kZh4AuJkbQ2eVv?=
 =?us-ascii?Q?3y+cVhtBiI04UW+9iLvbuKMPGSUbA+DUNHKbzPCcQ3OFL+vzMYfKpVzzPOVb?=
 =?us-ascii?Q?Q0Ba2j0o490OYjTPhD7WK6gV5YlxFZSC0Z1pm5U+pQrrlo2NCfASYBzcYqR5?=
 =?us-ascii?Q?dJ752dIgzPiNbEj4fExOsViwY2COob2iJILUSkv9A+I6/S4o4TE9D56QNgrS?=
 =?us-ascii?Q?UIOWX/B5pr0ZbVdSGUE1C0Wk34dpV0j8WX2LmBRTFA42zVC6wwAwdSBHm2EC?=
 =?us-ascii?Q?WPq+XvY2DyGLdzRjqyCShsoyNtzIpZp4MYu6CyF3XCcNZh9qQoDC6KgFFkm4?=
 =?us-ascii?Q?MM2864WAbBjqe0z6vrQYV/ADaTys5Zw86KESigS1IWTc6ucdbbZt5eDT5r1b?=
 =?us-ascii?Q?owJNWuAdCHGDCwyViTzr8XTmkelQLvXYWU9J5inlZkuVaziinHjguxoCzIeI?=
 =?us-ascii?Q?qfeQ83hfi5AznS/GNxPvr5g2TUFfwVC+tS9XYkjk5KDhtncwNhvDDrw7Z3GE?=
 =?us-ascii?Q?HKuFZ899rsdWCBU6lKtsicqz0S2syVq4nxdN2+dS+mY4baRPbtbCoeFhDXGd?=
 =?us-ascii?Q?SaEnTrt8XoM6BflSgAY4p6JQPBdKRzI1PZx64p7O+edxXRovKBZEGDZM6JQr?=
 =?us-ascii?Q?tZ8sxAS98svByyeys+DvbPslOgr3KvZ5XFxvOBUymFSmlzQUPQEhB7R0kyro?=
 =?us-ascii?Q?bWBC3Z9XfqAbI1ZijYaqiBNMmvMa+aB97WoFr67Qx5YtxfWJ0HLWGqopPmOx?=
 =?us-ascii?Q?5QjJHLHY5OolKEqy3slz0EV7LgjWGJd5YoR0r7BEMFM3azKkywO5WNfHeTDG?=
 =?us-ascii?Q?1j45LgDaHGxSa6XvEwlBDzDZAGQuwbRO82IEsvkPKd4wqlw09nhSmNCsW2rl?=
 =?us-ascii?Q?JuDfUoPf74t0iDIKcqK4GRiYNdO/H63iFCdOg2eOfgeNnazSQZm9zeW3Noxa?=
 =?us-ascii?Q?47NefRoqwIG5rwwdFdDYa9IzxN9PMPWNv1OIQrxwaR3z5b5gkVBEUIgYi1zK?=
 =?us-ascii?Q?oRdRVwFdEa/1tC8FeCOLS7HoF6UQAgFYAgpJl/mFAjwEY/RVJ4tkFsngRZRQ?=
 =?us-ascii?Q?xE0y+ow028YNRhyFiY6idtv2reM9R48zAvC1Oe3Z4D4A4+0lHBwCRk8tJUzK?=
 =?us-ascii?Q?pJQ3BGbmqihOzkTH9tm1cvtlW8j/CF4O9mcW+yVj35SDIcOdth3XWI5D+u7P?=
 =?us-ascii?Q?vQOJqydWcounTwS7DhOmmeWfIbCt1PiDQZhgic8c3NrlzsuLBW3JVvIRfSMv?=
 =?us-ascii?Q?ED8hC4SHaDmuYQOquNT99wfn28qq94QIhi5cNg5zh5rUvTahl1YE06OQOLZl?=
 =?us-ascii?Q?eoCINmQoInGCdfXaoAY=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 69b35531-2ce2-4d0d-f315-08de2745cd8a
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2025 08:29:48.6616
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mnZcSAtHQkt5A6ySwDwRWeqUa2fXi07xJf8Cdhl5k6KkdSwmACMHDxsJEMedWdavVKaf3lg+W0oTD1U3pYb0FQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8920


> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: 19 November 2025 01:54 PM
>=20
> struct virtio_net_ff_cap_data has 4 byte fields but the size is not a mul=
tiple of
> 4.  drivers can easily get it wrong since compilers tend to add padding t=
o align
> such structures.
>=20
> Since we are always allowed to pad or truncate admin commands, let's do j=
ust
> that here.
>=20
> Fixes: 899bb0c ("virtio-net: Add flow filter capability")
> Cc: "Parav Pandit" <parav@nvidia.com>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>  device-types/net/description.tex | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/device-types/net/description.tex b/device-
> types/net/description.tex
> index 9833d16..0b4fcac 100644
> --- a/device-types/net/description.tex
> +++ b/device-types/net/description.tex
> @@ -3055,6 +3055,7 @@ \subsubsection{Flow filter}\label{sec:Device Types
> / Network Device / Device Ope
>          le32 rules_per_group_limit;
>          u8 last_rule_priority;
>          u8 selectors_per_classifier_limit;
> +        u8 reserved[2];
>  };
>  \end{lstlisting}
>=20
Thanks for the fix.
We should align to the 8B boundary instead of 4B.
It should be reserved[6].

> @@ -3071,6 +3072,8 @@ \subsubsection{Flow filter}\label{sec:Device Types
> / Network Device / Device Ope  \field{selectors_per_classifier_limit} is =
the
> maximum number of selectors  that a classifier can have.
>=20
> +\field{reserved} is reserved and set to zero.
> +
>  \subparagraph{VIRTIO_NET_FF_SELECTOR_CAP}
>  \label{par:Device Types / Network Device / Device Operation / Flow filte=
r /
> Device and driver capabilities / VIRTIO-NET-FF-SELECTOR-CAP}
>=20
> --
> MST

