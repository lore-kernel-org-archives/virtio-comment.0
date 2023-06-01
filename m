Return-Path: <virtio-comment-return-6073-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95300C77B7A
	for <virtio-comment@archiver.kernel.org>; Thu,  1 Jun 2023 19:14:01 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id AAC4B23D69
	for <virtio-comment@archiver.kernel.org>; Thu,  1 Jun 2023 19:14:00 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8CF9D9867B7
	for <virtio-comment@archiver.kernel.org>; Thu,  1 Jun 2023 19:14:00 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 7992D9867AE; Thu,  1 Jun 2023 19:14:00 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 67AD89867AF
	for <virtio-comment@lists.oasis-open.org>; Thu,  1 Jun 2023 19:14:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: DPPXpOGeP5m6Tv-HJaCQww-1
Date: Thu, 1 Jun 2023 15:13:53 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: zhenwei pi <pizhenwei@bytedance.com>
Cc: virtio-comment@lists.oasis-open.org
Message-ID: <20230601191353.GC1622695@fedora>
References: <20230504081910.238585-1-pizhenwei@bytedance.com>
 <20230504081910.238585-6-pizhenwei@bytedance.com>
 <20230531162048.GG1248296@fedora>
 <aad519cd-5114-6144-8520-a258745c5e4a@bytedance.com>
 <20230601113322.GA1538357@fedora>
 <4426aa84-f22a-f361-af44-561dfd5a4ea0@bytedance.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="V5L8d6PPwItzI2rd"
Content-Disposition: inline
In-Reply-To: <4426aa84-f22a-f361-af44-561dfd5a4ea0@bytedance.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: Re: Re: [virtio-comment] Re: [PATCH v2 05/11] transport-fabrics:
 introduce Keyed Transmission

--V5L8d6PPwItzI2rd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 01, 2023 at 09:09:49PM +0800, zhenwei pi wrote:
>=20
>=20
> On 6/1/23 19:33, Stefan Hajnoczi wrote:
> > On Thu, Jun 01, 2023 at 05:02:45PM +0800, zhenwei pi wrote:
> > >=20
> > >=20
> > > On 6/1/23 00:20, Stefan Hajnoczi wrote:
> > > > On Thu, May 04, 2023 at 04:19:04PM +0800, zhenwei pi wrote:
> > > > > Keyed transmission is used for message oriented communication(Ex =
RDMA),
> > > > > also add virtio-blk read/write 8K example.
> > > > >=20
> > > > > Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
> > > > > ---
> > > > >    transport-fabrics.tex | 178 ++++++++++++++++++++++++++++++++++=
++++++++
> > > > >    1 file changed, 178 insertions(+)
> > > > >=20
> > > > > diff --git a/transport-fabrics.tex b/transport-fabrics.tex
> > > > > index c02cf26..7711321 100644
> > > > > --- a/transport-fabrics.tex
> > > > > +++ b/transport-fabrics.tex
> > > > > @@ -317,3 +317,181 @@ \subsubsection{Buffer Mapping Definition}\l=
abel{sec:Virtio Transport Options / V
> > > > >                        |......|
> > > > >                        +------+  -> 8193
> > > > >    \end{lstlisting}
> > > > > +
> > > > > +\paragraph{Keyed Transmission}\label{sec:Virtio Transport Option=
s / Virtio Over Fabrics / Transmission Protocol / Commands Definition / Key=
ed Transmission}
> > > > > +Command and Segment Descriptors are transmitted in a message wit=
hin a
> > > > > +connection, and buffer is transmitted by remote memory access.  =
The layout in message:
> > > >=20
> > > > With RDMA it is theoretically possible to implement virtqueues with=
out
> > > > messages in the data path (i.e. by using something similar to vring=
 with
> > > > RDMA). Why did you decide to use a mixed messages + RDMA approach
> > > > instead of a 100% RDMA approach?
> > > >=20
> > >=20
> > > Hi,
> > >=20
> > > To reduce networking RTT. From my experience, a single RDMA message(e=
vent
> > > based) uses at least 6us.

What is the cost of 1 8KB RDMA WRITE vs 2 4KB RDMA WRITES?

I'm asking because if 6us is per RDMA transfer, then it's better to
avoid exposing scatter-gather lists (descriptors) to the other side and
instead provide contiguous memory and accept the cost of memcpy on the
receiving side.

On the other hand, if the cost is mostly determined by the amount of
data transferred, then it's better to expose scatter-gather lists so
data is received in the final memory location where it is consumed.

> > > This approach has a chance to send a command(include data segments) b=
y 1
> > > networking RTT, and receive a completion(include data segments) in 1
> > > networking RTT. I tried to design a 100% RDMA approach(mapping a vrin=
g to
> > > the remote side, the remote side accesses this vring by RDMA READ/WRI=
TE),
> > > but I failed to find an idea to achieve.
> >=20
> > The goal is to minimize the number of RDMA transfers. Each area of
> > memory should be located on the system that is polling constantly (busy
> > waiting) and the other side occassionally sends an RDMA WRITE request.
> >=20
> > This idea requires bi-directional RDMA where both initiator and target
> > make memory accessible to the other side. Is this possible?
> >=20
> > The target owns the Available Ring, a descriptor table similar to those
> > used by the Split and Packed Virtqueue layouts that is used by the
> > driver to submit virtqueue buffers to the device. The target sends a key
> > to the Available Ring to the initiator during virtqueue setup. The
> > initiator sends RDMA WRITEs that fill in virtqueue descriptors. Indirect
> > descriptors are supported, but the target will need to use RDMA READs to
> > load the indirect descriptor table, so there is overhead. Even regular
> > non-indirect descriptors have overhead because an RDMA READ is required
> > to read the payload. The best approach for small virtqueue elements is
> > to inline the payload in the Available Ring descriptor so no additional
> > RDMA transfers are needed (this achieves similar effect to your approach
> > of using messages + RDMA, but with pure RDMA). The target polls the
> > Available Ring to detect available buffers.
> >=20
> > The initiator sends a key to the Used Ring to the target during
> > virtqueue setup. The target sends RDMA WRITEs that fill in used
> > elements. The initiator polls the Used Ring to detect used buffers.
> >=20
> > I'm not sure if the Used Ring makes sense as RDMA memory. Maybe it's
> > better to send a message over the reliable connection instead so that
> > Used Buffer Notifications can support interrupts and not just polling.
> >=20
>=20
> I guess RDMA WRITE WITH IMM would be fine for this approach.
>=20
> > This is a new virtqueue layout. It's only worthwhile implementing it if
> > the Available Ring RDMA performance is significantly better than the
> > current approach.
> >=20
> > Stefan
>=20
> I agree with your approach to maintain the Vring. If I understand correct=
ly:
> an example of virtio-blk write 4k:
> 1, initiator write the 3 vring desc by RDMA WRITE WITH IMM(IMM Data to ca=
rry
> VQ control message), this uses 1 networking RTT.
> 2, target handles WRITE WITH IMM, reads remote memory from initiator of
> desc[0] and desc[1]. This uses 1 networking RTT. (I did not find the 2 ke=
ys
> of desc[0] and desc[1] from your approach, but I think this can be
> implemented in step 1 by adding another memory)
> 3, target handles virtio-blk write request and writes the memory to
> initiator of desc[2] by RDMA WRITE WITH IMM.(IMM Data to carry control
> message). This uses 1 networking RTT.
>=20
>=20
> So we use at lease 3 RTT by this approach. If unfortunately the u32 imm_d=
ata
> is lack to carry enough control message, we may need more RTT.
>=20
> Sorry, the previous "I failed to find an idea to achieve." means that I
> failed to find an idea to complete 1 single request in 2 RTT.

1 RDMA WRITE WITH IMM for the available buffer + 1 RDMA WRITE WITH IMM
for the used buffer is theoretically possible when all virtqueue
buffer elements are inlined. This way Step 2 can be eliminated.

In theory it's possible to supply multiple available buffers in 1 RDMA
WRITE WITH IMM and complete multiple used buffers in 1 RDMA WRITE WITH
IMM when the virtqueue access pattern allows batching. An optimal RDMA
virtqueue protocol has a 1 RDMA WRITE WITH IMM to N virtqueue buffer
relationship, not a 1:1 relationship.

One more idea to play with: VIRTIO has flexible message framing, so
devices must process a virtqueue buffer the same regardless of whether
it has 1 large element or many small elements. Therefore the virtqueue
RDMA protocol does not need to preserve the virtqueue element count and
sizes from the driver. For example, the target can offer a list of
key/length pairs that the initiator RDMA WRITES the virtqueue buffer
contents into. For a virtio-blk device that would be a struct
virtio_blk_outhdr followed by a large page-aligned buffer for the I/O
buffer data to be transferred. Then the device always a properly aligned
and contiguous buffer. Unfortunately this approach breaks down when the
virtqueue carries requests that are organized very differently, but it
might be useful when there is a most common request type.

Stefan

--V5L8d6PPwItzI2rd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmR47fEACgkQnKSrs4Gr
c8i86AgAsp18INVMip6bSr7TIf3/bg9dNhEwLt97iAb1Vk9DwIJ9BV7NbA1cEyTi
ozfpr+Qr2LAfCZDg6zZFIS6+06Ogvwi0bXGXn9FFCifRhKP2Yp+A3raQFfoIZEaz
AqPu6HWDwEthAv78lQVBepSYzHbrMsc+1sOP9XV1ndCD4TLHVs+XYEfVrxXLhUWz
rdoJ9hH7b6q3L6u/QECHYFqaA9vAU+tWiC7R4zPoVwcb5OhJqXUGxyJB56v2UYXv
eUD5hGNVAgHlx2K8pOKAj2HGVHnTJsoB/0T3wvlsDlV19+p5sig5RqOUp7V/XqaX
VJEOviV3I+90lAxVkfn/kxRUtBwBug==
=UJzF
-----END PGP SIGNATURE-----

--V5L8d6PPwItzI2rd--

