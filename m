Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2065.outbound.protection.outlook.com [40.107.243.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99ADE1AD3E1
	for <virtio-comment@lists.linux.dev>; Sun, 12 Jan 2025 13:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736687510; cv=fail; b=F6WqAjOTOHa77sqfYnlVmUwg/YD4U+vM2+2OKg6D6FMtCV81JTkzzqzddXQZdJrIjUNVrANI29P+WW09pJqYvGkowrt5eQcM+Mm+4l4dPXblLzqD1b1PmBNJ7u5wlEP6LChwDOMLbpK2q0KdZD/Yt2xgAgbEzttEG9qSFKUSwZ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736687510; c=relaxed/simple;
	bh=/BAXMFqZntaL2h6UXbghF2tQ19TGNEPjsDUgWqFuCac=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Wb50m/BOvBWs+Vp7uVvV5k/JhIn3doUM5GzLsMgyNB4/+2Nm6PsdceQYdbjN18/5xGWlbFheMGHVi4+U8TFdGIVEadDrE1dGk0r8wSotb/tIws7Xp9YxGbOR9TvLe60Dp5gvB3IoBruFK7xagKr8msOu8IBw0ko9yudLXQSVtvM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Z0htq0FP; arc=fail smtp.client-ip=40.107.243.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Z0htq0FP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xZd2fvIzyyfuk2bqDsQzJGgi9D4DzYIjUvx6Din+NPyLLFDkNSckfqQ/zQPoxEcZuyBmn8lLd1J3BSWLfsuvU6oHmNaN+ynuGcTg7tp0G/M1DZxOuyzrnxlX3KFYkRgxWBfWKlEpX7wr9eDr/1Bf6wLvrpkNsfCiubrUPNnda2zWM142FkUBG4wUNbvupSQamLl24ayWyLeLOEWp9R8k81YQDqqVy8S7XejlaKpJv1FyvsomUERtxixkS7K2O4l2JCRD25RPkLxK9B/7Mj1K9oGMgJ3Zo+lD4l02luDjw/OITA6UH6kBV39XAFwXC5yDUCR1ATXyV9OsYQFoqX+/fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BbZmzsas3cd8RgMUBZ0bVi2MzLOoyMuVZe8ogaV5d8Q=;
 b=qaNUy+cFKCGiHAmhF7pDXa+wrjNDDztKp/66VK5zJoNjkkKvAvtsZz+f/PiY2BKRjyUodMpglip48dI5+qze5XQJ3gs6w2VgeK6kFMJc8zL+y/sllf6n3ZM8S1mX5jk7Aij9gDQTkNR0B3U0/1hfo2oly2qsp9Ob9l6o6tu7zSnzQbPqkpIOciQVKgvWqg7PbjbT43vRUlDiuIrIyTWpRBkfOJ9MiXhpUbXP2DViFrDmELPYIiDVLK3PjBtV6+OtlCLYNshyqoDD7v7QRAtAUiPBK9KCZFmH+DjRmWHHkMmI2AaWgBZbojmJwa+t0w/blfGTO8Rm+cz6PtFI+aaEBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BbZmzsas3cd8RgMUBZ0bVi2MzLOoyMuVZe8ogaV5d8Q=;
 b=Z0htq0FPbh5AYgOo13CcqfVgTGa9a3oPuX6CNLKpLBMhYUPxAIW1pD4zykklxTqD0oJhBE2A4FvG/LYLS+TWWxuEtxtDXoAzkqOKLLMXPKOB/hRMTOK1kOZJEddDKpePHoqRegEGsg9JV7JUsq6+aMHNluPr1JnV4Sapw3xJhJ7wqSIdIr7jSEBTX4x5x1PwzxLRsozgWURNjoFsNQaDNkCOUupreNn/xx4jPeoDo2DOC4mxY9WiUkQ0tHzSAO6BgS218YgBC19VgkknC4rJq5XLhxaiMSL73nYuJmpYfhuODaO3pwMejGpehzeOWJIqGOxnvhxyf8q1BH5HN9djeQ==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by BY5PR12MB4049.namprd12.prod.outlook.com (2603:10b6:a03:201::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.17; Sun, 12 Jan
 2025 13:11:45 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd%7]) with mapi id 15.20.8335.015; Sun, 12 Jan 2025
 13:11:45 +0000
From: Parav Pandit <parav@nvidia.com>
To: Srujana Challa <schalla@marvell.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>
CC: "mst@redhat.com" <mst@redhat.com>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "mvaralar@redhat.com" <mvaralar@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>, "ndabilpuram@marvell.com"
	<ndabilpuram@marvell.com>, "jerinj@marvell.com" <jerinj@marvell.com>,
	"anoobj@marvell.com" <anoobj@marvell.com>
Subject: RE: [PATCH RFC v2 3/4] virtio-crypto: Add new IPsec opcodes to data
 request
Thread-Topic: [PATCH RFC v2 3/4] virtio-crypto: Add new IPsec opcodes to data
 request
Thread-Index: AQHbT6RDzVSNTZF24UG5yjqMoIfIG7MTORKw
Date: Sun, 12 Jan 2025 13:11:45 +0000
Message-ID:
 <CY8PR12MB719567E649217D3401EB2EB7DC1E2@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20241216102102.2720453-1-schalla@marvell.com>
 <20241216102102.2720453-4-schalla@marvell.com>
In-Reply-To: <20241216102102.2720453-4-schalla@marvell.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|BY5PR12MB4049:EE_
x-ms-office365-filtering-correlation-id: a437b49f-8540-4ec4-ee72-08dd330aaa40
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?CXQWop3WcT5hqH5wzqWBvn0r6z9VOEgs2152F1DkHmZYABvuhl5J5Nu9W9L8?=
 =?us-ascii?Q?v8VKDKNzfcE4iHvgQEEav7+ZE7I6T6R8I3BJCTOgNKKUFsGYBhqCfFvyV37V?=
 =?us-ascii?Q?pCbwsHTYWbIYhjEDrrXMzvpJJ1MIfzsEJAA3WNYTTK2HFPm+TQLooCz2cwMX?=
 =?us-ascii?Q?ZoXFOMoytm+OR3ciVkRQD40WHNax211bUkKAQNujfWS+ED8UiaE8N+Uf3DpX?=
 =?us-ascii?Q?5cz1d00C0sIbuwIt2m6ty/A9PqV6OzRT28fvJf2fuJrdPka6JunFqzdqX2Rs?=
 =?us-ascii?Q?ewDFG5KXdvr2HvFfC3xXjWdRWXXJAtJzFQCGlTj7m7iJoHoCD05wTq/KmOhe?=
 =?us-ascii?Q?eGMnif0oKEBE+AUTeh1TmSjvfL8tPYCGNagG0AtvJe4+B9qt97bz0RdScf5i?=
 =?us-ascii?Q?3XM3Ks9QIrGMcWJIZGtzhed21Pb3ybYpZTQWHGommvr1KeuO6wSK6MhLjp80?=
 =?us-ascii?Q?h/uDyZUKkCR2Hyluya4G50l31mKh9GZGtNIj7UpSFVb8V7fdXHKFlorIlNXo?=
 =?us-ascii?Q?jBVfu+ozDkhytKeuAmdIooVblCaZlDaeN+00Aabm+1hLzXUIQ5b+29gCa6ec?=
 =?us-ascii?Q?OJ3J6KRepCyluZYtP5V4cgw3rcCT/olnnYqF/Do20DVL495F+g+/mTEAYF3I?=
 =?us-ascii?Q?/GS5GjufYXYfExyuuRxmjofqHkgGRdOMjflwR2DdP/3/No4Euu9hXHUw1Lts?=
 =?us-ascii?Q?n/kXKqq66Tk8sZTaCcue/JTXKSgk9qLVecR7RCXG6KYdcoYQfQ2MAUhQ5BFI?=
 =?us-ascii?Q?lm5wj/ztTsSyVFHzCPhDF22SROb/HV3kAv9VHJw05Ld1wURzXho6uqRzM3B5?=
 =?us-ascii?Q?tuA0rQiQVi2Sz9gxfdT8SDo8IN1fR8gKpGYg6OOCdfB5gtgWi+nF0lvvrISP?=
 =?us-ascii?Q?dVjlf2qSOmsrNtFswuIbgBC+2VaB05TNhFvofcPx/NBVnZsFQJ1071bmKMNK?=
 =?us-ascii?Q?JBvuC2qRvq3HdEl9wzaumWRM+DTbmWoQLGau9eWiD6CrNYesS/k7o6r73BLn?=
 =?us-ascii?Q?AFO8yj0Ml5otLlT6vvgjWvq4iu1x0AMQHwT7cKfOQfx7CFxRDGNd4kwT5rj6?=
 =?us-ascii?Q?vXGN3G84ZSg4AWFNWhwcr7bqdaydmEGRob56t9CkF5bsRgWnUvi0mj4SUYs/?=
 =?us-ascii?Q?x32UycwlB1mSklm9VqjMplRv1SXIG4nT/OBbV81Lg8hK8u+uZ6ZyvJ6/XL/s?=
 =?us-ascii?Q?aIft6RpRUcgqLQUlP+DmUtH4pRVHHNTcBUyuippUvqpKILZkckxOS6KkNFPF?=
 =?us-ascii?Q?j8ui9iSy5XyX22UceAYBZBnrps86V2I3WSiPsmMHqjx02aPwqGlM5MGrUtZ9?=
 =?us-ascii?Q?rUg2XQq0Co+L7sRWcqt/7VUtrwN0ldxZ78XidaaiEWRftQL7UFZSIy996SpK?=
 =?us-ascii?Q?5xAShp0/jkAZVwMqD1qdtXe639FTzJzX2q+5nTb3dNCdANSn34ieglIohaZf?=
 =?us-ascii?Q?flvLCJqiThnkPVzJIJnJ3ssj8WfB1k74?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?rtnAspsPjU8lJ7+RS/LoWuM9L6/FtG7sVy0F6q+sweQYgf5mzSDI3Bz5Sj0d?=
 =?us-ascii?Q?kYJ2hk9SA7gb4xDPP0n8IKqOM+MKjoPgh7OIW9CRxWQKWlmNTfJZHJVVxPu9?=
 =?us-ascii?Q?/njvxOV6J7P6D84KGR0F1kOVFbNKJAg7utbbmtXZlMlgcWUkO1/4g2ecZQ80?=
 =?us-ascii?Q?8ndFUtoQjGy0wuGm+hupdn7evZSUzZdlOeceP3IlH2zq4YNQjnMdTGnpz/yi?=
 =?us-ascii?Q?UDmouTqbFesIbHSRLQetSxb5Bg2XWDTJYE4EcYsQgaaf4DQFL0ndk4reM6Zb?=
 =?us-ascii?Q?3P4Za5c50z+hgBNVhd1KP8yEEFio44sc/180zDdoBqQ9h9Idq3P5Lbu2r2ch?=
 =?us-ascii?Q?3k9ZOCJhyQNqKyKbxvj10xqYgEmzGKYgR4FTN6+q8yFSHGTm8cC+mAKPnrM1?=
 =?us-ascii?Q?lN91Car4PDHmzoT+rooDWD0YkG2cVQ6X8UtTKXvrgEayZRpwcSsor4toacoF?=
 =?us-ascii?Q?Fi0dCZUGVn5NmL/YZX8BgyfQszx+4zfa8LMB9OdBVNssvLrf0CbCkaCXHM8D?=
 =?us-ascii?Q?5oq4vM+bJZbsoMVLu6vemTUfQW6gNZbRRjALtuPEL9J5lhLoWG3+qHN5OoJf?=
 =?us-ascii?Q?THRm9aNw48b+fnbceJ1cY1GrTXhZ3UtJH41qEDAurrVUjegpvCSM1SUzU0Kh?=
 =?us-ascii?Q?TPn+2guoDh9S9haBrk/cguiyYkoqPNvVH8vbGxiF4oyuJvQtd1bl2C0KDyOC?=
 =?us-ascii?Q?yo1Pvy+9jiE0imBJZw1UlFNH7hs/4NcVOXl8uiOExQkgdmMoGS7ED7R82Bu9?=
 =?us-ascii?Q?ZmgmjIt0GymEGHKBZ0yzF8s4Bl2IlZdmDCIjvkPHGpPx0+azayahseCGBBYu?=
 =?us-ascii?Q?dPVgZ/9aLWyD4sRiO3UZq3GOrXHQosIS+ocASADQ0TC48BfEOGOZQGHC7DOA?=
 =?us-ascii?Q?4iiXB1iuvFIKDWwiu2tea+m15eQwn0n3bpQnbUPpUjGVyF4/79loXrtt8jVq?=
 =?us-ascii?Q?UQ0fDIb/4Z5LmGygWERWFzKLWLSLoU1K/rusjAjPK5xl3rTnlGZVjrncGJmt?=
 =?us-ascii?Q?15ws/j/sdd0OSmaJVuY0zpnAa7+X+ZW/MTg4au+kxgkUS4Krk3Lrar5A9khN?=
 =?us-ascii?Q?XUQRTzN/i1Jo0RYdMeo+iQFESGUIMVep3Q1rveiGF0ZO580MfLV70wyR2Vpc?=
 =?us-ascii?Q?isUrclDrlnwfi9QEJ0d9xlG5sBLUTFriYLUdmwTLiqIKokv0Jt2XdIPV48GM?=
 =?us-ascii?Q?UH/aM1ezR9s3ISSIGeuUgWpJgHtChhNg90VLvo0CUuY2qUjNP+i8hXXS1hZb?=
 =?us-ascii?Q?KGJ9XwpMUABDVe+6TT1zd/Enj9N7vRwikkl77YzJYbqUs/Lqd73CqjA0VlIv?=
 =?us-ascii?Q?chzxq6NA93F9RXwAVVHP3chBQCCy+eWJBR6OggupF0QQNIxsERCzF15M1soC?=
 =?us-ascii?Q?Rzn2XcORFMVpvJ2Z73m1CsZ/ci+aFLwwB7KwHdE5NzWGUY0AmgmhCyVdYjXh?=
 =?us-ascii?Q?4GFI0dTaZ1lxWONINS5Zu4YIt5E5xYlaoQOq9++hdN2YZFMf6OithUB2io1s?=
 =?us-ascii?Q?0+J5HiWn9XtX6Z5XhdVeRLOa6O7QSsEmj897uPbwj1cGwFQBKtdlohD8oCeI?=
 =?us-ascii?Q?I75oZSYbUPlD0O7N9rw=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: a437b49f-8540-4ec4-ee72-08dd330aaa40
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2025 13:11:45.4961
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ep4IaYV5a9pCZLf0z93yfbANkr90hAGHwaPX6WyJXMCDdWMsvIfh+KccXTnxw64OPlnH9bTwg2qfB/vot3augA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4049



> From: Srujana Challa <schalla@marvell.com>
> Sent: Monday, December 16, 2024 3:51 PM
>=20
> Adds new IPsec opcodes, VIRTIO_CRYPTO_IPSEC_OUTBOUND and
> VIRTIO_CRYPTO_IPSEC_INBOUND and defines opcode specific data
> structures for IPsec data processing.
>=20
> Reviewed-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
> Signed-off-by: Srujana Challa <schalla@marvell.com>
> ---
>  device-types/crypto/description.tex | 81 ++++++++++++++++++++++++++++-
>  1 file changed, 80 insertions(+), 1 deletion(-)
>=20
> diff --git a/device-types/crypto/description.tex b/device-
> types/crypto/description.tex
> index 23128da..5f73039 100644
> --- a/device-types/crypto/description.tex
> +++ b/device-types/crypto/description.tex
> @@ -990,6 +990,10 @@ \subsubsection{Data Virtqueue}\label{sec:Device
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
> @@ -1007,6 +1011,17 @@ \subsubsection{Data Virtqueue}\label{sec:Device
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
> @@ -1094,6 +1109,13 @@ \subsubsection{Data Virtqueue}\label{sec:Device
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
> +    \item \field{op_flf} is struct virtio_crypto_ipsec_data_flf.
> +        and \field{op_vlf} is struct virtio_crypto_ipsec_data_vlf.
> +	Works only for session mode.
> +    \end{itemize*}
>  \end{itemize*}
>=20
>  \field{inhdr} is a unified input header that used to return the status o=
f @@ -
> 1914,8 +1936,23 @@ \subsubsection{IPSEC Service
> Operation}\label{sec:Device Types / Crypto Device /  in tunnel mode, as w=
ell
> as the ESP/AH header from the packet. The resulting  packet contains only
> the plain data.
>=20
> +The driver can offload IPsec Inbound processing by \begin{itemize*}
s/offload/request

> +\item Creating inbound SAs using the
> VIRTIO_CRYPTO_RESOURCE_OBJ_IPSEC_INBOUND_SA command.
> +\item Setting the \field{opcode} in struct virtio_crypto_op_data_req to
> +VIRTIO_CRYPTO_IPSEC_INBOUND.
> +\end{itemize*}
> +
>  IPsec Outbound processing: The device will perform encryption, attach IC=
V, -
> update/add IP headers, add ESP/AH headers/trailers.
> +update/add IP headers, add ESP/AH headers/trailers during data processin=
g.
> +
> +The driver can offload IPsec outbound processing by creating outbound
> +SAs \begin{itemize*} \item Creating outbound SAs using the
> +VIRTIO_CRYPTO_RESOURCE_OBJ_IPSEC_OUTBOUND_SA command.
> +\item Setting the \field{opcode} in struct virtio_crypto_op_data_req to
> +VIRTIO_CRYPTO_IPSEC_OUTBOUND.
> +\end{itemize*}
> +See \ref{sec:Device Types / Crypto Device / Device Operation / IPsec
> +Service Operation / Data processing}
>=20
>  A crypto device can support number of IPsec SAs, allowing it to manage
> multiple secure  connections simultaneously.
> @@ -2156,3 +2193,45 @@ \subsubsection{IPSEC Service
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
I am not familiar with acronyms flf and vlf.
Can we right something else or?

Also do we need this length here? Or can this be the descriptor(s) itself?

> +For IPsec encryption:
> +\field{src_data} is the full IP packet that will be processed.
> +\field{src_data_len} is the length of source data.
> +\field{dst_result} is the result ESP encrypted packet and
> +\field{dst_data_len} is the length of it. Please note, dst_data_len
> +SHOULD include additional header and trailer lengths.
> +
I believe this should be MUST.=20
> +For IPsec decryption:
> +\field{src_data} is the IPsec packet that will be processed.
> +\field{src_data_len} is the length of source data.
> +\field{dst_result} is the result plain IP packet and
> +\field{dst_data_len} is the length of it.
> --
> 2.25.1

