Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2053.outbound.protection.outlook.com [40.107.102.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B42273D65
	for <virtio-comment@lists.linux.dev>; Thu, 26 Jun 2025 11:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750937993; cv=fail; b=EYDFS7QOtN2vtXE0NV9DUHcyVYqlq8QfnBqsT7XYsMnruR1I7FLo4bHKyNLl/obBTExD4sCyTn2yJKYuWmAwxWtHpzD+xXPqC4YOtcWCyFx9jp+zJBWb/GBQSohAJS6sC22h2RvGc4YXrSUt00KLmpEJjlIAs5xLLVoWz3i91SY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750937993; c=relaxed/simple;
	bh=H6607Da+atVA0J4PMvI4K1Ri82mT2wnEAW9hWQ01rCA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KZooinCocKnqQStExgu/Ie6iErWKNkHU8j/S+ntOM7Xm4XZ9vhdhcQY+IIMKUjFAybyr/TKasq22kfiYNDIAAvHpj55/2vmv5yjFoX5xoohIFpuRVmm1dTcxua6+dZD61MMKSZF3eXAxceFueFyn1xmAztCM+zKr1rShn6zRIk0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=TGeYX3za; arc=fail smtp.client-ip=40.107.102.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="TGeYX3za"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DgT6KEsmK3doLbY9pRySjiF2SnwJkm01vlAJGzICyAcWQxw8Hc5f5l+yh+y14GzKnJwDkowoaDXz0bcoWWQRYseXsIKtupicyW9l/BleKtIWG5Sv3Qw3SXIwxAoHV9tglQl79vMtbvq2w95bg6yn4SXrSl7Vc1d4bbL4L/mjRpVZcY6m/ncJbscCum450HLeKvhK/f7J3kuErRpc4BfJxf6B63qBxQHP/BkIudTMp//vP7C8AIGvmeoo4RNpG0e4flV/YAC0a48HLcHQHkdpkZq8vEwV1XHVbso2dISfru3kRoKW4ZPpOJBk/msNOasmicVt0AkFUSDEKgYn5g8p3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ReFjn3aXOZ3CcuJXnC/HLSETKJnZhVkTYiwjtUb2OfE=;
 b=woW91/oABXWwel/QYaQlAzfCfZnaUHkcrQO5ydnJU688ncdertgqn4928Y4xeF9+/wGGjKhPeZnm+dcHxd1kkwawq00+bq2dO8jmdiw5++OSBrj9N0MeuSe31ZnMFB8rU8ch/0FjWwOynVrIaYFhHl3ZLh05yjvRWIgAMe9g71y/yqDULGRsBQdXf/+ruyKmr3TFyOe4F+LvBC4DM5P6+H/E7s4mCN1zRpgaVPWbx13OIJovUPmCrrnAeYNIRd43vvq+0q2V9u5tW0bDSstawTHdo77Rk4DIp9YhWKnMRxUxkj1B6cspScQbV0O54bT/E1KncnG8mvlhUsahcHeawA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ReFjn3aXOZ3CcuJXnC/HLSETKJnZhVkTYiwjtUb2OfE=;
 b=TGeYX3zabIjCso69W9y0zEaM2EXKRG3BtigfYbL9/AYP1GqbydMfwYTO/uxkFn1iUOKRBD9AdbTQ+9yomR9U1wywAnpUn4X2Wp6L5K/kX/JzScPhPMVRA36gMEfQ/YrvK8+JUbgNWTJWpw4haIf/JIIqJ8k6cD1Vb1b0R+WT5U23V8LTjzfwLGdQjmbFKeCpbEc5KESgeF4Kl/MNY5K0tD7PlzR/8NbdwN47COe8f/wcMibMTgr19s52WK5RwioKOshytkOFsKc8970GKzcDvA4DDPLfOqlYs+GrGpHFw6qeRUs3QkHTxGw5Zjk338vZwcPeJh8goAP8ZuacpGL79w==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by MN2PR12MB4357.namprd12.prod.outlook.com (2603:10b6:208:262::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Thu, 26 Jun
 2025 11:39:48 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::e571:5f76:2b46:e0f8]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::e571:5f76:2b46:e0f8%4]) with mapi id 15.20.8857.022; Thu, 26 Jun 2025
 11:39:48 +0000
From: Parav Pandit <parav@nvidia.com>
To: Zhu Lingshan <lingshan.zhu@amd.com>, "mst@redhat.com" <mst@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>, "jasowang@redhat.com"
	<jasowang@redhat.com>
CC: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"Ray.Huang@amd.com" <Ray.Huang@amd.com>
Subject: RE: [PATCH v3 1/3] virtio: re-order device status bits
Thread-Topic: [PATCH v3 1/3] virtio: re-order device status bits
Thread-Index: AQHb5BoQhEncgeDjcUGyRIzqkq42K7QVVK3g
Date: Thu, 26 Jun 2025 11:39:48 +0000
Message-ID:
 <CY8PR12MB719556985E89D07B81EC5156DC7AA@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20250623083637.296041-1-lingshan.zhu@amd.com>
 <20250623083637.296041-2-lingshan.zhu@amd.com>
In-Reply-To: <20250623083637.296041-2-lingshan.zhu@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|MN2PR12MB4357:EE_
x-ms-office365-filtering-correlation-id: 2c0a0a52-427a-4cf5-d865-08ddb4a627d4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?/185SUjx8i9QJhg6ibbWNguWpI0Gn2zLeXXc/zZP8PWDbg1CfJfTfXl/lX2R?=
 =?us-ascii?Q?xHnjvr/kdrk2z7TFjfh7QvxUs7RuhglHl86g2oeLfO1eyziQddo+xOOTavby?=
 =?us-ascii?Q?vpUSAiXvKqzCsqHsndwg7vI3CUvelvduwgpaVM3r07DGPYEvzzLkDF8rEaNI?=
 =?us-ascii?Q?wU8YR1mHe2gdOewkEo4ss7R3fYIXqM3/bJBfvInPiYagpxQoUcVkjOojhQhy?=
 =?us-ascii?Q?Vd9cZGNNT4Uxt2WZJE+0MZAVaVcMn8jVUcR34ZaD/KkmXDtzFMxfJ9OJb3hC?=
 =?us-ascii?Q?XzwOZ/jhHyuOL+UwwgJvrT8embCLJTpdrVmgcfkyWncxhlRrcxnYc0oUZODX?=
 =?us-ascii?Q?XZtKxqbIAhTIk8cprhPMQ3UiAbXb6uIGVt1G0z452vK6L/cSCa/Q54j/aWRI?=
 =?us-ascii?Q?Fp3fGu5AMmXD71r5eWq5Z5MvmA0N+71Tp6zJnsJbZ+wtH9JC0+KxOIRExodv?=
 =?us-ascii?Q?EUIchg5N2AGi302QDSOkd17Kd0bmuInMrc6/9DTVlaCOSW6YW8iQojAx6Jn7?=
 =?us-ascii?Q?W5e1AIecemrvv5qTdJi9bVnhtgpvknZleR16smWl5q+2QHmrHMFCPXgVqgJg?=
 =?us-ascii?Q?WlY+3XftdjabMQVjzPRuza7B9FgV7R6CO+w9gfgqiRvUxRsn4Z+S02Ts0bBG?=
 =?us-ascii?Q?+cpF+oVBBylS+GefxdxUAYgtJTQK1NHEf1bfVQn38bRAG+bFF6XlmcwFRlYj?=
 =?us-ascii?Q?eU6arJYrrXESh4jTV3SJo60gXSPn6Dv9EndSep5jwAHImUmeUKBB8keYXjRc?=
 =?us-ascii?Q?ZUoTEheOF0oN5EmfqbKM9H7zVJWe+kEswDjVQ9vZfLF+ckRXIlbNsg8LX/ia?=
 =?us-ascii?Q?z27X/nKYjAb7kh0h/h3xko7oSLaqd5v4Tp8l7mxV2TXalGZdistrWROCU+Ox?=
 =?us-ascii?Q?YcfhwygSymBFmbPyD3IwvkuhtpMg32ff+31ePdIwWxiOxOX2idyTbu3oWak2?=
 =?us-ascii?Q?l8eRh0Pu+9WphZoIMlwh1dppncokZUxAwhcKDRMrqQtvrNOmDPGRAzKE23cc?=
 =?us-ascii?Q?7gwvdmGE8tyw2mGKur2Z3eF/hXsgz+/T2Eg6Z9B6eU1jvP73PIwSD4AE5SEX?=
 =?us-ascii?Q?22SqkeJ5AnJsbdZ8Ef3Rw7jYeRfbGngOjenokCzCutwx7zbvxK8J0Hp4M3ze?=
 =?us-ascii?Q?hLvFc7WeSpZjZyHMwwORJDk8vYOuFr+msYTIfWJaxVJnUeSO6CcGaloILxHx?=
 =?us-ascii?Q?hWTSQC0wiG0h8BeVwHM9pms6YIFEmFOWaE28U1a2Us8NA2W0DvvsI/9TKKhZ?=
 =?us-ascii?Q?oh2GzwaxGl8zwpj3kDs4Dc1n3Rg+WPT5TZvNfLgSqKaQB9u4yv9GBtLUfRf3?=
 =?us-ascii?Q?Dd3HHbdR+kWQ017lcDuHCSyaZxhtAUtRgBFXY7l9JmKHReho+NKSPMA3oXGN?=
 =?us-ascii?Q?webbSUXS59M9YnedL1o+sT+XZ/xl48E4AwXG+5AAst8FoYfBw/Qr7uGFFTbN?=
 =?us-ascii?Q?+FOPmdJCvPx9Qg26/FFkbdEhOlMPU9z4Irs1p4GoKAFaVJyw25rX2Q=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?eIMqLgThgLwF/vj5juQweRkmKzKjVj99iPynDJdg7Q+mhQzH7yxMhIg7aL2r?=
 =?us-ascii?Q?7R58Su263H5chFqix+XoN7E4G6Ed52y+gjxus6IodDK3E9zVE/3jPxTRlC6Y?=
 =?us-ascii?Q?22/lmJuD9AcJaEKkrq/3g4Z2pdSBRRSAKO2HDecKRzH6y+rPB9sMtUq0yAOe?=
 =?us-ascii?Q?lAjPCfL6uchtyC23XEDJCqd4UhZ4zTk0BcKazSm9eLAgHBRvZVBY24Z9RrQD?=
 =?us-ascii?Q?2n6sQUbFbGtsA8wZbzJLipaecsS/V56154t3TSnaUv1F+dCrEbtac2wSs4Qx?=
 =?us-ascii?Q?e5Sa/iSWwv6PBzMt6SRGttxAiV8DMehPXuBGcQVrCwbqUT0n8ZbvcZ7iJxQ8?=
 =?us-ascii?Q?sN60YMLzZGdiSAjNdqkSxsFocrHV1TCBiL9X2ExnBz23cq36OgaLp1qb+QuF?=
 =?us-ascii?Q?t4x3+P1CkHdQeRa9cDQVPiBUyIDgF0h9IsGv0YF6/QIw4FBzSJT/aZiPKekt?=
 =?us-ascii?Q?hUexyf8dO4Z2P9bBYlXNbR0KLi8IJNs1vTeY3f+DqNnm7Ldgw89T4KlVcsWx?=
 =?us-ascii?Q?3aWVlSTXGmtAK0Qkqa+9V+4uTg8aqGtX0ioCCgl09tCd6ScdHx18mBm555Jf?=
 =?us-ascii?Q?I9sqmmjKLg99zOqmZmXSx61ZQ/pQcYjOWMZQQl8tWnu0xuNImBy+zoiiEDMs?=
 =?us-ascii?Q?OCKRjrOQZSeCRyGqJanbq4N6Ykc46lwZHvvoAnUGYPdmbnhdiNiKSt34fx1T?=
 =?us-ascii?Q?kI4jryvjUiaTlRyzdY13g9cXIsZF52cs+kqA5b7DWJX42GPK5a6b99Q27cNt?=
 =?us-ascii?Q?c9NmthbTgcyjP+lnD8INYKL4iSLIxk56AkqxXmG1VLQ1rZBjnQ00S3c5rO/b?=
 =?us-ascii?Q?rfKFORy1x964M2iNG9dcU0EfySsYPIfDL4L5+DUaqPdP656FMgQrZ3u3Odvw?=
 =?us-ascii?Q?t3yh1mkBcudmo2iVXBD6JTqLa8jNr0qyTLRjH71OaYJU9nljvWPvgsWli07l?=
 =?us-ascii?Q?R5gJ+fKdhEAFR0Z1wecHSipPc5wAlCazRhp5z0yzCbMmC1iH9dfZB0bosKyj?=
 =?us-ascii?Q?ZirZfwUlbA5TTJTGepH43YeADjJgTj61IhbUeisumxKdvAB74kJf+bguG/qs?=
 =?us-ascii?Q?e/ENsQ3penk2UyF4QckrntqgUYtK4YDQT9zlL1bOpeEup/8AT+9XFnc10rKj?=
 =?us-ascii?Q?E3uReg17197jfVVwTRyW68KS3MSspE+ldxBGpP/x+pB8yHK/JIyc0IzjQojG?=
 =?us-ascii?Q?PZOOGHdTNmqvfCs6XJEYMa1etY40BvjEG5CBJ0YIY31L5dXGa+wdAbzw6+CE?=
 =?us-ascii?Q?hkATNqTrTWv3UDWeIslgW7bZtnKZqR2gGb4ZSn474NXl1TPj2qqB8aDM+BCz?=
 =?us-ascii?Q?g5KKowj+u8o8Rt/XnjtbNT0mXg3urOfmPPyzd9e/WVTc43kYZtuySw+mTBMj?=
 =?us-ascii?Q?OgQb3lMa4P07bCy6KvlnuBprtq4Q2+D7S8lOQM7ZPArAwoWH3ZILUDbj+/oJ?=
 =?us-ascii?Q?pG3EjyMqBVBT4YsVz3IDVG12DWpIbjKGNj2DLVr3Bu1Z6TXFuvIDB5u/ZQc2?=
 =?us-ascii?Q?HAYqaZeQP1i95IwrPhea1vvMwh3htK1HAQQM3sjCnK+sjOjOr1wq9wwHdV3x?=
 =?us-ascii?Q?jYT6/DmY8c9VkTy7bvc=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c0a0a52-427a-4cf5-d865-08ddb4a627d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2025 11:39:48.1772
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OKfzUcuOmi7QTLa2OhHiHKKvp+u5pwqgAz2sklxBsRkytmEtzodR7iun8zBX26vHGI84LryY9L3+Q0z3XyMfvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4357


> From: Zhu Lingshan <lingshan.zhu@amd.com>
> Sent: 23 June 2025 02:07 PM
>=20
> This commit re-orders the device status bits.

A better message would be that defines their ordering,

"Rearranged the bit definitions to list them in ascending order."

>=20
> Signed-off-by: Zhu Lingshan <lingshan.zhu@amd.com>
> ---
Anyways,
Reviewed-by: Parav Pandit <parav@nvidia.com>

>  content.tex | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>=20
> diff --git a/content.tex b/content.tex
> index d3fc6a4..1efc2a5 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -36,19 +36,19 @@ \section{\field{Device Status} Field}\label{sec:Basic
> Facilities of a Virtio Dev
>      this bit.  For example, under Linux, drivers can be loadable modules=
.
>    \end{note}
>=20
> -\item[FAILED (128)] Indicates that something went wrong in the guest,
> -  and it has given up on the device. This could be an internal
> -  error, or the driver didn't like the device for some reason, or
> -  even a fatal error during device operation.
> +\item[DRIVER_OK (4)] Indicates that the driver is set up and ready to
> +  drive the device.
>=20
>  \item[FEATURES_OK (8)] Indicates that the driver has acknowledged all th=
e
>    features it understands, and feature negotiation is complete.
>=20
> -\item[DRIVER_OK (4)] Indicates that the driver is set up and ready to
> -  drive the device.
> -
>  \item[DEVICE_NEEDS_RESET (64)] Indicates that the device has experienced
>    an error from which it can't recover.
> +
> +\item[FAILED (128)] Indicates that something went wrong in the guest,
> +  and it has given up on the device. This could be an internal
> +  error, or the driver didn't like the device for some reason, or
> +  even a fatal error during device operation.
>  \end{description}
>=20
>  The \field{device status} field starts out as 0, and is reinitialized to=
 0 by
> --
> 2.49.0
>=20

