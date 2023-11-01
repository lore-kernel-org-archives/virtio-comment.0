Return-Path: <virtio-comment-return-8082-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A561EC4332F
	for <virtio-comment@archiver.kernel.org>; Wed,  1 Nov 2023 06:39:37 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id EFC302B149
	for <virtio-comment@archiver.kernel.org>; Wed,  1 Nov 2023 06:39:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CF382986BB1
	for <virtio-comment@archiver.kernel.org>; Wed,  1 Nov 2023 06:39:36 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id BE443986BAF; Wed,  1 Nov 2023 06:39:36 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id AEC1D986BB0
	for <virtio-comment@lists.oasis-open.org>; Wed,  1 Nov 2023 06:39:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="1294959"
X-IronPort-AV: E=Sophos;i="6.03,267,1694761200"; 
   d="scan'208";a="1294959"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="1092252842"
X-IronPort-AV: E=Sophos;i="6.03,267,1694761200"; 
   d="scan'208";a="1092252842"
Message-ID: <0bc21f96-486d-481f-8676-5144225e43bc@intel.com>
Date: Wed, 1 Nov 2023 14:39:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Michael S. Tsirkin" <mst@redhat.com>, Parav Pandit <parav@nvidia.com>
Cc: Jason Wang <jasowang@redhat.com>,
 "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "sburla@marvell.com" <sburla@marvell.com>, Shahaf Shuler
 <shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 Yishai Hadas <yishaih@nvidia.com>
References: <PH0PR12MB5481E6F72E2F15AC88E6E24ADCDDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <09996f68-2831-49b0-a403-1ea061bea6eb@intel.com>
 <PH0PR12MB548147B94D76EF02EF42A9B1DCA1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <341b7a16-6927-412e-8a22-4841cd419314@intel.com>
 <PH0PR12MB54813BF8D0F6282A1932EF99DCA1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <640cc639-6065-4828-ac81-0cc809aff293@intel.com>
 <20231031054617-mutt-send-email-mst@kernel.org>
 <DM8PR12MB54806512D1395AB39C59B821DCA7A@DM8PR12MB5480.namprd12.prod.outlook.com>
 <20231101012540-mutt-send-email-mst@kernel.org>
 <DM8PR12MB54802C006C5ADE546783E610DCA7A@DM8PR12MB5480.namprd12.prod.outlook.com>
 <20231101023257-mutt-send-email-mst@kernel.org>
Content-Language: en-US
From: "Zhu, Lingshan" <lingshan.zhu@intel.com>
In-Reply-To: <20231101023257-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration



On 11/1/2023 2:37 PM, Michael S. Tsirkin wrote:
> On Wed, Nov 01, 2023 at 05:42:56AM +0000, Parav Pandit wrote:
>>> From: Michael S. Tsirkin <mst@redhat.com>
>>> Sent: Wednesday, November 1, 2023 11:01 AM
>>>
>>> On Wed, Nov 01, 2023 at 02:54:47AM +0000, Parav Pandit wrote:
>>>>
>>>>> From: Michael S. Tsirkin <mst@redhat.com>
>>>>> Sent: Tuesday, October 31, 2023 3:44 PM
>>>>>
>>>>> On Tue, Oct 31, 2023 at 05:42:29PM +0800, Zhu, Lingshan wrote:
>>>>>>> Your answer is not relevant to this discussion at all.
>>>>>>> Why?
>>>>>>> Because we were discussing the schemes where registers are not used.
>>>>>>> One example of that was IMS. It does not matter MSI or MSIX.
>>>>>>> As explained in Intel's commit message, the key to focus for IMS
>>>>>>> is "queue
>>>>> memory" not some hw register like MSI or MSI-X.
>>>>>> you know the device always need to know a address and the data to
>>>>>> send a MSI, right?
>>>>> So if virtio is to use IMS then we'll need to add interfaces to
>>>>> program IMS, I think. As part of that patch - it's reasonable to
>>>>> assume - we will also need to add a way to retrieve IMS so it can be
>>> migrated.
>>>>> However, what this example demonstrates is that the approach taken
>>>>> by this proposal to migrate control path structures - namely, by
>>>>> defining a structure used just for migration - means that we will
>>>>> need to come up with a migration interface each time.
>>>>> And that is unfortunate.
>>>>>
>>>> When the device supports a new feature it has supported new functionality.
>>>> Hence the live migration side also got updated.
>>>> However, the live migration driver does not have to understand what is inside
>>> the control path structures.
>>>> It is just byte stream.
>>>> Only if the hypervisor live migration drive involved in emulating, it will parse
>>> and that is fine as like other control structures.
>>>
>>> The point is that any new field needs to be added in two places now and that is
>>> not great at all.
>>>
>> Most control structs are well defined. So only its type field is added to migrating driver side.
>> This is very low overhead field and handled in generic way for all device types and for all common types.
> Weird, not what I see.  E.g. you seem to have a structure duplicating queue
> fields. Each new field will have to be added there in addition to the
> transport.
>
>>> We need a stronger compatiblity story here I think.
>>>
>>> One way to show how it's designed to work would be to split the patches. For
>>> example, add queue notify data and queue reset separately.
>> I didn't follow the suggestion. Can you explain splitting patches and its relation to the structure?
>>
>>> Another is to add MSIX table migration option for when MSIX table is passed
>>> through to guest.
>> Yes, this will be added in future when there is actual hypervisor for it.
> You are tying the architecture to an extremely implementation specific
> detail.
>
> Hypervisors *already* have migrate the MSIX table. Just in a hypervisor
> specific way. queue vector is an index into this table. So the index
> is migrated through the device but the table itself has to be
> trapped and emulated by hypervisor? Give me a break.
I agree, the MSI table could be R/W anyway.
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

