Return-Path: <virtio-comment-return-8431-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BC0CC072A2
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 10:02:37 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id C1F941CA248
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 10:02:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id BBE5F986E26
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 10:02:36 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id AF55B986E1A; Fri, 17 Nov 2023 10:02:36 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A1521986E1B
	for <virtio-comment@lists.oasis-open.org>; Fri, 17 Nov 2023 10:02:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: Zscw_0IuMKWUWvloaFcLeQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700215354; x=1700820154;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sGZ27pPnzfnplRdpyyCVA6Y+wKpW00PGnO2w5tGi1xw=;
        b=q/kJcZmaHpSeUDFWuATFf7/M55Ly071Bqf0UybDruFXxRyzGjwX9gMrSO2PfLIS2PJ
         ZrKW57k9N/DpdE7NnR8kMtMRxzE9iU8jxrGvdBORmHSHU3XdRZL1XodBWBx/iaZ3EHXG
         ApOqD4f3ebex4+8mo96VFiB0eYlB9+J9zZ4IfjAhbOpWmKQBdoznH23aPzUu9AtyvUJv
         QEYVsWMmDUYexjq+N+Ew/7Jopp7HzH3JIayHadpfO2K6sA3UJj5NtLzZwCmm8P3rx6oY
         bQfNfC+bumpP7+ZDURuin97ZWpuSx1CTi4HkcO9Sqk4bOhllP+3J9NHG7gamEv/5AnSc
         Fhjg==
X-Gm-Message-State: AOJu0Yx8gzo903tZzOGukEEk3spp28Ys4egInDrvCLPxLY5mn9GxM4MJ
	cmTACCBdvHNG4SdqEfj8ov7/Ga66UcPg5qSV2lt1aK7hCKoMjVvakhixwRiaxTipnUvcVPurM06
	lTvJHfIzY44QurTV9ofmTgH/wlHT+8oaaEQ==
X-Received: by 2002:a05:600c:3595:b0:406:849f:f3cd with SMTP id p21-20020a05600c359500b00406849ff3cdmr4482239wmq.29.1700215353859;
        Fri, 17 Nov 2023 02:02:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHBygB0EWLuaOc5D66+Th/QY0qCg22uUXX2a8L5WbmMsAeU433jkdJpos5SKWqYUw78cGUWAA==
X-Received: by 2002:a05:600c:3595:b0:406:849f:f3cd with SMTP id p21-20020a05600c359500b00406849ff3cdmr4482215wmq.29.1700215353270;
        Fri, 17 Nov 2023 02:02:33 -0800 (PST)
Date: Fri, 17 Nov 2023 05:02:27 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>
Cc: Parav Pandit <parav@nvidia.com>, Jason Wang <jasowang@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>
Message-ID: <20231117045627-mutt-send-email-mst@kernel.org>
References: <20231116121958-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481F4D1B07F2809AA7D7C9BDCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231116131303-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54818DBAE43A566C807E1AE9DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117031251-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481D7C85F006AE7292E1D82DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117042446-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54813F2F62F87E42CD5DB4B0DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117044428-mutt-send-email-mst@kernel.org>
 <8e85fb6a-2a45-46fe-b9e2-3c29a1718068@intel.com>
MIME-Version: 1.0
In-Reply-To: <8e85fb6a-2a45-46fe-b9e2-3c29a1718068@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] Re: [PATCH v3 6/8] admin: Add theory of
 operation for write recording commands

On Fri, Nov 17, 2023 at 05:54:32PM +0800, Zhu, Lingshan wrote:
> 
> 
> On 11/17/2023 5:51 PM, Michael S. Tsirkin wrote:
> > On Fri, Nov 17, 2023 at 09:41:40AM +0000, Parav Pandit wrote:
> > > 
> > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > Sent: Friday, November 17, 2023 3:08 PM
> > > > 
> > > > On Fri, Nov 17, 2023 at 09:14:21AM +0000, Parav Pandit wrote:
> > > > > 
> > > > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > > > Sent: Friday, November 17, 2023 2:16 PM In any case you can safely
> > > > > > assume that many users will have migration that takes seconds and
> > > > > > minutes.
> > > > > Strange, but ok. I don't see any problem with current method.
> > > > > 8MB is used for very large VM of 1TB takes minutes. Should be fine.
> > > > The problem is simple: vendors selling devices have no idea how large the VM
> > > > will be. So you have to over-provision for the max VM size.
> > > > If there was a way to instead allocate that in host memory, that would improve
> > > > on this.
> > > Not sure what to over provision for max VM size.
> > > Vendor does not know how many vcpus will be needed. It is no different problem.
> > > 
> > > When the VM migration is started, the individual tracking range is supplied by the hypervisor to device.
> > > Device allocates necessary memory on this instruction.
> > > 
> > > When the VM with certain size is provisioned, the member device can be provisioned for the VM size.
> > > And if it cannot be provisioned, possibly this may not the right member device to use at that point in time.
> > For someone who keeps arguing against adding single bit registers
> > "because it does not scale" you seem very nonchalant about adding
> > 8Mbytes.
> > 
> > I thought we have a nicely contained and orthogonal feature, so if it's
> > optional it's not a problem.
> > 
> > But with such costs and corner cases what exactly is the motivation for
> > the feature here?  Do you have a PoC showing how this works better than
> > e.g. shadow VQ?
> > 
> > Maybe IOMMU based and shadow VQ based tracking are the way to go
> > initially, and if there's a problem then we should add this later, on
> > top.
> I agree.

However, the patchset is ordered sensibly, first the device state
recording and then write tracking. So we can merge patches 1-5 and defer
6-8 if we want to.

Parav I suggest maybe split write tracking to a separate patchset just
because it seems so contentious.

I notice there have not been comments on 1-5 yet, I am not sure why
I started with patch 6 - I guess I was curious what it does.
I'll focus review on 1-5 next week.




> > 
> > I really want us to finally make progress merging features and anything
> > that reduces scope initially is good for that.
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

