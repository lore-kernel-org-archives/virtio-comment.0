Return-Path: <virtio-comment-return-8868-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FF7CC46CD4
	for <virtio-comment@archiver.kernel.org>; Tue, 26 Dec 2023 09:18:27 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id C4A122ACFD
	for <virtio-comment@archiver.kernel.org>; Tue, 26 Dec 2023 09:18:26 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 95F27986384
	for <virtio-comment@archiver.kernel.org>; Tue, 26 Dec 2023 09:18:26 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 74000983EFA; Tue, 26 Dec 2023 09:18:26 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 61D40986378
	for <virtio-comment@lists.oasis-open.org>; Tue, 26 Dec 2023 09:18:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: DC592HQ_O7Wz4d03VQrkVw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703582302; x=1704187102;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qb44x+N9yRyXykZyfb0HCLUt7o8OzIS8KKjIlreKBsY=;
        b=E+xWOXPGYpilcdHD3aYPparHB3NXeKBnJljIe0BPjipKIg696ZkjWGXnEe2IoTdK1E
         g+52v/K90pzW9i1B6M3oe14YgkZWJ6lKR8UWjCSlTcS8pRDqZg/gmDV/TvX4e5zMirOl
         Bvu4KBmC0oa+vXJrQqtnOCq11/42VEfziHeCfb/lVXCuwORgNetv02r1LF39YmvUCbgR
         QkRUVDJzHEaMybby7PsOhIScJ1BtOvaqDOatMkr1rev9OUvyaiVCccOy9w0gkehlZ+bN
         hrZTjSnOKMfSQOSQVNpzz/bkqGxaLzTz0krEIdMTOFKCMP6if/vuS4nwI2sYizhFIs8B
         WEoQ==
X-Gm-Message-State: AOJu0YwJFX3Z842pnIZ4GCUqcaZRFoabm4vsmMUJ0ZurG5BPy6U07Caf
	9oLIojwxgnm8T4Bgzla5+UTEh/oek/A12Py/UnFTAe62dS2qbsgy2QMTmSyh8iLLWP8ElUvdgoj
	1M8kUXUV2GTPnc1GihpBfv2YuOFjMr3lMxRCC1ey5sQ==
X-Received: by 2002:a05:600c:2b0e:b0:40c:2417:3b51 with SMTP id y14-20020a05600c2b0e00b0040c24173b51mr2557614wme.74.1703582302151;
        Tue, 26 Dec 2023 01:18:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGBmLdm/n704bwPqcUI1j2TKtxd3pqAfr8Cw3XYs4PKVhuwcA6nh3USo7U8wQ+gaIpiBesy1g==
X-Received: by 2002:a05:600c:2b0e:b0:40c:2417:3b51 with SMTP id y14-20020a05600c2b0e00b0040c24173b51mr2557607wme.74.1703582301752;
        Tue, 26 Dec 2023 01:18:21 -0800 (PST)
Date: Tue, 26 Dec 2023 04:18:17 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: Heng Qi <hengqi@linux.alibaba.com>, virtio-comment@lists.oasis-open.org,
	Yuri Benditovich <yuri.benditovich@daynix.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Alvaro Karsz <alvaro.karsz@solid-run.com>,
	Parav Pandit <parav@nvidia.com>
Message-ID: <20231226040940-mutt-send-email-mst@kernel.org>
References: <fb123ee4ac9e21e6f1d7142149439db74585be8e.1703083096.git.hengqi@linux.alibaba.com>
 <CACGkMEt_kvBbnpNt_cfB8KdKWM9WP8T_wnQBm13yKpe5JYVnAg@mail.gmail.com>
 <8afe4002-07d0-4571-8410-26edebb042b4@linux.alibaba.com>
 <CACGkMEsBZ8Egc4D+TUKXngqeyDsMEpDTOQiZjyGbeXYBpHa1ag@mail.gmail.com>
 <a037dd2f-be0c-4b02-b706-672e9a56497f@linux.alibaba.com>
 <CACGkMEtCtFvY0rMO0nvpBRL6qQa94jZRJC66YTyRHDoDbSgJ_g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACGkMEtCtFvY0rMO0nvpBRL6qQa94jZRJC66YTyRHDoDbSgJ_g@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] Re: [PATCH RESEND] virtio-net: support setting
 coalescing params for multiple vqs

On Tue, Dec 26, 2023 at 11:32:12AM +0800, Jason Wang wrote:
> On Fri, Dec 22, 2023 at 2:45 PM Heng Qi <hengqi@linux.alibaba.com> wrote:
> >
> >
> >
> > 在 2023/12/22 上午10:40, Jason Wang 写道:
> > > On Thu, Dec 21, 2023 at 12:55 PM Heng Qi <hengqi@linux.alibaba.com> wrote:
> > >>
> > >>
> > >> 在 2023/12/21 上午11:37, Jason Wang 写道:
> > >>> On Wed, Dec 20, 2023 at 10:40 PM Heng Qi <hengqi@linux.alibaba.com> wrote:
> > >>>> Currently, when each time the driver attempts to update the coalescing parameters
> > >>>> for a vq, it needs to kick the device and wait for the ctrlq response to return.
> > >>>>
> > >>>> If a command can only update one vq parameters, when the parameters are updated
> > >>>> frequently (such as netdim), ctrlq on the device is kicked frequently, which will
> > >>>> increase the device CPU scheduling overhead, and the number and overhead of device
> > >>>> DMA will also increase.
> > >>>>
> > >>>> Merging multiple vq updated parameters into one command can effectively reduce
> > >>>> the number of kick devices and device DMA times.
> > >>>>
> > >>>> Test results show that this greatly improves the efficiency of the ctrlq in
> > >>>> responding to multiple vq coalescing parameter updates issued by the driver.
> > >>> So netdim is per virtqueue, to make use of this, you need to batch the
> > >>> netdim requests first.
> > >> Yes. I think the code looks more intuitive.
> > >> Please view the following PoC test code combined with the current code
> > >> of upstream virtio netdim
> > >>
> > >> +struct ctrl_coal_vq_entry {
> > >> +       u16 vqn;
> > >> +       u16 reserved;
> > >> +       int usecs;
> > >> +       int packets;
> > >> +};
> > >> +
> > >> +struct virtio_net_ctrl_mrg_coal_vq {
> > >> +       int num_entries;
> > >> +       struct ctrl_coal_vq_entry coal_vqs[];
> > >> +};
> > >> +
> > >>
> > >> @@ -313,12 +335,18 @@ struct virtnet_info {
> > >>
> > >>           struct control_buf *ctrl;
> > >>
> > >> +       struct virtio_net_ctrl_mrg_coal_vq *ctrl_coal_vqs;
> > >> +
> > >>
> > >>
> > >> @@ -4390,6 +4586,7 @@ static int virtnet_alloc_queues(struct
> > >> virtnet_info *vi)
> > >>           if (!vi->rq)
> > >>                   goto err_rq;
> > >>
> > >> +       vi->ctrl_coal_vqs = kzalloc(sizeof(struct
> > >> virtio_net_ctrl_mrg_coal_vq) + vi->max_queue_pairs * sizeof(struct
> > >> ctrl_coal_vq_entry), GFP_KERNEL);
> > >>
> > >>
> > >> +       struct scatterlist sg;
> > >> +       for (i = 0; i < vi->curr_queue_pairs; i++) {
> > >> +                vi->ctrl_coal_vqs->coal_vqs[i].vqn = rxq2vq(i);
> > >> +                vi->ctrl_coal_vqs->coal_vqs[i].usecs = 8;
> > >> +                vi->ctrl_coal_vqs->coal_vqs[i].packets = 16;
> > >> +        }
> > >> +        vi->ctrl_coal_vqs->num_entries = i;
> > >> +        sg_init_one(&sg, vi->ctrl_coal_vqs, sizeof(struct
> > >> virtio_net_ctrl_mrg_coal_vq) + vi->ctrl_coal_vqs->num_entries *
> > >> sizeof(struct ctrl_coal_vq_entry));
> > >> +        vi->req_num++;
> > >> +        if (!virtnet_send_command(vi, VIRTIO_NET_CTRL_NOTF_COAL,
> > >> +                              VIRTIO_NET_CTRL_NOTF_COAL_*VQS*_SET, &sg))
> > >>
> > >>    #define VIRTIO_NET_CTRL_NOTF_COAL_VQ_GET               3
> > >> +#define VIRTIO_NET_CTRL_NOTF_COAL_VQS_SET              4
> > >>
> > >>>    And if you do that, you can batch the commands
> > >>> as well.
> > >>
> > >> Batch commands we have tried:
> > >>
> > >> +               for (i = 0; i < vi->curr_queue_pairs; i++) {
> > >> +                       err = virtnet_pre_send_cmd(vi, &vi->vq_ctrls[i],
> > >> 8, 16);
> > >> +               }
> > >> +
> > >> +               if (unlikely(!virtqueue_kick(vi->cvq)))
> > >> +                       return vi->ctrl->status == VIRTIO_NET_OK;
> > >> +
> > >> +               for (i = 0; i < vi->curr_queue_pairs; i++) {
> > >> +                       while (!virtqueue_is_broken(vi->cvq) &&
> > >> !virtqueue_get_buf(vi->cvq, &tmp))
> > >> +                               cpu_relax();
> > >> +               }
> > >> +       }
> > >>
> > >>
> > >> +
> > >> +static bool virtnet_pre_send_cmd(struct virtnet_info *vi, struct
> > >> vq_coal *vq_ctrls,
> > >> +                                u32 max_usecs, u32 max_packets)
> > >> +{
> > >> +       struct scatterlist hdr, out, stat;
> > >> +       struct scatterlist *sgs[4];
> > >> +       unsigned out_num = 0;
> > >> +       int ret;
> > >> +
> > >> +       BUG_ON(!virtio_has_feature(vi->vdev, VIRTIO_NET_F_CTRL_VQ));
> > >> +
> > >> +       vq_ctrls->hdr.class = VIRTIO_NET_CTRL_NOTF_COAL;
> > >> +       vq_ctrls->hdr.cmd = VIRTIO_NET_CTRL_NOTF_COAL_VQ_SET;
> > >> +       sg_init_one(&hdr, &vq_ctrls->hdr, sizeof(vq_ctrls->hdr));
> > >> +       sgs[out_num++] = &hdr;
> > >> +
> > >> +       vq_ctrls->coal_vq.vqn = cpu_to_le16(0);
> > >> +       vq_ctrls->coal_vq.coal.max_usecs = cpu_to_le32(max_usecs);
> > >> +       vq_ctrls->coal_vq.coal.max_packets = cpu_to_le32(max_packets);
> > >> +       sg_init_one(&out, &vq_ctrls->ho, sizeof(vq_ctrls->ho));
> > >> +
> > >> +       if (&out)
> > >> +               sgs[out_num++] = &out;
> > >> +
> > >> +       vq_ctrls->status = ~0;
> > >> +       sg_init_one(&stat, &vq_ctrls->status, sizeof(vq_ctrls->status));
> > >> +       sgs[out_num] = &stat;
> > >> +
> > >> +       BUG_ON(out_num + 1 > ARRAY_SIZE(sgs));
> > >> +       ret = virtqueue_add_sgs(vi->cvq, sgs, out_num, 1, vi, GFP_ATOMIC);
> > >> +       if (ret < 0) {
> > >> +               dev_warn(&vi->vdev->dev,
> > >> +                        "Failed to add sgs for command vq: %d\n.", ret);
> > >> +               return false;
> > >> +       }
> > >>
> > >>
> > >> Overall, batch reqs are sufficient. Because the current major overhead
> > >> is the number of DMAs.
> > >> For example, for a device with 256 queues,
> > >>
> > >> For the current upstream code, the overhead is 256 kicks + 256*8 DMA times.
> > >> The overhead of batch cmds is 1 kick + 256*8 DMA times.
> > > This can furtherly optimized by using IN_ORDER. The DMA can be batched as well.
> >
> > DMA batch reduces the number of DMA requests, but not the actual number
> > of DMAs.
> 
> Well, if we do IN_ORDER, then
> 
> 1 for avail idx.
> 
> At most 2 DMA is needed for all descriptors.
> 
> Driver can allocate an array of cvq commands. So CVQ commands could be
> fetched at most 2 DMA.
> 
> etc.

For most users, all this happens maybe once per VM start.  It's not
reasonable to start micro-optimizing this until it is taking so much
time it slows VM start measureably.  With each DMA taking at most
of an extra microsecond I just do not see the benefit, even with 1000s
of DMAs, this will take at most milliseconds.


> > For out DPU, how much to batch and when to end the batch also need to be
> > evaluated in detail.
> >
> > >
> > > Or even using packed virtqueue.
> > >
> > >> The overhead of batch reqs is 1 kick + 8 DMA times.
> > > If this is a real issue for your architecture, we should not make it
> > > only work for coalescing. Any per vq tweaking may suffer from that.
> >
> > YES.
> >
> > > E.g if you want to do ARFS in the future. So it should a e.g a
> > > container command for cvq instead of just for coalescing command
> > > itself.
> > >
> > > We need to make sure if the existing facility is sufficient or not.
> >
> > We considered to update the generic ctrlq batch command. But so far we
> > have only seen
> > this requirement for netdim and aRFS.
> 
> Two use cases should be sufficient to justify.
> 
> We do have others, for example the vlan/mac filters.
> 
> 
> > At the same time, aRFS has not yet
> > entered the community.
> > We will try to add a batch req interface for it and it may have a
> > dedicated flow vq to ensure that
> > the number of command issuances larger than netdim is responded to in time.
> > So we temporarily plan to advance the batch of coalescing parameter
> > requests first.
> 
> Thanks


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

