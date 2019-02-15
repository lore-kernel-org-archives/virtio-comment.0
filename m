Return-Path: virtio-comment-return-619-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 640B29860B2
	for <virtio-comment@lists.oasis-open.org>; Fri, 15 Feb 2019 12:31:53 +0000 (UTC)
Date: Fri, 15 Feb 2019 13:31:42 +0100
From: Cornelia Huck <cohuck@redhat.com>
Message-ID: <20190215133142.2bcbaf58.cohuck@redhat.com>
In-Reply-To: <20190215111908.GC2630@work-vm>
References: <20190115111038.6769d292.cohuck@redhat.com>
	<20190115112303.GB2135@work-vm>
	<20190116115638.152d6797.cohuck@redhat.com>
	<20190116200625.GG2351@work-vm>
	<20190211225225.7c39154d.cohuck@redhat.com>
	<20190213183755.GF2601@work-vm>
	<20190214115807.2bab4efb.cohuck@redhat.com>
	<20190214163707.GE2617@work-vm>
	<CAEkmjvWgQg-xhOb0xLKqofi31Dzwaz1M8DQGDBgrYqO8iJ7Ubg@mail.gmail.com>
	<20190215120718.7c7e09cc.cohuck@redhat.com>
	<20190215111908.GC2630@work-vm>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [virtio-comment] [PATCH 1/3] shared memory: Define shared
 memory regions
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Frank Yang <lfy@google.com>, virtio-comment@lists.oasis-open.org, Stefan Hajnoczi <stefanha@redhat.com>, Halil Pasic <pasic@linux.ibm.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Fri, 15 Feb 2019 11:19:09 +0000
"Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:

> What I'm missing here is why the behaviour of the s390's traditional channel program
> matters to the design of an entirely emulated device.

I mostly wrote this up as an explanation...

> 
> As long as the s390 allows:
>   a) The host to map a region of HVA into GPA at an arbitrary GPA
> address
>   b) Not tell the guest that (a) is RAM
>   c) Find a non-RAM GPA for (a)

I think (b) and (c) are what we need to come up with a solution for...
DavidH's idea looks like a good starting point for that.

>   d) Allow the guest to set up a page table pointing to (c)
>   e) Discover (c) via the scheme you described
> 
> Then that's all that's needed - and I'm not seeing what is different on
> s390 about a-d from any other architecture.
> 
> Dave
> 
> 
> 
> --
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


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

