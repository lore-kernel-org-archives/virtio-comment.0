Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2065.outbound.protection.outlook.com [40.107.100.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF3A126BF7
	for <virtio-comment@lists.linux.dev>; Mon, 28 Apr 2025 07:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745824021; cv=fail; b=syq6E6YNomMcsnQMkU3tuX4rbJ1N+CF+pPjtP7vg6lTFrTVtwJFZJwTNmW48K8XgqoSo5mHn1anVhlinKjgrk3VBGOQinbav5BJM9uLD4/ZhL0bOUnNTP3UpO2qwdfrC23UAy/rKrVuKsRQNu5a/dWCshB3UeBOmBzJ+m9InV5c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745824021; c=relaxed/simple;
	bh=j1kaXP2iG30gCiSm0ogf8zGh0KUgwCnZWFHlak6IpSQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=TfD9u2MSknMMbCxEbXfOtWUizVPo36d+QS9MFq+db835KG+vPVGhfoToF6Hw/gFNXHx31M3ZKez+yDV5+fyFqzGHRcbuYPIilN5uYlQDBnyzHLf6OTXbS3D2m1OA6Tx8vIYIMrmfBLPbhPmbvlYPSHb2lDmiD8zu3kV9FBQNmB0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=W+29gsoa; arc=fail smtp.client-ip=40.107.100.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="W+29gsoa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gvb5bHq7nGD/p/1zqZmYqBxBr5h5nBdIIDFeCd1L+eAoXwqJu9gMz0k+gp61Wa4kN2hLs0KmWgKs88O+Gt4SYqfJmRLXo5TsXBpqZpjm1GEYALmWw5iIrhy1oTegnQVf40ZBrTp6JqnZL2UPI11GNwWV7B/of+yIXgHEMCMkKcAaD48Tps87rgwKOCxMbn+TruRSbiRAZp8PWYCUbeI/mGBxjDzWF8Znr2k3CkdWmYdTAv91IRZFnUmLl1DXxN8UIScD7c3x/wtIlDrP3sVNras6ilaujHGTzrBJ6q8sH4i2VR1uQYUjCxl/UCvA8Rppdr5+jhRvgiK5cvPnEf2yBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NM+xuMrN9WZ7ChGoIl9CGz7tZW5K5koxgmQnBOhM6sA=;
 b=xCm4cCwGzMB5uxI1rvF+nP8mCnTqXPSke+NyrYhSp0Zdsu2w7wHsfBYenea5AqfkN2uPrY1yTevAxJhBzCtzwe7bp7VtQzJRwgskf0nEfZgev8JE35yMzVK0jD4KM0AC/KGw1JJcuc/52n4W+1JsBQv47ciNYirn9epaNvPXEZd7CrNJJrAdo3CAVdg+WGYU6AagwDICE8/GUgx3ykj2R0Q4ZtYDEOluIQ0JbibXBMSi4mIcC39J9XOfkb2kHAD92YFYSmDuLYnpBUU+Gf9oa36d9C00a+4vp57EtCttQkRev+KrxvPKZRr0wxfhr+5RUuDWWECYQsab+Mp9Xgpepw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NM+xuMrN9WZ7ChGoIl9CGz7tZW5K5koxgmQnBOhM6sA=;
 b=W+29gsoawXc3S554fCPzgQY8/trOIvhjc/YM2vp4V06JmwsY6OEfJafsr7KerihtVoKCjL4M67RZ22cMDJZA2DBSywAmpuceG180FPH0LpqlpIFU3ZaRwkSsykIYzeENk2WwI6n8dSyNGO+9s2kCxanF059270GNQ0ahnSyukxaCzI7bMQmbmGJQZimPsEaPDDpBkObamkRnKQNZcYobQcKwECdyrYhfF3V1tMOI4Vj/UkiegcljzwnXHkUSm1rWp/A0VfhtnimKacK5Cd2OTIjQpIFRYw/mXeD41bFPpNnHDui6NopCOYyqVYXAD+VGfLD+EhI1cEAFp3ceTIYiKA==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by DS7PR12MB8370.namprd12.prod.outlook.com (2603:10b6:8:eb::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Mon, 28 Apr
 2025 07:06:55 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd%6]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 07:06:55 +0000
From: Parav Pandit <parav@nvidia.com>
To: Srujana Challa <schalla@marvell.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>
CC: "mst@redhat.com" <mst@redhat.com>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "mvaralar@redhat.com" <mvaralar@redhat.com>,
	"sma@napatech.com" <sma@napatech.com>, "sburla@marvell.com"
	<sburla@marvell.com>, "ndabilpuram@marvell.com" <ndabilpuram@marvell.com>,
	"jerinj@marvell.com" <jerinj@marvell.com>, "anoobj@marvell.com"
	<anoobj@marvell.com>
Subject: RE: [PATCH RFC v6 2/4] virtio-crypto: Add resource objects for IPsec
 outbound and inbound SAs
Thread-Topic: [PATCH RFC v6 2/4] virtio-crypto: Add resource objects for IPsec
 outbound and inbound SAs
Thread-Index: AQHbtPulZvybVif6g0GlcmW15qnUD7O4owlw
Date: Mon, 28 Apr 2025 07:06:55 +0000
Message-ID:
 <CY8PR12MB71957D733EFF03222EC4DB17DC812@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20250424093046.1927395-1-schalla@marvell.com>
 <20250424093046.1927395-3-schalla@marvell.com>
In-Reply-To: <20250424093046.1927395-3-schalla@marvell.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|DS7PR12MB8370:EE_
x-ms-office365-filtering-correlation-id: dc47179b-32ed-47d7-b8ac-08dd8623426b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?CW7A4n0NNkVFfXH1QJEdP+X+yyJf+NRXyWBJzbjjsIcgZqaFCOzBt28fUszR?=
 =?us-ascii?Q?0vrZlmaEDdwLaUInrAV/7NM8h1xbSjKSOqUNMuseQB3o2FvrXAn+MWKYNbqw?=
 =?us-ascii?Q?QIdMESU8MA+aHy9QmuVO8+ssuUSGR1WPf51Vrlsj4CfmgQIZ76GBDNqI0X/G?=
 =?us-ascii?Q?1OFyRRoznqnOFnRDIWl5h9NUqfO6ENBml1WveyVu/r4dST1t9nkHX2m8HfTs?=
 =?us-ascii?Q?e4zO5VF8lT4xOCoDqcuyIJY+XFsOjcTuIC4wXYsWgUTsuS03qia7lKMJqNDg?=
 =?us-ascii?Q?PxbvuCu/ZVWSXXFwWbpGbRo+L7651kVbf4kPaHT8aACDGmiR0XKA4fjjgX5+?=
 =?us-ascii?Q?M9uzIkEJxdLeRwxX9zFknL/5zWkUVCKE9s3WU67tiItjupbGKxTdZbo6FdTy?=
 =?us-ascii?Q?VFtafstZh5u0Pco4KQXD6KEymHhukh44dK5TxV8K+mSMUQeRandZ6uTl74HY?=
 =?us-ascii?Q?aUcmYpyBKml5vnA/ZPjk8VT4WgMS8iWTY8W6nEjcw9dcgap9JbS41ZuNeFBk?=
 =?us-ascii?Q?zVjjcpRSGrgOdJ6KNE8BK6Ks97/aYuGY2x0ylxdv9BoYh/iiWIwQpOGuwVSF?=
 =?us-ascii?Q?YRl8rhpEwU/UqjNmF/frCjdlFDSgxKD2q1BucV4kL0Vj0uaHpXVHsxlybhN8?=
 =?us-ascii?Q?/BfINX/p3dcUT7jIdpcpBn4xnl0CC+ecl7q+EnR7x9EAk/JaYduxOKyEEpGp?=
 =?us-ascii?Q?YWNX6nvmTInrlWFDkHo3RGQTIyyEaaRP8Zg4t12H8Tj+4JhbF3wt7DcFUmV9?=
 =?us-ascii?Q?mIrk/zS4AOx7FkMBbjhpRCldQ1Le13HketPb2LLjII0kZbu+EnyTeKluFLBP?=
 =?us-ascii?Q?G5YQy1Jwk4lMQE0g8sJhFbJWBb+0kN4LoiBMj1ztgNzi+nF46Ucqj502jw8V?=
 =?us-ascii?Q?592SBahKb/5jR41UxCbDVse/hdUoMk8+sDl0UaLgS2TesS/eEgM3dOOGRh0z?=
 =?us-ascii?Q?5Q4PEfT1Lmgd1jLyPK/bNZwKXYimqyLnxGBgaAkrMdfwbzoroMdvIr3THHbg?=
 =?us-ascii?Q?AuQTyOUPTQ/8T/znXh3qTjKGNipF+Eyvr1AZy6F379x/HKcjNhRPsvoniK9U?=
 =?us-ascii?Q?nyEO7mVjGQbUG3SS7VwfblwXaJD8KYqUEU65XzU6bmmhHPFp3s/juikSaNS4?=
 =?us-ascii?Q?xEtSOOZ1fWqxRr7II5n0E7zy6hO/uHVpsVriaX4HsP0hqOxPRVniioS5MKw6?=
 =?us-ascii?Q?fFjBD2HSLXLfex7SoUGA6jF17VumOY9FnbRCVZi02ITtHkqJzj/nU5Hjuo3b?=
 =?us-ascii?Q?Hv8FGNv54GTsw7c2iW09M4B8cylrhFB3l4/6aYK+siPRu2E3vMQfyUw8JnAE?=
 =?us-ascii?Q?+1ADiCx1Ip3EXzDlgpG7zDHNtEvr7c1Q+X/OFcJcpcyNMPC+TRauqZckYXtf?=
 =?us-ascii?Q?tP6EqtBKUsQjed3kPDu3PPSUycaywRJIMPtQm+AkNXZ2y1zMQZRxUqHFIkCm?=
 =?us-ascii?Q?36exFarHMNATvFNuQ8UzQZ1KKj/D0TlXAN7rWQRoQDkWOUvKj+h2bQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?ZEASm/FbdW9HhxcfkQPhEDLuGZ085UGh5iPetNJF9vRmw77s00WHqhw+tQto?=
 =?us-ascii?Q?fePQtDtjX9Ps8nOMuiZ//D45QQjnMbDY7KyCAZ5pEHydcLxin0J44mlIcony?=
 =?us-ascii?Q?TbxNq+gfTThhET6oH3VSaXeWS2AuZNOH4EZmUptwz/NWQjXU9difCvT6ZKia?=
 =?us-ascii?Q?2L6b1J/vczompmeWyp1bYNrc4zVD7lc1UukohTyLKTPiMWOOk2PzF1+OcMCQ?=
 =?us-ascii?Q?02dozZJufIjXsMDb6rJT/Dr7gsUAZ88IT3yeZDZ67S2z+OlrHaYG9EcUFpbp?=
 =?us-ascii?Q?xOL9rh4+Wqt2AXUZc6oPPoxbpUWVeUyyaVd7p7+uVRGPHIXkJeTtWpJlQ2Z7?=
 =?us-ascii?Q?Sx26zMZTUyXwQ7NOzfcRhD3Vtww8gJy0R/WNeJyLnIYVHHyV5b4dxVT6F16z?=
 =?us-ascii?Q?YmiMT+rpSTVjXta3avX4+EtaNlH2qi3M9flwywbGGOAneC9VozLBBJGm15bj?=
 =?us-ascii?Q?P70ie+HPstprMvxFDZ4OyxCYYre38+RWQOFuRLmpxAbQKNRxs+uroc7aBd0x?=
 =?us-ascii?Q?HpOyezKPRekINeXG71bVTnBBh+ykSwIz6I6+uzktksG14W/JTtRgPRNbCEIU?=
 =?us-ascii?Q?VDKy0udxLL78YvR09g1SVDCHbFbhlrd14qHjGwgQfL6UYVc3qGCM0cTk782O?=
 =?us-ascii?Q?R0tql7ayOZLUEqbYFLBHYNWaZGb6048Iv3kDxZuB0aLuqugeReVwwBVpLPAT?=
 =?us-ascii?Q?ICK+9LthbVDkFSBrvjqD9860xJCSJOK7QZYVjPRFQLK9pzlfZQhSteggp8w0?=
 =?us-ascii?Q?/UhMj6eIShc2UqGjtbt5SyQ0yY9tgl+TawfNScuwIowH8aVuvW8WoV7BBp7s?=
 =?us-ascii?Q?nL59NaRx8thQRg9j8Ns/KWvUnmSovI7xk8E0hNibVCqbzfBSewb3jKOH7kc6?=
 =?us-ascii?Q?mviXaCLZxhMVWGcIlzhcxBqL0JckFDQiObaV0bcArSzlkS7m/yw559XS5dLu?=
 =?us-ascii?Q?9ySdhEvkyp+5k1BtideytabCBrWOy0+VjQ+Q4lx78m3jSSdXQ0nKda2bOizn?=
 =?us-ascii?Q?YaxElydDVh+WuGvHii+f8qlFxYYc+TIEdvPcBUysCvt9tt03k/9jvSMbK3TQ?=
 =?us-ascii?Q?1XTSkVhzIS4Eg2Nb48V/OX/HwXsq4eAkbfOXVbPiFB0IYFvi95uZbo5xG5mx?=
 =?us-ascii?Q?NvmyWHlOx3M4yJpj8Z+CY3BRKhcOg4+/SogvWxVfZvo39rMt6kFiWWRGu2Xk?=
 =?us-ascii?Q?sVkyPC8sijdc8jTFZTVpGRo5QtTuxDSbPcb+yRPoOdsh0XwwPtZqLSCHzcAK?=
 =?us-ascii?Q?e3qq6ahCX+CgC0whavryKnnN46X9lyjHgAy53wWIR+yOPkl7IuQlL+NZrbKp?=
 =?us-ascii?Q?AMEjvcIIwXH0swKANyGxwC8kOhGBT7OBdb+JZpa0raJ2xywbSnV0xEDXZrrC?=
 =?us-ascii?Q?IVZEHdJ/xy/lA37t/8cE9sAgeOBAZCDAzG3hwNAXvxqU+BuEN+mhFq/aKNXI?=
 =?us-ascii?Q?ZKsBt7f9xBJx1o+HF7hTHW1HVSIdc+xJHD2ytLEDxmsKbKKTqqKwiUZuqD17?=
 =?us-ascii?Q?PICafo+xPn8pirAozAIBCvvfT+H01yVSkiYpDOb69FYtJT993WJw6CxUbxf2?=
 =?us-ascii?Q?XO9d4EJkzi2VNBfP8aU=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: dc47179b-32ed-47d7-b8ac-08dd8623426b
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2025 07:06:55.2185
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x/jvOvWoaKssv352aaFnGrPvz2hoxfb8IbP2sKQdOWvppkk3nobLWJ3u9y2deJrh7ZSyvQYqAuUswtFBYfX9MQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8370


> From: Srujana Challa <schalla@marvell.com>
> Sent: Thursday, April 24, 2025 3:01 PM
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
>  device-types/crypto/description.tex | 155 ++++++++++++++++++++++++++++
>  1 file changed, 155 insertions(+)
>=20
> diff --git a/device-types/crypto/description.tex b/device-
> types/crypto/description.tex
> index f4978f0..544ac18 100644
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
> @@ -2036,3 +2050,144 @@ \subsubsection{IPSEC Service
> Operation}\label{sec:Device Types / Crypto Device /  \hline  \end{tabular=
x}
> \end{table}
> +
> +\paragraph{Resource objects}
> +\label{par:Device Types / Crypto Device / Device Operation / IPsec
> +Service Operation / Resource objects}
> +
> +\subparagraph{VIRTIO_CRYPTO_RESOURCE_OBJ_IPSEC_OUTBOUND_SA}\la
> bel{par:D
> +evice Types / Crypto Device / Device Operation / IPsec Service
> +Operation / Resource objects /
> +VIRTIO-CRYPTO-RESOURCE-OBJ-IPSEC-OUTBOUND-SA}
> +
> +A driver can have outbound SAs between 0 and \field{outb_sa_limit}, as
> +specified by the capability VIRTIO_CRYPTO_IPSEC_RESOURCE_CAP. For the
> +IPsec outbound SA resource object \field{resource_obj_specific_data} is
> +in the format \field{struct virtio_crypto_resource_obj_ipsec_sa_256b_key=
}.
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
> +\field{obj_id} specifies the object id of the SA that can be used to
> +retrieve driver-defined data associated with the IPsec SA.
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
> +\field{life} configures soft and hard lifetime of an IPsec SA. The
> +Lifetime of an IPsec SA specifies the maximum number of packets or bytes
> that can be processed.
> +IPsec operations starts failing once any hard limit is reached. Soft
> +limits generate a warning status when the SA is approaching its hard lif=
etime
> limits.
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

Reviewed-by: Parav Pandit <parav@nvidia.com
