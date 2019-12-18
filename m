Return-Path: virtio-comment-return-1000-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 25A6B985EFF
	for <virtio-comment@lists.oasis-open.org>; Wed, 18 Dec 2019 15:18:45 +0000 (UTC)
Date: Wed, 18 Dec 2019 10:18:36 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20191218101823-mutt-send-email-mst@kernel.org>
References: <20191218131151.177694-1-keiichiw@chromium.org>
 <20191218134246.up6nwpgfjouhehig@sirius.home.kraxel.org>
 <CAD90VcbA0oGsV4gwNKTCtfnowrXEvc+PwiTwXyK3LNq6vU8NQw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAD90VcbA0oGsV4gwNKTCtfnowrXEvc+PwiTwXyK3LNq6vU8NQw@mail.gmail.com>
Subject: Re: [virtio-comment] Re: [PATCH v2] content: Reserve device ID for
 video encoder and decoder device
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
To: Keiichi Watanabe <keiichiw@chromium.org>
Cc: Gerd Hoffmann <kraxel@redhat.com>, virtio-comment@lists.oasis-open.org, Alexandre Courbot <acourbot@chromium.org>, Alex Lau <alexlau@chromium.org>, Dmitry Sepp <dmitry.sepp@opensynergy.com>, Enrico Granata <egranata@google.com>, Pawel Osciak <posciak@chromium.org>, David Stevens <stevensd@chromium.org>, Tomasz Figa <tfiga@chromium.org>
List-ID: <virtio-comment.lists.oasis-open.org>

On Wed, Dec 18, 2019 at 11:08:26PM +0900, Keiichi Watanabe wrote:
> On Wed, Dec 18, 2019 at 10:42 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
> >
> > On Wed, Dec 18, 2019 at 10:11:51PM +0900, Keiichi Watanabe wrote:
> > > Reserve device ID 30 for video encoder device and 31 for video decode=
r device.
> >
> > Hint: https://github.com/oasis-tcs/virtio-spec/blob/master/.github/PULL=
_REQUEST_TEMPLATE.md

> Thanks for the info. I didn't understand the approval process.
> I created https://github.com/oasis-tcs/virtio-spec/issues/67
>=20
> Best,
> Keiichi

And in particular:
https://github.com/oasis-tcs/virtio-spec/blob/master/README.md#use-of-githu=
b-issues

>=20
> >
> > > +30         &   Video encoder device \\
> > > +\hline
> > > +31         &   Video decoder device \\
> > > +\hline
> >
> > Acked-by: Gerd Hoffmann <kraxel@redhat.com>
> >
>=20
> This publicly archived list offers a means to provide input to the
> OASIS Virtual I/O Device (VIRTIO) TC.
>=20
> In order to verify user consent to the Feedback License terms and
> to minimize spam in the list archive, subscription is required
> before posting.
>=20
> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> List help: virtio-comment-help@lists.oasis-open.org
> List archive: https://lists.oasis-open.org/archives/virtio-comment/
> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-l=
ists
> Committee: https://www.oasis-open.org/committees/virtio/
> Join OASIS: https://www.oasis-open.org/join/


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

