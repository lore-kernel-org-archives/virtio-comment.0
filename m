Return-Path: virtio-comment-return-925-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4D9B5985E71
	for <virtio-comment@lists.oasis-open.org>; Wed, 20 Nov 2019 13:19:19 +0000 (UTC)
Date: Wed, 20 Nov 2019 14:19:07 +0100
From: Cornelia Huck <cohuck@redhat.com>
Message-ID: <20191120141907.61908d8e.cohuck@redhat.com>
In-Reply-To: <20191120061559-mutt-send-email-mst@kernel.org>
References: <20191120082941.31561-1-cohuck@redhat.com>
	<20191120111023.GB242924@stefanha-x1.localdomain>
	<20191120061559-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Subject: Re: [virtio-comment] [PATCH] virtio-net: add missing articles for
 new hdr_len feature
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, virtio-comment@lists.oasis-open.org, Vitaly Mireyno <vmireyno@marvell.com>, Jason Wang <jasowang@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Wed, 20 Nov 2019 06:16:21 -0500
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Wed, Nov 20, 2019 at 11:10:23AM +0000, Stefan Hajnoczi wrote:
> > On Wed, Nov 20, 2019 at 09:29:41AM +0100, Cornelia Huck wrote: =20
> > > Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> > > ---
> > >=20
> > > Note: I have not added definite articles to the feature description; =
_all_
> > > features for virtio-net are described in that way, and we should add =
them
> > > in one go should we decide to change that.
> > >=20
> > > ---
> > >  content.tex | 6 +++---
> > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > >=20
> > > diff --git a/content.tex b/content.tex
> > > index 5d3f865956aa..452763bbbbc4 100644
> > > --- a/content.tex
> > > +++ b/content.tex
> > > @@ -3100,8 +3100,8 @@ \subsubsection{Packet Transmission}\label{sec:D=
evice Types / Network Device / De
> > >    \begin{itemize}
> > >    \item If the VIRTIO_NET_F_GUEST_HDRLEN feature has been negotiated=
,
> > >      \field{hdr_len} indicates the header length that needs to be rep=
licated
> > > -    for each packet. It's a number of bytes from beginning of the pa=
cket
> > > -    to beginning of the transport payload.
> > > +    for each packet. It's a number of bytes from the beginning of th=
e packet
> > > +    to the beginning of the transport payload. =20
> >=20
> > Another opportunity to tweak the text:
> > s/a number of bytes/the number of bytes/ is slightly clearer
> >=20
> > Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com> =20
>=20
> Post a patch? Or are you asking Cornelia to integrate that into hers?
>=20

That tweak makes sense; I'll send a v2.


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

