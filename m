Return-Path: <virtio-comment-return-2810-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8473C98660B
	for <virtio-comment@lists.oasis-open.org>; Fri, 11 Mar 2022 12:09:33 +0000 (UTC)
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Fri, 11 Mar 2022 13:09:27 +0100
Message-ID: <9413181.TekCvJBtHg@silver>
In-Reply-To: <20220311121540.6255545d.pasic@linux.ibm.com>
References: <2255414.aXzeqRvSCW@silver> <87o82chmj1.fsf@redhat.com> <20220311121540.6255545d.pasic@linux.ibm.com>
MIME-Version: 1.0
Subject: [virtio-comment] Re: [PATCH v2 4/4] Add CCW configuration field "indirect_num" to vq_info_block
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
To: Halil Pasic <pasic@linux.ibm.com>
Cc: Cornelia Huck <cohuck@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, virtio-comment@lists.oasis-open.org, Greg Kurz <groug@kaod.org>, Dominique Martinet <asmadeus@codewreck.org>
List-ID: <virtio-comment.lists.oasis-open.org>

On Freitag, 11. M=E4rz 2022 12:15:40 CET Halil Pasic wrote:
> But let me take a step back, and ask some more general questions?
> 1) What is the objective behind the mechanism which can be used by the
> driver to tell the device its maximum. I believe the indirect descriptor
> table is always allocated by the guest, so the guest has no reason to
> fear larger than its max. The only thing I can think of is some pools
> of buffers allocated and maintained by the device, where each buffer
> is the size of max payload. Is this what we have in mind here?

As described at the end on the associated virtio-spec github issue [1]:

  "
  Linux drivers

  Since torvalds/linux@44ed808 the Linux kernel ignores if individual drive=
rs
  exceed the Queue Size (and violating the specs). Likewise there are some
  devices which use device specific config to negotiate a max. bulk data si=
ze=20
  being lower than the Queue Size. The proposed spec changes would address=
=20
  both use cases in a clean way.

  QEMU

  QEMU tolerates as well if guests drivers exceed the Queue Size. However
  currently it has a hard coded limit of max. 1024 memory segments:
  #define VIRTQUEUE_MAX_SIZE 1024
  Which limits the max. buik data size per virtio message to slightly below
  4MB
  "

So ATM when you run a Linux driver that exceeds QEMU's current limit of 102=
4
segments, you would get the following fatal QEMU error [2]:

  qemu-system-x86_64: virtio: too many write descriptors in indirect table

QEMU currently allocates the required space for the descriptors on the stac=
k
and uses that hard coded value for the allocation size. Now even if you wou=
ld
change that (which is a delicate bunch of code), you would still break
compatibility with Linux guests running on older QEMU hosts.

[1] https://github.com/oasis-tcs/virtio-spec/issues/122
[2] https://lore.kernel.org/netdev/cover.1640870037.git.linux_oss@crudebyte=
.com/

> 2) Not so long ago we had a discussion about introducing a common (device
> agnostic) configuration space (a.k.a. misc config). The indirect table
> size might be a good candidate for that as well. We essentially want
> the very same functionality for all the transports, it is just that
> we have no vehicle at the moment to do this in an uniform way. Opinions?
>=20
> Regards,
> Halil

I need to leave that to other people to comment on, as I am completely unaw=
are
about these plans. Sounds like a long-term plan to me though.

Best regards,
Christian Schoenebeck



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
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf=
=0D
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lis=
ts=0D
Committee: https://www.oasis-open.org/committees/virtio/=0D
Join OASIS: https://www.oasis-open.org/join/

