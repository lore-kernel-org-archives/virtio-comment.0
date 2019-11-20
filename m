Return-Path: virtio-comment-return-924-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 19685985E6F
	for <virtio-comment@lists.oasis-open.org>; Wed, 20 Nov 2019 11:16:32 +0000 (UTC)
Date: Wed, 20 Nov 2019 06:16:21 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20191120061559-mutt-send-email-mst@kernel.org>
References: <20191120082941.31561-1-cohuck@redhat.com>
 <20191120111023.GB242924@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <20191120111023.GB242924@stefanha-x1.localdomain>
Subject: Re: [virtio-comment] [PATCH] virtio-net: add missing articles for
 new hdr_len feature
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Cornelia Huck <cohuck@redhat.com>, virtio-comment@lists.oasis-open.org, Vitaly Mireyno <vmireyno@marvell.com>, Jason Wang <jasowang@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Wed, Nov 20, 2019 at 11:10:23AM +0000, Stefan Hajnoczi wrote:
> On Wed, Nov 20, 2019 at 09:29:41AM +0100, Cornelia Huck wrote:
> > Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> > ---
> >=20
> > Note: I have not added definite articles to the feature description; _a=
ll_
> > features for virtio-net are described in that way, and we should add th=
em
> > in one go should we decide to change that.
> >=20
> > ---
> >  content.tex | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/content.tex b/content.tex
> > index 5d3f865956aa..452763bbbbc4 100644
> > --- a/content.tex
> > +++ b/content.tex
> > @@ -3100,8 +3100,8 @@ \subsubsection{Packet Transmission}\label{sec:Dev=
ice Types / Network Device / De
> >    \begin{itemize}
> >    \item If the VIRTIO_NET_F_GUEST_HDRLEN feature has been negotiated,
> >      \field{hdr_len} indicates the header length that needs to be repli=
cated
> > -    for each packet. It's a number of bytes from beginning of the pack=
et
> > -    to beginning of the transport payload.
> > +    for each packet. It's a number of bytes from the beginning of the =
packet
> > +    to the beginning of the transport payload.
>=20
> Another opportunity to tweak the text:
> s/a number of bytes/the number of bytes/ is slightly clearer
>=20
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

Post a patch? Or are you asking Cornelia to integrate that into hers?


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

