Return-Path: virtio-comment-return-1811-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id AAFD59862C9
	for <virtio-comment@lists.oasis-open.org>; Wed, 31 Mar 2021 14:48:20 +0000 (UTC)
Date: Wed, 31 Mar 2021 15:48:13 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <YGSLreQSCe5CBZbY@stefanha-x1.localdomain>
References: <20210326090154.1144100-1-arseny.krasnov@kaspersky.com>
 <20210326090254.1144486-1-arseny.krasnov@kaspersky.com>
 <YGH8IqLRdh5JCZyT@stefanha-x1.localdomain>
 <230d95fd-29e8-465b-0ab2-b406d614c11b@kaspersky.com>
 <20210329212818.qdeprjhep745yeur@steredhat>
 <d6d92105-f7d4-74a3-4acc-fcfb40872b76@kaspersky.com>
 <YGLnfAxvy83jLkmG@stefanha-x1.localdomain>
 <2061f2ab-f3fc-c059-7cfc-a34b06f061fe@kaspersky.com>
 <YGMuVWL1waLpTkFI@stefanha-x1.localdomain>
 <64023aef-2e6b-b4bf-6569-ea71f7ee53de@kaspersky.com>
MIME-Version: 1.0
In-Reply-To: <64023aef-2e6b-b4bf-6569-ea71f7ee53de@kaspersky.com>
Subject: Re: [virtio-comment] Re: [MASSMAIL KLMS] Re: [virtio-comment] [RFC
 PATCH v4 2/2] virtio-vsock: SOCK_SEQPACKET description
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="eo5OAKzkethGLn+7"
Content-Disposition: inline
To: Arseny Krasnov <arseny.krasnov@kaspersky.com>
Cc: Stefano Garzarella <sgarzare@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>, "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Jorgen Hansen <jhansen@vmware.com>, Andra Paraschiv <andraprs@amazon.com>, Norbert Slusarek <nslusarek@gmx.net>, Colin Ian King <colin.king@canonical.com>, Alexander Popov <alex.popov@linux.com>, "virtualization@lists.linux-foundation.org" <virtualization@lists.linux-foundation.org>, "oxffffaa@gmail.com" <oxffffaa@gmail.com>
List-ID: <virtio-comment.lists.oasis-open.org>

--eo5OAKzkethGLn+7
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 30, 2021 at 05:24:19PM +0300, Arseny Krasnov wrote:
>=20
> On 30.03.2021 16:57, Stefan Hajnoczi wrote:
> > On Tue, Mar 30, 2021 at 12:50:06PM +0300, Arseny Krasnov wrote:
> >> On 30.03.2021 11:55, Stefan Hajnoczi wrote:
> >>> On Tue, Mar 30, 2021 at 09:15:39AM +0300, Arseny Krasnov wrote:
> >>>> On 30.03.2021 00:28, Stefano Garzarella wrote:
> >>>>> On Mon, Mar 29, 2021 at 08:33:27PM +0300, Arseny Krasnov wrote:
> >>>>>> On 29.03.2021 19:11, Stefan Hajnoczi wrote:
> >>>>>>> On Fri, Mar 26, 2021 at 12:02:50PM +0300, Arseny Krasnov wrote:
> >>>>>>>> @@ -98,6 +102,10 @@ \subsection{Device Operation}\label{sec:Devi=
ce Types / Socket Device / Device Op
> >>>>>>>>  #define VIRTIO_VSOCK_OP_CREDIT_UPDATE  6
> >>>>>>>>  /* Request the peer to send the credit info to us */
> >>>>>>>>  #define VIRTIO_VSOCK_OP_CREDIT_REQUEST 7
> >>>>>>>> +/* Message begin for SOCK_SEQPACKET */
> >>>>>>>> +#define VIRTIO_VSOCK_OP_SEQ_BEGIN      8
> >>>>>>>> +/* Message end for SOCK_SEQPACKET */
> >>>>>>>> +#define VIRTIO_VSOCK_OP_SEQ_END        9
> >>>>>>> The struct virtio_vsock_hdr->flags field is le32 and currently un=
used.
> >>>>>>> Could 24 bits be used for a unique message id and 8 bits for flag=
s? 1
> >>>>>>> flag bit could be used for end-of-message and the remaining 7 bit=
s could
> >>>>>>> be reserved. That way SEQ_BEGIN and SEQ_END are not necessary. =
=20
> >>>>>>> Pressure
> >>>>>>> on the virtqueue would be reduced and performance should be compa=
rable
> >>>>>>> to SOCK_STREAM.
> >>>>>> Well, my first versions of SOCK_SEQPACKET implementation, worked
> >>>>>> something like this: i used flags field of header as length of who=
le
> >>>>>> message. I discussed it with Stefano Garzarella, and he told that =
it=20
> >>>>>> will
> >>>>>> be better to use special "header" in packet's payload, to keep som=
e
> >>>>>> SOCK_SEQPACKET specific data, instead of reusing packet's header
> >>>>>> fields.
> >>>>> IIRC in the first implementation SEQ_BEGIN was an empty message and=
 we=20
> >>>>> didn't added the msg_id yet. So since we needed to carry both id an=
d=20
> >>>>> total length, I suggested to use the payload to put these extra=20
> >>>>> information.
> >>>>>
> >>>>> IIUC what Stefan is suggesting is a bit different and I think it sh=
ould=20
> >>>>> be cool to implement: we can remove the boundary packets, use only =
8=20
> >>>>> bits for the flags, and add a new field to reuse the 24 unused bits=
,=20
> >>>>> maybe also 16 bits would be enough.
> >>>>> At that point we will only use the EOR flag to know the last packet=
.
> >>>>>
> >>>>> The main difference will be that the receiver will know the total s=
ize=20
> >>>>> only when the last packet is received.
> >>>>>
> >>>>> Do you see any issue on that approach?
> >>>> It will work, except we can't check that any packet of message,
> >>>>
> >>>> except last(with EOR bit) was dropped, since receiver don't know
> >>>>
> >>>> real length of message. If it is ok, then i can implement it.
> >>> The credit mechanism ensures that packets are not dropped, so it's no=
t
> >>> necessary to check for this condition.
> >>>
> >>> By the way, is a unique message ID needed? My understanding is:
> >>>
> >>> If two messages are being sent on a socket at the same time either th=
eir
> >>> order is serialized (whichever message began first) or it is undefine=
d
> >>> (whichever message completes first).
> >> If we are talking about case, when two threads writes to one socket at=
 the same time,
> >>
> >> in Linux it is possible that two message will interleave(for vsock). B=
ut as i know, for example
> >>
> >> when TCP socket is used, both 'write()' calls will be serialized. May =
be it is bug of vsock: when
> >>
> >> first writer goes out of space, it will sleep. Then second writer trie=
s to send something, but
> >>
> >> as free space is over, it will sleep too. Then, credit update is recei=
ved from peer. Both sender's
> >>
> >> will be woken up, but sender which grab socket lock first will continu=
e to send it's message.
> >>
> >> So may be we can add something like semaphore to new/vmw_vsock/af_vsoc=
k.c which will
> >>
> >> serialize two 'write()' calls: second sender enters 'write()' path, on=
ly when first left this path.
> >>
> >> My implementation doesn't care about that, because i wanted to add sem=
aphore later, by another
> >>
> >> patch.
> > Yes, that is definitely an issue that the driver needs to take care of
> > if we don't have unique message IDs. Thanks for explaining!
>=20
> So may I=A0 include patch with serializer to next version of my patchset?

Sounds good!

Stefan

--eo5OAKzkethGLn+7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBki60ACgkQnKSrs4Gr
c8gcywf8C7gJ+mzpkp8Gk8SRmvGC5+FGkk7uZHjgJNthg/Or69C5+Z/UpgC7olHh
0GNvgoIQm2RRvN8UYpBuL7gPnsQWwiJEaQKyzBuOiVBXjrpKMAU6r5TYRHHfo0Ps
G1Ns8vr71xW89YqB3wiKcKhNufGyTa9tGmTk8P1/OOgAR8wU/m72lUkgbJstLLXZ
9zAD2wD+pbZSXFShSxMzd3pVI/1ayLyimLyM8OShNbwCAnc/xwjT+oMlw+ZUhGrf
e6W1akaf7NfVf1+DfxIp/v4/D1a8We70w5TVuwganUpfRvHGJHnByiYINHApTEe/
Qe3vSPLtz/CzP1xYj4NC2tMq+Gi1qw==
=ZymX
-----END PGP SIGNATURE-----

--eo5OAKzkethGLn+7--

