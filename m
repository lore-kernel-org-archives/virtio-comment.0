Return-Path: <virtio-comment-return-8265-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07C8DC4332F
	for <virtio-comment@archiver.kernel.org>; Wed,  8 Nov 2023 10:20:32 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 41DD12ACBE
	for <virtio-comment@archiver.kernel.org>; Wed,  8 Nov 2023 10:20:32 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 178F9986CA3
	for <virtio-comment@archiver.kernel.org>; Wed,  8 Nov 2023 10:20:32 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id EDC3B986709; Wed,  8 Nov 2023 10:20:31 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8BD6C986C99
	for <virtio-comment@lists.oasis-open.org>; Wed,  8 Nov 2023 10:20:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="369936033"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; 
   d="scan'208";a="369936033"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="756511975"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; 
   d="scan'208";a="756511975"
Message-ID: <556f34b4-75a0-45f0-a749-6539c7f2c311@intel.com>
Date: Wed, 8 Nov 2023 18:19:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: jasowang@redhat.com, eperezma@redhat.com, cohuck@redhat.com,
 stefanha@redhat.com, virtio-comment@lists.oasis-open.org, parav@nvidia.com
References: <20231103103437.72784-1-lingshan.zhu@intel.com>
 <20231107023610-mutt-send-email-mst@kernel.org>
From: "Zhu, Lingshan" <lingshan.zhu@intel.com>
In-Reply-To: <20231107023610-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [virtio-comment] Re: [PATCH V2 0/6] introduce basic facilities
 for virito live migration



On 11/7/2023 4:01 PM, Michael S. Tsirkin wrote:
> On Fri, Nov 03, 2023 at 06:34:31PM +0800, Zhu Lingshan wrote:
>> This series introduces basic facilities to support
>> virtio live migration, includes:
>>
>> 1)a new SUSPEND bit in the device status
>> Which is used to suspend the device, so that the device states
>> and virtqueue states are stabilized.
>>
>> 2)virtqueue state and its accessor, to get and set last_avail_idx
>> and last_used_idx of virtqueues.
>>
>> 3)dirty page tracking
>
> So looking at this from 100ft:
> - SUSPEND bit looks like something that might have value as a generic
>    component. For example, maybe for NUMA balancing we could suspend,
>    quickly copy ring to a different node and resume.  However current
>    restrictions make it very limited, e.g.  apparently you can't change
>    config space while suspended.
Maybe don't need to change the source side config space.
SUSPEND the device to stabilize the device config,
so that the hypervisor can fetch reliable device states,
then if any changes are required, just make modifications
at the destination side before setting SUSPEND there.
>    As another example, changing config while suspended might be
>    needed e.g. for net announcements.
I think link announce should happen after the device back alive, not 
before.
>    Also, do we want to suspend individual
>    queues then? what exactly happens with config changes while suspended
>    that would happen otherwise is also unclear. Also as is, proposal is
>    very light on detail. Other patches in the series make it look like
>    there are more assumptions made about e.g. how vq enters the
>    suspended state.
Not sure we need an interface to suspend a individual vq, it suspends 
all vqs.

I am not sure I totally get you, if you find anything I should add, and 
any suggestions,
please let me know. I should provide more details in the cover letter 
for sure,
I will add the live migration process in V3 cover letter.
>
> - virtqueue state proposal looks very vague. A couple of 16 bit indices
>    are insufficient to fully describe internal vq state at an arbitrary
>    time. Some assumptions seem to be made that make this possible and
>    yes, these would need to be stated and/or lifted.
>    Preferably lifted since another use-case proposed was debugging -
>    you do not, while debugging, want to depend on device following
>    a complex set of assumptions.
I see there are two kinds of vq states:
1) on device, the device internal states.
I see they are avail idx, used idx and in-flight descriptors.
2) states in the guest memory. This part migrates with guest memory.

I may miss something, please let me what I should add in the vq states,
and I can improve.
>    
> - dirty page tracking as described does not seem practical for
>    many systems.  increasing page size x8 is just being nasty
>    towards other network users. CAS + retry could be a solution,
>    but this needs to be documented thoroughly then and it appears this is not what author expects to implement
>    anyway - instead, there's an assumption that platform itself
>    will support dirty tracking. By itself, this is not
>    an impossible assumption - will possibly result in a cheaper,
>    slower device. why not have an option like this?
>    I would probably just drop it from this proposal completely.
>    Also, tracking memory on the device means we'll lose state
>    around reset. Solving that could be tricky. Finally,
>    dependence on PASID can not be removed apparently.
>    So maybe, people who want to track memory changes on the
>    device itself should just bite the bullet and use
>    admin vq in the PF.
>
>
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

