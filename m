Return-Path: virtio-comment-return-655-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0AC0F985AFD
	for <virtio-comment@lists.oasis-open.org>; Mon, 25 Feb 2019 20:34:05 +0000 (UTC)
Date: Mon, 25 Feb 2019 15:34:00 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20190225151735-mutt-send-email-mst@kernel.org>
References: <CAEkmjvW06XheSPNS6YtjoZzAsmOeSPSbwFwNr_1S1F=Mmy-+qw@mail.gmail.com>
 <20190225083700-mutt-send-email-mst@kernel.org>
 <CAOGAQeqGwzRiaqHQG3o3U19p_8S4R=RTjSyxTWqD-2fb677GBg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOGAQeqGwzRiaqHQG3o3U19p_8S4R=RTjSyxTWqD-2fb677GBg@mail.gmail.com>
Subject: [virtio-comment] Re: RFC: virtio-hostmem (+ Continuation of discussion from
 [virtio-dev] Memory sharing device)
To: Roman Kiryanov <rkir@google.com>
Cc: Frank Yang <lfy@google.com>, virtio-comment@lists.oasis-open.org, Cornelia Huck <cohuck@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Mon, Feb 25, 2019 at 10:54:03AM -0800, Roman Kiryanov wrote:
> > >   • The host does not back the region at all and a page fault happens.
> >
> > Then what? Guest dies?
> > That doesn't sound reasonable, in particular if you want to
> > allow userspace to map this memory.
> 
> In our implementation we call mmap after asking the host to back the region.

So I guess spec should not say host does not have to back the region
then.


> https://photos.app.goo.gl/NJvPBvvFS3S3n9mn6
> 
> Nothing prevents a guest to call mmap on an unbacked region, then the
> guest will die. If it is possible for the device to figure out if an
> address range
> is backed in VM, the guest driver could talk to the device to fail an mmap
> call if a region is not accessible.

So if driver needs specific knowlegde from the device that needs to be
in the spec.

> > >   • The host has already allocated host RAM (from some source; vkMapMemory,
> > >     malloc(), mmap, etc) memory of some kind and maps a page-aligned host
> > >     pointer to the guest physical address corresponding to the region.
> >
> > I'm not sure what does "of some kind" mean here.
> 
> Memory from any API call that could be used for access through this
> address range.

So just RAM really?

> > Also host and guest might have different ideas about
> > what does page-aligned mean.
> 
> In our implementation we do aligning (for VM operations) and unaligning in the
> guest userspace (because mmap is page aligned) to get the pointer to handle
> pointers in the middle of a page (we have no control on pointers returned
> from a third party API).
> 
> Regards,
> Roman.

I'm not sure how does above answer the comment.  I understand you are
using all kind of APIs internally in your hypervisor but please put
things in terms that can apply to host/guest communication. I can kind
of read it between the lines if I squint hard enough but this makes my
head hurt and there's no guarantee I do it correctly.

To try and put things in your terms, if you try to map a range of memory
you get access to a page that can be bigger than the range you asked
for.  It can cause two ranges to violate a security boundary, cause
information leaks, etc. A library can play with offsets and give a well
behaved application an illusion of a private range but if it ends up
sharing a page of memory with a malicious application then there's no
security boundary between them.

HTH

-- 
MST

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

