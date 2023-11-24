Return-Path: <virtio-comment-return-8602-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94B5BC61D97
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 06:27:50 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 0675F2CAD8
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 06:27:50 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E205F9868B1
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 06:27:49 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id D5D889862D9; Fri, 24 Nov 2023 06:27:49 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C86BF9868A5
	for <virtio-comment@lists.oasis-open.org>; Fri, 24 Nov 2023 06:27:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZXRGzV7Z8VeAdeGb+Y09aUK1x4NCvmu7xx3OKqvd9iG4JVh3637j/ZiwWtsR8nwuaVbNyQUnq1vyncuyFjgkqM6xH5XQHuRoSo90TASvpT6hA2d8M09xjNxjZqhj7JrH4w37Lua9xTt/3t8jtR1eGcnes31A+yNOL0bgbIYoLTZyUDZsmGKQEoiYSpbwNd/rnMN7/FuBSrx3j4xz2sjJzWwQtiBLLqFw7xJcNWz44q7XfN0E6Xf3uthHb2RHKMckgL2xTkl2tlpRlCfRUmQz3SEoONHVFirBLQSCxQbYNjpE3Zl21AIYghfsgAm3vz/o6YsovZihxNKITilwkTZ/gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mo+tUg3TBGtLEy6GV/NOrYPDvgGrhkboyqqbKy6ry+w=;
 b=TjokntzzSi3H80wddIL0yTlvNhFEaYAwxeW7Nx98CdUP4VOgY3so5hQnf8G/r7goRYezYRfyU6VrkeRwosAbla0QKLzcf7qfUFnBPg7kdNDsrOd+Up56MEwWWfoFVAJKs4vktXHFbAfJc2KTxJT//esyzsgyABsta6cZ3j5/hvbcFcd1xdgPt4uK3DKf218Huz0iVTDZYdxHFWY/U7lpaQeLoHIrLbuawH/Ta8efJukJVXMoPEF0+hq+tbz+MPmBH+apMfK80yZvbfUOHz8eeP3urAV6mABiV/5c8gd6iC2RlWqoracE8NOl//ThW9Wt56Cem6HlZ0s03eKUK+H1gg==
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
 AQHaE9L2DjdkCoB6dUewtbJsrpd4HbCGcWKAgAAAe3CAAA00AIACb1eAgAAZSACAAAMmQIAABmCAgAABCuA=
Date: Fri, 24 Nov 2023 06:27:46 +0000
Message-ID:
 <PH0PR12MB54817AC1DD6C5386A138D5BADCB8A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231110123853.2093309-1-parav@nvidia.com>
 <20231110123853.2093309-3-parav@nvidia.com>
 <20231122084105-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481FF2A00B58060D9D69812DCBAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231122094431-mutt-send-email-mst@kernel.org>
 <CACGkMEuEFsByRwTf_hAAZ+7-UuyYz-1wCP4vTpMAW6DbHQzVag@mail.gmail.com>
 <20231124003129-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481E538B7BBFB907CC6BBE1DCB8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231124005921-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231124005921-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|PH7PR12MB9255:EE_
x-ms-office365-filtering-correlation-id: 2c428611-3d54-4e55-714f-08dbecb67932
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 WJJJKdOMwaeudWxN3pz4Zg7y7PnAU5A/GvA78ZcVBbxF+Al0Nmi/ynVjXXlT5pZreNElbfAJN3BiWJruzOoMESt//4IaZIugjFLyb4LACFE1anfzch9IMGYnTtWRazvnmEUR9V6A6OlSPVtcGO4JOqI3Eo0xu5qn63BCYwNEDlCQMfyzaukYEnyS1TyYDIHibNTz89zIKnK9+fZHY7bodYTMPmuzSDW8oDntJ1YjeEUOXNT9IPPkdBF2eR7IUjVfgT2WmKhmy95XdxxMwwL9eLge+zKk3xQIxbcOLuD+BnDjqnXUPaLJrMPYzyW0MYxD0I7XMBLZJ7+VE4sp8IkORmFdmqo43SxUdSferPRrfI05cVo/HaX5+waK5SIftBlielnjfQhGD+HtFqJlhjM8JdlRCkX8W76LBfjoEqEyPYpOshMoDZ6W2mFwggMUH54yS+9o83EnXgxarNsf8PQvmknY0GJBDsOjTWlMSB0oM7EzINWJS5Z4jP0NUQMLpymkXF2lRRTvtTKkXeUVwrtdvoWolrSGy+b0x4Q06g7N61tal/i/3NSBX9KgpXRhabrZrAdOry8rTVVbvmPHPYQc1a1JnZ6GMWB5ClpoGp2STFxbpTLUGYT3Jb/gnef2S6I8d76yAlZ/zFQwO+u/zyAmGEnEb7RiO4P8d+KIHwwHafZMce72cbxhDXBiZr9Xe52k
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(346002)(376002)(136003)(396003)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(38070700009)(55016003)(5930299018)(66946007)(66476007)(66446008)(66556008)(54906003)(76116006)(64756008)(38100700002)(122000001)(33656002)(86362001)(6506007)(26005)(7696005)(83380400001)(71200400001)(9686003)(19627235002)(2906002)(316002)(6916009)(478600001)(966005)(8936002)(52536014)(5660300002)(4326008)(41300700001)(8676002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?iSMgObkx4T8gxFVIiSptBUA8LiS1EMGMeKZub59Y7mbBJgbsz5WhIIWgRJEp?=
 =?us-ascii?Q?YafYJWju+KeMSJkoqrIFRiU/ezkGHLpmDRmbHWeN9dAOmTT0IEiyvj93fICV?=
 =?us-ascii?Q?XHPdZq+W10FqBgh8W2nQTJ8SNEc0abGAhSmmGhWtlflt2P4Rmie+9gJRHiF9?=
 =?us-ascii?Q?IIDGnwGX2GlPQQfvUTQH5t+TeSFOpmjOw8/gtIeIGWjl+cu8Y5EGeEtW1f1S?=
 =?us-ascii?Q?fdTdNHDNki5rHIwvaqkOAfs+0otvW1SNzogq3dxEpQE5RgOk7F0Mbi1TIDGh?=
 =?us-ascii?Q?8pf0SdSzhOHhf0LmCD+uAo3VlEzSO53DukRUZrudhBy06+xlvVFfRDdTxPb7?=
 =?us-ascii?Q?VeN41mxTsbWu1wWYLGk7TNI+SHZ+/QsjO7lKXJtOmT4/dyhjn849iTFclMSv?=
 =?us-ascii?Q?b7OwfWzi7/7CoASCi1HivkCkL7uxYMMuAHfo44oGvov4nT1S9IGFd7xv5PVI?=
 =?us-ascii?Q?+D2N6mctYeA/KUlKZZfEdkVlJ25HjizY2OZPTsHBFr/HMIoSw/XnLUrV9eZM?=
 =?us-ascii?Q?N9H3RZCOmFWxaFcTBANS7Q2/2KdNTF+KvyMj1j8DrSCRUNGkIIQRmporNOBZ?=
 =?us-ascii?Q?YviKGjxYHsVrnpC0S0p2VdwtnTaZYhfQXh1XkEJ0vUd9LvG3y/FMlDLhQgw0?=
 =?us-ascii?Q?z6x0p4AA7F1snCYLIac+lLls4W5ESEDO0FTEV+20h5qp3CWKJ8i60nbZ24kh?=
 =?us-ascii?Q?uoqrVaL83KPkhcNDgT+lDU5y8YIi/V2Vv2WTouBIPTtphGoF5J/V9wAanOYt?=
 =?us-ascii?Q?ooGHquzNIi4kdWOF+z9DGveQmAFWBKAhWMcAlFENJvHuRqmDkH3NBKfoLFey?=
 =?us-ascii?Q?fSHUdDTtExFAGQ7CGZwQahPNsYlpKNNGhLOxAmyrxYAOiHp2aPQ3lXwHkzmb?=
 =?us-ascii?Q?pCFlf3BBzo1lkkiYh3A/uxRoq1oJW0Iw5VidTJn9O1fKajpDk5dD6BfwobPB?=
 =?us-ascii?Q?8B0cCREZXTlFxWl0dXCYYmFZpjidHKMzrO9a36PHqkonRK9j1dqy97RDDhqB?=
 =?us-ascii?Q?JxqGG61e65sZauCLSPau8823LC2gxbCsDDoc2FsP72GVrhq4dGqLDjf0lgDN?=
 =?us-ascii?Q?dfz++B/E32rDFgg1+5HhaRYHU0R8k2hs5ifc9j1e/ct/N+ey9z5uuhM9tRkf?=
 =?us-ascii?Q?LKIjrrbI6ep1WZV00iO8nLOVZamfBNGPLnp+tXZ7IaKriQhbC/nj94qpKEVT?=
 =?us-ascii?Q?NiaGZB6BBCyhVfu9xZuPCNbAYfcn3R5ZZBBNhS+WD7Q3Dx9CqBi3LWFB7cBY?=
 =?us-ascii?Q?koPbf0Ep4b6CfMHC2+7aSwQOOvNC8V+Sk/KA8xakUboERhBIzgnKSf9OIo+B?=
 =?us-ascii?Q?Cgor6bebEhP7zdHqLN84cZ51XwFKgNUGXHSjJzmP605Kd0NH8Ph8UgRY5f5c?=
 =?us-ascii?Q?VtGzGNE5GOFdGISkmIDZyKvtW3kkbNnfLRy/ISNnX6U4SdiSk5jZQ6AGFGiQ?=
 =?us-ascii?Q?4qS2TgkbfjVOKBUcnqGzJGmy4NHyW1SwqAc0Az1W+4QVcY7cvuCvtLb82J+6?=
 =?us-ascii?Q?Q1oT+v7wql6+7+VrBwLfMFYezKyqgo2Te/cJDTOjEaVhZSm/SRo3eBhTYvel?=
 =?us-ascii?Q?0V8nD7H0gns4JaK8zhg=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c428611-3d54-4e55-714f-08dbecb67932
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2023 06:27:46.4310
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XrkUAr9aIw40Aw+m+2jk48JwGQsv9rOB2WrpwUkbsTop3taPXQTtnY/Hx6Vs0F+mN1MQkKJiydkchRnPjY44RQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9255
Subject: RE: [virtio-comment] Re: [PATCH v6 2/5] virtio-net: Add flow filter
 capabilities read commands


> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Friday, November 24, 2023 11:37 AM
>=20
> On Fri, Nov 24, 2023 at 05:53:02AM +0000, Parav Pandit wrote:
> >
> > > From: Michael S. Tsirkin <mst@redhat.com>
> > > Sent: Friday, November 24, 2023 11:03 AM
> > >
> > > On Fri, Nov 24, 2023 at 12:02:23PM +0800, Jason Wang wrote:
> > > > > > I won't be able to absorb this comment of DMA interface.
> > > > > > If I discuss further, I will repeat the whole document [1] and
> > > > > > I will avoid
> > > that now.
> > > > > >
> > > > > > [1]
> > > > > > https://docs.google.com/document/d/1Iyn-
> > > l3Nm0yls3pZaul4lZiVj8x1s73
> > > > > > Ed6rOsmn6LfXc/edit#heading=3Dh.qexbtyc2jpwr
> > > > >
> > > > >
> > > > > I really worry about how provisioning will work. And I do not at
> > > > > all cherish replicating all of these query capability commands fo=
r
> provisioning.
> > > >
> > > > +1
> > > >
> > > > There's nothing that prevents the config space from being
> > > > implemented in a way other than registers.
> > >
> > > Care doing it finally? Let's see if what Parav is worrying about is
> > > then addressed.
> >
> > The whole concept that everything must be in one giant config space is =
just
> simply bad.
> > It does not exist either in virtio spec today.
>=20
> But it does, this is what transports are doing.
I don't understand what is "it".
Transport like pci transport bits.

CVQ is functional object that helps to arrange the bits in logical, functio=
nal manner instead of trying to place them in bit array.

>=20
> > once can see that what is presented in the commands cannot be placed in
> config space at dynamic location.
> > Same was the case with statistics too.
> > Same was the case with VQ coaleasing knobs.
> > Same with hash knobs.
> > With flow filters,
> > With rss contexts
> > With rtc
> > With new queues creation apis.
> >
> > The endless list continues...
> >
> > And reserving bits for future (for other than pad bytes) for future add=
ition in
> config space is equally not elegant design.
> > Bits will get spread out at random location making things even harder t=
o
> maintain.
> >
> > The device is no longer a simple mac_addr + N queues device with some
> static rss config anymore.
> >
> > With all modern work, every capability query and run time configuration=
 is
> done over cvq interface today.
> > Single get/set channel from driver to device all using existing resourc=
es.
> >
> > The real hw device also does not need to refer to two places of config =
and
> cvq when serving cvq commands.
> > Oh, the list of advantages just continues with what 1.3 spec has done.
>=20
> I don't see the problem sorry. We've been doing this for many years with =
many
> ways to access config space.  It scaled well.
>=20
I don't see it. sorry.
The configuration of the device is done using cvq.
>=20
> Then hardware offload guys come and say that in PCI spec current transpor=
t is
> forcing use of on-device memory, and they want to build cheap offload PCI
> based devices. Fine, let's build a transport variant that does not force =
this.

All new capabilities and control is over the cvq. What is baked until 1.2 i=
s sort of legacy.

>  And
> we want optional compatibility, so let's also find a way to do that.  Thi=
s makes
> much more sense than forcing transport specific issues on everyone.
>=20
Trying to attribute as some transport specific issue is just not aligned to=
 the spec written today.

> To add to that, what did not historicall scale well is transport-specific=
 registers.
Then you should have put the VQ notification coalescing functionality in a =
horrible virtio_net_config register like how a queue reset in the common co=
nfig space.
Thank God that mistake was not done and many similar mistakes were avoided.

> That was a bad design, with all transports doing exactly the same thing i=
s
> slightly different ways.  And what you are advocating for with CVQ is exa=
ctly
> replicating the bad design not the good one.

CVQ design is what extends the current spec in good way. Followed by many o=
ther non nvidia nics listed in the doc for reference.

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

