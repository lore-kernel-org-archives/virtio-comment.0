Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010000.outbound.protection.outlook.com [52.101.84.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5652217722
	for <virtio-comment@lists.linux.dev>; Mon, 18 Aug 2025 14:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755528733; cv=fail; b=LSWy9qEF86iUEvmj2rcLuGLcp/7Vfo6iMcbE7hQu5dIuubXwP3cJDRzss2x8Wbe87Oq3+FW78nWqrMS9giwGSaD/h6yDoThdhfyjktGK+bl1+lf7zjE0vca2fFfKgJS+/+FkgqCRPkbl51VO88Okrxz8gjRHzZl4Bv7oAx74c2w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755528733; c=relaxed/simple;
	bh=CLsGlhHe/gxMgutXZx+1Q0DY+jahCxLiyN7rytfgMIo=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KgPeGw8cmZOq5zhBtdg5LhAVx05zJrARbpC9+A3ZTwuTP76JcBtEu2qmEMWM5UL4Im87SCAIit7OJzcXn0TzK1TPD9TR4W7Lcm7bqsQLeY9n8wSzgpSMX+62iMp5rxeb1HJqFHCj+xxR8wvmva1qQ0ZR1h+9p7g0cUNGIW++5J8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com; spf=fail smtp.mailfrom=nokia-bell-labs.com; dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b=rPvlqlOc; arc=fail smtp.client-ip=52.101.84.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b="rPvlqlOc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aJekCVDt16zTtodIKX9+sTjxuRi/ZPalGyaPPw0g4SJOQwQcJHRWv7xNQgKbezsDjSFqoMa58z9O8MiDI09kzg12s68iIS0D+lV3vVgvhjTyCNv9KBKQCpC/89Arn+JqNP1STAHpWVQVs+/09vbbvWVuBvI+jhaMRDENvnRWdLfFrMP8k11vBYlNpM5zhRJZj5MuuHt5wTnJ3/eDF2I0SyesugELyc5vn1FAIBeM71cvOip6feo/ELPbx4QxoxeilzAZv/+jc/NtHP/LsjiKwqAkq91+FONgEt5ha/bCRFzWl3oXZ9bWagxQDSEjRNIc1VTT8ostbNTb79Ur7qyJ9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b+MJKUIZSftqScKmJlZxrnpbFt0Sk7kkhkuAvdq3hf0=;
 b=WA5BliitHMhtr41NUHxrXurNkM8d+PVZm+DGFmJWBNNPdSK33MbxWnEgZpe6FiLvEUh0BSCayZr9YxByrpPvZ5xvf9kolO8F+vpxzToM83jowGZkkJESLbTRkSKXFItYDpg4jZRSzQeRSw4z7OIs/S8o3X04bk+rf/044v788/B+LLiHSFxP29jZ+rL6ZyIWgp9nAD+0/ipitY3reZoU3v7+vF0HvvP53gR2cKMkYL41bafe5za6qOKdpwWbJOKgBxBZ1UYFEt84XulSziMR6gHGX/dIr9nA2CMtliwns7LbodSiKwFJDiQeUMAOQeBbqyM9FgT19cuu2GnAfY+chQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia-bell-labs.com; dmarc=pass action=none
 header.from=nokia-bell-labs.com; dkim=pass header.d=nokia-bell-labs.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia-bell-labs.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b+MJKUIZSftqScKmJlZxrnpbFt0Sk7kkhkuAvdq3hf0=;
 b=rPvlqlOcjnqlZoQzHJV92wglQbli/AxoCx/PyaT+XVwQqJ7Gi3n6aG/SIeHzhRR/aPGDvG34UZZDeJmvMRmGWLn+L1QjXHcbidNX5u+FviUINBHhHjGgi1xmDIpHV18GsRduyLyih0oJJ3ArnakKmPPyOCDWXW3q6eXvKHMNkLIJCYFzHZ6wUcArW8K8TQ6EEVh2HaKFJXUOxqr+LcV5LFQJIxAUDqXLNKCEia/2gRxwPg8VLFQWb1cm9ERFMhD/LMfxJVRPwO3L/vKyLQHT+7LAxDeFV5O1/PjP7nTcmAUgxgF73QwyxjxhpW4rce3fxQ6/Cv5c1i8SMVmCN39DBQ==
Received: from PAXPR07MB7984.eurprd07.prod.outlook.com (2603:10a6:102:133::12)
 by PAXPR07MB7888.eurprd07.prod.outlook.com (2603:10a6:102:13c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Mon, 18 Aug
 2025 14:52:09 +0000
Received: from PAXPR07MB7984.eurprd07.prod.outlook.com
 ([fe80::b7f8:dc0a:7e8d:56]) by PAXPR07MB7984.eurprd07.prod.outlook.com
 ([fe80::b7f8:dc0a:7e8d:56%2]) with mapi id 15.20.9031.023; Mon, 18 Aug 2025
 14:52:09 +0000
From: "Chia-Yu Chang (Nokia)" <chia-yu.chang@nokia-bell-labs.com>
To: "Chia-Yu Chang (Nokia)" <chia-yu.chang@nokia-bell-labs.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"mst@redhat.com" <mst@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>,
	"mvaralar@redhat.com" <mvaralar@redhat.com>, "jasowang@redhat.com"
	<jasowang@redhat.com>, "xuanzhuo@linux.alibaba.com"
	<xuanzhuo@linux.alibaba.com>, "eperezma@redhat.com" <eperezma@redhat.com>,
	"ij@kernel.org" <ij@kernel.org>, "ncardwell@google.com"
	<ncardwell@google.com>, "Koen De Schepper (Nokia)"
	<koen.de_schepper@nokia-bell-labs.com>, "g.white@cablelabs.com"
	<g.white@cablelabs.com>, "vidhi_goel@apple.com" <vidhi_goel@apple.com>,
	"ingemar.s.johansson@ericsson.com" <ingemar.s.johansson@ericsson.com>,
	"mirja.kuehlewind@ericsson.com" <mirja.kuehlewind@ericsson.com>
Subject: RE: [PATCH v10 0/2] Update ECN (RFC3168) and Add Accurate ECN
 (RFC9768-to-be) feature
Thread-Topic: [PATCH v10 0/2] Update ECN (RFC3168) and Add Accurate ECN
 (RFC9768-to-be) feature
Thread-Index: AQHcDRMpCU5xqsxt8kWMR0VONFef47RohI9A
Date: Mon, 18 Aug 2025 14:52:09 +0000
Message-ID:
 <PAXPR07MB7984E74ECF19E28F857E7AA4A331A@PAXPR07MB7984.eurprd07.prod.outlook.com>
References: <20250814120118.81787-1-chia-yu.chang@nokia-bell-labs.com>
In-Reply-To: <20250814120118.81787-1-chia-yu.chang@nokia-bell-labs.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia-bell-labs.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR07MB7984:EE_|PAXPR07MB7888:EE_
x-ms-office365-filtering-correlation-id: c3e6e3ab-f913-4504-41fa-08ddde66ce9b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|7053199007|38070700018|921020;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?VYawyOHX46cwoMNDa0v1OaAYSE0lqBoApici1yLQ+MOzv/v3hFUGxBP730IM?=
 =?us-ascii?Q?tuGCsQx1H12QEclaJ7bGUmWAn2Pxk4gV0W+qYMhr6sJ52wv0Oh/0ysf1evJN?=
 =?us-ascii?Q?egQGAqa4dBjPL7tJCpyTgTAr1AGLIPO7Cs3HFfZl5mfWTxyj10XrjM90Tj9g?=
 =?us-ascii?Q?EA7HaYopZkkL0tT433MqpygsHkafm2Laky7qsAIlgOWwGhZA6YNq2xW7wDIh?=
 =?us-ascii?Q?BoEcfLTXElumV1SDjPlNbuEacsl6Mw5yS0qOXHLBl7Yd8NlcgozDXTw0kB+q?=
 =?us-ascii?Q?FJJtTto3nrO9mIkS2xKm8yHkTFlbGG81tML0vF2bLsXC5vc2gqzZFQ861H+1?=
 =?us-ascii?Q?pjK0cM20B7CKp5AFpYIRpdCEjjMzmN6LLIVuAgO508x+pQsFFUTa75TRN3aS?=
 =?us-ascii?Q?OopsNuakzzvbno393VszzK2cBHHMquLb67d6DF/djidhmJsGFwMdD9zvmPx/?=
 =?us-ascii?Q?Lsubfdv4EU5iinH2s7UysJO+dm8gy+Bc9gWF4ZuxRPvNxo51xF0P+VU2DaYY?=
 =?us-ascii?Q?04VZ+mW5Em1ErELoz9oD7qlnKb1jGXrEMNTRFBxK85bVK3edhpdq2W3P5I1N?=
 =?us-ascii?Q?NOts4DsIWO7EmJmakXx9iPEB3EZ5cxBWNurKCDwynpvfFfzGrNPP+6/OpP2H?=
 =?us-ascii?Q?vny+VTYGp+kDLVuUtIaNsbd+omMqkWxfmCo6DSarPZF6n/SCst70QdBYdBIz?=
 =?us-ascii?Q?IOwyRZ2pm71xyXeoJIF2J3RR2D8WmUFz/QoRIXl0F4TBdqr8WFTvFsBpIT61?=
 =?us-ascii?Q?TW2JJ47U4uS4LUxuYa5Ai+UUJqjatYIVusHgYrspmDCb8Tei05vHqpcD+QWw?=
 =?us-ascii?Q?BGKqG9eIBbGCPpi1TrNrFxh9WLbhx0bxI+8CTuNc2futGOmKrF2jAx4KpH3J?=
 =?us-ascii?Q?u/I8irlsy0KvPH1tPAQqZ52s6u/FTtDzl6Se7aiVllebLdsKThPNDNvh41F/?=
 =?us-ascii?Q?bO/ThCiFLN2BmlpXb2Cr/XaZVCr9Cr8h61+5O3TexpJyWXl3AuY2WdYl4aCd?=
 =?us-ascii?Q?DeyYm1Qm/PhoD/KTaY+Tg96uaryuiVSdIL2+adCEHRXTExjCuxSUmoKgosXT?=
 =?us-ascii?Q?OM5W2TIZ+N8goX76juK1cdpe0n9eGq/UZngoLpglM7MHo8OQAaPeYk6Rhah8?=
 =?us-ascii?Q?FH4I6sGEmykc54HqazlzTsMwtKorh4vLcWbw4+XT5yOv1SJQTc58cW1bck72?=
 =?us-ascii?Q?AGSOcov1sv8ytdCiKUmeb6DG+3k4Tk70BqUOixgLnNhd6SQrLh7NxVZbqrbO?=
 =?us-ascii?Q?Omj1ENYbRuJyXTb4XLCy0gHxLI5n/0a6YAiLrDftd7jNAP33OJyhDOUb0Ntn?=
 =?us-ascii?Q?9V2MByLkdL7fVb8km4b4ZsgJTaMnAR4I/JE3K0LUVYeIe2JY80y4GtmwkedF?=
 =?us-ascii?Q?4gcqK4iSisV7rYR4ExNcDZmraTl9Ke99+S3gIbeKIoiol3sHZr0UYwA2wPaO?=
 =?us-ascii?Q?/JlW1wbbeOt4i65E24u+ZH7uWbVBLCYf?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR07MB7984.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?KYsnX+6c0nYjpdFlqav1htVFKRrcTh8dMZdEvsvnSieEZaT/Uj2BgQtnXEVM?=
 =?us-ascii?Q?kyDNET9/bWeccWK10iJHMj1vLKzRV5HrgxP8Utqm/BZ6L6HLCFAfqWgNrQUc?=
 =?us-ascii?Q?mP5CthOHpVG0o6Gh8J4fA+o1DiQ7qYkgc+K6TtmSK2/VcWW1SvAlNVSkPPUl?=
 =?us-ascii?Q?AypvfI8Zd4o7lOXdeVfu/X9hcetODPnO6VgDhAK/OY9xpJ+764+QofXFA+39?=
 =?us-ascii?Q?TKaeL8sS/DVs9WUMZKQ6+LtwPxq6TerhHIGOLA0QcTB9C0zEtk+tCJ1U3Rfx?=
 =?us-ascii?Q?tCT1Lfmq+plYAwDbWv96wlN+FChekZU8aKCmMVyf2nuscBNGZ+KY125/YrrS?=
 =?us-ascii?Q?ec50CZDs8u/GGdWkBvQNCoT3OtIBKvwpxOiJ4JDoNqKLcH2QZ7ZSqQ5G7ZJv?=
 =?us-ascii?Q?3uXO7hKPy7Waqps/trDODOLR7d8AXIC+0ERQh1Po1OH1OGmEZdrQr4uTSPE8?=
 =?us-ascii?Q?ybluCbZoOzd7B2P/E+if9niolT/LjxUkYOi4NRl1lFsR5luqYM0ZBTgyoyWK?=
 =?us-ascii?Q?1mlAO/d6pfIcw2WK6slLwcG1ha0gw1vw876Mmm2Mb5Ewzo/uwJvIyMaTBVuH?=
 =?us-ascii?Q?a+Xq3bAy2hAn17j2ndLyoWD/JctGyrSY/pwGo3BC/IvRzcUNZItXawvkEUZo?=
 =?us-ascii?Q?P1+gpFw+mYAOUnLeyQQQuFeB9KJDJ/ZAbyrIpOxC+ZHBoq2XFfeMpL+c7nVc?=
 =?us-ascii?Q?YtIoHDjhc5mWx9KdPue2WxL8yieO8faWQnaZOYP/vf/RSxYDa6Ybc+hij9BQ?=
 =?us-ascii?Q?KB9T8qa5G7Sl8EtihP3TYxu0yIJJTCIidrEO1hlNH4A45L/j1AIt4ZCqnG7N?=
 =?us-ascii?Q?B+wW2XwlaKZlUx3NQdBhJ4sO+tApF3kENOEF6MaORidJfts6uTjRXHvZyMNa?=
 =?us-ascii?Q?v2LrWoPvqzMdQzo026llNkEoOEfTJpHx6JcVpgDDSylj8FV+665z3JwHayVE?=
 =?us-ascii?Q?GNpx3GND6UjKbISU+v2yigxXpVfq4f6eok51RwTSa52MqOFkYO5Qo1CxOHia?=
 =?us-ascii?Q?RRnrlrquKT1grFxE7nJItp6hqX79VvMY9Wf81WAukEKeUJDMhRSo+Yo4U7C+?=
 =?us-ascii?Q?FOeYYGMOzLaEQ/g+bWD5sO8iNz26yxiIFC/xMgV2ifPIMQibSuz1SJSofl9b?=
 =?us-ascii?Q?HBt9mawQWHTRn1+UGf6ykSywxVj0JLlBEJnTmkIAoaed43qglFfmbQIDYNDh?=
 =?us-ascii?Q?V43j/JxdM7HfDEIYOpApqBSzpcQhx2vMjJ1n935/z5VoQH0oy2jPfkQSkxsa?=
 =?us-ascii?Q?ZLxW5OEppoUdXPiIo/K9jHMbs7TiZuPGShTlGxAZIMb/ytudBVzfJwTUEbX2?=
 =?us-ascii?Q?YaBZugtM990skrDJICl0ef9Ox4AYFoprnLd5IQjnKKQlwMRWFIpei+SwsxL6?=
 =?us-ascii?Q?7Ef6G/2Nv271tJbXswHGrYczNdemE4ck6SSGMgBQ+odPpxulKIfffTrOHX9G?=
 =?us-ascii?Q?Sgi1exM7RzQ3/diHGtm71/d9ve5aRISFelZbaHy2nfoMDNzM9i6QYSk9D7F0?=
 =?us-ascii?Q?jcPH3oDjn2OLPqc4FjRMgpg4BwtV6BAvbWyd1JL0Ve16Uynasio16cxG8maI?=
 =?us-ascii?Q?URMUaFR4NeEOU9wgCfwHSu7BIgA3rH6AypsduXuu53Pd/meZ/SYLuEfuyLP6?=
 =?us-ascii?Q?MA=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: c3e6e3ab-f913-4504-41fa-08ddde66ce9b
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2025 14:52:09.0451
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8L3GhpivLkUGC6f9MsSkVqCEg+Ji85SSsTmawaKirP+4ZqnolmfskzajlhnKUwFrqmrqzBVFOPo1+QK3CZ3pBW1ZopH7FwqrI7VGPocwikSkJ+io6k96zrUPZ8e2Hrmi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR07MB7888

> -----Original Message-----
> From: chia-yu.chang@nokia-bell-labs.com <chia-yu.chang@nokia-bell-labs.co=
m>=20
> Sent: Thursday, August 14, 2025 2:01 PM
> To: virtio-comment@lists.linux.dev; mst@redhat.com; cohuck@redhat.com; mv=
aralar@redhat.com; jasowang@redhat.com; xuanzhuo@linux.alibaba.com; eperezm=
a@redhat.com; ij@kernel.org; ncardwell@google.com; Koen De Schepper (Nokia)=
 <koen.de_schepper@nokia-bell-labs.com>; g.white@cablelabs.com; vidhi_goel@=
apple.com; ingemar.s.johansson@ericsson.com; mirja.kuehlewind@ericsson.com
> Cc: Chia-Yu Chang (Nokia) <chia-yu.chang@nokia-bell-labs.com>
> Subject: [PATCH v10 0/2] Update ECN (RFC3168) and Add Accurate ECN (RFC97=
68-to-be) feature
>=20
> From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
>=20
> Hello,
>=20
> Please find ECN and AccECN patch v10, which aligns ECN functionality with
> RFC3168 ECN, and adds Accurate ECN feature. The Accurate ECN draft can be=
 found in https://datatracker.ietf.org/doc/html/draft-ietf-tcpm-accurate-ec=
n-34.
> And the Accurate ECN draft will become RFC9768.
>=20
> Best Regards,
> Chia-Yu
>=20
> ---
> v10 (14-Aug-2025)
> - Update AccECN reference and it will become RFC9768.
>=20
> v9 (19-May-2025)
> - Update descriptions for VIRTIO_NET_F_GUEST_ECN, VIRTIO_NET_F_HOST_ECN, =
VIRTIO_NET_F_GUEST_ACCECN, VIRTIO_NET_F_HOST_ACCECN (Michael S. Tsirkin <ms=
t@redhat.com>)
> - Add reference sections of RFC3168 ECN and AccECN (Michael S. Tsirkin <m=
st@redhat.com>)
>=20
> v8 (17-Apr-2025)
> - Further typo fixing
>=20
> v7 (15-Apr-2025)
> - Fix typos in AccECN patch (Michael S. Tsirkin <mst@redhat.com>)
>=20
> v6 (14-Apr-2025)
> - Shrink descriptions and make more reference to RFC3168 ECN and AccECN
>=20
> v5 (06-Mar-2025)
> - Update feature bits of VIRTIO_NET_F_HOST_ACCECN(69) and VIRTIO_NET_F_GU=
EST_ACCECN(70)
>=20
> v4 (05-Mar-2025)
> - Update commit message of AccECN patch
> - Add reference to RFC3168 ECN and Accurate ECN
> - Simplify feature bit descriptinos to avoid duplication of text
>=20
> v3 (21-Feb-2025)
> - Separate the original patch into 2 different patches
> - Fix several reabase issues in v2
>=20
> v2 (17-Feb-2025)
> - Rebase the patch on top of v1.4 virtio-spec
>=20
> ---
> Chia-Yu Chang (2):
>   virtio-net: Fix ECN feature descriptions
>   virtio-net: Define Accurate ECN feature in virtio-spec
>=20
>  device-types/net/description.tex | 83 +++++++++++++++++++++++---------
>  introduction.tex                 |  6 +++
>  2 files changed, 65 insertions(+), 24 deletions(-)

Hello,

A Github issue is created for this patch series.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/232

Best regards,
Chia-Yu
