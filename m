Return-Path: <virtio-comment-return-6141-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2299DC7EE2D
	for <virtio-comment@archiver.kernel.org>; Mon,  5 Jun 2023 17:05:35 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 4DC1268468
	for <virtio-comment@archiver.kernel.org>; Mon,  5 Jun 2023 17:05:34 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 359F6986461
	for <virtio-comment@archiver.kernel.org>; Mon,  5 Jun 2023 17:05:34 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 253C798644A; Mon,  5 Jun 2023 17:05:34 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 83C1098645C
	for <virtio-comment@lists.oasis-open.org>; Mon,  5 Jun 2023 17:05:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: KqL8B3dIMPO_SR_GT5dAlQ-1
Date: Mon, 5 Jun 2023 13:05:14 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: zhenwei pi <pizhenwei@bytedance.com>, mst@redhat.com,
	jasowang@redhat.com, virtio-comment@lists.oasis-open.org,
	houp@yusur.tech, helei.sig11@bytedance.com, xinhao.kong@duke.edu
Message-ID: <20230605170514.GE1624556@fedora>
References: <20230504081910.238585-1-pizhenwei@bytedance.com>
 <20230504081910.238585-3-pizhenwei@bytedance.com>
 <20230531140640.GD1248296@fedora>
 <1572fc8c-2c92-10df-e109-6586a9692e0a@bytedance.com>
 <7238af9f-25e3-8490-a8dd-ee63435caba7@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="I8MgKczVJV1L28vY"
Content-Disposition: inline
In-Reply-To: <7238af9f-25e3-8490-a8dd-ee63435caba7@nvidia.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: Re: [virtio-comment] [PATCH v2 02/11] transport-fabrics: introduce
 Virtio Qualified Name

--I8MgKczVJV1L28vY
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 04, 2023 at 10:40:06PM -0400, Parav Pandit wrote:
>=20
>=20
> On 6/1/2023 9:50 PM, zhenwei pi wrote:
> >=20
> >=20
> > On 5/31/23 22:06, Stefan Hajnoczi wrote:
> > > On Thu, May 04, 2023 at 04:19:01PM +0800, zhenwei pi wrote:
> > > > Add VQN section. The VQN is a little different from iSCSI/NVMe-oF on
> > > > style limitation. Because iSCSI/NVMe-of is storage specific protoco=
l,
> > > > the full string IQN(for iSCSI/iSER) and NQN(for NVMe-oF) represents
> > > > a "storage access address". However, Virtio Over Fabrics works as
> > > > transport layer rather than device layer, a URL style string is bet=
ter
> > > > to Virtio Over Fabrics. For example:
> > > > virtio-of://blk-resource/nvme-pool/849a39ad-8d7b-4a7a-adb6-e7407ace=
532c
> > > > virtio-of://blk-resource/hdd-pool/238151a7-acd7-4621-bbdf-382ddbccb=
6a1
> > > > ...
> > > > virtio-of://crypto-resource/25307f22-e5a8-4ea2-b7ca-79f5c3bebc3c
> > >=20
> > > I'm not sure what blk-resource and nvme-pool are in these URLs?
> > >=20
> > > Should the patch mention the virtio-of:// URI scheme?
> > >=20
> >=20
> > Sorry, I missed the address and port. They should be:
> > virtio-rdma://192.168.1.100:8549/blk-resource/nvme-pool/849a39ad-8d7b-4=
a7a-adb6-e7407ace532c
> > virtio-tcp://192.168.1.110/blk-resource/hdd-pool/238151a7-acd7-4621-bbd=
f-382ddbccb6a1
>=20
> Since it is device specific resource, may be blk-dev or blk-device reads
> better, as behind this device there are multiple resources.
>=20
> > ...
> >=20
> > This is human readable string. when the software(or hardware) handles
> > this, this should be translated into:
> > transport: RDMA
> > address: 192.168.1.100
> > port: 8549 (default port 8549(CRC-16/ARC of "Virtio"))
> > target VQN: blk-resource/hdd-pool/238151a7-acd7-4621-bbdf-382ddbccb6a1
> >=20
> > This section only defines the "VQN" schema, not the resource string sch=
ema.
> >=20
> > For a process, I think the following two are both fine:
> > ./foo --full-url virtio-rdma://192.168.1.100:8549/blk-resource/nvme-poo=
l/849a39ad-8d7b-4a7a-adb6-e7407ace532c
> > ./foo --transport rdma --address 192.168.1.100 --port 8549 --tvqn
> > blk-resource/hdd-pool/238151a7-acd7-4621-bbdf-382ddbccb6a1
> >=20
> > [snip]
> >=20
> > >=20
> > > Is the maximum name 255 UTF-8 bytes plus a NUL character? Please state
> > > this in the spec. For example:
> > >=20
> > > =A0=A0 \item The string is NUL terminated.
> s/NUL/NULL ?

I like to use the ASCII "NUL" character name because that avoids
confusion with other concepts of nullness in programming:

  "It is often abbreviated as NUL (or NULL, though in some contexts that
  term is used for the null pointer)"

https://en.wikipedia.org/wiki/NUL_character

Stefan

--I8MgKczVJV1L28vY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmR+FcoACgkQnKSrs4Gr
c8gvYwf/dNUeVQuVuzQZCv7Y+x2I2zrAG9MmcuQn/pORwpWRmHT2v7nPyq/NLycV
O+1ISe0i2H1Ddo6EHuTVOMyaNJDRC9bvDuUpQyu4VK1c/V0ASosBAT8t7yBm3RIG
fkSN3OfwM28oWcAJDXnwKDm5+qsWQ3xJDplXUNEkillcb05eft8bDEbB6iDhqTbv
1FberjXZA5rti4m8DdtgNTj1257Kno510LSNGRX/jrEXvl/r+hJU//GIcnPUksv4
wOlwVakrx/V9bMP13pRREI413QrHQj6X/XhKbLYo8X5bvAhJO2gNlsn7vdA6mxYu
lmKjDhoMwtbKjiZBdtbaBQYkoA5fMg==
=9EeC
-----END PGP SIGNATURE-----

--I8MgKczVJV1L28vY--

