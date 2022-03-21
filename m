Return-Path: <qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [virtio-comment] [PATCH v3 1/4] Add VIRTIO_RING_F_INDIRECT_SIZE
Date: Mon, 21 Mar 2022 10:23:07 +0100
Message-ID: <1758197.u6jAxYQQ6s@silver>
In-Reply-To: <20220320171750-mutt-send-email-mst@kernel.org>
References: <4735344.EBYxvr1mta@silver> <18109331.vxdRPDnfUN@silver>
 <20220320171750-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, Cornelia Huck <cohuck@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, Greg Kurz <groug@kaod.org>, Dominique Martinet <asmadeus@codewreck.org>, Halil Pasic <pasic@linux.ibm.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Sonntag, 20. M=E4rz 2022 22:52:16 CET Michael S. Tsirkin wrote:
> On Sun, Mar 20, 2022 at 06:43:53PM +0100, Christian Schoenebeck wrote:
> > To be honest, I don't feel like discussing precise wordings at this poi=
nt
> > when you are questioning the proposal on design level already.
> >=20
> > Maybe you make some more thorough thoughts on what you actually want th=
is
> > to be on design level before continueing to argue about precise
> > terminology, which you are not using either BTW when you articulating
> > your criticism.
> >=20
> > Or even better: come up with your own proposol with the precise wording
> > you
> > feel appropriate.
>=20
> OK let's go back and agree on what we are trying to achieve.  The github
> issue and the cover letter imply that while indirect descriptors would
> normally allow huge tables, we artificially limit them to queue size,
> and you want to be able to relax that.

Correct, that's my motivation for all of this.

> Fair enough.
>=20
> However, I feel trying to talk about indirect descriptor is too narrow a
> use-case, simply because the issue is not indirect at all.  Why do we
> limit number of segments? I think it's really because of backend
> limitations. And indirect is only used by the frontend.  So limiting
> that is really going about it wrong.

I am only aware about current implementation situation in QEMU and Linux=20
kernel. As for those two: yes, it is not a limitation on Linux kernel side,=
=20
but on QEMU side.

As for other implementations: no idea.

> So block for example has seg_max already. What should happen
> if that exceeds queue size is not defined.
>=20
> So maybe we can generalize that making it device independent?
> The litmus paper for this is the block and scsi devices,
> we should be able to use the new feature as a super-set.
>=20
> Before we discuss solutions, did I formulate the problem correctly?

Keep in mind that I never worked on virtio code or virtio spec before. I ju=
st=20
started to review virtio implementation of QEMU and Linux kernel and the=20
virtio spec in November, specifically in context of 9p. I definitely don't=
=20
know all the other virtioo device classes out there.

In other words: I can't help you on fitting this appropriately into a super=
set=20
picture.

Best regards,
Christian Schoenebeck


