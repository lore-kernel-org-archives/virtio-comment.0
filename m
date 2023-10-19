Return-Path: <virtio-comment-return-7857-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11CF8CDB465
	for <virtio-comment@archiver.kernel.org>; Thu, 19 Oct 2023 09:39:52 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 633698508F
	for <virtio-comment@archiver.kernel.org>; Thu, 19 Oct 2023 09:39:52 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 352849868E4
	for <virtio-comment@archiver.kernel.org>; Thu, 19 Oct 2023 09:39:52 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 1A08E9868D8; Thu, 19 Oct 2023 09:39:52 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0B4C09868D9
	for <virtio-comment@lists.oasis-open.org>; Thu, 19 Oct 2023 09:39:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K+HZDb9c6NfSzHriOKxF6hLedENtie9Xb3Ay/gFC22F6qxXUZPq2FQxHCIwdy79DoiEYCh7AroqOpjGSkehdHHSvDuXwIRoPExhAUXs8yiRP4xZ10M0WxgMSHey2+JwdyMCOiJV0ZqkepkQY90VZdXRZ9DgAZ0Wc6uYhI7fzOdk9mZVKh9tteoNNoO6rd3No3Rc/hGAxjqfRsNPD8SKTaY5YIRg83LZaKO4il0mghj0LNdSV7IQFTpfEoj6PFzmOF9M+agsVQIwNW6LuoytPMGvDEF13vc/M/EkKR/RcWVlQwP6BGVZPz6Qso/1ct9YJCPe2dMghau76wCkJjCk+Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g5I2CdCOwb3qMIgNfvGi6nbaVQb9pWfgfNzQZzyGEiM=;
 b=kvJKupbepC4Dtp4UfZec3PrXt80eFK5s7XIize3Gr6JUX896VdnHw1SBCaJwH+TV6BmOz5zl30DW8ogcTBJZReWq0AjjWd5nuu59ZkjbPjxVPsdPHbSzQZERouIJg7Jy88mGUzIsDpagzqvHzdZ/UvkMG+X1x1ijQTHayKXqzESuIM68V2OsgCeRgSXmLGZP/oM9wiDqJ6okCCw/5hbW4hFemuAupUGxOpiZICJYMGhOyvhKYWEV5mHSfKYm38GInhi6CAu1S4trQfReGWiNn/jGV9uRVXSCvVDdN98DM0HFhVc0VLve3FlaGtfyyiMvac6E2RsdCLW8sGUqAZPs6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: Jason Wang <jasowang@redhat.com>, "Zhu, Lingshan"
	<lingshan.zhu@intel.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
	<shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas
	<yishaih@nvidia.com>
Thread-Topic: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration
Thread-Index:
 AQHZ+dpD+jj/KUeLHUaMn2y+w39Cb7BBJzcAgAA1HlCAAEi6gIAAERjwgAEF2ACAAAjm4IABoeMAgAAIQWCAAYjxAIAAAHqAgAD5sYCAAEjPkIAGCquAgAAYNlCAAWk/gIAAN7kQgAF48YCAABlCkIAACTkAgAALvzCAABMfAIAAAMfQgAAfqwCAAAPbEIAAB1IAgAABSRCAAAMRAIAAAebQ
Date: Thu, 19 Oct 2023 09:39:48 +0000
Message-ID:
 <PH0PR12MB5481FA0DF0C6ABEE8D9A47A7DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
References:
 <CACGkMEsMF4JVEQJ6skT2DrEWjop6wjKS6ad6dW2UNOA1oRuPKQ@mail.gmail.com>
 <PH0PR12MB548109DEAE4B6C76025BD57ADCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEv2fNa_vqbqQmu3ys5tbB4-S-onXvr-pT9U9cd8iut7sA@mail.gmail.com>
 <PH0PR12MB5481EA6A4D0C64C5AF6D3A57DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231019020413-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54810A5AA248384392FC8169DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231019041629-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481373C657AE3EFA123D1C4DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231019050553-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54819E1EAA41F3CAE420942ADCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231019052328-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231019052328-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|LV3PR12MB9353:EE_
x-ms-office365-filtering-correlation-id: 13159171-679e-4750-1cce-08dbd0875641
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 sDiMeqC8UhIwdyFHEKi7q/5AvDjEBy3eGL5XwUQgZTVCG0YQeukgibYEfWhQheT5TenUohTmC/J3WOCteZeUKWx+WY8h+WxE+kFW29n9BrraJM8h9IRaA8+JZGNtoOOzb597ZLxZs5E6QJKnbmlHPU0qTSKfJbFlcsiD3s1OmrQwVW0FKQ1CIvZuxWmcGFQjyjzArbTD3qiOysL1vMOMrJ0KOhPyEcKOmoXcLM0N4LE1XyupTME2gHhApWLammscaq6udul4UtwGbU6hWDfkUhjl2SpJgU6sS1Z87ZkTPHmHbM5HFfy/0UKd0XXl6be/0F2ZtMCVJcqzdCrOcGB/9v1YQ1tRziIvCjMm4pQOzNGYmiQvEOwEuTRdfVbltzTZIrsUSU7ZC6Fg+soNyYqXF6p0wGmG3x+avNeLSiwgAX/AQS1tpUp1a7v8QZ4ED98oRXbynSMiLfvKRY/GEGRQnuPLVrsoHrf1yFrDVpbjikdRHWOfTsMmmBzfWcHGrBoZulWcQ1QYwrse5LIhnvLtu2MS3MJwJbZWcmdR8fHEuyQ5aIFFkOuO2pgsvSfYpMa9YUNMOaBTUEBPFs0FuCB7n0yuiFZ5sSSd4/ghjZruIaHqMAXn8fZi1l9gJJnyVeUS
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(366004)(136003)(39860400002)(346002)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(55016003)(2906002)(55236004)(9686003)(71200400001)(107886003)(7696005)(6506007)(76116006)(54906003)(66946007)(64756008)(66476007)(66446008)(316002)(66556008)(6916009)(478600001)(86362001)(33656002)(83380400001)(122000001)(26005)(38070700005)(38100700002)(41300700001)(8676002)(4326008)(8936002)(5660300002)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?f2uSGP2UeBP4neC2P0oyM5e4FjgsUm0Rr3Zf+SxafnDaTLJNTZ54BrJDOpEw?=
 =?us-ascii?Q?DBHEhyqIGWZzuUOpr3Drp1z9LIGjo2bjdf1Qf7jueAQEjUAsuDA3rkpNUAFK?=
 =?us-ascii?Q?OzOw21xaqlFDGOUC+lCZzUQcio1vIpyxqY4hYK0qJ9CEJj8QJVoTl7+OjF2H?=
 =?us-ascii?Q?TnQ5v1BSPYgRvpflrcAmDmcB9x9NjXypyhHT5MoLjT+ZDU1QQGIWsP8bDVeI?=
 =?us-ascii?Q?mWhj/RXMhTJ44Unq2RUDklxNFr2qeett/iKrjCJTm4lpXKC/pX+GQiz5ikZE?=
 =?us-ascii?Q?felbRfgtHJ1rBLjM5aIT2dJKdQU6EFJuW5PEBQQhk/mnmBX82Zpyh+ZzBTdu?=
 =?us-ascii?Q?F7w+262qjvq5Om/EsizOogefMF0s39QHBNu/lj7NBwTPfcG7/FXCE1auMUWn?=
 =?us-ascii?Q?Quoa31AWEqN1wGsLsJrYV7Vb/NxMtYoHgiDxb9l4C835VaCFYqvYQdUyIKcJ?=
 =?us-ascii?Q?3RgLtc2C8L26IYo1deq6NQ7sFSs0g4F6tQNwFuQVDmGU+QDvmCzyz7h/HwvY?=
 =?us-ascii?Q?Mr1yrJrXMlAb5wDE/dTuKp564ws5T7/DeBGeYLFIBHCucG51JSRVJz7XJsEE?=
 =?us-ascii?Q?4uPcT6hBsR5S6+ev6LNiSPD/BNP1it/tdoGlgtcCUp/oWSqQNs9s7gDbZJet?=
 =?us-ascii?Q?cqnWt3PkViCIej93SUAYB0SVuJ3nlC0FJXV4r8R3ONws88fQgNel3izmAQ4X?=
 =?us-ascii?Q?2vF3HkGfgb7a9+FDMwaj3UQOdo062CBACEsN6ctDq3eAxglRHJjBjYG5Kobw?=
 =?us-ascii?Q?gU3OmiTh5Wt6HgE1BJ6zz7BhU/yZYx6ddkH6ptgfpTsMzYqc6afT7hUdlmUs?=
 =?us-ascii?Q?8UlRJ9ajuWzQB5eXlrKT1SDimQ2LGjLNRQO4NPiLCIQhRztppmEUvWMomOdW?=
 =?us-ascii?Q?NZ982dy0KGaecVEfBmAYcfXsLA/BrlxIhh3KEEWxeDZWjGhCA8yQwnrROL/Z?=
 =?us-ascii?Q?4xljxheY+OWN32X9vYJ+RPPhsgVI7nfLfrz6GH0fsYPdda5JADxx19EqZCG3?=
 =?us-ascii?Q?SJBW2TiAOpwxqEtbNXexGBtIhb4VnWloq9MjLND5CbYXpqE6p9BYhS/QBGZe?=
 =?us-ascii?Q?75OuO5ETBsT9okm2vu7PZ3zHox/fopcq8RxxFzsES7QzlOEuYMyUZDdVy00v?=
 =?us-ascii?Q?aYazlS3qvBKsKId0WCEy2A8tFe3NwHDjoAWPKLUmImL2g7fi9dvgcYyYiM1x?=
 =?us-ascii?Q?bw/E9o+x7ixzGWjNXhnVJhKricIJoh+90SPHaDQkaL5OoEB3dHMpKuHq10v7?=
 =?us-ascii?Q?kSeHZGGK7grcOxgRKVjq/Y7bk26SmFmUPCRPepu34eMMsXFU8juhlTYRhK0n?=
 =?us-ascii?Q?vXll0fNJPi4NCGsNquOX4TjLrEa6GxoPq86v9zCkQSSGEw/2S6LI9/Jogn16?=
 =?us-ascii?Q?B5am3p8RcBafvHJIxU+bQ88W6f/Twy09Nj9I4vBBSiN+zJL1p1TZ6PiCjlsN?=
 =?us-ascii?Q?taKPhy2EPJzb1GXyA7w47dpcnl+qdkAt0pbcxOf9OLA6OrmrLdWrnCIu96pY?=
 =?us-ascii?Q?p9vuFqyYM9ygEKMeopXCKIvjT/KxcV6HAA34zaIcAyIGwLEwHQo5Tr0ZldSB?=
 =?us-ascii?Q?famy2YnDO4oWY1+dARw=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13159171-679e-4750-1cce-08dbd0875641
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2023 09:39:48.9080
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6sinP4H+qJxvDyvSLKkrNnTGMbLrV3UExcxPvoodbQ4RFWbyXCEfAy8UOA6jM9IUN7yQ2sm5EZvsIJbma7+bDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9353
Subject: RE: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration


> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Thursday, October 19, 2023 2:57 PM
>=20
> On Thu, Oct 19, 2023 at 09:20:22AM +0000, Parav Pandit wrote:
> >
> > > From: Michael S. Tsirkin <mst@redhat.com>
> > > Sent: Thursday, October 19, 2023 2:41 PM
> > >
> > > On Thu, Oct 19, 2023 at 08:58:10AM +0000, Parav Pandit wrote:
> > > > It cannot be in the PCI 4K config space for sure.
> > > > It must reside in the virtio config space.
> > >
> > > Why?
> > Because pci spec has clearly called out to not place any device specifi=
c things
> in there.
> >
> > Citation in pci spec
> > " It is strongly recommended that PCI Express devices place no
> > registers in Configuration Space other than those in headers or Capabil=
ity
> structures architected by applicable PCI specifications."
>=20
> But of course, we'd place them inside a vendor specific capability.
> We just need a version of virtio_pci_cap64 that's suitable for express.
>=20
It is one and the same thing, wrapping dma commands using capability, is sa=
me as open coding them.
Read only cap should say where admin command section is located, which must=
 be done when the DRIVER_OK is done.

For sure, we wont use this for passthrough member devices.

So before discussing where to place them, it is fundamental to agree its us=
e case which is #2.

>=20
> > > My concern with virtio config space would be that it's not
> > > orthogonal to other things in the config space. E.g. you need to
> > > look at feature bits to discover presence. How does this work while
> > > you are documenting that device can undergo reset at any time?
> > This is why such solution cannot work for passthrough. It can only fulf=
il #2
> based approach.
> >
> > > With a capability you can discover it without poking at features.
> > >
> > It is discouraged by pci spec.
> > Pci caps for mostly doing very small init time sort of config.
> > Not to run frequent commands.
>=20
> Interesting. where in the spec exactly?
>=20
Same above section, section 7.2.2.2 implementation notes.

> > > > I am sure that this is used for passthrough mode of #1.
> > > > So, can you please confirm to write this up for mode #2 only?
> > >
> > > To me it sounds like a generally useful capability that could be used=
 as basis
> e.g.
> > > for admin command transport.
> > >
> > Unfortunately, it cannot be pci capability.
> > It needs to stay in virtio area and only fulfill use case of #2.
> >
> > > > > > A variation of that for the member device, there is owner
> > > > > > device, hence
> > > > > admin command on the AQ can be used.
> > > > > >
> > > > > > If we can converge on common virtio interface between #1 and #2=
,
> great.
> > > > > > If we cannot be due to technical issues, we shouldn't step on
> > > > > > each other's
> > > > > toes, instead build the two interfaces for two different use
> > > > > cases overcoming its own technical challenges.
> > > > > >
> > > > > > And when in future, someone want to implement different kind
> > > > > > of bisections,
> > > > > they can propose the extensions.
> > > > >
> > > > > Not good at all, this means the interface is very narrow.
> > > > > Your "propose an extension" just doesn't work practically.
> > > > > It takes years for things to be widely deployed in the field, by
> > > > > the time they are there are more use-cases.
> > > >
> > > > We usually see it getting deployed in < 1 year time with new spec
> > > advancement pace for many features.
> > > > Building something for unreasonable amount of time without use
> > > > case results
> > > in missing the immediate deployments that happens in 2024 to 2027 of
> > > 1.4 spec time frame.
> > > >
> > > > > We need something universal and admin commands were supposed to
> > > > > be just this.
> > > > I don't see a universal solution for all problems for above #1 and =
#2.
> > > >
> > > > Solving above #2 will cover large part of deployments that users ar=
e doing.
> > >
> > > OK. But additionally, if an interface can cover a couple of
> > > use-cases we can be reasonably sure it's going to cover more going fo=
rward.
> > May be.
>=20
> Yes hard to be sure. But if it can't then that's a good sign it's problem=
atic.
I don't see it problematic at all.
If we write the virtio specification for device migration in 1.4-time frame=
, I am 100% sure that it will be deployed before spec release.
Other uses should be able to extend it as they evolve and explain why the c=
urrent one does not fit them.

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

