Return-Path: <yadong.qi@intel.com>
From: "Qi, Yadong" <yadong.qi@intel.com>
Subject: RE: [virtio-comment] [PATCH v3] virtio-blk: add secure erase feature
 to specification
Date: Tue, 7 Dec 2021 01:03:10 +0000
Message-ID: <BL1PR11MB5479A7E5C30CBCDC0EADCBF0E36E9@BL1PR11MB5479.namprd11.prod.outlook.com>
References: <20211130050419.1031593-1-yadong.qi@intel.com>
 <8735n5vq18.fsf@redhat.com>
In-Reply-To: <8735n5vq18.fsf@redhat.com>
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
To: Cornelia Huck <cohuck@redhat.com>, "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
Cc: "stefanha@redhat.com" <stefanha@redhat.com>, "hch@lst.de" <hch@lst.de>, "Chen, Luhai" <luhai.chen@intel.com>, "Wang, Kai Z" <kai.z.wang@intel.com>
List-ID: <virtio-comment.lists.oasis-open.org>

> >  \item[VIRTIO_BLK_F_LIFETIME (15)] Device supports providing storage
> lifetime
> >       information.
> > +
> > +\item[VIRTIO_BLK_F_SECURE_ERASE (16)] Device supports secure discard
> command,
> > +     maximum discard sectors count in \field{max_secure_erase_sectors}=
 and
> > +     maximum discard segment number in \field{max_secure_erase_seg}.
>=20
> This proposed update now has a mixture of "secure erase" and "secure disc=
ard";
> this seems confusing to me.
>=20
> What is the more common name for this feature? I guess we should use it
> consistently throughout the spec. Or is a mixture of the two actually the=
 most
> common?

Thanks for point out the issue. It is my mistake when rewording. "secure er=
ase"
should be more common name for this feature, "secure discard" is specifical=
ly
used on linux system.

Best Regard
Yadong
>=20
> > +
> >  \end{description}

