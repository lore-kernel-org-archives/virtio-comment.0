Return-Path: <virtio-comment-return-9059-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E94FC47DDF
	for <virtio-comment@archiver.kernel.org>; Thu,  1 Feb 2024 05:57:13 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id CBEDD2AC55
	for <virtio-comment@archiver.kernel.org>; Thu,  1 Feb 2024 05:57:12 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A40899868AD
	for <virtio-comment@archiver.kernel.org>; Thu,  1 Feb 2024 05:57:12 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 892DA985F66; Thu,  1 Feb 2024 05:57:12 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 796ED9868A3
	for <virtio-comment@lists.oasis-open.org>; Thu,  1 Feb 2024 05:57:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lnnAGFL9Jhu5icwK//LkxfUemSQTbZt0f4s+V+fRn43wWgyx8WoynTVQeqINceK7sQ4uxr0iZdsSAArhd6934/pL/QXxxnfmauMqZR2ewIcqGbRP3DOMjASQZ2Hqwh7e8YCRdEn56UCFF7Y6OG4y6WIj+g+NvbUPhGXmmFIAKR6IQSBqZRBeN9AcKCew7oYPCpNDSx9EllsxtrLg2OPG9wVU10Lw3P0BSxjbg9ItQ+unxNC1IvAs7Aj8LWAaM5v2ZzgdnRHX9QgaQYrDjM3b33uZhXo7tsTRLikdb3JDEUqNVLbXzXb23QwLvWJAvWeZsxD1hT3/Fo+b57B6kVnBZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PCVOh22GowXcPv+cZWS6TPXgF6vnmIBGc1f3L7YdRIo=;
 b=jt2sZP8VVCgTOoeyIml8su8QJL0MSarn6L+5cy+6Rj2U+5SD4jZcCu9mEpTyHafwA+kZGw03v+x6+kxm6cdjWMbIpfKAkOFxuwCXq6OCiD+z9GAUMdNS2Ffw2RpiExJ2iRft1wBUt78w+ZmJspAw4iG3kR5oBTC3Zlkjdk2UNP5pIfz2QGY9mGalos73N1YHCE2oLs4//8SlWkviNh8D6xI04sdoI1GyMq6B7jNPw00XJjHWSqLsy3YL25qEVO1ZQDd4jIPcANFNtHfbo0YdG8F7v64d2jm4VXt2S+0/Q5bGsZm//NmMuV4VYt1k5XSXV+kSu0VRCg7U0dz+Dn2rkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Parav Pandit <parav@nvidia.com>, "Michael S. Tsirkin" <mst@redhat.com>
CC: Cornelia Huck <cohuck@redhat.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, Shahaf Shuler <shahafs@nvidia.com>,
	"xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>,
	"yuri.benditovich@daynix.com" <yuri.benditovich@daynix.com>
Thread-Topic: [PATCH v2 1/2] virtio-net: Fix receive buffer size calculation
 text
Thread-Index:
 AQHaR5W52J2qfmVC+UWFja2twvUrIrDbFOyAgAC4IFCAAHrbgIAABXdAgAAVRoCAAAmUcIAABKkAgASk8uCAFAFcUA==
Date: Thu, 1 Feb 2024 05:57:07 +0000
Message-ID:
 <PH0PR12MB5481434F066B8BE85FB0B20EDC432@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20240115093141.3539316-1-parav@nvidia.com>
 <20240115093141.3539316-2-parav@nvidia.com> <87r0iimtrg.fsf@redhat.com>
 <PH0PR12MB548114CE959557968F5124D9DC732@PH0PR12MB5481.namprd12.prod.outlook.com>
 <87o7dlmtgo.fsf@redhat.com>
 <PH0PR12MB54815BB31B88DB812507A8A4DC732@PH0PR12MB5481.namprd12.prod.outlook.com>
 <87le8pmp16.fsf@redhat.com>
 <PH0PR12MB5481E369486C3B9DA686CF74DC732@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20240116082825-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481F74BF29A751E6BC249D4DC702@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To:
 <PH0PR12MB5481F74BF29A751E6BC249D4DC702@PH0PR12MB5481.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|IA0PR12MB7602:EE_
x-ms-office365-filtering-correlation-id: 9ab6a1a2-2dfd-47ab-8379-08dc22ea9f75
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 VacxTOZrXAddrcgy5W/6TQqRQWEe1YkozsTruwyPxf//ntxiVagw53d/WqBFC8MIldGmmyKuajraFF5ULPT6ClMFWjNeX09RdQaAmYuTMDuvRa3/yT7T9kHRTx51/6NsjfNBJtOXipORwzrsOlcxVecTHksPCWW5k6j9oPZHSsAkOLd+ywU0HRdKrcMx8pgGUVthhxYKWa/qYGoVXkyga82uDi+nDvVGlKj0dFwLQ2+ByZg6l8yyLYeCLR9x2v5Zimtz+FIHuMtp1jA/NGxHJiHR6D43/g3yfLXNoIwk1DITnna3ssH1UWik3YfY0cVPIq93pxcZp33p6RjAVK79uQOKX08FxWHi34TL0PXXXwuQZGBwn1B9Nz4poV/Hd/hZRIqw2Pi5avCfwwQQSpk3gKjcyedFE3z7xkSSxcMaWNTXZJI/LwBgbvvvBprPWFVu9PfoQMRRxJzqbKqN1GR982waFKINItmVy2uXonL1pA6Kbkqzbyxj9BdAczwCN5eZGDwv4+rk/ybJ6hwkwR6QDgkHN7DahiWskYFjMv+IzhWAcalKhGmCqufYfrGNDpkbuImEsoGW8xxSmI6SXugJkZvaKih4mD1Fw86ExSLdraE/dPzb9Ni0lr2ia9d8rTg23eoVnJ3wta0ApnJhIMaMomqYRlA3PJN0qQVGElHuhTI=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(39860400002)(366004)(396003)(376002)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(83380400001)(26005)(38100700002)(4326008)(9686003)(76116006)(52536014)(5660300002)(110136005)(8936002)(66446008)(64756008)(54906003)(8676002)(66476007)(966005)(2906002)(6506007)(7696005)(53546011)(316002)(478600001)(66556008)(66946007)(41300700001)(71200400001)(122000001)(33656002)(38070700009)(86362001)(55016003)(66899024);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?mkWx3MeRWkABjoTMfFt80PDN0pL6V0KMH9/qfOyuxJD3MRvEX7Bi3+xEtsh5?=
 =?us-ascii?Q?drTtAAjZpJwotuajeRgK2svTcMmh2egp8rKrW9Qz+XRHPuVXMxxo/4Wxo5WJ?=
 =?us-ascii?Q?Rkwn3BhHYAD8g2lfkCjFk1SuXa833KTpethUjjT2wI84JQxOwN7TmpZYMpmy?=
 =?us-ascii?Q?KG4keToT5ym3HfTNBYcUaKGoUWRwe/Acw7dJoiCgof7wo1S4Q0rAmCjAnaqJ?=
 =?us-ascii?Q?RFGzYjoV//guXUHeXVqGdNSyj6ZIgMn3wm9BMHdCGk+NGUsDb7NiJ9ACprgQ?=
 =?us-ascii?Q?jA2oZL+yze/FLGskPsdVpOruPyCQsobkDmpTe/m7Tubg3+1En23Dsin9gDKo?=
 =?us-ascii?Q?D2nX0yWGpsgwmZSxHE8uyK7RHyhQNJIj38DwrfYt2rjZhWFPF/KdBAJhemrV?=
 =?us-ascii?Q?IOhl++uqWZuXfa20F5/ZJeHULpit0qavKsx/jSrZ93OX9qV0CjiFnvDevGTJ?=
 =?us-ascii?Q?4qh4xd9Q574F541DQB9/vjfvf6/nlbzxiNtEmBUjIZtpsqUDvw4eb1o7oLjA?=
 =?us-ascii?Q?1aZBL5i8YgYFweHl5pogyF1dIDQ8I6wsR+xzZJt/3KkElr7GIwJENpbNDOtW?=
 =?us-ascii?Q?n3yE/HGvw+MJLhNUOvowDcEixzcWe1BzUTJABLbYyoDLLPbT9Bm09UD6S5PA?=
 =?us-ascii?Q?N8gqhKvSsl9JlgE/6EyFKyB/JekyN2cQEATIeZmrJLT8M6H5mFyBTabV5/07?=
 =?us-ascii?Q?5ZmEEbfViElK5dk2c/8KqF9AfENzMV5bfjCBExMZwozmS8cYX8plEmldZEPD?=
 =?us-ascii?Q?NkmxRJBLVKP7aNQm6nxG1wr1GsPf+XwIY86xHMrceWz+kLcxGlQv2FgKBqvx?=
 =?us-ascii?Q?oTeBaPHBBOjM0Uvqv1KhmgNY7s01lxopMiB5y8eNahc+oeds6YXQ4BCoNVvr?=
 =?us-ascii?Q?Cg9T5TBb/kYC/SbXWY267a5jZLLjOq0YUZCXUaQqOtwR8k9Xftgo+4kn8Sus?=
 =?us-ascii?Q?12hgEB6rknKEplDHfE8l3Q1TX7P+G4rcryysmSort5XXbTUnZFQ0X9N2xeW3?=
 =?us-ascii?Q?Yi6oG8vv6LlR6HCE63q+p9osTrLaeLh4j/h9AKP1PsPManY1t6UZhLYfX/pj?=
 =?us-ascii?Q?vyol+/cGQfwpSNZ0aP7UCukE4wjI019lFJFwRsJhkketJTZac6HO2zGWqSzF?=
 =?us-ascii?Q?Iz2mygjeZKCZ5u/SMOO8gTUqxOEHsWFpH0t1CEz8hC4HygfgnFqbn7tZAWr6?=
 =?us-ascii?Q?ItnxpGwK9rnyiEoJ7sZCn150Ypg8uMs3PIiPdcn+MDlZF9jaqsWEiMAQjD9l?=
 =?us-ascii?Q?W1MpOFI3z7SzyIjVCEgPja88hIyzGDYlPc2Hog9iAZcLhS5AhCbViuR/I+G7?=
 =?us-ascii?Q?DjAohWvTQB/M3/aiWnL3cgz/eKw//8JdKxFE3TZfcsB1st84qlEN4ClH13eN?=
 =?us-ascii?Q?s+Oagl/mcXouyChOrpRJtp7T7u2cBDBuTkjskoYq8TdKYk0cr8LvC2tplYh0?=
 =?us-ascii?Q?KtEJCQ1DqdCkQw8jrT5jP/qf5E1/Da+km4almlICr/i1mYPZS/pq/jWcukK+?=
 =?us-ascii?Q?6/QP1qF0uEbbRewAIoBEGcXuzD93H6k68PgGmyeLNabnCdyl0vAS0SOqUS06?=
 =?us-ascii?Q?hv7WIVb7jowq5SmxwZU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ab6a1a2-2dfd-47ab-8379-08dc22ea9f75
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Feb 2024 05:57:07.2641
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mKMyOIajeQNc8qbwV+zhQrQcwE40M2MUu9bePUMix5MnrE89vhcEO1mBB9A2ARbYn+OzdmYZSlcVVR6gVwVkzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7602
Subject: [virtio-comment] RE: [PATCH v2 1/2] virtio-net: Fix receive buffer size calculation
 text

Hi Cornelia,

> From: virtio-comment@lists.oasis-open.org <virtio-comment@lists.oasis-
> open.org> On Behalf Of Parav Pandit
> Sent: Friday, January 19, 2024 5:56 PM
>=20
> Hi Cornelia,
>=20
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Tuesday, January 16, 2024 6:59 PM
> >
> > On Tue, Jan 16, 2024 at 01:18:59PM +0000, Parav Pandit wrote:
> > >
> > > > From: Cornelia Huck <cohuck@redhat.com>
> > > > Sent: Tuesday, January 16, 2024 6:08 PM
> > > > To: Parav Pandit <parav@nvidia.com>;
> > > > virtio-comment@lists.oasis-open.org;
> > > > mst@redhat.com
> > > > Cc: Shahaf Shuler <shahafs@nvidia.com>;
> > > > xuanzhuo@linux.alibaba.com; yuri.benditovich@daynix.com
> > > > Subject: RE: [PATCH v2 1/2] virtio-net: Fix receive buffer size
> > > > calculation text
> > > >
> > > > On Tue, Jan 16 2024, Parav Pandit <parav@nvidia.com> wrote:
> > > >
> > > > >> From: Cornelia Huck <cohuck@redhat.com>
> > > > >> Sent: Tuesday, January 16, 2024 4:33 PM
> > > > >> To: Parav Pandit <parav@nvidia.com>;
> > > > >> virtio-comment@lists.oasis-open.org;
> > > > >> mst@redhat.com
> > > > >> Cc: Shahaf Shuler <shahafs@nvidia.com>;
> > > > >> xuanzhuo@linux.alibaba.com; yuri.benditovich@daynix.com
> > > > >> Subject: RE: [PATCH v2 1/2] virtio-net: Fix receive buffer size
> > > > >> calculation text
> > > > >>
> > > > >> On Tue, Jan 16 2024, Parav Pandit <parav@nvidia.com> wrote:
> > > > >>
> > > > >> >> From: Cornelia Huck <cohuck@redhat.com>
> > > > >> >> Sent: Monday, January 15, 2024 10:14 PM
> > > > >> >
> > > > >> >> On Mon, Jan 15 2024, Parav Pandit <parav@nvidia.com> wrote:
> > > > >> >> > +The driver MUST consider size of field \field{struct
> > > > >> >> > +virtio_net_hdr}
> > > > >> >> > +20 bytes if VIRTIO_NET_F_HASH_REPORT is negotiated, and
> > > > >> >> > +12 bytes if
> > > > >> >> not.
> > > > >> >> > +
> > > > >> >>
> > > > >> >> Requiring the driver to consider the size of something to be
> > > > >> >> its actual size seems a bit odd :) I don't think we need
> > > > >> >> this, as the length can be derived from looking at the
> > > > >> >> definitions, and is already spelled out explicitly, if you
> > > > >> >> consider my suggestion
> > above.
> > > > >> > We need this because tx side also needs to refer to the
> > > > >> > virtio_net_hdr in
> > > > >> patch 2 to be same as that of the rx side.
> > > > >> > And hence, this normative sets base line for tx side too.
> > > > >> > Relying on rest of the
> > > > >> receive packet normative is not enough.
> > > > >>
> > > > >> Hm, why? If struct virtio_net_hdr is well-defined, its size is
> > > > >> well-defined as well, and we do not need to state it explictly?
> > > > > Because,
> > > > > the size of virtio_net_hdr is derived from the rx side features.
> > > > > Today there is no normative line that says that even though you
> > > > > are using A,
> > > > B, C Rx features, due to which your tx side virtio_net_hdr also cha=
nges.
> > > > > The 2nd patch in this series adds this explicit normative as
> > > > > explained in the
> > > > cover letter.
> > > >
> > > > Let's step back a bit.
> > > >
> > > > struct virtio_net_hdr is defined at the beginning of the "Device
> Operation"
> > > > section; the definition clearly says that the last three fields
> > > > depend on VIRTIO_NET_F_HASH_REPORT being negotiated. The device
> > and
> > > > the driver agree on whether HASH_REPORT is negotiated, and
> > > > therefore should also agree on the size of virtio_net_hdr?
> > > >
> > > Do you imply that device operation description is enough to not add
> > normative?
> > > If so, for this case and possibly new things if we write as device
> > > operation,
> > would it be enough?
> > >
> > > > Or is the problem that we did not state explicitly that the last
> > > > three fields of virtio_net_hdr do not exist without HASH_REPORT
> > > > (and are not merely invalid)? If yes, we should spell this out,
> > > > instead of adding normative statements about what the size of
> > > > virtio_net_hdr
> > should be considered to be.
> > > This suggested normative is added in this patch.
> > >
> > > > If virtio_net_hdr has a fixed size, we shouldn't need the second
> > > > patch,
> > either.
> > > The fact that HASH_REPORT is only for the rx, if we have to go back
> > > in time,
> > there is no need for the tx to force also to follow the rx virtio_net_h=
dr.
> > > There is no explicit normative indicating the virtio_net_hdr for the
> > > TX is
> > forced by the RX even though it has no relation to hash report.
> > >
> > > If you say device operation is enough, than I am sort of lost of
> > > when
> > normative is needed, and when device operation is enough.
> >
> >
> > Generally we start adding normatives when we see that something is
> unclear.
> > But I think generally I agree with Parav, if someone has the time to
> > write the normative, it's all good.
>=20
> Are you ok with the v3?
> I kept the clarification for tx and addressed rest of your and Xuan's com=
ments
> in it.
> https://lists.oasis-open.org/archives/virtio-comment/202401/msg00070.html
>=20

Its been nearly two weeks now.
I assume v3 is ok.
Can you please create the voting ballot?
I updated the github issue to refer to the v3 as well.
https://github.com/oasis-tcs/virtio-spec/issues/183
https://lists.oasis-open.org/archives/virtio-comment/202401/msg00070.html


>=20
> This publicly archived list offers a means to provide input to theOASIS V=
irtual
> I/O Device (VIRTIO) TC.In order to verify user consent to the Feedback
> License terms andto minimize spam in the list archive, subscription is
> requiredbefore posting.Subscribe: virtio-comment-subscribe@lists.oasis-
> open.orgUnsubscribe: virtio-comment-unsubscribe@lists.oasis-open.orgList
> help: virtio-comment-help@lists.oasis-open.orgList archive:
> https://lists.oasis-open.org/archives/virtio-comment/Feedback License:
> https://www.oasis-open.org/who/ipr/feedback_license.pdfList Guidelines:
> https://www.oasis-open.org/policies-guidelines/mailing-listsCommittee:
> https://www.oasis-open.org/committees/virtio/Join OASIS:
> https://www.oasis-open.org/join/


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

