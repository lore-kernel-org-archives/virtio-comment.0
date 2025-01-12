Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2065.outbound.protection.outlook.com [40.107.243.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761BA224D7
	for <virtio-comment@lists.linux.dev>; Sun, 12 Jan 2025 13:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736687508; cv=fail; b=nqPp5+ZVLCuOj4AWERhZ/TZKy4BdebB0SAXaphShBxKEH8XUNsyYS5BphD8RKN7POGJk65Jc+TY64Z2zwJuAVqtSfKWGdDzspkUMJxGGCDj2+Hgf3lELW2UPglKTd9mB27XvubBLqTcEh1xrSgektuRNa6CDPpw6DiadHoGuHjc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736687508; c=relaxed/simple;
	bh=1It4P9VJxF154oK4t4NT17sTqA1c+6jO+IIpAEXFUy0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=T0fM6KDrmD/hy84W8maTdV61Hm6peawVLzr5PiDAcf6ybNSWWbbnI+u7M5Xs7pse4pXKFmm1pxkisRfmB6hy/ot5q/mnLd0epvg3WbtXAow74Cw3k2dm/iK5tu2JFE/zq8yNl31Wx2vQf+S91AtOWHC3M43eW5vyAiFN1WZ7/7A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=M/Xe6aG4; arc=fail smtp.client-ip=40.107.243.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="M/Xe6aG4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SYRf4t8AhexfdIR1k15niiZZa56UQhWEHBpySZINqV+CrrHnlrekFZtTADb+WyDBoqyQECeTG7IXAQrnqzlRoxfM14ejfoBkUJQWMfd1I+4FMLxKzfemy5kEO2rWTqGuuu6o5a8uNbyNhmTFcZscG0wuDoAFrrl0oUdt2ZV2VyR2NendxIyUribZ2NAUD9Ijnh82ATPIWLzp22BFj1lWfq2bNi/IETHbmvBUyuY6up7nmo0JfIg/BTW/Qpnq3og9hWwCpiU/lPO1AI2O6sCA9baXqgotwN5+TBANI1V7SEYjjosyy0i2/+UAiWxAj2PxtWbe7F0mEUYMzoUcLyCaaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hBCjphTNg3uV5FpiIWWFnncnNbY4gT2SA9480hJSgXY=;
 b=f3KBBsgENXLRxEaCIjp+++bn5fzssqnVn3Z/CwTa6n32/Kyo8JAg2nvfVNL8vdUufv05LhT4ImpIb3h1qXA86BureaP7iVnrnK0VhNQE/DoDQpG4KHKxaD7bex0zHZm+ohQ5lKLU9kvLvZFJ+DMOuIsG7hFQxSL1ANTJQKgTm4V5SvZDchgNH8xHGGHy2hi6mRY4x2EIJIi7pENA0KaImOGiz78xx9SmmuU0pRV6ZFNtXxNkQ9L/DVh/Sk8gNx8vynMGH5DJlYF5L4N2YHiQyF6AjbdpT2lppkcnai6aun9C7/OtOCtJtDrsQPskxQYvHCKt2MVPQlPbu5R7XNmFog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hBCjphTNg3uV5FpiIWWFnncnNbY4gT2SA9480hJSgXY=;
 b=M/Xe6aG4Hs3gP2TD9W4IUy+cmzKKKyly6dFztffds/veCJDa7A6DdQa+1Mp92MtWvL2hgLOdtltwxWQzJXRe0hPV3Ct1y2bBI+KHOYq/uloBHORhXEzsWhZ1OmmPktxMiyxBNbfu3TqUgrhEjRd4+yxemzzJdzIP7wz+F59E46PBpsW07GyMGXJ16Hx3VWABa2PvI7aSh5VjHwvpCUAn3zKb41pi4YabqV1TUfOcrT/Cj8gYvZAdMVRXWhltpp86xmpFFUIgarczkcpbUro5hGJ+ovQISA2eYF2uC8lsCQpe6NmngKdaVfp2dnCVNhSgd8gaUWvKoi9s3w4w2C/dSw==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by BY5PR12MB4049.namprd12.prod.outlook.com (2603:10b6:a03:201::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.17; Sun, 12 Jan
 2025 13:11:42 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd%7]) with mapi id 15.20.8335.015; Sun, 12 Jan 2025
 13:11:41 +0000
From: Parav Pandit <parav@nvidia.com>
To: Srujana Challa <schalla@marvell.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>
CC: "mst@redhat.com" <mst@redhat.com>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "mvaralar@redhat.com" <mvaralar@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>, "ndabilpuram@marvell.com"
	<ndabilpuram@marvell.com>, "jerinj@marvell.com" <jerinj@marvell.com>,
	"anoobj@marvell.com" <anoobj@marvell.com>
Subject: RE: [PATCH RFC v2 2/4] virtio-crypto: Add resource objects for IPsec
 outbound and inbound SAs
Thread-Topic: [PATCH RFC v2 2/4] virtio-crypto: Add resource objects for IPsec
 outbound and inbound SAs
Thread-Index: AQHbT6RCPg6AXZStskaVnwv4nSrplbMTNtxg
Date: Sun, 12 Jan 2025 13:11:41 +0000
Message-ID:
 <CY8PR12MB7195A0842EF2D2D31081A8ECDC1E2@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20241216102102.2720453-1-schalla@marvell.com>
 <20241216102102.2720453-3-schalla@marvell.com>
In-Reply-To: <20241216102102.2720453-3-schalla@marvell.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|BY5PR12MB4049:EE_
x-ms-office365-filtering-correlation-id: d0e94edd-e13b-4eb9-b0ab-08dd330aa7d2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?yWUUKymOaVrhOT0YZg2P9RAn1jye/zcGTUHY0wdjWuRkgNiUwkWyQQuEJAky?=
 =?us-ascii?Q?WFPlyWNJa8SqzXgN2bp/f9SpYxLAFnpZva3t0xhph7eNM5t4aoqOphJlao0n?=
 =?us-ascii?Q?GRq5tc0MtYNbJBBGAex8zJOzQpgaFt9B6uHTqkqIVHcEp8KreX33LOGNmSj9?=
 =?us-ascii?Q?HirMBVoHTijjAI/fNT95dLkDG6mqqQgYFtL7FDcFKUxfj3qP1/fuszRaAQih?=
 =?us-ascii?Q?EsaAKbmVuTwqYvUGfOd3r2Fj3jSbW0kOkpVn16ATTrh821WM0SoslcPHs+35?=
 =?us-ascii?Q?yf12oBZKRrIJzKTBZ/y9qlekf8o2xFAxes+87wgQ0Bdf7wG2ZCEEppaM4Hul?=
 =?us-ascii?Q?B3a3EvXQ79paY9XI8asmjMqxAmfwO5BX+rHu90SkUffu3B4ouWr9K6JDDmTP?=
 =?us-ascii?Q?5wtuvZN0DAkM179HOjlvWvostHAUKwJAQr2sCvzuNjdbrNnzbYb1zW89e3mV?=
 =?us-ascii?Q?o6SsaUVKiuuNM/7qB5vOCrp1xll9oq5ezw/uoXOFFghw0ZV+G2QXOVLmE2s/?=
 =?us-ascii?Q?8VFxkAhTzPzp9A7n0ZQiZ6m3ESTpud8IGYtChqgq0mvcUc19ChO+adEcC+a8?=
 =?us-ascii?Q?9ZiahhzypNBH2rNygB1jaKQvIEqUxdAkRAuwcsR40Nf4DupUMDpbtYmtNg/R?=
 =?us-ascii?Q?t7cj4ZvH38WBbzcdqawdbp+tTrNbA6R/Lffrr2+77unPmZMTzDz6viiuuBgn?=
 =?us-ascii?Q?7sOJifGipiKP1hVKddYARn5/C+N/S/jFEyO8Xd/qyn2toA33t0/Kmi3OO6tV?=
 =?us-ascii?Q?Vr2IBmYIvUe6Dackyqx0FzjoQd9+VKeyWs4GtLy8R3geKv2BLf3Trk9dYrIP?=
 =?us-ascii?Q?1ZkOZfoO2VvaE3xMitlGTFmBh6BiHBwAtza8B1p9OC1ocxYoC91wudpjzbKK?=
 =?us-ascii?Q?1qiZfERAQ0BdWLwZR/Nj3YVpWrfCjzxKncyrWSGJf5X2oB/j19KvqxkhlUbD?=
 =?us-ascii?Q?qjO3RDCNP0Pe9/n8xkqj24G8jKSjfKLWkW1fafUQyR5Iw0dRsPsO3Iq7G3K5?=
 =?us-ascii?Q?1CWQjDkKc+awCSgqXlte+vCOByaEGzwyNsVE9jV3aESxPYdGOBJhq5/A5TSj?=
 =?us-ascii?Q?+yDStA6Z1YxEBCdJU390IJ/NsJcyWXx3Is+TypN6L5B+7UCSDIOua6odANLJ?=
 =?us-ascii?Q?QouX7rwQAjxXnRC2T4SnA7EuLn+GKuLpXV/9HPGFIlEAKn0Jh/IrkydKK+gO?=
 =?us-ascii?Q?00NT1ghUiCAmD5/Kh9ayUGtcLmV/tlO59ROlJr9S3QBjwmvWBpuDZr9BgGRj?=
 =?us-ascii?Q?stYhQi5D99ShA1ow5338VVODamhF7/Abw5rnjX+8Q268cZ4NvrRFbwKGGakx?=
 =?us-ascii?Q?xBTWyTz8PjUwEgQm5uD3CYWTr1W3jcNybXah/yO3xpKIjsBKsiXPIP71aUGB?=
 =?us-ascii?Q?+RCX+kB/eDikSBPUw5ZpR/1k9Ih6NNPeq8MfvuSl5+8h9UPjGco2MQ1EzZyx?=
 =?us-ascii?Q?cKigEpVM6Mt4ah+0iSEVkkX4gEZtmTKZ?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?SRPMh+GT0jApBR5402ONkajxciswyn6yYfPweaVQCCOEp0mhmqBlTvBJJD0K?=
 =?us-ascii?Q?XhQMM12iV4pb2qMIh5nn9zpXBZmQ2rqYKiD8n7KHPptYKYlsS1//FvGQyINc?=
 =?us-ascii?Q?26JYBOw5kIeNyoyiP76hqeTFtq/ac53sarKXPba1P5bMW0/0KyCvoAGn0L5I?=
 =?us-ascii?Q?P365Rzazz9Cyc/8yW/e9gv7U2EP0r8S+2KRYsD0lKc/RY+sIW0nuAreot9Nl?=
 =?us-ascii?Q?PloDx9nx6yP6pzaqqU6JLmqnrgIs2t7Ga/X52k8q55n1cNSyETax2BmNbyPA?=
 =?us-ascii?Q?hQnSMMUExgFy6WR1MKoP18nQImbdtbe8LLFmGdv5goDRyzcIAOoXVqyd1JAP?=
 =?us-ascii?Q?yBRvQkk06k5YGFAIsYsUbocg0eDHU3QwQ2+AEnBu3I7gJ5HzdgVmTvlx0vyC?=
 =?us-ascii?Q?Fjugh+IKp/o7kAaHWmNekOgdpS4YnQI59jiS533HOGDkkeMSsx86HJCkEKo6?=
 =?us-ascii?Q?nz3j6MHnlKwf+7BhtHBycFqziLF908qo+K+Nf2mIRxcMhNWshlnGIk8FDF9k?=
 =?us-ascii?Q?DixfsnozOusRvsrv3HS/VgHT+cQkuOpdgayWunbTFYH/GpX5u4lhFObyDtgb?=
 =?us-ascii?Q?cMCcauL6khgJ2X3Hxj8itkfZhVp/xgyhqtSuaS5Y7Rr+EPKf9am0WN3RqkmK?=
 =?us-ascii?Q?04CY16NDAKsnUbhvajVqzHroyn2e735iIvNyeeJ1zQYgEe1NoIfMeRtogNKo?=
 =?us-ascii?Q?A5Y5BgAlylClMfcYe+b5lkF060bG6TEzF0u5/l85xFhFlH0tyLrw0QSxkHPR?=
 =?us-ascii?Q?XpfnyAfOXr7SORkxvGNcjCRAqlUNbAed4PzKOcT+goVd+ONLbN6nK/HdEts/?=
 =?us-ascii?Q?fgQdXS7iEOM47X7X/YWlakk3/dyyVY13cezHhcTp3MuC6dHdU8hFowQwf4CV?=
 =?us-ascii?Q?VWUKxfFtqi3m4aJV2xRmVI8EEmksRF3+TdljKVHorOqKJ4eJItTslOaybv0C?=
 =?us-ascii?Q?8H2ffSzs5CSh6EzusFA82pNesQCTu65Pw9bIQwtxlKiujOteu4+j8edDDdjo?=
 =?us-ascii?Q?6P2xz/FdTL9JR0X94YjzOO/rcSoTDAoR/fI+Vj1hZRUyU1Ydx9jn3E0Y8pad?=
 =?us-ascii?Q?Yt+E3joKlmyanpv4Z8O3t1yGMC876Ez9cT4frKgLH4ukMFsyptA5EtCssCMS?=
 =?us-ascii?Q?Y/5fb1Da/zH3Q1qr3iBLDrgRW9pFwlAlX59WcZvOG5driFQKRcFtKlby27sl?=
 =?us-ascii?Q?446MD3ou2f3UK6JSa3o9K8xq8buFlhHlm2am+p4r8srWxLV3e2cwUr1hDfE8?=
 =?us-ascii?Q?+jk/5fyD0JYWTtpnzh2mvncDSig6TR6Nx6egY12KJRYNAjRCDlvihF2e7Gip?=
 =?us-ascii?Q?yfPO0Ji92LNhROIofxzod0xSPA3NCzX8zFuRqGqHp7tvCZbnqzPqKQSNv4tj?=
 =?us-ascii?Q?zNz2Dto7v7A/H4ec04mdlKvqVbsvJWgIOoh6u96Yzz4sjTaa7RWHyJPM5lNv?=
 =?us-ascii?Q?QP1pT07jBMB/Gwp0OrOh0wGXA9DfmfyhQCb7oRTely/mbUkDAD7L8yHBHBlC?=
 =?us-ascii?Q?oodXmlGYSFd4gsvsDDyDCKJhI9d3KEOzzqmkDq6bRgs855qACCTkypd/VrfV?=
 =?us-ascii?Q?1dSuHqZthDnuBAA/ld4=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: d0e94edd-e13b-4eb9-b0ab-08dd330aa7d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2025 13:11:41.4650
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +QKqnGVpdXqd9ooNhb7vhVxMoD9tMp+UKMRSLtdo+pb9Wa6L29izmLFfpEGkpAeN8GOyGqcHGvtVhqSiQEKTOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4049



> From: Srujana Challa <schalla@marvell.com>
> Sent: Monday, December 16, 2024 3:51 PM
>=20
> This commit introduces resource objects to enable the driver/device to
> create IPsec Security Associations (SAs) for both inbound and outbound
> directions.
>=20
> The IPsec SA objects include essential parameters required for packet
> outbound and inbound processing, such as SPI, tunnel headers, IPsec mode,
> IPsec options and cipher/authentication specific data.
>=20
> Signed-off-by: Srujana Challa <schalla@marvell.com>
> ---
>  device-types/crypto/description.tex | 134 ++++++++++++++++++++++++++++
>  1 file changed, 134 insertions(+)
>=20
> diff --git a/device-types/crypto/description.tex b/device-
> types/crypto/description.tex
> index df863da..23128da 100644
> --- a/device-types/crypto/description.tex
> +++ b/device-types/crypto/description.tex
> @@ -334,6 +334,20 @@ \subsection{Device and driver
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
> @@ -2022,3 +2036,123 @@ \subsubsection{IPSEC Service
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
> +in the format \field{struct virtio_crypto_resource_obj_ipsec_sa}.
> +
> +\begin{lstlisting}
> +struct virtio_crypto_ipsec_tunnel_param {
> +        /* Tunnel type: IPv4 or IPv6 */
> +        u8 type;
> +        u8 reserved[3];
> +        union {
> +                /* IPv4 tunnel header parameters */
> +                struct {
> +                        /* IPv4 source address */
> +                        struct in_addr src_ip;
Need to define in_addr and in6_addr.

> +                        /* IPv4 destination address */
> +                        struct in_addr dst_ip;
> +                        /* IPv4 Differentiated Services Code Point */
> +                        uint8_t dscp;
> +                        /* IPv4 Don't Fragment bit */
> +                        uint8_t df;
> +                        /* IPv4 Time To Live */
> +                        uint8_t ttl;
> +                } ipv4;
> +                /* IPv6 tunnel header parameters */
> +                struct {
> +                        /* IPv6 source address */
> +                        struct in6_addr src_addr;
> +                        /* IPv6 destination address */
> +                        struct in6_addr dst_addr;
> +                        /* IPv6 flow label */
> +                        uint32_t flabel;
Le32
> +                        /* IPv6 hop limit */
> +                        uint8_t hlimit;
> +                        /* IPv6 Differentiated Services Code Point */
> +                        uint8_t dscp;
> +                } ipv6;
> +        };
> +};
> +
Later after the struct, we should write down saying fields A, B, C maps to =
RFC fields A, B, C respectively.
> +struct virtio_crypto_resource_obj_ipsec_sa {
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
> +            u8 *data;
Shouldn't this be some descriptor pointer or?
Is this suppose to be inline data[] array of variable length?
If its later, length should be before data so that one can discover it.

> +            le16 length;
Length to be first so one can do the length of the data.
> +        } cipher_key;
> +        le64 auth_algo;
> +        struct {
> +            u8 *data;
> +            le16 length;
> +        } auth_key;
Same as above.

> +        le32 obj_id;
> +        u8 mode;
> +        u8 direction;
> +}
> +\end{lstlisting}
> +
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
> +
> +\field{mode} specifies the mode of the IPsec SA, see \ref{table:Device
> +Types / Crypto Device / Device Operation / IPsec Service Operation / Dev=
ice
> and driver capabilities / VIRTIO-CRYPTO-IPSEC-SA-CAP / IPsec Modes}.
> +
> +\field{direction} specifies IPsec SA direction, see \ref{table:Device
> +Types / Crypto Device / Device Operation / IPsec Service Operation /
> Resource objects / VIRTIO-CRYPTO-RESOURCE-OBJ-IPSEC-OUTBOUND-SA /
> IPsec Direction}.
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

