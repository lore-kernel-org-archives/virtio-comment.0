Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2048.outbound.protection.outlook.com [40.107.212.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD7810E0
	for <virtio-comment@lists.linux.dev>; Thu, 26 Dec 2024 04:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735186147; cv=fail; b=EWS2SX69ib28zHbGTU9fBO+LufXV3eUogvpvp4Ve2rBWBmcxV3ljrQHkq6epObhGbpwmVr8mixIEsXCfDymm2W3hwxPvAfDrUj6pPG12JQkTr0quLtk3kkUSNw6QAN6cwlcx+eEJximyn0mI+gBWl9t5AYMqBfWA+2DT/GZaCA4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735186147; c=relaxed/simple;
	bh=hv2fKorVlc4l3+Qj/DL4yh1SpMSxLwBcJmuYDNUFkAo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=oYE79nj56BvOD6UyglxW4WVasPUEDhY4Rexnt7325cNgMKEVNKL6fJCL5dy3daK9fdPJJ7HZcyqpzcgvsQpZws49gZyihLxX1OrIosB0oGU3gBWnRi9r7C38/PsWB0M7FBK4Fp0pd4LgkpL1ecDA2/3CrIW7ZGXYDlZEYL4JeX0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=KBZOjDe9; arc=fail smtp.client-ip=40.107.212.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="KBZOjDe9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w62EED6iU7UwT46kO/RTsreiXcUwL8SH3iWU1UJf4ELfYWMcSFISKJLsVdII9GLGK04bqIzZSlDgWm7mhsZ3i+k6iVI+RMWSvTDzc5bo1UY9QDAso9TNBx4C/9y1qmAZTiLJVHjwXsZLm1I3lx0GlfP5QSyKTwblig+mF7WRlVGx49/hBWLPzwYkecqjZTgT+WK2Il8yK3w7WkOTSHj8/EzS0hNQyfwVmYibM4tfAzWrjFNGZiQKpFmY69Vv3EqUrM15PFN0dsOb+0rSrlgthgBofVF6QDxswg90AdHNsfljw4AnfINcd1dmxm/PxV2tb8kS0iN2bzHmO2pu1NwDpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hv2fKorVlc4l3+Qj/DL4yh1SpMSxLwBcJmuYDNUFkAo=;
 b=pIyf54ZHtCbZ2N9l2znhu0n/5n7lELovQQs7mWsyGYqB95SvJLLsTj5Zi1yIMu3QCdw0LgO9ixVUlQ8DOiLdeq8CCVxLHOyp/oHNtiMzgw+NFnFZsMa4BX86//vp+OKnrktnC9xqCnWIU5KklEGdR2H7jflhh8VjhTjCX7RZQsRQC+msS5ylygv35zreZQRHIX59CHVY9wgj/BbRKfCmeODkGWcAVxv7zvraHL87/S6dnjDkXhgyMW3LUaMaoIzxl8DO6ZWkKIlxWNpXD/PAwO5DP7ukV8MLstCDlBQCVLVzNQP8pVgBOC6eb3HffMlqeiA3q7URYcx3Kw5+qECiPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hv2fKorVlc4l3+Qj/DL4yh1SpMSxLwBcJmuYDNUFkAo=;
 b=KBZOjDe92tj6uNDBYMMBZhHZkGRbH/Cr/ZtND5A4RuP6HxDBwErd3tKuZuUg1tFwr2q2rmx0D7xVk/evd7RXuYvHk3XcrMAMyI+emAAFn4Vsu9KXbymf4N1nJh5jMFXEjCioj2Jdqg8ws6fckDdh2zFEk+0Vjbs/UFcLb9ANYiPR1IQk4LAIWgxLvun9RRwo9Z4vuGHDdgpOsCZbb4vyeRX4aEYpm+T/Y3NB4HAVUVyq680v9f6wae9JEf5xcA1Xn6Fpzgkxidfhfu2HKCCf/Bj5TT5mtTzAGUlnhpyZI38BerHwdCfrjhcWwnCHTYFbA21t28NHKWiK0OOu+ybcMQ==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by DS7PR12MB8323.namprd12.prod.outlook.com (2603:10b6:8:da::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8293.14; Thu, 26 Dec 2024 04:08:57 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd%7]) with mapi id 15.20.8272.013; Thu, 26 Dec 2024
 04:08:55 +0000
From: Parav Pandit <parav@nvidia.com>
To: Akihiko Odaki <akihiko.odaki@daynix.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>
CC: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
	"devel@daynix.com" <devel@daynix.com>
Subject: RE: [PATCH] virtio-net: Change num_buffers value
Thread-Topic: [PATCH] virtio-net: Change num_buffers value
Thread-Index: AQHbVpVXJB3eBmv4ZEexViKG9GakbbL2frMAgAABQgCAAVHo8IAAFAuAgAACvPA=
Date: Thu, 26 Dec 2024 04:08:55 +0000
Message-ID:
 <CY8PR12MB7195C321CF982819C5393358DC0D2@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20241225-buffers-v1-1-712e839e8ad1@daynix.com>
 <CY8PR12MB7195705CAFA8759355685905DC0C2@CY8PR12MB7195.namprd12.prod.outlook.com>
 <24facd94-87b2-45d1-97ca-851595e8cf41@daynix.com>
 <CY8PR12MB7195C2A20025389351D15B8DDC0D2@CY8PR12MB7195.namprd12.prod.outlook.com>
 <dcb6ad57-5d36-40f8-b161-7570dacdea4a@daynix.com>
In-Reply-To: <dcb6ad57-5d36-40f8-b161-7570dacdea4a@daynix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|DS7PR12MB8323:EE_
x-ms-office365-filtering-correlation-id: 8392ebb7-a9c8-44c1-cb73-08dd2563040c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?j80xpqQr9/uDNESGaQaR19FIwznVZlt7MrmisbJRS11Whz5jyvruxuoabnQr?=
 =?us-ascii?Q?v7JjZxvM9AkC8jWb9Ne/sBqlW43/6d6rqje8Io1twdafH8HjCazOoVyyz315?=
 =?us-ascii?Q?Zkou1JipeQog/Jl2cMpp5o/cTtpHQlrVBgSH51jsH+jbOq/7DVhh00MzgaqP?=
 =?us-ascii?Q?dRV2P15Hu49rcD6vhkOeonYcB6YsaJkNBzdE0KaRlcRlMFuYI3eKV0n57vwF?=
 =?us-ascii?Q?SUVCoqaCCCS54QsG1NKWOuqzhJeNXTCHN2z/yHGVSuRBN44oRjZkiq62YFrB?=
 =?us-ascii?Q?PNDFi1twF+29gYPo+QSonicWQJvgffftK9HPyUQ/6OfjKw6Q844OMfWRFdnw?=
 =?us-ascii?Q?Br8e1Ijj7ZgZEJnZfE0EhUIszccmHwEgiMBEW4qVclZc1+BtopgOmdnizs76?=
 =?us-ascii?Q?pkdfZfizLUqc93scEa3rY7bDs2KuzihnP5R70XCn2zJflav4NnliCZJHz6+9?=
 =?us-ascii?Q?LUB/B01O1zy6ePHQvNfBFGnp8moupTXEDZwfUZV6d7JUnL7UP5tu0qVHFq4T?=
 =?us-ascii?Q?H+sKufkU2ny2kA29SMqmBlRIUvy7yXG1sM89Qv/Iwna550N1vJcyj7RhSPB6?=
 =?us-ascii?Q?m0KDiuIgYRaT5OVWbNW/K9Zx0mbiOS71pkGyDUbDY2igmfYInfEUS8ejnNrs?=
 =?us-ascii?Q?MRoJFAzVMXghTiYN5BYArFbTggb3xo9qpFYc23oQ2l+JQ9woJLjyVBS2K9aH?=
 =?us-ascii?Q?Hsff/0HcCXzEvPYaoJJmD2mx0nCdhIXGJy0xUgi5DrKWsJfyB5kd0TcrRzPR?=
 =?us-ascii?Q?rBhV87S+ZABazkuvbroGAms+0TlJCr+BVR0qADP0F2bwVVwxJPsyJE6nxr2f?=
 =?us-ascii?Q?53C4/LHOiE7OF7SMyMnVQ1Ap3I1RQWfAtOrF2Z/K8IYYHhzCPSsiLuMS5Bil?=
 =?us-ascii?Q?3n8VZmuyRtV8SV0R/2OoZATR31ZN/rnabTNzZSNoWoUH/FCfc8jcTz1UWTys?=
 =?us-ascii?Q?2TWeBGomBEZ3iT0ZX6l5u15GN9DVWKQrYa+gMaMmw4aRSdustu/vnV5YeM1p?=
 =?us-ascii?Q?Flmr2mccx0jOeJfBvl//x04WlaEf1K8ehmZxgphDSXqX0RFB05mF83Xm+J8W?=
 =?us-ascii?Q?9ihFnl5DG18zhyXZnjMRmFJO6DhOtZGoF2Ri6DFKb5RxFYMhf1zMjT65DBOj?=
 =?us-ascii?Q?k0HZdCskZCEkwUZ7gmIaI4LbRtXO+QXGjIfQpch2UckmSXDpi5nuHOXLZCaz?=
 =?us-ascii?Q?lG/qBCPbe+3AFvC6ncmLHFgg65+n5Re8Zy5sNBRYTJz8kDqXx1Teq0SLJEhI?=
 =?us-ascii?Q?EoHyl3f5g2IYSh+rWiUGWzKHUqWcTdcgyCpTDpiBW65ORPNKn8CfPsa3E/8l?=
 =?us-ascii?Q?wLwAWCJmkOt4zrygt3PZ0qfIcetqdsj6JaTTiZKUgGrJvV9LZmsST8p9tcTM?=
 =?us-ascii?Q?QpIeUrW6P4Agfn/Eqlig3WMLlMcbUsAS5RrQx/pNsZhBt1IigRbhlw9UOpjy?=
 =?us-ascii?Q?kuK4NvD7J1EpG6+I6L/atSliHd+Tnp8P?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Q5udD+vvzoDBCw3BBJfh7x4pnnv4XBl5N2Eg0dNf/xbT1mNESozGhmLmO0EH?=
 =?us-ascii?Q?Zu+RtNFFZRqWgLaxUJFGzD7W8cuExSPtJh+I5y4Usm9Cejv/Kc2BcbB8H6Gi?=
 =?us-ascii?Q?i9H/WlVYDlhLOuqeCFE7wBOjodP7MrpF4BeiOBJbXsmsz9ExG+lLVIXZMHcY?=
 =?us-ascii?Q?TjCK1GsJuR9toReontWpqLvfyhWPS8juvlkS6xDgQ+DUHHJFupkJ3yEeceFZ?=
 =?us-ascii?Q?wgowKzzaSSFHQcmTOOMLBAklClUFK+FSkEywOr9sGEoq/sbdB4cYRa/gXJ7G?=
 =?us-ascii?Q?VagyFDFMfhoDGrwrT4sB9IRhU/yXxO/L1OYswi8SfrSzxCn41AaIeScwJokH?=
 =?us-ascii?Q?6hhWtJyGMoDoPMZFoEXi9VtPFkxTc9rs+H4LWx/SOOoueGxapHHlI1dG+FTE?=
 =?us-ascii?Q?yx7BIu1a/uH+sdk8V6qvcCpz+mdSp/4Gc5JH7dPbZNNhpMgXZ+T1HsTG7PB3?=
 =?us-ascii?Q?tM5Kt/pSwIF08Zm0UCOIQOcGyC08F56y02mM9M8P+j+VK6oEFpluGM1lOhfR?=
 =?us-ascii?Q?Mk4qJTkSwRqAi1CI/zr3wrQvQ40hEYsZh3dLc1Po1vHt19kpimcimK7zsZJU?=
 =?us-ascii?Q?5SwImIwkm4u3PY4a5HJ78RwUzDuFc4ks/34vYX9I7SWc5fxxCKSx9Iuy7gFi?=
 =?us-ascii?Q?WK+iPrF0DOgy+NEbRwPJtuy7ZrNgYzTCvGHJRhUiGCEfq3rPQeC+SlHls2bG?=
 =?us-ascii?Q?mTvF+yn9bQzlr15W59SV+xyuASNKfrO9emJkgpnKHpMOHINY8YCo0ObKbYWz?=
 =?us-ascii?Q?VNyAS0B2i7mbJTtMQEgZE6fEQ7lHl7ZzbDFVJh0hQ7S7OY25e0E6HtwnGiCN?=
 =?us-ascii?Q?QDg/bDe2W8Vcr3aXvwNJzx9zjtfcBtF5vpRgtl4WfqkMmsJ6Z4DHFqSH1V1n?=
 =?us-ascii?Q?Xu+s2pnTf9Q4fVfZT+GSrGhhFS/uZS6RCvDKHTyVnLqOhacmgth0I1jpI87p?=
 =?us-ascii?Q?HYpRj2LNiVyEZh/YwnB+8XQ2sW+93K9LiNnMfy6SsN738J5saVIr/KhCYDxB?=
 =?us-ascii?Q?aTvPb+264qfD6TRbMZ7a/q5hB8PFeFAADiy45OJsAsf6ZDpVcjzf2fm3fHvR?=
 =?us-ascii?Q?Od0RJG9Nc74ssmrPiTJismf2VjXDI9q1uZ6gUXAeAnwZF1CDpItA/yegtX83?=
 =?us-ascii?Q?UGKueL2Ts4Np2nX82VqwOwLzaFOnKtf3mSX24jtUuQ56Od86LrHWhQ3g8kp9?=
 =?us-ascii?Q?j5uxbv0z8kP1C2QRxdDotIgmyJoO6r+3YBY82/IxWY2T6Vn2icvyt1Zc3XNH?=
 =?us-ascii?Q?HBgOICPCp68+SCycA7WMDw8v1D2F3te4jBxJ1omRojHIba6D2xmoPR7yzyy8?=
 =?us-ascii?Q?VydQR9SdcPfPcq+T1etPNHbqfRABZQY4wHz4BJ8ayVWDfjfejW8BZCE3euFq?=
 =?us-ascii?Q?SyHuV5KKwiNA+0Tvbv9NIf4q7gSNN5d2J6T1+ePLKAMwQXbI3Tn2Uqbj7/Bu?=
 =?us-ascii?Q?owisQpI+KfjJtlKcSoFSGsAMrrj+Qy1D2xLZ3vSSzw6rzzhJphEHd3obdEc9?=
 =?us-ascii?Q?EV+8Ck842q3ZgDU5qu9sivyaIhCZN0uF4KavGO4WvD0uBYgLVWlf5u5fmzJ6?=
 =?us-ascii?Q?lTsgnlSI559W9XK5+qg=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 8392ebb7-a9c8-44c1-cb73-08dd2563040c
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Dec 2024 04:08:55.5748
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /9sMNYPyXgFJmet9fd3enGZ5+NYMRqILwvyThhgEjMEQmZxUB4QmzWlxFgEOEbIWqXbwhR2CBs0Aapt1M6ba0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8323


> From: Akihiko Odaki <akihiko.odaki@daynix.com>
> Sent: Thursday, December 26, 2024 9:22 AM
> To: Parav Pandit <parav@nvidia.com>; virtio-comment@lists.linux.dev
> Cc: Michael S. Tsirkin <mst@redhat.com>; Jason Wang
> <jasowang@redhat.com>; devel@daynix.com
> Subject: Re: [PATCH] virtio-net: Change num_buffers value
>=20
> On 2024/12/26 11:50, Parav Pandit wrote:
> >
> >> From: Akihiko Odaki <akihiko.odaki@daynix.com>
> >> Sent: Wednesday, December 25, 2024 12:01 PM
> >>
> >> On 2024/12/25 15:28, Parav Pandit wrote:
> >>>
> >>>> From: Akihiko Odaki <akihiko.odaki@daynix.com>
> >>>> Sent: Wednesday, December 25, 2024 11:52 AM
> >>>>
> >>>> Linux's vhost_net and QEMU sets num_buffers to zero when
> >>>> VIRTIO_NET_F_MRG_RXBUF is not negotiated. Change the specification
> >>>> to reflect this reality.
> >>>>
> >>> Please fix the vhost_net and QEMU to reflect the specification which
> >>> clearly
> >> writes num_buffers must be set to 1.
> >>> (the last hunk of this patch).
> >>> One cannot suddenly change what was written in the device spec as
> 'must'
> >> requirement.
> >>>
> >>
> >> This proposal is based on the discussion happened during the
> >> vhost_net
> >> development:
> >>
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flor
> >>
> e.kernel.org%2Fall%2FCACGkMEt0spn59oLyoCwcJDdLeYUEibePF7gppxdVX1Y
> vmAr
> >>
> 72Q%40mail.gmail.com%2F&data=3D05%7C02%7Cparav%40nvidia.com%7C227
> ecfe28
> >>
> 0c04c7fbe0708dd2560ae73%7C43083d15727340c1b7db39efd9ccc17a%7C0%
> 7C0%7C
> >>
> 638707819369398017%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiO
> nRydWUsIl
> >>
> YiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D
> %7C
> >>
> 0%7C%7C%7C&sdata=3DJcJuXC0tHF%2BQwCjrpwDTnEWRrITD0hXwB3cTkwmZ
> qOk%3D&res
> >> erved=3D0
> >>
> >> The reasoning here is that vhost_net and QEMU set num_buffers to zero
> >> for years so changing it is more risky.
> > Less risky for the device or the driver?
>=20
> For the driver.
>=20

> > Your response implies for the device, but do not understand how it is l=
ess
> risky for the consumer of the field (driver).
>=20
> If there is a driver that reads the field, such a driver is likely to exp=
ect zero
> because the two most popular implementations sets the field to zero.
>
Why would driver expect zero there when spec said 1?
It can only work if the driver ignored the field.
=20
> > If the field was never read by all the drivers, it is better to modify =
the spec
> to say following in the requirements section:
> > 1. device MAY set any value, or MAY NOT event set it.
> > 2. device SHOULD NOT set num_buffers.
> > 3. driver MUST ignore num_buffers when VIRTIO_NET_F_MRG_RXBUF is
> not negotiated.
> >
> > For the real PCI devices, this actually can save the sparse DMA occurri=
ng on
> rx packet.
> > (telling 0 forces the device to do the DMA for the field that driver ig=
nores).
> >
> > Also please change the motivation in the commit log to indicates that d=
pdk
> pmd, freebsd, windows, Linux, QNX drivers has never read/honored the fiel=
d
> num_buffers when VIRTIO_NET_F_MRG_RXBUF is not negotiated.
> > Hence, make it optional for the device to set it.
> >
> > Please work with those open and closed source driver's maintainers to g=
et
> their ACK on non_usage by the driver.
> >
> > This change will help to save the PCI DMA.
>=20
> I don't think it will save the DMA because it is at middle of buffer.
>
Its part of the vnet hdr writing process. So its slightly lighter to not wr=
ite in simple cases.
How a device does DMA is upto the device on splitting the buffer.

And if it does not save DMA, I don't see the motivation.
The driver is working with num_buffers=3D1 and num_buffers=3D0.
So what are we trying to save?
Aligning the spec to some behavior to one device implementation makes other=
 device implementations non compliant to the spec anyway.
So the risk part is not clear to me.
=20
> Regards,
> Akihiko Odaki
