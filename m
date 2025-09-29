Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012052.outbound.protection.outlook.com [52.101.53.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4550A2AEE1
	for <virtio-comment@lists.linux.dev>; Mon, 29 Sep 2025 07:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759132062; cv=fail; b=emg0k+ZZxFwR4+jXM5akbeX+R9c78Bi9mc+m7fTsaQ/6uzo4WQChSsaaFeX+QLaca5+dZisqogVaK0ADteTNdf+IMeEo8bm9sQP6z7TzRstEj2daowQD9k4QffjjjloXGUm0WvqqVn8xdYdVT0+elyEi+SCSj3CvR/+v9QqLuhA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759132062; c=relaxed/simple;
	bh=DEzlrk2o0IWQWjpHCIN5AbpEmeyjsOOBT+0GvpPhThY=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=fXJ6bKI1gyEnDipqB8HfeNaxZHxFydNY4RYk1RdoT6I/xLZKX/cy4tZz+aCTpuiiaHj0HSeCgO2WlKDEPGHmM24s2Gb7GnmRDWmB1dNPPzARa7c9WsOK/6+tXoHoDgvFeG3cLmJZg1By6GASgj2Ckn1Lvqsei7LkNz9BIkYwxA8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=QXuEuOuu; arc=fail smtp.client-ip=52.101.53.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="QXuEuOuu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TVz0+SNYR6vkVs0QcJhnZT6MHm1IGAD23oTw1f4FAZTErjfXTTfTpv7b9tdByjWZj6/xzOLom9U+0AQsAvKUpgDfdIDl6QzLVCi/CCwz6dVIxtNY7A0mzXGM3C9eX6Yun7KnZ65yY3N+EmEjKgUN3CJTpoQobh+LnY+fRlUjXrAoysZ7HWV0lWiqUC5nsX/UH9QvXYvifgxwsi9Leh4DE6vaHQXhWSmI9wfWR0wAlB1nDe/wSYieYjFJU6//nO4Y0FchwOqkLV2cpKj6lFs6zTD6EOEHfcTuvzwqaxFOJo5BJPER76FCE0nczcPYN971FFvy9oDLNnv2tFKtgH9lqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4jiQgkrn8ISOoszGfJytMjVVfUwivLr8eRshncYG8nI=;
 b=mu2BAyKeybmmqs6T5qY7DZNRtLe2yFWgq5r+pw8wntXThJRdYLJav+K8qeUQVxv5zx47MuVya0LiLZGCGnwLvvin4Iry4xRfFytZjnTDZTa6lVstrsAGJg+4yKyn2Oi7/vp67mQPagIBlTN1iSJOFLI/sWnoEICoJrlAM8tHO2rC9yKDKW+o6nLOWmh1FGHX3H6U3evktQGk493+EXji736nJOdgZVvQ09Onr8jyqbluszCtyqSKu+kw9Cpar6Omff+3x0hgEE2KL8GgDVB7ywfHBKc4Kfqs847R8D6vVRJHKSw4BvtNshqGW3Pu7/bjspBduhwyo31MjealLuP5cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4jiQgkrn8ISOoszGfJytMjVVfUwivLr8eRshncYG8nI=;
 b=QXuEuOuu+3CsECmzlDddaL/dHnpIoVbPK6aQLSVj1MTdRiF3tP43OanHBWYX2V/emJ2+9tv9bvW5GTU++InRNQu8m4eL8ClKZtxkw3OB2dRWQAiWzhSOBI/AOpCuh2T2WDvjNc4t3bVcFPOZ8B5NLEsZF/WpHJ6Ig30HQHesgiuTB/vb9WKTyHK2kYlci/XPvyHyMWUT6eS3va7IAX3kgOiZbP1uYPEUdJpXV0CV6pytwPTtQa3R4/6OmEvDTFonvhesv2UlfKVtn9RYYoiPf3Bhu75UZ6Xqb0OvCqPHhvMZAOPyicPyVvbCGtPCzXrNoKxQ4Sc54F0eTsPXmOSOOA==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by DM6PR12MB4076.namprd12.prod.outlook.com (2603:10b6:5:213::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Mon, 29 Sep
 2025 07:47:36 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::e571:5f76:2b46:e0f8]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::e571:5f76:2b46:e0f8%5]) with mapi id 15.20.9160.014; Mon, 29 Sep 2025
 07:47:36 +0000
From: Parav Pandit <parav@nvidia.com>
To: "chia-yu.chang@nokia-bell-labs.com" <chia-yu.chang@nokia-bell-labs.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"mst@redhat.com" <mst@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>,
	"mvaralar@redhat.com" <mvaralar@redhat.com>, "jasowang@redhat.com"
	<jasowang@redhat.com>, "xuanzhuo@linux.alibaba.com"
	<xuanzhuo@linux.alibaba.com>, "eperezma@redhat.com" <eperezma@redhat.com>,
	"ij@kernel.org" <ij@kernel.org>, "ncardwell@google.com"
	<ncardwell@google.com>, "koen.de_schepper@nokia-bell-labs.com"
	<koen.de_schepper@nokia-bell-labs.com>, "g.white@cablelabs.com"
	<g.white@cablelabs.com>, "vidhi_goel@apple.com" <vidhi_goel@apple.com>,
	"ingemar.s.johansson@ericsson.com" <ingemar.s.johansson@ericsson.com>,
	"mirja.kuehlewind@ericsson.com" <mirja.kuehlewind@ericsson.com>
Subject: RE: [PATCH v10 1/2] virtio-net: Fix ECN feature descriptions
Thread-Topic: [PATCH v10 1/2] virtio-net: Fix ECN feature descriptions
Thread-Index: AQHcDRMxc7D2+BxJGUa3jiZ0uZVtV7SqECZQ
Date: Mon, 29 Sep 2025 07:47:36 +0000
Message-ID:
 <CY8PR12MB7195670B68CC8F454DA821C6DC1BA@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20250814120118.81787-1-chia-yu.chang@nokia-bell-labs.com>
 <20250814120118.81787-2-chia-yu.chang@nokia-bell-labs.com>
In-Reply-To: <20250814120118.81787-2-chia-yu.chang@nokia-bell-labs.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|DM6PR12MB4076:EE_
x-ms-office365-filtering-correlation-id: 93bc4a99-d736-4dab-07eb-08ddff2c7521
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|10070799003|921020|7053199007|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?Fb0p0TKfnALzfWxnM2bk7GEg3rb9v2glXLHdfltQqKtvlCU4rsClvsbo3uUN?=
 =?us-ascii?Q?/HYd/k3QQqBPNZ9PqJYRb999Em4Qo+KVlsVkrXh5le+hBjgiBH7aVuvMFbQp?=
 =?us-ascii?Q?oLwbVEXda/tKcPXbg24KpZTllQ96p+gvKrZYJ/u9hiwqt0847kj3f4y7EiEL?=
 =?us-ascii?Q?Y87F1dC8m01Br7rV9xHvaMffAYyuwVUGrZlO43kaj2H3Uh/Ql0pP6LWfqK9R?=
 =?us-ascii?Q?sPgAGk7+TYwOsgECda/aGV/jNnC4BJ62J/GuoSHKgvsijDzRJoMXbFeMX9K0?=
 =?us-ascii?Q?1jR6Jxm7W8Ch5IsyPF5D+2eotYLSIjTOXz/H0p9DETbSoNl4bx7RtlwHYeOh?=
 =?us-ascii?Q?+UgBWwwe6p5uYq+qqVhPjJa2DVuQ63e+uQOnRtpqak8TjoDLLYUWQSOYcfem?=
 =?us-ascii?Q?yaEYrow9Csktkv9c0YzrFM1gefJLbs21fPGI61Yo9hmpuhIEstRncG0tX7cG?=
 =?us-ascii?Q?en81gik5SPfYstT2Z1JXBxw2XaJsBeQGw3LFd7/geNVa2mqmn0WX7otUBJjH?=
 =?us-ascii?Q?fg2sz+OcU9iq9E8bwGGGvoHWZgfe+6YCblGDxSClDW0FDcv/eS0GAoTrvZQr?=
 =?us-ascii?Q?ENd0yX+qCJxUKiEWElxg204jXPyX7eh4EKR1Koj55AsmzuhtM7cNbMXWqX31?=
 =?us-ascii?Q?P6rkzrxIwxBrtlvrryOWVCnBEcb59cGCEZ3cB0Lb9/hqbhzgoPXb/kCbAakL?=
 =?us-ascii?Q?GGJobbtpePACbhuwTu9kHVJutGIBhy1Qcep/zY6mWsCPpYrKWoqFEY1cLzC2?=
 =?us-ascii?Q?dMx/8IMZIyeDvO0wS6jyqmIfoPIa3FBMG1+ElDmafC0B9kDNTdHyT/dBzUlE?=
 =?us-ascii?Q?pq8htGd3TNScPcwSJChRhGsl+wLve44wk1gn2d/xOoSBmJYFezMZnFTzRHeO?=
 =?us-ascii?Q?I5rd9fyh9ce/0xX2+QBzZoNMwmZiZBJ3xbVJD36R/uV96SF/6UwwcYbOjgoy?=
 =?us-ascii?Q?Sg7UEyxEHlbOV2R3ADgJg+7a6yES2+/KxLHQHG5c0d6yfrSZdxBcdYe/7udm?=
 =?us-ascii?Q?X+gROGvIzHguo6NArHX7Le2nImwxIJA3dfchHmXhG8ukMez8mDdGG6LtXisg?=
 =?us-ascii?Q?7Y2C10fwpQsaXq504lWw42AIqPV969p2paNIiXDanc2+3a9IOaFfWtzBhYmW?=
 =?us-ascii?Q?N9xwIFZhi2FT8xyHJP2vgGNlJaHVjIgYIY1gBMWhvO1gLYqbg5Oa0LOBhoCf?=
 =?us-ascii?Q?37QPdGQX6NMX0qi6luxBfiMM6AFEujSGVkUU4AngO0NnuuyhTvaIQyGkU5OU?=
 =?us-ascii?Q?Ft9YAdAUEF4uCBapVIpX51XT8YMs7d7FEvqaCmeWvVjEvcCNGHJMFuy1peLT?=
 =?us-ascii?Q?lqVIHF4vjAwXL0Qkn0G3KZMWSoIPz+Dp8LZ8VOPZ0wmnLjbD9ojTqQk5hWYy?=
 =?us-ascii?Q?d0VL6jE0Ih6NxAX26ewB0SfBVdxpMSIbUjFhVYszh7MXOxeh8+G35Iv+zGRa?=
 =?us-ascii?Q?9lwqXV5YpnQQ8ku23o1Ge+Di9I998OigezQNl/J/PLmdrB2HTGcUxbScB7jU?=
 =?us-ascii?Q?JoXy2y3ElBLtMLw=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(10070799003)(921020)(7053199007)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?MYFONNhvfHRPYr+2JyE69nQRkbk841IikCRDDSnb72pbJ4q7pGC7wy+kR8U/?=
 =?us-ascii?Q?bGqlSdqD5VVg9c4UCXbh4JPQRVtQFcfPftL7IhK2QlKyWLAf2wzqU6cQSxfn?=
 =?us-ascii?Q?TCHDuKxE5cddQIF0FS4NgJS2yPsLZYfX2jDZazFMhWH3URTk9hZr7ZgJra+A?=
 =?us-ascii?Q?QaWU0RsaE2jZYGYNKnvxLWgn5T9aS/ScU1kfrS2GIHwftJRVWNB+ERtXhGzZ?=
 =?us-ascii?Q?V/i5OA6UoqoF97U2MGDprDHaHO22olodAkRvAJLnCmlXlBCgAMhic4b8uKAX?=
 =?us-ascii?Q?bgsmNINBcP6NyLFvzqOKDVy+C/pRq0ShVx0p2O++ePWDoreLkkxrgjEjBpqF?=
 =?us-ascii?Q?7X/Td4CxrAFhx3iLQoWnts6LWljpbGOE9MtBy1fdx3icmzxs6UX5IYaChY1C?=
 =?us-ascii?Q?IYfC1ZVoF+plbbLGnbs4XgTa/klQdV+IFfiU32IKZbyxDipW887gGlZMGuOc?=
 =?us-ascii?Q?I94//MksdEZWq+8nYA+qwE1IfMUQNkarIY4aZLKJ1vM70UnB+VC1TXTj8cpt?=
 =?us-ascii?Q?glfz70Pw5G+AqdpSF1ncTRbcffFyxjwodRXSYcSocQ+mOFwnnV4fWhx+QdhL?=
 =?us-ascii?Q?LCpMbHpphh5vBmZLlqGBqZPIhnYND1UEYC6MJs/rZl47mtmjWbXeW368tFoT?=
 =?us-ascii?Q?HdGZwT7tOSspJDO3zCShatcazs4YDIs7WlMC3HB87InBmYmfhfEbrmbEcMpH?=
 =?us-ascii?Q?E6XGM6opqbbozxdX2FKtoqTy6hJVANb8dXc7h5+avgYPOBABz39OmHoaguej?=
 =?us-ascii?Q?e05JiwIugJQprCkSQJVfQnPky4j8VHnsSAD9VVn2T1MuZh46/JX8sNEoI9CG?=
 =?us-ascii?Q?mQTZdkKvK/5G+6oKtdU5puE0W/qOtIgcujm4wwvZJn1ms2dnqYRtOHHUbx/z?=
 =?us-ascii?Q?ljJxsYwOraDRayKeDKPD7hA8WyJlhuOl5ZwnIJzDQGKZo2R0csv/YTesx96x?=
 =?us-ascii?Q?+mIjs29vN3v6lSUZTd9YKk7jYoJ1G1W6VHEtmsTnkt+mI/UDLaQFJXAtv4V0?=
 =?us-ascii?Q?6mEC39ToVmFWqZbgwq+gk+VxfswfE7DRsEh6zJOJfkPq/YmkojyEnhA+PSyj?=
 =?us-ascii?Q?CqkQYksaP0ILV9zOKaPA5X0PaQEfgJ47B98B7+EYPNP6fFftEzE/rJeSqZtq?=
 =?us-ascii?Q?PiTEkZA9cRz6uQkUgSkpOa3dqeVeF+CWcHSRZYOK1+nRcBRIKC9jJEZX4F/p?=
 =?us-ascii?Q?fD53cHe2BTnOvd4wH4GuEMC9JXI93DYaD7sCJ5x2pCRfWHClZwRbsRM8L1BZ?=
 =?us-ascii?Q?ODl2wfIj0LYHGcX7e4t8e0yyCQ3WLqV5gfjbtgf/DrPfE1KeX+LVCAcpUrbw?=
 =?us-ascii?Q?2hCk90+0PNVqcgCPNqvHQ+kSFAfmk2ramaadPiJ/RJgh5U+k+pRFUs9qlWpy?=
 =?us-ascii?Q?VWGOzhC7dF6fvsynNmTasTFVRk4NZnusQuuLTN+sxTLRwqos2/tG1AmAng4H?=
 =?us-ascii?Q?QzabzNV9oN3X8KbumOshk3MtQkQLd/gp6toGVxhY3licG94xJvPHLo1wURrl?=
 =?us-ascii?Q?FTnoLIRikpclYMhNlp8OveC7W2npDOyZleIat5hudizTeXaCx3NYaYnBvcun?=
 =?us-ascii?Q?DGHx0VcIuw7KoHmHBTUB74BAq+hD8cDPvGL5yFdMOYeHg/uNZEe/1wv9X9pW?=
 =?us-ascii?Q?oFlZ4qgw75nx41mU3Qs5sjmOK3NhjbrBFYrRJUX2LQV/?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 93bc4a99-d736-4dab-07eb-08ddff2c7521
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2025 07:47:36.5093
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QTnXMPVcZLLPCuxA476wTi3xhICm+Fmu0zZqJvOz8G/mc/iNyUsAJkpuzTSpvgJWthLr0sEmx2IXeOHsYiXCTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4076

Hi,

> From: chia-yu.chang@nokia-bell-labs.com <chia-yu.chang@nokia-bell-
> labs.com>
>=20
> From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
>=20
> Clarify that the VIRTIO_NET_HDR_GSO_ECN gso_type flag does not mean that
> TCP has IP-ECN set; instead, it identifies that the TCP CWR flag is set a=
nd will
> be cleared from the second segment of an aggregated segment.
>
Above text is seems to be clarified only in commit message, not in the spec=
 changes below.
Can you please add it in the actual spec wording, including requirements?

> This is used to offload the TCP CWR flag in a way that is compatible with
> RFC3168 ECN but is problematic for non-RFC3168 use of the TCP CWR flag.
>=20
> Foe detailed requirements, please refer to IETF RFC3168:

[..]

> Signed-off-by: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
> ---
>  device-types/net/description.tex | 35 +++++++++++++++++---------------
>  introduction.tex                 |  3 +++
>  2 files changed, 22 insertions(+), 16 deletions(-)
>=20
> diff --git a/device-types/net/description.tex b/device-
> types/net/description.tex
> index da9ff17..0da8f9f 100644
> --- a/device-types/net/description.tex
> +++ b/device-types/net/description.tex
> @@ -54,7 +54,9 @@ \subsection{Feature bits}\label{sec:Device Types /
> Network Device / Feature bits
>=20
>  \item[VIRTIO_NET_F_GUEST_TSO6 (8)] Driver can receive TSOv6.
>=20
> -\item[VIRTIO_NET_F_GUEST_ECN (9)] Driver can receive TSO with ECN.
> +\item[VIRTIO_NET_F_GUEST_ECN (9)] Driver can receive TSO with the CWR
> flag set
> +    and follow the requirements of the CWR bit described in
> +    ``Section 6.1.2. The TCP Sender'' of \hyperref[intro:rfc3168]{[RFC31=
68]}.
>=20
>  \item[VIRTIO_NET_F_GUEST_UFO (10)] Driver can receive UFO.
>=20
> @@ -62,7 +64,9 @@ \subsection{Feature bits}\label{sec:Device Types /
> Network Device / Feature bits
>=20
>  \item[VIRTIO_NET_F_HOST_TSO6 (12)] Device can receive TSOv6.
>=20
> -\item[VIRTIO_NET_F_HOST_ECN (13)] Device can receive TSO with ECN.
> +\item[VIRTIO_NET_F_HOST_ECN (13)] Device can receive TSO with the CWR
> flag set
> +    and follow the requirements of the CWR bit described in
> +    ``Section 6.1.2. The TCP Sender'' of \hyperref[intro:rfc3168]{[RFC31=
68]}.
>=20
>  \item[VIRTIO_NET_F_HOST_UFO (14)] Device can receive UFO.
>=20
> @@ -729,9 +733,10 @@ \subsubsection{Packet
> Transmission}\label{sec:Device Types / Network Device / De
>      header (ie. MSS).
>=20
>    \item If the driver negotiated the VIRTIO_NET_F_HOST_ECN feature,
> -    the VIRTIO_NET_HDR_GSO_ECN bit in \field{gso_type}
> -    indicates that the TCP packet has the ECN bit set\footnote{This case=
 is not
> handled by some older hardware, so is called out
> -specifically in the protocol.}.
> +    the VIRTIO_NET_HDR_GSO_ECN bit in \field{gso_type} indicates that th=
e
> TCP packet
> +    has the CWR flag set and follows the requirements of the CWR flag
> described in
> +    ``Section 6.1.2. The TCP Sender'' of \hyperref[intro:rfc3168]{[RFC31=
68]}.
> +    \footnote{This case is not handled by some older hardware, so is cal=
led
> out specifically in the protocol.}.
>     \end{itemize}
>=20
>  \item If the driver negotiated the VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO
> feature and the @@ -828,10 +833,9 @@ \subsubsection{Packet
> Transmission}\label{sec:Device Types / Network Device / De  \field{gso_ty=
pe}
> to VIRTIO_NET_HDR_GSO_UDP_L4.
>=20
>  The driver SHOULD NOT send to the device TCP packets requiring
> segmentation offload -which have the Explicit Congestion Notification bit=
 set,
> unless the -VIRTIO_NET_F_HOST_ECN feature is negotiated, in which case th=
e
> -driver MUST set the VIRTIO_NET_HDR_GSO_ECN bit in -\field{gso_type}.
> +which need to follow the CWR flag requirements described in ``Section 6.=
1.2.
> The TCP Sender''
> +of \hyperref[intro:rfc3168]{[RFC3168]}, unless the
> +VIRTIO_NET_F_HOST_ECN feature is negotiated, in which case the driver
> MUST set the VIRTIO_NET_HDR_GSO_ECN bit in \field{gso_type}.
>=20
>  If VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO is negotiated, the driver MAY set
>  VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or the
> VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit @@ -1168,9 +1172,9 @@
> \subsubsection{Processing of Incoming Packets}\label{sec:Device Types /
> Network  \end{enumerate}
>=20
>  Additionally, VIRTIO_NET_F_GUEST_CSUM, TSO4, TSO6, UDP, UDP_TUNNEL -
> and ECN features enable receive checksum, large receive offload and ECN -
> support which are the input equivalents of the transmit checksum, -transm=
it
> segmentation offloading and ECN features, as described
> +and ECN features enable receive checksum, large receive offload and
> +RFC3168 ECN support which are the input equivalents of the transmit
> +checksum, transmit segmentation offloading and RFC3168 ECN features, as
> +described
>  in \ref{sec:Device Types / Network Device / Device Operation /  Packet
> Transmission}:
>  \begin{enumerate}
> @@ -1273,10 +1277,9 @@ \subsubsection{Processing of Incoming
> Packets}\label{sec:Device Types / Network  the
> VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit in \field{flags}.
>=20
>  The device SHOULD NOT send to the driver TCP packets requiring
> segmentation offload -which have the Explicit Congestion Notification bit=
 set,
> unless the -VIRTIO_NET_F_GUEST_ECN feature is negotiated, in which case
> the -device MUST set the VIRTIO_NET_HDR_GSO_ECN bit in -\field{gso_type}.
> +which need to follow the CWR flag requirements described in ``Section 6.=
1.2.
> The TCP Sender''
> +of \hyperref[intro:rfc3168]{[RFC3168]}, unless the
> +VIRTIO_NET_F_GUEST_ECN feature is negotiated, in which case the device
> MUST set the VIRTIO_NET_HDR_GSO_ECN bit in \field{gso_type}.
>=20
>  If VIRTIO_NET_F_OUT_NET_HEADER has been negotiated, the device MAY
> set the \field{outer_nh_offset} to nonzero value to indicate outer networ=
k
> header offset, diff --git a/introduction.tex b/introduction.tex index
> 80aa67a..1c4cb33 100644
> --- a/introduction.tex
> +++ b/introduction.tex
> @@ -180,6 +180,9 @@ \section{Normative References}\label{sec:Normative
> References}
>      Leiba, B., "Ambiguity of Uppercase vs Lowercase in RFC 2119 Key Word=
s",
> BCP
>      14, RFC 8174, DOI 10.17487/RFC8174, May 2017
>=20
> \newline\url{https://nam11.safelinks.protection.outlook.com/?url=3Dhttp%3=
A%
> 2F%2Fwww.ietf.org%2Frfc%2Frfc8174.txt&data=3D05%7C02%7Cparav%40nvidia.
> com%7Cc6ffebfc748f4772784708dddb2a50c9%7C43083d15727340c1b7db39e
> fd9ccc17a%7C0%7C0%7C638907696998232587%7CUnknown%7CTWFpbGZsb
> 3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkF
> OIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DjRjpor%2FkXifPfp
> t7IFBo5JNF4%2FlE8pBsw7CMT4wS%2FRo%3D&reserved=3D0}\\
> +	\phantomsection\label{intro:rfc3168}\textbf{[RFC3168]} &
> +    S. Floyd., ``The Addition of Explicit Congestion Notification (ECN) =
to IP'',
> September 2001.
> +
> +\newline\url{https://nam11.safelinks.protection.outlook.com/?url=3Dhttp%=
3
> +A%2F%2Fwww.ietf.org%2Frfc%2Frfc3168.txt&data=3D05%7C02%7Cparav%40nv
> idia.c
> +om%7Cc6ffebfc748f4772784708dddb2a50c9%7C43083d15727340c1b7db39e
> fd9ccc17
> +a%7C0%7C0%7C638907696998249586%7CUnknown%7CTWFpbGZsb3d8eyJ
> FbXB0eU1hcGki
> +OnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIj
> oyfQ%
> +3D%3D%7C0%7C%7C%7C&sdata=3Dq7NaQPhNzVlOz0bGZVTw5ZYWFcq412q8J
> 57YHxTpkMs%3D
> +&reserved=3D0}\\
>  \end{longtable}
>=20
>  \section{Non-Normative References}
> --
> 2.34.1
>=20

