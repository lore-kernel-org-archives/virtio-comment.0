Return-Path: <virtio-comment-return-8958-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF632C47077
	for <virtio-comment@archiver.kernel.org>; Tue, 16 Jan 2024 13:20:35 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 17E9C8746F
	for <virtio-comment@archiver.kernel.org>; Tue, 16 Jan 2024 13:20:35 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DFE1698668C
	for <virtio-comment@archiver.kernel.org>; Tue, 16 Jan 2024 13:20:34 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id C50AB9865C8; Tue, 16 Jan 2024 13:20:34 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9E7D79865C9
	for <virtio-comment@lists.oasis-open.org>; Tue, 16 Jan 2024 13:19:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lY7E1VTJ94AmlCHdoO4oLMsc94J9vQ8Myh+3NuYp3O0wdwkYUjVQIQskyVnSrZ4GCjnOUnxj0+/C6mxRMSWZgAN4RZtQmlpPSFeBjPWWcCQwhyFWJNYHds3KWsL4yeaffBioIJ9EBrBYEA2hsum6We76OM7ttPCNC1UbIRCDrc0hO2VBdpRNG2bWAqEq+R9hG9NSZvyplhEqVGoLwai1jP7ii3V1msBr+5s8nHDyhHrlo/nOoUsL6Z2mIEViQHp0F/kMC/fSYQCHTavnLqO3KYy5wB2B1NKHQ6aga7Ycc3keyqQIQwsMc5PG46jwpb93DwMn6O+Qx3j2nv6u2LeGUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7TrIgEmVlIwlR0MRv1s77IaEGu6FgInXvwbTNxYfocI=;
 b=VMD7CZsd3A1WMDBI1AHuYW18kgFNqSKkZHPLZ8lWDiv1hn8Hy2mVLOtNQNAkVckFkZQLWlLrjP+UritZUlujM+mKfUj3JGAwwvfI0hJP+ona7Rk22fKNY1qOv4E9OWJINq8unDFyUX53Qzq7Bxrlc1LxlwtQv5Ht54UdV9TO3Xz2CqA1adkXjiV5ZRfDtG6U4I1NUxeQhvkiPXpBCwmrUyWuEWjc1RbnOeqIiAqygKRt1unuuQY2reL27r4erkW8xkRwK69QSI2x4nO1FfsyzooqRa+tIH4DvRNFlLW66JfZ729QahlZDqa4rotXcsKnW/rTladnMmQ4O7pdGSilYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Cornelia Huck <cohuck@redhat.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "mst@redhat.com" <mst@redhat.com>
CC: Shahaf Shuler <shahafs@nvidia.com>, "xuanzhuo@linux.alibaba.com"
	<xuanzhuo@linux.alibaba.com>, "yuri.benditovich@daynix.com"
	<yuri.benditovich@daynix.com>
Thread-Topic: [PATCH v2 1/2] virtio-net: Fix receive buffer size calculation
 text
Thread-Index:
 AQHaR5W52J2qfmVC+UWFja2twvUrIrDbFOyAgAC4IFCAAHrbgIAABXdAgAAVRoCAAAmUcA==
Date: Tue, 16 Jan 2024 13:18:59 +0000
Message-ID:
 <PH0PR12MB5481E369486C3B9DA686CF74DC732@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20240115093141.3539316-1-parav@nvidia.com>
 <20240115093141.3539316-2-parav@nvidia.com> <87r0iimtrg.fsf@redhat.com>
 <PH0PR12MB548114CE959557968F5124D9DC732@PH0PR12MB5481.namprd12.prod.outlook.com>
 <87o7dlmtgo.fsf@redhat.com>
 <PH0PR12MB54815BB31B88DB812507A8A4DC732@PH0PR12MB5481.namprd12.prod.outlook.com>
 <87le8pmp16.fsf@redhat.com>
In-Reply-To: <87le8pmp16.fsf@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|SJ1PR12MB6121:EE_
x-ms-office365-filtering-correlation-id: ba6f049f-a219-4b97-8614-08dc1695b345
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 5mce9BEcS/c1Ocd/CuOIBlnuWEXEkloMf+xT05SXYuWdMM8HkwovnpNR1QEm1Fp5PVQ93dn6sBNB3UH0Qn+Bc9W14FRelwL03CbrAez/BxUog63y09FMxw639PyaIyRtubvlhlalgRgns16Vi8O/8tiCbhbr11SLHuR5reI7sYehjjIJOBufTRzI9jjBaGgh8Axwt+bHZBNwieJs+S04SIEXbKRe6RpWemopBbT81vYAqROxe8OHCV3/cQFTgrX9HrcKdLioG4u8Ec8t1lgB6t5ic8L52SzUrkDPnb8awjDFucjYFLkrHbK/GWNm8oNU58lZOi25I3kPBeX1ljWqeyMrMAye0Izitck0PDq14xeVyHaAo0Hx0SvYh8WehJ/BoAIdwPN2JMD9r3gygh0DrTrS6+B+94d7tkSsZ/7uHAurgvLMgJ0YvWmiBZGD7RWciRjv5T/pt97OAH2sCJpb44kZROv+N/x8mOUB/YqvN4IQAVNdOEUTQpI7vrezTgJjcDu38wtVSc4ZyvfD66Q2nfdkVevI4vJNfaIwSzI4DMAiqDZGIJnqwjVR/3ek47X4ymRIJvE5ngFncEiw0IKuCq3Vbl87v54pNz7mOIG5Gxdy88zDK5NOCukEe7QXtvyE
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(136003)(39860400002)(396003)(346002)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(86362001)(38100700002)(122000001)(55016003)(33656002)(38070700009)(26005)(71200400001)(6506007)(7696005)(9686003)(316002)(76116006)(478600001)(66946007)(66476007)(66556008)(64756008)(66446008)(110136005)(53546011)(54906003)(2906002)(5660300002)(52536014)(8676002)(8936002)(4326008)(41300700001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Djj+eN7IATDBkk3tirsTpHycuqDCSuTqEZASoH/iRWCYebeiO5N9o4fpfyYA?=
 =?us-ascii?Q?TlTaFFqBtn9AHTyuy4rHZ29rM2G9ISnSmg3ML71JczxOoJTWaTw5lrHt0nah?=
 =?us-ascii?Q?b89XLadja9vNm36ySM3NsrT0WDJWcC7Rv8cFwot7U1Jz0fXSYNvDlNa+BIe8?=
 =?us-ascii?Q?CVSYR3iw4aobOvLoHaaeMbDWFlD3/+IWgRnxsvxtLa9wrKKddsfHJK2jPqrv?=
 =?us-ascii?Q?kdWfX+l3kpIv1FLAh/nSZ56Y+2ojvqr0mKwMppSYjNDA+r60w+7FATV6GvCS?=
 =?us-ascii?Q?dGiAztBFoQxlcRdOtGK11AZwkZCeBzHO/NtCufVtY9qhrEmOhwCg5iytbXa5?=
 =?us-ascii?Q?SGktq4YhOvbqBeCBLOC5BGSn7jJrxKEIeuEOOeyzcPjkbDGJ74pUEfBMruPQ?=
 =?us-ascii?Q?udJdKSJUszZ+LYzh5exPHlgQiN64S4VYq1xqMIWeWwQu3C7iT6qJxEkL9gEd?=
 =?us-ascii?Q?yXZMPvrC1Varx5sjHeLVgyp4N+ucdyY3wmqLaoOsdVz1LkRTlrdS6lxq5xti?=
 =?us-ascii?Q?6seBJWyI/UuHJ33EYK+RKk0blihqZTd2zDEZ2tnOk2GlNREwXzdygN32U/sz?=
 =?us-ascii?Q?yIj7Wilc0C98Quq6phj6o75Rr5bA7smswO33jcGQYVrYDkdIbhQaAIZoJAvD?=
 =?us-ascii?Q?9Zx+NSyOqMDUyaIJ4vIH3UbHdbsgh3tl2qaBgkuYr8Rw3YYceJL5OEPi/95V?=
 =?us-ascii?Q?qiPwRYA0CfNg3ccZzCz4ddeI6ehXNlEbpLI0GI9PYRKlIrDZZ/NCuzy3egOZ?=
 =?us-ascii?Q?I+REiScaKNGnVZZUcmxvor0uS2ygN5rrDXmM2xEi6PUXDP5vwzGDTSR3NJHI?=
 =?us-ascii?Q?TVLeSiDC0qreaDOcNXm9ZOWroI7ZUjPOpjH5nPakpCltQ00dtaSrJeFobRH9?=
 =?us-ascii?Q?pyd4LwMv55+HcfraUcDDnS0dbfzh63HY3ZybRa6g2URhZbj88f830HIklQMW?=
 =?us-ascii?Q?4A+OEdqEiNHonk2fS5G4+uXM5ZGG47geWI+L6JrC/ZlSh0h0pysUBRQJ23Pz?=
 =?us-ascii?Q?5323/ZfdMTsm4ypQBeTGfvVwejchXNlp7NXlbTBgMYfb6ePq4fx0lbne9aga?=
 =?us-ascii?Q?9fzBkypx4YQMyOz0UdAm3E3DqlVe9ebNSMCXWYOnNLEkaln7eri3gXMw2Y/E?=
 =?us-ascii?Q?a8xPcDn6pNdv1WK20xMghU20Bcxb3dhE3s4UMG2P0R/wCyuWl0XlkLj3bOFW?=
 =?us-ascii?Q?3RKLwpl3GEZpkyVsmmrbVh8ztD5ZSR3Q50VUi+b+4mDYiVasjAdP5lGASX3y?=
 =?us-ascii?Q?vz0Piak3k/RNagL2tjpmjtEDN3mSz0p5knXF5Rp+BMtkcMw/Cz3TYhbaFkeM?=
 =?us-ascii?Q?IcNZOzHx4NwqayJUazxrdIp47Q/pkmLxqGgDDkYlQVXZgczP+xjuktb7gp4a?=
 =?us-ascii?Q?XVECdL3lMvYjcdex/W+gqVAwGICpsYbl2ON5WgYZtFaJKVF3mvoPmI7ZOFdP?=
 =?us-ascii?Q?z1xkD80pigaGt/ukYNiJzKgzNFV9iMcOk1A+OOCC0pga2++SS4jWI4exhSTO?=
 =?us-ascii?Q?LWsvB+LU81iJVjDBblXQ45u6fe5WVJV9L7H8LG3KnbDBgG8ZJFJXoWoB05Jh?=
 =?us-ascii?Q?XVgUJnIRPaoeON0cX8Q=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba6f049f-a219-4b97-8614-08dc1695b345
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2024 13:18:59.3252
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FOnA8Qvm73k/xl3BZAyn1p0+PcL/jgp6A7fuHqMKYsCl4Q3HU7EgN+Q9D4HRxyngMXhhs92zV3oKi94pWU60Qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6121
Subject: [virtio-comment] RE: [PATCH v2 1/2] virtio-net: Fix receive buffer size calculation
 text


> From: Cornelia Huck <cohuck@redhat.com>
> Sent: Tuesday, January 16, 2024 6:08 PM
> To: Parav Pandit <parav@nvidia.com>; virtio-comment@lists.oasis-open.org;
> mst@redhat.com
> Cc: Shahaf Shuler <shahafs@nvidia.com>; xuanzhuo@linux.alibaba.com;
> yuri.benditovich@daynix.com
> Subject: RE: [PATCH v2 1/2] virtio-net: Fix receive buffer size calculati=
on text
>=20
> On Tue, Jan 16 2024, Parav Pandit <parav@nvidia.com> wrote:
>=20
> >> From: Cornelia Huck <cohuck@redhat.com>
> >> Sent: Tuesday, January 16, 2024 4:33 PM
> >> To: Parav Pandit <parav@nvidia.com>;
> >> virtio-comment@lists.oasis-open.org;
> >> mst@redhat.com
> >> Cc: Shahaf Shuler <shahafs@nvidia.com>; xuanzhuo@linux.alibaba.com;
> >> yuri.benditovich@daynix.com
> >> Subject: RE: [PATCH v2 1/2] virtio-net: Fix receive buffer size
> >> calculation text
> >>
> >> On Tue, Jan 16 2024, Parav Pandit <parav@nvidia.com> wrote:
> >>
> >> >> From: Cornelia Huck <cohuck@redhat.com>
> >> >> Sent: Monday, January 15, 2024 10:14 PM
> >> >
> >> >> On Mon, Jan 15 2024, Parav Pandit <parav@nvidia.com> wrote:
> >> >> > +The driver MUST consider size of field \field{struct
> >> >> > +virtio_net_hdr}
> >> >> > +20 bytes if VIRTIO_NET_F_HASH_REPORT is negotiated, and 12
> >> >> > +bytes if
> >> >> not.
> >> >> > +
> >> >>
> >> >> Requiring the driver to consider the size of something to be its
> >> >> actual size seems a bit odd :) I don't think we need this, as the
> >> >> length can be derived from looking at the definitions, and is
> >> >> already spelled out explicitly, if you consider my suggestion above=
.
> >> > We need this because tx side also needs to refer to the
> >> > virtio_net_hdr in
> >> patch 2 to be same as that of the rx side.
> >> > And hence, this normative sets base line for tx side too. Relying
> >> > on rest of the
> >> receive packet normative is not enough.
> >>
> >> Hm, why? If struct virtio_net_hdr is well-defined, its size is
> >> well-defined as well, and we do not need to state it explictly?
> > Because,
> > the size of virtio_net_hdr is derived from the rx side features.
> > Today there is no normative line that says that even though you are usi=
ng A,
> B, C Rx features, due to which your tx side virtio_net_hdr also changes.
> > The 2nd patch in this series adds this explicit normative as explained =
in the
> cover letter.
>=20
> Let's step back a bit.
>=20
> struct virtio_net_hdr is defined at the beginning of the "Device Operatio=
n"
> section; the definition clearly says that the last three fields depend on
> VIRTIO_NET_F_HASH_REPORT being negotiated. The device and the driver
> agree on whether HASH_REPORT is negotiated, and therefore should also
> agree on the size of virtio_net_hdr?
>=20
Do you imply that device operation description is enough to not add normati=
ve?
If so, for this case and possibly new things if we write as device operatio=
n, would it be enough?

> Or is the problem that we did not state explicitly that the last three fi=
elds of
> virtio_net_hdr do not exist without HASH_REPORT (and are not merely
> invalid)? If yes, we should spell this out, instead of adding normative
> statements about what the size of virtio_net_hdr should be considered to =
be.
This suggested normative is added in this patch.

> If virtio_net_hdr has a fixed size, we shouldn't need the second patch, e=
ither.
The fact that HASH_REPORT is only for the rx, if we have to go back in time=
, there is no need for the tx to force also to follow the rx virtio_net_hdr=
.
There is no explicit normative indicating the virtio_net_hdr for the TX is =
forced by the RX even though it has no relation to hash report.

If you say device operation is enough, than I am sort of lost of when norma=
tive is needed, and when device operation is enough.

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

