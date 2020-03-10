Return-Path: virtio-comment-return-1133-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 70CE5985FCB
	for <virtio-comment@lists.oasis-open.org>; Tue, 10 Mar 2020 18:35:32 +0000 (UTC)
Date: Tue, 10 Mar 2020 19:35:25 +0100
From: Matias Ezequiel Vara Larsen <matiasevara@gmail.com>
Message-ID: <20200310183525.GA37@matiasv.localdomain>
References: <CA+dKekBHdNgwJJoqvLq5MdVG1ZHWMbyCKfOG8wFODqCW3t5Hkg@mail.gmail.com>
 <20200309035534-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20200309035534-mutt-send-email-mst@kernel.org>
Subject: Re: [virtio-comment] Formal specification of virtIO
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

On Mon, Mar 09, 2020 at 04:03:34AM -0400, Michael S. Tsirkin wrote:
> On Sun, Nov 10, 2019 at 03:33:20PM +0100, Matias Vara wrote:
> > Hello everyone,
> >=20
> > I have started to think of the formalization of the virtIO specificatio=
n.
> > Roughly speaking, I could use a formal language to "code" the virtIO sp=
ec. As
> > far as I can think, this has three benefits:=A0
> > 1. You can validate any implementation.
> > 2. You can generate the implementation for a given target. For example,=
 you
> > could be able to generate the implementation of a virtIO device in VHDL=
.=A0
> > 3. You can provide simulation and verification before any implementatio=
n. In
> > automotive, this is interesting because you ease the certification so
> > formalization pays off.=A0
> >=20
> > Do you think this may be interesting work to do to become the virtIO
> > specification more robust?=A0
> >=20
> > Regards, Matias.=A0 =A0 =A0 =A0
>=20
> I think the most intersting thing to model would be the virtqueue for
> systems with weak memory concurrency. Right now we have two virtqueue
> formats and getting concurrency right is the hardest part.  Having a
> formal model would be useful so we can extend the ring. Paul E.
> McKenney's talks gave me the impression that modeling any kind of weak
> memory concurrency is very challenging though.
>=20

Thanks Michael for your answer. Modeling weak memory concurrency sounds ver=
y challenging.
Other possible use of a model could be to verify that an implementation fol=
lows the
specification. To do so, the model must contain information information abo=
ut how=20
the driver and device shall behave, e.g., set DriverOK before initialize th=
e virtqueues.
I think this may be easier to achieve. I do not know if this is interesting=
 though.   =20

Regards, Matias.
> --=20
> MST
>=20

This publicly archived list offers a means to provide input to the
OASIS Virtual I/O Device (VIRTIO) TC.

In order to verify user consent to the Feedback License terms and
to minimize spam in the list archive, subscription is required
before posting.

Subscribe: virtio-comment-subscribe@lists.oasis-open.org
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
List help: virtio-comment-help@lists.oasis-open.org
List archive: https://lists.oasis-open.org/archives/virtio-comment/
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lis=
ts
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

