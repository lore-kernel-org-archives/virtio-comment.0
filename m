Return-Path: <virtio-comment-return-8039-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A43BBC4332F
	for <virtio-comment@archiver.kernel.org>; Mon, 30 Oct 2023 11:46:33 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id E813A2AEEF
	for <virtio-comment@archiver.kernel.org>; Mon, 30 Oct 2023 11:46:32 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CC8B6986B2F
	for <virtio-comment@archiver.kernel.org>; Mon, 30 Oct 2023 11:46:32 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id B3C85986B2C; Mon, 30 Oct 2023 11:46:32 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A5285986B2D
	for <virtio-comment@lists.oasis-open.org>; Mon, 30 Oct 2023 11:46:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AcYgJOFpc3dk7qAWoUanx3qyBSRTDEMLDwBlXI/nkcdUZ0YEVyTKzzj5e3VIRT6bzVQCG0njBeMwpkQntXntncFpuFydApYJtWs0n+Fm6ynTNYey6O6jpP5Xkd4vAPLPdTizmT3KdSxGZbUepI7V0N+GHdJEVodxhDQHy92kyl20kiDtWPbumzGeJa8qkyWZIpWD2l8y0rL9Ox8rZCbKFzBW6KhyFElX9uE4W2BFpTkGiioxjkY++jXKXXnukyF2UvyoTvJCj1zLB51U55qZphvpaSZn/fG53F2eziB0d8N2PGg9ZvNrI0ksKZ9i0St8nST0PfsxkUo9Q8xck5MA/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f8cIYKH8liaeoSRjrulRzmkDYiXtASUA4Ae350II/F4=;
 b=fEmEQ2WsTxdZJ3t/kiKt3bH+l4vn/CP7atMcqaacj9fDH6UitXZjgDdjGlIahz5apK8UVRZPZGUkL0VD6aek7Y8nkqtljUAbnE0Pi9P4OxWYJROvsGZko1m6oyMioCNRfP9jdydTp17Z6/AtWgTn4+CARav5k9TtxhmsOSlGDZUXf84EX30iNYvsZ4nQj3F8kxhSHR8Xn9HmkhJYLQh1lsxDZWmezxF3rbCcnJ73ShRBbKUDLj8Y0U6Rfm7a6gyF/XTy/ApubMTBjSklJ4kF3WB12XigH/0Uvps9+uG+bLiq8hkDryihzYgMzMVsyl0uwZJ8y47RVZx7Dws5i2wzAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>
CC: "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, Shahaf Shuler <shahafs@nvidia.com>,
	"xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>
Thread-Topic: [virtio-comment] Re: [PATCH] conformance: Add missing virtqueue
 reset conformance references
Thread-Index:
 AQHaCNocnJlP3yFdOka6+Dq5vND3cbBdoslwgAAOBQCAAAI0gIAEfCYAgAAC6ACAAAmJUA==
Date: Mon, 30 Oct 2023 11:46:09 +0000
Message-ID:
 <PH0PR12MB54815C61EABA8447F8458009DCA1A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231027133236.1350124-1-parav@nvidia.com>
 <PH0PR12MB54810FFF99577FB6B7FEA51BDCDCA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231027102358-mutt-send-email-mst@kernel.org> <87bkckrva2.fsf@redhat.com>
 <87wmv4qsqf.fsf@redhat.com> <20231030071109-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231030071109-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|CH3PR12MB8548:EE_
x-ms-office365-filtering-correlation-id: 903c1b33-a61f-4a93-8c67-08dbd93dcf6b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 AQzwrHDy1j896vIZXRqfrK+/6r4q++v5YHb3aX6/7bjlxvaO5wbIeXOcWG2oXt01wpbZZn43t2y5Kml6FYAgwP0Ce7Bz3FY54dtEO9/IPU011dbPfyhjSMVb8d31PxMtd9ilh7ePKNnOTQMxSo+fjO1yRzHpHHgeOor/hBsNJH4hiCNpTkW0l+GIkvdcPEISt7VIU69j37Q6gIzMnCvowjJi2zUHd/2H+xBeejBvhxMFyMbkDRx7i2Nwb13V6x3g4pca+ITSy8P+UuKtmmxq2tje7XQ4AOag5J0wBNiGHU46IBVBCnDJDBH/TN9b53ZBrMPQH9qWaTCtuDd3Tef8z2D8ZLExtXQrUQLBPmMYGb2jtv4w0esN9FN+YVGvihV0kWOPlu3/7d7MBaKAc7gNSkDohJTvwJHJufcXxyTuvAThEgU8UUsUitiPGWZhW45sU1dNvbMneyfa/qFnG9latMpuLYnXfzsr3I9VKX60aKxyddErbqsYZJ1eLZNIQCS7PwrgJNlYMWJdJHJMUviM3jxvM3qejHQwcyaaHQE3FtarkneFMSajvTP58vZNqva/eBon2Pkv7QLSl/mSaENpoREYyZIa1tOnrV2WjXX5FzGH+W07JaZAl5kTv34BsURk
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(376002)(346002)(39860400002)(136003)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(6506007)(7696005)(71200400001)(6666004)(9686003)(55236004)(83380400001)(478600001)(4744005)(26005)(2906002)(5660300002)(54906003)(64756008)(66946007)(66446008)(66476007)(66556008)(52536014)(76116006)(110136005)(8936002)(8676002)(4326008)(316002)(38070700009)(33656002)(86362001)(38100700002)(122000001)(41300700001)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?D8GJm3kKPgGx0ZNzSELxoIuGGmeNCs8Zkvx23o2Fqm4RC1YzYLfS5xzKMjl6?=
 =?us-ascii?Q?AFZPu0jYlBhjmB783EIdwIj2eEdk5vteZvUZJ/p0sthT9b7AaYaD/53z7UVg?=
 =?us-ascii?Q?YyygtyNno40redHuAFa1ie0U7xFCBgBfEi7fFjhyo/3zPaszuB7l4c0aiz+v?=
 =?us-ascii?Q?QD739mLvgBT/C9HxyFZ7yd1eY9rgA1iN2CakuoHmbG6L39l3+fZc48/j5rNl?=
 =?us-ascii?Q?55v7dZOaY0kAMjFRHiE4YOe7LJWgJHoWCf4lCCLbsmkVHnD31RqtjF0pEzS1?=
 =?us-ascii?Q?oeTvG4bZ3FMMGk5NzSbMYLLhWJi5vjCSu2i3WDgj3Cwhadl1B1IQ4DJEsCot?=
 =?us-ascii?Q?2c1ifXVkEmemdDa/KbY0VTXYtfvzb42wJYJBVLe8CVC73mgATDRq2qzZ847/?=
 =?us-ascii?Q?RKiTBS2vkIUmroX+eGlFj3/ChvTBN22+vh9ykBk0BD7MJTpuhW8/SJ6DQhjq?=
 =?us-ascii?Q?qiwQCJp8FJoN94y2kDyrARp3Ds0Gzffn0FUCFcdN1jHJEyW9joHqDNIVTfsZ?=
 =?us-ascii?Q?Yjm42I02k3A5iuxj2QsMtUXg0uH04NMij3UR0dwgfgLb9ycJZNWwG2bbm36B?=
 =?us-ascii?Q?o9i44bv5ktcxET7ZmzgLKgpjyswAw2RB03xIrkSlHXk3PgC3lXbs9Z8l6K1B?=
 =?us-ascii?Q?PWb1BwTO8tGmfLXNnHDBbjvbJIK6oghQ/wgLhJOOvWG5xL8IThY5K7mTy30w?=
 =?us-ascii?Q?87z4wLIcE1kZI/Ski92V/raHavnOQVYf+6MjDlbamUlrapMg6CEO6Zzx5dgB?=
 =?us-ascii?Q?RPhyL+INMDJHgj1ntpwypWtIH1iU6jaPbjEBlL+8Nj9nHzZf3jngddXVUBH6?=
 =?us-ascii?Q?Vg1jtbW/d3HBTq7BPlLE/jke0tQftCpv9/ADKIdKWR6c4Q2xhb/9WcdfjSXN?=
 =?us-ascii?Q?z6YIDyHGPmuqceG0UbidZLSgDIBXCi+9snAnRczNQIIJhGMxM3D5TWProf1e?=
 =?us-ascii?Q?HFZuXkoNfe83jD6Xkuro3/G72hV54WnShmeFfnDQWpH3/N8kiK0YVfSmUmW1?=
 =?us-ascii?Q?a+HbJyI4LJAzBU+JwIkwHogGyB8ecuNhirmI5l5geyWVZl7rhUoOgAvEyLLe?=
 =?us-ascii?Q?BIR+PgKQq74Snrdpn1LBTFgAIVSoBndOnjlLTYkc7OgK6kHWLpCUKsDLgGw0?=
 =?us-ascii?Q?eRhZOWzvKa7ok5wJqJIYNHTqzeQz5SQwMzoL/vXqZw93JXtZX8ytKLvuAx2Z?=
 =?us-ascii?Q?X+9toFvLftscZULSvwPuOQi81/ZzdwlUcDJmOj4bn+EfNmDnxnq7QsCNKLbQ?=
 =?us-ascii?Q?TTug+O7KZaXVm6pAANqb9hvg8g0wwcJ7Gc3Tm3O5Hp1y6B7oGpqBK36Ao7rI?=
 =?us-ascii?Q?EB2/NzeliE53KxgCyt6kSpJl6EO/eDDROY/P3//Ao3C5oswwanjfiRmR3R8S?=
 =?us-ascii?Q?zUQN+DBQi5j0dwF4IhfHKbevV2Yu3QQ8YlK1OnHhV+ch1urd/5E9dAXRmcQI?=
 =?us-ascii?Q?ywC+3vjfW09qyVYCjp4oVm+PiqPUeFirXael17ShQca9mVq+EwIzkf0NWrzs?=
 =?us-ascii?Q?+rlKoOXfzR8AYUA4hZAbY+amdPuf3E87hQCxcvgeEUtDrJHRDL/s7Nb574qM?=
 =?us-ascii?Q?ZUHxdV5d9et3UIQhEzQ=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 903c1b33-a61f-4a93-8c67-08dbd93dcf6b
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2023 11:46:09.9094
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GsKoz79/Ok8MB8QFEWHlioM3p2KtupYKPkb0BO1rCi9tcf77ZgZhEf6BtLLm5+nUTIS1FKymjjzC3GiaIbjJqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8548
Subject: RE: [virtio-comment] Re: [PATCH] conformance: Add missing virtqueue
 reset conformance references


> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Monday, October 30, 2023 4:42 PM
>=20
> On Mon, Oct 30, 2023 at 12:01:28PM +0100, Cornelia Huck wrote:
> > On Fri, Oct 27 2023, Cornelia Huck <cohuck@redhat.com> wrote:
> >
> > > On Fri, Oct 27 2023, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> > >> I think we can merge it as editorial actually. Cornelia?
> > >
> > > I agree. (Someone should probably merge the voted issues on the 1.4
> > > branch first.)
> >
> > But what I'll do is removing the "Fixes:" line and close the github
> > issue manually. We should use github issues for voting only, not for
> > editorial changes (we need some way to distinguish between the two,
> > and I'd rather have a straightforward way to do so.)
>=20
> Agree totally, that seems like the best way to do it.
> If this begins to happen a lot we can add an "editorial" tag though.

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

