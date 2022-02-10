Return-Path: <virtio-comment-return-2751-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 71E93986437
	for <virtio-comment@lists.oasis-open.org>; Thu, 10 Feb 2022 12:54:02 +0000 (UTC)
Message-ID: <2bb52878-8635-5b9c-f51d-4783c8546d0d@redhat.com>
Date: Thu, 10 Feb 2022 13:53:57 +0100
MIME-Version: 1.0
References: <20220124125625.3706347-1-stevensd@chromium.org>
 <20220124125625.3706347-2-stevensd@chromium.org>
 <bc90737b-1e4d-31a2-178e-d8c2b8982d45@redhat.com>
 <CAD=HUj6rj3bvGYGpoJZNLcA=YFRbj5nKxiZko9VbNfJ-_LFeFQ@mail.gmail.com>
 <c4e211ae-8dec-c5de-880a-b92b202e0116@redhat.com>
 <CAD=HUj7y8gD6Aah8=vEqugnAcDcaqwpP_uGJR=MkT8oa89V3qw@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
In-Reply-To: <CAD=HUj7y8gD6Aah8=vEqugnAcDcaqwpP_uGJR=MkT8oa89V3qw@mail.gmail.com>
Subject: Re: [virtio-comment] [PATCH 1/2] virtio-balloon: add an event queue
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: David Stevens <stevensd@chromium.org>
Cc: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

On 04.02.22 02:41, David Stevens wrote:
>>>>> +
>>>>> +\drivernormative{\paragraph}{Events}{Device Types / Memory Balloon Device / Device Operation / Events}
>>>>> +
>>>>> +The driver MUST update \field{actual} with any allocated pages before
>>>>> +sending a VIRTIO_BALLOON_EVENT_OOPUFF event.
>>>>> +
>>>>> +The driver SHOULD wait for the device to acknowledge the event
>>>>> +before trying to further inflate or deflate the balloon.
>>>>> +
>>>>> +If VIRTIO_BALLOON_F_DEFLATE_ON_OOM has been negotiated, the driver
>>>>> +SHOULD send an OOM event before using pages from the balloon.
>>>>> +
>>>>> +\devicenormative{\paragraph}{Events}{Device Types / Memory Balloon Device / Device Operation / Events}
>>>>> +
>>>>> +When the device receives a VIRTIO_BALLOON_EVENT_OOM event, it SHOULD deflate
>>>>> +the balloon by \field{data} pages before acknowledging the event.
>>>>
>>>> The issue is that this is asynchronous. You won't really be able to stop
>>>> OOM from killing processes as you usually won't be able to get back
>>>> pages fast enough.
>>>
>>> If the device reduces num_pages before acking the message, then the
>>> driver can wait for the ack and deflate the balloon synchronously. For
>>> Linux specifically, blocking in the OOM notifier is fine (at least the
>>> balloon driver already acquires a mutex here). And while it's true
>>> that reclaiming memory might not be fast, my understanding is that
>>> anywhere that could invoke the OOM killer can also invoke swap to
>>> disk, which is also not fast.
>>
>> And that's the main issue IIRC. Allocation paths that *cannot* do that
>> (sleep, trigger the OOM killer) will fail the allocation instead,
>> essentially destabilizing your system or just crashing with unexpected
>> behavior. Reclaim can be done mostly synchronous if need be IIRC.
>>
>> So once *some* path triggers the OOM killer and you try to keep up,
>> other parts of the system can already start falling apart.
>>
>> Hooking into the shrinker interface is better, however, has some ugly
>> side-effects that random memory pressure will completely deflate the
>> balloon.
>>
>> See 71994620bb25 ("virtio_balloon: replace oom notifier with shrinker")
>> followed by da10329cb057 ("virtio-balloon: switch back to OOM handler
>> for VIRTIO_BALLOON_F_DEFLATE_ON_OOM")
>>
>> Especially my note about "The shrinker does not have a concept of
>> priorities yet, so this behavior cannot be configured."
>>
>>
>> Long story short: we should avoid hooking into the OOM killer for all
>> new features.
> 
> In that case, this could be a more generic
> VIRTIO_BALLOON_EVENT_PRESSURE event, which the driver is free to send
> at any point where it detects memory pressure. For the Linux driver,
> that would be during reclaim. For device requirements, something like:

During reclaim is not sufficient I think. E.g., just inflating the
balloon would trigger reclaim (intended!) and trigger this event.

I think you'd actually want shrinker priorities or similar in Linux, and
really get notified only once some healthy reclaim "let's drop clean
file pages" is no longer possible -- or even if we're close to it no
longer beeing possible.

> 
> "The device SHOULD deflate the balloon before acknowledging the event
> if it determines that the driver is under severe memory pressure."

The "severe memory pressure" part is what we want. The interesting part
is how we could actually obtain that information from Linux.

Having that said, I'm not opposed to these changes, but there should be
a way to actually hook this up to Linux MM and get a reasonable outcome
out of it. As raised, the OOM killer is not really what we want to hook
into.

-- 
Thanks,

David / dhildenb


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

