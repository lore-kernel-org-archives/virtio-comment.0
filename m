Return-Path: <virtio-comment-return-6215-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C54EC7EE2E
	for <virtio-comment@archiver.kernel.org>; Wed,  7 Jun 2023 09:42:20 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 5C0462CAD1
	for <virtio-comment@archiver.kernel.org>; Wed,  7 Jun 2023 09:42:19 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 461E9986656
	for <virtio-comment@archiver.kernel.org>; Wed,  7 Jun 2023 09:42:19 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 32874986243; Wed,  7 Jun 2023 09:42:19 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1ED5B98664F
	for <virtio-comment@lists.oasis-open.org>; Wed,  7 Jun 2023 09:42:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: C-5halY0NKmKRMu-sIAVYQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686130936; x=1688722936;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZLYPND3uQ++WbVpWrIkoH791BRdePV+RO+y3KrXrrmA=;
        b=aqjjy2h4s8rNywVlhgF/yxN84Q0YdqpKbJWt61aGXjFBJ0MrIaJDX1agWtwQQwH8jV
         zH9R8eK/78X9O5z/Tek+h3byBogy05btzgDrp4hB68vhm46NCnXd/JYrvYZ3giwo3IXu
         ssrkFd9+CLnfi7tjiWtB4fq6BlF1v/osmCo2qDoUW48qq1dtzKdHQF7cR3CimPs15L3Y
         3tGVQlNB57CtFL5fhvZ65TsDvCMwykanpzXmSj3NDINhbSLIIbC1TZSpiNgPS9kZtsB/
         keIeR6wN8Kr77IMCR89M/5FpGxF9x0WbSdOs2nDw//a/a+3VeEzp6iBHZGyxE9v5UHnj
         ZqOw==
X-Gm-Message-State: AC+VfDz+VGoO36k+V3eUhme+Goakdr/xaG9JVBd4naPtp2jBAI2n+yIr
	pC4AqSCtPlUMJ0Y1gAy5xvqQ7MvBxYGVIaTjWy1iknu5Xduwe0qMYDklrSCOAMabvYhCSIQAPLY
	ky2r6OzmbXHebx+N0k/W7owJNCXPF+rIB+dNB3MTG7wzyC55rrw==
X-Received: by 2002:a25:9bc3:0:b0:ba7:4c49:95e with SMTP id w3-20020a259bc3000000b00ba74c49095emr5842539ybo.7.1686130936323;
        Wed, 07 Jun 2023 02:42:16 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5qiTVq2yVXKhQqJ/AIZ5D/XYGmmLfP3HC323RkCRT2kO31RTnmE/lB+WBwxk3klN+JI8DQNhWAqpvFboMO0ko=
X-Received: by 2002:a25:9bc3:0:b0:ba7:4c49:95e with SMTP id
 w3-20020a259bc3000000b00ba74c49095emr5842519ybo.7.1686130936045; Wed, 07 Jun
 2023 02:42:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230606175511.2337208-1-eperezma@redhat.com> <20230606150920-mutt-send-email-mst@kernel.org>
 <CAJaqyWd2o+++24dF5ab44a_rCUpBTHNwgxd3tQAeJZyh09M+wg@mail.gmail.com>
 <1686126137.3070245-1-xuanzhuo@linux.alibaba.com> <CAJaqyWeA40JgZfaynT2S4B9JY-bwrz3Exs9iD98AUPYvsZBgpg@mail.gmail.com>
 <20230607045741-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230607045741-mutt-send-email-mst@kernel.org>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Wed, 7 Jun 2023 11:41:39 +0200
Message-ID: <CAJaqyWfVN1i3F-m81=5=UMOq0ZEn=pU2SOO0QVmE4VjrHGit1w@mail.gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Xuan Zhuo <xuanzhuo@linux.alibaba.com>, virtio-comment@lists.oasis-open.org, 
	Laurent Vivier <lvivier@redhat.com>, Cindy Lu <lulu@redhat.com>, cohuck@redhat.com, 
	alvaro.karsz@solid-run.com, Liuxiangdong <liuxiangdong5@huawei.com>, 
	Gautam Dawar <gdawar@xilinx.com>, longpeng2@huawei.com, 
	Dragos Tatulea <dtatulea@nvidia.com>, parav@nvidia.com, stefanha@redhat.com, 
	Harpreet Singh Anand <hanand@xilinx.com>, Stefano Garzarella <sgarzare@redhat.com>, 
	Heng Qi <hengqi@linux.alibaba.com>, jasowang@redhat.com, 
	Zhu Lingshan <lingshan.zhu@intel.com>, Shannon Nelson <snelson@pensando.io>, mgurtovoy@nvidia.com, 
	si-wei.liu@oracle.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] Re: [PATCH 0/2] Selective queue enabling

On Wed, Jun 7, 2023 at 10:59=E2=80=AFAM Michael S. Tsirkin <mst@redhat.com>=
 wrote:
>
> On Wed, Jun 07, 2023 at 10:47:12AM +0200, Eugenio Perez Martin wrote:
> > On Wed, Jun 7, 2023 at 10:23=E2=80=AFAM Xuan Zhuo <xuanzhuo@linux.aliba=
ba.com> wrote:
> > >
> > > On Wed, 7 Jun 2023 07:35:58 +0200, Eugenio Perez Martin <eperezma@red=
hat.com> wrote:
> > > > On Tue, Jun 6, 2023 at 9:10=E2=80=AFPM Michael S. Tsirkin <mst@redh=
at.com> wrote:
> > > > >
> > > > > On Tue, Jun 06, 2023 at 07:55:09PM +0200, Eugenio P=C3=A9rez wrot=
e:
> > > > > > This series allows the driver to start the device (as set DRIVE=
R_OK) with only
> > > > > > some queues enabled, and then enable another queues later.
> > > > > >
> > > > > > This is the current way to migrate net device state through con=
trol
> > > > > > virtqueue, in a software assisted framework with vDPA:
> > > > > > * First, only net CVQ is enabled at DRIVER_OK
> > > > > > * All the control commands (mac address, mq, etc) needed for th=
e device
> > > > > > to behave the same as the source of migration are sent
> > > > > > * Finally all the dataplane queues are enabled.
> > > > >
> > > > > In my opinion, this is somewhat problematic. Specifically, curren=
tly
> > > > > devices tend to deduce how many queues are needed by looking
> > > > > at the state at DRIVER_OK time.
> > > > >
> > > > > Question: what is wrong with enabling queues initially and then
> > > > > doing a reset right after DRIVER_OK? You can even allocate
> > > > > memory for just one queue (zeroing it out).
> > > > >
> > > > > Granted this looks kind of ugly but side-steps this problem with
> > > > > no need for spec changes.
> > > > >
> > > >
> > > > The problem is that the rx queues can start receiving, as the guest
> > > > already has buffers there.
> > >
> > > Can we reset the vq before filling buffers to it?
> > >
> >
> > They are passthrough from the guest so there is a window where the
> > device can process rx descriptors.
>
> Not if there are no descriptors there.
>

But the migration is driven by the hypervisor, and it cannot control
that. The guest will likely have rx descriptors available.

>
> > > > Apart from that, the back and forth
> > > > introduces latencies.
> > > >
> > > > Maybe a better angle is to start all the queues as if they're reset=
,
> > > > write 1 just to CVQ, configure the device, and then write 1 to all
> > > > dataplane vqs?
> > >
> > > write to what?
> > >
> >
> > Sorry I was unclear, I mean to enable the vqs writing 1 to queue_enable=
.
> >
> > Thanks!
> >
> > > Thanks.
> > >
> > > >
> > > > Thanks!
> > > >
> > > > > > Eugenio P=C3=A9rez (2):
> > > > > >   virtio: introduce selective queue enabling
> > > > > >   virtio: pci support virtqueue selective enabling
> > > > > >
> > > > > >  content.tex       | 15 +++++++++++++--
> > > > > >  transport-pci.tex |  4 ++++
> > > > > >  2 files changed, 17 insertions(+), 2 deletions(-)
> > > > > >
> > > > > > --
> > > > > > 2.31.1
> > > > > >
> > > > >
> > > >
> > >
> > > This publicly archived list offers a means to provide input to the
> > > OASIS Virtual I/O Device (VIRTIO) TC.
> > >
> > > In order to verify user consent to the Feedback License terms and
> > > to minimize spam in the list archive, subscription is required
> > > before posting.
> > >
> > > Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> > > Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> > > List help: virtio-comment-help@lists.oasis-open.org
> > > List archive: https://lists.oasis-open.org/archives/virtio-comment/
> > > Feedback License: https://www.oasis-open.org/who/ipr/feedback_license=
.pdf
> > > List Guidelines: https://www.oasis-open.org/policies-guidelines/maili=
ng-lists
> > > Committee: https://www.oasis-open.org/committees/virtio/
> > > Join OASIS: https://www.oasis-open.org/join/
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

