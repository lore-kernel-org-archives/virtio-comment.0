Return-Path: <virtio-comment-return-8213-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9855BC4332F
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Nov 2023 11:31:24 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 022E3A42EA
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Nov 2023 11:31:24 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CFE6798672B
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Nov 2023 11:31:23 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id B596398671B; Mon,  6 Nov 2023 11:31:23 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A856098671C
	for <virtio-comment@lists.oasis-open.org>; Mon,  6 Nov 2023 11:31:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=efTbQI8hAr1mLJR6VnBKxrUo4vWfYpb4YP1BlvFMFnU5MgFdknDJeQMnbOFr+oZNvv6olzx6i377DOI+P9agoXwSj0EHqLQHN9VusKm0tdH/A4zU74rijFMsTgrJfiWj0GPEV+46DICnxKuVqG1zss3eOc2c1ppYwClfPFWiM+1W9aHp6mRjAHKzT8HlPjmVbArcm24hHMhvW5QFwYKwxNa/v+lBMiKtMNkCiXCv4SEbOwK902dpc5xBauez+sD6stHREVUqSiUNyoD4XvrG3csdRoDGMoA6KZqwUMp0ZGS+GYqvrvzedudvGioJa4GzTQuBYvg7FI44HaMhuuBKCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kn3+s6LnJ894AkumahFcRKd8P2UocTLDYFe9rnAPEVU=;
 b=BAwM8EWEa1qmZxKBBG6RAKOEIn02DeEFcK5pG0kNlvH0OABx4L7B2X2eSgGDam8P1gHQHXAUrX7nkDlAJKtESTeiTMwRXwgUGsAPgwE7coa8zD8k/R16umlDRbYZk1VfwXUrleBbEL46J7wVRbNeVoLUin2qbGRatdJ/tuhSIc7UaVETnMjdLgt01EjFLwbFlijtj3VvTbSvNkbJ8EPhKFteTm3rMhDKwJs6K0f2Ph2+0/+zdA6gNDOFABQIc5afCItLDe6TJaoepkIxs/IeaUce3YSo/27OKo4zKwTUYuIEwYEd4z5yQB3oq+etOaU8/NRrUjYHUdwMPvtwzpfr1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: "Zhu, Lingshan" <lingshan.zhu@intel.com>, "jasowang@redhat.com"
	<jasowang@redhat.com>, "eperezma@redhat.com" <eperezma@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>, "stefanha@redhat.com"
	<stefanha@redhat.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>
Thread-Topic: [PATCH V2 6/6] virtio-pci: implement dirty page tracking
Thread-Index:
 AQHaDkFr7w3tkrCqqkSwyxm5dwAptLBoapSAgAABpXCAAETRAIAACO2QgAPyz4CAAAX1wIAAaQ+AgAAN5TCAAAJSgIAAANhQ
Date: Mon, 6 Nov 2023 11:31:20 +0000
Message-ID:
 <PH0PR12MB54816EA2C820719511F3607FDCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231103103437.72784-1-lingshan.zhu@intel.com>
 <20231103103437.72784-7-lingshan.zhu@intel.com>
 <20231103064730-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481D028E63E6CB0AA7F4149DCA5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <fdfda658-e89c-41f4-9f4c-77d5d9b1b642@intel.com>
 <PH0PR12MB54818179419B06412D7A9C84DCA5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <445ff573-72c3-4fe4-9e07-e7fdd2dc5750@intel.com>
 <PH0PR12MB54818BAE4BD33983E6108FE5DCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231106052340-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54811E4E56B40A661878D8D7DCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231106062321-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231106062321-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|DM4PR12MB8557:EE_
x-ms-office365-filtering-correlation-id: ffe782b3-d02c-4336-1eca-08dbdebbe5ec
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 /cx3TwY2oozWVBjjrsZ7fTYFlFLyI8cZd+xS5iRLbaKa/SzA1hDluM6N5Hc7nmTtGQIGN3gSH/vYnYTiIqVHBYMTnGkI9Q9Uyb5BIlJRNM+NG6NSxE85wXZVaGB9WL2oOGRDG2bO3gTA5aSJir6XnO7uHq4YsEiDF7Ldgae4b3ChkAdIWCh4jVBMUZIOJdUixcfi+RPhOZ7eawS186mVOxb8rAr+Pk8jqbjLFFExqm+d/mcIdj62jMusBoh3ejS0CU/j0UhOsJBj3BkhzAjvwB/Hptjo+R99lwslGsvzMYj24E599w2gZoCmRHLO5atRzQ88wpmSJCVy6K3DTS9d80MqJXJ87h4D0WFdlhzuubppWOQocEoILdT+nBZGQKWyoLZmWalas5kmDAsbZZYyYtJjKboonqzcWJj1AdMMfxGS0Vao9cu0WnJBhrQ3pqYEvYOVPk4kGjPa2dGANG5QPLheciDdnhDY+repigC2QT5+VpF5NLnmv33q4cxE1up6fH2E3ljRnbTHPhht2CwqjosLMDXfq+Hu7V5DIDry+gDLaVrcqnr5Fn/k1Orpr/cFE5fFmTtLZfUibTgvSgqudjR3V8hV66bVD5bkPvkzhw3UHeHleFwfkFYRYVT6aX3ymcYFjZSknUtwWwjCTVfiAw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(396003)(39860400002)(346002)(366004)(230922051799003)(1800799009)(64100799003)(186009)(451199024)(38100700002)(5660300002)(41300700001)(2906002)(86362001)(38070700009)(33656002)(122000001)(478600001)(83380400001)(9686003)(76116006)(66946007)(26005)(7696005)(316002)(6916009)(54906003)(64756008)(66476007)(66556008)(66446008)(71200400001)(6506007)(55016003)(8936002)(4326008)(8676002)(52536014)(14143004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?yCr5ERXHcrmer37lsEoeIvoSLzcVEOm51MCW443ZBgsEkhbmBOjEHkoQMX/K?=
 =?us-ascii?Q?jWyjmoDOHPNbVjsr/FkHOmSWgOdGX9wwoRwTxJKUBqNlnaNKfaBjfaNpRbUW?=
 =?us-ascii?Q?cz8td+Pb5qaUMH0ZeDHLB6b121MjPuUsJF9QiO5XfsM+sCwQgOXa+l+Fx3RJ?=
 =?us-ascii?Q?Bv6J+NVxrsTf9dQbwksgBlDECKz9Et2kcFJi49Ye8cIzFvzrOxetu0uHtKUu?=
 =?us-ascii?Q?E3lWJ6BRXkIoBUvPUDwbCtdYiiRXJRKzB2lLj6Yv2D5ZjRib9ncGn+XweBeC?=
 =?us-ascii?Q?0y/yBVztK5pvAgZraNTNe3vAHZjVkOOLrrmyLnQKeIMU5JIN5R9FZswUkSKb?=
 =?us-ascii?Q?oUNGRL/mG3S74gD3H0RSjccmODoqKjx9hRT8aWRSmzJechF8sTPLUAEMQBPT?=
 =?us-ascii?Q?aYtDIWEAxZaLPaB1dn5aCtcjl0ZKNvBgX4agnpQCS5REhRc92uY4XCEj4cMc?=
 =?us-ascii?Q?BV9wuEYLsDZSTpCLGlaeUHYSfM3wyqWTiLuK2FRV9n5+w6qh1cw5fJjtd91W?=
 =?us-ascii?Q?RBbeo/BBjsibMQAyJrqTRFoviWQGrUDzJ5QStACtrnNi48mwDFc0ilVUwIE1?=
 =?us-ascii?Q?LLsYDgSAw9LQ9LqYDTrZsJoqLkmfTYmYnQ4PYVQNEj10vJkUVgZ/97Dwgaz3?=
 =?us-ascii?Q?Xa/yUMWavLkL2MntiRQLpCR8ZuielGt+bBHI6raMpkLVH97EHiewDHFOZzqP?=
 =?us-ascii?Q?KliezFl5mfz96Yi2k9Jm+t8CWDoviwF7Reb8Nayf0M0yv4qPNWyAeSsobk0X?=
 =?us-ascii?Q?AJ4Qcu5Bpvui3GZeU8oWqtOLcpfCn/wcY3DOQKLCjvcceOxlEJlN0MnedsWC?=
 =?us-ascii?Q?sfqlfhH0/71e6eaB88xb0NjNxbYIkWOShhrbfQO5TVG/AFsufW4wrOy7Gfb6?=
 =?us-ascii?Q?thAY2ebsc/97x217mtG7aKI8tUXLiJp8XX/zI57Ua2EGctzo2TKlFquxhAih?=
 =?us-ascii?Q?gmm2zm/Ot13amuTtLbfitTHGEj5UzK7MkxSmHieJxjZXZOFy8jaOp82BCAxr?=
 =?us-ascii?Q?My8EmtRI7RmJayf7oLSeRHJDryoFieCgmlm2RUuV3vkHnOpHY9NHIdPrfJnY?=
 =?us-ascii?Q?DnkH7W8PzYdNshkWp2MIbdOFF64EDaDGfwBR7afloY0yKtVPiykTuPbvWzPn?=
 =?us-ascii?Q?wNRe2X5zZbUxEbP5Cabi8XUhy4PQJfleBbB90xmqy6scVx6X2VRpnjsi7rjq?=
 =?us-ascii?Q?tkOJh/ZsBxY68ufwFnEqwTLNYxvVqXz8II0JwJ/8WoIr4kJpOPIO8xt/t9Rn?=
 =?us-ascii?Q?qsQYEuAnAYg1lygh1e7GM5kw7+KfDnD7H1umJgM0Jw904sIKg1mzhLO8bmo0?=
 =?us-ascii?Q?GOHNun3zWlye+Wb+zwkrZ8JFG7vc55IM1nxvxskg+usvkIKJAZtweAnQ2dmk?=
 =?us-ascii?Q?vNLXbtvgHvIB7m2jBMx3FTewjgGZzqJj7eo228srL6jbjBzFJ8szuBsanfK4?=
 =?us-ascii?Q?FNBWiK9E958XPyMmBQI1+lF4AIW6Fy/nMnwZpMeoL1dLNADltph1rlisuolW?=
 =?us-ascii?Q?bErzfBk3bxlHsdas4VuPwiAhBIMM6L9+Hr97IaE0EhaJGrk3Z27fYbOCWlK+?=
 =?us-ascii?Q?VC1cyej9H/mr4UOV27g=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffe782b3-d02c-4336-1eca-08dbdebbe5ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2023 11:31:20.0232
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EijQx4eTwbEs3YX1QP8M3WVSv3Z6lCiESceJqF11YTkQ4IlvA+jzx/nGn2Rh3ey192UOG6j3PrCEcLbQLRrJBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8557
Subject: [virtio-comment] RE: [PATCH V2 6/6] virtio-pci: implement dirty page tracking


> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Monday, November 6, 2023 4:58 PM
>=20
> On Mon, Nov 06, 2023 at 11:21:12AM +0000, Parav Pandit wrote:
> >
> > > From: Michael S. Tsirkin <mst@redhat.com>
> > > Sent: Monday, November 6, 2023 4:00 PM
> > >
> > > On Mon, Nov 06, 2023 at 04:34:44AM +0000, Parav Pandit wrote:
> > > > > Do you know there are locked transaction and atomic operations in
> PCI???
> > > > Can you explain how PCI does RMW locked transaction?
> > > > Is it one TLP or multiple?
> > >
> > > Parav what are you asking about here?
> >
> > > pcie supports CAS and Swap which likely can work for this use-case -
> > > these are non posted writes. It's in the pcie spec.
> > PCI spec do not have atomic OR operation.
> > Lingshan in above comment suggested some unknown locked transaction and
> atomic operation.
> > So I was asking him which is that atomic operation and how PCI does it?
> > I don't know if any that can do PCI atomic OR without a workaround.
>=20
> Well this is not what you wrote - you asked about RMW and that's exactly =
what
> CAS does.
> Maybe you should take a bit more care writing then. Generally this discus=
sion
> would benefit a lot if people stop shooting from the hip.

Yes. I will take more care. Thanks.

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

