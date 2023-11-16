Return-Path: <virtio-comment-return-8398-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69106C47071
	for <virtio-comment@archiver.kernel.org>; Thu, 16 Nov 2023 09:38:44 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 99D66749EB
	for <virtio-comment@archiver.kernel.org>; Thu, 16 Nov 2023 09:38:43 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7346B986DE3
	for <virtio-comment@archiver.kernel.org>; Thu, 16 Nov 2023 09:38:43 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 56FB4986DD8; Thu, 16 Nov 2023 09:38:43 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 46A54986DD9
	for <virtio-comment@lists.oasis-open.org>; Thu, 16 Nov 2023 09:38:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="381449943"
X-IronPort-AV: E=Sophos;i="6.03,307,1694761200"; 
   d="scan'208";a="381449943"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,307,1694761200"; 
   d="scan'208";a="6675748"
Message-ID: <e21e91be-4696-4f67-94bd-e1663c85bdb7@intel.com>
Date: Thu, 16 Nov 2023 17:38:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>, Parav Pandit <parav@nvidia.com>,
 "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
 <shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 Yishai Hadas <yishaih@nvidia.com>
References: <20231109022647-mutt-send-email-mst@kernel.org>
 <CACGkMEuSpZ0Y8kxXv26b38pvX--OCdvWm5KvMniqo=W10ruBTA@mail.gmail.com>
 <20231113013016-mutt-send-email-mst@kernel.org>
 <9952859f-1b72-46bf-b386-7c3f5c69269f@intel.com>
 <20231114032553-mutt-send-email-mst@kernel.org>
 <b9b8a564-b2eb-4c1c-9ada-975f3833e282@intel.com>
 <20231115025002-mutt-send-email-mst@kernel.org>
 <5c1c6815-f144-4d81-bef7-59a7608936c6@intel.com>
 <20231115030025-mutt-send-email-mst@kernel.org>
 <ba5a3fe9-4c2c-4d59-ae99-fdf6ce29927e@intel.com>
 <20231115063832-mutt-send-email-mst@kernel.org>
From: "Zhu, Lingshan" <lingshan.zhu@intel.com>
In-Reply-To: <20231115063832-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [virtio-comment] Re: [PATCH v3 6/8] admin: Add theory of
 operation for write recording commands



On 11/15/2023 7:52 PM, Michael S. Tsirkin wrote:
> On Wed, Nov 15, 2023 at 04:42:56PM +0800, Zhu, Lingshan wrote:
>>
>> On 11/15/2023 4:05 PM, Michael S. Tsirkin wrote:
>>> On Wed, Nov 15, 2023 at 03:59:16PM +0800, Zhu, Lingshan wrote:
>>>> On 11/15/2023 3:51 PM, Michael S. Tsirkin wrote:
>>>>> On Wed, Nov 15, 2023 at 12:05:59PM +0800, Zhu, Lingshan wrote:
>>>>>> On 11/14/2023 4:27 PM, Michael S. Tsirkin wrote:
>>>>>>> On Tue, Nov 14, 2023 at 03:34:32PM +0800, Zhu, Lingshan wrote:
>>>>>>>>>> So I can't
>>>>>>>>>> believe it has good performance overall. Logging via IOMMU or using
>>>>>>>>>> shadow virtqueue doesn't need any extra PCI transactions at least.
>>>>>>>>> On the other hand they have an extra CPU cost.  Personally if this is
>>>>>>>>> coming from a hardware vendor, I am inclined to trust them wrt PCI
>>>>>>>>> transactions.  But anyway, discussing this at a high level theoretically
>>>>>>>>> is pointless - whoever bothers with actual prototyping for performance
>>>>>>>>> testing wins, if no one does I'd expect a back of a napkin estimate
>>>>>>>>> to be included.
>>>>>>>> if so, Intel has released productions implementing these interfaces years
>>>>>>>> ago,
>>>>>>>> see live migration in 4.1. IFCVF vDPA Implementation,
>>>>>>>> https://doc.dpdk.org/guides-21.11/vdpadevs/ifc.html
>>>>>>>> and
>>>>>>> That one is based on shadow queue, right? Which I think this shows
>>>>>>> is worth supporting.
>>>>>> Yes, it is shadow virtqueue, I assume this is already mostly done,
>>>>>> do you see any gaps we need to address in our series that we should work on?
>>>>>>
>>>>>> Thanks
>>>>> There were a ton of comments posted on your series.
>>>> Hope I didn't miss anything. I see your latest comments are about vq states,
>>>> as replied before, I think we can record the states by two le16 and the
>>>> in-flight
>>>> descriptor tracking facility.
>>> I don't know why you need the le16. in-flight tracking should be enough.
>>> And given it needs DMA I would try really hard to actually use
>>> admin commands for this.
>> we need to record the on-device avail_idx and used_idx, or
>> how can the destination side know the device internal values.
> Again you never documented what state the device is in so I can't really
> say for sure.  But generally whenever a buffer is used the internal
> values are written out to memory.
This is the state of a virtqueue, in my series I have defined what is
vq state in [PATCH V2 1/6] virtio: introduce virtqueue state,
and give an example of PCI implementation.

In short, for split vq it is last_avail_idx and in-flight descriptors.

I humbly request an explicit list of missing gaps, so that I can improve 
my V3

Thanks
>
>>>> For this shadow virtqueue, do you think I should address this in my V4?
>>>> Like saying: acknowledged control commands through the control virtqueue
>>>> should be recorded, and we want to use shadow virtqueue to track dirty
>>>> pages.
>>> What you need to do is actually describe what do you expect the device
>>> to do when it enters this suspend state. since you mention control
>>> virtqueue then it seems that there needs to be a device type
>>> specific text explaining the behaviour. If so this implies there
>>> needs to be a list of device types that support suspend
>>> until someone looks at each type and documents what it does.
>> On a second thought, shadow vqs are hypervisor behaviors, maybe should not
>> be
>> described in this device spec.
>>
>> Since SUSPEND is in device status, so for now I see every type of device
>> implements
>> device_status should support SUSPEND. This should be a general facility.
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

