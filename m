Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794725715;
	b=jskp9BnsPgEL8vZ7NMGcAGKko3J/FKEBI5wadGvAagvGlYkoEgR5fXPjA4nmFxX1Cyxw
	 cNSb6e1d5WWxBjiae0ed0foMj/3LV9y3LHJRzzDv/WMMXG2taS6CytN5z8nYM9YOES5nT
	 kCR4svO0gII8Yb+8iXZhPR8mmHzaVCVsIKU0r0fdKU8vHKFJkyvTCWp5Ar11ZqrL+7I0k
	 y3xiFVdLYuObFEnif+UjKRbWYRjQ/v+WuwNGygiB+m701f39sT313WD20Myxjb01Jb5c8
	 Cdt3btHQaoYkYi26RZwnmKa8gkzY4LhgWMa5hUkylkFKtd0poOm94RkIETaOdK6ro6Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794725715;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=Dv7y3bNBrnBELqYFI3KrdT2U3I20XOkJ5u2XudB/7JI=;
	b=LGEsjrNqXLUXzbG/nwNNTZC+VmYqPBlvN4JKS6YslRT83cdkL2LKGu9c6TwCR/k4FvqU
	 twwt2W/ft1Gh62HrFfBh87UA75XYUmfBCsLwZtJi/2tiAIOj6W5WypcZYhscQVXC3O//L
	 u8IhNJTkl8fS3p1S7/DNYoVeqXvtCo0M+lzXyawAj7AkoV6ThuRqGpTAHIyfsdE1jd8QX
	 gjhaFHX9zn7u5IEcdvPrCBM0liDILKqKIj9vkKl+I2j8xCk+WCqilr9G9G7DGSzxdi0iT
	 2HDvoyBfDCQ14NHmQf9YsmR44/iWy0IlWeKTbllX8xKxkJ4vB64e2gCsqMS41cdz7tg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=aVC2+XpB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.11
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012011.outbound.protection.outlook.com [52.101.43.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F39BB606A323;
	Sun, 15 Nov 2026 06:55:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F39BB606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=aVC2+XpB
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l/4LqCcxj2t0dbvGuMliAY26Z79gmPsosncZGJWPez4KeDApJkIueUOhYF+egGNr5MswMxj2Z1K2VAU/LOyB04CWRsulymtHNVcLz0d8SajQbWXi7Eyame764cdF9YWUEOrsbh5hM7qKMPFKr5aCAGswTIDjo8m9HtdgstMWgQrzfDBuUOpsIMAYnaOIGMVo4oZGL277scmdmlXhD+NXt2WCmw/O/s944Kp2rMKGpHX6tWOeHsrqLiToQuRLnRchtlNjkbYxCMztddGHJUf8JgWMbt4mYH0trRIDRDrV4b/XwXTQNGSgx20Kx9mSnevo0YGVT4zy5vOd75MylLc0vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dv7y3bNBrnBELqYFI3KrdT2U3I20XOkJ5u2XudB/7JI=;
 b=jHAI3h8cSSYpWdepc/aj5RMueEETrqzwuEM26WxhaPgmmDPXaLQQewtZcOO6G30+o/YZPdSjqWF1QFNf7tfdBJnpYOIi/+pSN0NHWFlMX7EYuvLOmyTgC4XRUNzifhDGZ3nGi4DecFPhrOcxuhDz9vJT3zT4a43LCmEyU7HbMW0UFmoRVJmu4L1vl3pHdEb8ouyKOZb+c7xpB7B3qBfccdrbAvFgn77TnaWwsNYiMT08mB/ixsx5hNSlLhF3qmh1bmfFY/T93tTnDr2As14DNsU6QGHok9g9Xt0uc2fVxBWjwCJJOw/cf+ajs0mQv5twsqvXzowZzD+g+pqY/bhK+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dv7y3bNBrnBELqYFI3KrdT2U3I20XOkJ5u2XudB/7JI=;
 b=aVC2+XpBJnH0trYTlm4zl6j6Ltxvr4yoam9b1/zACc9/tMABwBDdAJvGU3M/JTiL/cULr6Q+xmAI1IspsdxG3bYp6OSF1CO6oE6tCK8LN4eSAkqy2kkakcfI8NA32R5tgrVvGuCtOEo0emDbCjBPoWL/wLkzf09T/RLU2mYJPf0uVMxQXgS5hNV8CqY7b8fLwXlAXX+s7Uzq+cGN6FuPadi55wJtYl6vRtSQ6iNZ3MxkKUy9D43PqCx2xjHwQ2lXtWfKcbkDWDyn8LwkZaaTt+yrCQPzqv1Pjt0UBpVSG2N48V0CYgeLW/VxzSvziW+0na8pyQh0jCbxLVsSJWoZZw==
Received: from SJ0PR12MB6806.namprd12.prod.outlook.com (2603:10b6:a03:478::7)
 by PH5PR12MB953872.namprd12.prod.outlook.com (2603:10b6:510:501::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Sun, 15 Nov
 2026 06:55:11 +0000
Received: from SJ0PR12MB6806.namprd12.prod.outlook.com
 ([fe80::3981:4d43:82f5:adf6]) by SJ0PR12MB6806.namprd12.prod.outlook.com
 ([fe80::3981:4d43:82f5:adf6%3]) with mapi id 15.21.0615.009; Sun, 15 Nov 2026
 06:55:11 +0000
From: Parav Pandit <parav@nvidia.com>
To: Linlin Zhang <linlin.zhang@oss.qualcomm.com>, "virtio-dev@lists.linux.dev"
	<virtio-dev@lists.linux.dev>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>, "stefanha@redhat.com"
	<stefanha@redhat.com>, "mst@redhat.com" <mst@redhat.com>, Max Gurtovoy
	<mgurtovoy@nvidia.com>, "ebiggers@kernel.org" <ebiggers@kernel.org>
CC: "neeraj.soni@oss.qualcomm.com" <neeraj.soni@oss.qualcomm.com>
Subject: RE: [PATCH v6 1/4] virtio-blk: Add inline encryption feature bit and
 configuration
Thread-Topic: [PATCH v6 1/4] virtio-blk: Add inline encryption feature bit and
 configuration
Thread-Index: AQHdZfL1DAtpsImohkqShUQ9e1bJOrcuxfzA
Date: Sun, 15 Nov 2026 06:55:10 +0000
Message-ID:
 <SJ0PR12MB6806E3BD3B8A07A61CA35DDBDC7D2@SJ0PR12MB6806.namprd12.prod.outlook.com>
References: <20261027090945.185178-1-linlin.zhang@oss.qualcomm.com>
 <20261027090945.185178-2-linlin.zhang@oss.qualcomm.com>
In-Reply-To: <20261027090945.185178-2-linlin.zhang@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR12MB6806:EE_|PH5PR12MB953872:EE_
x-ms-office365-filtering-correlation-id: ff6ede6b-c4d4-4636-46ad-08df42e56472
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|38070700021|10067099003|11063799006|5023799004|4143699003|56012099006|261021123027099003|261021121427099003|261009221227099003|261009223027099003|261102123227099003|261026140227099003|261022105027099003|261022075727099003|261026121527099003|261028144727099003|18002099003|22082099003|6133799003|3023799007;
x-microsoft-antispam-message-info:
 1Wi3edgF2yh2YkkZbFWTn8d8+WUx7DvPjqQGg9uRVPbvLdMuP5WQN/ssiEXwYP+iTsaic2CFDzzbvhP99mPTGBOAq+UCKS/Q5KyQ8LAYwSDstoiAHVXX2PPuYUkxqBsXJTqq4lptyI4N1us0skOzBOAKPcj8qWYXuW+uetDy2HuanGRcjSRkGXhDTP5ySoLy/7+I2+OhHLfJPKTbU/ZM0mK4gzuCiC1MpohsPSb1oCEZ4HAbMRAEijYw8zJnstpwS8TcALGjVgElJkL1eyYUETrT+ObzW1QA7vKlUnBvXB79OIVdyasbWi9DLiu1UY6DwbyZqxIqOeDpq9niFSNlGDq8XbXdeWGtb2sathSvLMlOOjm0L2e20d82gegXZag9loxMO3TYh+EShr3ImVnThVwrlVtMxTwfVWgKy4fDrTrAgd8BT7N+JV7c2SfPSiadSM/lNIZguk3N9uM5NuERkuGjHCMo7Lq49wKphgJZzSs2GPTLDqPb61a2VLSWJ2ghqIrJqM3gr2iOlKRAj6h6O4rPC5dO5cmEzvCn6OvhB8G4jh4m+x4RoiCReOLFng8faAwEas5rgMjXPB+SJSRGScvhwR8erze+AYskzEjLRB1PmPtPH37vBnmnhHJ+q8e0zsPyWDeX/xDZ544m/X8/RiCkvuAvd7sMju7u+d8mzKmzgrerJVDnzZTe55GcFqc9vvVp6tf6h+lAodP58z9tlIBTxZhEk2nm6jIzbfqrpRE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR12MB6806.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(38070700021)(10067099003)(11063799006)(5023799004)(4143699003)(56012099006)(261021123027099003)(261021121427099003)(261009221227099003)(261009223027099003)(261102123227099003)(261026140227099003)(261022105027099003)(261022075727099003)(261026121527099003)(261028144727099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?dANtGrW99+Dmq5iUyf8FuNKTa1ABAP6pouWE8dwdyoSgcPr+h7iw3SYOLKJr?=
 =?us-ascii?Q?Qdnv+mI3igEAU7wy1sKE0TAYIf++ZdHMsOM+UllrMWcBt1xIGHkqQk4W22Ed?=
 =?us-ascii?Q?e36wsGMFtxvEMAfGvl/PGpzbMDSWSLjARBlw9r5B3lRFgEayYC60GwWlqD4h?=
 =?us-ascii?Q?kKrKj5yNkt3w8kIhFQPuxwDUYlKnjK5sC/p3e1ygjU3IyQ7wYIb3MhqOxhU/?=
 =?us-ascii?Q?CKzkp7/6sTnPJVJNBN99oS0VS/NYmqXv4oZwWIjGXrzF+yMqt1o3WWi8LiYm?=
 =?us-ascii?Q?0GxdGgbJsktojvMg/fKay85SHLR/Nrlc4de/Yt4ZSTLwsAj6pLz0zhiKPB3n?=
 =?us-ascii?Q?ezKcowhamdxxr9l0dNb1i9TewwElfoAmqgSNfF6HZdflSEyQGYINxYGZqR/o?=
 =?us-ascii?Q?dMvgbc4psVymM6ZNaFhdo6ecQq76hv1UzCyr1tSVczu8PbFypBgci5TX2u/9?=
 =?us-ascii?Q?m5LuFWgXoeDOAKVqF1v2QahSKE3VSHKb5ZyqNV8887NFwuQ72G3i7QN362l6?=
 =?us-ascii?Q?8vjFG/gBJAqtNtNu1Ok71Avng7S9XFh+M5jle3OiKzOtc0iCdctOxc3bW+zd?=
 =?us-ascii?Q?hXMTxs09be5MQKFUWId2OQM4V7Vub9fQ1nBLTAlS0dhnzwqlPHkcZztjas9t?=
 =?us-ascii?Q?QYa6wJRkHtxqLZsyhpS3xJvkZynhoKJJdAJk1aRQLYU6myBvscmFqkjpb9kh?=
 =?us-ascii?Q?GbOCCjY/rhidBjKHYSLojfOxmpAdhtysanThVRwnfnwu/BBOTubFtlAYk33v?=
 =?us-ascii?Q?lvLdEEEX6oMVUgFTeubGe8GB5XJsTRg0E5Gw0LgzK1kdppd3lZ1i8fQ7nsBj?=
 =?us-ascii?Q?VTVef4X+jS4QeA+K7N/Lc4qH4K6r3hbrbRLpUdqMSned3e54nfhrE407ns6D?=
 =?us-ascii?Q?MrWBbuVfUQgIP09GlGRGEu1V7FxyJW9dasSvnTEYd4lOLfveeszHLHPIsAIW?=
 =?us-ascii?Q?Lc53IdbJ61RmrVLTj0kIbmevjqoBJ3HmxJfIallTJaPlDEvszDN1NOiPlNPG?=
 =?us-ascii?Q?Vq9SFt/YEd9rIRxYwcRKdfTVUO7ZT0EGLhft2vZSraVQ4O/+FWSyd3pRTehd?=
 =?us-ascii?Q?it+f089juxPoNmRYVQJK1U9kZKkdspW481wfm/xPAakLH4vkrmzUfiBAXAoJ?=
 =?us-ascii?Q?zRrqQij9Hd4KqnSQyQvn4OrTvmKXBlGYv6mCFcHROJqeIqUnWozDiy0rJP3K?=
 =?us-ascii?Q?SRMFXBBzXq1SxoyE82pqhAz+uadvV5+UpUMkEU1X2mJEamIYjDP+bS6DKGFm?=
 =?us-ascii?Q?hYWnIO2FT6WK7/NBP6/mMknK1CszoQD3EnWwrwV9/PuQRjsah4OpO8RBZrag?=
 =?us-ascii?Q?glLFPhow9QeVHT8JKsDSnpMqXT3YVmiihPrdpQXesWM4WvBLLAvKqozc8DBD?=
 =?us-ascii?Q?3Q3S+J6UF8EvxX4J9DWKyTM59IH+suNXLI7LPAD53Zb2Y+BaQyzenSBPTXkB?=
 =?us-ascii?Q?bw+EUTadcgqbgtvkaqu/xloO614pSJ0o+Ky+HiB5mu1wFKv9gWjahq2fNLQG?=
 =?us-ascii?Q?GMKwOn5M981fCyVdIzgPoQ2bS9PTqmaJ3hFM88+ed+k4IeGSYgLqoY4v+yT0?=
 =?us-ascii?Q?j2za7t9x+MDMEqo+MUUGpiBFfLmH6abbLaLEcW964/MvyQ7Jk5FJ24YeLBlE?=
 =?us-ascii?Q?AvMtZ//1zNUlht9IdoqypHIu4OXJg74gbhd9VugFSvTaNwkf2r9290fOAIzP?=
 =?us-ascii?Q?JR0JVrhkpH1w5UAVDzqM95v6WR6O2kP8xbPXim4uqOsYaZsb?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Post: <mailto:virtio-comment@lists.linux.dev>
List-Help: <mailto:virtio-comment+help@lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
List-Owner: <mailto:virtio-comment+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB6806.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff6ede6b-c4d4-4636-46ad-08df42e56472
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2026 06:55:10.9837
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Rg53ZqlB67FkxyiSpwfrLjE8/X3aUWiXpaoXGS+hBuCFZGDxECvVkhnGBkbdECWNUBibtD/MHksH7WY3Pf9qCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH5PR12MB953872



> From: Linlin Zhang <linlin.zhang@oss.qualcomm.com>
> Sent: 27 October 2026 02:39 PM
>=20
> Inline crypto engines, such as those defined by JEDEC UFSHCI and eMMC
> CQHCI, encrypt and decrypt data on its way to and from the storage,
> using keys that are programmed into keyslots of the engine and selected
> per request. Block devices backed by such storage have no way to expose
> this capability to the driver so far.
>=20
> As the first step towards supporting inline encryption in virtio-blk,
> add the VIRTIO_BLK_F_INLINE_ENCRYPTION feature bit and the
> enc_characteristics device configuration fields, which let the driver
> discover the inline encryption capabilities of the device:
>=20
> max_slots: number of keyslots.
> max_dun_bytes: maximum size of the Data Unit Number (DUN) in bytes.
> key_types: supported key types, raw and/or hardware-wrapped.
>=20
> Keys are managed with group administration commands, therefore the
> feature depends on VIRTIO_F_ADMIN_VQ.
>=20
> max_slots is 32 bits wide, matching the 32-bit slot fields used in the
> administration commands and in the requests.
>=20
> Inline encryption cannot necessarily be supported on a zoned block
> device, as the zoned write constraints do not guarantee that I/O
> addresses are aligned to the encryption data unit size. Therefore the
> feature is never offered together with VIRTIO_BLK_F_ZONED.
>=20
> Driver requirements:
> - VIRTIO_BLK_F_INLINE_ENCRYPTION is not negotiated without
>   VIRTIO_F_ADMIN_VQ.
> - The reserved field unused3 is ignored.
>=20
> Device requirements:
> - VIRTIO_BLK_F_INLINE_ENCRYPTION is only offered together with
>   VIRTIO_F_ADMIN_VQ, and never together with VIRTIO_BLK_F_ZONED.
> - FEATURES_OK is not acknowledged if VIRTIO_BLK_F_INLINE_ENCRYPTION is
>   negotiated without VIRTIO_F_ADMIN_VQ.
> - max_slots, max_dun_bytes and key_types report valid values.
>=20
> Subsequent patches add the administration commands to manage the keys
> and the request types which use them.
>=20
> ---
>  device-types/blk/description.tex | 102 +++++++++++++++++++++++++++++++
>  1 file changed, 102 insertions(+)
>=20
> diff --git a/device-types/blk/description.tex b/device-types/blk/descript=
ion.tex
> index 3b3a4e7..b347140 100644
> --- a/device-types/blk/description.tex
> +++ b/device-types/blk/description.tex
> @@ -73,6 +73,17 @@ \subsection{Feature bits}\label{sec:Device Types / Blo=
ck Device / Feature bits}
>      VIRTIO_BLK_REQ_FLAG_OUT_FUA flag in the \field{flags} bitfield of th=
e
>      \field{virtio_blk_req} structure for VIRTIO_BLK_T_OUT requests.
>=20
> +\item[VIRTIO_BLK_F_INLINE_ENCRYPTION (20)] Device supports inline
> +    encryption: data written to or read from the device can be encrypted
> +    or decrypted by an inline crypto engine in the device backend storag=
e.

We likely want to drop the word inline and reword the description with blk =
requests.

> +    Keys are programmed into keyslots of the device, and each encrypted
> +    request selects, by keyslot index, the key programmed into that
> +    keyslot. The number of keyslots, the maximum size of the Data Unit
> +    Number (DUN) and the supported key types are reported in
> +    \field{enc_characteristics}. The keys are managed using group
> +    administration commands sent on the administration virtqueue, so thi=
s
> +    feature requires VIRTIO_F_ADMIN_VQ.
> +
>  \end{description}
>=20
>  \subsubsection{Legacy Interface: Feature bits}\label{sec:Device Types / =
Block Device / Feature bits / Legacy Interface: Feature bits}
> @@ -135,6 +146,12 @@ \subsection{Device configuration layout}\label{sec:D=
evice Types / Block Device /
>                  u8 model;
>                  u8 unused2[3];
>          } zoned;
> +        struct virtio_blk_enc_characteristics {
> +                le32 max_slots;
> +                u8 max_dun_bytes;
> +                u8 key_types;
> +                u8 unused3[2];
> +        } enc_characteristics;
>  };
historically, config space was the one to extend.
However, now that admin commands are in place and these max capabilities ca=
n be easily discovered via admin commands,
Can you please use the device type specific capabilities?

>  \end{lstlisting}
>=20
> @@ -222,6 +239,39 @@ \subsection{Device configuration layout}\label{sec:D=
evice Types / Block Device /
>  terminated by the device with a "zone resources exceeded" error as defin=
ed for
>  specific commands later.
>=20
> +If the VIRTIO_BLK_F_INLINE_ENCRYPTION feature is negotiated, then in
> +\field{enc_characteristics},
> +\begin{itemize}
> +\item \field{max_slots} is the number of available keyslots. Keyslots ar=
e
> +    indexed from 0 to \field{max_slots} - 1.
> +
> +\item \field{max_dun_bytes} is the maximum number of bytes of the Data U=
nit
> +    Number (DUN) that the device supports for any of its supported crypt=
o
> +    modes.
What is the interpretation of DUN?
Do you mean number of bytes in a block IO request that can be encrypted?

If yes, if upper layer say file system issues a request larger than that, w=
hat is expected from driver?

> +
> +\item \field{key_types} is a bitmask of the key types the device support=
s,
> +    using the following values:
> +    \begin{lstlisting}
> +#define VIRTIO_BLK_CRYPTO_KEY_TYPE_RAW         (1 << 0)
> +#define VIRTIO_BLK_CRYPTO_KEY_TYPE_HW_WRAPPED  (1 << 1)
Don't understand what is 'wrapped'?
Do you mean its non-plain-text ciphered key?
if so, lets write it that way as=20
CRYPTO_KEY_TYPE_PLAINTEXT
CRYPTO_KEY_TYPE_CIPHER

> +    \end{lstlisting}
> +    VIRTIO_BLK_CRYPTO_KEY_TYPE_RAW indicates that keys are programmed in=
to
> +    keyslots in raw (plaintext) form. VIRTIO_BLK_CRYPTO_KEY_TYPE_HW_WRAP=
PED
> +    indicates that keys are programmed into keyslots in ephemerally-wrap=
ped
> +    form, and can only be unwrapped by dedicated hardware (e.g. a hardwa=
re
> +    key manager), so that the plaintext key is never passed to the devic=
e
> +    for keyslot programming. Outside of the device, such a key is stored=
 in
> +    a long-term wrapped form.
> +
You want to say something different than 'outside of the device'.
It is unclear.
Something is done outside of device is not in the virtio spec scope.

> +\item \field{unused3} is reserved for future use.
> +\end{itemize}
> +
> +\begin{note}
> +For example, known inline crypto engines report a \field{max_dun_bytes} =
of
> +4 (JEDEC eMMC Command Queue Host Controller Interface, CQHCI) or 8 (JEDE=
C
> +UFS Host Controller Interface, UFSHCI).
> +\end{note}
> +
Above line belongs to commit log.
Here we need to well define DUN so that implementors can do so without refe=
rring to 3rd party spec.

>  \subsubsection{Legacy Interface: Device configuration layout}\label{sec:=
Device Types / Block Device / Device configuration layout /
> Legacy Interface: Device configuration layout}
>  When using the legacy interface, transitional devices and drivers
>  MUST format the fields in struct virtio_blk_config
> @@ -285,6 +335,11 @@ \subsection{Device Initialization}\label{sec:Device =
Types / Block Device / Devic
>      \field{zoned} can be read by the driver to determine the zone
>      characteristics of the device. All \field{zoned} fields are read-onl=
y.
>=20
> +\item If the VIRTIO_BLK_F_INLINE_ENCRYPTION feature is negotiated, the f=
ields in
> +    \field{enc_characteristics} can be read by the driver to determine t=
he
> +    inline encryption capabilities of the device. All
admin command can read/write the capabilities.=20
this will be also useful to indicate to device, if it can disable its encry=
ption engine when driver does not support (or not interested in it).

> +    \field{enc_characteristics} fields are read-only.
> +
>  \end{enumerate}
>=20
>  \drivernormative{\subsubsection}{Device Initialization}{Device Types / B=
lock Device / Device Initialization}
> @@ -327,6 +382,23 @@ \subsection{Device Initialization}\label{sec:Device =
Types / Block Device / Devic
>  The driver MUST NOT negotiate VIRTIO_BLK_F_REQ_FLAGS_OUT_FUA without
>  VIRTIO_BLK_F_REQ_FLAGS.
>=20
> +Drivers MUST NOT negotiate the VIRTIO_BLK_F_INLINE_ENCRYPTION feature
> +unless they are capable of:
Not sure about driver capability here.
It's more of wiliness/interest of driver to use it.
It may still negotiate and not use that feature at all, may be upper layers=
 disabled it.
It should be reworded.

> +\begin{itemize}
> +\item retrieving the inline encryption characteristics from the device
> +    configuration space.
> +\item programming and evicting keys in the block device's keyslots
> +    through the administration virtqueue.
> +\item submitting the keyslot index and Data Unit Number (DUN) per crypto
> +    request to the device.
> +\end{itemize}
> +
> +The driver MUST NOT negotiate VIRTIO_BLK_F_INLINE_ENCRYPTION without
> +VIRTIO_F_ADMIN_VQ.
> +
> +If the VIRTIO_BLK_F_INLINE_ENCRYPTION feature is negotiated, the driver
> +MUST ignore \field{unused3} in \field{enc_characteristics}.
> +
>  \devicenormative{\subsubsection}{Device Initialization}{Device Types / B=
lock Device / Device Initialization}
>=20
>  Devices SHOULD always offer VIRTIO_BLK_F_FLUSH, and MUST offer it
> @@ -341,6 +413,9 @@ \subsection{Device Initialization}\label{sec:Device T=
ypes / Block Device / Devic
>  If the device that is being initialized is a not a zoned device, the dev=
ice
>  SHOULD NOT offer the VIRTIO_BLK_F_ZONED feature.
>=20
> +The device MUST NOT offer both the VIRTIO_BLK_F_ZONED and the
> +VIRTIO_BLK_F_INLINE_ENCRYPTION features.
> +
What challenge brings this limitation?

>  The VIRTIO_BLK_F_ZONED feature cannot be properly negotiated without
>  FEATURES_OK bit. Legacy devices MUST NOT offer VIRTIO_BLK_F_ZONED featur=
e bit.
>=20
> @@ -415,6 +490,33 @@ \subsection{Device Initialization}\label{sec:Device =
Types / Block Device / Devic
>  The device MUST NOT acknowledge FEATURES_OK if the driver sets
>  VIRTIO_BLK_F_REQ_FLAGS_OUT_FUA without VIRTIO_BLK_F_REQ_FLAGS.
>=20
> +The VIRTIO_BLK_F_INLINE_ENCRYPTION feature cannot be properly negotiated
> +without FEATURES_OK bit. Legacy devices MUST NOT offer the
> +VIRTIO_BLK_F_INLINE_ENCRYPTION feature bit.
> +
We do not document what legacy device to do.
Please drop this line.

> +The device MUST NOT offer VIRTIO_BLK_F_INLINE_ENCRYPTION unless it also
> +offers VIRTIO_F_ADMIN_VQ.
> +
> +The device MUST NOT acknowledge FEATURES_OK if the driver negotiates
> +VIRTIO_BLK_F_INLINE_ENCRYPTION without VIRTIO_F_ADMIN_VQ.
> +
> +If the VIRTIO_BLK_F_INLINE_ENCRYPTION feature is negotiated, the device
> +MUST set \field{max_slots} in \field{enc_characteristics} to a value
> +greater than 0. The value SHOULD reflect the number of keyslots that
> +are available for use by this virtio-blk device.
> +
> +If the VIRTIO_BLK_F_INLINE_ENCRYPTION feature is negotiated, the device
> +MUST set \field{key_types} in \field{enc_characteristics} to have at
> +least one of VIRTIO_BLK_CRYPTO_KEY_TYPE_RAW or
> +VIRTIO_BLK_CRYPTO_KEY_TYPE_HW_WRAPPED set, and MUST NOT set any bit in
> +\field{key_types} other than VIRTIO_BLK_CRYPTO_KEY_TYPE_RAW and
> +VIRTIO_BLK_CRYPTO_KEY_TYPE_HW_WRAPPED. The device MUST initialize paddin=
g
> +bytes \field{unused3} to 0.
> +
> +If the VIRTIO_BLK_F_INLINE_ENCRYPTION feature is negotiated, the device
> +MUST NOT set \field{max_dun_bytes} in \field{enc_characteristics} to 0 o=
r
> +to a value greater than 32.
> +
>  \subsubsection{Legacy Interface: Device Initialization}\label{sec:Device=
 Types / Block Device / Device Initialization / Legacy Interface:
> Device Initialization}
>=20
>  Because legacy devices do not have FEATURES_OK, transitional devices
> --
> 2.34.1

