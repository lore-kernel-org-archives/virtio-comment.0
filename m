Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2058.outbound.protection.outlook.com [40.107.220.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 152571D6DA9
	for <virtio-comment@lists.linux.dev>; Fri, 28 Mar 2025 17:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743184161; cv=fail; b=PlaOEL3waDHxOnf1ZCK/q5TIfOaRc7QU2tS7afKKMmhQOVnDw6QIn2sfM0TifZaJDfyPuCLI8/AVehzbMn8hX/omGismtjhHuM52/R4C1uUCFPQTgeYPRqwf2cC+NQzBxgUnYWJ0iTu1UVaBnYlojyKVX0HhQBlJq8HOuL2ybBw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743184161; c=relaxed/simple;
	bh=H6cByxbVe0bXxKRT/2Deu2Yy4cbhFVr1tX0ar7YV05s=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=l3ovFb8h1x9KTvsi2vI4yMNdBEqPFz8IpYTcqLzV2DBYAtoIT5iL3c3cXE/oREMX0l5PGdxE4QeygcyjDCfwhvFDxtBcJqo+8qb2wpjckqOivnOPuBUBdtugpLKBrHC2aTJQNfd1D452unvU/hHRhs7OHlIA6uH0PcZlaE8SIGk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=mxPz19i/; arc=fail smtp.client-ip=40.107.220.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="mxPz19i/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wv/60Xq4FnUHG9eRGzVx5YXYCo/V2qK61R2cOOeZwu1cgFv/sW1+RkwDtrm/dET5mFlt+RMAwEXXaKnob4hWFko9Up5GRFgxI2LH8hdWmhSTPz0CkrdqCDruW67GAyceqFotx7x7VZI1MH1Eg8vHxpfhwe4zzf/Dd6Ll0gLs+pfwfQJ6WAiGqppumK0WU/q/slDPVHHEJe7Jq+8cabwWgg63An0XSHuEiGzwItjssB9X1V3cQ+vOWDbESCWJ6m7M6191vcry3K6uvBYVaG/uwqN1IJqelNvXpM1kYKmPbirH1TvXpclS4fuQj6bM2GUcJp7shQA6qoGCvZ4YlDaalA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jZKYNzgO4R+yJ/z5uGBcu2HdaG1eYNJanTP/U7Q+1nA=;
 b=gZU6kal1YRceTQK3j19RlLZ2OIt2NakBUWVrqdjJg592Ij+WVJaoktPP0U+J+B3x24qOcBQzMCyj+HDJb4D8ReVUS4AylVkhj4gMmo6JyG3f8O5gSc11Zlyh+FfTbFhxXVZz7PEjQmj1W4uIUnp4yOhRYEw/Cc3gZ3T8QDWKFwLl1J2jgaDdWu0KMOgt9EbMRic5fNsaVi19MsBFU3Dre109AukpP4LgwOnawxMbEmIoWV9tTlFXyd5jeLkdo1TjRxBrxkX6Tdire3IoUHY/CoaPUEm0no/rljbhldcclUBVMyIOjBFx9/oq4T/WPqyqRCeB1gHQG9NYEkuBrdOMSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jZKYNzgO4R+yJ/z5uGBcu2HdaG1eYNJanTP/U7Q+1nA=;
 b=mxPz19i/X6fbyD6JgR87wLZHEiKGhAFhf46yHwcQILckDGbZbKdbu/hkUGWg2DEJ45pyF9xK6SAkjVw03Y1q8iPC6KVstu05Mh0bbNAC23lkqLtq/8qO6w7lm+qdNyy8Yqv1l6kBagdCDrIN9PkNeL2uy2Y/xZorl9Azirt7sw+0EpGYwcDlQzA8v+5yzpZDpdzhFY4++xIxpOjnuwKadsILyWPW5a3aNaLh6WXsf2kveOTGDSe8JBKu0T9KV7ta7Iaf8XXYByo1NyLuUbA9CxRA2sjXBQE/ElAWwrN5HDyIswdwuwIIcJKnxSmqpLeoJyatMHlmqE6qLMJrXDiA0Q==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by IA1PR12MB6601.namprd12.prod.outlook.com (2603:10b6:208:3a3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 17:49:16 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd%3]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 17:49:16 +0000
From: Parav Pandit <parav@nvidia.com>
To: Srujana Challa <schalla@marvell.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>
CC: "mst@redhat.com" <mst@redhat.com>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "mvaralar@redhat.com" <mvaralar@redhat.com>,
	"sma@napatech.com" <sma@napatech.com>, "sburla@marvell.com"
	<sburla@marvell.com>, "ndabilpuram@marvell.com" <ndabilpuram@marvell.com>,
	"jerinj@marvell.com" <jerinj@marvell.com>, "anoobj@marvell.com"
	<anoobj@marvell.com>
Subject: RE: [PATCH RFC v4 3/4] virtio-crypto: Add new IPsec opcodes to data
 request
Thread-Topic: [PATCH RFC v4 3/4] virtio-crypto: Add new IPsec opcodes to data
 request
Thread-Index: AQHbnId2/YVpth/pSUeWCxylSOl6lrOI09BA
Date: Fri, 28 Mar 2025 17:49:16 +0000
Message-ID:
 <CY8PR12MB7195EC78C997887D54A7C128DCA02@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20250324063843.1599512-1-schalla@marvell.com>
 <20250324063843.1599512-4-schalla@marvell.com>
In-Reply-To: <20250324063843.1599512-4-schalla@marvell.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|IA1PR12MB6601:EE_
x-ms-office365-filtering-correlation-id: 8bccf54f-4729-4cd1-3d42-08dd6e20dbed
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?rRgovkKS6DRMnB+KsexPkwj5h3GuoJ/Z3r4Vu0JmYaaktRhdExl0/gy8WAyo?=
 =?us-ascii?Q?n9k2mBeyDMyd4LGkMjWIevP1T1P7vFIVplK93SeEM/FJxc7eAoKXiwf5wvL/?=
 =?us-ascii?Q?XaDf7stbjSgneLqnR0Ok4tgKOlem1NxKK9Y8i4kVhFNK3ZgFKGKABr09lEL+?=
 =?us-ascii?Q?hYP2SM2rPMV5njadhr/cDOsF+YGWcl+ISzn9cnHst/6Q9R059eKvJ/VXJ8OJ?=
 =?us-ascii?Q?aUe/dXFpHtQt6jWvEyTQCezVFA1FsUNLTSh2P6hxX6aljyWBoTqsenl12jfy?=
 =?us-ascii?Q?WLM8l0uP4/gxYkicboXkUnvF1a8M25JwX0Fzo6g4HZVLVDq/4WQPoSK1QIip?=
 =?us-ascii?Q?Prl8B399iK6WuLiKjOr56XPSUPuEeWBDJy7TUEC4Y92zB040j+PqqzLOjHn6?=
 =?us-ascii?Q?m/T9ji1Ttu65Ozyd1tmNYiQLL7NE6iZU8LIyrFwYsKJyb9nuvAx6XmumZx5e?=
 =?us-ascii?Q?IoL8bptTJai9kUNFXax1o0xBCtZzjvCeUwkfCdjCz8jtv0qwkE5rcfd8sJMZ?=
 =?us-ascii?Q?F8fAA0XPmaTwn2bYB/oGevZ51iG1QXF9rFr3ce9UNq8nW3tDTbi6bjadhw1V?=
 =?us-ascii?Q?llYEbvOVCHsYdGhh1MxoQ8cM9wDVsVqkNq4daJNt/bYDdkqLNZLPrEoRFGZO?=
 =?us-ascii?Q?fZ84p78UvPbGp0pzQhBkXXIPHzOqOgRMxigVhVlvqh4FrFl7pfmOb23sk5+o?=
 =?us-ascii?Q?8hU5pa0MpEp8NuLMBANHMDW0Dz+rQoPDM5ZO8P7T0HuDSHPaHK11Kc1FlJ8L?=
 =?us-ascii?Q?khxiAYuUpwqYfGP0SfIhZ+eFTfqtNKlb0F6rsqtufGULviB9uQ/nYowuIIjq?=
 =?us-ascii?Q?Gie1u5Hdn30f0G4hX7o0qtOZBj4fwyD6/F3SNePLBCAM+X06R6dTy1gIvrr6?=
 =?us-ascii?Q?l7MdEj0UwbeBGMIWhzJtm2akijJSxmfFITDN86nl5v8jqX6Aw42zw3RPlbuC?=
 =?us-ascii?Q?iePY2snGXiVDUCMJAJ2GuA+oaQvXflgAacOXK5DO+DDkbYoxzl8Gt29MruRz?=
 =?us-ascii?Q?mcq/P9de6vTYpFHt9zno2iVgErRTFC08iPYOzwAvvivyOWOuom3qO0WHq+Wa?=
 =?us-ascii?Q?QWKW/4cEwYe1AFzgr7r+yS4TYjgrCXO3rqSfIck1pqB8ex+Eox+RFNYswuMG?=
 =?us-ascii?Q?lOuBqiDcjpaBPSfND0Hp1XPeDlJzwfxz0OQ5ZnaDS1NgWCLt01IF74Slk+tm?=
 =?us-ascii?Q?LpfdzHXpo1GDr3Az/Hb4pyPhqxdGLLcLy7YIF8HBJATfXMS5yKan2Ph9hHWH?=
 =?us-ascii?Q?lFVPpAfwigOPeol+Tc/MB+OFs4PepHY+3YfbuZ2K34xnbcj8vn6WvBTzwlGT?=
 =?us-ascii?Q?/QS4EoU5vVUtedrrF7caIgfbtEkzF3Kv/eI0Si3vu/VSBu78T0NCvd+s73Dc?=
 =?us-ascii?Q?WRDbEKD6RZ3zuXh3En3sHVvmbyKPiEuZZaiu/k7PHJoXzCX6DykFAFzpk5Pn?=
 =?us-ascii?Q?b5BScuj6MfyQOWyJloVOiljedUuTvhgYO1stTNMQiyAe+QjJ8Q1zxdDglBVF?=
 =?us-ascii?Q?Zc8YDqHAitwTtW4=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?UW1lwPI+UjXTyDny7fnknCYQzPB8icZIlHft2oCh25x79O7Pd7+ssbA5KVpy?=
 =?us-ascii?Q?hDdaL7Jkjg8AcCaUlVSfCIgu8dhCjzwW3HO0rJzvkzQgqWoumJfcCdJWfvf0?=
 =?us-ascii?Q?AIaDTXYeQ3mQBYtzLUohPnKpcuGWI4LrsH62w6HwuJzHMtJqdeA/Xmcq/skz?=
 =?us-ascii?Q?9kwDNua5u8juobafxIKCxviGX0AQ0aRRBTfnTTSaXl4j2OOLjrU4UmR3l4A1?=
 =?us-ascii?Q?n5lOqZG98txnrUL+nubQctg1faU20ftT4sqwrc5G1tOuzPZZah9Wfc6av0T9?=
 =?us-ascii?Q?+LLt/GKLGDjXg0UNK0W+s1uE+RZIafX6FlFmTS2oKhgzY5TdA3h/bbYktZeR?=
 =?us-ascii?Q?TdsCyrLeYY13/R8843y+oIWd7S2GctywIbQj94o3Kr910wEDcgldjYXOqVIP?=
 =?us-ascii?Q?7ixsWo+n7yEIulwo7cCJ7zXQSLyLu0bf3IhvF880rCFSIaS4wm4gbWNkoxRj?=
 =?us-ascii?Q?S1TSWumpP0SodP1wb+wkexMqSyKk4bbV3vHCwjqB2xaRsilR7rynblAsMzOP?=
 =?us-ascii?Q?vu2pPAxhmUVvdLkcHSH9dp8ObvwT/+u19zxZELXv5n462chKqunafqYCPADa?=
 =?us-ascii?Q?VEliZaSwVE/3npIUVvHWjrBhqjavOddeVSTiwDtZKgHxWpbcc3v2wOH3ylY1?=
 =?us-ascii?Q?AyJu0FKkrw8x5QjRZeM8cJe/Ml0Pi3gNYlKpQXkhIYwLR3StxG8xeJfmnW7J?=
 =?us-ascii?Q?xx8NY1261ijNaEg9PvFAus94WDd5VQ+uLaPb8nb+0S7U/UVh0kQe6odvfQij?=
 =?us-ascii?Q?jwahbj0y5j5dU1ccJKFJhinjOrIISdqvR4bQ9GMXS9XdKJanQDhUSTZWgl3c?=
 =?us-ascii?Q?oUpAmyWtuHc2oAXCdX8lZSjyDrpzS/ulTmnFElnRJ/jGh1t066COum+XkOo7?=
 =?us-ascii?Q?LbCcMzyEUTjcDXOYSSKXvZPf39vR3KZFitZ5YOqYJL6ATowrz50AUa+uiaWK?=
 =?us-ascii?Q?XplDo1AvXnTtbCPJikuJCUue46c/ov33zbZfP0mMqT2binGgmf6TEDs5LBhK?=
 =?us-ascii?Q?HovRcxb/aiR9YMuFBXnTTYOwRtqU0e3ZisGMbFkgntSQ57h2wVHiiBqKhYh4?=
 =?us-ascii?Q?YdMLInPEseroZMahsz504/K5++pzgGflv+mwAbBqBE4OoQFQjJCswY8u/pln?=
 =?us-ascii?Q?UsDtias5TMN2KrzZag9bvtTnmwfw2FjWZ/7inITbytdDPou/7QlHoaiM1o/E?=
 =?us-ascii?Q?r9miHxbosxsUcs/qp5yKNFaojJPzJqsDNQ0mkN0ntEHG8ByjBuewzcP9J6yA?=
 =?us-ascii?Q?N0XNjdhq0BIoalPaspwq3ogZQ8Vq5peXTSMYCo+ARlwqzl+VKIJbuj3DNkJK?=
 =?us-ascii?Q?zbnZCbL7x+vzlcPjv5dAtBUTfgQl1c8h8AqN6jKWXCnLQppfGFIDchsTeiGP?=
 =?us-ascii?Q?ZzNmRVe9EQBLj1E7pDiTIFInCX2wF0j+Z+hLfanPEnycPsMhwYmoX60NjbCP?=
 =?us-ascii?Q?1dSNxkqs4fpKh7JMbgbuw1s6YmN/OBjGQqcxmyt4cPhmCu2OuyiMx+2pFItK?=
 =?us-ascii?Q?dA/q2diNY4r9jVssMON8RJRh8dWjAq23JEeH1l09ufkN2HYXpq6KS3NXP6Qy?=
 =?us-ascii?Q?JH4FyYny2n8StEGqdfE=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bccf54f-4729-4cd1-3d42-08dd6e20dbed
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2025 17:49:16.4108
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u7liBU3CQEIHnX91EBgkwCyUIa0bBRX+A/onvXEW0AYRO2+5+HqkGEzZ9L6LGaTrWgH5KVmWmI1S6+Us11sM0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6601


> From: Srujana Challa <schalla@marvell.com>
> Sent: Monday, March 24, 2025 12:09 PM
>=20
> Adds new IPsec opcodes, VIRTIO_CRYPTO_IPSEC_OUTBOUND and
> VIRTIO_CRYPTO_IPSEC_INBOUND and defines opcode specific data structures
> for IPsec data processing.
>=20
> Reviewed-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
> Signed-off-by: Srujana Challa <schalla@marvell.com>
> ---
>  device-types/crypto/description.tex | 83
> +++++++++++++++++++++++++++++
>  1 file changed, 83 insertions(+)
>=20
> diff --git a/device-types/crypto/description.tex b/device-
> types/crypto/description.tex
> index da1f193..08aeed6 100644
> --- a/device-types/crypto/description.tex
> +++ b/device-types/crypto/description.tex
> @@ -379,6 +379,7 @@ \subsubsection{Operation Status}\label{sec:Device
> Types / Crypto Device / Device
>      VIRTIO_CRYPTO_INVSESS =3D 4,
>      VIRTIO_CRYPTO_NOSPC =3D 5,
>      VIRTIO_CRYPTO_KEY_REJECTED =3D 6,
> +    VIRTIO_CRYPTO_IPSEC_SA_SOFT_EXPIRY =3D 7,
>      VIRTIO_CRYPTO_MAX
>  };
>  \end{lstlisting}
> @@ -391,6 +392,8 @@ \subsubsection{Operation Status}\label{sec:Device
> Types / Crypto Device / Device  \item VIRTIO_CRYPTO_NOSPC: no free sessio=
n
> ID (only when the VIRTIO_CRYPTO_F_REVISION_1
>      feature bit is negotiated).
>  \item VIRTIO_CRYPTO_KEY_REJECTED: signature verification failed (only
> when AKCIPHER verification).
> +\item VIRTIO_CRYPTO_IPSEC_SA_SOFT_EXPIRY: IPsec SA lifetime soft limits
> are reached
> +    (only during the operation of the IPsec service).
Ideally a flag new field is better.
_OK is supposed to say, its completed.
And _SOFT_EXPIRY is also successful completion, but with warning, its more =
of extra flag.
But such field does not exist where a new bit can be defined.
May be this is fine.

Lets right is clearly that when _SOFT_EXPIRY occurs, the request is complet=
ed successfully, but one or all of the soft limits are reached.

>  \item VIRTIO_CRYPTO_ERR: any failure not mentioned above occurs.
>  \end{itemize*}
>=20
> @@ -992,6 +995,10 @@ \subsubsection{Data Virtqueue}\label{sec:Device
> Types / Crypto Device / Device O
>      VIRTIO_CRYPTO_OPCODE(VIRTIO_CRYPTO_SERVICE_AKCIPHER, 0x02)
> #define VIRTIO_CRYPTO_AKCIPHER_VERIFY \
>      VIRTIO_CRYPTO_OPCODE(VIRTIO_CRYPTO_SERVICE_AKCIPHER, 0x03)
> +#define VIRTIO_CRYPTO_IPSEC_OUTBOUND \
> +    VIRTIO_CRYPTO_OPCODE(VIRTIO_CRYPTO_SERVICE_IPSEC, 0x00) #define
> +VIRTIO_CRYPTO_IPSEC_INBOUND \
> +    VIRTIO_CRYPTO_OPCODE(VIRTIO_CRYPTO_SERVICE_IPSEC, 0x01)
>      le32 opcode;
>      /* algo should be service-specific algorithms */
>      le32 algo;
> @@ -1009,6 +1016,17 @@ \subsubsection{Data Virtqueue}\label{sec:Device
> Types / Crypto Device / Device O  If VIRTIO_CRYPTO_F_REVISION_1 is
> negotiated but VIRTIO_CRYPTO_F_<SERVICE>_STATELESS_MODE
>  is not negotiated, then the device SHOULD reject <SERVICE> requests if
> VIRTIO_CRYPTO_FLAG_SESSION_MODE is not set (in \field{flag}).
> +
> +For VIRTIO_CRYPTO_IPSEC_OUTBOUND and
> VIRTIO_CRYPTO_IPSEC_INBOUND
> +opcodes, \field{algo} is ignored.
> +
> +For VIRTIO_CRYPTO_IPSEC_OUTBOUND opcode, \field{session_id} MUST be
> set
> +to one of the resource objects \field{id} created using
> +VIRTIO_CRYPTO_RESOURCE_OBJ_IPSEC_OUTBOUND_SA resource type.
> +
> +For VIRTIO_CRYPTO_IPSEC_INBOUND opcode, \field{session_id} MUST be
> set
> +to one of the resource objects \field{id} created using
> +VIRTIO_CRYPTO_RESOURCE_OBJ_IPSEC_INBOUND_SA resource type.
>  \end{note}
>=20
>  The dataq request is composed of four parts:
> @@ -1096,6 +1114,13 @@ \subsubsection{Data Virtqueue}\label{sec:Device
> Types / Crypto Device / Device O
>          and struct virtio_crypto_akcipher_data_flf is padded to 48 bytes=
 if NOT
> negotiated,
>          and \field{op_vlf} is struct virtio_crypto_akcipher_data_vlf.
>      \end{itemize*}
> +\item If the the opcode (in \field{header}) is
> VIRTIO_CRYPTO_IPSEC_OUTBOUND
> +    or VIRTIO_CRYPTO_IPSEC_INBOUND then:
> +    \begin{itemize*}
> +    \item \field{op_flf} is struct virtio_crypto_ipsec_data_flf and
> +        \field{op_vlf} is struct virtio_crypto_ipsec_data_vlf.
> +	Works only for session mode.
> +    \end{itemize*}
>  \end{itemize*}
>=20
>  \field{inhdr} is a unified input header that used to return the status o=
f @@ -
> 1916,11 +1941,27 @@ \subsubsection{IPSEC Service
> Operation}\label{sec:Device Types / Crypto Device /  in tunnel mode, as w=
ell
> as the ESP/AH header from the packet(See \hyperref[intro:IPSEC]{IPSEC} RF=
C).
>  The resulting packet contains only the plain data.
>=20
> +The driver can request IPsec Inbound processing by \begin{itemize*}
> +\item Creating inbound SAs using the
> VIRTIO_CRYPTO_RESOURCE_OBJ_IPSEC_INBOUND_SA command.
> +\item Setting the \field{opcode} in struct virtio_crypto_op_data_req to
> +VIRTIO_CRYPTO_IPSEC_INBOUND.
> +\end{itemize*}
> +
>  IPsec Outbound processing: The device performs encryption, attach ICV,
> update/add IP header, add ESP/AH header/trailer.
>=20
> +The driver can request IPsec outbound processing by \begin{itemize*}
> +\item Creating outbound SAs using the
> VIRTIO_CRYPTO_RESOURCE_OBJ_IPSEC_OUTBOUND_SA command.
> +\item Setting the \field{opcode} in struct virtio_crypto_op_data_req to
> +VIRTIO_CRYPTO_IPSEC_OUTBOUND.
> +\end{itemize*}
> +
>  A crypto device can support number of IPsec SAs, allowing it to manage
> multiple secure  connections simultaneously.
> +See \ref{sec:Device Types / Crypto Device / Device Operation / IPsec
> +Service Operation / Resource objects} for IPsec SA information.
>=20
>  The device and the driver indicate IPsec SA resource limits using the
> VIRTIO_CRYPTO_IPSEC_RESOURCE_CAP capability specifying the limits on the
> number of @@ -2192,3 +2233,45 @@ \subsubsection{IPSEC Service
> Operation}\label{sec:Device Types / Crypto Device /  capability
> VIRTIO_CRYPTO_IPSEC_RESOURCE_CAP. For the IPsec inbound SA resource
> object  \field{resource_obj_specific_data} is in the format  \field{struc=
t
> virtio_crypto_resource_obj_ipsec_sa}.
> +
> +\paragraph{Data processing}
> +\label{par:Device Types / Crypto Device / Device Operation / IPsec
> +Service Operation / Data processing}
> +
> +Data requests for IPsec processing are as follows:
> +
> +\begin{lstlisting}
> +struct virtio_crypto_ipsec_data_flf {
> +        /* length of source data, full IP/IPsec packet */
> +        le32 src_data_len;
> +        /* length of dst data */
> +        le32 dst_data_len;
> +};
> +
> +struct virtio_crypto_ipsec_data_vlf {
> +        /* Device read only portion */
> +        /* Source data */
> +        u8 src_data[src_data_len];
> +
> +        /* Device write only portion */
> +        /* Pointer to output data */
> +        u8 dst_data[dst_data_len];
> +};
> +\end{lstlisting}
> +
> +Each data request uses the virtio_crypto_ipsec_data_flf structure and
> +the virtio_crypto_ipsec_data_vlf structure to store information used to
> +run the IPSEC operations.
> +
> +For IPsec encryption:
> +\field{src_data} is the full IP packet that will be processed.
> +\field{src_data_len} is the length of source data.
> +\field{dst_result} is the result ESP encrypted packet and
> +\field{dst_data_len} is the length of it. Please note, dst_data_len
> +MUST include additional header and trailer lengths.
> +
> +For IPsec decryption:
> +\field{src_data} is the IPsec packet that will be processed.
> +\field{src_data_len} is the length of source data.
> +\field{dst_result} is the result plain IP packet and
> +\field{dst_data_len} is the length of it.
> --
> 2.25.1

Generally the src and dst lengths are not passed as side data.
It is usually the length described in the descriptors itself.
Here src_data_len will be the sum of length of descriptors with READ attrib=
ute.
For example, 1 descriptor of (1500-12)=3D1488 bytes with READ attribute.
And for dst, the descriptor will be of 1488+ESP hdr size with attribute DES=
C_F_WRITE.

The device will parse and derive the length.
I also think that 'deriving' length is not so good and it is something we n=
eed to improve.
One way to improve it at generic level is to have constant size control hea=
der for every request the descriptor ring.
Such as,
Ctrl_hdr
Desc[0 to N] -> N value in ctrl_hdr.

This can be done in a different series as generic optimization.
