Return-Path: <virtio-comment-return-9097-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34678C48297
	for <virtio-comment@archiver.kernel.org>; Fri,  9 Feb 2024 11:43:17 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 6B9222B06F
	for <virtio-comment@archiver.kernel.org>; Fri,  9 Feb 2024 11:43:16 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4F9E29868F2
	for <virtio-comment@archiver.kernel.org>; Fri,  9 Feb 2024 11:43:16 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 346DA9843C0; Fri,  9 Feb 2024 11:43:16 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 23CE29868EE
	for <virtio-comment@lists.oasis-open.org>; Fri,  9 Feb 2024 11:43:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 62oN2vx-P5S5MfauitFraQ-1
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Hilber <peter.hilber@opensynergy.com>, Parav Pandit
 <parav@nvidia.com>, "virtio-comment@lists.oasis-open.org"
 <virtio-comment@lists.oasis-open.org>
In-Reply-To: <4e39177c-7bdb-4754-a170-5edbb89002e1@opensynergy.com>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy
 Ross"
References: <20231218064253.9734-1-peter.hilber@opensynergy.com>
 <20231218064253.9734-2-peter.hilber@opensynergy.com>
 <DM8PR12MB548058D48443B3B0A89DF05DDC772@DM8PR12MB5480.namprd12.prod.outlook.com>
 <810765b7-db87-4854-98c5-3a6cf43b955c@opensynergy.com>
 <PH0PR12MB54812D669FC7B1EA9EB58360DC7F2@PH0PR12MB5481.namprd12.prod.outlook.com>
 <4e39177c-7bdb-4754-a170-5edbb89002e1@opensynergy.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Fri, 09 Feb 2024 12:43:09 +0100
Message-ID: <87zfw9hnhu.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Subject: Re: [virtio-comment] RE: [RFC PATCH v3 1/4] virtio-rtc: Add initial
 device specification

On Thu, Feb 08 2024, Peter Hilber <peter.hilber@opensynergy.com> wrote:

> On 28.01.24 07:15, Parav Pandit wrote:
>> 
>> 
>>> From: Peter Hilber <peter.hilber@opensynergy.com>
>>> Sent: Wednesday, January 24, 2024 9:09 PM
>>>
>>> On 20.01.24 11:07, Parav Pandit wrote:
>>>> Hi Peter,
>>>>
>>>>> From: Peter Hilber <peter.hilber@opensynergy.com>
>>>>> Sent: Monday, December 18, 2023 12:13 PM
>
> [snip]
>
>>>>> +\subsection{Device Initialization}\label{sec:Device Types / RTC
>>>>> +Device / Device Initialization}
>>>>> +
>>>>> +The device determines the set of clocks. The device can provide zero
>>>>> +or more clocks.
>>>>> +
>>>> Now that we bring the generic basic facilities to define device
>>>> capabilities and resources in [1], Num_clocks can be structured a clock
>>> resources.
>>>>
>>>> Please refer to max_limits in [1] as capabilities.
>>>> [1]
>>>> https://lists.oasis-open.org/archives/virtio-comment/202401/msg00095.h
>>>> tml
>>>>
>>>> We should bring a rtc capabilities.
>>>>
>>>
>>> Hi Parav,
>>>
>>> thank you for the suggestions! I think that it is a good idea to standardize
>>> message layouts. But I also think this is late and overly complex to become
>>> the default RTC interface. 
>> It takes out the complexity or functionality that RTC tries to define and puts in generic infra.
>> Same was done for net device for its capabilities.
>> 
>
> I disagree about the complexity, and prefer to keep the RTC device without
> admin virtqueues. Below I am making a proposal how RTC in the net device
> could likely be used with a polished resources paradigm, without creating a
> dependency for RTC standardization.
>
> Using the resources commands as RTC commands would result in an interface
> which is clearly more complex than the current interface. The resources
> commands are not an adequate abstraction for all device functionality which
> is not a net device data path.
>
> The only advantage to the net device (not to the RTC device) would be that
> its top level interfaces have a more unified look. My proposal 4) below
> would retain this advantage. With the original resources sketch, the actual
> RTC-specific interface would get more complicated for the net device as
> well. 
>
> In general, virtio devices have arbitrary command types and it is possible
> to add new command types through feature bits. Why should just 4 types of
> commands (CREATE, MODIFY, QUERY, DESTROY) be good enough for RTC clocks
> (and also not hinder RTC development in the future)? Any existing, and any
> new, commands would be merged into artificial commands (typically QUERY).
> The current RTC draft has at least 4 commands on a clock resource which
> would need to be mapped to a single artificial QUERY command (CLOCK_CAP,
> CROSS_CAP, READ, READ_CROSS).
>
> Combining naturally distinct commands will increase the complexity for
> specifying and implementing the command. Simple devices also do not
> dynamically create or remove resources, so the resource paradigm is even
> less useful here.
>
> The many issues discussed below confirm that complexity actually increases,
> and indicate that the resources proposal cannot be considered complete and
> mature yet.
>
> Also, admin virtqueues have explicitly been defined and implemented as a
> Virtio Over PCI Bus specific interface. Therefore, they cannot be a
> mandatory dependency of a general-purpose device.
>
> I see four different options for the net device to have RTC commands:
>
> 1) Make the RTC device a member device of the net device.
>
> 2) Put the RTC requests into the controlq, as discussed previously.
>
> 3) Introduce new group administration commands which encapsulate the RTC
>    requests (similar to how it was discussed for the controlq).
>
> 4) Once the resource proposal is sufficiently complete and consistent,
>    encapsulate the RTC requests in resource QUERY, resource MODIFY, or
>    similar commands. This must be done in such a way as to not restrict
>    future extensions to the RTC device. 
>
>    The QUERY and MODIFY commands then need to have both a command-specific
>    data and command-specific result.
>
>    Clock ID fields in the RTC requests would then correspond to
>    virtio_admin_cmd_resource_cmd_hdr.rid. The clock ID field types should
>    then not be smaller than the rid field.
>
> The RTC requirements about writing to and reading from buffers appear to be
> compatible with the admin virtqueue, except for the zero-padding of short
> buffers in the admin virtqueue, which could also be added to RTC.
>
> RTC could also reuse the status definitions of the admin virtqueue.
>
> All four above options allow to standardize RTC without depending on the
> resources standardization (and PoC) progress.
>
> The latter two options should also allow putting RTC into the admin
> virtqueue for the net device. For standalone use, all four use a
> device-specific queue.

Thanks for the discussion and examples here, this helps.

>
>>> In particular, OpenSynergy has no plans at the
>>> moment to support administration virtqueues (and the newly proposed
>>> device capabilities and device resources) in the RTC prototype
>>> implementation.
>>>
>> For RTC and any new facilities, I believe movement is not applicable because until now there wasn't anything.
>>  
>
> I don't understand why this would be irrelevant information when discussing
> about complexity and standardization progress.
>
>>> At the moment I see the following problems with using device capabilities
>>> and resources:
>>>
>>> - Device capabilities and resources were initially proposed last week. It
>>>   remains to be seen how and when they will be accepted into the standard,
>>>   and when the Linux kernel driver will support them. 
>> The first user should be able to implement it.
>> 
>
> This comment was about the delay that using resources would imply on
> standardizing and implementing the RTC device.
>
>>> Especially the
>>>   dynamic resource (de-)allocation seems a tricky topic to me.
>>>
>> Ok. Lets discuss.
>> Also implicit device resource is also to be considered which are kind of default resource exist on the device, which driver would not create/destroy.
>> 
>
> This is not yet described in the resource proposal.
>
>>>   By contrast, RTC was originally proposed 10 months ago, and has had an
>>>   open-source driver available since 7 months. In the past it was discussed
>>>   that the net device could be supported through the net controlq.
>>>
>> I assume that driver is available for reference, prototype etc, purpose and not to use it in any kind of production environment before standardizing the spec.
>> Otherwise there is something fundamentally broken in the virtio spec standardization in 1.x era.
>>  
>
> I agree. But my point here is that proposing new non-trivial, draft stage,
> transport-specific features as a prerequisite for a long proposed feature
> (RTC) can unduly delay or even kill the long proposed feature.

I agree -- we have something that looks close to being ready to go, and
another set of features that, while looking interesting, are nowhere
ready to be merged. I don't think we want to have the latter hold up the
former, when the complex feature still needs resources for review and
discussion _and_ can be added on top of the original device later on.

[In case you ask: I currently don't have resources myself to deal with
the admin/resource proposal. There's a reason why it just sits on my
todo list -- I'm focusing to keep at least the project per se running
with voting etc., and that's a stretch already -- apologies for the
permanent delays in that department...]

>
> What if e.g. capabilities and resources were now added to RTC, but in 10
> months, somebody says, drop it, I have a supposedly better idea, which
> cannot be conditional on a feature bit?
>
>>> - Administration virtqueues are only defined for Virtio Over PCI Bus. Our
>>>   use cases also need Virtio Over MMIO, and maybe others in the future.
>>>
>> AQ are like any other virtqueues. So MMIO registers to expose AQ is straightforward.
>> Once you have it over PCI, this can be supported.
>> 
>
> I do not understand the previous sentence.
>
> Admin virtqueues have explicitly been defined and implemented as a Virtio
> Over PCI Bus specific interface. Therefore they cannot be a mandatory
> dependency of a general-purpose, PCI-independent device.

We can, in theory, add support for other transports as well -- but that
needs someone to actually do it, aka resources again. I'd consider
support for this on the MMIO transport to be the bare minimum.

<snipping a bunch of interesting discussion>

I'd be in favour of addressing the smaller comments for this proposal
and then go ahead with it. We always can extend things later on.


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

