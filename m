Return-Path: <virtio-comment-return-9037-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A3C9C47DA9
	for <virtio-comment@archiver.kernel.org>; Tue, 30 Jan 2024 08:50:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id BD95912EAEB
	for <virtio-comment@archiver.kernel.org>; Tue, 30 Jan 2024 08:50:35 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 95E9698687C
	for <virtio-comment@archiver.kernel.org>; Tue, 30 Jan 2024 08:50:35 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 732FC983F76; Tue, 30 Jan 2024 08:50:35 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D549C986876
	for <virtio-comment@lists.oasis-open.org>; Tue, 30 Jan 2024 08:49:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R631e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045168;MF=hengqi@linux.alibaba.com;NM=1;PH=DS;RN=5;SR=0;TI=SMTPD_---0W.fcQwa_1706604554;
Message-ID: <dac9469d-26d9-4d26-a3e0-1a817ba6ecd4@linux.alibaba.com>
Date: Tue, 30 Jan 2024 16:49:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Parav Pandit <parav@nvidia.com>
Cc: Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
References: <1706589924-3036-1-git-send-email-hengqi@linux.alibaba.com>
 <PH0PR12MB5481B81E2D440B8CD7CBD4A4DC7D2@PH0PR12MB5481.namprd12.prod.outlook.com>
 <62e86970-7b38-4387-b5d8-04c6413cc2e3@linux.alibaba.com>
 <PH0PR12MB54818338CF4610281189E2DDDC7D2@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Heng Qi <hengqi@linux.alibaba.com>
In-Reply-To: <PH0PR12MB54818338CF4610281189E2DDDC7D2@PH0PR12MB5481.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] RE: [PATCH v3] virtio-net: support setting
 coalescing params for multiple vqs



在 2024/1/30 下午4:27, Parav Pandit 写道:
>> From: Heng Qi <hengqi@linux.alibaba.com>
>> Sent: Tuesday, January 30, 2024 12:06 PM
>>
>> 在 2024/1/30 下午2:05, Parav Pandit 写道:
>>> Hi Heng,
>>>
>>>> From: Heng Qi <hengqi@linux.alibaba.com>
>>>> Sent: Tuesday, January 30, 2024 10:15 AM
>>>> To: virtio-comment@lists.oasis-open.org
>>>> Cc: Jason Wang <jasowang@redhat.com>; Michael S. Tsirkin
>>>> <mst@redhat.com>; Xuan Zhuo <xuanzhuo@linux.alibaba.com>; Parav
>>>> Pandit <parav@nvidia.com>
>>>> Subject: [PATCH v3] virtio-net: support setting coalescing params for
>>>> multiple vqs
>>>>
>>>> Currently, when each time the driver attempts to update the
>>>> coalescing parameters for a vq, it needs to kick the device and wait
>>>> for the ctrlq response to return.
>>>> The following path is observed: 1. Driver kicks the device; 2. After
>>>> the device receives the kick, CPU scheduling occurs and DMA multiple
>>>> buffers multiple times; 3. The device completes processing and replies with
>> a response.
>>>> Since Linux ctrlq currently cannot add commands in batches, it can
>>>> only process one request synchronously at a time.
>>> It can. Please refactor the kernel code to not depend on OS global rtnl lock.
>>> This cannot be the motivation for spec patch discussed in v2 time.
>> Hi Parav,
>>
>> I don't think this is related to the OS global rtnl_lock. The purpose of removing
>> rtnl_lock is to better support multi-nics OS.
> Even for single NIC if one holds rtnl lock to synchronously issue cvq commands it is wrong.

Yes, I agree with this.

> And using try_lock sort of thing is just a plain hack to identify if one is using cvq or not.

It's a compromise.
But I want to say sorry, the transformation of rtnl_lock does not appear 
in my list for the time being.
Would like to see if anyone else takes this forward. :)

>
>> I think you're referring to having controlq handle things asynchronously
> Async yes, with and without batch.

YES.

>
>> (e.g.
>> batch add commands), and if asynchronous handling is solved, yes, the
>> "kicks" motivation needs to be removed. The remaining motivation is that the
>> device CPU needs to frequently wait for each requested DMA to complete. The
>> more requests there are, the less efficient the device responds.
> And if the descriptors are arranged contiguously even for the split q, the dma are less.
>
> I like to explicitly clarify that I am not again the batch mode.
> I want to say that once you get rid of the rtnl kind of implementation and also do async commands, the performance gain from the batch will not be noticeable.

We did tests and found that even though the async of the dim command has 
been added,
the device(the backend components) still hopes to reduce the pressure in 
batch mode.

Our dpu's cvq is sw-simulated, and the CPU responsible for handling cvq 
requests has a lot of extra work,
such as forwarding, security, etc. So efficiency is need.

> Interrupt moderation is low latency operation that does not need to wait for accumulating in the batch.

We don't need to wait continuously, just accumulate requests that 
already have update requirements.

>>>> When a large-queue driver want to issue multiple requests, the
>>>> subsequent request must wait for the previous request to be processed
>>>> before it can be
>>>> sent:
>>>>     1. The driver kicks the device frequently, this often interrupt the work of
>>>>        the device-side CPU. In addition, each vq request
>>>>     2. Each request is pipelined and there can always be only one request in
>> the
>>>>        pipeline, causing more delays for the device-side CPU to wait for the
>> DMA
>>>>        request to complete.
>>>>
>>>> These interruptions and overhead will strain the CPU responsible for
>>>> controlling the path of the DPU, especially in multi-device and
>>>> large-queue scenarios.
>>>>
>>> Please remove above line as you acked below that those driver notifications
>> are ignored by the device in [1].
>>> [1]
>>> https://lists.oasis-open.org/archives/virtio-comment/202401/msg00132.h
>>> tml
>> Please see the above reply.
>>
>>>> To solve the above problems, we internally tried batch request, which
>>>> merges requests from multiple queues and sends them at once. We
>>>> conservatively tested
>>>> 8 queue commands and sent them together. The DPU processing
>>>> efficiency can be improved by 8 times, which greatly eases the DPU's
>>>> support for multi- device and multi-queue DIM.
>>>>
>>>> Suggested-by: Xiaoming Zhao <zxm377917@alibaba-inc.com>
>>>> Signed-off-by: Heng Qi <hengqi@linux.alibaba.com>
>>>> ---
>>>> v2->v3:
>>>>       1. Update some descriptions. @ Michael
>>>>       2. virtio_net_ctrl_mrg_coal_vq -> virtnet_ctrl_mrg_coal_vq
>>>>       3. Reword the commit log.
>>>>
>>>> v1->v2: Updated commit log. Due to sensitivity, sorry that can not
>>>> v1->give the
>>>>           absolute value directly. @Michael
>>>>
>>>>    device-types/net/description.tex | 28 ++++++++++++++++++++++------
>>>>    1 file changed, 22 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/device-types/net/description.tex b/device-
>>>> types/net/description.tex index aff5e08..dbca203 100644
>>>> --- a/device-types/net/description.tex
>>>> +++ b/device-types/net/description.tex
>>>> @@ -1667,8 +1667,8 @@ \subsubsection{Control
>>>> Virtqueue}\label{sec:Device Types / Network Device / Devi  for
>>>> notification coalescing.
>>>>
>>>>    If the VIRTIO_NET_F_VQ_NOTF_COAL feature is negotiated, the driver
>>>> can - send commands VIRTIO_NET_CTRL_NOTF_COAL_VQ_SET and
>>>> VIRTIO_NET_CTRL_NOTF_COAL_VQ_GET -for virtqueue notification
>>>> coalescing.
>>>> +send commands VIRTIO_NET_CTRL_NOTF_COAL_VQ_SET,
>>>> +VIRTIO_NET_CTRL_NOTF_COAL_VQS_SET and
>>>> VIRTIO_NET_CTRL_NOTF_COAL_VQ_GET for virtqueue notification
>> coalescing.
>>>>    \begin{lstlisting}
>>>>    struct virtio_net_ctrl_coal {
>>>> @@ -1682,11 +1682,17 @@ \subsubsection{Control
>>>> Virtqueue}\label{sec:Device Types / Network Device / Devi
>>>>        struct virtio_net_ctrl_coal coal;
>>>>    };
>>>>
>>>> +struct virtnet_ctrl_mrg_coal_vq {
>>> Since this doing at batch level, ctrl_coal_vq_batch or ctrl_coal_vqs_batch
>> seems better name.
>>
>> OK. It's a better name.
>>
>>>> +        le16 num_entries; /* indicates number of valid entries */
>>>> +        struct virtio_net_ctrl_coal_vq entries[]; };
>>>> +
>>>>    #define VIRTIO_NET_CTRL_NOTF_COAL 6
>>>>     #define VIRTIO_NET_CTRL_NOTF_COAL_TX_SET  0
>>>>     #define VIRTIO_NET_CTRL_NOTF_COAL_RX_SET 1
>>>>     #define VIRTIO_NET_CTRL_NOTF_COAL_VQ_SET 2
>>>>     #define VIRTIO_NET_CTRL_NOTF_COAL_VQ_GET 3
>>>> + #define VIRTIO_NET_CTRL_NOTF_COAL_VQS_SET 4
>>> A new feature bit is needed as the driver does not know if all the devices
>> support this command or not.
>>
>> Well, 1.3 is still not released, if the device wants to support dim better, they
>> should update the device.
> It can but the driver does not know if it supports or not.
> So it tries and fails on the device that does not support.
> 1.3 is supposed to be released by now. It is stuck on unrelated OASIS infrastructure update.

Will add a new feature bit.

>
>> Then if you suggest a new feature bit, I will add it in the next version.
>>
>>> For example, some device does not support VQS_SET command.
>>> The device is already out that supports notification features per VQ (without
>> coalescing support) and does not plan to support coalescing because OS level
>> enqueue command is optimal for it like rest of the tx and rx q.
>>
>> Even though ctrlq can do like txq/rxq, for example 256 requests are batched,
>> so the device only needs to process a single request, which is friendly to
>> device. Then it can effectively handle requests from other VMs, perform
>> software forwarding, etc.
>>
> Yes. I understand.
> I just don’t think the gain with be 8x once the proper sw (= async and without rtnl lock is written that enqueues the cmd).
> So request is for the commit log updates to detach commit log from this sw inefficiency details.

Will update this.

Thanks,
Heng


>>>>    \end{lstlisting}
>>>>
>>>>    Coalescing parameters:
>>>> @@ -1706,6 +1712,7 @@ \subsubsection{Control
>>>> Virtqueue}\label{sec:Device Types / Network Device / Devi  \item For
>>>> the command VIRTIO_NET_CTRL_NOTF_COAL_VQ_SET, the structure
>>>> virtio_net_ctrl_coal_vq is write-only for the driver.
>>>>    \item For the command VIRTIO_NET_CTRL_NOTF_COAL_VQ_GET,
>>>> \field{vq_index} and \field{reserved} are write-only
>>>>          for the driver, and the structure virtio_net_ctrl_coal is
>>>> read-only for the driver.
>>>> +\item For the command VIRTIO_NET_CTRL_NOTF_COAL_VQS_SET, the
>>>> structure virtnet_ctrl_mrg_coal_vq is write-only for the driver.
>>>>    \end{itemize}
>>>>
>>>>    The class VIRTIO_NET_CTRL_NOTF_COAL has the following commands:
>>>> @@ -1716,6 +1723,9 @@ \subsubsection{Control
>>>> Virtqueue}\label{sec:Device Types / Network Device / Devi
>>>>                                            for an enabled
>>>> transmit/receive virtqueue whose index is \field{vq_index}.
>>>>    \item VIRTIO_NET_CTRL_NOTF_COAL_VQ_GET: use the structure
>>>> virtio_net_ctrl_coal_vq to get the \field{max_usecs} and
>>>> \field{max_packets} parameters
>>>>                                            for an enabled
>>>> transmit/receive virtqueue whose index is \field{vq_index}.
>>>> +\item VIRTIO_NET_CTRL_NOTF_COAL_VQS_SET: use the structure
>>>> virtnet_ctrl_mrg_coal_vq to set the \field{max_usecs} and
>>>> \field{max_packets} parameters
>>>> +                                         for \field{num_entries}
>>>> + enabled transmit/receive
>>>> virtqueues. The corresponding index value
>>>> +                                         of each configured virtqueue is \field{vq_index}.
>>>>    \end{enumerate}
>>>>
>>>>    The device may generate notifications more or less frequently than
>>>> specified by set commands of the VIRTIO_NET_CTRL_NOTF_COAL class.
>>>> @@ -1782,9 +1792,13 @@ \subsubsection{Control
>>>> Virtqueue}\label{sec:Device Types / Network Device / Devi
>>>>
>>>>    The driver MUST set \field{vq_index} to the virtqueue index of an
>>>> enabled transmit or receive virtqueue.
>>>>
>>>> +The driver MUST set \field{num_entries} to a non-zero value and MUST
>>>> +NOT set \field{num_entries} to a value greater than the number of
>>>> +enabled
>>>> transmit and receive virtqueues.
>>>> +
>>>>    The driver MUST have negotiated the VIRTIO_NET_F_NOTF_COAL feature
>>>> when issuing commands VIRTIO_NET_CTRL_NOTF_COAL_TX_SET and
>>>> VIRTIO_NET_CTRL_NOTF_COAL_RX_SET.
>>>>
>>>> -The driver MUST have negotiated the VIRTIO_NET_F_VQ_NOTF_COAL
>>>> feature when issuing commands VIRTIO_NET_CTRL_NOTF_COAL_VQ_SET
>> and
>>>> VIRTIO_NET_CTRL_NOTF_COAL_VQ_GET.
>>>> +The driver MUST have negotiated the VIRTIO_NET_F_VQ_NOTF_COAL
>>>> feature
>>>> +when issuing commands VIRTIO_NET_CTRL_NOTF_COAL_VQ_SET,
>>>> VIRTIO_NET_CTRL_NOTF_COAL_VQS_SET and
>>>> VIRTIO_NET_CTRL_NOTF_COAL_VQ_GET.
>>>>
>>>>    The driver MUST ignore the values of coalescing parameters received
>>>> from the VIRTIO_NET_CTRL_NOTF_COAL_VQ_GET command if the device
>>>> responds with VIRTIO_NET_ERR.
>>>>
>>>> @@ -1794,10 +1808,12 @@ \subsubsection{Control
>>>> Virtqueue}\label{sec:Device Types / Network Device / Devi
>>>>
>>>>    The device SHOULD respond to VIRTIO_NET_CTRL_NOTF_COAL_TX_SET
>> and
>>>> VIRTIO_NET_CTRL_NOTF_COAL_RX_SET commands with VIRTIO_NET_ERR
>> if it
>>>> was not able to change the parameters.
>>>>
>>>> -The device MUST respond to the VIRTIO_NET_CTRL_NOTF_COAL_VQ_SET
>>>> command with VIRTIO_NET_ERR if it was not able to change the
>> parameters.
>>>> +The device MUST respond to VIRTIO_NET_CTRL_NOTF_COAL_VQ_SET and
>>>> +VIRTIO_NET_CTRL_NOTF_COAL_VQS_SET commands with
>> VIRTIO_NET_ERR
>>>> if it
>>>> +was not able to change some of the coalescing parameters. In this
>>>> +case, all of
>>>> the parameters MUST remain unchanged, for all virtqueues.
>>>>
>>>> -The device MUST respond to VIRTIO_NET_CTRL_NOTF_COAL_VQ_SET and
>>>> VIRTIO_NET_CTRL_NOTF_COAL_VQ_GET commands with -
>> VIRTIO_NET_ERR if the
>>>> designated virtqueue is not an enabled transmit or receive virtqueue.
>>>> +The device MUST respond to VIRTIO_NET_CTRL_NOTF_COAL_VQ_SET,
>>>> +VIRTIO_NET_CTRL_NOTF_COAL_VQS_SET and
>>>> VIRTIO_NET_CTRL_NOTF_COAL_VQ_GET commands with VIRTIO_NET_ERR
>> if the
>>>> designated virtqueue is not an enabled transmit or receive virtqueue.
>>>>
>>>>    Upon disabling and re-enabling a transmit virtqueue, the device
>>>> MUST set the coalescing parameters of the virtqueue  to those
>>>> configured through the VIRTIO_NET_CTRL_NOTF_COAL_TX_SET command,
>> or,
>>>> if the driver did not set any TX coalescing parameters, to 0.
>>>> --
>>>> 1.8.3.1
>>> This publicly archived list offers a means to provide input to the
>>> OASIS Virtual I/O Device (VIRTIO) TC.
>>>
>>> In order to verify user consent to the Feedback License terms and to
>>> minimize spam in the list archive, subscription is required before
>>> posting.
>>>
>>> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
>>> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
>>> List help: virtio-comment-help@lists.oasis-open.org
>>> List archive: https://lists.oasis-open.org/archives/virtio-comment/
>>> Feedback License:
>>> https://www.oasis-open.org/who/ipr/feedback_license.pdf
>>> List Guidelines:
>>> https://www.oasis-open.org/policies-guidelines/mailing-lists
>>> Committee: https://www.oasis-open.org/committees/virtio/
>>> Join OASIS: https://www.oasis-open.org/join/


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

