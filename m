Return-Path: rkir@google.com
MIME-Version: 1.0
References: <CAEkmjvW06XheSPNS6YtjoZzAsmOeSPSbwFwNr_1S1F=Mmy-+qw@mail.gmail.com>
In-Reply-To: <CAEkmjvW06XheSPNS6YtjoZzAsmOeSPSbwFwNr_1S1F=Mmy-+qw@mail.gmail.com>
From: Roman Kiryanov <rkir@google.com>
Date: Sun, 24 Feb 2019 21:15:36 -0800
Message-ID: <CAOGAQer6H1TX6x7GEtUgPBm5oip5teAR0seruqjDOzfTUrVVuA@mail.gmail.com>
Subject: Re: RFC: virtio-hostmem (+ Continuation of discussion from [virtio-dev]
 Memory sharing device)
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
To: Frank Yang <lfy@google.com>
Cc: virtio-comment@lists.oasis-open.org, "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

> Michael: OK so who allocates memory out of the PCI region?
> Response:
>
> Allocation will be split by guest address space versus host address space=
=2E
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
