Return-Path: <virtio-comment-return-2539-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 530D7986507
	for <virtio-comment@lists.oasis-open.org>; Fri, 14 Jan 2022 10:09:13 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
In-Reply-To: <20220114093952.gjn3mm6mg6wlyibv@steredhat>
References: <20220113165202.250429-1-sgarzare@redhat.com>
 <20220114093952.gjn3mm6mg6wlyibv@steredhat>
Date: Fri, 14 Jan 2022 11:08:55 +0100
Message-ID: <874k66wrwo.fsf@redhat.com>
MIME-Version: 1.0
Subject: [virtio-comment] Re: [PATCH v12 0/3] virtio-vsock: SOCK_SEQPACKET description
Content-Type: text/plain
To: Stefano Garzarella <sgarzare@redhat.com>, mst@redhat.com
Cc: virtio-comment@lists.oasis-open.org, jasowang@redhat.com, stefanha@redhat.com, arseny.krasnov@kaspersky.com
List-ID: <virtio-comment.lists.oasis-open.org>

On Fri, Jan 14 2022, Stefano Garzarella <sgarzare@redhat.com> wrote:

> Cornelia, Michael,
> if you are happy with this version, can we start the vote to have these 
> changes in virtio-spec 1.2?

Looks good to me. Unless there are objections, I'll start the vote later
today.

>
> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/132
>
> Thanks,
> Stefano
>
> On Thu, Jan 13, 2022 at 05:51:59PM +0100, Stefano Garzarella wrote:
>>v12:
>>- added statement about supporting F_STREAM when F_SEQPACKET is negotiated
>>  [cohuck, mst]
>>
>>v11: https://lists.oasis-open.org/archives/virtio-comment/202201/msg00027.html
>>- reworked "Message and record boundaries" paragraph [stefanha]
>>
>>Linux kernel and QEMU already merged SOCK_SEQPACKET support,
>>so I'm resending Arseny's patches to have consistent virtio-spec
>>and implementation.
>>
>>I added patch 2, following the discussion about F_STREAM feature bit:
>>https://markmail.org/message/aoaspjy2jhidwbuo#query:+page:1+mid:obw54zzikgqimhjk+state:results
>>
>>Thanks,
>>Stefano
>>
>>Arseny Krasnov (2):
>>  virtio-vsock: use C style defines for constants
>>  virtio-vsock: SOCK_SEQPACKET description
>>
>>Stefano Garzarella (1):
>>  virtio-vsock: add VIRTIO_VSOCK_F_STREAM feature bit
>>
>> virtio-vsock.tex | 88 +++++++++++++++++++++++++++++++++---------------
>> 1 file changed, 60 insertions(+), 28 deletions(-)
>>
>>-- 
>>2.31.1
>>


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

