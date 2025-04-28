Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2058.outbound.protection.outlook.com [40.107.243.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085DA1D618E
	for <virtio-comment@lists.linux.dev>; Mon, 28 Apr 2025 07:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745824064; cv=fail; b=E7k/lMJERs9JF7GorZxtImow8aJc62r6150Ji+ww3Mfo/B0Z6RwklUtgu/wmrajQodp8G0UZnvqs29E362+iJB9NsutQoNUaVETieU2/7A/uQgYs6oSYI/pADVNhiCVFDX/r0syXfmJyuyT/YSIJxs6L+ISub2WtYy5orE+v0mE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745824064; c=relaxed/simple;
	bh=GeSfBkhiQf4WyJDj55icxeV8ibGVLlXCmSJmGnvkLc8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=BwZJ/7zmXaubH/LeK42twmkH3k6pf5lQYcco9ae+hgtheokSRXZz47MULLPiOdjDzGBhWCy/mUzRCNM5/fQ0oi2bRIWd9AuWVpIlWQ5LtyDtrD4dBTGbROBwyOFNiJDEOEIpnOcdfRWyPY9xOtXGY9tEWJJWEu96W7u1VV3kYvk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ssQJc6iF; arc=fail smtp.client-ip=40.107.243.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ssQJc6iF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CGxApFv3SBUoHlUoCKHSWl0B6dBnsq/olFzKcMlywZ0BnNChLCY3UPiZ9LN0wx3IavvqGzDnoLyDKWlCn4VZvVS6HGOvRQDUNT8BLujukTuVBaFFf0zQK8IPvflUH1DuXQM3rBiMPbFqPA0QKvO9bvbvM7LfLKbQyQSMFUBtFZWskeUT5PlrYT9M/4TyoSJDAv7ols6an8q5neS1U3EWLbBgTnhSe5Kh5qOYafiDFlILssW7EDjCNw3l86tr8t7P7QrHSF/Fo7q4jggUPdOCq8blhH+UTCWU5Af2Lk8VtEvhhiQ973av+DqVs/NoUfPL+G4ymqkN6EtGFCA15BxpVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+0eOz/T1V5q47juGfe2/3B452MEY9zl4NKIB2nTYYpM=;
 b=HoHX9cLhuNK1aIWi1X16loFEououtF9LV9EnHNEtxTzCXwys+yJG04H9Dgh69Bicm2NllmZ2tino03C10yWWGjR0UafHPetBHBVqBO0ACEzFlVSnFeVYUurukaTVTzwWcX05h+yh0+Kzla9/cavc3vGzxOw/340xRPiwW/H9Gs2B/4RSXRNaEu8o2lfm8mu4hM94eMHBLif1xhyhUEZ1qrxvWTlb5OeIKRHdW/3Dvok/4/XFDP0ugSDQU8c3fjqvr4h7sgRLmxYUkzVChxSq8/3LkZxdIuYLCFg6oLS5L8nheIpyH21eKxuT5o5F44ZPonoO39IEwFsUe8oRGPT5Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+0eOz/T1V5q47juGfe2/3B452MEY9zl4NKIB2nTYYpM=;
 b=ssQJc6iFwKtg+nr+I8dZ3K0SC4bCIkfjbgYjgYLv7CIfv7vUIg/WRzUNQSQSU+r23Qcs3A66CkqaTBvOnTWU2KCeIDT2EnejtXCROYB4tnJNedYW2/Yd2JNEQ2msC/ppu6ZovmugBT8MyAoqfIGxfJD04wx3D7hVkA6Wn6Hj7MG01dULBVcCE2/ZGO0YjYWtaztx9XdBhthsCNjjlG6Nfkn/B0kgbMEvE/5JJf/UQhG2kHmZ4/Mx8LV7K4DjQ4zrwVufatDibwvxzL8ATE6rr4b0DJ6ZaSHRvfyXkHaJC6UBwtEC/Y0GxbFc2WrN6lZifT+uhGMGSN1idGWksRBRJw==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by DS7PR12MB8249.namprd12.prod.outlook.com (2603:10b6:8:ea::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.26; Mon, 28 Apr
 2025 07:07:38 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd%6]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 07:07:38 +0000
From: Parav Pandit <parav@nvidia.com>
To: Srujana Challa <schalla@marvell.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>
CC: "mst@redhat.com" <mst@redhat.com>, "pabeni@redhat.com"
	<pabeni@redhat.com>, "jasowang@redhat.com" <jasowang@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>, "ndabilpuram@marvell.com"
	<ndabilpuram@marvell.com>, "jerinj@marvell.com" <jerinj@marvell.com>,
	"kshankar@marvell.com" <kshankar@marvell.com>
Subject: RE: [PATCH RFC v5 3/4] virtio-net: extend virtio_net_hdr for IPsec
 support
Thread-Topic: [PATCH RFC v5 3/4] virtio-net: extend virtio_net_hdr for IPsec
 support
Thread-Index: AQHbtP1m6Yn3psIRQkK1k0q6I27tq7O4qZ7g
Date: Mon, 28 Apr 2025 07:07:38 +0000
Message-ID:
 <CY8PR12MB7195B626B44F7634ADC87FB6DC812@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20250424094332.1927688-1-schalla@marvell.com>
 <20250424094332.1927688-4-schalla@marvell.com>
In-Reply-To: <20250424094332.1927688-4-schalla@marvell.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|DS7PR12MB8249:EE_
x-ms-office365-filtering-correlation-id: 795e8246-dbd0-4896-e0cc-08dd86235c56
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?U8VyjPdXVAuVd/aHCkbQypRPRfwNdzjXd+DHyy6RH0LPz56zP7FYkJo6QGvh?=
 =?us-ascii?Q?59tJB9PmPSQeQi7QVWgQU5GrfmEhLvgpMgJuEUmnNFXvYLwJvuIIZXDtYmHn?=
 =?us-ascii?Q?veGqRULcJmkaakomVLxxJOsSnZIdsfLVY5KavT2HH95r8ObAptHsb2p7I6ir?=
 =?us-ascii?Q?uAHZESQPSGcksElDEH3TonfjizDJAXA2UHwVqsNWyXKXxJnrR7O2bwsI7S5/?=
 =?us-ascii?Q?BpYEwb4Wojw1UwuxAz0OTrfggQ0RoS6dqpBmxwSxzYCTuph+QV9WhrpMGs1F?=
 =?us-ascii?Q?coeSjmitkEt2Gbp3Co78+IOjG8U9t+JcBf1eoyAtbrujK1S1L5wzSq2yNGxo?=
 =?us-ascii?Q?uRKARpXFP/oVeuxdUoQjvbK9HogCPuOCggofOv831yg6qcaKiJs9HzhOIZkH?=
 =?us-ascii?Q?zkK9PfhlBAF6kd2V+WwHy7Llc2CYLlW1raH8l74Vp253uwcJ/4BhQPXeo/Mh?=
 =?us-ascii?Q?h/Vh290I6oiaQtH43CAQkYQ8DiTPujSYqmgg6Ui4//1nrk4V0dmCq+0y3Phb?=
 =?us-ascii?Q?ljfwoVBZRKOuXNJdcIOm9Knl4lsSQIzFnS7IAj1NXOc3Od2hdNdkSCb0/8B3?=
 =?us-ascii?Q?dXHJWft0elwx9GnPp7BOLDHxWVT1/MYguoW06D3ZTjFG3MqS8Q/8yex3c4zP?=
 =?us-ascii?Q?6da6PSFKT01avIbpEdcSNuqxqiTWnhWlhL25PJE5chQnxnKn8ZDbODm4VIfm?=
 =?us-ascii?Q?I7wbZx2e4YsNVH7Wsc4y5ZPJ4glQWGsr16P7ywAgj4R37GTUcX/vj3lvIVIi?=
 =?us-ascii?Q?HCGxWE0mDq2rdgWM12kuqsT3nJUHpMOouKuprdf4+MibwFGEfnkUHS6mFCx2?=
 =?us-ascii?Q?wMk0Qc4i1Havg2svUrqU00aibUVbHVp6QeZmyfssD8gwUAv75bZaTnFNax7m?=
 =?us-ascii?Q?Vg1XzoGBVf+S+twLImoXt9xr87+ZjHyBtPNW/6g6pX9FpjI9q1vwHXIzuYCz?=
 =?us-ascii?Q?Glf4j07SD8zrhb4f7IvfuMHV6nHW3SC4UqFAP2+fnVzu9DMc2UDGLn12Vu9I?=
 =?us-ascii?Q?J4z3RloTWu3QcqZ5YdeqD9ZlibN17/I32+ktSoux8TjpdVgiVgEoj89dyIrO?=
 =?us-ascii?Q?6UrlhV6sdFM325TAbRzt5GUQApQIHQRfyFpxJ/eHYu+5Ew1S2Q4LFsXq+5eu?=
 =?us-ascii?Q?vV/embR73QSDsYfWmLj2ddAHnycWOecB/slL0kWBrK3C7rg102lhOEnVaT9I?=
 =?us-ascii?Q?evaypl0+biTdsVESzgkEowb/htdnMTDHYgAyELr58gm/DYSCB07XeLGGSmtl?=
 =?us-ascii?Q?zfM4SSL1Qb7i5RBJhR/ZNXA2ai9ihLkcYdxV2Ix/kulhRaYxXXMZpJonfszX?=
 =?us-ascii?Q?FeFeQtuEaHChYYBciAnNUlBXp+IfSObugiqZRcI5reB9zCx75oSJ5GPGMXFO?=
 =?us-ascii?Q?BibHUU2mpOnW55klTKwyGrEmYjV+RwEPwia7wnbjgzWxxf5GFTlWvLI4uQW9?=
 =?us-ascii?Q?l6A4WtBBmKaxWT45BUeIJcPm5bPcUze0XG9Xf1gZZiM/FflvioNEUg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?lR/Q3nzu1rHVfpsfVXNZZPnvqJg1CMbrSfC/7KScDaSL2gVmtl+fwpBwTwJe?=
 =?us-ascii?Q?Bw+gHHGLx8jzsUMRcBPNKhgehZ0BVOY1FKjKx2tsIFLZNbZlnFGgie0N7qtD?=
 =?us-ascii?Q?m940KTjUXDTWBYQGyM3Fobb8jCAn50mU9O4AMZJB63eRW6P6uxSczk54guNd?=
 =?us-ascii?Q?I1b61zXZl6AjHwdtwoUTdadJww5lBn2/Bb6p0uLtBo0VzQ5tr3xME83PIoKn?=
 =?us-ascii?Q?fzAv6W3171QoWcbUOvOeJQkiWgU1VYENfPW2cieqozFt8Zf/ax22TFErZni/?=
 =?us-ascii?Q?cSHyDI6CFBP3r8dfM+x6kb2bNPwS69LGOGgEeLJqVYKyR/lpnB9/pu6VMtxN?=
 =?us-ascii?Q?pkJDq/skJZQ7aFWiRsKuuEI67jXrW8k6o+WP4UqxztVIuYWKEzIrUAhuC4Xd?=
 =?us-ascii?Q?OGwtSaGXfj82cEkDv1Px5TwjyhqeAEpUx/UXNMrUKDinHKnTACOMB6FYKUgm?=
 =?us-ascii?Q?oPsa0yCnUE0R4oJB1uvR7F1LOnDWCBlMgvrTXJ4TWp3+LLyIqBsOUVWMK71z?=
 =?us-ascii?Q?6m2IhmLS9j4iO4zLMXLiDdd+qllzj6drWF+kS+xpL0TAK0uR4QnRJRsZCbpk?=
 =?us-ascii?Q?L0haRKXHZdzwCbR0x2+v6Sad9EVO9H8bl1TzVS3fS9LiZ0nBL4JdhugrCkrQ?=
 =?us-ascii?Q?/Vl2mhhqPpJiRO2V/3qQcy4BjG3SFlJBBHJJ87icCtNAJu22v4KM5PrmnEnW?=
 =?us-ascii?Q?7ZQ2Z2jVQhmD0iVVybHw21suiaCwTaNeNeYbbzQCIOLVPJleW5qwZswsoehk?=
 =?us-ascii?Q?gs/1/TxS97acw0GDfASHFhSteNnFd3nx3AaeEchbBEkJhsv9TSH3qplHSav5?=
 =?us-ascii?Q?b4uTIlAmVfyqxZ/PcqvQUQwaInUt5mgkOyYJww/mG6La1e5wFjd4cFNSwoLy?=
 =?us-ascii?Q?YqdRVgfScAl0f0gEk1UJ/JQNBfWxbyjqzxIvLxJANQy2xtp/C5HfMwq3L4Mg?=
 =?us-ascii?Q?skhupbhQV2MolHUe7VWdZG+7ksIov6TU5C8SDWUuRygLbA0muykJr9zW3V4i?=
 =?us-ascii?Q?nZ6oRvLbRy/zdUQq9sdLeKU39nzKc/09vnw8Rsxo+HrgeocXO+wkzDqgZVIi?=
 =?us-ascii?Q?vs2SzzyF3afB3nueVysyiAwwgzt14UEfSEBEmOiAakmUwN/GYNnSMLuuKoQv?=
 =?us-ascii?Q?cexIjHJFT07Tm2mJhioqQ6A0/Z1lYuGnAflPVGTrgyDvTgVxPZeZjObr2Gu9?=
 =?us-ascii?Q?u7ncWKmub/KjbX1D5mFObVrjIic2jwMN/xCbrEb4SZI4VLoL9v4sBTzBL/1u?=
 =?us-ascii?Q?WJF/0Xsl6aOatzO4u6sYsqpP1TWoS/nJkAIPOGx4DuYjpIswlpi6va7vxBxp?=
 =?us-ascii?Q?fhTeQ+FFBGJ8UM2epaY2RhQnKpBossm73g28r0NQuIwBdlzPJ9Th9ZoQ7RoX?=
 =?us-ascii?Q?/0ni2WyntZ1uWOjICmGkOr8l4Lo7d8ehbiVEbV55stDt+l7UjoygiUTHJn/v?=
 =?us-ascii?Q?VJMubPL8rOLWv/DfpeYdZgEtCJ8gRVNl2iM7pX+34+o4Yparz2Z6uaG2zt8m?=
 =?us-ascii?Q?08Di9wjaY2Fk9X0miKi3878LOJ9vZPhtChLF8nmjupMBt3oVakvg8w8VzdqL?=
 =?us-ascii?Q?thQNIPsRw0uqtBi7rmY=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 795e8246-dbd0-4896-e0cc-08dd86235c56
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2025 07:07:38.7530
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /KXzhU1Z7JbZH5I4Ud8jfVduOxsA/4K23k5Xg6yQpLilApz/cnwhLM6GKL+ASBknPiD8By69i7kDNK+6FkeNOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8249


> From: Srujana Challa <schalla@marvell.com>
> Sent: Thursday, April 24, 2025 3:14 PM
>=20
> Add IPsec resource object identifiers to the virtio_net_hdr for identifyi=
ng
> encryption/decryption operations on tx and rx side respectively, along wi=
th
> flags.
>=20
> Signed-off-by: Srujana Challa <schalla@marvell.com>
> ---
>  device-types/net/description.tex | 50 +++++++++++++++++++++++++++++++-
>  1 file changed, 49 insertions(+), 1 deletion(-)
>=20
> diff --git a/device-types/net/description.tex b/device-
> types/net/description.tex
> index ea70c6f..8903e03 100644
> --- a/device-types/net/description.tex
> +++ b/device-types/net/description.tex
> @@ -596,6 +596,9 @@ \subsection{Device Operation}\label{sec:Device Types
> / Network Device / Device O
>  #define VIRTIO_NET_HDR_F_DATA_VALID    2
>  #define VIRTIO_NET_HDR_F_RSC_INFO      4
>  #define VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM 8
> +#define VIRTIO_NET_HDR_F_SECURITY      16
> +#define VIRTIO_NET_HDR_F_SECURITY_ERR  32 #define
> +VIRTIO_NET_HDR_F_SECURITY_SA_SOFT_EXPIRY_WARN 64
>          u8 flags;
>  #define VIRTIO_NET_HDR_GSO_NONE        0
>  #define VIRTIO_NET_HDR_GSO_TCPV4       1
> @@ -618,6 +621,12 @@ \subsection{Device Operation}\label{sec:Device
> Types / Network Device / Device O
>          le16 inner_nh_offset;   (Only if VIRTIO_NET_F_HOST_UDP_TUNNEL_GS=
O
> or VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO negotiated)
>          le16 outer_nh_offset;   /* Only if VIRTIO_NET_F_OUT_NET_HEADER
> negotiated */
>          u8 padding_reserved_2[6]; /* Only if VIRTIO_NET_F_OUT_NET_HEADER
> negotiated */
> +        /* Present only if VIRTIO_NET_F_IPSEC negotiated */
> +        struct ipsec_resource_hdr {
> +                le32 resource_id;
> +                le16 resource_type;
> +                u8 padding_reserved_3[2];
> +        };
>  };
>  \end{lstlisting}
>=20
With the outer header, vnet header is not aligned to 32 bytes.
We should try to squeeze this in relatively well aligned 32B structure.
And we have the 6Bytes space, so lets replace padding_reserved_2 with ipsec=
_resource_hdr.

Something like,=20
When VIRTIO_NET_F_OUT_NET_HEADER or VIRTIO_NET_F_IPSEC is negotiated, the v=
irtio_net_hdr length is up to field \field{struct ipsec_resource_hdr}.


> @@ -971,6 +980,15 @@ \subsubsection{Packet
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
> @@ -1031,6 +1049,10 @@ \subsubsection{Packet
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
>  Often a driver will suppress transmission virtqueue interrupts @@ -1083,=
7
> +1105,8 @@ \subsubsection{Setting Up Receive Buffers}\label{sec:Device
> Types / Network Devi  \end{note}
>=20
>  When calculating the size of \field{struct virtio_net_hdr}, the driver -=
MUST
> consider all the fields inclusive up to \field{padding_reserved_2},
> +MUST consider all the fields inclusive up to \field{struct
> +ipsec_resource_hdr}, i.e. 40 bytes if VIRTIO_NET_F_IPSEC is negotiated
> +or up to \field{padding_reserved_2}
>  i.e. 32 bytes if VIRTIO_NET_F_OUT_NET_HEADER is negotiated or up to
> \field{inner_nh_offset}  i.e. 24 bytes if
> VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO is negotiated or up to
> \field{padding_reserved}  i.e. 20 bytes if VIRTIO_NET_F_HASH_REPORT is
> negotiated, and 12 bytes if not.
> @@ -1340,6 +1363,21 @@ \subsubsection{Processing of Incoming
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
> 1391,6 +1429,12 @@ \subsubsection{Processing of Incoming
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
If you add the dedicated error code for the hard limit reached in the crypt=
o, we should add the bit here too.
Its unfortunate that we have to burn many bits here in u8 flags.
It should have been an enum.
But I believe until the vnet data structs improve, you can skip this extra =
hard fail limit in both the devices (crypto and net).

>  \paragraph{Hash calculation for incoming packets}  \label{sec:Device Typ=
es /
> Network Device / Device Operation / Processing of Incoming Packets / Hash
> calculation for incoming packets}
>=20
> @@ -3526,6 +3570,10 @@ \subsubsection{IPsec Operation}\label{sec:Device
> Types / Network Device / Device  See \ref{sec:Device Types / Network Devi=
ce /
> Device Operation / Flow filter}  for details about flow filter.
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

