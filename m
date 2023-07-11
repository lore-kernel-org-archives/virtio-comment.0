Return-Path: <virtio-comment-return-6818-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B5D5EB64D9
	for <virtio-comment@archiver.kernel.org>; Tue, 11 Jul 2023 03:09:03 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id B65852B058
	for <virtio-comment@archiver.kernel.org>; Tue, 11 Jul 2023 03:09:02 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 92B25986572
	for <virtio-comment@archiver.kernel.org>; Tue, 11 Jul 2023 03:09:02 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 7A71298408C; Tue, 11 Jul 2023 03:09:02 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 41846986503
	for <virtio-comment@lists.oasis-open.org>; Tue, 11 Jul 2023 03:09:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: evIeToJbM7u7ajkh2ZPjlA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689044938; x=1691636938;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3GsBqFpuCxP0bVJPTGOSXG4cTooECA6SJGyfeCWZGfw=;
        b=LnThRIxy7KThjKQg+HOMYQdJkW67ZyMmoee20sg+pAgL0J2SKGB0JnfIwDK7HLnm5m
         gjRfAiMI5efzjmK+SI8v9R15wRX/nQHN2Kv+nscMF+T2iDzNoglI8hlm7Y2S52gUIffB
         q8crRq4FAMpQQB4J8UzfZeyYRE5XgPOrWoh3InfP600f0NeZZMG+L5UcBH2aRcvDSuIv
         MCOR9rb1Oe5NETQdvRinyxZsbT9mzb6P1tOcK2xGCQg856jH+nHgkqbTW/WgP2qpOg1t
         ++Km8oFy9gJOaK5+H1tLFD9/t3nyjA8ExTN+9SmDFq7SvzOznTdTYj7DV7PhV7SBJxra
         6kDQ==
X-Gm-Message-State: ABy/qLZSvcQgKcH6Af7VOldYtYZqrEh8cMkEyNnmvXaVf3W3WNTkH/0i
	SmUPFY2ECR76uRjTJYTH6Zj+hkFM82HmFaX5V5BvHYyIbUJMBBNvuIyYiwwJVCywAbsVpGLam21
	ahH4TZ7EWO1/YApGeIXRsevnACpO0Ruz2FMmbasQXRilYQf2wXw==
X-Received: by 2002:a2e:98c7:0:b0:2b6:c349:e276 with SMTP id s7-20020a2e98c7000000b002b6c349e276mr13813453ljj.20.1689044937918;
        Mon, 10 Jul 2023 20:08:57 -0700 (PDT)
X-Google-Smtp-Source: APBJJlExz4OAB6n6bv2IoP6e7pGz3BgJM++whj4yBdiPf4W/eHT0R2WnJNY6ZwTdobYJFNITpBXi5HUIkG1ITFj1SE4=
X-Received: by 2002:a2e:98c7:0:b0:2b6:c349:e276 with SMTP id
 s7-20020a2e98c7000000b002b6c349e276mr13813431ljj.20.1689044937625; Mon, 10
 Jul 2023 20:08:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230606175511.2337208-1-eperezma@redhat.com> <CAJaqyWe6nR_5bAfuqBfDJY8T-OPfHcjoYbXMyEQEEgL5Oko8WQ@mail.gmail.com>
 <CACGkMEub3RmrXfagZk9CH1t9r=-vaVu6anqEREqw4nphh9PxPQ@mail.gmail.com> <20230710014740-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230710014740-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 11 Jul 2023 11:08:46 +0800
Message-ID: <CACGkMEuMESh9FLZVuz0epFOkxpW+8VVzPsx+4TQ0T=PWJzU5rw@mail.gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Eugenio Perez Martin <eperezma@redhat.com>, virtio-comment@lists.oasis-open.org, 
	Laurent Vivier <lvivier@redhat.com>, Cindy Lu <lulu@redhat.com>, cohuck@redhat.com, 
	alvaro.karsz@solid-run.com, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	Liuxiangdong <liuxiangdong5@huawei.com>, Gautam Dawar <gdawar@xilinx.com>, longpeng2@huawei.com, 
	Dragos Tatulea <dtatulea@nvidia.com>, parav@nvidia.com, stefanha@redhat.com, 
	Harpreet Singh Anand <hanand@xilinx.com>, Stefano Garzarella <sgarzare@redhat.com>, 
	Heng Qi <hengqi@linux.alibaba.com>, Zhu Lingshan <lingshan.zhu@intel.com>, 
	Shannon Nelson <snelson@pensando.io>, mgurtovoy@nvidia.com, si-wei.liu@oracle.com, 
	Yan Vugenfirer <yvugenfi@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] [PATCH 0/2] Selective queue enabling

On Mon, Jul 10, 2023 at 1:49=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com>=
 wrote:
>
> On Mon, Jul 10, 2023 at 11:55:50AM +0800, Jason Wang wrote:
> > On Fri, Jul 7, 2023 at 2:19=E2=80=AFAM Eugenio Perez Martin <eperezma@r=
edhat.com> wrote:
> > >
> > > On Tue, Jun 6, 2023 at 7:55=E2=80=AFPM Eugenio P=C3=A9rez <eperezma@r=
edhat.com> wrote:
> > > >
> > > > This series allows the driver to start the device (as set DRIVER_OK=
) with only
> > > > some queues enabled, and then enable another queues later.
> > > >
> > > > This is the current way to migrate net device state through control
> > > > virtqueue, in a software assisted framework with vDPA:
> > > > * First, only net CVQ is enabled at DRIVER_OK
> > > > * All the control commands (mac address, mq, etc) needed for the de=
vice
> > > > to behave the same as the source of migration are sent
> > > > * Finally all the dataplane queues are enabled.
> > > >
> > >
> > > Adding Yan to the thread, who mentioned that he is looking for
> > > something similar in the virtio-networking upstream meeting.
> >
> > Would there be a V2?
> >
> > Thanks
>
> I'm not sure we need to bother at this point. In linux
> we seem to have agreed to use a mix of RING_RESET and
> a vdpa specific thing.

The question is:

1) This proposal is pretty compact and self contained
2) Some vDPA device and vhost devices already behave like this
3) Using RING_RESET requires a lot of codes and tricks

This makes me wonder if this proposal is still the better way to go.

Thanks

> Non-vdpa solutions don't seem to
> need this.
> Right Parav?
>
> > >
> > > > Eugenio P=C3=A9rez (2):
> > > >   virtio: introduce selective queue enabling
> > > >   virtio: pci support virtqueue selective enabling
> > > >
> > > >  content.tex       | 15 +++++++++++++--
> > > >  transport-pci.tex |  4 ++++
> > > >  2 files changed, 17 insertions(+), 2 deletions(-)
> > > >
> > > > --
> > > > 2.31.1
> > > >
> > > >
> > > >
> > > > This publicly archived list offers a means to provide input to the
> > > > OASIS Virtual I/O Device (VIRTIO) TC.
> > > >
> > > > In order to verify user consent to the Feedback License terms and
> > > > to minimize spam in the list archive, subscription is required
> > > > before posting.
> > > >
> > > > Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> > > > Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> > > > List help: virtio-comment-help@lists.oasis-open.org
> > > > List archive: https://lists.oasis-open.org/archives/virtio-comment/
> > > > Feedback License: https://www.oasis-open.org/who/ipr/feedback_licen=
se.pdf
> > > > List Guidelines: https://www.oasis-open.org/policies-guidelines/mai=
ling-lists
> > > > Committee: https://www.oasis-open.org/committees/virtio/
> > > > Join OASIS: https://www.oasis-open.org/join/
> > > >
> > >
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

