Return-Path: <virtio-comment-return-2394-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D48EF9864A7
	for <virtio-comment@lists.oasis-open.org>; Thu, 25 Nov 2021 09:05:52 +0000 (UTC)
From: "Qi, Yadong" <yadong.qi@intel.com>
Date: Thu, 25 Nov 2021 09:05:48 +0000
Message-ID: <BL1PR11MB54799096EE4A2C195B0475FBE3629@BL1PR11MB5479.namprd11.prod.outlook.com>
References: <20211124024757.742884-1-yadong.qi@intel.com>
 <YZ4UIhAXoJOqd6Ba@stefanha-x1.localdomain>
 <BL1PR11MB54794413B1C9336F723B1ADFE3629@BL1PR11MB5479.namprd11.prod.outlook.com>
 <20211125060804.GA645@lst.de>
In-Reply-To: <20211125060804.GA645@lst.de>
MIME-Version: 1.0
Subject: [virtio-comment] RE: [PATCH v2] virtio-blk: add secure discard feature to
 specification
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
To: "hch@lst.de" <hch@lst.de>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, "Chen, Luhai" <luhai.chen@intel.com>, "Wang, Kai Z" <kai.z.wang@intel.com>
List-ID: <virtio-comment.lists.oasis-open.org>

> -----Original Message-----
> From: hch@lst.de <hch@lst.de>
> Sent: Thursday, November 25, 2021 2:08 PM
> To: Qi, Yadong <yadong.qi@intel.com>
> Cc: Stefan Hajnoczi <stefanha@redhat.com>; virtio-comment@lists.oasis-
> open.org; hch@lst.de; Chen, Luhai <luhai.chen@intel.com>; Wang, Kai Z
> <kai.z.wang@intel.com>
> Subject: Re: [PATCH v2] virtio-blk: add secure discard feature to specifi=
cation
>=20
> On Thu, Nov 25, 2021 at 01:04:20AM +0000, Qi, Yadong wrote:
> > > Is the meaning of secure discard widely understood or does it make
> > > sense to define it in more detail?
> > Good question, I think I can add more detail. Where is the correct
> > position to add such detail? How about add it under feature bits defini=
tion?
>=20
> Secure discard is a weird linux-specific term that we certainly would not=
 pick any
> more.  secure erase is much more common in the industry.

How about VIRTIO_BLK_F_SECURE_ERASE and VIRTIO_BLK_T_SECURE_ERASE?
And new fields name: max_secure_erase_sectors, max_secure_erase_seg,
secure_erase_sector_alignment?

Best Regard
Yadong

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

