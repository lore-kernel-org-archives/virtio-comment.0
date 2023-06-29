Return-Path: <virtio-comment-return-6589-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4639EB64D7
	for <virtio-comment@archiver.kernel.org>; Thu, 29 Jun 2023 02:18:32 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 1C32E29FC3
	for <virtio-comment@archiver.kernel.org>; Thu, 29 Jun 2023 02:18:32 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 13F6E9865AA
	for <virtio-comment@archiver.kernel.org>; Thu, 29 Jun 2023 02:18:32 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 03018986588; Thu, 29 Jun 2023 02:18:32 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E37CD98658B;
	Thu, 29 Jun 2023 02:18:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="365468357"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; 
   d="scan'208";a="365468357"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="746863580"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; 
   d="scan'208";a="746863580"
Message-ID: <1bdd18c7-c4bd-8049-ee63-227fe25fb7a5@intel.com>
Date: Thu, 29 Jun 2023 10:18:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.12.0
Content-Language: en-US
To: Parav Pandit <parav@nvidia.com>
Cc: "virtio-comment@lists.oasis-open.org"
 <virtio-comment@lists.oasis-open.org>, Xuan Zhuo
 <xuanzhuo@linux.alibaba.com>,
 "virtio@lists.oasis-open.org" <virtio@lists.oasis-open.org>
References: <PH0PR12MB5481821452DA2A9572714BB9DC24A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <6b95e5ec-37e7-7150-9926-6bb02ee13cf3@intel.com>
 <PH0PR12MB54818AEB1A85069B42B97158DC24A@PH0PR12MB5481.namprd12.prod.outlook.com>
From: "Zhu, Lingshan" <lingshan.zhu@intel.com>
In-Reply-To: <PH0PR12MB54818AEB1A85069B42B97158DC24A@PH0PR12MB5481.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [virtio-comment] Re: virtio member device provisioning get/set
 and virtio child device life cycle mixing not needed



On 6/28/2023 9:10 PM, Parav Pandit wrote:
>
>> From: virtio-comment@lists.oasis-open.org <virtio-comment@lists.oasis-
>> open.org> On Behalf Of Zhu, Lingshan
>> Sent: Wednesday, June 28, 2023 3:31 AM
>>
>> On 6/28/2023 8:22 AM, Parav Pandit wrote:
>>> Hi Lingshan Zhu,
>>>
>>> I have reviewed v4 version transport VQ a while back that consist of two main
>> pieces.
>>> 1. some virtio device creation/destroy commands 2. virtio device
>>> feature and config space provisioning commands.
>>>
>>> Many of us are seeing the value of device provisioning commands
>> with/without live migration.
>>> New virtio devices do not need to follow any existing of config space etc per
>> say for real hw.
>>> There is some value in reusing software but it may not be the prime driving
>> factor for brand new devices.
>>> This needs more discussion and not as_is done in the v4.
>>>
>>> So, if you are planning to revise your transport vq patches as admin
>> commands, please split the series into two.
>>> a. device and config space provisioning SET/GET part.
>> Hi Parav
>>
>> I agree it is good to unify the interface for SRIOV and SIOV. However more
>> discussion is required, e.g., for a VF, will config its MSIX by admin vq(owned by
>> host) conflict with the MSIX cap.
>>
> No, it doesn't conflict.
> SR-PCIM interface is outside the scope of PCIe spec.
> I completed the work in PCI spec to clarify this already, its coming in the 6.1 errata spec.
>
> Non virtio device and Linux kernel both already has similar implementation in place and in use for more than a year.
> So msix provisioning via AQ is fine. VF can expose new MSIX capability post reconfiguration via AQ.
It is the guest to config MSIX of an assigned VF by writing to MSIX 
capability. However host owns the AQ,
means host can modify the MSIX config even when guest operational running.
A new synchronization mechanism? Trap accesses to MSIX cap? Ban access 
of MSIX through AQ after DRIVER_OK?
Do you have any detailed information about how to prevent the conflicts 
like this?
>
> We will be able to unify them across SRIOV and SIOV.
> SIOV anyway has to wait as its undergoing significant changes currently.


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

