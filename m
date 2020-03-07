Return-Path: virtio-comment-return-1125-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1DC33985FCB
	for <virtio-comment@lists.oasis-open.org>; Sat,  7 Mar 2020 20:34:25 +0000 (UTC)
Date: Sat, 7 Mar 2020 21:34:19 +0100
From: Matias Ezequiel Vara Larsen <matiasevara@gmail.com>
Message-ID: <20200307203419.GB32@matiasv.localdomain>
References: <CA+dKekBHdNgwJJoqvLq5MdVG1ZHWMbyCKfOG8wFODqCW3t5Hkg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+dKekBHdNgwJJoqvLq5MdVG1ZHWMbyCKfOG8wFODqCW3t5Hkg@mail.gmail.com>
Subject: [virtio-comment] Re: Formal specification of virtIO
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
To: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

Hello,

I am investigating the possibility to use a higher-level language to
describe virtio concepts. I am writing down this research at
https://github.com/MatiasVara/virtioml. I defined a metamodel that
captures concepts and relationships between these concepts. I also built
a simple transformation to generate the headers in C. This transformation
may be extended to other languages. I am currently investigating the
possibility to model the VIRTIO_CONFIG_S_* status register state machine to=
 verify
that a virtio driver follows the specification. To do this, I am first usin=
g
a formalism to encode the specification, and from that code, I generate
the instrumentation code that goes in the driver. The instrumentation code=
=20
warns when the specification is violated. This is, however, a very draft wo=
rk.

Regards, Matias.

On Sun, Nov 10, 2019 at 03:33:20PM +0100, Matias Vara wrote:
> Hello everyone,
>=20
> I have started to think of the formalization of the virtIO specification.
> Roughly speaking, I could use a formal language to "code" the virtIO spec=
.
> As far as I can think, this has three benefits:
> 1. You can validate any implementation.
> 2. You can generate the implementation for a given target. For example, y=
ou
> could be able to generate the implementation of a virtIO device in VHDL.
> 3. You can provide simulation and verification before any implementation.
> In automotive, this is interesting because you ease the certification so
> formalization pays off.
>=20
> Do you think this may be interesting work to do to become the virtIO
> specification more robust?
>=20
> Regards, Matias.

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

