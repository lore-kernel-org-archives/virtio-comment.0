Return-Path: <virtio-comment-return-6227-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F982C7EE25
	for <virtio-comment@archiver.kernel.org>; Thu,  8 Jun 2023 06:43:58 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 76B3242829
	for <virtio-comment@archiver.kernel.org>; Thu,  8 Jun 2023 06:43:57 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6035898666D
	for <virtio-comment@archiver.kernel.org>; Thu,  8 Jun 2023 06:43:57 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 50FB6986259; Thu,  8 Jun 2023 06:43:57 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3F71F986667
	for <virtio-comment@lists.oasis-open.org>; Thu,  8 Jun 2023 06:43:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: n45hKmw-PyKrSwte-NYKWg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686206634; x=1688798634;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rBtXUV/lsaxocGT8s9mm1/0fyVVG18SfHql/0eVtPEQ=;
        b=Qd1fwr2yLsUkLceu+H/QYKMPYpuGGSBerW7fWA3C2Df3907EjAyIzz2/hfoRTVzcmc
         zSBgLaAH9SWzo/MQvjCRwsj4TwZSqy3hpRskDl9C/PMgfHzcMHEBeA89t5sUO3N6lHZP
         vSZUMncrGocxVLem2KE6+QlXNcKLWIL3dV3vZ+6OPIOaE41H1xLtGUgY8w5JInsyXwrH
         Xn+1DGGCjDgWOL/p9amgD8nRLWIul5O/kRX0hMgZNGIcAFhob1es5IPzvAX3oMhAmVfY
         b9/qLBqH7HTYwiC5uNMvH+U5HUIoN22D9LbxvTj4EWfCD/wZEotuIFRO3uBZ4y8KebMn
         6vQQ==
X-Gm-Message-State: AC+VfDwvoUNMxlhXwbVqswJrQPNyYRkgqz2zIjBGwXJVYLoTqnMxblyF
	dBSlK4+TekC28kYrBita5GB762sr3x3AuGt8XTQloS1VNH3denvHJFF35oiAH3JLtRSnbYJaAPJ
	2B/DxRIi0QIVubNEvtlzxiCp13XAd92eA77J88CeItnELCi7p8g==
X-Received: by 2002:a81:4f44:0:b0:565:dafe:691b with SMTP id d65-20020a814f44000000b00565dafe691bmr9328277ywb.47.1686206634606;
        Wed, 07 Jun 2023 23:43:54 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7m/V/duX194Hu7Tl17OXotrQQsboWW9mSAy2GCjQXHda48F1ffEPmw5tYsnQtNRqmMi4HjpTSuj0GACos1+1A=
X-Received: by 2002:a81:4f44:0:b0:565:dafe:691b with SMTP id
 d65-20020a814f44000000b00565dafe691bmr9328261ywb.47.1686206634357; Wed, 07
 Jun 2023 23:43:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230606175511.2337208-1-eperezma@redhat.com> <20230606150920-mutt-send-email-mst@kernel.org>
 <CAJaqyWd2o+++24dF5ab44a_rCUpBTHNwgxd3tQAeJZyh09M+wg@mail.gmail.com>
 <1686126137.3070245-1-xuanzhuo@linux.alibaba.com> <CAJaqyWeA40JgZfaynT2S4B9JY-bwrz3Exs9iD98AUPYvsZBgpg@mail.gmail.com>
 <20230607045741-mutt-send-email-mst@kernel.org> <CAJaqyWfVN1i3F-m81=5=UMOq0ZEn=pU2SOO0QVmE4VjrHGit1w@mail.gmail.com>
 <20230607162529-mutt-send-email-mst@kernel.org> <CACGkMEsjJHOcx+D5V=oiQ25Efro-etADmbpDdDXS4Ufk5guoEA@mail.gmail.com>
 <20230608020335-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230608020335-mutt-send-email-mst@kernel.org>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Thu, 8 Jun 2023 08:43:18 +0200
Message-ID: <CAJaqyWfC0nhQJiwH4iuE_+L+55G=4=P_5HXwMVyGjeUJqa392Q@mail.gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	virtio-comment@lists.oasis-open.org, Laurent Vivier <lvivier@redhat.com>, 
	Cindy Lu <lulu@redhat.com>, cohuck@redhat.com, alvaro.karsz@solid-run.com, 
	Liuxiangdong <liuxiangdong5@huawei.com>, Gautam Dawar <gdawar@xilinx.com>, longpeng2@huawei.com, 
	Dragos Tatulea <dtatulea@nvidia.com>, parav@nvidia.com, stefanha@redhat.com, 
	Harpreet Singh Anand <hanand@xilinx.com>, Stefano Garzarella <sgarzare@redhat.com>, 
	Heng Qi <hengqi@linux.alibaba.com>, Zhu Lingshan <lingshan.zhu@intel.com>, 
	Shannon Nelson <snelson@pensando.io>, mgurtovoy@nvidia.com, si-wei.liu@oracle.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] Re: [PATCH 0/2] Selective queue enabling

On Thu, Jun 8, 2023 at 8:04=E2=80=AFAM Michael S. Tsirkin <mst@redhat.com> =
wrote:
>
> On Thu, Jun 08, 2023 at 08:44:41AM +0800, Jason Wang wrote:
> > On Thu, Jun 8, 2023 at 4:27=E2=80=AFAM Michael S. Tsirkin <mst@redhat.c=
om> wrote:
> > >
> > > On Wed, Jun 07, 2023 at 11:41:39AM +0200, Eugenio Perez Martin wrote:
> > > > On Wed, Jun 7, 2023 at 10:59=E2=80=AFAM Michael S. Tsirkin <mst@red=
hat.com> wrote:
> > > > >
> > > > > On Wed, Jun 07, 2023 at 10:47:12AM +0200, Eugenio Perez Martin wr=
ote:
> > > > > > On Wed, Jun 7, 2023 at 10:23=E2=80=AFAM Xuan Zhuo <xuanzhuo@lin=
ux.alibaba.com> wrote:
> > > > > > >
> > > > > > > On Wed, 7 Jun 2023 07:35:58 +0200, Eugenio Perez Martin <eper=
ezma@redhat.com> wrote:
> > > > > > > > On Tue, Jun 6, 2023 at 9:10=E2=80=AFPM Michael S. Tsirkin <=
mst@redhat.com> wrote:
> > > > > > > > >
> > > > > > > > > On Tue, Jun 06, 2023 at 07:55:09PM +0200, Eugenio P=C3=A9=
rez wrote:
> > > > > > > > > > This series allows the driver to start the device (as s=
et DRIVER_OK) with only
> > > > > > > > > > some queues enabled, and then enable another queues lat=
er.
> > > > > > > > > >
> > > > > > > > > > This is the current way to migrate net device state thr=
ough control
> > > > > > > > > > virtqueue, in a software assisted framework with vDPA:
> > > > > > > > > > * First, only net CVQ is enabled at DRIVER_OK
> > > > > > > > > > * All the control commands (mac address, mq, etc) neede=
d for the device
> > > > > > > > > > to behave the same as the source of migration are sent
> > > > > > > > > > * Finally all the dataplane queues are enabled.
> > > > > > > > >
> > > > > > > > > In my opinion, this is somewhat problematic. Specifically=
, currently
> > > > > > > > > devices tend to deduce how many queues are needed by look=
ing
> > > > > > > > > at the state at DRIVER_OK time.
> > > > > > > > >
> > > > > > > > > Question: what is wrong with enabling queues initially an=
d then
> > > > > > > > > doing a reset right after DRIVER_OK? You can even allocat=
e
> > > > > > > > > memory for just one queue (zeroing it out).
> > > > > > > > >
> > > > > > > > > Granted this looks kind of ugly but side-steps this probl=
em with
> > > > > > > > > no need for spec changes.
> > > > > > > > >
> > > > > > > >
> > > > > > > > The problem is that the rx queues can start receiving, as t=
he guest
> > > > > > > > already has buffers there.
> > > > > > >
> > > > > > > Can we reset the vq before filling buffers to it?
> > > > > > >
> > > > > >
> > > > > > They are passthrough from the guest so there is a window where =
the
> > > > > > device can process rx descriptors.
> > > > >
> > > > > Not if there are no descriptors there.
> > > > >
> > > >
> > > > But the migration is driven by the hypervisor, and it cannot contro=
l
> > > > that. The guest will likely have rx descriptors available.
> > >
> > > Maybe I misunderstand. Is hypervisor driving cvq while guest is drivi=
ng
> > > rx queues?
> >
> > No, hypervisor tries to restore virtqueue states via cvq before guest c=
an drive.
>
> So cvq maps to hypervisor memory?
>

From the device POV, yes, the CVQ vring is in hypervisor memory, not
in the guest's one. That allows the hypervisor to send the CVQ
commands to restore the device state in the destination, without the
guest intervention.

Data vqs, on the other hand, are passthrough. The device talks
directly to the guest's vrings.

Currently, this is done by emulating CVQ in the host's kernel and then
translating the commands in the way that suits better the vdpa device,
using its vendor vdpa driver in the host. Other methods like PASID are
possible too.

Thanks!

>
>
> > So in this case if RX queues are enabled at the same time, the device
> > may try to queue packets to queue 0.
> >
> > Thanks
> >
> > > How do you do this - they are DMA from same VF no?
> > >
> > >
> > > > >
> > > > > > > > Apart from that, the back and forth
> > > > > > > > introduces latencies.
> > > > > > > >
> > > > > > > > Maybe a better angle is to start all the queues as if they'=
re reset,
> > > > > > > > write 1 just to CVQ, configure the device, and then write 1=
 to all
> > > > > > > > dataplane vqs?
> > > > > > >
> > > > > > > write to what?
> > > > > > >
> > > > > >
> > > > > > Sorry I was unclear, I mean to enable the vqs writing 1 to queu=
e_enable.
> > > > > >
> > > > > > Thanks!
> > > > > >
> > > > > > > Thanks.
> > > > > > >
> > > > > > > >
> > > > > > > > Thanks!
> > > > > > > >
> > > > > > > > > > Eugenio P=C3=A9rez (2):
> > > > > > > > > >   virtio: introduce selective queue enabling
> > > > > > > > > >   virtio: pci support virtqueue selective enabling
> > > > > > > > > >
> > > > > > > > > >  content.tex       | 15 +++++++++++++--
> > > > > > > > > >  transport-pci.tex |  4 ++++
> > > > > > > > > >  2 files changed, 17 insertions(+), 2 deletions(-)
> > > > > > > > > >
> > > > > > > > > > --
> > > > > > > > > > 2.31.1
> > > > > > > > > >
> > > > > > > > >
> > > > > > > >
> > > > > > >
> > > > > > > This publicly archived list offers a means to provide input t=
o the
> > > > > > > OASIS Virtual I/O Device (VIRTIO) TC.
> > > > > > >
> > > > > > > In order to verify user consent to the Feedback License terms=
 and
> > > > > > > to minimize spam in the list archive, subscription is require=
d
> > > > > > > before posting.
> > > > > > >
> > > > > > > Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> > > > > > > Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> > > > > > > List help: virtio-comment-help@lists.oasis-open.org
> > > > > > > List archive: https://lists.oasis-open.org/archives/virtio-co=
mment/
> > > > > > > Feedback License: https://www.oasis-open.org/who/ipr/feedback=
_license.pdf
> > > > > > > List Guidelines: https://www.oasis-open.org/policies-guidelin=
es/mailing-lists
> > > > > > > Committee: https://www.oasis-open.org/committees/virtio/
> > > > > > > Join OASIS: https://www.oasis-open.org/join/
> > > > > > >
> > > > >
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

