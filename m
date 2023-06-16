Return-Path: <virtio-comment-return-6363-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1A37EB64D7
	for <virtio-comment@archiver.kernel.org>; Fri, 16 Jun 2023 14:40:37 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id CB16918C9C8
	for <virtio-comment@archiver.kernel.org>; Fri, 16 Jun 2023 14:40:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9D5B5986808
	for <virtio-comment@archiver.kernel.org>; Fri, 16 Jun 2023 14:40:36 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 8A3D4986669; Fri, 16 Jun 2023 14:40:36 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 76FB8986801
	for <virtio-comment@lists.oasis-open.org>; Fri, 16 Jun 2023 14:40:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: MYIey-QQMzGZdyl4t1Rldw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686926433; x=1689518433;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VuYMR4FWuF/WtAdytnMzyg+AcAWbjjW4EqaVmg7azwc=;
        b=KFNoTsKEsdLWMI4NZmNa7DnrkGsSJAix/5wkGjw6I7HQJXeujsC6QKg7DSbOqslAyz
         NU+/+iiI+/xDXioCdbuZ0AheJHIpB0nD2mw4AQ3BtX206lfmEzZ88tlf3LflTRQhuDr1
         8Q7L5d1Wid4BvZoo55LmAvsoWKz98hVMr8iZzX5V5Flz/DfW1nhECqe7N39aTPYz2HJu
         dZnUir5wT4szjJOssJUlIEGTszsJEE7tWOxHVu6jVqhXd2iFIDftzlpoilgmKWIR4YFT
         4v1Af0VT/mMRBOgxtcrv1l3mwoyFgACL3jb1V+junLRVHb7xXt5zT2YPUHAH/SGKO8Qn
         2rhg==
X-Gm-Message-State: AC+VfDwq1UKLz6EkwLRD5IVib2DqGWZ+RvdyZDpepKa7Biu1NaTjMEAT
	B09NalI11v2WvhcX6+Kl79MH+mhQKJ6WIr6nX4NUdUM8leJ7eZdbSXpBl1KGHQcvZGvcUTrehif
	uBbl4k1pIx/TQ/ZDMi2k/bde8ve6mDG7jXQ==
X-Received: by 2002:a05:6000:136c:b0:311:500:a5c7 with SMTP id q12-20020a056000136c00b003110500a5c7mr1514794wrz.52.1686926433150;
        Fri, 16 Jun 2023 07:40:33 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6gG/F2Hq6b7qUtwCCNDOmtV0cVUnwjxwtaQHemzXoJwQwg0Kas5hiyU5ghLZsmIP54o1m7pw==
X-Received: by 2002:a05:6000:136c:b0:311:500:a5c7 with SMTP id q12-20020a056000136c00b003110500a5c7mr1514763wrz.52.1686926432772;
        Fri, 16 Jun 2023 07:40:32 -0700 (PDT)
Date: Fri, 16 Jun 2023 10:40:28 -0400
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
Message-ID: <20230616102011-mutt-send-email-mst@kernel.org>
References: <CAJaqyWf+vn06NHcQY208dwyB=WH3PQ3A7z53o0BTy102XrT+3Q@mail.gmail.com>
 <20230608180617-mutt-send-email-mst@kernel.org>
 <CAJaqyWf-=R+KHfBjzrGzkunTdeV8sAgFUv_kYoxNo3uqH2OOSw@mail.gmail.com>
 <20230609115250-mutt-send-email-mst@kernel.org>
 <CAJaqyWfOONuDoewWR7VcsxYB34=m23GqTo2=sroUf-JvvQGJcg@mail.gmail.com>
 <20230613034216-mutt-send-email-mst@kernel.org>
 <20230613035132-mutt-send-email-mst@kernel.org>
 <CAJaqyWfOi5D+f+JPBFZ8Rw+TCG5TLE+X8affo-EBaCAQx8_2vQ@mail.gmail.com>
 <20230613082755-mutt-send-email-mst@kernel.org>
 <CAJaqyWdTPmvrGvOStY-uTg1KboAC6s7s8+1JkF1xWFUBwBVT+g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJaqyWdTPmvrGvOStY-uTg1KboAC6s7s8+1JkF1xWFUBwBVT+g@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] Re: [PATCH 0/2] Selective queue enabling

On Thu, Jun 15, 2023 at 10:35:09AM +0200, Eugenio Perez Martin wrote:
> On Tue, Jun 13, 2023 at 2:29 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Tue, Jun 13, 2023 at 12:12:43PM +0200, Eugenio Perez Martin wrote:
> > > On Tue, Jun 13, 2023 at 9:53 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > >
> > > > On Tue, Jun 13, 2023 at 03:46:35AM -0400, Michael S. Tsirkin wrote:
> > > > > On Mon, Jun 12, 2023 at 09:56:57AM +0200, Eugenio Perez Martin wrote:
> > > > > > > > Another drawback of that is the long time a device can spend to
> > > > > > > > reconfigure its memory maps.
> > > > > > >
> > > > > > > The map is already used for cvq though, I don't see why it would take
> > > > > > > much more with this.
> > > > > > >
> > > > > >
> > > > > > In the case of vDPA HW, CVQ maps may not need to reach the device's or
> > > > > > platform IOMMU, so the modification of that mapping is way cheaper.
> > > > >
> > > > > Oh, I get it. It's setup time, but you are right.
> > > > >
> > > > > > > > taking that into account, does it make
> > > > > > > > sense to send a new version with the bit 1 on enable?
> > > > > > > >
> > > > > > > > Thanks!
> > > > > > >
> > > > > > > Current hardware won't support the extra bit though.
> > > >
> > > >
> > > > Thinking more about this, I think the following works:
> > > >
> > > > - enable all queues before DRIVER_OK
> > > > - reset all data queues before DRIVER_OK
> > > > - DRIVER_OK
> > > > - CVQ commands
> > > > - re-enable data queues
> > > >
> > > >
> > > > No?
> > > >
> > >
> > > If it is valid to write to queue_reset before DRIVER_OK, then sure. I
> > > asked for that in the past at
> > > https://lists.oasis-open.org/archives/virtio-dev/202305/msg00329.html
> > > .
> >
> > Well then Jason said:
> >  we should make svq work without RING_RESET
> > but now apparently we went full circle and propose
> > a feature bit after all?
> >
> 
> My understanding is that RING_RESET covers more than just delaying the
> enabling of net data vqs, like to change the address or properties of
> vqs after DRIVER_OK. While the late enabling may be easy to implement
> in current hw, vq property changes may be more challenging. There are
> current HW that only support late enabling but not reconfigure the
> queues. Ideally, just the subset of late enabling is needed.
> 
> Does it make sense to change the proposal to something in the line of:
> RING_F_LATE_ENABLING: This feature flag is a subset of _F_RING_RESET.
> If this feature is negotiated, all vqs start as if the vqs has been
> reset before DRIVER_OK. This feature does not allow resetting a queue
> once it is live.
> 
> Thanks!

Maybe. No idea - I am not a hardware designer. Can some hardware
vendors chime in and confirm?
It seems like a very very narrow "make my hack work" use-case.
And I'm not even sure how well it works.
For example what if cvq command enables rss? If the queues in
question are not enabled packets will be dropped.
So - fix some setups, break others?


> >
> > > >
> > > >
> > > > > --
> > > > > MST
> > > >
> > > >
> > > > This publicly archived list offers a means to provide input to the
> > > > OASIS Virtual I/O Device (VIRTIO) TC.
> > > >
> > > > In order to verify user consent to the Feedback License terms and
> > > > to minimize spam in the list archive, subscription is required
> > > > before posting.
> > > >
> > > > Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> > > > Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> > > > List help: virtio-comment-help@lists.oasis-open.org
> > > > List archive: https://lists.oasis-open.org/archives/virtio-comment/
> > > > Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
> > > > List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
> > > > Committee: https://www.oasis-open.org/committees/virtio/
> > > > Join OASIS: https://www.oasis-open.org/join/
> > > >
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

