Return-Path: <virtio-comment-return-6065-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B43F6C77B7A
	for <virtio-comment@archiver.kernel.org>; Thu,  1 Jun 2023 11:33:30 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id D453777F0
	for <virtio-comment@archiver.kernel.org>; Thu,  1 Jun 2023 11:33:29 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B2504986611
	for <virtio-comment@archiver.kernel.org>; Thu,  1 Jun 2023 11:33:29 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id A2BBA983DE3; Thu,  1 Jun 2023 11:33:29 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8F54B986605
	for <virtio-comment@lists.oasis-open.org>; Thu,  1 Jun 2023 11:33:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: n8hwcSx5MGSw4EAW5ZRYZw-1
Date: Thu, 1 Jun 2023 07:33:22 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: zhenwei pi <pizhenwei@bytedance.com>
Cc: virtio-comment@lists.oasis-open.org
Message-ID: <20230601113322.GA1538357@fedora>
References: <20230504081910.238585-1-pizhenwei@bytedance.com>
 <20230504081910.238585-6-pizhenwei@bytedance.com>
 <20230531162048.GG1248296@fedora>
 <aad519cd-5114-6144-8520-a258745c5e4a@bytedance.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pZOYL5LtgdyVJ2pG"
Content-Disposition: inline
In-Reply-To: <aad519cd-5114-6144-8520-a258745c5e4a@bytedance.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: Re: [virtio-comment] Re: [PATCH v2 05/11] transport-fabrics:
 introduce Keyed Transmission

--pZOYL5LtgdyVJ2pG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 01, 2023 at 05:02:45PM +0800, zhenwei pi wrote:
>=20
>=20
> On 6/1/23 00:20, Stefan Hajnoczi wrote:
> > On Thu, May 04, 2023 at 04:19:04PM +0800, zhenwei pi wrote:
> > > Keyed transmission is used for message oriented communication(Ex RDMA=
),
> > > also add virtio-blk read/write 8K example.
> > >=20
> > > Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
> > > ---
> > >   transport-fabrics.tex | 178 +++++++++++++++++++++++++++++++++++++++=
+++
> > >   1 file changed, 178 insertions(+)
> > >=20
> > > diff --git a/transport-fabrics.tex b/transport-fabrics.tex
> > > index c02cf26..7711321 100644
> > > --- a/transport-fabrics.tex
> > > +++ b/transport-fabrics.tex
> > > @@ -317,3 +317,181 @@ \subsubsection{Buffer Mapping Definition}\label=
{sec:Virtio Transport Options / V
> > >                       |......|
> > >                       +------+  -> 8193
> > >   \end{lstlisting}
> > > +
> > > +\paragraph{Keyed Transmission}\label{sec:Virtio Transport Options / =
Virtio Over Fabrics / Transmission Protocol / Commands Definition / Keyed T=
ransmission}
> > > +Command and Segment Descriptors are transmitted in a message within a
> > > +connection, and buffer is transmitted by remote memory access.  The =
layout in message:
> >=20
> > With RDMA it is theoretically possible to implement virtqueues without
> > messages in the data path (i.e. by using something similar to vring with
> > RDMA). Why did you decide to use a mixed messages + RDMA approach
> > instead of a 100% RDMA approach?
> >=20
>=20
> Hi,
>=20
> To reduce networking RTT. From my experience, a single RDMA message(event
> based) uses at least 6us.
> This approach has a chance to send a command(include data segments) by 1
> networking RTT, and receive a completion(include data segments) in 1
> networking RTT. I tried to design a 100% RDMA approach(mapping a vring to
> the remote side, the remote side accesses this vring by RDMA READ/WRITE),
> but I failed to find an idea to achieve.

The goal is to minimize the number of RDMA transfers. Each area of
memory should be located on the system that is polling constantly (busy
waiting) and the other side occassionally sends an RDMA WRITE request.

This idea requires bi-directional RDMA where both initiator and target
make memory accessible to the other side. Is this possible?

The target owns the Available Ring, a descriptor table similar to those
used by the Split and Packed Virtqueue layouts that is used by the
driver to submit virtqueue buffers to the device. The target sends a key
to the Available Ring to the initiator during virtqueue setup. The
initiator sends RDMA WRITEs that fill in virtqueue descriptors. Indirect
descriptors are supported, but the target will need to use RDMA READs to
load the indirect descriptor table, so there is overhead. Even regular
non-indirect descriptors have overhead because an RDMA READ is required
to read the payload. The best approach for small virtqueue elements is
to inline the payload in the Available Ring descriptor so no additional
RDMA transfers are needed (this achieves similar effect to your approach
of using messages + RDMA, but with pure RDMA). The target polls the
Available Ring to detect available buffers.

The initiator sends a key to the Used Ring to the target during
virtqueue setup. The target sends RDMA WRITEs that fill in used
elements. The initiator polls the Used Ring to detect used buffers.

I'm not sure if the Used Ring makes sense as RDMA memory. Maybe it's
better to send a message over the reliable connection instead so that
Used Buffer Notifications can support interrupts and not just polling.

This is a new virtqueue layout. It's only worthwhile implementing it if
the Available Ring RDMA performance is significantly better than the
current approach.

Stefan

--pZOYL5LtgdyVJ2pG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmR4ggIACgkQnKSrs4Gr
c8g3ngf9HqAsX3rBH+pUW6QADnn/0qAua4hDyaC12e8376C2oE+zfrM7xyqU4/+n
cZnVQ7RJOsj5QNN7elpOF1GvN192Qz/YhdzgiZFnHGGqqYbIQ6ej31XAQFQozhiA
/NmhZZ0VtC8KH4rETQdhxE3RtyzUIZALaZENlThhVKT9PbEIwoVnFGZSbcLaMLZg
iMaMJAL96BvzJsKpCC+YGMhRmpoM3RpJlMaZE+yQrFqTZybmGc1oTY3qteax9o6C
oclGAXQjCoNRARpg9LRgrjrYrj3ZMSSWVkY9Eu2vtcglPT3udC+y1TKZu0BBEAFC
kTHrCJvGGFXpfMEQy6LGS+8Fq4VK2w==
=LhcK
-----END PGP SIGNATURE-----

--pZOYL5LtgdyVJ2pG--

