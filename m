Return-Path: virtio-comment-return-1633-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1AE3B986142
	for <virtio-comment@lists.oasis-open.org>; Wed, 13 Jan 2021 03:35:34 +0000 (UTC)
References: <20201222075005.69d1cc6e.pasic@linux.ibm.com>
 <20201222165431.3f49de29.cohuck@redhat.com>
 <3cf88dc9-4053-0f24-854f-6cc6df2aaac4@redhat.com>
 <20201225083835.62efb230.pasic@linux.ibm.com>
 <20201227044431-mutt-send-email-mst@kernel.org>
 <20201228072104.08339352.pasic@linux.ibm.com>
 <30369ca4-6621-ea70-abbf-01c62666044b@redhat.com>
 <20201228072749-mutt-send-email-mst@kernel.org>
 <661905925.40710498.1609232667286.JavaMail.zimbra@redhat.com>
 <20210112054859-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <6485358d-d036-b761-a77d-d3ddac216d19@redhat.com>
Date: Wed, 13 Jan 2021 11:35:17 +0800
MIME-Version: 1.0
In-Reply-To: <20210112054859-mutt-send-email-mst@kernel.org>
Subject: Re: [virtio-comment] [PATCH RFC] virtio: introduce
 VIRTIO_F_DEVICE_STOP
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Halil Pasic <pasic@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>, stefanha@redhat.com, virtio-comment@lists.oasis-open.org, eperezma@redhat.com, sgarzare@redhat.com
List-ID: <virtio-comment.lists.oasis-open.org>


On 2021/1/12 =E4=B8=8B=E5=8D=886:54, Michael S. Tsirkin wrote:
> On Tue, Dec 29, 2020 at 04:04:27AM -0500, Jason Wang wrote:
>>>>>> However wouldn't it be possible for device to just cancel
>>>>>> processing available buffers even if it started processing
>>>>>> them? Some buffers could be in indeterminate state
>>>>>> (e.g. we might not have a way to know how much data did
>>>>>> device have time to write into a buffer).
>>>>>>
>>>>> Maybe Jason can answer this one.
>>>>
>>>> For networking device, it should be possible (packet could be dropped =
or
>>>> duplicated). But I'm not sure it works for other device. E.g for the b=
lock
>>>> devices that needs to communicate with a remote backend. Waat's more
>>>> important, my understadning is that the intermediate state is somethin=
g
>>>> that
>>>> we need to avoid (hard to be migrated anyhow).
>>> The difficulty is on the device side though, so why not say: if it want=
s to
>>> flush IO that's up to it.
>> Do you mean to introduce a device specific way to flush IO? If yes, it
>> actually introduces a new intermediate state implicitly:
>>
>> 1) device is stopped
>> 2) device is stopped and IO is flushed
>>
>> This looks more complicated than a single new state:
>>
>> 1) device is stopped and IO is flushed
>>
>> Thanks
> I thought some more about it, if we call a buffer which was
> made available by driver but not yet used by device,


For "used by device" you meant posting entries to used ring?


> a cancelled buffer, then maybe we can specify
> the behaviour by explaining that it should be possible to
> retry any cancelled buffer, that is make it available again,
> and achieve the same effect as if it was used.
> For example, any reads without side effects can be just
> ignored even if they might have modified guest memory.


Right, but how about the buffer that can't be retried? Or you meant we=20
leave that to a specific device to handle?

THanks


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

