Return-Path: <virtio-comment-return-8071-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7712AC4332F
	for <virtio-comment@archiver.kernel.org>; Wed,  1 Nov 2023 01:57:27 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id CCDA22A83B
	for <virtio-comment@archiver.kernel.org>; Wed,  1 Nov 2023 01:57:26 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C3655986B9D
	for <virtio-comment@archiver.kernel.org>; Wed,  1 Nov 2023 01:57:26 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id B8AA7986B99; Wed,  1 Nov 2023 01:57:26 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id AAD19986B9A
	for <virtio-comment@lists.oasis-open.org>; Wed,  1 Nov 2023 01:57:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="373464694"
X-IronPort-AV: E=Sophos;i="6.03,266,1694761200"; 
   d="scan'208";a="373464694"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="754336537"
X-IronPort-AV: E=Sophos;i="6.03,266,1694761200"; 
   d="scan'208";a="754336537"
Message-ID: <6b9f572d-51ca-471a-a518-8112d4d8592a@intel.com>
Date: Wed, 1 Nov 2023 09:57:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>,
 "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
 <shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 Yishai Hadas <yishaih@nvidia.com>
References: <PH0PR12MB5481033BB7C0BCABAE329B13DCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <f9a604b2-7bc9-49ce-bd28-59909f0a5fec@intel.com>
 <PH0PR12MB54815B589B8F5489FB493465DCDFA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <9604eb82-8efd-46cd-8b15-90fc637eff0c@intel.com>
 <PH0PR12MB5481E6F72E2F15AC88E6E24ADCDDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <09996f68-2831-49b0-a403-1ea061bea6eb@intel.com>
 <PH0PR12MB548147B94D76EF02EF42A9B1DCA1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <341b7a16-6927-412e-8a22-4841cd419314@intel.com>
 <PH0PR12MB54813BF8D0F6282A1932EF99DCA1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <640cc639-6065-4828-ac81-0cc809aff293@intel.com>
 <20231031054617-mutt-send-email-mst@kernel.org>
 <CACGkMEu1=HCdy5NpKfTNdxe0FvDoFaqdGmtA7z5LqrnFtXmMSg@mail.gmail.com>
From: "Zhu, Lingshan" <lingshan.zhu@intel.com>
In-Reply-To: <CACGkMEu1=HCdy5NpKfTNdxe0FvDoFaqdGmtA7z5LqrnFtXmMSg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration



On 11/1/2023 8:42 AM, Jason Wang wrote:
> On Tue, Oct 31, 2023 at 6:14 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>> On Tue, Oct 31, 2023 at 05:42:29PM +0800, Zhu, Lingshan wrote:
>>>> Your answer is not relevant to this discussion at all.
>>>> Why?
>>>> Because we were discussing the schemes where registers are not used.
>>>> One example of that was IMS. It does not matter MSI or MSIX.
>>>> As explained in Intel's commit message, the key to focus for IMS is "queue memory" not some hw register like MSI or MSI-X.
>>> you know the device always need to know a address and the data to send a
>>> MSI, right?
>> So if virtio is to use IMS then we'll need to add interfaces to program
>> IMS, I think. As part of that patch - it's reasonable to assume - we will
>> also need to add a way to retrieve IMS so it can be migrated.
>>
>> However, what this example demonstrates is that the approach taken
>> by this proposal to migrate control path structures - namely, by
>> defining a structure used just for migration - means that we will
>> need to come up with a migration interface each time.
>> And that is unfortunate.
>>
>> Compare to the trap and emulate approach for config space and we don't
>> need a new interface, we just make each field R/W.
>> So I feel this is something to think about, and address.
>> Ideas?
> Something like we've done for transportq in the past? (by just adding
> the get commands):
>
> https://lore.kernel.org/all/29533940-0345-4a84-fcc7-f42d914dc28d@intel.com/T/#mbfe209b96e1dda88ed7aae04d25b12026a7b5364
Exactly! and I will continue this work once our live migration proposal 
merged.
>
> Thanks
>
>> --
>> MST
>>


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

