Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2060.outbound.protection.outlook.com [40.107.220.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 948751FDA8C
	for <virtio-comment@lists.linux.dev>; Mon, 19 May 2025 14:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747664849; cv=fail; b=FMdsPEyQ/eMarPLNA6dDaZ4vnih24nEiBCAo6pDTSdAz4KMFc/dOp0L/TsvjM7QpI/5mV3mGIgTdZneTyd/3VcGFPZMQHoi3mr6P1n4uukLZBq8+rZsCqwCLXUb9kwTpwJLYj+R+Z94FvHBq70NCKZFTfd6M64yrO4STJk4VrPo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747664849; c=relaxed/simple;
	bh=S9xMzBbvqQ2uWgnnF3WAbSDhIrL6ZrUSr4Mo99tOByI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LkSHNBC+jo8MqKtI2QNohQrdnOwI5cWvnU+pgq6pT41/lqf1Ret7GIz5RBLge1d/TMOMLoVA3yHXO25QlCvHS343oWHUrkRm4mr/vhcoxiH6Ii9pkNG7H3aYU8gQwrEyE4Y69RGfptqUpwtBguNIijsQSICQ6LCR5uh3gL/m/8o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ThPJrVKU; arc=fail smtp.client-ip=40.107.220.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ThPJrVKU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HZPuBoaMEVyB2mqIIuUcd+fKU5u15fJlkdPxDfhLy8Ae0UBO2mrZqVJxF+z/meweTmHTyq3ALhzXlKrxaTsKjHNQqhGfyggfFpBL77VX4dzzvJ/Ud3DmlmN2WgY7DR3hm1bAe144Uah+1EMcZqmwECCqhwAkXAWh5B1AN0PRqs2JsCdU9NiCr6ktKSuj+G7RfUoC04YNRE2pxXowgOXy6X8YpgNqCojK326hTaTOhTcmJcu9lESC3p7DjiAp7fJOppPmUgSc2IcfhPjG9uTd1f4RKQEeHEvKG3y9eErvuJLM7sTlfxU8/1zExlQrwXobxbxuCIPSjcn5mwp3oIsIMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KBvXyFY+PCOEWBm7VJb83m0W6Y+4iXQW6yqRw0wiHTQ=;
 b=pnrEEhmC/SzeGKIcg0B2O7XdRByQQ9er6qNE7RaxBlfy4epqX+54HtWVjUeS73rUQAJCfI6OXpGG/DjbjJoo9W6nSskWc9tkPfuh4koTwFhsZJfQbIKB3Hzv3nDh42UqX2dPokRg2vYs0yUs56/bYlL/U3dO3FyA/PnKykYzlivJH5F/v1IN6s7649hXHFUGypVDZyEWzSSE4+lvozXPzxaB6Awim//9rNf1f1TpjaXbc8qJOixfiU8M0wHzUiDndJXUQgBs0uPFOED79AZqU6v+nlS5tmcHF8awGuJGj+XEgWdVro+wuM2peOqs1YoZDrMRMmd6bgUMoya5IAckAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KBvXyFY+PCOEWBm7VJb83m0W6Y+4iXQW6yqRw0wiHTQ=;
 b=ThPJrVKUWepZ0zVEANfKu5Mati3WOa6PtAt5IIJOVsc80Ln7qNrsgQzH/xSMiCB8mSOb9muGGJD8IlNf9yafNqxjcfRHnR/oHIVM+RekbxBZFPnyZXa1FYJWKgolzDNscBK7C1wwROAyE7lVdIrxGqTNdYSPuB7mvRk41E5gs5vOeoLkEKk0eGfv+j1Uw1J7xXm/Es2GmfIJn+TvnKD2y3MWzfQEq8AcM/BOQcA7+KpG6GXl5HkBFfF7953EapRB6FIxf6aAbtsfMFEjHiXooxcMVR81Nky2gILmVMDIFluAr6enWSuunoH74DPtrIPuUb9E7NC+e9XNWb93daf4GA==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by CY5PR12MB6372.namprd12.prod.outlook.com (2603:10b6:930:e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Mon, 19 May
 2025 14:27:23 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd%4]) with mapi id 15.20.8699.026; Mon, 19 May 2025
 14:27:22 +0000
From: Parav Pandit <parav@nvidia.com>
To: Srujana Challa <schalla@marvell.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>
CC: "mst@redhat.com" <mst@redhat.com>, "pabeni@redhat.com"
	<pabeni@redhat.com>, "jasowang@redhat.com" <jasowang@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>, "ndabilpuram@marvell.com"
	<ndabilpuram@marvell.com>, "jerinj@marvell.com" <jerinj@marvell.com>,
	"kshankar@marvell.com" <kshankar@marvell.com>
Subject: RE: [PATCH v6 3/4] virtio-net: extend virtio_net_hdr for IPsec
 support
Thread-Topic: [PATCH v6 3/4] virtio-net: extend virtio_net_hdr for IPsec
 support
Thread-Index: AQHbuQPoXjqYK7vXs0iERmfpw7Nn8LPaIMxQ
Date: Mon, 19 May 2025 14:27:22 +0000
Message-ID:
 <CY8PR12MB7195FF5D309EDF54DB53C98FDC9CA@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20250429124010.1949371-1-schalla@marvell.com>
 <20250429124010.1949371-4-schalla@marvell.com>
In-Reply-To: <20250429124010.1949371-4-schalla@marvell.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|CY5PR12MB6372:EE_
x-ms-office365-filtering-correlation-id: 2fb1f826-c18b-4d83-1d8f-08dd96e14532
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?V/1iUirjl7e3R/4LlqmuGnUohQzxnMnLgGRVpKW9Xy12LM+2uSPrq0PqPyxD?=
 =?us-ascii?Q?fnyvjRK8WLueZvO8IJHbiexzq7IQcwAzXGGtuTQ1N8Q4R6OaCIi2eq/ilydA?=
 =?us-ascii?Q?FPkUDNDEVF5cO6kHA/LXFwRY2ACjtJE158tDzHlGD6k3Z855wP48P/ytdNS4?=
 =?us-ascii?Q?1xO4InVYQa7jVELFCaZ2Lo5Ui5v9Is6qm+gg+xrvgtDiMXAwjAVOzJ1ciQ4R?=
 =?us-ascii?Q?zNdJy2gnfPShLoasdVO3F7YIPPUW8Nf9EXWfHZqmufgGf2dUny/pmF3JkhGJ?=
 =?us-ascii?Q?iLY2byy/aecBTENo5pJmKHJgUaVcKVneBrrmkWTYupGKLKe9jzRUwGo2eP84?=
 =?us-ascii?Q?FsD8cOJE+GvaNGYYTpLIJNVQ/T7iDm1Fc/m7VjWXpG4/bXkXuykfxlF7XYUE?=
 =?us-ascii?Q?W56i23iWo/fBRqxmv3F3ugudufD0qNxj+7l2OrirDO/Zh84y1Dk5SOupEAX0?=
 =?us-ascii?Q?eVU/eDTw9tddCX3oDRivBZ3uRzd/JhZ/eXXtkrF3WcHqazTBQkds2ZYcF6dc?=
 =?us-ascii?Q?euRunwwKP0frGiW6vxiQvcUeB1lml6dEo95gN/xAV7zV1zR3UdKLPIzryK89?=
 =?us-ascii?Q?OnJ1siYtFV7e6Acb4I7igPYlbXEf2sDUj49ziWUFte5DKT7bw+fD4ycOM/JT?=
 =?us-ascii?Q?7wLhT0E4AhPHpSuLXFcUHCCVfz9+zvGHMYcQfhL6oywUlVgPwbQh6oE2k3Vj?=
 =?us-ascii?Q?TAoBRjtmdZt16HjEC9uBTQXMeDkaZWXRb//1skx84Xthg408scvWKQx166Er?=
 =?us-ascii?Q?0D+cqJOG94rACEq7Vrynoh4cApMF68Sj9QoXpmMYRBFYjSK6ZAcwrnJwb8He?=
 =?us-ascii?Q?tqqPZV6Cv9ugutWTrI1HPNH/hKu016CELJh6pwmoN6aAb7qv06+uQtp8g/wz?=
 =?us-ascii?Q?0vwiw2v02tzrtSNCOohtJHCapg6slsyluzuTZ3XbInZjRjkxqyUIRC9XDN83?=
 =?us-ascii?Q?ZhktwyQHOQh3qZijAR67WoW8adX77MgvVwtl+Z2qRMlzw0JQXy8R3+8WaM1/?=
 =?us-ascii?Q?HH5Y/1bbkQGAWYvSqE/FwsOs4+F95PbcS+HffxoSo9ftkKHoN0KHUgvA0TPl?=
 =?us-ascii?Q?0fJifPhxs4hLrarqFbs15SQpwqCz81Hy49jagyyqXM77TT2mWf5VXsIu2sgm?=
 =?us-ascii?Q?LWpnkOKkNc5G8nl20PBvQ2tOnXrieJ80FK3fDi33JaZhlnIH09PsZu8ME9oa?=
 =?us-ascii?Q?kYxtfFAJunChaJ9G56K/tKnlKf1CiGNgu+qdY5811HgrKM6UHVoReFC8EHk3?=
 =?us-ascii?Q?OIOXmVqOnaNrxQVYggeWy/g7MP9mdW7iSNMw3li9CGfRcQHdIrI6z5YFcH0A?=
 =?us-ascii?Q?jrCuVKPzEbGDWEKgdTZ4wlcTVOQMrTUPzWhO+IB6wwFLFFCKY4hUhd+HR8xq?=
 =?us-ascii?Q?aZ/igldBY9+V3ksne03uwktvPjXr9I3jmfhVqhuITfrerutlwJ8XO4WIaGOV?=
 =?us-ascii?Q?2DpNtVBLKLzT0xc7j8rmFK0Hhj6yYuKbJGKndyyOHuuGCOOZCoZ8nw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?FCKFmv5nQQnV2xJGowrQ0IwU/DifS09wRsGp+E/7wJxZ0y6WDCVo7HSwFJwX?=
 =?us-ascii?Q?evxzt4bCpAwuht1LKn204sx7KnwrISkAQUmjABofYVTwA+ZcvFPOR6Brr8lr?=
 =?us-ascii?Q?y6xKFiDH/eOo2GbDW4zjtCGNvUcNNGks8TT2E/PrC53MFBrdDwqyQZEk4a59?=
 =?us-ascii?Q?EzD8WmPUw4oLeLm7s7eH1KS8oAWUPgwxVgITRsUT4p56oJuahlvN1ueq2bZV?=
 =?us-ascii?Q?9jy+qw8PpY4T/3TQMEsQgQUp2t0VieRHeW1mRWuelSFOrG3pGRUaBflQmolR?=
 =?us-ascii?Q?Z8ceWC2XXi8W3ypA/D0UEqESgRxVQbtGHFsG7W6V0kaEUVlEd2BwTA29m8Hj?=
 =?us-ascii?Q?/6oPxu4nRri4MzczqdnJNKKCO1u3AARSXCdZRjHnCSKmqb1uTQzOHUeF4DY7?=
 =?us-ascii?Q?Q/CL14CVa9V2IyAw4xMRclTBAfow92vY+JDCZ0V2ugyf6Joqw7OQBffxZcZY?=
 =?us-ascii?Q?2BXHAH5f7SOdGGkN9/roVHPKFur8CgiN7X8Bu0FJ36puexkqgAPkAjwzCU4p?=
 =?us-ascii?Q?ITtjdVx+asV2ZFbFcxdvz0zT6HBoupclsGKWPz2Slo2QWYilr3aemam9/Bk7?=
 =?us-ascii?Q?OMViAWYsZ28GGSzzeTuhBKsKLpwi2oZZ6ORXzi68HTcdURRGn2BXMsAL/wpz?=
 =?us-ascii?Q?ZrU3X9i1fpzBc8XSlvyZQQpstQcwo3wkyMncKm6YkXnb86EH00PTx7PYGEcJ?=
 =?us-ascii?Q?UV2ZHLkErH1ULgy62uB4AiQVECJ6G+lGYtTz2+jYW8wlUWHeiqKzK5Fc044o?=
 =?us-ascii?Q?2qhnwPJx5ZUH1y9jonB6Q0ADIGFd9xXV25lx5zIqlTXYkjnVE+0jjmYO3PG4?=
 =?us-ascii?Q?fPI8oHgIJiPR8CJ71usBQ1xYFsrzUjdb2QYvgsZTkBYT1VW/NK05R5untM80?=
 =?us-ascii?Q?wrQpKSQMIGM+/JOoZ4LkJSqY94ObUnOibSo7ZEu+9yP1tbzKNsztQyazevNH?=
 =?us-ascii?Q?TvUdCd0QlV82R2RWoWAVru0/dj1V6fn1RA7Uel8nphp51W2TwfLofC0/N1wb?=
 =?us-ascii?Q?DQOe8r7dYAqTrkbXkVFo6NbaOHkCJUQipvCOnIBfL9OAIgWLu/NdD/bJKeQ2?=
 =?us-ascii?Q?/zPnQ0AQYwgGoFOSc8z7Ry6rzCr+QztuekWb9Fn64JW2ih4wh9XbFhECRW1q?=
 =?us-ascii?Q?zZPbxWgV63FebvEAkcZJWuac/imj7Iw03FNMHL2pcckWsdKAlt4zVh2ZywXV?=
 =?us-ascii?Q?nCxsjvR27xm/LXoDZIz0CcYUAGFgRZVXBQ/WkYhX2l5ZnRAE+cJcu8IvWd+U?=
 =?us-ascii?Q?W+2KifLMGLv1jVv/JKGZpDq2RBxWFCq6QcNJ3k7BATdXQabTGvPxYzF01VDj?=
 =?us-ascii?Q?uoMR4K98bfWjx8wjVSIBo6rNfYCZHET8AaizaHt/7g2gPSZtTof5ym5Eju1S?=
 =?us-ascii?Q?filnCYSULyUpm5aDK4u8sm366MMVvDIyq0bJdlLIA1Tf8RUyCquhCxVEeHVz?=
 =?us-ascii?Q?1uKeioTS1DjDbKP5CQY+4uoPWMoDjwI3pzCqRM27fEf9D1jdWl5L+/qmPijH?=
 =?us-ascii?Q?qOmczRdV1dcF4TwLYaVsBbo1PDaupH36PfG9xNFvDcDE37/mV/J8PxvHzU0p?=
 =?us-ascii?Q?4/K0YOVnH0wAcPrEYvM=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fb1f826-c18b-4d83-1d8f-08dd96e14532
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2025 14:27:22.8841
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tQmi1ADjvoKcppGPsuT9aSLoOobGW7HXjJJh6AUYyYeUG8/9vMTOVxblfbLAt8w7ysg5RGop24uSxvfOihuBAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6372

> From: Srujana Challa <schalla@marvell.com>
> Sent: Tuesday, April 29, 2025 6:10 PM
>=20
> Add IPsec resource object identifiers to the virtio_net_hdr for identifyi=
ng
> encryption/decryption operations on tx and rx side respectively, along wi=
th
> flags.
>=20
> Signed-off-by: Srujana Challa <schalla@marvell.com>
> ---
>  device-types/net/description.tex | 51
> ++++++++++++++++++++++++++++++--
>  1 file changed, 48 insertions(+), 3 deletions(-)
>=20
> diff --git a/device-types/net/description.tex b/device-
> types/net/description.tex
> index 105a002..2540f2b 100644
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
> @@ -618,7 +621,11 @@ \subsection{Device Operation}\label{sec:Device
> Types / Network Device / Device O
>          le16 outer_th_offset    (Only if VIRTIO_NET_F_HOST_UDP_TUNNEL_GS=
O
> or VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO negotiated)
>          le16 inner_nh_offset;   (Only if VIRTIO_NET_F_HOST_UDP_TUNNEL_GS=
O
> or VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO negotiated)
>          le16 outer_nh_offset;   /* Only if VIRTIO_NET_F_OUT_NET_HEADER
> negotiated */
> -        u8 padding_reserved_2[6]; /* Only if VIRTIO_NET_F_OUT_NET_HEADER
> negotiated */
> +        /* Only if VIRTIO_NET_F_IPSEC negotiated */

> +        /* Only if VIRTIO_NET_F_OUT_NET_HEADER or VIRTIO_NET_F_IPSEC neg=
otiated */
This should be,
union {
	u8 padding_reserved_2[6];
	struct ipsec_resource_hdr {
                 le32 resource_id;
                 le16 resource_type;
              } ipsec_resource_hdr;
  };

>  \end{lstlisting}
>=20
> @@ -972,6 +979,15 @@ \subsubsection{Packet
> Transmission}\label{sec:Device Types / Network Device / De  together with=
 the
> VIRTIO_NET_HDR_F_GSO_UDP_TUNNEL_IPV4 bit or the
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
> @@ -1032,6 +1048,10 @@ \subsubsection{Packet
> Transmission}\label{sec:Device Types / Network Device / De
>=20
>  If VIRTIO_NET_HDR_F_NEEDS_CSUM is not set, the device MUST NOT  rely on
> the packet checksum being correct.
> +
> +If VIRTIO_NET_HDR_F_SECURITY bit in \field{flags} is not set, the
> +device MUST NOT use the \field{resource_id} and \field{resource_type}.
> +
>  \paragraph{Packet Transmission Interrupt}\label{sec:Device Types / Netwo=
rk
> Device / Device Operation / Packet Transmission / Packet Transmission
> Interrupt}
>=20
>  Often a driver will suppress transmission virtqueue interrupts @@ -1084,=
8
> +1104,8 @@ \subsubsection{Setting Up Receive Buffers}\label{sec:Device
> Types / Network Devi  \end{note}
>=20
>  When calculating the size of \field{struct virtio_net_hdr}, the driver -=
MUST
> consider all the fields inclusive up to \field{padding_reserved_2}, -i.e.=
 32 bytes
> if VIRTIO_NET_F_OUT_NET_HEADER is negotiated or up to
> \field{inner_nh_offset}
> +MUST consider all the fields inclusive up to \field{struct
> +ipsec_resource_hdr}, i.e. 32 bytes if VIRTIO_NET_F_OUT_NET_HEADER or
> +VIRTIO_NET_F_IPSEC is negotiated or up to \field{inner_nh_offset}
>  i.e. 24 bytes if VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO is negotiated or up
> to \field{padding_reserved}  i.e. 20 bytes if VIRTIO_NET_F_HASH_REPORT is
> negotiated, and 12 bytes if not.
>=20
Please change the wording to refer to padding or ipsec_resource_hdr accordi=
ngly.

> @@ -1341,6 +1361,21 @@ \subsubsection{Processing of Incoming
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
> 1392,6 +1427,12 @@ \subsubsection{Processing of Incoming
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
> @@ -3528,6 +3569,10 @@ \subsubsection{IPsec
> Operation}\label{sec:Device Types / Network Device / Device  See
> \ref{sec:Device Types / Network Device / Device Operation / Flow filter} =
 for
> details about flow filter.
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

For the rest of the content of this patch:
Reviewed-by: Parav Pandit <parav@nvidia.com>

