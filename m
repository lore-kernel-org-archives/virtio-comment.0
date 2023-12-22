Return-Path: <virtio-comment-return-8854-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62ADEC41535
	for <virtio-comment@archiver.kernel.org>; Fri, 22 Dec 2023 06:45:29 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 98D9D2B078
	for <virtio-comment@archiver.kernel.org>; Fri, 22 Dec 2023 06:45:28 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 734349865E9
	for <virtio-comment@archiver.kernel.org>; Fri, 22 Dec 2023 06:45:28 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 54C2C98427C; Fri, 22 Dec 2023 06:45:28 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 415489865C1
	for <virtio-comment@lists.oasis-open.org>; Fri, 22 Dec 2023 06:45:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R311e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046056;MF=hengqi@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0VyzxdUS_1703227522;
Message-ID: <a037dd2f-be0c-4b02-b706-672e9a56497f@linux.alibaba.com>
Date: Fri, 22 Dec 2023 14:45:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jason Wang <jasowang@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, "Michael S . Tsirkin"
 <mst@redhat.com>, Yuri Benditovich <yuri.benditovich@daynix.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 Alvaro Karsz <alvaro.karsz@solid-run.com>, Parav Pandit <parav@nvidia.com>
References: <fb123ee4ac9e21e6f1d7142149439db74585be8e.1703083096.git.hengqi@linux.alibaba.com>
 <CACGkMEt_kvBbnpNt_cfB8KdKWM9WP8T_wnQBm13yKpe5JYVnAg@mail.gmail.com>
 <8afe4002-07d0-4571-8410-26edebb042b4@linux.alibaba.com>
 <CACGkMEsBZ8Egc4D+TUKXngqeyDsMEpDTOQiZjyGbeXYBpHa1ag@mail.gmail.com>
From: Heng Qi <hengqi@linux.alibaba.com>
In-Reply-To: <CACGkMEsBZ8Egc4D+TUKXngqeyDsMEpDTOQiZjyGbeXYBpHa1ag@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] Re: [PATCH RESEND] virtio-net: support setting
 coalescing params for multiple vqs



在 2023/12/22 上午10:40, Jason Wang 写道:
> On Thu, Dec 21, 2023 at 12:55 PM Heng Qi <hengqi@linux.alibaba.com> wrote:
>>
>>
>> 在 2023/12/21 上午11:37, Jason Wang 写道:
>>> On Wed, Dec 20, 2023 at 10:40 PM Heng Qi <hengqi@linux.alibaba.com> wrote:
>>>> Currently, when each time the driver attempts to update the coalescing parameters
>>>> for a vq, it needs to kick the device and wait for the ctrlq response to return.
>>>>
>>>> If a command can only update one vq parameters, when the parameters are updated
>>>> frequently (such as netdim), ctrlq on the device is kicked frequently, which will
>>>> increase the device CPU scheduling overhead, and the number and overhead of device
>>>> DMA will also increase.
>>>>
>>>> Merging multiple vq updated parameters into one command can effectively reduce
>>>> the number of kick devices and device DMA times.
>>>>
>>>> Test results show that this greatly improves the efficiency of the ctrlq in
>>>> responding to multiple vq coalescing parameter updates issued by the driver.
>>> So netdim is per virtqueue, to make use of this, you need to batch the
>>> netdim requests first.
>> Yes. I think the code looks more intuitive.
>> Please view the following PoC test code combined with the current code
>> of upstream virtio netdim
>>
>> +struct ctrl_coal_vq_entry {
>> +       u16 vqn;
>> +       u16 reserved;
>> +       int usecs;
>> +       int packets;
>> +};
>> +
>> +struct virtio_net_ctrl_mrg_coal_vq {
>> +       int num_entries;
>> +       struct ctrl_coal_vq_entry coal_vqs[];
>> +};
>> +
>>
>> @@ -313,12 +335,18 @@ struct virtnet_info {
>>
>>           struct control_buf *ctrl;
>>
>> +       struct virtio_net_ctrl_mrg_coal_vq *ctrl_coal_vqs;
>> +
>>
>>
>> @@ -4390,6 +4586,7 @@ static int virtnet_alloc_queues(struct
>> virtnet_info *vi)
>>           if (!vi->rq)
>>                   goto err_rq;
>>
>> +       vi->ctrl_coal_vqs = kzalloc(sizeof(struct
>> virtio_net_ctrl_mrg_coal_vq) + vi->max_queue_pairs * sizeof(struct
>> ctrl_coal_vq_entry), GFP_KERNEL);
>>
>>
>> +       struct scatterlist sg;
>> +       for (i = 0; i < vi->curr_queue_pairs; i++) {
>> +                vi->ctrl_coal_vqs->coal_vqs[i].vqn = rxq2vq(i);
>> +                vi->ctrl_coal_vqs->coal_vqs[i].usecs = 8;
>> +                vi->ctrl_coal_vqs->coal_vqs[i].packets = 16;
>> +        }
>> +        vi->ctrl_coal_vqs->num_entries = i;
>> +        sg_init_one(&sg, vi->ctrl_coal_vqs, sizeof(struct
>> virtio_net_ctrl_mrg_coal_vq) + vi->ctrl_coal_vqs->num_entries *
>> sizeof(struct ctrl_coal_vq_entry));
>> +        vi->req_num++;
>> +        if (!virtnet_send_command(vi, VIRTIO_NET_CTRL_NOTF_COAL,
>> +                              VIRTIO_NET_CTRL_NOTF_COAL_*VQS*_SET, &sg))
>>
>>    #define VIRTIO_NET_CTRL_NOTF_COAL_VQ_GET               3
>> +#define VIRTIO_NET_CTRL_NOTF_COAL_VQS_SET              4
>>
>>>    And if you do that, you can batch the commands
>>> as well.
>>
>> Batch commands we have tried:
>>
>> +               for (i = 0; i < vi->curr_queue_pairs; i++) {
>> +                       err = virtnet_pre_send_cmd(vi, &vi->vq_ctrls[i],
>> 8, 16);
>> +               }
>> +
>> +               if (unlikely(!virtqueue_kick(vi->cvq)))
>> +                       return vi->ctrl->status == VIRTIO_NET_OK;
>> +
>> +               for (i = 0; i < vi->curr_queue_pairs; i++) {
>> +                       while (!virtqueue_is_broken(vi->cvq) &&
>> !virtqueue_get_buf(vi->cvq, &tmp))
>> +                               cpu_relax();
>> +               }
>> +       }
>>
>>
>> +
>> +static bool virtnet_pre_send_cmd(struct virtnet_info *vi, struct
>> vq_coal *vq_ctrls,
>> +                                u32 max_usecs, u32 max_packets)
>> +{
>> +       struct scatterlist hdr, out, stat;
>> +       struct scatterlist *sgs[4];
>> +       unsigned out_num = 0;
>> +       int ret;
>> +
>> +       BUG_ON(!virtio_has_feature(vi->vdev, VIRTIO_NET_F_CTRL_VQ));
>> +
>> +       vq_ctrls->hdr.class = VIRTIO_NET_CTRL_NOTF_COAL;
>> +       vq_ctrls->hdr.cmd = VIRTIO_NET_CTRL_NOTF_COAL_VQ_SET;
>> +       sg_init_one(&hdr, &vq_ctrls->hdr, sizeof(vq_ctrls->hdr));
>> +       sgs[out_num++] = &hdr;
>> +
>> +       vq_ctrls->coal_vq.vqn = cpu_to_le16(0);
>> +       vq_ctrls->coal_vq.coal.max_usecs = cpu_to_le32(max_usecs);
>> +       vq_ctrls->coal_vq.coal.max_packets = cpu_to_le32(max_packets);
>> +       sg_init_one(&out, &vq_ctrls->ho, sizeof(vq_ctrls->ho));
>> +
>> +       if (&out)
>> +               sgs[out_num++] = &out;
>> +
>> +       vq_ctrls->status = ~0;
>> +       sg_init_one(&stat, &vq_ctrls->status, sizeof(vq_ctrls->status));
>> +       sgs[out_num] = &stat;
>> +
>> +       BUG_ON(out_num + 1 > ARRAY_SIZE(sgs));
>> +       ret = virtqueue_add_sgs(vi->cvq, sgs, out_num, 1, vi, GFP_ATOMIC);
>> +       if (ret < 0) {
>> +               dev_warn(&vi->vdev->dev,
>> +                        "Failed to add sgs for command vq: %d\n.", ret);
>> +               return false;
>> +       }
>>
>>
>> Overall, batch reqs are sufficient. Because the current major overhead
>> is the number of DMAs.
>> For example, for a device with 256 queues,
>>
>> For the current upstream code, the overhead is 256 kicks + 256*8 DMA times.
>> The overhead of batch cmds is 1 kick + 256*8 DMA times.
> This can furtherly optimized by using IN_ORDER. The DMA can be batched as well.

DMA batch reduces the number of DMA requests, but not the actual number 
of DMAs.
For out DPU, how much to batch and when to end the batch also need to be 
evaluated in detail.

>
> Or even using packed virtqueue.
>
>> The overhead of batch reqs is 1 kick + 8 DMA times.
> If this is a real issue for your architecture, we should not make it
> only work for coalescing. Any per vq tweaking may suffer from that.

YES.

> E.g if you want to do ARFS in the future. So it should a e.g a
> container command for cvq instead of just for coalescing command
> itself.
>
> We need to make sure if the existing facility is sufficient or not.

We considered to update the generic ctrlq batch command. But so far we 
have only seen
this requirement for netdim and aRFS. At the same time, aRFS has not yet 
entered the community.
We will try to add a batch req interface for it and it may have a 
dedicated flow vq to ensure that
the number of command issuances larger than netdim is responded to in time.
So we temporarily plan to advance the batch of coalescing parameter 
requests first.

Thanks.

>
> THanks
>
>> Below is 8 DMA times:
>> - get avail idx 1 time
>> - Pull avail ring information 1 time
>> - Pull the desc pointed to by the avail ring 3 times
>> - Pull the hdr and out bufs pointed to by avail ring desc 2 times
>> - Write once to the status buf pointed to by status 1 time
>>
>> Thanks!
>>
>>> Then you get one kick for sevreal coal requests?
>>>
>>> Or are you saying you run out of ctrl vq?
>>>
>>> Thanks
>>>
>>>
>>> This publicly archived list offers a means to provide input to the
>>> OASIS Virtual I/O Device (VIRTIO) TC.
>>>
>>> In order to verify user consent to the Feedback License terms and
>>> to minimize spam in the list archive, subscription is required
>>> before posting.
>>>
>>> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
>>> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
>>> List help: virtio-comment-help@lists.oasis-open.org
>>> List archive: https://lists.oasis-open.org/archives/virtio-comment/
>>> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
>>> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
>>> Committee: https://www.oasis-open.org/committees/virtio/
>>> Join OASIS: https://www.oasis-open.org/join/
>>
>> This publicly archived list offers a means to provide input to the
>> OASIS Virtual I/O Device (VIRTIO) TC.
>>
>> In order to verify user consent to the Feedback License terms and
>> to minimize spam in the list archive, subscription is required
>> before posting.
>>
>> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
>> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
>> List help: virtio-comment-help@lists.oasis-open.org
>> List archive: https://lists.oasis-open.org/archives/virtio-comment/
>> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
>> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
>> Committee: https://www.oasis-open.org/committees/virtio/
>> Join OASIS: https://www.oasis-open.org/join/
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

