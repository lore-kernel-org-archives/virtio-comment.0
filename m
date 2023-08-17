Return-Path: <virtio-comment-return-7186-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96920C2FC04
	for <virtio-comment@archiver.kernel.org>; Thu, 17 Aug 2023 05:13:49 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id EA3807EAE5
	for <virtio-comment@archiver.kernel.org>; Thu, 17 Aug 2023 05:13:48 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CFA2198640D
	for <virtio-comment@archiver.kernel.org>; Thu, 17 Aug 2023 05:13:48 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id BD6A5984043; Thu, 17 Aug 2023 05:13:48 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id ACFE09863F0;
	Thu, 17 Aug 2023 05:13:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R861e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046051;MF=hengqi@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0Vpyd772_1692249222;
Message-ID: <3b43db27-08cb-4fd6-b63b-a885b50044c6@linux.alibaba.com>
Date: Thu, 17 Aug 2023 13:13:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Parav Pandit <parav@nvidia.com>
Cc: Shahaf Shuler <shahafs@nvidia.com>,
 "virtio@lists.oasis-open.org" <virtio@lists.oasis-open.org>,
 "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
 "david.edmondson@oracle.com" <david.edmondson@oracle.com>,
 "xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>,
 "sburla@marvell.com" <sburla@marvell.com>
References: <20230815074600.473933-1-parav@nvidia.com>
 <20230815074600.473933-5-parav@nvidia.com>
 <6b48e787-7910-4714-b0a6-ea118c6a072f@linux.alibaba.com>
 <PH0PR12MB54815DBA73F066BFAE3824CBDC15A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <5ce972f4-1efd-400d-bc45-c03e9956f2ce@linux.alibaba.com>
 <PH0PR12MB5481D1A5BA1DD59AE4B6C58CDC1AA@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Heng Qi <hengqi@linux.alibaba.com>
In-Reply-To: <PH0PR12MB5481D1A5BA1DD59AE4B6C58CDC1AA@PH0PR12MB5481.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] Re: [PATCH requirements v4 4/7] net-features: Add notification
 coalescing requirements



在 2023/8/17 下午12:57, Parav Pandit 写道:
>
>> From: Heng Qi <hengqi@linux.alibaba.com>
>> Sent: Wednesday, August 16, 2023 6:07 PM
>>
>>
>> 在 2023/8/16 下午6:46, Parav Pandit 写道:
>>>> From: Heng Qi <hengqi@linux.alibaba.com>
>>>> Sent: Wednesday, August 16, 2023 2:01 PM
>>>>
>>>> 在 2023/8/15 下午3:45, Parav Pandit 写道:
>>>>> Add virtio net device notification coalescing improvements requirements.
>>>>>
>>>>> Signed-off-by: Parav Pandit <parav@nvidia.com>
>>>>> Acked-by: David Edmondson <david.edmondson@oracle.com>
>>>>>
>>>>> ---
>>>>> changelog:
>>>>> v3->v4:
>>>>> - no change
>>>>>
>>>>> v1->v2:
>>>>> - addressed comments from Stefan
>>>>> - redrafted the requirements to use rearm term and avoid queue enable
>>>>>      confusion
>>>>> v0->v1:
>>>>> - updated the description
>>>>> ---
>>>>>     net-workstream/features-1.4.md | 11 +++++++++++
>>>>>     1 file changed, 11 insertions(+)
>>>>>
>>>>> diff --git a/net-workstream/features-1.4.md
>>>>> b/net-workstream/features-1.4.md index 72d04bd..cb72442 100644
>>>>> --- a/net-workstream/features-1.4.md
>>>>> +++ b/net-workstream/features-1.4.md
>>>>> @@ -8,6 +8,7 @@ together is desired while updating the virtio net
>> interface.
>>>>>     # 2. Summary
>>>>>     1. Device counters visible to the driver
>>>>>     2. Low latency tx and rx virtqueues for PCI transport
>>>>> +3. Virtqueue notification coalescing re-arming support
>>>>>
>>>>>     # 3. Requirements
>>>>>     ## 3.1 Device counters
>>>>> @@ -172,3 +173,13 @@ struct vnet_rx_completion {
>>>>>        which can be recycled by the driver when the packets from the
>> completed
>>>>>        page is fully consumed.
>>>>>     8. The device should be able to consume multiple pages for a
>>>>> receive GSO
>>>> stream.
>>>>> +
>>>>> +## 3.3 Virtqueue notification coalescing re-arming support 0.
>>>>> +Design
>>>>> +goal:
>>>>> +   a. Avoid constant notifications from the device even in conditions when
>>>>> +      the driver may not have acted on the previous pending notification.
>>>>> +1. When Tx and Rx virtqueue notification coalescing is enabled, and
>>>>> +when
>>>> such
>>>>> +   a notification is reported by the device, the device stops sending further
>>>>> +   notifications until the driver rearms the notifications of the virtqueue.
>>>>> +2. When the driver rearms the notification of the virtqueue, the device
>>>>> +   to notify again if notification coalescing conditions are met.
>>>> I'm wondering how this relates to the existing notification
>>>> coalesing[1] and notification suppression[2]:
>>>>
>>>> [1]
>>>> The device sends a used buffer notification once the notification
>>>> conditions are met and if the notifications are not suppressed as
>>>> explained in \ref{sec:Basic Facilities of a Virtio Device /
>>>> Virtqueues / Used Buffer Notification Supppression}.
>>>>
>>>> [2]
>>>> If the VIRTIO_F_EVENT_IDX feature bit is not negotiated:
>>>> \begin{itemize}
>>>> \item The driver MUST ignore the \field{avail_event} value.
>>>> \item After the driver writes a descriptor index into the available ring:
>>>>       \begin{itemize}
>>>>             \item If \field{flags} is 1, the driver SHOULD NOT send a notification.
>>>>             \item If \field{flags} is 0, the driver MUST send a notification.
>>>>       \end{itemize}
>>>> \end{itemize}
>>>>
>>>> Otherwise, if the VIRTIO_F_EVENT_IDX feature bit is negotiated:
>>>> \begin{itemize}
>>>> \item The driver MUST ignore the lower bit of \field{flags}.
>>>> \item After the driver writes a descriptor index into the available ring:
>>>>       \begin{itemize}
>>>>             \item If the \field{idx} field in the available ring (which determined
>>>>               where that descriptor index was placed) was equal to
>>>>               \field{avail_event}, the driver MUST send a notification.
>>>>             \item Otherwise the driver SHOULD NOT send a notification.
>>>>       \end{itemize}
>>>> \end{itemize}
>>>>
>>>> Regarding notification suppression:
>>>> 1.When there is VIRTIO_NET_F_EVENT_IDX, even if the notification
>>>> coalesing condition is met, we need to wait for the used_event
>>>> notification condition to be met(the driver does not rearms the
>>>> notification of the virtqueue now and the avail ring  is set
>> VRING_AVAIL_F_NO_INTERRUPT in flag).
>>>> 2.When there is no VIRTIO_NET_F_EVENT_IDX, if the driver turns off
>>>> the notification, even if the notidication condition is met, the
>>>> device cannot send the notification.
>>>>
>>>> Therefore, if I'm not wrong, a device can issue a notification only
>>>> if the device is not suppressed from notifying the driver.
>>>> [1][2] seems to have met this condition.
>>> Notification suppression using _EVENT_IDX for non-memory transport is just
>> sub-optimal for two reasons.
>>> 1. It requires device to poll on the used event to learn about when to
>>> un-suppress. (arm) 2. this bit also controls driver notifications yet
>>> again demand device to arbitrarily poll on new descriptors posting
>>>
>>> Hence, an efficient scheme is needed and device notifications to be detached
>> from driver notification.
>>> And now that VQ level notification coalescing is in place, which suppresses
>> the device notifications, it is logical to combine it with VQ device notifications.
>> Let me summarize:
>> 1. When used idx notification is satisfied, but coalescing is not satisfied, the
>> driver continues to suppress device notifications.
> Ack.
>
>> 2. When used idx notification is not satisfied, even if coalescing is satisfied, the
>> device still cannot notify the driver.
> Ack.
>
>> I think that's what coalescing does, and the description below has satisfied this
>> behavior:
>> "The device sends a used buffer notification once the notification conditions
>> are met and if the notifications are not suppressed as explained in \ref{sec:Basic
>> Facilities of a Virtio Device / Virtqueues / Used Buffer Notification
>> Supppression}."
>>
> Ack.
> the proposal here is to not use EVENT_IDX scheme, instead driver to enable/disable notification coalescing in different way, even when notification coalescing parameters are configured.
> And this to be done in fairly fast way (not like a cvq) command. For example like driver notifications.
>   
>> Or we want to say that it has nothing to do with the used idx notification.
> When
>> the coalescing is satisfied and the driver rearms the notification of the
>> virtqueue, the device now send a notification.
>>
> Right.
> F_NOTIFION_ARM is mutually exclusive with F_EVENT_IDX.

OK, I think I get your point, F_NOTIFION_ARM is mutually exclusive
with VIRTQ_AVAIL_F_NO_INTERRUPT\used idx\VIRTIO_F_NOTIFY_ON_EMPT,
and it seems that F_NOTIFION_ARM has the highest priority, and it needs 
a new feature bit. Am I right :)?

Thanks!

> (Like packed vq is mutually exclusive with split q.)


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

