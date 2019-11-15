Return-Path: virtio-comment-return-917-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E7236985FC9
	for <virtio-comment@lists.oasis-open.org>; Fri, 15 Nov 2019 14:06:45 +0000 (UTC)
Date: Fri, 15 Nov 2019 09:06:36 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20191115085838-mutt-send-email-mst@kernel.org>
References: <20191115113117.kwegz2adjd7rl6km@steredhat>
MIME-Version: 1.0
In-Reply-To: <20191115113117.kwegz2adjd7rl6km@steredhat>
Subject: [virtio-comment] Re: vsock: device expects at least 4 KB buffers in the rx virtqueue
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, Stefan Hajnoczi <stefanha@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Fri, Nov 15, 2019 at 12:31:17PM +0100, Stefano Garzarella wrote:
> Hi,
> following the discussion with Michael [1], the device emulation
> implemented in vhost-vsock made an assumption on buffers at least 4 KB
> in the rx virtqueue.
>=20
> This patch [2] removed the assumption unintentionally, but vhost-vsock
> modules released before Linux v5.4 still have this limitation.
>=20
> The current implementation continues to use 4 KB buffers, so for now, we
> are backward compatible, but we should add something in the
> specifications.
>=20
> I'm not sure how to proceed, my ideas are the following:
>=20
> 1. Add a note like this:
>     diff --git a/virtio-vsock.tex b/virtio-vsock.tex
>     index da7e641..4c8f65d 100644
>     --- a/virtio-vsock.tex
>     +++ b/virtio-vsock.tex
>     @@ -198,6 +198,9 @@ \subsubsection{Receive and Transmit}\label{sec:De=
vice Types / Socket Device / De
>      Virtqueue buffers for outgoing packets are read-only. Virtqueue buff=
ers for
>      incoming packets are write-only.
>     =20
>     +Note: The device implementation (vhost-vsock) in Linux prior to v5.4=
 requires
>     +that the receive buffers in the rx virtqueue MUST be at least 4KByte=
s.
>     +

Question is how big a fix it is for all devices?
It is attractive to fix it in the correct place, which is host kernel.
If we are to fix it I'd start with putting the patch in stable,
and red hat kernels over which we have control.

Also, there are implementations outside vhost. Can you check these
please? Did they make the 4K buffer assumption too?

>      \drivernormative{\paragraph}{Device Operation: Receive and Transmit}=
{Device Types / Socket Device / Device Operation / Receive and Transmit}
>     =20
>      The \field{guest_cid} configuration field MUST be used as the source=
 CID when
>=20
> 2. Add a new feature to tell that the device supports any buffer size in
>    the rx queue
>=20
> 3. Add a new feature to support mergeable buffers (in my plans),
>    avoiding the feature at point 2

Assuming we make it a new feature, I think either 2 or 3.


> Any suggestion?
>=20
> Thanks,
> Stefano
>=20
> [1] https://lkml.org/lkml/2019/9/2/676
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/co=
mmit/?id=3D6dbd3e66e7785a2f055bf84d98de9b8fd31ff3f5=20


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

