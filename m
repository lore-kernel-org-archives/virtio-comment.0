Return-Path: <virtio-comment-return-8302-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2479C4332F
	for <virtio-comment@archiver.kernel.org>; Thu,  9 Nov 2023 10:42:00 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 3A9343358F
	for <virtio-comment@archiver.kernel.org>; Thu,  9 Nov 2023 10:42:00 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1A151986CD5
	for <virtio-comment@archiver.kernel.org>; Thu,  9 Nov 2023 10:42:00 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 00B68986CCD; Thu,  9 Nov 2023 10:42:00 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E4BA7986CCE
	for <virtio-comment@lists.oasis-open.org>; Thu,  9 Nov 2023 10:41:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: ohSh8HXRN5uzvxahcSCGlA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699526514; x=1700131314;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/NZFbJd08vQZL7JD54HwCrBUCqPlRiLOg4FhmGiSe3w=;
        b=nvLwnNRj6U25Fs86kUJMJw2enTkJlqOZROy4k442hftMIJ/V4Z0q8NFm8PYx5M6Tm5
         uBKR5YBrJbyExEsFiTWVIbBRpRtYFLv3l1WcAds10rInwjiqwaQLoIqGVP5JKNgoDW4T
         mZa9Tf8Bbx5laQQk2hOjvdYZjsrofKoOqF9gRos4sB0i1sM0anBe7hm5763JIFuX2+AM
         h0+ntyP50D3KaFPyX9hBUZ1ZzgtrNRkUvZU24QirgQDQMkrHp6FyHwRbpEi7892/kN8n
         diJa57wOzIk6v/+N8xjuiAQgIve2D8q1QOThYO8vBuBEMgpwrhMKdzKJexWKgzum59Mo
         eCPA==
X-Gm-Message-State: AOJu0Yz4sQbQSk+u+5DwAK2sSZtfEdOQ8tdg/YdgazRXm+yHHZlW4Dmz
	nFMWOc1Wmbnt4Yf+W0vGKDUZwYMoZ7wbl21aSsmYOzRW+4mXcN1e9wGAEX3RUcltdKfD20g83nb
	K/b+TdVi6+58T5YYA7IE//paGX8ibDGTwIw==
X-Received: by 2002:a17:906:7498:b0:9a1:8993:9532 with SMTP id e24-20020a170906749800b009a189939532mr8153895ejl.30.1699526514540;
        Thu, 09 Nov 2023 02:41:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFT3dh+nwcgT0pVJmpuzNVxIuSH1y0IxYF+qa7rWXtfiRtRqR4u3UnpEa4GvcI+3G+ycowHmg==
X-Received: by 2002:a17:906:7498:b0:9a1:8993:9532 with SMTP id e24-20020a170906749800b009a189939532mr8153876ejl.30.1699526514123;
        Thu, 09 Nov 2023 02:41:54 -0800 (PST)
Date: Thu, 9 Nov 2023 05:41:50 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>
Cc: Parav Pandit <parav@nvidia.com>,
	"jasowang@redhat.com" <jasowang@redhat.com>,
	"eperezma@redhat.com" <eperezma@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"stefanha@redhat.com" <stefanha@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
Message-ID: <20231109053050-mutt-send-email-mst@kernel.org>
References: <20231103064730-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481D028E63E6CB0AA7F4149DCA5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <fdfda658-e89c-41f4-9f4c-77d5d9b1b642@intel.com>
 <PH0PR12MB54818179419B06412D7A9C84DCA5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231105075906-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54819604160CF0A2566AFB5DDCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231107054348-mutt-send-email-mst@kernel.org>
 <4d4dc2fc-7563-4224-b96e-2c82f6248432@intel.com>
 <20231108121710-mutt-send-email-mst@kernel.org>
 <1e92209d-0bb7-4dea-83c2-106ec74e5539@intel.com>
MIME-Version: 1.0
In-Reply-To: <1e92209d-0bb7-4dea-83c2-106ec74e5539@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] Re: [PATCH V2 6/6] virtio-pci: implement dirty
 page tracking

On Thu, Nov 09, 2023 at 06:29:59PM +0800, Zhu, Lingshan wrote:
> 
> 
> On 11/9/2023 1:18 AM, Michael S. Tsirkin wrote:
> > On Wed, Nov 08, 2023 at 05:29:00PM +0800, Zhu, Lingshan wrote:
> > > 
> > > On 11/7/2023 7:13 PM, Michael S. Tsirkin wrote:
> > > > On Mon, Nov 06, 2023 at 04:03:42AM +0000, Parav Pandit wrote:
> > > > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > > > Sent: Sunday, November 5, 2023 9:42 PM
> > > > > > 
> > > > > > On Fri, Nov 03, 2023 at 03:47:34PM +0000, Parav Pandit wrote:
> > > > > > > > > [1]
> > > > > > > > > https://lists.oasis-open.org/archives/virtio-comment/202310/msg004
> > > > > > > > > 75.h
> > > > > > > > > tml
> > > > > > > > you still need to explain why this does not work for pass-through.
> > > > > > > It does not work for following reasons.
> > > > > > > 1. Because all the fields that put on the member device are not in direct
> > > > > > control of the hypervisor.
> > > > > > > The device is directly controlled by the guest including the device status and
> > > > > > when it resets the device all the things stored in the device are lost.
> > > > > > 
> > > > > > I think the idea is that when this gateway is in the device then device reset has
> > > > > > to trap. At a high level, ok. But then what?
> > > > > > Is a full scan of all memory required until device reset is complete?
> > > > > > Drivers currently tend to busy poll the reset register, if this takes very long we
> > > > > > might start seeing soft lockup messages. What is the idea then? Maybe for this
> > > > > > we need a separate weaker reset that does not touch this capability?
> > > > > > 
> > > > > You meant the gateway is not in the device, right?
> > > > > 
> > > > > I likely didn't understand. I don't see a relation to timing.
> > > > > 
> > > > > When the device reset is not trapped by the hypervisor, most things does not work, it requires trapping other things to like cvq, device registers and more.
> > > > > It may be fine for those use case, but it does not fullfill the requirement of passthrough mode of hw.
> > > > I wish we'd just stop using the term, it just confuses everyone.
> > > > 
> > > > I feel the point worth making is that currently, all this job is done
> > > > by hypervisors. And they manage fine! vdpa really truly does not need
> > > > the SUSPEND bit because it knows about devices and it
> > > > can just use whatever it wants in any vendor specific way it wants.
> > > So true, this is exact what Intel implements in some productions.
> > > > where all this migration work comes handy is if we say that
> > > > we want our device to all just do what the
> > > > spec says. No vendor specific tricks. And I find it exciting that
> > > > there are people who want to work on this instead of
> > > > each vendor wasting man hours on their own almost the same but
> > > > slightly different driver.
> > > I agree
> > > > I personally think this patch is not great for the trap use-case either.
> > > > Why? For example if device is somewhat slow then it will take it
> > > > hundreds of milliseconds to synchronize the whole guest memory, and
> > > > blocking reset means blocking e.g. guest boot.  I was wrong about soft
> > > > lockup btw - linux does msleep which I think means no soft lockups. But boot is
> > > > blocked and modules are not loaded.
> > > I am not sure SUSPEND can block RESET, I think reset can take immediate
> > > actions, because
> > > once reset, whether suspended does not matter.
> > No, because if you don't suspend device will keep changing memory.
> > You need to
> > 1. suspend
> > 2. get all dirty memory synced
> > 3. reset
> > 
> > 
> > Reset earlier will corrupt guest memory.
> IMHO, it may be fine to lose the dirty pages during reset,
> because without an interrupt, the driver won't process the
> dirty pages, they are still considered as unused(even not all zero pages)
> by CPU, so nothing corrupted.
> 
> And if the driver resets the device, it will reinitialize the device
> and re-config the virtqueue including the ring buffer.

It's too late to invent new consistency semantics for virtio.

-- 
MST


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

