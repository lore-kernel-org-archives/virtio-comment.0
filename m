Return-Path: <virtio-comment-return-7815-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B356CDB47E
	for <virtio-comment@archiver.kernel.org>; Wed, 18 Oct 2023 11:12:54 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 67CC6613CA
	for <virtio-comment@archiver.kernel.org>; Wed, 18 Oct 2023 11:12:53 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5D7F498689B
	for <virtio-comment@archiver.kernel.org>; Wed, 18 Oct 2023 11:12:53 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 53758986899; Wed, 18 Oct 2023 11:12:53 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4551998689A
	for <virtio-comment@lists.oasis-open.org>; Wed, 18 Oct 2023 11:12:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NW4YtrJjCNO/AAJVNuqg9oY6EzGoafIdkBDHsDsICIPIwaJ2NNh4RowJHSajGqwPV4DEgiQEa0nkpTcm5IWgB0Ib6WeWtqvTpbJQcVNmQmerkLzVkxN1hkeTrVX8LzVys7LlW6w36gZsp4MtikL8Q/cX000QL2SuWlzHNDUjq0+ngCcZ67ud8NmfXbizlmy/ugiecUIuNoZe/5qlH//7xfWYdr2kyojY+YwN/yWLgLbdh+1Ty5zX+rObkcAdh8kXDkO2ccIxzjI6u2LqWa8YvQk2VOrdQqMLxGgo+LEfmUAfSgOb65Q4pvdKHUBF7mZcGhrvIjl6PFhfI44q2bVydw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GqL38XBbPRqgzTbToZ1I9kREd/jX0Dm5xlQdhem1eH0=;
 b=VJv6+kj0YM95ZIdF6Yrk559Z5gkzb8Er4HQXU22vOz7Qzw2/04lEtuklst8GHiRQnMyy4fV/nV8mT0WvQoTMutBgVZ6FWDeTQZ2vVbf0TtSJixFDvEgVpptJDAFJ808I+uzcdFyVcWADEU5GR+F9R7K/tJG1J3YDtPx6cECiZ9DC/bnOGaT0ixVOLcgZC21amzj5KKm9VdjUGrGy1T4XS7ChS2RQ5vfwBTBuf6dNiL6h//nWoNeKfRrQBYazNSbsobzzLLyb5ZLzc0j4A8UYMVj1uN37SxjiFOXuQLu40iKWhT2ae5pGoeShqFmF/ORUMV/EIBW5ygS8hsSeAak8Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Cornelia Huck <cohuck@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
CC: "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "hengqi@linux.alibaba.com"
	<hengqi@linux.alibaba.com>, "xuanzhuo@linux.alibaba.com"
	<xuanzhuo@linux.alibaba.com>, Shahaf Shuler <shahafs@nvidia.com>
Thread-Topic: [virtio-comment] RE: [PATCH v3 2/2] content: Support enabling
 virtqueue after DRIVER_OK stage
Thread-Index:
 AQHZ9O+eNF50SoOX0EKV5RZKM+E/zrBOABmAgAAC7YCAAW3ogIAAANSAgAAJ84CAAAB/0A==
Date: Wed, 18 Oct 2023 11:12:49 +0000
Message-ID:
 <PH0PR12MB5481DB9D38E58522F0B15EEFDCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231002051601.6626-1-parav@nvidia.com>
 <20231002051601.6626-3-parav@nvidia.com> <871qdte8r6.fsf@redhat.com>
 <PH0PR12MB54812DF4DB53917D4895FFCADCD6A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <87sf68cjn0.fsf@redhat.com> <20231018062704-mutt-send-email-mst@kernel.org>
 <87pm1cchuq.fsf@redhat.com>
In-Reply-To: <87pm1cchuq.fsf@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|CY5PR12MB6576:EE_
x-ms-office365-filtering-correlation-id: a7087684-ee45-4ada-ccc4-08dbcfcb2a4a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 PwLBOCEOTSQuEkL3K1iwDrPQwRJKpq55OcVhB3HBXt01mfSEppsRPOXdeH/3odTv5rqO3dy0nMRFi34zebClwy1RuwamsvoBQSAzT5RRvzwm58lCqQxmWZVXuA26uubqe/KbIDaBWPubRv5ulBbRcFTh+WBHZDhRgm00zuE26MsBOtQFUPJvpO5fFpP6ZjzIyYZwDViXatsF+tAlum/QHZEfv786D5oMfXzZ6kk05m+Ff5LqElPIi7vYYI5Y8WJWJmFKonj9rHrHh1I23XV/mduSt3xa6KnZD9T1ONtOBMfA7brqxfbtV+tbmJDmUZ07XCO2ODhuFlNUcvnWwggVGaRw9iKBLzapMfcoaykY+KcekRaB6orCkDYGgnaV7R2SsycfPS0xU4UeEnAnw0mVotTFlOvCD7W5i5YamMzV8kwOj0jCWR9czlWcZMgfmRr0C16jx6mvKrq71aW6D3dK+JR3G3y9FSFKKs8ZcJjidglVN/iSDnr2jzJ2HX7/nSONEjT3dKxc3ETbB5gXUGAZUMrnjfy6qAAdZBFwZf2rNGaN8d4TGZUvvi7wxeT6nYMAWu49Noufovx2xhHexWXKx+Z6tahp/XU1WUEO7N1gIK88SNlaEvFYTeR5cakM9I8Y
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(396003)(366004)(376002)(136003)(230922051799003)(451199024)(1800799009)(64100799003)(186009)(38070700005)(6506007)(33656002)(7696005)(38100700002)(9686003)(41300700001)(2906002)(107886003)(26005)(316002)(8936002)(64756008)(54906003)(110136005)(66476007)(66556008)(76116006)(66946007)(66446008)(86362001)(8676002)(478600001)(5660300002)(52536014)(4326008)(71200400001)(122000001)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?BMKESZOxn51SI8C5sqEmzgKm/wr3N0Y3k6rTey0reNEaCcR6hoCS3BSpitIZ?=
 =?us-ascii?Q?b6QVe0KceNLmLjx7LMCvSQK7FL4CxIPynt2ri/yqyrmDpKwEXK63MnDEfQ2d?=
 =?us-ascii?Q?b1ej00VYu1YTPewAzyZa13YnxY1FhOVzQ57N9LvKtLtqr/1ApHaAHoW7qrja?=
 =?us-ascii?Q?MhpwbcqZ6gJpSIYrm8/YYX6Z0TGWdmKIbtAWU4ey8lFDArsfcWqiTmxVdhmu?=
 =?us-ascii?Q?ZhsyF1vF6wNhKs+Q4tDRBSAmK4VnqmlyfxSLJQSODvHnDa30QOQ52vGEAzjx?=
 =?us-ascii?Q?H6mQzo6p//FIe7zf55rgBiAoUVXaBQ8I3o7F9/EwKOgnK3ofRO8ffR3oXU7/?=
 =?us-ascii?Q?KWYG2gLdpKgNhU1P1wjudquNsaCdG5jMYiNkQJgYN6L+Cs6ZNXyQM7q7f+Qv?=
 =?us-ascii?Q?yrgwrD4Viu6vDWRp1BJ6FMb62CxliwWQAelSjDtg3PO2IbzpHGt+pLMYWaag?=
 =?us-ascii?Q?s+FLXx1mvGKitpoXSR93K1W1cN4th1EasvB9sUcA4yfcmgb1RFVKTNcMzA03?=
 =?us-ascii?Q?dmDCeWRYkCLRPWogUQft24deHw11ZxTJHKB0I2onmXGXFoCjkP6qvGB1rHKb?=
 =?us-ascii?Q?PKdqYNoYMtmVfi8pb0kkF5jhvcOBFTvK3YbQpmt2JY6PSrJErgqgMkniINww?=
 =?us-ascii?Q?eEO3er21hjk0dKAhsupE9bZ1KxMy3dqllcqW8K2t/ZtMH8dZ/a5zk6fX8XEC?=
 =?us-ascii?Q?yF1/IC8T45OXy8hJvgejgdY4SQ/x4n6qiy8/ELXCAt6fAlOCNfczoxOyvK6s?=
 =?us-ascii?Q?pFG1orcm9AE8DoV/F5/3Yr8PxQXqU0FJxPY5DxZ6q2DzxAdoWesYtuCE6kb4?=
 =?us-ascii?Q?7z6zMlOGfrZcq12RDf+EiYTXJSnsLXqACvIMNylHe7j1R1jFznOr2xXb5BVf?=
 =?us-ascii?Q?3E/hfdxT5H27Hz7ZLUcb1fJEZY/VRHpbHiKw/yoFRsYSbe1qR5EGQabKjHOS?=
 =?us-ascii?Q?iCuyFkT2oM6DE3vYWVskLE7R+rtcdGBmZvEbSgeEe6YstXWDvSNLhGLkHEmB?=
 =?us-ascii?Q?+4umHJfmUscdYZ23xcRKrCxlCq04KRirXZupiWlto+s5RP6gMrVLiUvBQYh/?=
 =?us-ascii?Q?ProW1xh3u6VWdAIsASPuKWgq+LzSYF2NoTmYl7bB8SrsKbwuPnHzSWOksudR?=
 =?us-ascii?Q?gyiS5JjhIbhtBmUaJ7sXZz6o4uLjTzGw0DND8C0xUOqPpWuqh9wpDYr8m+is?=
 =?us-ascii?Q?j9nlnNfyt40rnKkajJYuuwRKWqR3oGdsyCEb8E7S5t1iV4+fwnNZcwAB5Vtp?=
 =?us-ascii?Q?LSOSA2uzb1QtZ121y3HJcyrnUbth3mApQwhHixHG26SeJTU4IBYa2yjzYzKt?=
 =?us-ascii?Q?p+p82/dcijbNbEUmBPwH43XmnvGzyyz7vwFMOWwA8TzNfA7lJCb/bAabgKhO?=
 =?us-ascii?Q?t0oqKrvGfxWH4vJmDMc0N3Fok07iK1k0lGLk6roLELD1EjMLgC4vzHpo/MTs?=
 =?us-ascii?Q?/nCk3J9Ptwe1dj0XwvsQnOkJMmPvQbpXTkHF1QlMTkpZJQECmoEgrG9ci0XB?=
 =?us-ascii?Q?tPaKVv5AbtH84l6fgHO2MmmasJDj19joVimM9ivxx/NF5oaHhgkoAzDrkDx0?=
 =?us-ascii?Q?6PRQmJILvaS2ztK+HY8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7087684-ee45-4ada-ccc4-08dbcfcb2a4a
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2023 11:12:49.7337
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PFl6AKaVjoRsIWbNjGUf/XWMy1mWxC1qktKa+Zt6+g3eGgBD++RDYkTW20corVpW4ro2BDes2r1qHMh+RWCfNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6576
Subject: RE: [virtio-comment] RE: [PATCH v3 2/2] content: Support enabling
 virtqueue after DRIVER_OK stage



> From: Cornelia Huck <cohuck@redhat.com>
> Sent: Wednesday, October 18, 2023 4:34 PM
=20
> On Wed, Oct 18 2023, "Michael S. Tsirkin" <mst@redhat.com> wrote:
>=20
> > On Wed, Oct 18, 2023 at 12:25:23PM +0200, Cornelia Huck wrote:
> >> On Tue, Oct 17 2023, Parav Pandit <parav@nvidia.com> wrote:
> >>
> >> >> From: Cornelia Huck <cohuck@redhat.com>
> >> >> Sent: Tuesday, October 17, 2023 5:55 PM
> >> >>
> >> >> On Mon, Oct 02 2023, Parav Pandit <parav@nvidia.com> wrote:
> >> >> > +When VIRTIO_F_RING_DYNAMIC is not negotiated, the driver MUST
> >> >> > +enable the required number of virtqueues before setting the
> DRIVER_OK status bit.
> >> >>
> >> >> What does "required" mean here? It just chooses to enable the
> >> >> queues it wants to use, right?
> >> > Right.
> >> > Required meaning, whatever number of queues that driver choose to
> enable, those must be enabled before driver_ok.
> >> > So it is "required by the driver".
> >> > Would that be ok?
> >>
> >> I'd write it as "the driver MUST enable any virtqueue it plans to use"
> >> or something like that.
> >>
> >> (...)
> >
> > It would have to be SHOULD - we can't add new MUST requirements not
> > contingent on a feature bit, we can give recommendation based on
> > existing installed base.
>=20
It is not just installed base.
Spec clearly says that:
"Perform device-specific setup, including discovery of virtqueues for the d=
evice, optional per-bus setup,
reading and possibly writing the device's virtio configuration space, and p=
opulation of virtqueues."

There is no feature bit or any text that says "population of virtqueues" ca=
n be done later outside of the device initialization phase.
Only reference is _F_RESET bit which is only for re-enabling. (not enabling=
).

> Then I wonder whether we need to add any normative statement at all -- pr=
ior
> to the introduction of this new feature, the driver had to enable anythin=
g it
> wanted to use before DRIVER_OK, and if it does not negotiate the new feat=
ure,
> nothing changes. Spelling that out in non-normative sections should be
> enough?
It is already implied in the spec that queues must be enabled before DRIVER=
_OK.
So what is written in normative is not changing any behavior.
It is only making the implied behavior explicit.

If it says SHOULD, that means, one can enable the queue for the first time =
after DRIVER_OK stage too.
And that would violate the "Driver Requirements: Device Initialization".


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

