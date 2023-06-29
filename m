Return-Path: <virtio-comment-return-6591-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57E11EB64DA
	for <virtio-comment@archiver.kernel.org>; Thu, 29 Jun 2023 02:39:07 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 94784419A6
	for <virtio-comment@archiver.kernel.org>; Thu, 29 Jun 2023 02:39:06 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7876C986590
	for <virtio-comment@archiver.kernel.org>; Thu, 29 Jun 2023 02:39:06 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 675F0986588; Thu, 29 Jun 2023 02:39:06 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5346198658B;
	Thu, 29 Jun 2023 02:39:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="448393156"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; 
   d="scan'208";a="448393156"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="694476757"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; 
   d="scan'208";a="694476757"
Message-ID: <f558c9f4-ca06-ba68-67f6-49f649097b05@intel.com>
Date: Thu, 29 Jun 2023 10:38:52 +0800
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
From: "Zhu, Lingshan" <lingshan.zhu@intel.com>
In-Reply-To: <PH0PR12MB5481F5D8B77067A8CDCB5A9FDC25A@PH0PR12MB5481.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [virtio-comment] Re: virtio member device provisioning get/set
 and virtio child device life cycle mixing not needed



On 6/29/2023 10:23 AM, Parav Pandit wrote:
>> From: Zhu, Lingshan <lingshan.zhu@intel.com>
>> Sent: Wednesday, June 28, 2023 10:18 PM
>
>>> So msix provisioning via AQ is fine. VF can expose new MSIX capability post
>> reconfiguration via AQ.
>> It is the guest to config MSIX of an assigned VF by writing to MSIX capability.
>> However host owns the AQ, means host can modify the MSIX config even when
>> guest operational running.
> Host can do many things not just MSIX config.
> Host is not supposed modify the config.
>
> In some OS MSI-X actual values are not even written by the guest...
yest, current host stack is not perfect.
So lets resolve these issues first rather than introduce new attack surface.
>
>> A new synchronization mechanism? Trap accesses to MSIX cap? Ban access of
>> MSIX through AQ after DRIVER_OK?
>> Do you have any detailed information about how to prevent the conflicts like
>> this?
> A hypervisor is a trusted entity to not mess with the VF.
> A hypervisor can go to an extreme to even do PCI FLR while guest is running..
>
> So no need to go to the extreme.
>
> When hypervisor is untrusted in relatively far future, when a VF is put in some secure enclave and locked hypervisor will not such access.
> At that point large part will be covered.
There can be other malicious software and a hypervisor may compromise. I 
still think we should resolve the issues first.


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

