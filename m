Return-Path: <virtio-comment-return-7428-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A929EEAA42
	for <virtio-comment@archiver.kernel.org>; Fri, 15 Sep 2023 04:07:07 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 6959A2AEF3
	for <virtio-comment@archiver.kernel.org>; Fri, 15 Sep 2023 04:07:06 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4F3D2986663
	for <virtio-comment@archiver.kernel.org>; Fri, 15 Sep 2023 04:07:06 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 3B948983DE4; Fri, 15 Sep 2023 04:07:06 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 26EE4986659;
	Fri, 15 Sep 2023 04:07:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="465514797"
X-IronPort-AV: E=Sophos;i="6.02,147,1688454000"; 
   d="scan'208";a="465514797"
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="868533728"
X-IronPort-AV: E=Sophos;i="6.02,147,1688454000"; 
   d="scan'208";a="868533728"
Message-ID: <3f4cbf84-010c-cffa-0b70-33c449b5561b@intel.com>
Date: Fri, 15 Sep 2023 12:06:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.15.1
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: jasowang@redhat.com, eperezma@redhat.com, cohuck@redhat.com,
 stefanha@redhat.com, virtio-comment@lists.oasis-open.org,
 virtio-dev@lists.oasis-open.org
References: <20230906081637.32185-1-lingshan.zhu@intel.com>
 <20230906081637.32185-5-lingshan.zhu@intel.com>
 <20230914070739-mutt-send-email-mst@kernel.org>
From: "Zhu, Lingshan" <lingshan.zhu@intel.com>
In-Reply-To: <20230914070739-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: [virtio-comment] Re: [PATCH 4/5] virtqueue: ignore resetting vqs when SUSPEND



On 9/14/2023 7:09 PM, Michael S. Tsirkin wrote:
> On Wed, Sep 06, 2023 at 04:16:36PM +0800, Zhu Lingshan wrote:
>> When SUSPEND is set, the device should stabilize the device
>> states and virtqueue states, therefore the device should
>> ignore resetting vqs when SUSPEND is set in device status.
>>
>> Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>
> And do what? If you really feel it's important we can prohibit
> driver from touching state. But generally this seems
> un-orthogonal.
As discussed in other threads, we will introduce new feature bit controlling
this.
>
>
>> ---
>>   content.tex | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/content.tex b/content.tex
>> index 9d727ce..cd2b426 100644
>> --- a/content.tex
>> +++ b/content.tex
>> @@ -443,6 +443,9 @@ \subsubsection{Virtqueue Reset}\label{sec:Basic Facilities of a Virtio Device /
>>   The device MUST reset any state of a virtqueue to the default state,
>>   including the available state and the used state.
>>   
>> +If VIRTIO_F_SUSPEND is negotiated and SUSPEND is set in \field{device status},
>> +the device SHOULD ignore resetting any virtqueues.
>> +
>>   \drivernormative{\paragraph}{Virtqueue Reset}{Basic Facilities of a Virtio Device / Virtqueues / Virtqueue Reset / Virtqueue Reset}
>>   
>>   After the driver tells the device to reset a queue, the driver MUST verify that
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

