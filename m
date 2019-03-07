Return-Path: virtio-comment-return-699-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E8A9B985EA6
	for <virtio-comment@lists.oasis-open.org>; Thu,  7 Mar 2019 17:34:21 +0000 (UTC)
Date: Thu, 7 Mar 2019 17:34:03 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Message-ID: <20190307173402.GK2811@work-vm>
References: <CAEkmjvXUGA0m42hnGWkLL2J4YhL7f6=_cW7pzacTG8u8J12j0w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEkmjvXUGA0m42hnGWkLL2J4YhL7f6=_cW7pzacTG8u8J12j0w@mail.gmail.com>
Subject: Re: [virtio-comment] RFC v2: virtio-hostmem: static, guest-owned
 memory regions
To: Frank Yang <lfy@google.com>
Cc: virtio-comment@lists.oasis-open.org, Roman Kiryanov <rkir@google.com>, "Michael S. Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, Christoffer Dall <christoffer.dall@arm.com>
List-ID: <virtio-comment.lists.oasis-open.org>

* Frank Yang (lfy@google.com) wrote:
> +Christopher Dall who has tried to standardize goldfish before.
> 
> Link:
> https://github.com/741g/virtio-spec/blob/67602f232386a1782a35b9cb41087586ac3d19e2/virtio-hostmem.tex
> 
> - Security model is pushed to the guest-specific layers like selinux; it is
> possible (and this is useful) for a physical page to be shared across guest
> processes, and it is up to the guest's current security model to enforce
> malicious apps not having access.

I'm not quite sure I understand this or the statement:

   Indeed, it is possible for a malicious guest process to improperly access
   the shared memory of a gralloc/ashmem/dmabuf implementation on virtio-hostmem,
   but we regard that as a flaw in the security model of the guest,
   not the security model of virtio-hostmem.

what's the limit of 'improperly access'.  If that means that it
calls/corrupts/breaks the guest that's fine - if it could DMA over the
host VMM that's not as nice.

I'm also a bit confused by your enumeration/probing.  You say that the
host can refuse a request for a particular CODEC type; that's fine if it
hasn't got it - but can a guest get a list of what the host supports?
(Is that what the 'Device configuration layout' is about or is that
about the  subdevices you already have mapped?)


I don't understand the:
  When the guest starts up, regardless of whether it is plugged in,
  memory regions for each sub-device will be reserved.

  When the hostmem device is plugged in via PCI,
  instance creation/destruction and message sending is allowed.
  Otherwise all operations fail with a guest specific error code.

Say you support hundreds of different codecs - what happens?
I also don't understand what happens before plugging.

(Somewhere near the bottom is the typo notificationotification )

Dave

--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

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

