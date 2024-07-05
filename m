Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2072.outbound.protection.outlook.com [40.107.92.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E3A73469
	for <virtio-comment@lists.linux.dev>; Fri,  5 Jul 2024 04:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720154581; cv=fail; b=AUqTzDyPPW/45rcyc2r8lXu8eIYrbVM3kyBH7cP1p3FPo52eMSGBCK9DNhedETvOXCh4jjvpeOQir0S2NuUN6m3esxh4gpf+tM4HF/4TL/cPQ4C7z0/qaJJDB7oMFdIWvoyhUiqJRShOk+p9Rc7aQNHx8xuQxVJz51LJ6x/uRe8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720154581; c=relaxed/simple;
	bh=0P1QNm4xh5B+s3xexYqXEQh2uCVkIqchD0dmLZRXNQg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=RL55VtMw68NFGi1Ihi5GYx0O9nEJlbm9QxPvHiXkfBNv2IQhC8CfxkEB/X2IVryTd5umRZQ6ZlvYUBAV74lgXs+3gFC3VfME/bTkuQ37/Vzj9zJ23SYIzfkDhf0Q0tgo3pfp1ncL45DtJ2ylXQ8Zo6nOzALMWxTRFnGq/qY6hik=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=TiwnDRNj; arc=fail smtp.client-ip=40.107.92.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="TiwnDRNj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Itensdq50M0NNmxQAfpKeYBe9qqI25wd4MDKdM2VZVVuZ1w04nfrzrPvGZDzxu3FHQR+Fl2bvPRl5zRiJajfDoCsKrCfxHIpxsvzfOKF/gBswhbNZX5eTYO24vCNQl4JsJsperN0iqfgNat/anzf6LyOzbTuXCCLWOeY24qlcL09oU9IMYdHr+lCUFq+86W9eyKwheGBa2ScqROrMC7XX6U+SR35cOtpTf0nNwv54ToDnC+4susUpWamu9Wz3VMssPiTfUv9bm2Vjj4FDKhGKJZmomv6durNeRGISAeWe7pv+8R+u3EfFKrfC5js3dHV9zl99m+ZaAiddsuKE0OCPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YBBeAPmqQzjWpIL29cdmeRYFC+g6k7S/y9sjQv1y9Bs=;
 b=LSROEtixb8GdgN3yyJRuGrfpnMbipIY9djqEPHFvMU4pAb/9j5546kBd7a1PRAP7r8Iv/ZOBWvsMPxXPpjYpXEkMCcwE7Rp8qM8Z2b8QfKGaJ9m4o39VpvcqQmiKoJU7FKiQ287JTup2SehPna+tTYBKqePh9EZDeJeUgf1jBdQSY/NlvFwhJny06SUWTiq26/XXjsgT0D/s3AFPXuUDhT3UxRnIFnzXWrxTTi8DfSMCiiFofUz5B3vHK0twFEFaNaR/HnJCA/chutEfyJyWxBHuQ2sBZjkOFzIkxJG40Ho4VzGgowAEiOHvBRUj837YxiQLaYwQ2UO3YdvL3lmsRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YBBeAPmqQzjWpIL29cdmeRYFC+g6k7S/y9sjQv1y9Bs=;
 b=TiwnDRNjf2r1CSJr/RmlfsAh6kbNm5+vyqU3IY6KpDq4q/yRMyDTny9DGhJXfIEDrt/T+AQuPkceKEwEZEzLvy1jvlJTouXgZrEVAxHidP0LFol3haUlolzJbz7Z0ibpGLdJalW37xxaWIHHQb2YviGFGQ1J8sTjUzy318IkVy86tIANxaIk0D0N6jhC+6W6L1CKemilQMtKmQp4JlviX+zr62mapoJlkurVqEVp4d7vnqWWGyj2f9DMdsPjyaY5xw6YSS+18mTBMMhnkih8GAmWYkh/aDpcI9LYaLFaa04MorfmGolwSLhKnJVCioiur6D/k1XJIcTorDwPQWHh3A==
Received: from PH0PR12MB5481.namprd12.prod.outlook.com (2603:10b6:510:d4::15)
 by PH7PR12MB9073.namprd12.prod.outlook.com (2603:10b6:510:2eb::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.23; Fri, 5 Jul
 2024 04:42:52 +0000
Received: from PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd]) by PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd%4]) with mapi id 15.20.7741.029; Fri, 5 Jul 2024
 04:42:52 +0000
From: Parav Pandit <parav@nvidia.com>
To: Lege Wang <lege.wang@jaguarmicro.com>, "Michael S. Tsirkin"
	<mst@redhat.com>, Jason Wang <jasowang@redhat.com>
CC: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"vattunuru@marvell.com" <vattunuru@marvell.com>, "ndabilpuram@marvell.com"
	<ndabilpuram@marvell.com>, Leo Liu <leo.liu@jaguarmicro.com>, Angus Chen
	<angus.chen@jaguarmicro.com>
Subject: RE: [PATCH] VIRTIO_F_USED_EVENT_AUTO_DISABLE: add new used buffer
 notification suppression mechanism
Thread-Topic: [PATCH] VIRTIO_F_USED_EVENT_AUTO_DISABLE: add new used buffer
 notification suppression mechanism
Thread-Index: AQHay2kPZP8Br6Dhi060PfrDxcGZPbHngeKAgAAR3xA=
Date: Fri, 5 Jul 2024 04:42:52 +0000
Message-ID:
 <PH0PR12MB5481C9F0175734E5036FA2A6DCDF2@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20240701034435.675-1-lege.wang@jaguarmicro.com>
 <SI2PR06MB5385346C86CF45806EC6E9F6FFDF2@SI2PR06MB5385.apcprd06.prod.outlook.com>
In-Reply-To:
 <SI2PR06MB5385346C86CF45806EC6E9F6FFDF2@SI2PR06MB5385.apcprd06.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|PH7PR12MB9073:EE_
x-ms-office365-filtering-correlation-id: 84b30535-f36c-4fd3-dc40-08dc9cacee2f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?ZUQ2ahURcBYnU7h7FDRdwUDwryQR9Pwq0NrWXuNc47sdDZe1+PL27sPqRDxl?=
 =?us-ascii?Q?0zFTqpOXLaex9VA9evozBsPZs6Rx02B8GP+S7ZXSngeir4UXifIx4HLIzt5N?=
 =?us-ascii?Q?Q8DIXI0Mqxaca7ZFZU9Lp1kWHTI7G7dRyEiY0WXhoCtka/64Ld/XnQBrITaQ?=
 =?us-ascii?Q?Xb241gg0ksh696VmRWRDNG694MG1yWETiVtF7Ptewf6Lggwp5tWkZXphheSN?=
 =?us-ascii?Q?Ua5tZyl04TKXlQIWGKAY0SwgBJpRd+j8O6VEeN3m7szqBszo5rkiAQAkyZJY?=
 =?us-ascii?Q?IVf0RMchIXRQVoGFPuZa8gERdQJlPNV/WmKx1vH+h1xn4cRd08iNBITCuc7a?=
 =?us-ascii?Q?yVIz4y8SFecX+pk4K0fa8UHbnfSAi78S/Jnc6msBTUPKpggU++08cuzBekcZ?=
 =?us-ascii?Q?JPlkO5wzw6Eeeered3cooWMv9jqivjIYcy75kps0Brp6Q9otTU066YQN6D+Q?=
 =?us-ascii?Q?vBfloiBmw57FkviTNErtoqdy/Me4WOpApJtgM91jDjpum+fFumxBMdoa9Jyo?=
 =?us-ascii?Q?qUT+TduMgJ2Ebq42kaWLyoE2ZDu6jhdv/4te/NH1AeLo50i9jIn0x+rA/tDp?=
 =?us-ascii?Q?NV0t0dMpQifTqZBCxGxj1ko3js4CsKBbNIbam5jqSnghXwEcGEq5hofwAh2K?=
 =?us-ascii?Q?nZ7rVJTmXicswiFm8mCYSFf4gANNI24D+dtcrvUr5iTqORXahf3fkOuAsk6h?=
 =?us-ascii?Q?j0vJV7m9DEMMRwXcP12GzVROmKtBlIdlTiIPJ5juJkkMM/Yvluo9IvGkdLAv?=
 =?us-ascii?Q?kyGPmfq7IKWd2Mw+Ngu0JdIEi7TZu61Wj0bGrKwNRM5LjEcHd1iH/wnPVYBX?=
 =?us-ascii?Q?0qNTcJbvxca0mwdLxCt9dZazxZaxyGvtob6haHxhnH5MVWjmdBmdPoawHEYX?=
 =?us-ascii?Q?7Dd0Tj9MtDmmn4d3kufKbRwSosVA0djiIDwcUpiNFmwxNY9z5GP9aPnDo+Vd?=
 =?us-ascii?Q?k22eG/ySZXdc8qzPkz/XKHC0an+nRHp1fVHJCSXDwFuyt56huIsjT3u+4yTP?=
 =?us-ascii?Q?/RVmTmKONkB5t7Suf2NyC3QICm8YQrmFvhCBte/UIpd3K6YwFIi7QQ9t1eHU?=
 =?us-ascii?Q?8wzjFVZNa+jE83Vmyx6Ra6BAkV41hGTzn2u/gUGK66p3MRbqP6SZtZJuZIhX?=
 =?us-ascii?Q?nzPdb7N1Oq1hLrVmGayIkAiZtuQyp/kNeopf8jov6IRLF+SeLieJlUOaeEjD?=
 =?us-ascii?Q?8P/mY1ZHJ4BqD3ynGPI7pdkhll25CL6EKp7LHdmipmz0HvaAmhi8CambgHsG?=
 =?us-ascii?Q?r89XU0ukxNZri74IlEO+j6UxJONa2N1P7/SI5QbH5lg7wnBM7GRqKRm7EnRS?=
 =?us-ascii?Q?dhI6eo4BkJtRbnlaWv0orGc0U+8h9sCeUBJy1yYldi4WTBmueFjalKtuS/hc?=
 =?us-ascii?Q?0p6wrF5KLhzM9Gt/pDaxsTlYvdeqGuKIIr8E79eFMzURf4RL7g=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?dRMM4XyJxLCwcJbEsNh9IufU/WNTI3eBfYW6bYTCT/9qeJnlSQ5z1jZRs68x?=
 =?us-ascii?Q?dziM3a0M6z8AJN6fybkMwK9l825oLllSQPhvoLf9uSzJDaxEyeyASZQUqlbP?=
 =?us-ascii?Q?VUwruBsYh53I0bXKHzUoOHjH06X66TJgRHxWszrqNvD48588HsjPOKYQFgvf?=
 =?us-ascii?Q?mZCvee/tFLAA7MZ8e69wmEvslHhj0ANG+XZeyXcT22zegLa8GtdQhEsJsbdV?=
 =?us-ascii?Q?J9BUctLF7f1dbzXpO2JvrXS3p6MmszLa96lNjbWc1DGsW7vTq7z/S0sdLXyM?=
 =?us-ascii?Q?qJuLXoTyoavSmuBR+Vi4x0BwQ1rL6vG/hrD/OR96flaruWvEY/RTNC23FFpp?=
 =?us-ascii?Q?ASZp19lNZUUjo8O+IiToTgWmwMCbNZz+bVnzT+j94YHYF4q4ungKzfy+v+Ve?=
 =?us-ascii?Q?iRE6X1K3+j/nby74AMsuGJfz7tX8l4VhF1JBaTmVEhyw92nf2tJVBDSaNsKj?=
 =?us-ascii?Q?7HeAPNQspwTQ86gt0gPcEjF0gzokbeJENzY39AGm2Wj1jKSv3ot7mFe55UW/?=
 =?us-ascii?Q?688NJ5JEz9ZWx88HOjiLy8OYdjaG0WNN7Mthoqw6OW97HJFWnvyHufs1KKA3?=
 =?us-ascii?Q?WQ9YNWYeE5jgfTL8XAnR2JCTsUTfcleS/1OnmLuikP36Fekab8gVKIF4Bhj1?=
 =?us-ascii?Q?pO8I8z7f2S2ZRbq6PmVmToj2SMjnc9bfhP7Ou2f9f6fPNw4X4y7Bjxl7ZHmo?=
 =?us-ascii?Q?PhReaU+RrGz7i9oMoEVoCsCNJdg1v9z3pvmAHV96V9+U8jDXgCimkI+OmjPJ?=
 =?us-ascii?Q?JsnDLQgQLC+gyZ78WEEzQkzjiVn9/7po0z0y84OJV3ZAOf4LrNxZOUnEFg5F?=
 =?us-ascii?Q?XiVBz1ZhuShdMhk/Bg0Obm1Yi2JmKn322S4CEyZmT5BjtVa/PMhwH+DwoIpY?=
 =?us-ascii?Q?35yDT4YA84mY+yWlf8m9w8T13hAkn0JBLuQhlAv12x8ezYVHcFrAJQEpA5tt?=
 =?us-ascii?Q?n4H5XIsH537CFfUVlCMsQtoq6vA6fJrNLU4Z98tsce3OmhTamN+CODklEoyQ?=
 =?us-ascii?Q?r4Kuxsw+zfQQJa6nUAA2+EKPYtl1IMo6n2aMeEn4aMnAfDxQWDmuVXvstEMI?=
 =?us-ascii?Q?v91x4WIJ0TcMUw+RCEpWtH1//Vq5UmAwJk2upDi+ocKyciK+kNdv7EhsgrGO?=
 =?us-ascii?Q?kgWxTTCWwfyACEZhbm8yUTM6kTR3sUCYfykSixL2NcL3NhoUsdNDZzcZrRWX?=
 =?us-ascii?Q?LDpFNJYVRjdWy4N/yDyaSaFJGCugSkPK2wd2XVl2HAvfza8ubkGRhUNisfCI?=
 =?us-ascii?Q?mxPgMkFFT05+oop7yR1Nwp+3x2M3BX46ji0WCLku56oOK/smAUx/y03U4Lpv?=
 =?us-ascii?Q?x/xlp3wwHNybnEcRG/8TUBGuSGAYsN77UyWdw+Ac82lD5brP0ELVo0+kxx77?=
 =?us-ascii?Q?uVZdcY4zDw6A+LLySwtHaw6nbqjHj+dSF8csDtg2SGmu4CjRE+xQ4d6fM1pH?=
 =?us-ascii?Q?x1+OuqFxVRv9OFAcDiGUoPMxgpUN5HA2dTXWK+YbA/z71M+itXBLiiDJdPXa?=
 =?us-ascii?Q?Lxy1Ds0jVT3+CTNOSTe1GRMIeiDq/eqhUIz5a9wqc7OcU5oqQT5i2vlAzQ42?=
 =?us-ascii?Q?yNTaZEnQ6Vr2iVhxbiY=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84b30535-f36c-4fd3-dc40-08dc9cacee2f
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2024 04:42:52.4152
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uGJkNoHAZYQ3oUv0izhdm9cvPcUb1DTu79dGla5RGQqE0Xlff2cYKqWlU4w92Z1zJizRnB/ly91GKxTEP5TkbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9073

Hi Lege Wang,


> From: Lege Wang <lege.wang@jaguarmicro.com>
> Sent: Friday, July 5, 2024 9:05 AM
>=20
> hi
>=20
> Thanks for your comments in previous discussions.
> I'd like to confirm that do you understand this proposal's idea now. If y=
es, I
> may start to prepare a more formal V2.
>=20

Notification enablement offset adjacent to current notification offset seem=
s a better approach than adding the new capability for following reasons.

1. pci capability area (non-extended cap) is full to its capacity. New addi=
tion can only work in theory.
An obvious alternative is to add the extended cap and add there.
However, it is not a good idea either as the PCI spec strongly recommends t=
o not keep adding vendor specific stuff in the PCI capability section.
(even though an option is kept for the vendor capability).

2. New area adjacent to current offset can further is simple enough to util=
ize.
There is no good reason to complicate by another extended cap.
If there is one, lets discuss it first.


> Regards,
> Xiaoguang Wang
>=20
> > -----Original Message-----
> > From: Lege Wang <lege.wang@jaguarmicro.com>
> > Sent: Monday, July 1, 2024 11:45 AM
> > To: virtio-comment@lists.linux.dev
> > Cc: vattunuru@marvell.com; ndabilpuram@marvell.com;
> parav@nvidia.com;
> > mst@redhat.com; Leo Liu <leo.liu@jaguarmicro.com>; Angus Chen
> > <angus.chen@jaguarmicro.com>; Lege Wang
> <lege.wang@jaguarmicro.com>
> > Subject: [PATCH] VIRTIO_F_USED_EVENT_AUTO_DISABLE: add new used
> buffer
> > notification suppression mechanism
> >
> > Currently for the PCI transport, used buffer notification suppression
> > informations are located in guest memory, for example,
> > pvirtq_event_suppress for packed ring and virtq_avail for split ring,
> > then PCI devices simulated by hypervisors, such as QEMU, can vist
> > these suppression informations directly before issuing used event, the
> > only overheads may be just proper memory barriers, but for some
> > hardware PCI devices offered by DPU(Data Processing Unit), DPU would
> > need to submit DMAs to copy guest suppression informations to DPU
> > internal memory, then check whether used event should be notified by
> > examing this internal memory, which is obvious expensive, and this DMA
> > operation is needed every time DPU attempts to issue used event, DPU
> > may also choose to add a hardware component to polling suppression
> > informations by submit DMAs continuously to get newest used event
> suppression infos, but it's also expensive.
> >
> > To help improve this sitiuations, add a new feature:
> > VIRTIO_F_USED_EVENT_AUTO_DISABLE. When this feature bit is negotiated,
> > devices will place new notification area for used buffer suppression
> > notification in PCI bar specfied by virtio_pci_notify_cap, also for
> > better used buffer notification coalescing, the device will disable
> > later used buffer notifications automatically after sending one used
> > buffer notification to driver, and after the driver finishes handling
> > current used buffer event, it needs to notify the device to enable
> > used buffer notification again by writing above new notification area
> > in PCI bar. Device will receive this notification reliably, and device
> > knows that it can issue used event now, but it may choose appropriate
> > timing to send used events according to its notification coalescing
> > policy , now it also does not need to DMA guest memory to obtain
> notification suppression.
> >
> > Signed-off-by: Xiaoguang Wang <lege.wang@jaguarmicro.com>
> > ---
> >  content.tex       | 38 ++++++++++++++++++++++++++++++++++++++
> >  transport-pci.tex | 26 +++++++++++++++++++++++++-
> >  2 files changed, 63 insertions(+), 1 deletion(-)
> >
> > diff --git a/content.tex b/content.tex index 0a62dce..84505da 100644
> > --- a/content.tex
> > +++ b/content.tex
> > @@ -448,6 +448,7 @@ \section{Driver Notifications} \label{sec:Basic
> > Facilities of a Virtio Device /  The driver is sometimes required to
> > send an available buffer  notification to the device.
> >
> > +\subsection{Available Buffer Notifications} \label{sec:Basic
> > +Facilities of a
> > Virtio Device / Driver notifications / Available Buffer Notifications}
> > When VIRTIO_F_NOTIFICATION_DATA has not been negotiated,  this
> > notification contains either a virtqueue index if
> > VIRTIO_F_NOTIF_CONFIG_DATA is not negotiated or device supplied
> > virtqueue @@ -488,6 +489,35 @@ \section{Driver Notifications}
> > \label{sec:Basic Facilities of a Virtio Device /  has been negotiated,
> > these notifications would then have  identical \field{next_off} and
> > \field{next_wrap} values.
> >
> > +\subsection{Used Buffer Event Enable Notifications} \label{sec:Basic
> > +Facilities
> > of a Virtio Device / Driver notifications / Used Buffer Event Enable
> > Notifications}
> > +This kind of notification is only necessary when
> > VIRTIO_F_USED_EVENT_AUTO_DISABLE has been negotiated.
> > +When this feature bit is negotiated, the device will disable used
> > +buffer
> > notification
> > +automatically after sending one used buffer notification to the
> > +driver, and
> > after the driver
> > +finishes handling current used buffer event, it needs to notify the
> > +device to
> > enable used
> > +buffer notification again.
> > +
> > +\begin{description}
> > +\item [vq_index or vq_notif_config_data] Either virtqueue index or dev=
ice
> > +      supplied queue notification config data corresponding to a virtq=
ueue.
> > +\item [used_off] Offset
> > +      within the ring where the latest used ring entry the driver has
> > processed.
> > +      Without VIRTIO_F_RING_PACKED this refers to the 14 least
> > + significant
> > bits of the
> > +      offset (in units of descriptor entries) within the descriptor
> > + ring where
> > the latest used
> > +      ring entry the driver has processed. With VIRTIO_F_RING_PACKED
> > + this
> > refers to the offset
> > +      (in units of descriptor entries) within the descriptor ring
> > + where the
> > latest used ring
> > +      entry the driver has processed.
> > +\item [used_wrap] Wrap Counter.
> > +      With VIRTIO_F_RING_PACKED this is the wrap counter
> > +      referring to the latest used descriptor where the driver has pro=
cessed.
> > +      Without VIRTIO_F_RING_PACKED this refers to the most
> > +significant
> > bit(bit 14) of the
> > +      offset (in units of descriptor entries) within the descriptor
> > + ring where
> > the latest used ring
> > +      entry the driver has processed..
> > +\item [enable_notify] Whether to enable used buffer notification.
> > +      The driver may benefit from just informing device the latest
> > +used ring
> > entry
> > +      it has processed, but not enabling used buffer notification.
> > + This field
> > only
> > +      occupies one bit, if set to 1, it will enable used buffer
> > + notification,
> > otherwise not.
> > +\end{description}
> > +
> >  \input{shared-mem.tex}
> >
> >  \section{Exporting Objects}\label{sec:Basic Facilities of a Virtio
> > Device / Exporting Objects} @@ -872,6 +902,14 @@ \chapter{Reserved
> > Feature Bits}\label{sec:Reserved Feature Bits}
> >  	\ref{devicenormative:Basic Facilities of a Virtio Device / Feature Bi=
ts}
> for
> >  	handling features reserved for future use.
> >
> > +  \item[VIRTIO_F_USED_EVENT_AUTO_DISABLE(42)] This feature indicates
> > that the device
> > +  will disable used buffer notification automatically after sending
> > + one used
> > buffer notification.
> > +  Note: when VIRTIO_F_RING_PACKED has not been negotiated, the
> > maximum queue
> > +  size MUST NOT be greater than 16384, when VIRTIO_F_RING_PACKED has
> > been negotiated,
> > +  the maximum queue size MUST NOT be greater than 16383.
> > +
> > +  See \ref{sec:Basic Facilities of a Virtio Device / Driver
> > + notifications / Used
> > Buffer Event Enable Notifications}
> > +
> >  \end{description}
> >
> >  \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature
> > Bits} diff --git a/transport-pci.tex b/transport-pci.tex index
> > a5c6719..62ba9dc 100644
> > --- a/transport-pci.tex
> > +++ b/transport-pci.tex
> > @@ -551,6 +551,13 @@ \subsubsection{Notification structure
> > layout}\label{sec:Virtio Transport Options
> >          cap.offset + queue_notify_off * notify_off_multiplier
> > \end{lstlisting}
> >
> > +If the VIRTIO_F_USED_EVENT_AUTO_DISABLE feature has been negotiated,
> > \field{notify_off_multiplier} is also
> > +combined with the \field{queue_notify_off} to derive the Queue Notify
> > address for enabling
> > +used buffer notifications within a BAR for a virtqueue, but add a 4
> > +bytes
> > offset:
> > +\begin{lstlisting}
> > +        cap.offset + queue_notify_off * notify_off_multiplier + 4
> > +\end{lstlisting}
> > +
> >  The \field{cap.offset} and \field{notify_off_multiplier} are taken
> > from the  notification capability structure above, and the
> > \field{queue_notify_off} is  taken from the common configuration struct=
ure.
> > @@ -563,7 +570,7 @@ \subsubsection{Notification structure
> > layout}\label{sec:Virtio Transport Options
> > \devicenormative{\paragraph}{Notification capability}{Virtio Transport
> > Options / Virtio Over PCI Bus / PCI Device Layout / Notification
> > capability}  The device MUST present at least one notification capabili=
ty.
> >
> > -For devices not offering VIRTIO_F_NOTIFICATION_DATA:
> > +For devices not offering VIRTIO_F_NOTIFICATION_DATA or
> > VIRTIO_F_USED_EVENT_AUTO_DISABLE:
> >
> >  The \field{cap.offset} MUST be 2-byte aligned.
> >
> > @@ -596,6 +603,23 @@ \subsubsection{Notification structure
> > layout}\label{sec:Virtio Transport Options  cap.length >=3D
> > queue_notify_off * notify_off_multiplier + 4  \end{lstlisting}
> >
> > +For devices offering VIRTIO_F_USED_EVENT_AUTO_DISABLE:
> > +
> > +The device MUST either present \field{notify_off_multiplier} as a
> > +number that is a power of 2 that is also a multiple 4, or present
> > +\field{notify_off_multiplier} as 0.
> > +
> > +The \field{cap.offset} MUST be 4-byte aligned.
> > +
> > +The value \field{cap.length} presented by the device MUST be at least
> > +8 and MUST be large enough to support queue notification offsets for
> > +all supported queues in all possible configurations.
> > +
> > +For all queues, the value \field{cap.length} presented by the device
> > +MUST
> > satisfy:
> > +\begin{lstlisting}
> > +cap.length >=3D queue_notify_off * notify_off_multiplier + 8
> > +\end{lstlisting}
> > +
> >  \subsubsection{ISR status capability}\label{sec:Virtio Transport
> > Options / Virtio Over PCI Bus / PCI Device Layout / ISR status
> > capability}
> >
> >  The VIRTIO_PCI_CAP_ISR_CFG capability
> > --
> > 2.34.1

