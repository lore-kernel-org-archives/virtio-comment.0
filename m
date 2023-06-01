Return-Path: <virtio-comment-return-6074-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F405DC7EE29
	for <virtio-comment@archiver.kernel.org>; Thu,  1 Jun 2023 21:23:47 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 20E62732E2
	for <virtio-comment@archiver.kernel.org>; Thu,  1 Jun 2023 21:23:47 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0AB449867BF
	for <virtio-comment@archiver.kernel.org>; Thu,  1 Jun 2023 21:23:47 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id EA14D9867BC; Thu,  1 Jun 2023 21:23:46 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D06A29867BD
	for <virtio-comment@lists.oasis-open.org>; Thu,  1 Jun 2023 21:23:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: xTkR3lcEOlKAAhHuAe8NtQ-1
Date: Thu, 1 Jun 2023 17:23:39 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: zhenwei pi <pizhenwei@bytedance.com>
Cc: virtio-comment@lists.oasis-open.org
Message-ID: <20230601212339.GA1687473@fedora>
References: <20230504081910.238585-1-pizhenwei@bytedance.com>
 <20230504081910.238585-6-pizhenwei@bytedance.com>
 <20230531162048.GG1248296@fedora>
 <aad519cd-5114-6144-8520-a258745c5e4a@bytedance.com>
 <20230601113322.GA1538357@fedora>
 <4426aa84-f22a-f361-af44-561dfd5a4ea0@bytedance.com>
 <20230601191353.GC1622695@fedora>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2hE92VywdFyitb//"
Content-Disposition: inline
In-Reply-To: <20230601191353.GC1622695@fedora>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: Re: Re: [virtio-comment] Re: [PATCH v2 05/11] transport-fabrics:
 introduce Keyed Transmission

--2hE92VywdFyitb//
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 01, 2023 at 03:13:53PM -0400, Stefan Hajnoczi wrote:
> On Thu, Jun 01, 2023 at 09:09:49PM +0800, zhenwei pi wrote:
> > On 6/1/23 19:33, Stefan Hajnoczi wrote:
> > > On Thu, Jun 01, 2023 at 05:02:45PM +0800, zhenwei pi wrote:
> > > > On 6/1/23 00:20, Stefan Hajnoczi wrote:
> > > > > On Thu, May 04, 2023 at 04:19:04PM +0800, zhenwei pi wrote:
> One more idea to play with: VIRTIO has flexible message framing, so
> devices must process a virtqueue buffer the same regardless of whether
> it has 1 large element or many small elements. Therefore the virtqueue
> RDMA protocol does not need to preserve the virtqueue element count and
> sizes from the driver. For example, the target can offer a list of
> key/length pairs that the initiator RDMA WRITES the virtqueue buffer
> contents into. For a virtio-blk device that would be a struct
> virtio_blk_outhdr followed by a large page-aligned buffer for the I/O
> buffer data to be transferred. Then the device always a properly aligned
> and contiguous buffer. Unfortunately this approach breaks down when the
> virtqueue carries requests that are organized very differently, but it
> might be useful when there is a most common request type.

I'm not sure if I explained this well. What I'm trying to say is that I
think RDMA benefits when the receiver's memory constraints are visible
to the sender. The sender performs RDMA WRITEs to the locations where
the receiver can efficiently process the data.

This protocol proposal doesn't really take advantage of this approach
because it communicates the virtqueue buffer elements from the initiator
(the sender) to the target (the receiver). That's the wrong way around.

I have never used RDMA myself, so this might be wrong, but as long as
the RDMA API allows the sender to specify a scatter-gather list as
input, then I think the details of the virtqueue buffer elements that
don't have the WRITE flag should never be communicated over the network.
Instead the initiator should RDMA WRITE from the VIRTIO driver's
scatter-gather list to the target's preferred destination instead.

Stefan

--2hE92VywdFyitb//
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmR5DFsACgkQnKSrs4Gr
c8gUFAgAxqHq0XYr74QYUhzNtAFvFjqr3UoevcKRM7B7M0Ji4aBxWf40uoC11tC7
VRVmNvCevH3nO4LlNC+wjN3htFF7usnsuorVFYXzHXEQlBRTvS0N1gfZLoJ2GUfK
XUvZDELVylGp3kDXaIOLgid1OtqmdRWc+VO9m18aEuKC97b8tUV6WnwLvcDsI3Xu
4aI10zGSzYn1/IGgpzn6vhuggFhykap3dQ8CQVvKTYMrkL3lL1zrgFquzgk8Ogr2
8a2nwAqcvd1SgbdnXthOZGxqUa16DrQ2uWFzmBEDSdKNbSq4KUB6TNMsFtlyM1VE
UsWJWpq9JwduZ2PDYv0ODtL8bVjI6w==
=3C6H
-----END PGP SIGNATURE-----

--2hE92VywdFyitb//--

