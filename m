Return-Path: virtio-comment-return-1106-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DB376985E3D
	for <virtio-comment@lists.oasis-open.org>; Thu, 27 Feb 2020 09:57:56 +0000 (UTC)
Date: Thu, 27 Feb 2020 04:57:47 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20200227045632-mutt-send-email-mst@kernel.org>
References: <20200220064657.8345-1-yuri.benditovich@daynix.com>
 <CAOEp5Od3h1RXQxFNW4bnugK1BVS26CxM+zHsAUo7GsZpAvXJrQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOEp5Od3h1RXQxFNW4bnugK1BVS26CxM+zHsAUo7GsZpAvXJrQ@mail.gmail.com>
Subject: [virtio-comment] Re: [PATCH v5 0/1] Define VIRTIO_NET_F_HASH_REPORT feature
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
To: Yuri Benditovich <yuri.benditovich@daynix.com>
Cc: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

On Thu, Feb 27, 2020 at 11:49:50AM +0200, Yuri Benditovich wrote:
> If seems OK, please initiate the ballot

Sure. Please update the main description - it seems to be incomplete -
and include the final proposal link the in the main description -
it's in the comments now. Then let me know.

> On Thu, Feb 20, 2020 at 8:47 AM Yuri Benditovich
> <yuri.benditovich@daynix.com> wrote:
> >
> > Changes from v4:
> > Added padding_reserved field to the packet layout
> > Renamed hash_type field in the packet layout to hash_report
> >
> > Changes from v3:
> > Rebased to latest master branch
> > Changes feature number to 57 (as 58 is under discussion)
> > Minor changes according to v3 review
> >
> > Yuri Benditovich (1):
> >   virtio-net: Define per-packet hash reporting feature
> >
> >  content.tex | 348 ++++++++++++++++++++++++++++++++++------------------
> >  1 file changed, 230 insertions(+), 118 deletions(-)
> >
> > --
> > 2.17.1
> >


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

