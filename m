Return-Path: <mst@redhat.com>
Date: Mon, 3 Jan 2022 16:48:48 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v2 1/1] Fix reserved Feature bits numbering
Message-ID: <20220103164709-mutt-send-email-mst@kernel.org>
References: <20220103170344.3696-1-mgurtovoy@nvidia.com>
 <87mtkcwxaq.fsf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <87mtkcwxaq.fsf@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Cornelia Huck <cohuck@redhat.com>
Cc: Max Gurtovoy <mgurtovoy@nvidia.com>, virtio-comment@lists.oasis-open.org, oren@nvidia.com, stefanha@redhat.com, eperezma@redhat.com
List-ID: <virtio-comment.lists.oasis-open.org>

On Mon, Jan 03, 2022 at 06:20:45PM +0100, Cornelia Huck wrote:
> On Mon, Jan 03 2022, Max Gurtovoy <mgurtovoy@nvidia.com> wrote:
> 
> > This should have been updated during VIRTIO_F_NOTIFICATION_DATA,
> > VIRTIO_F_NOTIF_CONFIG_DATA and VIRTIO_F_RING_RESET standartization.
> >
> > Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> > Signed-off-by: Max Gurtovoy <mgurtovoy@nvidia.com>
> 
> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/128
> 
> Can you please also update the archive link in the issue, once the mail
> shows up there?


Wish we had a cleaner way to do it than updating this each time we
add a generic feature bit.

> > ---
> >
> > changes from v1:
> >  - added "Reviewed-by" signature (Stefan)
> >  - include VIRTIO_F_RING_RESET feature bit (Cornelia)
> >
> > ---
> >  content.tex | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/content.tex b/content.tex
> > index cf20570..32de668 100644
> > --- a/content.tex
> > +++ b/content.tex
> > @@ -99,10 +99,10 @@ \section{Feature Bits}\label{sec:Basic Facilities of a Virtio Device / Feature B
> >  \begin{description}
> >  \item[0 to 23] Feature bits for the specific device type
> >  
> > -\item[24 to 37] Feature bits reserved for extensions to the queue and
> > +\item[24 to 40] Feature bits reserved for extensions to the queue and
> >    feature negotiation mechanisms
> >  
> > -\item[38 and above] Feature bits reserved for future extensions.
> > +\item[41 and above] Feature bits reserved for future extensions.
> >  \end{description}
> >  
> >  \begin{note}
> 
> LGTM.

