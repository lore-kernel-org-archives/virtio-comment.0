Return-Path: virtio-comment-return-702-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4083F985EA4
	for <virtio-comment@lists.oasis-open.org>; Thu,  7 Mar 2019 18:31:19 +0000 (UTC)
Date: Thu, 7 Mar 2019 13:31:14 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20190307132849-mutt-send-email-mst@kernel.org>
References: <CAEkmjvXUGA0m42hnGWkLL2J4YhL7f6=_cW7pzacTG8u8J12j0w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEkmjvXUGA0m42hnGWkLL2J4YhL7f6=_cW7pzacTG8u8J12j0w@mail.gmail.com>
Subject: [virtio-comment] Re: RFC v2: virtio-hostmem: static, guest-owned memory regions
To: Frank Yang <lfy@google.com>
Cc: virtio-comment@lists.oasis-open.org, Roman Kiryanov <rkir@google.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, Christoffer Dall <christoffer.dall@arm.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Mon, Mar 04, 2019 at 09:57:06AM -0800, Frank Yang wrote:
> - Security model is pushed to the guest-specific layers like selinux; it is
> possible (and this is useful) for a physical page to be shared across guest
> processes, and it is up to the guest's current security model to enforce
> malicious apps not having access.

However mechanisms such as selinux are all kernel based.  In your scheme
kernel has no knowledge about the content of the memory and data flows
through direct mmap to guest userspace bypassing guest kernel. I don't
see how you will be able to come up with an selinux policy to decide
which memory is safe to share.

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

