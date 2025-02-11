Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2065.outbound.protection.outlook.com [40.107.237.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F502265622
	for <virtio-comment@lists.linux.dev>; Tue, 11 Feb 2025 19:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739303759; cv=fail; b=DQCOpQbxLYuz/lqsGAiymOKM/PxgNpJcS5N4IE/4/F92Eo0VyIFO30Q6rBjchp5n2kOSgdCnE44BZdFlbV4JTPWnExbOyjDpKwRR8XG7GyT5vMRBCq471wz9gD9h1T1CVVzMGeZFC2DsynESUShLUUUPpPkI+KeZMADnzcV3FmE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739303759; c=relaxed/simple;
	bh=W+C6/Hj8nlA3BDRu3A+PiZQV48ritILJ0JF6jZpkvYY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gTtz6rchyOoxE5y65uQQf0t9XE499P3XIMy0n/Vp0/2TAtMM19RMUu/+ueNOOXLIDa4EFThP9NeK2Vxc73XogHs4dkkLsmRAhC7cUyIk8EUP9ID9uFN1Tuoq1lD7GL6lBtb6B0c7VFm38KyIO9bfP37nWw0uR7/rSvcotzIpqcM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=e9Y2cUcV; arc=fail smtp.client-ip=40.107.237.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="e9Y2cUcV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X/2zy0A6cL132CxtbyPh+ln1CHS/8D/cM51HwePMA4FT0YpVn3AjmHldJ92qCCGNLlexx8YLOHqMYS9+LUyY2oRvr0ctPCPlZLtopyYucOypuiB5+HJeMCp2mayEFjgpfl7E+3IZ0GKZR6YySdg95CnXN2f9s7ySuzAggkkTmC8UTIqeq+ovkAQzYdFW/AjsCiPQD+g+2lVgQy1mGqOccd2GQvvK0TX8OE/PYteUwOmnIWKV2yBfsxw4hDrGwZYn8jsC+iQb/9NuTvoPW5NzoCm2Ca4/K/eEwDOnVuqaSEK462il9EuYjrGhc9lN2EOOoX6ZREOL3yoVGDOwkQk0LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5nAUYmp8DCdt6hwKg0Kj7ZlcIizXOYCigK7l0070aGw=;
 b=G3EgnYihy/auEpiQdvWxcHuy8599Z6nZP05BWqPDLtIGXcp77C0uTxsrqkgQqgMGcbrEHi383gEiXSPnu75aebnmQXOyxM8I8bjp1iqPD3oLwq7XjipYPgOc7pWeoIj8Cit3Ac/mIbbxDR3/IJs+Ug7cfkTRo26nXVgVRuNzoOhmLLgXNr86mopVXDEUjh9p1nNoopkZjZuY4Jr/SGAAMxqDKBh9U+UvrWLUuqcp4B0/lvv2wUsWB/E2eLFm19h4cT+2iNHQl2uG3hhDHrUThQjoP9ZA+7zWrJ13+b+oddFFQW22C1ykxIWr9bfPNfvU8stbBSlrmWb4QnVKrZDf1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5nAUYmp8DCdt6hwKg0Kj7ZlcIizXOYCigK7l0070aGw=;
 b=e9Y2cUcVxOYbtpLzhexpsYO5OFib7tPknTxZRRgS2352q0lzq/uIpsherGBnIacJgFDig/S9OH//AZhE/X++skwG6dqwPTSrlVsc+DOA7NGTQflLI303gBjljDC3Q4WSz4ArKyJuv2pqPecxOCfuC3+XuPOE4u7ScpM7xrSFlwMX0EOC7L4deAku2XZx5ONIaD5D99nyEMrPlbubFrXGlWCGAJoZU9xAajP86qHevoV1I3G2A5T5z9HL/1tBGXZBew8YD0S+KeubrhcZcP6Mb/fwxwb1dMCAU1g+3syBeGpTGAn/ZQQtfFUqng92Sj9qot3a9anJcejpDEmxsI9gZw==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by CH3PR12MB7716.namprd12.prod.outlook.com (2603:10b6:610:145::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.11; Tue, 11 Feb
 2025 19:55:50 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd%3]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 19:55:50 +0000
From: Parav Pandit <parav@nvidia.com>
To: Srujana Challa <schalla@marvell.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>
CC: "mst@redhat.com" <mst@redhat.com>, "pabeni@redhat.com"
	<pabeni@redhat.com>, "jasowang@redhat.com" <jasowang@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>, "ndabilpuram@marvell.com"
	<ndabilpuram@marvell.com>, "jerinj@marvell.com" <jerinj@marvell.com>
Subject: RE: [PATCH RFC v2 1/4] virtio-net: Add IPsec operation, capabilities
 and resource objects
Thread-Topic: [PATCH RFC v2 1/4] virtio-net: Add IPsec operation, capabilities
 and resource objects
Thread-Index: AQHbbJXymazuuDriDke8oOLpStpIwbNCmHVg
Date: Tue, 11 Feb 2025 19:55:50 +0000
Message-ID:
 <CY8PR12MB71958BBB9A2E8216520917FCDCFD2@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20250122062144.266725-1-schalla@marvell.com>
 <20250122062144.266725-2-schalla@marvell.com>
In-Reply-To: <20250122062144.266725-2-schalla@marvell.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|CH3PR12MB7716:EE_
x-ms-office365-filtering-correlation-id: 269e2122-362a-46d8-8e44-08dd4ad615d7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|10070799003|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?p5WMa83WBJIAjVZebtmFICRpc/QLg0DDtVDh+E9Z23+CTF5WPtalRZm7xsLc?=
 =?us-ascii?Q?ZKHSD7B1zTv9iW9p+BcLBraHfW0xfe0jWxcvcQMKyZzGXs0/FP4byspAzaRE?=
 =?us-ascii?Q?xDYxwB+sY0vx5bcuXoshGCDA0jti/FUHyXBCZRBHVeP8WTIK8/6x0KJE7hgF?=
 =?us-ascii?Q?TZ2B5A8q0QOz5UQRTH1+FGM7W6nTJkHiGRCXDcDVKTalrICidsFs1jz23Mpo?=
 =?us-ascii?Q?M5myCANvtm6BPBJuUQb79WaWhbHOIy9f10MH5vmXVHUhXtd1qdw17eSC5wea?=
 =?us-ascii?Q?VV1AlYCzvChbRI8+O3EG22dauWlk6JcgnFigQLN5sO03Q5FdpZJ+srr/Z5PQ?=
 =?us-ascii?Q?jX/+vM51JgwBnYvWZdJctBjg5eoO3UlsuBlz/2mwg0xGB7tpmSnqsoCujm96?=
 =?us-ascii?Q?rTj1iw7dDr0w0CPUtTiWHuXVUurfHPbt5Rq1RwX2QPUgZWjiE15K89jQ+w0i?=
 =?us-ascii?Q?1nyO7LaM8/kIFzxqetmdscfiPeWG4djC1UBVieRTw1Q7sT0hkeQ1m9pormOi?=
 =?us-ascii?Q?ARIUMDkqbDqp3flsI3urSil89aGSOiwwJ/iBWgvYs4w1/plsFHpPcUHpH2TL?=
 =?us-ascii?Q?J1CnrKcv389v4TskPHlR/Ql7BqFdokG4bvWOqHhru/TOdx9lTrOlulruQOXZ?=
 =?us-ascii?Q?H+Y75kMVJpWqFVNy/zFaxMCdv86SUIhLXnf+VbgfNnUrcCpuzEyuKwgQzT4K?=
 =?us-ascii?Q?GqcNZqnWqlNW0MxpEtUfQTHG5r58zEFVeYbCdM/C6kuGoeJJi66kw3u3Upzx?=
 =?us-ascii?Q?mZMrpm7sJ6RWZulMMncbplRsQvTxgt+R5yIrUPZX1/61ZKMcmNEXVj/nUKHg?=
 =?us-ascii?Q?B9ZiKTrbkp2DQGshnNfAcPtzLWXXyucb13YtiQnhwT+KszaUSn67Z44HIfwk?=
 =?us-ascii?Q?vghgmMhi5OEVPuGfbgl+DxATz9t6KrEreaoY9uvZdroC2ZCg3k95knG/TuIX?=
 =?us-ascii?Q?EbYnWgkKql5uarn+rgi7GOGt2rvvsgZolK35zuqDLSKnw7k69SK7eqlGpfLa?=
 =?us-ascii?Q?K7ZuHZy790w4sjW4tEwDjJdNV7rD8ut9xbWFxP4LL0n4MuWVN4k82qPOEmBp?=
 =?us-ascii?Q?v7cHb4SS49KBuXEBVUeKC/wRJyMgg11TS/E4wlPyC1aVX8XFy11+CrkF6xGq?=
 =?us-ascii?Q?5bYbNSTDLyBvst/gVA9fduXGj+tAalU5Q3thFhm0lE1d78WO7wEWnCf1Mwwh?=
 =?us-ascii?Q?3FT+RGjuWfz0K7vwq1U23T2bylZvH6ALwtfbZMe7keehRRhW1hoxOZm/iQZM?=
 =?us-ascii?Q?uz+8Bkj4zmZH66JFbkdhBNjTT7FmjWiIMf4kVj6TgCkJHZK+moBcEvaQwyCB?=
 =?us-ascii?Q?IGvu07kCcFt3z9vChGK7CqJRAphVrZD5rMN0I/PGQgm8QJg3PtKELVMD1ejE?=
 =?us-ascii?Q?6XFDV2/rc6BDUlFqb38D3xqn7KM3yoeHzXqQ/JyrjF656IJzrtQq9rGfXrE0?=
 =?us-ascii?Q?cDcLyfjPauxbA0Q3AjsOccZe1aOeT6tb?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?LUjC3OaEyb2vVp8DrxkWw56MtLHkGfdZb5Vd94NvCAt4pCM4NRDXjDB88jt5?=
 =?us-ascii?Q?jA/40j2BU/XaHdz9Jj62MEb6QipDM3c8NF031cJHP9omrokE2IVdVcrMsxNG?=
 =?us-ascii?Q?JrbrhB11v8he/5Tcqw3XjPLXy6T6CDnRRlokHu8UMw0m9WSTW6LcCCkRt9SP?=
 =?us-ascii?Q?CYd+gqEP+hIfrrgBaYv3TBMDKJ/XQNTfhInKzzkn+2FxvQTwnK8eJhGXPTcL?=
 =?us-ascii?Q?VK19qQdU0mMJ8hkckO4KTbnRKislWewwP/QhScqtBidjSu08tY67VNi3gx+9?=
 =?us-ascii?Q?aJ/x6eKz9Ot2vd/3bD071k86vXVIKqR8imkpsSDsB7yWW6qRyeXV320ezG0+?=
 =?us-ascii?Q?zc/gGCUwKX2Rm619W51+o1N+D2wAwbcH9vPElOo8MSUh/cCLszAXenC5W6ok?=
 =?us-ascii?Q?uNGJRxVb3yMkbJRnkp1+OA7eVuHtt620GozaVH51RUGciRAgPmn0VkfoZY8R?=
 =?us-ascii?Q?UAvF7j4DSSbLAD+qBpNSRcvw+VExhk6YL/Hd/74hk13vo4VTGhL8z6xcTwvS?=
 =?us-ascii?Q?Qrw2nmScS8VKUCyeptymr1w+Don+ld08TF9XEMfqlo6Ci3X8yJ3DG5EsYbvy?=
 =?us-ascii?Q?Gc6ms/lUIpF4IYKOaUqUYL5Shl9VRNIcUsKgAYoXAXmWXzqp7SRDPm2s/XjF?=
 =?us-ascii?Q?N81KYxGg2tb2gVQ8v3risvv/bidu6nkoIqfPAMoeFAhF/+F4P9QDp2CA/egB?=
 =?us-ascii?Q?1yo3CSTTw4f0IDuQS7wIYa18Y9xHy3H6w+Elm//Glpqyy+/w38EToz+oq0uI?=
 =?us-ascii?Q?DWqNCgSjxfQUO7gITZsxU/a8DqwoRQ3JpJSR2JAtZ4N5ZS+y5Tp/4qUgW4QG?=
 =?us-ascii?Q?eNK2z+IoeqhS0p1i786tByXMybQRoGc5QZxG4+XFCE9Dk3nb7Kq+AC5O+Mx4?=
 =?us-ascii?Q?mo+0rh+IRvaof4Zqk2Fo4sAOmspmvpSHkmZm6kSwhHQjtzXk0UZhSaG13anP?=
 =?us-ascii?Q?F7y3V5YfK8PaaOhNWdXdtexJtuSArZ1gnG55urpFVpeE62N+bZmyHqd8tCnp?=
 =?us-ascii?Q?rCdh7AChw5UkuoBIUdZHgM9s4J+AzyRbWvf4jqi6o/GAvsDjClvc/f4fCbnA?=
 =?us-ascii?Q?lpSpOceFythCUMR9iwn1r4BhKDFCUjIdMrj1jcOMe0Dmaq3UZqngWHHWvIVn?=
 =?us-ascii?Q?1uyceLq3MDSSxcno2+axIWrjxWK5zZSNyh8ppdCFcmL+5S2rqKZJJdT9kAuI?=
 =?us-ascii?Q?FxkCZsLKab1wUccU70rvWH2rUb/FgIIMVyEBr34OPYft+7T79l1MWDLmvgJY?=
 =?us-ascii?Q?tMLLQA1VqSHtQe+1GM+yTdlItxqpIrVKXn12PsSMYa5A2dWl8fXoLUzT3WtG?=
 =?us-ascii?Q?J5J7vdJyAhcWfgrgUG8/hkTLc3uxak38U+V95+7ua35xiyb1fmtzpJQ4Pt+Z?=
 =?us-ascii?Q?JfBpcTyvq4P/umNSzHoyOBtQCnRKuwrszatKODsH8wmYpnRFAqloVwtTwwCj?=
 =?us-ascii?Q?X4eCWfzPIX3gxeKL7L0lDaXBl9zJk95zB3V790RdM+NSPGCOUaCbzNZPN6V0?=
 =?us-ascii?Q?A00xPaiK1hKvETdPuJ7S8ztrw5uOSiaR8vAhOg4QouQobMv7UBFg4ipepein?=
 =?us-ascii?Q?X0NMxJn5QAfzvNaC36d0GdyK7Kp9KMg2Gq3trGGDlneZ5JexcEn7zF4QVo8y?=
 =?us-ascii?Q?agDO2OXhtyK0IdMSrsyoBmQ=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 269e2122-362a-46d8-8e44-08dd4ad615d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2025 19:55:50.6361
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9moLi8XvRu5AYMKALbyOuRU/gZh2NKVyxE9MvltcIC5gD5FkOpaoZq1v2MlSUogZTduIp2Wv59XOtCKzs01+SA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7716


> From: Srujana Challa <schalla@marvell.com>
> Sent: Wednesday, January 22, 2025 11:52 AM
>=20
> This commit introduces the IPsec Operation to the Net device along with t=
he
> capabilities and resource objects. This enables the offloading of IPsec
> processing, both before transmission and after reception, thereby providi=
ng
> inline offload capabilities.
>=20
> Capbilities:
>=20
> 1. IPsec Resource Capability (VIRTIO_CRYPTO_IPSEC_RESOURCE_CAP):
>    Indicates the device's IPsec resource limits, such as the number of
>    encryption and decryption Security Associations (SAs).
> 2. IPsec SA Capability (VIRTIO_CRYPTO_IPSEC_SA_CAP): Specifies the
>    supported IPsec modes, along with the supported cryptographic
>    algorithms, authentication algorithms, IPsec options and
>    anti-replay window size.
>=20
> Resource objects:
> 1. VIRTIO_NET_RESOURCE_OBJ_IPSEC_OUTB_SA
> 2. VIRTIO_NET_RESOURCE_OBJ_IPSEC_INB_SA
>=20
> These IPsec SA resource objects encompass parameters necessary for packet
> encryption and decryption. These include the SPI, tunnel headers, IPsec m=
ode,
> IPsec options, and metadata specific to cipher and authentication.
>=20
> This patch refers the Virtio-crypto IPsec service operation capabilities =
and
> resource objects data structures and crypto algorithm definitions to avoi=
d
> duplication, however the admin command type vaule differs between Virtio-
> crypto and Virtio-net.
>=20
> Signed-off-by: Srujana Challa <schalla@marvell.com>
> ---
>  device-types/net/description.tex | 49
> ++++++++++++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
>=20
> diff --git a/device-types/net/description.tex b/device-
> types/net/description.tex
> index b2a0d39..020d090 100644
> --- a/device-types/net/description.tex
> +++ b/device-types/net/description.tex
> @@ -124,6 +124,8 @@ \subsection{Feature bits}\label{sec:Device Types /
> Network Device / Feature bits  \item[VIRTIO_NET_F_SPEED_DUPLEX(63)]
> Device reports speed and duplex.
>=20
>  \item[VIRTIO_NET_F_RSS_CONTEXT(64)] Device supports multiple RSS
> contexts.
> +
> +\item[VIRTIO_NET_F_IPSEC(69)] Device supports inline IPsec processing.
>  \end{description}
>=20
>  \subsubsection{Feature bit requirements}\label{sec:Device Types / Networ=
k
> Device / Feature bits / Feature bit requirements} @@ -415,6 +417,10 @@
> \subsection{Device and driver capabilities}\label{sec:Device Types / Netw=
ork
> Dev  \hline
>  0x0802 & \hyperref[par:Device Types / Network Device / Device Operation =
/
> Flow filter / Device and driver capabilities / VIRTIO-NET-FF-ACTION-
> CAP]{VIRTIO_NET_FF_ACTION_CAP} & Flow filter action capability \\  \hline
> +0x0803 & \hyperref[par:Device Types / Crypto Device / Device Operation
> +/ IPsec Service Operation / Device and driver capabilities /
> +VIRTIO-CRYPTO-IPSEC-RESOURCE-CAP]{VIRTIO_NET_IPSEC_RESOURCE_CAP}
> &
> +IPsec resource capability \\ \hline
> +0x0804 & \hyperref[par:Device Types / Crypto Device / Device Operation
> +/ IPsec Service Operation / Device and driver capabilities /
> +VIRTIO-CRYPTO-IPSEC-SA-CAP]{VIRTIO_NET_IPSEC_SA_CAP} & IPsec Security
> +Association(SA) capability \\ \hline
>  \end{tabularx}
>=20
>  \subsection{Device resource objects}\label{sec:Device Types / Network
> Device / Device resource objects} @@ -431,6 +437,10 @@
> \subsection{Device resource objects}\label{sec:Device Types / Network Dev=
ice
> / D  \hline
>  0x0202 & \hyperref[par:Device Types / Network Device / Device Operation =
/
> Flow filter / Resource objects / VIRTIO-NET-RESOURCE-OBJ-FF-
> RULE]{VIRTIO_NET_RESOURCE_OBJ_FF_RULE} & Flow filter rule object \\
> \hline
> +0x0203 & \hyperref[par:Device Types / Crypto Device / Device Operation
> +/ IPsec Service Operation / Resource objects /
> +VIRTIO-CRYPTO-RESOURCE-OBJ-IPSEC-OUTBOUND-
> SA]{VIRTIO_NET_RESOURCE_OBJ_I
> +PSEC_OUTB_SA} & IPsec outbound SA resource object \\ \hline
> +0x0204 & \hyperref[par:Device Types / Crypto Device / Device Operation
> +/ IPsec Service Operation / Resource objects /
> +VIRTIO-CRYPTO-RESOURCE-OBJ-IPSEC-INBOUND-
> SA]{VIRTIO_NET_RESOURCE_OBJ_IP
> +SEC_INB_SA} & IPsec inbound SA resource object \\ \hline
>  \end{tabularx}
>=20
>  \subsection{Device Operation}\label{sec:Device Types / Network Device /
> Device Operation} @@ -3020,6 +3030,45 @@ \subsubsection{Flow
> filter}\label{sec:Device Types / Network Device / Device Ope  capability =
and
> the classifier object, unless the VIRTIO_NET_FF_MASK_F_PARTIAL_MASK  is
> enabled.
>=20
> +\subsubsection{IPsec Operation}\label{sec:Device Types / Network Device
> +/ Device Operation / IPsec Operation}
> +
> +A network device can support the processing of IPsec operations when
> +VIRTIO_NET_F_IPSEC feature is negotiated. In addition to standard
> +packet processing, the IPsec protocol processing is also handled by the
> network device.
> +This occurs both pre-transmit and post-receive, providing inline IPsec
> capabilities.
> +
> +IPsec Inbound processing: In receive path the device will perform
> +decryption, authentication, integrity checking and remove additional
> +headers, including tunnel header if in tunnel mode, as well as the
> +ESP/AH header from the packet (See \hyperref[intro:IPSEC]{[IPSEC]}). The
> resulting packet contains only the plain data.
> +
The device performs..
Please use the present tense, check the crypto series as well.


> +IPsec Outbound processing: In transmit path the device will perform
> +encryption, attach ICV, update/add IP header and add ESP/AH
> +header/trailer to the packet and transmit.
> +
Use present tense.
Like how you wrote below for example, 'the driver controls'.

> +\paragraph{Device and driver capabilities} \label{par:Device Types /
> +Network Device / Device Operation / IPsec Operation / Device and driver
> +capabilities}
> +
> +The device and the driver indicate IPsec SA resource limits using the
> +capability \hyperref[par:Device Types / Crypto Device / Device
> +Operation / IPsec Service Operation / Device and driver capabilities /
> +VIRTIO-CRYPTO-IPSEC-RESOURCE-CAP]{VIRTIO_NET_IPSEC_RESOURCE_CAP}
> +The \hyperref[par:Device Types / Crypto Device / Device Operation /
> +IPsec Service Operation / Device and driver capabilities /
> +VIRTIO-CRYPTO-IPSEC-SA-CAP]{VIRTIO_NET_IPSEC_SA_CAP}
> +capability specifies which IPsec protocol capabilities the device
> +supports. The driver indicates the IPsec parameters by setting the IPsec=
 SA
> capability prior to adding any resource objects.
> +
> +\paragraph{Resource objects}
> +\label{par:Device Types / Network Device / Device Operation / IPsec
> +Operation / Resource objects}
> +
> +The driver controls the IPsec SA resource object using administration
> +commands described in \ref{sec:Basic Facilities of a Virtio Device / Dev=
ice
> groups / Group administration commands / Device resource objects}.
> +
> +The IPsec SA resource object contains necessary parameters for packet
> +encryption and decryption. These include the SPI, tunnel headers, IPsec
> +mode, IPsec options, and data specific to cipher and authentication.
> +
> +See \hyperref[par:Device Types / Crypto Device / Device Operation / IPse=
c
> Service Operation / Resource objects / VIRTIO-CRYPTO-RESOURCE-OBJ-IPSEC-
> OUTBOUND-SA]{VIRTIO_NET_RESOURCE_OBJ_IPSEC_OUTB_SA}.
> +
> +See \hyperref[par:Device Types / Crypto Device / Device Operation / IPse=
c
> Service Operation / Resource objects / VIRTIO-CRYPTO-RESOURCE-OBJ-IPSEC-
> INBOUND-SA]{VIRTIO_NET_RESOURCE_OBJ_IPSEC_INB_SA}.
> +
>  \subsubsection{Legacy Interface: Framing Requirements}\label{sec:Device
> Types / Network Device / Legacy Interface: Framing Requirements}
>=20
> --
> 2.25.1

