Return-Path: <virtio-comment-return-6307-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D84AC7EE25
	for <virtio-comment@archiver.kernel.org>; Mon, 12 Jun 2023 07:57:38 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 9052A42C30
	for <virtio-comment@archiver.kernel.org>; Mon, 12 Jun 2023 07:57:37 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 856D5986521
	for <virtio-comment@archiver.kernel.org>; Mon, 12 Jun 2023 07:57:37 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 7365D983E8D; Mon, 12 Jun 2023 07:57:37 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 62AA7986468
	for <virtio-comment@lists.oasis-open.org>; Mon, 12 Jun 2023 07:57:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: skvlLTP2MpeL-8gyI2m60g-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686556654; x=1689148654;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5gsorpOcuvhMysqqnh+QbjFs6eHBYDwbw4ugqcGI+RQ=;
        b=lQz7q94CXNUJ0PW/8CdAbQ0pkwG0XI7CJJWwJSzqLKO3yT4lz4+Fb/Uxrw6tRX+DfX
         05YPVWGKg5m/uTc3CHyKWkO+0mfW9wTwJTmReJevaxZEc4ILLyzkjoDSpAUaTTsvZLHL
         PFG/utlMVw0DlEBqFvJLVwDUcCXet1tK5tfucSTtWcrWUYFzc7OxL/iMgclkH/qmlDfv
         bar/ChIZti4zxWmaje/4m2a1HG/D6YlSTbqNbFvi7jnn0Eaplp4eG2i9+E0rAlwWHT5h
         etNJyVemH7bssx/UWGhJrjCotZPcyCXez39qlEOZYMtiWOrLTRWXSTPU3mFtm2b63LPq
         5izA==
X-Gm-Message-State: AC+VfDzJd/7/K4cpQjW2nT9+tC1CJ8eUHHSDgNmjmuy2RucN3lNTlzfl
	ERwLYbqU4jJbeIGoT6a8JCQFsS7igVTdDrBtOtqFc77s6NwiXCk3F4r+XbUmocF72LOsJSeXQIW
	MjV3zFGz/fcbhcLmE7r35c+S5jZvc4cFLmSUW9YouJ9YAMLH7Jg==
X-Received: by 2002:a25:a186:0:b0:b9a:7df5:4f26 with SMTP id a6-20020a25a186000000b00b9a7df54f26mr7498789ybi.30.1686556654268;
        Mon, 12 Jun 2023 00:57:34 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ40ahPva14EcLXhr3BC8DnQeKJ5xQfMScaX+YIvj15mFGG8koM2PbvVfAHZIJyJUtdUE2f4JYtK2odAHlIP2VA=
X-Received: by 2002:a25:a186:0:b0:b9a:7df5:4f26 with SMTP id
 a6-20020a25a186000000b00b9a7df54f26mr7498780ybi.30.1686556653995; Mon, 12 Jun
 2023 00:57:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230607045741-mutt-send-email-mst@kernel.org>
 <CAJaqyWfVN1i3F-m81=5=UMOq0ZEn=pU2SOO0QVmE4VjrHGit1w@mail.gmail.com>
 <20230607162529-mutt-send-email-mst@kernel.org> <CACGkMEsjJHOcx+D5V=oiQ25Efro-etADmbpDdDXS4Ufk5guoEA@mail.gmail.com>
 <20230608020335-mutt-send-email-mst@kernel.org> <CAJaqyWfC0nhQJiwH4iuE_+L+55G=4=P_5HXwMVyGjeUJqa392Q@mail.gmail.com>
 <20230608031325-mutt-send-email-mst@kernel.org> <CAJaqyWf+vn06NHcQY208dwyB=WH3PQ3A7z53o0BTy102XrT+3Q@mail.gmail.com>
 <20230608180617-mutt-send-email-mst@kernel.org> <CAJaqyWf-=R+KHfBjzrGzkunTdeV8sAgFUv_kYoxNo3uqH2OOSw@mail.gmail.com>
 <20230609115250-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230609115250-mutt-send-email-mst@kernel.org>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 12 Jun 2023 09:56:57 +0200
Message-ID: <CAJaqyWfOONuDoewWR7VcsxYB34=m23GqTo2=sroUf-JvvQGJcg@mail.gmail.com>
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

On Fri, Jun 9, 2023 at 5:54=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com> =
wrote:
>
> On Fri, Jun 09, 2023 at 12:27:58PM +0200, Eugenio Perez Martin wrote:
> > On Fri, Jun 9, 2023 at 12:08=E2=80=AFAM Michael S. Tsirkin <mst@redhat.=
com> wrote:
> > >
> > > On Thu, Jun 08, 2023 at 10:36:19AM +0200, Eugenio Perez Martin wrote:
> > > > On Thu, Jun 8, 2023 at 9:19=E2=80=AFAM Michael S. Tsirkin <mst@redh=
at.com> wrote:
> > > > >
> > > > > On Thu, Jun 08, 2023 at 08:43:18AM +0200, Eugenio Perez Martin wr=
ote:
> > > > > > On Thu, Jun 8, 2023 at 8:04=E2=80=AFAM Michael S. Tsirkin <mst@=
redhat.com> wrote:
> > > > > > >
> > > > > > > On Thu, Jun 08, 2023 at 08:44:41AM +0800, Jason Wang wrote:
> > > > > > > > On Thu, Jun 8, 2023 at 4:27=E2=80=AFAM Michael S. Tsirkin <=
mst@redhat.com> wrote:
> > > > > > > > >
> > > > > > > > > On Wed, Jun 07, 2023 at 11:41:39AM +0200, Eugenio Perez M=
artin wrote:
> > > > > > > > > > On Wed, Jun 7, 2023 at 10:59=E2=80=AFAM Michael S. Tsir=
kin <mst@redhat.com> wrote:
> > > > > > > > > > >
> > > > > > > > > > > On Wed, Jun 07, 2023 at 10:47:12AM +0200, Eugenio Per=
ez Martin wrote:
> > > > > > > > > > > > On Wed, Jun 7, 2023 at 10:23=E2=80=AFAM Xuan Zhuo <=
xuanzhuo@linux.alibaba.com> wrote:
> > > > > > > > > > > > >
> > > > > > > > > > > > > On Wed, 7 Jun 2023 07:35:58 +0200, Eugenio Perez =
Martin <eperezma@redhat.com> wrote:
> > > > > > > > > > > > > > On Tue, Jun 6, 2023 at 9:10=E2=80=AFPM Michael =
S. Tsirkin <mst@redhat.com> wrote:
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > On Tue, Jun 06, 2023 at 07:55:09PM +0200, Eug=
enio P=C3=A9rez wrote:
> > > > > > > > > > > > > > > > This series allows the driver to start the =
device (as set DRIVER_OK) with only
> > > > > > > > > > > > > > > > some queues enabled, and then enable anothe=
r queues later.
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > This is the current way to migrate net devi=
ce state through control
> > > > > > > > > > > > > > > > virtqueue, in a software assisted framework=
 with vDPA:
> > > > > > > > > > > > > > > > * First, only net CVQ is enabled at DRIVER_=
OK
> > > > > > > > > > > > > > > > * All the control commands (mac address, mq=
, etc) needed for the device
> > > > > > > > > > > > > > > > to behave the same as the source of migrati=
on are sent
> > > > > > > > > > > > > > > > * Finally all the dataplane queues are enab=
led.
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > In my opinion, this is somewhat problematic. =
Specifically, currently
> > > > > > > > > > > > > > > devices tend to deduce how many queues are ne=
eded by looking
> > > > > > > > > > > > > > > at the state at DRIVER_OK time.
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > Question: what is wrong with enabling queues =
initially and then
> > > > > > > > > > > > > > > doing a reset right after DRIVER_OK? You can =
even allocate
> > > > > > > > > > > > > > > memory for just one queue (zeroing it out).
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > Granted this looks kind of ugly but side-step=
s this problem with
> > > > > > > > > > > > > > > no need for spec changes.
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > The problem is that the rx queues can start rec=
eiving, as the guest
> > > > > > > > > > > > > > already has buffers there.
> > > > > > > > > > > > >
> > > > > > > > > > > > > Can we reset the vq before filling buffers to it?
> > > > > > > > > > > > >
> > > > > > > > > > > >
> > > > > > > > > > > > They are passthrough from the guest so there is a w=
indow where the
> > > > > > > > > > > > device can process rx descriptors.
> > > > > > > > > > >
> > > > > > > > > > > Not if there are no descriptors there.
> > > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > But the migration is driven by the hypervisor, and it c=
annot control
> > > > > > > > > > that. The guest will likely have rx descriptors availab=
le.
> > > > > > > > >
> > > > > > > > > Maybe I misunderstand. Is hypervisor driving cvq while gu=
est is driving
> > > > > > > > > rx queues?
> > > > > > > >
> > > > > > > > No, hypervisor tries to restore virtqueue states via cvq be=
fore guest can drive.
> > > > > > >
> > > > > > > So cvq maps to hypervisor memory?
> > > > > > >
> > > > > >
> > > > > > >From the device POV, yes, the CVQ vring is in hypervisor memor=
y, not
> > > > > > in the guest's one. That allows the hypervisor to send the CVQ
> > > > > > commands to restore the device state in the destination, withou=
t the
> > > > > > guest intervention.
> > > > > >
> > > > > > Data vqs, on the other hand, are passthrough. The device talks
> > > > > > directly to the guest's vrings.
> > > > > >
> > > > > > Currently, this is done by emulating CVQ in the host's kernel a=
nd then
> > > > > > translating the commands in the way that suits better the vdpa =
device,
> > > > > > using its vendor vdpa driver in the host. Other methods like PA=
SID are
> > > > > > possible too.
> > > > > >
> > > > > > Thanks!
> > > > >
> > > > > OK. So my suggestion is simple: map data vrings to a zero page in
> > > > > hypervisor memory initially. Later reset and map to guest.
> > > > >
> > > >
> > > > The idea is interesting, but we lose the net configuration in a dev=
ice
> > > > reset, so we need to send it again.
> > >
> > > Ring reset, not device reset.
> > >
> > > > In the case of qemu+vDPA maybe it is possible with queue_reset, lik=
e:
> > > > * Map all the guest pages as usual.
> > > > * Map a new zero page, forbid the guest to write on that page. Even=
 in
> > > > vIOMMU case, we can send all the CVQ commands before allowing the
> > > > guest to modify mappings. The guest has no way to write on that pag=
e
> > > > through the device as, well, dataplane is not initialized. It's the
> > > > way DPDK shadow virtqueues worked, so it should be valid.
> > > > * Reset the queues to the guest passthrough.
> > > >
> > > > I don't like the complexity of it but I like it does require even l=
ess
> > > > changes to the device / spec.
> > >
> > > This is exactly what I meant.
> > >
> >
> > Ok, sorry for the misunderstanding.
> >
> > Another drawback of that is the long time a device can spend to
> > reconfigure its memory maps.
>
> The map is already used for cvq though, I don't see why it would take
> much more with this.
>

In the case of vDPA HW, CVQ maps may not need to reach the device's or
platform IOMMU, so the modification of that mapping is way cheaper.

> > taking that into account, does it make
> > sense to send a new version with the bit 1 on enable?
> >
> > Thanks!
>
> Current hardware won't support the extra bit though.
>
> > > > >
> > > > > If that does not work, then I am not sure this proposal is enough
> > > > > since I think devices want to have a specific point in time
> > > > > where they know which queues are going to be used.
> > > >
> > > > In the case of net, this should not be a problem since the spec
> > > > mandates 2 if !cvq, 3 if cvq but !mq, and max_virtqueue_pairs*2+1 i=
f
> > > > cvq and mq. virtio-blk also has num_queues.
> > >
> > > This is max, not how many there are in practice.
> > >
> > > > Is it even valid to not enable some of the queues?
> > >
> > > Yes and linux will do that if max_virtqueue_pairs > #CPUs.
> > >
> > > > I've always felt that queue_enable has been redundant before
> > > > queue_reset for this reason actually.
> > > >
> > > > > Maybe we could use e.g. bit 1 in queue_enable to signal that?
> > > > >
> > > >
> > > > I'm totally ok to go in that direction.
> > > >
> > > > Thanks!
> > > >
> > > > >
> > > > > > >
> > > > > > >
> > > > > > > > So in this case if RX queues are enabled at the same time, =
the device
> > > > > > > > may try to queue packets to queue 0.
> > > > > > > >
> > > > > > > > Thanks
> > > > > > > >
> > > > > > > > > How do you do this - they are DMA from same VF no?
> > > > > > > > >
> > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > > > > Apart from that, the back and forth
> > > > > > > > > > > > > > introduces latencies.
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > Maybe a better angle is to start all the queues=
 as if they're reset,
> > > > > > > > > > > > > > write 1 just to CVQ, configure the device, and =
then write 1 to all
> > > > > > > > > > > > > > dataplane vqs?
> > > > > > > > > > > > >
> > > > > > > > > > > > > write to what?
> > > > > > > > > > > > >
> > > > > > > > > > > >
> > > > > > > > > > > > Sorry I was unclear, I mean to enable the vqs writi=
ng 1 to queue_enable.
> > > > > > > > > > > >
> > > > > > > > > > > > Thanks!
> > > > > > > > > > > >
> > > > > > > > > > > > > Thanks.
> > > > > > > > > > > > >
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > Thanks!
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > Eugenio P=C3=A9rez (2):
> > > > > > > > > > > > > > > >   virtio: introduce selective queue enablin=
g
> > > > > > > > > > > > > > > >   virtio: pci support virtqueue selective e=
nabling
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > >  content.tex       | 15 +++++++++++++--
> > > > > > > > > > > > > > > >  transport-pci.tex |  4 ++++
> > > > > > > > > > > > > > > >  2 files changed, 17 insertions(+), 2 delet=
ions(-)
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > --
> > > > > > > > > > > > > > > > 2.31.1
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > >
> > > > > > > > > > > > >
> > > > > > > > > > > > > This publicly archived list offers a means to pro=
vide input to the
> > > > > > > > > > > > > OASIS Virtual I/O Device (VIRTIO) TC.
> > > > > > > > > > > > >
> > > > > > > > > > > > > In order to verify user consent to the Feedback L=
icense terms and
> > > > > > > > > > > > > to minimize spam in the list archive, subscriptio=
n is required
> > > > > > > > > > > > > before posting.
> > > > > > > > > > > > >
> > > > > > > > > > > > > Subscribe: virtio-comment-subscribe@lists.oasis-o=
pen.org
> > > > > > > > > > > > > Unsubscribe: virtio-comment-unsubscribe@lists.oas=
is-open.org
> > > > > > > > > > > > > List help: virtio-comment-help@lists.oasis-open.o=
rg
> > > > > > > > > > > > > List archive: https://lists.oasis-open.org/archiv=
es/virtio-comment/
> > > > > > > > > > > > > Feedback License: https://www.oasis-open.org/who/=
ipr/feedback_license.pdf
> > > > > > > > > > > > > List Guidelines: https://www.oasis-open.org/polic=
ies-guidelines/mailing-lists
> > > > > > > > > > > > > Committee: https://www.oasis-open.org/committees/=
virtio/
> > > > > > > > > > > > > Join OASIS: https://www.oasis-open.org/join/
> > > > > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > >
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

