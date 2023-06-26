Return-Path: <virtio-comment-return-6521-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 915B1EB64DA
	for <virtio-comment@archiver.kernel.org>; Mon, 26 Jun 2023 09:40:57 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id CB51671C87
	for <virtio-comment@archiver.kernel.org>; Mon, 26 Jun 2023 09:40:56 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B5CBE986394
	for <virtio-comment@archiver.kernel.org>; Mon, 26 Jun 2023 09:40:56 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id A3B4898636F; Mon, 26 Jun 2023 09:40:56 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 907F0986382
	for <virtio-comment@lists.oasis-open.org>; Mon, 26 Jun 2023 09:40:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: Geh4a3FgP5a3lWoiXQryCg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687772452; x=1690364452;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VEZb8yWc/A2KFrt9eUj5XcGl5wkTfmMluIYztSPM8kI=;
        b=HFgwdpeeGPfxQEtM4Gxd3H9DZgzive111IEEuhTVf872qxyCUjxjAOYUbh7+g6KXwX
         eVNcrVvvaIkcUI87HthWC3P+N3LPnSKf0aL+Xj3wi4gKpFqR3M/LPVWa7pxWiZ4v1cHy
         k+0eqdLa2Jn1X1cdq88e5hiYELYGd23bibk7Blyw0t3s6q3I0FtfZBBooVoPPtE4O6SX
         y24X9gEWNFbqAjY54Ss4pX5tFHu42D95C6mYmaNlFEGykyYKOq7ij5oeae9X63zsTkLZ
         vNEelpRJIMM2YmRazgOhV/jZdhLS46OA+glz6kjiIPGIQVMDSi+A3e29ULtLfAD0FVza
         JYGA==
X-Gm-Message-State: AC+VfDx5V/I4sBG/2Yhn8BS8UD27XJrIvvwgKQfiE+FD9Y6tdAHIY2B4
	0KOSmh+lOuHiGH7LBguk/HpGy8YxL7+bNlP0qxwQ3YX9nWMh7b5bmEcvfyVOZBKJgsya4Zktg38
	gCB8VXjMzdaIvQaq/8GRb9M91+8S8qgX4VQ==
X-Received: by 2002:a5d:538b:0:b0:30f:c42e:3299 with SMTP id d11-20020a5d538b000000b0030fc42e3299mr19628084wrv.60.1687772452689;
        Mon, 26 Jun 2023 02:40:52 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4RIupjCCPqm79SOUVJqyzGtoaX8h1iHGXeh1vVF6PDJHfg66UJqpbRVTfifhyYDddVviZOvQ==
X-Received: by 2002:a5d:538b:0:b0:30f:c42e:3299 with SMTP id d11-20020a5d538b000000b0030fc42e3299mr19628073wrv.60.1687772452324;
        Mon, 26 Jun 2023 02:40:52 -0700 (PDT)
Date: Mon, 26 Jun 2023 05:40:47 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>,
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
Message-ID: <20230626053446-mutt-send-email-mst@kernel.org>
References: <20230613082755-mutt-send-email-mst@kernel.org>
 <CAJaqyWdTPmvrGvOStY-uTg1KboAC6s7s8+1JkF1xWFUBwBVT+g@mail.gmail.com>
 <20230616102011-mutt-send-email-mst@kernel.org>
 <CAJaqyWfx5Z9LxvpHy90EU5ZUHxROKMRtVVw00KAaCm+HzT0ksg@mail.gmail.com>
 <20230617184944-mutt-send-email-mst@kernel.org>
 <CAJaqyWdLHJng86Hu0jPS+YWv-GgdJV8t+sdjcAhW07MKxeqAOA@mail.gmail.com>
 <CACGkMEtnR3iEKvCYBy_9N7NgdORsdcAXTRLF4p-9JJW1fFFMWw@mail.gmail.com>
 <20230625172717-mutt-send-email-mst@kernel.org>
 <CACGkMEsF08=U0i8Vyd3_aRGm78Y==HSyTqsAzYJC2OCXyqmDiw@mail.gmail.com>
 <CAJaqyWfmtLJbePYrhbw-xd5-jaD=wwaMG2Xc8N_x8yjLSCD0Lw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJaqyWfmtLJbePYrhbw-xd5-jaD=wwaMG2Xc8N_x8yjLSCD0Lw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] Re: [PATCH 0/2] Selective queue enabling

On Mon, Jun 26, 2023 at 10:19:48AM +0200, Eugenio Perez Martin wrote:
> On Mon, Jun 26, 2023 at 4:53 AM Jason Wang <jasowang@redhat.com> wrote:
> >
> > On Mon, Jun 26, 2023 at 5:32 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> > >
> > > On Sun, Jun 25, 2023 at 01:31:36PM +0800, Jason Wang wrote:
> > > > On Sun, Jun 25, 2023 at 2:41 AM Eugenio Perez Martin
> > > > <eperezma@redhat.com> wrote:
> > > > >
> > > > > On Sun, Jun 18, 2023 at 1:08 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > > >
> > > > > > On Sat, Jun 17, 2023 at 02:53:46PM +0200, Eugenio Perez Martin wrote:
> > > > > > > On Fri, Jun 16, 2023 at 4:40 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > > > > >
> > > > > > > > On Thu, Jun 15, 2023 at 10:35:09AM +0200, Eugenio Perez Martin wrote:
> > > > > > > > > On Tue, Jun 13, 2023 at 2:29 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > > > > > > >
> > > > > > > > > > On Tue, Jun 13, 2023 at 12:12:43PM +0200, Eugenio Perez Martin wrote:
> > > > > > > > > > > On Tue, Jun 13, 2023 at 9:53 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > > > > > > > > >
> > > > > > > > > > > > On Tue, Jun 13, 2023 at 03:46:35AM -0400, Michael S. Tsirkin wrote:
> > > > > > > > > > > > > On Mon, Jun 12, 2023 at 09:56:57AM +0200, Eugenio Perez Martin wrote:
> > > > > > > > > > > > > > > > Another drawback of that is the long time a device can spend to
> > > > > > > > > > > > > > > > reconfigure its memory maps.
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > The map is already used for cvq though, I don't see why it would take
> > > > > > > > > > > > > > > much more with this.
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > In the case of vDPA HW, CVQ maps may not need to reach the device's or
> > > > > > > > > > > > > > platform IOMMU, so the modification of that mapping is way cheaper.
> > > > > > > > > > > > >
> > > > > > > > > > > > > Oh, I get it. It's setup time, but you are right.
> > > > > > > > > > > > >
> > > > > > > > > > > > > > > > taking that into account, does it make
> > > > > > > > > > > > > > > > sense to send a new version with the bit 1 on enable?
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > Thanks!
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > Current hardware won't support the extra bit though.
> > > > > > > > > > > >
> > > > > > > > > > > >
> > > > > > > > > > > > Thinking more about this, I think the following works:
> > > > > > > > > > > >
> > > > > > > > > > > > - enable all queues before DRIVER_OK
> > > > > > > > > > > > - reset all data queues before DRIVER_OK
> > > > > > > > > > > > - DRIVER_OK
> > > > > > > > > > > > - CVQ commands
> > > > > > > > > > > > - re-enable data queues
> > > > > > > > > > > >
> > > > > > > > > > > >
> > > > > > > > > > > > No?
> > > > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > If it is valid to write to queue_reset before DRIVER_OK, then sure. I
> > > > > > > > > > > asked for that in the past at
> > > > > > > > > > > https://lists.oasis-open.org/archives/virtio-dev/202305/msg00329.html
> > > > > > > > > > > .
> > > > > > > > > >
> > > > > > > > > > Well then Jason said:
> > > > > > > > > >  we should make svq work without RING_RESET
> > > > > > > > > > but now apparently we went full circle and propose
> > > > > > > > > > a feature bit after all?
> > > > > > > > > >
> > > > > > > > >
> > > > > > > > > My understanding is that RING_RESET covers more than just delaying the
> > > > > > > > > enabling of net data vqs, like to change the address or properties of
> > > > > > > > > vqs after DRIVER_OK. While the late enabling may be easy to implement
> > > > > > > > > in current hw, vq property changes may be more challenging. There are
> > > > > > > > > current HW that only support late enabling but not reconfigure the
> > > > > > > > > queues. Ideally, just the subset of late enabling is needed.
> > > > > > > > >
> > > > > > > > > Does it make sense to change the proposal to something in the line of:
> > > > > > > > > RING_F_LATE_ENABLING: This feature flag is a subset of _F_RING_RESET.
> > > > > > > > > If this feature is negotiated, all vqs start as if the vqs has been
> > > > > > > > > reset before DRIVER_OK. This feature does not allow resetting a queue
> > > > > > > > > once it is live.
> > > > > > > > >
> > > > > > > > > Thanks!
> > > > > > > >
> > > > > > > > Maybe. No idea - I am not a hardware designer. Can some hardware
> > > > > > > > vendors chime in and confirm?
> > > > > > > > It seems like a very very narrow "make my hack work" use-case.
> > > > > > > > And I'm not even sure how well it works.
> > > > > > > > For example what if cvq command enables rss? If the queues in
> > > > > > > > question are not enabled packets will be dropped.
> > > > > > > > So - fix some setups, break others?
> > > > > > > >
> > > > > > >
> > > > > > > I don't think it breaks, they are already dropped before setting
> > > > > > > DRIVER_OK anyway. If we restore the configuration before DRIVER_OK in
> > > > > > > the future, the device is supposed to drop packets meanwhile anyway,
> > > > > > > isn't it?
> > > > > >
> > > > > >
> > > > > > I just thought of an idea. Devices generally don't poke at rings
> > > > > > by themselves. How about at init time we cause kicks on data queues
> > > > > > to vmexit? Then on 1st kick we map hardware so following ones will
> > > > > > go straight to hardware. This will make sure cvq is processed
> > > > > > first. Hmm?
> > > >
> > > > This is not the case at least for vhost-net. It doesn't need to be
> > > > kicked in order to work. And it's an example that we need clearly
> > > > define the behaviour instead of depending on any existing
> > > > implementation details.
> > >
> > > This kind of guarantee however sounds generally useful to
> > > control which queues are accessed when.
> > >
> > > This is only needed after restore, which is ATM a vdpa thing,
> > > so can just be a vdpa flag, but I'm ok with it as a
> > > virtio flag too.
> >
> > Great. Having a virtio flag may help to reduce the extra and
> > duplicated effort spent in vdpa.
> >
> 
> So the flag should be something in the line of:
> VIRTIO_F_ACCESS_AFTER_KICK: The device will only access the ring after
> the first kick. Before that kick, it will not process any request.
> 
> ?
> 
> Thanks!

That's not bad. I am not sure adding this to spec is worth
the effort but at least it's kind of reasonable.
Are there uses such as hardening where something like this could be useful?


> > Thanks
> >
> > >
> > > > > >
> > > > >
> > > > > That would be possible, but nothing prevents the hw to start
> > > > > processing requests even without that first kick, isn't it?
> > > >
> > > > Yes.
> > > >
> > > > Thanks
> > > >
> > > > >
> > > > > I think that was discussed also in the past, as previous qemu patches
> > > > > gave a spurious kick to start queues just in case. I think the
> > > > > conclusion was that at least the vDPA device will start processing
> > > > > requests at DRIVER_OK, no need to wait for a kick.
> > > > >
> > > > > https://lore.kernel.org/all/CACGkMEt8cMM1UxVzxb0eHeaWSpR0ApvGzaF901vrM4m-uGMiPA@mail.gmail.com/
> > > > >
> > > > > Thanks!
> > > > >
> > > > > > > >
> > > > > > > > > >
> > > > > > > > > > > >
> > > > > > > > > > > >
> > > > > > > > > > > > > --
> > > > > > > > > > > > > MST
> > > > > > > > > > > >
> > > > > > > > > > > >
> > > > > > > > > > > > This publicly archived list offers a means to provide input to the
> > > > > > > > > > > > OASIS Virtual I/O Device (VIRTIO) TC.
> > > > > > > > > > > >
> > > > > > > > > > > > In order to verify user consent to the Feedback License terms and
> > > > > > > > > > > > to minimize spam in the list archive, subscription is required
> > > > > > > > > > > > before posting.
> > > > > > > > > > > >
> > > > > > > > > > > > Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> > > > > > > > > > > > Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> > > > > > > > > > > > List help: virtio-comment-help@lists.oasis-open.org
> > > > > > > > > > > > List archive: https://lists.oasis-open.org/archives/virtio-comment/
> > > > > > > > > > > > Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
> > > > > > > > > > > > List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
> > > > > > > > > > > > Committee: https://www.oasis-open.org/committees/virtio/
> > > > > > > > > > > > Join OASIS: https://www.oasis-open.org/join/
> > > > > > > > > > > >
> > > > > > > > > >
> > > > > > > >
> > > > > >
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

