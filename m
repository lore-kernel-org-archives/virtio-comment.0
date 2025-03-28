Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2058.outbound.protection.outlook.com [40.107.220.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1121C6FEF
	for <virtio-comment@lists.linux.dev>; Fri, 28 Mar 2025 17:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743184159; cv=fail; b=elz36FDrHVWdeYYUFFdxPPZyQ+ak+QsaYardM3HtDIYIhhYruHTWGqGSyrMdVK03mEnNfiO97KfinR0qzs/D+3N6ui3s6dlvjjzzRExHHmuCm7MGFFs6w62u0lLdjyd5hvAJSGXGCjgwoi4mml5J/KGoflRTYjqFO0Qn0uyOVOM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743184159; c=relaxed/simple;
	bh=lYiBbtX5up3WOHuBh1fNnVlejYN7ibW9Pfy1FQv318A=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZQpdOsGNh+wRDWF1F/QUDme8TB89ucPSoi6t2DqfY8QCw3LfHgsNINewbtokaEQVEIpuNMyvptP+4onOIwxVGhj3Ju+C0W6cPb1VNwrzwDV0Xrq5xNJpLacIgWgZxegQfNf+1+n/3cjSdGmJsjjVdm/u+REdQac/OZT+qBIS/Ww=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=h8UTsRca; arc=fail smtp.client-ip=40.107.220.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="h8UTsRca"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rw1TcF+es9A0ipcxLzdg2NdggKR7b+6mnAWB+zxKcW/jKorrBkacIF7m02Pqav5/1ZhK/DAL5EG5h1acv0sJk1yzZ827zdVSdMwYJ/NUnMbtdW0kJc6jhBC8HZ463uKeRkVio8sC2PKXI3k848DOxU0LcEYH0oq5YwxFF1rsICPMN5zf8pxwc6nuAOuSzOFBcwJnzRz7Tsy9Prd5oOcCOXAOorlHnOum7xCn5ZfD+8dcHxCk7DMKcT3XXoD1ameeObS96bCN5LhWhUKCUpTC5Lv3vnl9b6TL0yuqtpl91aEmB7YVmqIFXk5Atdf28FZghsQWZ2ajIsTAbt1mjQy4fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mD0NEzONac8HiV+paeZyXERDRxwxReniiek+l/NDRsI=;
 b=NwJ6oGunZ4RIVmLUR6s3J0azSWbD//HfVle7BB5vVL/4Ou9Vcxr8ui+8Fhmb204w1hkTh6nGDKp2A73xfettKLTZ6Ps58lsMx4qIo2vrsQQ6BOUVUUFgcch5Qwrn7db28ImpFeF3oO53qA2Qd/PI9VjCD8SxIZExfkL0A/rHcXoYrdfskZmX+aWo///8wzH8wCUNnI+htF973ihquA9rRvE4T1yXTsC6wNQw89zjqmj+Z0auGavu0GaUSqzVebUrRkMLmttqO4y7I2TWdz2O0qxsdQy2qzq6aRn7BtWszB4V1Fz2iyf7OlZ991W6Scz+jX7xaqkFXnDwU7v0Zz2OTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mD0NEzONac8HiV+paeZyXERDRxwxReniiek+l/NDRsI=;
 b=h8UTsRcabxQP+UifE2ViUVMhbPwYACy/ssPUvAEvzDxFa83lccWSQMQn5xLmRW47aJ+pZH52cLPhCcHnYtBqXzBT2Duu45dunoOMOarsj72/Mu7GjJDrF8OSE6eHhNXlhJheolRCgYIcqRNKVkjRMpm1nsHRFjcYX3Z2Tt9Scqa6b0ct8/Suhg3sJJ+DlTZi1BdnYs+Q3u/3zXH0rs9m8Dirt/AesusrUR52t0Xspgwu0YXruv38svz8TCRVxiac9jyZ0bRxISzfSUKYytafTh7KZJ+x7+gLCT9zd94NJg5e0GX+FXpvog8aIRa9Zs+cSqCQIZsORQVrF2W6hYJZpg==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by IA1PR12MB6601.namprd12.prod.outlook.com (2603:10b6:208:3a3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 17:49:12 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd%3]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 17:49:12 +0000
From: Parav Pandit <parav@nvidia.com>
To: Srujana Challa <schalla@marvell.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>
CC: "mst@redhat.com" <mst@redhat.com>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "mvaralar@redhat.com" <mvaralar@redhat.com>,
	"sma@napatech.com" <sma@napatech.com>, "sburla@marvell.com"
	<sburla@marvell.com>, "ndabilpuram@marvell.com" <ndabilpuram@marvell.com>,
	"jerinj@marvell.com" <jerinj@marvell.com>, "anoobj@marvell.com"
	<anoobj@marvell.com>
Subject: RE: [PATCH RFC v4 2/4] virtio-crypto: Add resource objects for IPsec
 outbound and inbound SAs
Thread-Topic: [PATCH RFC v4 2/4] virtio-crypto: Add resource objects for IPsec
 outbound and inbound SAs
Thread-Index: AQHbnIdzDEIQ/txkhUCkSuOe3tlZWLOI0Z/Q
Date: Fri, 28 Mar 2025 17:49:12 +0000
Message-ID:
 <CY8PR12MB7195A8A367DF7D8CE1A7CFB7DCA02@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20250324063843.1599512-1-schalla@marvell.com>
 <20250324063843.1599512-3-schalla@marvell.com>
In-Reply-To: <20250324063843.1599512-3-schalla@marvell.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|IA1PR12MB6601:EE_
x-ms-office365-filtering-correlation-id: b6483ccd-9ce5-4786-8c7c-08dd6e20d9a7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?umkmD78yfqL+h/5d8KVH/TnxwnBXvXVSzhmYXfbYWEVZf2ADU69UwfgSazOP?=
 =?us-ascii?Q?P+h46BFl+obfCVPjDpmUDiDx/29nB5qBNvZdwpPHm5QfaEjh0QBfwq9ID9M8?=
 =?us-ascii?Q?JU9xhu9DPPkYbWDGW7m4awOvBZVkrTf0TNlN8AA89P7r3b2meBIiNvh7ucFg?=
 =?us-ascii?Q?zuWvlASEFMtr73wrPn4yKHdW0wJxLV9MqBLmPl9yAp1qch3HPXUZ/920XsWS?=
 =?us-ascii?Q?u0SEoymRAWy8H4MiwtxPz7Rzi5LiESi7ss8UbUMbeQbe4O6ngJWRXXesVID0?=
 =?us-ascii?Q?TbMuhkexPGbOF2c9SP6YOPoV5J92ppwJdYKTwjWmIzk0NsboBEG1LUwv3Xc1?=
 =?us-ascii?Q?ysXnGHQudOAKeBomvqTKjVjuFgCtPTQ1iSkBE81KzGIRkdZYW8RuRh2vy/zG?=
 =?us-ascii?Q?TklW97WzlZiHfZFixGVj7sjlUp9CJ9y1DAuoWnZteo5ICQniZlC3XfzhZa4z?=
 =?us-ascii?Q?r6UDwqnzifQlZW+FUzasYnyqV02QhDwacJoMiDxPX5DXjZJTjw80yBHx18eq?=
 =?us-ascii?Q?/TC+Qk0/UoaCVBi0F2UnUV4sj+MBn9i3KrBRl3t1sCeIzxSpDj0jUmOT6fbj?=
 =?us-ascii?Q?JSQ9yM2pE98mcYj0ApNbELKLzYSrqSN/N9XX9ah4leDgOBO3wWTriRBj6bfi?=
 =?us-ascii?Q?8YtzdWmvlNKL6Pmn3Wkla9kThw0+c38Ezuv3/rdPCUHCFWEj0kfom0dBxszv?=
 =?us-ascii?Q?72WjomP8NOC7whgEFExrKT3bRaUODuj0rhBhtD5V8wMaXcX6OptHwOukGvr+?=
 =?us-ascii?Q?UM9N6H3XJWLM3eAI4gOaSDBwsLVsE6KZf2kq6WbNJv9KtApYAMKAIljH4Co7?=
 =?us-ascii?Q?BObtYHkqg6XI0PBsBQWQGbJn0/Wjz29LVX2K71xCSuzR3Cc/hFqnv1lc6ioj?=
 =?us-ascii?Q?JxfSOkYOu+VTFBLXUQLPal2Ok0KcPgpEWMK7Ev7WdJ8SsVf/MJN61iUfw/YO?=
 =?us-ascii?Q?b9ox7/7OtjPtj3cyMBntjctvoeH+YqYWeTRTRg3C9/vdEteA4gEVIMWaWIkS?=
 =?us-ascii?Q?4hxAFWgi9VrL4MfBwRpTz308r3/Z4ekuCS+PtdOkDBueaLTRdRzVbCJ6MA6U?=
 =?us-ascii?Q?dcTei0pmkpKU8iuz6j5TUx/mNlBeWRooJcPclC/IzaY2ZsbDYx9J8UTgSoR9?=
 =?us-ascii?Q?0b71gmFsTb6z28jCVfcX7fxK1q8oP9qf2dncWvtZCA78DNhK6G0mFPyvdeQw?=
 =?us-ascii?Q?6aKNZzWMTZ28TNl/Br1dohoT1Fz8GSIcFFj4sxX+bmwoxdTBbfL1gamksyIw?=
 =?us-ascii?Q?FJzb53Sfe7v7/jh+hMVn6t5eEPLaHSN20wB5DI7tQsva1eLXjUZCvEH/svSI?=
 =?us-ascii?Q?oxk68ZL+FxU+3llGUSDpQWKS0nWfhHEarnA1tGzSE22HTBNn64bf8hhIOagr?=
 =?us-ascii?Q?KRNZy8d61AwVRhP+7TMAYqr2sPd2yqcZmbuK6WeuytpByZTzCMVTwlLlIDiA?=
 =?us-ascii?Q?i4dGFWBHWCfyepjSxqxp9FgpC5Q+me/XiOCXTx55ke5Htw13dp4zZRK1bLkB?=
 =?us-ascii?Q?wo2rTLsHPY0NvPA=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?IM1F7/bnUHXnINyNAB3UJalwEvYIRHiHZEBiW247ONT44nooWDO4/dM0OA1Y?=
 =?us-ascii?Q?qsuv1LuzFC2IEhehvvyLgBNx4cL2gn+QJPXtxVrIlMx5xnMkbEPpecw/Q6aG?=
 =?us-ascii?Q?SHLwJFV1c8WpucmjHEwcYg2WYpLRpEWJhKMhQBkCboSkpZMzJln+VQj7enSt?=
 =?us-ascii?Q?oUUO458sslsirVPV4y+4328epemOKK72Qqo70pEVBAl35N9cR183nmlMon0c?=
 =?us-ascii?Q?HC7EGH0A4NucXgoT5z6s9qi0gIBaUIlieAyqWCs5C6kicm0WLzzpInbp0W1V?=
 =?us-ascii?Q?2jI+NTQhI4im1o+MIJnVlBQLOPYz+Dru8Af+vJnN5N8sIVQRQwKAzuPnWdsx?=
 =?us-ascii?Q?+7FPwIvy2lOb+NARQKN4eDpPHs7q+1OY3OtIjFgPNYVeINFSMxK7LXjBH3vW?=
 =?us-ascii?Q?K7PvJJV10TYZBuHVg6CjODwmW4EGyOwx8ki7w+DXhqHyWCsxx1y9q5yw2s6Z?=
 =?us-ascii?Q?vlJ8Of8p5YxSw1+5pHX1aQb7yhJV/Ci0fLD1TORUi+E7bIk2s98o8rroWI73?=
 =?us-ascii?Q?4mVKVqr60Hbsnotl3PYks6Qqo67U8J6sOgCZmPdolrEkJ8cwVT/G1mGLyVm4?=
 =?us-ascii?Q?yzmxmboj/7W9bTYCuFLayEdY6tH0CJA/105znzFWj5qXx4ZseFN9jiIhnrcp?=
 =?us-ascii?Q?2jsuE8I3AJvynOKjOQTRzTszZ7QE3jIwOHj3hZW2mJ+Jjd39h3y2So1Pv2/u?=
 =?us-ascii?Q?H/62ocFHBjv8ZuCw4waAAg1gU3+4HaBdxvpFrIKmWemRAZ1BxZt4PiiVDzrz?=
 =?us-ascii?Q?pd+V3eWh8AoRmX4z7SnqoKAMhXRxhhRu2SL9GRr82ERAvv7SWZHbggPCQRzb?=
 =?us-ascii?Q?mG8u+aPnaJkIiLllmheFrPp8CREwgly6+Lam2Ruu7TWD6u/JPWQtacF0ClUh?=
 =?us-ascii?Q?W2ofgK2r97gT4pHGhA6RRRk52jDP/LtoNGt48poCX6+vijwOW/YRf4eo1zrJ?=
 =?us-ascii?Q?yIL9Pz1KpfGkdc5TMXful/AdD47rLvkjr6VMgCsbmmYrArcFmVyabOsF9tWq?=
 =?us-ascii?Q?0WVGfTXE9NItdOEN3FRa3xhTN/6XnOMW6NYNquwrimgcT/FuOFRiWh/XsJE6?=
 =?us-ascii?Q?JGkt4PEEbDTU3WkMMcwS9ly8h95yts/qnhZv0QxDcB1imvu99Api4c25iBmr?=
 =?us-ascii?Q?AyPdr6bWj8skZYiNfKNFplINUZzR+z9EGRoYUL2FAhWCfrvBfvOk//1YE7CO?=
 =?us-ascii?Q?NqTk8653kN0lqnPk1ioeglFz9lUQWBCcsK0H1/njEkYpnTouwsLPl43N4HGo?=
 =?us-ascii?Q?daKOhSCzBsjf5LUxulI7dYugEDLNhR161DrKBsOg0tSJ6FDLeXSabcQJkwLg?=
 =?us-ascii?Q?DxTEl60XMNp/6ZTouXv9Zk8pTP2Lo/C3QE4KV/VUrYSjFi9VZuyv6e1ezJZN?=
 =?us-ascii?Q?LSawPpz6457hK6eCs/MVFMC9KxEqc7DebMGF75Ym8aE3dSFIjKhQC5/DrXsL?=
 =?us-ascii?Q?8tOZqkri9XHF3c1+XUxwi1Ws8hc9/iJqJcxnRTHhgDAQOQc6TRL2d+wZ2SNf?=
 =?us-ascii?Q?RTFJa1RjDSnWJOWHKJZ3ZzCu7vvA4qowKmrJ+wmol1jyd3sUeGibFpdNtHXf?=
 =?us-ascii?Q?j2+JLgXCDCHsskvJZqc=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: b6483ccd-9ce5-4786-8c7c-08dd6e20d9a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2025 17:49:12.5927
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QG1HKAjH5p2Ked/s0PqQd2eHw+pyxC1tIJvp5ZEhpktxbzd8GYSadv52gVEtCVad/d5aIWntkw6p99Cqwe/sAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6601



> From: Srujana Challa <schalla@marvell.com>
> Sent: Monday, March 24, 2025 12:09 PM
>=20
> This commit introduces resource objects to enable the driver/device to cr=
eate
> IPsec Security Associations (SAs) for both inbound and outbound direction=
s.
>=20
> The IPsec SA objects include essential parameters required for packet
> outbound and inbound processing, such as SPI, tunnel headers, IPsec mode,
> IPsec options and cipher/authentication specific data.
>=20
> Signed-off-by: Srujana Challa <schalla@marvell.com>
> ---
>  device-types/crypto/description.tex | 157
> ++++++++++++++++++++++++++++
>  1 file changed, 157 insertions(+)
>=20
> diff --git a/device-types/crypto/description.tex b/device-
> types/crypto/description.tex
> index 958c231..da1f193 100644
> --- a/device-types/crypto/description.tex
> +++ b/device-types/crypto/description.tex
> @@ -336,6 +336,20 @@ \subsection{Device and driver
> capabilities}\label{sec:Device Types / Crypto Devi  \hline  \end{tabularx=
}
>=20
> +\subsection{Device resource objects}\label{sec:Device Types / Crypto
> +Device / Device resource objects}
> +
> +The crypto device has the following resource objects.
> +
> +\begin{tabularx}{\textwidth}{ |l||l|X| } \hline type & Name &
> +Description \\ \hline \hline
> +0x0200 & \hyperref[par:Device Types / Crypto Device / Device Operation
> +/ IPsec Service Operation / Resource objects /
> +VIRTIO-CRYPTO-RESOURCE-OBJ-IPSEC-OUTBOUND-
> SA]{VIRTIO_CRYPTO_RESOURCE_OB
> +J_IPSEC_OUTBOUND_SA} & IPsec outbound SA resource object \\ \hline
> +0x0201 & \hyperref[par:Device Types / Crypto Device / Device Operation
> +/ IPsec Service Operation / Resource objects /
> +VIRTIO-CRYPTO-RESOURCE-OBJ-IPSEC-INBOUND-
> SA]{VIRTIO_CRYPTO_RESOURCE_OBJ
> +_IPSEC_INBOUND_SA} & IPsec inbound SA resource object \\ \hline
> +\end{tabularx}
> +
>  \subsection{Device Operation}\label{sec:Device Types / Crypto Device /
> Device Operation}
>=20
>  The operation of a virtio crypto device is driven by requests placed on =
the
> virtqueues.
> @@ -2035,3 +2049,146 @@ \subsubsection{IPSEC Service
> Operation}\label{sec:Device Types / Crypto Device /  \hline  \end{tabular=
x}
> \end{table}
> +
> +\paragraph{Resource objects}
> +\label{par:Device Types / Crypto Device / Device Operation / IPsec
> +Service Operation / Resource objects}
> +
> +\subparagraph{VIRTIO_CRYPTO_RESOURCE_OBJ_IPSEC_OUTBOUND_SA}\lab
> el{par:D
> +evice Types / Crypto Device / Device Operation / IPsec Service
> +Operation / Resource objects /
> +VIRTIO-CRYPTO-RESOURCE-OBJ-IPSEC-OUTBOUND-SA}
> +
> +A driver can have outbound SAs between 0 and \field{outb_sa_limit}, as
> +specified by the capability VIRTIO_CRYPTO_IPSEC_RESOURCE_CAP. For the
> +IPsec outbound SA resource object \field{resource_obj_specific_data} is
> +in the format \field{struct virtio_crypto_resource_obj_ipsec_sa}.

The structure below is .._sa_256b_key.
Did you mean that when you refer to ' virtio_crypto_resource_obj_ipsec_sa'?

> +
> +\begin{lstlisting}
> +struct in_addr {
> +        le32 s_addr;
> +};
> +
> +struct in6_addr {
> +        u8 s6_u8[16];
> +};
> +
> +struct virtio_crypto_ipsec_tunnel_param {
> +        /* Tunnel type: IPv4 or IPv6 */
> +        u8 type;
> +        u8 reserved[3];
> +        union {
> +                /* IPv4 tunnel header parameters */
> +                struct {
> +                        /* IPv4 source address */
> +                        struct in_addr src_ip;
> +                        /* IPv4 destination address */
> +                        struct in_addr dst_ip;
> +                        /* IPv4 Differentiated Services Code Point */
> +                        u8 dscp;
> +                        /* IPv4 Don't Fragment bit */
> +                        u8 df;
> +                        /* IPv4 Time To Live */
> +                        u8 ttl;
> +                        u8 reserved1;
> +                } ipv4;
> +                /* IPv6 tunnel header parameters */
> +                struct {
> +                        /* IPv6 source address */
> +                        struct in6_addr src_addr;
> +                        /* IPv6 destination address */
> +                        struct in6_addr dst_addr;
> +                        /* IPv6 flow label */
> +                        le32 flabel;
> +                        /* IPv6 hop limit */
> +                        u8 hlimit;
> +                        /* IPv6 Differentiated Services Code Point */
> +                        u8 dscp;
> +                        u8 reserved2[2];
> +                } ipv6;
> +        };
> +};
> +
> +struct virtio_crypto_ipsec_lifetime {
> +        le64 packets_soft_limit;
> +        le64 bytes_soft_limit;
> +        le64 packets_hard_limit;
> +        le64 bytes_hard_limit;
> +};
> +
> +struct virtio_crypto_resource_obj_ipsec_sa_256b_key {
> +        u8 mode;
> +        u8 direction;
> +        u8 reserved[2];
> +        le32 obj_id;
> +        le32 spi;
> +        le32 salt;
> +        le64 options;
> +        struct virtio_crypto_ipsec_tunnel_param param;
> +        le64 esn;
> +        le16 udp_sport;
> +        le16 udp_dport;
> +        le32 replay_win_sz;
> +        le64 cipher_algo;
> +        struct {
> +            le16 length;
> +            le16 reserved1;
> +            u8 data[32];
> +        } cipher_key;
> +        le64 auth_algo;
> +        struct {
> +            le16 length;
> +            le16 reserved2;
> +            u8 data[32];
> +        } auth_key;
> +        struct virtio_crypto_ipsec_lifetime life; } \end{lstlisting}
> +
> +\field{mode} specifies the mode of the IPsec SA, see \ref{table:Device
> +Types / Crypto Device / Device Operation / IPsec Service Operation / Dev=
ice
> and driver capabilities / VIRTIO-CRYPTO-IPSEC-SA-CAP / IPsec Modes}.
> +
> +\field{direction} specifies IPsec SA direction.
> +\field{spi} is the Security Parameter Index(SPI) used to uniquely identi=
fy the
> IPsec SA.
> +\field{salt} is the 32 bit salt value used in the cryptographic operatio=
ns.
> +
> +\field{options} specifies the Options for configuring the IPsec SA, see
> +\ref{table:Device Types / Crypto Device / Device Operation / IPsec Servi=
ce
> Operation / Device and driver capabilities / VIRTIO-CRYPTO-IPSEC-SA-CAP /
> IPsec Options}.
> +
> +\field{param} specifies the parameters for IPsec tunnel mode.
> +\field{esn} is the starting sequence number.
> +\field{udp_sport} is the source port for UDP encapsulation.
> +\field{udp_dport} is the destination port for UDP encapsulation.
> +\field{replay_win_sz} is the anti-replay window size to enable sequence
> +replay attack handling, replay checking is disabled if the window size i=
s 0.
> +
> +\field{cipher_algo} is the cipher algorithm identifier see
> +\ref{sec:Device Types / Crypto Device / Supported crypto services  /
> +CIPHER services} \field{cipher_key} specifies the cipher key and its len=
gth.
> +\field{auth_algo} is the Authentication algorithm identifier
> +\field{auth_key} specifies the authentication key data and its length.
> +\field{obj_id} specifies the object id of the SA that can be used to
> +retrieve driver-defined data associated with the IPsec SA.
> +\field{life} configures soft and hard lifetime of an IPsec SA. The
> +Lifetime of an IPsec SA specifies the maximum number of packets or bytes
> that can be processed.
> +IPsec operations starts failing once any hard limit is reached. Soft
> +limits generates notification when the SA is approaching hard limits for=
 its
> lifetime.
Are you adding the notification infrastructure in this series?
I don't recall it in v3, or I missed reviewing it.

I believe counting SA packets and bytes requires a capability as it comes w=
ith extra cost, which may not be always needed or may not be implemented by=
 all the devices.
So lets please add the capability for it in the first patch.

> +
> +\begin{table}[H]
> +\caption{IPsec Direction}
> +\label{table:Device Types / Crypto Device / Device Operation / IPsec
> +Service Operation / Device and driver capabilities /
> +VIRTIO-CRYPTO-RESOURCE-OBJ-IPSEC-OUTBOUND-SA / IPsec Direction}
> +\begin{tabularx}{\textwidth}{ |l|X|X| } \hline Type & Name &
> +Description \\ \hline \hline
> +0x0 & - & Reserved \\
> +\hline
> +0x1 & VIRTIO_CRYPTO_IPSEC_DIR_OUTBOUND & IPsec direction outbound
> \\
> +\hline
> +0x2 & VIRTIO_CRYPTO_IPSEC_DIR_INBOUND & IPsec direction inbound \\
> +\hline \end{tabularx} \end{table}
> +
> +\subparagraph{VIRTIO_CRYPTO_RESOURCE_OBJ_IPSEC_INBOUND_SA}\label
> {par:De
> +vice Types / Crypto Device / Device Operation / IPsec Service Operation
> +/ Resource objects / VIRTIO-CRYPTO-RESOURCE-OBJ-IPSEC-INBOUND-SA}
> +
> +A driver can have inbound SAs between 0 and \field{inb_sa_limit}, as
> +specified by the capability VIRTIO_CRYPTO_IPSEC_RESOURCE_CAP. For the
> +IPsec inbound SA resource object \field{resource_obj_specific_data} is
> +in the format \field{struct virtio_crypto_resource_obj_ipsec_sa}.
> --
> 2.25.1

Apart of above comments, rest of the patch looks good to me.
