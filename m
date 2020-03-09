Return-Path: virtio-comment-return-1126-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6E35698425C
	for <virtio-comment@lists.oasis-open.org>; Mon,  9 Mar 2020 08:03:42 +0000 (UTC)
Date: Mon, 9 Mar 2020 04:03:34 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20200309035534-mutt-send-email-mst@kernel.org>
References: <CA+dKekBHdNgwJJoqvLq5MdVG1ZHWMbyCKfOG8wFODqCW3t5Hkg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+dKekBHdNgwJJoqvLq5MdVG1ZHWMbyCKfOG8wFODqCW3t5Hkg@mail.gmail.com>
Subject: Re: [virtio-comment] Formal specification of virtIO
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
To: Matias Vara <matiasevara@gmail.com>
Cc: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

On Sun, Nov 10, 2019 at 03:33:20PM +0100, Matias Vara wrote:
> Hello everyone,
>=20
> I have started to think of the formalization of the virtIO specification.
> Roughly speaking, I could use a formal language to "code" the virtIO spec=
. As
> far as I can think, this has three benefits:=A0
> 1. You can validate any implementation.
> 2. You can generate the implementation for a given target. For example, y=
ou
> could be able to generate the implementation of a virtIO device in VHDL.=
=A0
> 3. You can provide simulation and verification before any implementation.=
 In
> automotive, this is interesting because you ease the certification so
> formalization pays off.=A0
>=20
> Do you think this may be interesting work to do to become the virtIO
> specification more robust?=A0
>=20
> Regards, Matias.=A0 =A0 =A0 =A0

I think the most intersting thing to model would be the virtqueue for
systems with weak memory concurrency. Right now we have two virtqueue
formats and getting concurrency right is the hardest part.  Having a
formal model would be useful so we can extend the ring. Paul E.
McKenney's talks gave me the impression that modeling any kind of weak
memory concurrency is very challenging though.

--=20
MST


This publicly archived list offers a means to provide input to the=0D
OASIS Virtual I/O Device (VIRTIO) TC.=0D
=0D
In order to verify user consent to the Feedback License terms and=0D
to minimize spam in the list archive, subscription is required=0D
before posting.=0D
=0D
Subscribe: virtio-comment-subscribe@lists.oasis-open.org=0D
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org=0D
List help: virtio-comment-help@lists.oasis-open.org=0D
List archive: https://lists.oasis-open.org/archives/virtio-comment/=0D
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf=
=0D
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lis=
ts=0D
Committee: https://www.oasis-open.org/committees/virtio/=0D
Join OASIS: https://www.oasis-open.org/join/

