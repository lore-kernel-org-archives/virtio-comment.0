Return-Path: virtio-comment-return-1575-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 57726985D51
	for <virtio-comment@lists.oasis-open.org>; Mon, 21 Dec 2020 03:43:25 +0000 (UTC)
References: <20201204054615.26124-1-jasowang@redhat.com>
 <20201217152811.GA24632@stefanha-x1.localdomain>
 <1683d9e0-daa3-e424-c50d-2c1c26a38612@redhat.com>
 <0ad592cb-cc17-cc71-222f-8b2ff80abeb1@redhat.com>
 <20201218172851.GD17597@stefanha-x1.localdomain>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <d1bdd779-aae6-cc83-921d-f9d88f281f20@redhat.com>
Date: Mon, 21 Dec 2020 11:43:09 +0800
MIME-Version: 1.0
In-Reply-To: <20201218172851.GD17597@stefanha-x1.localdomain>
Subject: Re: [virtio-comment] [RFC PATCH] virtio-pci: introduce device state
 capability
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, mst@redhat.com, eperezma@redhat.com, sgarzare@redhat.com
List-ID: <virtio-comment.lists.oasis-open.org>


On 2020/12/19 =E4=B8=8A=E5=8D=881:28, Stefan Hajnoczi wrote:
> On Fri, Dec 18, 2020 at 12:58:21PM +0800, Jason Wang wrote:
>> On 2020/12/18 =E4=B8=8A=E5=8D=8811:16, Jason Wang wrote:
>>>> A per-virtqueue stopped state is not enough to stop a device because
>>>> some devices have global behavior like config change events. It must b=
e
>>>> possible to completely stop the device to prevent further activity
>>>> (VIRTIO config space changes, interrupts, etc).
>>>>
>>>> Maybe a Device Status register bit can be added for that?
>>>
>>> I've considered such case, one of the idea is to introduce a new device
>>> status to achieve which seems more generic. Then we need to define a
>>> state machine carefully.
>>
>> So I post another RFC to introduce a new device status bit. Please revie=
w.
> Thanks, that sounds good. I will be offline until January 4th and will
> try to catch up then.
>
> Stefan


Great.

Thanks



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

