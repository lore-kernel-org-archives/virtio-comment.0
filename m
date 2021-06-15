Return-Path: virtio-comment-return-1903-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C06E09865A0
	for <virtio-comment@lists.oasis-open.org>; Tue, 15 Jun 2021 03:59:42 +0000 (UTC)
References: <20210524183232.2513690-1-arseny.krasnov@kaspersky.com>
 <20210527131549.qs4z4re7yxsb37f5@steredhat>
From: Arseny Krasnov <arseny.krasnov@kaspersky.com>
Message-ID: <52d232ac-128d-45e3-b8cd-467b6c14da33@kaspersky.com>
Date: Tue, 15 Jun 2021 06:59:38 +0300
MIME-Version: 1.0
In-Reply-To: <20210527131549.qs4z4re7yxsb37f5@steredhat>
Subject: Re: [virtio-comment] [PATCH v6 0/2] virtio-vsock: introduce
 SOCK_SEQPACKET description
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Content-Language: en-US
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: "cohuck@redhat.com" <cohuck@redhat.com>, "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, Stefan Hajnoczi <stefanha@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Jorgen Hansen <jhansen@vmware.com>, Norbert Slusarek <nslusarek@gmx.net>, Colin Ian King <colin.king@canonical.com>, Andra Paraschiv <andraprs@amazon.com>, "virtualization@lists.linux-foundation.org" <virtualization@lists.linux-foundation.org>, "oxffffaa@gmail.com" <oxffffaa@gmail.com>
List-ID: <virtio-comment.lists.oasis-open.org>


On 27.05.2021 16:15, Stefano Garzarella wrote:
> On Mon, May 24, 2021 at 09:32:29PM +0300, Arseny Krasnov wrote:
>> This adds description of SOCK_SEQPACKET type for virtio-vsock.
>>
>> Here is latest RFC implementation for Linux, with more details:
>>
>> https://lkml.org/lkml/2021/5/20/2386
>>
>> Also this patchset has patch which replaces enums to defines in
>> virtio-vsock part of spec. SOCK_SEQPACKET patch is based on it.
>>
>> Arseny Krasnov(2):
>>  virtio-vsock: use C style defines for constants
>>  virtio-vsock: SOCK_SEQPACKET description
>>
>> virtio-vsock.tex | 74 ++++++++++++++++++++++++++++------------------
>> 1 file changed, 46 insertions(+), 28 deletions(-)
>>
> The series LGTM!
>
> Let's wait for other comments.

Ping, Linux kernel patches are already merged to net-next


Thank You

>
> I'll send a follow up patch next week about feature bit for stream 
> socket (bit 0).
>
> Thanks,
> Stefano
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

