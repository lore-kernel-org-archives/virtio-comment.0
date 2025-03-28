Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2079.outbound.protection.outlook.com [40.107.96.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7C81D86ED
	for <virtio-comment@lists.linux.dev>; Fri, 28 Mar 2025 18:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743185592; cv=fail; b=Vdy6HfEWIKsgLNKfgbm0KzioL5mHJrz0b1/LHD5s+6OsiPrpy/4A3VO5O73fb/8rX7RyuOkZTwTJ6UnRy97gXIb+hdXWdBXqwuhQQmhkiaQ/pjaikSSNHgxTj7Uyc8je4kviK1Dzc+V93TFQ2AkxJSNyV10+PiwxfWZeHK/k1ok=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743185592; c=relaxed/simple;
	bh=6ev9YsIetHSsIBX9Y1MFB2qTtCa1QdB+SQuESbcZlmI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LFi+YIxyJp966aHrK2JdmGChWdPXopmwP1Ea6O3j/T1qQlPJKmsUIwZW6VQgLvG/78efyUcOLOS9Bn7kyTPItQ+ofumJpdTLv+9fD6gscau2SSkqCVcqvhc0aGI1GDOEKnvv9usoOeAEgTz6dz/DfopA+Wb2edRr4cJX/8XdTxk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=YgFp/Qd7; arc=fail smtp.client-ip=40.107.96.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="YgFp/Qd7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=COkStOeg2qnXjyW0c5n/hX3Mim7TzkYVHtA24WriNWBtlRZ/CFkinjWmfKJX27QeFJuhTcBA/XScx3GyxEHmEILQ4q5Zo8fqlVVu3H7cinTcqooz3Gne/A4GzLaw4CmoM69FuuLQ6VH/IrJwbFtAPSApxWi0MPxn5aZj6m3Dl10fg5/Gz9y7VI5x+0znSuQuP5k2l9RqZKl0O+i7v6lYNFXGto3eiwk12QFLG4FK4LTWRvIPTRfKc5s+kGvUcLqsh7eMsuFWNponCjJ/l+yR6SpP8h0rTLoVd8+M5p4r2agnAZ5I68C1d/P0huVHM2CR4G9ygp1isXMPwrcEK3b7mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nbhYc56PqoT46ZtM3O157RECIhqGwRFKMO3dgZgwGKE=;
 b=zRhovdzT37dcTr/Zy7V2vwu9OViMdc9IQn4IHrAqMgNnJhR4i2WM/sxLrwCu9o9lb7h4jHpLJ15cC5wAo6ckeRCXD3M6Hxg6b7SgYhkZaJFhU9e/9O9qcwzcVh24Bsmm3IrZCdZT3ZBneuFUCUYsZL7j3GYWNYRVXDmnqSNwqgjCr7b/2DDWD6+qkS651qyj+6Q+NUY7wTaZJYDW0zrw160iDbMZScjPeXCM4+QEmt7fg7dRPYYLBvLxEphJ0XfRoIbteHpksz9VYUFS/CXzaU0BFM16wHsH1U70gjjbc0HJbiLa/h/5oWgHdowwIoEsrpYKri1GmKie+abojvd1zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nbhYc56PqoT46ZtM3O157RECIhqGwRFKMO3dgZgwGKE=;
 b=YgFp/Qd76XjymqiVwzix0LF8XdDSkC20x5nInF3/ZUklIDOtX1iZKFdn47GGnx9L839uMMqOMhaSIGLRZDAgjSUYfz8TsI9HUvDAaJkInA+bqj4YlhTmw+t3pFY7iryXlZ7wkrBzgODj9Kl/RetBasfcfjbrWdfx7VpV+uoJU1Q68bjyQ4B73tDpEGz4MZTHp7ouLVsTxU/B91duxWly7yZKE3I09Q0wtkj3zOIp6V+o2/58vXkvC2uvnIowOLF9MjNNPhV4ZVAdYQkvXzxJNpAoifIg+5oFj500mtmbaOIszkGIhL/nK+EyV2SsJ9Cc40st0j06/prwV6WYttzbpA==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by DS5PPFF2923D4C1.namprd12.prod.outlook.com (2603:10b6:f:fc00::669) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 18:13:07 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd%3]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 18:13:07 +0000
From: Parav Pandit <parav@nvidia.com>
To: Srujana Challa <schalla@marvell.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>
CC: "mst@redhat.com" <mst@redhat.com>, "pabeni@redhat.com"
	<pabeni@redhat.com>, "jasowang@redhat.com" <jasowang@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>, "ndabilpuram@marvell.com"
	<ndabilpuram@marvell.com>, "jerinj@marvell.com" <jerinj@marvell.com>
Subject: RE: [PATCH RFC v3 1/4] virtio-net: Add IPsec operation, capabilities
 and resource objects
Thread-Topic: [PATCH RFC v3 1/4] virtio-net: Add IPsec operation, capabilities
 and resource objects
Thread-Index: AQHbnIiDKRvGAT/4I0yMUHzNDzVQs7OI2+Nw
Date: Fri, 28 Mar 2025 18:13:07 +0000
Message-ID:
 <CY8PR12MB7195AEA5E7E388E6A8043125DCA02@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20250324064630.1601356-1-schalla@marvell.com>
 <20250324064630.1601356-2-schalla@marvell.com>
In-Reply-To: <20250324064630.1601356-2-schalla@marvell.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|DS5PPFF2923D4C1:EE_
x-ms-office365-filtering-correlation-id: 878ced93-86ee-4102-bb41-08dd6e2430ae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?WztufoGBDLl+Xr06OxpeLKasbdfLoX7+sOBerKVOk6Jq4VXoDz/Oqc5pbFiY?=
 =?us-ascii?Q?bzNuiBRdGXgPKaIMTESV8zLL1DxPlced3q5LzxIkekppeH2e5x4m+e4f3X2h?=
 =?us-ascii?Q?g87Aqi9W25eQjqp//t+33092a8fjznxUiXRPu6YN21c0wRAMp3F9vncUmtJG?=
 =?us-ascii?Q?EXEbltAoJK49lSI5JyJEDiTRHj+gxSzPRqoJIeaCCXS/Al6cuZtWKjE9QeUj?=
 =?us-ascii?Q?7fcgc8yAaPzkACz3YIkGXadpnc2tbPki33nwzVJ09sMkeSS+v9HjbMeUciTf?=
 =?us-ascii?Q?DVgpTB4+5RbMAavNspCxDKnbEwigdxm6hKeY3/wSvCFeiJQgKRFcIEc1fvk/?=
 =?us-ascii?Q?q6wKUAXJdZ9bbIWIy3uOfMunlTTeCWZO7j6eZBomceM+hBXVXT3LoIpMPaVV?=
 =?us-ascii?Q?wtgV/sSxQWo3ya9eseikgnJmh39eSe07IktHfNHCwITNt7wkRWosUeMzZlo7?=
 =?us-ascii?Q?nHF+m1ROGWvGrrb14dD4xsnUJcusyiCJOecUfxh8OHK69zQjsB3ImMWuh60n?=
 =?us-ascii?Q?lK8u3uhjY0qjSTKuFBLonedYuZSEbhnd6jZl+3j684se1+s/Kut2tIjBRUND?=
 =?us-ascii?Q?CGaBpa9HthWskh9HHjL0bfh8M0rF080fbwGwa8bb0wABdtseeNn/dTIoT/Rd?=
 =?us-ascii?Q?XhhAfkxvyazWMHC3luJ5vzGSHMGjWSCII+4qX8RKLpw2QkssQ3E/yeOZq0or?=
 =?us-ascii?Q?szi8NjPksaa5SlYO3zu6NcXKOehEsyAXx6XK+7MTQsOQr+wtvhNg0A7EoB8M?=
 =?us-ascii?Q?Iaa7rekNAcVwPxyNsZnl46xUIbQ7vAJZ3MzbSTjY6tNUezj2RplLwk3XAl3m?=
 =?us-ascii?Q?xO2hCL+a1UEEPWUuj6gpmGACPnKq1q6b8AGCd+0DymDCITyfW4HQ7ZJ3Jsfm?=
 =?us-ascii?Q?0FFvJ7+kijGf7/JmdouHKU5OG3cOS/0p+a0oWBiZQsZgZNowJPC8GiECBLN8?=
 =?us-ascii?Q?+6h2b0/kjE2qjzEwr5Be+2yw9B5QQJ4d1bqcAQ1bx2ZUpxpR1Yxw5IYPr2JF?=
 =?us-ascii?Q?jjMpTrMNUytqtaVmaYEO1rhoer2YimzK00v9E8kBBUXGuEwxaaC7/aZLW9KX?=
 =?us-ascii?Q?RbqUaFaPPneVwatZvowxxJAhTfJ4uqEpS3NNZ5p7e0n1q0Vqh3H0yWwPclMS?=
 =?us-ascii?Q?MTwjCffUUIV3Akh7r/cPWX1YaeVoa73VBVJjY75CLrOIj4DIdhjI+lRgBCGA?=
 =?us-ascii?Q?Rw7rE/uIp33+tkOB9+UHfTbGNIFiaqETOwHYgDvZOfzEFyrHqoUqB3vSYPUY?=
 =?us-ascii?Q?vvZT8rcJ3TYmHuSvp8ccdOveNFkS1/qsxmWAY2vRZYqZyuzPeLRANqtg05Oa?=
 =?us-ascii?Q?Ct7IbPTlg/7s+1V2QXNlPeyAquSieYVtwo+m5p3W3AqfF7nhjFzfUzX7bfx/?=
 =?us-ascii?Q?17lLeGHluuLeULQc1frEhYa0kJKBxadg6pMUYajX0/IXNB1l3ZKFBIde2bqe?=
 =?us-ascii?Q?Es8c8zed/zpL2veS9puXjM2WOaLJBiOa?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?hsuZRaVapmuayhXlzxo46ZSyDob39U8CUf1JdkR4Q4q5+hTrrbGASP3pnQBd?=
 =?us-ascii?Q?Qby0ry7MEcLhQSaBADnGw7YoMULNJpdR6WPeNJCWHZb8a103IXtxDFIidDx8?=
 =?us-ascii?Q?RYM6Ri0uPa4Af+bDqXWD0N/cyXB366NVXa6dU+UvWsO2obpdu3ObsSyMxL8S?=
 =?us-ascii?Q?NLsChF+aaD+c2Fq+u5lKbDZixVDsvlp7LAVnWH5/b16A5dL1BU/OsCefL2+M?=
 =?us-ascii?Q?LkUdx0hrXqQ/2Gygx+drOSCBa6DSRaGMA3PqovcomFZcGO0bhguRjrSlQnCy?=
 =?us-ascii?Q?wE4WrL0Mone0kyg9braDJrvAcqopWaM1VH74jlU1nQ9k76JFsSsDKct/D7Ey?=
 =?us-ascii?Q?78SMrtTh/QUyitiy6tFRGxLQ2RMJsOM1AZNPFWvQIrB3dCU6DOAU/w6iG9Zk?=
 =?us-ascii?Q?cEQ+fjNebF+X38cuXozfZVrmqZN/476byE0s5YYAHj+noWzsNw9ET2wDAOUY?=
 =?us-ascii?Q?Gwg0RMFItd0EBvwjVLdSXtXWqNxGeMrxnbCoOq9KFbrtcB1FwGsu7UFGnrR/?=
 =?us-ascii?Q?Dp8bmPIj4K7C3KjzCEwXsKMbtz2YYx7zoRdK4JV7zA2W3s2UOLaQaSg61I9u?=
 =?us-ascii?Q?CenyzbJrOnVHU2f0b+LtlW0ljfHYn4vbUhEct1XTEfUt7YTxJuXytfnF3N4h?=
 =?us-ascii?Q?FnaAlOpfomk/gH20wFMJgb0j2mt7+htBbjjPbIPc5Ozh6o5FUlmo1nPKnIrP?=
 =?us-ascii?Q?8AIYgBJUwNIVYxr6+grRTkD2fM9hnYMvcbeVsoslNcrO+2pVCRl8QAc1QbbY?=
 =?us-ascii?Q?KcwWi4cC/GBCtZH/M0hxFuyQ0P4B3fN/HUnQfwug6yoJGPGWYgZvRneZvugl?=
 =?us-ascii?Q?akLfpTLb7b9fuTQzEauozy3xMlGAHjztz0pBfvU0wq+TFW/V3XzV8TrO2cQw?=
 =?us-ascii?Q?Zn64sHpGSAzM6od2zwnlU+McOMoepUo7XPfXACucf/Ts38tO5xNE+gkkittu?=
 =?us-ascii?Q?gCrkT/mVPOOwoSHYUi5aH2tkxR5XaOXTOGth91y3RkqK+ohHH6VEKgGpUFMv?=
 =?us-ascii?Q?GuIE7xunZxei55sRJRSB+AD0zQkCFg5DF2jd4OOFHw6LAvOOoqSCUsqEKCpT?=
 =?us-ascii?Q?ILVu1aPRThCoE7TfseMFOiKwRahB1QqSseIeb6hJXg/b3x+awT9Krvuw8bfj?=
 =?us-ascii?Q?F/w+cIaqoajs4KWPNd8akz1M48rJPTNGA3bjvCNElP3lMEuSkBsXFbARLMDm?=
 =?us-ascii?Q?WshcqR2so1DldBgX+JULbcV3+WfL9jTLrYNf+8dOK9k7qu7N127LEOUKAoqd?=
 =?us-ascii?Q?o5ZV0fQE2lU+uJEv90kxmRP3EosLKNtRV069EOVyI972TCTX7UDV1hI/JXR2?=
 =?us-ascii?Q?w9VGCqNzeCjdiis6LZUyZ54i9heoSHstssvxgCZVNgZZX2QQJW+e23z4t96Z?=
 =?us-ascii?Q?4CC7rbMyhT225znqEbYPI7h8Wqfe5qlfiflavHNAKCtjMU1co1eO7UCB+spg?=
 =?us-ascii?Q?hi96CQq00lXruRJ8agZkEKdTtPReK/Umfj1Ri0EkicddaYfjJpj/w4jM7VUA?=
 =?us-ascii?Q?Sp3fNNo+hBmF5WXBmLMcFnQOSPG2CBlluTnn/OZ4RBq+RtQEv1cpzZDKHnBe?=
 =?us-ascii?Q?MWO6zP+G8a1i52iHaAs=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 878ced93-86ee-4102-bb41-08dd6e2430ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2025 18:13:07.0978
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t6d+s+izRWbqCKECxyXvkFKZjBdgGXMFBtJD+MejUXRwKb/3zwAdVRRXAx4v5CW75cwxTROBpH+YZqE3gPrN8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPFF2923D4C1

> From: Srujana Challa <schalla@marvell.com>
> Sent: Monday, March 24, 2025 12:16 PM
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
> encryption and decryption. These include the SPI, tunnel headers, IPsec m=
ode,
> IPsec options, and metadata specific to cipher and authentication.
>=20
> This patch refers the Virtio-crypto IPsec service operation capabilities =
and
> resource objects data structures and crypto algorithm definitions to avoi=
d
> duplication, however the admin command type vaule differs between Virtio-
> crypto and Virtio-net.
>=20
> Signed-off-by: Srujana Challa <schalla@marvell.com>
> ---
>  device-types/net/description.tex | 50
> ++++++++++++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
>=20
> diff --git a/device-types/net/description.tex b/device-
> types/net/description.tex
> index 1b6b54d..fb25c6a 100644
> --- a/device-types/net/description.tex
> +++ b/device-types/net/description.tex
> @@ -136,6 +136,9 @@ \subsection{Feature bits}\label{sec:Device Types /
> Network Device / Feature bits
>=20
>  \item[VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO_CSUM (68)] Device handles
> packets
>    carried by a UDP tunnel with partial csum for the outer header.
> +
> +\item[VIRTIO_NET_F_IPSEC(69)] Device supports inline IPsec processing.
> +
If I recall correctly, one of the motivation for adding the outer header of=
fset was to also speed up the ipsec processing.
If so, since Shiva has that patch in progress already, NET_F_IPSEC should u=
se the bit 70 and also mention that this patch depends on it.

I think the requirement (or the limitation) comes from the vnet header sizi=
ng.
The IPSec related enablement within the device literally happens when the c=
apabilities are negotiated and resources are created.

So it would be better to just indicate the real meaning of this feature bit=
,=20
That is, when _IPSEC is negotiated, the vnet_hdr size expand upto field FOO=
.

>  \end{description}
>=20
>  \subsubsection{Feature bit requirements}\label{sec:Device Types / Networ=
k
> Device / Feature bits / Feature bit requirements} @@ -458,6 +461,10 @@
> \subsection{Device and driver capabilities}\label{sec:Device Types / Netw=
ork
> Dev  \hline
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
> Device / Device resource objects} @@ -474,6 +481,10 @@
> \subsection{Device resource objects}\label{sec:Device Types / Network Dev=
ice
> / D  \hline
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
>  \subsection{Device parts}\label{sec:Device Types / Network Device / Devi=
ce
> parts} @@ -3445,6 +3456,45 @@ \subsubsection{Flow
> filter}\label{sec:Device Types / Network Device / Device Ope  capability =
and
> the classifier object, unless the VIRTIO_NET_FF_MASK_F_PARTIAL_MASK  is
> enabled.
>=20
> +\subsubsection{IPsec Operation}\label{sec:Device Types / Network Device
> +/ Device Operation / IPsec Operation}
> +
> +A network device can support the processing of IPsec operations when
> +VIRTIO_NET_F_IPSEC feature is negotiated. In addition to standard
> +packet processing, the IPsec protocol processing is also handled by the
> network device.
> +This occurs both pre-transmit and post-receive, providing inline IPsec
> capabilities.
> +
> +IPsec Inbound processing: In receive path the device performs
> +decryption, authentication, integrity checking and remove additional
> +headers, including tunnel header if in tunnel mode, as well as the
> +ESP/AH header from the packet (See \hyperref[intro:IPSEC]{[IPSEC]}). The
> resulting packet contains only the plain data.
> +
> +IPsec Outbound processing: In transmit path the device performs
> +encryption, attach ICV, update/add IP header and add ESP/AH
> +header/trailer to the packet and transmit.
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
> +The driver controls the IPsec SA resource object using administration
> +commands described in \ref{sec:Basic Facilities of a Virtio Device / Dev=
ice
> groups / Group administration commands / Device resource objects}.
> +
> +The IPsec SA resource object contains necessary parameters for packet
> +encryption and decryption. These include the SPI, tunnel headers, IPsec
> +mode, IPsec options, and data specific to cipher and authentication.
> +
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

