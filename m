Return-Path: <virtio-comment-return-6143-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 887FEC77B73
	for <virtio-comment@archiver.kernel.org>; Mon,  5 Jun 2023 17:21:45 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id BD6671CA24A
	for <virtio-comment@archiver.kernel.org>; Mon,  5 Jun 2023 17:21:44 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A2E62986485
	for <virtio-comment@archiver.kernel.org>; Mon,  5 Jun 2023 17:21:44 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 96EFD98644A; Mon,  5 Jun 2023 17:21:44 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 85D2D98645C
	for <virtio-comment@lists.oasis-open.org>; Mon,  5 Jun 2023 17:21:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: OHfcg90LNoe_MPWrCXxOZg-1
Date: Mon, 5 Jun 2023 13:21:39 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: zhenwei pi <pizhenwei@bytedance.com>
Cc: virtio-comment@lists.oasis-open.org
Message-ID: <20230605172139.GF1624556@fedora>
References: <20230504081910.238585-1-pizhenwei@bytedance.com>
 <20230504081910.238585-6-pizhenwei@bytedance.com>
 <20230531162048.GG1248296@fedora>
 <aad519cd-5114-6144-8520-a258745c5e4a@bytedance.com>
 <20230601113322.GA1538357@fedora>
 <4426aa84-f22a-f361-af44-561dfd5a4ea0@bytedance.com>
 <20230601191353.GC1622695@fedora>
 <20230601212339.GA1687473@fedora>
 <ced49494-1839-50d3-6742-0d5c1e7b33c7@bytedance.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="C+rkAR/zKO17GHse"
Content-Disposition: inline
In-Reply-To: <ced49494-1839-50d3-6742-0d5c1e7b33c7@bytedance.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: Re: Re: Re: [virtio-comment] Re: [PATCH v2 05/11] transport-fabrics:
 introduce Keyed Transmission

--C+rkAR/zKO17GHse
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 02, 2023 at 08:55:02AM +0800, zhenwei pi wrote:
>=20
>=20
> On 6/2/23 05:23, Stefan Hajnoczi wrote:
> > On Thu, Jun 01, 2023 at 03:13:53PM -0400, Stefan Hajnoczi wrote:
> > > On Thu, Jun 01, 2023 at 09:09:49PM +0800, zhenwei pi wrote:
> > > > On 6/1/23 19:33, Stefan Hajnoczi wrote:
> > > > > On Thu, Jun 01, 2023 at 05:02:45PM +0800, zhenwei pi wrote:
> > > > > > On 6/1/23 00:20, Stefan Hajnoczi wrote:
> > > > > > > On Thu, May 04, 2023 at 04:19:04PM +0800, zhenwei pi wrote:
> > > One more idea to play with: VIRTIO has flexible message framing, so
> > > devices must process a virtqueue buffer the same regardless of whether
> > > it has 1 large element or many small elements. Therefore the virtqueue
> > > RDMA protocol does not need to preserve the virtqueue element count a=
nd
> > > sizes from the driver. For example, the target can offer a list of
> > > key/length pairs that the initiator RDMA WRITES the virtqueue buffer
> > > contents into. For a virtio-blk device that would be a struct
> > > virtio_blk_outhdr followed by a large page-aligned buffer for the I/O
> > > buffer data to be transferred. Then the device always a properly alig=
ned
> > > and contiguous buffer. Unfortunately this approach breaks down when t=
he
> > > virtqueue carries requests that are organized very differently, but it
> > > might be useful when there is a most common request type.
> >=20
> > I'm not sure if I explained this well. What I'm trying to say is that I
> > think RDMA benefits when the receiver's memory constraints are visible
> > to the sender. The sender performs RDMA WRITEs to the locations where
> > the receiver can efficiently process the data.
> >=20
> > This protocol proposal doesn't really take advantage of this approach
> > because it communicates the virtqueue buffer elements from the initiator
> > (the sender) to the target (the receiver). That's the wrong way around.
> >=20
> > I have never used RDMA myself, so this might be wrong, but as long as
> > the RDMA API allows the sender to specify a scatter-gather list as
> > input, then I think the details of the virtqueue buffer elements that
> > don't have the WRITE flag should never be communicated over the network.
> > Instead the initiator should RDMA WRITE from the VIRTIO driver's
> > scatter-gather list to the target's preferred destination instead.
> >=20
> > Stefan
>=20
> Hi,
>=20
> I guess I followed your point. "the target can offer a list of key/length
> pairs that the initiator RDMA WRITES the virtqueue buffer contents into"
> seems not good to me, I'd prefer to expose RDMA memory region of initiator
> side only(target side uses RDMA READ/WRITE to operate the memory of
> initiator, this means target side has no need to allocate/pin memory
> buffer).

Many targets will need to pin memory for the underlying disk I/O anyway.
If the initiator RDMA WRITEs data into the target's pinned memory, then
the target can forward the data to the disk without copies.

But assuming the target doesn't want to pin memory, the protocol can
still be simplified. The initiator sends a VQ_OP command containing:
1. VQ_OP header with a list of <addr, key, len> tuples for WRITE
   virtqueue buffer elements.
2. The contents of the !WRITE virtqueue buffer elements.

Note that this approach does not involve the target sending RDMA READs
because this seems inefficient to me when the ibv_*() APIs allow the
initiator to send the !WRITE virtqueue buffer elements along with the
requests using a scatter-gather list.

The target receives the VQ_OP command and sends RDMA WRITEs to fill in
used buffer elements. The last RDMA WRITEs may need to be WRITE WITH IMM
to efficiently complete the request.

> From the point of my view, this protocol needs to be effective and
> maintainable, mapping vring mechanism with RDMA WRITE from 2
> directions(initiator to target, and target to initiator) leads high
> complexity ...

My concern is that simply mapping vrings to RDMA is inefficient. It is
not necessary for the target to RDMA READ virtqueue buffer elements when
the initiator could include them in its send scatter-gather list
instead.

If we forget about vrings and focus instead on how to offer virtqueue
semantics at the minimal RDMA cost, then I think the protocol would look
more like what I'm describing.

Stefan

--C+rkAR/zKO17GHse
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmR+GaMACgkQnKSrs4Gr
c8gQzwf8CusVTsgeHnMPjGkMt5qVSpXFzk7RoCI4aqqUxZ9EVkdESvtXCCDGKcjf
Vx0o5de8/u5oUOA2SFJvPqNS973UWNZI9enZJGm1V+u4/8uOzS3LgWqAdN8F77P9
RwbGyMIRYYOcD7wQ6yt+oSShTwt8SbFxTKJruOec661j2NX+PT7PbE2dERT2F2wf
YWnYohzjeS27dZ35dQ/Ag/0CxCreGWqruXj6jyhChkTk+ZDDETGz4mi6mPyDhx0i
wmI5LSdJ0SgnNZm0refrVcyoWpvcv434X0bxcAC2Es7NoY4/PmcaA+WcxhSkTsWq
97yd/Lz+VKjZfJnWbzwC3Sf6uaJf1Q==
=2e9M
-----END PGP SIGNATURE-----

--C+rkAR/zKO17GHse--

