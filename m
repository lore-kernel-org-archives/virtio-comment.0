Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2066.outbound.protection.outlook.com [40.107.237.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD2D41553AB
	for <virtio-comment@lists.linux.dev>; Mon,  6 Jan 2025 05:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736141838; cv=fail; b=G0KIR2WeWo03ptW4SFDc8t4Fd4LKSu2VsipEsRPGe7vF5Qb1DvJpgMDwa4lbdkYPD/ihTV3FVv3A9mwaAOGDjn+hShzWjDWvDQO1WJ1yKL32A1e6MHHyEVLp3jifW5nqU4mO5HUXMEzye+VOiL+NddmgjmVOAkl9YfUCYzuypdU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736141838; c=relaxed/simple;
	bh=E9LfEb9ZcfTDgI9/PmSpNrqRH9WoWyHx88HvlhLV0r4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=G8GNQ9T/1e0XGvfQPgglFv94Pdyp3k1whHhZoab21C+PoPBW/3ZU9mOPFOL7WyKWuV2m5X+sbWn3FUn2iin2lpfOr+pq0dVjMh2vtxvsykHjUI4J69TxPfSZKTylV1PhS+dXsuWtNqkrknyPEqnwsq1cH4PQlTwxsFxhMcus4NM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Ngxqb0ls; arc=fail smtp.client-ip=40.107.237.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Ngxqb0ls"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gNIABD/RGwCLf+4XNlzsLu0nUbDO0kSsr1bAkA40rzouhKmOvHaIYbNRWBUWvK1nB1A3+F5LZvysadPN66mnGN9c2UlWoJ2L4thxJi9qsIRiv9yoA19QcYtPMI1b9SfZIkqfKnaJ3c4+fBcTZUTfbglILIEsyoYfES08sbkxKLQImo92mbjMP/BM5u1C7G0b10NMK1AqTNwDbBdva1y46agNJxhBPHQcgeIkT/h1mzTmoLebpprb+hwUG3e2Y0+i0ySO2mgtoHTiVYxVUhgo/rZDURxdUobrmZzEjyRIEuylJhBbLnO33gacegoy/hJXUYX0oACmA2t7HwRc9Gu/Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YpZ4Xig3R3q7R5CBWYxmOEXzEzEqrTJDW+L01kkzLPY=;
 b=AQFxhZB2BECuNEV06qXohFIuzUiMXZqQivpcZ5XjtEDTuLyYsapHbKH5gqctfMqQSdeF8e5JvWanftM9q+9NSBzB0oAXTlVPtF3M4JUyyznkusuZJ4dFDgJi29wcRpRneFg8h//5aoOaoGe1PJigvti9atWCUNeW5k0s0CBFg+IWgikQl6/s+sJTdWN/WehKnn7RsPy0qxJd5K/53znnxS0m+yA1+fA9hj34p1WGEZ4IfiC0kkpa7pWVjowQypAgYtrpXhz/i8A3lX3orauvN2t6DPs5/FOqj58oE/DXTEIESyZap4GxA6SzFFLfqhHw+8K8/CP/2aX2sUS2MuK5bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YpZ4Xig3R3q7R5CBWYxmOEXzEzEqrTJDW+L01kkzLPY=;
 b=Ngxqb0lscL224vgmIpDtouzp3o2jt8okyGXwcTFUPcCDHh/RIm1JQwyILp6pfDzKSFtk27mhjNk1036VfGX7VvS/z40KWLzG7w4H2edB0tqzOkwSp6U4bwPpc7YvxjK06j6mZFpF51ng6RbayrgYe/X4hInAWkaM1mJ2qdKpN/dgoZAtbujVxCs68ZuW9Q71LFawIEnP1vJ87rxg3cOVhAYDaxMWpC/fAlsGjOVOF1zJnGQ8kvD+fGCy+1RaPMe3Qe0sihjWJyzij1zPr1BHMCl8tjrsmzAvwlukmqXh8+yD8oc1P3jcqsdNKVj8ePJPA3LnHteMULT5wmYbVzwqgg==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by DS7PR12MB6262.namprd12.prod.outlook.com (2603:10b6:8:96::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8314.16; Mon, 6 Jan 2025 05:37:08 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd%7]) with mapi id 15.20.8314.015; Mon, 6 Jan 2025
 05:37:08 +0000
From: Parav Pandit <parav@nvidia.com>
To: Srujana Challa <schalla@marvell.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>
CC: "mst@redhat.com" <mst@redhat.com>, "pabeni@redhat.com"
	<pabeni@redhat.com>, "jasowang@redhat.com" <jasowang@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>, "ndabilpuram@marvell.com"
	<ndabilpuram@marvell.com>, "jerinj@marvell.com" <jerinj@marvell.com>
Subject: RE: [PATCH RFC 2/4] virtio-net: Add new flow filter selector and
 action for IPsec
Thread-Topic: [PATCH RFC 2/4] virtio-net: Add new flow filter selector and
 action for IPsec
Thread-Index: AQHbT6goOy4vFbioikubbHyw597S8LMJUwOA
Date: Mon, 6 Jan 2025 05:37:08 +0000
Message-ID:
 <CY8PR12MB7195A14378469D12BE4609AEDC102@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20241216104859.2720719-1-schalla@marvell.com>
 <20241216104859.2720719-3-schalla@marvell.com>
In-Reply-To: <20241216104859.2720719-3-schalla@marvell.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|DS7PR12MB6262:EE_
x-ms-office365-filtering-correlation-id: 863011b6-3681-4aec-f64a-08dd2e14299c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|10070799003|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?6dqmAPhyLMYe+I+N+D03WjsK8hv0Z9aov1amnSmnWoH1Ya3lXfsNKFN6rCV6?=
 =?us-ascii?Q?ClwhEwS6mA9O0iiWjfpsd1q/SIK2HCJiLLUIjeOE8dlOX/z0u1haoSmKf8wR?=
 =?us-ascii?Q?yEoHHv2lZkzWMqEFy5V6+e5UdE5X6tFyGlyuUBp9/uEepMugVEijF67CXjp1?=
 =?us-ascii?Q?cDSApgCsJjHINWfzlXNRi5SFVgIThiTrgqS2A+43xRyJapka+NHx7aWpP7HC?=
 =?us-ascii?Q?O3u0rATdLef8+q2jvwW05B2FHtg2SYkNhWj0ukEh/wLwCKlhMYvcyEFoIZq8?=
 =?us-ascii?Q?hkhrD4lspb5TjHVoTdN5Yz47AS/ulBcKRQa/f4abEAUhOdwAFuiNVssyGWay?=
 =?us-ascii?Q?wXnBv3yG3xRNtVrhEwD9zzQcWhlWlqFFiyYge+5tZAWR+gHT5VvtNLGN2LUJ?=
 =?us-ascii?Q?s/AkojMAtMhCQitLg2THr70pmyEtXFr0OFS75ubBcDCVeaLy0I9Q0mBzZaCT?=
 =?us-ascii?Q?iZt1il50Rc1SPoVj/CrorXbxFSjQAoJ2v2gDjJErfT9RCD/AD8LSxR3MWu6C?=
 =?us-ascii?Q?AV7ReCd36f1qRr6ESkNxjkGbTwfbYXBhvthyr65wgyG/TXTnmxntMVmMrV6R?=
 =?us-ascii?Q?w/bJ+ycwyJnY5INy7ih0bm0vRZCtnTz4o8G/wV2WqdvaplOPfM+O5SZ1Ll6g?=
 =?us-ascii?Q?ZoTD1PFw68hgyeV4RrpbFlZ5B2cHBJfOLYpQ+eqOWP3/7Oh/tni9bVVftt17?=
 =?us-ascii?Q?h0lSouOHWY4XjcetqzP9ul6PtnxDGo38lLXepOz3bqVa8H/zcKUSGM8yxOBU?=
 =?us-ascii?Q?wBmDSq088nzaie7Os4pBjUdogp+vAq2t49kTfotg++AmI3vgeSgy+U4fVo88?=
 =?us-ascii?Q?qRjO46wu38FVyAaxZa7LxgrWYFZmGPMuUlXOfNY2w7NXpg8pfQy+6LJH2PKD?=
 =?us-ascii?Q?EacrApsoZAVnvXpozkqBDrHCCNgGbjjA2pIAspWEHTrUDWqsMl+P7W/g/OMD?=
 =?us-ascii?Q?/mUnOOqJfg5ou+NUG/ZV29MaE7gCRn8O3TZ/9mp6Tq4H4Ip2W7I6E2vVYYh9?=
 =?us-ascii?Q?n/goMI/ylJ7YKSSelpYH2OrksRSKTv2ELnGXf9onYr174geUklFhZBfYO/rk?=
 =?us-ascii?Q?80QHUJi7dFIy3FKC3njhjofvgtYYakaBUGteKlCAESMVt9jLLy4LPOZS9+27?=
 =?us-ascii?Q?4ba/FO8M58xgo2MkrYu5nVuQgRSd7cdsZQUFvVQiMUCGYXH2U8aV5A25/VkH?=
 =?us-ascii?Q?llav4L8p2rsOkYNVvWZVwDjBQ7AXAXSirSpbMIF5fDa5LlXyyWt+dJggTuNf?=
 =?us-ascii?Q?U+reXf7Nf2b2EhsbM94LJ9wwVt8/mYwqJ+41s87IbqU/yVzR9qznkd3a+FBQ?=
 =?us-ascii?Q?EHlx7NrxAir9IHg4b051J9rtnQgM0C4FR66I1VNtWIDzi2nsVzqrIlGaikCt?=
 =?us-ascii?Q?paBBGlLGYws1OwJrtV8oXUPZmzvP?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(10070799003)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?G2WgVwj+iq52czjiDwOqw3DFgHeTWQ3XZBh1YuHXA3awzoA4LEeqYYGeTNpB?=
 =?us-ascii?Q?u8gSAOHsWbFalRbC/OradGFB2Sy2GS7r/FVsXYs3bfO2N/2B7f+B1u7MrtW3?=
 =?us-ascii?Q?+8TsxUBLoZR7HT3UoPOXfG1iCMBr7qDVsgdpJak+X5gtY7eM7Nz9X3FxQCHe?=
 =?us-ascii?Q?K5iAfnoFeMNvCAFLDyPA+vs2xMsF+ahp4H5p++Gng7fT1/cVr5YSi5fMJcCS?=
 =?us-ascii?Q?TeHSh8OWdoZKLpgzg8zo6hs/XXTWFUv5kIuhWE4mcPH10yCKp3bMiXTtKJOo?=
 =?us-ascii?Q?swWTkkqKivNwHBe5KRk5d6vGk8QnYn12lKdwz0CbEYzmgcE1IUSLeoQwBv6H?=
 =?us-ascii?Q?IGx7ShA3PRPgbFrd9g5r+vB0VnLdMqAgiDTO5ykpDNI+6OyDrKcMubRHwanc?=
 =?us-ascii?Q?e3tg+Omja9qt4RIcd96N08odX0tKgUtZEnhs2DNVfBXUAwqKi1HPYxhGG5hH?=
 =?us-ascii?Q?fG1mL5nw149rrK5M0Y/efTqjbgD4W8hrOUO4wVlde9v0oucN/NDMMs4OocIZ?=
 =?us-ascii?Q?RG/fC1WTSfBxnYTSs/ZX8jmXb43b/C9GcrG04nFXzsaGCBySTlieN6GYh4SX?=
 =?us-ascii?Q?R6j6OO/wnOXIpI3YwpKrpe6JvLL1blNwA1u632nYZAcf3XFPkvyHxfX9oOt4?=
 =?us-ascii?Q?qTOKRQ6pxFBT2aBcBDw6bDVkDFIWEAZbStnGtqxjom08EibNTkWdi16sHBOw?=
 =?us-ascii?Q?okdRhPisZMk1TXVVCn8gtXCoG37k8XEXdNxCRHz7q1yURZWki9CgJ4S390Vi?=
 =?us-ascii?Q?R8nyuzjkL19PTrNNc71pT3pnytNfLAEfeVyfPackurMI+xy1ETQhg1Qpuabx?=
 =?us-ascii?Q?3jdOwM3zrEdIMf5f2eG5p7+9gdnzFJsLmO/ip8uCPRHu8hBSAqi8ACbRAENQ?=
 =?us-ascii?Q?ZUiQS8ShHaAYyBAjUsPJ+YMlr26Q9LV3I26bbSY/vATI0bYU0u062TPGASOl?=
 =?us-ascii?Q?zKZZI9IhHZmpRk1o68ZEsVS90xADh2z6RVcj/J5cwJDf18SLZMOEtxR46t/D?=
 =?us-ascii?Q?j1VkB7YUKM7pqYu0xz5GZkzxi2eAkJnzGmBGYJN+nEUN0ADAmAJ4C2J6IUWG?=
 =?us-ascii?Q?nNtLgcZTPyjRNhwuVoSDNVLzCO2+HwZNLj01QlKJdrU0xVyly52uqStyvV68?=
 =?us-ascii?Q?c6FxIO7wXZRttVsL8TvVvk92SqolpxNVBva0NmAX4geIJyIADiUhcRAkugkk?=
 =?us-ascii?Q?KXWvez7bHj8TG8qsi8JuZ670te9SsD08T25Tl1oBJb6w6kZ4MwworQw83qSC?=
 =?us-ascii?Q?NQfCbBbDs7/N9+PAepf6VMueoDwFPCKZ6tI2Ds4QwFYTgvbsJZoWDhJ4SH7x?=
 =?us-ascii?Q?BPmN0Z+On4Fxdu6lKHEFYhoUrJmktJjFIuD66Mh033lrrat27KQ0nf6OVirs?=
 =?us-ascii?Q?yrb/U72uziW2rmQaem1vIkB9GBhSD17I5th5e5xKjqKT3h/VvPYthqmMsEoh?=
 =?us-ascii?Q?KL0cQGk01ZWje2Jb6fifHi4Y0zKiTS3KcVE7ZSLI8vxUSkTTpp1RsEL8sdo4?=
 =?us-ascii?Q?hOYVkJej2n57pZNZtUz4r0fCOhTp8aWilsTlp/uYD3p153tYxoj8CnZ7x+ui?=
 =?us-ascii?Q?K4sKR9oKBCdjomPqQ+8y99psiHozh1ZsfMdiN3fxPmZz/a42OfMZPl0ggzKt?=
 =?us-ascii?Q?X8tBSH6fYLYVf4VutncOFD8=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 863011b6-3681-4aec-f64a-08dd2e14299c
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2025 05:37:08.8515
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rPVzLZ+LbAytC9eoI0RXmPxxIzkJ/byMB+2uQ6xc8AXh5scXZBvJhuUBvZ8nYybWuJT8vM8QSZ81vsyOvSFd0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6262



> From: Srujana Challa <schalla@marvell.com>
> Sent: Monday, December 16, 2024 4:19 PM
>=20
> This update introduces a new flow filter selector to match the ESP header
> and adds a new flow filter action for IPsec processing.
>=20
> Signed-off-by: Srujana Challa <schalla@marvell.com>
> ---
>  device-types/net/description.tex | 23 ++++++++++++++++++++---
>  introduction.tex                 |  3 +++
>  2 files changed, 23 insertions(+), 3 deletions(-)
>=20
> diff --git a/device-types/net/description.tex b/device-
> types/net/description.tex
> index 2a5f635..ace2538 100644
> --- a/device-types/net/description.tex
> +++ b/device-types/net/description.tex
> @@ -2632,7 +2632,9 @@ \subsubsection{Flow filter}\label{sec:Device Types
> / Network Device / Device Ope  \hline
>  0x5 & VIRTIO_NET_FF_MASK_TYPE_UDP & 8 bytes of UDP header described
> in \hyperref[intro:UDP]{UDP} \\  \hline
> -0x6 - 0xFF & & Reserved for future \\
> +0x6 & VIRTIO_NET_FF_MASK_TYPE_ESP & 8 bytes of ESP header described
> in
> +\hyperref[intro:ESP]{ESP} \\ \hline
ESP is introduced in the previous patches, the 1st patch of this as well as=
 previous crypto extension series.
Please move the ESP reference to the first patch where ESP is referred.

> +0x7 - 0xFF & & Reserved for future \\
>  \hline
>  \end{tabularx}
>  \end{table}
> @@ -2692,7 +2694,11 @@ \subsubsection{Flow filter}\label{sec:Device
> Types / Network Device / Device Ope  \hline
>  0x2 & VIRTIO_NET_FF_ACTION_DIRECT_RX_VQ & Matching packet will be
> directed to a receive queue \\  \hline
> -0x3 - 0xFF & & Reserved for future \\
> +0x3 & VIRTIO_NET_FF_ACTION_SECURITY & Matching packet will undergo
> +IPsec processing \\ \hline
Can we name as ACTION_IPSEC here and ACTION_IPSEC_RECIRCULATE

> +0x4 & VIRTIO_NET_FF_ACTION_SECURITY_RECIRCULATE & Matching packet
> will
> +first undergo IPsec processing, followed by the flow filter rules again
> +\\ \hline
I didn't give enough thought yet, but can we refer to next flow filter grou=
p to refer to?
One advantage of recirculating it, one does not need to link the two featur=
es, however as same times its slightly more complex for the device.

Will also think more about it later.

> +0x5 - 0xFF & & Reserved for future \\
>  \hline
>  \end{tabularx}
>  \end{table}
> @@ -2746,7 +2752,8 @@ \subsubsection{Flow filter}\label{sec:Device Types
> / Network Device / Device Ope  The first selector is always
> VIRTIO_NET_FF_MASK_TYPE_ETH. When there are multiple  selectors, a
> second selector can be either VIRTIO_NET_FF_MASK_TYPE_IPV4  or
> VIRTIO_NET_FF_MASK_TYPE_IPV6. If the third selector exists, the third -
> selector can be either VIRTIO_NET_FF_MASK_TYPE_UDP or
> VIRTIO_NET_FF_MASK_TYPE_TCP.
> +selector can be one of VIRTIO_NET_FF_MASK_TYPE_UDP,
> +VIRTIO_NET_FF_MASK_TYPE_TCP and VIRTIO_NET_FF_MASK_TYPE_ESP.
>  For example, to match a Ethernet IPv6 UDP packet,  \field{selectors[0].t=
ype}
> is set to VIRTIO_NET_FF_MASK_TYPE_ETH, \field{selectors[1].type}  is set =
to
> VIRTIO_NET_FF_MASK_TYPE_IPV6 and \field{selectors[2].type} is @@ -
> 3044,6 +3051,16 @@ \subsubsection{IPsec Operation}\label{sec:Device
> Types / Network Device / Device  attach ICV, update/add IP headers and ad=
d
> ESP/AH headers/trailers to the packet  and transmit.
>=20
> +\paragraph{Packet processing order}
> +\label{par:Device Types / Network Device / Device Operation / IPsec
> +Operation / Packet processing order}
> +
> +When the flow filter is enabled, the flow filter rules are applied
> +before IPsec processing and the packet will undergo IPsec processing
> +only when it matches with one of the flow filter rules and the rule
> +specifies the action VIRTIO_NET_FF_ACTION_SECURITY.
> +See \ref{sec:Device Types / Network Device / Device Operation / Flow
> +filter} for details about flow filter.
> +
We need to rewrite it better.
IPsec rules are also added using flow filter.
So writing  it as " flow filter rules are applied before IPsec processing",=
 is confusing.
I believe this is not implicit in the words.
Depending on the group and rule priority, the packet processing order shoul=
d be decided, right?
For example,
Rule_1 says decrypt as priority_A.
Rule_2 says forward packet to RQ_B as priority_A+1, than rule_2 is processe=
d first.

When both the actions are needed, either we extend it as multi_action new r=
ule object or do re-circulate.
Need some more thoughts.

>  \paragraph{Device and driver capabilities}  \label{par:Device Types / Ne=
twork
> Device / Device Operation / IPsec Operation / Device and driver capabilit=
ies}
>=20
> diff --git a/introduction.tex b/introduction.tex index e60298a..a7db418
> 100644
> --- a/introduction.tex
> +++ b/introduction.tex
> @@ -162,6 +162,9 @@ \section{Normative References}\label{sec:Normative
> References}
>  	\phantomsection\label{intro:TCP-Header-Format}\textbf{[TCP Header
> Format]} &
>      TCP Header Format
>=20
> 	\newline\url{https://nam11.safelinks.protection.outlook.com/?url=3Dh
> ttps%3A%2F%2Fwww.rfc-editor.org%2Frfc%2Frfc9293%23name-header-
> format&data=3D05%7C02%7Cparav%40nvidia.com%7C14a0069994c14f63d12b
> 08dd1dbf4825%7C43083d15727340c1b7db39efd9ccc17a%7C0%7C0%7C6386
> 99429584698491%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRyd
> WUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3
> D%3D%7C0%7C%7C%7C&sdata=3Dh49XO2KUHOP2SyNY470U1p%2B8tE3JLPRyB
> lRRFTN1x8E%3D&reserved=3D0}\\
> +	\phantomsection\label{intro:ESP}\textbf{[ESP]} &
> +    IPsec Protocol
> +
> +\newline\url{https://nam11.safelinks.protection.outlook.com/?url=3Dhttps=
%
> +3A%2F%2Fwww.rfc-
> editor.org%2Frfc%2Frfc4303&data=3D05%7C02%7Cparav%40nvidi
> +a.com%7C14a0069994c14f63d12b08dd1dbf4825%7C43083d15727340c1b7
> db39efd9cc
> +c17a%7C0%7C0%7C638699429584725967%7CUnknown%7CTWFpbGZsb3d
> 8eyJFbXB0eU1hc
> +GkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIld
> UIjoy
> +fQ%3D%3D%7C0%7C%7C%7C&sdata=3DR418F4%2F6uWIbeCupZrhhQXGhsHn
> YLlfw7rDf%2BAd
> +wptU%3D&reserved=3D0}\\
>  	\phantomsection\label{intro:CAN}\textbf{[CAN]} &
>      ISO 11898-1:2015 Road vehicles -- Controller area network (CAN) -- P=
art 1:
> Data link layer and physical signalling\\
>  	\phantomsection\label{intro:rfc8174}\textbf{[RFC8174]} &
> --
> 2.25.1

