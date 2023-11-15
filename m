Return-Path: <virtio-comment-return-8362-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBEC4C07548
	for <virtio-comment@archiver.kernel.org>; Wed, 15 Nov 2023 08:05:37 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 1227C77C0B
	for <virtio-comment@archiver.kernel.org>; Wed, 15 Nov 2023 08:05:37 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DA79B986DA3
	for <virtio-comment@archiver.kernel.org>; Wed, 15 Nov 2023 08:05:36 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id BE461986D99; Wed, 15 Nov 2023 08:05:36 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CD422986D9A
	for <virtio-comment@lists.oasis-open.org>; Wed, 15 Nov 2023 08:05:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: Is8WzGvwNU2XqHssD0VQUg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700035510; x=1700640310;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kqJy3fVo0utISH73Quobv5qOf/4/2FDtmv8Mok49DR0=;
        b=ofNSUKd8KHON7UAIfd4yW1SajQbsNY7r4ARwgwHDznzywpsTTKYGST2xslOZqe6arW
         Y5g61nwy9xnJW9IN42YxHtH3If5yblnUy2ZYPOkXLR2H9D/X8XoVllTbim6z+RQbijr5
         AE62lAnQesPREnZ9GXDn0gJkiQNSUaoTDb1yjnqdrJhtag8YtSEB4VHKeZ3IDwx9g0eZ
         jbaH70PBrbXcikj7GfC8Mhoc2BEO9A7wC+A44Q1C5X6ZVPRpKKnPuhR4AaEdkP7nUI8r
         UKSgG7796QR59xPvfzGzQZOf0f0Xk4A19CZla0CYcRd0k/YE7WxKp7aBixkBB2diNavf
         S/uA==
X-Gm-Message-State: AOJu0Yztxufwa5rD/HwuFnHm5R17X1HkT9WIRnZsqEKzVH3CY9GJv64f
	M7kYDhL3iLpWe06AGmjbHW5mTLmsAA9y89V1i/JrBiLzF13+WBF94XeA60EbJEm1giUKnNewp0a
	EBqQiOm1bhUfLzvCcEFwA6ueWc4/iNd4eUw==
X-Received: by 2002:a19:8c10:0:b0:50a:9652:31d4 with SMTP id o16-20020a198c10000000b0050a965231d4mr823385lfd.22.1700035510666;
        Wed, 15 Nov 2023 00:05:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGtKb6ckxpTl2ZDC0ipMW1DVJAb0/dFGLIl5BHkruOvfDTHQct3YXXEUtNC3Z2SOHbPihGdhQ==
X-Received: by 2002:a19:8c10:0:b0:50a:9652:31d4 with SMTP id o16-20020a198c10000000b0050a965231d4mr823365lfd.22.1700035510252;
        Wed, 15 Nov 2023 00:05:10 -0800 (PST)
Date: Wed, 15 Nov 2023 03:05:05 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>
Cc: Jason Wang <jasowang@redhat.com>, Parav Pandit <parav@nvidia.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>
Message-ID: <20231115030025-mutt-send-email-mst@kernel.org>
References: <20231108025854-mutt-send-email-mst@kernel.org>
 <CACGkMEvkQawXWCvu7rZHnZk8YsNunS_B-fcQmEHEe_N87Q6y6g@mail.gmail.com>
 <20231109022647-mutt-send-email-mst@kernel.org>
 <CACGkMEuSpZ0Y8kxXv26b38pvX--OCdvWm5KvMniqo=W10ruBTA@mail.gmail.com>
 <20231113013016-mutt-send-email-mst@kernel.org>
 <9952859f-1b72-46bf-b386-7c3f5c69269f@intel.com>
 <20231114032553-mutt-send-email-mst@kernel.org>
 <b9b8a564-b2eb-4c1c-9ada-975f3833e282@intel.com>
 <20231115025002-mutt-send-email-mst@kernel.org>
 <5c1c6815-f144-4d81-bef7-59a7608936c6@intel.com>
MIME-Version: 1.0
In-Reply-To: <5c1c6815-f144-4d81-bef7-59a7608936c6@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH v3 6/8] admin: Add theory of operation for write
 recording commands

On Wed, Nov 15, 2023 at 03:59:16PM +0800, Zhu, Lingshan wrote:
> 
> 
> On 11/15/2023 3:51 PM, Michael S. Tsirkin wrote:
> > On Wed, Nov 15, 2023 at 12:05:59PM +0800, Zhu, Lingshan wrote:
> > > 
> > > On 11/14/2023 4:27 PM, Michael S. Tsirkin wrote:
> > > > On Tue, Nov 14, 2023 at 03:34:32PM +0800, Zhu, Lingshan wrote:
> > > > > > > So I can't
> > > > > > > believe it has good performance overall. Logging via IOMMU or using
> > > > > > > shadow virtqueue doesn't need any extra PCI transactions at least.
> > > > > > On the other hand they have an extra CPU cost.  Personally if this is
> > > > > > coming from a hardware vendor, I am inclined to trust them wrt PCI
> > > > > > transactions.  But anyway, discussing this at a high level theoretically
> > > > > > is pointless - whoever bothers with actual prototyping for performance
> > > > > > testing wins, if no one does I'd expect a back of a napkin estimate
> > > > > > to be included.
> > > > > if so, Intel has released productions implementing these interfaces years
> > > > > ago,
> > > > > see live migration in 4.1. IFCVF vDPA Implementation,
> > > > > https://doc.dpdk.org/guides-21.11/vdpadevs/ifc.html
> > > > > and
> > > > That one is based on shadow queue, right? Which I think this shows
> > > > is worth supporting.
> > > Yes, it is shadow virtqueue, I assume this is already mostly done,
> > > do you see any gaps we need to address in our series that we should work on?
> > > 
> > > Thanks
> > There were a ton of comments posted on your series.
> Hope I didn't miss anything. I see your latest comments are about vq states,
> as replied before, I think we can record the states by two le16 and the
> in-flight
> descriptor tracking facility.

I don't know why you need the le16. in-flight tracking should be enough.
And given it needs DMA I would try really hard to actually use
admin commands for this. 

> For this shadow virtqueue, do you think I should address this in my V4?
> Like saying: acknowledged control commands through the control virtqueue
> should be recorded, and we want to use shadow virtqueue to track dirty
> pages.

What you need to do is actually describe what do you expect the device
to do when it enters this suspend state. since you mention control
virtqueue then it seems that there needs to be a device type
specific text explaining the behaviour. If so this implies there
needs to be a list of device types that support suspend
until someone looks at each type and documents what it does.

> > 
> > > > > But I still believe we are here try our best to work out an industrial spec
> > > > > with better quality, to serve broad interest. This is not competition
> > > > > between companies,
> > > > > and the spec is not a FIFO, not like a early bird can catch all the worm.


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

