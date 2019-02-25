Return-Path: virtio-comment-return-654-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id F2EC9985AFD
	for <virtio-comment@lists.oasis-open.org>; Mon, 25 Feb 2019 18:54:16 +0000 (UTC)
MIME-Version: 1.0
References: <CAEkmjvW06XheSPNS6YtjoZzAsmOeSPSbwFwNr_1S1F=Mmy-+qw@mail.gmail.com>
 <20190225083700-mutt-send-email-mst@kernel.org>
In-Reply-To: <20190225083700-mutt-send-email-mst@kernel.org>
From: Roman Kiryanov <rkir@google.com>
Date: Mon, 25 Feb 2019 10:54:03 -0800
Message-ID: <CAOGAQeqGwzRiaqHQG3o3U19p_8S4R=RTjSyxTWqD-2fb677GBg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: [virtio-comment] Re: RFC: virtio-hostmem (+ Continuation of discussion from
 [virtio-dev] Memory sharing device)
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Frank Yang <lfy@google.com>, virtio-comment@lists.oasis-open.org, Cornelia Huck <cohuck@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

> >   =E2=80=A2 The host does not back the region at all and a page fault h=
appens.
>
> Then what? Guest dies?
> That doesn't sound reasonable, in particular if you want to
> allow userspace to map this memory.

In our implementation we call mmap after asking the host to back the region=
.

https://photos.app.goo.gl/NJvPBvvFS3S3n9mn6

Nothing prevents a guest to call mmap on an unbacked region, then the
guest will die. If it is possible for the device to figure out if an
address range
is backed in VM, the guest driver could talk to the device to fail an mmap
call if a region is not accessible.

> >   =E2=80=A2 The host has already allocated host RAM (from some source; =
vkMapMemory,
> >     malloc(), mmap, etc) memory of some kind and maps a page-aligned ho=
st
> >     pointer to the guest physical address corresponding to the region.
>
> I'm not sure what does "of some kind" mean here.

Memory from any API call that could be used for access through this
address range.

> Also host and guest might have different ideas about
> what does page-aligned mean.

In our implementation we do aligning (for VM operations) and unaligning in =
the
guest userspace (because mmap is page aligned) to get the pointer to handle
pointers in the middle of a page (we have no control on pointers returned
from a third party API).

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

