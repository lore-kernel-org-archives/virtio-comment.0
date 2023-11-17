Return-Path: <virtio-comment-return-8426-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02946C197A0
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 09:57:56 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 58AD8157EA9
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 09:57:56 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 34B03986E26
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 09:57:56 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 1EE43986E1A; Fri, 17 Nov 2023 09:57:56 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0E3BB986E1B
	for <virtio-comment@lists.oasis-open.org>; Fri, 17 Nov 2023 09:57:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XG92KL0wvHmH4uUNkuWHN9Zf0+FX1xkEJsfW17mi9d6cCJORWKadZqVyxq3Qm+smx7rzgRr55NRWhZsjZd1AliSD2ZabuIfk95ZOZHJf3lMgbTPuuJBS7DgL+89azyN41otNxh3c/XRMqwt2orY/68eya49T0d9lRbOvW6UKg94/2QxnLiITQr2QbekC7vEGIEj3y/oM8Iz2tu0POXWBXAiZ/1ggm316v2DxCTUmBaSOjoAwcqo2vmkMXZJJH98c7pLut4AN3YIYCvn5Luxx61qEc1J66+hdsGK9S6amz7Z9FissWQBC9vJRT/53LiCONP67JvadPxupDgTluE6TCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E+MnHEDomWYa9iv6G/Srm7eHLffvClDS7F+Wwtn0jkI=;
 b=W5+RPEcfBHwJAxknC07pfW+nrILAmz+uBSXIcjp5SgIrY/cvIGSxpOxofuLFtdu9ZC8HD3XSaHo63GDYmgQP0Qufm6J2CRXvZhaiOS7/j4uQdTqYl/kVYW/YJvPwoOgEiDi5hJU/T4B+8XB77jmCFq3Y8tg7by7C6aa+T4xlRFFeB8soG/1toM9RXXt5H8+ZuAyT6UeqLiJM1tVY8wXKXrwdD4optay6kg8lBQTv8MmMKaQ88wS33AI5DHLwDGVYzjsZEMzqNV0vXfcD7eBbdLILA/almO1ClsBC0vbSedJWikzent5y2d76lZppgvZr7/Hg2P/O4YMcJgQ9GHs/IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: Jason Wang <jasowang@redhat.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
	<shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas
	<yishaih@nvidia.com>, "lingshan.zhu@intel.com" <lingshan.zhu@intel.com>
Thread-Topic: [virtio-comment] Re: [PATCH v3 6/8] admin: Add theory of
 operation for write recording commands
Thread-Index:
 AQHaCzPonHREgkZknEiTjfT1JtA3fLBjIMmAgAAcy4CAAWD+gIAAKSfAgAGqygCAABTkAIAGWMEAgAADI2CAAWVPgIACFpEAgAdP4YCAA//WQIAAxB+AgAAJgRCAAA8CgIAAHSmAgAAA6/CAAEWagIAATXNQgAAQ3wCAAAB/YIAADsiAgACQwGCAAGEbgIAAB4aggAAG2gCAAABcQIAAA3mAgAAAL+A=
Date: Fri, 17 Nov 2023 09:57:52 +0000
Message-ID:
 <PH0PR12MB5481E8342B26739B852B592FDCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231116064611-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54814EC9577B1197E2A13BDBDCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231116121958-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481F4D1B07F2809AA7D7C9BDCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231116131303-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54818DBAE43A566C807E1AE9DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117031251-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481D7C85F006AE7292E1D82DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117042446-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54813F2F62F87E42CD5DB4B0DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117044428-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231117044428-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|CH3PR12MB7545:EE_
x-ms-office365-filtering-correlation-id: 2003f6e0-4c7d-4ae3-9cb2-08dbe753a9e1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 mnwFyzfYK7SUCUk6mo4twn96Nq0mu/C3NjkuB18luhmgna9gxC7IB0863bJXHQO6SVqaQs27L95Y3/niw/mjlLzsVJsMWq65u/mXGqH6Ze7qaHJJs/9elZbBjITPinL+qS9aTRQtgxsjgayI459ELWW7qetLfj2sWNTHUv8z1duCB7gKPJBbHQwoKFRG+OZPDfBia1ODbPN8s7vh1kPqO6KDb8t2YqKyMyuo+DG7hzLa4ahaRHvY42Ho0vOz6OLpN2qpYd75gjsEkmYevSb2pVHwx3zJsxihBQFdrz/qe6K5p3Z57lePfWZM2GCA+5lVWWeBG3anQ1cHk0zC0150gMRAeMOU+z3rzljaeHNnahHz/OYKQAOLv79NkEaqWgsph5HyOXRItunJQdlzgpwlesHGteKvOyoF9cxa6AGuwr8vOGX1ZSBvfLnLF2+qlvwF518YQAbfdUYK7lSB3hEdirMgXZ8vpmm04I33q325zEYPxaBMAwpM+pklE4y2RR0bAZPuVGj6ny0yljahvICIg2oMhO/YkTWPYzGYco3I07gBjzdHIeSgNwpd/+Y3gk3IM/tD5baj+RiH26sVQM7b/89jn2l6ughQZFf5EF/KQQKpMyP7qC92rH7LYLOLoIgV
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(376002)(346002)(136003)(366004)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(122000001)(2906002)(38100700002)(55016003)(86362001)(5660300002)(8936002)(52536014)(4326008)(8676002)(41300700001)(83380400001)(33656002)(9686003)(316002)(26005)(64756008)(66946007)(66556008)(66446008)(66476007)(76116006)(54906003)(55236004)(6916009)(71200400001)(7696005)(6506007)(478600001)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?c1RKxaJbd7gHPkAyDLkOtODthMZp7pYvahUyCLJV+WohhKLJAAHp/MvaTJGT?=
 =?us-ascii?Q?tecC8RW9TercyZBk6yHm97vLxwHYees5sqikjFTJ3ReJ9j1RgBaR+iYFJpHn?=
 =?us-ascii?Q?29DSVA1epMIzKbigI6EYa9Q0XaCM23Hl2ISNWyLCki6Bjj4OEga5r51VAjkw?=
 =?us-ascii?Q?n2Ktus7CYzhh1v73TVO4SXgxdg+lPOIzBY3yoTCXS7k992CF4n2kY9ebort1?=
 =?us-ascii?Q?LTYj36VU3Wq41Jv1mhleUQpHvsHRh+Qce6lSfif5zwOdp2KPCIa5A2ldwIqy?=
 =?us-ascii?Q?39D/Kdod7ekigBgap/9/nJjJsqiBBVj8AbFmrEYUL2uuqJmFRtA6OXCm3a0G?=
 =?us-ascii?Q?13LZupbiW8sSa/mZsOVp+AmahjmRVq+tNC/djGAlqyaQDcd4mRL7V80UL3uc?=
 =?us-ascii?Q?DkKHPFV6ZBEtwfvImN6b+iHboT6SCqIOhj/PbfBYmPIbkKru0BOX1Iu19XDQ?=
 =?us-ascii?Q?LKPxbOThso56B/QTkedSl8YB22YmAymgx9WxXTtby8ZArDRTRV/siw1SlKhZ?=
 =?us-ascii?Q?xbfs3zq80CxW1+D+RFt8KwIwxFUX32hRvfXWR5SpmYbTgnUG6JsfrYioqmBy?=
 =?us-ascii?Q?B+aC46AbTEQB0K+CJCdwUTJag25JuxZkLMVb01WTCAxbjZ2+1NcIoRHWHsUJ?=
 =?us-ascii?Q?QE+qVzoO0bjSKzwmXDcj6SvRJEJAetK2/Gk8+/1prruEpWYnn3XuVqh86vxB?=
 =?us-ascii?Q?s7KMAZyfKIHCqkh44GmS2vBIefTAcN5ladM+yVCazHJFE/qE2t4zuPH45RED?=
 =?us-ascii?Q?9IPCNBfvunCwGGQBBDyw6sP2I4UAE/WlZown5azj5Qh07oW35NMk7vB515Zf?=
 =?us-ascii?Q?Z2g4FFWPjXaSJeLciubyVEDc8JWvDQoOROPjiwoy3c4aatLvqs5L1u14PrzG?=
 =?us-ascii?Q?6XyZNksKQqSc7U1AKt3fD1lKdYWCCVLatw0XrS90NngJ68EALMw6Ryo0oHDZ?=
 =?us-ascii?Q?s9wuTbpC1FaB7HxGgLteDymgGfg02LIoIPZhwjKvP3i5SOz/Pe7EIfGuOAL9?=
 =?us-ascii?Q?Yst6DnC9wAVeiIhxK6VjHSZUyHX4+PmauXOtV67LkgZd/VWpZBWFY6g2z6zA?=
 =?us-ascii?Q?RaK8MTb7jPx/rq3o4MXPiaIa33/MTQBMZq3jtLpRiz+px2tQUWYcn7i/NTvC?=
 =?us-ascii?Q?t8s56/P+791K2fTz7vFyMkme3wDrEGMHTDVZLJsMlVTETSg2sLp+VAoX5urh?=
 =?us-ascii?Q?Wq3ESrFvteXYezCW9onGd312isLza6oNKntyjvkTfPasrowuYG2zE/vXOeHw?=
 =?us-ascii?Q?EfjtmN0+vfe+XNZXCrookeehwipbpth0XBvaLVjSP46yCO+VW91WPlAqbt08?=
 =?us-ascii?Q?6TnUoIHwEWveWLIPnwhYeVK5m+TzYFLfjtPnITxqxEuLh+1FUN+CK2ugLZAB?=
 =?us-ascii?Q?OQEKDp6qLdA8u0xmADnvRzPX6ZRH4hcO0Y/BvoneUs74zHVFkcLlZYnEFzoF?=
 =?us-ascii?Q?p6ma/nFPmSKgqchpGi1RQrZTjFrDTwZbU7LB0IK+HMZ+dRzbg7hgGhj5+zP/?=
 =?us-ascii?Q?w+FLS0MNZRmUBrYl0TxBpk1w6DGqMEyb9p+pB5dpVAwFoDYBuZ0PVm4oNEAT?=
 =?us-ascii?Q?uy+4ljDIbC7OnNpfzbg=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2003f6e0-4c7d-4ae3-9cb2-08dbe753a9e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2023 09:57:52.1041
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qq7RAIuc3QEiWGW3+HO2I3zVms38uhJHz1/OTAsdyLfjItBCR06F1DVlcKK6j90o17AOY/M/+1YvC9UL8RJJPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7545
Subject: RE: [virtio-comment] Re: [PATCH v3 6/8] admin: Add theory of
 operation for write recording commands


> From: virtio-comment@lists.oasis-open.org <virtio-comment@lists.oasis-
> open.org> On Behalf Of Michael S. Tsirkin
> Sent: Friday, November 17, 2023 3:21 PM
>=20
> On Fri, Nov 17, 2023 at 09:41:40AM +0000, Parav Pandit wrote:
> >
> >
> > > From: Michael S. Tsirkin <mst@redhat.com>
> > > Sent: Friday, November 17, 2023 3:08 PM
> > >
> > > On Fri, Nov 17, 2023 at 09:14:21AM +0000, Parav Pandit wrote:
> > > >
> > > >
> > > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > > Sent: Friday, November 17, 2023 2:16 PM In any case you can
> > > > > safely assume that many users will have migration that takes
> > > > > seconds and minutes.
> > > >
> > > > Strange, but ok. I don't see any problem with current method.
> > > > 8MB is used for very large VM of 1TB takes minutes. Should be fine.
> > >
> > > The problem is simple: vendors selling devices have no idea how
> > > large the VM will be. So you have to over-provision for the max VM si=
ze.
> > > If there was a way to instead allocate that in host memory, that
> > > would improve on this.
> >
> > Not sure what to over provision for max VM size.
> > Vendor does not know how many vcpus will be needed. It is no different
> problem.
> >
> > When the VM migration is started, the individual tracking range is supp=
lied by
> the hypervisor to device.
> > Device allocates necessary memory on this instruction.
> >
> > When the VM with certain size is provisioned, the member device can be
> provisioned for the VM size.
> > And if it cannot be provisioned, possibly this may not the right member=
 device
> to use at that point in time.
>=20
> For someone who keeps arguing against adding single bit registers "becaus=
e it
> does not scale" you seem very nonchalant about adding 8Mbytes.
>=20
There is fundamental difference on how/when a bit is used.
One wants to use a bit for non-performance part and keep it always availabl=
e vs data path.
Not same comparison.

> I thought we have a nicely contained and orthogonal feature, so if it's o=
ptional
> it's not a problem.
It is optional as always.

>=20
> But with such costs and corner cases what exactly is the motivation for t=
he
> feature here? =20
New generations DPUs have memory for device data path workloads but not for=
 bits.

> Do you have a PoC showing how this works better than e.g.
> shadow VQ?
>=20
Not yet.
But I don't think this can be even a criteria to consider as dependency on =
PASID is nonstarter with other limitations.

> Maybe IOMMU based and shadow VQ based tracking are the way to go initiall=
y,
> and if there's a problem then we should add this later, on top.
>
For the cpus that does not support IOMMU cannot shift to shadow VQ either.
=20
> I really want us to finally make progress merging features and anything t=
hat
> reduces scope initially is good for that.
>
Yes, if you prefer to split the last three patches, I am fine.
Please let me know.

This publicly archived list offers a means to provide input to the=0D
OASIS Virtual I/O Device (VIRTIO) TC.=0D
=0D
In order to verify user consent to the Feedback License terms and=0D
to minimize spam in the list archive, subscription is required=0D
before posting.=0D
=0D
Subscribe: virtio-comment-subscribe@lists.oasis-open.org=0D
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org=0D
List help: virtio-comment-help@lists.oasis-open.org=0D
List archive: https://lists.oasis-open.org/archives/virtio-comment/=0D
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf=0D
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists=0D
Committee: https://www.oasis-open.org/committees/virtio/=0D
Join OASIS: https://www.oasis-open.org/join/

