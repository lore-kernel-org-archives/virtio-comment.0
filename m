Return-Path: <virtio-comment-return-6492-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FBF6EB64DC
	for <virtio-comment@archiver.kernel.org>; Sun, 25 Jun 2023 21:32:49 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 7B79426A33
	for <virtio-comment@archiver.kernel.org>; Sun, 25 Jun 2023 21:32:48 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 65825986317
	for <virtio-comment@archiver.kernel.org>; Sun, 25 Jun 2023 21:32:48 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 53238983F78; Sun, 25 Jun 2023 21:32:48 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 362EF986312
	for <virtio-comment@lists.oasis-open.org>; Sun, 25 Jun 2023 21:32:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: aBOATpYyPFKWr211VBe9pQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687728764; x=1690320764;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Tx7ODM2uRgGFDg0fjdJsTQl8P37zJibMs68kF/B8fLw=;
        b=DAFgYkkt938c2+hFYqlyZRynQ79yDhYZpkhQMRJHGMyY1EiXXKK8/BmdefF97Aw3ff
         kI9SubycAxp9GCpCtc+Ij1h9bR6WOTjOCRUs74bVVQOkKC41quaGD1jKTJLpAro3JOFK
         scYbCQKHg1OAvawJk1P8rOqTWyuL1T04WEBvGXVQskeMDxGYTD+i1AWE9gYplxqeJnM/
         mRcVFmpl/OBdpqNFMbArzGUsdAnBA1HNqCyQclkHTIEaXNNVA7mmgkzTq8Vg8PZh6H7t
         5iGYPTXhVfB4d4dyFL3YdndGh1aqqLcKuZB6KBukr5y47mxAfEcNK62kkKM6K5Q4qjl9
         FB4g==
X-Gm-Message-State: AC+VfDy8KWnQDO7zB5RZya6xL2PKvYfFTYvp0K3vauvZpyrsBdFWzxy7
	Q1cWhof6J7Q6e3rwPxlgKhp0r2k9CQehndlQ8OCVvz2WD6DCD9wDzHgWKkGIpmE72L0InW6mUhz
	XraOY0UAof/dr9yniNQB/o9ShS+VLK3kh2A==
X-Received: by 2002:a7b:c399:0:b0:3fa:95c7:e891 with SMTP id s25-20020a7bc399000000b003fa95c7e891mr912069wmj.35.1687728763860;
        Sun, 25 Jun 2023 14:32:43 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5s2N5YAoMP79Q7hW+DQ6dA6NEBiwca0y5KEqOxj0ohK/wemVcwWqv1ucrfUu23O9mHsYFl3Q==
X-Received: by 2002:a7b:c399:0:b0:3fa:95c7:e891 with SMTP id s25-20020a7bc399000000b003fa95c7e891mr912051wmj.35.1687728763502;
        Sun, 25 Jun 2023 14:32:43 -0700 (PDT)
Date: Sun, 25 Jun 2023 17:32:37 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: Eugenio Perez Martin <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	virtio-comment@lists.oasis-open.org,
	Laurent Vivier <lvivier@redhat.com>, Cindy Lu <lulu@redhat.com>,
	cohuck@redhat.com, alvaro.karsz@solid-run.com,
	Liuxiangdong <liuxiangdong5@huawei.com>,
	Gautam Dawar <gdawar@xilinx.com>, longpeng2@huawei.com,
	Dragos Tatulea <dtatulea@nvidia.com>, parav@nvidia.com,
	stefanha@redhat.com, Harpreet Singh Anand <hanand@xilinx.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
	Heng Qi <hengqi@linux.alibaba.com>,
	Zhu Lingshan <lingshan.zhu@intel.com>,
	Shannon Nelson <snelson@pensando.io>, mgurtovoy@nvidia.com,
	si-wei.liu@oracle.com
Message-ID: <20230625172717-mutt-send-email-mst@kernel.org>
References: <20230613034216-mutt-send-email-mst@kernel.org>
 <20230613035132-mutt-send-email-mst@kernel.org>
 <CAJaqyWfOi5D+f+JPBFZ8Rw+TCG5TLE+X8affo-EBaCAQx8_2vQ@mail.gmail.com>
 <20230613082755-mutt-send-email-mst@kernel.org>
 <CAJaqyWdTPmvrGvOStY-uTg1KboAC6s7s8+1JkF1xWFUBwBVT+g@mail.gmail.com>
 <20230616102011-mutt-send-email-mst@kernel.org>
 <CAJaqyWfx5Z9LxvpHy90EU5ZUHxROKMRtVVw00KAaCm+HzT0ksg@mail.gmail.com>
 <20230617184944-mutt-send-email-mst@kernel.org>
 <CAJaqyWdLHJng86Hu0jPS+YWv-GgdJV8t+sdjcAhW07MKxeqAOA@mail.gmail.com>
 <CACGkMEtnR3iEKvCYBy_9N7NgdORsdcAXTRLF4p-9JJW1fFFMWw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACGkMEtnR3iEKvCYBy_9N7NgdORsdcAXTRLF4p-9JJW1fFFMWw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] Re: [PATCH 0/2] Selective queue enabling

On Sun, Jun 25, 2023 at 01:31:36PM +0800, Jason Wang wrote:
> On Sun, Jun 25, 2023 at 2:41 AM Eugenio Perez Martin
> <eperezma@redhat.com> wrote:
> >
> > On Sun, Jun 18, 2023 at 1:08 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> > >
> > > On Sat, Jun 17, 2023 at 02:53:46PM +0200, Eugenio Perez Martin wrote:
> > > > On Fri, Jun 16, 2023 at 4:40 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > >
> > > > > On Thu, Jun 15, 2023 at 10:35:09AM +0200, Eugenio Perez Martin wrote:
> > > > > > On Tue, Jun 13, 2023 at 2:29 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > > > >
> > > > > > > On Tue, Jun 13, 2023 at 12:12:43PM +0200, Eugenio Perez Martin wrote:
> > > > > > > > On Tue, Jun 13, 2023 at 9:53 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > > > > > >
> > > > > > > > > On Tue, Jun 13, 2023 at 03:46:35AM -0400, Michael S. Tsirkin wrote:
> > > > > > > > > > On Mon, Jun 12, 2023 at 09:56:57AM +0200, Eugenio Perez Martin wrote:
> > > > > > > > > > > > > Another drawback of that is the long time a device can spend to
> > > > > > > > > > > > > reconfigure its memory maps.
> > > > > > > > > > > >
> > > > > > > > > > > > The map is already used for cvq though, I don't see why it would take
> > > > > > > > > > > > much more with this.
> > > > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > In the case of vDPA HW, CVQ maps may not need to reach the device's or
> > > > > > > > > > > platform IOMMU, so the modification of that mapping is way cheaper.
> > > > > > > > > >
> > > > > > > > > > Oh, I get it. It's setup time, but you are right.
> > > > > > > > > >
> > > > > > > > > > > > > taking that into account, does it make
> > > > > > > > > > > > > sense to send a new version with the bit 1 on enable?
> > > > > > > > > > > > >
> > > > > > > > > > > > > Thanks!
> > > > > > > > > > > >
> > > > > > > > > > > > Current hardware won't support the extra bit though.
> > > > > > > > >
> > > > > > > > >
> > > > > > > > > Thinking more about this, I think the following works:
> > > > > > > > >
> > > > > > > > > - enable all queues before DRIVER_OK
> > > > > > > > > - reset all data queues before DRIVER_OK
> > > > > > > > > - DRIVER_OK
> > > > > > > > > - CVQ commands
> > > > > > > > > - re-enable data queues
> > > > > > > > >
> > > > > > > > >
> > > > > > > > > No?
> > > > > > > > >
> > > > > > > >
> > > > > > > > If it is valid to write to queue_reset before DRIVER_OK, then sure. I
> > > > > > > > asked for that in the past at
> > > > > > > > https://lists.oasis-open.org/archives/virtio-dev/202305/msg00329.html
> > > > > > > > .
> > > > > > >
> > > > > > > Well then Jason said:
> > > > > > >  we should make svq work without RING_RESET
> > > > > > > but now apparently we went full circle and propose
> > > > > > > a feature bit after all?
> > > > > > >
> > > > > >
> > > > > > My understanding is that RING_RESET covers more than just delaying the
> > > > > > enabling of net data vqs, like to change the address or properties of
> > > > > > vqs after DRIVER_OK. While the late enabling may be easy to implement
> > > > > > in current hw, vq property changes may be more challenging. There are
> > > > > > current HW that only support late enabling but not reconfigure the
> > > > > > queues. Ideally, just the subset of late enabling is needed.
> > > > > >
> > > > > > Does it make sense to change the proposal to something in the line of:
> > > > > > RING_F_LATE_ENABLING: This feature flag is a subset of _F_RING_RESET.
> > > > > > If this feature is negotiated, all vqs start as if the vqs has been
> > > > > > reset before DRIVER_OK. This feature does not allow resetting a queue
> > > > > > once it is live.
> > > > > >
> > > > > > Thanks!
> > > > >
> > > > > Maybe. No idea - I am not a hardware designer. Can some hardware
> > > > > vendors chime in and confirm?
> > > > > It seems like a very very narrow "make my hack work" use-case.
> > > > > And I'm not even sure how well it works.
> > > > > For example what if cvq command enables rss? If the queues in
> > > > > question are not enabled packets will be dropped.
> > > > > So - fix some setups, break others?
> > > > >
> > > >
> > > > I don't think it breaks, they are already dropped before setting
> > > > DRIVER_OK anyway. If we restore the configuration before DRIVER_OK in
> > > > the future, the device is supposed to drop packets meanwhile anyway,
> > > > isn't it?
> > >
> > >
> > > I just thought of an idea. Devices generally don't poke at rings
> > > by themselves. How about at init time we cause kicks on data queues
> > > to vmexit? Then on 1st kick we map hardware so following ones will
> > > go straight to hardware. This will make sure cvq is processed
> > > first. Hmm?
> 
> This is not the case at least for vhost-net. It doesn't need to be
> kicked in order to work. And it's an example that we need clearly
> define the behaviour instead of depending on any existing
> implementation details.

This kind of guarantee however sounds generally useful to
control which queues are accessed when.

This is only needed after restore, which is ATM a vdpa thing,
so can just be a vdpa flag, but I'm ok with it as a
virtio flag too.

> > >
> >
> > That would be possible, but nothing prevents the hw to start
> > processing requests even without that first kick, isn't it?
> 
> Yes.
> 
> Thanks
> 
> >
> > I think that was discussed also in the past, as previous qemu patches
> > gave a spurious kick to start queues just in case. I think the
> > conclusion was that at least the vDPA device will start processing
> > requests at DRIVER_OK, no need to wait for a kick.
> >
> > https://lore.kernel.org/all/CACGkMEt8cMM1UxVzxb0eHeaWSpR0ApvGzaF901vrM4m-uGMiPA@mail.gmail.com/
> >
> > Thanks!
> >
> > > > >
> > > > > > >
> > > > > > > > >
> > > > > > > > >
> > > > > > > > > > --
> > > > > > > > > > MST
> > > > > > > > >
> > > > > > > > >
> > > > > > > > > This publicly archived list offers a means to provide input to the
> > > > > > > > > OASIS Virtual I/O Device (VIRTIO) TC.
> > > > > > > > >
> > > > > > > > > In order to verify user consent to the Feedback License terms and
> > > > > > > > > to minimize spam in the list archive, subscription is required
> > > > > > > > > before posting.
> > > > > > > > >
> > > > > > > > > Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> > > > > > > > > Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> > > > > > > > > List help: virtio-comment-help@lists.oasis-open.org
> > > > > > > > > List archive: https://lists.oasis-open.org/archives/virtio-comment/
> > > > > > > > > Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
> > > > > > > > > List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
> > > > > > > > > Committee: https://www.oasis-open.org/committees/virtio/
> > > > > > > > > Join OASIS: https://www.oasis-open.org/join/
> > > > > > > > >
> > > > > > >
> > > > >
> > >
> >


This publicly archived list offers a means to provide input to the
OASIS Virtual I/O Device (VIRTIO) TC.

In order to verify user consent to the Feedback License terms and
to minimize spam in the list archive, subscription is required
before posting.

Subscribe: virtio-comment-subscribe@lists.oasis-open.org
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
List help: virtio-comment-help@lists.oasis-open.org
List archive: https://lists.oasis-open.org/archives/virtio-comment/
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

