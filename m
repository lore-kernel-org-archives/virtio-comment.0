Return-Path: <virtio-comment-return-6970-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C85BFC001DF
	for <virtio-comment@archiver.kernel.org>; Wed,  2 Aug 2023 11:56:22 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 29D133E306
	for <virtio-comment@archiver.kernel.org>; Wed,  2 Aug 2023 11:56:22 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 06A1E986699
	for <virtio-comment@archiver.kernel.org>; Wed,  2 Aug 2023 11:56:22 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id E8AB798662A; Wed,  2 Aug 2023 11:56:21 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D200C986636;
	Wed,  2 Aug 2023 11:56:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NSBjDv1/9fyTgvGpx6fmN9ob7BSKvJHgX1ngggRtFOChqDZkJsx5vENDyU8N/K64HY2IqNzuWNrNXpS0WhA7gD7uMb41ueaS0uxSjzgDJMmZQLTe6kOLA9tp9NnZ2d5c8VQMrpHGH8fLoShiinh3+YKTox/12A7OGqo9ARgABWS5JP8MrAI6vA9XhAYF0Avqp32o9ODz8ByMDXvHFQNe4SDrYy0YlBeM6mFfm7X6qWYPyhspl6EB9eTjj1j2GEgiU/uVeqRuMI4pz0JhRVi4iO3kCkmjQK4+m+PB57Oyw5aiioZnazBQYEuD2C2BJyu0JbHTOIFgjHeFn6HrxqQKsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4QtXo5wgv1bXeUqn0W+0zi2DJK9vEHJKm6hWMfVoMSE=;
 b=KapkblOsHheONlC29hX7edB6ME7epOyK/2bgjdnw5BoxgvCacekuLURbyK9jhL30ELrRFb3XzkQG68FOVztE7yaJehn3iNvCL0OIp4t0CslQ2BwditSQ2I83JA03gNOlGkjz/B+ScGBrPqIGXS7Nv3NGlbT6pT/IOwyvtIL/s5Zx81CGlC6gi5eRjIv4tIGLFW1lWLDczCdC79+1o9R8PRcMWg74nR8Y+v9SVOGjgMO8A3Piy7ZuJ6anY1SYndi2qb3u6C9RdUkVkQeougABg64h99PtYYO0sI1UNFiOYfQTJprFkOwUh/4MmZhlEC0qrrOToTFQJCGHJCBgTGFRyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: Jason Wang <jasowang@redhat.com>, "virtio@lists.oasis-open.org"
	<virtio@lists.oasis-open.org>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, Shahaf Shuler <shahafs@nvidia.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, "hengqi@linux.alibaba.com"
	<hengqi@linux.alibaba.com>
Thread-Topic: [virtio-comment] Re: [virtio] RE: [virtio-comment] proposal: use
 admin command (and aq) of the device to query config space
Thread-Index:
 AdnERrUyzvIBkM4LRwukraLndwiuSgA2AnqAAABG9JAAARbHAAAALBowAAPNDQAAAAhQYAAAbk0AAAAHLlAAAF/vAAAADEzA
Date: Wed, 2 Aug 2023 11:56:11 +0000
Message-ID:
 <DM8PR12MB5480CBCB70621CD6BEF5222FDC0BA@DM8PR12MB5480.namprd12.prod.outlook.com>
References:
 <PH0PR12MB54818D33A150A01DACF3BF74DC0AA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsDo8dKSwD=Uovo=ekussqQmA8kf90jzuRoDBZs2B-GTw@mail.gmail.com>
 <PH0PR12MB548134EA03AE48ACD6F422CADC0BA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEvHjAkbQ1D_PNhObpZ00g3P=E7Bzj3RvBPpst6cCFTWcQ@mail.gmail.com>
 <PH0PR12MB5481ABF25620784987149809DC0BA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230802071603-mutt-send-email-mst@kernel.org>
 <DM8PR12MB548071770075800FD9020D27DC0BA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <20230802073700-mutt-send-email-mst@kernel.org>
 <DM8PR12MB54804B56DDF38E56DF7FF4F4DC0BA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <20230802074630-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230802074630-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR12MB5480:EE_|PH0PR12MB5418:EE_
x-ms-office365-filtering-correlation-id: 20264330-e4cd-4c1d-efeb-08db934f7717
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 yHOw6eVTDl+kAO+LNVb4O6FFe8qtz1yEGff/Q91mUWd2Ia+sqeBilEV0tCZmgFmaKA+RzG07Hil86nuxuqxQAoVwLngGLGsckEN/t8CppU3Q76HLnIqoNaKRT2tan59sKUYXlLp9CH2ZP2q6SKcCdlkQiPw+iCJ6pV7FocVy80u+TgU9RDGqbEJE/wRFXR0dq8Vz/9ULwCeuA1yasJdPOKq6hz8sdHClm4AE4j5HRVUlO7/7CVr8/uXrUACsnpNaZYXA/r2Z/OsRFeP/269Q7yR2xAhdnIykwYsNqIFs4wuNRUYQZpvV5nSRMw9SzbgqHi7OtXJZ9ZuWyROWFIoz/xuKsQQ6aHZYIcpAgA7pC+eUkoa44aglnyMgCjXil5Vif0aZvKHCaMoThLz6KFrNUYfe9nXh+RETU/gEl4iF/S5ebvNES2sdjS0otYNUjgsNypT4sTgZdXKG2LWnBYgxpzfUWtmuTVa/2Vw+Mgd+IWFnPNQTWAaETg7xNBYbw1joqwEorqn+ZW0kf+h38cgUWgnoNylQyPNQ+OdOsQwitp5VoI3uScsXiFYL+UuxcR34o50ySgnuoqcDGlH2GD8XrYb3W+Mried54KDqZqt3pUunfkiC+N+L76we/GUkbV+U
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR12MB5480.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(136003)(366004)(376002)(39860400002)(451199021)(8676002)(8936002)(5660300002)(52536014)(41300700001)(2906002)(38070700005)(83380400001)(186003)(55016003)(122000001)(478600001)(54906003)(38100700002)(316002)(86362001)(6506007)(33656002)(7696005)(64756008)(71200400001)(66946007)(76116006)(66556008)(66446008)(66476007)(6916009)(4326008)(9686003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?yVx5avhIR2GNaFKWBaSYaeZFnWfe2lHJKBZNW/14G9KTL9rkoIuQyVoRLy1r?=
 =?us-ascii?Q?CipHpPIPp0U6vkMjCHu2gv2w+uzG56Aaz1urcsdizFsKDs/7IaerZ2X8sML4?=
 =?us-ascii?Q?uyPLxOEAqxTy+ZQUzpzgP+kJNILuUvfg7jw3YKOGUqOXSLDJej5Irt48LzI8?=
 =?us-ascii?Q?lMFXikmkgRmMKJdLrKcSiM/8yi73+A4qkO7iucLaCP6YQCKBYSDMMDSyok2i?=
 =?us-ascii?Q?mR/p9bmTRy9SBE7Fp9ha0hKeTUm101pU1g2j0RfTbIWRfS9YIzQ5kLreZps1?=
 =?us-ascii?Q?OwnN17OBAYfLw6oBCUFabZbSpfAyDNovQTtghDixSlOOYi+Ekzzzhx0AVvuk?=
 =?us-ascii?Q?fCwFdNlX6Nsd4to9MC3kZsRKCYxxBPzuOhJ3HxGZTP9cPxJ80W2dbvg7bPK1?=
 =?us-ascii?Q?8hgXUadBFiYlVQWKdKdSfskOfdgT1C75C4t45qe9o1bv3jb8WeSHiThst4AU?=
 =?us-ascii?Q?noewWT0SdF/M3g2YoEb4jU9FDxcHi8DovzkL6TJm/bL30tXd/kwVDei/x7DF?=
 =?us-ascii?Q?xO1P9edRqmB9u30u6NQILQPRjdvzD75vevFtLnpHMIvytdTd/d9Jy9Pnvw+E?=
 =?us-ascii?Q?ZI8/3h/27MJyMEIUvgmYy1Yex/Duxl3arCZroJg6qO6xW2SUGSq14It20ZSt?=
 =?us-ascii?Q?lPPTayIxfr4h7dpb0nhzyIhIuNDI/RrmlIQpdau3Jb6dcunb5RBJCSK4cfFV?=
 =?us-ascii?Q?4GjYdQtG5Jd13TlcknC5D2x4naijsQo4SbedtEFRE/2LKXcqsrINUQYfCimi?=
 =?us-ascii?Q?v/B7K0MN+PlygJAvQJqIgLxuTMgu8TtKBCluaHyQ8UezAf2Y0wNZeRYyt/Oi?=
 =?us-ascii?Q?MZixVmviHGlp9JQzjv89JBtrHMhwMqH03NWF9ewYMRinxamYCB4BsRN0nc9h?=
 =?us-ascii?Q?90hIHzd9Uqhhsh6Sq7lJeu5mJoJgOMm+76vmZQb9jnNZwn0eDa9dDRaC1gol?=
 =?us-ascii?Q?CrPXTRie/MHqgmhJ7pRrBIygdR2ZJrbr4uYDEZuz2mPiuGeKwP1jfGX6vQ5J?=
 =?us-ascii?Q?XjrK8xxFlPpWmbOTT/7c/oUuYg5j7AeftiXzNiK+HwPCtiWLd0nUeexZ3WLW?=
 =?us-ascii?Q?CdBs9+nsiGal3U+ksPLnfzzq3pLJrdCZbvB7035ebO5Sm4HTLIQGV4cejI7I?=
 =?us-ascii?Q?BtqbKVnvjhfTIyL0qwHYtoKd0HGScw/sj5TjN11hyo9jor8anet9vw2G50GP?=
 =?us-ascii?Q?2A4vH+DEOoqljIBI7fwM/udW4irAMrcsjVOA/0Ouie4wa3ptoEpf3fgHy9QR?=
 =?us-ascii?Q?Sg5xECe+/7dqaCB9sSCw8k0Os6ONJhMrsWeak+xweB7gJdhAAFnLwVm3yIdj?=
 =?us-ascii?Q?jh39BZCTN3LGl0COu725mfPxoLu4zJYO1X3km14YQeVBMkKIKfJ/hDpBVuOs?=
 =?us-ascii?Q?isoKlujONCUcSsFEoGKR9p9O1/2VtJJTXMn6gMx9lzK5uHoIeCVsMh3Ccyy2?=
 =?us-ascii?Q?yb5I8svfK27QRMSYFjWWPV1ouRfaNXOS86o2aFSWIrEdgICguMXIr0fdinDl?=
 =?us-ascii?Q?CkQljrqpY9jmdyzvM9B884Jtsw4yFpAK4IxS+lcHsdKd72kOdrXz1Fznw0xe?=
 =?us-ascii?Q?r9FnTa7c6aksoAiuNom1aKGsf8TOdPp6wMV1W29CXpaCSFm8kxTeU3UYT7C9?=
 =?us-ascii?Q?EnqyFjBp75zK0NxxqkA5avBcfAwnPrsPZsDGF+B5xxmo?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5480.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20264330-e4cd-4c1d-efeb-08db934f7717
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2023 11:56:11.2282
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6a6g5qSpcc/gtq5f9WYo56CNegxu+TkdrItEpTsthVKW+Ly2SlpMwfTzNgEbXZwYVQwvd4/+0X8PB/1OlPopUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5418
Subject: RE: [virtio-comment] Re: [virtio] RE: [virtio-comment] proposal: use
 admin command (and aq) of the device to query config space


> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Wednesday, August 2, 2023 5:21 PM

>=20
> There's one thing to say about putting everything in one place, and that =
is that
> one can then find everything in one place.

When a device grows incrementally and each functionality also,=20
grouping it per functionality gives better pace to keep things self-contain=
ed.

Think how messy a set command would be if all 3 functionality in one set co=
mmand.

> For example, at the moment we actually do have a problem with cvq, and th=
e
> problem is that it sets internal device state that is not observable (unl=
ike original
> pre-1.0 config space which was writeable).
>=20
Which part is not observable?

>=20
> By the way there's a pci express ECN for relaxed ordering or something li=
ke this.
> I am yet to look at it, I wonder whether it can be used to avoid the issu=
es we
> have with MMIO in a way that is easier to use than DMA.

Waiting to deliver new features on new PCI standard will drastically slow d=
own virtio.
I don't think its good idea, but I would like to know about such ECN, if th=
ere is one.

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

