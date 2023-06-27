Return-Path: <virtio-comment-return-6539-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 729EDEB64D9
	for <virtio-comment@archiver.kernel.org>; Tue, 27 Jun 2023 08:07:59 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id A1E93C6104
	for <virtio-comment@archiver.kernel.org>; Tue, 27 Jun 2023 08:07:58 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8C47E986413
	for <virtio-comment@archiver.kernel.org>; Tue, 27 Jun 2023 08:07:58 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 7B9F79843C5; Tue, 27 Jun 2023 08:07:58 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6236A98635B
	for <virtio-comment@lists.oasis-open.org>; Tue, 27 Jun 2023 08:07:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: Je7Wif79PyGYqu4tpG3lEg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687853274; x=1690445274;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1iFqHivfZjaugFyXwMvlqAvOb2Zrct0Li90NdSSqWgg=;
        b=NfwEbFR8B3pZPKkLn5m3nKhNyOpABnUmvgxWHomyO3DLf2XWXVWfsESfal39zzoeeJ
         /CAWjPb3tY8bwB2OKB5doR0cGlnOEWFGi747r3OrKpkl2uZlpaz85JmRSdD6ofR4ZsjH
         0Im3zUka2IMM8lrxB4FMEd0YnQOGslfW2UIkRvgIn1iw56gXj8TQy3LeJZ+sBsAl6+R9
         nOipezCHpQhQx3TcpCEKo2MXb+1GX8yi/3AwJ5xMTiB/YaysdpzbqssV0PIXa5itqHrY
         U1lZ21+7kpY7YG992drp6zIi13W7zMnR2alkA1+oCDSGoJXpsoUPErWHBxtBah1VmO8e
         MGjA==
X-Gm-Message-State: AC+VfDxwS4hxRSoTgGRsvcvF/J/vTI5mKQl0V2qmG6gH4KqM3b7ZA8Zs
	uShsizIGODwcWaYwxLTJUbCYSzE2illOZ4yR3CwrLq9TRcmSDcEFZnn+jGrgY1MKFYWna7od4tI
	TYzVuJjWCRiMOCHFFy1ts7E/Kd6Wjvq5/jduCNEIBAlMS8uNhdQ==
X-Received: by 2002:a2e:9d16:0:b0:2b6:9e83:73da with SMTP id t22-20020a2e9d16000000b002b69e8373damr3262087lji.32.1687853273784;
        Tue, 27 Jun 2023 01:07:53 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4hFGRRXv88dHVcSIt3bljSx+xbNwpveqcqgVN9xaZFAofscNCs5/Lm5kDO9aHYNfiHV74s9iJ6BYXmUiTLr4g=
X-Received: by 2002:a2e:9d16:0:b0:2b6:9e83:73da with SMTP id
 t22-20020a2e9d16000000b002b69e8373damr3262071lji.32.1687853273465; Tue, 27
 Jun 2023 01:07:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230613082755-mutt-send-email-mst@kernel.org>
 <CAJaqyWdTPmvrGvOStY-uTg1KboAC6s7s8+1JkF1xWFUBwBVT+g@mail.gmail.com>
 <20230616102011-mutt-send-email-mst@kernel.org> <CAJaqyWfx5Z9LxvpHy90EU5ZUHxROKMRtVVw00KAaCm+HzT0ksg@mail.gmail.com>
 <20230617184944-mutt-send-email-mst@kernel.org> <CAJaqyWdLHJng86Hu0jPS+YWv-GgdJV8t+sdjcAhW07MKxeqAOA@mail.gmail.com>
 <CACGkMEtnR3iEKvCYBy_9N7NgdORsdcAXTRLF4p-9JJW1fFFMWw@mail.gmail.com>
 <20230625172717-mutt-send-email-mst@kernel.org> <CACGkMEsF08=U0i8Vyd3_aRGm78Y==HSyTqsAzYJC2OCXyqmDiw@mail.gmail.com>
 <CAJaqyWfmtLJbePYrhbw-xd5-jaD=wwaMG2Xc8N_x8yjLSCD0Lw@mail.gmail.com> <20230626053446-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230626053446-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 27 Jun 2023 16:07:42 +0800
Message-ID: <CACGkMEsDvu9ZzueSumA4k+cHoE7O=hkCrrdqKsqiNzgkfuv6ZA@mail.gmail.com>
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

On Mon, Jun 26, 2023 at 5:40=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com>=
 wrote:
>
> On Mon, Jun 26, 2023 at 10:19:48AM +0200, Eugenio Perez Martin wrote:
> > On Mon, Jun 26, 2023 at 4:53=E2=80=AFAM Jason Wang <jasowang@redhat.com=
> wrote:
> > >
> > > On Mon, Jun 26, 2023 at 5:32=E2=80=AFAM Michael S. Tsirkin <mst@redha=
t.com> wrote:
> > > >
> > > > On Sun, Jun 25, 2023 at 01:31:36PM +0800, Jason Wang wrote:
> > > > > On Sun, Jun 25, 2023 at 2:41=E2=80=AFAM Eugenio Perez Martin
> > > > > <eperezma@redhat.com> wrote:
> > > > > >
> > > > > > On Sun, Jun 18, 2023 at 1:08=E2=80=AFAM Michael S. Tsirkin <mst=
@redhat.com> wrote:
> > > > > > >
> > > > > > > On Sat, Jun 17, 2023 at 02:53:46PM +0200, Eugenio Perez Marti=
n wrote:
> > > > > > > > On Fri, Jun 16, 2023 at 4:40=E2=80=AFPM Michael S. Tsirkin =
<mst@redhat.com> wrote:
> > > > > > > > >
> > > > > > > > > On Thu, Jun 15, 2023 at 10:35:09AM +0200, Eugenio Perez M=
artin wrote:
> > > > > > > > > > On Tue, Jun 13, 2023 at 2:29=E2=80=AFPM Michael S. Tsir=
kin <mst@redhat.com> wrote:
> > > > > > > > > > >
> > > > > > > > > > > On Tue, Jun 13, 2023 at 12:12:43PM +0200, Eugenio Per=
ez Martin wrote:
> > > > > > > > > > > > On Tue, Jun 13, 2023 at 9:53=E2=80=AFAM Michael S. =
Tsirkin <mst@redhat.com> wrote:
> > > > > > > > > > > > >
> > > > > > > > > > > > > On Tue, Jun 13, 2023 at 03:46:35AM -0400, Michael=
 S. Tsirkin wrote:
> > > > > > > > > > > > > > On Mon, Jun 12, 2023 at 09:56:57AM +0200, Eugen=
io Perez Martin wrote:
> > > > > > > > > > > > > > > > > Another drawback of that is the long time=
 a device can spend to
> > > > > > > > > > > > > > > > > reconfigure its memory maps.
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > The map is already used for cvq though, I d=
on't see why it would take
> > > > > > > > > > > > > > > > much more with this.
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > In the case of vDPA HW, CVQ maps may not need=
 to reach the device's or
> > > > > > > > > > > > > > > platform IOMMU, so the modification of that m=
apping is way cheaper.
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > Oh, I get it. It's setup time, but you are righ=
t.
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > taking that into account, does it make
> > > > > > > > > > > > > > > > > sense to send a new version with the bit =
1 on enable?
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > Thanks!
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > Current hardware won't support the extra bi=
t though.
> > > > > > > > > > > > >
> > > > > > > > > > > > >
> > > > > > > > > > > > > Thinking more about this, I think the following w=
orks:
> > > > > > > > > > > > >
> > > > > > > > > > > > > - enable all queues before DRIVER_OK
> > > > > > > > > > > > > - reset all data queues before DRIVER_OK
> > > > > > > > > > > > > - DRIVER_OK
> > > > > > > > > > > > > - CVQ commands
> > > > > > > > > > > > > - re-enable data queues
> > > > > > > > > > > > >
> > > > > > > > > > > > >
> > > > > > > > > > > > > No?
> > > > > > > > > > > > >
> > > > > > > > > > > >
> > > > > > > > > > > > If it is valid to write to queue_reset before DRIVE=
R_OK, then sure. I
> > > > > > > > > > > > asked for that in the past at
> > > > > > > > > > > > https://lists.oasis-open.org/archives/virtio-dev/20=
2305/msg00329.html
> > > > > > > > > > > > .
> > > > > > > > > > >
> > > > > > > > > > > Well then Jason said:
> > > > > > > > > > >  we should make svq work without RING_RESET
> > > > > > > > > > > but now apparently we went full circle and propose
> > > > > > > > > > > a feature bit after all?
> > > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > My understanding is that RING_RESET covers more than ju=
st delaying the
> > > > > > > > > > enabling of net data vqs, like to change the address or=
 properties of
> > > > > > > > > > vqs after DRIVER_OK. While the late enabling may be eas=
y to implement
> > > > > > > > > > in current hw, vq property changes may be more challeng=
ing. There are
> > > > > > > > > > current HW that only support late enabling but not reco=
nfigure the
> > > > > > > > > > queues. Ideally, just the subset of late enabling is ne=
eded.
> > > > > > > > > >
> > > > > > > > > > Does it make sense to change the proposal to something =
in the line of:
> > > > > > > > > > RING_F_LATE_ENABLING: This feature flag is a subset of =
_F_RING_RESET.
> > > > > > > > > > If this feature is negotiated, all vqs start as if the =
vqs has been
> > > > > > > > > > reset before DRIVER_OK. This feature does not allow res=
etting a queue
> > > > > > > > > > once it is live.
> > > > > > > > > >
> > > > > > > > > > Thanks!
> > > > > > > > >
> > > > > > > > > Maybe. No idea - I am not a hardware designer. Can some h=
ardware
> > > > > > > > > vendors chime in and confirm?
> > > > > > > > > It seems like a very very narrow "make my hack work" use-=
case.
> > > > > > > > > And I'm not even sure how well it works.
> > > > > > > > > For example what if cvq command enables rss? If the queue=
s in
> > > > > > > > > question are not enabled packets will be dropped.
> > > > > > > > > So - fix some setups, break others?
> > > > > > > > >
> > > > > > > >
> > > > > > > > I don't think it breaks, they are already dropped before se=
tting
> > > > > > > > DRIVER_OK anyway. If we restore the configuration before DR=
IVER_OK in
> > > > > > > > the future, the device is supposed to drop packets meanwhil=
e anyway,
> > > > > > > > isn't it?
> > > > > > >
> > > > > > >
> > > > > > > I just thought of an idea. Devices generally don't poke at ri=
ngs
> > > > > > > by themselves. How about at init time we cause kicks on data =
queues
> > > > > > > to vmexit? Then on 1st kick we map hardware so following ones=
 will
> > > > > > > go straight to hardware. This will make sure cvq is processed
> > > > > > > first. Hmm?
> > > > >
> > > > > This is not the case at least for vhost-net. It doesn't need to b=
e
> > > > > kicked in order to work. And it's an example that we need clearly
> > > > > define the behaviour instead of depending on any existing
> > > > > implementation details.
> > > >
> > > > This kind of guarantee however sounds generally useful to
> > > > control which queues are accessed when.
> > > >
> > > > This is only needed after restore, which is ATM a vdpa thing,
> > > > so can just be a vdpa flag, but I'm ok with it as a
> > > > virtio flag too.
> > >
> > > Great. Having a virtio flag may help to reduce the extra and
> > > duplicated effort spent in vdpa.
> > >
> >
> > So the flag should be something in the line of:
> > VIRTIO_F_ACCESS_AFTER_KICK: The device will only access the ring after
> > the first kick. Before that kick, it will not process any request.
> >
> > ?
> >
> > Thanks!
>
> That's not bad. I am not sure adding this to spec is worth
> the effort but at least it's kind of reasonable.
> Are there uses such as hardening where something like this could be usefu=
l?

I think so, the driver can simply ignore any device notifications
before the first kick. But it doesn't solve all the problems, we still
need to take care about the device without this feature.

Thanks

>
>
> > > Thanks
> > >
> > > >
> > > > > > >
> > > > > >
> > > > > > That would be possible, but nothing prevents the hw to start
> > > > > > processing requests even without that first kick, isn't it?
> > > > >
> > > > > Yes.
> > > > >
> > > > > Thanks
> > > > >
> > > > > >
> > > > > > I think that was discussed also in the past, as previous qemu p=
atches
> > > > > > gave a spurious kick to start queues just in case. I think the
> > > > > > conclusion was that at least the vDPA device will start process=
ing
> > > > > > requests at DRIVER_OK, no need to wait for a kick.
> > > > > >
> > > > > > https://lore.kernel.org/all/CACGkMEt8cMM1UxVzxb0eHeaWSpR0ApvGza=
F901vrM4m-uGMiPA@mail.gmail.com/
> > > > > >
> > > > > > Thanks!
> > > > > >
> > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > > >
> > > > > > > > > > > > >
> > > > > > > > > > > > > > --
> > > > > > > > > > > > > > MST
> > > > > > > > > > > > >
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

