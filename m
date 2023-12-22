Return-Path: <virtio-comment-return-8853-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CAD9C46CD3
	for <virtio-comment@archiver.kernel.org>; Fri, 22 Dec 2023 02:41:12 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id F13D92AECF
	for <virtio-comment@archiver.kernel.org>; Fri, 22 Dec 2023 02:41:11 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CD13B986603
	for <virtio-comment@archiver.kernel.org>; Fri, 22 Dec 2023 02:41:11 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id B14199863A7; Fri, 22 Dec 2023 02:41:11 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A09129865C1
	for <virtio-comment@lists.oasis-open.org>; Fri, 22 Dec 2023 02:41:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: UDXLUsI-Pf2PyRRVyVSlrA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703212868; x=1703817668;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FzXqiCXW/TdyLSVd9J31WSMSmDwOjHOJaDfUItUwtqY=;
        b=Jrc5iP3ty+sij37wNg1+kwmPUqZZlWngp8/70qfkMmJEsE78/GeZIc6qjftYMcme3D
         OmsJL3RZD1gqbT4z5U5V+Ynqfpt7uTybZYJE6aj9x+IDVJbpQ5pAfGNGRgEQExM8oBiI
         Y7KhoXZcstgvL7nMcKY8J49hHJpzyhp89IikJNLgE5G05qcgQJM18gYuJXEKQYWjrTM8
         vSfZBWlL8xCW8VCeap0nMMNwKExz9Xqv8BJg72nHtgOYw0HLObQzoZp7RSPzu6MbLZ3b
         huuJdJIIX4mFsexbNB7SyrZ/LZoVtdzMjMcnPU6SN+LGq4DTnSo881cg3J4ezRjxul/2
         4QRg==
X-Gm-Message-State: AOJu0Yz36jX3bDKVOl5tZSxgz3AyEY6Xd3uqPQ/aQus941FcpqHEpYMj
	tFYZRIji1jWkPCNFlrDTGfgrD9WbAhphjy5EKvqZPflYt9hfTL8uvhGi2AhdfBBSt7QkDimRVWf
	OxTVIf447Jmfjc/EMFFXHrjg1uTmJB4SBQuwDC7+EiHkbsD9TqoEdlvNA46sa+11mYxTF
X-Received: by 2002:a05:6358:cc1d:b0:172:b538:4403 with SMTP id gx29-20020a056358cc1d00b00172b5384403mr675959rwb.55.1703212867982;
        Thu, 21 Dec 2023 18:41:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGxYTmmOAyBtsmYcyLv+vf0ZA3RLurfBTbmA5eexOdjrmq0rNVkNNTNMTMGRcnDbWq5RMINA/1a0rG3TvHSXsI=
X-Received: by 2002:a05:6358:cc1d:b0:172:b538:4403 with SMTP id
 gx29-20020a056358cc1d00b00172b5384403mr675951rwb.55.1703212867634; Thu, 21
 Dec 2023 18:41:07 -0800 (PST)
MIME-Version: 1.0
References: <fb123ee4ac9e21e6f1d7142149439db74585be8e.1703083096.git.hengqi@linux.alibaba.com>
 <CACGkMEt_kvBbnpNt_cfB8KdKWM9WP8T_wnQBm13yKpe5JYVnAg@mail.gmail.com> <8afe4002-07d0-4571-8410-26edebb042b4@linux.alibaba.com>
In-Reply-To: <8afe4002-07d0-4571-8410-26edebb042b4@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 22 Dec 2023 10:40:52 +0800
Message-ID: <CACGkMEsBZ8Egc4D+TUKXngqeyDsMEpDTOQiZjyGbeXYBpHa1ag@mail.gmail.com>
To: Heng Qi <hengqi@linux.alibaba.com>
Cc: virtio-comment@lists.oasis-open.org, 
	"Michael S . Tsirkin" <mst@redhat.com>, Yuri Benditovich <yuri.benditovich@daynix.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] Re: [PATCH RESEND] virtio-net: support setting
 coalescing params for multiple vqs

On Thu, Dec 21, 2023 at 12:55=E2=80=AFPM Heng Qi <hengqi@linux.alibaba.com>=
 wrote:
>
>
>
> =E5=9C=A8 2023/12/21 =E4=B8=8A=E5=8D=8811:37, Jason Wang =E5=86=99=E9=81=
=93:
> > On Wed, Dec 20, 2023 at 10:40=E2=80=AFPM Heng Qi <hengqi@linux.alibaba.=
com> wrote:
> >> Currently, when each time the driver attempts to update the coalescing=
 parameters
> >> for a vq, it needs to kick the device and wait for the ctrlq response =
to return.
> >>
> >> If a command can only update one vq parameters, when the parameters ar=
e updated
> >> frequently (such as netdim), ctrlq on the device is kicked frequently,=
 which will
> >> increase the device CPU scheduling overhead, and the number and overhe=
ad of device
> >> DMA will also increase.
> >>
> >> Merging multiple vq updated parameters into one command can effectivel=
y reduce
> >> the number of kick devices and device DMA times.
> >>
> >> Test results show that this greatly improves the efficiency of the ctr=
lq in
> >> responding to multiple vq coalescing parameter updates issued by the d=
river.
> > So netdim is per virtqueue, to make use of this, you need to batch the
> > netdim requests first.
>
> Yes. I think the code looks more intuitive.
> Please view the following PoC test code combined with the current code
> of upstream virtio netdim
>
> +struct ctrl_coal_vq_entry {
> +       u16 vqn;
> +       u16 reserved;
> +       int usecs;
> +       int packets;
> +};
> +
> +struct virtio_net_ctrl_mrg_coal_vq {
> +       int num_entries;
> +       struct ctrl_coal_vq_entry coal_vqs[];
> +};
> +
>
> @@ -313,12 +335,18 @@ struct virtnet_info {
>
>          struct control_buf *ctrl;
>
> +       struct virtio_net_ctrl_mrg_coal_vq *ctrl_coal_vqs;
> +
>
>
> @@ -4390,6 +4586,7 @@ static int virtnet_alloc_queues(struct
> virtnet_info *vi)
>          if (!vi->rq)
>                  goto err_rq;
>
> +       vi->ctrl_coal_vqs =3D kzalloc(sizeof(struct
> virtio_net_ctrl_mrg_coal_vq) + vi->max_queue_pairs * sizeof(struct
> ctrl_coal_vq_entry), GFP_KERNEL);
>
>
> +       struct scatterlist sg;
> +       for (i =3D 0; i < vi->curr_queue_pairs; i++) {
> +                vi->ctrl_coal_vqs->coal_vqs[i].vqn =3D rxq2vq(i);
> +                vi->ctrl_coal_vqs->coal_vqs[i].usecs =3D 8;
> +                vi->ctrl_coal_vqs->coal_vqs[i].packets =3D 16;
> +        }
> +        vi->ctrl_coal_vqs->num_entries =3D i;
> +        sg_init_one(&sg, vi->ctrl_coal_vqs, sizeof(struct
> virtio_net_ctrl_mrg_coal_vq) + vi->ctrl_coal_vqs->num_entries *
> sizeof(struct ctrl_coal_vq_entry));
> +        vi->req_num++;
> +        if (!virtnet_send_command(vi, VIRTIO_NET_CTRL_NOTF_COAL,
> +                              VIRTIO_NET_CTRL_NOTF_COAL_*VQS*_SET, &sg))
>
>   #define VIRTIO_NET_CTRL_NOTF_COAL_VQ_GET               3
> +#define VIRTIO_NET_CTRL_NOTF_COAL_VQS_SET              4
>
> >   And if you do that, you can batch the commands
> > as well.
>
>
> Batch commands we have tried:
>
> +               for (i =3D 0; i < vi->curr_queue_pairs; i++) {
> +                       err =3D virtnet_pre_send_cmd(vi, &vi->vq_ctrls[i]=
,
> 8, 16);
> +               }
> +
> +               if (unlikely(!virtqueue_kick(vi->cvq)))
> +                       return vi->ctrl->status =3D=3D VIRTIO_NET_OK;
> +
> +               for (i =3D 0; i < vi->curr_queue_pairs; i++) {
> +                       while (!virtqueue_is_broken(vi->cvq) &&
> !virtqueue_get_buf(vi->cvq, &tmp))
> +                               cpu_relax();
> +               }
> +       }
>
>
> +
> +static bool virtnet_pre_send_cmd(struct virtnet_info *vi, struct
> vq_coal *vq_ctrls,
> +                                u32 max_usecs, u32 max_packets)
> +{
> +       struct scatterlist hdr, out, stat;
> +       struct scatterlist *sgs[4];
> +       unsigned out_num =3D 0;
> +       int ret;
> +
> +       BUG_ON(!virtio_has_feature(vi->vdev, VIRTIO_NET_F_CTRL_VQ));
> +
> +       vq_ctrls->hdr.class =3D VIRTIO_NET_CTRL_NOTF_COAL;
> +       vq_ctrls->hdr.cmd =3D VIRTIO_NET_CTRL_NOTF_COAL_VQ_SET;
> +       sg_init_one(&hdr, &vq_ctrls->hdr, sizeof(vq_ctrls->hdr));
> +       sgs[out_num++] =3D &hdr;
> +
> +       vq_ctrls->coal_vq.vqn =3D cpu_to_le16(0);
> +       vq_ctrls->coal_vq.coal.max_usecs =3D cpu_to_le32(max_usecs);
> +       vq_ctrls->coal_vq.coal.max_packets =3D cpu_to_le32(max_packets);
> +       sg_init_one(&out, &vq_ctrls->ho, sizeof(vq_ctrls->ho));
> +
> +       if (&out)
> +               sgs[out_num++] =3D &out;
> +
> +       vq_ctrls->status =3D ~0;
> +       sg_init_one(&stat, &vq_ctrls->status, sizeof(vq_ctrls->status));
> +       sgs[out_num] =3D &stat;
> +
> +       BUG_ON(out_num + 1 > ARRAY_SIZE(sgs));
> +       ret =3D virtqueue_add_sgs(vi->cvq, sgs, out_num, 1, vi, GFP_ATOMI=
C);
> +       if (ret < 0) {
> +               dev_warn(&vi->vdev->dev,
> +                        "Failed to add sgs for command vq: %d\n.", ret);
> +               return false;
> +       }
>
>
> Overall, batch reqs are sufficient. Because the current major overhead
> is the number of DMAs.
> For example, for a device with 256 queues,
>
> For the current upstream code, the overhead is 256 kicks + 256*8 DMA time=
s.
> The overhead of batch cmds is 1 kick + 256*8 DMA times.

This can furtherly optimized by using IN_ORDER. The DMA can be batched as w=
ell.

Or even using packed virtqueue.

> The overhead of batch reqs is 1 kick + 8 DMA times.

If this is a real issue for your architecture, we should not make it
only work for coalescing. Any per vq tweaking may suffer from that.
E.g if you want to do ARFS in the future. So it should a e.g a
container command for cvq instead of just for coalescing command
itself.

We need to make sure if the existing facility is sufficient or not.

THanks

>
> Below is 8 DMA times:
> - get avail idx 1 time
> - Pull avail ring information 1 time
> - Pull the desc pointed to by the avail ring 3 times
> - Pull the hdr and out bufs pointed to by avail ring desc 2 times
> - Write once to the status buf pointed to by status 1 time
>
> Thanks!
>
> > Then you get one kick for sevreal coal requests?
> >
> > Or are you saying you run out of ctrl vq?
> >
> > Thanks
> >
> >
> > This publicly archived list offers a means to provide input to the
> > OASIS Virtual I/O Device (VIRTIO) TC.
> >
> > In order to verify user consent to the Feedback License terms and
> > to minimize spam in the list archive, subscription is required
> > before posting.
> >
> > Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> > Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> > List help: virtio-comment-help@lists.oasis-open.org
> > List archive: https://lists.oasis-open.org/archives/virtio-comment/
> > Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.p=
df
> > List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing=
-lists
> > Committee: https://www.oasis-open.org/committees/virtio/
> > Join OASIS: https://www.oasis-open.org/join/
>
>
> This publicly archived list offers a means to provide input to the
> OASIS Virtual I/O Device (VIRTIO) TC.
>
> In order to verify user consent to the Feedback License terms and
> to minimize spam in the list archive, subscription is required
> before posting.
>
> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> List help: virtio-comment-help@lists.oasis-open.org
> List archive: https://lists.oasis-open.org/archives/virtio-comment/
> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-l=
ists
> Committee: https://www.oasis-open.org/committees/virtio/
> Join OASIS: https://www.oasis-open.org/join/
>


This publicly archived list offers a means to provide input to the=0D
OASIS Virtual I/O Device (VIRTIO) TC.=0D
=0D
In order to verify user consent to the Feedback License terms and=0D
to minimize spam in the list archive, subscription is required=0D
before posting.=0D
=0D
Subscribe: virtio-comment-subscribe@lists.oasis-open.org=0D
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org=0D
List help: virtio-comment-help@lists.oasis-open.org=0D
List archive: https://lists.oasis-open.org/archives/virtio-comment/=0D
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf=0D
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists=0D
Committee: https://www.oasis-open.org/committees/virtio/=0D
Join OASIS: https://www.oasis-open.org/join/

