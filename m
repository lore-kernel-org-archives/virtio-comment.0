Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2068.outbound.protection.outlook.com [40.107.96.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B42442913
	for <virtio-comment@lists.linux.dev>; Sun, 19 Jan 2025 07:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737273401; cv=fail; b=cXSyA7ecZhxKrMoM750wT7i0OE5gW+ZqEhME+c7rlpAcWMAYk0r5spNkrSroBwegUJNEl32cGX5Ak5yJ02ZPi9wLEuS9O5YHoKs6SLS1a1Hp+tnhR0P4Y8eiPjIcPoKkFcJaHIuV1QCBAhf0aRNqifXUv/J0NwjEhBKq04wDVSo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737273401; c=relaxed/simple;
	bh=Al+q9foIxd8LO2KshT6lUgWFtvtO2Zx45sbJb0fyKY8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kI3mufg1ubPxBzyTf883XdVu9SuwPahCzkL3wqJZanO0QIem+K/7gQPttWqy0dhJ7VxxkiEjaGZPGvFqH7BGVjr0v70uLTnhzwa6AFMp1QTgMf2BEs3N+E/HGmcWi/HojUvsURbII+LhAC06xmd4pNuMPwNhVHAjHR20VztN3OE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=qMZu3OCl; arc=fail smtp.client-ip=40.107.96.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qMZu3OCl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DMAmoMwXqmRrOR3U5hCxnpc6bxeMX4Ta/lGzS7YMTv/3lbYUVXwGG/7UmHYV5DVQeEKoqlTDF6h/YfBkwAFE99iiWehalnrtyly++8MGmtgJkSRRBwAT3idqeB5k1MkewniXNrVM1sR3H65+5DyE80PpAONcWgy7Pv6aXsA+XWvBMzkb2N1va5JmdaUE6eOOtC3CXsT96zi9eMRx4gYlDuz0H+fKYkxl2PCq8GtxIizXB/flqMC2wTgNkj19HFxnGEu8JT4evi+rzUS3eDZmy6fGFnR5oEDw1u5eQS7B477P5tCzvXmnPzfTY6igBeSZ756UJAMl5N8N71WOMLKuKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uUS81EiC/on610ZTRUuXGXefVQbIu43Z/CbGBop3o9w=;
 b=mHOt8/8Wifqa8GA1blMuuhQTwQ9uiGq1r08hRuybdzPm5QPxiZhX7f1aB5EqfkBZvppPoJVlUaAIKk+XvDOWB+StGe+AGAnfE2fW0EhNdp3wpCeD4lch+IEZJww/T9JIpfzT/lbaFNYG4HN2cWlnFpjy/Ni2QSCcykrq5GWqybV6QKdpvE8vZJabfXCRpHJ3aBdd6MKPpoQg6gYCbjJWNfUeOoJ4JYq1zOME07wZhz7XPekYxV0XYnmbttClqulSh3XlD1wybIcWqJ7WwrQ/qQFzDrrAVNGMiK3F3pjnMV6DClzA0yzrmCTU3j7TWPW7AB/ysw+aviZoSIAA96IXmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uUS81EiC/on610ZTRUuXGXefVQbIu43Z/CbGBop3o9w=;
 b=qMZu3OCl3DtjWFY0ODafcPpXxFbxfuRTt+iU5TyulMy/AMyPhjicXCZEYNUQcvHonNJqcaHHF5bE9gWjqH6iHa0kcaio9xmB7LmCfcsuI4qxvpWRgu2MGqo5iSbmkvCd7NZDeq6Yk6LQfVf5A2jkrlkw/34TSQEXOzWqk7D9AS6fZqLhhHZ3ylJfxiHwWCC078ef27uU/mb82Kc7xMHhpncjYfibCvOR41/2NuECRHW4WnQ8u4s/1+Kc//KMFiOHF5KR7XY34CDEweL2szevpOl4ZO6tJ28POvlDxdJ5FwurYkx/EIVasOMjCdrlvlXsqXVNVIH7pfPYMdAecl9yGg==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by BN5PR12MB9464.namprd12.prod.outlook.com (2603:10b6:408:2ab::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.19; Sun, 19 Jan
 2025 07:56:36 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd%7]) with mapi id 15.20.8356.017; Sun, 19 Jan 2025
 07:56:36 +0000
From: Parav Pandit <parav@nvidia.com>
To: Paolo Abeni <pabeni@redhat.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>
CC: "maxime.coquelin@redhat.com" <maxime.coquelin@redhat.com>, Eelco Chaudron
	<echaudro@redhat.com>, Jason Wang <jasowang@redhat.com>, Stefano Garzarella
	<sgarzare@redhat.com>, Willem de Bruijn <willemb@google.com>,
	"kshankar@marvell.com" <kshankar@marvell.com>
Subject: RE: [PATCH v11 1/4] virtio-net: clarify NEEDS_CSUM semantic for GSO
 packats.
Thread-Topic: [PATCH v11 1/4] virtio-net: clarify NEEDS_CSUM semantic for GSO
 packats.
Thread-Index: AQHbQK/wRd2OC0GE70+Xu2t0AY89ELMeDdyw
Date: Sun, 19 Jan 2025 07:56:36 +0000
Message-ID:
 <CY8PR12MB7195A663DD24B71B65973D9EDCE42@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <cover.1732699986.git.pabeni@redhat.com>
 <81034d9f4b12f7bd7aa6f7f5266cb6d551d0823c.1732699986.git.pabeni@redhat.com>
In-Reply-To:
 <81034d9f4b12f7bd7aa6f7f5266cb6d551d0823c.1732699986.git.pabeni@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|BN5PR12MB9464:EE_
x-ms-office365-filtering-correlation-id: 4561007a-fd48-4a47-6b84-08dd385ecc43
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?JDdrMMLoCgnsGlOzaceSDtwgBDxdPgzXAvlhN2Xit8nfuCcrOz5HwnVCYwXb?=
 =?us-ascii?Q?S0T3a7RkZy0BFvg5OUFkW59BxdD/upK6XwHF67q+M0Fut/M2NT6twJcwsr7J?=
 =?us-ascii?Q?IpnMssLGWBKfUeiYVkEtahEtXdBsmT2j5ovtl0VfBjRM9SjrQlALQRHzu0rW?=
 =?us-ascii?Q?9MPu9zM4BgcznQPwVuZIrdxtHqPgUb5LQxbPJXlb6chrgGqujIiPCQnO/lzn?=
 =?us-ascii?Q?KEoaWFtnEjKaBsxW4dfMRikLkLwsXDqal3orL5fxPZ0KPcQvsgIg88qjDsEj?=
 =?us-ascii?Q?Cl1iSLErJEN8wyvceS2EV6AezNlbclYzPfIjeb9+M+zGyfN5yz6+fJ9DWF/n?=
 =?us-ascii?Q?97FMTP4de6ciElJKFX2YH71M/rIBMtra8uniyRbIqnXg2qZ6GdfEMmmxvb8j?=
 =?us-ascii?Q?5bt15NAz8O3vU/QcQePUZgpT9Ug5FKtFvDPiXk8tCsDQ5cUzjnBiyLgCkznQ?=
 =?us-ascii?Q?sRuCeReso3Nx99lpNo5FQ4HuSD8I0IKXfzVr75KmN+FBfXBaOMilooxwW82U?=
 =?us-ascii?Q?pmX2TCfKrns8JwiUl2x5cSmrwi5MnrQjSB+uG/dA4t267RdoIV286uKwrdrr?=
 =?us-ascii?Q?S1uvcRfrJL35n5E2iI01USJvdwtzdwg4bM54N68f3R2zHdNerMCCV+VZUgIt?=
 =?us-ascii?Q?1KwGDK9clXCFG89e2Ucj20vJjwvyxkPRrSMc9uUsauHTXJBAHG00NBwoHOty?=
 =?us-ascii?Q?r2DshRFo/BrXBtJ/LS0ei8e0xX/P4LZmFaSOooVzOvTNYXhgusHg6TjLG8iS?=
 =?us-ascii?Q?Ekc/0HpMz8TXm4eEjhXfebi4PQlQsd2wG485Q80+2QXZnq025Up/DBshhFex?=
 =?us-ascii?Q?rAtmUEPiKcdiFWwmDis6jUhGfhNodZaxTnjq29BJIB5SJvUNne7t2xNg/fSA?=
 =?us-ascii?Q?LiFv8zpWiBesJBmNZQ+0dPi/vWkKvTy9TSwtEZWdCXLNZkX5yb2ON/cpDSRA?=
 =?us-ascii?Q?PfiAxkh73ZkKVdbmf+FxjMJ+7mhkENqYvUtHUuWgtXziCWxiLI2KC81HA+gO?=
 =?us-ascii?Q?MERVtPDwsq7gLnGWC4ki8VuAVl57OVWW9z6fU1FCj/oCvU4qoPC6OEf2x0G6?=
 =?us-ascii?Q?/T5230n3h6FgfaNbhnGmG5Z4laZ87awrwibLjUOmhmImQWJmEgrDafdQITxQ?=
 =?us-ascii?Q?oywIT5jHrM3jh1aeuahDvCLvIkyn1SZhbnT4aBlOKII+zK34bfZp9ozSqoon?=
 =?us-ascii?Q?N98FSnkS10ZbZoc6nkiQ65uBFpHj5A1LGRvKqvsEi309iY2bF3M56arEIVNN?=
 =?us-ascii?Q?v8dSzujdKZEeV5vkrOe1Ipf+kHYk260lLMZvX5vzPmzMOeHAecHcMLVt4GdD?=
 =?us-ascii?Q?DpuGhi2ZInnbjlslbaFU6pRC6NsPDa+BoxWUk8mZ5JK0UGfEMNGr4tUPtBoE?=
 =?us-ascii?Q?QWO5WTNRp47C9OTAQX49+sxpAMSRHpV0FidhIOIO4DRfOjNeURa4tlBAhNmI?=
 =?us-ascii?Q?1+0iQygng/S8DPuRdmR9GMq7sgy8U0v2?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?pcCwayvNEzcHPGrZmKuatYIPzJ0vp4Ua8gpihAPi0vG54cHIzQprEuMoRs4h?=
 =?us-ascii?Q?j801RWU4D0nmpdC5zNWniEyafBNHGUXw7bAeoS2n/PWnTEzVogRa+3ycZEzJ?=
 =?us-ascii?Q?1xb+61zxZmpsadVEAYAMJXJH4ASvtEvwO7XYbjeCW2g8brSrXweZ1vlBq1Sj?=
 =?us-ascii?Q?QVQyO2K9TmjYScq3jaDq3gv0FoJJsvAtpgrl07wrtEiZ/K8ywJFkYFC0SMn9?=
 =?us-ascii?Q?7drAUGvXHIrBqHYY4kM1HrB9MWzi8Fqh+bYdcw5QJFy1qTc4+V2X11MgTeEB?=
 =?us-ascii?Q?X3TI7iSDq6pM6bVvBSpv3NsNXJLX+LNjhlSKKHNA2CQlvXNbzLlCU49htVoN?=
 =?us-ascii?Q?YBcJu1Ax7sPQs1hk1Oulm01ToSOB6Ei3LINa/nqIWBBv16fcY74w+XISA8a+?=
 =?us-ascii?Q?q4BuIoy3ZRl35jpAZ665dyoJvDRZ8ios2Ea+kV5lYYXzL3F35TSMlp5DDXlS?=
 =?us-ascii?Q?ycdwfoYBfYOf9tT8kE8qStq6Q71tNi2NM5IbSVFryztyNXnr/d1KNIrqSBvo?=
 =?us-ascii?Q?wUEz63NcMus3p+msX4BgywienNClm4sxLV9neOzIm+PDvTNszRJH0g2aY/Wb?=
 =?us-ascii?Q?iN7Cbla7heoNtptnI1bJJ3FJojyialseEJPQv22v/xCtd899+f0cxbqHgE+N?=
 =?us-ascii?Q?AT02QzdmRrYRrHRX0HCZVKspBFLdwrGxqtyNav5dKm5q3Vs0oSBmibmASUML?=
 =?us-ascii?Q?uRYqy27zmeZNQkIkfVLfN06TntEs2BVgSJpIfOXgWuT9DTOjJh3hh9CXgjlX?=
 =?us-ascii?Q?7OVzaXZdeM0vV7m7cG6a9/nYx+MOj+cmAEI9A4ZCa4CpY7WvQtOSzHcgbIjl?=
 =?us-ascii?Q?lg2rpo6qDe9geCNs95asGM5mWB1o37+wlvA+oULa3vUkESXP5edLOSWIL/C7?=
 =?us-ascii?Q?pb1y6Vk+cjNzY3XT+oBj4bH24UgKZmeMyajPzHs4GXvwnYrJHYvVXnqr6oV6?=
 =?us-ascii?Q?PDVntghX7Bfz2ZM8DYFOnu1VQyUVa4lwcSx7fwOghWeVMatyUWve3QC+cqE/?=
 =?us-ascii?Q?hpyOHbX30qE5lWDORa+Rm5iqKMqTlXdcGXWKLunfQmLGk5QMBFosr+2TXqZQ?=
 =?us-ascii?Q?RbGyEhetSU9w3tMaPbBSz9OjqGgEDMA6sQ5TsoDwRZDyOFtkbjiv9vUKXpBM?=
 =?us-ascii?Q?Be7TGyVqzTlOtNW1leHyKvcPEjcONxN++17jT/23mL/jXdLie5UMQ+NB8Bc1?=
 =?us-ascii?Q?8nHWCidzSPUN31G72JHyVxh72N7t0wUUCERL38CKedO3vRNS26cEGXlNpGkP?=
 =?us-ascii?Q?LvICd7rM/ypa+zzI51LrdZ7qxoDvQ697ujzVT+omkaM3piyR85MPpNreX3h+?=
 =?us-ascii?Q?ZpXN3S8jTTaFlS/1T+Kx9RqVI7zmkyR0wV/3XPhi48kLcA/5ADaq9fkktcL3?=
 =?us-ascii?Q?8EBLUrABXJ254s7D97dLTr8sRQGPX52xH1f5wZK4NwzEVOOOBOdBuVQegS+V?=
 =?us-ascii?Q?wOKjQtPvr0jHsJ5bknnnSRTQkjo3LM3J/AZSx/D48lz5sXOKih5jJf9FTr+w?=
 =?us-ascii?Q?5zOcQEACNaabvgVCqGoudCjJBMR2SsciMp5dfPrRcl79QNlqUnFrLKUApwP0?=
 =?us-ascii?Q?dq3Uj3Bh+7TvQsgQUv8=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 4561007a-fd48-4a47-6b84-08dd385ecc43
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2025 07:56:36.1120
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wPxV9aWPUx6pV4OvzZIcl6rAH8s2QLcZJHCd9aNe6MwtUeJ8lV5Vvh/448VxQr+U8pLus2QVPTBtgQxLpaICgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR12MB9464



> From: Paolo Abeni <pabeni@redhat.com>
> Sent: Wednesday, November 27, 2024 3:07 PM
>=20
> The current wording is a bit unclear hinting to possible additional neste=
d
> headers. For GSO packets virtio net (currently) supports offload for the
> checksum of single transport header, explicitly state that in both the dr=
iver
> and device sections.
>=20
> Signed-off-by: Paolo Abeni <pabeni@redhat.com>
> ---
>  device-types/net/description.tex | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>=20
> diff --git a/device-types/net/description.tex b/device-
> types/net/description.tex
> index 4e4ffdb..3434a31 100644
> --- a/device-types/net/description.tex
> +++ b/device-types/net/description.tex
> @@ -695,6 +695,11 @@ \subsubsection{Packet
> Transmission}\label{sec:Device Types / Network Device / De  \item the dri=
ver
> MUST validate the packet checksum at
>  	offset \field{csum_offset} from \field{csum_start} as well as all
>  	preceding offsets;
> +\begin{note}
> +If \field{gso_type} differs from VIRTIO_NET_HDR_GSO_NONE,
> +\field{csum_offset} points to the only transport header present in the
> +packet, and there are no additional preceding checksums validated by
> VIRTIO_NET_HDR_F_NEEDS_CSUM.
> +\end{note}
>  \item the driver MUST set the packet checksum stored in the
>  	buffer to the TCP/UDP pseudo header;
>  \item the driver MUST set \field{csum_start} and @@ -895,7 +900,11 @@
> \subsubsection{Processing of Incoming Packets}\label{sec:Device Types /
> Network
>    if bit VIRTIO_NET_HDR_F_RSC_INFO is not set in \field{flags},
>    then \field{csum_start} and \field{csum_offset} indicate how to calcul=
ate it
>    (see Packet Transmission point 1).
> -
> +\begin{note}
> +If \field{gso_type} differs from VIRTIO_NET_HDR_GSO_NONE,
> +\field{csum_offset} points to the only transport header present in the
> +packet, and there are no additional preceding checksums validated by
> VIRTIO_NET_HDR_F_NEEDS_CSUM.
> +\end{note}
>  \end{enumerate}
>=20
>  If applicable, the device calculates per-packet hash for incoming packet=
s as
> --
> 2.45.2
>=20

Reviewed-by: Parav Pandit <parav@nvidia.com>

