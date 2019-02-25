Return-Path: virtio-comment-return-647-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5712A985AA0
	for <virtio-comment@lists.oasis-open.org>; Mon, 25 Feb 2019 05:27:16 +0000 (UTC)
MIME-Version: 1.0
References: <CAEkmjvW06XheSPNS6YtjoZzAsmOeSPSbwFwNr_1S1F=Mmy-+qw@mail.gmail.com>
In-Reply-To: <CAEkmjvW06XheSPNS6YtjoZzAsmOeSPSbwFwNr_1S1F=Mmy-+qw@mail.gmail.com>
From: Roman Kiryanov <rkir@google.com>
Date: Sun, 24 Feb 2019 21:27:03 -0800
Message-ID: <CAOGAQeq2dA4m+Ux39oa_sxvNXq54RZQuWw866hoGKX2AYK_Y2w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: [virtio-comment] Re: RFC: virtio-hostmem (+ Continuation of discussion from
 [virtio-dev] Memory sharing device)
To: Frank Yang <lfy@google.com>
Cc: virtio-comment@lists.oasis-open.org, "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

> Michael: OK so who allocates memory out of the PCI region?
> Response:
>
> Allocation will be split by guest address space versus host address space=
.
>
> Guest address space: The guest driver determines the offset into the BAR =
in which to allocate the new region. The implementation of the allocator it=
self may live on the host (while guest triggers such allocations via the co=
nfig virtqueue messages), but the ownership of region offsets and sizes wil=
l be in the guest. This allows for the easy use of existing guest ref-count=
ing mechanisms such as last close() calling release() to clean up the memor=
y regions in the guest.
>
> Host address space: The backing of such memory regions is considered comp=
letely optional. The host may service a guest region with a memory of its c=
hoice that depends on the usage of the device. The time this servicing happ=
ens may be any time after the guest communicates the message to create a me=
mory region, but before the guest destroys the memory region. In the meanti=
me, some examples of how the host may respond to the allocation request:

Should we note here what happens if a guest releases (a user process
dies) the region without asking the host to un-back it?

Regards,
Roman.

This publicly archived list offers a means to provide input to the=0D
OASIS Virtual I/O Device (VIRTIO) TC.=0D
=0D
In order to verify user consent to the Feedback License terms and=0D
to minimize spam in the list archive, subscription is required=0D
before posting.=0D
=0D
Subscribe: virtio-comment-subscribe@lists.oasis-open.org=0D
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org=0D
List help: virtio-comment-help@lists.oasis-open.org=0D
List archive: https://lists.oasis-open.org/archives/virtio-comment/=0D
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf=0D
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists=0D
Committee: https://www.oasis-open.org/committees/virtio/=0D
Join OASIS: https://www.oasis-open.org/join/

