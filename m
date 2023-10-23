Return-Path: <virtio-comment-return-7901-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7026CC001E0
	for <virtio-comment@archiver.kernel.org>; Mon, 23 Oct 2023 10:14:13 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id C9934C6104
	for <virtio-comment@archiver.kernel.org>; Mon, 23 Oct 2023 10:14:12 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B724C98666B
	for <virtio-comment@archiver.kernel.org>; Mon, 23 Oct 2023 10:14:12 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id A3F56986669; Mon, 23 Oct 2023 10:14:12 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9528498666A
	for <virtio-comment@lists.oasis-open.org>; Mon, 23 Oct 2023 10:14:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="473021545"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; 
   d="scan'208";a="473021545"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; 
   d="scan'208";a="6018911"
Message-ID: <2b7e3aac-e238-4056-bf8c-80640d631a1f@intel.com>
Date: Mon, 23 Oct 2023 18:14:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Parav Pandit <parav@nvidia.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>,
 "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
 <shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 Yishai Hadas <yishaih@nvidia.com>
References: <860e52ef-8cfc-408a-b3cc-2551ef6118d1@intel.com>
 <PH0PR12MB5481F6F9BC5158481EC36AE9DCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <cd9431cc-a5ed-4b11-a341-dc129e8ea630@intel.com>
 <PH0PR12MB54819087A0B542F587A4BEC2DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <7bc82c01-19ad-4180-914b-9304e10ef7c3@intel.com>
 <PH0PR12MB5481E858791CA8FD97C7F35EDCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231019051406-mutt-send-email-mst@kernel.org>
 <daea1f54-1c85-4a4a-ac3a-c5ae97180e03@intel.com>
 <PH0PR12MB5481BE51210D429FA12EAB45DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <fb012148-a71e-4856-95fe-6e75f011f3fb@intel.com>
 <20231020053534-mutt-send-email-mst@kernel.org>
 <3932dd54-f43a-40b6-8dba-962f997f7122@intel.com>
 <PH0PR12MB54813F96D29B2D2ACEADD62ADCDBA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <b9ac0893-be30-41d9-8898-2a60e8e909aa@intel.com>
 <PH0PR12MB5481735CC313D32DBAA054E6DCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
From: "Zhu, Lingshan" <lingshan.zhu@intel.com>
In-Reply-To: <PH0PR12MB5481735CC313D32DBAA054E6DCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration



On 10/23/2023 6:01 PM, Parav Pandit wrote:
>
>> From: Zhu, Lingshan <lingshan.zhu@intel.com>
>> Sent: Monday, October 23, 2023 3:18 PM
>
>>> No. Please read the response carefully.
>>> I said 'For non-backward compatible SIOV device of the future, yes, virtio-pci
>> common config (non init registers) should be moved to a vq, located on the
>> member device directly.'
>>> Notice the 'member device directly'.
>>> Not the PF admin vq.
>> I think this is a question to Michael and he answered.
>>
>> We are talking about PCI, not SIOV, for SIOV we need transport vq.
>>
> Hypervisor for future device and future functionality must not get involved in looking the device configuration.
> Hence, as long as transport vq is located on the SIOV device itself for non-backward items, it is fine to transport SIOV configuration.
> For backward compatibility purpose, one will be able to use the aq of the owner device. No need to create a new transport VQ.
> To create a another transport vq, need to clarify the limitations of aq that transport vq can overcome, and why aq cannot be extended to overcome it.
SIOV and transport vq is not related to this topic, don't mix them.

and admin vq is not a must for live migration.

and we are not introducing a new device type here.

For future device and future functionalities, let's discuss when they 
are implementing, on their series.
>   
>> Here again, we are introducing basic facilities for live migration, and the
>> implementation is transport-specific.
> Not relevant comment.
>
>>>> Config space is control path, DMA is data-path, let's better not mix
>>>> them, we never expect to use config space to transfer data.
>>>>
>>> And that control path is only for the init time configuration as
>>> correctly listed in the virtio spec as,
>>>
>>> " Device configuration space should only be used for initialization-time
>> parameters.".
>> don't you know new field reset_vq is introduced to virtio common cfg?
>> This is not only for initialization, right?
> Right. It was unfortunate and also it was last moment entry that we had fixed in reset register polarity.
Appendix B. Creating New Device Types, and we are not introducing new 
device type.
>
>> and your citation is from Appendix B. Creating New Device Types, are we
>> creating a new device type?
> That is guidance for the new device creation on "how to use config space?"
> It equally applied to existing devices too to not grow.
> The section is equally helpful for new creators and for extending devices like you and me to understand what not to put in config space.
this does not make any sense, if you stick to the wording, then let me 
repeat again "Appendix B. Creating New Device Types"!!!!!!
>
>>>> So we need DMA to transfer data, for example I take advantages of
>>>> device DMA to logging dirty pages, This also applies to in-flight descriptors.
>>>>
>>> Can you please explain via virtqueue cannot be used for DMA bulk data
>> transfer as listed in virtio spec.
>>> " The mechanism for bulk data transport on virtio devices is pretentiously
>> called a virtqueue"
>> what is your point? vq can do DMA, so what?
> I am asking,
> If there is AQ on the member device, can you use it? If not, what is the technical reason(s) to not use it.
Repeated for many times, QOS, nested and so on.


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

