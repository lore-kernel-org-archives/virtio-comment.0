Return-Path: <virtio-comment-return-7660-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6EC7CD6E54
	for <virtio-comment@archiver.kernel.org>; Wed, 11 Oct 2023 10:25:32 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 5C9E5774E9
	for <virtio-comment@archiver.kernel.org>; Wed, 11 Oct 2023 10:25:32 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3889F98660D
	for <virtio-comment@archiver.kernel.org>; Wed, 11 Oct 2023 10:25:32 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 24796986602; Wed, 11 Oct 2023 10:25:32 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 14DE2986603
	for <virtio-comment@lists.oasis-open.org>; Wed, 11 Oct 2023 10:25:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="383490561"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
   d="scan'208";a="383490561"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="757511137"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
   d="scan'208";a="757511137"
Message-ID: <f875fa3b-4b33-71c2-e612-bc2a674a1e59@intel.com>
Date: Wed, 11 Oct 2023 18:25:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.15.1
Content-Language: en-US
To: Parav Pandit <parav@nvidia.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>,
 "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
 <shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 Yishai Hadas <yishaih@nvidia.com>
References: <20231008112555.473895-1-parav@nvidia.com>
 <20231008112555.473895-2-parav@nvidia.com>
 <CACGkMEt0PNFUoVEYDtgziE5scYqauADX6PF-_f0NSCcWB_FrCA@mail.gmail.com>
 <DM8PR12MB54801E873241AA02CC32CDCBDCCEA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <20231009121638-mutt-send-email-mst@kernel.org>
 <DM8PR12MB5480E0F15A1BBDD745EE3AF4DCCEA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <25375529-9c40-9ea9-692e-f557c514c72f@intel.com>
 <PH0PR12MB54812E59B581546FFB118F3FDCCDA@PH0PR12MB5481.namprd12.prod.outlook.com>
From: "Zhu, Lingshan" <lingshan.zhu@intel.com>
In-Reply-To: <PH0PR12MB54812E59B581546FFB118F3FDCCDA@PH0PR12MB5481.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration



On 10/10/2023 5:40 PM, Parav Pandit wrote:
> Hi Lingshan,
>
>> From: Zhu, Lingshan <lingshan.zhu@intel.com>
>> Sent: Tuesday, October 10, 2023 2:28 PM
>>
>> On 10/10/2023 1:21 AM, Parav Pandit wrote:
>>>> From: Michael S. Tsirkin <mst@redhat.com>
>>>> Sent: Monday, October 9, 2023 9:50 PM
>>>>>>> One or more passthrough PCI VF devices are ubiquitous for virtual
>>>>>>> machines usage using generic kernel framework such as vfio [1].
>>>>>> Mentioning a specific subsystem in a specific OS may mislead the
>>>>>> user to think it can only work in that setup. Let's not do that,
>>>>>> virtio is not only used for Linux and VFIO.
>>>>> This is just one example on how these commands are useful.
>>>>> It can be useful in more ways too in more OSes too.
>>>>> I will drop from the patch commit log and keep as information
>>>>> purpose in
>>>> cover letter.
>>>>> Would that work for you?
>>>>>
>>>>> I don’t have any strong opinion to keep it or remove it as most
>>>>> stakeholders
>>>> has the clear view of requirements now.
>>>>> Let me know.
>>>> So some people use VFs with VFIO. Hence the module name.  This
>>>> sentence by itself seems to have zero value for the spec. Just drop it.
>>> Ok. Will drop.
>> So why not build your admin vq live migration on our config space solution, get
>> out of the troubles, to make your life easier?
>>
> Your this question is completely unrelated to this reply or you misunderstood what dropping commit log means.
if you can rebase admin vq LM on our basic facilities, I think you dont 
need to talk about vfio in the first place,
so I ask you to re-consider Jason's proposal.
>
> Dropping link to vfio does not drop the requirement.
> I am ok to drop because requirements are clear of passthrough of member device.
> Vfio is not a trouble at all.
> Admin command is not a trouble either.
>
> The pure technical reason is: all the functionalities proposed cannot be done in any other existing way.
> Why? For below reasons.
> 1. device context, and write records (aka dirty page addresses) is huge which cannot be shared using config registers at scale of 4000 member devices
dirty page tracking will be implmemented in V2, actually I have the 
patch right now.
inflight descriptor tracking will be implemented by Eugenio in V2.
There are no scale problem as I repeated for many time, they are 
per-device basic facilities, just migrate the VF by its own facility,
so there are no 40000 member devices, this is not per PF.

The device context can be read from config space or trapped, like shadow 
control vq which is already done, that is basic virtualization.
If you want to migrate device context, you need to specify device 
context for every type of device, net maybe easy, how do you see virtio-fs?
And we are migrating stateless devices, or no? How do you migrate 
virtio-fs?
> 2. sharing such large context and write addresses in parallel for multiple devices cannot be done using single register file
see above
> 3. These registers cannot be residing in the VF because VF can undergo FLR, and device reset which must clear these registers

do you mean you want to audit all PCI features? When FLR, the device is rested, do you expect a device remember anything after FLR?
Do you want to trap FLR? Why?

Why FLR block or conflict with live migration?

> 4. When VF does the DMA, all dma occurs in the guest address space, not in hypervisor space; any flr and device reset must stop such dma.
> And device reset and flr are controlled by the guest (not mediated by hypervisor).
if the guest reset the device, it is totally reasonable operation, and 
the guest own the risk, right?
and still, do you want to audit every PCI features? at least you didn't 
do that in your series.
For migration, you know the hypervisor takes the ownership of the device 
in the stop_window.
> 5. Any PASID to separate out admin vq on the VF does not work for two reasons.
> R_1: device flr and device reset must stop all the dmas.
> R_2: PASID by most leading vendors is still not mature enough
> R_3: One also needs to do inversion to not expose PASID capability of the member PCI device to not expose
see above and what if guest shutdown? the same answer, right?
>
>> Actually you don't see any technical problems in our config space proposal,
>> right?
> In config registers method, for passthrough I clearly see the technical problems (functional and scale) listed above.
> Due to which config registers cannot reside on the VF and cannot scale either.
so see above answers.


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

