Return-Path: <virtio-comment-return-6599-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB51BEB64DC
	for <virtio-comment@archiver.kernel.org>; Thu, 29 Jun 2023 06:35:46 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 11C5E7C6A9
	for <virtio-comment@archiver.kernel.org>; Thu, 29 Jun 2023 06:35:46 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 000629865CF
	for <virtio-comment@archiver.kernel.org>; Thu, 29 Jun 2023 06:35:45 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id E14F39841AB; Thu, 29 Jun 2023 06:35:45 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CD750986590;
	Thu, 29 Jun 2023 06:35:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="364583624"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; 
   d="scan'208";a="364583624"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="694519209"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; 
   d="scan'208";a="694519209"
Message-ID: <e1b005d1-6ab6-6f9b-cea0-2b548b9f01de@intel.com>
Date: Thu, 29 Jun 2023 14:35:39 +0800
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
 <1bdd18c7-c4bd-8049-ee63-227fe25fb7a5@intel.com>
 <PH0PR12MB5481F5D8B77067A8CDCB5A9FDC25A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <f558c9f4-ca06-ba68-67f6-49f649097b05@intel.com>
 <PH0PR12MB5481532D87D5606D90938B39DC25A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <21362b40-9d40-8c56-30e1-1bc166d622be@intel.com>
 <PH0PR12MB5481D899B11168F30AACB572DC25A@PH0PR12MB5481.namprd12.prod.outlook.com>
From: "Zhu, Lingshan" <lingshan.zhu@intel.com>
In-Reply-To: <PH0PR12MB5481D899B11168F30AACB572DC25A@PH0PR12MB5481.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] Re: virtio member device provisioning get/set
 and virtio child device life cycle mixing not needed



On 6/29/2023 12:11 PM, Parav Pandit wrote:
>> From: Zhu, Lingshan <lingshan.zhu@intel.com>
>> Sent: Thursday, June 29, 2023 12:02 AM
>>
>> On 6/29/2023 10:47 AM, Parav Pandit wrote:
>>>> From: Zhu, Lingshan <lingshan.zhu@intel.com>
>>>> Sent: Wednesday, June 28, 2023 10:39 PM
>>>>
>>>>
>>>> On 6/29/2023 10:23 AM, Parav Pandit wrote:
>>>>>> From: Zhu, Lingshan <lingshan.zhu@intel.com>
>>>>>> Sent: Wednesday, June 28, 2023 10:18 PM
>>>>>>> So msix provisioning via AQ is fine. VF can expose new MSIX
>>>>>>> capability post
>>>>>> reconfiguration via AQ.
>>>>>> It is the guest to config MSIX of an assigned VF by writing to MSIX
>> capability.
>>>>>> However host owns the AQ, means host can modify the MSIX config
>>>>>> even when guest operational running.
>>>>> Host can do many things not just MSIX config.
>>>>> Host is not supposed modify the config.
>>>>>
>>>>> In some OS MSI-X actual values are not even written by the guest...
>>>> yest, current host stack is not perfect.
>>>> So lets resolve these issues first rather than introduce new attack surface.
>>>>>> A new synchronization mechanism? Trap accesses to MSIX cap? Ban
>>>>>> access of MSIX through AQ after DRIVER_OK?
>>>>>> Do you have any detailed information about how to prevent the
>>>>>> conflicts like this?
>>>>> A hypervisor is a trusted entity to not mess with the VF.
>>>>> A hypervisor can go to an extreme to even do PCI FLR while guest is
>> running..
>>>>> So no need to go to the extreme.
>>>>>
>>>>> When hypervisor is untrusted in relatively far future, when a VF is
>>>>> put in some
>>>> secure enclave and locked hypervisor will not such access.
>>>>> At that point large part will be covered.
>>>> There can be other malicious software and a hypervisor may compromise.
>>> In any case it is not the role of the AQ etc to provide such protection etc.
>> Yes, it is not AQ's responsibility. I wish we don't introduce more weakness.
>>> Safeguarding from hypervisor is completely different topic using confidential
>> computing, TDISP and other affiliated standards.
>>> It is far beyond msix config piece to tackle.
>>>
>>> Before we reach there, virtio spec has certain fundamental catch up to be
>> done, at least to me.
>> So lets work on that first than rush into the AQ/VF provisioning case.
> I mean querying and provisioning feature bits and config space fields is the basic functionality before attempting to securing it.
It may be fine to _ONLY_ provision virtio configuration through AQ, 
limit the changes in virtio spec.
Actually this is not provisioning a VF, this is modification after 
creation, because we still
create a VF through PCI interface num_vfs.
> I was told that you are going to rebase the tvq series on top of AQ, hence the ask to split the series to two.
> If I misunderstood, its fine, my bad.
> Someone else will pick up the features/config provisioning+query part.
If you want to re-use some transport cmds for SRIOV, that's fine, we 
just can not reuse the whole command set for SRIOV.
For example, we expect AQ as a transport for SIOV, therefore MSIX is 
config-ed through AQ, as we discussed this
set_msix_cmd may not apply to SRIOV for now.

Querying is fine as you know it is read only.
For setting, I assume we need a new mechanism to sycn the PCI config 
space with AQ, and still the host owns the AQ.

>
>>>> I still think we should resolve the issues first.
>>> I don’t think this is really an issue.
>>> Passthrough VF devices are already there for more than a decade and msix
>> config is just one small piece of it to provision, among others.
>> passthrough, like vfio which assign the device including its config space to a
>> guest, works well. While AQ is a side channel.
> Sure. AQ is side channel but hypervisor's ability to access VF while in use including doing FLR and more is already exist.
a hypervisor should not reset anything when the device has been 
passthroughed, or such a hypervisor may be considered buggy
> So such thing does not need special spec level protection.
> An OS driver can handle it internally.
again, I wish we don't introduce more attacking surface even the stack 
is already vulnerable.

Thanks


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

