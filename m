Return-Path: virtio-comment-return-657-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6898C985B92
	for <virtio-comment@lists.oasis-open.org>; Mon, 25 Feb 2019 23:45:09 +0000 (UTC)
Date: Mon, 25 Feb 2019 18:45:05 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20190225183821-mutt-send-email-mst@kernel.org>
References: <CAEkmjvW06XheSPNS6YtjoZzAsmOeSPSbwFwNr_1S1F=Mmy-+qw@mail.gmail.com>
 <20190225083700-mutt-send-email-mst@kernel.org>
 <CAOGAQeqGwzRiaqHQG3o3U19p_8S4R=RTjSyxTWqD-2fb677GBg@mail.gmail.com>
 <20190225151735-mutt-send-email-mst@kernel.org>
 <CAOGAQer=hvcuOQNLdcH8qVwtkG+BAVzAjsN0jegO9gvxYfuLYw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOGAQer=hvcuOQNLdcH8qVwtkG+BAVzAjsN0jegO9gvxYfuLYw@mail.gmail.com>
Subject: [virtio-comment] Re: RFC: virtio-hostmem (+ Continuation of discussion from
 [virtio-dev] Memory sharing device)
To: Roman Kiryanov <rkir@google.com>
Cc: Frank Yang <lfy@google.com>, virtio-comment@lists.oasis-open.org, Cornelia Huck <cohuck@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Mon, Feb 25, 2019 at 03:08:19PM -0800, Roman Kiryanov wrote:
> Michael, thank you for your comments.
> 
> > I'm not sure how does above answer the comment.
> 
> Sorry for leaving this unclear, our guest driver tells the
> device guest's page size and then we do aligning-unaligning.


This might work. Note that host page size might be different.
If it's bigger host needs to be careful about allocating
full host pages anyway.

> > To try and put things in your terms, if you try to map a range of memory
> > you get access to a page that can be bigger than the range you asked
> > for.
> 
> This is correct.
> 
> >  It can cause two ranges to violate a security boundary, cause
> > information leaks, etc.
> 
> Could you please correct me if I am wrong. If I ask glMapBufferRange
> (without hosts and guests) for a 1K buffer with 4K pages, I will have
> access to other 3K. If a driver decides to put sensitive bits there -
> will this be the same situation?

Sounds similar.

> We assume pages are not shared between processes.
> If this assumption does not work then it is hard to share arbitrary pointers.
> 
> Regards,
> Roman.

Right. Details on how memory is allocated in the proposed scheme are
scant but above I think shows that it can't all be up to guest.


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

