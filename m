Return-Path: <virtio-comment-return-2764-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6C8C298638B
	for <virtio-comment@lists.oasis-open.org>; Tue, 22 Feb 2022 08:18:22 +0000 (UTC)
References: <1645101080313.3853@amazon.com>
 <20220217125506.icgvndy3v66cyhxy@sgarzare-redhat>
From: Arseniy Krasnov <oxffffaa@gmail.com>
Message-ID: <0420e5d6-60f0-be57-ec6a-e88127174cda@gmail.com>
Date: Tue, 22 Feb 2022 11:18:09 +0300
MIME-Version: 1.0
In-Reply-To: <20220217125506.icgvndy3v66cyhxy@sgarzare-redhat>
Subject: Re: [virtio-comment] vsock: define a maximum size for the packet data
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
To: Stefano Garzarella <sgarzare@redhat.com>, "Loghin, Laura" <lauralg@amazon.com>
Cc: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
List-ID: <virtio-comment.lists.oasis-open.org>

Hello

On 17.02.2022 15:55, Stefano Garzarella wrote:
> On Thu, Feb 17, 2022 at 12:31:20PM +0000, Loghin, Laura wrote:
>> Hello,
>>
>> Would it be possible to define a maximum size for the packet data in the=
 spec (for example the one from the Linux driver [1])? We are working on a =
vsock packet implementation in rust-vmm [2], and we would like to check for=
 some sort of limit for the data packet,
>>
>> without using the limit from a specific driver implementation. We want t=
o do this so that the driver is not allowed to reserve huge chunks of memor=
y. VMMs might want to reject packets that have bigger data arrays.=C2=A0 Th=
is limit could probably be defined in the VMM as well, and then propagated/=
checked where it is needed, but it would be nicer to have one at the spec l=
evel.
>>
>
> Yep, I think it is possible, but maybe to limit the memory used in the gu=
est, it would be better to add a field in the configuration space to define=
 the maximum packet size (like MTU for virtio-net) for each device.
>
So, rely on current implementation, virtio vsock rx buffers will be allocat=
ed with this size from config? And also both peers must negotiate this valu=
e(like credit size), to avoid packets drop?


Thank You

> At that point we can also add a maximum that seems reasonable. For now I =
think the theoretical maximum is 4GB since the len field is on 32bit, obvio=
usly not a real limit :-)
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
> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-l=
ists
> Committee: https://www.oasis-open.org/committees/virtio/
> Join OASIS: https://www.oasis-open.org/join/
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
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lis=
ts
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

