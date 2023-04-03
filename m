Return-Path: <virtio-comment-return-5172-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1E73C76196
	for <virtio-comment@archiver.kernel.org>; Mon,  3 Apr 2023 17:50:22 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 1DB8F2A881
	for <virtio-comment@archiver.kernel.org>; Mon,  3 Apr 2023 17:50:22 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0091A9863E6
	for <virtio-comment@archiver.kernel.org>; Mon,  3 Apr 2023 17:50:22 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id DCF7C9863E5; Mon,  3 Apr 2023 17:50:21 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1D7AD9863E4
	for <virtio-comment@lists.oasis-open.org>; Mon,  3 Apr 2023 17:48:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: chb29rUmNOez1oFXsOesyg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680544133;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O/yoLyDd8UzU/3fUYU1/sHuzq8EPsDwJk7Fx3KbqSPE=;
        b=PwEHN8tqZ+5s5EBieD/vsSC8DrN6RKC5R7MbHCkXnM9+PO+scUbeZSnPLkUGG1Ejw2
         sT35Ev4NoqC9QbjzZfBq8aDDDvEXrahsGAv11e0xf6xo5zwx5VlVb+bsow3fhbhfSA+s
         61Pi32KfYfcNWZpiZ7+ny/ek97gNB716AyR2WwklXOOAC5QFNoKd4AOx9IUDlalztR+m
         TbnuE9XoDbjwRSReBSZ/wamqhA3uZUsqz47e/jznQN6Lynt67uSP3GzJzOWNvP1P44j0
         dEzWsoDW+pUB5AEdLjCFJrUZB0M25lbREe/xvY+X9kKvzhUDVyqXl4ReuO011LsSa/9Y
         8GsQ==
X-Gm-Message-State: AAQBX9cdmEtLMAsaMz/rwGIGkcSahLjG/O9Cs8iMYDA45vGeUkudoAey
	91T/Wk94ETsloo/MjIPv+4Oz0RwEz4xglGnR7Fn3d+ViKvyY8YkhGBmrnhiC7PEuCYgiJhu3Yay
	BXZinLFAvW/AAD/omF9dpIBx6W5+LDL5b4Q==
X-Received: by 2002:a17:906:2513:b0:907:183f:328a with SMTP id i19-20020a170906251300b00907183f328amr32882900ejb.65.1680544132875;
        Mon, 03 Apr 2023 10:48:52 -0700 (PDT)
X-Google-Smtp-Source: AKy350YR6JLMTWG398GJ2shFPvV4UnSehMIBuV373G9nwoqpQtYZuOW3OCuhqhb5wFmLBKRyPuKbNQ==
X-Received: by 2002:a17:906:2513:b0:907:183f:328a with SMTP id i19-20020a170906251300b00907183f328amr32882872ejb.65.1680544132575;
        Mon, 03 Apr 2023 10:48:52 -0700 (PDT)
Date: Mon, 3 Apr 2023 13:48:46 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, virtio-dev@lists.oasis-open.org,
	cohuck@redhat.com, virtio-comment@lists.oasis-open.org,
	shahafs@nvidia.com
Message-ID: <20230403134407-mutt-send-email-mst@kernel.org>
References: <20230330225834.506969-1-parav@nvidia.com>
 <20230403144523.GC302168@fedora>
 <46a0db06-f922-2a8a-acf0-cf7e453a2945@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <46a0db06-f922-2a8a-acf0-cf7e453a2945@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] [PATCH 00/11] Introduce transitional mmr pci
 device

On Mon, Apr 03, 2023 at 10:53:29AM -0400, Parav Pandit wrote:
> 
> 
> On 4/3/2023 10:45 AM, Stefan Hajnoczi wrote:
> > On Fri, Mar 31, 2023 at 01:58:23AM +0300, Parav Pandit wrote:
> > > Overview:
> > > ---------
> > > The Transitional MMR device is a variant of the transitional PCI device.
> > 
> > What does "MMR" mean?
> > 
> memory mapped registers.
> Explained below in the design section and also in relevant patches 6 to 11.
> 
> > > It has its own small Device ID range. It does not have I/O
> > > region BAR; instead it exposes legacy configuration and device
> > > specific registers at an offset in the memory region BAR.
> > > 
> > > Such transitional MMR devices will be used at the scale of
> > > thousands of devices using PCI SR-IOV and/or future scalable
> > > virtualization technology to provide backward
> > > compatibility (for legacy devices) and also future
> > > compatibility with new features.
> > > 
> > > Usecase:
> > > --------
> > > 1. A hypervisor/system needs to provide transitional
> > >     virtio devices to the guest VM at scale of thousands,
> > >     typically, one to eight devices per VM.
> > > 
> > > 2. A hypervisor/system needs to provide such devices using a
> > >     vendor agnostic driver in the hypervisor system.
> > 
> > Is the idea that the hypervisor configures the new Transitional MMR
> > devices and makes them appear like virtio-pci Transitional devices?
> > 
> Yes, but hypervisor is not involved in any configuration parsing or anything
> of that nature.
> It is only a passthrough fowarder from emulated IOBAR to memory mapped
> legacy registers.
> In other words, hypervisor do not care for the registers content at all.

This part I do not see as important. legacy is frozen in time. Implement
it once and you are done. Datapath differences are more important.

> > In other words, the guest doesn't know about Transitional MMR and does
> > not need any code changes.
> > 
> > > 3. A hypervisor system prefers to have single stack regardless of
> > >     virtio device type (net/blk) and be future compatible with a
> > >     single vfio stack using SR-IOV or other scalable device
> > >     virtualization technology to map PCI devices to the guest VM.
> > >     (as transitional or otherwise)
> > 
> > What does this paragraph mean?
> > 
> It means regardless of a VF being transitional MMR VF or 1.x VF without any
> MMR extensions, there is single vfio virtio driver handling both type of
> devices to map to the guest VM.

I don't think this can be vfio. You need a host layer translating
things such as device ID etc.

> > 
> > Modern devices were added to Linux in 2014 and support SR-IOV.
> 
> > Why is it
> > important to support Transitional (which really means Legacy devices,
> > otherwise Modern devices would be sufficient)?
> > 
> To support guest VMs which only understand legacy devices and unfortunately
> they are still in much wider use by the users.

OK but supporting them with a passthrough driver such as vfio does
not seem that important.

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

