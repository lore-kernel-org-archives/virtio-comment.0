Return-Path: <virtio-comment-return-8394-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4868CC197A0
	for <virtio-comment@archiver.kernel.org>; Thu, 16 Nov 2023 07:02:27 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 9F44922367
	for <virtio-comment@archiver.kernel.org>; Thu, 16 Nov 2023 07:02:26 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 86707986DD9
	for <virtio-comment@archiver.kernel.org>; Thu, 16 Nov 2023 07:02:26 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 70B75986DD2; Thu, 16 Nov 2023 07:02:26 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 60C80986DD3
	for <virtio-comment@lists.oasis-open.org>; Thu, 16 Nov 2023 07:02:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KALuFp8toBw1+0S8Kwa409boZTGgT3SOZDvdvgfHf/mTagrCe8hIQHV2OEjlbdL5id+YP6BDcxK0O6JdJ/x6GYXprE4I2cHTDSJMEni4fsDX5YKNo1zzajh5xUXpHWHwxyeXQGkd2zT3MZ9VcGWc2wAM0SbWuejlqUq+6tL2pF0FSqFkSp4wSCpPhrfNRdmCWRcKCoQFZ0r/GV0TwvCbqEN3o1W1HvEk1WnTzQ/RWRYqAI/5JPayKJd7XhRhULuAGMTZ/p6BJC4Ux7b41ZMAM/GAO5nSIxjnrrIrBOVS0EXQ7N5+GK1E4/aq3qTqqKXQ75/qlZclSgufl+pJDSH3VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CAAGTujBDy0oZkZt8Fnx/HW/JxlY1lhLXqaSw6eh1Co=;
 b=dVrrlvyZjJcoTQj29X24Z8Mzl+GX5V4+HtWtSHFJwXCcDngYu1ucvR9iurcRE3Xn8ycqBu0h71KjU1evsJIzJUIUx0Qxp3qGoN37DQdp6Otdz3n34itLJaojrPSt1r1uQKyslo/4gW1cN6N6dh25GGQuMnYACIVAbWPk+2gMPqknAIWoMyJDlFqTL/DPlYy8W7ko31UcUrZh7NPxFtvaf4eOulcynFklj6IhGkh76BJueWxLf+sGz5cJrxguhyFP/aXkSzLWC7okkvW2DNCSlLKzOtbAGqPJ49qoSKS2cFBQ5Bt6plK/y87/UBipdKJjDz15B6h7sU1Fkatv6Lmjdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: Jason Wang <jasowang@redhat.com>, "Zhu, Lingshan"
	<lingshan.zhu@intel.com>, "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
	<shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas
	<yishaih@nvidia.com>
Thread-Topic: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration
Thread-Index:
 AQHZ+dpD+jj/KUeLHUaMn2y+w39Cb7BBJzcAgAA1HlCAAEi6gIAAERjwgAEF2ACAAAjm4IABoeMAgAAIQWCAAYjxAIAAAHqAgAD5sYCAAEjPkIAGCquAgAAYNlCAAWk/gIAAN7kQgAF48YCAABlCkIAACTkAgAALvzCABizrAIAAD2aggAGUBACAAABcUIABWsEAgABcQLCAASo6AIAALsiAgAZSfICAAAYzAIABYc4AgAA+ffCAAULTgIAALVPAgAGlyQCAABp/kIAGUuiAgAAFiECAAWL9AIADJo4QgAY+aoCAA+XikIAA3lwAgAAHcaCAABr2AIAAAQ0QgAADOQCAAAA5AIAABMUAgAAATUA=
Date: Thu, 16 Nov 2023 07:02:23 +0000
Message-ID:
 <PH0PR12MB54816851C613AAC9A34A7FCDDCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
References:
 <CACGkMEsMzp7DjDkQcO4RZ0H0HfxSrytUJrSyDj6gnPWV9cTZow@mail.gmail.com>
 <DM8PR12MB548085F25849CF1E055826E6DCAFA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <CACGkMEsfcEjue1UZmuNs8k65o3HSM94VsweSbWLH3383STR97A@mail.gmail.com>
 <PH0PR12MB548149E1E51DA9C1C094ABCADCB1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEt277yYUHf98dCkypS-PXzu7JrRSVBAQ2cCRg4XzCLPzw@mail.gmail.com>
 <PH0PR12MB5481DB04DEB1A540185ED1ECDCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231116012208-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54811F4CE5686AE4BEA826C1DCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231116013650-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481D1A55E02DE4FB63E62BBDCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231116015424-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231116015424-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|DS0PR12MB8070:EE_
x-ms-office365-filtering-correlation-id: e3279b11-5a82-48f7-3bed-08dbe671fbbb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 GgXhAmuVVIPIuER8JqWIGVPPPhWaZuEkyR+5+vsAC7wZCd3sPfB+PjtKdpuRR/J5TQzzkd4QQbMY9YR+qYfp8JCAA+NR/z9l6fmiFQ9FB6fVFL051KURlH/mQXh40YD8HcYT90WI+AtBUM+94C0xUNWyBAc0xHfpaGtUIDLqgME/sDtWNB6Y4cxKgXI8xXDl2SEfrFRQpNmQp3sBnTPP+y+c9bFN7hU3ep++ze/znpjmUhjZTH2sK/6JA8WzyD7iSsj9CutxzJwyw3obsUqek1z1Jn9AS3sI0e0kX+jUl79mnvZamwcMp64/aXc+pvrqcNaCmFVybRAexIrWOBkhZnO7Isrg2AOS4TzCPBKEhR689XQI33BH4B8yqkbX4EfnaLzv8VKl6Cky31mupNMGuuvNTP6InTZKPJcejHbHJqEGr02tMytlrHeh0BR0tYRuOfkHevYhlzf128wT2tNullQ+wax8gPvUERDE+LSFzoccmmTOgo0wSNLBxznaMw8E3xWo9AoLPLUz3kPYyE5TPtv1B1W0uoi+UvlNFxpzRJT7pcKw2NijUKRsZ1Ie0iqIx86AM0t6Lfc9rFMlnMIE1rykiyld3UodjZlFo/Ib5mwH/37wH4aD4ohjObRgnT8Q
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(366004)(396003)(376002)(346002)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(2906002)(71200400001)(41300700001)(33656002)(86362001)(122000001)(5660300002)(316002)(478600001)(55016003)(76116006)(54906003)(66556008)(38100700002)(66476007)(64756008)(66946007)(66446008)(6506007)(7696005)(26005)(38070700009)(107886003)(83380400001)(52536014)(6916009)(9686003)(4326008)(8676002)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?OCTLk5GW/j66HdxZsKrdLU8nCPkjTxpr0mH5rEMncxowP+TdC+n8VdxrU9rL?=
 =?us-ascii?Q?CbT718uLv3Y7Qje9UK/d1Mrsh1jOsIx4X2b7wtW6N/2RdRoAj5a72g7CqvvL?=
 =?us-ascii?Q?Bf1l5NnVrtNc8RgptdTUu0o4ZUPUqsSuuydo1PL4cKT/FzOQqt4IoP692vDV?=
 =?us-ascii?Q?jpEx63i/5SWZNAo2U61a3brzXHHDoGeUCjS7dueYa588gcRHoDcSsg3+Pwr7?=
 =?us-ascii?Q?Q73fX2vN+/sesiEGlqcRdG+ZDwfc1iTVf20wzP2pgkETGoUBNBLOB4w0SIQJ?=
 =?us-ascii?Q?ztSsQeuAXdMiuvP9xmT66NzIzjwRYu6NoqzsO9yCDdDL26FmoSXIKo7cot3P?=
 =?us-ascii?Q?/8BPSlRB7UnLaVv06LWwMk7cy+4f39bThOjYOObPlq8tXDmTkZ+FWpMuTXRG?=
 =?us-ascii?Q?3s61kT2qMj9g8ub56F2klXK6h7BHIegeUXHRuYdTXOD32c9vEGad3QhBpzjM?=
 =?us-ascii?Q?0wg50FJX1rrjiTw1tg9eCcRK9njMENagBZyydEkm1WbZb+aCY/2kz3Ndy/o7?=
 =?us-ascii?Q?L099coKzoAipo6oHXnOzyxOBCZVsl0b88XC9ehv/3b9Sw1d5VNo+EboE6mKv?=
 =?us-ascii?Q?lUrkoYaBdg+jIhOb4n84hznxAQg3fDj7C5jXFIGCLWz/HPqptAf0M7vUbFKM?=
 =?us-ascii?Q?o36V/l0+DuttxLbBybfmMyWijCBjdM4710AXy1hbHSxeJlHA5zav9LkO0yQL?=
 =?us-ascii?Q?Mx6QKSU/6m3EUDMixjov9GxNvQQohcH3ko3fjy0/aVRT5xSNf8HbJ89Vxlbw?=
 =?us-ascii?Q?3g2jXTM0ge3OtY4kZ/fRiMuvC0ZyxOJq3IzmieCqYTsBv+HMPhLYtRMN/QBF?=
 =?us-ascii?Q?N6DLIh5PxaZhM9ViJXxiek6GzsfIxraoEAHWUuu00h8dmSw3UMkBL14Lz863?=
 =?us-ascii?Q?8XYv+pIN4oIfLf6kqYI1NNc1B8wCWneqSP5054uyo+8OYI1GJjwDaHAIqONX?=
 =?us-ascii?Q?6VOktXu4d8svsJXIId+xN+3zOoy5Ybt9WVPZdM+pBZb7PgkKelej6rc58fyA?=
 =?us-ascii?Q?SV7kBRezpi88ZcDpLZ3JD0b+/GsvJoTTPXimVGI3u23TQyBO+qtx70BIeeCb?=
 =?us-ascii?Q?wxw2QsmtLYn41si5vq/CFJ+fQewIUUkbw5ublmmR0hUsvMewNwUFo/jCxKXu?=
 =?us-ascii?Q?mYFA6lxqd/C3YOV+wVOZ9f/eRP03WJJEZSRkqM9AhxEp7oEIqs+ovhMXGJhP?=
 =?us-ascii?Q?lq+NFJR2VvcCnWhXslcEmwQEtAQzFuO9W86FoSa6sGUN8FKNb0It9hz8xwfU?=
 =?us-ascii?Q?DsEBjex6P0bNv6EC8yHWygFGY26fs4XCTBPFNVTkD0plXNc9xOEkINv1sUCF?=
 =?us-ascii?Q?L+WqaAewVewHFoNjqzVlphtB4RdXRaEKtpOcP3dHXsLXOklWTQoKD1VroZSc?=
 =?us-ascii?Q?hkshSbFJDPlNuDNkOWy1y61JUHhwuwwdu+m1qXeMAACo77Xx8stY8eW9e1mt?=
 =?us-ascii?Q?FPtKUCCfEMJaLY1I7dEdFM1ViultgbNGEwhhQ9lSPf9NB6hqRA7ZzWChy1zq?=
 =?us-ascii?Q?jU0Bywf6M1ZmIJITG2coBbO2rBNNK6QYpIBG/KLcTBPSJj427Dt6kMR0zZri?=
 =?us-ascii?Q?UsLVWyt1RfiHxs690+8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3279b11-5a82-48f7-3bed-08dbe671fbbb
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2023 07:02:23.2034
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DTTqOYjgNGd+IjhWiowiwOec4zsoJvqrK5tw4vlPTmw4wsu72OBwhTPzyv/PZkkRW1Q5qedaBHigi3KvNSdsWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8070
Subject: RE: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration


> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Thursday, November 16, 2023 12:27 PM
>=20
> On Thu, Nov 16, 2023 at 06:43:05AM +0000, Parav Pandit wrote:
> >
> >
> > > From: Michael S. Tsirkin <mst@redhat.com>
> > > Sent: Thursday, November 16, 2023 12:09 PM
> > >
> > > On Thu, Nov 16, 2023 at 06:34:23AM +0000, Parav Pandit wrote:
> > > >
> > > >
> > > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > > Sent: Thursday, November 16, 2023 11:53 AM
> > > > >
> > > > > On Thu, Nov 16, 2023 at 05:28:19AM +0000, Parav Pandit wrote:
> > > > > > You continue to want to overload admin commands for dual
> > > > > > purpose, does
> > > > > not make sense to me.
> > > > >
> > > > > dual -> as a transport and for migration? why can't they be used
> > > > > for this? I was really hoping to cover these two cases when I pro=
posed
> them.
> > > > For following reasons.
> > > >
> > > > 1. migration needs incremental reads of only changed context
> > > > between two reads
> > > >
> > > > 2. migration writes covers large part of the configurations not
> > > > just virtio
> > > common config and device config.
> > > > Such as configuration occurred through the CVQ. All of these is
> > > > not needed
> > > when done from guest directly via member's own CVQ.
> > > >
> > > > For backward compatible SIOV transport, one may need them to
> > > > transport
> > > without above two properties.
> > > >
> > > > 3. None of this transport is needed for PFs, VFs and non-backward
> > > > compatible
> > > SIOVs.
> > > > Each device to have its own transport that is not intercepted by
> > > > the hypervisor
> > > and follow the equivalency principle uniformly for all 3 device types=
.
> > > >
> > >
> > > To clarify. Above seems to justify why the admin commands for
> > > migration must be distinct from admin commands for transport. But I
> > > don't see why (e.g. two sets of) admin commands can not be used for b=
oth.
> Do you?
> >
> > I didn't follow, "used for both".
> > Can you please explain?
> > Both meaning,
> > a. for device migration and
> > b. for transporting configuration by owner device on behalf of member
> device?
>=20
> Yes, so one set of commands for migration another for passing config spac=
e
> accesses. We do in fact have admin commands as transport for legacy, do w=
e
> not? And in this model we can have new group types, e.g. SIOV's subfuncti=
on or
> even a "self" group.

This is only need for backward compatible SIOV device.
And I am not sure if one should create such or not.
In some internal test we see device and platform tend to saturate at variou=
s levels beyond a certain scale, due to which building backward compatible =
SIOV is not very useful.

For non-backward compatible SIOV device, PFs, and VFs all the configuration=
s must be done directly from the driver to device without mediation layers =
as listed in above #3.
Hence, there is really no point in doing transport VQ for future.
Each device doing its runtime configuration using its own transport method =
solves scale and security both uniformly across PF, VF, SIOV.

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

