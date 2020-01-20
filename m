Return-Path: virtio-comment-return-1012-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 006A6985EA2
	for <virtio-comment@lists.oasis-open.org>; Mon, 20 Jan 2020 16:27:32 +0000 (UTC)
MIME-Version: 1.0
References: <471210655.12237442.1575436801606.JavaMail.zimbra@redhat.com>
 <20191211113112-mutt-send-email-mst@kernel.org> <CAOEp5OdzmRTrZoC78kSoWS4g=XP2DNW-q0Y8jAsAWUDw9_u6Ew@mail.gmail.com>
 <20191211130633-mutt-send-email-mst@kernel.org> <CAOEp5OcxWEHr5d0TkxBv4-W=EGC2tfuWA6QObkA=NL56SzQZOg@mail.gmail.com>
 <20191212023645-mutt-send-email-mst@kernel.org> <CAOEp5OdcjrC01OOB1c0uCJdBTM8G=5CgtvXg+5urKCH0knwHCQ@mail.gmail.com>
 <20191213021253-mutt-send-email-mst@kernel.org> <CAOEp5OekYCJt6=2=AordSpx5ZhM-nAe_f_KRgLjaj_T4LNDNXA@mail.gmail.com>
 <20191213033744-mutt-send-email-mst@kernel.org> <20200120111335-mutt-send-email-mst@kernel.org>
In-Reply-To: <20200120111335-mutt-send-email-mst@kernel.org>
From: Yuri Benditovich <yuri.benditovich@daynix.com>
Date: Mon, 20 Jan 2020 18:27:14 +0200
Message-ID: <CAOEp5OfgZbf+i=2rKdRBrzurvGn+L3FE2+dFhmQjLFyjY8F7Vg@mail.gmail.com>
Subject: Re: [virtio-comment] Re: [PATCH] virtio-net: define feature of
 per-packet RSS hash delivery
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Yuri Benditovich <ybendito@redhat.com>, virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

OK, I will send the next version of the patch.
I'm just waiting for merge of previous RSS patch to avoid heavy rebase.

On Mon, Jan 20, 2020 at 6:14 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Fri, Dec 13, 2019 at 03:38:11AM -0500, Michael S. Tsirkin wrote:
> > On Fri, Dec 13, 2019 at 10:21:53AM +0200, Yuri Benditovich wrote:
> > > On Fri, Dec 13, 2019 at 9:16 AM Michael S. Tsirkin <mst@redhat.com> w=
rote:
> > > >
> > > > On Fri, Dec 13, 2019 at 06:34:39AM +0200, Yuri Benditovich wrote:
> > > > >
> > > > > So there are 2 possible profiles of devices that 'do not have RSS=
' but
> > > > > deliver hash:
> > > > > 1. The device is in general can do RSS, but has only one pair of
> > > > > queues and does only hash calculation
> > > > > 2. The device has multiple queues but is configured to do auto
> > > > > steering and we want also hash from it.
> > > > >
> > > > > My impression is that case 2 is rather academic one (at least loo=
king forward).
> > > > > Do you agree?
> > > >
> > > > I am not sure I agree. auto mq is much easier to configure than RSS
> > > > so I image it's useful even if one wants hash.
> > >
> > > With RSS and hash delivery we're mainly targeting virtio-net in hardw=
are.
> > > Auto mq is much more complicated, correct?
> >
> > Hardware implementing it exists, it's not too hard, just some tables
> > to maintain.
>
> So what is the resolution here? To me it seems easier to just allow
> this than worry whether it's useful. And devices that do not
> want to support some combinations, don't have to, right?
>
> > > >
> > > > --
> > > > MST
> > > >
> >
> >
> > This publicly archived list offers a means to provide input to the
> > OASIS Virtual I/O Device (VIRTIO) TC.
> >
> > In order to verify user consent to the Feedback License terms and
> > to minimize spam in the list archive, subscription is required
> > before posting.
> >
> > Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> > Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> > List help: virtio-comment-help@lists.oasis-open.org
> > List archive: https://lists.oasis-open.org/archives/virtio-comment/
> > Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.p=
df
> > List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing=
-lists
> > Committee: https://www.oasis-open.org/committees/virtio/
> > Join OASIS: https://www.oasis-open.org/join/
>
>
> This publicly archived list offers a means to provide input to the
> OASIS Virtual I/O Device (VIRTIO) TC.
>
> In order to verify user consent to the Feedback License terms and
> to minimize spam in the list archive, subscription is required
> before posting.
>
> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> List help: virtio-comment-help@lists.oasis-open.org
> List archive: https://lists.oasis-open.org/archives/virtio-comment/
> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-l=
ists
> Committee: https://www.oasis-open.org/committees/virtio/
> Join OASIS: https://www.oasis-open.org/join/
>

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

