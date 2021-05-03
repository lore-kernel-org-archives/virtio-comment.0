Return-Path: virtio-comment-return-1843-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E7BE6986369
	for <virtio-comment@lists.oasis-open.org>; Mon,  3 May 2021 12:39:43 +0000 (UTC)
Date: Mon, 3 May 2021 14:39:34 +0200
From: Cornelia Huck <cohuck@redhat.com>
Message-ID: <20210503143934.35c023ab.cohuck@redhat.com>
In-Reply-To: <0fd24fd1-ae7f-eadf-df05-78298c8d79cf@nider.org>
References: <20210429231016.561553-1-joel@nider.org>
	<20210430132746.599ed57f.cohuck@redhat.com>
	<0fd24fd1-ae7f-eadf-df05-78298c8d79cf@nider.org>
MIME-Version: 1.0
Subject: Re: [virtio-comment] [PATCH] Update VIRTIO_F_EVENT_IDX throughout
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
To: Joel Nider <joel@nider.org>
Cc: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

On Fri, 30 Apr 2021 09:27:55 -0700
Joel Nider <joel@nider.org> wrote:

> On 2021-04-30 4:27 a.m., Cornelia Huck wrote:
> > On Thu, 29 Apr 2021 16:10:16 -0700
> > Joel Nider <joel@nider.org> wrote:

> >> -  \item[VIRTIO_F_RING_EVENT_IDX(29)] This feature enables the \field{used_event}
> >> +  \item[VIRTIO_F_EVENT_IDX(29)] This feature enables the \field{used_event}  
> > Hm. The VIRTIO_F_RING_ version actually matches well with
> > VIRTIO_F_RING_INDIRECT_DESC and VIRTIO_F_RING_PACKED. While the latter
> > is used consistently throughout the spec, we seem to use
> > VIRTIO_F_INDIRECT_DESC in other places. For added variety, Linux and
> > QEMU use VIRTIO_RING_F_INDIRECT_DESC and VIRTIO_RING_F_EVENT_IDX (but
> > VIRTIO_F_RING_PACKED.)  
> Clearly all of these flags apply to the v-rings - I don't think 
> including 'RING' to makes it any clearer. So in the interest of 
> readability, I would opt for the shorter flag names (more likely to fit 
> in a 80-char line). Linux (and the other OSes and hypervisors) will 
> eventually fall in line, once the spec is consistent.

Not so sure about implementations changing their terms, but I don't
think it's of much consequence.

> > We should be consistent within the spec, so I'd vote for using the
> > VIRTIO_F_RING_ versions everywhere here. (The Linux/QEMU variants are
> > still easily recognizable, so there's actually not much potential for
> > confusion.) The only downside is that this would mean more changes.  
> I fully support being consistent everywhere in the spec - that is my 
> primary concern. I noticed that over time, the flag name seems to be 
> gravitating towards the VIRTIO_F_EVENT_IDX (all places in section 2 
> already use this name), so that's why I just changed the last two places 
> that are not consistent. Truly, I will be happy once they are all the 
> same (one way or the other).

I have no strong preference for keeping the 'RING' particle, the main
issue is consistency. In any case, we should also clean up
INDIRECT_DESC.


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

