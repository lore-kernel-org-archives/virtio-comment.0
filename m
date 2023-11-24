Return-Path: <virtio-comment-return-8598-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E09ADC61D97
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 06:07:06 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 3DBAC217AE
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 06:07:06 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 16C779868AC
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 06:07:06 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id F2BE69862D9; Fri, 24 Nov 2023 06:07:05 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E38639868A5
	for <virtio-comment@lists.oasis-open.org>; Fri, 24 Nov 2023 06:07:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: KAM9ru5GMcSyxhHiK0Vx-w-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700806022; x=1701410822;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T6zbWIBS3Yf1AHmX5tqG46Go40+OtETTPRk/PwZMYfQ=;
        b=A851LXiX8f4rOf/LSH1cRIBgZICFfiswM30ACQxRWpkPIMobLkV4lOlCzhok0ar/BG
         taHAiLDu7a257l8zDkSowmhYDESrbppY9J/O6w3bQmVgf9JAQ22s/LEYPZEk4aSUjVEr
         sWfm9ECCQF1hiKrHtTkg/wLAPkx3QtmIHASBo2L7vNSUw8I2Xfoxf8sMH8wkH0CrKcuS
         F6BgsoTec1wrA7l7MLf1KiAL7f6eU+vuKk6m/oPVSKiCQh0uMLYBc+ouSLwXnxUVoK4W
         I1jKFJaxCXani2R7+FGfnOQpS9/Vzno6vh0102FNquA3dsaroQNmZtp5dGYEGW9Xhkdx
         rGnA==
X-Gm-Message-State: AOJu0Ywc1GyrNfqJlusDZ7OTXlGTCiT53aA3v/O0YxoyLVZllOH5NWdK
	8aCbEgQBJwkEjO2wqrOhHtuXPrtpeRX3rcAYgYhdTC/Z90aJoTFw1OYA4ZHeUqQaFynRbis9l0u
	XBVTF3l1hTzO+SAoVVGN+S02Zq8bw0wcCSg==
X-Received: by 2002:a50:8ac7:0:b0:53f:2671:e0f4 with SMTP id k7-20020a508ac7000000b0053f2671e0f4mr1115121edk.38.1700806022631;
        Thu, 23 Nov 2023 22:07:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGHzzJP+K2todGYghsi6mqd+HwFhRpYYTaETEdwKkFPVyQoaJ8L2kj5DrtVDw8KJa5+SB3gbg==
X-Received: by 2002:a50:8ac7:0:b0:53f:2671:e0f4 with SMTP id k7-20020a508ac7000000b0053f2671e0f4mr1115101edk.38.1700806022259;
        Thu, 23 Nov 2023 22:07:02 -0800 (PST)
Date: Fri, 24 Nov 2023 01:06:57 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Jason Wang <jasowang@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	"si-wei.liu@oracle.com" <si-wei.liu@oracle.com>,
	"xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>,
	Heng Qi <hengqi@linux.alibaba.com>
Message-ID: <20231124005921-mutt-send-email-mst@kernel.org>
References: <20231110123853.2093309-1-parav@nvidia.com>
 <20231110123853.2093309-3-parav@nvidia.com>
 <20231122084105-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481FF2A00B58060D9D69812DCBAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231122094431-mutt-send-email-mst@kernel.org>
 <CACGkMEuEFsByRwTf_hAAZ+7-UuyYz-1wCP4vTpMAW6DbHQzVag@mail.gmail.com>
 <20231124003129-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481E538B7BBFB907CC6BBE1DCB8A@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481E538B7BBFB907CC6BBE1DCB8A@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] Re: [PATCH v6 2/5] virtio-net: Add flow filter
 capabilities read commands

On Fri, Nov 24, 2023 at 05:53:02AM +0000, Parav Pandit wrote:
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Friday, November 24, 2023 11:03 AM
> > 
> > On Fri, Nov 24, 2023 at 12:02:23PM +0800, Jason Wang wrote:
> > > > > I won't be able to absorb this comment of DMA interface.
> > > > > If I discuss further, I will repeat the whole document [1] and I will avoid
> > that now.
> > > > >
> > > > > [1]
> > > > > https://docs.google.com/document/d/1Iyn-
> > l3Nm0yls3pZaul4lZiVj8x1s73
> > > > > Ed6rOsmn6LfXc/edit#heading=h.qexbtyc2jpwr
> > > >
> > > >
> > > > I really worry about how provisioning will work. And I do not at all
> > > > cherish replicating all of these query capability commands for provisioning.
> > >
> > > +1
> > >
> > > There's nothing that prevents the config space from being implemented
> > > in a way other than registers.
> > 
> > Care doing it finally? Let's see if what Parav is worrying about is then
> > addressed.
> 
> The whole concept that everything must be in one giant config space is just simply bad.
> It does not exist either in virtio spec today.

But it does, this is what transports are doing.

> once can see that what is presented in the commands cannot be placed in config space at dynamic location.
> Same was the case with statistics too.
> Same was the case with VQ coaleasing knobs.
> Same with hash knobs.
> With flow filters,
> With rss contexts
> With rtc
> With new queues creation apis.
> 
> The endless list continues...
> 
> And reserving bits for future (for other than pad bytes) for future addition in config space is equally not elegant design.
> Bits will get spread out at random location making things even harder to maintain.
> 
> The device is no longer a simple mac_addr + N queues device with some static rss config anymore.
> 
> With all modern work, every capability query and run time configuration is done over cvq interface today.
> Single get/set channel from driver to device all using existing resources.
> 
> The real hw device also does not need to refer to two places of config and cvq when serving cvq commands.
> Oh, the list of advantages just continues with what 1.3 spec has done.

I don't see the problem sorry. We've been doing this for many years with
many ways to access config space.  It scaled well.


Then hardware offload guys come and say that in PCI spec current
transport is forcing use of on-device memory, and they want to build
cheap offload PCI based devices. Fine, let's build a transport variant
that does not force this. And we want optional compatibility, so let's
also find a way to do that.  This makes much more sense than forcing
transport specific issues on everyone.

To add to that, what did not historicall scale well is
transport-specific registers.  That was a bad design, with all
transports doing exactly the same thing is slightly different ways.  And
what you are advocating for with CVQ is exactly replicating the bad
design not the good one.

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

