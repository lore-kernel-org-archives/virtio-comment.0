Return-Path: <virtio-comment-return-8232-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2D8EC4332F
	for <virtio-comment@archiver.kernel.org>; Tue,  7 Nov 2023 09:43:54 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 30DD02AC82
	for <virtio-comment@archiver.kernel.org>; Tue,  7 Nov 2023 09:43:54 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 24913986A81
	for <virtio-comment@archiver.kernel.org>; Tue,  7 Nov 2023 09:43:54 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 1B29D9867F1; Tue,  7 Nov 2023 09:43:54 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0D6739867F9
	for <virtio-comment@lists.oasis-open.org>; Tue,  7 Nov 2023 09:43:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="374498749"
X-IronPort-AV: E=Sophos;i="6.03,283,1694761200"; 
   d="scan'208";a="374498749"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,283,1694761200"; 
   d="scan'208";a="10772765"
Message-ID: <67002d08-481e-40b6-8f23-05799b2b8f03@intel.com>
Date: Tue, 7 Nov 2023 17:43:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: jasowang@redhat.com, eperezma@redhat.com, cohuck@redhat.com,
 stefanha@redhat.com, virtio-comment@lists.oasis-open.org, parav@nvidia.com
References: <20231103103437.72784-1-lingshan.zhu@intel.com>
 <20231103103437.72784-7-lingshan.zhu@intel.com>
 <20231103064352-mutt-send-email-mst@kernel.org>
 <378a54b3-1dd6-4626-95af-5485727923e2@intel.com>
 <6162be60-a539-4f42-89c1-edaaf90f3c45@intel.com>
 <20231106045022-mutt-send-email-mst@kernel.org>
From: "Zhu, Lingshan" <lingshan.zhu@intel.com>
In-Reply-To: <20231106045022-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] Re: [PATCH V2 6/6] virtio-pci: implement dirty
 page tracking



On 11/6/2023 6:15 PM, Michael S. Tsirkin wrote:
> On Mon, Nov 06, 2023 at 05:16:43PM +0800, Zhu, Lingshan wrote:
>>
>> On 11/3/2023 10:21 PM, Zhu, Lingshan wrote:
>>>
>>> On 11/3/2023 6:46 PM, Michael S. Tsirkin wrote:
>>>> On Fri, Nov 03, 2023 at 06:34:37PM +0800, Zhu Lingshan wrote:
>>>>> +\begin{lstlisting}
>>>>> +struct virtio_pci_dity_page_track {
>>>>> +        u8 enable;               /* Read-Write */
>>>>> +        u8 gra_power;            /* Read-Write */
>>>>> +        u8 reserved[2];
>>>>> +        le32 {
>>>>> +            pasid: 20;           /* Read-Write */
>>>>> +            reserved: 12;
>>>>> +        };
>>>>> +        le64 bitmap_addr;        /* Read-Write */
>>>>> +        le64 bitmap_length;      /* Read-Write */
>>>>> +};
>>>>> +\end{lstlisting}
>>>> Okay, so it's a simple mailbox in config space.  Which by itself is
>>>> probably a very reasonable idea - more or less what I suggested.
>>>> However, using such a generic facility just for the dirty bitmap seems
>>>> too limited.  Please make it accept arbitrary commands. Reusing admin
>>>> command structure with a special "device itself" group sounds like one
>>>> way to do it.
>>> processing admin cmds in a cap may be too complex and overkill.
>>> we need to handle variable length of cmds, handle async returned
>>> results, and so on.
>>>
>>> This struct seems easy and simple. And shall we use platform facilities
>>> like vt-d
>>> to track dirty pages?
>> To demonstrate these issues, suppose we have a struct in a bar to process
>> admin cmds:
>>
>> struct virtio_admin_cmd {
>>          u64 in_data_length;
>>          u8 cmd_in_data[];
>>          u64 out_data_length;
>>          u8 cmd_out_data[];
>>          u8 ret;
>> };
> An alternative is do same as you did here, e.g.:
> struct virtio_admin_cmd {
>           u64 admin_cmd_pa; /* an out descriptor followed by an in descriptor */
PA depends on IOMMU and ATS
>           u32 pasid : 20;
> 	 u8 reserved : 11;
> 	 u8 hardware : 1;
> };
>
> or we can stick two lengths and addresses straight in the capability.
Still can only process only one cmd at a time and others are blocked.
>
>
>> The problems are:
>> 1) command_in_data and command_out data have variable length, so how many HW
>> resource should be reserved in the bar?
> actually admin commands are truncated by device so just
> set to length that device understands.
How the framework know the length? How can the vendor know how many
HW resource they should place here? I am not sure it is a good
idea to guess.
>
>> 2) To process the cmds in the bar, the device MAY need to read many
>> registers in cmd_in_data[] and write many registers in cmd_out_data[],
>> which can be ineffective, this is not DMA.
> True. Again if you don't want to depend on pasid that's the
> only option.
Yes, this exactly shows how complex and overkill to use
a cap to handle admin cmds. And maybe admin cmds is not a must.
>
>
>> 3) a bar can only process one cmd at a time, and the driver can only issue
>> another cmd after received an ret.
>> This process has to be synchronous IO, one cmd blocks another.
> Exactly same as what you did though.
We have implemented a cap in PCI for dirty page tracking, there are no 
admin cmds.

And for dirty page tracking, we still believe it is better to use 
platform facilities,
as Jason explained.
>
>> 4) VF implementing a bar processing admin cmds conflicts with PF's admin vq.
> So just don't create conflicts. It's same as multiple admin vqs
> really which we already support.
How to tell the SW don't create conflict?
>
>
>> So I think a bar or a cap processing admin cmds is way to complex and
>> overkill.
>>
>> Thanks
> Sounds like a straw man argument.
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

