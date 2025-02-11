Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2087.outbound.protection.outlook.com [40.107.243.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD56265617
	for <virtio-comment@lists.linux.dev>; Tue, 11 Feb 2025 19:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739303766; cv=fail; b=jnZ95z3jXbUgnq7XA1uKs0C6Y1kBDfVOw8dqIj+BBnQdDm3hxVcmk8fooQTx41cedwHNCqbzVibiEse5xUmJ18QGZtc3aK+WsFrzxBvPgn383SPC31CYV3TBpqZbWQaCJWFGp0v5G3ipuINp2HOE4ylKrr5J4eqSXKRmWV778do=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739303766; c=relaxed/simple;
	bh=5+oWGT4N1ckTEUJ7iTSi6VEetATTITDBRFB0Sp4fOs8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=L/xrht1H44cAeqYaLXiNz4HiULq78P0rVJT0Z/khpdWD/9f5kO1OsG/ddKnExgCNamDFbp98Uno67rsCPzoyxIlfw+YZtQYuyZ8WTYKYwYCeWhGcDWUxVzClP53mxoUC8uizNhXGIdalyGl/k1enOiN2sVthEPtAeg8AQGzRKHs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=qfbCD9YU; arc=fail smtp.client-ip=40.107.243.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qfbCD9YU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QqHTZnQ6DC3CNV/M4WaQq/kxN8muHv8vgwJhbt3e2jTarptvdtWW7mp/PkTwEdEfviNEFDnpQr9pjmBsDfNih5kGTFbpJq/g1cwz4mrx7SHlQ+UUB9XR/p/6t8S4rHfJ2TuTEl+B//YaYD18dE/YD8CwyU7vVHh3ZrZ5+mr46OtdTAJqxjPyAFNNfIDySvCXouqEp5GOyiThKqfB4E3E+LzlHvThdZvWL7VOn3qfpp3XSJJxOr3xbg2tIwdVdCbDngqMxwp4GYE6K/WdqWZQHmbhjBP1d5VwihagE9Uuc0s1FZ24zBUb8HGVyeflUwyy93fYGcN9OPGQtswUB/ah1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XA4/2EG3/1bWMZC5aZJphRzdIcQNjp4MjkqBF4MYrxg=;
 b=E8Z92JmvyhSSxcuD+B/ZjkmSsL/hGJ8RorY/zuu80RFF+Ziv6WVfPzE5J53DNgQLf/EnX+6mfP/eSEdA1x8ibkkWwNZDS8ySLtm3NfKC5Hj046C/+EX5SjQ/EbdseEM7LOyxDmwEOQqhekXtDCorhLfs4fF6/6F+oK7E5JDrAanDGgTClFNGLEi44292usj3oPW9SUdqckGSSl0+71SrOhqlYaL4LhaxOZYc+ZRhIhM6Az/jKIDLK3K/OdBmUbykHbZRJRmlt+U9OX2b1OGQHEaIqbZKppur/lODbl9ZSUMBoR4TLm0nY83KDVoR1gDPpMdLCZv6bNkyCtuEiHylDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XA4/2EG3/1bWMZC5aZJphRzdIcQNjp4MjkqBF4MYrxg=;
 b=qfbCD9YUgCHGfj9wR2Lz7BpsNeJwPUzww3az64A/sPQdyUho0kBYUtCSvUPdMpdcVbzOh6aTHmTZyW3T/QJOOAroG4g+0FCCvA7Wih7oAPiT8kFp7qSPDuoMsXzMayrAV7l4ZCr2g1GaudhUDj9Fq0eEdZ3JW1Zx76Q2ho3/pCsfllZ+oYCPeZ2HWrdocenaom6WtZqj2vV2xfr5bx8CoAdrsmM2ml40HA+v2u9banH+zP0X0bELfaL/peHmba0/EY7VVdxojN8mAN4Ai5DTXR5BvmhyXfmSyWENl0YzSQJeO9I0sbVt6DKiyztoBRgE6XGYPI8AAmI7TLAeQnPtKg==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by CH3PR12MB7716.namprd12.prod.outlook.com (2603:10b6:610:145::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.11; Tue, 11 Feb
 2025 19:55:59 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd%3]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 19:55:59 +0000
From: Parav Pandit <parav@nvidia.com>
To: Srujana Challa <schalla@marvell.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>
CC: "mst@redhat.com" <mst@redhat.com>, "pabeni@redhat.com"
	<pabeni@redhat.com>, "jasowang@redhat.com" <jasowang@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>, "ndabilpuram@marvell.com"
	<ndabilpuram@marvell.com>, "jerinj@marvell.com" <jerinj@marvell.com>
Subject: RE: [PATCH RFC v2 3/4] virtio-net: extend virtio_net_hdr for IPsec
 support
Thread-Topic: [PATCH RFC v2 3/4] virtio-net: extend virtio_net_hdr for IPsec
 support
Thread-Index: AQHbbJX2oVymKtDINUuspTbVPslsxbNCocUQ
Date: Tue, 11 Feb 2025 19:55:59 +0000
Message-ID:
 <CY8PR12MB7195C4BDA6AFA7573657D04CDCFD2@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20250122062144.266725-1-schalla@marvell.com>
 <20250122062144.266725-4-schalla@marvell.com>
In-Reply-To: <20250122062144.266725-4-schalla@marvell.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|CH3PR12MB7716:EE_
x-ms-office365-filtering-correlation-id: 8e0a5617-558f-4199-fbb4-08dd4ad61b15
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|10070799003|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?6rrsSJYPaRqzdOHyLUW+iKu7Q8oM0EFOCDmRNBlMDh4lyiPZajsOjQG4VxCe?=
 =?us-ascii?Q?fPL5K8xR5EOHDMWLJi8SqXgTSbBZB8BHA1LH0oQojrNnr0RHRdgXbOD0x/vK?=
 =?us-ascii?Q?tF8NyqYdtSQGDVkWKyphaidM4o5ubYv97gZVyYd/lwWymnyDsBzMn00OEuMP?=
 =?us-ascii?Q?QtVFl0v5c/esXcXyLvrpE965ItS3s058odR+bgZSZnRd70paUmHzJhXe2FOQ?=
 =?us-ascii?Q?OO+Df07RPiQqVud8ltWQwiMSeJ4TmSLRoYF9kfSJ4O3TjE5FIXSv0AbUjRGt?=
 =?us-ascii?Q?BCZtMuzUj9eNDkjrjycUiROWd+x25ljlZBbREgz+KBxFn7R9kl2GWJ+6697y?=
 =?us-ascii?Q?rCPl++2ZzUjUUAHTZSss8ROvPUYj8lvr2xgkgQD0zEElk0xQISfgkE/oOzWo?=
 =?us-ascii?Q?aLZrv+XVwQBN89uOWzDiymtUvsbqJ0U2qWwMYh57INSKhKtE3YEneOtOgnud?=
 =?us-ascii?Q?j4/8gPxSkCdKjhVpJNxtPfqKmvX8bYgKU3KZFlK4qR8z2Lt2QVkIb+ayn+Xq?=
 =?us-ascii?Q?UIxkITURt6aZ4jc4gSqr0b69DVNUh8Bf3/egXYe2ryqZDC5sZk0aija3mFwn?=
 =?us-ascii?Q?pi+BPLocHUCAqHW7w7UMcuz+FWtlcKR1VThAYuSIH2ejjEPtoxRX/UiwghkI?=
 =?us-ascii?Q?Mo08WyNsh2dMRg654crGw7ob33pQi1+f9o4SgDVpN2G105XHglgBcFCYMVPl?=
 =?us-ascii?Q?hUpfCmCQMXp4+LwlHbC6hKyuS2YXNACq9Sze/hDCjGhSW0HYJrceiNLTfILL?=
 =?us-ascii?Q?dIkRtcL6NXAH3kKyfCwxllhO4NQPRcAHJwB5mq/aUQembNP8TnkhfQogYC5j?=
 =?us-ascii?Q?ZvORm7OAlGpe5Z/w/NkieDOuzNFjujFX1m3oMnepqlZkFg090RBt87NNI5Ao?=
 =?us-ascii?Q?fZC57pyUJIkiV7772JEKqne1g3chZzsa4W295jWqAarSgrHRxVCcNonronJq?=
 =?us-ascii?Q?GmY/GYE0sEyLxN1tDJANtPRI3IkkXeOCKACSDMkBNpkQ2zzoYUXpq5coqCEu?=
 =?us-ascii?Q?xNNxSjxHR/EgpIERabKmReZKlnVZwpqhwcxEg9/YrAax1NYXk1VWRV4EFNvb?=
 =?us-ascii?Q?NpEZwuJ4uXMrC7OvwWKqXl9gryn+IKqlmdf4B4V6pR5rJGBNKSZGDaQ4B7VE?=
 =?us-ascii?Q?HuIkFF/xRTwBKFOef+2tsfRBP+8IaRCRGWS1YfqLitS8LWNWUSS1DqVIJe7t?=
 =?us-ascii?Q?TVbmswICv4GtEp8tUKSgr5J3z4VfEhP/bZiDTf307n7/amEDuLG+FqeK7qKO?=
 =?us-ascii?Q?aPqCmpqRktq5LKSSAcg/oPt0MQ0gMXRUlaHcwX+BKsj363uB5RrSN2bfIqBS?=
 =?us-ascii?Q?FoesrjM7YU51fgfgMfZINqKhpIWT36a/bhCENNvfm8rVJWpC6QTXCrxUlHcs?=
 =?us-ascii?Q?ZyhbtToR3eDMglk+EBq3+6AwFL28m1iECdoL0P5pMh8YsEunqbnElG5NdZjH?=
 =?us-ascii?Q?XFxYhkVaM1U1x89I7yaPCpU/id+O1jL7?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?z/wTghVoHiZazop4O+A22/aU9tLurLSjgx5fBINggaf5vqt2BZxuQKSmRd6J?=
 =?us-ascii?Q?gzlqf21M/NLq6Z9JFLcvWU+pjU3PerqiArDehN4+qLWSFm2zY5Y5u0KxNLuC?=
 =?us-ascii?Q?Am1enTEruCTvhSd7drL8XeV3IMD+e5fZzTOxmap7IK0ELU+DGz0yzmk31Q8e?=
 =?us-ascii?Q?VF/Z8fQ3dlxe68kVDaswwt17p2lQh6AR4TNwSarlpuCVLT99S7EjD+ft8Aeh?=
 =?us-ascii?Q?oUj2fLA6VP/Qn/8549ssXHPMg0un2UyFehp+5wDEgMEwRN4dGFZP8GVQD3PP?=
 =?us-ascii?Q?tgTEGvxcV6S/tWKSg/Ye1CgCP/QRzJDljJjoDsbs8huqADqFmBskEu6J7chq?=
 =?us-ascii?Q?e8ZXDr+To54Jp601h1Brq58fOekTVk2Crs9Vze9eki6n56CIHDvVnIGk1zd/?=
 =?us-ascii?Q?wDxR17NvcwQjNZ0lzhW4Ua0SZ+b7kw0gltncuv8HbMqkTx82w+oXMEBa02Km?=
 =?us-ascii?Q?5dJs2oLApDsqZebN5ogMEgL9H9duHKAXIdDMJG8DI7Qa9qWPurbfnoi07fQQ?=
 =?us-ascii?Q?zVmlqiltgRDd0G2+aazDXWviJcXjJyF6LN0YYNKJs64D/SSXD1/lV0RDVDul?=
 =?us-ascii?Q?nyx8m5TuGhir1OzXCAS/lfLy1NS0z/I9cCmiUOwOgnmA+bIQnDZ3N7ehkbSJ?=
 =?us-ascii?Q?pYG58IqZS0xVgvdo8BuWFc/jCyv5ox86s2cjoT85Wze/feOCAuZvdHx2eQHP?=
 =?us-ascii?Q?jTTolFTftdjnKa4v7epuqz5e+4drswoTHLTwdGzs9LhOLmA9SGe+P/fGCQ6n?=
 =?us-ascii?Q?VeAP/mopoxjPq6lNXmR3rbFiEJh2CtTuZqu0mau+fPYhTa2w50X8tvjzQW+g?=
 =?us-ascii?Q?K8L2zAGhrFtdjvJx/ecb7bs7S/4rppVaGpjjnzHcNaiZ716MnnEcuGTK0zE9?=
 =?us-ascii?Q?PhgYBeR1GM2wb7fqUm7SyS51hGeHM4QTx6m9lXNf9kTrDzEtN/c0B2s/hKG0?=
 =?us-ascii?Q?6M7uW+JHqSXDCyGAhMiZyld7JfAiO6jZbpGG4RZV8wlia4LZmBV1UIPD5X8o?=
 =?us-ascii?Q?+sRtJmGw2oUIFL3EtygBZaeUNsoLyzm4jxM5iDv7ICysbeaH/JS8hDTT7k8E?=
 =?us-ascii?Q?nR9A6Qbelu7cPu4d/fLymBYUlUfX3ZfaPl6SWeJbcm9TJCubdQTIWNhwaiGw?=
 =?us-ascii?Q?kGSHmjRNooehFnbFaLNldFHft8WPq17kra2VX5uEM5/lcbKk+6a4EgH03AdF?=
 =?us-ascii?Q?czRUPy0GiwWkh0GUj75coc0M0PQhUL2m3FTC9PKX1t/pnJBpVYBLaKDF36Tr?=
 =?us-ascii?Q?3Cp4yQ8gqS8ZSpZAviUI7/OW86Y6O4+XLG0cgjUhtmSirD4ARPUfdQwaAPaq?=
 =?us-ascii?Q?DomVT3U8nDN1IwsOWs0bZatG1vWE49isr5COrKO/xqQPhWmju1ZLJnrEOrfG?=
 =?us-ascii?Q?4q7VEteJWn/h8AmtAJVtn1gANONnoxk+rAYdASfaIEgMOTvMbVGABg/AnxnU?=
 =?us-ascii?Q?fyKsBCV7EMtue8+lez7llzlwooNuumHu+ssZB0oK6GxiN5Ihr5iCO3gbCHcE?=
 =?us-ascii?Q?9Pzd+xhhY54BsUKo9zq6S12kAxpgpVo4VQluD28pztsJmYQnnkEQb1IRA2gW?=
 =?us-ascii?Q?ITgg17/tBYluq/2R4IxhXqwwI60iOV1OAIbMyRYquMY5ZpuuTogNYFo3Fri3?=
 =?us-ascii?Q?TYhOSQSe3wc2Xb8NHlGygow=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e0a5617-558f-4199-fbb4-08dd4ad61b15
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2025 19:55:59.4319
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QUIJAN+St0iJJujc36+WdS6ELicKI7XZm7rwL8+Lc85BszBgCMDs5oB+u2LyvtI6oIPAV/zOnL7OQTb9x2RhUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7716


> From: Srujana Challa <schalla@marvell.com>
> Sent: Wednesday, January 22, 2025 11:52 AM
>=20
> Add IPsec resource object identifiers to the virtio_net_hdr for identifyi=
ng
> encryption/decryption operations on tx and rx side respectively, along wi=
th
> flags.
>=20
> Signed-off-by: Srujana Challa <schalla@marvell.com>
> ---
>  device-types/net/description.tex | 44 ++++++++++++++++++++++++++++++--
>  1 file changed, 42 insertions(+), 2 deletions(-)
>=20
> diff --git a/device-types/net/description.tex b/device-
> types/net/description.tex
> index cef109d..3616917 100644
> --- a/device-types/net/description.tex
> +++ b/device-types/net/description.tex
> @@ -455,6 +455,8 @@ \subsection{Device Operation}\label{sec:Device Types
> / Network Device / Device O
>  #define VIRTIO_NET_HDR_F_NEEDS_CSUM    1
>  #define VIRTIO_NET_HDR_F_DATA_VALID    2
>  #define VIRTIO_NET_HDR_F_RSC_INFO      4
> +#define VIRTIO_NET_HDR_F_SECURITY      8
> +#define VIRTIO_NET_HDR_F_SECURITY_ERR  16
>          u8 flags;
>  #define VIRTIO_NET_HDR_GSO_NONE        0
>  #define VIRTIO_NET_HDR_GSO_TCPV4       1
> @@ -471,6 +473,11 @@ \subsection{Device Operation}\label{sec:Device
> Types / Network Device / Device O
>          le32 hash_value;        (Only if VIRTIO_NET_F_HASH_REPORT negoti=
ated)
>          le16 hash_report;       (Only if VIRTIO_NET_F_HASH_REPORT negoti=
ated)
>          le16 padding_reserved;  (Only if VIRTIO_NET_F_HASH_REPORT
> negotiated)
> +        /* Present only if VIRTIO_NET_F_IPSEC negotiated */
> +        struct ipsec_resource_hdr {
> +                le32 resource_id;
> +                le16 resource_type;
> +        };
>  };
>  \end{lstlisting}
>=20
> @@ -655,6 +662,15 @@ \subsubsection{Packet
> Transmission}\label{sec:Device Types / Network Device / De  The driver MU=
ST
> NOT set the VIRTIO_NET_HDR_F_DATA_VALID and
> VIRTIO_NET_HDR_F_RSC_INFO bits in \field{flags}.
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
> @@ -686,6 +702,10 @@ \subsubsection{Packet
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
>  Often a driver will suppress transmission virtqueue interrupts @@ -738,8
> +758,13 @@ \subsubsection{Setting Up Receive Buffers}\label{sec:Device
> Types / Network Devi  \end{note}
>=20
>  When calculating the size of \field{struct virtio_net_hdr}, the driver -=
MUST
> consider all the fields inclusive up to \field{padding_reserved}, -i.e. 2=
0 bytes if
> VIRTIO_NET_F_HASH_REPORT is negotiated, and 12 bytes if not.
> +MUST consider all the fields inclusive up to
> +\field{ipsec_resource_hdr}, \begin{itemize} \item 28 bytes if
> +VIRTIO_NET_F_HASH_REPORT and VIRTIO_NET_F_IPSEC both are
> negotiated.
> +\item 20 bytes if VIRTIO_NET_F_HASH_REPORT is negotiated and
> VIRTIO_NET_F_IPSEC is not negotiated.
> +\item 20 bytes if VIRTIO_NET_F_IPSEC is negotiated and
> VIRTIO_NET_F_HASH_REPORT is not negotiated.
> +\item 12 bytes if VIRTIO_NET_F_IPSEC and VIRTIO_NET_F_HASH_REPORT
> both are not negotiated.
> +\end{itemize}
>=20
>  If VIRTIO_NET_F_MQ is negotiated, each of receiveq1\ldots receiveqN  tha=
t
> will be used SHOULD be populated with receive buffers.
> @@ -908,6 +933,13 @@ \subsubsection{Processing of Incoming
> Packets}\label{sec:Device Types / Network  checksum (in case of multiple
> encapsulated protocols, one level  of checksums is validated).
>=20
> +The device MUST set the VIRTIO_NET_HDR_F_SECURITY bit in the
> +\field{flags} if the packet is gone through the IPsec processing.
> +Otherwise, it must be cleared.
> +
It MUST be cleared.
I think you want to add, that the bit is regardless of setting SECURITY_ERR=
 bit.
> +The device MUST set the VIRTIO_NET_HDR_F_SECURITY_ERR bit in the
> +\field{flags} if any error is encountered during IPsec processing. Other=
wise,
> this bit must be cleared.
> +
>  \drivernormative{\paragraph}{Processing of Incoming  Packets}{Device Typ=
es
> / Network Device / Device Operation /  Processing of Incoming Packets} @@=
 -
> 930,6 +962,10 @@ \subsubsection{Processing of Incoming
> Packets}\label{sec:Device Types / Network  VIRTIO_NET_HDR_F_DATA_VALID
> is set, the driver MUST NOT  rely on the packet checksum being correct.
>=20
> +If VIRTIO_NET_HDR_F_SECURITY bit is set in the \field{flags}, the
> +driver MUST treat the packet as an error packet if the
> +VIRTIO_NET_HDR_F_SECURITY_ERR bit is also set in the \field{flags}.
> +
'error packet' is vague.

I think you want to say that when SECURIRTY_ERR bit is set, it indicates th=
at the device experienced a processing error on the ipsec packet.
It need not be 'error packet'. For example, a particular SA was not offload=
ed. So vnet_hdr will have both bits set.

>  \paragraph{Hash calculation for incoming packets}  \label{sec:Device Typ=
es /
> Network Device / Device Operation / Processing of Incoming Packets / Hash
> calculation for incoming packets}
>=20
> @@ -3063,6 +3099,10 @@ \subsubsection{IPsec Operation}\label{sec:Device
> Types / Network Device / Device  See \ref{sec:Device Types / Network Devi=
ce
> / Device Operation / Flow filter}  for details about flow filter.
>=20
> +Note that there is a small race condition where a SA object might be
> +destroyed while a recieve packet is still inflight. The driver should
> +handle this situation appropriately.
> +
s/should/SHOULD=20

>  \paragraph{Device and driver capabilities}  \label{par:Device Types / Ne=
twork
> Device / Device Operation / IPsec Operation / Device and driver capabilit=
ies}
>=20
> --
> 2.25.1

