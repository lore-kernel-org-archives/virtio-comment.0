Return-Path: <virtio-comment-return-6714-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3A2CEB64DD
	for <virtio-comment@archiver.kernel.org>; Wed,  5 Jul 2023 04:35:39 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 104FF866A5
	for <virtio-comment@archiver.kernel.org>; Wed,  5 Jul 2023 04:35:39 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 04B44986712
	for <virtio-comment@archiver.kernel.org>; Wed,  5 Jul 2023 04:35:39 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id EF2D7983FE5; Wed,  5 Jul 2023 04:35:38 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DDEA5986637
	for <virtio-comment@lists.oasis-open.org>; Wed,  5 Jul 2023 04:35:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZLN+JTY48ggXv+WDoyzZH1RpyTpu2/uRmn7UsEPTbs4IFwpE//TmcOD2CXLC5MchStTuBaqZji6RjrZDrgHu6gtyiHQGgoNv4+650vqcZt4R2X11e8uaD4QdzmHCS5XEOYpGrNMJ/hxEdGRgQiCoCvhl4LYUJ+hluC3wpBfYZjnr11VbaZXhcsadBVlRpCrAJoeIHQrajlgslMOlzcVPVVgb/A6uqaqXPisbqg3EguRIfY/tqpfhec00MqVD1ENb8ycEk+B/TJMVaUe1onuZymjwb6QEfpq/8dANWTHE8PG/Q0t1t9ZA12wi5NuwdzEpdmlnwuMJanAcK44/o57TGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=byQEyldGZwXNqZ45sRQmWzdVumNz3hp19aAfDmrPvhw=;
 b=jEKqMjJ0qkJ6kXaX4G+MnuSjSHVl1MUheMERSKZ6+XAqJrsgDj2t9lAQikYW4iz5YhLlZ7DLepeuwDvaRAfDKGKz+hB+v5XMEC+2J2V9rB2NK2qB9QShClV30Fm2qMayKlpGe45n51fom+yZ5JCaNdemZp12IrlRPzkMFvX2wE84/A1/mVWxYy+j8X965UQSnEXOsYfHUfQ7Ja4qcLgWazUT0zJoKtRFEFrHllkewzCzPST40urKqTboPIB6ZIoWxrm+WMLuRheYJOdUcg8k1AbGu+DqI8saoekJya8dopNvJl5nr6v/BuJBUt6plYzXFaxefIXlXbJhSbLWuPXCKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
CC: Jason Wang <jasowang@redhat.com>, "Zhu, Lingshan"
	<lingshan.zhu@intel.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "Michael S. Tsirkin" <mst@redhat.com>
Thread-Topic: RE: [virtio-comment] About the plan of Admin Queue
Thread-Index:
 AQHZo0OgMaVHGskGLUio/ZFR6jh2f6+TVwYAgA+RFwCABNz3AIAAAtoAgABPh4CAAYQYgIAAEItwgAEAIYCAAAE1QA==
Date: Wed, 5 Jul 2023 04:35:36 +0000
Message-ID:
 <PH0PR12MB54814124F8CD6E90AC8F0F47DC2FA@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <1687243466.51691-1-xuanzhuo@linux.alibaba.com>
 <e37fb447-fd22-4d42-f3e2-2ab6f1c8f3b4@intel.com>
 <1688104464.531018-1-xuanzhuo@linux.alibaba.com>
 <CACGkMEtNPGneB0E1sVqmpe9fGwMp=_2vmepy3Bm9r=5=5r=ZXQ@mail.gmail.com>
 <1688372430.0519888-1-xuanzhuo@linux.alibaba.com>
 <20230703071106-mutt-send-email-mst@kernel.org>
 <1688472851.555355-2-xuanzhuo@linux.alibaba.com>
 <PH0PR12MB5481F6EA4699382DB041A880DC2EA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <1688531407.740055-1-xuanzhuo@linux.alibaba.com>
In-Reply-To: <1688531407.740055-1-xuanzhuo@linux.alibaba.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|SA0PR12MB7477:EE_
x-ms-office365-filtering-correlation-id: 1813b759-2504-4327-602d-08db7d1146fb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 l8j7Wkn1ix6rNbvmhWpZVdY45PP2n5kt7pL2/i7qfC1+0QenO7aZG2NatWjfw3wutZcQVJMj0Rv+bGyogzSqdi/Kmkckamh7jnxq9yLJ5japWsBK8LjIB2N0eNTkGtZPC72447eKcbhg8PXo1XwyrsdgjxG2zhnyXgyiDu8CqgRtgTH4GxJL5+ntzJtTWehkplTxjZkL+tq1fhwtfSsuOkmYsG0XzXoMqXIZ69qflT+jQUebY5kYJB3g+XBewdTVVKCup+OM1t/4zVseQXLojDsDukWRrNpXuO0qzWQF2fJuOr1V9siqB/mtfoLvVdM2A1mhoWM3NN/hCLtQlJYyDoyb6CT25c8dFG0dISA4bCaIV+coQIlB6+wXBuYVjyTxvc/Oie1+Uk+HBC/xwDflMearH5kBBBZutpqhm18UDPMIRJFrT/qtKh6i6XG2oRIzvvZu8z6CSTfoyaeqn76BTVgsnd2BIdcZAiBNOBN+Z9yQ4pewfRdtdt2qU+leOiNgq0WnI/720yZ5AvCyVihnq2+xzzMW3AFKvUdon5oiBJVOmdlfQeRJimdTJPwv2zqd0LYpGFDHoNc2Xk1M+hNPI6LWn3cPNJshazx3kSqO4WhMMHAtPPk9sSo0/6/Z4dQ4
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(346002)(396003)(376002)(39860400002)(451199021)(6506007)(76116006)(66446008)(38100700002)(316002)(55016003)(38070700005)(4326008)(66946007)(66476007)(64756008)(66556008)(122000001)(6916009)(186003)(26005)(9686003)(478600001)(54906003)(2906002)(4744005)(8936002)(8676002)(52536014)(5660300002)(71200400001)(7696005)(86362001)(33656002)(41300700001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?TeW/yoi90xV+hh1nCOJUAnRJDn+6iRvl5qIfGhpjRhWOcDV71A72/j6XlIWG?=
 =?us-ascii?Q?Pm1SowWTAxrbpxvq74tw7OQxAfMpxZJ4D6iFsyFmxjSTBbWVaGiUlZqFjeA+?=
 =?us-ascii?Q?pGlfkDlCEW4KOzai/mdEWqIucyz0MlOTJGx4GI/2+g0EMG/EUfbGSqOPuSih?=
 =?us-ascii?Q?amCcGN2qL16DAVxcv5N8wrrPAKu9ni9VBQIpg/zDqZUYRZcKRs6QJ8UM4GKY?=
 =?us-ascii?Q?4p3osGyJJmHvuImQ4KZNDyW/pzB++H4csX7XXXftOFumS3rb19Hc8sa0DkL7?=
 =?us-ascii?Q?GgbBDViMx6i4YkncsxU6Mfaxj5Ewt3covbo4RacC3lzMnU3mr2GKjBeo2xzS?=
 =?us-ascii?Q?GpSg0PkI4V1ugdKnt8Mp4/YupQpQfppEWE1uiCo7BSUDlxnCaX4pb4OxwVPI?=
 =?us-ascii?Q?Zz9lDTtleo+SWDTzSoCJNHXLGsBNaA/pmtSm0MRjLudUeNS5oScxhikonULT?=
 =?us-ascii?Q?bQzoaz7cLdN916kA9nw3fpx71CF4CWlHXzVd8zo+BsSqDKLbjIW2QnPwtn/f?=
 =?us-ascii?Q?DulXt/1t0MgiibSm8cIICkCPim7t8/C7CGCxaKtDMpLL/WP5BPwsoMY1Y9sA?=
 =?us-ascii?Q?B+AYweE+lWdvj9sWOMn+aRfcZbf95MJxptdTDecQMvznZ6HMClgqG6SzKKtU?=
 =?us-ascii?Q?mVf8VrFjW9n1OFONXT87mnFqPDhrYhh3rtlVtAKeH1uvtOAWG3otkjL66S/g?=
 =?us-ascii?Q?lqPVlG8MwNKk4plE8liQM+SkzQbx+RqwD0uzw5Rxe3kixS6DxnVZxP/HIjbs?=
 =?us-ascii?Q?vIraXqRG8CzmOL3o4tBHreafNg4aQDXTLNH2PmyuconqrDTcM4AU+d06ZgOR?=
 =?us-ascii?Q?Yrip08D8/ds+r57vwWbxqnETN087yV2VYnjb9lmQI2AAR4RmLWZ75H5VQTUg?=
 =?us-ascii?Q?kbFlX+pHKpX3HMkOWSpvyCzQxRBz8Xsbttu/HVnQmfdsPresz2oJfuvD7W3q?=
 =?us-ascii?Q?BgQHUJPHze51GXLpxMmOqUVeSlt14DRNAxky1hxlz9clCJrulyGVhDIPJdq/?=
 =?us-ascii?Q?/9dHGNRIGuMW51Mm+Nf6H+/UgXcBqEx2K2tWN9SEgHsi+cyn/VVsBzyLyal+?=
 =?us-ascii?Q?kghAVMpWF7F4D+0HdrWm5bl7bk8S01H5PqtAexof1ftvbPFlHh6JAAf7RZhf?=
 =?us-ascii?Q?J1BFKDyOSsDXer4B4IINaTLZE+aEDOstMV5ISgXWRhZSsEZi8MARdQdOsIrs?=
 =?us-ascii?Q?efHxHehku56dzr4M9RYAxTOanWMuQVb0PqflTtTfbj4lZJJjfQPw+/Zt4PpY?=
 =?us-ascii?Q?2UL8s/HT/0NCqxgkRCh+4AyWY5hKpQ4wQxiSnwe0E0HjF6tsh2jpQcGkLlAy?=
 =?us-ascii?Q?HaaPVgD15jPExPV/Xe+OC3KTBP1NsZ3QAmr4jKClpYXq1nb+2/PS2YfbmD2w?=
 =?us-ascii?Q?xqRYt/Fm2GhzRjp7rGf3yaT2hfoIMddRcg0JsdoBvF+TyGCI+9KTI8U56qRJ?=
 =?us-ascii?Q?gVt1vlI3YgrOVRYtzz+V8pBBwERotFkVukWdFsvfhnICXD37iBY+aXSA7YG5?=
 =?us-ascii?Q?E3Px2GorNF4qdn3KokPvM19c4tfFVzcj6scoXQbJr9v+82myXeTBzGRktE18?=
 =?us-ascii?Q?DQlxl1TGflcxe/w2Xqs=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1813b759-2504-4327-602d-08db7d1146fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2023 04:35:36.1716
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w0XyMHVNt7JklnizpchdjWyNZJyGxHVSA7Y8muRIeUb3qbbpexAYedoEmJNk+swWnGCPq+aTeP6skldMz4Jb9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7477
Subject: RE: RE: [virtio-comment] About the plan of Admin Queue



> From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> Sent: Wednesday, July 5, 2023 12:30 AM
>=20
> On Tue, 4 Jul 2023 13:15:23 +0000, Parav Pandit <parav@nvidia.com> wrote:
> >
> > > From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> > > Sent: Tuesday, July 4, 2023 8:14 AM
> >
> > > But in the scenario I mentioned, the vendor's management software
> > > runs on the DPU, and all hosts belong to the user.
> > >
> > How did vendor management software configure the parameters on the src
> side?
>=20
>=20
> Sorry, the src side you mean the host, right?
>=20
No. in your live migration (LM) example src side mean src side of hyperviso=
r where a virtio device is used for the first time.

>=20
> > Same channel can be used on destination side, right?
>=20
> Do you mean that the bandwidth of the net device can be configured by the
> user?

No no.
> I think the user can only do this on the platform.
>=20
Right, only by the platform.

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

