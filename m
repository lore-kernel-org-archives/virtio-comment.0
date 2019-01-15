Return-Path: virtio-comment-return-588-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4EE72985B35
	for <virtio-comment@lists.oasis-open.org>; Tue, 15 Jan 2019 09:33:46 +0000 (UTC)
Date: Tue, 15 Jan 2019 10:33:37 +0100
From: Cornelia Huck <cohuck@redhat.com>
Message-ID: <20190115103337.2f15e4e0.cohuck@redhat.com>
In-Reply-To: <20190111185717.2ebb286c@oc2783563651>
References: <20190111114200.10026-1-dgilbert@redhat.com>
	<20190111114200.10026-2-dgilbert@redhat.com>
	<20190111131540.12a8abca.cohuck@redhat.com>
	<20190111162947.7a46e8df@oc2783563651>
	<20190111160723.GF2738@work-vm>
	<20190111185717.2ebb286c@oc2783563651>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] [PATCH 1/3] shared memory: Define shared
 memory regions
To: Halil Pasic <pasic@linux.ibm.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, virtio-comment@lists.oasis-open.org, stefanha@redhat.com
List-ID: <virtio-comment.lists.oasis-open.org>

On Fri, 11 Jan 2019 18:57:17 +0100
Halil Pasic <pasic@linux.ibm.com> wrote:

> On Fri, 11 Jan 2019 16:07:23 +0000
> "Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
>=20
> > > Do we want to change the device initialization (3.1) subsection? I'm =
not
> > > sure if this shared  memory region discovery is something that's
> > > supposed to be a part of the initialization. At the moment, I would g=
uess
> > > is the device not supposed to be able to provide new regions at any t=
ime
> > > (as I don't see how the device is supposed to tell the driver: hey
> > > please re-do discovery).    =20
> >=20
> > Yes, it's part of initialisation; although since the enumeration is
> > specific to the transport and the use is specific to the device, I'm not
> > sure what goes in a common initialization section. =20
>=20
> I think it does go in a common initialization. Virtqueues are also
> discovered in a transport specific way, and same goes for reading/writing=
 config.
>=20
> So I would add somethng to=20
> "7. Perform device-specific setup, including discovery of virtqueues for
> the device, optional per-bus setup, reading and possibly writing the
> device=E2=80=99s virtio configuration space, and population of virtqueues=
." in
> subsection 3.1.1.

Agreed, it probably makes sense to add shared memory region discovery
as an extra item to this list of things to be setup.

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
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf=0D
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists=0D
Committee: https://www.oasis-open.org/committees/virtio/=0D
Join OASIS: https://www.oasis-open.org/join/

