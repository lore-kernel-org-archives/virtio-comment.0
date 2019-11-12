Return-Path: virtio-comment-return-914-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 93621985F15
	for <virtio-comment@lists.oasis-open.org>; Tue, 12 Nov 2019 19:57:01 +0000 (UTC)
Date: Tue, 12 Nov 2019 20:56:56 +0100
From: Matias Ezequiel Vara Larsen <matiasevara@gmail.com>
Message-ID: <20191112195656.GB257@matiasv.localdomain>
References: <CA+dKekBHdNgwJJoqvLq5MdVG1ZHWMbyCKfOG8wFODqCW3t5Hkg@mail.gmail.com>
 <20191111113410.GF442334@stefanha-x1.localdomain>
 <CA+dKekDZsJXd_xhmWFtSypncBRe_CZBxSmK8J5Orn3vMPkHVUg@mail.gmail.com>
 <20191112102929.GD463128@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <20191112102929.GD463128@stefanha-x1.localdomain>
Subject: Re: [virtio-comment] Formal specification of virtIO
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

On Tue, Nov 12, 2019 at 10:29:29AM +0000, Stefan Hajnoczi wrote:
> On Mon, Nov 11, 2019 at 08:07:06PM +0100, Matias Vara wrote:
> > On Mon, 11 Nov 2019 at 12:34, Stefan Hajnoczi <stefanha@redhat.com> wro=
te:
> >=20
> > > On Sun, Nov 10, 2019 at 03:33:20PM +0100, Matias Vara wrote:
> > > > I have started to think of the formalization of the virtIO specific=
ation.
> > > > Roughly speaking, I could use a formal language to "code" the virtI=
O
> > > spec.
> > > > As far as I can think, this has three benefits:
> > > > 1. You can validate any implementation.
> > > > 2. You can generate the implementation for a given target. For exam=
ple,
> > > you
> > > > could be able to generate the implementation of a virtIO device in =
VHDL.
> > > > 3. You can provide simulation and verification before any implement=
ation.
> > > > In automotive, this is interesting because you ease the certificati=
on so
> > > > formalization pays off.
> > > >
> > > > Do you think this may be interesting work to do to become the virtI=
O
> > > > specification more robust?
> > >
> > > As a starting point you could propose a formal model of an aspect of =
the
> > > specification, like the device lifecycle VIRTIO_CONFIG_S_* status
> > > register state machine (start easy!).
> > >
> > > It would already offer the advantages you mentioned for a subset of t=
he
> > > specification and give the community a chance to get familiar with th=
e
> > > tools and workflow.
> > >
> > > Even if it turns out to be impractical to formalize the entire VIRTIO
> > > specification, it will certainly reveal things that can be improved i=
n
> > > the current spec.
> > >
> > > Stefan
> > >
> >=20
> > Thanks for the comments. First, I would capture data structures by usin=
g a
> > metamodel. This would allow generating the structures depending on the
> > target language, e.g., C, Rust, Latex. To do this, it is needed a
> > model-to-text transformation. Then, I would base on a subset of the
> > specification to describe the behavior by using a formal language. The
> > VIRTIO_CONFIG_S_* status register state machine may be a good candidate=
 for
> > starting. I will keep you updated on the progress.
>=20
> By the way, the virtqueue is the most interesting aspect of VIRTIO.
> Formalizing the split and packed virtqueue layouts would do the most to
> ensure correctness.  They are non-trivial though :).
>=20
> Stefan

The metamodel would contain concepts like VirtQueue and VirtIOAvailable rin=
g, and the relation
between these concepts, e.g., "a virtqueue has a reference to a
VirtIOAvailable ring". This can be used to validate data structures. Howeve=
r, these are only=20
syntactic relationships. A second step would be to add behavior. For exampl=
e, by adding events
and causality relationships between.=20

Matias

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

