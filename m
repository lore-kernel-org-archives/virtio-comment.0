Return-Path: <sgarzare@redhat.com>
Date: Thu, 13 Jan 2022 14:57:58 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH v11 0/3] virtio-vsock: SOCK_SEQPACKET description
Message-ID: <20220113135758.nifr7hftqh57viku@steredhat>
References: <20220112170936.245410-1-sgarzare@redhat.com>
 <87fsprx63i.fsf@redhat.com>
 <20220113112203.pgwfwtnqti2g4xap@steredhat>
 <87czkvx41v.fsf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <87czkvx41v.fsf@redhat.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
To: Cornelia Huck <cohuck@redhat.com>
Cc: mst@redhat.com, stefanha@redhat.com, virtio-comment@lists.oasis-open.org, arseny.krasnov@kaspersky.com, jasowang@redhat.com
List-ID: <virtio-comment.lists.oasis-open.org>

On Thu, Jan 13, 2022 at 12:34:20PM +0100, Cornelia Huck wrote:
>On Thu, Jan 13 2022, Stefano Garzarella <sgarzare@redhat.com> wrote:
>
>> On Thu, Jan 13, 2022 at 11:50:09AM +0100, Cornelia Huck wrote:
>>>On Wed, Jan 12 2022, Stefano Garzarella <sgarzare@redhat.com> wrote:
>>>
>>>> v11:
>>>> - reworked "Message and record boundaries" paragraph [stefanha]
>>>>
>>>> v10: https://markmail.org/message/aebu4zqp4kxdm4ej
>>>>
>>>> Linux kernel and QEMU already merged SOCK_SEQPACKET support,
>>>> so I'm resending Arseny's patches to have consistent virtio-spec
>>>> and implementation.
>>>
>>>It really should not have been merged without a spec :( But now that it
>>
>> Yeah, I agree but the linux-net maintainers merged it right away, so we
>> rushed to merge QEMU too to use the feature.
>>
>>>has happened already, we need to get a proper spec added sooner rather
>>>than later, and it would be nice if it could make virtio 1.2, which
>>>would mean that voting needs to start this week.
>>
>> Having it in virtio 1.2 would be great.
>>
>>>
>>>(I don't see an issue at https://github.com/oasis-tcs/virtio-spec/issues
>>>yet; creating one would be an obvious pre-req.)
>>
>> Do I create it now or when we have all the patches ready?
>
>If you already know that there will be a v12, I'd probably hold it off
>until you post that; but it is easy to simply edit the issue to update
>the link to the archive.

Issue created and I also sent an email to the cover letter with the 
follwing tag:

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/132

>
>>
>>>
>>>>
>>>> I added patch 2, following the discussion about F_STREAM feature bit:
>>>> https://markmail.org/message/aoaspjy2jhidwbuo#query:+page:1+mid:obw54zzikgqimhjk+state:results
>>>>
>>>> About patch 2, the vhost-vsock device in the Linux kernel doesn't set bit 0
>>>> (F_STREAM), so at this point I don't know if it's better to use a negative
>>>> feature flag (e.g. F_NO_STREAM) or we go for F_STREAM and send a patch to
>>>> linux-stable (and QEMU?) to solve this issue.
>>>
>>>I fear that even with a patch for stable, there can still be old setups
>>>around for which "only F_SEQPACKET set" translates to "supports both
>>>stream and seqpacket"...
>>
>> Which is usually true, since seqpacket is pretty much stream with the
>> message/record boundaries.
>
>Hm; so, does it make much sense to support seqpacket but not stream? If
>not, maybe seqpacket can always imply stream, and we'd eliminate the
>uncertainty.

No, it doesn't make much sense, so I think the implication always makes 
sense.

>
>
>>
>>> so I guess it mostly becomes a question of
>>>whether ignoring those broken setups is tolerable. (The old setups 
>>>not
>>>setting any feature bits are fine with the proposed patch.) Using a
>>>negative feature bit is uglier, but also clearer. I suppose we want to
>>>be able to make stream sockets optional?
>>
>> Yes, especially with other types, like datagram (not yet merged). We
>> would like to be able to allow just datagram, without stream and
>> seqpacket.
>
>This would probably work well even if we have seqpacket imply stream.

Yep.

>
>>
>>> If so, I think the negative
>>>approach is the better option, unless we can live with some broken
>>>setups.
>>>
>>
>> Yes, it's probably the best thing.
>>
>> I'm thinking about QEMU and the mess to add a new kernel supported
>> feature. (vsock is almost always used with vhost-vsock).
>> We might be in the case where we migrate from a new QEMU that supports
>> F_STREAM to an old one that doesn't set it but supports stream anyway.
>>
>> So I'd like to change patch 2 to F_NO_STREAM. For the spec, it's not the
>> best, but for the current implementation, I think it's the cleanest
>> solution.
>> Otherwise maybe we should write in the spec that if F_SEQPACKET is set
>> this means that stream is supported even if F_STREAM is not set.
>
>Yes, if that works, it would probably be the less ugly option.

Okay, let's go for F_STREAM (even Michael's comment seems to agree with 
that).

Do you think we need to write this implication into the specification, 
or do we leave it to the implementation to solve this transient problem?

Thanks,
Stefano

