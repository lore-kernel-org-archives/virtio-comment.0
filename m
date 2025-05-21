Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2049.outbound.protection.outlook.com [40.107.220.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60BB032C85
	for <virtio-comment@lists.linux.dev>; Wed, 21 May 2025 06:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747809165; cv=fail; b=AwMngUx/9+NWRD6mblZuxFUL7LTef4JwvF21/WnbVSqvbD96RW/FX3PCKkuEPDMYBMBsSf8qWSxv3vUVzd1MZ8YMZx81doERqGvxmNSoJzeCh3bMd007lOBuOJxZ20D2arKL0ddoijSOdQfAUUr3YOIw60QpPADVqGmt+xNaNAg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747809165; c=relaxed/simple;
	bh=OaOU1x27fUNGbfMDRv10cCgDcBLglWL+Q3qyJJ1LpVI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FbuU8m3En2vy7UxGGXSXEwRudV4ZN9GFVvLHipnqKrYBqQsqluhNIat/IoN0L4SIKulgwiPdwMe9xXSPa1WUydBNA80aEVHGhalVdgjbN3O/mwTnnfwj1cJz1dEkLm1rMPhMGiD17jsXNQ6M1NEIOddfI/1KifJNxSdnzAthdCk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=XRG6QB+O; arc=fail smtp.client-ip=40.107.220.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="XRG6QB+O"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eyJD9MtcC7M05QfDRldOecxwcNQrD+yzzXwWhnIeAeZDvcXdvx1k+xtDa+3VfSCRj6x0dzd5+fMfk+hhBdVy1OtpzibQrEj1gFTvh0geDML90s/eivwOjIVHHf4IiouN24dsZjZbFux3p8GI7VdUokG43CEDHoOjq+5luo3sjV8JBphM6o2xbu4lQo4WcRT+I31yoGYeyIAAHZBIbQcgOB2EcedbUckq+IlNIj+9qodunV6AixZi9aFWtfWOds8H4SL8dj/sPrm88zm1sE6FtB4ofSo99Xzpo1eBpaIlgF51Mfd8zMTLVW842AfS3V8ASDV8KP0cUkCzcI4AV3pptg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mfjgiVMu1vx7/gZd1PG16iuQsYyKWVCuYSqxzdPiTbg=;
 b=wewUfPbLJJDueIx769JZXydgLtzQ9Bacn6TEm0GHfUQYymgE5JEA97JLFXaFTdvYLmZuEwhCtjfcpJVHpihY+oR165144CWiGyJLyLE8KKyEsz6i5Cjctg6NdGOI8GZ//sShz9iAVdGXUJNwwuX6pVqKmcr9dyN0obNIBjl6rcHB+kucaVDIwPjMRKwF3hROqzmyY5wA8pofRvbgItmLOgOptZQaATdbTGynjmXxFlVx+v79fAFaKUppLKk7Csv+UZNzMBtvinokuf5s1GJ8WGfcOKXmXNcPCknFa0WiGpgXVRBPJvegOE2C4GH1FkEpbdw+p230dlt7Q/fg3eCaKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mfjgiVMu1vx7/gZd1PG16iuQsYyKWVCuYSqxzdPiTbg=;
 b=XRG6QB+O/EjrRcFDxnL7ok3jmots/XsMxTETfCxxOrFV/SjMaNiMf5g+VV04WLHuJKpXQC70LbIntFAdHqC8ZJWKjX3UXkQHdYYcTqM880uHLoOLaRsXX9lllCZ596QR15QQpVxP+GjjAS/njZNmbnFCZxc+MuT9APkkfHa9s2UKYcaya2XszogDn+gcCQ+RSaDSxFTzXDgyMLcfqaVFEzvEM4eG5VejUYYJsFkRjmlzExdPDPTc7wNLbKQF1z4pBqxO/j9e+793bq60eRY5Gs7ga9EyTWD1ldm7ZJO+phwVqNxTmYCaS4JCa4IrW/kLTrnY1ME6HldViY9yQpR7qw==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by DM4PR12MB7549.namprd12.prod.outlook.com (2603:10b6:8:10f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.35; Wed, 21 May
 2025 06:32:38 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd%4]) with mapi id 15.20.8699.026; Wed, 21 May 2025
 06:32:37 +0000
From: Parav Pandit <parav@nvidia.com>
To: Srujana Challa <schalla@marvell.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>
CC: "mst@redhat.com" <mst@redhat.com>, "pabeni@redhat.com"
	<pabeni@redhat.com>, "jasowang@redhat.com" <jasowang@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>, "ndabilpuram@marvell.com"
	<ndabilpuram@marvell.com>, "jerinj@marvell.com" <jerinj@marvell.com>,
	"kshankar@marvell.com" <kshankar@marvell.com>
Subject: RE: [PATCH v7 3/4] virtio-net: extend virtio_net_hdr for IPsec
 support
Thread-Topic: [PATCH v7 3/4] virtio-net: extend virtio_net_hdr for IPsec
 support
Thread-Index: AQHbyYF73lbe9GefukSTehOTTGxhlrPcoSjg
Date: Wed, 21 May 2025 06:32:37 +0000
Message-ID:
 <CY8PR12MB7195D06326C4DE9F14C3F061DC9EA@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20250520121924.2169258-1-schalla@marvell.com>
 <20250520121924.2169258-4-schalla@marvell.com>
In-Reply-To: <20250520121924.2169258-4-schalla@marvell.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|DM4PR12MB7549:EE_
x-ms-office365-filtering-correlation-id: 674848d5-5dc7-452d-d2d8-08dd983147a1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?/UT/3NPOpReWwxnd2/ureDar/Stk9Gto2JO4sBfhBXoXVXde2mZLUlALUFZC?=
 =?us-ascii?Q?dH4rvF9p/XTWNGsDaIS/V5dxOzaBgvnjwVI0X2kw3Od/ypJ9xELsM2QjG+/D?=
 =?us-ascii?Q?ZBzGw8JdPoBvnl/pHI1VFVbQKpnj/CxozoWmMefat3wPdz9iwWidDt7tC8cH?=
 =?us-ascii?Q?uRlqm7futCFft/NoONUzwcdjlssyoQRTQhmTPi7zsNPbQqc84h7PPfWvP5qD?=
 =?us-ascii?Q?AT/6pgrP8vwKUY7njmGHq1vY/Dmvpnp/yPNG0FBMwjz85rhuxsM4fW25u8he?=
 =?us-ascii?Q?Gp/8cdEdbSL6bJKoEIpOGbySCsl3YxrizIjhAsUDnFcref+o4QjNfgljnunH?=
 =?us-ascii?Q?KHjjRI6cmsQkhI3oysi5zh4Zuue9NN05by+MdUYTPJgzZKoMy3pTYRcRQVhs?=
 =?us-ascii?Q?YSR4uT/qrN8PXs6kn/KcRNIX3kFTR3DpxWpIQh8t0QRLZkYwwKDfMtnPUp+9?=
 =?us-ascii?Q?EwjDCXy28OADwmqpprLYVlxjHavFOQ96Q91BSELOQJuut4KU7o7QryBhVedY?=
 =?us-ascii?Q?f09cecZ72MHdAYjuV/dG23ZjyHrgy4hYCocZDhD8IGyt/Z1pJ6sP/8ST0ZD9?=
 =?us-ascii?Q?vPpL21/P3ZrMmrS76p7nHMwdWSfFysUbDiPmTJ6k14AL9soFAvwVyhthY1OD?=
 =?us-ascii?Q?AODu1bsCQqz/E/b4NwAk3sYjeJZcQSxaocRdi47YPPrcwA+cIsjlqTGE9DEm?=
 =?us-ascii?Q?oBmbdxcLqv6Mm0CJOnNCmKZGsrHS/vn9iHzPw+gfm5DlMMwAEJHC9x+e9Gx8?=
 =?us-ascii?Q?73lZzlSq1SzoXl/8ga3GGpWodF/WiVUnAn9xU8Mag5lI5Mop4xbrz3EvuU2Z?=
 =?us-ascii?Q?wHBZ9Gx7mfecDMsxyxNJRbNntUb3wxo1SVr6BMdNHRL0Y5CiGu0/pPIi/Eqj?=
 =?us-ascii?Q?qizxmZyEafoz3Y24zt7MJlVJ9vAJYUQSdboEdX4KxoDQ9TpytKF32Y1flY+d?=
 =?us-ascii?Q?f+xRc4NZ2MV12zMAGCoLd+sPWQ5719YRWaxmhiW35MtbwEu05+Fc6Z42bY/E?=
 =?us-ascii?Q?5wS9YE1oSzQi9iRaQTjYwONMPHmZ9QtGPlPiFzgUM86UmPEUfhxLZvkRV0Qk?=
 =?us-ascii?Q?VYBHpCgVoK/ZXZ5qizkalajiu8ROuayLTlax2bOshGQBfZXrvuBbReGo+QL2?=
 =?us-ascii?Q?Zd0MCI4AYaPCfJUTKub/YduUQk1Aas3huOCznqq1jV+UWMgd4TX3D5R5nPOe?=
 =?us-ascii?Q?UbKejKjKq6upv3SWV/xRnQ+6MT2gLn3F1NH6KLARp1lZx41gOv6ZYXBcSa03?=
 =?us-ascii?Q?DPJwZeNRSDS3n6bQD9DYv/i2XpBCx1VmUvVwhPureBHXPQvk5u3ntfGkwm8n?=
 =?us-ascii?Q?K0wCKtib9dWrvPwC75d75X9CU3gNe7GD8gpgZRVYRtK2LSXiOyUR2ZLUSYk3?=
 =?us-ascii?Q?sk28Xo89mYPUyfsh510Nbk46S+5SSjK4kmNSBGy5AYA7V/hT3I4/qyZk8flH?=
 =?us-ascii?Q?vrmzCgq1Mr5GXO+SY9I/YQx7//ICaSnY3zC1Kkk1g8KtI2oyQ8xCzg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?9Whoc5j8yW+9nLjt+csTfthqdVJxqo16lkwDxq4kwgeZGVoccikAKDJqtnNN?=
 =?us-ascii?Q?ZiAI87n/awITzLwAD6jer+yzgU4FUDEkTRHDfI2AqFoVmNj6pZuznCrFNhzq?=
 =?us-ascii?Q?bOsypofSQ21WAvAgKV32LIg2neilzBxNo5NueKt2RALx9sioDOxmeXfkKKcy?=
 =?us-ascii?Q?zoffyBGe47YIsTIVYWaPFhBviY08/JONk/EOdqL+YU92mfy1e75HG4sj/KDk?=
 =?us-ascii?Q?lqXrfpZ61gg7mk5vqYU+igH0Z88fz/7qM5zDO3hkz7tPJTlV3MomynXBjlDP?=
 =?us-ascii?Q?e6AMSTZzAUN8Ffjkz8hdId/w9M3yPlI6lc264kyRkX0RFUD2Xt+/ApO177ig?=
 =?us-ascii?Q?VJIC6WDjPI6TA6p7gdIqJrkzyHZ1DzgFA1auIPUMvnRISZl9j+ENDDDjnjpc?=
 =?us-ascii?Q?2EJWKzZRJH8+1tnMzKdAgnk69qUlTRbN0aNG+KGQHtAaS3oGokR4IEvDW7tv?=
 =?us-ascii?Q?VCeXGiIepgLEdVEvxpE7IG+D+ddEuEreLtM9YTUE8RjozTElpldLXSF2S+DX?=
 =?us-ascii?Q?ifa3scyADdA+0WHltyOBu7xyhSBJMz7u7YQJe4Q+FCp+gkodYE1bWBh/0G4i?=
 =?us-ascii?Q?z6Hk1Q8kVEmjIqQtP8ciNqFYwVg99utDJXIjNSbQ3ioHVKBvGNezP03f8t/C?=
 =?us-ascii?Q?jniJ3aONgGx2mBhgOX9ATLJQr1oMkXtNQmgaWK9MB5NKR3DoFQF5QShev4PR?=
 =?us-ascii?Q?usGPPUzCSnS3SpMBBfvG9WE6haolZjXKXbN6+Mh7c5pQR2Ew6ymkSx2R5sJm?=
 =?us-ascii?Q?Yz/yEA8mvvOqRyHdcI+ldQFqS/JN392D2iFd41viydM+4y/0zJxAnrVtOLws?=
 =?us-ascii?Q?iGBMD4asg2VIq0QEt3J3el6bb4m3No+Tkue5P6PhLEsnjQ95EZRLmGnkzibs?=
 =?us-ascii?Q?2fFGtKGpZfhhLSO3veqogyEQG1xH/PKJ2OdFVzxu6FcDk01ZJhTsXh7yNlzz?=
 =?us-ascii?Q?cg7aKRfoiStVt19t5p2IIKYoV/jgrWZEInA2Meq+gRRFMgOa4WrSC+EhBPIg?=
 =?us-ascii?Q?C6UvXpdGcf96SfHtLjT2BBlpqjaGa/V2kPKgr9AVt1oh9wYUh7yxmvnJrtM1?=
 =?us-ascii?Q?qt4Bo/H61dCOqBd7ajUzl023FvFowzDS9hTDrDj4jCDV6SrjvCRgwUBGOyia?=
 =?us-ascii?Q?aHOJxAM8CzvrYKfcdE6RtV/kFESEwBOxBwBrN78Efk+AYJfDPQAudczeG3Un?=
 =?us-ascii?Q?Bmy1FJjIMpSs8GGoIdHTzifV1NaORe9W7twF3iD7tZms40nw5VCZ6TbhB3VE?=
 =?us-ascii?Q?l9zqiXY7nNFSA9StYhbwGOOZn8UPzMjJfOCt8UhbBrYm7ROK6WxZof3WOdVu?=
 =?us-ascii?Q?Et4NnnEW3wrZ76iX+Ac3AEKK2MFMlZKXWs46ct/qbvMZ3aAttdjRzJ4h6bnn?=
 =?us-ascii?Q?NAlEOkLxi16b54RO/qoZ0mxKpkr4W4cY96RZOpUqTcBwHY3bs7sgD4OI+7I5?=
 =?us-ascii?Q?KgjWorZaWbr7j3gtQ2Rcwa8/NoFSQrUEYLLSoVynmNHip+20g/6nVrXDmWl/?=
 =?us-ascii?Q?nirsPGUYRsGkoKRkbWHmbMSf4NRYOdSKt7NDeN6lf6P/f5FviwWquZFzyWfi?=
 =?us-ascii?Q?Kh1QjuLv5TOfOpzH0Qk=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 674848d5-5dc7-452d-d2d8-08dd983147a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2025 06:32:37.8747
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XBdXPG1LJioL4djQ3Vn5JGQyPl2L61bIdWCU7srqy4yv7Wk3cpJyHG1I0CR1yU/4vbp+SwQvAhYoEIyV7cdejQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7549


> From: Srujana Challa <schalla@marvell.com>
> Sent: Tuesday, May 20, 2025 5:49 PM
>=20
> Add IPsec resource object identifiers to the virtio_net_hdr for identifyi=
ng
> encryption/decryption operations on tx and rx side respectively, along wi=
th
> flags.
>=20
> Signed-off-by: Srujana Challa <schalla@marvell.com>
> Reviewed-by: Parav Pandit <parav@nvidia.com>
> ---
>  device-types/net/description.tex | 52 ++++++++++++++++++++++++++++++--
>  1 file changed, 50 insertions(+), 2 deletions(-)
>=20
> diff --git a/device-types/net/description.tex b/device-
> types/net/description.tex
> index 105a002..a2a1753 100644
> --- a/device-types/net/description.tex
> +++ b/device-types/net/description.tex
> @@ -597,6 +597,9 @@ \subsection{Device Operation}\label{sec:Device
> Types / Network Device / Device O
>  #define VIRTIO_NET_HDR_F_DATA_VALID    2
>  #define VIRTIO_NET_HDR_F_RSC_INFO      4
>  #define VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM 8
> +#define VIRTIO_NET_HDR_F_SECURITY      16
> +#define VIRTIO_NET_HDR_F_SECURITY_ERR  32 #define
> +VIRTIO_NET_HDR_F_SECURITY_SA_SOFT_EXPIRY_WARN 64
>          u8 flags;
>  #define VIRTIO_NET_HDR_GSO_NONE        0
>  #define VIRTIO_NET_HDR_GSO_TCPV4       1
> @@ -618,7 +621,14 @@ \subsection{Device Operation}\label{sec:Device
> Types / Network Device / Device O
>          le16 outer_th_offset    (Only if VIRTIO_NET_F_HOST_UDP_TUNNEL_GS=
O
> or VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO negotiated)
>          le16 inner_nh_offset;   (Only if
> VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO or
> VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO negotiated)
>          le16 outer_nh_offset;   /* Only if VIRTIO_NET_F_OUT_NET_HEADER
> negotiated */
> -        u8 padding_reserved_2[6]; /* Only if VIRTIO_NET_F_OUT_NET_HEADER
> negotiated */
> +        /* Only if VIRTIO_NET_F_OUT_NET_HEADER or VIRTIO_NET_F_IPSEC
> negotiated */
> +        union {
> +                u8 padding_reserved_2[6];
> +                struct ipsec_resource_hdr {
> +                        le32 resource_id;
> +                        le16 resource_type;
> +                } ipsec_resource_hdr;
> +        };
>  };
>  \end{lstlisting}
>=20
> @@ -972,6 +982,15 @@ \subsubsection{Packet
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
> @@ -1032,6 +1051,10 @@ \subsubsection{Packet
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
>  Often a driver will suppress transmission virtqueue interrupts @@ -1085,=
7
> +1108,7 @@ \subsubsection{Setting Up Receive Buffers}\label{sec:Device
> Types / Network Devi
>=20
>  When calculating the size of \field{struct virtio_net_hdr}, the driver  =
MUST
> consider all the fields inclusive up to \field{padding_reserved_2}, -i.e.=
 32
> bytes if VIRTIO_NET_F_OUT_NET_HEADER is negotiated or up to
> \field{inner_nh_offset}
> +i.e. 32 bytes if VIRTIO_NET_F_OUT_NET_HEADER or VIRTIO_NET_F_IPSEC is
> +negotiated or up to \field{inner_nh_offset}
>  i.e. 24 bytes if VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO is negotiated or up
> to \field{padding_reserved}  i.e. 20 bytes if VIRTIO_NET_F_HASH_REPORT is
> negotiated, and 12 bytes if not.
>=20
> @@ -1341,6 +1364,21 @@ \subsubsection{Processing of Incoming
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
> 1392,6 +1430,12 @@ \subsubsection{Processing of Incoming
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
> @@ -3528,6 +3572,10 @@ \subsubsection{IPsec Operation}\label{sec:Device
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

Reviewed-by: Parav Pandit <parav@nvidia.com>

