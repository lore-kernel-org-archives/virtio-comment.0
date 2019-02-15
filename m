Return-Path: virtio-comment-return-624-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5946C9860B2
	for <virtio-comment@lists.oasis-open.org>; Fri, 15 Feb 2019 13:33:19 +0000 (UTC)
Date: Fri, 15 Feb 2019 14:33:10 +0100
From: Cornelia Huck <cohuck@redhat.com>
Message-ID: <20190215143310.197da7a8.cohuck@redhat.com>
In-Reply-To: <20190215135134.1945200c@oc2783563651>
References: <20190111114200.10026-1-dgilbert@redhat.com>
	<20190111114200.10026-2-dgilbert@redhat.com>
	<20190111131540.12a8abca.cohuck@redhat.com>
	<20190111122654.GE2738@work-vm>
	<20190115111038.6769d292.cohuck@redhat.com>
	<20190115112303.GB2135@work-vm>
	<20190116115638.152d6797.cohuck@redhat.com>
	<20190116200625.GG2351@work-vm>
	<20190211225225.7c39154d.cohuck@redhat.com>
	<20190213183755.GF2601@work-vm>
	<20190214115807.2bab4efb.cohuck@redhat.com>
	<20190215135134.1945200c@oc2783563651>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [virtio-comment] [PATCH 1/3] shared memory: Define shared
 memory regions
To: Halil Pasic <pasic@linux.ibm.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, virtio-comment@lists.oasis-open.org, stefanha@redhat.com
List-ID: <virtio-comment.lists.oasis-open.org>

On Fri, 15 Feb 2019 13:51:34 +0100
Halil Pasic <pasic@linux.ibm.com> wrote:

> On Thu, 14 Feb 2019 11:58:07 +0100
> Cornelia Huck <cohuck@redhat.com> wrote:
> 
> > Tags: inv, virtio 
> > From: Cornelia Huck <cohuck@redhat.com>
> > To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> > Cc: virtio-comment@lists.oasis-open.org, stefanha@redhat.com, Halil Pasic <pasic@linux.ibm.com>
> > Subject: Re: [virtio-comment] [PATCH 1/3] shared memory: Define shared memory regions
> > Date: Thu, 14 Feb 2019 11:58:07 +0100
> > Sender: <virtio-comment@lists.oasis-open.org>
> > Organization: Red Hat GmbH
> > 
> > On Wed, 13 Feb 2019 18:37:56 +0000
> > "Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> >   
> > > * Cornelia Huck (cohuck@redhat.com) wrote:    
> > > > On Wed, 16 Jan 2019 20:06:25 +0000
> > > > "Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> > > >       
> > > > > So these are all moving this 1/3 forward - has anyone got comments on
> > > > > the transport specific implementations?      
> > > > 
> > > > No comment on pci or mmio, but I've hacked something together for ccw.
> > > > Basically, one sense-type ccw for discovery and a control-type ccw for
> > > > activation of the regions (no idea if we really need the latter), both
> > > > available with ccw revision 3.
> > > > 
> > > > No idea whether this will work this way, though...      
> > > 
> > > That sounds (from a shm perspective) reasonable; can I ask why the
> > > 'activate' is needed?    
> > 
> > The activate interface is actually what I'm most unsure about; maybe
> > Halil can chime in.  
> 
> Sorry, I unfortunately kept deferring looking into this. Will have to do
> some more thinking. I promise to give you my feedback by Monday end of
> day if not sooner. Does that work with you?

Sure; please also take a look at DavidH's proposal.

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

