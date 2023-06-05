Return-Path: <virtio-comment-return-6139-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41387C7EE24
	for <virtio-comment@archiver.kernel.org>; Mon,  5 Jun 2023 16:46:23 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 70FDA370EB
	for <virtio-comment@archiver.kernel.org>; Mon,  5 Jun 2023 16:46:22 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5721F986488
	for <virtio-comment@archiver.kernel.org>; Mon,  5 Jun 2023 16:46:22 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 4090E986449; Mon,  5 Jun 2023 16:46:22 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2F17398644A
	for <virtio-comment@lists.oasis-open.org>; Mon,  5 Jun 2023 16:46:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 189mfvb2O2GvdM-3ZrJPQQ-1
Date: Mon, 5 Jun 2023 12:46:14 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: zhenwei pi <pizhenwei@bytedance.com>
Cc: parav@nvidia.com, mst@redhat.com, jasowang@redhat.com,
	virtio-comment@lists.oasis-open.org, houp@yusur.tech,
	helei.sig11@bytedance.com, xinhao.kong@duke.edu
Message-ID: <20230605164614.GC1624556@fedora>
References: <20230504081910.238585-1-pizhenwei@bytedance.com>
 <20230504081910.238585-8-pizhenwei@bytedance.com>
 <20230531205508.GA1509630@fedora>
 <3775beed-5e2b-0835-d257-f495b16fba0f@bytedance.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="W02nYXgya0mmdetm"
Content-Disposition: inline
In-Reply-To: <3775beed-5e2b-0835-d257-f495b16fba0f@bytedance.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: [virtio-comment] Re: Re: [PATCH v2 07/11] transport-fabrics: introduce opcodes

--W02nYXgya0mmdetm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 02, 2023 at 04:39:24PM +0800, zhenwei pi wrote:
> On 6/1/23 04:55, Stefan Hajnoczi wrote:
> > On Thu, May 04, 2023 at 04:19:06PM +0800, zhenwei pi wrote:
> > Does virtio_of_op_get_device_feature return the feature bits offered by
> > the device or does it update to reflect negotiated feature bits after
> > virtio_of_op_set_driver_feature?
> >=20
>=20
> virtio_of_op_get_device_feature returns the same feature bits after
> virtio_of_op_set_driver_feature. Because 1) the device feature is capabil=
ity
> of device, 2) a target may be shared by multi initiators.
>=20
> For now, I don't see any dependence on getting driver feature. Do you have
> any concern about this?

No, that sounds good. I just want the semantics to be clearly defined
because VIRTIO Transports differ in whether the driver can read back
feature bits after negotiation. Doing so is not necessary because the
Device Status Field already indicates whether or not feature bit
negotiation was successful.

>=20
> > > +
> > > +\paragraph{virtio_of_op_set_driver_feature}\label{sec:Virtio Transpo=
rt Options / Virtio Over Fabrics / Transmission Protocol / Opcodes Definiti=
on / virtio_of_op_set_driver_feature}
> > > +
> > > +virtio_of_op_set_driver_feature is used to set driver feature for co=
ntrol queue only.
> > > +The initiator MUST issue a \nameref{sec:Virtio Transport Options / V=
irtio Over Fabrics / Transmission Protocol / Commands Definition / Feature =
Command},
> > > +and specify the value field of Common Command as le64.
> > > +
> > > +The initiator uses feature_select field to select which feature bits=
 to set.
> > > +Value 0x0 selects Feature Bits 0 to 63, 0x1 selects Feature Bits 64 =
to 128, etc.
> > > +
> > > +\paragraph{virtio_of_op_get_num_queues}\label{sec:Virtio Transport O=
ptions / Virtio Over Fabrics / Transmission Protocol / Opcodes Definition /=
 virtio_of_op_get_num_queues}
> > > +
> > > +virtio_of_op_get_num_queues is used to get the number of queues for =
control queue only.
> > > +The initiator MUST issue a \nameref{sec:Virtio Transport Options / V=
irtio Over Fabrics / Transmission Protocol / Commands Definition / Common C=
ommand},
> > > +and reads from value field of Completion as le16.
> > > +
> > > +\paragraph{virtio_of_op_get_queue_size}\label{sec:Virtio Transport O=
ptions / Virtio Over Fabrics / Transmission Protocol / Opcodes Definition /=
 virtio_of_op_get_queue_size}
> > > +
> > > +virtio_of_op_get_queue_size is used to get the size of a specified q=
ueue for control queue only.
> > > +The initiator MUST issue a \nameref{sec:Virtio Transport Options / V=
irtio Over Fabrics / Transmission Protocol / Commands Definition / Queue Co=
mmand} with specified queue_id,
> > > +and reads from value field of Completion as le16.
> >=20
> > Is it possible to set the queue size? For example, the PCI Transport
> > allows the driver to lower the queue size but not increase it (see
> > 4.1.5.1.3 Virtqueue Configuration).
> >=20
>=20
> Agree. Because a target may be shared by multi initiators, it's not
> reasonable to set queue size of target, the queue size only affect this
> initiator itself.
> For example, a target supports queue size 1024. initiatorX uses 128 queue
> size, and initiatorY uses 1024. Do you have any suggestion about this?

I assumed that there is a 1:1 mapping between VIRTIO Over Fabrics
Targets (TVQN + Target ID) and VIRTIO Devices. I expected initiatorY's
Connect Command to be rejected by the target when initiatorX is already
connected. Therefore there is no conflict between two initiators
choosing different queue sizes.

Anyway, I see no issue with allowing the initiator to reduce the queue
size. This allows the target to allocate fewer resources to the device
until the next device reset.

Stefan

--W02nYXgya0mmdetm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmR+EVYACgkQnKSrs4Gr
c8gzZAf/XCySNuZ7IafG8RXF8y9S58Z9TU//hLtNYXjIU+FYSkGxGD1Jle39OSim
OZxUoEnMk3mhNc644DhUuWJ1N7e5mGaCjc+8SNmKION5kTyJSqcsgAfQVdrsjWaq
mx8YGWGG70APBFGhe9Yonb8z2Q9xL2UGbQ6kw2gb44xGD+1GeLP/Zm+nCOaFCj42
bbUeSazqrs+QeCy7xq9ly6NIp9RnC85ligRrwQcwXoMgfl2HaN87aAUmYDg4aovM
72bbOSwmYJ6xyQXrenoL8Vxbm7otPIEe9r0NUEean1MKCBeZJucgnZcl2fJO6y3u
DdPR3i75znECXOMoY9QhhpL7zIPcUg==
=j8Rg
-----END PGP SIGNATURE-----

--W02nYXgya0mmdetm--

