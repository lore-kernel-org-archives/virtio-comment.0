Return-Path: <virtio-comment-return-6681-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AB4AEB64DD
	for <virtio-comment@archiver.kernel.org>; Mon,  3 Jul 2023 08:01:44 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 610F56008D
	for <virtio-comment@archiver.kernel.org>; Mon,  3 Jul 2023 08:01:43 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3FBCD98655E
	for <virtio-comment@archiver.kernel.org>; Mon,  3 Jul 2023 08:01:43 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 2822998644B; Mon,  3 Jul 2023 08:01:43 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 13B6F98644C
	for <virtio-comment@lists.oasis-open.org>; Mon,  3 Jul 2023 08:01:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-IronPort-AV: E=McAfee;i="6600,9927,10759"; a="347605193"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; 
   d="scan'208";a="347605193"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10759"; a="831725291"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; 
   d="scan'208";a="831725291"
Message-ID: <08ead575-d3d3-0c3f-9cec-8a604bdb5014@intel.com>
Date: Mon, 3 Jul 2023 16:01:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.12.0
Content-Language: en-US
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Cc: "virtio-comment@lists.oasis-open.org"
 <virtio-comment@lists.oasis-open.org>, "Michael S. Tsirkin"
 <mst@redhat.com>, Parav Pandit <parav@nvidia.com>
References: <1687243466.51691-1-xuanzhuo@linux.alibaba.com>
 <e37fb447-fd22-4d42-f3e2-2ab6f1c8f3b4@intel.com>
 <1688104464.531018-1-xuanzhuo@linux.alibaba.com>
 <b95673d9-21e5-0fea-abdf-c0f8389e5cee@intel.com>
 <1688111214.8488657-2-xuanzhuo@linux.alibaba.com>
 <ac6bb15c-bb44-b1de-aef6-9974350962da@intel.com>
 <1688111784.0426908-3-xuanzhuo@linux.alibaba.com>
 <7ab5978d-c503-c279-a42e-bcdbf40184d4@intel.com>
 <1688116457.7400494-4-xuanzhuo@linux.alibaba.com>
 <259c7b04-58df-8085-755f-a36993556a89@intel.com>
 <PH0PR12MB5481243B22A694E42C351C20DC2AA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <2e176f24-293b-5be0-2928-e8ce0300e75a@intel.com>
 <1688363658.0517473-7-xuanzhuo@linux.alibaba.com>
From: "Zhu, Lingshan" <lingshan.zhu@intel.com>
In-Reply-To: <1688363658.0517473-7-xuanzhuo@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [virtio-comment] About the plan of Admin Queue



On 7/3/2023 1:54 PM, Xuan Zhuo wrote:
> On Mon, 3 Jul 2023 12:29:32 +0800, "Zhu, Lingshan" <lingshan.zhu@intel.com> wrote:
>>
>> On 6/30/2023 7:35 PM, Parav Pandit wrote:
>>>> From: virtio-comment@lists.oasis-open.org <virtio-comment@lists.oasis-
>>>> open.org> On Behalf Of Zhu, Lingshan
>>>> Sent: Friday, June 30, 2023 6:33 AM
>>>>
>>>>>>> Can we let the DPU notify the driver to create a new devicer from the
>>>> backend?
>>> Yes, why not.
>>>
>>>>>>> The key point is who want to create a new device.
>>>>>> DPU can come with a certain number of pre-created ADIs, just make
>>>>>> sure the orchestration SW is aware of their device IDs.
>>>>>>
>>> Cloud often need these devices to be created dynamically, many a time after the host OS is booted.
>>> To be more generic, those devices to be created and connected to the host regardless of the life cycle of the host.
>>> Xuan partly explained it.
>>>
>>>>>> If you want the DPU randomly create ADIs and notify the driver, I
>>>>>> think we need interrupt, e.g., re-use config interrupt. But why DPU
>>>>>> wants to create and hot plug in a device to a guest?
>>>>>> Shall the host handle that or DPU pre-create then expose to baremteal
>>>>>> machines?
>>>>> In your scenario, the supervisor is on the os, which controls the DPU
>>>>> to create new devices.
>>>>>
>>>>> In the cloud scenario, the vendor manager is in the DPU, and the
>>>>> entire host is for users. Of course, there are situations where the
>>>>> vendor manager are in the HOST. But for bare metal machines, the host
>>>>> belongs to the customer, the vendor manager is only in the DPU.
>>>>>
>>>>> So when the customers buy a new nic for the host, the vendor manager
>>>>> will plug a device to the host from the DPU.
>>>> I understand once a customer orders a new NIC, you wants to present the NIC
>>>> to the host.
>>>> However you only owns the DPU and the customer owns the host, that means
>>>> this creation and hot plug must be transparent to the host and there may not be
>>>> a host driver help handling an interrupt/probe.
>>>>
>>> That is ok. when driver is loaded, it would query about its child devices and probe it, if we strictly want to follow SIOV model.
>>>
>>>> However this is not PCI which has a tree/switch and can enumerate devices to
>>>> the host by spanning the device across the PCI hierarchy.
>>>>
>>> Those enumeration is triggered by the parent PCI device and pci bridge and switch will also discover it.
>>>
>>>> To address an ADI, there is only a device_id.
>>>>
>>> SIOV device must have a unique identifier at PCI bus level for sure.
>>> I cannot speak more about it in this forum due to other logistics issue.
>>> But assume that there is PCI level unique identifier for SIOV device that switches on the path will learn about.
>>>
>>>> So, do you mind share how your DPU offload the device model? What kind of
>>>> device your DPU provide to the host? Lets see whether DPU can mediate this by
>>>> its own?
>>>>
>>> It is a virtio nic, blk and other virtio devices for us.
>>> A DPU hotplugs a device, host side either gets interrupt or later gets to know about it when explicitly queries.
>>> There is no mediation per say here, it is just a dpu based SIOV device like a regular PF.
>>>
>>> For non virtio DPU device, I implemented them in Linux for dpus 2 years ago.
>>> You might find a Linux reference model useful at [1].
>>> A usage model already exists in one OS and in use for non virtio devices.
>>> This certainly works without SIOV unique PCI device identifiers, because DPU (non-host) managed SIOV device spec still does not exist.
>>>
>>> For virtio, I think we should wait for this piece to be defined and leverage that, instead of virtio tc creating its own.
>>>
>>> [1] https://github.com/Mellanox/scalablefunctions/wiki
>> well I see SF facing the similar challenge, I can add a command for the
>> driver to query all existing SIOV ADIs of a device,
>> and the device return ADIs id and status. Looks good? and work for you
>> @Xuan?
> Can the device notifies the driver by a interrupt?
Of course this can be an option as previously discussed.
That would be a config interrupt(with proper suppression) from the 
management device,
which requires a new cap in a bar, then you still need to fetch the 
information.

A proposal:

a new cap, at least contains:
total number of the ADIs.

Then once any ADIs are created or removed, the PF driver get a notification.

Works for you?
>
> Thanks.
>
>
>> Thanks
>>
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

