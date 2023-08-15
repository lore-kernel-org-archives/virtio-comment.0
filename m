Return-Path: <virtio-comment-return-7135-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EC2AC001B0
	for <virtio-comment@archiver.kernel.org>; Tue, 15 Aug 2023 08:50:35 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 7A7C126A2D
	for <virtio-comment@archiver.kernel.org>; Tue, 15 Aug 2023 08:50:34 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6B3AB9863EF
	for <virtio-comment@archiver.kernel.org>; Tue, 15 Aug 2023 08:50:34 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 616BC984035; Tue, 15 Aug 2023 08:50:34 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D83C398633F;
	Tue, 15 Aug 2023 08:50:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NZxnbfS6JU883Vb6Up6TbSK/VlrCzzIlLXcZwKss6wJzHQkzVkVdoWgo2xHs3OkYyPrudFzfddWJrdbvOXSkHJtO+a4q4QtHkoKfHFYyix13r+bNZgr6Sex2K40bIJ5P2CGCevATs7NafW7WO/OPaDY63e+3y6h8w31Yg2LnJIhaeJJPhcWfuJTZJepXQZnDRB3k3GMEEXuIcUrAF2Sywd53AHVepthu4RXLCRZLJJyiSfBOjTqjEmN2x8UrEWumHOzRuhLHD7rfLg5/WCrQgDKrP9/GbyPe4ADcKMh/AeuaXR00CkoWFbXa9VCv9MKG9ZdzSihq3Si59ODsEQzzrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UcQlxU+mxDuJM0CueylogoVCMAcwXBm5/4tEqJQS8Uo=;
 b=ZSfluc8qYCJPbrqvj2Xk8+a3Hd9boa7S4WvEs0U/qU44m1/XqSdXbDX8FJeC4991IR7J8XjGFlX/mVEdPO7BKbhofg9k89KddMo3JxL3o4kAM/mh+CF2YeJ0DIihhaK8FodfsG9BHvJ25xPhHOA5whPQvdxoTCOA7qv55HYSEBQl3t4zOA82MD77TuwXgcIU4bLSWox2cxHPiBerjD8YyqdHLq7l8iMAVpF/1kuDIzRegXFLj7/J0enpiroaFiHFBLdu/mMJzIzkS9WgolfBlK2TTZH9pWwKmAOSdYFBOMCffarrQ44UR/8kh53xljvW5D9J/c5y/yH86w45SD1AJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: David Edmondson <david.edmondson@oracle.com>
CC: "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "hengqi@linux.alibaba.com"
	<hengqi@linux.alibaba.com>, "xuanzhuo@linux.alibaba.com"
	<xuanzhuo@linux.alibaba.com>, "sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>, "virtio@lists.oasis-open.org"
	<virtio@lists.oasis-open.org>
Thread-Topic: [PATCH requirements v4 2/7] net-features: Add low latency
 transmit queue requirements
Thread-Index: AQHZz0yZP5vZ5rxxDkSJQBFcnvNVGa/rCwIAgAABMJA=
Date: Tue, 15 Aug 2023 08:50:03 +0000
Message-ID:
 <PH0PR12MB54818C2F8762C950CBC4B90FDC14A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20230815074600.473933-1-parav@nvidia.com>
 <20230815074600.473933-3-parav@nvidia.com> <m2350k7ku1.fsf@oracle.com>
In-Reply-To: <m2350k7ku1.fsf@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|SJ2PR12MB9007:EE_
x-ms-office365-filtering-correlation-id: 3c5b4508-0ec0-4111-c80a-08db9d6c9e3e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 mRMw/tdt6KDbtwXAyw34XsYO1x1zs335eUfGjl0RrMQUbCjoLXGA2f0QRZ2HJbomBzRMp3vT0JonfgQEU4sHejWnNs3Lu1/vQzDuxjQtoFoXHgsyR5XUq4DWsAqrSKzgdfI9xXvuJU3RkipFsFyBxEJ1Gpu6iHJ3eEtjRqQOVyYAdv5mxNex0GDmUwnnZwqvF0gZUKW15LvDAwRF+m6UaKNzcSecvjedk52kV1jK41mhtccZA3Nc0x0mqNE59SR41HiDjxKBiEdHDLk5vACOmQ9esYQ50eB6b0UAgiBJe4SLe02bPO24k0HUDGt7SD7cMrVaUTH2Z8WWbLegBa8gU9PUF27RH6eoxVS1qoFH3Ovfxc3DGVDZYGen/HZXW1UANQ/H8sbGKvpQeF1xcmO7qv5wQToH1fUejH9f9ZssNwYGV9O00gu5/7lIw+I1bpef9q8ZJ5EhQD2v8gPY8G/KTsjjnNxbEQZ7+HEXDLhmFq6f2sQWG2TWuE57cSOcORMpMHIe3kWr5Ef6d0oBCylBmIBR7xOvW7uPfgt9fhEaVULUUYN8X2basVuHN/dkt9+w5/0xKeGPA/V9YfdT299c0vv6m3AG7+OqtILEa20pMLUYC+CQY95RkBoHni4uDQON
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(39860400002)(376002)(366004)(136003)(396003)(186006)(1800799006)(451199021)(33656002)(83380400001)(86362001)(55016003)(41300700001)(478600001)(38070700005)(66946007)(66476007)(54906003)(76116006)(64756008)(6916009)(66556008)(122000001)(9686003)(316002)(8676002)(66446008)(52536014)(5660300002)(4326008)(8936002)(38100700002)(7696005)(2906002)(6506007)(4744005)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?p/1PhTCB1XmP1hD1k5jExyjjxfK328eWTpcm9tnsW7OHSQO+/KAdoYTxXQIS?=
 =?us-ascii?Q?KOf38ZGLRynw5SxuKTxmFgt7bD45FHNK8DgOabpVDjPCeUUrkPxd15rue6GP?=
 =?us-ascii?Q?YJyJ7MvV5s3sIxo64GJmSMSFkY8JPzd75WtBNKwOD+5wBrgD/+9tQpMVXHFf?=
 =?us-ascii?Q?XgtZQ20mdEglmoET499VL8xGxsnRbqGONb/eSW19BbrOOga+SEeyACS+ENmN?=
 =?us-ascii?Q?D82s9eeMhqacztRvhHO633aWfG4unYiblQoGCyHzIzoITWhIbeKHOuGKmB28?=
 =?us-ascii?Q?UiWDfT70ctZdAZDXCFml1XvYjoeOPbcM6q601qKyMu7AGnEEACRjzqBPPmUm?=
 =?us-ascii?Q?rlFNjA+zTXPejEJRX5RAtPVliQHAOYRFIAKgXlRxAEuuVQDVFucWZ99pH7NO?=
 =?us-ascii?Q?g+Xb8MsM0gbR/Ta1uu+RzzcUfLGIiRoyXWcsYLT+wTICIguEVk6qZC2n03fK?=
 =?us-ascii?Q?BKki+/Y8ralfxmxRYK6WzjzTp+i4UhayUXrg085G3gvwAJtWikX2EDX0Vw09?=
 =?us-ascii?Q?M1O8asoEb6y8GWe+zaSKzmH3+8eWu3TVppGHh78jHoglK1jWNVV6jlezA3P5?=
 =?us-ascii?Q?+9Ts85pNlf1maMrRfvycsV5qyqK1dxT/eZoIApgdZc6dkH3uwlj5aJY4jWX5?=
 =?us-ascii?Q?o4xkN9j12R4Dni64wqLyeXuvgyBjvMsnNXV3HWWWSMvENKvDD+H+iUIiMc3j?=
 =?us-ascii?Q?E5TtDFxn/gL3t7Dvz0z7lc1h/99vyANxPIcC9OZeI4mNeDoiA8LvNLs3oMFy?=
 =?us-ascii?Q?WhJ9a+9igxwsEA4/VVpBLYUwrlhf+LHDKLuJtrYQ2KvULLHJuNjHmEIbNoBD?=
 =?us-ascii?Q?/pQItTW3VV/rqY9gDWlIHbNAWlRgjTauo/3eDNRdhw2jVcolPragwoAPhsds?=
 =?us-ascii?Q?zHOFMcWTnro50GM3Xirae5Ko6QNE+bYFwYKAP5xyKlbJnCzUu8Xm51ZfcJeu?=
 =?us-ascii?Q?MlJHRhEacjRwOqtlDI1iMJ+bEoO85S9+Wh5bkVPCiNwidywdHV/uAEjn0+ZQ?=
 =?us-ascii?Q?JOQtbvgLY6N8zFMeVzqbMrkODrXEqNh9yw2YcIXlvYYkba0s92uCU60daAy6?=
 =?us-ascii?Q?z3MeVIR7jaZHNs1DoMXAjlXdHx3nGwxMP3jCZZe5xapV0HwPmaJbm01isGeV?=
 =?us-ascii?Q?RrYMASyIdPRbumGN7tCyLBnNmjKFZXPfIOCnKwlCz/vBYKv+VQxp19QADJsN?=
 =?us-ascii?Q?UpqadB3YCRsngjg8sXTEkjyNquHUEf1v13sPHVKtTbKqoInFKhFrNk7kD3wa?=
 =?us-ascii?Q?j7+CNrpyXSxpyJARjBSx5CiS2wfptAv/D01Nn6/grRypzoG7ko4Nj925VZnW?=
 =?us-ascii?Q?RdUnjyya1YPDfQUxjJwSfKo2oJCNUWfD/1nC1py25mzimJsiHRg0t6ZL48sx?=
 =?us-ascii?Q?8AJa19HInmwINUpbM43RHOYOzTwrp/iI5Cv7a+67fExO++zvGXYrW73EGIul?=
 =?us-ascii?Q?U0c5QbvFajbZKj4+/FnxRkWnURjHrXplTsQkUeI8OE/UUVKKDA6NMlX7UFPz?=
 =?us-ascii?Q?Ya8HvYgS2qsjiKfd6JVOJFlm0IdQU5nlJvXObHK5BURXzU9QOvXpGlqH0lix?=
 =?us-ascii?Q?01s6IC1kPnod0B4BewEN8Ms+k7hvAdRpUJzdXF1JWliQyFW5hs6ebJUC/LDM?=
 =?us-ascii?Q?0iR1I8b067qDHvilGndbtuk=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c5b4508-0ec0-4111-c80a-08db9d6c9e3e
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2023 08:50:03.9737
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RNdXeyxEAq+y02ZiwWWnhzFUL0e4h+6QnOJfJ4YhpgnPVq9by8kRIdhiKxIfcERhjK+V1fZU7jtv/DT4X/Yfig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9007
Subject: [virtio-comment] RE: [PATCH requirements v4 2/7] net-features: Add low latency
 transmit queue requirements


> From: David Edmondson <david.edmondson@oracle.com>
> Sent: Tuesday, August 15, 2023 2:15 PM

> > +3. Packet transmit descriptor should be able to place a small size pac=
ket that
> > +   does not have any L4 data after the vnet_tx_hdr_desc in the virtque=
ue
> memory.
> > +   For example a TCP ack only packet can fit in a descriptor memory wh=
ich
> > +   otherwise consume more than 25% of metadata to describe the packet.
>=20
> The presence of "L4 data" seems like a distraction - just give an indicat=
ion of
> size ranges being considered.
>=20
Yes, its mainly the size consideration.
Will update.
Thanks.

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

