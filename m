Return-Path: <virtio-comment-return-6491-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26927EB64DC
	for <virtio-comment@archiver.kernel.org>; Sun, 25 Jun 2023 05:31:53 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 560F22A8DF
	for <virtio-comment@archiver.kernel.org>; Sun, 25 Jun 2023 05:31:52 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 448869860A7
	for <virtio-comment@archiver.kernel.org>; Sun, 25 Jun 2023 05:31:52 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 3113C98590A; Sun, 25 Jun 2023 05:31:52 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 15BA6985FE2
	for <virtio-comment@lists.oasis-open.org>; Sun, 25 Jun 2023 05:31:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: RNVYIJszOOGIUJ4uB0cRhg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687671108; x=1690263108;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6fepg2E6VgDidyOMoAnMFxT/5pQ1LS59FRHcOEgHQqk=;
        b=H4nsIAtlEy+ackrCe+rSYjjXhvtdibNMQ1eOapW+0IL0C7b7sdvmWUvrFOBnnSIYnL
         ckORRelIsnGcDPyavEZVF15vuzAoUKLPAqXHCY0LAva4+mEd+Pk9DTQ26DcTC2yqFMUw
         rGaqS9RYAXNzvebX4oPknf037rLCCvot6c8Bn4v8B1RD5VvfiUfRY/Rz1UsG1ZJ9/fZ7
         7uRaFuZe5QkenMdgsn1WD2nXwSeso8U6fV4qeiMMCIMo1u9GJ/+j6UYNE0QbT/NnzcLZ
         jEp2INW2nA9eSpXj/TByWxCkkfBrWZQqeTGY6uuteIGa4kmTJDouTs668vw9VCncqQ1F
         t1AQ==
X-Gm-Message-State: AC+VfDxhRvmfYz+ojtBmbfRSSI/DhEWcwmIejW7Qpc9ILNukfAQvlq6s
	g19RmHMJSgCCX/Om7I40DQ+n7LK+avmpMRAPWHMP3kOmH7T8Um56lsRVKdCsHyRJbbfEGC5xudg
	qTrEBoyTKwJLE0evUP7m8cns5t3S4mU5sJAHFMaC/QMePwUa+Pw==
X-Received: by 2002:a19:2d43:0:b0:4f8:5e49:c610 with SMTP id t3-20020a192d43000000b004f85e49c610mr12245959lft.35.1687671107970;
        Sat, 24 Jun 2023 22:31:47 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ62z3KbEpV+bsFTBtGOxM1uN034Km2/3TZQ5Qk4v99jNJi7Enuk/w9dH0hlfDBQnljIdIoKhpgoTk7jhOI++SM=
X-Received: by 2002:a19:2d43:0:b0:4f8:5e49:c610 with SMTP id
 t3-20020a192d43000000b004f85e49c610mr12245950lft.35.1687671107495; Sat, 24
 Jun 2023 22:31:47 -0700 (PDT)
MIME-Version: 1.0
References: <CAJaqyWf-=R+KHfBjzrGzkunTdeV8sAgFUv_kYoxNo3uqH2OOSw@mail.gmail.com>
 <20230609115250-mutt-send-email-mst@kernel.org> <CAJaqyWfOONuDoewWR7VcsxYB34=m23GqTo2=sroUf-JvvQGJcg@mail.gmail.com>
 <20230613034216-mutt-send-email-mst@kernel.org> <20230613035132-mutt-send-email-mst@kernel.org>
 <CAJaqyWfOi5D+f+JPBFZ8Rw+TCG5TLE+X8affo-EBaCAQx8_2vQ@mail.gmail.com>
 <20230613082755-mutt-send-email-mst@kernel.org> <CAJaqyWdTPmvrGvOStY-uTg1KboAC6s7s8+1JkF1xWFUBwBVT+g@mail.gmail.com>
 <20230616102011-mutt-send-email-mst@kernel.org> <CAJaqyWfx5Z9LxvpHy90EU5ZUHxROKMRtVVw00KAaCm+HzT0ksg@mail.gmail.com>
 <20230617184944-mutt-send-email-mst@kernel.org> <CAJaqyWdLHJng86Hu0jPS+YWv-GgdJV8t+sdjcAhW07MKxeqAOA@mail.gmail.com>
In-Reply-To: <CAJaqyWdLHJng86Hu0jPS+YWv-GgdJV8t+sdjcAhW07MKxeqAOA@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Sun, 25 Jun 2023 13:31:36 +0800
Message-ID: <CACGkMEtnR3iEKvCYBy_9N7NgdORsdcAXTRLF4p-9JJW1fFFMWw@mail.gmail.com>
To: Eugenio Perez Martin <eperezma@redhat.com>
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

On Sun, Jun 25, 2023 at 2:41=E2=80=AFAM Eugenio Perez Martin
<eperezma@redhat.com> wrote:
>
> On Sun, Jun 18, 2023 at 1:08=E2=80=AFAM Michael S. Tsirkin <mst@redhat.co=
m> wrote:
> >
> > On Sat, Jun 17, 2023 at 02:53:46PM +0200, Eugenio Perez Martin wrote:
> > > On Fri, Jun 16, 2023 at 4:40=E2=80=AFPM Michael S. Tsirkin <mst@redha=
t.com> wrote:
> > > >
> > > > On Thu, Jun 15, 2023 at 10:35:09AM +0200, Eugenio Perez Martin wrot=
e:
> > > > > On Tue, Jun 13, 2023 at 2:29=E2=80=AFPM Michael S. Tsirkin <mst@r=
edhat.com> wrote:
> > > > > >
> > > > > > On Tue, Jun 13, 2023 at 12:12:43PM +0200, Eugenio Perez Martin =
wrote:
> > > > > > > On Tue, Jun 13, 2023 at 9:53=E2=80=AFAM Michael S. Tsirkin <m=
st@redhat.com> wrote:
> > > > > > > >
> > > > > > > > On Tue, Jun 13, 2023 at 03:46:35AM -0400, Michael S. Tsirki=
n wrote:
> > > > > > > > > On Mon, Jun 12, 2023 at 09:56:57AM +0200, Eugenio Perez M=
artin wrote:
> > > > > > > > > > > > Another drawback of that is the long time a device =
can spend to
> > > > > > > > > > > > reconfigure its memory maps.
> > > > > > > > > > >
> > > > > > > > > > > The map is already used for cvq though, I don't see w=
hy it would take
> > > > > > > > > > > much more with this.
> > > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > In the case of vDPA HW, CVQ maps may not need to reach =
the device's or
> > > > > > > > > > platform IOMMU, so the modification of that mapping is =
way cheaper.
> > > > > > > > >
> > > > > > > > > Oh, I get it. It's setup time, but you are right.
> > > > > > > > >
> > > > > > > > > > > > taking that into account, does it make
> > > > > > > > > > > > sense to send a new version with the bit 1 on enabl=
e?
> > > > > > > > > > > >
> > > > > > > > > > > > Thanks!
> > > > > > > > > > >
> > > > > > > > > > > Current hardware won't support the extra bit though.
> > > > > > > >
> > > > > > > >
> > > > > > > > Thinking more about this, I think the following works:
> > > > > > > >
> > > > > > > > - enable all queues before DRIVER_OK
> > > > > > > > - reset all data queues before DRIVER_OK
> > > > > > > > - DRIVER_OK
> > > > > > > > - CVQ commands
> > > > > > > > - re-enable data queues
> > > > > > > >
> > > > > > > >
> > > > > > > > No?
> > > > > > > >
> > > > > > >
> > > > > > > If it is valid to write to queue_reset before DRIVER_OK, then=
 sure. I
> > > > > > > asked for that in the past at
> > > > > > > https://lists.oasis-open.org/archives/virtio-dev/202305/msg00=
329.html
> > > > > > > .
> > > > > >
> > > > > > Well then Jason said:
> > > > > >  we should make svq work without RING_RESET
> > > > > > but now apparently we went full circle and propose
> > > > > > a feature bit after all?
> > > > > >
> > > > >
> > > > > My understanding is that RING_RESET covers more than just delayin=
g the
> > > > > enabling of net data vqs, like to change the address or propertie=
s of
> > > > > vqs after DRIVER_OK. While the late enabling may be easy to imple=
ment
> > > > > in current hw, vq property changes may be more challenging. There=
 are
> > > > > current HW that only support late enabling but not reconfigure th=
e
> > > > > queues. Ideally, just the subset of late enabling is needed.
> > > > >
> > > > > Does it make sense to change the proposal to something in the lin=
e of:
> > > > > RING_F_LATE_ENABLING: This feature flag is a subset of _F_RING_RE=
SET.
> > > > > If this feature is negotiated, all vqs start as if the vqs has be=
en
> > > > > reset before DRIVER_OK. This feature does not allow resetting a q=
ueue
> > > > > once it is live.
> > > > >
> > > > > Thanks!
> > > >
> > > > Maybe. No idea - I am not a hardware designer. Can some hardware
> > > > vendors chime in and confirm?
> > > > It seems like a very very narrow "make my hack work" use-case.
> > > > And I'm not even sure how well it works.
> > > > For example what if cvq command enables rss? If the queues in
> > > > question are not enabled packets will be dropped.
> > > > So - fix some setups, break others?
> > > >
> > >
> > > I don't think it breaks, they are already dropped before setting
> > > DRIVER_OK anyway. If we restore the configuration before DRIVER_OK in
> > > the future, the device is supposed to drop packets meanwhile anyway,
> > > isn't it?
> >
> >
> > I just thought of an idea. Devices generally don't poke at rings
> > by themselves. How about at init time we cause kicks on data queues
> > to vmexit? Then on 1st kick we map hardware so following ones will
> > go straight to hardware. This will make sure cvq is processed
> > first. Hmm?

This is not the case at least for vhost-net. It doesn't need to be
kicked in order to work. And it's an example that we need clearly
define the behaviour instead of depending on any existing
implementation details.

> >
>
> That would be possible, but nothing prevents the hw to start
> processing requests even without that first kick, isn't it?

Yes.

Thanks

>
> I think that was discussed also in the past, as previous qemu patches
> gave a spurious kick to start queues just in case. I think the
> conclusion was that at least the vDPA device will start processing
> requests at DRIVER_OK, no need to wait for a kick.
>
> https://lore.kernel.org/all/CACGkMEt8cMM1UxVzxb0eHeaWSpR0ApvGzaF901vrM4m-=
uGMiPA@mail.gmail.com/
>
> Thanks!
>
> > > >
> > > > > >
> > > > > > > >
> > > > > > > >
> > > > > > > > > --
> > > > > > > > > MST
> > > > > > > >
> > > > > > > >
> > > > > > > > This publicly archived list offers a means to provide input=
 to the
> > > > > > > > OASIS Virtual I/O Device (VIRTIO) TC.
> > > > > > > >
> > > > > > > > In order to verify user consent to the Feedback License ter=
ms and
> > > > > > > > to minimize spam in the list archive, subscription is requi=
red
> > > > > > > > before posting.
> > > > > > > >
> > > > > > > > Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> > > > > > > > Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.or=
g
> > > > > > > > List help: virtio-comment-help@lists.oasis-open.org
> > > > > > > > List archive: https://lists.oasis-open.org/archives/virtio-=
comment/
> > > > > > > > Feedback License: https://www.oasis-open.org/who/ipr/feedba=
ck_license.pdf
> > > > > > > > List Guidelines: https://www.oasis-open.org/policies-guidel=
ines/mailing-lists
> > > > > > > > Committee: https://www.oasis-open.org/committees/virtio/
> > > > > > > > Join OASIS: https://www.oasis-open.org/join/
> > > > > > > >
> > > > > >
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

