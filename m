Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013007.outbound.protection.outlook.com [52.101.83.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A65238C15
	for <virtio-comment@lists.linux.dev>; Tue, 30 Sep 2025 10:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759228787; cv=fail; b=OT9pt+HY+lGxcP/GXNi22lAOOtxnvWSMegbAVqZdctuPYzsvTRPS9Ozo9wDs/rT2z/WrAaqlzbwtWeNtuSWUsfU3j+pibxhiF1+R9fI9K3SzFsgLSxx9D1EA0N5ueW9hxY18z+0oMeHsVchjxEjPlrBFZj0iX7nftDOPqyAgnM8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759228787; c=relaxed/simple;
	bh=baPOQhqxyQBxpq7sgidCs6qWCw25sBCQikdvzHja4e8=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hvgecKb0PHHDPZu+KrlX2YfUsXJwbEj7yZSvvwoH3n7oNut1+q9KI54x5ghOU2dBl/xQgYUre9ZisfA8uo3ARljr2P+gMvYYQulvG+I8bB5hTnoFleJ0ls2QF3hMZpDyhtPpqQJjnMG9vRrDHMfLDCYeFaRvZ5fhx+P3SLmH2sY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com; spf=fail smtp.mailfrom=nokia-bell-labs.com; dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b=Eg5dxLTL; arc=fail smtp.client-ip=52.101.83.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b="Eg5dxLTL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QDk8+ImB1peyePAyfCu0hzmxMOKP+ePXaA58AtiYU07oZWyvO+prJZqQxB2p1aVIF+dgcWQ0YKMbYwtRea0HQUNcS0q0XpUtdovB0Yp/uuxJ51USfUaAgB7yGXQDK5qHPP3KQ0k0lmtr5yr1tWMMzzBYwf1v4tX2+ZYXssEjzYm5eEYOALv5jvepZ1PA9YyrmC+soSdluT3RaiNJ/e3GA/hpTqnM4LKtXBG/qNSpe1MbEvb9Gmv0Q+s+1H7JttZBpptyBz+1mh2k8KE55VQrs6RnraCaVkLHMB6WMRlSP/JzrKuXrUS+ulzaivtuDUnp59IJ34DmJKfVEl13mGqf5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ByD6QVhDisCf+Eq4NcjI2qefB2S7cprnYkHz/wikCSU=;
 b=dC21Bn3V2FHEcnC+KO9c716l6eCDn2vlUtgq+NvkN/afNTrukc2T2Bm0wK90etU6eP1vJPA1XE18Sl826prWZd2B+CojNyVa1fHgdIVcUi0NqsWYD2B9uwkt6x6881A+mBe4InvNoyQK55VsPQ0Z7bCjjob+WcpE/p7xpeUzMPkiG1kOr4OcwIAC0GG5ISx9ykUQoxZVFevwZXJngFu7xOHeXYpfLRdG7gODyAgadF7RrTvezD18HS3sRkAmL1kIXJfYkw2ZiQcsoOxhIvGnEn2sql/+SOXvE9HuVVu4dH39hHSv9ylnwtRNLHI8ZpybvjJfgV3SkV16G8D5mE3Ljw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia-bell-labs.com; dmarc=pass action=none
 header.from=nokia-bell-labs.com; dkim=pass header.d=nokia-bell-labs.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia-bell-labs.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ByD6QVhDisCf+Eq4NcjI2qefB2S7cprnYkHz/wikCSU=;
 b=Eg5dxLTLnrmMtRiNhcStAz9nQwkjAHp0+pVUz4Uw3LZk4cSHfhbpUOZx0L/NajCLGj6YqDMxBxaCIOxPS0bOyqhdGf3tN5OZGl3Eaxs0Mrx6nYU3SqS6QysN8RL7sXbReepvAln6SGUCeaoupDbULmjmYFrgnrGVsXkPfYnEVYZnvaE6Csrd1pHw/zu1q4HWa+HGyI/USf1C3UaJbUnb2WzN9WW6I736IVGNeGA3LKAOKxaAVDkiVdxAjTp+8bONNiB7xOWFfX9a/oxTnSr98MXg7AGBW5MTtz/WoE+Gr54aTP5oU2/Alzmti8R4mlCo2joR7xi9k+QZDEGnTqS5Hw==
Received: from PAXPR07MB7984.eurprd07.prod.outlook.com (2603:10a6:102:133::12)
 by PAWPR07MB11172.eurprd07.prod.outlook.com (2603:10a6:102:50d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.13; Tue, 30 Sep
 2025 10:39:41 +0000
Received: from PAXPR07MB7984.eurprd07.prod.outlook.com
 ([fe80::b7f8:dc0a:7e8d:56]) by PAXPR07MB7984.eurprd07.prod.outlook.com
 ([fe80::b7f8:dc0a:7e8d:56%2]) with mapi id 15.20.9160.015; Tue, 30 Sep 2025
 10:39:41 +0000
From: "Chia-Yu Chang (Nokia)" <chia-yu.chang@nokia-bell-labs.com>
To: Parav Pandit <parav@nvidia.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>, "mst@redhat.com" <mst@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>, "mvaralar@redhat.com"
	<mvaralar@redhat.com>, "jasowang@redhat.com" <jasowang@redhat.com>,
	"xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>,
	"eperezma@redhat.com" <eperezma@redhat.com>, "ij@kernel.org" <ij@kernel.org>,
	"ncardwell@google.com" <ncardwell@google.com>, "Koen De Schepper (Nokia)"
	<koen.de_schepper@nokia-bell-labs.com>, "g.white@cablelabs.com"
	<g.white@cablelabs.com>, "vidhi_goel@apple.com" <vidhi_goel@apple.com>,
	"ingemar.s.johansson@ericsson.com" <ingemar.s.johansson@ericsson.com>,
	"mirja.kuehlewind@ericsson.com" <mirja.kuehlewind@ericsson.com>
Subject: RE: [PATCH v10 1/2] virtio-net: Fix ECN feature descriptions
Thread-Topic: [PATCH v10 1/2] virtio-net: Fix ECN feature descriptions
Thread-Index: AQHcDRMrginf6nv65kWiLWJ393AYBrSqEH4AgACeHQCAALjzAIAAY1+g
Date: Tue, 30 Sep 2025 10:39:41 +0000
Message-ID:
 <PAXPR07MB7984310A505E7EDDCA0CBFA6A31AA@PAXPR07MB7984.eurprd07.prod.outlook.com>
References: <20250814120118.81787-1-chia-yu.chang@nokia-bell-labs.com>
 <20250814120118.81787-2-chia-yu.chang@nokia-bell-labs.com>
 <CY8PR12MB7195670B68CC8F454DA821C6DC1BA@CY8PR12MB7195.namprd12.prod.outlook.com>
 <PAXPR07MB79843798615E61FA134A5428A31BA@PAXPR07MB7984.eurprd07.prod.outlook.com>
 <5f1f310d-8a17-414b-ac70-80028832a78b@nvidia.com>
In-Reply-To: <5f1f310d-8a17-414b-ac70-80028832a78b@nvidia.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia-bell-labs.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR07MB7984:EE_|PAWPR07MB11172:EE_
x-ms-office365-filtering-correlation-id: 570b607f-394e-41bd-b8b0-08de000da9b1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700021|13003099007|921020;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?Dx0HG94nWATz45JceV8rI9SR7PoYkMezrTUpyDAgG/xacMTTX+pVgkQmzcA6?=
 =?us-ascii?Q?2Wx3zR1Q12TSDhuNkXKGH98+s6DXMg2ztXiQPHia+pxgFtS7C+wt4BGd9FZx?=
 =?us-ascii?Q?aIqYC/ca/1LvFiRTwOgmu/gNCN1qJ3XC12dMT+ZSvmw9OFsjRIFPWU9qJdx7?=
 =?us-ascii?Q?+PaaPD48m7LGHCt6qe7ajDCP+cs6O8yve0WXiB6scDzB+T5A8ZbTLf/dIiel?=
 =?us-ascii?Q?DHUuQ0AbHfQNpxLkTX8i/cLNCSxiqezNJbhm0Vx1oWRppmMmkBbZPAns3Mbu?=
 =?us-ascii?Q?a1iaeXJpaeaNsmNt8x0fSdVrUKv54SMTFxzkud3/6CNtGgOWm6O5CC/NCttS?=
 =?us-ascii?Q?OWS7vq7C9a6/9FnEp1Mm2RCpJMFWT/gJdxxxWSkJsoecqXyk7Jz10Il+s+6l?=
 =?us-ascii?Q?FtuQkeMWQE5fpW1t6hTmOF16In5OqC2IrOaGhebOK4bvPPdk/kntUYbaciiD?=
 =?us-ascii?Q?LvnFvNpdhLPaJFX3jS1HTUDY67M/bJ+SQbeBxo/PI1jElio4oD7NyedIEZof?=
 =?us-ascii?Q?vPG1bYOkoR8wA673d/u83hzep7wNyIGc4yD8d0qvbH41d5h8JRM6e4BIED0c?=
 =?us-ascii?Q?ghDt7y1fO8yTSlCfrVmmOJl/wS1ygQxzKsPdp4qGgwUeoHH0K3EtrB6KSRFc?=
 =?us-ascii?Q?mPJ6usDuELkTOcI0RW8v7E3KebGypydqUge5pCv4pbh2+YAGprujoBbL9iUJ?=
 =?us-ascii?Q?+/WABYQ0VhGJpuSC88aQ8nssWb1LyoyWy+lj17zc68JaJe6Yrbtq47bxdaUU?=
 =?us-ascii?Q?NdjoH4eYGwFvktzw4P2MhGtv9aj/+j+3tmHUH5LXeh5bjhGp9Sa3hU9ZPHhy?=
 =?us-ascii?Q?O+263YJ+NzXW+Dv5m3L19DHH9l9v71Krfdi10BIQLQBwHFqX1Xfd6tcI6qFs?=
 =?us-ascii?Q?VOSygQzWv2cC0t2p9pwuSFN+fNh0C4Gpl4CfM3xPv8kOV8tzQv/arD4Pq+gg?=
 =?us-ascii?Q?3wVDoY8rz5tyYeWo1CPyD8apK8J6Y3QK/+SMYZ2/m4x+5Arw9X4HgyiwQEeH?=
 =?us-ascii?Q?8eq85RSEExXf0djxxddz9c6sLyot5SuGl4/oR5JVn6dlf84AUIqOrJxLxSLG?=
 =?us-ascii?Q?OKYmc8cObr5C3LvjdEnBChPs5fmH3s6wEyq0lpy26nVQ1jFiO2bNnc3kRgO2?=
 =?us-ascii?Q?BkVrTFB3s9Z7E/oN2Pmk1pvkrn3U10gd3xndK0wHpet0jMTP77FgPbqj1n96?=
 =?us-ascii?Q?RFV6+TT2iPBbx61BMp9Xj4Z80nIYZXFWZ/VEnFAHrjj4DTJ/SEg+D4ziyTkf?=
 =?us-ascii?Q?Wp97mv6gqbRGvfDV/nFMfZ+Py+WOu7Eq24KWMFJL099VnLqvlaNDH994mNQ8?=
 =?us-ascii?Q?xhD4BWUMPm5E8haRVq0qRbqDTGSkiwxOMFkU1BbWW5IRlZG2niXbufeL8Afg?=
 =?us-ascii?Q?IbGYgM2N7cNUx0p8lcYhHUTxdLBHeQ+sFkp/gV8IFwIbMd6hcLWOodcFyqcy?=
 =?us-ascii?Q?pyIsvxPqC9hyfZL8qTgLJlN1/zEyxduVOhLWAfNUt/x5cELpjqCVopQwTemO?=
 =?us-ascii?Q?CRFUFDusZx7tvw0=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR07MB7984.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700021)(13003099007)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?SPx5DWRQUrxnB7pACP/PHxc8XKmDGJbmuuU7S/uEcRFb8ss9aERaUI75//2D?=
 =?us-ascii?Q?cn+owhxLNFFBzuyplofF9FXc4Dmqnf+fRTae6655L4t/Gz7gSEyAH74ps1uE?=
 =?us-ascii?Q?slfNrfCFV31ewYbJ5pr11E9Q10QVsDiTFFxLK2RxgE3A/nENSr3Vs8rA7wCU?=
 =?us-ascii?Q?HJZU5S6oiYNpfcl15tCjTgA72UWiCBO4f+dHw5gG8UCdqpP7a+5xlTfxpMvp?=
 =?us-ascii?Q?FRpPHM3vrvEfiwQA+y9X1eFTpzLJDNR89JRVckEkGGqAKFVVosbVJcXqjiW+?=
 =?us-ascii?Q?Xu7XjebtQByhPbRBwI90xfR/I+dBQfUET/QXw0J2ZrVTZFOA4Bi1KsL127Nk?=
 =?us-ascii?Q?Xk+Cd1XRUm7Pb/SCmPiETmjZQOzz/Ktt5qVfiVH9VQsc/E3HW7SidS6ucDbZ?=
 =?us-ascii?Q?LZKQDGGNWEdU81i9MNRkAvWsGL5DiX+JiZyYCkL7RQqgJfHzSKGPlD+lqITQ?=
 =?us-ascii?Q?qSVOQPti7ONxoASIa8UpIJ1D9O0XaiPXHMCqYl9DX/Qm3eC7LnHDrSDsccMz?=
 =?us-ascii?Q?DdSXrdAYL+NewvBcqAaZIQPMRTYCADlM/zUiGqHYTq3jFnWlhNs9sUjVyGmo?=
 =?us-ascii?Q?VM94LnGd/zivJGPnGL/jcD1iEBqwNnNfNteh6kSWgyL065dDUrS/q8O+LNLM?=
 =?us-ascii?Q?q+Lsx+yazCdOH9aAXl22sV4Ee3SnDR/p6AaIjAxSXgn8efCN9kitcbElc1KR?=
 =?us-ascii?Q?G1uzGGBFvxcm5ymBLrpZgl5KdafWjtVcJswHbt98hQzrC48Frqj7THbxunc2?=
 =?us-ascii?Q?MDbQuz+gz5KqzIx8cFyijTSa+orp3OzhDF4nWwbWuEFTJuHvmMeaY/TwiRnH?=
 =?us-ascii?Q?RqnX4GD+YQfmKrJZPtyH5O0NJP68ru4Y3jKJuYfAIVi+hm5qRJ+16ebN80xE?=
 =?us-ascii?Q?yfhsa+KXskF+/85+/ezgJuXGkohP0t4INSJ2B1DhgTj9/tsu9dERh6ttQNim?=
 =?us-ascii?Q?KTip50dzyo9yoC7i2xcGp4CbwQO9DdGk3xgUOmJwPKUPAKoP61g2orO8PdIG?=
 =?us-ascii?Q?Z92xciPrADJNexhB5xf2yZotL9MMWU97B1Uoeq3y0KQUP/uOkGhG/WHNXiEI?=
 =?us-ascii?Q?m+cR+6MbfHNdPUSwLgqP9uwRDV1rsQSsWLm0RbLKw9O0h8Iys3f9SWTPag8e?=
 =?us-ascii?Q?GVaMLS/JwdsWHd1ebgP4ZQEVclHkCv3Gg25hbl3CRfKLfn08MbDn7Z/MF9dT?=
 =?us-ascii?Q?likuONhSh0vvD4sdNXvFgklRL91HlWprywWLqZouKbouKqaEnHKmJjCDVIpt?=
 =?us-ascii?Q?CiLB/jYsvXYvVUnB1fCUE991d4JsPYybiliCkLEtZijRiIjAWWBMZSfdV2/U?=
 =?us-ascii?Q?zUgveWVouvByUFH9FbzfltlX69s/8SY2AOccoH+ZvOJu2QHZ5CJds6Eh5RZQ?=
 =?us-ascii?Q?UBscIodivAYmsfA5oPVnmfQXg8O+ZJepW0G2lEx2ukjmF3YGvhOZJITf6Gyc?=
 =?us-ascii?Q?9tgTWM1cCeX9h4R/8Z4W0RHHSvQlRitTxQ61Ddy4Bf/yD8lXnHcztrvA4kfh?=
 =?us-ascii?Q?5Eon3HUdUdhIWSI9Y3yRIlyL5SV2kSB8HhyOD0ofS+ssD24OyKaLWUxKULUy?=
 =?us-ascii?Q?Q1JT9+HRQPyFkefY/u+Oy5nB+36bHrWFJKUzLkhda0K6W0HPfWZhRNlCW2Ve?=
 =?us-ascii?Q?Tg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: nokia-bell-labs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR07MB7984.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 570b607f-394e-41bd-b8b0-08de000da9b1
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2025 10:39:41.4534
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 10Lsaieef8ghgEZKQuy3aXUPJT/R3qTUATFvS/YEVnb1cUixxn6NwuAx6uU1iTfnUFiUk1MIxcRaYkV7YF4w8Q5vCfvVLmbHeYiyc0SrOJzFAhA/TwsX3NMfv9G92qgL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR07MB11172

> -----Original Message-----
> From: Parav Pandit <parav@nvidia.com>=20
> Sent: Tuesday, September 30, 2025 6:15 AM
> To: Chia-Yu Chang (Nokia) <chia-yu.chang@nokia-bell-labs.com>; virtio-com=
ment@lists.linux.dev; mst@redhat.com; cohuck@redhat.com; mvaralar@redhat.co=
m; jasowang@redhat.com; xuanzhuo@linux.alibaba.com; eperezma@redhat.com; ij=
@kernel.org; ncardwell@google.com; Koen De Schepper (Nokia) <koen.de_schepp=
er@nokia-bell-labs.com>; g.white@cablelabs.com; vidhi_goel@apple.com; ingem=
ar.s.johansson@ericsson.com; mirja.kuehlewind@ericsson.com
> Subject: Re: [PATCH v10 1/2] virtio-net: Fix ECN feature descriptions
>=20
>=20
> CAUTION: This is an external email. Please be very careful when clicking =
links or opening attachments. See the URL nok.it/ext for additional informa=
tion.
>=20
>=20
>=20
> On 29-09-2025 11:14 pm, Chia-Yu Chang (Nokia) wrote:
> >> -----Original Message-----
> >> From: Parav Pandit <parav@nvidia.com>
> >> Sent: Monday, September 29, 2025 9:48 AM
> >> To: Chia-Yu Chang (Nokia) <chia-yu.chang@nokia-bell-labs.com>;=20
> >> virtio-comment@lists.linux.dev; mst@redhat.com; cohuck@redhat.com;=20
> >> mvaralar@redhat.com; jasowang@redhat.com; xuanzhuo@linux.alibaba.com;=
=20
> >> eperezma@redhat.com; ij@kernel.org; ncardwell@google.com; Koen De=20
> >> Schepper (Nokia) <koen.de_schepper@nokia-bell-labs.com>;=20
> >> g.white@cablelabs.com; vidhi_goel@apple.com;=20
> >> ingemar.s.johansson@ericsson.com; mirja.kuehlewind@ericsson.com
> >> Subject: RE: [PATCH v10 1/2] virtio-net: Fix ECN feature descriptions
> >>
> >>
> >> CAUTION: This is an external email. Please be very careful when clicki=
ng links or opening attachments. See the URL nok.it/ext for additional info=
rmation.
> >>
> >>
> >>
> >> Hi,
> >>
> >>> From: chia-yu.chang@nokia-bell-labs.com <chia-yu.chang@nokia-bell-=20
> >>> labs.com>
> >>>
> >>> From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
> >>>
> >>> Clarify that the VIRTIO_NET_HDR_GSO_ECN gso_type flag does not mean=20
> >>> that TCP has IP-ECN set; instead, it identifies that the TCP CWR=20
> >>> flag is set and will be cleared from the second segment of an aggrega=
ted segment.
> >>>
> >> Above text is seems to be clarified only in commit message, not in the=
 spec changes below.
> >> Can you please add it in the actual spec wording, including requiremen=
ts?
> > Hi Parav,
> >
> > This is to fix current error in virtio spec:
> > "VIRTIO_NET_HDR_GSO_ECN is a flag within the VIRTIO_NET_HDR structure t=
hat indicates the TCP header of a packet has its Explicit Congestion Notifi=
cation (ECN) bit set, signifying congestion in the network"
>=20
> I am unable to find the above cited text in virtio spec.
>=20
> Do I miss to find above text in the spec?
>=20
>=20
> What I read in spec is:
>=20
> The driver SHOULD NOT send to the device TCP packets requiring segmentati=
on offload which have the
>=20
> Explicit Congestion Notification bit set, unless the VIRTIO_NET_F_HOST_EC=
N feature is negotiated, in
>=20
> which case the driver MUST set the VIRTIO_NET_HDR_GSO_ECN bit in gso_type=
.

Yes, you are right.

> > TCP header does not have ECN bit, and this flag shall indicate the CWR =
bit of TCP header is set when doing the GSO for the first packet.
> > The corresponding texts in RFC3168 are "When the TCP data sender is rea=
dy to set the CWR bit after reducing the congestion window, it SHOULD set t=
he CWR bit only on the first new data packet that it transmits."
> >
> > So, do you think adding above texts in the commit message is ok?
>=20
> Yes, but only commit message is not enough. We need equivalent text in th=
e description and in driver + device requirement section.
>=20
> Something like,
>=20
> When the device is transmitting packets of gso_type of segmentation type =
A, B, or C, and if driver requested gso_type of HOST_ECN, the device must s=
et the ECN bits in the IP header and CWR bit in the TCP header in the first=
 data packet of the TCP or UDP segments.
>=20

I think the text changes are already proposed below.

Or you can refer to my original email for better comparison: https://yhbt.n=
et/lore/virtio-comment/5f1f310d-8a17-414b-ac70-80028832a78b@nvidia.com/T/#m=
c1750dcc26d74c9b19939c4e86dae8bbade6ec78

> >
> >>> This is used to offload the TCP CWR flag in a way that is compatible=
=20
> >>> with
> >>> RFC3168 ECN but is problematic for non-RFC3168 use of the TCP CWR fla=
g.
> >>>
[...]
> >>> -\item[VIRTIO_NET_F_GUEST_ECN (9)] Driver can receive TSO with ECN.
> >>> +\item[VIRTIO_NET_F_GUEST_ECN (9)] Driver can receive TSO with the=20
> >>> +CWR
> >>> flag set
> >>> +    and follow the requirements of the CWR bit described in
> >>> +    ``Section 6.1.2. The TCP Sender'' of \hyperref[intro:rfc3168]{[R=
FC3168]}.
> >>>
> >>>   \item[VIRTIO_NET_F_GUEST_UFO (10)] Driver can receive UFO.
> >>>
> >>> @@ -62,7 +64,9 @@ \subsection{Feature bits}\label{sec:Device Types /=
=20
> >>> Network Device / Feature bits
> >>>
> >>>   \item[VIRTIO_NET_F_HOST_TSO6 (12)] Device can receive TSOv6.
> >>>
> >>> -\item[VIRTIO_NET_F_HOST_ECN (13)] Device can receive TSO with ECN.
> >>> +\item[VIRTIO_NET_F_HOST_ECN (13)] Device can receive TSO with the=20
> >>> +CWR
> >>> flag set
> >>> +    and follow the requirements of the CWR bit described in
> >>> +    ``Section 6.1.2. The TCP Sender'' of \hyperref[intro:rfc3168]{[R=
FC3168]}.
> >>>
> >>>   \item[VIRTIO_NET_F_HOST_UFO (14)] Device can receive UFO.
> >>>
> >>> @@ -729,9 +733,10 @@ \subsubsection{Packet=20
> >>> Transmission}\label{sec:Device Types / Network Device / De
> >>>       header (ie. MSS).
> >>>
> >>>     \item If the driver negotiated the VIRTIO_NET_F_HOST_ECN feature,
> >>> -    the VIRTIO_NET_HDR_GSO_ECN bit in \field{gso_type}
> >>> -    indicates that the TCP packet has the ECN bit set\footnote{This =
case is not
> >>> handled by some older hardware, so is called out -specifically in=20
> >>> the protocol.}.
> >>> +    the VIRTIO_NET_HDR_GSO_ECN bit in \field{gso_type} indicates=20
> >>> + that the
> >>> TCP packet
> >>> +    has the CWR flag set and follows the requirements of the CWR=20
> >>> + flag
> >>> described in
> >>> +    ``Section 6.1.2. The TCP Sender'' of \hyperref[intro:rfc3168]{[R=
FC3168]}.
> >>> +    \footnote{This case is not handled by some older hardware, so=20
> >>> + is called
> >>> out specifically in the protocol.}.
> >>>      \end{itemize}
> >>>
> >>>   \item If the driver negotiated the=20
> >>> VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO feature and the @@ -828,10 +833,9=20
> >>> @@ \subsubsection{Packet Transmission}\label{sec:Device Types /=20
> >>> Network Device / De \field{gso_type} to VIRTIO_NET_HDR_GSO_UDP_L4.
> >>>
> >>>   The driver SHOULD NOT send to the device TCP packets requiring=20
> >>> segmentation offload -which have the Explicit Congestion=20
> >>> Notification bit set, unless the -VIRTIO_NET_F_HOST_ECN feature is=20
> >>> negotiated, in which case the -driver MUST set the VIRTIO_NET_HDR_GSO=
_ECN bit in -\field{gso_type}.
> >>> +which need to follow the CWR flag requirements described in ``Sectio=
n 6.1.2.
> >>> The TCP Sender''
> >>> +of \hyperref[intro:rfc3168]{[RFC3168]}, unless the=20
> >>> +VIRTIO_NET_F_HOST_ECN feature is negotiated, in which case the=20
> >>> +driver
> >>> MUST set the VIRTIO_NET_HDR_GSO_ECN bit in \field{gso_type}.
> >>>
> >>>   If VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO is negotiated, the driver MAY s=
et
> >>>   VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or the
> >>> VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit @@ -1168,9 +1172,9 @@=20
> >>> \subsubsection{Processing of Incoming Packets}\label{sec:Device=20
> >>> Types / Network  \end{enumerate}
> >>>
> >>>   Additionally, VIRTIO_NET_F_GUEST_CSUM, TSO4, TSO6, UDP, UDP_TUNNEL=
=20
> >>> - and ECN features enable receive checksum, large receive offload=20
> >>> and ECN - support which are the input equivalents of the transmit=20
> >>> checksum, -transmit segmentation offloading and ECN features, as=20
> >>> described
> >>> +and ECN features enable receive checksum, large receive offload and
> >>> +RFC3168 ECN support which are the input equivalents of the transmit=
=20
> >>> +checksum, transmit segmentation offloading and RFC3168 ECN=20
> >>> +features, as described
> >>>   in \ref{sec:Device Types / Network Device / Device Operation /=20
> >>> Packet
> >>> Transmission}:
> >>>   \begin{enumerate}
> >>> @@ -1273,10 +1277,9 @@ \subsubsection{Processing of Incoming=20
> >>> Packets}\label{sec:Device Types / Network  the=20
> >>> VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit in \field{flags}.
> >>>
> >>>   The device SHOULD NOT send to the driver TCP packets requiring=20
> >>> segmentation offload -which have the Explicit Congestion=20
> >>> Notification bit set, unless the -VIRTIO_NET_F_GUEST_ECN feature is=20
> >>> negotiated, in which case the -device MUST set the VIRTIO_NET_HDR_GSO=
_ECN bit in -\field{gso_type}.
> >>> +which need to follow the CWR flag requirements described in ``Sectio=
n 6.1.2.
> >>> The TCP Sender''
> >>> +of \hyperref[intro:rfc3168]{[RFC3168]}, unless the=20
> >>> +VIRTIO_NET_F_GUEST_ECN feature is negotiated, in which case the=20
> >>> +device
> >>> MUST set the VIRTIO_NET_HDR_GSO_ECN bit in \field{gso_type}.
> >>>
> >>>   If VIRTIO_NET_F_OUT_NET_HEADER has been negotiated, the device MAY=
=20
> >>> set the \field{outer_nh_offset} to nonzero value to indicate outer=20
> >>> network header offset, diff --git a/introduction.tex=20
> >>> b/introduction.tex index
> >>> 80aa67a..1c4cb33 100644
> >>> --- a/introduction.tex
> >>> +++ b/introduction.tex
> >>> @@ -180,6 +180,9 @@ \section{Normative=20
> >>> References}\label{sec:Normative References}
> >>>       Leiba, B., "Ambiguity of Uppercase vs Lowercase in RFC 2119=20
> >>> Key Words", BCP
> >>>       14, RFC 8174, DOI 10.17487/RFC8174, May 2017
> >>>
> >>> \newline\url{https://eur03.safelinks.protection.outlook.com/?url=3Dht=
t
> >>> p%3A%2F%2Fhttps%2F&data=3D05%7C02%7Cchia-yu.chang%40nokia-bell-labs.c=
o
> >>> m%7C748641ab9b5646b8e9a108ddffd806df%7C5d4717519675428d917b70f44f963
> >>> 0b0%7C0%7C0%7C638948025520045144%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1
> >>> hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIld
> >>> UIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3Ddozd2qz%2Bw5gv1Iu0XzP6wvMfgxu9CM01=
8
> >>> 8edkRqC2kE%3D&reserved=3D0
> >>> %3A%2F%2Fnam11.safelinks.protection.outlook.com%2F%3Furl%3Dhttp%253A
> >>> %2
> >>> 525&data=3D05%7C02%7Cchia-yu.chang%40nokia-bell-labs.com%7C9bd29c383d=
0
> >>> e4
> >>> 96aa3c708ddff2c774a%7C5d4717519675428d917b70f44f9630b0%7C0%7C0%7C638
> >>> 94=20
> >>> 7288674229109%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOi
> >>> Iw=20
> >>> LjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%
> >>> 7C
> >>> %7C&sdata=3DvhqjeUh8%2B6VOKIe3RF5WxlMoQwNkC3CacP0C1kN60fI%3D&reserved=
=3D
> >>> 0=20
> >>> 2F%2Fwww.ietf.org%2Frfc%2Frfc8174.txt&data=3D05%7C02%7Cparav%40nvidia=
.
> >>> com%7Cc6ffebfc748f4772784708dddb2a50c9%7C43083d15727340c1b7db39e
> >>> fd9ccc17a%7C0%7C0%7C638907696998232587%7CUnknown%7CTWFpbGZsb
> >>> 3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkF
> >>> OIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DjRjpor%2FkXifPfp
> >>> t7IFBo5JNF4%2FlE8pBsw7CMT4wS%2FRo%3D&reserved=3D0}\\
> >>> +     \phantomsection\label{intro:rfc3168}\textbf{[RFC3168]} &
> >>> +    S. Floyd., ``The Addition of Explicit Congestion Notification
> >>> + (ECN) to IP'',
> >>> September 2001.
> >>> +
> >>> +\newline\url{https://eur03.safelinks.protection.outlook.com/?url=3Dh=
t
> >>> +tp%3A%2F%2Fhttp%2F&data=3D05%7C02%7Cchia-yu.chang%40nokia-bell-labs.=
c
> >>> +om%7C748641ab9b5646b8e9a108ddffd806df%7C5d4717519675428d917b70f44f9
> >>> +630b0%7C0%7C0%7C638948025520069778%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0
> >>> +eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCI
> >>> +sIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DACMLSb6oTQXGLflY1rJtEPC4f43jH=
6
> >>> +ppipO3cRipNIc%3D&reserved=3D0
> >>> +s%3A%2F%2Fnam11.safelinks.protection.outlook.com%2F%3Furl%3Dhttp%25
> >>> +25
> >>> +3&data=3D05%7C02%7Cchia-yu.chang%40nokia-bell-labs.com%7C9bd29c383d0=
e
> >>> +49
> >>> +6aa3c708ddff2c774a%7C5d4717519675428d917b70f44f9630b0%7C0%7C0%7C638
> >>> +94=20
> >>> +7288674266369%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiO
> >>> +iI=20
> >>> +wLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7
> >>> +C%=20
> >>> +7C%7C&sdata=3DAjjuXnQgsRppd33zhfiyfkIaWljEuCZR8T%2Fl8cvXby8%3D&reser=
v
> >>> +ed
> >>> +=3D0=20
> >>> +A%2F%2Fwww.ietf.org%2Frfc%2Frfc3168.txt&data=3D05%7C02%7Cparav%40nv
> >>> idia.c
> >>> +om%7Cc6ffebfc748f4772784708dddb2a50c9%7C43083d15727340c1b7db39e
> >>> fd9ccc17
> >>> +a%7C0%7C0%7C638907696998249586%7CUnknown%7CTWFpbGZsb3d8eyJ
> >>> FbXB0eU1hcGki
> >>> +OnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIj
> >>> oyfQ%
> >>> +3D%3D%7C0%7C%7C%7C&sdata=3Dq7NaQPhNzVlOz0bGZVTw5ZYWFcq412q8J
> >>> 57YHxTpkMs%3D
> >>> +&reserved=3D0}\\
> >>>   \end{longtable}
> >>>
> >>>   \section{Non-Normative References}
> >>> --
> >>> 2.34.1
> >>>
