Return-Path: <virtio-comment-return-7408-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5F03EE021A
	for <virtio-comment@archiver.kernel.org>; Thu, 14 Sep 2023 02:55:59 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 2D3002AC50
	for <virtio-comment@archiver.kernel.org>; Thu, 14 Sep 2023 02:55:59 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 16C7B986642
	for <virtio-comment@archiver.kernel.org>; Thu, 14 Sep 2023 02:55:59 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 04A77983BBB; Thu, 14 Sep 2023 02:55:59 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E84A0986639
	for <virtio-comment@lists.oasis-open.org>; Thu, 14 Sep 2023 02:55:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WyCNnVKqmbreaYwcwVxxfdDpSCH27qxWO/JPF38M0lybfHTB1z2oInyJJdS7GDt9TW5Q7Rk1BYr/GeDFsGAetDPg+9sNMBXnUZg/OMWtvLIZ0jYvgYAmRxjkAglMBeFKFld7nrxTb2m0WphOcm+q2U9rjq+7twqBTIditkX1ZYTqXXdrXkcHsmW1NWZlkxLHVFY44QCSVj50n2vXjsIZodb1XwhObNA4EnMsf/rQVWMf3xaKnmAwDzKmGcDdWg73aorrCEMSv/ZjkQA+uApeqyJix4d8z8JP2ZtIeN5bWP4HgzAkRsVltyPV0Y//xUXolN0QpqycPHaiFofqzM6bqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tjpRS9A0oWlAIoCwcSfyYXaL7WX8Z5A5pbYuqjYLHPk=;
 b=HN8Ol7wPoaSlYS7RU+O3fo/B4pT31+Uy4u2K314sxTScptelZK//ZWzz6vm7v+iqW2tfCpTx6AdosYv1rbIewxlCXGKM9aSxQG/dUYU5DXA75WNXzcpE2NrNlhz/TztLckGIdPI3fOaYr39AKADeFJ/uPimeKRRAJWtYoLo93dVpSIlqLb8ZCOfB487ZcAR0yb521gjO0pu1cI7HrItu4twook4atYRuq6q9t8ihW5gmI3GjupE0esioFBRHl5qtKyVenPv/DOl7kIeys+u3/lTy+uV4IiTS/WRwWGsSdv/KN/M/uH6pz/zcoojbS7KQj8gkZaJYDQTfnaH2418nWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
CC: "jasowang@redhat.com" <jasowang@redhat.com>, "Michael S. Tsirkin"
	<mst@redhat.com>, David Edmondson <david.edmondson@oracle.com>
Thread-Topic: [PATCH v17] virtio-net: support device stats
Thread-Index: AQHZ4VFcizzRxaDjyk+9nFKWIkpGi7AY5kXwgADC/wA=
Date: Thu, 14 Sep 2023 02:55:56 +0000
Message-ID:
 <PH0PR12MB54814C19D1B97675FCC56FBCDCF7A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20230907060546.12730-1-xuanzhuo@linux.alibaba.com>
 <PH0PR12MB5481C32DA10A84488E421328DCF0A@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To:
 <PH0PR12MB5481C32DA10A84488E421328DCF0A@PH0PR12MB5481.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|BY5PR12MB4209:EE_
x-ms-office365-filtering-correlation-id: 5cbae3f6-eaa1-42e0-5254-08dbb4ce1e13
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 4TNHhkoXM2KbSQYrDfIxdCqFQM5XsxmYiNZTqRYEEMTrA89OsiZTa4KFHkHYBGPsjUyuK4bRIaR8k0CN/oW1KDVV29fbhjFybFTzQ3Ky7nO0wqdMLzY5kAqx2rVZCChdPB23a3qZDkoScYXRRqU/mzoWbXvePkujiw1PXH3PuLup/NC1tc818KqRqmLb9NG7sIN7boRGpAg7XCPqFrYnYiMkiCH432xOdIFQFKv+qLu7nW37pvFW1Jjvq/ktJ7rRXEa93T4hOS2vUGrCpmiVIfxq9SrB7b2w6q95W4YCfy8BCxccg+hV4h6bnHj40PIAkqsL/oDpjbHBEd6ocmT9x3+xCDNkRmKz/sPgZlYuWVD/3UeXraPdsvztsM/pMZtWhCozhuK5ef7NMFn2pFBjC4QJc4KyOMMXUFsSutKxASWh+RtoeFA44d1OLIezb44q8kYsTgxVhLHgmx/AzKQ+sG8Z1RvGSpgPGf8tP9LEYQ+cvZhYx8aGoh0mzBY/lwiSP01JCHHZK0id8bRFPqby5cSV+CSQJZo36LZdQ+TuGTkV/L4eZde6DX+9ZhG2ckrT5jkPeaNfk20w6IFSxl0bdAJXbLBdAN8MWfNKq/O10gCyrcq6n4Vxge6Egfvrw+k6
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(136003)(39860400002)(376002)(396003)(1800799009)(186009)(451199024)(41300700001)(8676002)(4326008)(52536014)(8936002)(316002)(110136005)(5660300002)(54906003)(76116006)(66556008)(66476007)(66946007)(66446008)(64756008)(66899024)(2906002)(122000001)(38100700002)(38070700005)(83380400001)(55016003)(9686003)(33656002)(86362001)(478600001)(71200400001)(6506007)(7696005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?j1BSAk1kUFfvFy5mPgyw+wJJINfdiKEghdBs3bzlTFF/Km7WyD3k7uqQHsEa?=
 =?us-ascii?Q?FRVpO3xZzN8+IaTCbYE/F5rzQCWuxhzoz9WRRza19nZ8lEKNCq0cvKdEaKFw?=
 =?us-ascii?Q?KFDWh/6EpP/LoaAz/ryvx+43xiOF01ojypxj0XW7ciQLo+XBU7GOkGH41pba?=
 =?us-ascii?Q?TptcLOj0Gnn2R1lcBpRwhzV6ocW7bC+Gy1buEN4jDv0ExAe/DrTnCiszTgh2?=
 =?us-ascii?Q?GlIrVJ26AP2cGvX2QAAd7L5vVo7opwEwkZ7zH2+EUx7RQIhBL3hezA65HSwM?=
 =?us-ascii?Q?3g4YyuHFvDMfFE+LYvS8v8nzjGPVLVouh1dzsTgco9Wv/UNceAPH6G07VzqN?=
 =?us-ascii?Q?cTogstsCTz0wKUVJVjBI82WvP1nFDvlTKFgIiknO8891cXid+3M1DKyNnIpM?=
 =?us-ascii?Q?kIEyAc9T00HSQoVDw1o5Qi8HVrPL5wddDy9QFREHT71De47fDgJtM/yNgxfK?=
 =?us-ascii?Q?VXJaBzothM8bIdrV353uJ7i7gnqaRE5heQ+fwg//8ZXhkIF7JrXR6ltiveuC?=
 =?us-ascii?Q?+WkJXJWLhuLJ+xsmYauJPWi+t1tBsZYG11HIdWe22FqBuj4xWbHQZlxKR5lr?=
 =?us-ascii?Q?nooVnpI2GkFOm54WhH2Ajh+krtF5AY8kfDeqCWrKRFqgHYsbBrRdwEl6FQns?=
 =?us-ascii?Q?WuGVl8ferEOnY74VSXWrrrrSs9uRAR9fCbo/JJbdaQLVT7iEAvy6nzayeNWf?=
 =?us-ascii?Q?MPnTTcLd4rc2q65m41SnqVkIy109IOHeCqITTQf/qw3QbiYVKvKC/PZ1Xzf1?=
 =?us-ascii?Q?otu96u1YGjMwFwQK/dZXXD+gEHqmB84m92fCzkQLG3/q6YYE7VtsLw2aHgnK?=
 =?us-ascii?Q?zBs/vvUPLEgnnfe9acCFY37+Hh+5gVFoi05lsCIJ1XUELJm2Z2swj+DcG3Uq?=
 =?us-ascii?Q?/LE3Rk9LseQCxWlZEdPcZeis1VrptT8WaYYae5X61zsGOR6dXBLDpa/rNp2R?=
 =?us-ascii?Q?ip407nfrSpj3wcjw8cyhvWd/+lThQKfmoch13l2cVvOfLO1IqBE4I+Ii63oH?=
 =?us-ascii?Q?0VCVpgmc0dWPQOuEno9f5n3/K6hAzS0DPl2OfSPZpwubHBdJ+00AIZrjOUMt?=
 =?us-ascii?Q?mUtPjJ+1qVevnQIW+I64oB1V+Sd6STTTSbXzO+vaZkEfHDig0VbFLHDssJvh?=
 =?us-ascii?Q?A3eVwoM96Qc8tKH3JYDrX/i4AF752CAxI/Z07u/IfOe5dTxVZ6Vibf6qcUYd?=
 =?us-ascii?Q?JP5UGNzA1YUPrIGZLOp3D3dVQpL5kdV16QpPSAwofAZticqu89CimHlu5rEs?=
 =?us-ascii?Q?QBCqtOMOspNBR4p6GE3jqTxkP177tAeDUICeuj6MvNCTexbm0QsGtnigQNmP?=
 =?us-ascii?Q?Ibu8R2PTwUVksFp9XBvHrIhLpOe6nNjrX5zlKZV3LdwQPv3kxPQ4wRO579u0?=
 =?us-ascii?Q?J3V/L3dzuL8vkL4dZjzD2S55+TGD/jk1YxQKauyDMiav+UB6w9VwPLPBza2l?=
 =?us-ascii?Q?CXEriyJRqIKLf1YCKRRgu0BhNZwXCe4jK9tX6FDVCromoKzOIFbYWPvsG6Fq?=
 =?us-ascii?Q?LMQz5yAXGUrBGpITB3pEvcIm3i5M22n2kpsJqoqAWPOfpsjoapbK8mb8mzuN?=
 =?us-ascii?Q?f2bV8hkuuqfbybzEo37F2YZpEqQWoShSCVPfNKnnAcXbGejZM+kGG1jKmIff?=
 =?us-ascii?Q?rO6T36TgH09u99q4vu+xH5vT4fhJDofpXkcV1io3KwZX?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cbae3f6-eaa1-42e0-5254-08dbb4ce1e13
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Sep 2023 02:55:56.3907
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y4e+SgGwkMv1GmnKsW5TMDa8TIE9FW6ZplA4WOo/rZ0Mchs2WN8tu9BUZaFDzS6umOgdxstSQFrlNPJqmuWmLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4209
Subject: [virtio-comment] RE: [PATCH v17] virtio-net: support device stats



> From: Parav Pandit <parav@nvidia.com>
> Sent: Wednesday, September 13, 2023 8:55 PM

> > +struct virtio_net_stats_reply_hdr {
> > +#define VIRTIO_NET_STATS_TYPE_REPLY_CVQ       32
> > +
> > +#define VIRTIO_NET_STATS_TYPE_REPLY_RX_BASIC  0
> > +#define VIRTIO_NET_STATS_TYPE_REPLY_RX_CSUM   1
> > +#define VIRTIO_NET_STATS_TYPE_REPLY_RX_GSO    2
> > +#define VIRTIO_NET_STATS_TYPE_REPLY_RX_SPEED  3
> > +
> > +#define VIRTIO_NET_STATS_TYPE_REPLY_TX_BASIC  16
> > +#define VIRTIO_NET_STATS_TYPE_REPLY_TX_CSUM   17
> > +#define VIRTIO_NET_STATS_TYPE_REPLY_TX_GSO    18
> > +#define VIRTIO_NET_STATS_TYPE_REPLY_TX_SPEED  19
> > +    u8 type;
> > +    u8 reserved;
> > +    le16 vq_index;
> > +    le32 size;

Even though we are not doing the switch logic at present, we keep the doors=
 open for such advancement.
Most of the counters that we deal here will be applicable on switch port to=
o instead of vq level too.
The only change would occur in future is: instead of vq_index, it will be s=
witch port number for a VF etc.
So please keep le16 reserved adjacent to vq_index.

While doing that, to keep the header in 8B boundary, I think we can limit t=
he size width to be 16-bit.=20
The reason is, even though, 64K device (switch ports) sounds a lot today, i=
n long run it may not be.

So 32-bit for resource identifier( le16 vq_index+ le16 reserved, or le32 sw=
itch_port later).
And 16-bit for size, that enables to cover 64K-1 =3D 8K-1 counters of width=
 64-bit a given statistics category, which is also good enough and expandab=
le to more categories.


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

