Return-Path: <virtio-comment-return-6231-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6946BC7EE23
	for <virtio-comment@archiver.kernel.org>; Thu,  8 Jun 2023 08:37:00 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 875902B00D
	for <virtio-comment@archiver.kernel.org>; Thu,  8 Jun 2023 08:36:59 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6FAAC986668
	for <virtio-comment@archiver.kernel.org>; Thu,  8 Jun 2023 08:36:59 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 5F103986259; Thu,  8 Jun 2023 08:36:59 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4B7E5986667
	for <virtio-comment@lists.oasis-open.org>; Thu,  8 Jun 2023 08:36:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: CEsQraxFPiSvuPNLiSfCnw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686213416; x=1688805416;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=udXGMdDMJGeMCRFR3UmaROJ1zQ75XColJ0r0Y30Vt1k=;
        b=jF504UuM7gbb7rOIeTREvsU3rkkRiDB1yESg8f99/FpHw3UJ6cuJNnzkUA7D4HauGs
         rhPlLAGexNFWS8gx/sIOuysqU6pIeaZ3HnXkbW124tBexXG+F7vb8VGZKpydsc5u5dw+
         HJlPR5jDLUDVL+0KViA2w2P1I4XPxxSiFl/CZO4yp5dDNAPo97bbBlfV/6HpHo0xAGmO
         glyoKp4k6bKz5b0Sewr60VTYEkEZsEK9bfSV4cCZM4qXLgxCZ8280bjMR5fbUl/wKTA2
         gb8ZZld5YymQwbn8chITpc+/Q1L2zDMWlAHzc0zNBnncuSEWzO5jdRe1OXZ/1XwoO7eH
         3pcQ==
X-Gm-Message-State: AC+VfDwcqUOJ9F865zZjTpDmdr16g1nWWoObJ1vWph81DIHKZ2f5ijdx
	tMA5scC46a6u2NWi9AViWi6KuK/ygs9dgeAcWBOXk/ML+mv9MJ2kNb1bXhHytxfvBhNc4ybLN4I
	e+flos7xCV9kTjR6oIu46jmqV+UejWgZuXwGD6eW+TfHNdPH4sA==
X-Received: by 2002:a05:620a:3f43:b0:75d:50fa:4fb8 with SMTP id ty3-20020a05620a3f4300b0075d50fa4fb8mr4458656qkn.17.1686213416354;
        Thu, 08 Jun 2023 01:36:56 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4m4W90V3ww0OXFGC7gvV2qrfyuxUrdF2UAlRbfJBsVs70/D9Di9F+rvGjdoElpGXyZQCaGggxWB2p0WJHeAts=
X-Received: by 2002:a05:620a:3f43:b0:75d:50fa:4fb8 with SMTP id
 ty3-20020a05620a3f4300b0075d50fa4fb8mr4458644qkn.17.1686213416114; Thu, 08
 Jun 2023 01:36:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230606150920-mutt-send-email-mst@kernel.org>
 <CAJaqyWd2o+++24dF5ab44a_rCUpBTHNwgxd3tQAeJZyh09M+wg@mail.gmail.com>
 <1686126137.3070245-1-xuanzhuo@linux.alibaba.com> <CAJaqyWeA40JgZfaynT2S4B9JY-bwrz3Exs9iD98AUPYvsZBgpg@mail.gmail.com>
 <20230607045741-mutt-send-email-mst@kernel.org> <CAJaqyWfVN1i3F-m81=5=UMOq0ZEn=pU2SOO0QVmE4VjrHGit1w@mail.gmail.com>
 <20230607162529-mutt-send-email-mst@kernel.org> <CACGkMEsjJHOcx+D5V=oiQ25Efro-etADmbpDdDXS4Ufk5guoEA@mail.gmail.com>
 <20230608020335-mutt-send-email-mst@kernel.org> <CAJaqyWfC0nhQJiwH4iuE_+L+55G=4=P_5HXwMVyGjeUJqa392Q@mail.gmail.com>
 <20230608031325-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230608031325-mutt-send-email-mst@kernel.org>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Thu, 8 Jun 2023 10:36:19 +0200
Message-ID: <CAJaqyWf+vn06NHcQY208dwyB=WH3PQ3A7z53o0BTy102XrT+3Q@mail.gmail.com>
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

On Thu, Jun 8, 2023 at 9:19=E2=80=AFAM Michael S. Tsirkin <mst@redhat.com> =
wrote:
>
> On Thu, Jun 08, 2023 at 08:43:18AM +0200, Eugenio Perez Martin wrote:
> > On Thu, Jun 8, 2023 at 8:04=E2=80=AFAM Michael S. Tsirkin <mst@redhat.c=
om> wrote:
> > >
> > > On Thu, Jun 08, 2023 at 08:44:41AM +0800, Jason Wang wrote:
> > > > On Thu, Jun 8, 2023 at 4:27=E2=80=AFAM Michael S. Tsirkin <mst@redh=
at.com> wrote:
> > > > >
> > > > > On Wed, Jun 07, 2023 at 11:41:39AM +0200, Eugenio Perez Martin wr=
ote:
> > > > > > On Wed, Jun 7, 2023 at 10:59=E2=80=AFAM Michael S. Tsirkin <mst=
@redhat.com> wrote:
> > > > > > >
> > > > > > > On Wed, Jun 07, 2023 at 10:47:12AM +0200, Eugenio Perez Marti=
n wrote:
> > > > > > > > On Wed, Jun 7, 2023 at 10:23=E2=80=AFAM Xuan Zhuo <xuanzhuo=
@linux.alibaba.com> wrote:
> > > > > > > > >
> > > > > > > > > On Wed, 7 Jun 2023 07:35:58 +0200, Eugenio Perez Martin <=
eperezma@redhat.com> wrote:
> > > > > > > > > > On Tue, Jun 6, 2023 at 9:10=E2=80=AFPM Michael S. Tsirk=
in <mst@redhat.com> wrote:
> > > > > > > > > > >
> > > > > > > > > > > On Tue, Jun 06, 2023 at 07:55:09PM +0200, Eugenio P=
=C3=A9rez wrote:
> > > > > > > > > > > > This series allows the driver to start the device (=
as set DRIVER_OK) with only
> > > > > > > > > > > > some queues enabled, and then enable another queues=
 later.
> > > > > > > > > > > >
> > > > > > > > > > > > This is the current way to migrate net device state=
 through control
> > > > > > > > > > > > virtqueue, in a software assisted framework with vD=
PA:
> > > > > > > > > > > > * First, only net CVQ is enabled at DRIVER_OK
> > > > > > > > > > > > * All the control commands (mac address, mq, etc) n=
eeded for the device
> > > > > > > > > > > > to behave the same as the source of migration are s=
ent
> > > > > > > > > > > > * Finally all the dataplane queues are enabled.
> > > > > > > > > > >
> > > > > > > > > > > In my opinion, this is somewhat problematic. Specific=
ally, currently
> > > > > > > > > > > devices tend to deduce how many queues are needed by =
looking
> > > > > > > > > > > at the state at DRIVER_OK time.
> > > > > > > > > > >
> > > > > > > > > > > Question: what is wrong with enabling queues initiall=
y and then
> > > > > > > > > > > doing a reset right after DRIVER_OK? You can even all=
ocate
> > > > > > > > > > > memory for just one queue (zeroing it out).
> > > > > > > > > > >
> > > > > > > > > > > Granted this looks kind of ugly but side-steps this p=
roblem with
> > > > > > > > > > > no need for spec changes.
> > > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > The problem is that the rx queues can start receiving, =
as the guest
> > > > > > > > > > already has buffers there.
> > > > > > > > >
> > > > > > > > > Can we reset the vq before filling buffers to it?
> > > > > > > > >
> > > > > > > >
> > > > > > > > They are passthrough from the guest so there is a window wh=
ere the
> > > > > > > > device can process rx descriptors.
> > > > > > >
> > > > > > > Not if there are no descriptors there.
> > > > > > >
> > > > > >
> > > > > > But the migration is driven by the hypervisor, and it cannot co=
ntrol
> > > > > > that. The guest will likely have rx descriptors available.
> > > > >
> > > > > Maybe I misunderstand. Is hypervisor driving cvq while guest is d=
riving
> > > > > rx queues?
> > > >
> > > > No, hypervisor tries to restore virtqueue states via cvq before gue=
st can drive.
> > >
> > > So cvq maps to hypervisor memory?
> > >
> >
> > >From the device POV, yes, the CVQ vring is in hypervisor memory, not
> > in the guest's one. That allows the hypervisor to send the CVQ
> > commands to restore the device state in the destination, without the
> > guest intervention.
> >
> > Data vqs, on the other hand, are passthrough. The device talks
> > directly to the guest's vrings.
> >
> > Currently, this is done by emulating CVQ in the host's kernel and then
> > translating the commands in the way that suits better the vdpa device,
> > using its vendor vdpa driver in the host. Other methods like PASID are
> > possible too.
> >
> > Thanks!
>
> OK. So my suggestion is simple: map data vrings to a zero page in
> hypervisor memory initially. Later reset and map to guest.
>

The idea is interesting, but we lose the net configuration in a device
reset, so we need to send it again.

In the case of qemu+vDPA maybe it is possible with queue_reset, like:
* Map all the guest pages as usual.
* Map a new zero page, forbid the guest to write on that page. Even in
vIOMMU case, we can send all the CVQ commands before allowing the
guest to modify mappings. The guest has no way to write on that page
through the device as, well, dataplane is not initialized. It's the
way DPDK shadow virtqueues worked, so it should be valid.
* Reset the queues to the guest passthrough.

I don't like the complexity of it but I like it does require even less
changes to the device / spec.

>
> If that does not work, then I am not sure this proposal is enough
> since I think devices want to have a specific point in time
> where they know which queues are going to be used.

In the case of net, this should not be a problem since the spec
mandates 2 if !cvq, 3 if cvq but !mq, and max_virtqueue_pairs*2+1 if
cvq and mq. virtio-blk also has num_queues.

Is it even valid to not enable some of the queues?

I've always felt that queue_enable has been redundant before
queue_reset for this reason actually.

> Maybe we could use e.g. bit 1 in queue_enable to signal that?
>

I'm totally ok to go in that direction.

Thanks!

>
> > >
> > >
> > > > So in this case if RX queues are enabled at the same time, the devi=
ce
> > > > may try to queue packets to queue 0.
> > > >
> > > > Thanks
> > > >
> > > > > How do you do this - they are DMA from same VF no?
> > > > >
> > > > >
> > > > > > >
> > > > > > > > > > Apart from that, the back and forth
> > > > > > > > > > introduces latencies.
> > > > > > > > > >
> > > > > > > > > > Maybe a better angle is to start all the queues as if t=
hey're reset,
> > > > > > > > > > write 1 just to CVQ, configure the device, and then wri=
te 1 to all
> > > > > > > > > > dataplane vqs?
> > > > > > > > >
> > > > > > > > > write to what?
> > > > > > > > >
> > > > > > > >
> > > > > > > > Sorry I was unclear, I mean to enable the vqs writing 1 to =
queue_enable.
> > > > > > > >
> > > > > > > > Thanks!
> > > > > > > >
> > > > > > > > > Thanks.
> > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > Thanks!
> > > > > > > > > >
> > > > > > > > > > > > Eugenio P=C3=A9rez (2):
> > > > > > > > > > > >   virtio: introduce selective queue enabling
> > > > > > > > > > > >   virtio: pci support virtqueue selective enabling
> > > > > > > > > > > >
> > > > > > > > > > > >  content.tex       | 15 +++++++++++++--
> > > > > > > > > > > >  transport-pci.tex |  4 ++++
> > > > > > > > > > > >  2 files changed, 17 insertions(+), 2 deletions(-)
> > > > > > > > > > > >
> > > > > > > > > > > > --
> > > > > > > > > > > > 2.31.1
> > > > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > >
> > > > > > > > >
> > > > > > > > > This publicly archived list offers a means to provide inp=
ut to the
> > > > > > > > > OASIS Virtual I/O Device (VIRTIO) TC.
> > > > > > > > >
> > > > > > > > > In order to verify user consent to the Feedback License t=
erms and
> > > > > > > > > to minimize spam in the list archive, subscription is req=
uired
> > > > > > > > > before posting.
> > > > > > > > >
> > > > > > > > > Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> > > > > > > > > Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.=
org
> > > > > > > > > List help: virtio-comment-help@lists.oasis-open.org
> > > > > > > > > List archive: https://lists.oasis-open.org/archives/virti=
o-comment/
> > > > > > > > > Feedback License: https://www.oasis-open.org/who/ipr/feed=
back_license.pdf
> > > > > > > > > List Guidelines: https://www.oasis-open.org/policies-guid=
elines/mailing-lists
> > > > > > > > > Committee: https://www.oasis-open.org/committees/virtio/
> > > > > > > > > Join OASIS: https://www.oasis-open.org/join/
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

