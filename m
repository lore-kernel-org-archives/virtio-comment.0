Return-Path: <virtio-comment-return-6153-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78874C77B73
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 13:09:55 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 9413A370E7
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 13:09:54 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7FBBA986492
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 13:09:54 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 6CEFA98648A; Tue,  6 Jun 2023 13:09:54 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5A30598648C
	for <virtio-comment@lists.oasis-open.org>; Tue,  6 Jun 2023 13:09:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: kIHW__BbMZKxP_CsdINKQg-1
Date: Tue, 6 Jun 2023 09:09:46 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: zhenwei pi <pizhenwei@bytedance.com>
Cc: parav@nvidia.com, mst@redhat.com, jasowang@redhat.com,
	virtio-comment@lists.oasis-open.org, houp@yusur.tech,
	helei.sig11@bytedance.com, xinhao.kong@duke.edu
Message-ID: <20230606130946.GB1958291@fedora>
References: <20230504081910.238585-1-pizhenwei@bytedance.com>
 <20230504081910.238585-5-pizhenwei@bytedance.com>
 <20230531152059.GF1248296@fedora>
 <c4621ae5-a677-8ecf-1b80-f598069cc0d4@bytedance.com>
 <20230605161143.GA1624556@fedora>
 <db292e92-a5ad-bb40-1148-d43463431b25@bytedance.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="M7vsVVs9oJQorBsj"
Content-Disposition: inline
In-Reply-To: <db292e92-a5ad-bb40-1148-d43463431b25@bytedance.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: Re: Re: Re: [virtio-comment] [PATCH v2 04/11] transport-fabrics:
 introduce Stream Transmission

--M7vsVVs9oJQorBsj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 06, 2023 at 11:13:01AM +0800, zhenwei pi wrote:
> On 6/6/23 00:11, Stefan Hajnoczi wrote:
> > On Fri, Jun 02, 2023 at 10:26:48AM +0800, zhenwei pi wrote:
> > > On 5/31/23 23:20, Stefan Hajnoczi wrote:
> > > > On Thu, May 04, 2023 at 04:19:03PM +0800, zhenwei pi wrote:
> > > > > +                  | +------+
> > > > > +                  | |flags |  -> VIRTIO_OF_DESC_F_WRITE
> > > > > +                  | +------+
> > > > > +                  |
> > > > > + DATA             |>+------+  -> 0
> > > > > +                    |......|
> > > > > +                    +------+  -> 1
> > > > > +\end{lstlisting}
> > > >=20
> > > > I think this is more flexible (and has more protocol overhead) than
> > > > necessary. When the device has used a virtqueue buffer, it indicate=
s how
> > > > many bytes were used (this can be less than the totaly number of F_=
WRITE
> > > > bytes available). I don't think there is a need to communicate F_WR=
ITE
> > > > descriptors, especially in the Completion. Just a Completion with a
> > > > 'length' field instead of an 'ndesc' field followed by data is enou=
gh.
> > > >=20
> > >=20
> > > I guest this is not enough. For example, a initiator want to read 3 d=
esc:
> > > desc0[n bytes], desc1[m bytes], desc2[1 byte]. desc[2] is expected to=
 read a
> > > u8 status.
> > >=20
> > > the target fills desc0[n - x bytes], desc1[m - y bytes], desc2[1 byte=
], the
> > > 'length' is (n - x + m - y + 1), we should decode each descriptor and=
 fill
> > > the driver buffer correctly.(otherwise, if x + y > 0, desc[2] is never
> > > filled)
> >=20
> > No, the framing really doesn't matter - that's what the spec says, after
> > all. The framing could be [n, m, 1] like in your example or [1, 1, n-2,
> > m-1, 1, 1], both are valid. What matters is that the device knows at
> > which offset the 1-byte status field must be written.
> >=20
> > It is the VIRTIO specification that determines how to find the offset,
> > not the framing of the virtqueue buffer elements. (Again, the spec
> > explicitly forbids depending on framing.)
> >=20
> > In other words, the virtio-blk spec says that the status byte is the
> > last writeable byte and that's how the device knows the offset. The
> > framing doesn't matter.
> >=20
> > > > Since VIRTIO has flexible framing
> > > > (https://docs.oasis-open.org/virtio/virtio/v1.2/csd01/virtio-v1.2-c=
sd01.html#x1-390004),
> > > > there isn't really a need to communicate the F_WRITE descriptors at=
 all,
> > > > just the maximum number of used bytes that the initiator expects.
> > > >=20
> > > > Can you explain why you chose to transmit F_WRITE descriptors in bo=
th
> > > > the Command and the Completion? Maybe I missed a reason why it's
> > > > important.
> > >=20
> > > Just keep the flags same to the descriptor from the command, give the
> > > initiator a hint 'this is a read descriptor'.
> >=20
> > Sending virtqueue element information across the wire seems inefficient
> > to me. I think the protocol can be optimized for stream (TCP) and keyed
> > (RDMA) fabrics by omitting aspects that are not strictly needed.
> >=20
> > Stefan
>=20
> Got it, thanks! By the way, for both command and completion, the descript=
ors
> are not necessary? A command like:
> struct virtio_of_command_vq {
>         le16 opcode;
>         le16 command_id;
>         le32 out_length;
>         le32 in_length;
>         u8 rsvd[4];
> };
>=20
> This seems enough ...

Yes.

Stefan

--M7vsVVs9oJQorBsj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmR/MBoACgkQnKSrs4Gr
c8h/Tgf/XYSc34dPcR2RdJZHwazS3v7xoeAsm55fq/+6rb0V34gIzS7zAPzCCPuo
dXglqDbxpjvA4C/E4eRCNMhWguOCbjUUnUScJX5FUwvB6fM4pvt1RYEixWbhM2lp
LionSGZN99JfOzV+jpgWjNACUvrsX5jcStuQhs+B8fKuFGqNvW3x6jVGuE1LgzEf
/B5/RLPLIj/qg/Dy6y8IkawWyp0efDF0xHjlzdQ/+deFItc8j3FFMt5x8789rtRx
Aq12x/RNPa7OER4WxJq26zTbZBtjdRtKUHz3V02mEDbGOUuerwxyNjtPISevTl6n
gd80fsnD/CfokpUoWqIZcByPFwtWjg==
=mvhh
-----END PGP SIGNATURE-----

--M7vsVVs9oJQorBsj--

