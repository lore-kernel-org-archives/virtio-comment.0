Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2066.outbound.protection.outlook.com [40.107.237.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF54615B547
	for <virtio-comment@lists.linux.dev>; Mon,  6 Jan 2025 05:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736141840; cv=fail; b=uNE8vuykpNftGgoj1OtlMkWB7q7g1BiXfEtPfZ0dYnSpousHVmnw1V2U89GUP0wKDCNOzS0iX+XQWRFg2aZdXcNeGktxZ6ANL+43lr8+uLu5hj9+60Q/jtSjkzIdw43bOUh7bxeMUT+ttVj7SNMs2EIYMA7KDs10uU/gTCE9iSE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736141840; c=relaxed/simple;
	bh=eUpSXsZ1dBGlR8L1otwcry+8D3CDHwXU2q1Ewy6PHZg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=N08bKgOOiVE/4Db3SSFMbcjaQeqRQ2nJQJ9J1x3RU8xMSCtaVv5banPzDjlpu1xM05N57NGpyEZYb9elcFeFUVj/Nn0tcdcBle7lIoSqsAtKbaRaet7NYyzk1qeo+kvrd0Y9WMuuvTbs8iiPmz8o3ct68SxFVUy7+EiUKpKhB04=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Q056bMav; arc=fail smtp.client-ip=40.107.237.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Q056bMav"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k7McNX7okQfX+bHDku5kGku3c0AmOW2xgonoONex0n/Hy49OsZw++xl9u/yJDv9uRQIFuF4FE4ffCW0v9xO6VWAvKGmAPg28MqtXlMYunVHpqkV412NKWZIdyNQ4nJvlcNBA1qfe2lxh735cS7rp5uhjhdBDyNmK+0cmSKpJqwMp6aGpY8YkrL81IZIxUG+aJn0LxEcgQKtkSKRkVWY/4WaQIBIl/lVvXok03f6W7kCzNFq66+7DkWbweqqdICXEeGH2iF1t0+a4zqld9L2e+RHVwnSao4spMPwd9uN+fuzXkxJaWqOdoPuB0qAet/NZ66FyJWGKCzbNWES4eSaJuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d0All1h4IWGX3rF7J7/pDVtEGT2flM2wN2trd/3E6WY=;
 b=TsunKWorhj0V6N/BJqRcQK6o5kmTHpXAPTGt0IIsIpDC/h6l3KxH3e4J3NwFkO71F+tyyUWaG7VlHYSVR1/H3oZpJO4DsmS4R0HDHGojjebTXSer6ik5HXRqifg6hbOnMo8GnN2RMd3vPiP7kDyBSlZ5kWCKKrrT/6lec4e+5J7tWtU6zotqZYOAYMtocsu04t8EMrVnkLj6Jg9MaWT41+poBDjjJMr7p21ZFptacDuKIIctHqkjCDSNbeTQPv8F6xS6XzjyTwbv2w4cEU1OA1z0MsY91u7URxI48D5gjr+xMUg2AxslBG8hVmpnq5Z7FqWiuPlYV3SdN9uyttlkdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d0All1h4IWGX3rF7J7/pDVtEGT2flM2wN2trd/3E6WY=;
 b=Q056bMavBKMVTLsZAXW8eKzNVXSM7M0Kx2VjVmo4TfLV+WNiBsvPogA6r1hv9f6Ulhx6OXF0437XqjLvKcnbSb62VL9MwdsJDpc9lNtgA/x3So1Z4hKmINU+HcGGAgFZGW5gczm97No4Djm2wGk0sa4MOqZ53pJ6ahzwoM7VnxgU02lJ+D7m+kyf5ff082scTng7HKIo82qhWZg0zDcE+bS56hSNjNo9Rjp0Qd/fAT5p5OOxcynoaFQkNey65OjEBDPoiiEzLixye4jOo9Jffa/ev6jiNEcACmn5E7OpbUfr37gsp9Y//XtEZxT5nRlTP1NZRxPkjMxr5WuhgHlHgg==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by DS7PR12MB6262.namprd12.prod.outlook.com (2603:10b6:8:96::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8314.16; Mon, 6 Jan 2025 05:37:12 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd%7]) with mapi id 15.20.8314.015; Mon, 6 Jan 2025
 05:37:12 +0000
From: Parav Pandit <parav@nvidia.com>
To: Srujana Challa <schalla@marvell.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>
CC: "mst@redhat.com" <mst@redhat.com>, "pabeni@redhat.com"
	<pabeni@redhat.com>, "jasowang@redhat.com" <jasowang@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>, "ndabilpuram@marvell.com"
	<ndabilpuram@marvell.com>, "jerinj@marvell.com" <jerinj@marvell.com>
Subject: RE: [PATCH RFC 1/4] virtio-net: Add IPsec operation, capabilities and
 resource objects
Thread-Topic: [PATCH RFC 1/4] virtio-net: Add IPsec operation, capabilities
 and resource objects
Thread-Index: AQHbT6gnNkWIrdVAYEy/9YWEvZdDGrMJVvoQ
Date: Mon, 6 Jan 2025 05:37:12 +0000
Message-ID:
 <CY8PR12MB71953089584322B781030A27DC102@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20241216104859.2720719-1-schalla@marvell.com>
 <20241216104859.2720719-2-schalla@marvell.com>
In-Reply-To: <20241216104859.2720719-2-schalla@marvell.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|DS7PR12MB6262:EE_
x-ms-office365-filtering-correlation-id: 539b2048-0e88-4c68-43f8-08dd2e142bec
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|10070799003|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?h5mbY72FJedT6HqQFH1WV6PtfeFNjYsPXyAijQwGCamey9A/l2jeTHFWppNp?=
 =?us-ascii?Q?LAgJcgXWYczb/hHBZavEjS4JTTSocLabrjUZgFSdrT5jybysAxw6Fkk11P6o?=
 =?us-ascii?Q?vImfjukgaELSxcIl5/BNoQ0RF2/hwlh870ZNec8p2cx2bn6GgTCV7eZM3N03?=
 =?us-ascii?Q?VmVgbXTV2C4oejxmDwRVuhd5ziIXPY2gN2GhmfYCSfV1iNP52zOC/2qLQfK1?=
 =?us-ascii?Q?11PNRaw/HPWQnbg+8sfBUBUsWbkYBo0zx5+YOHiNLwjc3lRAEWO7tbItLmCj?=
 =?us-ascii?Q?0viLTGRbgIeWyowWQSk6vtcgG/oGi0T+aUGCPoyADY9tgOG0kc8RTUHJfGbV?=
 =?us-ascii?Q?B1hgC1keoI90w7T10qaBHM7rONEkrEQq4SBiYGkm+POUk3beivhhRSlE8Wc+?=
 =?us-ascii?Q?GTRSgGEgevqeipgY/kgSb2oCuPBTJZaDwZi6dwKpIjyoIXpksUW9OImOJQcd?=
 =?us-ascii?Q?i3emklVgm1zi4ObXb5NGMspd/3eOA/uqqjEVrqtKNBiOQTLFGh7IoHGl0c4T?=
 =?us-ascii?Q?8yxuzoFIx7xivoFBJZx1Lh3qMhhzQtZymyVf0+9qwhxoWBLAYeWxq9g0nwEX?=
 =?us-ascii?Q?kP56ICfj60eCRxf0gei2TQ8aTGRBJupUKXE8UmsYH5H/K65a3Giw3KjQxL2V?=
 =?us-ascii?Q?Qbj8XtTvnqIQ9Udcw4OKOWrxCy+2bpiA1ukvgqzriUgF9KoFE+09TmPRM4aP?=
 =?us-ascii?Q?eHc55rDVeVGCoP+AgB2KbMnrEMWbk5VHfoGVukNmwy+OThgO2sVb8bNaJHWP?=
 =?us-ascii?Q?mkG+SWEeYWVxVLnM3HqTjRSuo2SbhQe23Xw2cJaBZ5YUQJs4brjjydNz4Zns?=
 =?us-ascii?Q?TvOaV+3VPtDnlly1yEXcPQV4wvI5ruFp/SRMslLKavsgKbOVcbkcYL9GTQFc?=
 =?us-ascii?Q?6noeu8uMR0Pzv7i+3CcBtYuqK54TmDnXM3pPT1u/nz0/NEMrDrfnvjzp+frt?=
 =?us-ascii?Q?GMfOws5IYqNkcnKAyOEMBdt2Bx1oPT96HFGM4OYObmt3pdyf82WEe57WO2Ss?=
 =?us-ascii?Q?gAO3+J4IvSwbqAIGD92o526dkUr1s1wUgZM4ArA4XNrABsPnmFRmqW/BUVpy?=
 =?us-ascii?Q?WdsDHvECmPxWTi9+wra1rt+IC2+C6iZwPJAnK3MoUou5HHUVA0Abf23xj0ya?=
 =?us-ascii?Q?gx3soUgHhyewExYgyrQj6CQlUnU7XVb2ZZ0C4NPO/LDUpdqWG5mhmBLVwcxQ?=
 =?us-ascii?Q?Cwxg6Vf/dw2iw3Vpr/t17s4NMHZPgMUWjGAf76gqVR8+eoLGh3evBbRCeViT?=
 =?us-ascii?Q?aFnu1NVWWs8tqK0MhDm3DYdf88b9VzkK8dAiLL1/e/mLe85iK/KHMnLcPNiP?=
 =?us-ascii?Q?+YGot154GSd8eSJplhVOTo5wY8sG6SiWakK49YyMptWEedSWqHmRyV0nlqCG?=
 =?us-ascii?Q?hkpkEv26Jc8Xsuff9cCwGeZ0t7zXp4L6L0dUPBY33vhPJ4cOFMMl1JLTEQtX?=
 =?us-ascii?Q?ZqrvDAvawmwLcYCQ0QEK5G1R5v8IyjgZ?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(10070799003)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?vIZek/sm3gSb23x+/M4m1XuPyWwjJ1lzvVpAefArp1Ivs0WmmeBBwRATCzfW?=
 =?us-ascii?Q?PwpJXC1tHinOE25dYYFTDq/x0+L/wSX/AfGRalqf6eB4hC7rzdGvGnbhiuaq?=
 =?us-ascii?Q?zS2ITyQJHV+GQS9Se3LYYSBTQJAHP5nYWCIglxZ/+1pGGEGMOk+3UkvIl3tK?=
 =?us-ascii?Q?tMu9yy0cD62TlKRb0Iy1CNUU51yXNF5+JzQrzKlJlL+TftbXSYAf5aGr+BJ2?=
 =?us-ascii?Q?97FM0IVCNtp4vj1ozPW9AAZPUpeaABVrT5hskU7jMwHdw+3RNmLosWyU1VC+?=
 =?us-ascii?Q?zOAMBFp/2yeMdjQ1am4UFSm91nnImXO2UGi6oonS79287XP+GK1w1MtmRLka?=
 =?us-ascii?Q?toz9bgI7h3XOLrhe5DhQ4h344/7T/DZdqcrWIaz5lU2xRTNUQ2NQrZRTn952?=
 =?us-ascii?Q?EhvKo6Y2ghvkZXm9F4XVnGTfgQUTYoMCvuk0BspBEfaBLEZV1vdxKylwxeEV?=
 =?us-ascii?Q?NiSpEzZhexdaTL3JfAxebQKzSb3wEhYAZ7UGInkUFGgyWDFl159isVIxXSC5?=
 =?us-ascii?Q?uPpKJiOEjYFURyivriHnFNRSDOHRG29FUiFFN8LdHvkSl1n4pHgLkAupYITa?=
 =?us-ascii?Q?7h+IEhCGBx38ghQZM8WO/jnUrZ8I8tCO9kCEfZyuIiZAneIXnzFxbiqiN4C5?=
 =?us-ascii?Q?o6qkPYxyDd7Jk4QCAwXgxZNjB39Lm9RR4d/48yMF0MLic0q5w63fZ/Jv3tzR?=
 =?us-ascii?Q?JQLnRq397bkRDYojEK9zCqa6WU0EH41GDmlLLCcN7XU3EsCm5sL0os/omtTb?=
 =?us-ascii?Q?3H6EcPHIj5cKIC09o7qRhcP+rLC3eoDgPCgnv29/LmCRh7pREz5Q5nzrzalb?=
 =?us-ascii?Q?jj7WHjQ8L3uQaFN/3WfZy7SuNYWGukNHul+l8RDJbcHaneLqtEfrxXjoSGVP?=
 =?us-ascii?Q?ZoIysLH9RVkAYIJ7DvsDufBCgl3B41M64N79S1PjvyAK/ZJAtoLb8Zej+C1C?=
 =?us-ascii?Q?Ro5a0/Dw3niB3vQ2QcgOTIhCmmdBuGPM+NHpqJMnUdh7w1++pi1MbBbIS2Ls?=
 =?us-ascii?Q?GNkGGv95d/QCLkm2a2JOPEEIQ9KVl++KW2y1I8l/UTBSzMU6Zm6n86SV7NqN?=
 =?us-ascii?Q?a7aoGGi56ZnL9EVv+5yrWEQ9dPv+QGAmjOLOmVJTdQojuu5RvQzBqbqgsF7R?=
 =?us-ascii?Q?x6/K0NHqxNvU/03+V6NuHNruyBQ5BVWJklY1aDu0m03FJa4PZvc/LGLQrygw?=
 =?us-ascii?Q?aaES4Kci1qG8EbYOvrIub9+GRtT3zIUovLpMIvx+kJXWxBNn+bTgJxqSVJdo?=
 =?us-ascii?Q?fn0GcXF3yDXSozFahp7zaowY+0sis4ppf0MbNs2quw7tV4yffonoJcJu9y2/?=
 =?us-ascii?Q?lpYKfA9nLIrT1tWIK9sTWNBYapJuStE/GcD3myLMr65BQErhK7HgDme3EU59?=
 =?us-ascii?Q?L/xqgo7QA9pgo4JtGAcszAESsBTz1hTHOwS+Lnly9GMMBCrQ/eOatvAZwH0N?=
 =?us-ascii?Q?NCIYtS7mY6PB50SV0yxVINHYEA2/aY7OAlJan3z1z5TxJTA4C+cFCiVAq//8?=
 =?us-ascii?Q?lW1JKkXfeffpXdP77l6UoVvhyTdgfLyU1MPNP2uD87SDtf8/ksup24m1Y4FO?=
 =?us-ascii?Q?G3tCzwLP53sYlK6PYVPrUrbjIowzMYNqZl971vk6Pcd6u6BDY4fuDYfXXn5q?=
 =?us-ascii?Q?PwJe8wQeA2qK2TuWgT73+GA=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 539b2048-0e88-4c68-43f8-08dd2e142bec
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2025 05:37:12.7536
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1RNRVlPzsYA71HT0RJ7tiJwck/ef8wdLGcRmeoeYAVsztQ0cfhVFn9YThsEldIbg5MgWMl1qNCJ2QZnak3pPaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6262



> From: Srujana Challa <schalla@marvell.com>
> Sent: Monday, December 16, 2024 4:19 PM
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
> encryption and decryption. These include the SPI, tunnel headers, IPsec
> mode, IPsec options, and data specific to cipher and authentication.
>
How about,
s/data specific to/metadata specific to/ ?
=20
> This patch refers the Virtio-crypto IPsec service operation capabilities =
and
> resource objects data structures and crypto algorithm definitions to avoi=
d
> duplication, however the admin command type vaule differs between Virtio-
> crypto and Virtio-net.
>
I read the crypto rfc series, but don't yet fully understand, on how the lo=
okaside crypto device does encrypt/decrypt it.
Probably we should relook if ipsec object should be in vnet only or dual.
Will read again the crypto part to learn more.
=20
> Signed-off-by: Srujana Challa <schalla@marvell.com>
> ---
>  device-types/net/description.tex | 47
> ++++++++++++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
>=20
> diff --git a/device-types/net/description.tex b/device-
> types/net/description.tex
> index b2a0d39..2a5f635 100644
> --- a/device-types/net/description.tex
> +++ b/device-types/net/description.tex
> @@ -415,6 +415,10 @@ \subsection{Device and driver
> capabilities}\label{sec:Device Types / Network Dev  \hline
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
> Device / Device resource objects} @@ -431,6 +435,10 @@
> \subsection{Device resource objects}\label{sec:Device Types / Network
> Device / D  \hline
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
> Device Operation} @@ -3020,6 +3028,45 @@ \subsubsection{Flow
> filter}\label{sec:Device Types / Network Device / Device Ope  capability =
and
> the classifier object, unless the VIRTIO_NET_FF_MASK_F_PARTIAL_MASK  is
> enabled.
>=20
> +\subsubsection{IPsec Operation}\label{sec:Device Types / Network Device
> +/ Device Operation / IPsec Operation}
> +
> +A network device can support the programming of IPsec Security
> Associations (SAs).
> +In addition to standard packet processing, the IPsec protocol
> +processing is also offloaded to the network device. This offloading
> +occurs both pre-transmit and post-receive, providing inline offload
> capabilities.
> +
> +IPsec Inbound processing: In receive path the device will perform
> +decryption, authentication, integrity checking and remove additional
> +headers, including tunnel headers if in tunnel mode, as well as the ESP/=
AH
> header from the packet.
> +The resulting packet contains only the plain data.
> +
> +IPsec Outbound processing: In transmit path the device will perform
> +encryption, attach ICV, update/add IP headers and add ESP/AH
> +headers/trailers to the packet and transmit.
> +
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
> +The driver controls the IPsec SA resource objects using administration
> +commands described in \ref{sec:Basic Facilities of a Virtio Device / Dev=
ice
> groups / Group administration commands / Device resource objects}.
> +
> +The IPsec SA resource objects encompass crucial parameters necessary
> +for packet encryption and decryption. These include the SPI, tunnel
> +headers, IPsec mode, IPsec options, and data specific to cipher and
> authentication.
> +
IPSec resource object (singular) is enough to explain what it is.
Please check other places as well to explain it in singular terms.

Remove the word 'crucial'.
SA resource Object contains necessary parameters ... is enough.

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

