Return-Path: <virtio-comment-return-7320-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C16D3EE7FF4
	for <virtio-comment@archiver.kernel.org>; Mon, 11 Sep 2023 13:47:21 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id E93A945B2F
	for <virtio-comment@archiver.kernel.org>; Mon, 11 Sep 2023 13:47:20 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CFB1F986466
	for <virtio-comment@archiver.kernel.org>; Mon, 11 Sep 2023 13:47:20 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id BEF1E986192; Mon, 11 Sep 2023 13:47:20 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id ADD6198642F
	for <virtio-comment@lists.oasis-open.org>; Mon, 11 Sep 2023 13:47:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: GXdGhvlkNLCeaTdYSrNbYQ-1
Date: Mon, 11 Sep 2023 09:47:15 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: virtio-comment@lists.oasis-open.org, hengqi@linux.alibaba.com,
	david.edmondson@oracle.com, xuanzhuo@linux.alibaba.com,
	sburla@marvell.com, shahafs@nvidia.com, virtio@lists.oasis-open.org
Message-ID: <20230911134715.GC3803963@fedora>
References: <20230818043557.496964-1-parav@nvidia.com>
 <20230818043557.496964-4-parav@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4s2x8rt324n47E2w"
Content-Disposition: inline
In-Reply-To: <20230818043557.496964-4-parav@nvidia.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: [virtio-comment] Re: [virtio] [PATCH requirements v5 3/7] net-features: Add low
 latency receive queue requirements

--4s2x8rt324n47E2w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 18, 2023 at 07:35:53AM +0300, Parav Pandit wrote:
> +### 3.2.2 Low latency rx virtqueue
> +0. Design goal:
> +   a. Keep packet metadata and buffer data together which is consumed by driver
> +      layer and make it available in a single cache line of cpu
> +   b. Instead of having per packet descriptors which is complex to scale for
> +      the device, supply the page directly to the device to consume it based
> +      on packet size
> +1. The device should be able to write a packet receive completion that consists
> +   of struct virtio_net_hdr (or similar) and a buffer id using a single DMA write
> +   PCIe TLP.
> +2. The device should be able to perform DMA writes of multiple packets
> +   completions in a single DMA transaction up to the PCIe maximum write limit
> +   in a transaction.
> +3. The device should be able to zero pad packet write completion to align it to
> +   64B or CPU cache line size whenever possible.
> +4. An example of the above DMA completion structure:
> +
> +```
> +/* Constant size receive packet completion */
> +struct vnet_rx_completion {
> +   u16 flags;
> +   u16 id; /* buffer id */
> +   u8 gso_type;
> +   u8 reserved[3];
> +   le16 gso_hdr_len;
> +   le16 gso_size;
> +   le16 csum_start;
> +   le16 csum_offset;
> +   u16 reserved2;
> +   u64 timestamp; /* explained later */
> +   u8 padding[];
> +};
> +```
> +5. The driver should be able to post constant-size buffer pages on a receive
> +   queue which can be consumed by the device for an incoming packet of any size
> +   from 64B to 9K bytes.
> +6. The device should be able to know the constant buffer size at receive
> +   virtqueue level instead of per buffer level.
> +7. The device should be able to indicate when a full page buffer is consumed,
> +   which can be recycled by the driver when the packets from the completed
> +   page is fully consumed.
> +8. The device should be able to consume multiple pages for a receive GSO stream.

If I understand correctly there is no longer a 1:1 correspondence
between driver-supplied rx pages (available buffers) and received
packets (used buffers). Instead, the device consumes portions of
driver-supplied rx pages as needed and notifies the driver, and the
entire rx page is marked used later when it has been fully consumed.

The virtqueue model is based on submitting available buffers and
completing used buffers, not individual DMA transfers. It's not possible
to do DMA piecewise in this model. If you think about a VIRTIO over TCP
transport that uses message-passing for available and used buffers, then
it's clear the rx page approach breaks the model because only entire
virtqueues buffers can be marked used (there is a 1:1 correspondence
between available buffers and used buffers).

Two options:
1. Extend the virtqueue model to support this.
2. Document this violation of the virtqueue model clearly but treat it
   as an exception that may lead to complications in the future (e.g.
   incompatibility with VIRTIO over TCP).

I think it's worth investigating #1 to see whether the virtqueue model
can be extended cleanly.

Stefan

--4s2x8rt324n47E2w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmT/GmMACgkQnKSrs4Gr
c8iefggAilF/D5RJgRXzRTahXKBLzxtXHqC99yX6+jITTz/HXA339bdoxHqafhsQ
PbczpKjzTaLz6CrgbwNuuHeeETRPpQhtTKvmDQ8WaGKYFE6zZiXQ0sy0P3AxigoS
166pXdIfh2anf+rjK8EXuABulsoT9Jf0kDf9UvlFzhGOAFa9FVeIrWqWIZncZ5YD
EZmBGipacXdZJRrgoYg0ABw4cZS7e61ufdJekHM40vheHJuF1HBDmdpwMcqGOPhL
+eDTHVkflpLGrTL1r6Y05Z9y6t46Uz2yTbHJsafieoPU112Xj2+DTIQ5Ukpbp4wf
t0C+Ajru5dTQdHZ0lBtSUlFFK4HOiA==
=dvlL
-----END PGP SIGNATURE-----

--4s2x8rt324n47E2w--

