Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2050.outbound.protection.outlook.com [40.107.92.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7624C1DE8A7
	for <virtio-comment@lists.linux.dev>; Fri, 28 Mar 2025 18:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743185600; cv=fail; b=AhSesCOWyuMBkZx/6FhfzpHHooS890JJktLKXTUmCRsT3XyCXH/eFBCD7jzYdQlY9zhWyxGHr/SenE8U4xHPg71xx4OQ4OLViqhtc4BNWmQCy9y5FDS/Ga7cxs0t93J6KFUF4nMiYygLgoWHmGYiVYcVvXZbIF2fLUKEBryAaKE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743185600; c=relaxed/simple;
	bh=JxZV3myqHyomcyPQueRJfrn+3ifChxFQkwYZaCOTrjc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pjtDhjgEpXOV30fDXWqbmxbU1S6urfqRC4hakIcQGbrKgt7c6pCfbJpnb37DBhODp66Y8UczyKM/E9HjczJO0wRvZndA0LjRtnSQsuDvoR/uGhUL5E7WdGqsZ26sdj2v6YyhOhEE5ueAlxppN+4Xlp+Id3x8BmrmvbkaVw0F8Xs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=mXrQ3CLW; arc=fail smtp.client-ip=40.107.92.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="mXrQ3CLW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ve2aG0AQHIVNdao/RaUyJ49x+T0LwPSylY0z9ZI2vmIUx8kxq8XWuN/OCTA3vIFIibL5cGr6vRTaVK1q3D2+igWAPob50MwDXlq9UN/a9J7FB0/UP66E8oxeBE2y8lU53sBFmGzFRH20cpyYdZZGP9lC+d/Z4+M15Lt6TAvAhZr8VMmvfdL6rAIisTWrs/5DlEf9tp6ILX2Q503YqDyP/ECm98Y5Yu6QXaHqQ+aepLqbeW+0OJye8HVJ8fwDSxsj+hvDl2ep6uSOWO4+Gvak42sOYLVQonnnAHlcR2y1aKo4DxrxQVaBT7x5z5CJU3XEJbrH4oPx9Bs7wQ1pfNBmMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zEzuATD5xIZHYqrQwrxZs+Yb6NxMHBErRqHBnhgJS+Y=;
 b=qlxL3uvM1Ma1+/3EiuUK8l7cqMSnZF+yL+0efDma7P7gpDB5TYtjrlbkfMg4o7lVy+Z66w3zdZuY5/kAfb9KmkjqfFpVHyer/DgFB81k7n8IVXeacGOMmuglRx/Q4ctu4LsrUgbJltl8UwSmDTBBHgqYE6GMAK3vQE92/kzGSoDgRNhcIXyvaEnEXtEY/cU/vRx/K3+Tl+16iudE3UiRreFr+QNAYxwtCZPiW7nMdhVlxPlRMYeN06YBanzEVwQybT1nusWSBOe+mvNzefi+zeq6u9th2Yzx8FjGAk0YKTMeJqcNJBC2uU5aB2n5S+lp99xEnH2b/WEvFnu67m99iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zEzuATD5xIZHYqrQwrxZs+Yb6NxMHBErRqHBnhgJS+Y=;
 b=mXrQ3CLWxKcOaUqCAWP+Fo8oEjulRb/dydvVUCjdF1cVOag1T9NRujYnjLvHtiHkT6C4cGnC7fQoK3DoppkilHpe46040P1RKsyTxtqkPg8WF8LqWFkcC6GHWk3f1JezsRPNbj9ACCp07W6It+lCcGUi+PT3sP6tRsgUxSzHcrgaEUnvkENV6vwLieJCulTWBcNFy3tmIxEEAvsZrXDmZtHjtD+45xVXME6YLW5ZXBPMXqYeMAy14KBXVcplYj2kIUoP+gJAaRJjRDQBvK9FuqNzjPreihUVoMlgav6Xc6uU9U1qylhJZbyds25e+8HGk70jHZfD050xWCXn90NqSQ==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by CY8PR12MB7588.namprd12.prod.outlook.com (2603:10b6:930:9b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 18:13:15 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd%3]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 18:13:15 +0000
From: Parav Pandit <parav@nvidia.com>
To: Srujana Challa <schalla@marvell.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>
CC: "mst@redhat.com" <mst@redhat.com>, "pabeni@redhat.com"
	<pabeni@redhat.com>, "jasowang@redhat.com" <jasowang@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>, "ndabilpuram@marvell.com"
	<ndabilpuram@marvell.com>, "jerinj@marvell.com" <jerinj@marvell.com>
Subject: RE: [PATCH RFC v3 3/4] virtio-net: extend virtio_net_hdr for IPsec
 support
Thread-Topic: [PATCH RFC v3 3/4] virtio-net: extend virtio_net_hdr for IPsec
 support
Thread-Index: AQHbnIiHYwO/sKnQx0Kuj790bEcRZ7OI31Tg
Date: Fri, 28 Mar 2025 18:13:15 +0000
Message-ID:
 <CY8PR12MB7195DB63F7F2652044714F25DCA02@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20250324064630.1601356-1-schalla@marvell.com>
 <20250324064630.1601356-4-schalla@marvell.com>
In-Reply-To: <20250324064630.1601356-4-schalla@marvell.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|CY8PR12MB7588:EE_
x-ms-office365-filtering-correlation-id: b089c84a-7576-4d29-a194-08dd6e24356e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?ahEbM0MUqHEE5ouDf7KfjPoGcxvxFKP7VyLSZ53OkPWg1m+jlY6RBuzt9s6u?=
 =?us-ascii?Q?pMaQsdH5WUFV8sYhdouy2gTjOSmt2uGJNCd4HgS+vj9DnhaBCEeJAFctvQt/?=
 =?us-ascii?Q?TfULD3tLr8ZHOltpXkphgF97LhfGdKuTIVcQqsbGefx1eZdT6koiEbxam3Wn?=
 =?us-ascii?Q?OxclGErUtg37bbD89kv4K/dGPbSVDEC5B3a6hOsgOQmMZaWIdgpRpIIoHeOd?=
 =?us-ascii?Q?Tm+8DC3kmofbNUBmO5Q7atuunfaeEi3K/aj3vGrZXTRRXhQjv/riW2DObMhK?=
 =?us-ascii?Q?13kOXlXwzw6MBP6wzxiAVwtVM66PBjM9E64kWL/uvTS7GGEEF+6L8sxLWS2H?=
 =?us-ascii?Q?5epBXPgPeYCENzQBc5Cd+R8wQPOefFmKh4ifXIyfSBmnx5y4ggvlJh8+H/rL?=
 =?us-ascii?Q?gHNRonIWm4WDcS6S2dTiJi9vnhxhqO7UvYlXfmpqCA/9AzHS5SXbSM9N95iG?=
 =?us-ascii?Q?XE2KzNYAdK9tmBbMY9mhYWTa29GjDbBVYEdWZOw4EOWuE6k1KSnyndAVM6DI?=
 =?us-ascii?Q?BXQOrPHID8ouclpJZmOjly/xzeni/S0VLO4MixkFBcQsWDAmcNNKNh+ByE5/?=
 =?us-ascii?Q?yIDFlcYjdvfSjm/7a39cFEwMWdz0yFiTD/JJVxnQ49d9xibMRExjLBsdTJ8T?=
 =?us-ascii?Q?eafymno3PFQnsImWz6HiKR3idtbGaXpALcdlDly9+YqNIu5Ub/Z2gBaGTRyM?=
 =?us-ascii?Q?w0zN5UDk6ygPuEhXS9RHPg2nrUuezJo1/Ch+GUL1mS92NO5W4OG0IAYd9MNf?=
 =?us-ascii?Q?wA4A+cnEZS0NRGQ9N6gITUEv13IV3m7+aizK3qONGpTQ+HG2s0drfc1joeTF?=
 =?us-ascii?Q?REpreqQqBO0mM/S9DlL/2YtQ6NYQn0brWuXEIniXG8wjH6wdmrtU8zQ6rOdl?=
 =?us-ascii?Q?crDVJcbSenqTtGUiLASs1OF+OPuHENWVlECiVyn74xwn/Nd65bHtuPtJlPpP?=
 =?us-ascii?Q?kuRBPRgDpusiduXDToCQz0uI2a63O+F/3wmuPuEgDvk90Zh8G0yYj6QNpuqt?=
 =?us-ascii?Q?Elbi4wN2va+LjKjEm/GvPUquKRxU7TiXe3z1cQ0Gwmmuy1BJchrdUwGXeDcJ?=
 =?us-ascii?Q?AuuBSkNrg9f/5ldwD1e8vCiL/qvFOzmSvy3HGlK7KsMLvJatxlsMeayYumoz?=
 =?us-ascii?Q?jQSVqnDTmTwLXqNpt48Wfpk8BsIaNsZ/YYq1TFxOcW00HayB3Mgjj4X2Y7Id?=
 =?us-ascii?Q?Viic6/dPXJrHty6SVMTpvg+LGwqYBrWbQiM9UzepVZdassZCego6DoU5ciUR?=
 =?us-ascii?Q?WMh3Yd+d9RzqpaaarwF1y/1147dya4QnUqsS+rT+4u+kpaDTIwWKs8UlsfJe?=
 =?us-ascii?Q?zZCXRBQEQdd5LgOI7pJsgN+FLb1s7Jl65H1HNuyvsoP80cxmcFfhrajVyGyU?=
 =?us-ascii?Q?t8ohTGU+Ge7NwybH2reLm7RVsbJf8mpzP0Zzp84MZT3uIiM/CHG+0QD+A/DL?=
 =?us-ascii?Q?/FVIh2TmQDht1O3EDPchCYmUnLdaQnCK?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?zOcdufiZL0BH3ruOFZBB9OitacY64Y/b9/1zujGjXqJN7lniG7t4znA2918d?=
 =?us-ascii?Q?WuK2QqmL3+mddn7nwMKBG2XP4DYlHuKZQVrOkiGO86HGrTiEogQ6b22inN4a?=
 =?us-ascii?Q?sHs5z3Fi5qsxlsAwdFv2CYwRJEAV81x3SBmLn+6Aev0mkguMSfwHCLiYBlUa?=
 =?us-ascii?Q?to8avabGF0vWEGh5D6Hb131AGukhik+SF5iVmznkYSmXsXq77N+e0+30I78c?=
 =?us-ascii?Q?iXMA0jQCun1WxuQTs/JZVh+9bkSlECTmgb2vbIiwomHoSABDgvVzccD4FdGf?=
 =?us-ascii?Q?ytPM0Lnz78eXZwgm43AiUaInQBBGcJgm7w/+JkcnE9Wa3HZg5WkEDX4ovFEN?=
 =?us-ascii?Q?z9tJME/ErOObfBPlAhKzr8+56Xuu2GSulnwL4WIffDrtaKcAIGtHoA8AgotE?=
 =?us-ascii?Q?W5eyQmggKDjb9PLZbpHZ4y3usbkLbNlKGqW7L7wPJlnITE2T0zg5BM77VoFt?=
 =?us-ascii?Q?OWMuIAx3gAQLLJCwAZt5ANlnY7aAl95BLK7HDAaNC+z0Z3CASXfHXg/QvYO2?=
 =?us-ascii?Q?xrGHMjWueZ2fMiLnLtmXgERSSTAhOBuAaSoXoTB0Tt0fcgMfgNymhbIIGIsX?=
 =?us-ascii?Q?/yo7SO/IuECw+qwztZacmebDsGX4skSjuZ08/93p2CBl2kzBj+caW3xPOgep?=
 =?us-ascii?Q?fQEJoHSLvqi9HigcAnmhDzMTW28srWQzl7WguRInklh1AXZbhje6yceyBuLI?=
 =?us-ascii?Q?fhJJ7eicx3xwdhsiuIBMgaDZSYkS/fc2GCJxAzycsT4QKse4MV0Pe0VyDeWW?=
 =?us-ascii?Q?GHSD4LqlObPux+fSGm+tMDIeiJxPOLRMgr2/5OUKF1cjlKQbtgaDJBNxROuC?=
 =?us-ascii?Q?0dn+y46a/v2/rcXHnAvMhSMeQXKGKMScwn7XVIKE/wDjDKTLmxWE43KQLVkj?=
 =?us-ascii?Q?CEroBZR4356BeMgQ5GNqA7il+y+u5qjgX3BYFjhmmsR3UqrrbMrpsXMeegJB?=
 =?us-ascii?Q?T84jErolAd8pil0MdaPCBICIzyRrlZEKYdWdi9GKtLb83AAeh2jgL6fpZFQc?=
 =?us-ascii?Q?5zN9rnCEto5OM86NklQ+S31crp1GSMSMYnuaw4RF0Z4HE4BKvSlNUFarFvzs?=
 =?us-ascii?Q?2+cIJ+gXECF6bJMb50PGHC8cK9BMTF98wn0yJZPdV1qT2GMEBYmzPkZD0Fq9?=
 =?us-ascii?Q?bH5oF2l3tFkkwf10SFgTJFlTpxeXHcm/7JOKSPNz87olSasHHHrC0siIcVZv?=
 =?us-ascii?Q?7juxckYUP7cLgTKGnijRjwF3aORX+kC2MVfVL9hf9n67AkdXjySClfgsXDvN?=
 =?us-ascii?Q?K7RV9ANFIyuNPQlak1BSDfNMeDuUAKNHM+mBWTFxPfs0lDk95nn7hrI6O4ay?=
 =?us-ascii?Q?qfmCfNFaPmL3Ld2CJsfWGpQLTezDgvSUr9Bi6RBkUuCwVMLoSQb0Q6E5G4HK?=
 =?us-ascii?Q?rDHhtoZXwbBF7hKUe1o2zSJssWfq+plRx2Gy4NsFgo/u+QbWyzSYplWlsinh?=
 =?us-ascii?Q?3LJXeg7MfGrKVcvmtevZvyY6Yc66HpQGW7lWFsn0fdBsdjgbOrXyfD6Im0Wx?=
 =?us-ascii?Q?2C/yo19DSl9NmcA9KWPkw/cGppKskTlfBdWVAtCCNU5oJ1zKEf0TyurQ1x2+?=
 =?us-ascii?Q?1CdPtZQUC0A+zQhClAA=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: b089c84a-7576-4d29-a194-08dd6e24356e
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2025 18:13:15.0769
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MyWHuxH+oqMAuO0kJm1iAjy0zBNThSTVfMH/4Ku3Y8nS2p5P6RAfIQelpVZowzyOtdOoy9LKuwnrEHwvpE9TNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7588

> From: Srujana Challa <schalla@marvell.com>
> Sent: Monday, March 24, 2025 12:16 PM
>=20
> Add IPsec resource object identifiers to the virtio_net_hdr for identifyi=
ng
> encryption/decryption operations on tx and rx side respectively, along wi=
th
> flags.
>=20
> Signed-off-by: Srujana Challa <schalla@marvell.com>
> ---
>  device-types/net/description.tex | 50 ++++++++++++++++++++++++++++++--
>  1 file changed, 48 insertions(+), 2 deletions(-)
>=20
> diff --git a/device-types/net/description.tex b/device-
> types/net/description.tex
> index c721bf4..a3ff93e 100644
> --- a/device-types/net/description.tex
> +++ b/device-types/net/description.tex
> @@ -590,6 +590,9 @@ \subsection{Device Operation}\label{sec:Device Types
> / Network Device / Device O
>  #define VIRTIO_NET_HDR_F_DATA_VALID    2
>  #define VIRTIO_NET_HDR_F_RSC_INFO      4
>  #define VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM 8
> +#define VIRTIO_NET_HDR_F_SECURITY      16
> +#define VIRTIO_NET_HDR_F_SECURITY_ERR  32 #define
> +VIRTIO_NET_HDR_F_SECURITY_SA_SOFT_EXPIRY_WARN 64
>          u8 flags;
This also takes care of issue that is present in the crypto side without ov=
erloading a single field for _OK and EXPIRY.

>  #define VIRTIO_NET_HDR_GSO_NONE        0
>  #define VIRTIO_NET_HDR_GSO_TCPV4       1
> @@ -610,6 +613,11 @@ \subsection{Device Operation}\label{sec:Device
> Types / Network Device / Device O
>          le16 padding_reserved;  (Only if VIRTIO_NET_F_HASH_REPORT
> negotiated)
>          le16 outer_th_offset    (Only if VIRTIO_NET_F_HOST_UDP_TUNNEL_GS=
O
> or VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO negotiated)
>          le16 inner_nh_offset;   (Only if VIRTIO_NET_F_HOST_UDP_TUNNEL_GS=
O
> or VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO negotiated)
> +        /* Present only if VIRTIO_NET_F_IPSEC negotiated */
> +        struct ipsec_resource_hdr {
> +                le32 resource_id;
> +                le16 resource_type;
> +        };
It would be better to draft this on top of Shiva's patch, even if its not m=
erged. This is because the extension of vnet hdr for 64-bit alignment is mo=
re clear with it.


>  };
>  \end{lstlisting}
>=20
> @@ -953,6 +961,15 @@ \subsubsection{Packet
> Transmission}\label{sec:Device Types / Network Device / De  together with
> the VIRTIO_NET_HDR_F_GSO_UDP_TUNNEL_IPV4 bit or the
>  VIRTIO_NET_HDR_F_GSO_UDP_TUNNEL_IPV6 bit in \field{gso_type}.
>=20
> +If the device supports \hyperref[par:Device Types / Network Device /
> +Device Operation / IPsec Operation]{IPsec Operation}, the driver may set
> VIRTIO_NET_HDR_F_SECURITY bit in \field{flags}, if so:
> +\begin{enumerate}
> +\item the driver MUST create IPsec Outbound resource object
> +\hyperref[par:Device Types / Crypto Device / Device Operation / IPsec
> +Service Operation / Resource objects /
> +VIRTIO-CRYPTO-RESOURCE-OBJ-IPSEC-ENC-
> SA]{VIRTIO_NET_RESOURCE_OBJ_IPSEC_
> +OUTB_SA} \item the driver MUST set \field{resource_id} to a valid IPsec
> +outbound
> +      resource object ID.
> +\end{enumerate}
> +
>  \devicenormative{\paragraph}{Packet Transmission}{Device Types / Network
> Device / Device Operation / Packet Transmission}  The device MUST ignore
> \field{flag} bits that it does not recognize.
>=20
> @@ -1008,6 +1025,10 @@ \subsubsection{Packet
> Transmission}\label{sec:Device Types / Network Device / De
>=20
>  If VIRTIO_NET_HDR_F_NEEDS_CSUM is not set, the device MUST NOT  rely
> on the packet checksum being correct.
> +
> +If VIRTIO_NET_HDR_F_SECURITY bit in \field{flags} is not set, the
> +device MUST NOT use the \field{resource_id} and \field{resource_type}.
> +
>  \paragraph{Packet Transmission Interrupt}\label{sec:Device Types / Netwo=
rk
> Device / Device Operation / Packet Transmission / Packet Transmission
> Interrupt}
>=20
>  Often a driver will suppress transmission virtqueue interrupts @@ -1060,=
8
> +1081,8 @@ \subsubsection{Setting Up Receive Buffers}\label{sec:Device
> Types / Network Devi  \end{note}
>=20
>  When calculating the size of \field{struct virtio_net_hdr}, the driver -=
MUST
> consider all the fields inclusive up to \field{padding_reserved}, -i.e. 2=
0 bytes if
> VIRTIO_NET_F_HASH_REPORT is negotiated, and 12 bytes if not.
> +MUST consider all the fields inclusive up to
> +\field{ipsec_resource_hdr}, based on the negotiated feature bits.
>=20
>  If VIRTIO_NET_F_MQ is negotiated, each of receiveq1\ldots receiveqN  tha=
t
> will be used SHOULD be populated with receive buffers.
> @@ -1307,6 +1328,21 @@ \subsubsection{Processing of Incoming
> Packets}\label{sec:Device Types / Network  \field{flags}, the device MUST
> either provide a zero outer UDP header  checksum or a fully checksummed
> outer UDP header.
>=20
> +The device MUST set the VIRTIO_NET_HDR_F_SECURITY bit in the
> +\field{flags} if the packet goes through the IPsec processing.
> +Otherwise, this bit MUST be cleared. The device MUST set or clear this
> +bit regardless of setting VIRTIO_NET_HDR_F_SECURITY_ERR or
> VIRTIO_NET_HDR_F_SECURITY_SA_SOFT_EXPIRY_WARN bit.
> +
> +The device MUST set the VIRTIO_NET_HDR_F_SECURITY_ERR bit in the
> +\field{flags} if any error is encountered during IPsec processing. Other=
wise,
> this bit MUST be cleared.
> +The device MUST set or clear this bit regardless of setting
> +VIRTIO_NET_HDR_F_SECURITY_SA_SOFT_EXPIRY_WARN bit.
> +
> +The device MUST set the
> VIRTIO_NET_HDR_F_SECURITY_SA_SOFT_EXPIRY_WARN
> +bit in the \field{flags} if the SA associated with \field{resource_id}
> +reaches the SA lifetime soft limits configured in the \field{struct
> virtio_crypto_ipsec_lifetime}.
> +See \hyperref[par:Device Types / Crypto Device / Device Operation / IPse=
c
> Service Operation / Resource objects / VIRTIO-CRYPTO-RESOURCE-OBJ-IPSEC-
> OUTBOUND-SA]{VIRTIO_NET_RESOURCE_OBJ_IPSEC_OUTB_SA}.
> +
>  \drivernormative{\paragraph}{Processing of Incoming  Packets}{Device Typ=
es
> / Network Device / Device Operation /  Processing of Incoming Packets} @@=
 -
> 1354,6 +1390,12 @@ \subsubsection{Processing of Incoming
> Packets}\label{sec:Device Types / Network
>  VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 in \field{gso_type} are not set,
> the driver MOST NOT accept the packet.
>=20
> +When VIRTIO_NET_HDR_F_SECURITY and
> VIRTIO_NET_HDR_F_SECURITY_ERR bits
> +are set in the \field{flags}, it indicates that the device experienced a
> processing error on the IPsec packet.
> +It need not be an 'error packet'. For example, a particular SA was not
> +offloaded or SA has reached the SA lifetime hard limits configured in th=
e
> \field{struct virtio_crypto_ipsec_lifetime}.
> +So vnet_hdr will have both bits set.
> +
>  \paragraph{Hash calculation for incoming packets}  \label{sec:Device Typ=
es /
> Network Device / Device Operation / Processing of Incoming Packets / Hash
> calculation for incoming packets}
>=20
> @@ -3489,6 +3531,10 @@ \subsubsection{IPsec Operation}\label{sec:Device
> Types / Network Device / Device  See \ref{sec:Device Types / Network Devi=
ce
> / Device Operation / Flow filter}  for details about flow filter.
>=20
> +Note that there is a small race condition where a SA object might be
> +destroyed while a recieve packet is still inflight. The driver SHOULD
> +handle this situation appropriately.
> +
>  \paragraph{Device and driver capabilities}  \label{par:Device Types / Ne=
twork
> Device / Device Operation / IPsec Operation / Device and driver capabilit=
ies}
>=20
> --
> 2.25.1
>=20
Reviewed-by: Parav Pandit <parav@nvidia.com>

