Return-Path: virtio-comment-return-1727-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DD947985B32
	for <virtio-comment@lists.oasis-open.org>; Mon, 22 Feb 2021 10:38:29 +0000 (UTC)
References: <20210218060715.1075547-1-arseny.krasnov@kaspersky.com>
 <20210222101654.63tz75jzspiwt4tc@steredhat>
From: Arseny Krasnov <arseny.krasnov@kaspersky.com>
Message-ID: <0ec28992-5a95-8af1-7f9b-b81a36678f13@kaspersky.com>
Date: Mon, 22 Feb 2021 13:38:17 +0300
MIME-Version: 1.0
In-Reply-To: <20210222101654.63tz75jzspiwt4tc@steredhat>
Subject: [virtio-comment] Re: [MASSMAIL KLMS] [virtio-comment] Re: [RFC PATCH v1 0/1]
 virtio-vsock: introduce SEQPACKET description
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Content-Language: en-US
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: "cohuck@redhat.com" <cohuck@redhat.com>, "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, Stefan Hajnoczi <stefanha@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Jorgen Hansen <jhansen@vmware.com>, Norbert Slusarek <nslusarek@gmx.net>, Colin Ian King <colin.king@canonical.com>, Andra Paraschiv <andraprs@amazon.com>, "virtualization@lists.linux-foundation.org" <virtualization@lists.linux-foundation.org>, "oxffffaa@gmail.com" <oxffffaa@gmail.com>
List-ID: <virtio-comment.lists.oasis-open.org>


On 22.02.2021 13:16, Stefano Garzarella wrote:
> On Thu, Feb 18, 2021 at 09:07:12AM +0300, Arseny Krasnov wrote:
>> This patchset adds description of SOCK_SEQPACKET socket's type
>> of virtio vsock.
>>
>> Here is implementation:
>> https://lkml.org/lkml/2021/2/18/24
>>
>> Arseny Krasnov(1):
>>  virtio-vsock: add SOCK_SEQPACKET description
>>
>> virtio-vsock.tex | 40 +++++++++++++++++++++++++++++++++++++---
>> 1 files changed, 37 insertions(+), 3 deletions(-)
>>
>> TODO:
>> - for messages identification I use header's field called 'msg_cnt'.
>>  May be it is better to call it 'msg_id' or 'msg_num', because it
>>  is used as ID, but implemented as counter.
> If we use it only as an identifier, I think 'msg_id' is preferable and 
> we shouldn't mention in the specs that it's a counter, since it's just a 
> possible implementation.

Well let it be 'msg_id', because it's used for packet drop control, and

counter is one of implementations.

> Instead if we use the counter for some control, for example if we lost a 
> packet, then maybe msg_cnt is better.
> But since the channel shouldn't lose packets, I don't think this is the 
> case.
>
>> - in current version of specification, some values of headers' fields
>>  still unnamed, for example type of socket (stream or seqpacket), then
>>  shutdown flags. Spec says that for stream socket value of 'type'
>>  must be 1. For receive shutdown bit 0 is set in 'flags', for send
>>  shutdown bit 1 is set in 'flags'. But in Linux these unnamed ones and
>>  zeroes are implemented as enums, so may be it will be ok to add such
>>  enums in specification (as 'enum virtio_vsock_event_id').
> Since we have an enumerate for VIRTIO_VSOCK_OP_* values, I think we can 
> add enums for socket type and maybe 'flags'.
Ack
>
> Thanks,
> Stefano
>
>
> This publicly archived list offers a means to provide input to the
> OASIS Virtual I/O Device (VIRTIO) TC.
>
> In order to verify user consent to the Feedback License terms and
> to minimize spam in the list archive, subscription is required
> before posting.
>
> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> List help: virtio-comment-help@lists.oasis-open.org
> List archive: https://lists.oasis-open.org/archives/virtio-comment/
> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
> Committee: https://www.oasis-open.org/committees/virtio/
> Join OASIS: https://www.oasis-open.org/join/
>
>

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

