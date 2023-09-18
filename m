Return-Path: <virtio-comment-return-7458-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA238CD37B0
	for <virtio-comment@archiver.kernel.org>; Mon, 18 Sep 2023 18:20:32 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 0CA6C1922EA
	for <virtio-comment@archiver.kernel.org>; Mon, 18 Sep 2023 18:20:32 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DD5389864C1
	for <virtio-comment@archiver.kernel.org>; Mon, 18 Sep 2023 18:20:31 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id C43F698640C; Mon, 18 Sep 2023 18:20:31 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B221C98640D
	for <virtio-comment@lists.oasis-open.org>; Mon, 18 Sep 2023 18:20:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: wSF1iOQONOSoQnDzkEbHug-1
Date: Mon, 18 Sep 2023 14:20:02 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	virtualization@lists.linux-foundation.org,
	virtio-comment@lists.oasis-open.org, anton.yakovlev@opensynergy.com,
	mst@redhat.com, jasowang@redhat.com
Message-ID: <20230918182002.GA1460476@fedora>
References: <ZQHPeD0fds9sYzHO@pc-79.home>
 <CABgObfbXsHN6=ZmL0s+mtCypXs11LNECECO3Uud_J6PMr+JwNA@mail.gmail.com>
 <CAAjaMXbjRn27fpZHK982m4MyJGXWQTR99WHPAZQfcun+pe3GBw@mail.gmail.com>
 <ZQhHgTxoUAnfYaiC@fedora>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zJydkDeRaTd180Sh"
Content-Disposition: inline
In-Reply-To: <ZQhHgTxoUAnfYaiC@fedora>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: Re: [virtio-comment] virtio-sound linux driver conformance to spec

--zJydkDeRaTd180Sh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 18, 2023 at 02:50:09PM +0200, Matias Ezequiel Vara Larsen wrote:
> On Wed, Sep 13, 2023 at 06:58:30PM +0300, Manos Pitsidianakis wrote:
> > Hello Matias,
> >=20
> > Please show and refer to code snippets from the kernel tree that you
> > think are related to your question. It'd help us make sure we all talk
> > about the same thing.
> >=20
>=20
> In this discussion, I am referring to the way in which the virtio-sound
> driver is manipulating buffers that have been consumed by the device,
> e.g., used-ring in the tx queue. My understanding is the driver builds a
> ring-buffer that is shared with the user application in the guest. As
> soon as the device returns a buffer to the used ring, the driver puts
> the request in the available ring again. This is my understanding from
> sound/virtio/virtio_pcm_msg.c#L324. The user application updates the
> content of the buffer at sound/virtio/virtio_pcm_msg.c#L322, but this
> task is deferred by using schedule_work(). The update of the buffer may
> happen once the buffers are already in the available ring.

The driver cannot rely on the device accessing the buffer via shared
memory at a specific time. The device may process the buffer as soon as
the driver marks the buffer available and/or the buffer may not be in
shared memory (there is a discussion about virtio over TCP).

I haven't looked at the code myself, but based on your interpretation it
seems the driver is buggy. Buffers should only be submitted when the
buffer contents are no longer subject to change.

Stefan

--zJydkDeRaTd180Sh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmUIlNIACgkQnKSrs4Gr
c8gcmwf8Df9rJohbFP1qGja+l4i5Qx86HPvGYk0inmxdiEMC7hMNOc7C73E5pkh3
uiTH4KuABzib9MPdmP1w0Ci/8rLtUA+5w6pF9oNCezLmzH4CuvuGsCYplKhX6Bcb
b/B7c9qaRNja0dTwJ8eMcyC5VBik6gckl1HKDGY0QwH588/zGHeRNHBx3WHQeffZ
fDEjGzPunG2ClPuoxMQUCUBmcf+SE1j6rdf3Gj+ZI3mOdeSAYVr9x+5+l/B5Fcqa
586ublOohmb4C7kZzOmm/1QHxHYIiR/p17Y3U2In+CLvOxWR1dW+gvXIiZS90l6C
2tdzU7UqcAVECoCCDMI+XZLAXHnZBQ==
=iQnx
-----END PGP SIGNATURE-----

--zJydkDeRaTd180Sh--

