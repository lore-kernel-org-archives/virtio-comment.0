Return-Path: <virtio-comment-return-8863-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 134A6C3DA6E
	for <virtio-comment@archiver.kernel.org>; Tue, 26 Dec 2023 02:17:19 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 6A66E2AF9E
	for <virtio-comment@archiver.kernel.org>; Tue, 26 Dec 2023 02:17:18 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 44F35986400
	for <virtio-comment@archiver.kernel.org>; Tue, 26 Dec 2023 02:17:18 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 28232986295; Tue, 26 Dec 2023 02:17:18 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 18044986378
	for <virtio-comment@lists.oasis-open.org>; Tue, 26 Dec 2023 02:17:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R171e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046056;MF=hengqi@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0VzFutLy_1703557032;
Message-ID: <020a20b0-f32c-4c0c-8e57-ea4c3d5b4786@linux.alibaba.com>
Date: Tue, 26 Dec 2023 10:17:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>, virtio-comment@lists.oasis-open.org,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 Alvaro Karsz <alvaro.karsz@solid-run.com>, Parav Pandit <parav@nvidia.com>
References: <fb123ee4ac9e21e6f1d7142149439db74585be8e.1703083096.git.hengqi@linux.alibaba.com>
 <CACGkMEt_kvBbnpNt_cfB8KdKWM9WP8T_wnQBm13yKpe5JYVnAg@mail.gmail.com>
 <8afe4002-07d0-4571-8410-26edebb042b4@linux.alibaba.com>
 <CACGkMEsBZ8Egc4D+TUKXngqeyDsMEpDTOQiZjyGbeXYBpHa1ag@mail.gmail.com>
 <a037dd2f-be0c-4b02-b706-672e9a56497f@linux.alibaba.com>
 <20231222031709-mutt-send-email-mst@kernel.org>
From: Heng Qi <hengqi@linux.alibaba.com>
In-Reply-To: <20231222031709-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] Re: [PATCH RESEND] virtio-net: support setting
 coalescing params for multiple vqs



在 2023/12/22 下午4:20, Michael S. Tsirkin 写道:
> On Fri, Dec 22, 2023 at 02:45:21PM +0800, Heng Qi wrote:
>>>> For the current upstream code, the overhead is 256 kicks + 256*8 DMA times.
>>>> The overhead of batch cmds is 1 kick + 256*8 DMA times.
>>> This can furtherly optimized by using IN_ORDER. The DMA can be batched as well.
>> DMA batch reduces the number of DMA requests, but not the actual number of
>> DMAs.
>> For out DPU, how much to batch and when to end the batch also need to be
>> evaluated in detail.
> And what is the result of this evaluation?

It’s not easy. Not having a good start and end time means that DMA batch 
will increase the response delay
of the entire machine. And DMA batch will not reduce the number of DMA 
times.

>   Again all this is slow path
> stuff. Speed only matters if the operation takes many milliseconds.

Yes, when there are many queues and the device responds slowly, the CPU 
where dim_work in
the driver is located may be kept waiting. This is the overhead 
introduced by DIM enablding.
We want to try our best to avoid the impact of DIM enabling. And, due to 
DPU resource limitations,
we want to better support multiple VMs.

Thanks.



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

