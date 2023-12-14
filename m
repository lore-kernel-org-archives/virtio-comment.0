Return-Path: <virtio-comment-return-8798-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F27E5C46CA2
	for <virtio-comment@archiver.kernel.org>; Thu, 14 Dec 2023 04:29:19 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 35B7B2A88E
	for <virtio-comment@archiver.kernel.org>; Thu, 14 Dec 2023 04:29:19 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1386A9866D7
	for <virtio-comment@archiver.kernel.org>; Thu, 14 Dec 2023 04:29:19 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id ED8229866B7; Thu, 14 Dec 2023 04:29:18 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D8063986689
	for <virtio-comment@lists.oasis-open.org>; Thu, 14 Dec 2023 04:29:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FqZRVcfLMN2IQzFHdEbKFYEi2LTZ9K7tr8q8gx/CwOCsuaSEYgEKK0oTkVWsfO3SijaDcEqEeAhLww+sHm8WuIfToiLVzTPnm9GoSFO43voBFWL/nWHWj/wM3jKxb5p9dr1Z87+TFmzrDdd0g4yRFC+/5mfYcVdsMMhTtGiHl0GAcAUgPsNP72LWMAbadE1Ws/ZOq2tI1BdRteRztRZAjgNNCsnsbv6nS+OLAmc+8G6Kopl+BIeWFYAalRUMNdCIArCOjhmPxM0kW/a5el4j3+BUyK9DUzuPKQWhSnn7eHBBWXPRZ26XzE5qRIJ1t7KQcMgQuo86lgj9dTbISxOTEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WGGp0qlQVOZIToy9fuGibCG1aESNtW6yeyFouv1opQg=;
 b=KSRXINaHsEOi6NQ9bbCttTRKqc0ZpI9YxuzTB6HRx6rMwAXflKmhG8Rc/kRsPkM69vkaP4JfODwhLOK3mcVPerOrf5gzHTQHroqXXuKuuFQyf9P2cbVVtLvUdwy6HQem3QhsMgNE9dpIeyrp7kbPwFR20C7azBw9DcVD+8ptfmEa0LagrBRT34Q+Vd8Qv57Fmnws3fVsvzxTu8whq+RP7X4C7MaLaIDdLZNhx3TwGSqIVwwSZ+O+rpzjh0TO/uWMhE1p8bB0RUGqOnOC0ZirhzTB8cBbgDNMBC8K2kPSKGzDxNlQMCaWWrxjPVX19OvJEw787Pib2lL4chxmbyw1bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
CC: Shahaf Shuler <shahafs@nvidia.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "mst@redhat.com" <mst@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>
Thread-Topic: [virtio-comment] [PATCH 2/2] virtio-net: Clarify the size of the
 struct virtio_net_hdr for tx
Thread-Index: AQHaE9MwidDLWG83gUqvsXqFcltN4rCoQniAgAAh5pA=
Date: Thu, 14 Dec 2023 04:29:13 +0000
Message-ID:
 <PH0PR12MB54817B362A51CC4931DD0806DC8CA@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231110124040.2093394-1-parav@nvidia.com>
 <20231110124040.2093394-3-parav@nvidia.com>
 <1702520839.9808125-2-xuanzhuo@linux.alibaba.com>
In-Reply-To: <1702520839.9808125-2-xuanzhuo@linux.alibaba.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|IA0PR12MB7649:EE_
x-ms-office365-filtering-correlation-id: bdb428ec-3249-4a1c-7cc9-08dbfc5d39e6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 Vx3DU3KtHj78CW+VjglO4fHj/iRw0DhVVgCskneptYVAveXJ7RyG8gJi4AibWRDpz8/bDVq0xnOexBGwu09iAoY+O+FqcWP58CwJATIH4xBHTAaMojAb2Z0luP/HIGfCysZHIuCdLdCDFJVMgC7vS9DDe0LKmA5SpicAuUcf3Mvu6zBIQEQDXPpN2jXjt0e3YKB1F4N8o9iAgvf41APxXdyCfknoldGD1j9Mg5Vq9GR8wCKFzhHn++EKG3xDJJJak0PqVcPMm+xudqVEo37cpAZelsZjS1TFSjdzQLSoL3AOtUpsEfobk5DGqe0bUajmokVAyK5LYXKtO4P66pg0momC6hFjbsuI1h6rRkpKqj/64KEhJme6zKjzuLXMzNDo4R+ExNiJWMpLWzhMdEFwy9LI5+G0YkseSJ9WLT8B5lzuNd0xOwAnP7/JQ9w8A5cTPMMpys4Kotf5U1layvlVra8yvsKHJSiSdMdtypK2qL2wG/zMmN4prb0bYzSHrPUCTGDKGkVeI5mHmfFPhJpcZwVCnl9fnW5gnbTxTqs8x7i3KlsiQM3DPNk4PAJyjzmKVpO03fi9UkntaMePzdw03r+vi5rPa7H3vS4Z8BxnkIi2x4hJ0Gf80mU6zz22s2plFAOCYnViDfLVuudEJ+F3grRywvDViiN8/Km3zrL9aTe13qarx03DyX9nsScNt1PS
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(136003)(396003)(366004)(376002)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(38100700002)(83380400001)(41300700001)(33656002)(66899024)(122000001)(2906002)(966005)(5660300002)(478600001)(53546011)(9686003)(7696005)(6506007)(6916009)(66556008)(64756008)(54906003)(66446008)(66476007)(316002)(66946007)(52536014)(76116006)(55016003)(8676002)(8936002)(4326008)(38070700009)(26005)(86362001)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?mPS9wR55JJkWYLJr259GbwGd9i6TAIi5Gwrv3b9cZn1jzwfV3HnuGlzTj2Ag?=
 =?us-ascii?Q?TP/BueuYElOKF+RIYTlr9ZiNgCtLsfMQ3x4QjHE9iC1FKU+Gt+E7re03E7+8?=
 =?us-ascii?Q?HhXR2gIY0fDzwN+HawN8qz7vP/q4i955g8xsLWgZVnXSlWTwLDZLOrgCzO6G?=
 =?us-ascii?Q?CCYmVkT3//IjDwk1RTfCAhZxHWKUkWLSHtlyb5rBpfyHpSHkz7I4iqP2ggot?=
 =?us-ascii?Q?ON3qJ5BEAt7hF9SRNpbvyL3FmFLsEciPRGS36BFR2De+90GA03sKefcLkvGi?=
 =?us-ascii?Q?X4EB9XDFey6r9m4dQjpo8o96JgJe7szP0tXnnsu0UmQFDutNBaXt+hxLbqG3?=
 =?us-ascii?Q?0vZa2INBFofnRvsfUG+1yjYWPFmihK/A5uMFKHL5KTztKJNA2Tilv/4x6hGQ?=
 =?us-ascii?Q?5hGIKZXwLiSHeOpadNtAptuLnFGK4wsKPnNHZddyTriTxWvw3cu9nofEytmv?=
 =?us-ascii?Q?hVqsoYaO6N8HD1MvpDcQJHmQwBCUvmGonFNB4UJ6GkbK+wLSkN4OLhANealp?=
 =?us-ascii?Q?0Z5/tj2j8xXNjNWPh5jn93n3/9t+pbR3R6lK1zo1Nf+YYjksn8Pk6niAxyLl?=
 =?us-ascii?Q?IhRANI281hIdw0Uzh9KBmuLDyhfe7nkETTDMNindTsaySK61CaCGsy2zbzw4?=
 =?us-ascii?Q?zyWhZsPFvYh+cpnwCxPV05vdXWV9XVNtbzDJV2QI4HXCWP06LnLbvg7orrz3?=
 =?us-ascii?Q?LnS9Br+GrzLF2FNQOSe9iqCJJmZbaJaSIM8spV9LMwMuKSWFRo7vfy3G9jiK?=
 =?us-ascii?Q?TCQ204w9GKVajN9HkDyQQQqLq8YJu/Ikuqz/a1GN563n0XEvzK15VUZuInkW?=
 =?us-ascii?Q?fTjwvnbBw3SkyRZPPnqVlKymD3zFfnG8SREKijbBbFlwCuRyHeECD6a9pssg?=
 =?us-ascii?Q?/WTjnwALcwIyrtfCBzP2dNForvJbi00Zh2DpFmNDsO1VPcx/6b01jEOtwoMj?=
 =?us-ascii?Q?yf9u3oARwBXXpkdh6wJk17oRQnSbGLPvYzsPgOZeZcz2pw4sF5Gw69eqeNYA?=
 =?us-ascii?Q?eAliQnPWCD00P8oCyPfC0RJLiu2KZyJRfuY8BVCuUH7H1m/aRpWPTzSA7Z06?=
 =?us-ascii?Q?0uI+D4IrAqzzHIgbixE1uZIBJgqCWmBYr1LEUtu2rXi8zESiPonfzawmzS1f?=
 =?us-ascii?Q?Wk4GIFghnn46o3x+b4LUzdkIax8oronmSC/SwT5ouHhOQ4REfBJjGM+vIbxF?=
 =?us-ascii?Q?KXe8802GYdnMrko43qHXKJIxEbM0759iQJ71oqaB2i33SetEkVcASonvOWDA?=
 =?us-ascii?Q?vDDwS/Epbl6Ris4IoCYcMT20sPAPB0rXo+4LGhWex75Z+AjG+XDgVbAKP84I?=
 =?us-ascii?Q?zp1sxLPEUCiWtbS/6q/FjIOQiJzKBy6kWEJRRKWCBG73cy/bKJuksu28vZOF?=
 =?us-ascii?Q?wPjyx0/2eCSk4lBlmOrmESE8BY/1xGryNhdX3ziKUlCb2cOvUE0oJGAGuXzk?=
 =?us-ascii?Q?LZFzCS3rQrEc/ym4MM++/Cc9wMl0tMfMpdD8aPWKhJDOia+USDhK2y/Ys/qB?=
 =?us-ascii?Q?sOxz+KKxJUQkmOFo0uO4ApaK3OMhhwMXV51n3eJcksvYLWx+lxee+yS7Al2i?=
 =?us-ascii?Q?SRBsTxlD/sKTRdVSrYo=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdb428ec-3249-4a1c-7cc9-08dbfc5d39e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Dec 2023 04:29:13.6333
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ei1WNjQpOK8bJ6O8/fVM2aFghFHGjVbDOwT8/gFTUX3OiNwooDxLhkFRaXuMUeArSVp1TTrTMRMY6wa+NYDMGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7649
Subject: RE: [virtio-comment] [PATCH 2/2] virtio-net: Clarify the size of the
 struct virtio_net_hdr for tx



> From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> Sent: Thursday, December 14, 2023 7:57 AM
> To: Parav Pandit <parav@nvidia.com>
> Cc: Shahaf Shuler <shahafs@nvidia.com>; Parav Pandit <parav@nvidia.com>;
> virtio-comment@lists.oasis-open.org; mst@redhat.com;
> cohuck@redhat.com
> Subject: Re: [virtio-comment] [PATCH 2/2] virtio-net: Clarify the size of=
 the
> struct virtio_net_hdr for tx
>=20
> On Fri, 10 Nov 2023 14:40:40 +0200, Parav Pandit <parav@nvidia.com>
> wrote:
> > The feature VIRTIO_NET_F_HASH_REPORT only applies to the receive side.
> > However, when VIRTIO_NET_F_HASH_REPORT feature was introduced, it
> was
> > not clarified that the size of the struct virtio_net_hdr on the packet
> > transmission also uses higher size when VIRTIO_NET_F_HASH_REPORT is
> > negotiated.
> >
> > Explicitly clarify this.
> >
> > Fixes: https://github.com/oasis-tcs/virtio-spec/issues/183
> > Signed-off-by: Parav Pandit <parav@nvidia.com>
> > ---
> >  device-types/net/description.tex | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/device-types/net/description.tex
> > b/device-types/net/description.tex
> > index f5647d4..00ea58d 100644
> > --- a/device-types/net/description.tex
> > +++ b/device-types/net/description.tex
> > @@ -531,6 +531,12 @@ \subsubsection{Packet
> > Transmission}\label{sec:Device Types / Network Device / De
> >
> >  \drivernormative{\paragraph}{Packet Transmission}{Device Types /
> > Network Device / Device Operation / Packet Transmission}
> >
> > +If VIRTIO_NET_F_HASH_REPORT is not negotiated, the size of the field
> > +\field{struct virtio_net_hdr} is 12 bytes.
> > +
> > +If VIRTIO_NET_F_HASH_REPORT is negotiated, the size of the field
> > +\field{struct virtio_net_hdr} is 20 bytes.
> > +
>=20
>=20
> How about just say the tx header is equal to the rx hdr?
>
Yep. Working on rewording as acked yday.

=20
> Thanks.
>=20
>=20
> >  The driver MUST set \field{num_buffers} to zero.
> >
> >  If VIRTIO_NET_F_CSUM is not negotiated, the driver MUST set
> > --
> > 2.34.1
> >
> >
> > This publicly archived list offers a means to provide input to the
> > OASIS Virtual I/O Device (VIRTIO) TC.
> >
> > In order to verify user consent to the Feedback License terms and to
> > minimize spam in the list archive, subscription is required before
> > posting.
> >
> > Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> > Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> > List help: virtio-comment-help@lists.oasis-open.org
> > List archive: https://lists.oasis-open.org/archives/virtio-comment/
> > Feedback License:
> > https://www.oasis-open.org/who/ipr/feedback_license.pdf
> > List Guidelines:
> > https://www.oasis-open.org/policies-guidelines/mailing-lists
> > Committee: https://www.oasis-open.org/committees/virtio/
> > Join OASIS: https://www.oasis-open.org/join/
> >

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

