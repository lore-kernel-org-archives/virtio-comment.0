Return-Path: <virtio-comment-return-8846-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74237C35274
	for <virtio-comment@archiver.kernel.org>; Thu, 21 Dec 2023 07:20:35 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id C5D0D2B020
	for <virtio-comment@archiver.kernel.org>; Thu, 21 Dec 2023 07:20:34 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A1A31986602
	for <virtio-comment@archiver.kernel.org>; Thu, 21 Dec 2023 07:20:34 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 78CB7983DDF; Thu, 21 Dec 2023 07:20:34 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id EE6469865B6
	for <virtio-comment@lists.oasis-open.org>; Thu, 21 Dec 2023 07:19:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R201e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045168;MF=hengqi@linux.alibaba.com;NM=1;PH=DS;RN=5;SR=0;TI=SMTPD_---0VywoGfP_1703143160;
Message-ID: <046a47b8-c816-4c52-abcc-6e1ec3174b32@linux.alibaba.com>
Date: Thu, 21 Dec 2023 15:19:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, Jason Wang <jasowang@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>
References: <fb123ee4ac9e21e6f1d7142149439db74585be8e.1703083096.git.hengqi@linux.alibaba.com>
 <20231221015507-mutt-send-email-mst@kernel.org>
 <e93bf579-16d7-4c25-b05f-575ac756fae8@linux.alibaba.com>
 <20231221020541-mutt-send-email-mst@kernel.org>
From: Heng Qi <hengqi@linux.alibaba.com>
In-Reply-To: <20231221020541-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] Re: [PATCH RESEND] virtio-net: support setting
 coalescing params for multiple vqs



在 2023/12/21 下午3:08, Michael S. Tsirkin 写道:
> On Thu, Dec 21, 2023 at 03:01:57PM +0800, Heng Qi wrote:
>>
>> 在 2023/12/21 下午2:56, Michael S. Tsirkin 写道:
>>> On Wed, Dec 20, 2023 at 10:40:34PM +0800, Heng Qi wrote:
>>>> Currently, when each time the driver attempts to update the coalescing parameters
>>>> for a vq, it needs to kick the device and wait for the ctrlq response to return.
>>> But there's no fundamental reason for it to do so.
>> Indeed, please look at the current upstream netdim code:
>>
>> static void virtnet_rx_dim_work(struct work_struct *work)
>> {
>>          struct dim *dim = container_of(work, struct dim, work);
>>          struct receive_queue *rq = container_of(dim,
>>                          struct receive_queue, dim);
>>          struct virtnet_info *vi = rq->vq->vdev->priv;
>>          struct net_device *dev = vi->dev;
>>          struct dim_cq_moder update_moder;
>>          int i, qnum, err;
>>
>>          if (!rtnl_trylock())
>>                  return;
>>
>>          /* Each rxq's work is queued by "net_dim()->schedule_work()"
>>           * in response to NAPI traffic changes. Note that dim->profile_ix
>>           * for each rxq is updated prior to the queuing action.
>>           * So we only need to traverse and update profiles for all rxqs
>>           * in the work which is holding rtnl_lock.
>>           */
>>          for (i = 0; i < vi->curr_queue_pairs; i++) {
>> <-----------------
>>                  rq = &vi->rq[i];
>>                  dim = &rq->dim;
>>                  qnum = rq - vi->rq;
>>
>>                  if (!rq->dim_enabled)
>>                          continue;
>>
>>                  update_moder = net_dim_get_rx_moderation(dim->mode,
>> dim->profile_ix);
>>                  if (update_moder.usec != rq->intr_coal.max_usecs ||
>>                      update_moder.pkts != rq->intr_coal.max_packets) {
>>                          err = virtnet_send_rx_ctrl_coal_vq_cmd(vi, qnum,
>> update_moder.usec,
>> update_moder.pkts);
>>                          if (err)
>>                                  pr_debug("%s: Failed to send dim parameters
>> on rxq%d\n",
>>                                           dev->name, qnum);
>>                          dim->state = DIM_START_MEASURE;
>>                  }
>>          }
>>
>>          rtnl_unlock();
>> }
>>
>>> It can just as well submit multiple commands and then wait.
>> Sending multiple commands and then waiting reduces the number of kicks.
>> But it does not reduce the number of device DMAs. I already responded to
>> this in a thread to Jason.
>> please check:
>>
>> https://lists.oasis-open.org/archives/virtio-comment/202312/msg00142.html
>>
>> "
>> Overall, batch reqs are sufficient. Because the current major overhead is
>> the number of DMAs.
>> For example, for a device with 256 queues,
>>
>> For the current upstream code, the overhead is 256 kicks + 256*8 DMA times.
>> The overhead of batch cmds is 1 kick + 256*8 DMA times.
>> The overhead of batch reqs is 1 kick + 8 DMA times.
>>
>> Below is 8 DMA times:
>> - get avail idx 1 time
>> - Pull available ring information 1 time
>> - Pull the desc pointed to by the avail ring 3 times
>> - Pull the hdr and out bufs pointed to by avail ring desc 2 times
>> - Write once to the status buf pointed to by status 1 time "
>>
>> Thanks.
> So there's more DMA but it's all slow path.
> Why do we need to micro-optimize it?

On our each DPU, multiple VMs need to be supported. The ctrlq of these 
VMs are simulated by software,
which consumes limited CPU resources on the DPU.
Therefore, optimizing the response speed of ctrlq for netdim can better 
support multiple VMs and the large-queue-sized VM.

> What is the overhead practically, in milliseconds?

Latency overhead is only one aspect. More importantly, limited CPU 
resources need to support
effective command processing of more VMs and large-queue-sized VMs.

Thanks.

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

