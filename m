Return-Path: <virtio-comment-return-8229-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6895C4167D
	for <virtio-comment@archiver.kernel.org>; Tue,  7 Nov 2023 09:24:52 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id E29A42B07C
	for <virtio-comment@archiver.kernel.org>; Tue,  7 Nov 2023 09:24:51 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C63BC986A81
	for <virtio-comment@archiver.kernel.org>; Tue,  7 Nov 2023 09:24:51 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id B0C829867F1; Tue,  7 Nov 2023 09:24:51 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A0FF59867F9
	for <virtio-comment@lists.oasis-open.org>; Tue,  7 Nov 2023 09:24:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="392342139"
X-IronPort-AV: E=Sophos;i="6.03,283,1694761200"; 
   d="scan'208";a="392342139"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="712505704"
X-IronPort-AV: E=Sophos;i="6.03,283,1694761200"; 
   d="scan'208";a="712505704"
Message-ID: <8d241a64-d64f-4141-8e48-fcba3a6ff3eb@intel.com>
Date: Tue, 7 Nov 2023 17:24:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>, "jasowang@redhat.com"
 <jasowang@redhat.com>, "eperezma@redhat.com" <eperezma@redhat.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
References: <20231103103437.72784-1-lingshan.zhu@intel.com>
 <20231103103437.72784-3-lingshan.zhu@intel.com>
 <PH0PR12MB54814E8B9E7D16C9EF421C82DCA5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <78f206cd-1e07-4c20-a281-1ddf74cf4d84@intel.com>
 <PH0PR12MB5481F05E5A952E9A43B96F73DCA5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <8eb1a4c5-eb7d-4f8d-8afd-4aab5559a8d6@intel.com>
 <PH0PR12MB5481CD22F4AFF3DFA7F53B91DCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <850caea9-f7dc-4dee-ae00-936766287ba3@intel.com>
 <PH0PR12MB54810A60FD26411387DBC7D9DCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <5c659db2-9263-4f9c-b1ac-073de5c01446@intel.com>
 <20231107032314-mutt-send-email-mst@kernel.org>
From: "Zhu, Lingshan" <lingshan.zhu@intel.com>
In-Reply-To: <20231107032314-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [virtio-comment] RE: [PATCH V2 2/6] virtio: introduce SUSPEND bit
 in device status



On 11/7/2023 4:33 PM, Michael S. Tsirkin wrote:
> On Tue, Nov 07, 2023 at 04:21:13PM +0800, Zhu, Lingshan wrote:
>>>> This can work, right?
>>> Unfortunately no, as non atomic bitmap cannot reside in the host memory,
>> as explained before, PCI and CPU supports atomic read/write. Please refer to
>> PCI spec and CPU ISA.
> I don't see how atomic read or write does anything useful here but maybe.
Because the device writs the bitmap and the driver "read and clear"
the bitmap, so the ops need to be atomic, or they can run into race.
> You need to explain how you are using atomics in your proposal then.
Not sure we should talk about much of how atomic works, as explained above
the operations should be atomic to avoid race conditions or losing 
information.
Like:

1) Device Read
2) Device Write
3) Device Clear

Here we lost the bitmap information.
>
>
>>> And whatever is in the device gets reset on device reset and/or FLR. So the dirty map detail is lost.
>>> Similarly the device context is also lost on these two events triggered by guest.
>> we explained before, when reset, the device should clear everything.
> then migration will corrupt memory. Not great.
I think when reset, the device should clear everything, therefore the driver
should clear the legacy data as well, don't know how corrupt
>
>
>
>>>>>> As you can see, the dirty page tracking facility has a PASID for
>>>>>> isolation. But still, the question is, we should better use platform
>>>>>> dirty page tracking
>>>>>>
>>>>> Nothing to do with PASID, as PASID is owned by the guest.
>>>> It looks you don't know how PASID work.
>>>> Host can setup PASID to isolate some facilities, right?
>>> There are few limitations with PASID.
>>> a. All platforms do not have PASID and
>> As we have explained for many times, this is a basic facility,
>> and the implementation is transport-specific.
>>
>> We given an example of PCI implementation, and PCI support PASID, right?
> Yes it's a limitation but maybe one we can live with
> for this feature.  It does mean that we might need solutions
> for systems without this support. virtio use is not limited
> to servers or high end systems.
PASID has been introduced years ago and I know some vendors implemented
onboard IOMMU can also do isolating.

And this is a basic facility, the implementation is transport specific.
>
>
>>> b. I explained above PASID do not work always as PASID only bifurcates DMA not the device _functionality_.
>> With a PASID, a cap can be considered to be placed in another logical
>> address space, which is not accessible to the guest.
>>> c. PASID to be available to guest as_is what is present on the device
>> host hypervisor sets the PASID, transparent to the guest.
> Lingshan whenever people ask you a ton of questions in response to
> your spec proposal then respose should not be to simply
> answer on the mailing list and then repost without a lot of changes
> since spec readers will likely have questions exactly like these
> and we can not make them go and read this flame war.
Well, I should say, I have repeated the same answers for too many times.
> And frankly, most of this TC stopped following this thread a while ago,
> it seems to be going nowhere.
I still believe we should release the best quality
of spec as we can.
> The response should be to add the explanation in the spec.
> Look at Parav's live migration proposals with "theory of operation" chapters
> for an example of how this can be done.
I am not sure we should talk how PCI work in virtio spec.
But I can add "pasid for isolation"

These facilities are not only used for live migration,
can also work for debugging. Like suspend then read vq state.

I can add more explanation in the cover letter
>
>>>>>> Then suspend the device after guest freeze, to stabilize the device
>>>>>> status, then read the status.
>>>>>>
>>>>>> How can you say this does not work???
>>>>> I explained above.
>>>> see above
>
> This publicly archived list offers a means to provide input to the
> OASIS Virtual I/O Device (VIRTIO) TC.
>
> In order to verify user consent to the Feedback License terms and
> to minimize spam in the list archive, subscription is required
> before posting.
>
> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> List help: virtio-comment-help@lists.oasis-open.org
> List archive: https://lists.oasis-open.org/archives/virtio-comment/
> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
> Committee: https://www.oasis-open.org/committees/virtio/
> Join OASIS: https://www.oasis-open.org/join/
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

