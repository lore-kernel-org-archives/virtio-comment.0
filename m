Return-Path: <virtio-comment-return-7645-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38A6ECD690A
	for <virtio-comment@archiver.kernel.org>; Tue, 10 Oct 2023 08:52:18 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 7DBB5C6239
	for <virtio-comment@archiver.kernel.org>; Tue, 10 Oct 2023 08:52:17 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5B5C4986514
	for <virtio-comment@archiver.kernel.org>; Tue, 10 Oct 2023 08:52:17 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 477DE986478; Tue, 10 Oct 2023 08:52:17 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 36139986512
	for <virtio-comment@lists.oasis-open.org>; Tue, 10 Oct 2023 08:52:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="364638691"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; 
   d="scan'208";a="364638691"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="844041370"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; 
   d="scan'208";a="844041370"
Message-ID: <85c59856-b68e-940c-08ed-a14e5a02554d@intel.com>
Date: Tue, 10 Oct 2023 16:52:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.15.1
Content-Language: en-US
To: Parav Pandit <parav@nvidia.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>
Cc: "virtio-comment@lists.oasis-open.org"
 <virtio-comment@lists.oasis-open.org>, "cohuck@redhat.com"
 <cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>,
 Shahaf Shuler <shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 Yishai Hadas <yishaih@nvidia.com>
References: <20231008112555.473895-1-parav@nvidia.com>
 <20231008112555.473895-4-parav@nvidia.com>
 <20231008073912-mutt-send-email-mst@kernel.org>
 <2fa89e37-a097-d785-e1ee-cda151b0d872@intel.com>
 <DM8PR12MB548001B88B5FA72B403A2AC9DCCEA@DM8PR12MB5480.namprd12.prod.outlook.com>
From: "Zhu, Lingshan" <lingshan.zhu@intel.com>
In-Reply-To: <DM8PR12MB548001B88B5FA72B403A2AC9DCCEA@DM8PR12MB5480.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration



On 10/9/2023 10:30 PM, Parav Pandit wrote:
>
>> From: Zhu, Lingshan <lingshan.zhu@intel.com>
>> Sent: Monday, October 9, 2023 4:04 PM
>>
>> On 10/8/2023 7:41 PM, Michael S. Tsirkin wrote:
>>> On Sun, Oct 08, 2023 at 02:25:50PM +0300, Parav Pandit wrote:
>>>> Define the device context and its fields for purpose of device
>>>> migration. The device context is read and written by the owner driver
>>>> on source and destination hypervisor respectively.
>>>>
>>>> Device context fields will experience a rapid growth post this
>>>> initial version to cover many details of the device.
>>>>
>>>> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/176
>>>> Signed-off-by: Parav Pandit <parav@nvidia.com>
>>>> Signed-off-by: Satananda Burla <sburla@marvell.com>
>>>> ---
>>>> changelog:
>>>> v0->v1:
>>>> - enrich device context to cover feature bits, device configuration
>>>>     fields
>>>> - corrected alignment of device context fields
>>>> ---
>>>>    content.tex        |   1 +
>>>>    device-context.tex | 142
>> +++++++++++++++++++++++++++++++++++++++++++++
>>>>    2 files changed, 143 insertions(+)
>>>>    create mode 100644 device-context.tex
>>>>
>>>> diff --git a/content.tex b/content.tex index 0a62dce..2698931 100644
>>>> --- a/content.tex
>>>> +++ b/content.tex
>>>> @@ -503,6 +503,7 @@ \section{Exporting Objects}\label{sec:Basic Facilities
>> of a Virtio Device / Expo
>>>>    UUIDs as specified by \hyperref[intro:rfc4122]{[RFC4122]}.
>>>>
>>>>    \input{admin.tex}
>>>> +\input{device-context.tex}
>>>>
>>>>    \chapter{General Initialization And Device
>>>> Operation}\label{sec:General Initialization And Device Operation}
>>>>
>>>> diff --git a/device-context.tex b/device-context.tex new file mode
>>>> 100644 index 0000000..5611382
>>>> --- /dev/null
>>>> +++ b/device-context.tex
>>>> @@ -0,0 +1,142 @@
>>>> +\section{Device Context}\label{sec:Basic Facilities of a Virtio
>>>> +Device / Device Context}
>>>> +
>>>> +The device context holds the information that a owner driver can use
>>>> +to setup a member device and resume its operation. The device
>>>> +context of a member device is read or written by the owner driver
>>>> +using administration commands.
>>>> +
>>>> +\begin{lstlisting}
>>>> +struct virtio_dev_ctx_field_tlv {
>>>> +        le32 type;
>>>> +        le32 reserved;
>>>> +        le64 length;
>>>> +        u8 value[];
>>>> +};
>>>> +
>>>> +struct virtio_dev_ctx {
>>>> +        le32 field_count;
>>>> +        struct virtio_dev_ctx_field_tlv fields[]; };
>>>> +
>>>> +\end{lstlisting}
>> so this still doesn't work for nested
> In one use case of nesting, that we came across is:
> there is large host_VM which is hosting another guest_VMs.
> In such case, the owner PF is passthrough to this host_VM and current proposed scheme continue to function for nesting as well for nested guest_VMs.
The system admin can choose only passthrough some of the devices for 
nested guests, so passthrough the PF to L1 guest is not a good idea, 
because there can be
many devices still work for the host or L1.
>
> In second use case, where one want to bind only one member device to one VM,
> I think same plumbing can be extended to have another VF, to take the role of migration device instead of owner device.
>
> I don’t see a good way to passthrough and also do in-band migration without lot of device specific trap and emulation.
> I also don’t know the cpu performance numbers with 3 levels of nested page table translation which to my understanding cannot be accelerated by the current cpu.
host_PA->L1_QEMU_VA->L1_Guest_PA->L1_QEMU_VA->L2_Guest_PA and so on, 
there can be performance overhead, but can be done.

So admin vq migration still don't work for nested, this is surely a blocker.
> Do you know how does it work for Intel x86_64?
> Can it do > 2 level of nested page tables? If no, what is the perf characteristics to expect?
of course that can be done, Page table is not a problem, there are soft 
mmu emulation and viommu, through performance overhead.


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

