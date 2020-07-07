Return-Path: virtio-comment-return-1340-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id EFB98985A1B
	for <virtio-comment@lists.oasis-open.org>; Tue,  7 Jul 2020 11:56:27 +0000 (UTC)
References: <20200618082150.17476-1-david@redhat.com>
From: David Hildenbrand <david@redhat.com>
Message-ID: <8c874cea-47fe-f440-ecba-21158856fece@redhat.com>
Date: Tue, 7 Jul 2020 13:56:18 +0200
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

Gentle ping, I'll be opening a github issue now but wait a little bit
longer until replying with "Fixes:".

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

