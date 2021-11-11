Return-Path: <virtio-comment-return-2338-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id AB86C98648D
	for <virtio-comment@lists.oasis-open.org>; Thu, 11 Nov 2021 10:52:50 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
In-Reply-To: <20211110185555.190-2-tstark@linux.microsoft.com>
References: <20211110185555.190-1-tstark@linux.microsoft.com>
 <20211110185555.190-2-tstark@linux.microsoft.com>
Date: Thu, 11 Nov 2021 11:52:42 +0100
Message-ID: <87sfw37ymd.fsf@redhat.com>
MIME-Version: 1.0
Subject: Re: [virtio-comment] [PATCH v5 1/1] virtio-pmem: Support describing
 pmem as shared memory region
Content-Type: text/plain
To: tstark@linux.microsoft.com, virtio-comment@lists.oasis-open.org
Cc: grahamwo@microsoft.com, benhill@microsoft.com, tstark@microsoft.com, pankaj.gupta.linux@gmail.com
List-ID: <virtio-comment.lists.oasis-open.org>

On Wed, Nov 10 2021, tstark@linux.microsoft.com wrote:

> From: Taylor Stark <tstark@microsoft.com>
>
> Update the virtio-pmem spec to add support for describing the pmem region as a
> shared memory window. This is required to support virtio-pmem in Hyper-V, since
> Hyper-V only allows PCI devices to operate on memory ranges defined via BARs.
> When using the virtio PCI transport, shared memory regions are described via
> PCI BARs.
>
> Signed-off-by: Taylor Stark <tstark@microsoft.com>
> ---
>  conformance.tex | 14 ++++++++++++--
>  virtio-pmem.tex | 40 +++++++++++++++++++++++++++++++++-------
>  2 files changed, 45 insertions(+), 9 deletions(-)

This looks good to me now.

Could you please open an issue at
https://github.com/oasis-tcs/virtio-spec/issues to get this included? If
nobody has any further comments, I think we could start the voting
process soon.


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

