Return-Path: virtio-comment-return-916-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id EDDDD985FC7
	for <virtio-comment@lists.oasis-open.org>; Fri, 15 Nov 2019 11:31:26 +0000 (UTC)
Date: Fri, 15 Nov 2019 12:31:17 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
Message-ID: <20191115113117.kwegz2adjd7rl6km@steredhat>
MIME-Version: 1.0
Subject: [virtio-comment] vsock: device expects at least 4 KB buffers in the rx virtqueue
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
To: virtio-comment@lists.oasis-open.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

Hi,
following the discussion with Michael [1], the device emulation
implemented in vhost-vsock made an assumption on buffers at least 4 KB
in the rx virtqueue.

This patch [2] removed the assumption unintentionally, but vhost-vsock
modules released before Linux v5.4 still have this limitation.

The current implementation continues to use 4 KB buffers, so for now, we
are backward compatible, but we should add something in the
specifications.

I'm not sure how to proceed, my ideas are the following:

1. Add a note like this:
    diff --git a/virtio-vsock.tex b/virtio-vsock.tex
    index da7e641..4c8f65d 100644
    --- a/virtio-vsock.tex
    +++ b/virtio-vsock.tex
    @@ -198,6 +198,9 @@ \subsubsection{Receive and Transmit}\label{sec:Devi=
ce Types / Socket Device / De
     Virtqueue buffers for outgoing packets are read-only. Virtqueue buffer=
s for
     incoming packets are write-only.
    =20
    +Note: The device implementation (vhost-vsock) in Linux prior to v5.4 r=
equires
    +that the receive buffers in the rx virtqueue MUST be at least 4KBytes.
    +
     \drivernormative{\paragraph}{Device Operation: Receive and Transmit}{D=
evice Types / Socket Device / Device Operation / Receive and Transmit}
    =20
     The \field{guest_cid} configuration field MUST be used as the source C=
ID when

2. Add a new feature to tell that the device supports any buffer size in
   the rx queue

3. Add a new feature to support mergeable buffers (in my plans),
   avoiding the feature at point 2

Any suggestion?

Thanks,
Stefano

[1] https://lkml.org/lkml/2019/9/2/676
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it/?id=3D6dbd3e66e7785a2f055bf84d98de9b8fd31ff3f5=20


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

