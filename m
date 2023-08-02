Return-Path: <virtio-comment-return-6948-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22883C04A94
	for <virtio-comment@archiver.kernel.org>; Wed,  2 Aug 2023 06:44:25 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 7307942C27
	for <virtio-comment@archiver.kernel.org>; Wed,  2 Aug 2023 06:44:24 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 59FE598662A
	for <virtio-comment@archiver.kernel.org>; Wed,  2 Aug 2023 06:44:24 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 46A819849DE; Wed,  2 Aug 2023 06:44:24 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 31C8E9865EC;
	Wed,  2 Aug 2023 06:44:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hARvJbT6oZbsqYfrPzrlUrxqgIK0AH/7X9/zrRqxttjA0cQ+gBufA94LRBWDBXDi6qKUVWXvvf7eevMuZqOBoIF9Wepd0R+JL8LS5BKXJwHyNS7gW1DSV0zvkVEiMp+/htDYVDOk6mb9eHEAiTkspzcjwEKs45GYcQNvBU5PGaWZ1bzHgsJsebTHuV+KF5SS8me6HtVGA8sJ7p+WEHDbkCi3++op4Yfw4lTjGnZVe495Nj0XJKlCBucOM2EmnFML5cYIZR9krfkagTAEP8b+cP/V8I/UkHBDK/rk2jLpFGrWYeoxTCf7gd9O0NnTbaYEH990RLdnrndq+KdsJxdoaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zMFe3p/W2RepbuQZ+8pRlOmk/Vn3cWTJNN+gcFO7TIs=;
 b=m/vdKppr2AtVLvAcqC90U2VSEvdIfPkNVuCqnGXqx1zTlY7a2SPRuMLZP5nqqD67fq0lIceyYk7VQ89Fp8lXHl/qf+ag2Xl6zCIzG37WjPLM0hJK5sj8xUlnCtq6nBZPJrC+48sCUOYXgvsvQfZHAqJMd8KrvwHGgMrsp2UaxQB8p/5Ws6EhqJAeessOe+7gFKGcdTprLpIRF2cp3C4DpcsTI8eVPq5rBgb0rcOBg3FU7997OoIJK8Jsb5O8AVq27Q4inZt+30ZbpOTtXfOs/yFQI0P8wfw8QBohmmuKZ31mG7png6c+bmi96y/WDfCO5hESc+V+XZexd3OZS8xFFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Parav Pandit <parav@nvidia.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "Michael S. Tsirkin" <mst@redhat.com>
CC: Shahaf Shuler <shahafs@nvidia.com>, "hengqi@linux.alibaba.com"
	<hengqi@linux.alibaba.com>, "virtio@lists.oasis-open.org"
	<virtio@lists.oasis-open.org>
Thread-Topic: [PATCH requirements 5/7] net-features: Add n-tuple receive flow
 filters requirements
Thread-Index: AQHZvd/S1zVkOCRsJ0eCMof906XE7a/VKJZQgAF0pOA=
Date: Wed, 2 Aug 2023 06:44:20 +0000
Message-ID:
 <PH0PR12MB54816E5CA04DAFD03581F6CBDC0BA@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20230724033421.249893-1-parav@nvidia.com>
 <20230724033421.249893-6-parav@nvidia.com>
 <PH0PR12MB5481BFAC574390286C5BA0FBDC0AA@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To:
 <PH0PR12MB5481BFAC574390286C5BA0FBDC0AA@PH0PR12MB5481.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|SA1PR12MB6704:EE_
x-ms-office365-filtering-correlation-id: 9a63bd07-d637-437b-6282-08db9323e6d7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 s1/bBNOPlAAos+GyxZ2YZ9HImmNjOEd0tLVd+xnXWdoaNbmx7uzW3GfgKtFtNprd/ngLVYg/DKXgBw3DxBV8w305SevLtX57iqm7X4vglqW0IrCXK403AX0SSoZdMPTdbD98FftK7/qor0mixtDk8r1950VZOjeht0Zaz5ntZhwX5spBNQDtce0qCwBtjk3f2XUufhpRuuHNK83DmJJK9KK66myw82P2cuQKHyUUQ2Bs9RasP8DHWmXMyc2kvuovhHYfZhZULGTAURGiW03/QiOSX4XJMP+qcCJRstkX2qfSQprPAIrSvQ6a4xp8lELLPGmFMrCmDFNpV1ZwG7ZPPApx/O0z9G+ci22T6iMVvr136w9Q68dHUthQ7DdH7g7RKHL5mQOnhw4WbLiwXU/CqH1biLEIT9dNoVXgbhceVl+7IsPqxSGLOG4YYeB2TmNMvx68+3Z325DysGxrNeFEKC8mRknDOEqiYjDIlXwqaTqAykXJTMTEYIPT2/myB5sxxjnF1PxLPpL9bOhENFwr3599tTmjbapcLNWxtGk+UstB+hcKn4BlgWbeam3Va8xHDyY6+z/07wQNYZDzyrXPnI4H8sbYLg25cKZwjIPI0AJPZTwuLlgiCZr159E/h8Pd
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(39860400002)(346002)(136003)(376002)(451199021)(5660300002)(52536014)(4326008)(66476007)(66556008)(66446008)(64756008)(2906002)(66946007)(76116006)(54906003)(41300700001)(110136005)(316002)(7696005)(71200400001)(8936002)(6506007)(8676002)(186003)(26005)(83380400001)(122000001)(38070700005)(478600001)(38100700002)(9686003)(33656002)(55016003)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?ligUPjrOjckukUBlOBJWFFB6A1b5tfZK4sD99VzusFVMWRzOBMyRV3yjw8uM?=
 =?us-ascii?Q?OIdyTh9m06y1sVkdW/UHhsfkeidpw2SJvpxb8NcbAy6yELcB2C7zF/rWti9V?=
 =?us-ascii?Q?6nkWBskOBSBk87gEhEkV++QU4W+jjDjv6xL6Z4mvCahCR2KzmwLFZiOGdJ84?=
 =?us-ascii?Q?C4Agj+NvzYcml8IciTFOk8sDH76VYrESaVk7r6zlmikGIqGewcV7OH/w/4t6?=
 =?us-ascii?Q?TOtLs+txRmzMis7ZH79mMQo5c6yvJ6knDvi4E8kNg3hCCk2mJjdKi8ZbBt/8?=
 =?us-ascii?Q?GvgU3NVG7B3yhD+8T+EyWWNV5y5gIalceePPCcX33uG8DBGJX/WtGz051fPt?=
 =?us-ascii?Q?x+8gFo6anddhQ7JiBRUk8R4Qscwc6sRfgvIIDI4XGrc9lz6F5z4hWYcL1ax6?=
 =?us-ascii?Q?7vK+/F60nbu4jZn4bV/qshWtklQKrnSuzzrquNoDmUA8MJYh+BBJjgvx1aIW?=
 =?us-ascii?Q?YEf97xHVPOOKFWPDBBZdWSErL3D0dEOx7XNGay9qpl+x9Z4inOCTD3TTKt7z?=
 =?us-ascii?Q?HwlUoy66tx2RskHKZt8704i7ZwQOeQXrpS/hklIaQLvsJpNp4RUGKBo/NdRI?=
 =?us-ascii?Q?jYzOrb5+DFUf6r7FrJZZzqehsO108cGJQl2Y3HKAYVM4TiyRhGoRjdaWPy5b?=
 =?us-ascii?Q?yCcjlnNGDnh5QS7PEPqMG9koXlibza+//r9F6CxoRz1s/3qAhcjMWxZzxFPp?=
 =?us-ascii?Q?LLsVxqv+L1sDwc3mcV7/BabjBZxEsLy3BmTvcXvIBQy+dCtk0rzDK88amwJ+?=
 =?us-ascii?Q?A4dH06kVDFUlYuEFrb6nw3Dmj8TFxDvHDXXY9gMgipy4otU4oWUo1C6ObU0B?=
 =?us-ascii?Q?KpMIdGGBMl7ZUpeV9NZ1QjFsr5EE4ntMAMULoN7AfeSTIKxixT+YR1S9WEK+?=
 =?us-ascii?Q?HWzBDJyfReTbzkmN8iDJzqp4Neb+uk5KWq/THbLWqc1ywBQJ/I0f2cem2qr0?=
 =?us-ascii?Q?Rsm3Tyyhd46wwKA7tgq96nrbpnmeZ1opwT7fItSIUITEJrkGnAiWpLDzYIf6?=
 =?us-ascii?Q?2rDOSEgnVdIQCPk31TcCk3AagycYiojk9T3swxQx0iXysOs+EmMNGb4tjZmz?=
 =?us-ascii?Q?63UfV2IfEHtUJgG4s48zKO5WayxQxlKooaogPUccueVBu5ExVXfSnFeDETS7?=
 =?us-ascii?Q?nem5Xthf9vRbBgj/HG8ApSPpkW8UIt6IrjjVGT50dwyk7TlverYQ1zILXER4?=
 =?us-ascii?Q?+L7RTh3QpTTR//OZK4pGhaXMJ69MGSqAG8O0g1PcI7MfJzIoldFtq4Tw7Bxb?=
 =?us-ascii?Q?aKrwmN5kMTPgMsrUgbcYMnsKx/K8loBpqojNnBydUiV3xTGMWNT493uQo4kL?=
 =?us-ascii?Q?vtg8LLoincXIkQ6DL6zLnO3fAT6SCgsmd8jyCeZIIgcIY16QGC3+WfHPFov6?=
 =?us-ascii?Q?corbBRtlzIhQKOwZWO1iJsPTD1xhJSNfEOHIOvXIhykYvwsINwi1zDerdPFq?=
 =?us-ascii?Q?/Nl3wmadRHUKG31e5vaaE+YG1KUG6dnOgumdOMGReGBqUp3vCS1N951moYZ9?=
 =?us-ascii?Q?RPkTKruEa6FHYSN5ZwVXcl3yGtH9qQ8ADpbstHpgNlzdSnN+TE4UQLWubQgr?=
 =?us-ascii?Q?P/SR+1Ey6wPFS6X0APE=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a63bd07-d637-437b-6282-08db9323e6d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2023 06:44:20.8719
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BtgneWJenTP4qDVZidtq7cAzqMJVuqXvL6BB9YVsWyBgqGQ7wkzPp1QcUYc9lqjEhNPcXPbYzlOV4PqP11yO7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6704
Subject: [virtio-comment] RE: [PATCH requirements 5/7] net-features: Add n-tuple receive flow
 filters requirements



> From: virtio@lists.oasis-open.org <virtio@lists.oasis-open.org> On Behalf=
 Of
> Parav Pandit
> Sent: Tuesday, August 1, 2023 2:04 PM
>=20
> Hi Michael and all,
>=20
> > From: Parav Pandit <parav@nvidia.com>
> > Sent: Monday, July 24, 2023 9:04 AM
> >
> > Add virtio net device requirements for receive flow filters.
> >
> > Signed-off-by: Parav Pandit <parav@nvidia.com>
>=20
> Do you have any further comments on it?
>=20
> Heng and I want to progress now to start the design/spec draft of it star=
ting 3rd
> Aug.
> Flow filter command requires packed VQ descriptor extension.
> So, we need to wrap up now for this infrastructure extension pre-work whi=
ch
> has significant effort.
>=20
> For now, we are taking design to next stage for these steering requiremen=
ts.
> The packed vq extension is going to benefit low latency tx part as well a=
s
> reviewed by Stephan.

In todays' meeting we further discussed that inline is optional feature for=
 the txq and for steering filters.
Hence, based on the feedback, we can progress now without packed vq extensi=
on.

We need to close on the config space access via dma interface.
So lets finish that blocker now so counters and filters can progress.

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

