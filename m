Return-Path: <virtio-comment-return-6206-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEAADC7EE29
	for <virtio-comment@archiver.kernel.org>; Wed,  7 Jun 2023 08:23:37 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id F141E41EEA
	for <virtio-comment@archiver.kernel.org>; Wed,  7 Jun 2023 08:23:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CD552986660
	for <virtio-comment@archiver.kernel.org>; Wed,  7 Jun 2023 08:23:36 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id AD61398664A; Wed,  7 Jun 2023 08:23:36 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9AA9D98664C
	for <virtio-comment@lists.oasis-open.org>; Wed,  7 Jun 2023 08:23:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R111e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046049;MF=xuanzhuo@linux.alibaba.com;NM=1;PH=DS;RN=21;SR=0;TI=SMTPD_---0VkZriJY_1686126211;
Message-ID: <1686126137.3070245-1-xuanzhuo@linux.alibaba.com>
Date: Wed, 7 Jun 2023 16:22:17 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: virtio-comment@lists.oasis-open.org,
 Laurent Vivier <lvivier@redhat.com>,
 Cindy Lu <lulu@redhat.com>,
 cohuck@redhat.com,
 alvaro.karsz@solid-run.com,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Gautam Dawar <gdawar@xilinx.com>,
 longpeng2@huawei.com,
 Dragos Tatulea <dtatulea@nvidia.com>,
 parav@nvidia.com,
 stefanha@redhat.com,
 Harpreet Singh Anand <hanand@xilinx.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Heng Qi <hengqi@linux.alibaba.com>,
 jasowang@redhat.com,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 Shannon Nelson <snelson@pensando.io>,
 mgurtovoy@nvidia.com,
 si-wei.liu@oracle.com,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20230606175511.2337208-1-eperezma@redhat.com>
 <20230606150920-mutt-send-email-mst@kernel.org>
 <CAJaqyWd2o+++24dF5ab44a_rCUpBTHNwgxd3tQAeJZyh09M+wg@mail.gmail.com>
In-Reply-To: <CAJaqyWd2o+++24dF5ab44a_rCUpBTHNwgxd3tQAeJZyh09M+wg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: [virtio-comment] Re: [PATCH 0/2] Selective queue enabling

On Wed, 7 Jun 2023 07:35:58 +0200, Eugenio Perez Martin <eperezma@redhat.co=
m> wrote:
> On Tue, Jun 6, 2023 at 9:10=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com=
> wrote:
> >
> > On Tue, Jun 06, 2023 at 07:55:09PM +0200, Eugenio P=C3=A9rez wrote:
> > > This series allows the driver to start the device (as set DRIVER_OK) =
with only
> > > some queues enabled, and then enable another queues later.
> > >
> > > This is the current way to migrate net device state through control
> > > virtqueue, in a software assisted framework with vDPA:
> > > * First, only net CVQ is enabled at DRIVER_OK
> > > * All the control commands (mac address, mq, etc) needed for the devi=
ce
> > > to behave the same as the source of migration are sent
> > > * Finally all the dataplane queues are enabled.
> >
> > In my opinion, this is somewhat problematic. Specifically, currently
> > devices tend to deduce how many queues are needed by looking
> > at the state at DRIVER_OK time.
> >
> > Question: what is wrong with enabling queues initially and then
> > doing a reset right after DRIVER_OK? You can even allocate
> > memory for just one queue (zeroing it out).
> >
> > Granted this looks kind of ugly but side-steps this problem with
> > no need for spec changes.
> >
>
> The problem is that the rx queues can start receiving, as the guest
> already has buffers there.

Can we reset the vq before filling buffers to it?

> Apart from that, the back and forth
> introduces latencies.
>
> Maybe a better angle is to start all the queues as if they're reset,
> write 1 just to CVQ, configure the device, and then write 1 to all
> dataplane vqs?

write to what?

Thanks.

>
> Thanks!
>
> > > Eugenio P=C3=A9rez (2):
> > >   virtio: introduce selective queue enabling
> > >   virtio: pci support virtqueue selective enabling
> > >
> > >  content.tex       | 15 +++++++++++++--
> > >  transport-pci.tex |  4 ++++
> > >  2 files changed, 17 insertions(+), 2 deletions(-)
> > >
> > > --
> > > 2.31.1
> > >
> >
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

