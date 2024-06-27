Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2047.outbound.protection.outlook.com [40.107.236.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5FD5145A1F
	for <virtio-comment@lists.linux.dev>; Thu, 27 Jun 2024 13:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719493447; cv=fail; b=m7LXezLOygos+oZB3v1kusj5gOzigSCOV/aCBYSzd/sp4FsiQGoO7BWFubhMbVInuNKW7QcJePOZyAsHaW108Uvq6JNhLbQ4QVnc8oBLQwOuWFad7WReVWBREjhv8RNt4LE3/fwN3R4mbYcm+ySGORbR01PzSYMlMurJRdwn8Ug=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719493447; c=relaxed/simple;
	bh=Zya78d4SfcMnuQDu95Jiu9JVkDz5cJBSKDdItMS9pLo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=q1FTCGngNOJ+S816KE/ZDVf+jQ54ncYI+D/DfjBL1+tXFaNoLOzXh+Q7hZ4zk5nPfWIJzZ3TjXbKdva3qM3v63xAybDHYZ7xboRiCoZ5H0zYVcJMJSXJ5rCsqp8oo1Z6arT8hRKxAJ50JYG1YOfL4cOT8hsxAT13rT+8CmNpt0g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=DKAyL34l; arc=fail smtp.client-ip=40.107.236.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="DKAyL34l"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=enENeRJzdDgYF/Xy6b/pFNR6FEt4Q/uaqarrwXuXviRkOx1D32phZxiPU40XSHEx9WlrLBH2Y88jw+H0lS3V+RgA2r6eUNwJDHFWVgy+HFejzyeYaNKUWsvoT0QhlcAEWQWphnbOgsuoWf659bZSW2fX4kAM+6kwUpRdqV1SagzTESWKZRv2oq0tJ95PW4QLiMgSD5nEB096VF6kY3a5CIsmnMlKfjr9yo8uEdfGrAXfPo8BNvRcRVpEQEsC68ENQudoQYwLOFwoi+6/Jxg3DCCMl9l8Hdam1ZdDLTIvJqJ1HkY6j1vlyVYdHnt/bU4egjv5jLYJYqq9AYFJ+zO/ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OB4/sRVEnAbOoWtNKmskLebBUa4/nvVHBm8mr6DFIes=;
 b=IqtS6+Rqb+EvvsbEwSpuiDDTUSpUrh1ZmEMn4p8uANRrSHjYk307HH4gCozPw9e/aMlwo4WauoCWVr00WNH/yxCxZY3tN/Cs4Dl1catOF0war4QC/LZ/ZZPdTBrHzG59swPy5PXmGt5aan6lsQMDM86D2uFUdWspOlsFEj5t3/C20GcAKXuQViZ3IHn2iAjFCITZqvCcRox0X4LtcW1gBP3bLW65tFaGj5QVd0qjy5Twf//5yMgqC8Dd3Uv6f4MZKz89DOjvo1P0YvdvIyqLfsejvcTXAPC0x5GLHf8wgx8o/GYgRldHQvOwoS0CG6uXui22bkpZ2SltrtPxBdtpfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OB4/sRVEnAbOoWtNKmskLebBUa4/nvVHBm8mr6DFIes=;
 b=DKAyL34l7BVKp8hmNe3y5zd+pgOtN5XeQrfjXVzoYX5wbrmTyTlSMrb03rTYUcPkHUsLgPJapp2ctWpsCzYnyMnxyGJE+MDu9RMi5YCZbAUYWgCHPBez0filauECSh/+TCdauzwovHnH+Ryku46NFqQU5h+jnopTUbhov/RU8fqmF5cKgbtPyvTWn6QAHslnzUw++7WNT+7BXlvbFSbXvoYCe1jSvz+tlTp99w2NBqdyqVc8qeKZ+4ttJ3Nnz8LQpuecKsmurul9vTC363HjtuE/OqpV1Z5fFJ6CgMcYnKGrNfxIiGnSDXT68SYrIkXhFpZ4CPKiLh9F8M8DUK/GWg==
Received: from PH0PR12MB5481.namprd12.prod.outlook.com (2603:10b6:510:d4::15)
 by BY5PR12MB4275.namprd12.prod.outlook.com (2603:10b6:a03:20a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Thu, 27 Jun
 2024 13:03:51 +0000
Received: from PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd]) by PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::361d:c9dd:4cf:7ffd%3]) with mapi id 15.20.7698.033; Thu, 27 Jun 2024
 13:03:51 +0000
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: Halil Pasic <pasic@linux.ibm.com>, Si-Wei Liu <si-wei.liu@oracle.com>,
	Heng Qi <hengqi@linux.alibaba.com>, Cornelia Huck <cohuck@redhat.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>, Jason Wang
	<jasowang@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Subject: RE: [PATCH v5] virtio-net: clarify coalescing parameters settings
Thread-Topic: [PATCH v5] virtio-net: clarify coalescing parameters settings
Thread-Index:
 AQHasLoaN9ph3vhoUUGX8SYFd1DUAbG8yd8AgABtagCAA8+PAIAADeSAgABwqwCAAPC3gIAAYYKAgAAUBtCAAmSdAIAGCjaAgAFhA4CAA602gIABKGqAgAAiYICAAVWGgIAAHi+AgATuKICAAAse0IABSmaAgAIvtgCAACDlAIAAAe7AgAADBoCAAAE2IA==
Date: Thu, 27 Jun 2024 13:03:51 +0000
Message-ID:
 <PH0PR12MB5481AC5003763A6C07947DA5DCD72@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <e774e811-27ba-4151-b300-e22161f1b4d5@oracle.com>
 <1718940245.6932242-13-hengqi@linux.alibaba.com>
 <b9e47c91-46aa-4526-b441-de48906f1ae4@oracle.com>
 <1719020069.8729858-17-hengqi@linux.alibaba.com>
 <f03e76fe-9ee8-4000-b41c-0b284f2f237d@oracle.com>
 <PH0PR12MB54818CFB447152A25130F9B8DCD52@PH0PR12MB5481.namprd12.prod.outlook.com>
 <bca1e5e8-65af-4825-b6fe-2ca3b6c41feb@oracle.com>
 <20240627123732.0cf541b3.pasic@linux.ibm.com>
 <20240627080346-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54810E5C9E7B309C5A296F7CDCD72@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20240627084719-mutt-send-email-mst@kernel.org>
In-Reply-To: <20240627084719-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|BY5PR12MB4275:EE_
x-ms-office365-filtering-correlation-id: c3158957-3de7-4687-2521-08dc96a997a5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?jdUTx8JNJ3w5Mjp/A5C12+KODNRT/ibp6vGvUsdRP6csyDknIuzb8i03EfiV?=
 =?us-ascii?Q?yyPaIH8IsmiOnjv4Vdc18dKJsQMzFY39TRb9dxT+EljzPbIAn3nO5voBGa3w?=
 =?us-ascii?Q?jkzR7liahYvzi2+kI61mrXpH0wFigjdmMqGBCBBVoP9OLl26l4UmCbmRhGf3?=
 =?us-ascii?Q?Mdf8/zrKBRzZl4iS37gakUfjlaA4bszkz6Patqbjyj5UsM2ucr9EHnbnEmPy?=
 =?us-ascii?Q?q/EieRLj0vKUNY6dw/Urgz/AzSWo21Hh/sr8jaWN93oDpLYGIt7yvUGWAbwa?=
 =?us-ascii?Q?tPOcp8KatCqi0o0hFuN+Cg4UnjWz5cNNT1aZhRosO709YIFwRvAnDaxNTqEb?=
 =?us-ascii?Q?jbxQgd12ghypwGSub3ewa4Nz3DgMhbBzJIUsJds6ioUfsD58BHTrnCPS58Y3?=
 =?us-ascii?Q?ZpLtu4VrhFeeXdY6sRJV1R0+4qz06x/o8TSb1nD5kJ7SnlXJ0tVmP8Y+oSjq?=
 =?us-ascii?Q?Xp2dJDRr+eWl6csy8BQJlgEk3e7sgdNJsAQqIZ3YIsxuqKi7ZpR3J46uanpT?=
 =?us-ascii?Q?saPVyvZTOZmTHNa/a350BTg6ApOiSJTvq6mSCTleNQgu4GysmPh4Kp3YEJda?=
 =?us-ascii?Q?egRwIs5lmLjR7LhDyZfg3wrLD2ag8QzHSn5gEdpuR0Vay50TfZ56vPiEACzB?=
 =?us-ascii?Q?IYWQ/ZX7BGjSJwcvZa3bq0HzsfLSKIiLrZzka00mdGsx7J0eLCG6TydN6Da4?=
 =?us-ascii?Q?ZHzF4qNEoXuYMhZQEmOUDoCAE96bzVxpJdGuuwE99ETXArRTeDKKXYmxwoIh?=
 =?us-ascii?Q?pg/BaQrve2upBCbZ0mAod2+J5ZdCIeeMjAb13yA/Qt20sapNuJMChCvAX5RI?=
 =?us-ascii?Q?iJzVQ6PAI2yO+okBnQGNQz/QGaWxt7OGhWU4cPaOurCs48Og5ZwvT0kGGyAP?=
 =?us-ascii?Q?ssKskQTI+O6YQzoQvNRoXbkekKOEs0fZw+JsUrcLlCg5c1fT+FgYPcaWrvT/?=
 =?us-ascii?Q?IZrATwQEO+kGDY0i71E+LZhGbc55A21otW6vo2WDTV+fXFd+LGYIBHBXJ53M?=
 =?us-ascii?Q?gVr8SQK+lPSPJ6b62WLkzVfevxdr0pH2dWU2JwJK08QqLFXx8P255CB+ilNM?=
 =?us-ascii?Q?FA5kyk7Zd6y+b0dzhnGgvHDh7H2ukrgJM3feaPilhEPyXfdPVOE6yGWYqysF?=
 =?us-ascii?Q?cNSlhv2DtNlOR0ExbpFd80qdElkj8Kxdhf1mKUG4lL68qXzlnCPP7DoOs/8F?=
 =?us-ascii?Q?eZEtTMn7ylb3jCu3QMKWeCEbglvPd1Td1RX6mxscjR6s9iJ7Q4+Usz94f/4E?=
 =?us-ascii?Q?bS26M4b8qRVgxmmu4rrlz5bjUe1qDbHDQZXipXsVxM+upGQOKZyJRIe4UGpK?=
 =?us-ascii?Q?xTDA70nDrINbKpO6rLRUCika+dINrH7ykFr3ESCkmRMVFoxUrTlinEdUwP4O?=
 =?us-ascii?Q?kduTP08xD+vHMmBP+A2KTmHtsBkYw0mrlF+A7SOtQmQoptHxaA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?p43kS64dxxMMalMCqnzKEB4+phTM4JtQpygRtr6TMPEPYPtcriwFngIsTbDw?=
 =?us-ascii?Q?De6xxgaCJnDcrVZMwCGrvgKJ/kJaGSkzqgfoWc6S4BXhBIgAGuranqW80Y38?=
 =?us-ascii?Q?qOTuKD9kjujU8HAOPj8frLPBuGpI/8B/dWQo22U5m4ekK7Hq/uRVyR/F+bQi?=
 =?us-ascii?Q?ydWgbF0AevZXIq/0/JRjJ+dz0x/eONoqtcH5Mz3efRJkfcpLeygglsNMwrri?=
 =?us-ascii?Q?n3OEBqtECeZIFQxamW/9sWT9kiHtZER58rnS9xnued3WcM4KTYw+vMEa53/l?=
 =?us-ascii?Q?5h6ndgyflqu9NKh3L5p0bR8KnjDhqq5bLjSxa+rQtJnvrQ8jsYWHQpLALVTU?=
 =?us-ascii?Q?si8QbbQCqpS1G7x06uz9I9KhkFHOC11Jfs9DgFNtuQp4OQ33S1iM9RjuQxO3?=
 =?us-ascii?Q?SjrE+X8pekZParksoN01Xxz9+xsC6wujhXYoJumcy+MTExcoQVmSS6JbHUks?=
 =?us-ascii?Q?mvE4pdcEUcLDoHDTR7qrogJz1A2mORXZP0JreQwiYXgVEH2tPKAQX1rprCzh?=
 =?us-ascii?Q?FnhDY9LrAN3egupqTY5nHoqNvcceanKgMyFtknDkS4Z6aHyd3Jp+IEeJJUVv?=
 =?us-ascii?Q?GvJj1Rhs6gZdB6dOXhwvSe2wnSkMUSsfqZ0oofiCmfEaITUx4b8aYjfaL0LK?=
 =?us-ascii?Q?Y0/zybgR7b3r5LowfJdwURuOUdOkD405/m6b5r5biJS4X2hPazYHna30X6w4?=
 =?us-ascii?Q?MaNo/wGxyTxr2CI/JWd9jDzCe8PSsBQsnlqYnRdzJEy9Z9CrTc58QgMFEel/?=
 =?us-ascii?Q?ONchGuc+McIPjIBK85oP4XcTeDv3A9oXnqlwIgbFSjt8y50pN+x5VmBrU+6/?=
 =?us-ascii?Q?PKOKMfLFUgtk7NtUtR1PoLI9bNEXW1A+cUz1UsYlwC0Nm2Kd+yNGhGZZpwCy?=
 =?us-ascii?Q?B3ZwjzPxV9YniJazvWqwMjZhA0Txgk+EPGiwU66BWFPl5QvVWV+MXQyn8NFZ?=
 =?us-ascii?Q?33ODMlg33PBUyrUoJIlXdwOgtW4F14H8tI/WBhI7C1iQdzqxkeArdHQiQWPB?=
 =?us-ascii?Q?/gSxB4ZFPEeFA5TMA9n6Ipzn7ekUsmihPzlXTqdv60y4g0QseDApiiu1zLqB?=
 =?us-ascii?Q?WnDeNpuwQPPxv4kqTtNEp7GYaAGXNxa9mnE8sE2ybksb/tJG6gGjOZERkrtx?=
 =?us-ascii?Q?YKlltyXzAsP0bU5n2AwAzDmJZm/mwudEcPzJ7wAoYR3hdzzoyD59HP0xroae?=
 =?us-ascii?Q?fD2kF0AUiDPXBY184JhgQ1LAXdRNm5WXtAiA11oKqmiotmwAVJpGQoZIQe28?=
 =?us-ascii?Q?u6zF4RCaqkhsCvjfLDfttfzr70+dDavX/vHv2lcrML8EDSOE5+fdi7p+gMph?=
 =?us-ascii?Q?tMMdysR38Rv+ZRli7PmipLcJnBxnaLy4OvLoGtmEA5C55ri+4nBhH3x7y8lM?=
 =?us-ascii?Q?lnEd45dvh8wyBYMRun/zE0Lx30gQif7HmqfWaEGlJfCFuHGVn9k+PL5oj5Z4?=
 =?us-ascii?Q?jHunnMX/gdv14oXI0cfJibkVIMDsqnOzjrH0tDzMLvIM7NnaKn/TWjSO+LEG?=
 =?us-ascii?Q?BYXA6m0JUAfst32f1CJy7BJwCaz5q9Vl8Ud/z6HvUBJxwds7NkXSDT5/9jgF?=
 =?us-ascii?Q?m967OhWRbGb8NxSX/HY=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: c3158957-3de7-4687-2521-08dc96a997a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2024 13:03:51.7485
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IdeDjdWUa3my1Xh/3w3r84ICcWxKn1/IN+SNE2DtKGNum7uFhrvkEx4iDvFXAQanHa+dtpVy3TvENr3WDNbwUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4275


> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Thursday, June 27, 2024 6:23 PM
>=20
> On Thu, Jun 27, 2024 at 12:45:49PM +0000, Parav Pandit wrote:
> > Hi Michael,
> >
> > > From: Michael S. Tsirkin <mst@redhat.com>
> > > Sent: Thursday, June 27, 2024 6:05 PM
> > >
> > > On Thu, Jun 27, 2024 at 12:37:32PM +0200, Halil Pasic wrote:
> > > > On Tue, 25 Jun 2024 18:14:15 -0700 Si-Wei Liu
> > > > <si-wei.liu@oracle.com> wrote:
> > > >
> > > > > On 6/24/2024 10:56 PM, Parav Pandit wrote:
> > > > [..]
> > > > > > I saw the need of this proposal slightly differently in the
> > > > > > discussion with
> > > Heng in v4.
> > > > > > The way I understood is, proposed relaxation enables below
> > > > > > Linux driver
> > > flow to work as equally as without device offering
> > > VIRTIO_NET_F_VQ_NOTF_COAL.
> > > > > >
> > > > > > Flow is:
> > > > > > 1. The device offered feature VIRTIO_NET_F_VQ_NOTF_COAL 2. The
> > > > > > virtio-net driver negotiated VIRTNET_FEATURES that has
> > > > > > VIRTIO_NET_F_VQ_NOTF_COAL
> > > > > >
> > > > > > 3. Because VIRTIO_NET_F_VQ_NOTF_COAL is negotiated, device is
> > > > > > not
> > > applying any coalescing on the VQ, in a good hope that driver will
> > > perform VQ notification coalescing.
> > > >
> > > > I have certainly understood this differently. When
> > > > VIRTIO_NET_F_VQ_NOTF_COAL is not negotiated then the device is not
> > > supposed/allowed to do any interrupt coalescing (notification
> > > suppression may still apply).
> > > >
> > > > If VIRTIO_NET_F_VQ_NOTF_COAL is negotiated the device is supposed
> > > > to/MUST do the coalescing according to the parameters as described
> > > > by the virtio spec.
> > > >
> > > > Michael, Jason: Can you guys weigh in on this?
> > >
> > > I still don't understand why this change is needed.
> > > We have this text:
> > >
> > > 	The device may generate notifications more or less frequently than
> > > 	specified by set commands of the VIRTIO_NET_CTRL_NOTF_COAL
> class.
> > >
> > > and
> > >
> > > 	The behavior of the device in response to set commands of the
> > > VIRTIO_NET_CTRL_NOTF_COAL class is best-effort:
> > > 	the device MAY generate notifications more or less frequently than
> > > specified.
> > >
> > > So with no spec changes, devices already can do what this patch says
> > > they can do - send notifications less frequently.
> > >
> > > Re-reading this spec text, maybe the confusion is that it mentions
> > > set commands specifically? And it's also stuck in the middle where
> > > it's easy to miss.
> > >
> > > So it would seem that the following should be sufficient, and it
> > > looks like a small clarification we could just apply and include in
> > > the vote for the csd. What do you guys think?
> > >
> > >
> > > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > >
> > > ----
> > >
> > >
> > > diff --git a/device-types/net/description.tex b/device-
> > > types/net/description.tex index 76585b0..d6788df 100644
> > > --- a/device-types/net/description.tex
> > > +++ b/device-types/net/description.tex
> > > @@ -1711,8 +1711,6 @@ \subsubsection{Control
> > > Virtqueue}\label{sec:Device Types / Network Device / Devi
> > >                                          for an enabled
> > > transmit/receive virtqueue whose index is \field{vq_index}.
> > >  \end{enumerate}
> > >
> > > -The device may generate notifications more or less frequently than
> > > specified by set commands of the VIRTIO_NET_CTRL_NOTF_COAL class.
> > > -
> > >  If coalescing parameters are being set, the device applies the last
> > > coalescing parameters set for a  virtqueue, regardless of the
> > > command used to set the parameters. Use the following command
> > > sequence  with two pairs of virtqueues as an example:
> > > @@ -1726,6 +1724,9 @@ \subsubsection{Control
> > > Virtqueue}\label{sec:Device Types / Network Device / Devi  \item
> Command6:
> > > VIRTIO_NET_CTRL_NOTF_COAL_VQ_GET with \field{vq_index} =3D 1, the
> > > device responds with coalescing parameters of index 1 set by command5=
.
> > >  \end{itemize}
> > >
> > > +The device can generate notifications more or less frequently than
> > > +specified by the coalescing parameters.
> > > +
> > >  \subparagraph{Operation}\label{sec:Device Types / Network Device /
> > > Device Operation / Control Virtqueue / Notifications Coalescing /
> > > Operation}
> > >
> > >  The device sends a used buffer notification once the notification
> > > conditions are met and if the notifications are not suppressed as
> > > explained in \ref{sec:Basic Facilities of a Virtio Device /
> > > Virtqueues / Used Buffer Notification Suppression}.
> > > @@ -1798,7 +1799,7 @@ \subsubsection{Control
> > > Virtqueue}\label{sec:Device Types / Network Device / Devi  Upon
> > > disabling and re-enabling a receive virtqueue, the device MUST set
> > > the coalescing parameters of the virtqueue  to those configured
> > > through the VIRTIO_NET_CTRL_NOTF_COAL_RX_SET command, or, if the
> > > driver did not set any RX coalescing parameters, to 0.
> > >
> > > -The behavior of the device in response to set commands of the
> > > VIRTIO_NET_CTRL_NOTF_COAL class is best-effort:
> > > +The behavior of the device in response to specific coalescing
> > > +parameters is
> > > best-effort:
> > >  the device MAY generate notifications more or less frequently than
> specified.
> > >
> > >  A device SHOULD NOT send used buffer notifications to the driver if
> > > the notifications are suppressed, even if the notification conditions=
 are
> met.
> > >
> >
> > Your changes above are good and they are applicable when the specific
> coalescing parameters are set by the driver.
>=20
> What makes you say this?
Because I was reading this in the CVQ section of the spec where CVQ command=
s are setting it.

> No they apply universally whenever parameters are specified by the spec:
> whether parameters are set by driver or by device.
I see. Upon reset they are set to 0 in the below text, means no coalescing,=
 means quick interrupts, right?

> Is that unclear somehow?
> I suspect you are just reading the wrong part of the patch ...
>=20
>=20
> > The issue that is being resolved is, when these parameters are NOT set =
by the
> driver, when feature is negotiated.
> > What should device do?
> > The parameters are not specified...
>=20
> They are specified - set to 0.
>=20
> > The spec says " Upon reset, a device MUST initialize all coalescing par=
ameters
> to 0.".
>=20
> yes. and device can then coalesce if it wants to.
>=20
You mean 0 means coalescing is disabled (and not quick notifications) ?
And hence, it is device chosen value?
If so, that interpretation would work too.

> > And Heng attempt is to clarify that by adding a changing above line
> > something like,
> >
> > "when driver does not set coalescing params, but have negotiated the
> feature, device may generate notifications more or less frequently than
> specified".
>=20
>=20
> Maybe that is the intention, but the proposed text is instead saying the
> parameters themselves are !0.=20
A clarification like above would be better or 0 means device chosen paramet=
ers would also work fine.

> Which is what triggered the whole mess with a
> misvote: commit log says it's a clarification when it is actually a behav=
iour
> change.
>=20
It is a behavior change to fix/restore.
But if you suggest: 0 means device chosen value, that will work too to rest=
ore current regression.
