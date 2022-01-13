Return-Path: <virtio-comment-return-2516-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4157B9864F2
	for <virtio-comment@lists.oasis-open.org>; Thu, 13 Jan 2022 14:07:01 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
In-Reply-To: <20220113135758.nifr7hftqh57viku@steredhat>
References: <20220112170936.245410-1-sgarzare@redhat.com>
 <87fsprx63i.fsf@redhat.com> <20220113112203.pgwfwtnqti2g4xap@steredhat>
 <87czkvx41v.fsf@redhat.com> <20220113135758.nifr7hftqh57viku@steredhat>
Date: Thu, 13 Jan 2022 15:06:54 +0100
Message-ID: <877db3wwzl.fsf@redhat.com>
MIME-Version: 1.0
Subject: [virtio-comment] Re: [PATCH v11 0/3] virtio-vsock: SOCK_SEQPACKET description
Content-Type: text/plain
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: mst@redhat.com, stefanha@redhat.com, virtio-comment@lists.oasis-open.org, arseny.krasnov@kaspersky.com, jasowang@redhat.com
List-ID: <virtio-comment.lists.oasis-open.org>

On Thu, Jan 13 2022, Stefano Garzarella <sgarzare@redhat.com> wrote:

> On Thu, Jan 13, 2022 at 12:34:20PM +0100, Cornelia Huck wrote:
>>> Otherwise maybe we should write in the spec that if F_SEQPACKET is set
>>> this means that stream is supported even if F_STREAM is not set.
>>
>>Yes, if that works, it would probably be the less ugly option.
>
> Okay, let's go for F_STREAM (even Michael's comment seems to agree with 
> that).
>
> Do you think we need to write this implication into the specification, 
> or do we leave it to the implementation to solve this transient problem?

I would add something like "if F_SEQPACKET has been negotiated, the
[device|driver] MUST act as if F_STREAM has also been negotiated".


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

