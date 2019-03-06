Return-Path: virtio-comment-return-694-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2B5D6985E94
	for <virtio-comment@lists.oasis-open.org>; Wed,  6 Mar 2019 17:28:40 +0000 (UTC)
Date: Wed, 6 Mar 2019 12:28:30 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20190306122634-mutt-send-email-mst@kernel.org>
References: <CAEkmjvW06XheSPNS6YtjoZzAsmOeSPSbwFwNr_1S1F=Mmy-+qw@mail.gmail.com>
 <20190306163616.GA29057@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190306163616.GA29057@stefanha-x1.localdomain>
Subject: Re: [virtio-comment] RFC: virtio-hostmem (+ Continuation of
 discussion from [virtio-dev] Memory sharing device)
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Frank Yang <lfy@google.com>, virtio-comment@lists.oasis-open.org, Cornelia Huck <cohuck@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Roman Kiryanov <rkir@google.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Wed, Mar 06, 2019 at 04:36:16PM +0000, Stefan Hajnoczi wrote:
> > \section{Host Memory Device}\label{sec:Device Types / Host Memory Device}
> 
> The Host Memory Device defines an entirely new device model that bypasses
> VIRTIO.  Why make this a VIRTIO device if the VIRTIO device model is not a good
> fit for what you're trying to achieve?  This device seems out of scope to me.

It's different from virtio pci.
But this looks a bit like a special transport to me.
I'll look at it more next week sometime.

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

