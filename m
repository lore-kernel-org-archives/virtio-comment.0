Return-Path: <virtio-comment-return-2511-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A631A9864E5
	for <virtio-comment@lists.oasis-open.org>; Thu, 13 Jan 2022 11:35:00 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
In-Reply-To: <20220113112203.pgwfwtnqti2g4xap@steredhat>
References: <20220112170936.245410-1-sgarzare@redhat.com>
 <87fsprx63i.fsf@redhat.com> <20220113112203.pgwfwtnqti2g4xap@steredhat>
Date: Thu, 13 Jan 2022 12:34:20 +0100
Message-ID: <87czkvx41v.fsf@redhat.com>
MIME-Version: 1.0
Subject: [virtio-comment] Re: [PATCH v11 0/3] virtio-vsock: SOCK_SEQPACKET description
Content-Type: text/plain
To: Stefano Garzarella <sgarzare@redhat.com>, mst@redhat.com, stefanha@redhat.com
Cc: virtio-comment@lists.oasis-open.org, arseny.krasnov@kaspersky.com, jasowang@redhat.com
List-ID: <virtio-comment.lists.oasis-open.org>

On Thu, Jan 13 2022, Stefano Garzarella <sgarzare@redhat.com> wrote:

> On Thu, Jan 13, 2022 at 11:50:09AM +0100, Cornelia Huck wrote:
>>On Wed, Jan 12 2022, Stefano Garzarella <sgarzare@redhat.com> wrote:
>>
>>> v11:
>>> - reworked "Message and record boundaries" paragraph [stefanha]
>>>
>>> v10: https://markmail.org/message/aebu4zqp4kxdm4ej
>>>
>>> Linux kernel and QEMU already merged SOCK_SEQPACKET support,
>>> so I'm resending Arseny's patches to have consistent virtio-spec
>>> and implementation.
>>
>>It really should not have been merged without a spec :( But now that it
>
> Yeah, I agree but the linux-net maintainers merged it right away, so we 
> rushed to merge QEMU too to use the feature.
>
>>has happened already, we need to get a proper spec added sooner rather
>>than later, and it would be nice if it could make virtio 1.2, which
>>would mean that voting needs to start this week.
>
> Having it in virtio 1.2 would be great.
>
>>
>>(I don't see an issue at https://github.com/oasis-tcs/virtio-spec/issues
>>yet; creating one would be an obvious pre-req.)
>
> Do I create it now or when we have all the patches ready?

If you already know that there will be a v12, I'd probably hold it off
until you post that; but it is easy to simply edit the issue to update
the link to the archive.

>
>>
>>>
>>> I added patch 2, following the discussion about F_STREAM feature bit:
>>> https://markmail.org/message/aoaspjy2jhidwbuo#query:+page:1+mid:obw54zzikgqimhjk+state:results
>>>
>>> About patch 2, the vhost-vsock device in the Linux kernel doesn't set bit 0
>>> (F_STREAM), so at this point I don't know if it's better to use a negative
>>> feature flag (e.g. F_NO_STREAM) or we go for F_STREAM and send a patch to
>>> linux-stable (and QEMU?) to solve this issue.
>>
>>I fear that even with a patch for stable, there can still be old setups
>>around for which "only F_SEQPACKET set" translates to "supports both
>>stream and seqpacket"...
>
> Which is usually true, since seqpacket is pretty much stream with the 
> message/record boundaries.

Hm; so, does it make much sense to support seqpacket but not stream? If
not, maybe seqpacket can always imply stream, and we'd eliminate the
uncertainty.


>
>> so I guess it mostly becomes a question of
>>whether ignoring those broken setups is tolerable. (The old setups not
>>setting any feature bits are fine with the proposed patch.) Using a
>>negative feature bit is uglier, but also clearer. I suppose we want to
>>be able to make stream sockets optional?
>
> Yes, especially with other types, like datagram (not yet merged). We 
> would like to be able to allow just datagram, without stream and 
> seqpacket.

This would probably work well even if we have seqpacket imply stream.

>
>> If so, I think the negative
>>approach is the better option, unless we can live with some broken
>>setups.
>>
>
> Yes, it's probably the best thing.
>
> I'm thinking about QEMU and the mess to add a new kernel supported 
> feature. (vsock is almost always used with vhost-vsock).
> We might be in the case where we migrate from a new QEMU that supports 
> F_STREAM to an old one that doesn't set it but supports stream anyway.
>
> So I'd like to change patch 2 to F_NO_STREAM. For the spec, it's not the 
> best, but for the current implementation, I think it's the cleanest 
> solution.
> Otherwise maybe we should write in the spec that if F_SEQPACKET is set 
> this means that stream is supported even if F_STREAM is not set.

Yes, if that works, it would probably be the less ugly option.

>
>
> Michael, Stefan, what do you think?
>
>
> Thanks,
> Stefano


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

