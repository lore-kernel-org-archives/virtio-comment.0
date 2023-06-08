Return-Path: <virtio-comment-return-6229-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17274C7EE23
	for <virtio-comment@archiver.kernel.org>; Thu,  8 Jun 2023 07:46:38 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 381C1444B
	for <virtio-comment@archiver.kernel.org>; Thu,  8 Jun 2023 07:46:38 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 13A7A98666D
	for <virtio-comment@archiver.kernel.org>; Thu,  8 Jun 2023 07:46:38 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 01336986259; Thu,  8 Jun 2023 07:46:38 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E2A76986667
	for <virtio-comment@lists.oasis-open.org>; Thu,  8 Jun 2023 07:46:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: NenrSh9mMWGkk97eVKpSZw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686210394; x=1688802394;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l68Y/8EjJwd5MrrPoBlgoAfdq8kOj9C1OlYlw++ZDP8=;
        b=cz3jDWQOsKu64eTaizU6kist+P8p65M1JCEC61oQwYpEeUlHEkJcGXMa1bLMDjt0SN
         7TIBa1q47EBMDNNhQCZrem73zwtamx4ZwMUzPyqU/0AZ0Ummm7Hj76iwBpc+c7Pqb2wU
         CFhYgXEQGLg6zbsWQ/vffe5rpPEXs5Zto6cBohLioDsoZuhUs1bz5l50aNufCiV1pwjo
         TKWvokB54xaL7hjk5UEvUL5x4Yko53+FB8HSoSUrYMGtcqfT8bznNaQBN12UMVxVmEM/
         Go2e7TIVbzZSS78l62cWWQZlc8EJw10mP0X6J5bdD+wW/QV6mLLg8EZ76b3anwIt4LSa
         U/Og==
X-Gm-Message-State: AC+VfDxdG0K9rPneJs+t8v+b1WdHQ/elBvHTS4OHtVG6d3zRTFrbBEU9
	JaNxjR2MRxkJfY7fM8R40s6wrY+ZKuYYHJra7rnQruB9q5z9mFqqL8VuM/RwAnKeOm+GJCB4X/r
	rBUbIjp5AKeaXf1QLuTzLS8AVEu9ewQ2+xE/sv+rpOqvnSwIGJQ==
X-Received: by 2002:a2e:910a:0:b0:2b2:a6:6132 with SMTP id m10-20020a2e910a000000b002b200a66132mr1787809ljg.25.1686210394080;
        Thu, 08 Jun 2023 00:46:34 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5qqFhFW/a9vvOJJqe9bXi6Bs2Spts5Kzfh5Bvw6+e3r1w1Mk8n7va/R8k9uNl2BFfQ9RjY0lzjQprLAoGueV0=
X-Received: by 2002:a2e:910a:0:b0:2b2:a6:6132 with SMTP id m10-20020a2e910a000000b002b200a66132mr1787787ljg.25.1686210393881;
 Thu, 08 Jun 2023 00:46:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230606175511.2337208-1-eperezma@redhat.com> <20230606150920-mutt-send-email-mst@kernel.org>
 <CAJaqyWd2o+++24dF5ab44a_rCUpBTHNwgxd3tQAeJZyh09M+wg@mail.gmail.com>
 <1686126137.3070245-1-xuanzhuo@linux.alibaba.com> <CAJaqyWeA40JgZfaynT2S4B9JY-bwrz3Exs9iD98AUPYvsZBgpg@mail.gmail.com>
 <20230607045741-mutt-send-email-mst@kernel.org> <CAJaqyWfVN1i3F-m81=5=UMOq0ZEn=pU2SOO0QVmE4VjrHGit1w@mail.gmail.com>
 <20230607162529-mutt-send-email-mst@kernel.org> <CACGkMEsjJHOcx+D5V=oiQ25Efro-etADmbpDdDXS4Ufk5guoEA@mail.gmail.com>
 <20230608020335-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230608020335-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 8 Jun 2023 15:46:22 +0800
Message-ID: <CACGkMEtJKk7pOxrSC1hTCRt-OJmtJJk9ef-7dJ6fGwv=pObZ0A@mail.gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Eugenio Perez Martin <eperezma@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
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

On Thu, Jun 8, 2023 at 2:04=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com> =
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

Yes.

Thanks

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

