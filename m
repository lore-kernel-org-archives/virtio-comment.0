Return-Path: <virtio-comment-return-8869-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0FEDC46CD3
	for <virtio-comment@archiver.kernel.org>; Wed, 27 Dec 2023 02:33:10 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 0C1A22B12D
	for <virtio-comment@archiver.kernel.org>; Wed, 27 Dec 2023 02:33:10 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B796F986412
	for <virtio-comment@archiver.kernel.org>; Wed, 27 Dec 2023 02:33:09 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 7433F9862A5; Wed, 27 Dec 2023 02:33:09 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 602E59863A7
	for <virtio-comment@lists.oasis-open.org>; Wed, 27 Dec 2023 02:33:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: B4F9LIxvOqearoygqUltog-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703644385; x=1704249185;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6WnpA1rIhcARQ3KfJFTCoW2JzMxerobXCjKOO/asM4M=;
        b=pzsutHCcjY+GO6PtXAM+nS4BAmfmgq/pPgIQl1ULb1ezfPo4b6ZIm54DLXXQXk6QvG
         S4jJSYr0end4Th/C7ucyKjH3f9ARB4v9NysqOQARj8g3lHPEKtYMuTCW0XwiFqC/zLOb
         SXBRwDXKlcTrmLkPMO+FJhzih4MUpIO6isqFtl8CEE1T5yykGn2qZiH8ogis3XniKppV
         /WrRxAlNY93+wB4kk5JLId10jhWw8ZZ/LcLBAUXLZV7o/s3sMbwb7GS1PU6YXUkghO11
         zLiC8YgFpqTW65uiwluHdxJzOU8oZpYdenErUAUOC0B7jjEHRlR3BGRPuTyggfeEfrnv
         fYEA==
X-Gm-Message-State: AOJu0YwPiY7JyjZnBKhJEykRzqMBRRKfJ2m1J+rTOnvFishfcjmPsVCm
	NtojghbkYJA7HRjn2uBvUFexC/uHfx1GezdTvdkPrnvoP88Cx4t4XUSY+ohjlPhN3jklNNHhCWN
	iWpFc3gDMJI8FkPjO6KW2N2HJxQt0sBB5aMZHN5hW0ZC0phX1l6PxzYbWLw==
X-Received: by 2002:a05:6a00:181e:b0:6d9:ba7f:8b02 with SMTP id y30-20020a056a00181e00b006d9ba7f8b02mr5105993pfa.32.1703644385354;
        Tue, 26 Dec 2023 18:33:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGlVYz4Lv8KesylsgFjMeRV0jPO+hT8m3/Tl/w9IOrSt4Id7dC8mvaszCh2dknptZm/lmTQe9NkuQq8j7bX/po=
X-Received: by 2002:a05:6a00:181e:b0:6d9:ba7f:8b02 with SMTP id
 y30-20020a056a00181e00b006d9ba7f8b02mr5105980pfa.32.1703644385016; Tue, 26
 Dec 2023 18:33:05 -0800 (PST)
MIME-Version: 1.0
References: <fb123ee4ac9e21e6f1d7142149439db74585be8e.1703083096.git.hengqi@linux.alibaba.com>
 <CACGkMEt_kvBbnpNt_cfB8KdKWM9WP8T_wnQBm13yKpe5JYVnAg@mail.gmail.com>
 <8afe4002-07d0-4571-8410-26edebb042b4@linux.alibaba.com> <CACGkMEsBZ8Egc4D+TUKXngqeyDsMEpDTOQiZjyGbeXYBpHa1ag@mail.gmail.com>
 <a037dd2f-be0c-4b02-b706-672e9a56497f@linux.alibaba.com> <CACGkMEtCtFvY0rMO0nvpBRL6qQa94jZRJC66YTyRHDoDbSgJ_g@mail.gmail.com>
 <20231226040940-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231226040940-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 27 Dec 2023 10:32:53 +0800
Message-ID: <CACGkMEt3QrGmWT4zHzwaKGQMK4Z=Hyoidq4UtqFCzdKcsY1aaA@mail.gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Heng Qi <hengqi@linux.alibaba.com>, virtio-comment@lists.oasis-open.org, 
	Yuri Benditovich <yuri.benditovich@daynix.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	Alvaro Karsz <alvaro.karsz@solid-run.com>, Parav Pandit <parav@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] Re: [PATCH RESEND] virtio-net: support setting
 coalescing params for multiple vqs

On Tue, Dec 26, 2023 at 5:18=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com>=
 wrote:
>
> On Tue, Dec 26, 2023 at 11:32:12AM +0800, Jason Wang wrote:
> > On Fri, Dec 22, 2023 at 2:45=E2=80=AFPM Heng Qi <hengqi@linux.alibaba.c=
om> wrote:
> > >
> > >
> > >
> > > =E5=9C=A8 2023/12/22 =E4=B8=8A=E5=8D=8810:40, Jason Wang =E5=86=99=E9=
=81=93:
> > > > On Thu, Dec 21, 2023 at 12:55=E2=80=AFPM Heng Qi <hengqi@linux.alib=
aba.com> wrote:
> > > >>
> > > >>
> > > >> =E5=9C=A8 2023/12/21 =E4=B8=8A=E5=8D=8811:37, Jason Wang =E5=86=99=
=E9=81=93:
> > > >>> On Wed, Dec 20, 2023 at 10:40=E2=80=AFPM Heng Qi <hengqi@linux.al=
ibaba.com> wrote:
> > > >>>> Currently, when each time the driver attempts to update the coal=
escing parameters
> > > >>>> for a vq, it needs to kick the device and wait for the ctrlq res=
ponse to return.
> > > >>>>
> > > >>>> If a command can only update one vq parameters, when the paramet=
ers are updated
> > > >>>> frequently (such as netdim), ctrlq on the device is kicked frequ=
ently, which will
> > > >>>> increase the device CPU scheduling overhead, and the number and =
overhead of device
> > > >>>> DMA will also increase.
> > > >>>>
> > > >>>> Merging multiple vq updated parameters into one command can effe=
ctively reduce
> > > >>>> the number of kick devices and device DMA times.
> > > >>>>
> > > >>>> Test results show that this greatly improves the efficiency of t=
he ctrlq in
> > > >>>> responding to multiple vq coalescing parameter updates issued by=
 the driver.
> > > >>> So netdim is per virtqueue, to make use of this, you need to batc=
h the
> > > >>> netdim requests first.
> > > >> Yes. I think the code looks more intuitive.
> > > >> Please view the following PoC test code combined with the current =
code
> > > >> of upstream virtio netdim
> > > >>
> > > >> +struct ctrl_coal_vq_entry {
> > > >> +       u16 vqn;
> > > >> +       u16 reserved;
> > > >> +       int usecs;
> > > >> +       int packets;
> > > >> +};
> > > >> +
> > > >> +struct virtio_net_ctrl_mrg_coal_vq {
> > > >> +       int num_entries;
> > > >> +       struct ctrl_coal_vq_entry coal_vqs[];
> > > >> +};
> > > >> +
> > > >>
> > > >> @@ -313,12 +335,18 @@ struct virtnet_info {
> > > >>
> > > >>           struct control_buf *ctrl;
> > > >>
> > > >> +       struct virtio_net_ctrl_mrg_coal_vq *ctrl_coal_vqs;
> > > >> +
> > > >>
> > > >>
> > > >> @@ -4390,6 +4586,7 @@ static int virtnet_alloc_queues(struct
> > > >> virtnet_info *vi)
> > > >>           if (!vi->rq)
> > > >>                   goto err_rq;
> > > >>
> > > >> +       vi->ctrl_coal_vqs =3D kzalloc(sizeof(struct
> > > >> virtio_net_ctrl_mrg_coal_vq) + vi->max_queue_pairs * sizeof(struct
> > > >> ctrl_coal_vq_entry), GFP_KERNEL);
> > > >>
> > > >>
> > > >> +       struct scatterlist sg;
> > > >> +       for (i =3D 0; i < vi->curr_queue_pairs; i++) {
> > > >> +                vi->ctrl_coal_vqs->coal_vqs[i].vqn =3D rxq2vq(i);
> > > >> +                vi->ctrl_coal_vqs->coal_vqs[i].usecs =3D 8;
> > > >> +                vi->ctrl_coal_vqs->coal_vqs[i].packets =3D 16;
> > > >> +        }
> > > >> +        vi->ctrl_coal_vqs->num_entries =3D i;
> > > >> +        sg_init_one(&sg, vi->ctrl_coal_vqs, sizeof(struct
> > > >> virtio_net_ctrl_mrg_coal_vq) + vi->ctrl_coal_vqs->num_entries *
> > > >> sizeof(struct ctrl_coal_vq_entry));
> > > >> +        vi->req_num++;
> > > >> +        if (!virtnet_send_command(vi, VIRTIO_NET_CTRL_NOTF_COAL,
> > > >> +                              VIRTIO_NET_CTRL_NOTF_COAL_*VQS*_SET=
, &sg))
> > > >>
> > > >>    #define VIRTIO_NET_CTRL_NOTF_COAL_VQ_GET               3
> > > >> +#define VIRTIO_NET_CTRL_NOTF_COAL_VQS_SET              4
> > > >>
> > > >>>    And if you do that, you can batch the commands
> > > >>> as well.
> > > >>
> > > >> Batch commands we have tried:
> > > >>
> > > >> +               for (i =3D 0; i < vi->curr_queue_pairs; i++) {
> > > >> +                       err =3D virtnet_pre_send_cmd(vi, &vi->vq_c=
trls[i],
> > > >> 8, 16);
> > > >> +               }
> > > >> +
> > > >> +               if (unlikely(!virtqueue_kick(vi->cvq)))
> > > >> +                       return vi->ctrl->status =3D=3D VIRTIO_NET_=
OK;
> > > >> +
> > > >> +               for (i =3D 0; i < vi->curr_queue_pairs; i++) {
> > > >> +                       while (!virtqueue_is_broken(vi->cvq) &&
> > > >> !virtqueue_get_buf(vi->cvq, &tmp))
> > > >> +                               cpu_relax();
> > > >> +               }
> > > >> +       }
> > > >>
> > > >>
> > > >> +
> > > >> +static bool virtnet_pre_send_cmd(struct virtnet_info *vi, struct
> > > >> vq_coal *vq_ctrls,
> > > >> +                                u32 max_usecs, u32 max_packets)
> > > >> +{
> > > >> +       struct scatterlist hdr, out, stat;
> > > >> +       struct scatterlist *sgs[4];
> > > >> +       unsigned out_num =3D 0;
> > > >> +       int ret;
> > > >> +
> > > >> +       BUG_ON(!virtio_has_feature(vi->vdev, VIRTIO_NET_F_CTRL_VQ)=
);
> > > >> +
> > > >> +       vq_ctrls->hdr.class =3D VIRTIO_NET_CTRL_NOTF_COAL;
> > > >> +       vq_ctrls->hdr.cmd =3D VIRTIO_NET_CTRL_NOTF_COAL_VQ_SET;
> > > >> +       sg_init_one(&hdr, &vq_ctrls->hdr, sizeof(vq_ctrls->hdr));
> > > >> +       sgs[out_num++] =3D &hdr;
> > > >> +
> > > >> +       vq_ctrls->coal_vq.vqn =3D cpu_to_le16(0);
> > > >> +       vq_ctrls->coal_vq.coal.max_usecs =3D cpu_to_le32(max_usecs=
);
> > > >> +       vq_ctrls->coal_vq.coal.max_packets =3D cpu_to_le32(max_pac=
kets);
> > > >> +       sg_init_one(&out, &vq_ctrls->ho, sizeof(vq_ctrls->ho));
> > > >> +
> > > >> +       if (&out)
> > > >> +               sgs[out_num++] =3D &out;
> > > >> +
> > > >> +       vq_ctrls->status =3D ~0;
> > > >> +       sg_init_one(&stat, &vq_ctrls->status, sizeof(vq_ctrls->sta=
tus));
> > > >> +       sgs[out_num] =3D &stat;
> > > >> +
> > > >> +       BUG_ON(out_num + 1 > ARRAY_SIZE(sgs));
> > > >> +       ret =3D virtqueue_add_sgs(vi->cvq, sgs, out_num, 1, vi, GF=
P_ATOMIC);
> > > >> +       if (ret < 0) {
> > > >> +               dev_warn(&vi->vdev->dev,
> > > >> +                        "Failed to add sgs for command vq: %d\n."=
, ret);
> > > >> +               return false;
> > > >> +       }
> > > >>
> > > >>
> > > >> Overall, batch reqs are sufficient. Because the current major over=
head
> > > >> is the number of DMAs.
> > > >> For example, for a device with 256 queues,
> > > >>
> > > >> For the current upstream code, the overhead is 256 kicks + 256*8 D=
MA times.
> > > >> The overhead of batch cmds is 1 kick + 256*8 DMA times.
> > > > This can furtherly optimized by using IN_ORDER. The DMA can be batc=
hed as well.
> > >
> > > DMA batch reduces the number of DMA requests, but not the actual numb=
er
> > > of DMAs.
> >
> > Well, if we do IN_ORDER, then
> >
> > 1 for avail idx.
> >
> > At most 2 DMA is needed for all descriptors.
> >
> > Driver can allocate an array of cvq commands. So CVQ commands could be
> > fetched at most 2 DMA.
> >
> > etc.
>
> For most users, all this happens maybe once per VM start.  It's not
> reasonable to start micro-optimizing this until it is taking so much
> time it slows VM start measureably.  With each DMA taking at most
> of an extra microsecond I just do not see the benefit, even with 1000s
> of DMAs, this will take at most milliseconds.

Probably, it is just an example for the possible optimization.

To make the proposal more general, a general container command should
be better than an ad-hoc batch command just for coalescing.

Thanks

>
>
> > > For out DPU, how much to batch and when to end the batch also need to=
 be
> > > evaluated in detail.
> > >
> > > >
> > > > Or even using packed virtqueue.
> > > >
> > > >> The overhead of batch reqs is 1 kick + 8 DMA times.
> > > > If this is a real issue for your architecture, we should not make i=
t
> > > > only work for coalescing. Any per vq tweaking may suffer from that.
> > >
> > > YES.
> > >
> > > > E.g if you want to do ARFS in the future. So it should a e.g a
> > > > container command for cvq instead of just for coalescing command
> > > > itself.
> > > >
> > > > We need to make sure if the existing facility is sufficient or not.
> > >
> > > We considered to update the generic ctrlq batch command. But so far w=
e
> > > have only seen
> > > this requirement for netdim and aRFS.
> >
> > Two use cases should be sufficient to justify.
> >
> > We do have others, for example the vlan/mac filters.
> >
> >
> > > At the same time, aRFS has not yet
> > > entered the community.
> > > We will try to add a batch req interface for it and it may have a
> > > dedicated flow vq to ensure that
> > > the number of command issuances larger than netdim is responded to in=
 time.
> > > So we temporarily plan to advance the batch of coalescing parameter
> > > requests first.
> >
> > Thanks
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

