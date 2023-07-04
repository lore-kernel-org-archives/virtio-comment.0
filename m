Return-Path: <virtio-comment-return-6695-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB3A8EB64D9
	for <virtio-comment@archiver.kernel.org>; Tue,  4 Jul 2023 03:48:38 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id F40B43356A
	for <virtio-comment@archiver.kernel.org>; Tue,  4 Jul 2023 03:48:37 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D11CC98658E
	for <virtio-comment@archiver.kernel.org>; Tue,  4 Jul 2023 03:48:37 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id C5CB89863B2; Tue,  4 Jul 2023 03:48:37 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id ACAA7986559
	for <virtio-comment@lists.oasis-open.org>; Tue,  4 Jul 2023 03:48:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="343357378"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="343357378"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="784082814"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="784082814"
Message-ID: <bf66c18d-6dd4-d04b-eee0-5a9a93b7b5aa@intel.com>
Date: Tue, 4 Jul 2023 11:48:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.12.0
Content-Language: en-US
To: Parav Pandit <parav@nvidia.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Cc: Jason Wang <jasowang@redhat.com>,
 "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
References: <1687243466.51691-1-xuanzhuo@linux.alibaba.com>
 <e37fb447-fd22-4d42-f3e2-2ab6f1c8f3b4@intel.com>
 <1688104464.531018-1-xuanzhuo@linux.alibaba.com>
 <CACGkMEtNPGneB0E1sVqmpe9fGwMp=_2vmepy3Bm9r=5=5r=ZXQ@mail.gmail.com>
 <1688372430.0519888-1-xuanzhuo@linux.alibaba.com>
 <20230703071106-mutt-send-email-mst@kernel.org>
 <PH0PR12MB548146B440C789EC38DAC507DC29A@PH0PR12MB5481.namprd12.prod.outlook.com>
From: "Zhu, Lingshan" <lingshan.zhu@intel.com>
In-Reply-To: <PH0PR12MB548146B440C789EC38DAC507DC29A@PH0PR12MB5481.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [virtio-comment] About the plan of Admin Queue



On 7/4/2023 4:38 AM, Parav Pandit wrote:
>
>> From: Michael S. Tsirkin <mst@redhat.com>
>> Sent: Monday, July 3, 2023 9:05 AM
>>
>> OK it looks like at least Parav and Jason understand what's going on, maybe one
>> of you can explain:
>>
>> 1- there's a management stack that can bind an ID
>>    to a group of properties
>> 2- the proposed command then binds an ID to a VF
>> 3- after this, VF can be assigned to a VM
>>
>> Is this a fair summary?
>>
>> In that case what is gained compared to
>> configuring properties on the VF directly?
>> Why is not the ID an internal property of the management?
> For VFs I also believe we can live with an internal property.
>
> For migratable SIOV devices which are spawned by the management system has similar ID assigned by the mgmt. system.
> Having such node local ID is needed anyway.
>
> There is a struggle (scale wise) to make such ID network wide unique if each virtio device to expose such id at transport level.
Maybe you don't want a guest talking to the PF through admin queue 
directly, so there can be a wrapper for SIOV ADIs, therefore the ID is 
not a problem for migration.


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

