Return-Path: virtio-comment-return-1482-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4C19B98614C
	for <virtio-comment@lists.oasis-open.org>; Thu, 29 Oct 2020 10:36:23 +0000 (UTC)
Date: Thu, 29 Oct 2020 06:36:13 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20201029063557-mutt-send-email-mst@kernel.org>
References: <20201021135847.15236-1-robert.bradford@intel.com>
 <20201029102536.4c8965a8.cohuck@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201029102536.4c8965a8.cohuck@redhat.com>
Subject: Re: [virtio-comment] [PATCH] content: Reserve virtio-watchog device
 ID
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Cornelia Huck <cohuck@redhat.com>
Cc: Rob Bradford <robert.bradford@intel.com>, virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

On Thu, Oct 29, 2020 at 10:25:36AM +0100, Cornelia Huck wrote:
> On Wed, 21 Oct 2020 14:58:47 +0100
> Rob Bradford <robert.bradford@intel.com> wrote:
> 
> > Reserve an ID for a watchdog device which may be used to ensure that the
> > guest is responsive. This is equivalent of a hardware watchdog device
> > and will trigger the reboot of the guest if the the host does not
> > periodic ping from the the guest.
> > 
> > Signed-off-by: Rob Bradford <robert.bradford@intel.com>
> > ---
> >  content.tex | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/content.tex b/content.tex
> > index bc26674..6f8ec8f 100644
> > --- a/content.tex
> > +++ b/content.tex
> > @@ -2819,6 +2819,8 @@ \chapter{Device Types}\label{sec:Device Types}
> >  \hline
> >  33         &   NitroSecureModule \\
> >  \hline
> > +35         &   Watchdog \\
> > +\hline
> >  \end{tabular}
> >  
> >  Some of the devices above are unspecified by this document,
> 
> Reviewed-by: Cornelia Huck <cohuck@redhat.com>
> 
> Time to vote on this (and the patch reserving 34 for I2C?)

Send Fixes: tag then?

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
> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
> Committee: https://www.oasis-open.org/committees/virtio/
> Join OASIS: https://www.oasis-open.org/join/


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
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

