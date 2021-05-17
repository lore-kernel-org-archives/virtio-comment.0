Return-Path: virtio-comment-return-1857-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 51663985DDD
	for <virtio-comment@lists.oasis-open.org>; Mon, 17 May 2021 11:49:25 +0000 (UTC)
Date: Mon, 17 May 2021 13:49:12 +0200
From: Cornelia Huck <cohuck@redhat.com>
Message-ID: <20210517134912.7325d21a.cohuck@redhat.com>
In-Reply-To: <20210517121712.465e6741.cohuck@redhat.com>
References: <20210504182134.736631-1-joel@nider.org>
	<78c9a32a-551d-87cf-008a-beb13ed38a2f@nider.org>
	<20210517121712.465e6741.cohuck@redhat.com>
MIME-Version: 1.0
Subject: Re: [virtio-comment] [PATCH] Make global flag names consistent
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
To: Joel Nider <joel@nider.org>
Cc: virtio-comment@lists.oasis-open.org, "Michael S . Tsirkin" <mst@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Mon, 17 May 2021 12:17:12 +0200
Cornelia Huck <cohuck@redhat.com> wrote:

> On Thu, 13 May 2021 18:22:23 -0700
> Joel Nider <joel@nider.org> wrote:
> 
> > Hi Cornelia,
> > 
> > Could you please comment on this patch - is this what you were expecting?  
> 
> Sorry for being late; being cc:ed usually brings stuff like this to my
> attention sooner.
> 
> > 
> > Thanks,
> > 
> > Joel
> > 
> > On 2021-05-04 11:21 a.m., Joel Nider wrote:  
> > > The global flags VIRTIO_F_EVENT_IDX and VIRTIO_F_INDIRECT_DESC
> > > have inconsistent naming throughout the document. This change
> > > removes the _RING designation from the flag names to make the
> > > usage consistent.
> > >
> > > Signed-off-by: Joel Nider <joel@nider.org>
> > > ---
> > >   content.tex     | 4 ++--
> > >   packed-ring.tex | 4 ++--
> > >   2 files changed, 4 insertions(+), 4 deletions(-)  
> 
> Change looks good to me.
> 
> In order to request a vote, please follow
> https://github.com/oasis-tcs/virtio-spec#use-of-github-issues

I now see that there's already
https://github.com/oasis-tcs/virtio-spec/issues/36 dealing with the
same problem.


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

