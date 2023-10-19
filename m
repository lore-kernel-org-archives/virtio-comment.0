Return-Path: <virtio-comment-return-7854-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D695CDB465
	for <virtio-comment@archiver.kernel.org>; Thu, 19 Oct 2023 09:20:37 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 8E440795AC
	for <virtio-comment@archiver.kernel.org>; Thu, 19 Oct 2023 09:20:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 558999868D2
	for <virtio-comment@archiver.kernel.org>; Thu, 19 Oct 2023 09:20:36 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 41F279868CE; Thu, 19 Oct 2023 09:20:36 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3B4549868CF
	for <virtio-comment@lists.oasis-open.org>; Thu, 19 Oct 2023 09:20:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jpbxxNv/RqGSp/CPMmEjz1Mv6/tUZUpPGZzTV3ymG0NSXDmE85fNAgfoV37JMLUaUFgU+58sP35fa3WGT5xCG2R+jQAgsDaD5QVdrQyrl+uoayuF5iKnZGC+QI5AZEvrkVqlHwEY0kOS1q/lXR8VLPOgxahD2IM0kPFn7MZ/Tv1FPgJvOw45VDu3u2ju1nggarH3PLnXuscq8c+6cQ80NEV2lL7OV9QazNvT0GDj/9gOBs6oVMISymiVxF6kJAjKeO4ACeAKk6zla1LJPZHacavoa81VBkNHuFPIvCf60zrgVnGxUBviQiJsOXEnXctqu1Cf6YwnuTaY22mjWxXtWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RQGXVXfQKePQ5gS+nfOyCduw4+LMPG965piny+5YJXg=;
 b=b3ICQY2I3qKNZlSNF8mkSfgJMV1QaF+eRF+T2dl0UzF7tHqo1UgdCaCm3F2a/+fEx83yalODq5OBOYd6w5IdJFT6GG7qCNtvP+v/JWk3bzH1JpdsU0+VAAnCih5hIohCsK5+YZiwNb5ZITsOU6/7d/BX8ofizI0AfajLUoA+YuOOuAB+9ac9ovG/R63IBqNLQbERuZlVN7txYO+l6vV5AXoHAtroiDGiJKwXYFBjpO9zFpY9ur570sTa9s+XXSRTc0T6ewSDJn1D7MSIj5K0I93Tq4PgN2Db8K3HvBYUc+f1KADZ+H1f64uXCo/1S1x6DucGVg8ZUnNORHK4M7+F8w==
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
 AQHZ+dpD+jj/KUeLHUaMn2y+w39Cb7BBJzcAgAA1HlCAAEi6gIAAERjwgAEF2ACAAAjm4IABoeMAgAAIQWCAAYjxAIAAAHqAgAD5sYCAAEjPkIAGCquAgAAYNlCAAWk/gIAAN7kQgAF48YCAABlCkIAACTkAgAALvzCAABMfAIAAAMfQgAAfqwCAAAPbEIAAB1IAgAABSRA=
Date: Thu, 19 Oct 2023 09:20:22 +0000
Message-ID:
 <PH0PR12MB54819E1EAA41F3CAE420942ADCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
References:
 <CACGkMEu_uRcL293Dd+vo2VvYJfUiCaPYF0dAjk-s6=RUtw-PEQ@mail.gmail.com>
 <PH0PR12MB54813820D9800B4F62C5784FDCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsMF4JVEQJ6skT2DrEWjop6wjKS6ad6dW2UNOA1oRuPKQ@mail.gmail.com>
 <PH0PR12MB548109DEAE4B6C76025BD57ADCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEv2fNa_vqbqQmu3ys5tbB4-S-onXvr-pT9U9cd8iut7sA@mail.gmail.com>
 <PH0PR12MB5481EA6A4D0C64C5AF6D3A57DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231019020413-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54810A5AA248384392FC8169DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231019041629-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481373C657AE3EFA123D1C4DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231019050553-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231019050553-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|IA0PR12MB7650:EE_
x-ms-office365-filtering-correlation-id: ab80f416-1291-42c8-e4a8-08dbd0849f08
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 tgd95yUh3VgR3PZFSejh1PViQpYStmCj+Flfk1HwC6mGUZ2abKE/AflxvOMEwmLoqefWxfph2yBdbqoAwmb/A/StOEcnKr+ztPXVkeYTsg58ODXF3EU7hpAreTUnBy77RTOtL9nggvZ7/mDdB19kZlsnYKXJfx0Gi/1wTOcM2wklH3RHv9Hym9PyM/lkDYsy2s9g+nVyYG1hElPixKk9xowRR7denN37h2f38i+h0Eg7ZWyA5N1wmW8uveDDACjzaRq7uQgwIJE6rS4T7sjERPkZ3fEHBw45VMZ2kGJlzceR+omI41QnT305Po/jUH9T30Cqo0iLqGSG4FMbWUq9jM0vLMJ1oEIcWaTQLV2Q1GDcCqVGqVbKQmfTVXb+M8BO6wioi7rx8mOmZRa7n8K5U2c4jOUteW+3prT90sPz0E30lIKrIEEGC442pkHKVYGb1xgv367HOlk190gGbXT4nFernwoCNNKEmHesJHsA+GnmI1zzEkcEjbkHYNhiGa211egjr6Ly5bi42bmGXK3JKHrzatD5NA/Hjo2xKaztXANEtqEHA/8a7xQATpxad0ZbMjcIUbwEYs2XJ/reZiypi/RcaoyEB+08OOBhoqifwkfLZ85IqjKmnQDCV8l1Muqt
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(136003)(346002)(376002)(366004)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(9686003)(55016003)(66446008)(54906003)(316002)(76116006)(64756008)(38100700002)(86362001)(66476007)(7696005)(6916009)(33656002)(38070700005)(83380400001)(66946007)(8936002)(71200400001)(8676002)(26005)(6506007)(122000001)(107886003)(2906002)(66556008)(55236004)(478600001)(41300700001)(52536014)(5660300002)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?cAJ1IH2qx6jmPsiNcUbFfBo95bqYXEP493H4iEvW69til7cwRKNEuxQu7lR1?=
 =?us-ascii?Q?xbEoYy/4zHqT6eC5E9Lp+su8yAnJ31ofl40ak4Ao2MGiMuprxp2kfgKGDR4N?=
 =?us-ascii?Q?A4Eiy8P4TQoBreKMQakdh0oc8cPYpEZPT5G8UTNrJ/1tyMqJguvjS0zws9UX?=
 =?us-ascii?Q?JQLuIiHiRdLfNLBRf/eBk9oo+bbl7K1HqTgwCUCof16sSsFvy0UTitDvvpUA?=
 =?us-ascii?Q?oUC/LvS9tcBProIv7+Uwr28mbnOHge7LP63YBD6VZpxe9sW5cjpoLpWFrJgJ?=
 =?us-ascii?Q?VFve6fmWVbo+ZXVBDPiDCjy3TWX2xdkkL7HQL/MmP+gMZivmJI0RoUOpbHr2?=
 =?us-ascii?Q?Lx3JqwsvCywX0Qg7joqRF2kCkGuxw7X7vkGlROCnS3uVBWVVk+FYIX9OB7s+?=
 =?us-ascii?Q?l3CpByeRtHFKsCdx4SF8LkbelQm9WM9M06bR7Kfa00Z+mP+P21PlWzhCTYQC?=
 =?us-ascii?Q?wHhGO7Z4XTetuEYoza8fUyl5cYeWOZ4po4JMp+AJT3nRIEG9tfeqYqxOl8Uj?=
 =?us-ascii?Q?At2iR6a4S+7yO4Jd3B62nWqPnBVvfs9apLLIlAXlk+ImrF9NItoI1S4yj9qG?=
 =?us-ascii?Q?9Oi3RUQxpNkRycKrvm1ZQWgOQ6357B862Q5KVWjfkEzjlSDJenYfYTV1VTjZ?=
 =?us-ascii?Q?yzdP1KFriCW6ZEysj2pYN8tjMble2SyNHAcEsiBkFg+v0BRo/EMKMOWuaDAh?=
 =?us-ascii?Q?ErsS4YxURYYE5uXpBlWwaAQ0Aa/xHgg3Oow0+mqG+NCudWRGeyH1odH6UlWy?=
 =?us-ascii?Q?j3Rus3CKAanJWTUXi/46zbzkeuMiJDt8RF0iAD/2Jr2Ecaw36ksgStuFALkQ?=
 =?us-ascii?Q?ClUFH0FmrOFu/eNDw2GxGLxwjfda4gzeSg+uJcg90Lk3ajVTSonxOSJevKDT?=
 =?us-ascii?Q?XhIGUG4TMyRFrpgsgKuCFKeA/Y7jBg1InK9aDlZ1iGRqbwcGRcmHybsshRG3?=
 =?us-ascii?Q?dAKIESasXGRIDzSXFqe+dS5Hg/ipFdMDJIec6Oc//x3KCmFNeziDfuicSwIO?=
 =?us-ascii?Q?CqfGTKfMo1P6vm2pRPJL19XAjju2uRgXEPC/j+foeOHUIoEO6ItjylKHQVn8?=
 =?us-ascii?Q?jjtaZV0nSuvOYdzLLtlZ++jIQ5vSEUynT9K2bLa8DD9hGLv6kIp3Uj/MccgM?=
 =?us-ascii?Q?CU6LPr9bPi0wspHHkfdm2pAXM9iieAgtRktefkkqP4XAnrl8M+UXtn2Qvvq0?=
 =?us-ascii?Q?B1O6T5d2ke4TAWPFpI5h7a1Kk11joX3K06nwA9/UppmNHhegm6P/wboG7d+6?=
 =?us-ascii?Q?AvJSw8vfpc8uSpf5c10vjbHgLRj4Vu5ed5X6ZPxPVSiZHy9ZHrgbwaftsXsZ?=
 =?us-ascii?Q?Y/HV5trs1p9SXjUHL5ams1LgtDZ2pQ433xlV++S4nYYHKMpi98ViNZj8Vg9i?=
 =?us-ascii?Q?FTE77xIupXiai+cxMOALRIVViwmUl2SuUWp66ea/74i+WKcnS0+gGilCSuvy?=
 =?us-ascii?Q?GgNR9Gjr8Zv6ehChuQtrU6RuJuTWJAL2G/fDf21q4Pcst4oYfILS9JH5zFOA?=
 =?us-ascii?Q?53EiUXWACbkQtz4St16TcnOZfks5qyJELWpznNeOJM4GIk4+Bzua+Lsw/ztU?=
 =?us-ascii?Q?KYD7CrnXa9f9C5lwMQE=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab80f416-1291-42c8-e4a8-08dbd0849f08
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2023 09:20:22.5275
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z1boXgvElJAGqe/Ek9R1k+6EnP9n2QRrYfDM6SmRQcMHsGMQakiCngP2YWw9bew7UrjwKedlaLkJA9sq1U64kQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7650
Subject: RE: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration


> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Thursday, October 19, 2023 2:41 PM
>=20
> On Thu, Oct 19, 2023 at 08:58:10AM +0000, Parav Pandit wrote:
> > It cannot be in the PCI 4K config space for sure.
> > It must reside in the virtio config space.
>=20
> Why?=20
Because pci spec has clearly called out to not place any device specific th=
ings in there.

Citation in pci spec
" It is strongly recommended that PCI Express devices place no registers in=
 Configuration Space other than those in
headers or Capability structures architected by applicable PCI specificatio=
ns."

> My concern with virtio config space would be that it's not orthogonal to
> other things in the config space. E.g. you need to look at feature bits t=
o discover
> presence. How does this work while you are documenting that device can
> undergo reset at any time?
This is why such solution cannot work for passthrough. It can only fulfil #=
2 based approach.

> With a capability you can discover it without poking at features.
>=20
It is discouraged by pci spec.
Pci caps for mostly doing very small init time sort of config.
Not to run frequent commands.

> > I am sure that this is used for passthrough mode of #1.
> > So, can you please confirm to write this up for mode #2 only?
>=20
> To me it sounds like a generally useful capability that could be used as =
basis e.g.
> for admin command transport.
>=20
Unfortunately, it cannot be pci capability.=20
It needs to stay in virtio area and only fulfill use case of #2.

> > > > A variation of that for the member device, there is owner device,
> > > > hence
> > > admin command on the AQ can be used.
> > > >
> > > > If we can converge on common virtio interface between #1 and #2, gr=
eat.
> > > > If we cannot be due to technical issues, we shouldn't step on each
> > > > other's
> > > toes, instead build the two interfaces for two different use cases
> > > overcoming its own technical challenges.
> > > >
> > > > And when in future, someone want to implement different kind of
> > > > bisections,
> > > they can propose the extensions.
> > >
> > > Not good at all, this means the interface is very narrow.
> > > Your "propose an extension" just doesn't work practically.
> > > It takes years for things to be widely deployed in the field, by the
> > > time they are there are more use-cases.
> >
> > We usually see it getting deployed in < 1 year time with new spec
> advancement pace for many features.
> > Building something for unreasonable amount of time without use case res=
ults
> in missing the immediate deployments that happens in 2024 to 2027 of 1.4 =
spec
> time frame.
> >
> > > We need something universal and admin commands were supposed to be
> > > just this.
> > I don't see a universal solution for all problems for above #1 and #2.
> >
> > Solving above #2 will cover large part of deployments that users are do=
ing.
>=20
> OK. But additionally, if an interface can cover a couple of use-cases we =
can be
> reasonably sure it's going to cover more going forward.
May be.

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

