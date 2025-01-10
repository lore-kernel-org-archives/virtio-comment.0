Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2089.outbound.protection.outlook.com [40.107.243.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D33BA205AB5
	for <virtio-comment@lists.linux.dev>; Fri, 10 Jan 2025 11:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736506961; cv=fail; b=i3YE4ZgQzACypzJTY6hO8YieXIhiXpdUPbL2rSbO2Hc9ewNDBzIEpkFPgUnwA/KbqMNKbvq+FTJIBghFUhi/W5pwnN3bEiF0BT3AA6wgpJPAOE8+lwReDFF+vA1+pfK6UZwL/D0pnuJ/oHHzLKWE0CvQz+B0DMSCxEZmfW1Z9e8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736506961; c=relaxed/simple;
	bh=RbumAQYrgvKNpQcJEZTliW08nLX2Sio6EjXkMi+/eeA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ltljY6Fhcw4TOk8c2K6HgsJXTHfO7HS8KhPYI4obGqlgaTifypWDAqNNlioBJgZ2pxxfRGnPItI6elXqIq3pG4WRZN9KQs1y4W82nMhV8heJw2fp3b6doL6VEXtXJG5av+vB2nL0wxtcLTYrzLa7/nrQYaO4Gb59Fmaoyg2gmwQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=P1us5TXC; arc=fail smtp.client-ip=40.107.243.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="P1us5TXC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nqDa1nBo9+owobgGaBbNFXwc7bFHZ+USot8P8cA3/01Es0g0G6j5W8gMjwGho3mNEMFubZlp55JqyFQbiCK084uPMRgpNQM7GZPOkPSGNgpXV4xd3Lnna/ziKk1H0fPenLk4O6zS/egGzeg548Y4xbtME5asHaYo68pcAHMF9ShhIP0KRNkuq1vgABi3b2u76Feb0100zUbwC+QT68ebXzKEJZMvfdCecep5X7QIRvOJ3JBaWgFKFfDQkoz9Gq+Fcb+gbo8ZKtwEhldNlP65+0vbLJ3GwjqxcyWkMFADrHS6Fpt4DYzO5VIsOWBvvlPczMtMjNI2X2a2PL5TDlfvdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QSyf9bHcchwMJfJLr5Nv4VS3psm3r0d9IxEjRTeHmRo=;
 b=te+DKtw1Ey8FeVeZcxCUU6DbqyJo/x3+Puzpw/nZ4DaxPPqdDUDAboV2l0Z0cWvhUNaRSavcGP/X5/Sgn2B7Zp3qXfSWAGJhmqlDzGc4N8ntmY8wfCcsdbx5ihl5KT8v+00Fwpdo1NId9S051TwlTBXGF/OZbgoqYKsCJaf0RWrUmyxW6FHzddKQWQajPROL00g01gRRRHnt+bErKkh+FNxfXoEzD6LVpOKLagtIZLlGVxV9yNCoVaEnEVoGTYdteVxOWaC5e0crqdyzbeqt6to+aI7YycJvucJ9q5UZDKh5NMvQVzvFWHM0b/ZHvOQoFWT7zwCKYJ0gxTXTMH488g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QSyf9bHcchwMJfJLr5Nv4VS3psm3r0d9IxEjRTeHmRo=;
 b=P1us5TXCGQdWjnBQ3PFCIFGc9VouDJueq5ydDsjoUAfvGpsYWuOWXAf/CY6G8KULTXwhdAytZKxWmRTRHgWm/ssTtU9ZTAqnTjxW3nfSyQ7ywNf9tXnXndKhqOvmRV3+JqHHvT66ptVf8OFNME2QPzGM3oGN7OuY91pCdy/qQlNxvIlZl+BhI3tDw3SRPI4d3mpkNb1aoLFTpfK/uIYkBdnoOvtDttjw8/9t/INd8DahaEnJAxrvBNV1jVtcfZ8Ov7YwyKqbuzJo1MyVTClWo6+NpoTgAB+4ccUBQpaxAw8XiPdKoD5O+k7gOTDXQ9LrIPplo+qqF6eqJ0UxhoXkYA==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by DM4PR12MB7600.namprd12.prod.outlook.com (2603:10b6:8:108::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Fri, 10 Jan
 2025 11:02:37 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd%7]) with mapi id 15.20.8335.011; Fri, 10 Jan 2025
 11:02:37 +0000
From: Parav Pandit <parav@nvidia.com>
To: Akihiko Odaki <akihiko.odaki@daynix.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>
CC: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
	"devel@daynix.com" <devel@daynix.com>
Subject: RE: [PATCH v3] virtio-net: Ignore num_buffers when unused
Thread-Topic: [PATCH v3] virtio-net: Ignore num_buffers when unused
Thread-Index: AQHbY0bNt06GgVty+0mM3TednpDkkbMP1bWA
Date: Fri, 10 Jan 2025 11:02:37 +0000
Message-ID:
 <CY8PR12MB71953B8E666603718CF1322DDC1C2@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20250110-reserved-v3-1-2ade0a5d2090@daynix.com>
In-Reply-To: <20250110-reserved-v3-1-2ade0a5d2090@daynix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|DM4PR12MB7600:EE_
x-ms-office365-filtering-correlation-id: 9774530b-2df9-4b17-65ff-08dd31664b1f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|10070799003|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?KV9M4hJYL5ApOPOaRtUTOid0Gb012DNyAgWQ8jUmktlxyQyIIzRVcvruAfyw?=
 =?us-ascii?Q?jWA2NJB7Urq9Fuxip1wVklgFQkggnDwVOD6PDvRo3qJtKGidHwdpgSnN+YCh?=
 =?us-ascii?Q?cDYC4IHZtfMq3fPcDogu7Cj29OlqH20NcDyEHCFjHtVRek4MLCMbCSAYNdwM?=
 =?us-ascii?Q?s+Shksag7Bqnh5DKHhvUotg/eQxtuLvObGwznmkgmH2CSS4tyoEmfoOi0nWq?=
 =?us-ascii?Q?1tsqsRSSffvbU/MuTyAA2lEnM79fjk+25fhL5nwCzqw4PcWgPBSkQ9zNQM6B?=
 =?us-ascii?Q?+lT1tsLunrYtZVtbvhI767IHRkgi76ihrFD8VMBdTZbA9sLQkMZTC8iumCDt?=
 =?us-ascii?Q?Dx7nQlhhXtCKVHrKab03cEK+6JRkY7KoLfgp2Q+/YctWUaZ7Vsp2yLh7XL++?=
 =?us-ascii?Q?FYSYFKuOtvE2hAPRLa90Xzp08qTKSZYNDQWdunoqF/U+lrJP0S4DvyvuN1Kx?=
 =?us-ascii?Q?R8ANiulETRNZeaxM8YZIac6HOe0cxoADtxYwjYF3Psc4lJ8zmQ0bNrkl5lMV?=
 =?us-ascii?Q?sMdR6b+zYk0IBTA6r1rL5aTTywMRVLwrAQpr6vpj1d9AbhDraxJl+md5cTLv?=
 =?us-ascii?Q?EO4HIYuj8F0a2bJyk7pt27j21Y2+BZ/8xrq8w/x2dVnLlVqTzjYkgVk0/fBE?=
 =?us-ascii?Q?ev8BrV+moeS/n4icQCBwK7gK73Y1plp62h1oQvxu+KZLbv8f3fmjBlDVA82c?=
 =?us-ascii?Q?OePUeQsxvqn0nlfB9S5Y+5O+sq0saBn7DRmDKACPesTYT1WfFhyLmxNDbi3Y?=
 =?us-ascii?Q?e94hSESJdLrIEcjbcLh7VH3S2/OLgM5Ah/2tiaWbNk8M0DJ1iWW2QZlcf5WX?=
 =?us-ascii?Q?QsdkQcDmztI3XYyRsVv9wDZwWfJZ9ZS/xdJXKg59rZvDOxOAgRoWkp4Ogs1L?=
 =?us-ascii?Q?K1wvsnb8XPL++ojafnyqC+hf89AisFw4JCtnWgP4uPCoEgcKkSzWdWCp2g3t?=
 =?us-ascii?Q?pHfnB3K+UexotkN0lGMu3IYJ1HN/OIv/Ldw7+OlZPtN/HOO8NVUg1OnhtXa4?=
 =?us-ascii?Q?AGxz2HUbSwc8+Q87mkbql4yx+papbHRrdDpH3RCUFNgp/YCiAbsIzRzzYfEa?=
 =?us-ascii?Q?f+AiD3NSjlYEkdwJaO4sLIHQ9fANeVKaWaXMJBQdxeIPPX1FlH/wb1D8ZMJA?=
 =?us-ascii?Q?ZHHIBWuXMj+fUagg9OJ+9XcLTlPMPQeJp/66gjifCFdN+zIWLxtBBhUydrnO?=
 =?us-ascii?Q?jaoSgFT6xGIq6tudgEmwF+k9wJOOgMYQw3JO9Cojsb1uRqBryzT266tRVKAd?=
 =?us-ascii?Q?63wFmjD0ShP/mv3xJSubaAYszzbQUP9ypNQlLTlRpu4+/Lwhij4PZSEIaGma?=
 =?us-ascii?Q?iLqxrWB4eUr8PsZR2lXRIqdrV7SYIqLq61s/8K6ropukFWWnGcl6GUNQ+QO1?=
 =?us-ascii?Q?KGPyugB9mbf2Znb01gjgenfg/9MjCYRiCSDysrdqsklUOWmQKRZ06L91Yhta?=
 =?us-ascii?Q?bCblDPcineLz2tfHKFcqAKYv1ja5kRVj?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(10070799003)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?pkFHMRSozeoVBsNa8NC9mbl3Ezziv2ZupT26sPJRpwQnMD2TYmuE/qLGWTZ+?=
 =?us-ascii?Q?cytxpECN7DgC9dk08TavnNTIZMLwnZalwgy66CG8YLA7y3M/LwPIPpACYfXU?=
 =?us-ascii?Q?I+8GWfauQgGgB+HmtIxiw/0mKDwm3ilnwDFW5EemV+uq99oZo3R/D0l+fP6N?=
 =?us-ascii?Q?TZkLlEgjAYWB2LTEhtfUV96Agnc/Y24ptm/JXlZc8uVag5SUS0a8gymatqzN?=
 =?us-ascii?Q?l1KvZjgnkqe76XpxhruVvwCRjtmO1KgT137WzKj73AP/QFrJFpbtpZBJLsGb?=
 =?us-ascii?Q?ZhvWpqOZvCcqSo0uj7+JgSe9nmi+Rj8kSxlc199Au8gXU0rFk7UO9qobWh/N?=
 =?us-ascii?Q?AueN2iLIu4Ts+fw8sKF5Oql9OIUpVkTiTRUA+oNhsCSeKKh3OaobbkRvohsh?=
 =?us-ascii?Q?ED/C6TxpQxlRozR5b6nb2H1pNAHRQnvrGuw3QZhC/Mt2xgaJ/2nttDzi6DsF?=
 =?us-ascii?Q?DpW6jWvWLIy9bFKKNf7KuRsX3/KKzslgtrc1ebBWNtS7aMdonL3PdhnQk9+2?=
 =?us-ascii?Q?grefyjG5WyVRutWguSRo9Z/p4+lZ/CL9B9DhpMCTzGtUS9gMTPD8D75qo2B8?=
 =?us-ascii?Q?Zxs2np1JskGPkYH1FzJWlfMLRv+whcsqciUv/Qbmu8NLLdb6nbVpWN+A8TkJ?=
 =?us-ascii?Q?Gayl8dh1drNo82C4ViaFB6Ex3F1G3NgfMmTLqFzUn1I1A9q+TS0QcTk5Bw8v?=
 =?us-ascii?Q?1AURBhFMa79/KpJ3Y9VPIAApJ8beKIaxo1dk9ZANusQBaP/zAKtYXOvbkKWM?=
 =?us-ascii?Q?5bD2XjuUrJwek1kgKLl41IFYCT8heXitEvQ04XNT41k5GmxOZeVYmgMZmZq7?=
 =?us-ascii?Q?hqGzVePSY9LVPNqp+A3jFtLC4p3dNTmMGOGEtl5luFxMuo29TKGHGeQaXKCx?=
 =?us-ascii?Q?NTv4IrAU01lp38V6B4HVH4p/jskxz0410sjUUmJf3Qv0wEEaWAhVhZjkR0jG?=
 =?us-ascii?Q?+jzfiwNa1s1YtgOK48IRNRUxQMsAC3NUjEfDYFuoYmR0DaaZlUhy3ypmPM85?=
 =?us-ascii?Q?Klg0hJDP3Hvj2+mZ+zA0VbkgzmA1U37xF054exPM1DhlIUoGfF77CWPRiV2K?=
 =?us-ascii?Q?Ynt7gq0ny8pX4xHz+Hy5OYEaWmO1a9rXsBB1dpNqxG1Gu5rtAwuQkuKsvV3F?=
 =?us-ascii?Q?mPK3gwimD/mmZT5Siy+IfzMJAfUxb3ouLNKDP0tUoIIEtg/4p3WgEct8TkMz?=
 =?us-ascii?Q?HwM1uRtTsEae64Tyn1FbOYeTc3C0e2zSPO5P+WCJcxqYgDYM5NhhxN/7YgK/?=
 =?us-ascii?Q?EPaamwPInfnZTwaraI4V+5HA7YcUETilo2MpITvQSCVypdS+4CbrDnJj6xYp?=
 =?us-ascii?Q?hfJftxs3ypThhcMBL7Xh9MZFMnkWJImWWUhxjTaj5V+wqbi4McTiiEDReuQ3?=
 =?us-ascii?Q?1U6EwOjpcoK8waHGSnACgGbqiUP2bB2+461f6YRcmqdIJ4/7Qgpqp1OM33C8?=
 =?us-ascii?Q?ZmEmE7eD7RUtfr8FIHM+jb60nnJ9s+VCqzLnUvaokJsxqQcuXxoS2ukaz74e?=
 =?us-ascii?Q?0cIqfGaJ23WcXDkYC+7xRgWDIxXHvCX8F9HwyDbQBvmmelnj6RHZBci+E7j6?=
 =?us-ascii?Q?qy83XqL0mPxRNW+8kpNtnlk16jkr0IwjNZZNI654XOfn49bV5b0kx3GK29jA?=
 =?us-ascii?Q?TXowZYbLP4YBNoNIek68KSbhs32vCwNVhU05DM9n5qkj?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 9774530b-2df9-4b17-65ff-08dd31664b1f
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jan 2025 11:02:37.3035
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: evRwPi7Pnaze7KFmYlyV2ymXlj99z5+7cNnqepocQ1TA5JtMt80SCgG91EKYD0zJg8DeyAHaYUcLc08+YynmZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7600



> From: Akihiko Odaki <akihiko.odaki@daynix.com>
> Sent: Friday, January 10, 2025 3:33 PM
>=20
> If VIRTIO_NET_F_MRG_RXBUF has not been negotuated, vhost_net and
> QEMU leaves num_buffers uninitialized while the specification tells to se=
t it
> to one.
>=20
> Let drivers ignore the field to make them compatible with vhost_net/QEMU,
> in a way similar to hdr_len field, which is also marked as unreliable due=
 to
> implementation bugs.
>=20
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>  device-types/net/description.tex | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/device-types/net/description.tex b/device-
> types/net/description.tex
> index 76585b0..7c065f6 100644
> --- a/device-types/net/description.tex
> +++ b/device-types/net/description.tex
> @@ -863,6 +863,12 @@ \subsubsection{Processing of Incoming
> Packets}\label{sec:Device Types / Network  This is due to various bugs in
> implementations.
>  \end{note}
>=20
> +If VIRTIO_NET_F_MRG_RXBUF has not been negotiated, the driver SHOULD
> +ignore \field{num_buffers}.
> +\begin{note}
> +This is due to bugs in implementations.
> +\end{note}
> +
Better to say which side bug initiated this note,
So saying below makes it more clear to readers.

This is due to bugs in device implementations.

>  If neither VIRTIO_NET_HDR_F_NEEDS_CSUM nor
> VIRTIO_NET_HDR_F_DATA_VALID is set, the driver MUST NOT  rely on the
> packet checksum being correct.
>=20
> ---
> base-commit: b495841a8e80d12c1130f8868f4128866291142d
> change-id: 20241226-reserved-d5960f173223
>=20
> Best regards,
> --
> Akihiko Odaki <akihiko.odaki@daynix.com>

With above tiny suggestion,

Reviewed-by: Parav Pandit <parav@nvidia.com>

