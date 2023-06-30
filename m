Return-Path: <virtio-comment-return-6645-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E30FCEB64D7
	for <virtio-comment@archiver.kernel.org>; Fri, 30 Jun 2023 07:54:49 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 0634D2ACF8
	for <virtio-comment@archiver.kernel.org>; Fri, 30 Jun 2023 07:54:49 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DE7F39866F0
	for <virtio-comment@archiver.kernel.org>; Fri, 30 Jun 2023 07:54:48 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id CB91B9866E7; Fri, 30 Jun 2023 07:54:48 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B81DE9866EA
	for <virtio-comment@lists.oasis-open.org>; Fri, 30 Jun 2023 07:54:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="428381318"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200"; 
   d="scan'208";a="428381318"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="782998282"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200"; 
   d="scan'208";a="782998282"
Message-ID: <ac6bb15c-bb44-b1de-aef6-9974350962da@intel.com>
Date: Fri, 30 Jun 2023 15:54:40 +0800
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
From: "Zhu, Lingshan" <lingshan.zhu@intel.com>
In-Reply-To: <1688111214.8488657-2-xuanzhuo@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [virtio-comment] About the plan of Admin Queue



On 6/30/2023 3:46 PM, Xuan Zhuo wrote:
> On Fri, 30 Jun 2023 14:19:47 +0800, "Zhu, Lingshan" <lingshan.zhu@intel.com> wrote:
>>
>> On 6/30/2023 1:54 PM, Xuan Zhuo wrote:
>>> On Tue, 20 Jun 2023 16:11:12 +0800, "Zhu, Lingshan" <lingshan.zhu@intel.com> wrote:
>>>> On 6/20/2023 2:44 PM, Xuan Zhuo wrote:
>>>>> Hi,
>>>>>
>>>>> hi, I would want to know some plans and progress about admin queue.
>>>>>
>>>>> At the current spec, it seems that there is only one framework and no
>>>>> specific commands. I'd like to know if anyone is currently working on this and
>>>>> what the plans are.
>>>>>
>>>>> We also faced some similar issues, and we think admin queue is a good way to
>>>>> manage sr-iov.
>>>>>
>>>>>
>>>>> Thanks.
>>>> I plan to rebase original transport vq on admin vq.
>>>>
>>>> https://lists.oasis-open.org/archives/virtio-comment/202208/msg00140.html
>>> I review the patch, that is for S-IOV, right?
>> Yes, for SIOV and other similar devices
>>> I think it is good.
>>>
>>> I would if all is configured by the transport vq/admin vq from the OS?
>> For SIOV ADIs, this transport vq is the transport layer, so they are
>> configured by the OS through transport vq.
>>> Can we create a managed dev from the backend?
>>>
>>> Such as, the DPU sends a command to the driver, then the driver creates a new
>>> managed dev.
>> I think the group owner, usually the PCI PF is the management device.
>
> I mean the DPU hot-plug a new device. Not the managament device create a new
> device.
>
> The managament device is in the OS, we want the device is plugged by the DPU.
The PCI management(SIOV group owner) device is on the DPU, when create 
an ADI,
OS send a command to the DPU/PF through transport vq,
then the PF hot plugged in a new ADI through the transport vq
specific channel. Or did I misunderstand your question?

Thanks
>
> Thanks.
>
>
>> Thanks
>>> Thanks.
>>>
>>>
>>>> Thanks,
>>>> Zhu Lingshan
>>>>>
>>>>>
>>>>> This publicly archived list offers a means to provide input to the
>>>>> OASIS Virtual I/O Device (VIRTIO) TC.
>>>>>
>>>>> In order to verify user consent to the Feedback License terms and
>>>>> to minimize spam in the list archive, subscription is required
>>>>> before posting.
>>>>>
>>>>> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
>>>>> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
>>>>> List help: virtio-comment-help@lists.oasis-open.org
>>>>> List archive: https://lists.oasis-open.org/archives/virtio-comment/
>>>>> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
>>>>> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
>>>>> Committee: https://www.oasis-open.org/committees/virtio/
>>>>> Join OASIS: https://www.oasis-open.org/join/
>>>>>
>>>> This publicly archived list offers a means to provide input to the
>>>> OASIS Virtual I/O Device (VIRTIO) TC.
>>>>
>>>> In order to verify user consent to the Feedback License terms and
>>>> to minimize spam in the list archive, subscription is required
>>>> before posting.
>>>>
>>>> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
>>>> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
>>>> List help: virtio-comment-help@lists.oasis-open.org
>>>> List archive: https://lists.oasis-open.org/archives/virtio-comment/
>>>> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
>>>> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
>>>> Committee: https://www.oasis-open.org/committees/virtio/
>>>> Join OASIS: https://www.oasis-open.org/join/
>>>>
>>> This publicly archived list offers a means to provide input to the
>>> OASIS Virtual I/O Device (VIRTIO) TC.
>>>
>>> In order to verify user consent to the Feedback License terms and
>>> to minimize spam in the list archive, subscription is required
>>> before posting.
>>>
>>> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
>>> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
>>> List help: virtio-comment-help@lists.oasis-open.org
>>> List archive: https://lists.oasis-open.org/archives/virtio-comment/
>>> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
>>> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
>>> Committee: https://www.oasis-open.org/committees/virtio/
>>> Join OASIS: https://www.oasis-open.org/join/
>>>


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

