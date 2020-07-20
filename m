Return-Path: virtio-comment-return-1352-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3930E98431B
	for <virtio-comment@lists.oasis-open.org>; Mon, 20 Jul 2020 09:17:17 +0000 (UTC)
References: <20200618082150.17476-1-david@redhat.com>
From: David Hildenbrand <david@redhat.com>
Message-ID: <41366689-ddc1-893c-3ff9-2a45ecdd5866@redhat.com>
Date: Mon, 20 Jul 2020 11:17:07 +0200
MIME-Version: 1.0
In-Reply-To: <20200618082150.17476-1-david@redhat.com>
Content-Language: en-US
Subject: [virtio-comment] Re: [PATCH v2 0/3] virtio-spec: Add virtio-mem device specification
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: virtio-comment@lists.oasis-open.org
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On 18.06.20 10:21, David Hildenbrand wrote:
> Add the specification for virtio-mem devices. The Linux driver is part
> of v5.8-rc1. The latest QEMU implementation (v4) can be found at [1].
> 
> [1] https://lkml.kernel.org/r/20200610115419.51688-1-david@redhat.com
> 
> v1 -> v2:
> - Adapt to configuration layout change (block_size is now 64 bit)
> - Some minor rephrasings
> 
> David Hildenbrand (3):
>   conformance: make driver conformance list easier to read and maintain
>   conformance: Reference RPMB Driver Conformance
>   Add virtio-mem device specification
> 
>  conformance.tex |  47 ++++-
>  content.tex     |   1 +
>  virtio-mem.tex  | 448 ++++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 493 insertions(+), 3 deletions(-)
>  create mode 100644 virtio-mem.tex
> 

Okay, v2 has been around for more than a month without comments
requesting a change. If there are no further comments, I request voting
for inclusion.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/82

-- 
Thanks,

David / dhildenb


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

