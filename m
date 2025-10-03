Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013028.outbound.protection.outlook.com [52.101.83.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307BB221714
	for <virtio-comment@lists.linux.dev>; Fri,  3 Oct 2025 11:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759492570; cv=fail; b=I3ozHJP8AddAUmrFPZ2K8CUiNmDAAEapSY+LJE+qDEF3xvfSIex68pURdU5eOogkslJ5JDQEVjlBBoJYJkJxM/hMXO+jkjTmvjAbZ2jRw8Pc1bsuAt+SZESiMSDEloejNdTm+Qarg+q3fYUMZtJt8T7w8jw6wqkfytI4AAwKhuQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759492570; c=relaxed/simple;
	bh=3/e1eQcyAG7VhGktlwVFJLDurYVe2LGFMjjeFY+Im5A=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FZPQlrCrGCt5nVL/jHyOqkdIMKW8IpK6TR0mxkuJC8K93/NR1N89iAW/Uriub04Jt/Ya7adGIxQxxYTEgkWEf4Vplydn7erUaq+BpzMtrxBQW0YDZK5pQo+TYuDfvl8a2Tyh7iG/6R2DKulyLNeMcQK9xhTuZZupWJ6k30snc/0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com; spf=fail smtp.mailfrom=nokia-bell-labs.com; dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b=drogBhLJ; arc=fail smtp.client-ip=52.101.83.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b="drogBhLJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UHol4YmzXjwBsF8Y2cZFppeePC9SorVTvbdB03rbE1TmHWzsgNuoMpgcBGkclN1jNOSzwp5UDk3gAWrRssxQgqJn6r7BQRi0oULg49M1xwZTxpnYkb9ezfbJ77G9FURP2iBtUY3u6Rc2cuh6wWZ/lx1Grh02Ya+9Xzk2PQ8uciPHchFX2mnfQ5hfuaDzMEx7lpdS6rrx60bZ2xjABLF/EDR36KgT32c+qoF8UyBWZRsqBCFWdHRDy4KkOxGh4xUFyUxB8t2m4bMeqDFYVRZh43slOtidq48OdaIWc1wZWsvY9P/rloEim6yQDZMN3KWADejBIBZ8nR8qC8haYoggfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i8hJJUOwktQWVua4eT+pJhUkzZTWC4pnkJqM+78/Al4=;
 b=SM4pQZVvdnRxxRnunWz82c1UetWyG0nkVHoOvXYfha9PFymDVSXJNy+VXKtgUAICLF3p4wgLiSTDKYtQSSk+fnMKij5Uf7H+O/rqKfLK2RxzJRfOeq0WNuTZO8mEHgzBeT7Gd1x6IepDQWUhhjbSqycDcJuBMQV1AhPK3TTt8WBl901eocc4pIYFtDqcK8MswEIjVFCY/N7YPUMhMVDAA/ot/+TQKDQaLhmOms584E/ybNW5K7btTFf+7D7tpNewFEf1MFSspMfCMMKM3hvYlFli6nwbSLGiZbvnhrsv8NilmLDLLINMIC7wqvHcoibNExtkWdz+yTG20UnTLjgd+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia-bell-labs.com; dmarc=pass action=none
 header.from=nokia-bell-labs.com; dkim=pass header.d=nokia-bell-labs.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia-bell-labs.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i8hJJUOwktQWVua4eT+pJhUkzZTWC4pnkJqM+78/Al4=;
 b=drogBhLJfVfJT+8XYm9DNLBX3opnbIqGGMKmikQsTsmx6qfqJGtODYJSdC3R7qOFLEljUjKbMd6IFjhizRQz/zHMlJWXyTJmPowGxHkQMF2mwjfOBHyOfvo2My/UObAQ0SUYVirvNH5QxMtg+pz72dyqEcmvWh+jvtEjBy5m0k69YgEvckosc0K5dh0Rcl0mZf/fVCCekGb/wY6GkRmUBAMtzuol0TTMM5pQG+RrOXjV+pLWInjfr2jAB74Z9bO1n5cGOdkXuvYBmy+YL6t0kn+VZcNFQx5DOyV0MeKkSFjFqbwXBeaJYUzu851WU57e+wwgcmbGNUwPAgaT5la3WQ==
Received: from PAXPR07MB7984.eurprd07.prod.outlook.com (2603:10a6:102:133::12)
 by VI1PR07MB6462.eurprd07.prod.outlook.com (2603:10a6:800:140::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.16; Fri, 3 Oct
 2025 11:55:58 +0000
Received: from PAXPR07MB7984.eurprd07.prod.outlook.com
 ([fe80::b7f8:dc0a:7e8d:56]) by PAXPR07MB7984.eurprd07.prod.outlook.com
 ([fe80::b7f8:dc0a:7e8d:56%2]) with mapi id 15.20.9182.015; Fri, 3 Oct 2025
 11:55:57 +0000
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
Thread-Index:
 AQHcDRMrginf6nv65kWiLWJ393AYBrSqEH4AgACeHQCAALjzAIAAY1+ggAExSICAADU0YIAANvAAgAAaczCAAwd3gIAAANzw
Date: Fri, 3 Oct 2025 11:55:57 +0000
Message-ID:
 <PAXPR07MB79841A2F8A719FDAD35AB0D0A3E4A@PAXPR07MB7984.eurprd07.prod.outlook.com>
References: <20250814120118.81787-1-chia-yu.chang@nokia-bell-labs.com>
 <20250814120118.81787-2-chia-yu.chang@nokia-bell-labs.com>
 <CY8PR12MB7195670B68CC8F454DA821C6DC1BA@CY8PR12MB7195.namprd12.prod.outlook.com>
 <PAXPR07MB79843798615E61FA134A5428A31BA@PAXPR07MB7984.eurprd07.prod.outlook.com>
 <5f1f310d-8a17-414b-ac70-80028832a78b@nvidia.com>
 <PAXPR07MB7984310A505E7EDDCA0CBFA6A31AA@PAXPR07MB7984.eurprd07.prod.outlook.com>
 <CY8PR12MB719523226B3E785B8433C823DCE6A@CY8PR12MB7195.namprd12.prod.outlook.com>
 <PAXPR07MB79847467B33487A8F0CA5ED5A3E6A@PAXPR07MB7984.eurprd07.prod.outlook.com>
 <CY8PR12MB719518C4A8F3EE03690E44B1DCE6A@CY8PR12MB7195.namprd12.prod.outlook.com>
 <PAXPR07MB79845B9580C4D17590E8C2DEA3E6A@PAXPR07MB7984.eurprd07.prod.outlook.com>
 <CY8PR12MB71959308B23EFE2A920D8B20DCE4A@CY8PR12MB7195.namprd12.prod.outlook.com>
In-Reply-To:
 <CY8PR12MB71959308B23EFE2A920D8B20DCE4A@CY8PR12MB7195.namprd12.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia-bell-labs.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR07MB7984:EE_|VI1PR07MB6462:EE_
x-ms-office365-filtering-correlation-id: 8b240a60-7f83-497b-168e-08de0273d0af
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700021|921020|13003099007;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?sa5AwSB8tNlJHUh09nQS8nQVLn+rLOWR8T02yIgnfHmorvJYaNhqPy0TyV8P?=
 =?us-ascii?Q?35jDelMHy1O95QttuxIeJsFN5sLI+f1QW6UNPSKUlu3pFgiHLBWvGoHjlrR1?=
 =?us-ascii?Q?ycWz9SZ9oflNZDfypj4LqIcvBYUaq+NUtC301WtRiPms5TZuc7EpMEmryy03?=
 =?us-ascii?Q?F9XTLQaPD2e0r7CYJCW0IchnjkV+R9XEGzNaj7HLISBYXoPc1K7vngxLvh8U?=
 =?us-ascii?Q?WRG90SbSndyl0xXeso7gd7BMcsowI6lgA/tE9lAV4Qjt3pJhnOg/Fhp9na11?=
 =?us-ascii?Q?1rflU1hHT2vNYseQPFOj40nXj9RRQKNsBaWKuRqTQF/UiV3FVlqAH8MRpSdd?=
 =?us-ascii?Q?bBFTk4utXNbzr9s6NWFnufIamVhxaLgladcOKjT5Lt3RaX9h0LDS3Y6iohYy?=
 =?us-ascii?Q?3Ai/l/TfAExt+efSAAMUWTLxSpWpa3Z8DQQ31TAkonruxA62sKDvvmEWxENp?=
 =?us-ascii?Q?3zbV67Ev7J4uXGOTPAT+PmF6r28EGzNlRROyIR8yTlJcd7kvydCB6M0MCqkC?=
 =?us-ascii?Q?9O8XUdjuNsjJHBbnPXv/f3gcxymw0x0JOkgxczVjYd5+YtIgJI0JWCywVSCx?=
 =?us-ascii?Q?WiWoyaxzMEMnegD08D/ed2KHBhkF+O54rtXrHFa6XIFKJrCuqC07yXD/OJjS?=
 =?us-ascii?Q?slZ1EpnCzgEHeBiT8Bk+6FIJ3Idy8BJhohxJmAE9aZLR1988bNsP9wyWcWUU?=
 =?us-ascii?Q?rJ1q1Te8EreD+eA50+yYmTy5t1GU3Omq63+XjwDElGeDdrAQsV7BgL9Fo5Gk?=
 =?us-ascii?Q?K6N5JXIels1eSvrKyfamWtm3U//L8ZcuGmviQUplzFgj2hJ5r7PIKg2mYUu2?=
 =?us-ascii?Q?PicF7kfuWj3C3JcHqbwf4Mwa06PBbvg34pBTOJ/VndtKmB19zihuxb++ZMoP?=
 =?us-ascii?Q?vsuu+GwZoX9K7mUleAasTm3st5Wgxel65gvERhla2K7HELV7/JnJ0aOzelny?=
 =?us-ascii?Q?jLn4C7Kvz0nYmPRDUbGfKuNZFnBiBoIXMholE5RKh16Riy4qxNxlMoA+DQos?=
 =?us-ascii?Q?P9sdp11TOYf3xCsSudlN88ZxBIM2E4n3tmYfAx31kZJxOJ7sbvYFr2zovqhz?=
 =?us-ascii?Q?T8qr0bBjV3XkQqRKWtAiIb6NjF5Dkuet9F9XuHeA30nEwEMfRTuJVPZBjviV?=
 =?us-ascii?Q?EUCXfY/3YwKSVVfzLvaLHGLyiE8bjj99Cw4+Ml6QtLH+fLxBikKe0Z5GjenN?=
 =?us-ascii?Q?JXMUZCST/coc58ywCBEQXFwEoO8BROKdDRZKieX8/exM0AEHFVoTd5xlmNSM?=
 =?us-ascii?Q?VtrGQrV2A6XMugNUlH0DKK3heafkzPKtx0N6TRAfru+F2o9Dm6uoRx/pgZqo?=
 =?us-ascii?Q?Ch/Kv/35tZxlpL+H3nODuXsbhxmwKPCI6gbMrBcbUmm3EXYIzMha3m+RGDRh?=
 =?us-ascii?Q?0ql2hsJjiPO3PyoPpY74tdPrSDOoCtnIx/HfuE6aVH7oW1DUpe7vMlKo1ndq?=
 =?us-ascii?Q?ai2gca/R01TJlWaFG7VIzJilrwERjSrWFeCkIeFMOMWY59Ch7s4vCC9sJnkZ?=
 =?us-ascii?Q?UhTG2SDlz1px3rTp+eu3Rvu/zdXrgNU3bzIIXeq6BjXeN1w/ldb6e7zFJg?=
 =?us-ascii?Q?=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR07MB7984.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700021)(921020)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?soe1qQLDW9a2mWV2ezH8sRnL3VyVC1P6ziYf7diAEMgSZMtYPk+BSVP1cLWy?=
 =?us-ascii?Q?yWbEuIrO9b2fK9L4lqiF6KXqF9cLo9bedo9aKpK5l+h72czTeV1JoFbE1GND?=
 =?us-ascii?Q?XSMUxMxsmAhaW2HHtW1Pe5fcQdXE1ev1sSnrypxGLa0YXchywrzB5Yx4TP7d?=
 =?us-ascii?Q?xkzrxyLW5mNybXMcVS1gznKNSqMQ/yAMBdnB8pbMqdzO1VRz3jetBXGZszRj?=
 =?us-ascii?Q?4w0OGSoCvCNsBjkm+GsKNpGie+q6biZtpu01kKeTptwsgFVMDT8OX2cPJepz?=
 =?us-ascii?Q?KqLEQAABWVR6EXGWE8a5uJ35dN5/5aiwn4fXrT/bT7O9tAIcStW1ll0pDD0R?=
 =?us-ascii?Q?jvDxHTCsK24qlIMVojGVpxYILXS37dmTGvhU9Ol6Hf/5CxMP/ixQ3wLKJmzr?=
 =?us-ascii?Q?cNo4Y3xsA7s0Wb+LsbD0a/Wqpb+iOjOZKg/hoA2uuAMLp4VrDAJN5BSDUzuX?=
 =?us-ascii?Q?MvitWvHT6DgdYtY8a8mhkJCjxaVN61LXTDxTJ0iSfcqeK/MwAxU3FbqMcXU6?=
 =?us-ascii?Q?NJO6Ks/CsDTdFS5T5rGy5XKXMGTr9zf55ASQbwoQzbFid6bNC6l1uGtwApx+?=
 =?us-ascii?Q?wDEvy6L7R+VJG456l29pYTx037RSgFnJtqnQk3EwgMDkXN4TgJaEkibHsG2n?=
 =?us-ascii?Q?jV1lLafNyXiTUtDJlGrnNh8QAv2u9zbo+b+q3o/Sfd4FbCDu2jI6GDPsw+GG?=
 =?us-ascii?Q?pbIxjMYkdVQQ+PKYHFNbmAAun/vz0R3rRiuD+Hq5a1LnPcbRPtnMzv2e2tDE?=
 =?us-ascii?Q?SP86Ht1IX5SztE9tUitAXuDdtD/PT+5E5akMZQD5T04J0VjdTYw+/iuzJdEI?=
 =?us-ascii?Q?T2NV4VMzWMezZHZ4f0epIAL+nl0EYzsIo3sL5Q5P8FbVXw04yYAJL1uDezv/?=
 =?us-ascii?Q?2tmOSvaVP/zvvZG3Ate4Pws+CIztL68uX/ly0CpuGrAEIEH6orDHarJaeqNs?=
 =?us-ascii?Q?gfgJCm+BBUyzeoksMfLPT8J4ImF+p5B5fl+seA9H42xHEEql0LKdkSZrPW5t?=
 =?us-ascii?Q?pq6boAZM7UhuJ1vLQmkwvyTrXC+xQRbZ9CzVNS76v2IQJeHhJkXuUKfVTxfO?=
 =?us-ascii?Q?+k8M4YO2IHMCgfy5JcBEMs6jyoGZqnq0ZLtLtpbXfh/S8hwgpqymmLVm+nwZ?=
 =?us-ascii?Q?Id7+I0dSoFdpeHyWuT6Wt5JUzcXgQ+wOChrwZ3YzVjEiC7NylRu2EyE27kCR?=
 =?us-ascii?Q?s0QKUQWnQ+GW/FzQB3dBLJ4LqjzLvVJBahM6brZJUxknyT2K6HtbPbq4Q6Md?=
 =?us-ascii?Q?dHzv3zv0IH5dShfWePjDS8dxNLHQNaQCyS4DzVOQDtw6/H7qEwyiRG8p/DL4?=
 =?us-ascii?Q?03rptSFOdPDl/vfaPGiXw+q1SCetJkgnWYNOIRcovOL1qcN01x/fOCmViIir?=
 =?us-ascii?Q?zVW2Wfi3kXn6ef4J1GxJJEWQy2eKo/V1p3WbY72esW1FhuimU2ksgo1mJNhw?=
 =?us-ascii?Q?EkvJW9fJ4cebku9NhYS1V8gYk72u86mF4WVHLT1aqbkRrapE0bEnFP8kKN1y?=
 =?us-ascii?Q?N0lrD+f+bNn4597VZUajCmuUur7KyKbsxT01fsdRK6Qq891go67RGkCE4uck?=
 =?us-ascii?Q?LnQ7KFvO+pPGjaM2tSEJabeJjVbfmNzZCBUlYxnPclgDRaQnBpGEtm8TRPEI?=
 =?us-ascii?Q?Yw=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b240a60-7f83-497b-168e-08de0273d0af
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2025 11:55:57.8794
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QoapX3BVNgfMHMwEOScicQ7+sW9Xc3yjxIHH7+ILWkNAq0e0f+HOipszm3h7HJdqZBZAZKezzn3khwMDDnPzMcqM2ussB4qHP+uYM8Rg2FxDwN6i8BMebaP/5m4TDsDw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR07MB6462

> -----Original Message-----
> From: Parav Pandit <parav@nvidia.com>=20
> Sent: Friday, October 3, 2025 12:41 PM
> To: Chia-Yu Chang (Nokia) <chia-yu.chang@nokia-bell-labs.com>; virtio-com=
ment@lists.linux.dev; mst@redhat.com; cohuck@redhat.com; mvaralar@redhat.co=
m; jasowang@redhat.com; xuanzhuo@linux.alibaba.com; eperezma@redhat.com; ij=
@kernel.org; ncardwell@google.com; Koen De Schepper (Nokia) <koen.de_schepp=
er@nokia-bell-labs.com>; g.white@cablelabs.com; vidhi_goel@apple.com; ingem=
ar.s.johansson@ericsson.com; mirja.kuehlewind@ericsson.com
> Subject: RE: [PATCH v10 1/2] virtio-net: Fix ECN feature descriptions
>=20
>=20
> CAUTION: This is an external email. Please be very careful when clicking =
links or opening attachments. See the URL nok.it/ext for additional informa=
tion.
>=20
>=20
>=20
> > From: Chia-Yu Chang (Nokia) <chia-yu.chang@nokia-bell-labs.com>
> > Sent: 01 October 2025 05:56 PM
> >
> > > -----Original Message-----
> > > From: Parav Pandit <parav@nvidia.com>
> > > Sent: Wednesday, October 1, 2025 12:51 PM
> > > To: Chia-Yu Chang (Nokia) <chia-yu.chang@nokia-bell-labs.com>;
> > > virtio-comment@lists.linux.dev; mst@redhat.com; cohuck@redhat.com;=20
> > > mvaralar@redhat.com; jasowang@redhat.com;
> > xuanzhuo@linux.alibaba.com;
> > > eperezma@redhat.com; ij@kernel.org; ncardwell@google.com; Koen De=20
> > > Schepper (Nokia) <koen.de_schepper@nokia-bell-labs.com>;
> > > g.white@cablelabs.com; vidhi_goel@apple.com;=20
> > > ingemar.s.johansson@ericsson.com; mirja.kuehlewind@ericsson.com
> > > Subject: RE: [PATCH v10 1/2] virtio-net: Fix ECN feature=20
> > > descriptions
> > >
> > >
> > > CAUTION: This is an external email. Please be very careful when=20
> > > clicking links
> > or opening attachments. See the URL nok.it/ext for additional informati=
on.
> > >
> > >
> > >
> > > > From: Chia-Yu Chang (Nokia) <chia-yu.chang@nokia-bell-labs.com>
> > > > Sent: 01 October 2025 01:04 PM
> > > >
> > > > > -----Original Message-----
> > > > > From: Parav Pandit <parav@nvidia.com>
> > > > > Sent: Wednesday, October 1, 2025 6:24 AM
> > > > > To: Chia-Yu Chang (Nokia) <chia-yu.chang@nokia-bell-labs.com>;
> > > > > virtio-comment@lists.linux.dev; mst@redhat.com;=20
> > > > > cohuck@redhat.com; mvaralar@redhat.com; jasowang@redhat.com;
> > > > xuanzhuo@linux.alibaba.com;
> > > > > eperezma@redhat.com; ij@kernel.org; ncardwell@google.com; Koen=20
> > > > > De Schepper (Nokia) <koen.de_schepper@nokia-bell-labs.com>;
> > > > > g.white@cablelabs.com; vidhi_goel@apple.com;=20
> > > > > ingemar.s.johansson@ericsson.com; mirja.kuehlewind@ericsson.com
> > > > > Subject: RE: [PATCH v10 1/2] virtio-net: Fix ECN feature=20
> > > > > descriptions
> > > > >
> > > > >
> > > > > CAUTION: This is an external email. Please be very careful when=20
> > > > > clicking
> > > > links or opening attachments. See the URL nok.it/ext for=20
> > > > additional information.
> > > > >
> > > > >
> > > > >
> > > > > > From: Chia-Yu Chang (Nokia)=20
> > > > > > <chia-yu.chang@nokia-bell-labs.com>
> > > > > >
> > > > > > > -----Original Message-----
> > > > > > > From: Parav Pandit <parav@nvidia.com>
> > > > > > > Sent: Tuesday, September 30, 2025 6:15 AM
> > > > > > > To: Chia-Yu Chang (Nokia)=20
> > > > > > > <chia-yu.chang@nokia-bell-labs.com>;
> > > > > > > virtio-comment@lists.linux.dev; mst@redhat.com;=20
> > > > > > > cohuck@redhat.com; mvaralar@redhat.com;
> > jasowang@redhat.com;
> > > > > > xuanzhuo@linux.alibaba.com;
> > > > > > > eperezma@redhat.com; ij@kernel.org; ncardwell@google.com;=20
> > > > > > > Koen De Schepper (Nokia)=20
> > > > > > > <koen.de_schepper@nokia-bell-labs.com>;
> > > > > > > g.white@cablelabs.com; vidhi_goel@apple.com;=20
> > > > > > > ingemar.s.johansson@ericsson.com;=20
> > > > > > > mirja.kuehlewind@ericsson.com
> > > > > > > Subject: Re: [PATCH v10 1/2] virtio-net: Fix ECN feature=20
> > > > > > > descriptions
> > > > > > >
> > > > > > >
> > > > > > > CAUTION: This is an external email. Please be very careful=20
> > > > > > > when clicking
> > > > > > links or opening attachments. See the URL nok.it/ext for=20
> > > > > > additional information.
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > > > On 29-09-2025 11:14 pm, Chia-Yu Chang (Nokia) wrote:
> > > > > > > >> -----Original Message-----
> > > > > > > >> From: Parav Pandit <parav@nvidia.com>
> > > > > > > >> Sent: Monday, September 29, 2025 9:48 AM
> > > > > > > >> To: Chia-Yu Chang (Nokia)=20
> > > > > > > >> <chia-yu.chang@nokia-bell-labs.com>;
> > > > > > > >> virtio-comment@lists.linux.dev; mst@redhat.com;=20
> > > > > > > >> cohuck@redhat.com; mvaralar@redhat.com;=20
> > > > > > > >> jasowang@redhat.com; xuanzhuo@linux.alibaba.com;=20
> > > > > > > >> eperezma@redhat.com;
> > > > ij@kernel.org;
> > > > > > > >> ncardwell@google.com; Koen De Schepper (Nokia)=20
> > > > > > > >> <koen.de_schepper@nokia-bell-labs.com>;
> > > > > > > >> g.white@cablelabs.com; vidhi_goel@apple.com;=20
> > > > > > > >> ingemar.s.johansson@ericsson.com;
> > > > mirja.kuehlewind@ericsson.com
> > > > > > > >> Subject: RE: [PATCH v10 1/2] virtio-net: Fix ECN feature=20
> > > > > > > >> descriptions
> > > > > > > >>
> > > > > > > >>
> > > > > > > >> CAUTION: This is an external email. Please be very=20
> > > > > > > >> careful when clicking
> > > > > > links or opening attachments. See the URL nok.it/ext for=20
> > > > > > additional information.
> > > > > > > >>
> > > > > > > >>
> > > > > > > >>
> > [...]
> > > Virtio spec requirements are clearly written.
> > > So just by referring to RFC 3168 is as blurry as today in context of =
GSO.
> > >
> > > At best possibly it can be written as "device SHOULD do ECN and CWR=20
> > > in first
> > pkt.. and subsequent packets SHOULD have cleared".
> > >
> > > If that is not aligning, than better to not make it more blurry.
> > > ACCECN feature bit can be more crisply defined in that case.
> >
> > OK, then could you let us know if we make below changes in the next=20
> > version, are they clear enough for virtio spec?
> >
> >
> > 1. VIRTIO_NET_F_GUEST_ECN (9): Driver can receive TSO with the CWR=20
> > flag set. This CWR flag is only applied to the first packet, and the=20
> > CWR flag of subsequent packets should be cleared.
> >
> > 2. VIRTIO_NET_F_HOST_ECN (13): Device can receive TSO with the CWR=20
> > flag set. This CWR flag is only applied to the first packet, and the=20
> > CWR flag of subsequent packets should be cleared.
> >
> > 3. If the driver negotiated the VIRTIO_NET_F_HOST_ECN feature, the=20
> > VIRTIO_NET_HDR_GSO_ECN bit in gso_type indicates that the CWR flag of=20
> > the TCP packet applied only to the first packet and is cleared in=20
> > subsequent packets.
> >
> > 4. The driver SHOULD NOT send to the device TCP packets requiring=20
> > segmentation offload with the CWR flag set ONLY for to the first=20
> > packet and cleared in subsequent packets, unless the=20
> > VIRTIO_NET_F_HOST_ECN feature is negotiated, in which case the driver=20
> > MUST set the VIRTIO_NET_HDR_GSO_ECN bit in gso_type.
> >
> > 5. The device SHOULD NOT send to the driver TCP packets requiring=20
> > segmentation offload with the CWR flag set ONLY for to the first=20
> > packet and cleared in subsequent packets, unless the=20
> > VIRTIO_NET_F_GUEST_ECN feature is negotiated, in which case the driver=
=20
> > MUST set the VIRTIO_NET_HDR_GSO_ECN bit in gso_type.
> >
>=20
> Also, while it is good to document existing behaviour of the spec, device=
s and drivers, I believe that ACCECN need not have to wait for the document=
ation of existing GSO_ECN.
>=20
> However, I am bit puzzled with the Linux kernel commit [1] of yours that =
hints that ACCECN may not need any special handling.
>=20
> You described,
>=20
>     If NIC is completely unaware of RFC3168 ECN (doesn't support
>     NETIF_F_TSO_ECN) or its TSO engine can be set to not touch CWR flag
>     despite supporting also NETIF_F_TSO_ECN, TSO could be safely used
>     with AccECN on such NIC. This should be evaluated per NIC basis
>     (not done in this patch series for any NICs).
>=20
> Based on above commit log, can we say that when existing GSO_ECN is not n=
egotiated, ACCECN can work as_is without the patch_2?
>=20
> [1] commit 023af5a72ab16 ("gso: AccECN support")

Indeed, this patch description implies that NIC that currently don't suppor=
t TCP_ECN will naturally support ACCECN.
But an extra TSO_ACCECN flag will make this into an explicit requirement, l=
ike our patch in the Linux.

Related to another email about existing driver, one solution would be repla=
ce SKB_GSO_TCP_ECN with SKB_GSO_TCP_ACCECN, like in 4e4f7cefb130af6aba6a393=
b2d13930b49390df9.
This can avoid CWR corruption somewhere after GRO, and we plan to submit re=
lated patches (old driver, virtio-related) into net-next after this is appr=
oved in virtio-spec.

