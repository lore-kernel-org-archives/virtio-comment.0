Return-Path: <virtio-comment-return-8792-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5861C4332F
	for <virtio-comment@archiver.kernel.org>; Wed, 13 Dec 2023 06:52:10 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 32B5478C91
	for <virtio-comment@archiver.kernel.org>; Wed, 13 Dec 2023 06:52:10 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0C0589866B7
	for <virtio-comment@archiver.kernel.org>; Wed, 13 Dec 2023 06:52:10 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id E84E498669B; Wed, 13 Dec 2023 06:52:09 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D948898669C
	for <virtio-comment@lists.oasis-open.org>; Wed, 13 Dec 2023 06:52:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RjSD6NjRbk8r8EOfXN2WOUr774upJJjKrGlc7fbwGF7QrDppNaeIj/Hw4WN7YjtcVXR84yOCiP135vx23HveRIGpMGJ2VDkbKmHVC2J8XUUvNwXOOd93hqPkdmOQoRYTW2pvs1Qb6hBdP8QLNZ4Pp+DiwWBBxxbxl4mULDqv5WG8V9WeF2Kub7m3GUwh85dc0AZJ4Op89j8PbAcJM2JlJy+l9iqwwHhqveiH3pui+DxDZz0be8KTBLcNolHjnCpjJplPaFdwWLtdsF/l1zbrt42EwiU50hMA6XREtrBCLDI1td/JxIQZMPabHE0ZLen8C67QVo5SDPRW0oZtQUxdaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HusBC8te0KcSKyRW1lfXepzIvUf1iQV5Y0Hg5nbjw1Q=;
 b=ZhfXk7w3hJSXKJkSJqt9hyXM+c7E335uxlAm7nlHjE32KBLYzWiCkgGSUdohvsFUJASsVvdR139slXCLEXuIdIK7uRXUI15r/hvKFVB33xmOqOYr7fm+8O6nApCpkT1PXMy0NlNUBB0u53xBpD0BMUAv353uIHmfTv39EKm+Qfwyt/P0Gz+uYuHcCnj1RZEOmlogu3F/SyhF17v1jbUzjsEr80CbgVfySR7+T6MmkK1rIiZgyqoqSr/a5sVciaO5Aq/eGRH1K9V0PjASjyeKeVDNz0I2+OHsLrQ6P/seK9LP1iix6V8cm8LXU4rMZE3eYWNvPuC6hwiGyHyiZjhzNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
CC: Shahaf Shuler <shahafs@nvidia.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "mst@redhat.com" <mst@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>
Thread-Topic: RE: [virtio-comment] [PATCH 2/2] virtio-net: Clarify the size of
 the struct virtio_net_hdr for tx
Thread-Index: AQHaE9MwidDLWG83gUqvsXqFcltN4rCm7FyAgAAELJCAAAOHgIAABUIA
Date: Wed, 13 Dec 2023 06:52:05 +0000
Message-ID:
 <PH0PR12MB5481A9B413487D5BA4AB9EADDC8DA@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231110124040.2093394-1-parav@nvidia.com>
 <20231110124040.2093394-3-parav@nvidia.com>
 <1702447371.5899365-3-xuanzhuo@linux.alibaba.com>
 <PH0PR12MB54818BCA16901BBF7668788DDC8DA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <1702449025.265035-5-xuanzhuo@linux.alibaba.com>
In-Reply-To: <1702449025.265035-5-xuanzhuo@linux.alibaba.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|IA0PR12MB8696:EE_
x-ms-office365-filtering-correlation-id: 7762be5e-4c92-45a1-20ce-08dbfba804d7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 p5UvJr9R7/a4jmxc8DJ2XRRPUn77iQGSVcnrxThDTbDQVwkAR7YcQ9wTBqZpF5uoKmgoBpku/1fEKI4ZVTCUSXtJz9pdrS30pHiH4pO2utEQ3p1mCl6e9amx4ZfhlVEt9HIn9LIsJRyMw6OaYB2XbmpE26UuwVLUNrtJ6JbiL/3pbznQB41o6QOs5HdAzy6IRtX3bkjRxuSNHb3rxIuyDrb17lbiTHDQKenz9JEsCeUb00mF/LlP+uzRBNiGv7KOGLvIO284tnd9xwYl78aB9OLy4W+Za+ol9e82bet4Aq+2cAYF/cyKNouWmzQpWFMphnPxYCjNNvQHQDfukKOEwg5oT+yQUtY3whtCS+Gx3BqT9l3gjJhTfz0UBpV95r/NBQ1mLP2mX14Q3xoSYxngXJodUEztn69XlmXDfVG8Y9Yt+ldVOqNw+C9T2DAC0QiFdea9aijXpWVXpn39foTrNLp3b8A4SfFFV/aY5Wf1nhWE/wyi13DAShX0A2Xy/qpYqPXQHlBg7btcw+04hdKW9rFZtIlTkTR3cGYTridGnLaK9rL3LuEty2k6QHEggvjpl0pkG+OsYB7MRGvdJwj/ulrU8MMUfB79BYRxmaozSfTGfZZNjwu1AyyTjyC5ew322x1s96OsYXvEv6eH4Ekn0Q==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(39860400002)(376002)(346002)(396003)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(5660300002)(2906002)(71200400001)(86362001)(6506007)(54906003)(478600001)(7696005)(966005)(26005)(6916009)(55236004)(9686003)(316002)(76116006)(66946007)(4326008)(8676002)(33656002)(66476007)(66556008)(64756008)(66446008)(122000001)(38100700002)(8936002)(52536014)(38070700009)(55016003)(41300700001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?6X5HJsCIbgSkKJz1JDMqbkfSYgD+Y7RR9gf4ewfH31FfGNyOk9IOFUxhYU4B?=
 =?us-ascii?Q?CAh9WAgfb4XXNgN+pDxZ+DERZTdbfZM6Y9bC25wqmeY5ql0BpzM2nDRHJtJ1?=
 =?us-ascii?Q?yL0gQ08FG6nfs/HNFOElyThqCvet66Xv79Dsc4vp41Lsr4Sz5b268+wBgQLN?=
 =?us-ascii?Q?cmxJv7sjJmbpV+yNOOZU/YLTTPMuohjTf2l/fX3Rw/p4z+tnAUlNXRQIXdYY?=
 =?us-ascii?Q?HTn/Eaj7AqR/IrWjYna9PaDDkJgzQZlUDH/QSR3eX4/5tBaWj96f7o5RHcDL?=
 =?us-ascii?Q?F6CsUG2XWlIzO99tx6W01zIQ2h9Q6EKEr4xQh2j8juO+Ct6wyBKxjKfVB8/8?=
 =?us-ascii?Q?62RZilCleBryRIWAx7r2aO50n44wqQlxQOAV6uqv48Gyzf2oSHU18viui7AT?=
 =?us-ascii?Q?9smhWw/q9K91uCdWd0dEQzga6hFA1MeJakdX5lbgAFi6UPiANIyypjZYROyn?=
 =?us-ascii?Q?yQL9T5SIW7bIevhhLcqce2bpxfUzU7fq8SD6oq3LWeANjpMfS4Z95bglk4YH?=
 =?us-ascii?Q?ZDrR1lPNy2DydTx9Gtl8jU3WSkZ5OqL2FWH95UliuJC8LMojeN8Bu1zPNEKJ?=
 =?us-ascii?Q?SG/jn3AeX+L5TgK46I33qf4BOH21hiVgy000TBo2j7ClmOZWPfqm/9jLJcGW?=
 =?us-ascii?Q?oFNkk2wEQcIBCuc9dDiWoEeCBnjJwHU0Sv+T28gbMB8muzxekLfLiIxnL/fN?=
 =?us-ascii?Q?0n6rzhTI9Y5CzIk2tOJHc+oV9DbyVNWN8I/LUiAXxgIbumCHfgqu3KK18Xpy?=
 =?us-ascii?Q?BFsJqymHntQEHUprhAPiOKz2LJ8jflTtDD80FZjlBp5IbXMgJazJccpuKBc3?=
 =?us-ascii?Q?c7l4WiUWKh32HSj9MRub1Tb/Jjq4iMjEPBLtoL48YEytDVoIHfZvidn0Rbjw?=
 =?us-ascii?Q?lxi2eWHEwBXi52J/DDPPKTx1+ofUZdQUvQv0O8BPLvIHZNqvDsD2KU1iKPPV?=
 =?us-ascii?Q?SUPwAhU/mh5s5uDsnc1stNOcsSmrbrq4AVC9i4ifSxvdBtwPIx39PJ8KFS+y?=
 =?us-ascii?Q?OhV8lpte65ZXrW0FRq4K/dz9VKFgNDViEMdIGDtyaKq3oU/fnlpzlkwhRFuv?=
 =?us-ascii?Q?pCAfSR+Da0Cq9JwSjND1/dCPa/2lUtb1xJkyCyVy/0PK8jaELNSiKDv5Y2tP?=
 =?us-ascii?Q?B/w7qzvyklqg4VLr+fhY30iB1ZJ5vBMfycSTIuFqNgFagVZpd4arEDpe9O+Y?=
 =?us-ascii?Q?tuUZFnQ3mP2mYgNDmpV1RtanLn2D3joWr3t7guURoE+CBWmhEaaN0pHKzxJA?=
 =?us-ascii?Q?BKAo3KvjrjQnHgU4IXBYue8rV5Mftt4fwW3XNefs0ojgTIFNGGGmKumxullj?=
 =?us-ascii?Q?Mbao0NnJQjp+PQ5iD68j92Ovlfmj2YyjqPccix202BjAT+r7WwiVdGNs52lU?=
 =?us-ascii?Q?jiofVhZxdsco3B8zlF5QMLwBG9dPym6aAjg1vdXbhU3OyJ1IJG38qzhZseFl?=
 =?us-ascii?Q?RA6P0PPf9gB5yaSBeHvoiiKaK1bPE5K+pAD2iMN/Gq9818p9C0vw+IuJAZHB?=
 =?us-ascii?Q?gwUbiGANk4ehbaqV5qyZQG+79ChQXC2EcdjoAnXkDj1MgcoXWxeh/yKhtHM9?=
 =?us-ascii?Q?Uepp5ZwwXmBUErNZrDg=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7762be5e-4c92-45a1-20ce-08dbfba804d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2023 06:52:05.6859
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AVwfrsXzXmKjF10ol1RUOGmevyc+9c+SdaIaW+G2LzWWDJQewq0uNpIVJ2eRXgBFDZYoV2iDjKqD4VmUlcFfJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8696
Subject: RE: RE: [virtio-comment] [PATCH 2/2] virtio-net: Clarify the size of
 the struct virtio_net_hdr for tx


> From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> Sent: Wednesday, December 13, 2023 12:00 PM
>=20
> On Wed, 13 Dec 2023 06:23:35 +0000, Parav Pandit <parav@nvidia.com>
> wrote:
> >
> > > From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> > > Sent: Wednesday, December 13, 2023 11:33 AM
> > >
> > > On Fri, 10 Nov 2023 14:40:40 +0200, Parav Pandit <parav@nvidia.com>
> > > wrote:
> > > > The feature VIRTIO_NET_F_HASH_REPORT only applies to the receive
> side.
> > > > However, when VIRTIO_NET_F_HASH_REPORT feature was introduced, it
> > > was
> > > > not clarified that the size of the struct virtio_net_hdr on the
> > > > packet transmission also uses higher size when
> > > > VIRTIO_NET_F_HASH_REPORT is negotiated.
> > > >
> > > > Explicitly clarify this.
> > > >
> > > > Fixes: https://github.com/oasis-tcs/virtio-spec/issues/183
> > > > Signed-off-by: Parav Pandit <parav@nvidia.com>
> > > > ---
> > > >  device-types/net/description.tex | 6 ++++++
> > > >  1 file changed, 6 insertions(+)
> > > >
> > > > diff --git a/device-types/net/description.tex
> > > > b/device-types/net/description.tex
> > > > index f5647d4..00ea58d 100644
> > > > --- a/device-types/net/description.tex
> > > > +++ b/device-types/net/description.tex
> > > > @@ -531,6 +531,12 @@ \subsubsection{Packet
> > > > Transmission}\label{sec:Device Types / Network Device / De
> > > >
> > > >  \drivernormative{\paragraph}{Packet Transmission}{Device Types /
> > > > Network Device / Device Operation / Packet Transmission}
> > > >
> > > > +If VIRTIO_NET_F_HASH_REPORT is not negotiated, the size of the
> > > > +field \field{struct virtio_net_hdr} is 12 bytes.
> > > > +
> > > > +If VIRTIO_NET_F_HASH_REPORT is negotiated, the size of the field
> > > > +\field{struct virtio_net_hdr} is 20 bytes.
> > > > +
> > >
> > > If we need a new feature, because that the implement of the current
> > > linux kernel has the same size on the tx patch.
> >
> > I didn't understand your comment -  "if we need a new feature" part.
> >
> > Current Linux kernel has same size for tx and rx, snippet below.
> >
> >         if (vi->has_rss_hash_report)
> >                 vi->hdr_len =3D sizeof(struct virtio_net_hdr_v1_hash);
> >
> > So if you are asking if we need a new feature bit? I believe, we don't =
need a
> new feature bit for current implementations and behavior.
> >
> > We will new feature bit in future to have shorter virtio_net_hdr on tx,
> however we better consume it as part of new inline descriptor format.
>=20
> Sorry, I missed something.
>=20
> One question, for "If VIRTIO_NET_F_HASH_REPORT is not negotiated", should
> we consider the legacy mode.

Most of the legacy text is not mixed with rest of the spec, so I think we d=
on't need to mention legacy in this area of the text.

I realized that 12B line is not accurate due to optional VIRTIO_NET_F_MRG_R=
XBUF feature.
I will send v1 to remove 12B wording, and only keep for HASH_REPORT negotia=
ted.

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

