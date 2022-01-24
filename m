Return-Path: <qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH 1/2] Add VIRTIO_RING_F_INDIRECT_SIZE
Date: Mon, 24 Jan 2022 15:24:43 +0100
Message-ID: <1969031.2ol2gXnArA@silver>
In-Reply-To: <877dapl1i8.fsf@redhat.com>
References: <cover.1639494803.git.qemu_oss@crudebyte.com> <Ye6ksdW5FQtmbhjB@stefanha-x1.localdomain> <877dapl1i8.fsf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
To: Cornelia Huck <cohuck@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, virtio-comment@lists.oasis-open.org, Greg Kurz <groug@kaod.org>, Dominique Martinet <asmadeus@codewreck.org>
List-ID: <virtio-comment.lists.oasis-open.org>

On Montag, 24. Januar 2022 14:14:07 CET Cornelia Huck wrote:
> On Mon, Jan 24 2022, Stefan Hajnoczi <stefanha@redhat.com> wrote:
> > On Tue, Dec 14, 2021 at 04:13:10PM +0100, Christian Schoenebeck wrote:
> >> This new feature flag allows to decouple the maximum amount of
> >> descriptors in indirect descriptor tables from the Queue Size.
> >> 
> >> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/122
> >> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> >> ---

Adding Dominique Martinet on CC from now on, for being informed about progress 
on this virtio issue for Linux kernel side.

> >> 
> >>  content.tex    | 21 +++++++++++++++++++++
> >>  split-ring.tex |  2 +-
> >>  2 files changed, 22 insertions(+), 1 deletion(-)
> >> 
> >> diff --git a/content.tex b/content.tex
> >> index 5d112af..0aa4842 100644
> >> --- a/content.tex
> >> +++ b/content.tex
> >> @@ -6693,6 +6693,27 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved
> >> Feature Bits}>> 
> >>    transport specific.
> >>    For more details about driver notifications over PCI see
> >>    \ref{sec:Virtio Transport Options / Virtio Over PCI Bus /
> >>    PCI-specific Initialization And Device Operation / Available Buffer
> >>    Notifications}.>> 
> >> +  \item[VIRTIO_RING_F_INDIRECT_SIZE(40)] This feature indicates that the
> > 
> > Another feature bit was added in the meantime:
> >   \item[VIRTIO_F_RING_RESET(40)] This feature indicates
> >   
> >                             ^^
> > 
> > Please use 41 and update the text that says:
> >   \item[24 to 40] Feature bits reserved for extensions to the queue and
> >   feature negotiation mechanisms
> >   
> >   \item[41 to 49, and 128 and above] Feature bits reserved for future
> >   extensions.

Sure, I'll take care of that. As I am always rebasing to latest git version of 
the spec, I guess I would have realized it anyway.

> Indeed... I'm wondering whether we could automate updating this with
> some clever variables?

Well, for LaTeX there is

	\newcommand{\newCommandName}{1234}

and

	\def\variable{1234}

Both solutions have pros and cons. But not sure I would want to rack my brain 
on that. I just manually update the feature bit number for now :)

Best regards,
Christian Schoenebeck


