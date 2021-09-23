Return-Path: <virtio-comment-return-2299-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 71FED9863E1
	for <virtio-comment@lists.oasis-open.org>; Thu, 23 Sep 2021 12:11:44 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
In-Reply-To: <20210920134653.16412-5-david@redhat.com>
References: <20210920134653.16412-1-david@redhat.com>
 <20210920134653.16412-5-david@redhat.com>
Date: Thu, 23 Sep 2021 14:10:59 +0200
Message-ID: <87mto3ebl8.fsf@redhat.com>
MIME-Version: 1.0
Subject: [virtio-comment] Re: [PATCH RESEND v2 4/5] virtio-mem: introduce
 VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE
Content-Type: text/plain
To: David Hildenbrand <david@redhat.com>, virtio-comment@lists.oasis-open.org
Cc: David Hildenbrand <david@redhat.com>, Hui Zhu <teawater@gmail.com>, Marek Kedzierski <mkedzier@redhat.com>, Sebastien Boeuf <sebastien.boeuf@intel.com>, Halil Pasic <pasic@linux.ibm.com>, "Michael
 S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, Pankaj Gupta <pankaj.gupta.linux@gmail.com>, Wei Yang <richard.weiyang@linux.alibaba.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Mon, Sep 20 2021, David Hildenbrand <david@redhat.com> wrote:

> Until now, we allowed a driver to read unplugged memory within the
> usable device-managed region: this simplified bring-up of virtio-mem in
> Linux quite a bit, especially when it came to physical memory dumping.
>
> When the device is using a memory backend that supports a shared
> zeropage, such as virtio-mem in QEMU under Linux on anonymous memory, the
> old behavior could be realized easily.
>
> However, when using other memory backends (such as hugetlbfs or shmem)
> or architectures, such as s390x, where a shared zeropage either does not
> exist or cannot be used, letting the driver read unplugged memory can
> result in undesired memory consumption in the hypervisor. The device
> wants to make sure that the guest is aware and will not read unplugged
> memory, not even in corner cases.
>
> In the meantime, the Linux implementation matured such that it will no
> longer access unplugged memory, for example, during kdump, when reading
> /proc/kcore, or via (now removed) /dev/kmem.
>
> Similar to VIRTIO_F_ACCESS_PLATFORM, this change will be disruptive and
> require driver adaptions -- even if it's just accepting the new feature.
> Devices are expected to only set the bit when really required, to keep
> existing setups working.
>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  virtio-mem.tex | 23 ++++++++++++++++++-----
>  1 file changed, 18 insertions(+), 5 deletions(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>


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

