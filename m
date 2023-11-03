Return-Path: <virtio-comment-return-8162-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B50DC4167D
	for <virtio-comment@archiver.kernel.org>; Fri,  3 Nov 2023 14:57:21 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 0BE7F41F27
	for <virtio-comment@archiver.kernel.org>; Fri,  3 Nov 2023 14:57:21 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id ECB33986C45
	for <virtio-comment@archiver.kernel.org>; Fri,  3 Nov 2023 14:57:20 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id DDD9B983EB2; Fri,  3 Nov 2023 14:57:20 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CE5AA986C3C
	for <virtio-comment@lists.oasis-open.org>; Fri,  3 Nov 2023 14:57:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="1834669"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="1834669"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="755174683"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="755174683"
Message-ID: <705607e3-39c3-47da-a688-80bbee31c48d@intel.com>
Date: Fri, 3 Nov 2023 22:57:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Parav Pandit <parav@nvidia.com>, "jasowang@redhat.com"
 <jasowang@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
 "eperezma@redhat.com" <eperezma@redhat.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>
Cc: "virtio-comment@lists.oasis-open.org"
 <virtio-comment@lists.oasis-open.org>
References: <20231103103437.72784-1-lingshan.zhu@intel.com>
 <20231103103437.72784-5-lingshan.zhu@intel.com>
 <PH0PR12MB5481085F6E84FD2786FCD60BDCA5A@PH0PR12MB5481.namprd12.prod.outlook.com>
From: "Zhu, Lingshan" <lingshan.zhu@intel.com>
In-Reply-To: <PH0PR12MB5481085F6E84FD2786FCD60BDCA5A@PH0PR12MB5481.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: [virtio-comment] Re: [PATCH V2 4/6] virtio-pci: implement VIRTIO_F_QUEUE_STATE



On 11/3/2023 7:35 PM, Parav Pandit wrote:
>> From: Zhu Lingshan <lingshan.zhu@intel.com>
>> Sent: Friday, November 3, 2023 4:05 PM
>>
>> This patch adds two new le16 fields to common configuration structure to
>> support VIRTIO_F_QUEUE_STATE in PCI transport layer.
>>
>> Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>
>> ---
>>   transport-pci.tex | 18 ++++++++++++++++++
>>   1 file changed, 18 insertions(+)
>>
>> diff --git a/transport-pci.tex b/transport-pci.tex index a5c6719..3161519 100644
>> --- a/transport-pci.tex
>> +++ b/transport-pci.tex
>> @@ -325,6 +325,10 @@ \subsubsection{Common configuration structure
>> layout}\label{sec:Virtio Transport
>>           /* About the administration virtqueue. */
>>           le16 admin_queue_index;         /* read-only for driver */
>>           le16 admin_queue_num;         /* read-only for driver */
>> +
>> +	/* Virtqueue state */
>> +        le16 queue_avail_state;         /* read-write */
>> +        le16 queue_used_state;          /* read-write */
> This tiny interface for 128 virtio net queues through register read writes, does not work effectively.
> There are inflight out of order descriptors for block also.
> Hence toy registers like this do not work.
Do you know there is a queue_select? Why this does not work? Do you know 
how other queue related fields work?
Like how to set a queue size and enable it?
>
> Series [1] is comprehensive that covers it even if you consider non-passtrhough device migration model.
> Where you can suspend individual queues using new admin command and get them in the device context state.
>
> [1] https://lists.oasis-open.org/archives/virtio-comment/202310/msg00472.html
I suggest you read QEMU migration code. If you don't want to, not my fault.
>
>>   };
>>   \end{lstlisting}
>>
>> @@ -428,6 +432,17 @@ \subsubsection{Common configuration structure
>> layout}\label{sec:Virtio Transport
>>   	The value 0 indicates no supported administration virtqueues.
>>   	This field is valid only if VIRTIO_F_ADMIN_VQ has been
>>   	negotiated.
>> +
>> +\item[\field{queue_avail_state}]
>> +        This field is valid only if VIRTIO_F_QUEUE_STATE has been
>> +        negotiated. The driver sets and gets the available state of
>> +        the virtqueue here (see \ref{sec:Virtqueues / Virtqueue State}).
>> +
>> +\item[\field{queue_used_state}]
>> +        This field is valid only if VIRTIO_F_QUEUE_STATE has been
>> +        negotiated. The driver sets and gets the used state of the
>> +        virtqueue here (see \ref{sec:Virtqueues / Virtqueue State}).
>> +
>>   \end{description}
>>
>>   \devicenormative{\paragraph}{Common configuration structure layout}{Virtio
>> Transport Options / Virtio Over PCI Bus / PCI Device Layout / Common
>> configuration structure layout} @@ -488,6 +503,9 @@ \subsubsection{Common
>> configuration structure layout}\label{sec:Virtio Transport  present either a value
>> of 0 or a power of 2 in  \field{queue_size}.
>>
>> +If VIRTIO_F_QUEUE_STATE has not been negotiated, the device MUST ignore
>> +any accesses to \field{queue_avail_state} and \field{queue_used_state}.
>> +
>>   If VIRTIO_F_ADMIN_VQ has been negotiated, the value
>> \field{admin_queue_index} MUST be equal to, or bigger than
>> \field{num_queues}; also, \field{admin_queue_num} MUST be
>> --
>> 2.35.3


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

