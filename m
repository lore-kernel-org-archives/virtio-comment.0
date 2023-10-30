Return-Path: <virtio-comment-return-8040-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74A86C4167B
	for <virtio-comment@archiver.kernel.org>; Mon, 30 Oct 2023 11:48:31 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id C662A22369
	for <virtio-comment@archiver.kernel.org>; Mon, 30 Oct 2023 11:48:30 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A62BA986B2E
	for <virtio-comment@archiver.kernel.org>; Mon, 30 Oct 2023 11:48:30 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 93876986B2C; Mon, 30 Oct 2023 11:48:30 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 83ED7986B2D
	for <virtio-comment@lists.oasis-open.org>; Mon, 30 Oct 2023 11:48:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RJ1sHFMPyBVIpgIXjkTXPk3cvhM0utf3m8bNLppLb+tx8tTbWhj4pxWof7Bo9gsn4NpgCF0ffJzWXSVI7+lb6+aw0LKcH6k5wouMQSPTspXnxhdHZ0BsIErtrvfW8H8/N+7cUFtqUQD3fueRQjHKn3Fl5m7FZS1oVR+j6q0+bHrMW5/12hbgQ7q+bmJI7uKEvIlKz3EqsB+fCSwxZj785xVUq9G8DT9pkIHZ/B6tij1afTrork39Ege5QUnOm91GIrk//U6R8h+WepP8gutRIyxm5idP4lp37gWZRYeXG0DAMeL1+1DvdiiE+k4h38PB9WWUAas6a6wZ5/26qDYWNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rh1ErzKW1p5eBfcMw+5lkCVdaTRu9w2GOrzcxacK67s=;
 b=g/7Kac+iuYvUm+SB1GMhRWiTDqNp00gzvjYmc8voHXodbIOuJuMz30jKXBFzYyG5x4lXINOg1fx07MN8Co0EvNeHZZS4uBq+NAsFih0FXdLz1LRZwHJZaxt+IAaL8VOM4rI4eTG6DPM2tnmcKHr2FPGRqH9hrwZAbJCEAiRTTI3cDDlVp2CAi+PbzkCJGb29mS3Oce1Y0H/nJR217EVBSMvKeChkSVnLNlBd+IzmolmsOJK6xSeasMfVHTbUr53tR7cEcwWY1JbLxOjEuzRRmb0PXh1ZKra9kOQNmYz8G85RJj8oYqYa+OkS2rcCQe5kUEEy6KEAIylcNwuHMDP71Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: "Zhu, Lingshan" <lingshan.zhu@intel.com>, Jason Wang
	<jasowang@redhat.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
	<shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas
	<yishaih@nvidia.com>
Thread-Topic: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration
Thread-Index:
 AQHZ+dpHSUrTyyDEA0quapQP8C0hdbA/xRkAgAF/hoCAACxh4IABSWcAgAANqrCAAZnYAIAACyKAgAGFBICAAACFkIAAEwWAgAAD8yCAAXZ1gIAAIYLAgASWeYCAAtRh8IAAGoeAgAAAUKCAAARLAIAAB5cQgAAXYICAAABqYIABiiSAgAAMdcCAAALCgIAAADWggAABTwCAAAD9AIAAAmrwgAGTbICAADeVYIAEiiUAgAAAXICAAZfSAIAAAE8wgALlIwCAAAFh0IAGlzYAgAAFXWA=
Date: Mon, 30 Oct 2023 11:48:27 +0000
Message-ID:
 <PH0PR12MB548195665BF3374B6CDD7685DCA1A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <daea1f54-1c85-4a4a-ac3a-c5ae97180e03@intel.com>
 <PH0PR12MB5481BE51210D429FA12EAB45DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <fb012148-a71e-4856-95fe-6e75f011f3fb@intel.com>
 <PH0PR12MB54819C3A4BC9BB419715AB73DCDBA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <f2707430-bb1e-4dcd-b0b3-2b9a705e555a@intel.com>
 <PH0PR12MB5481033BB7C0BCABAE329B13DCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <f9a604b2-7bc9-49ce-bd28-59909f0a5fec@intel.com>
 <PH0PR12MB54815B589B8F5489FB493465DCDFA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <9604eb82-8efd-46cd-8b15-90fc637eff0c@intel.com>
 <PH0PR12MB5481E6F72E2F15AC88E6E24ADCDDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231030071652-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231030071652-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|CH3PR12MB8548:EE_
x-ms-office365-filtering-correlation-id: 293f76e0-9731-420e-eb0d-08dbd93e2167
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 09H8rqMy8a5B9lfZC/Cdnc5Q0yUlBMIJOdKll17uTGPYzn4TBISGK95geQucpXYUFblGOYnLbn7TP7fZWgDaXUZ9aplcnS6BUfgsaBw66BfUhhU7qJmdhFuiwuJ9Id1CJ0O+eNRCoAvpMS/z47Kd4evj6RrII0W/nlk1jWbbDwYmBU/Bq270Otc2zqdtamLcqY/4Wod82jN2Cj26tpeAhgQeh3kgwDEbBsEOden+dHgdpMIsqC0emoWiG3V0CZvARAbSShDOSQegJTyFZ8BA9eXz9pv6Uja6woCM3Hvyqi5i54QN5/vnKb1+jsPBBzA7x8xAE6fgm5+mxX7LpykNAkdRAaHDO7QQp0kXl1N61JZTa/B6YJBhRC/ITUi/HcAT4Ka8dcgYtgVo/XsIQPisXeJZHQVU8lfMY4ugj00JyputibCsfRB3aHbJB8IfRhTQpW5Sb33kCePLtB/tyTogDef7N3im0Izs2T9+0dTPk+TCSz6QThvqclCBzu0lpukQI9kQDExZI2GnOnCInZEbI1jCBblhtu8AfsfSpY5gaZTGTMtW6ugJzP8HKBKO3VYB5rTo5jOkWhaa8je8z5LQmeIQCGkBCCLY0JF4WxBtZYyTj6X+VWm+R2IkZY/oAq/N
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(376002)(346002)(39860400002)(136003)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(6506007)(7696005)(71200400001)(9686003)(55236004)(83380400001)(478600001)(26005)(107886003)(2906002)(5660300002)(54906003)(6916009)(64756008)(66946007)(66446008)(66476007)(66556008)(52536014)(76116006)(8936002)(8676002)(4326008)(316002)(38070700009)(33656002)(86362001)(38100700002)(122000001)(41300700001)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?YwQfh5o8c86UA1ilpjPnlKdCJZxd4ZC3pPZcUENGrbMDofZeeSKKt6ZOQZ90?=
 =?us-ascii?Q?fctK3mmh5oenzSlEs2Ul/6Ms+FSNs9jd5CvmjIKltSQ7TVefun9MLC2HCrMT?=
 =?us-ascii?Q?bkwPoxGSj6fN9nZT/ZFAP3Ez6k5hx5JbzMBrvQ0A/kdt9nK+7zqbLDOOk3jv?=
 =?us-ascii?Q?FjidigR7diY9sBh1IHkyatS0HM7L9itqDyJU7jUfhnACbAaT691ag4GJl4VG?=
 =?us-ascii?Q?q5eSdd0cQysoD+wFoqIJ7n5OpRyZb1KNFd6BNQmJjyg6NtbyY9BDAJBgcRT+?=
 =?us-ascii?Q?p1xUnOpmhXgBVnF14vXQ3LyZiD4OugOYGK3Zz7E3c8ug1ywFeomRY6pQXxne?=
 =?us-ascii?Q?d/xx02/3ZzZ2iJgioG09hsJ9E/WXJ59a9hipZkIPqqkbLuV5Cp9iwTim+F8/?=
 =?us-ascii?Q?nDt3f4Xu0UPHDYFoVu6ynxu5no06snlLFDHUMeRGaRDrprfCIsDp8jhCFW/Y?=
 =?us-ascii?Q?Rle8JTdk0DVB8MHyG27Fdq9/nO+jNnJT50XtEHglnEROhlcNzJX3cn0f4Wer?=
 =?us-ascii?Q?p53189FzjZssdBmZWMs+cQATEYAb94eToYgF3VeXntyqVjsbe0jC7Uy4bzPO?=
 =?us-ascii?Q?hvk7sizw5Y+MPMl41oGx6amJAPfackAA1A/P25fDz/DmKo59Zjk8K2/2velu?=
 =?us-ascii?Q?nA34eqm47wBNkGLVNUFpISXKMbgIv8NxRiDkM11n4aIEDl4Z6hHoEwkgYWyi?=
 =?us-ascii?Q?Wq8+TCZKoiLm0YqnCebnQt7G30TorOdNpQtdvYne+Z2zi2E1OP2wIBc1Mh/R?=
 =?us-ascii?Q?2/hoCG9aapkk0/J757cXqp87I6n/dJL9nYcACXXdWbW6MhIsa8GcmkOyr0+S?=
 =?us-ascii?Q?EPkj9Piek9P7u/d2el9JCYQLTDTWrP9SC9t76Lt2s9folFiEJeDP6OXnI1Yk?=
 =?us-ascii?Q?exXpe9OuugrQdPfAeY91j7xRPvNSbA6Zhtf6eiS0/p/XaRvf+Lcn6Ehcg00M?=
 =?us-ascii?Q?dCFT71d9zyqrKBK4T74ReRp96m5qz5OFo+I1sWVTereo6HOqLALvuSHUf2+C?=
 =?us-ascii?Q?FvFYxi5A02WPNr9pQwbBAvE/ASAc2Wje03j5PLQFrmn9tJQwsqe8wl2mxswm?=
 =?us-ascii?Q?Xj6AGI9o7HNPH7ZWaw2WSy5vfAAlFZwkov5ibK3jlwGDbpjqg6rgu7TjyxVU?=
 =?us-ascii?Q?FlscMZqM7V+QqJQ6GjFAmD9t1nDYTH1//1w3w221uudtLcGeZyBdlLI9XO8I?=
 =?us-ascii?Q?DqS68prVN0sq4U5yr0elK72XXYnbAq5bAU940SYbX3eG21Xp0oqehVe1Urzg?=
 =?us-ascii?Q?FoPbXyjZE08t88HY39IveXQE9suGbIjIe65kGL6yiZr3mGIKH4Pib+t5Z12X?=
 =?us-ascii?Q?qcPHXkGig5rkzN3Zteo6XJKWD0V4LR6mulZtmeON6Lz64XK5kP7MI7NqE4H/?=
 =?us-ascii?Q?b/6waFCSq1NIBTwM1l9YjOTlDPwH/mBOyW8JssisB2mAE+3AaUw+OpoTjBlZ?=
 =?us-ascii?Q?7BEEK3tLK49VqX0H28+gKOevD0mLq2o8a5Tzx3v4L2h7y6tcxUqag93HDSBl?=
 =?us-ascii?Q?1B4IcahfoOTmHmyU5IsqXJaOm7sUBZ64BrLUl8aKBK34W2OiXiH9/rMxLVYC?=
 =?us-ascii?Q?FXPnD08DAN0FLweQ6Ho=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 293f76e0-9731-420e-eb0d-08dbd93e2167
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2023 11:48:27.4286
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: diRfLdtELFoB8mvO8mtjdtuV6ikPXaCO1VksItNrT19JSAH9iXePabpXUIDuyj8VMtMEIFvno24qzIVcRnuuSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8548
Subject: RE: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration


> From: virtio-comment@lists.oasis-open.org <virtio-comment@lists.oasis-
> open.org> On Behalf Of Michael S. Tsirkin
> Sent: Monday, October 30, 2023 4:58 PM
>=20
> On Thu, Oct 26, 2023 at 07:04:38AM +0000, Parav Pandit wrote:
> > 1. It breaks the future TDISP model
>=20
> I really think brinding in TDISP muddies the waters a lot and should be a=
voided.
> We simply won't know until someone does the legwork and proposed the
> necessary spec extensions.
> In particular current legacy access commands are I thn
>=20
>=20
> > 2. Without hypervisor getting involved, all the member device MMIO
> > space is accessible which follows the efficiency and equivalency
> > principle of Jason listed paper
> >
> > I hope you are not implying to trap+emulate virtio interfaces (which is=
 not
> listed in the pci-spec) in hypervisor for member passthrough devices.
>=20
> I feel this discussion will keep meandering because the terminology is va=
gue.
> There's no single thing that is called "passthrough" - vendors just build=
 what is
> expedient with current hardware and software. Nvidia has a bunch of peopl=
e
> working on vfio so they call that passthrough, Red Hat has people working=
 on
> VDPA and they call that passthrough, etc.
>=20
>=20
> Before I mute this discussion for good, does anyone here have any feeling
> progress is made? What kind of progress?

I received valuable comments from you and some from Jason, and some were of=
fline.
I will post v3 that fits the current OS use case for vfio and vdpa using th=
e current admin command infrastructure.

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

