Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2062.outbound.protection.outlook.com [40.107.223.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E7125C6F9
	for <virtio-comment@lists.linux.dev>; Mon, 10 Feb 2025 19:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739216823; cv=fail; b=WFyuqYpm9kTwtNimQnegmOuz8ysrw9XX1YMHvaUgvyXCfdjrKIMD/heghVkk+G5wCbMrSeYIhGCmuJGE58TQ5zx/dUA9E22Zie9vhtabJB6Gwilhzt9Ea/Z0gnK/C2XCcquvfa9udw6FZ2rSKyJHVfxZElSDQsnwao6CDds2yBM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739216823; c=relaxed/simple;
	bh=9vO1u33KaVku9G1Zn6MIB2sxjYaX+M7bGd6UKtZeVIk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=uTCDNUirYWEmAyltd7d5nhijETC9QGYeZMh5H5VIzYPBnQ5vLZlPm7gxipPzrg7R411iE1b9OnAvrW3d6VGfc7grDnUhFvUObuusPd591Rj+hXLe8f2tElhQd4tBEu5YT4Q69OSgLyls0GQGtcnGnsNqudRYxs5HQjXDwQBKijU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=duzTXVhm; arc=fail smtp.client-ip=40.107.223.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="duzTXVhm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DF4yPuGKnPATY/Kk54tOuJyq1pDcIxRskjfQgBX6d0Utrjs9By1i1wAWSJosVZivNIK4xxp1yiNK2bsMSDYFD/8m+bsNNPeTZSzsSznYcDyfSR+xBfktq3e0ek/X/X/Xyp5kNua3sNAjU0Pbcqlm9OEK166hhQtiyQOPVmVflE3H2XjI1Cnj5+eKx6bhZ1MTskxDO4QNueKKgG/BRSKu3uxOK3FeUixiY9FISP1+RsGZUFOBNeeR3giJGWfTl0ENPUd6q3Mr/5VZ1Todl++BNdNmnqkFLj2n83gzA/RV8WKx2y6tmj9HEoo4rXPET0rtIa8mW7sJ+uQFCvO+BVEHhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/0MShnKlFkpSOYPkQ+wj1T2PYA321hYcbM+RQAoYBEQ=;
 b=NXTUAGuZTjQXoAjj//bOk+7Y45J2AT/55QfeYxlrNG1z4dke9pkWgv3u3fuopP1NVMCvDohrJkpdfnIGNXOC/2/2lHbeQ5Fun8fnR8vX7kw18tU7JotPMsh4KUQ0A6b+jE9ESz85t4USP+HoBwLcYXzuq8GSY1Rk1/SONxu1syjYp0jmcDSYzkhjS33IOYahCYymY+xH2PTvEhVvu1fY9lBwYLd1XoGHH7IwcXXcqRiQdZ05MVKu9con/LF9F60sNZdA0qblTQxAIRP79P72+i8QCZdhzlSRwl7S22X/UxxLoQz5P+hMoBakHW7t3k6PYHjMSVJ02Z8iDe+wxda4qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/0MShnKlFkpSOYPkQ+wj1T2PYA321hYcbM+RQAoYBEQ=;
 b=duzTXVhmU87Hcqh/1yJAasx7JpJ9e2wPVbqPsaP/10XGSazNvi2Ik+hupKB57GTGajXVyFyNhBdSw/S5RzS0+Q7YhVejB9e0YPHKHmDyL5M8URFeOBgmXlXaRsLsC87+p3bDFRWW/qKL0vHPIbKrZT/ReXWtC4Z05hwifqYaPFlYTNW68Q43323zfbi8U80MjEvICV0/flmjdqQMubJVi+Bs3Qwvi0hxFZEOOpFcbPz+KSiYcKx39JTfyRonFVv7JJAYxzNdp7SIPzrExIDYGWzqE+mTOpoX6QVzJcaFCFA5ckn3KUEd2Yt7FOKFFjJ9ZDyIMdJruDYaKRGHC7AXbg==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by IA1PR12MB6283.namprd12.prod.outlook.com (2603:10b6:208:3e5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.16; Mon, 10 Feb
 2025 19:46:59 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd%3]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 19:46:59 +0000
From: Parav Pandit <parav@nvidia.com>
To: Srujana Challa <schalla@marvell.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>
CC: "mst@redhat.com" <mst@redhat.com>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "mvaralar@redhat.com" <mvaralar@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>, "ndabilpuram@marvell.com"
	<ndabilpuram@marvell.com>, "jerinj@marvell.com" <jerinj@marvell.com>,
	"anoobj@marvell.com" <anoobj@marvell.com>
Subject: RE: [PATCH RFC v3 3/4] virtio-crypto: Add new IPsec opcodes to data
 request
Thread-Topic: [PATCH RFC v3 3/4] virtio-crypto: Add new IPsec opcodes to data
 request
Thread-Index: AQHbbJVIe0bIUFRIC02WqXcE4jOx4rNBDdXQ
Date: Mon, 10 Feb 2025 19:46:59 +0000
Message-ID:
 <CY8PR12MB7195426A7A0C84BE3867CDB2DCF22@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20250122061644.266560-1-schalla@marvell.com>
 <20250122061644.266560-4-schalla@marvell.com>
In-Reply-To: <20250122061644.266560-4-schalla@marvell.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|IA1PR12MB6283:EE_
x-ms-office365-filtering-correlation-id: d56c3977-bde1-49d4-ca3f-08dd4a0baed3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?aR0f54n/zE60C7jrU01KmwUQ40jv/rENCInQ+E+2/yb9GxSOR3wEhEl945oy?=
 =?us-ascii?Q?61M++463ntDotWDxnLg6Aa4lE7QqcfZ+85Sh3w0vtlZkvsyMGh8hJqNIMkD2?=
 =?us-ascii?Q?tdzSS2P2q0ZpkwUTyGBLT+Pcwqho5TcfRPqQZXs2ky+tjCdQaKptvVZALjKz?=
 =?us-ascii?Q?UzwoWNf/CNgs9DHyTREExrhZXENpSoIUdrkW9X3J20SwtcYtw56TknjZsvH/?=
 =?us-ascii?Q?WkB+CReTK0WTM5z5blNYmYBzhkRTHQ8aV8k5urfp8QSb315IAQb+Ool1kUQ1?=
 =?us-ascii?Q?bqiajCNBWeTdfwOsFbvKmQ9hbhAYHTBNRUs/sQU1EeSNE0WlR//y8j9KsVbP?=
 =?us-ascii?Q?6u7hN/B4BVIG9zm9L0jBEjptnpuFBrRb8e+gpahgmBlDOLYFwsfj/fXnxnBm?=
 =?us-ascii?Q?M8Pvv1KiaruE75bB5iu4cJVbP/ucVteuP7A6kON6ePcb5S8dKy8PBR98DZxM?=
 =?us-ascii?Q?Wrox8LsvdNjTKLcf/mQe+nELgGzD4jIYNZm9qEyKKjMx1OXh6OIe9+wU8tks?=
 =?us-ascii?Q?vJZaxxzvfJ5OVfRZpPfd+R/6ylp/lcRMTLuHKtNEZs/jeiJRKgMiEWFwCap4?=
 =?us-ascii?Q?soeP6X8IS7KAjnsiDegL64y+xONGVFrD+H4eMiQP2lpmEYT8xAWHERDoUk+g?=
 =?us-ascii?Q?r8BqEz1kRMdNWqYChA9gE35T5E94S4C1Al31KjljMTHL76DWdymb7kxpF3/0?=
 =?us-ascii?Q?uXkYQ4nH/isX/vQBoVUNE9BqoMvg5oBeUHOVQsRpEhcU/xbS6X7QMfXFwhbb?=
 =?us-ascii?Q?7o1uPExNSCJIYawmxnEWGb9hF3tDqOLO0SFCvekGO0udgzfSG2wWAZ0XPdhq?=
 =?us-ascii?Q?1BW9ukQYR5NA8zxKnsbVXfl654X0iDNs0aAgo7VWWk0pwBC6Jjdvz2p8GZmx?=
 =?us-ascii?Q?ZolFyS3RJXjescx+75MyGkU+ALP3g9jveKQe53WJI6vjXX1PteJNiuxnrvxD?=
 =?us-ascii?Q?cyRK4ptg8Pvpdec+bDT4IRrBpDPodQFHURUpKfGtz9uikEcHAjFOA7yEsvwu?=
 =?us-ascii?Q?NP2sZZGfaA/fjNMrz54PugzJrQGYEWdqMK/Z+5yzb9gLUTcPlyURX0dfyoC8?=
 =?us-ascii?Q?TeYzkSsZshLtcy6HKu2XHm2aV+EYRgv4HcRERcivRXjmF+hH3RsNl8ZnaoFf?=
 =?us-ascii?Q?FD+PXMYWflzVndk87t477ehZ6fNU0eUeLCI1cuNbvt1PUYA581VSx8CMBPaP?=
 =?us-ascii?Q?sKfjh4jUZyHZgCEqGMisZMf6cmpDoouThUbK3H/q0klAs5zFT67QbhFXnVaM?=
 =?us-ascii?Q?P9TXojO4/xzQptqW41jdf+t785MlTOWGoP1BQMrqelhWxy33UjuL7RpEAq7F?=
 =?us-ascii?Q?c7Ae3IXuxktsB8MaJDcwwUBQZHWGWMcXAj5QgaZKxQ9I8t78FbEYgu58+0KX?=
 =?us-ascii?Q?bhSnW/ki7yhrwTQMtkhSP6dZ6XNRvMfsM03NxOM4DohPOt4uVtov9sCsVz7F?=
 =?us-ascii?Q?oHBv1+vR/W+siY8aNpHe1azgXGRpvyhA?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?NsJVDyyWBO35NOSGiAUd7yqd2sd8pmdJCdmduv3ZaD0H+KECKPdlLzWrAM/B?=
 =?us-ascii?Q?S0R7CYnHe2N5BTiZIILcHiRoPU5IyzH3mcI3dt4nZE4GMAiKdcTtlg26bTBc?=
 =?us-ascii?Q?QQOVCpYmQ159br8aIUf7dVi9MF3L1wa3NV5J+yZgNESPemACgrKe75tovGzM?=
 =?us-ascii?Q?nnBdrQRFJcRVJIkc+oorB2LATrvaD+l2JYtOTluRkSB5uu9xKc4dEqzmSBuq?=
 =?us-ascii?Q?qf20ZwdAmpLT0Mt1luB7Ks8adBMy657YWPqgSS/9i7i02fpt6RtXhqWVGupP?=
 =?us-ascii?Q?RnV8kWqglvo7gHKaLgbPAcSCB6TP2JiIMZwIxyu0Lc+krFg+j5ylrrV4laaG?=
 =?us-ascii?Q?AIfrXyuXVklJm/UDwb05LuwE7sleygjjO6h546LuUEVjjTJzx8mdCpvwlSPA?=
 =?us-ascii?Q?hNW750SlAETL1FYB+Zd0GQgexDJfy/MSRvck9R7GuRHgXJSr6dvQbHeOJKsU?=
 =?us-ascii?Q?+/iy7cKXGbAcFBHCXy9mE4Yf/hHHdvdKSZmD7OxO2XDJyuQVMia6vPQ/ZTPp?=
 =?us-ascii?Q?kJ9N2o4LaRjqSqMJvasRA+sur12HE/V7ZxYblDtSUKOiAE08fFr6gtZ92+a0?=
 =?us-ascii?Q?xEhEFfR08nZ/FGOIx37Dq+TPdPsL+z8C+xC9NcoCHqJ+OicDE91qOsIX9rt9?=
 =?us-ascii?Q?jXkxtkVGb5YOLWV74riw7sLPKHSLILXWecI0KAUuG2XhR6a9Ck1RBSMFgOUN?=
 =?us-ascii?Q?71irY1cvKsFmEdyFQlbFFWQK9CFLF6xOz1YXMxPcWj9gupsVrNpY59taLj5d?=
 =?us-ascii?Q?FVbNRIRrsoCxyCPV/1Ru2ShNcPxu2l+WGUSAlEUj8dpn1E6+47S9U6rHBVf+?=
 =?us-ascii?Q?75ud9J73K4QRIsyGARkayLkSjnyhmG7MjeGA/i3WtApggPnh1X2+9fYi1X1G?=
 =?us-ascii?Q?MxU1w4Q+NyfjQ5dcyLq9CDhn8VcI23ld66nPZKOR2NFeMpC5YN96VI7DC40D?=
 =?us-ascii?Q?T08hJ/QgIgjurFbItOPXgwozJ9v10vMDgHdQzH5ORJA3A9dIf+cfWuVxUzim?=
 =?us-ascii?Q?5Y3csbYQ9lQO7bIDrz3JWc+y4dLaIwRAA9OdT1DQXFTY68gIT61TtpybnMow?=
 =?us-ascii?Q?IJrKCRsudA2clGL+j7sfFgxc+1y22CMxAXP/KJCSjy/jMCBLeSm8o8eT5TL/?=
 =?us-ascii?Q?fhlgdDcJxshxa15smZGicwHlwcMUUQU4qxblZ9xUHbyRwZ0aN0QI1N3DKihz?=
 =?us-ascii?Q?uB1ydDlTrN9/2QIKh7O3bIV/85YHG5AMZT5LlB2hleKwdg6b3jmUxyaTVnWT?=
 =?us-ascii?Q?STVujR6CB+FqSCYeMgaeWZc/nCvxwfSWGQofJShyxQ4LvWK5dIH0jhjBOrhP?=
 =?us-ascii?Q?wyP/pqLFIeI3TMKMAZVR21VlUOqWCHsRhbqKRauWrDPZkO1dJB1gUn3b+Na9?=
 =?us-ascii?Q?ViGDeHr59Q6cbnI4eFfq9QAnIRq1Be4jTUSK3MqP0tCZtslFKdNpkMa42TsU?=
 =?us-ascii?Q?X7ydM6GkSE/cvaYx5m+0vejE8ZSBs5ktQhmirXQ7SPFpWvo1a4bA+sg+EVNQ?=
 =?us-ascii?Q?E962tKagzMpbU7dep0IZGYuI9b1Ema5gMhicEid+Yy/yiokIMCCiMYJzU668?=
 =?us-ascii?Q?xoi93G5PG7N7xcNgmhI=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: d56c3977-bde1-49d4-ca3f-08dd4a0baed3
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2025 19:46:59.4254
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dKRmkkRxwddMEVKo40Q2TRnibkokNWo4asKcPnSKokpjm7/lH7u+yuS+8x0Den5SpsU2qsfelaBIe/IiryLAFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6283


> From: Srujana Challa <schalla@marvell.com>
> Sent: Wednesday, January 22, 2025 11:47 AM
>=20
> Adds new IPsec opcodes, VIRTIO_CRYPTO_IPSEC_OUTBOUND and
> VIRTIO_CRYPTO_IPSEC_INBOUND and defines opcode specific data structures
> for IPsec data processing.
>=20
> Reviewed-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
> Signed-off-by: Srujana Challa <schalla@marvell.com>
> ---
>  device-types/crypto/description.tex | 80
> +++++++++++++++++++++++++++++
>  1 file changed, 80 insertions(+)
>=20
> diff --git a/device-types/crypto/description.tex b/device-
> types/crypto/description.tex
> index 0ba09df..cf5de23 100644
> --- a/device-types/crypto/description.tex
> +++ b/device-types/crypto/description.tex
> @@ -992,6 +992,10 @@ \subsubsection{Data Virtqueue}\label{sec:Device
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
> @@ -1009,6 +1013,17 @@ \subsubsection{Data Virtqueue}\label{sec:Device
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
> @@ -1096,6 +1111,13 @@ \subsubsection{Data Virtqueue}\label{sec:Device
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
> 1916,11 +1938,27 @@ \subsubsection{IPSEC Service
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
>  IPsec Outbound processing: The device will perform encryption, attach IC=
V,
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
> number of @@ -2173,3 +2211,45 @@ \subsubsection{IPSEC Service
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
Reviewed-by: Parav Pandit <parav@nvidia.com>

