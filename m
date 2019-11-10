Return-Path: virtio-comment-return-905-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 30C3C985D79
	for <virtio-comment@lists.oasis-open.org>; Sun, 10 Nov 2019 16:25:02 +0000 (UTC)
References: <CA+dKekBHdNgwJJoqvLq5MdVG1ZHWMbyCKfOG8wFODqCW3t5Hkg@mail.gmail.com>
From: Matti Moell <Matti.Moell@opensynergy.com>
Message-ID: <8bf6f15e-71e7-cfb7-78ca-2240a06dc32b@opensynergy.com>
Date: Sun, 10 Nov 2019 17:24:53 +0100
MIME-Version: 1.0
In-Reply-To: <CA+dKekBHdNgwJJoqvLq5MdVG1ZHWMbyCKfOG8wFODqCW3t5Hkg@mail.gmail.com>
Content-Language: en-US
Subject: Re: [virtio-comment] Formal specification of virtIO
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
To: Matias Vara <matiasevara@gmail.com>, virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

Hi Matias,

I think that would be a great idea! It would have the added benefit that=20
the protocol data types and structures could be used to generate header=20
files so we could all have a true single information source for them=20
(thinking of virtio_gen from crosvm/firecracker here).

Making a formal model part of the specification could allow generating=20
some parts of the spec or at least validating the LaTeX itself against=20
the model. On the other hand it might also raise the barrier to add new=20
devices.

All in all, I'd be very interested to have a formal specification.

Cheers,

=09=09Matti

On 10.11.19 15:33, Matias Vara wrote:
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

