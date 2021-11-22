Return-Path: <virtio-comment-return-2367-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B6A8C98625C
	for <virtio-comment@lists.oasis-open.org>; Mon, 22 Nov 2021 02:34:02 +0000 (UTC)
From: "Qi, Yadong" <yadong.qi@intel.com>
Date: Mon, 22 Nov 2021 02:33:57 +0000
Message-ID: <BL1PR11MB54797CB8056AFF0D99CFFF4FE39F9@BL1PR11MB5479.namprd11.prod.outlook.com>
References: <20211118025741.230748-1-yadong.qi@intel.com>
 <YZYcL6z83ltZ7u23@stefanha-x1.localdomain>
In-Reply-To: <YZYcL6z83ltZ7u23@stefanha-x1.localdomain>
MIME-Version: 1.0
Subject: RE: [virtio-comment] [PATCH] virtio-blk: add secure discard feature
 to specification
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
To: Stefan Hajnoczi <stefanha@redhat.com>, Christoph Hellwig <hch@lst.de>
Cc: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, "Chen, Luhai" <luhai.chen@intel.com>, "Wang, Kai Z" <kai.z.wang@intel.com>, Jens Axboe <axboe@kernel.dk>
List-ID: <virtio-comment.lists.oasis-open.org>

> > +\item[VIRTIO_BLK_F_SECDISCARD (16)] Device can support secure discard
> command,
> > +    share the same maximum discard sectors size and discard segment nu=
mber
> with
> > +    VIRTIO_BLK_F_DISCARD. Maximum discard sectors size in
> > +    \field{max_discard_sectors} and maximum discard segment number in
> > +    \field{max_discard_seg}.
>=20
> Christoph suggested separate queue limits for secdiscard. Please include =
this in
> the spec from the start.
>=20
> If the guest operating system does not support that and the secdiscard qu=
eue
> limits reported by the device are different from the discard limits, then=
 the driver
> can disable secdiscard.
>=20
> This way virtio-blk is future-proof and can also act as the first Linux d=
river to use
> secdiscard queue limits.
>=20
Hi, Hajnoczi and Hellwig
Do you mean to define a new field like {max_secdiscard_sectors} which diffe=
r
with {max_discard_sectors}?



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
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf=
=0D
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lis=
ts=0D
Committee: https://www.oasis-open.org/committees/virtio/=0D
Join OASIS: https://www.oasis-open.org/join/

