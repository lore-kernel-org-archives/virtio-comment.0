Return-Path: virtio-comment-return-920-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B662B985CE6
	for <virtio-comment@lists.oasis-open.org>; Mon, 18 Nov 2019 11:28:40 +0000 (UTC)
Date: Mon, 18 Nov 2019 12:28:33 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
Message-ID: <20191118112833.clq5zr3rzliscnrj@steredhat>
References: <20191115113117.kwegz2adjd7rl6km@steredhat>
 <20191115085838-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20191115085838-mutt-send-email-mst@kernel.org>
Subject: [virtio-comment] Re: vsock: device expects at least 4 KB buffers in the rx virtqueue
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, Stefan Hajnoczi <stefanha@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Fri, Nov 15, 2019 at 09:06:36AM -0500, Michael S. Tsirkin wrote:
> On Fri, Nov 15, 2019 at 12:31:17PM +0100, Stefano Garzarella wrote:
> > Hi,
> > following the discussion with Michael [1], the device emulation
> > implemented in vhost-vsock made an assumption on buffers at least 4 KB
> > in the rx virtqueue.
> >=20
> > This patch [2] removed the assumption unintentionally, but vhost-vsock
> > modules released before Linux v5.4 still have this limitation.
> >=20
> > The current implementation continues to use 4 KB buffers, so for now, w=
e
> > are backward compatible, but we should add something in the
> > specifications.
> >=20
> > I'm not sure how to proceed, my ideas are the following:
> >=20
> > 1. Add a note like this:
> >     diff --git a/virtio-vsock.tex b/virtio-vsock.tex
> >     index da7e641..4c8f65d 100644
> >     --- a/virtio-vsock.tex
> >     +++ b/virtio-vsock.tex
> >     @@ -198,6 +198,9 @@ \subsubsection{Receive and Transmit}\label{sec:=
Device Types / Socket Device / De
> >      Virtqueue buffers for outgoing packets are read-only. Virtqueue bu=
ffers for
> >      incoming packets are write-only.
> >     =20
> >     +Note: The device implementation (vhost-vsock) in Linux prior to v5=
.4 requires
> >     +that the receive buffers in the rx virtqueue MUST be at least 4KBy=
tes.
> >     +
>=20
> Question is how big a fix it is for all devices?

The only device affected seems to be the vhost-vsock implementation (the
other implementation that I found is the Firecracker emulation, see
later) and the fix [2] should easily be applied on stable branches, since
that code hasn't changed much since the introduction.

This is the diffstat of the patch:
 drivers/vhost/vsock.c                   | 66 +++++++++++++++++++++++++++++=
++++++-------------
 net/vmw_vsock/virtio_transport_common.c | 15 ++++++++---
 2 files changed, 60 insertions(+), 21 deletions(-)

> It is attractive to fix it in the correct place, which is host kernel.
> If we are to fix it I'd start with putting the patch in stable,
> and red hat kernels over which we have control.

Okay, I'll ask Dave to consider the patch also for stable branches, and
I'll look for RH kernels.

>=20
> Also, there are implementations outside vhost. Can you check these
> please? Did they make the 4K buffer assumption too?

The other sole implementation that I found is in Firecracker [3] and lookin=
g
at the code [4], they don't do any assumption and look at the buffer
size taken from the RX virtqueue.

>=20
> >      \drivernormative{\paragraph}{Device Operation: Receive and Transmi=
t}{Device Types / Socket Device / Device Operation / Receive and Transmit}
> >     =20
> >      The \field{guest_cid} configuration field MUST be used as the sour=
ce CID when
> >=20
> > 2. Add a new feature to tell that the device supports any buffer size i=
n
> >    the rx queue
> >=20
> > 3. Add a new feature to support mergeable buffers (in my plans),
> >    avoiding the feature at point 2
>=20
> Assuming we make it a new feature, I think either 2 or 3.
>=20

Okay, maybe 3 would be cleaner and less related to implementation in
vhost-vsock.

Thanks,
Stefano

> [1] https://lkml.org/lkml/2019/9/2/676
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/co=
mmit/?id=3D6dbd3e66e7785a2f055bf84d98de9b8fd31ff3f5
[3] https://github.com/firecracker-microvm/firecracker/tree/master/devices/=
src/virtio/vsock
[4] https://github.com/firecracker-microvm/firecracker/blob/81592a1e21084c4=
f8e02bfafc9b1122c9db4254e/devices/src/virtio/vsock/csm/connection.rs#L217


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

