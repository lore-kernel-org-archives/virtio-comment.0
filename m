Return-Path: <virtio-comment-return-8789-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99E25C4332F
	for <virtio-comment@archiver.kernel.org>; Wed, 13 Dec 2023 06:23:41 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id D0A6E3E569
	for <virtio-comment@archiver.kernel.org>; Wed, 13 Dec 2023 06:23:40 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B26609866B8
	for <virtio-comment@archiver.kernel.org>; Wed, 13 Dec 2023 06:23:40 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 95B1C98669B; Wed, 13 Dec 2023 06:23:40 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 846D398669C
	for <virtio-comment@lists.oasis-open.org>; Wed, 13 Dec 2023 06:23:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d7SxzTxm9dGPPn4NkYloZhfDsLreoCcTN4F+0MEOhgqUOEnjGupv4eB6NZREoNm5iMzww8AjRoQ9HiF3TLI3xRywGZ5O4mCYb3tG6WpBEYs32pnFS/NyT7HVk+jjUFpVZBDPZbIEMGH2lRm7RowE+EyaulsKb0Q6bKPVJg8bfgkbXdJO+s9Npr51IcmEvY1opEFvet2QmYSM6QPzIqPJ+7AzjXCHvbmA0ZK/LRfmoNiz6j+fEyYfmYSgQ2nb5u/yZnYfl5XTYArK1T6tFdt/i+Nz69bwNo3Z3pS+FtoEjZ2hxwmmaJi22/39CZL8F2GF/psiXuVMHS7q7zgOzEIP7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HvQjxsaOotOgfA3A//lzyht5HWICMOY6jXnWe2s9Jlc=;
 b=MMflQTx/8F4RMmWN7qALra9n7+aV5jDfWRQfncFxCW6UPisJY1NH+/D0Zx7M7X/wsYZnP7SUDpx+gITD1sto4PfCUD+9UCsP67KHSdl3Bnpy8qTUqKszDaxpT7lGHRvixfNmPSXr8rfIXdWpaLhjJpK2rotuo+g9zD5fEMTuBhZthXqeUM3ixWWDgqoMVj3o6ShuVmBfMG20rdY69+jy8+MvNO16Zs/7/3D/OYdlEqCnGT3iC5zA3GmsDjmvGqbiiw075Az4EbfwmsZ9oPqyzVxNnkEpUK6/Wr7dYY+4K9ArsuTicsRRatcEoYCumIUBZ29WGCNJEfUtcpvojMNZVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
CC: Shahaf Shuler <shahafs@nvidia.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "mst@redhat.com" <mst@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>
Thread-Topic: [virtio-comment] [PATCH 2/2] virtio-net: Clarify the size of the
 struct virtio_net_hdr for tx
Thread-Index: AQHaE9MwidDLWG83gUqvsXqFcltN4rCm7FyAgAAELJA=
Date: Wed, 13 Dec 2023 06:23:35 +0000
Message-ID:
 <PH0PR12MB54818BCA16901BBF7668788DDC8DA@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231110124040.2093394-1-parav@nvidia.com>
 <20231110124040.2093394-3-parav@nvidia.com>
 <1702447371.5899365-3-xuanzhuo@linux.alibaba.com>
In-Reply-To: <1702447371.5899365-3-xuanzhuo@linux.alibaba.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|CH3PR12MB7761:EE_
x-ms-office365-filtering-correlation-id: c473d809-473b-477a-32a5-08dbfba409cc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 CR1lsEm10U8m1oBx0+YH6HN12D12YhNff0JdtckCQq+F+r1M7pMxLwmDs3usD+RIYbvCgLfmDlzQLM9mJp5BaqIrQpRNanv9j3wRlEE6Z0TocW2A1gCgT/3KHT2aX+sLmYN6FWklngtdAZpeE+GPbS2JWiTpRQTxN4bq5R9yHJBOH8Ovyq5aNJKRJgg8tAabM5l44eeNePhj1byT+QKJmZvK/+4Wx1MqNk9RbkpcjvcA/JrDdZ2HT8YNjGpz7/qGiAfg3UVH1L15MpRCjE6TgpYFumN+fxnYxnvY2rZIaGlubhmnu2eZ8ooI6QCXbCaHIdqJ/Sp6eopugrxmkv26nQswwrAZOY/9gmq8tFSSSYIB1q7wpZiarAR8T/lxIlMeAXAqhQj8CHTC1PLlrcPlfwsxn761SGSLXALLu9xGooe2RxsA2PvEItqqi6vI5NdBsoAdol+mZQazjlQfZbWenW/hnRZQ8ZhII2XJhScJdI4d12SIEr1Z47EqAqy7MUVHMu/FmdTlfQw3ml7JkjISaM1sFTYIEaP/aHgGUy+5FL9tbGs6jdGtqoAzaD/G17xcxOWBrql51EC+kg5rgNnAE3TdPcAMVNLXHZdjL8HUj5ZzFWwljdfmb3alt5Dkb+y6iVJ83RvuYiZ4pPSpGOybMg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(39860400002)(136003)(396003)(366004)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(26005)(55236004)(6506007)(9686003)(38100700002)(122000001)(7696005)(5660300002)(4326008)(8676002)(8936002)(52536014)(41300700001)(2906002)(966005)(478600001)(71200400001)(316002)(54906003)(6916009)(64756008)(66446008)(66476007)(66556008)(66946007)(76116006)(33656002)(86362001)(38070700009)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?62+gf9cFjTG4qQK1Lqma+BFH8lJFY9CB1TAVKZ+Qgj1KRcSYlwG9nYEfOyW+?=
 =?us-ascii?Q?cYlwGQJx4hVeIiLkxDq/VxGZ3MLVsPkLswrfgVt9lREO8PqRJwVucS0EACwP?=
 =?us-ascii?Q?pHU8fcDLYSDIzO9ouUvWW1VYYLaajbW7rCoA4FIlJOTBF6P2YC79ExYnTWgq?=
 =?us-ascii?Q?plZCBf7lntBtLS/mUPGp9jcqzU0vpbzgkqnoiabHcQHwx66Ih5yFHOeNWW7+?=
 =?us-ascii?Q?vYsPbm720tJK3zqU1fB8QXQI9L70yn2jJX5nHpM9bAy6WyNyEuWIvEpGf+HU?=
 =?us-ascii?Q?6UaMXBzcLAvFP//41UIAUwSuEpVqeIaJcTA9DvaL2QGs73Z34hd19BVNujJ4?=
 =?us-ascii?Q?whRBaGCeTY2C8DaLVRGxH50raxaJJ7JVbICUUhMPGI0V6uLz4hY1bVtYI6OW?=
 =?us-ascii?Q?xf6yuR5J+FPUfWMexncWRSQtju3XyZzMUdUNgMPh+KwR9sg6RRj8QjQEjVgP?=
 =?us-ascii?Q?Y96eVT7P6deQnEa5v0XYu4G1kFPnaqjyAzNwxaPJtOpoQ0Y89GHzoKMxZKci?=
 =?us-ascii?Q?6sN2LrqFFr/tFdJZIQfNu9dfSwwdc3507jRDR5eqskBjaIHAuQV3PwKKqefx?=
 =?us-ascii?Q?INp89CFkgf4gm9dwpZ3WNX6Ue4HIRwghNnCKXxRleDDxqwVERe32nDXl63LW?=
 =?us-ascii?Q?QdV0xGJ+ZpgTrjmWFlymV3WPJl/kPJCGf2kq2sYbsBdhW6/lCagBUTcHofXe?=
 =?us-ascii?Q?ktOIhZko/WRaPNiDn25lLGfBm9VQ9PpywdEMk+eGNbt6tAJ8PNTjn/zNzZ/h?=
 =?us-ascii?Q?OkAXIrxsWA4EwQehYmpDo0eeNpQUclSNXGcQO+OaEzSh/3xEpRvThSgEGXpS?=
 =?us-ascii?Q?pOWvkrx7prxr85lpb8hQsE1jxxGwC/f45r5Qo7tRa9Uz4CbmDWODcip57spA?=
 =?us-ascii?Q?QS39yfZ1w0bKI/Nxi14dDyZiK1SpkHJRI5rAEk6O0HgNZoDvVW1f+YNHuGZk?=
 =?us-ascii?Q?Kw+g5JZwOrjr+H0mSYJdbf1pfoJgcQhsdZuscTvSSKdvxRvAbodR2EiSfLiy?=
 =?us-ascii?Q?+UzSfL7OGlYhWHGbnq9vBvKGbPHUcaNCgbio9OOCiI+D8gCS6KA1ELYVoa9/?=
 =?us-ascii?Q?FQUo+oG3GgblxzFW049uKoZaCOZnnEfNZ/3IqDv0wqofG39Inu0bHULABlAb?=
 =?us-ascii?Q?RqSCldu6npcnJQPjEnm/klqIf1A2LRGUgY3jyF4hfvPbXiKHQKGsTPc7PvbB?=
 =?us-ascii?Q?pWmtGsQ6pGA86MkayRy07cP1c7jyS6L8oFztvRvBa02tG21LzmiJ+dBVRmW/?=
 =?us-ascii?Q?ISP2uetP4OiONzqkZUoTSUaAVFx2yfYFOogwAmlfSFXEXhKbepPeA/37EJg7?=
 =?us-ascii?Q?MQ5NqSNKQzJ7/Y2SFluOG+bsLdqhUm8OzLFLP05oduX81MEqpH3dCG3lbfhj?=
 =?us-ascii?Q?XqCtpgyvoXwhTyB94Ho6ZGpY6GzhIw4nRkbMc04RrF0zLqTMUPZVHFQh9meo?=
 =?us-ascii?Q?sdVt+DqbSKO/R2RePui0VwKRl1FwHHnZx0x9aydZHcUWkFNFV/J4czQnAnSd?=
 =?us-ascii?Q?pwbePLaGo3MdCXttBtC+FAVVzxpyhnG6Vg5ZOSKcYHXOUI3zZ7BqNvriKu75?=
 =?us-ascii?Q?rt+/7tUAOzlqYFkF1bM=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c473d809-473b-477a-32a5-08dbfba409cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2023 06:23:36.0076
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GBRKRm8545AszwmliYrru8p5cEaBTychggOuG4oa5P4+a2jljbjYVGexyU16xR2dJxccAQWdPSNqo/WdIwnlrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7761
Subject: RE: [virtio-comment] [PATCH 2/2] virtio-net: Clarify the size of the
 struct virtio_net_hdr for tx


> From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> Sent: Wednesday, December 13, 2023 11:33 AM
>=20
> On Fri, 10 Nov 2023 14:40:40 +0200, Parav Pandit <parav@nvidia.com>
> wrote:
> > The feature VIRTIO_NET_F_HASH_REPORT only applies to the receive side.
> > However, when VIRTIO_NET_F_HASH_REPORT feature was introduced, it
> was
> > not clarified that the size of the struct virtio_net_hdr on the packet
> > transmission also uses higher size when VIRTIO_NET_F_HASH_REPORT is
> > negotiated.
> >
> > Explicitly clarify this.
> >
> > Fixes: https://github.com/oasis-tcs/virtio-spec/issues/183
> > Signed-off-by: Parav Pandit <parav@nvidia.com>
> > ---
> >  device-types/net/description.tex | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/device-types/net/description.tex
> > b/device-types/net/description.tex
> > index f5647d4..00ea58d 100644
> > --- a/device-types/net/description.tex
> > +++ b/device-types/net/description.tex
> > @@ -531,6 +531,12 @@ \subsubsection{Packet
> > Transmission}\label{sec:Device Types / Network Device / De
> >
> >  \drivernormative{\paragraph}{Packet Transmission}{Device Types /
> > Network Device / Device Operation / Packet Transmission}
> >
> > +If VIRTIO_NET_F_HASH_REPORT is not negotiated, the size of the field
> > +\field{struct virtio_net_hdr} is 12 bytes.
> > +
> > +If VIRTIO_NET_F_HASH_REPORT is negotiated, the size of the field
> > +\field{struct virtio_net_hdr} is 20 bytes.
> > +
>=20
> If we need a new feature, because that the implement of the current linux
> kernel has the same size on the tx patch.

I didn't understand your comment -  "if we need a new feature" part.

Current Linux kernel has same size for tx and rx, snippet below.

        if (vi->has_rss_hash_report)
                vi->hdr_len =3D sizeof(struct virtio_net_hdr_v1_hash);

So if you are asking if we need a new feature bit? I believe, we don't need=
 a new feature bit for current implementations and behavior.

We will new feature bit in future to have shorter virtio_net_hdr on tx, how=
ever we better consume it as part of new inline descriptor format.

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

