Return-Path: <virtio-comment-return-6493-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0303BEB64DC
	for <virtio-comment@archiver.kernel.org>; Mon, 26 Jun 2023 02:53:23 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 27A5B3357D
	for <virtio-comment@archiver.kernel.org>; Mon, 26 Jun 2023 02:53:23 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 14890986385
	for <virtio-comment@archiver.kernel.org>; Mon, 26 Jun 2023 02:53:23 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id F0A5A98635B; Mon, 26 Jun 2023 02:53:22 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D6D89986364
	for <virtio-comment@lists.oasis-open.org>; Mon, 26 Jun 2023 02:53:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: lXqjfbYeMuaL2GJ20VxIvA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687747997; x=1690339997;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vjxfxZpanLVgkw3+A6c06S9f6P9gGuVhujpTp4GcG04=;
        b=X9Lq12cmIpR3sIkj1/sM+TmHsoaRLP4/Bp/Rafx2QvNn8pEju7wUBaeML+nJWi3Qcs
         FQjlXXXXEmZ0QVknPyRw7f4w9LHaTO1f6yDTxa7QhNKOfyo4aCZI0Yldm17b8+eIF12h
         BdVLD94yvflImLFTwF1PHzkghC9Iq0WsYPIB9VY3DhiRoxQPl1EDKiVmqkEvDcJNfuAQ
         zcHzGZ5g7lGIIvTfhM8kODtwg+A7Vlnh2Zc2urUPCv/mUUCf5z0nLwalCLbNfoFGA5Pb
         sVcGljVSt/fCwkxvm5SypqYhDzz41HhZixiD3UlLyPttQrhS5b95tvTy65K/+Ie5zS8P
         tfMA==
X-Gm-Message-State: AC+VfDynqDEThH2+lYrnOc1lH4kXW/QKcun0ufTE7tOfJNJkUAnzoQ70
	kN//onRwgVjJrh3AJUyk3LMtPD4Bg7bzZ7juKQI4WTtwKyQlwnqVoCDx60gHjClkK+//z25ZW9R
	/EwxCnEu6J0MXgjjQ4PfXBOIZJ7CPUjCJyvvqdai28XLRu+2Ojw==
X-Received: by 2002:a2e:380b:0:b0:2b4:74ca:baf7 with SMTP id f11-20020a2e380b000000b002b474cabaf7mr11609269lja.52.1687747996855;
        Sun, 25 Jun 2023 19:53:16 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ68JJlyotqEhNECF9886EEw3jwNRIjhxMcuA8y0O1br0JXqi2gQfRYnQaJ6BrNB70QK/6OHBWK+v+NT8dbtOQc=
X-Received: by 2002:a2e:380b:0:b0:2b4:74ca:baf7 with SMTP id
 f11-20020a2e380b000000b002b474cabaf7mr11609255lja.52.1687747996548; Sun, 25
 Jun 2023 19:53:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230613034216-mutt-send-email-mst@kernel.org>
 <20230613035132-mutt-send-email-mst@kernel.org> <CAJaqyWfOi5D+f+JPBFZ8Rw+TCG5TLE+X8affo-EBaCAQx8_2vQ@mail.gmail.com>
 <20230613082755-mutt-send-email-mst@kernel.org> <CAJaqyWdTPmvrGvOStY-uTg1KboAC6s7s8+1JkF1xWFUBwBVT+g@mail.gmail.com>
 <20230616102011-mutt-send-email-mst@kernel.org> <CAJaqyWfx5Z9LxvpHy90EU5ZUHxROKMRtVVw00KAaCm+HzT0ksg@mail.gmail.com>
 <20230617184944-mutt-send-email-mst@kernel.org> <CAJaqyWdLHJng86Hu0jPS+YWv-GgdJV8t+sdjcAhW07MKxeqAOA@mail.gmail.com>
 <CACGkMEtnR3iEKvCYBy_9N7NgdORsdcAXTRLF4p-9JJW1fFFMWw@mail.gmail.com> <20230625172717-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230625172717-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 26 Jun 2023 10:53:05 +0800
Message-ID: <CACGkMEsF08=U0i8Vyd3_aRGm78Y==HSyTqsAzYJC2OCXyqmDiw@mail.gmail.com>
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

On Mon, Jun 26, 2023 at 5:32=E2=80=AFAM Michael S. Tsirkin <mst@redhat.com>=
 wrote:
>
> On Sun, Jun 25, 2023 at 01:31:36PM +0800, Jason Wang wrote:
> > On Sun, Jun 25, 2023 at 2:41=E2=80=AFAM Eugenio Perez Martin
> > <eperezma@redhat.com> wrote:
> > >
> > > On Sun, Jun 18, 2023 at 1:08=E2=80=AFAM Michael S. Tsirkin <mst@redha=
t.com> wrote:
> > > >
> > > > On Sat, Jun 17, 2023 at 02:53:46PM +0200, Eugenio Perez Martin wrot=
e:
> > > > > On Fri, Jun 16, 2023 at 4:40=E2=80=AFPM Michael S. Tsirkin <mst@r=
edhat.com> wrote:
> > > > > >
> > > > > > On Thu, Jun 15, 2023 at 10:35:09AM +0200, Eugenio Perez Martin =
wrote:
> > > > > > > On Tue, Jun 13, 2023 at 2:29=E2=80=AFPM Michael S. Tsirkin <m=
st@redhat.com> wrote:
> > > > > > > >
> > > > > > > > On Tue, Jun 13, 2023 at 12:12:43PM +0200, Eugenio Perez Mar=
tin wrote:
> > > > > > > > > On Tue, Jun 13, 2023 at 9:53=E2=80=AFAM Michael S. Tsirki=
n <mst@redhat.com> wrote:
> > > > > > > > > >
> > > > > > > > > > On Tue, Jun 13, 2023 at 03:46:35AM -0400, Michael S. Ts=
irkin wrote:
> > > > > > > > > > > On Mon, Jun 12, 2023 at 09:56:57AM +0200, Eugenio Per=
ez Martin wrote:
> > > > > > > > > > > > > > Another drawback of that is the long time a dev=
ice can spend to
> > > > > > > > > > > > > > reconfigure its memory maps.
> > > > > > > > > > > > >
> > > > > > > > > > > > > The map is already used for cvq though, I don't s=
ee why it would take
> > > > > > > > > > > > > much more with this.
> > > > > > > > > > > > >
> > > > > > > > > > > >
> > > > > > > > > > > > In the case of vDPA HW, CVQ maps may not need to re=
ach the device's or
> > > > > > > > > > > > platform IOMMU, so the modification of that mapping=
 is way cheaper.
> > > > > > > > > > >
> > > > > > > > > > > Oh, I get it. It's setup time, but you are right.
> > > > > > > > > > >
> > > > > > > > > > > > > > taking that into account, does it make
> > > > > > > > > > > > > > sense to send a new version with the bit 1 on e=
nable?
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > Thanks!
> > > > > > > > > > > > >
> > > > > > > > > > > > > Current hardware won't support the extra bit thou=
gh.
> > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > Thinking more about this, I think the following works:
> > > > > > > > > >
> > > > > > > > > > - enable all queues before DRIVER_OK
> > > > > > > > > > - reset all data queues before DRIVER_OK
> > > > > > > > > > - DRIVER_OK
> > > > > > > > > > - CVQ commands
> > > > > > > > > > - re-enable data queues
> > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > No?
> > > > > > > > > >
> > > > > > > > >
> > > > > > > > > If it is valid to write to queue_reset before DRIVER_OK, =
then sure. I
> > > > > > > > > asked for that in the past at
> > > > > > > > > https://lists.oasis-open.org/archives/virtio-dev/202305/m=
sg00329.html
> > > > > > > > > .
> > > > > > > >
> > > > > > > > Well then Jason said:
> > > > > > > >  we should make svq work without RING_RESET
> > > > > > > > but now apparently we went full circle and propose
> > > > > > > > a feature bit after all?
> > > > > > > >
> > > > > > >
> > > > > > > My understanding is that RING_RESET covers more than just del=
aying the
> > > > > > > enabling of net data vqs, like to change the address or prope=
rties of
> > > > > > > vqs after DRIVER_OK. While the late enabling may be easy to i=
mplement
> > > > > > > in current hw, vq property changes may be more challenging. T=
here are
> > > > > > > current HW that only support late enabling but not reconfigur=
e the
> > > > > > > queues. Ideally, just the subset of late enabling is needed.
> > > > > > >
> > > > > > > Does it make sense to change the proposal to something in the=
 line of:
> > > > > > > RING_F_LATE_ENABLING: This feature flag is a subset of _F_RIN=
G_RESET.
> > > > > > > If this feature is negotiated, all vqs start as if the vqs ha=
s been
> > > > > > > reset before DRIVER_OK. This feature does not allow resetting=
 a queue
> > > > > > > once it is live.
> > > > > > >
> > > > > > > Thanks!
> > > > > >
> > > > > > Maybe. No idea - I am not a hardware designer. Can some hardwar=
e
> > > > > > vendors chime in and confirm?
> > > > > > It seems like a very very narrow "make my hack work" use-case.
> > > > > > And I'm not even sure how well it works.
> > > > > > For example what if cvq command enables rss? If the queues in
> > > > > > question are not enabled packets will be dropped.
> > > > > > So - fix some setups, break others?
> > > > > >
> > > > >
> > > > > I don't think it breaks, they are already dropped before setting
> > > > > DRIVER_OK anyway. If we restore the configuration before DRIVER_O=
K in
> > > > > the future, the device is supposed to drop packets meanwhile anyw=
ay,
> > > > > isn't it?
> > > >
> > > >
> > > > I just thought of an idea. Devices generally don't poke at rings
> > > > by themselves. How about at init time we cause kicks on data queues
> > > > to vmexit? Then on 1st kick we map hardware so following ones will
> > > > go straight to hardware. This will make sure cvq is processed
> > > > first. Hmm?
> >
> > This is not the case at least for vhost-net. It doesn't need to be
> > kicked in order to work. And it's an example that we need clearly
> > define the behaviour instead of depending on any existing
> > implementation details.
>
> This kind of guarantee however sounds generally useful to
> control which queues are accessed when.
>
> This is only needed after restore, which is ATM a vdpa thing,
> so can just be a vdpa flag, but I'm ok with it as a
> virtio flag too.

Great. Having a virtio flag may help to reduce the extra and
duplicated effort spent in vdpa.

Thanks

>
> > > >
> > >
> > > That would be possible, but nothing prevents the hw to start
> > > processing requests even without that first kick, isn't it?
> >
> > Yes.
> >
> > Thanks
> >
> > >
> > > I think that was discussed also in the past, as previous qemu patches
> > > gave a spurious kick to start queues just in case. I think the
> > > conclusion was that at least the vDPA device will start processing
> > > requests at DRIVER_OK, no need to wait for a kick.
> > >
> > > https://lore.kernel.org/all/CACGkMEt8cMM1UxVzxb0eHeaWSpR0ApvGzaF901vr=
M4m-uGMiPA@mail.gmail.com/
> > >
> > > Thanks!
> > >
> > > > > >
> > > > > > > >
> > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > > --
> > > > > > > > > > > MST
> > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > This publicly archived list offers a means to provide i=
nput to the
> > > > > > > > > > OASIS Virtual I/O Device (VIRTIO) TC.
> > > > > > > > > >
> > > > > > > > > > In order to verify user consent to the Feedback License=
 terms and
> > > > > > > > > > to minimize spam in the list archive, subscription is r=
equired
> > > > > > > > > > before posting.
> > > > > > > > > >
> > > > > > > > > > Subscribe: virtio-comment-subscribe@lists.oasis-open.or=
g
> > > > > > > > > > Unsubscribe: virtio-comment-unsubscribe@lists.oasis-ope=
n.org
> > > > > > > > > > List help: virtio-comment-help@lists.oasis-open.org
> > > > > > > > > > List archive: https://lists.oasis-open.org/archives/vir=
tio-comment/
> > > > > > > > > > Feedback License: https://www.oasis-open.org/who/ipr/fe=
edback_license.pdf
> > > > > > > > > > List Guidelines: https://www.oasis-open.org/policies-gu=
idelines/mailing-lists
> > > > > > > > > > Committee: https://www.oasis-open.org/committees/virtio=
/
> > > > > > > > > > Join OASIS: https://www.oasis-open.org/join/
> > > > > > > > > >
> > > > > > > >
> > > > > >
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

