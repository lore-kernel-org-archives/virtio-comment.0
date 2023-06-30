Return-Path: <virtio-comment-return-6656-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0EABEB64DA
	for <virtio-comment@archiver.kernel.org>; Fri, 30 Jun 2023 10:33:24 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id E088F2AED4
	for <virtio-comment@archiver.kernel.org>; Fri, 30 Jun 2023 10:33:23 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 689E89866FD
	for <virtio-comment@archiver.kernel.org>; Fri, 30 Jun 2023 10:33:23 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 3C9DA9865E9; Fri, 30 Jun 2023 10:33:23 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 265B39866EC
	for <virtio-comment@lists.oasis-open.org>; Fri, 30 Jun 2023 10:33:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="341946724"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200"; 
   d="scan'208";a="341946724"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="830881910"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200"; 
   d="scan'208";a="830881910"
Message-ID: <259c7b04-58df-8085-755f-a36993556a89@intel.com>
Date: Fri, 30 Jun 2023 18:33:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.12.0
Content-Language: en-US
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Cc: virtio-comment@lists.oasis-open.org, "Michael S. Tsirkin" <mst@redhat.com>
References: <1687243466.51691-1-xuanzhuo@linux.alibaba.com>
 <e37fb447-fd22-4d42-f3e2-2ab6f1c8f3b4@intel.com>
 <1688104464.531018-1-xuanzhuo@linux.alibaba.com>
 <b95673d9-21e5-0fea-abdf-c0f8389e5cee@intel.com>
 <1688111214.8488657-2-xuanzhuo@linux.alibaba.com>
 <ac6bb15c-bb44-b1de-aef6-9974350962da@intel.com>
 <1688111784.0426908-3-xuanzhuo@linux.alibaba.com>
 <7ab5978d-c503-c279-a42e-bcdbf40184d4@intel.com>
 <1688116457.7400494-4-xuanzhuo@linux.alibaba.com>
From: "Zhu, Lingshan" <lingshan.zhu@intel.com>
In-Reply-To: <1688116457.7400494-4-xuanzhuo@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [virtio-comment] About the plan of Admin Queue



On 6/30/2023 5:14 PM, Xuan Zhuo wrote:
> On Fri, 30 Jun 2023 16:32:44 +0800, "Zhu, Lingshan" <lingshan.zhu@intel.com> wrote:
>>
>> On 6/30/2023 3:56 PM, Xuan Zhuo wrote:
>>> On Fri, 30 Jun 2023 15:54:40 +0800, "Zhu, Lingshan" <lingshan.zhu@intel.com> wrote:
>>>> On 6/30/2023 3:46 PM, Xuan Zhuo wrote:
>>>>> On Fri, 30 Jun 2023 14:19:47 +0800, "Zhu, Lingshan" <lingshan.zhu@intel.com> wrote:
>>>>>> On 6/30/2023 1:54 PM, Xuan Zhuo wrote:
>>>>>>> On Tue, 20 Jun 2023 16:11:12 +0800, "Zhu, Lingshan" <lingshan.zhu@intel.com> wrote:
>>>>>>>> On 6/20/2023 2:44 PM, Xuan Zhuo wrote:
>>>>>>>>> Hi,
>>>>>>>>>
>>>>>>>>> hi, I would want to know some plans and progress about admin queue.
>>>>>>>>>
>>>>>>>>> At the current spec, it seems that there is only one framework and no
>>>>>>>>> specific commands. I'd like to know if anyone is currently working on this and
>>>>>>>>> what the plans are.
>>>>>>>>>
>>>>>>>>> We also faced some similar issues, and we think admin queue is a good way to
>>>>>>>>> manage sr-iov.
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> Thanks.
>>>>>>>> I plan to rebase original transport vq on admin vq.
>>>>>>>>
>>>>>>>> https://lists.oasis-open.org/archives/virtio-comment/202208/msg00140.html
>>>>>>> I review the patch, that is for S-IOV, right?
>>>>>> Yes, for SIOV and other similar devices
>>>>>>> I think it is good.
>>>>>>>
>>>>>>> I would if all is configured by the transport vq/admin vq from the OS?
>>>>>> For SIOV ADIs, this transport vq is the transport layer, so they are
>>>>>> configured by the OS through transport vq.
>>>>>>> Can we create a managed dev from the backend?
>>>>>>>
>>>>>>> Such as, the DPU sends a command to the driver, then the driver creates a new
>>>>>>> managed dev.
>>>>>> I think the group owner, usually the PCI PF is the management device.
>>>>> I mean the DPU hot-plug a new device. Not the managament device create a new
>>>>> device.
>>>>>
>>>>> The managament device is in the OS, we want the device is plugged by the DPU.
>>>> The PCI management(SIOV group owner) device is on the DPU, when create
>>>> an ADI,
>>>> OS send a command to the DPU/PF through transport vq,
>>>> then the PF hot plugged in a new ADI through the transport vq
>>>> specific channel. Or did I misunderstand your question?
>>> Your first step is the os send a command. Right?
>>>
>>> Can we let the DPU notify the driver to create a new devicer from the backend?
>>>
>>> The key point is who want to create a new device.
>> DPU can come with a certain number of pre-created ADIs, just make sure the
>> orchestration SW is aware of their device IDs.
>>
>> If you want the DPU randomly create ADIs and notify the driver, I think
>> we need interrupt, e.g., re-use config interrupt. But why DPU
>> wants to create and hot plug in a device to a guest?
>> Shall the host handle that or DPU pre-create then expose to baremteal
>> machines?
>
> In your scenario, the supervisor is on the os, which controls the DPU to create
> new devices.
>
> In the cloud scenario, the vendor manager is in the DPU, and the entire
> host is for users. Of course, there are situations where the vendor manager are
> in the HOST. But for bare metal machines, the host belongs to the customer, the
> vendor manager is only in the DPU.
>
> So when the customers buy a new nic for the host, the vendor manager will plug a
> device to the host from the DPU.
I understand once a customer orders a new NIC, you wants to present the 
NIC to the host.
However you only owns the DPU and the customer owns the host, that means 
this creation
and hot plug must be transparent to the host and there may not be a host 
driver help
handling an interrupt/probe.

However this is not PCI which has a tree/switch and can enumerate 
devices to the
host by spanning the device across the PCI hierarchy.

To address an ADI, there is only a device_id.

So, do you mind share how your DPU offload the device model? What kind 
of device your DPU provide
to the host? Lets see whether DPU can mediate this by its own?

>
> Thanks.
>
>
>> Thanks
>>> Thanks.
>>>
>>>
>>>
>>>
>>>> Thanks
>>>>> Thanks.
>>>>>
>>>>>
>>>>>> Thanks
>>>>>>> Thanks.
>>>>>>>
>>>>>>>
>>>>>>>> Thanks,
>>>>>>>> Zhu Lingshan
>>>>>>>>> This publicly archived list offers a means to provide input to the
>>>>>>>>> OASIS Virtual I/O Device (VIRTIO) TC.
>>>>>>>>>
>>>>>>>>> In order to verify user consent to the Feedback License terms and
>>>>>>>>> to minimize spam in the list archive, subscription is required
>>>>>>>>> before posting.
>>>>>>>>>
>>>>>>>>> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
>>>>>>>>> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
>>>>>>>>> List help: virtio-comment-help@lists.oasis-open.org
>>>>>>>>> List archive: https://lists.oasis-open.org/archives/virtio-comment/
>>>>>>>>> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
>>>>>>>>> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
>>>>>>>>> Committee: https://www.oasis-open.org/committees/virtio/
>>>>>>>>> Join OASIS: https://www.oasis-open.org/join/
>>>>>>>>>
>>>>>>>> This publicly archived list offers a means to provide input to the
>>>>>>>> OASIS Virtual I/O Device (VIRTIO) TC.
>>>>>>>>
>>>>>>>> In order to verify user consent to the Feedback License terms and
>>>>>>>> to minimize spam in the list archive, subscription is required
>>>>>>>> before posting.
>>>>>>>>
>>>>>>>> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
>>>>>>>> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
>>>>>>>> List help: virtio-comment-help@lists.oasis-open.org
>>>>>>>> List archive: https://lists.oasis-open.org/archives/virtio-comment/
>>>>>>>> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
>>>>>>>> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
>>>>>>>> Committee: https://www.oasis-open.org/committees/virtio/
>>>>>>>> Join OASIS: https://www.oasis-open.org/join/
>>>>>>>>
>>>>>>> This publicly archived list offers a means to provide input to the
>>>>>>> OASIS Virtual I/O Device (VIRTIO) TC.
>>>>>>>
>>>>>>> In order to verify user consent to the Feedback License terms and
>>>>>>> to minimize spam in the list archive, subscription is required
>>>>>>> before posting.
>>>>>>>
>>>>>>> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
>>>>>>> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
>>>>>>> List help: virtio-comment-help@lists.oasis-open.org
>>>>>>> List archive: https://lists.oasis-open.org/archives/virtio-comment/
>>>>>>> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
>>>>>>> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
>>>>>>> Committee: https://www.oasis-open.org/committees/virtio/
>>>>>>> Join OASIS: https://www.oasis-open.org/join/
>>>>>>>


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

