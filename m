Return-Path: <sgarzare@redhat.com>
Date: Thu, 13 Jan 2022 15:16:50 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [virtio-comment] Re: [PATCH v11 0/3] virtio-vsock:
 SOCK_SEQPACKET description
Message-ID: <20220113141650.na7olcyezcfzrpuz@steredhat>
References: <20220112170936.245410-1-sgarzare@redhat.com>
 <87fsprx63i.fsf@redhat.com>
 <20220113112203.pgwfwtnqti2g4xap@steredhat>
 <87czkvx41v.fsf@redhat.com>
 <20220113135758.nifr7hftqh57viku@steredhat>
 <877db3wwzl.fsf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <877db3wwzl.fsf@redhat.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
To: Cornelia Huck <cohuck@redhat.com>
Cc: mst@redhat.com, stefanha@redhat.com, virtio-comment@lists.oasis-open.org, arseny.krasnov@kaspersky.com, jasowang@redhat.com
List-ID: <virtio-comment.lists.oasis-open.org>

On Thu, Jan 13, 2022 at 03:06:54PM +0100, Cornelia Huck wrote:
>On Thu, Jan 13 2022, Stefano Garzarella <sgarzare@redhat.com> wrote:
>
>> On Thu, Jan 13, 2022 at 12:34:20PM +0100, Cornelia Huck wrote:
>>>> Otherwise maybe we should write in the spec that if F_SEQPACKET is set
>>>> this means that stream is supported even if F_STREAM is not set.
>>>
>>>Yes, if that works, it would probably be the less ugly option.
>>
>> Okay, let's go for F_STREAM (even Michael's comment seems to agree with
>> that).
>>
>> Do you think we need to write this implication into the specification,
>> or do we leave it to the implementation to solve this transient problem?
>
>I would add something like "if F_SEQPACKET has been negotiated, the
>[device|driver] MUST act as if F_STREAM has also been negotiated".
>

Ack, I'll send v12 with this change.

Thanks,
Stefano

