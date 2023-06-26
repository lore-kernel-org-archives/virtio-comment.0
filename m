Return-Path: <virtio-comment-return-6515-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76104EB64D7
	for <virtio-comment@archiver.kernel.org>; Mon, 26 Jun 2023 08:20:31 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id AE2617C6A4
	for <virtio-comment@archiver.kernel.org>; Mon, 26 Jun 2023 08:20:30 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 95406986383
	for <virtio-comment@archiver.kernel.org>; Mon, 26 Jun 2023 08:20:30 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 81499985FDB; Mon, 26 Jun 2023 08:20:30 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5DC38986364
	for <virtio-comment@lists.oasis-open.org>; Mon, 26 Jun 2023 08:20:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: hfD0PPDoPs-fnVJTnoOgmA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687767625; x=1690359625;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ib+2mya+wusnZR+tnzyjQQX5+a9fmUoD+PMvRGyQbPo=;
        b=W0UkdwxiTeNsF4YU50ly2qeRx3VG+h0CFHkcLoXAzk5Z9lUSCPAaUgfvx6sFzkKRTg
         rsftiUsPxyAqdVo5plbPo68luhnrwIpFrIRwcqTXibXyMYP86dFwQbADZgEJEph29PEI
         oQRH4dXcLGFnuEoPwscFXantV52URVdV+6sbEP/0GkZkQAk0tzk4mM+OPk1xZE8Nzga5
         OZOK2U4vS8/QKmxRH9E7re0wJGMSxSG8wz9v6o//rSsMmu2pGUz5qZEb1Hp52Zn02aUR
         eg394ZC/dAKezDRsVhaicwUJMgr3cc9x76SURVb4+1QNI6v1R0lYLWMoQrM3D+MyGamx
         vW/A==
X-Gm-Message-State: AC+VfDyn3mmoxUh/yXfA30E2+RvgNVLU5imuYcoKrc1wrplb6I35p1aq
	ZEV33BeRx3ORoF+yRxeMyJQhKzzOXe72ZdxcIjMcR0PJr2xgF23I8cUfbTOXet3FPn4sK+U6nEf
	J3NVxSLXDbIKkBo5ssvYPuBnpQvQV2XxRZJ7uLdtphVfZoMVR2w==
X-Received: by 2002:a25:d707:0:b0:bca:9c66:e53b with SMTP id o7-20020a25d707000000b00bca9c66e53bmr25951116ybg.14.1687767625301;
        Mon, 26 Jun 2023 01:20:25 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ61JBextvPcaVmbVkOJmjbX1PVALEq5+6n9LOlqfmd6cnC6DiGiPLdAgk+NazHEwB2rkIu7A/mYdwcLe6yqd0U=
X-Received: by 2002:a25:d707:0:b0:bca:9c66:e53b with SMTP id
 o7-20020a25d707000000b00bca9c66e53bmr25951092ybg.14.1687767625018; Mon, 26
 Jun 2023 01:20:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230613034216-mutt-send-email-mst@kernel.org>
 <20230613035132-mutt-send-email-mst@kernel.org> <CAJaqyWfOi5D+f+JPBFZ8Rw+TCG5TLE+X8affo-EBaCAQx8_2vQ@mail.gmail.com>
 <20230613082755-mutt-send-email-mst@kernel.org> <CAJaqyWdTPmvrGvOStY-uTg1KboAC6s7s8+1JkF1xWFUBwBVT+g@mail.gmail.com>
 <20230616102011-mutt-send-email-mst@kernel.org> <CAJaqyWfx5Z9LxvpHy90EU5ZUHxROKMRtVVw00KAaCm+HzT0ksg@mail.gmail.com>
 <20230617184944-mutt-send-email-mst@kernel.org> <CAJaqyWdLHJng86Hu0jPS+YWv-GgdJV8t+sdjcAhW07MKxeqAOA@mail.gmail.com>
 <CACGkMEtnR3iEKvCYBy_9N7NgdORsdcAXTRLF4p-9JJW1fFFMWw@mail.gmail.com>
 <20230625172717-mutt-send-email-mst@kernel.org> <CACGkMEsF08=U0i8Vyd3_aRGm78Y==HSyTqsAzYJC2OCXyqmDiw@mail.gmail.com>
In-Reply-To: <CACGkMEsF08=U0i8Vyd3_aRGm78Y==HSyTqsAzYJC2OCXyqmDiw@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 26 Jun 2023 10:19:48 +0200
Message-ID: <CAJaqyWfmtLJbePYrhbw-xd5-jaD=wwaMG2Xc8N_x8yjLSCD0Lw@mail.gmail.com>
To: Jason Wang <jasowang@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
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

On Mon, Jun 26, 2023 at 4:53=E2=80=AFAM Jason Wang <jasowang@redhat.com> wr=
ote:
>
> On Mon, Jun 26, 2023 at 5:32=E2=80=AFAM Michael S. Tsirkin <mst@redhat.co=
m> wrote:
> >
> > On Sun, Jun 25, 2023 at 01:31:36PM +0800, Jason Wang wrote:
> > > On Sun, Jun 25, 2023 at 2:41=E2=80=AFAM Eugenio Perez Martin
> > > <eperezma@redhat.com> wrote:
> > > >
> > > > On Sun, Jun 18, 2023 at 1:08=E2=80=AFAM Michael S. Tsirkin <mst@red=
hat.com> wrote:
> > > > >
> > > > > On Sat, Jun 17, 2023 at 02:53:46PM +0200, Eugenio Perez Martin wr=
ote:
> > > > > > On Fri, Jun 16, 2023 at 4:40=E2=80=AFPM Michael S. Tsirkin <mst=
@redhat.com> wrote:
> > > > > > >
> > > > > > > On Thu, Jun 15, 2023 at 10:35:09AM +0200, Eugenio Perez Marti=
n wrote:
> > > > > > > > On Tue, Jun 13, 2023 at 2:29=E2=80=AFPM Michael S. Tsirkin =
<mst@redhat.com> wrote:
> > > > > > > > >
> > > > > > > > > On Tue, Jun 13, 2023 at 12:12:43PM +0200, Eugenio Perez M=
artin wrote:
> > > > > > > > > > On Tue, Jun 13, 2023 at 9:53=E2=80=AFAM Michael S. Tsir=
kin <mst@redhat.com> wrote:
> > > > > > > > > > >
> > > > > > > > > > > On Tue, Jun 13, 2023 at 03:46:35AM -0400, Michael S. =
Tsirkin wrote:
> > > > > > > > > > > > On Mon, Jun 12, 2023 at 09:56:57AM +0200, Eugenio P=
erez Martin wrote:
> > > > > > > > > > > > > > > Another drawback of that is the long time a d=
evice can spend to
> > > > > > > > > > > > > > > reconfigure its memory maps.
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > The map is already used for cvq though, I don't=
 see why it would take
> > > > > > > > > > > > > > much more with this.
> > > > > > > > > > > > > >
> > > > > > > > > > > > >
> > > > > > > > > > > > > In the case of vDPA HW, CVQ maps may not need to =
reach the device's or
> > > > > > > > > > > > > platform IOMMU, so the modification of that mappi=
ng is way cheaper.
> > > > > > > > > > > >
> > > > > > > > > > > > Oh, I get it. It's setup time, but you are right.
> > > > > > > > > > > >
> > > > > > > > > > > > > > > taking that into account, does it make
> > > > > > > > > > > > > > > sense to send a new version with the bit 1 on=
 enable?
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > Thanks!
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > Current hardware won't support the extra bit th=
ough.
> > > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > Thinking more about this, I think the following works=
:
> > > > > > > > > > >
> > > > > > > > > > > - enable all queues before DRIVER_OK
> > > > > > > > > > > - reset all data queues before DRIVER_OK
> > > > > > > > > > > - DRIVER_OK
> > > > > > > > > > > - CVQ commands
> > > > > > > > > > > - re-enable data queues
> > > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > No?
> > > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > If it is valid to write to queue_reset before DRIVER_OK=
, then sure. I
> > > > > > > > > > asked for that in the past at
> > > > > > > > > > https://lists.oasis-open.org/archives/virtio-dev/202305=
/msg00329.html
> > > > > > > > > > .
> > > > > > > > >
> > > > > > > > > Well then Jason said:
> > > > > > > > >  we should make svq work without RING_RESET
> > > > > > > > > but now apparently we went full circle and propose
> > > > > > > > > a feature bit after all?
> > > > > > > > >
> > > > > > > >
> > > > > > > > My understanding is that RING_RESET covers more than just d=
elaying the
> > > > > > > > enabling of net data vqs, like to change the address or pro=
perties of
> > > > > > > > vqs after DRIVER_OK. While the late enabling may be easy to=
 implement
> > > > > > > > in current hw, vq property changes may be more challenging.=
 There are
> > > > > > > > current HW that only support late enabling but not reconfig=
ure the
> > > > > > > > queues. Ideally, just the subset of late enabling is needed=
.
> > > > > > > >
> > > > > > > > Does it make sense to change the proposal to something in t=
he line of:
> > > > > > > > RING_F_LATE_ENABLING: This feature flag is a subset of _F_R=
ING_RESET.
> > > > > > > > If this feature is negotiated, all vqs start as if the vqs =
has been
> > > > > > > > reset before DRIVER_OK. This feature does not allow resetti=
ng a queue
> > > > > > > > once it is live.
> > > > > > > >
> > > > > > > > Thanks!
> > > > > > >
> > > > > > > Maybe. No idea - I am not a hardware designer. Can some hardw=
are
> > > > > > > vendors chime in and confirm?
> > > > > > > It seems like a very very narrow "make my hack work" use-case=
.
> > > > > > > And I'm not even sure how well it works.
> > > > > > > For example what if cvq command enables rss? If the queues in
> > > > > > > question are not enabled packets will be dropped.
> > > > > > > So - fix some setups, break others?
> > > > > > >
> > > > > >
> > > > > > I don't think it breaks, they are already dropped before settin=
g
> > > > > > DRIVER_OK anyway. If we restore the configuration before DRIVER=
_OK in
> > > > > > the future, the device is supposed to drop packets meanwhile an=
yway,
> > > > > > isn't it?
> > > > >
> > > > >
> > > > > I just thought of an idea. Devices generally don't poke at rings
> > > > > by themselves. How about at init time we cause kicks on data queu=
es
> > > > > to vmexit? Then on 1st kick we map hardware so following ones wil=
l
> > > > > go straight to hardware. This will make sure cvq is processed
> > > > > first. Hmm?
> > >
> > > This is not the case at least for vhost-net. It doesn't need to be
> > > kicked in order to work. And it's an example that we need clearly
> > > define the behaviour instead of depending on any existing
> > > implementation details.
> >
> > This kind of guarantee however sounds generally useful to
> > control which queues are accessed when.
> >
> > This is only needed after restore, which is ATM a vdpa thing,
> > so can just be a vdpa flag, but I'm ok with it as a
> > virtio flag too.
>
> Great. Having a virtio flag may help to reduce the extra and
> duplicated effort spent in vdpa.
>

So the flag should be something in the line of:
VIRTIO_F_ACCESS_AFTER_KICK: The device will only access the ring after
the first kick. Before that kick, it will not process any request.

?

Thanks!

> Thanks
>
> >
> > > > >
> > > >
> > > > That would be possible, but nothing prevents the hw to start
> > > > processing requests even without that first kick, isn't it?
> > >
> > > Yes.
> > >
> > > Thanks
> > >
> > > >
> > > > I think that was discussed also in the past, as previous qemu patch=
es
> > > > gave a spurious kick to start queues just in case. I think the
> > > > conclusion was that at least the vDPA device will start processing
> > > > requests at DRIVER_OK, no need to wait for a kick.
> > > >
> > > > https://lore.kernel.org/all/CACGkMEt8cMM1UxVzxb0eHeaWSpR0ApvGzaF901=
vrM4m-uGMiPA@mail.gmail.com/
> > > >
> > > > Thanks!
> > > >
> > > > > > >
> > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > > --
> > > > > > > > > > > > MST
> > > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > This publicly archived list offers a means to provide=
 input to the
> > > > > > > > > > > OASIS Virtual I/O Device (VIRTIO) TC.
> > > > > > > > > > >
> > > > > > > > > > > In order to verify user consent to the Feedback Licen=
se terms and
> > > > > > > > > > > to minimize spam in the list archive, subscription is=
 required
> > > > > > > > > > > before posting.
> > > > > > > > > > >
> > > > > > > > > > > Subscribe: virtio-comment-subscribe@lists.oasis-open.=
org
> > > > > > > > > > > Unsubscribe: virtio-comment-unsubscribe@lists.oasis-o=
pen.org
> > > > > > > > > > > List help: virtio-comment-help@lists.oasis-open.org
> > > > > > > > > > > List archive: https://lists.oasis-open.org/archives/v=
irtio-comment/
> > > > > > > > > > > Feedback License: https://www.oasis-open.org/who/ipr/=
feedback_license.pdf
> > > > > > > > > > > List Guidelines: https://www.oasis-open.org/policies-=
guidelines/mailing-lists
> > > > > > > > > > > Committee: https://www.oasis-open.org/committees/virt=
io/
> > > > > > > > > > > Join OASIS: https://www.oasis-open.org/join/
> > > > > > > > > > >
> > > > > > > > >
> > > > > > >
> > > > >
> > > >
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

