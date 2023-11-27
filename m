Return-Path: <virtio-comment-return-8642-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E971C4167B
	for <virtio-comment@archiver.kernel.org>; Mon, 27 Nov 2023 11:48:01 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id A6F5B120D46
	for <virtio-comment@archiver.kernel.org>; Mon, 27 Nov 2023 11:48:00 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A30699863B5
	for <virtio-comment@archiver.kernel.org>; Mon, 27 Nov 2023 11:48:00 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 995B498638E; Mon, 27 Nov 2023 11:48:00 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8C0DC986394
	for <virtio-comment@lists.oasis-open.org>; Mon, 27 Nov 2023 11:48:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=APk1x0rk+0ALwWvEcdcgi8omBlVNqlh4nrOUYlcdUOxXZOrhUmf90+iAMHOECgmEPAM48/YOUiGMZZcyGczymh7sdWmvN20U1vXxzVWjTD/f8oSZ4ao9IhuylcCMG6pOYV81QmAUeVnq5vPxRFkJvVvgc9+5r38W0IJIQUWErDFKK8urbanVO4UKdVlbsvXxdv5uEbBXHNd1xAXB7b2hHBcmZ8+XBtaofK8FwKdDkLl+S5ZY8M65PLlyj9Zgb9WvE4Ayt5HOM8nOUaXxszf6Y2fypuLa1L0a8OJ6JEKB70+haQOF349jZ2n5dYOdXpQN4P7lK23P5ntOAzovlC7ESQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G48OcaYMSr7YzChe1YyGLLXKe5DNYKduAsAwrXKT8lM=;
 b=ikNU6qXykqq0LLvBb5t0/jRSVC36ov0s4+diCcmQqV8hjHZ7O+drF6j39j4mvbcd9KlD3RXtNBdh+130ydGWjkxfoccsmSkds8+/gLcqtvf42AyPTO68+Rr0J2TN19c0iRU8YNyAeEk/YVecvpM7tNaRrbbAMWr15cVRw4cnhVXtUjM8bdYB9/khy06C/JFLALYrrHGYGmasIa1K/51bLBSNqTNJ3Jk154oeVDM1KdsNLYHqv56CP3DHmBi7rkl8yWdd8tZFD1RB1GJodij4gkojC1Iqg5hW5KpITHAaBjfH7DfCjNFgtPKZyZjZIzquMCLD36DICCD4iH48A8aiLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: Jason Wang <jasowang@redhat.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
	<shahafs@nvidia.com>, "si-wei.liu@oracle.com" <si-wei.liu@oracle.com>,
	"xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>, Heng Qi
	<hengqi@linux.alibaba.com>
Thread-Topic: [virtio-comment] Re: [PATCH v6 2/5] virtio-net: Add flow filter
 capabilities read commands
Thread-Index:
 AQHaE9L2DjdkCoB6dUewtbJsrpd4HbCGcWKAgAAAe3CAAA00AIACb1eAgAAZSACAAAMmQIAABmCAgAABCuCAAEfKgIAErlLwgAAcR4CAAADN4A==
Date: Mon, 27 Nov 2023 11:47:54 +0000
Message-ID:
 <PH0PR12MB54818A18B36FDAB0BCA079C7DCBDA@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231122084105-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481FF2A00B58060D9D69812DCBAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231122094431-mutt-send-email-mst@kernel.org>
 <CACGkMEuEFsByRwTf_hAAZ+7-UuyYz-1wCP4vTpMAW6DbHQzVag@mail.gmail.com>
 <20231124003129-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481E538B7BBFB907CC6BBE1DCB8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231124005921-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54817AC1DD6C5386A138D5BADCB8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231124051534-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481826794DE29ECFF0B5713DCBDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231127062840-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231127062840-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|MN0PR12MB6030:EE_
x-ms-office365-filtering-correlation-id: 63d0f23c-c970-437a-6dac-08dbef3eb12e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 t7Maq58s6HNW/VrmsFY+2RFUxHcF3jaXbmbPXYOBXfJkGz9NYdx5wIupstkxFcT7Z4tbtnitYvQRNDTfGsWATPLinDenaqLnFiQe4E4MXuPaVq0Ch+pScho4JK2hCwdMbuzdvj9pcqI0/c/oPV77+Ywtdl7ELy4Y8TJHbhch1WRi+GrvvozAXsz6ZQu2Kz1wckvkohW/XM36UKS3Orabs7jE615t8bcCCeI6xXckcjWIuIPjBga/qRADj+e0Kb+5qxN2evpzqMS96hOln7jeSZEFVQz00kLmrXqyDG+mEb50Wf/P9fFhdRM9iijMj8j+5siA4dHIVNS5VPnN9VU3PfIg53SlSyTOc+vRL/U3+keFTYjZAttPYhAxueqnCqVRGWaD1IIGN0YCJxBriwqwBO3YLKBYaGQFvE8t6YCjAE+C1WMHcaZxnM8wyt2XxhFYNAhWNr7eC2DgJTDlCshpoKE2ed/sEp+/48DW7Gd+rz4zFEg9+nPbFay+4+tS/zv7d9Nhq2zQt9fUyInf9DE8L69d04OySgWfxHUpirF5WKxmWAEFco7oYY57h46YHjCUZsRh2PJ/6St2nWlLfXJu03NWHCGBuosdZulUaMYJmciYn/phXDizH5ONyK1V89jy
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(396003)(39860400002)(346002)(376002)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(52536014)(71200400001)(8936002)(8676002)(45080400002)(4326008)(9686003)(6506007)(7696005)(53546011)(55236004)(64756008)(76116006)(66946007)(66556008)(316002)(66899024)(6916009)(54906003)(478600001)(2906002)(122000001)(55016003)(33656002)(38100700002)(41300700001)(38070700009)(86362001)(26005)(66476007)(83380400001)(5660300002)(66446008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?ZIV3F95mapI+fbAJAO61GOLHdmYif+KetsLvWvXUSI0VUwdx+ppLR9KmNOmw?=
 =?us-ascii?Q?s8Gf1l/2DQttWrPFU9mDKsUaqU11iIMpcICCQD3NdlmFd0fsDedcTnt5Gyqq?=
 =?us-ascii?Q?f0nNG6B9xPrAroTK+z+GujsuYixGZpqJJ4WzShFMah42SAs7a9/qik3o49S9?=
 =?us-ascii?Q?RzOPLX0LuATI8qXPiS0ZRl7NpDgGfZoZlJh9QliDdfRlFHPcRgvguogB4d/L?=
 =?us-ascii?Q?nA3k7CZRnTncrEEEdWaAzA7F6yGKS+pfE3+Dx0PhPHDHk36DxczaVT7LWQSk?=
 =?us-ascii?Q?E4xVCOVlasShPO2K3tZtvEbQzuEd96FaiI8KSYrSREWzV1iy3FJ1iMAgyhY8?=
 =?us-ascii?Q?IHEKZo5/Lj7Xc4F02edgsZaWbsi/9uGZ7IeSF1u02WdLsBdiInTPGfADhb9y?=
 =?us-ascii?Q?D5xzl9RLu1aKOMqgYd+QJgXgpxQAXR2/cFBIcB3CvrAtH+Ys3UYDzghGX5DG?=
 =?us-ascii?Q?dq5x5dV7KfVZpPpaREYnm6k/eJwErLPOnTR+AubKvW5Zmpq9B3ebjrSHSTu/?=
 =?us-ascii?Q?AAB67ernWGXSa5PH0zOc76Nr2GmvY0rpBPGZ9hFrmG18OcEFY2jPVC4xoqQJ?=
 =?us-ascii?Q?i6MFX7IWmFc51rflpVmTpLx7S7EGn6eZk3okYV4n8mpllLYD4xzp7kzma49B?=
 =?us-ascii?Q?y7lP8CpGezVKLYpe4lpmh78WGNR9NL6wylyz1P4p9p294BE6OElNBY0QMPsy?=
 =?us-ascii?Q?tZqs4CZo1GkWzeX73OK8Af64Zety+1c+tboV4/g2FG+v9g5StHfAc8NNtmdH?=
 =?us-ascii?Q?bOvlXXMrhV3x+SJA6E7AyUYK++gXBH8lxOXsvaYeaUcyOwCQKRYdse01sj/J?=
 =?us-ascii?Q?ODKrxXe2eeI1WbxNqbc7FSeSiViJzL8LEzyDterLeatNMjylumHoX/j40vER?=
 =?us-ascii?Q?ZSt6gz1+jhZSuanj22VKh6AtPhWMsRET5pkb6/qadNO3RkCD081KIjMG99MN?=
 =?us-ascii?Q?jQHtAYb87rFwfmEgpx36E+qrmWGBSM5SxmMNT93my6bphnkBRGoa6jTvXltC?=
 =?us-ascii?Q?XfK8UJ7hxpyavYVMO7wphlaCc3QOZS938lHmShJgX0fxCGfBwgeFdZwyJjD0?=
 =?us-ascii?Q?bGoAKx9medVL0lNWHYiomFC7J4oJNG4XS6TV6PbVk76KnTLbAVYm8eT2p9rz?=
 =?us-ascii?Q?yXXOiv33YUYl9FfXm6Am7HtLrPJYhlVlZtNN9ECIdwZpYx7lcLkSFIH2fGGg?=
 =?us-ascii?Q?x5LhHSfbDN+s58pfPay2ntuBcVS0+u47w4tQ9zP44quaOtr6ghP+Nc9mDsQt?=
 =?us-ascii?Q?Ag9pWJ5972mNPJ72mDjucfVWJrfhVUhhCbgn1bdTdkULALDr7SfGK6rCRNUs?=
 =?us-ascii?Q?a9IBmUFX3WuqmQNFPf45YC3/X1QY0D5ntWyz6dFQKIztkXQ3xbjAK7dbr2Zm?=
 =?us-ascii?Q?qJ8jw9DBcCe0avv7MJ1rCQQUwUKwxohvMYSAiMVqwWCOB+Snj+KhMRprilhG?=
 =?us-ascii?Q?Xl60xJEG21Kug08oRUJwxFCffZ3Nw7FqcQr3rcRuPmjXznglzvdSEZNMYmps?=
 =?us-ascii?Q?8t40iS9pTRzRMwcShMTA4YcYptI2Wri9MJRs54opBvFpZS9m/dd2/i55u4cZ?=
 =?us-ascii?Q?Xu9tNOQ6guuehBs7C9s=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63d0f23c-c970-437a-6dac-08dbef3eb12e
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2023 11:47:54.2536
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0PwRQScdsXax4WrvYT62s1qeCVSCeQG9rhIJtFe1OfdLs8LlYxVJHwpSmd5FKPKeIjuDm6KNKZ7LERzpT3BrJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6030
Subject: RE: [virtio-comment] Re: [PATCH v6 2/5] virtio-net: Add flow filter
 capabilities read commands


> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Monday, November 27, 2023 5:08 PM
> To: Parav Pandit <parav@nvidia.com>
> Cc: Jason Wang <jasowang@redhat.com>; virtio-comment@lists.oasis-
> open.org; cohuck@redhat.com; sburla@marvell.com; Shahaf Shuler
> <shahafs@nvidia.com>; si-wei.liu@oracle.com; xuanzhuo@linux.alibaba.com;
> Heng Qi <hengqi@linux.alibaba.com>
> Subject: Re: [virtio-comment] Re: [PATCH v6 2/5] virtio-net: Add flow fil=
ter
> capabilities read commands
>=20
> On Mon, Nov 27, 2023 at 10:19:51AM +0000, Parav Pandit wrote:
> > > runtime configuration, absolutely. We found out writeable config
> > > space field are painful for a variety of ways, the main one being dev=
ice can't
> report errors.
> > > So we generally avoid writeable config space.  But read only - no
> > > good reason to avoid them for init time things.
> > >
> > The good reason as explained in the doc is to not place them based on
> > the policy of read_only vs read-write, Instead based on the access patt=
ern
> whether it is needed in early driver initialization time or can it be rea=
d at later
> point over.
> >
> > And the based on the access pattern has given more flexibility to
> implementations across sw and hw based devices without any lose.
>=20
> Right. Whatever is done in driver probe.
> And why? Basically because this makes initialization robust, simple, and =
no
> parallelizm is used during probe anyway, so a queue makes no sense - it g=
ives 0
> advantage.
>=20
I listed all advantages.

>=20
> And if you are going to require that driver allow or disallow ethtool com=
mands
> based on this info then it is clearly initialization time in my book.

I understood your view.
It is less efficient and works well over cvq with listed advantages.

>=20
>=20
> > >From the device side it has consistent view of get/set via single chan=
nel =3D
> cvq when dealing with the guest driver.
> >
> > The two non nvidia examples of these devices are Microsoft MANA nic and
> Amazon ENA nic.
> >
> > >
> > >
> > >
> > > > >
> > > > > Then hardware offload guys come and say that in PCI spec current
> > > > > transport is forcing use of on-device memory, and they want to
> > > > > build cheap offload PCI based devices. Fine, let's build a
> > > > > transport variant that
> > > does not force this.
> > > >
> > > > All new capabilities and control is over the cvq. What is baked
> > > > until 1.2 is sort
> > > of legacy.
> > >
> > > Just repeating this will not make everyone agree.
> > >
> >
> > I see that Satananda also is fine for Marvell to use CVQ.
> >
> > > > >  And
> > > > > we want optional compatibility, so let's also find a way to do th=
at.
> > > > > This makes much more sense than forcing transport specific
> > > > > issues on
> > > everyone.
> > > > >
> > > > Trying to attribute as some transport specific issue is just not
> > > > aligned to the
> > > spec written today.
> > > >
> > > > > To add to that, what did not historicall scale well is
> > > > > transport-specific
> > > registers.
> > > > Then you should have put the VQ notification coalescing
> > > > functionality in a
> > > horrible virtio_net_config register like how a queue reset in the
> > > common config space.
> > >
> > > No because of the 4 commands: VIRTIO_NET_CTRL_NOTF_COAL_TX_SET
> > > VIRTIO_NET_CTRL_NOTF_COAL_RX_SET
> VIRTIO_NET_CTRL_NOTF_COAL_VQ_SET
> > > VIRTIO_NET_CTRL_NOTF_COAL_VQ_GET none are initialization time.
> > > They are not capabilities: they control and inspec device runtime sta=
te.
> > >
> > > If we had VIRTIO_NET_CTRL_NOTF_COAL_CAP_GET that would belong in
> > > config space.
> > >
> > I understood you.
> > As we propose above, those caps reading is not must during initializati=
on
> time phase.
>=20
> Yes, it is a must initialization time.
Why it is must?

> In my book initialization time is what happens in probe.
And asking that this initialization time to somehow use the DMA and interru=
pt is not making the initialization crisper.
In that case the DMA interface scope must be before driver_ok to strickly f=
ullfil the need of initialization time.
And that way it wont be usable for other things.
And bending that for other work is not helpful either.

So you should let things progress.

>=20
> > Hence, cvq delivers better scale like stats and consistent get/set.
> >
> > > > Thank God that mistake was not done and many similar mistakes were
> > > avoided.
> > >
> > > Let's not get emotional here please.
> > >
> > > > > That was a bad design, with all transports doing exactly the
> > > > > same thing is slightly different ways.  And what you are
> > > > > advocating for with CVQ is exactly replicating the bad design not=
 the
> good one.
> > > >
> > > > CVQ design is what extends the current spec in good way. Followed
> > > > by many
> > > other non nvidia nics listed in the doc for reference.
> > >
> > > I don't know what you are referring to here.  Register maps are all
> > > over the place. It's a simple, standard, well understood practice.
> > >
> > I provided various examples of virtio and non nvidia devices which pref=
ers to
> avoid registers.
> > Satananda from Marvell also expressed their view.
> >
> > > We have some niche uses due to need for extreme VF# counts, this
> > > forces DMA for them, not a good reason to force it for everyone.
> > PFs are equally benefiting from them. Some of our hw devices has large =
PF
> count.
> >
> > > The sooner you just stop forcing this down everyone's throat the
> > > faster we can make progress on things that matter.
> >
> > CVQ is established good configuration channel. So we all want to utiliz=
e
> instead of being forced to grow config space which is very hard to mainta=
in
> and implement.
>=20
> Specifically this thing or generally?

> This thing - I think I don't understand what this capability is, at this =
point, so I
> am asking you to clarify much more.
> If it's a huge array it can't fit in config space by definition but I don=
't
> understand why it needs to be.
Each array entry is indicating what it tells.
>=20
>=20
> Generally - forget it. device config space is one of the few things that =
virtio
> driver writers for different OS-es actually get consistently right. It is=
 simple,
> easy to use and understand.

> Limitations - slow, serialized and small so only
> probe time and only little amounts of data.
> Stop trying to kill it as a general capability and replace with a hodge p=
odge of
> commands I'm not going to support that.
For small things that is common across all devices can stay like that.
Here is it per device unique data values.
In context of flow filter it is just overkill to put all of this in the con=
fig space.
It is bigger content that what we query via stats cap command.

>=20
> > I will fix your comments in v7 regarding the honoring max limits in dri=
ver and
> device.


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

