Return-Path: <virtio-comment-return-9067-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE8B1C48291
	for <virtio-comment@archiver.kernel.org>; Mon,  5 Feb 2024 11:16:51 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 10FF068470
	for <virtio-comment@archiver.kernel.org>; Mon,  5 Feb 2024 11:16:51 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E0A109865C1
	for <virtio-comment@archiver.kernel.org>; Mon,  5 Feb 2024 11:16:50 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id BCF0098640D; Mon,  5 Feb 2024 11:16:50 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id AD8B098640E
	for <virtio-comment@lists.oasis-open.org>; Mon,  5 Feb 2024 11:16:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FIpal/mTkjruTYeHwBO2zVo2CcJkCy7kG5GKwr0WQ6XyzLGo+jD5/3Ld472nZbemSybZuv4mgb7qA2DtgogA5y5I/hxG15istdEwugY3kWo8psopOrdNOXGP6alK7poPB+WX1ZOY55FIQkr2FgwJPB0OmozGVoUZM3UvjSLPEDbygQ6xbtHbIgtR/Sa2LTDC4W6n1X4Hi/JgYZ5l/doNXNMGkFRYeArC0Zsd7jYx9+Ut0tuY14jy0tXCdkbI/zAWeVC54he2IVWC/NK9Y6feox22us7xhogftC5466icA1XE5pOBRoptdOKNb1rvdHB0JmlKOISnqBmrdk8s3qIdGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mXIK6pLS0lW3z1LwDB4tDokPXeFX9lTeVT1CzR5BAfU=;
 b=VGQ+qsSFvUJzRqtmEONyOfNNeuhz7mbEMEwKXzdDMhoNbCC4GsWqF/kSDchIACC/Y1OMS/ZT5pwdqH4b2VBvaZw+FyUW5GgQy7Qs6oTPFULLFN/dbfQyzJ0vsDZ19nNh5UDrosshYXqbDbdoJA09XOpz5O1QE2JTPauI9oviC/oKeYn2aBperQ9TDqvzloQkX2SVJBT/93N9OfvNQAN7YPUVvgO1D1LeVl6GSzhTbzNsEHq4uO9ytnk7sBVtdUG2oulFAcqUF+yrCOvCwMgg//r9Zy9Mbp2DGGQ6Kuj2qZrW+7gXInnl3qxtYJTicvWE8aRCmVdlLcfuf2J+gGCn7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>
CC: "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, Shahaf Shuler <shahafs@nvidia.com>,
	"xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>,
	"yuri.benditovich@daynix.com" <yuri.benditovich@daynix.com>
Thread-Topic: [PATCH v2 1/2] virtio-net: Fix receive buffer size calculation
 text
Thread-Index:
 AQHaR5W52J2qfmVC+UWFja2twvUrIrDbFOyAgAC4IFCAAHrbgIAABXdAgAAVRoCAAAmUcIAABKkAgASk8uCAFAFcUIAGoi6w
Date: Mon, 5 Feb 2024 11:16:45 +0000
Message-ID:
 <PH0PR12MB5481D9CC1992B92E86E5C027DC472@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20240115093141.3539316-1-parav@nvidia.com>
 <20240115093141.3539316-2-parav@nvidia.com> <87r0iimtrg.fsf@redhat.com>
 <PH0PR12MB548114CE959557968F5124D9DC732@PH0PR12MB5481.namprd12.prod.outlook.com>
 <87o7dlmtgo.fsf@redhat.com>
 <PH0PR12MB54815BB31B88DB812507A8A4DC732@PH0PR12MB5481.namprd12.prod.outlook.com>
 <87le8pmp16.fsf@redhat.com>
 <PH0PR12MB5481E369486C3B9DA686CF74DC732@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20240116082825-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481F74BF29A751E6BC249D4DC702@PH0PR12MB5481.namprd12.prod.outlook.com>
 <PH0PR12MB5481434F066B8BE85FB0B20EDC432@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To:
 <PH0PR12MB5481434F066B8BE85FB0B20EDC432@PH0PR12MB5481.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|IA1PR12MB8080:EE_
x-ms-office365-filtering-correlation-id: 7f38e693-876b-4e89-cba3-08dc263bf045
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 fHf0l9t0TJ8FPEe1MOWnnUU8f0cF5q/9+1c9IO24RsHM+Nq8hiPbNlbgusDUqUk2NRoyuJszmIMia/BlF9G7NizD0MaJUgCI9dPln/z6PQ+L/xMVlk1fszqvJSMiP7S/i18WaSsgvNQf3DoMUB/ynrW7vd4VSDx978VMKwphyNV4soM+asEAYAEmgjDYSeGTZVSqlVie4imnTvt2p2mYtK3TTabyl7NUZ8dNA2QkdCN6GPJ4f21gDChumf6pP3GJKXATRUzrpD4oxnNSOvxQjy4Yovzc6E+kV2QnUrF97SWDbNK+S23a92wt9Mla5nMD66sPAmFV6MtIceRPHCj7Ip4yAdP8O5eGG4m14XYX7coxPI/N9unhBhRLAq+tOHgthQpRxuTfFSKYzIXywTjV6EPoyY/8JoWRv6x19byGjvj1Y0cAM5ecx11qTmshiCiBmnJAL26yeBL3HgE7SFXqYD6XJTNVDvHjJ84TApxMzz0Z9Q3+xln4X9Z8RX0cwJigjEHr68MOhu5T5G+ua7WS3ZZgFAwIw777ZTvR+CtL5U8iJUOV/DKip51QYxJ6f4WFriFflC5wbIbs5mC6Y8RFQqKcMRQUWFhbAeSfYcG4zKsQbOd7SCIwg54DLsjDlP8wQA/P4uja9oodF6ySeSIa/1JUgcOI+I3v7GthIxHML6C/HeZX/mRimye+q/u2r+oH4r+vsqhD01MamK4EelMpxw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(136003)(39860400002)(396003)(366004)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(41300700001)(966005)(4326008)(8936002)(8676002)(52536014)(66476007)(316002)(64756008)(54906003)(110136005)(66946007)(76116006)(66556008)(66446008)(2906002)(5660300002)(38070700009)(86362001)(122000001)(38100700002)(71200400001)(53546011)(9686003)(45080400002)(478600001)(7696005)(6506007)(83380400001)(33656002)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?/ylQgYbHESxXcDXJoaodeHi/5Mmu9qJasl5yACFs4/UgHgNuXVwWIHsc9lrT?=
 =?us-ascii?Q?3khBe8EKNLKcnK8rRXL5U3Dwhlma4aB0RBrneVqW57pQEiaeJJXQMnNvZanu?=
 =?us-ascii?Q?UReiFMXghRPAvFw+fCza469qQycmTh75e/p2Qwdu8BuyANG87YBeGqGrI0jF?=
 =?us-ascii?Q?q7XEYTDXACceh6kuAhAcrSl+z8K0TEaBOFinpSYCKhC/k1yfefSkKBEOLnzz?=
 =?us-ascii?Q?PtVjAGXyz6a4UHNl/Y110EU5+BMUTOulprW33uEhhwDS9rf9JimdrJCTn28O?=
 =?us-ascii?Q?6ksa2FfGzB0Vz/8QdvYtFRZMQCj7/q7wsQAUmoerikMC8Lh/gyB0Q54u2zAb?=
 =?us-ascii?Q?TXpzoggN7V+pmoFmyfoj4+0ak4Jxc45HU1ASrffwFQ39DYAT/Rlyqz4Soqqf?=
 =?us-ascii?Q?p5lzPRYyOigiVJvtsYaXAyXcmewNUoXuo+F+te+lHbmeHQdJXFg2/5pnvKPw?=
 =?us-ascii?Q?7pKjuWYHxAfCExiwBvE9OsRNWDWVBy08dokxW72QPgnsCz+j+OKtoqqFM4wk?=
 =?us-ascii?Q?8gSpos9Wqlb+HmxDIMUtVJmNtcrDHik6tEn7Q56T1XB66bRUQjlBua96oCAB?=
 =?us-ascii?Q?RZL7JMt5VQWX5HvKTabWLvA86xFXHZ/R056KB6rYjalDVSrbljKDpvPp0UPt?=
 =?us-ascii?Q?VG4uxc4Cy8XK+k+AJUaIYWXHC+HkweX7LKc9ZZXVzRF65gXaZrrgvw2mP7SU?=
 =?us-ascii?Q?VA6/trUTONO4UkZDqphTkg48VrDexfZhzoc7pXr39t2YGd1iIqJScj6ug4tv?=
 =?us-ascii?Q?rzI7tygwRS/XWizaK5A9yWLMa7+dDROWhzfQGab3LTF0ozcPQ0Rf6eCch8y9?=
 =?us-ascii?Q?IcDxZYm1mIAuV3NHUGya8J1ghXX24iKGg8UhfaHcqzmy0F62ZBVS7TPDRF4w?=
 =?us-ascii?Q?qLJr9WKT9D89wDo6MH2OHwyep5q4SLFQwBGoi3YDhg+8fuwxS4oXigT/Te9w?=
 =?us-ascii?Q?aQzvaLYCfr+IT+X9Ju+ZTxkKQUbdDrt59+Ptp3AoWZomkZQDuwBEi3JffE+t?=
 =?us-ascii?Q?AfVmxyndME4VhabmeUyEOy0Dkx8Ou4PxHrmi+fuIbn2yT0oil5Rn3ETELoBh?=
 =?us-ascii?Q?lKOv316w2nzzM+tp3YaEp5LZP2BkZ67IkLu6caGxyK2jIpGLHxpxvSJQs0oW?=
 =?us-ascii?Q?Na38Efio8fRmjAlEDvH4c8ZZZC2TMVMz/VTHZcD3xSBmhgcpJS1LHLEIDdg2?=
 =?us-ascii?Q?q0sM5LYuGM/Bj4LwtU8LZbjrzsK+EdomgYxtfuNbao4+GiZ6Yi+nMYvezQ3o?=
 =?us-ascii?Q?ZHwsKgaBriiedqxvVL/t3nUf19O7vgu2fKtrKPaupxxH5NX5rKUXf8M70jEb?=
 =?us-ascii?Q?7Cjed7aV6kEauxe6l0vQb0f0e2H0qi3CM5TYG6KUXs4ZmtwC1VD5b6StRyc/?=
 =?us-ascii?Q?Ne9TtPdWYZzl3Stq4OadWBhlL9fc3Sn9CVwq8ftNReKbNlhM1+PAafS5G5Ao?=
 =?us-ascii?Q?8BA6gClJXEXplA/a26BiRRXRQ0NgM8vj48EgkyxwlbvRkUhRK6Z6CmpESmaR?=
 =?us-ascii?Q?d6Ay/fww5eOegHElxCDNGoh2I+iSW+ph414QGWttwCuhN2SnSdew8rJCvlua?=
 =?us-ascii?Q?CHpFg5TLSEcLJ9noK+c7+b6c3wGfkAm2YCN6ak6WS783l66nbmW+Mb8XJ4+M?=
 =?us-ascii?Q?AuIUJ6x7qqw4OxGhju1xmzw=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f38e693-876b-4e89-cba3-08dc263bf045
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2024 11:16:45.5329
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OTy8PzaHAwkV5jlyERCiT1IpvuaGNCVIhJMrRve4r967zXi3mhzvtpo21QDcHhJbuMPe2n2c8FRDwUz30+4c2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8080
Subject: [virtio-comment] RE: [PATCH v2 1/2] virtio-net: Fix receive buffer size calculation
 text

Hi Cornelia,

> From: Parav Pandit <parav@nvidia.com>
> Sent: Thursday, February 1, 2024 11:27 AM
>=20
> Hi Cornelia,
>=20
> > From: virtio-comment@lists.oasis-open.org <virtio-comment@lists.oasis-
> > open.org> On Behalf Of Parav Pandit
> > Sent: Friday, January 19, 2024 5:56 PM
> >
> > Hi Cornelia,
> >
> > > From: Michael S. Tsirkin <mst@redhat.com>
> > > Sent: Tuesday, January 16, 2024 6:59 PM
> > >
> > > On Tue, Jan 16, 2024 at 01:18:59PM +0000, Parav Pandit wrote:
> > > >
> > > > > From: Cornelia Huck <cohuck@redhat.com>
> > > > > Sent: Tuesday, January 16, 2024 6:08 PM
> > > > > To: Parav Pandit <parav@nvidia.com>;
> > > > > virtio-comment@lists.oasis-open.org;
> > > > > mst@redhat.com
> > > > > Cc: Shahaf Shuler <shahafs@nvidia.com>;
> > > > > xuanzhuo@linux.alibaba.com; yuri.benditovich@daynix.com
> > > > > Subject: RE: [PATCH v2 1/2] virtio-net: Fix receive buffer size
> > > > > calculation text
> > > > >
> > > > > On Tue, Jan 16 2024, Parav Pandit <parav@nvidia.com> wrote:
> > > > >
> > > > > >> From: Cornelia Huck <cohuck@redhat.com>
> > > > > >> Sent: Tuesday, January 16, 2024 4:33 PM
> > > > > >> To: Parav Pandit <parav@nvidia.com>;
> > > > > >> virtio-comment@lists.oasis-open.org;
> > > > > >> mst@redhat.com
> > > > > >> Cc: Shahaf Shuler <shahafs@nvidia.com>;
> > > > > >> xuanzhuo@linux.alibaba.com; yuri.benditovich@daynix.com
> > > > > >> Subject: RE: [PATCH v2 1/2] virtio-net: Fix receive buffer
> > > > > >> size calculation text
> > > > > >>
> > > > > >> On Tue, Jan 16 2024, Parav Pandit <parav@nvidia.com> wrote:
> > > > > >>
> > > > > >> >> From: Cornelia Huck <cohuck@redhat.com>
> > > > > >> >> Sent: Monday, January 15, 2024 10:14 PM
> > > > > >> >
> > > > > >> >> On Mon, Jan 15 2024, Parav Pandit <parav@nvidia.com> wrote:
> > > > > >> >> > +The driver MUST consider size of field \field{struct
> > > > > >> >> > +virtio_net_hdr}
> > > > > >> >> > +20 bytes if VIRTIO_NET_F_HASH_REPORT is negotiated, and
> > > > > >> >> > +12 bytes if
> > > > > >> >> not.
> > > > > >> >> > +
> > > > > >> >>
> > > > > >> >> Requiring the driver to consider the size of something to
> > > > > >> >> be its actual size seems a bit odd :) I don't think we
> > > > > >> >> need this, as the length can be derived from looking at
> > > > > >> >> the definitions, and is already spelled out explicitly, if
> > > > > >> >> you consider my suggestion
> > > above.
> > > > > >> > We need this because tx side also needs to refer to the
> > > > > >> > virtio_net_hdr in
> > > > > >> patch 2 to be same as that of the rx side.
> > > > > >> > And hence, this normative sets base line for tx side too.
> > > > > >> > Relying on rest of the
> > > > > >> receive packet normative is not enough.
> > > > > >>
> > > > > >> Hm, why? If struct virtio_net_hdr is well-defined, its size
> > > > > >> is well-defined as well, and we do not need to state it explic=
tly?
> > > > > > Because,
> > > > > > the size of virtio_net_hdr is derived from the rx side features=
.
> > > > > > Today there is no normative line that says that even though
> > > > > > you are using A,
> > > > > B, C Rx features, due to which your tx side virtio_net_hdr also c=
hanges.
> > > > > > The 2nd patch in this series adds this explicit normative as
> > > > > > explained in the
> > > > > cover letter.
> > > > >
> > > > > Let's step back a bit.
> > > > >
> > > > > struct virtio_net_hdr is defined at the beginning of the "Device
> > Operation"
> > > > > section; the definition clearly says that the last three fields
> > > > > depend on VIRTIO_NET_F_HASH_REPORT being negotiated. The device
> > > and
> > > > > the driver agree on whether HASH_REPORT is negotiated, and
> > > > > therefore should also agree on the size of virtio_net_hdr?
> > > > >
> > > > Do you imply that device operation description is enough to not
> > > > add
> > > normative?
> > > > If so, for this case and possibly new things if we write as device
> > > > operation,
> > > would it be enough?
> > > >
> > > > > Or is the problem that we did not state explicitly that the last
> > > > > three fields of virtio_net_hdr do not exist without HASH_REPORT
> > > > > (and are not merely invalid)? If yes, we should spell this out,
> > > > > instead of adding normative statements about what the size of
> > > > > virtio_net_hdr
> > > should be considered to be.
> > > > This suggested normative is added in this patch.
> > > >
> > > > > If virtio_net_hdr has a fixed size, we shouldn't need the second
> > > > > patch,
> > > either.
> > > > The fact that HASH_REPORT is only for the rx, if we have to go
> > > > back in time,
> > > there is no need for the tx to force also to follow the rx virtio_net=
_hdr.
> > > > There is no explicit normative indicating the virtio_net_hdr for
> > > > the TX is
> > > forced by the RX even though it has no relation to hash report.
> > > >
> > > > If you say device operation is enough, than I am sort of lost of
> > > > when
> > > normative is needed, and when device operation is enough.
> > >
> > >
> > > Generally we start adding normatives when we see that something is
> > unclear.
> > > But I think generally I agree with Parav, if someone has the time to
> > > write the normative, it's all good.
> >
> > Are you ok with the v3?
> > I kept the clarification for tx and addressed rest of your and Xuan's
> > comments in it.
> > https://lists.oasis-open.org/archives/virtio-comment/202401/msg00070.h
> > tml
> >
>=20
> Its been nearly two weeks now.
> I assume v3 is ok.
> Can you please create the voting ballot?
> I updated the github issue to refer to the v3 as well.
> https://github.com/oasis-tcs/virtio-spec/issues/183
> https://lists.oasis-open.org/archives/virtio-
> comment/202401/msg00070.html

This thread [2] is waiting your response from 19th January 2023.
Can you please either respond or open v3 [1] for vote?

[1] https://lists.oasis-open.org/archives/virtio-comment/202401/msg00070.ht=
ml
[2] https://lore.kernel.org/virtio-comment/PH0PR12MB5481F74BF29A751E6BC249D=
4DC702@PH0PR12MB5481.namprd12.prod.outlook.com/


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

