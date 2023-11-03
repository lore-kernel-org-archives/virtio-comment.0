Return-Path: <virtio-comment-return-8161-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CADDC0018C
	for <virtio-comment@archiver.kernel.org>; Fri,  3 Nov 2023 14:55:29 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 9A3A833579
	for <virtio-comment@archiver.kernel.org>; Fri,  3 Nov 2023 14:55:28 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 85452986C43
	for <virtio-comment@archiver.kernel.org>; Fri,  3 Nov 2023 14:55:28 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 71B7D983EB2; Fri,  3 Nov 2023 14:55:28 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 61DAE986C3C
	for <virtio-comment@lists.oasis-open.org>; Fri,  3 Nov 2023 14:55:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="392839832"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="392839832"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="852283736"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="852283736"
Message-ID: <78f206cd-1e07-4c20-a281-1ddf74cf4d84@intel.com>
Date: Fri, 3 Nov 2023 22:55:12 +0800
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
 <20231103103437.72784-3-lingshan.zhu@intel.com>
 <PH0PR12MB54814E8B9E7D16C9EF421C82DCA5A@PH0PR12MB5481.namprd12.prod.outlook.com>
From: "Zhu, Lingshan" <lingshan.zhu@intel.com>
In-Reply-To: <PH0PR12MB54814E8B9E7D16C9EF421C82DCA5A@PH0PR12MB5481.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] Re: [PATCH V2 2/6] virtio: introduce SUSPEND bit in device status



On 11/3/2023 7:35 PM, Parav Pandit wrote:
>> From: Zhu Lingshan <lingshan.zhu@intel.com>
>> Sent: Friday, November 3, 2023 4:05 PM
>>
>> This patch introduces a new status bit in the device status: SUSPEND.
>>
>> This SUSPEND bit can be used by the driver to suspend a device, in order to
>> stabilize the device states and virtqueue states.
>>
>> Its main use case is live migration.
>>
>> Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>
>> Signed-off-by: Jason Wang <jasowang@redhat.com>
> You constantly complained that whatever was proposed using admin commands method in [1] must work for passthrough and non-passthrough.
>
> And halfway in the discussion you propose a method after learning all the limitations of in-band, you propose a solution only works for non-passthrough mode.
>
> You asked someone to have comprehensive proposal and when it comes to you following it, you just don’t.
not sure what you are talking about.
> And have most shallow commit message to not even mention it.
>
> Please be consistent in design approach.
> And if you don’t want to be, stop asking others.
this SUSPEND/RESUME doesn't change since the RFC series, how can it not 
be inconsistent???
>
> This is not the way TC collaboration works.
> I probably shouldn’t even expect this from you.
>
> [1] https://lists.oasis-open.org/archives/virtio-comment/202310/msg00472.html
Please don't be so emotional and please be professional.

Why this solution can not work for pass-through? Do you know the device 
ownership will be transferred to the hypervisor when guest suspended in 
live migration?
>
>> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>> ---
>>   content.tex | 36 ++++++++++++++++++++++++++++++++++--
>>   1 file changed, 34 insertions(+), 2 deletions(-)
>>
>> diff --git a/content.tex b/content.tex
>> index 76813b5..bcc9d4b 100644
>> --- a/content.tex
>> +++ b/content.tex
>> @@ -49,6 +49,10 @@ \section{\field{Device Status} Field}\label{sec:Basic
>> Facilities of a Virtio Dev
>>
>>   \item[DEVICE_NEEDS_RESET (64)] Indicates that the device has experienced
>>     an error from which it can't recover.
>> +
>> +\item[SUSPEND (16)] When VIRTIO_F_SUSPEND is negotiated, indicates that
>> +the
>> +  device has been suspended by the driver.
>> +
>>   \end{description}
>>
>>   The \field{device status} field starts out as 0, and is reinitialized to 0 by @@ -
>> 73,6 +77,10 @@ \section{\field{Device Status} Field}\label{sec:Basic Facilities
>> of a Virtio Dev  recover by issuing a reset.
>>   \end{note}
>>
>> +The driver SHOULD NOT set SUSPEND if FEATURES_OK is not set.
>> +
>> +When setting SUSPEND, the driver MUST re-read \field{device status} to ensure
>> the SUSPEND bit is set.
>> +
>>   \devicenormative{\subsection}{Device Status Field}{Basic Facilities of a Virtio
>> Device / Device Status Field}
>>
>>   The device MUST NOT consume buffers or send any used buffer @@ -82,6
>> +90,26 @@ \section{\field{Device Status} Field}\label{sec:Basic Facilities of a
>> Virtio Dev  that a reset is needed.  If DRIVER_OK is set, after it sets
>> DEVICE_NEEDS_RESET, the device  MUST send a device configuration change
>> notification to the driver.
>>
>> +The device MUST ignore SUSPEND if FEATURES_OK is not set.
>> +
>> +The device MUST ignore SUSPEND if VIRTIO_F_SUSPEND is not negotiated.
>> +
>> +The device SHOULD allow settings to \field{device status} even when SUSPEND
>> is set.
>> +
>> +If VIRTIO_F_SUSPEND is negotiated and SUSPEND is set, the device SHOULD
>> +clear SUSPEND and resumes operation upon DRIVER_OK.
>> +
>> +If VIRTIO_F_SUSPEND is negotiated, when the driver sets SUSPEND, the
>> +device SHOULD perform the following actions before presenting SUSPEND bit
>> in the \field{device status}:
>> +
>> +\begin{itemize}
>> +\item Stop consuming buffers of any virtqueues and mark all finished
>> descritors as used.
>> +\item Wait until all descriptors that being processed to finish and mark them
>> as used.
>> +\item Flush all used buffer and send used buffer notifications to the driver.
>> +\item Record Virtqueue State of each enabled virtqueue, see section
>> +\ref{sec:Virtqueues / Virtqueue State} \item Pause its operation except
>> +\field{device status} and preserve configurations in its Device
>> +Configuration Space, see \ref{sec:Basic Facilities of a Virtio Device /
>> +Device Configuration Space} \end{itemize}
>> +
>>   \section{Feature Bits}\label{sec:Basic Facilities of a Virtio Device / Feature Bits}
>>
>>   Each virtio device offers all the features it understands.  During @@ -99,10
>> +127,10 @@ \section{Feature Bits}\label{sec:Basic Facilities of a Virtio Device /
>> Feature B  \begin{description}
>>   \item[0 to 23, and 50 to 127] Feature bits for the specific device type
>>
>> -\item[24 to 42] Feature bits reserved for extensions to the queue and
>> +\item[24 to 43] Feature bits reserved for extensions to the queue and
>>     feature negotiation mechanisms
>>
>> -\item[43 to 49, and 128 and above] Feature bits reserved for future extensions.
>> +\item[44 to 49, and 128 and above] Feature bits reserved for future
>> extensions.
>>   \end{description}
>>
>>   \begin{note}
>> @@ -875,6 +903,10 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved
>> Feature Bits}
>>     \item[VIRTIO_F_QUEUE_STATE(42)] This feature indicates that the device
>> allows the driver
>>     to access its internal virtqueue state.
>>
>> +  \item[VIRTIO_F_SUSPEND(43)] This feature indicates that the driver can
>> +   SUSPEND the device.
>> +   See \ref{sec:Basic Facilities of a Virtio Device / Device Status Field}.
>> +
>>   \end{description}
>>
>>   \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature Bits}
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

