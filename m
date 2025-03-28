Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2079.outbound.protection.outlook.com [40.107.96.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33551DE8AB
	for <virtio-comment@lists.linux.dev>; Fri, 28 Mar 2025 18:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743185594; cv=fail; b=LlXXvasRioDuLl3LHWqrAgOm0pnrcq7FW6XxXXHx/08/4amaI66akeqYRcIk17VlXooPzsX7wNApRtjcqnC8ldSuMI4YsjJKrlzsqS7ySy7YglFleyyeG4wmfV+MEKNvt5pYjV5585alEt1Jm9Qt7t+E3dWxaY5Ylsy9iSC0MEA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743185594; c=relaxed/simple;
	bh=Fl+eCb9/JSZTHhv/vCPYcXEcurUOK/JP+AHcrS71y6E=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LGuvKclq8jBeGVCpk0sq/IPDiorrtv0Wj6T3v6/ZiFgk6P71u6adSb0Y1rTKuI+sa/wKYmQAlPfVlFGG6gSoIRSegNDX8gCcZckqDlEtxSRqlbOWtw1ua+B+2qSeWIUiSPMJ5LTTTYR7Y+CugEBOIkPhnIbn3jJOIoKh67OpUek=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=aMvPw6A0; arc=fail smtp.client-ip=40.107.96.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="aMvPw6A0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=alp3caRjA6J5Qp4ytJhY7FrOS3wgoRjyGAP3jEqdgMAkV4iNYzu1AxrsLe9j5pDDbKOAVDWNcOWUkxy7eDHNdeARNavNXxbAoivVAKsRKxqKrp5H0foZTDceaD0qec2YOLiR3cPSj/zj7dxFwczHTfS0PIjgtKMkLpyQZeaWOhNsPEe2xi612AzdS+qb3Ga/3LhhxrJhy6pxkgoIORi0sWpJ21N63zcIEmyiwWl3T3RGhH9DISgnj/wDkWAmHGAjslVmtz4neIO9hIASuuDWjbXP+/SOxdbhtt1gERlRbE+V3ioW5511ViLAOB+w9dsOs+7/fw4JMyRjxHPFWb9uJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BZS1uE3vsyuZj5X4dOats9cz0g+0HVvq8EIdHACMuMk=;
 b=o5F6pRh8N2/xM4cfe3m/Vjs7XmRjWhfQcjPW7I3gsQMh6/fGbt+8CbqqwTBiblY/CIIxOWAuNPFH6D/FVOmAYKI9RxBFYmSp8cMDcGcFqiWon6Ibo3asv2ad9/7Rf1oJ23v0PmRrif1+hZNH7llvRgqu2bWo9zcVLNdllHHKytWGBy4DTWK0tDk525ASNzTz1LBM9yImiIZCrme3Wrxdhf0M6taOr1xxa2hPQ0h6PLi1Qvs0M7b936WkfMcAY+6Jq3Bq0crLHSIfsD1/LCTncuPYjs4Ae1CySRPXcPWxkTkYZu39YsWgytcN5aTc8SYch1X+Q2/5uYaWboq8Wci+hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BZS1uE3vsyuZj5X4dOats9cz0g+0HVvq8EIdHACMuMk=;
 b=aMvPw6A0bIL7625u7vaqBmk4HZBrQktKklDlI07DVxRFMSQ8lElRGf1KNi8opRCsVuVqxjl1nYLOat7G61I3y5Iw52VfBqbeBUbZ1+Wle1/X+mpUntiYljv3nfWpObIRowGyfhCsJddEW7iio2ArQjU40L4iBlJ0vDyhZDrKC29yMF156nhqAXRo0oZ3n8bebi9P+9wybTqSSmuTA0rG92+2KHGm8mFcIGoVyCK32Ny2xwthqVGK8kF99lPTcBhMniWhjFc/e81ZrEw37xbmntvrhrHJh1ZkhnWghoVAbkhwvlApJkkyaDAcxAEEQB3vhmSqRFnIXK1hTa0JTBKHCw==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by DS5PPFF2923D4C1.namprd12.prod.outlook.com (2603:10b6:f:fc00::669) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 18:13:11 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd%3]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 18:13:11 +0000
From: Parav Pandit <parav@nvidia.com>
To: Srujana Challa <schalla@marvell.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>
CC: "mst@redhat.com" <mst@redhat.com>, "pabeni@redhat.com"
	<pabeni@redhat.com>, "jasowang@redhat.com" <jasowang@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>, "ndabilpuram@marvell.com"
	<ndabilpuram@marvell.com>, "jerinj@marvell.com" <jerinj@marvell.com>
Subject: RE: [PATCH RFC v3 2/4] virtio-net: Add new flow filter selector and
 action for IPsec
Thread-Topic: [PATCH RFC v3 2/4] virtio-net: Add new flow filter selector and
 action for IPsec
Thread-Index: AQHbnIiG8FiuLQQN/02JgxLbPSfYybOI3aDA
Date: Fri, 28 Mar 2025 18:13:11 +0000
Message-ID:
 <CY8PR12MB71951F4D0AC947F53CD6C9F6DCA02@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20250324064630.1601356-1-schalla@marvell.com>
 <20250324064630.1601356-3-schalla@marvell.com>
In-Reply-To: <20250324064630.1601356-3-schalla@marvell.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|DS5PPFF2923D4C1:EE_
x-ms-office365-filtering-correlation-id: 7db416b7-f2bc-4dbc-9972-08dd6e243313
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?vn8AehySs4nt4vbnFiGWGzyiYJsq4hEwFvM0vuvfTJxdp72PqSbdCp/13dO3?=
 =?us-ascii?Q?hTbuL89pIrPI9gJS8LII2JDSzSeNqYpjkrrP9Mr+FdVuZ/OxTh1kxWGphTHr?=
 =?us-ascii?Q?fdYZ27q4DAE2qCZz3P/7gGI6qPlCqSNtEwoSHafS5pcWJdsDs0Bxi/f9lbx3?=
 =?us-ascii?Q?otwVka3fc6F4iQD5wqNrlbO3m60GsrdZ8wmu4RtI85g+rQ44jiCYH+uWWN4L?=
 =?us-ascii?Q?zOb9AnhNxlOEQCVfjWVMpBb+AkMLcE74Hk3GeIRRz6dlA3Le1/0QCmCZV1YQ?=
 =?us-ascii?Q?LM0FxmAaXcnDJaqFvfIcSdlhlvKJn4nDnQu5XzP1l5GYWKGxZG8TkEL/Ujwl?=
 =?us-ascii?Q?4bLbD/an9rp2p9SEhre7lUXkFFYnRB60iPbETGfNBmqg4YQQI+uTjBzE5qcu?=
 =?us-ascii?Q?oqC+QSXXCMHSP1/SYmzfNdjpGRmzw66d0I4VAQ+WW8AvxkoIcd864+DA7iWN?=
 =?us-ascii?Q?gvedX+4jIO3bxzzLYHLF7NRrFcvfmmWv11oIWBw9bSXED06J9PTMofZf/K50?=
 =?us-ascii?Q?68f3zOzAbuSsueupWnb6zUO+pLbp7d85Rj5ikxJxCqJmHOta2FKrh/YKfXm0?=
 =?us-ascii?Q?XKIEnIVhQHCNbQdL/AwmHtVgwiuxXtpzekJ/BG4VBNpZEpd9N5wG6b3tuFR8?=
 =?us-ascii?Q?6p5pWLz9colr6OaPC0KmsZpA4dJaZFnHaJ0LRN0xNfWwbU8bW7u4K0Idiyo2?=
 =?us-ascii?Q?rFFyFxUFIypZyHHZBQdZXrrhvioPv99vB8muif9UCle+ww9UWBsWzvQQMQG9?=
 =?us-ascii?Q?WZDDnR11i2zHvH/IT/K7OhT5CtQT2dk6Fm4Eqxy0GMMQ4YzMSWkSNfkMRVbO?=
 =?us-ascii?Q?MjBGJ7uSKuqlmzguF+wr5qkr+skoo9IKs58fbqKctf3cCGJAVq9xtxmDIirk?=
 =?us-ascii?Q?/TToG7rOMpTVIWepscQYPdvM9nMCu4WPtGKr2/vXaonD4f2e1KZUdM7Sk6RL?=
 =?us-ascii?Q?3PwYd++W98hwJEVgrobXASKSNUz6A4CSvc5ueGpCCHeBx4IrvJ3AxKRmxkMY?=
 =?us-ascii?Q?7zPmmHO31sVmL4XnKXjq92yrIqSkLI718zPgLbhiPQS7CZ/7jhwybOrlE2nF?=
 =?us-ascii?Q?9o7ZQkQohT2voMNd0J5ZN6NtG2XJjxISxk84iJOrZOPS38JCudBZ/YwPq7DD?=
 =?us-ascii?Q?1i2+u6dmVydBEdZH+zos74h9eWkU6erY9uOaUBMb88Ut001APVOovN2XRm/L?=
 =?us-ascii?Q?N6BnvQfsbwbPrKLd/jpe09wGfQ+6UyHub7+vTezpcbVw2X8h4MF/Q2ErcxmG?=
 =?us-ascii?Q?bzGLF0e62FbMV0ko2vYd6OmdH829r2ZQW1WMvNTFNd1/I7Im8R1cxiAUrXcP?=
 =?us-ascii?Q?WKx5mbXbs7BX8w2L/SgBB39wfB4yulKNcKyXSpSa1DC+boHEQN5Y+xfXCuDt?=
 =?us-ascii?Q?84Xs2teKMtayvcXN6jDpzst9ZeybS4TqMMzYn4XTOc6HBVAD2SzgSSZAlEwW?=
 =?us-ascii?Q?ZC8bVWftjNIAEDOdbA9MU4gZhQbIhedP?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?5sC3FlLMy1e9Rlx/O1rtFvFuWTUoseb2uBoApvEnJ9qI9kjtw8b8MIqiwlNZ?=
 =?us-ascii?Q?xcDNfsziKuPGF/qU55Z5FTnkFVh0Mw0mD73wkJuEpWlWDmUEeAlC9cRDSJ8z?=
 =?us-ascii?Q?UYjQvUS6dcxcr0VSIQBHisIFyGD83RAhROSF9/IQj9JcgzWTAs/Z4NGS5dPf?=
 =?us-ascii?Q?C723Kp3jmiUPUxlZDP7TjJbQ+LwLZCdK+3D4L4vDckCN+LOhm7e8V1qsKtue?=
 =?us-ascii?Q?Yc6HUF0JCnJV5hPJuAUIjWhhXf/JPKRNHLlt1l84Pk64ADvk9ygyQbnPo/HM?=
 =?us-ascii?Q?zoT82mtmz0RXkoGyqTkIKXdGrubRiAYlqbkYaMaPoki/Lk5m2XIxIVVi5wHN?=
 =?us-ascii?Q?1Au8DAHH+OStwySXDWo9BSN1OqG24iBF5TZ1fzGEwoWsdgNqk1hlGhoJQK1k?=
 =?us-ascii?Q?vxr5ThOpsRhnVRH7j4j7+IfHufwiEQggcN0sFrhjZNz+DVyP8zqVtCBDJ3Ii?=
 =?us-ascii?Q?KtGbPHKjkF621EAyTMCN01EXudY3xmixOYcPVBX0EF4xaEODDgQ+p26be1Z8?=
 =?us-ascii?Q?bbpnmYm0lP9Sz5nIqISwKIO6euG09sS7YmHmRzVEZou0t/sRusv3vwaJ0TA3?=
 =?us-ascii?Q?qDfGj/XvLeEEpTyNr8MjyTvqG418V1DsJRj2iCIAJsj63lOMDAS5wMShL096?=
 =?us-ascii?Q?C2YCu+bhgulYRaHPQ1wGYcKTAde5t2im5wYD1GU60OopDo3EOubOXKtzX6C0?=
 =?us-ascii?Q?pEd09zyJfXGpEwosxNWhezlUmtqRDfHcrSYiNajeNmK5g4IOY4pBbzQkRGKk?=
 =?us-ascii?Q?X7ylNMnGBZ+kFuW1wr2f8t1yBNudvxqgowoR0sMRfeUWElUeoCjg+USRVyPK?=
 =?us-ascii?Q?v/mkfyeO6cpuHHIHeVKEESxIOeyOYhyDpI6oSz2HveXBBoOXl60MT6mbQq1f?=
 =?us-ascii?Q?e2o2Rs7sOeleIp9CYAhq+S5aZDYuMQfUutygxRKRbBUHiZKIaNvKsuMs+HH1?=
 =?us-ascii?Q?y+3xasbxJtJtNhDZ0A4wKWXhnVVMNvgOdfVGeFg8Ek/F/qeHI/sJYHmb9biI?=
 =?us-ascii?Q?BYfmnuJDZ9rEL43FPowe9jFlzs5IUOoASuL7GUOLFm1Y3sIFKsiynOKgUM6b?=
 =?us-ascii?Q?2yCOCn5c6gyPyZCe083yPDOQNTYAIEnZPieGeXUdtGE6EvbyQTtti+LSueS6?=
 =?us-ascii?Q?v0T6AHUlQjuO4TumADpBIBiPftMZYrb9jBp+6nQJR8deOk4EATPLInJzoZDS?=
 =?us-ascii?Q?CtobkYGsUUynn0eMiHyVgxZhqOFiLeVUcfsIY89NUJvu0Z0NJPv/9o7qTH2Z?=
 =?us-ascii?Q?LjgM2Na9TiSWWOMlvWX71kXq4ltVSBDP61Sqpm80coyt1IQB15Za16g4oF1Q?=
 =?us-ascii?Q?aVeC1cosArUp3O0ygz0/8g6+ATpsJiJ/2BqukCk4fkrIP4WrK1TcCh6iWzGt?=
 =?us-ascii?Q?561ziFiNMU8cqXLXjAsALaloggxitVC0wZWzhnecOuHf5ztdkETPasAoWY0q?=
 =?us-ascii?Q?DZNHnMdpM2HOj8Tdrdj0APYfpDrdj5z5ytsHtHCvxg9UveSGsyd7SmU6gwdz?=
 =?us-ascii?Q?1BiH+/KlT6xUPLNBoDpEZX1F9s0mxl93uHEtF9HiwxRnYgpMJYnXG4LK83qA?=
 =?us-ascii?Q?mWmmQtRNhoHjiID3lIU=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 7db416b7-f2bc-4dbc-9972-08dd6e243313
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2025 18:13:11.1100
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eiMpOei/70kGuzA9jicfzKI3VhuwyrpdqbTX/ovwZR2svBbSnoXKS3KOj2IZFivSqJ9ZDXHdH2nOWSImx4LyVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPFF2923D4C1

> From: Srujana Challa <schalla@marvell.com>
> Sent: Monday, March 24, 2025 12:16 PM
>=20
> This update introduces a new flow filter selector to match the ESP header=
 and
> adds a new flow filter action for IPsec processing.
>=20
> Signed-off-by: Srujana Challa <schalla@marvell.com>
> ---
>  device-types/net/description.tex | 25 +++++++++++++++++++++----
>  1 file changed, 21 insertions(+), 4 deletions(-)
>=20
> diff --git a/device-types/net/description.tex b/device-
> types/net/description.tex
> index fb25c6a..c721bf4 100644
> --- a/device-types/net/description.tex
> +++ b/device-types/net/description.tex
> @@ -3060,7 +3060,9 @@ \subsubsection{Flow filter}\label{sec:Device Types
> / Network Device / Device Ope  \hline
>  0x5 & VIRTIO_NET_FF_MASK_TYPE_UDP & 8 bytes of UDP header described
> in \hyperref[intro:UDP]{UDP} \\  \hline
> -0x6 - 0xFF & & Reserved for future \\
> +0x6 & VIRTIO_NET_FF_MASK_TYPE_ESP & 8 bytes of ESP header \\ \hline
> +0x7 - 0xFF & & Reserved for future \\
>  \hline
>  \end{tabularx}
>  \end{table}
> @@ -3120,7 +3122,11 @@ \subsubsection{Flow filter}\label{sec:Device
> Types / Network Device / Device Ope  \hline
>  0x2 & VIRTIO_NET_FF_ACTION_DIRECT_RX_VQ & Matching packet will be
> directed to a receive queue \\  \hline
> -0x3 - 0xFF & & Reserved for future \\
> +0x3 & VIRTIO_NET_FF_ACTION_IPSEC & Matching packet will undergo IPsec
> +processing \\ \hline
> +0x4 & VIRTIO_NET_FF_ACTION_IPSEC_RECIRCULATE & Matching packet will
> +first undergo IPsec processing, followed by the flow filter rules again
> +\\ \hline
> +0x5 - 0xFF & & Reserved for future \\
>  \hline
>  \end{tabularx}
>  \end{table}
> @@ -3173,8 +3179,8 @@ \subsubsection{Flow filter}\label{sec:Device Types
> / Network Device / Device Ope
>=20
>  The first selector is always VIRTIO_NET_FF_MASK_TYPE_ETH. When there are
> multiple  selectors, a second selector can be either
> VIRTIO_NET_FF_MASK_TYPE_IPV4 -or VIRTIO_NET_FF_MASK_TYPE_IPV6. If
> the third selector exists, the third -selector can be either
> VIRTIO_NET_FF_MASK_TYPE_UDP or VIRTIO_NET_FF_MASK_TYPE_TCP.
> +or VIRTIO_NET_FF_MASK_TYPE_IPV6. If the third selector exists, it can
> +be set to VIRTIO_NET_FF_MASK_TYPE_UDP,
> VIRTIO_NET_FF_MASK_TYPE_TCP and VIRTIO_NET_FF_MASK_TYPE_ESP.
>  For example, to match a Ethernet IPv6 UDP packet,  \field{selectors[0].t=
ype}
> is set to VIRTIO_NET_FF_MASK_TYPE_ETH, \field{selectors[1].type}  is set =
to
> VIRTIO_NET_FF_MASK_TYPE_IPV6 and \field{selectors[2].type} is @@ -
> 3472,6 +3478,17 @@ \subsubsection{IPsec Operation}\label{sec:Device Types
> / Network Device / Device  attach ICV, update/add IP header and add ESP/A=
H
> header/trailer to the packet  and transmit.
>=20
> +\paragraph{Packet processing order}
> +\label{par:Device Types / Network Device / Device Operation / IPsec
> +Operation / Packet processing order}
> +
> +If an IPsec action rule, either VIRTIO_NET_FF_ACTION_IPSEC or
> +VIRTIO_NET_FF_ACTION_IPSEC_RECIRCULATE,
> +is matched during flow filter processing, IPsec processing is applied on=
 the
> packet.
> +In the case of VIRTIO_NET_FF_ACTION_IPSEC_RECIRCULATE, the packet goes
> +through IPsec processing and is then recirculated only once to avoid the
> infinite loops in the device.
> +
I think I understand your comment/question now in our previous recirculate =
discussion.
The action IPSEC_RECIRCULATE is sort of overloaded where we say two things.
1. perform ipsec processing, that generates and output
2. feed this generated output to flow filter again.

The action is defined cleverly to do two tasks. :)

This is why a generic _recirculate is not enough. I answered myself now. :)

You can ignore that question in crypto series.
=20
> +See \ref{sec:Device Types / Network Device / Device Operation / Flow
> +filter} for details about flow filter.
> +
>  \paragraph{Device and driver capabilities}  \label{par:Device Types / Ne=
twork
> Device / Device Operation / IPsec Operation / Device and driver capabilit=
ies}
>=20
> --
> 2.25.1

