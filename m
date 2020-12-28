Return-Path: virtio-comment-return-1602-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9D0C098630D
	for <virtio-comment@lists.oasis-open.org>; Mon, 28 Dec 2020 07:05:57 +0000 (UTC)
References: <20201221223338.7b5a21e6.pasic@linux.ibm.com>
 <bbd75f21-4a17-f3df-3c0e-3633a93d0599@redhat.com>
 <20201222075005.69d1cc6e.pasic@linux.ibm.com>
 <ed5c4298-cdd4-55d7-20c6-e57d4f92f752@redhat.com>
 <20201222131404.61e4a136.cohuck@redhat.com>
 <7da54d5b-0787-c78f-4b35-6a4f7ed2f5bf@redhat.com>
 <20201224055247.5f9ce79c.pasic@linux.ibm.com>
 <67271e1e-96ea-4b28-7449-cdb0641aff72@redhat.com>
 <20201225041811.33dbbd4b.pasic@linux.ibm.com>
 <88f1134c-e1ca-e8e7-2fa6-9d6e1ca68d79@redhat.com>
 <20201227061119-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <f15c2348-48e1-412f-4ef9-0f96b79a87d4@redhat.com>
Date: Mon, 28 Dec 2020 15:05:43 +0800
MIME-Version: 1.0
In-Reply-To: <20201227061119-mutt-send-email-mst@kernel.org>
Subject: Re: [virtio-comment] [PATCH RFC] virtio: introduce
 VIRTIO_F_DEVICE_STOP
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Halil Pasic <pasic@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>, stefanha@redhat.com, virtio-comment@lists.oasis-open.org, eperezma@redhat.com, sgarzare@redhat.com
List-ID: <virtio-comment.lists.oasis-open.org>


On 2020/12/27 =E4=B8=8B=E5=8D=887:12, Michael S. Tsirkin wrote:
> On Fri, Dec 25, 2020 at 02:45:28PM +0800, Jason Wang wrote:
>>> I tend to say, that from a perspective of the driver, all requests that
>>> are available, and not yet used, are in-flight. So we have to be very
>>> careful when wording this requirement, to avoid misunderstandings. I
>>> don't think the first RFC is good enough. I will think some more about
>>> this.
>>
>> Yes, I agree. The problem is that the spec doesn't describe how device w=
ork,
>> so if we want to be more accurate, it might require some work not only f=
or
>> stop but also for e.g reset (something like in flight has been used by t=
he
>> spec in that case).
> You probably mean the DEVICE_NEEDS_RESET description, right?
>
> =09For example, the driver can't assume requests in flight will be
> =09completed if DEVICE_NEEDS_RESET is set, nor can it assume that
> =09they have not been completed.  A good implementation will try to
> =09recover by issuing a reset.
>
> yes, DEVICE_NEEDS_RESET is unfortunately underspecified which likely
> is related to the fact it is not widely implemented.


For both NEEDS_RESET and device reset.

For NEEDS_RESET, we use "in flight" and "completed" without an actual=20
definition.

For device reset, we don't even define what is the device expected (e.g=20
how are "in flight" requests expected to be processed) to behave.

Thanks


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

