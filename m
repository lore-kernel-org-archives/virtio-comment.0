Return-Path: <virtio-comment-return-7951-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E768CC0032E
	for <virtio-comment@archiver.kernel.org>; Wed, 25 Oct 2023 08:33:54 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 28B1F2AC51
	for <virtio-comment@archiver.kernel.org>; Wed, 25 Oct 2023 08:33:54 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id F2B889869E6
	for <virtio-comment@archiver.kernel.org>; Wed, 25 Oct 2023 08:33:53 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id DE3029869E0; Wed, 25 Oct 2023 08:33:53 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CBF449869E1
	for <virtio-comment@lists.oasis-open.org>; Wed, 25 Oct 2023 08:33:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 0MpnyFj7OduZb9CIuOPsBg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698222828; x=1698827628;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lz9qQRf9Ss3Ikoe05k3ARaf0YAvvxc0fiGO8fXr+KIY=;
        b=qBqBTK7Jhowfn21RSSZ6fOTqLL4DnlkCRx+0F1RMF+JED9WxBO8/BmZGZyMG47snWD
         xfS9HyByn9qJyR8B7oT5UpZ4CoMDSDLjnFoTYNc9+hX3Cx9o6gyQBZbGG1zkS8X0G9FD
         ACmcVdEDuHwpBZ0+Dz8xwxdLdX87NtXIL0Xhc4R24eLeHbeFieGR3jlasJsO4VbQPgTR
         OBaX4gmCitYJvOuDTm+jQGDmgNWhtQXiRPpD0juFJUU0tPBZ5KLAJviIlTEWqROit4z2
         F4pbgViVzakvi+JI8QzpsX/JtvfokpO2aJoJv6ymOOqJk7IpCC95BdUx2gHz5W7aEm8e
         ecGw==
X-Gm-Message-State: AOJu0YzyvfBMLVZUjPOje3yZpwRS/63igbjzgRhX2aOtgLd0lGVqMyLZ
	5hBGEKbLulX6iWzHKBbktxRNKX9XzNPDMBjbrLbjfuLZYa05wLkyHE1W9PrpR90Wimtz26DnqEA
	+c4aZoJLgL+75WmIy9tSfWwb3nTIf6Dwosw==
X-Received: by 2002:a05:600c:4591:b0:409:19a0:d247 with SMTP id r17-20020a05600c459100b0040919a0d247mr944799wmo.18.1698222827881;
        Wed, 25 Oct 2023 01:33:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IECrjoB8U2JZSKkAZCNyHJXkpOx76wWOIHJ/K7EXgYtFY5DMikzJQyzVZq67xSN+8bbCzCAAg==
X-Received: by 2002:a05:600c:4591:b0:409:19a0:d247 with SMTP id r17-20020a05600c459100b0040919a0d247mr944781wmo.18.1698222827528;
        Wed, 25 Oct 2023 01:33:47 -0700 (PDT)
Date: Wed, 25 Oct 2023 04:33:42 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>
Cc: Parav Pandit <parav@nvidia.com>, Jason Wang <jasowang@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>
Message-ID: <20231025042512-mutt-send-email-mst@kernel.org>
References: <20231019051406-mutt-send-email-mst@kernel.org>
 <daea1f54-1c85-4a4a-ac3a-c5ae97180e03@intel.com>
 <PH0PR12MB5481BE51210D429FA12EAB45DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <fb012148-a71e-4856-95fe-6e75f011f3fb@intel.com>
 <20231020053534-mutt-send-email-mst@kernel.org>
 <3932dd54-f43a-40b6-8dba-962f997f7122@intel.com>
 <20231021112420-mutt-send-email-mst@kernel.org>
 <2cc0d8fc-8ed5-4b98-b5e7-3a86d3da80b0@intel.com>
 <20231023072519-mutt-send-email-mst@kernel.org>
 <8d601578-2083-4f45-a700-6b67d0c5b789@intel.com>
MIME-Version: 1.0
In-Reply-To: <8d601578-2083-4f45-a700-6b67d0c5b789@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration

On Tue, Oct 24, 2023 at 06:27:04PM +0800, Zhu, Lingshan wrote:
> 
> 
> On 10/23/2023 7:32 PM, Michael S. Tsirkin wrote:
> 
>     On Mon, Oct 23, 2023 at 06:03:10PM +0800, Zhu, Lingshan wrote:
> 
>         config space, MMIO, registers work for years, what is wrong with them?
> 
>     Nothing as such. They don't seem to be appropriate for all use-case
>     where people want to utilize virtio. I think a new transport
>     will be needed to address these.
> 
> New transport for new type of devices for sure, like transport vq for SIOV.
> 
> I agree admin vq or admin cmds are useful in some use cases, that is
> another story, should be case by case.
> 
> For now, let's don't talk about all-use cases, just for current task, for live
> migration.
> 
> So IMHO, I still think we should use config space registers to control live
> migration process.
> 
> 

No because it forces integrating migration process with device driver.
Which is ok for some use-cases but not all of them.  Find some other
control plane for this.


>                 Config space is control path, DMA is data-path, let's better not mix them,
>                 we never expect to use config space to transfer data.
> 
>                 So we need DMA to transfer data, for example I take advantages of device DMA
>                 to logging dirty pages, This also applies to in-flight descriptors.
> 
>             As long as you do, I personally see little benefit to retrieve parts of
>             state with memory mapped accesses.
> 
>         registers only control, and I personally believe a single register is much
>         better
>         than processing admin commands, more light-weight, more reliable, working
>         for years.
> 
>     Yea. It would be, if we could do everything through that register.
>     But we can't really. Migration has too much data to pass around
>     for that to be reasonable.
> 
> data are not transferred by registers, they only control.
> 
> We transfer data by DMA, the device writes DMA dirty pages information(bitmap)
> to host isolated memory region.
> 


If you do that then I don't see any reason not to use admin
commands for that - either through a vq or a simpler
interface.


> 
>         Config space interfaces are fundamental for virtio-pci.
> 
> 
>     They are in fact fundamental to virtio. Multiple transports to
>     use config space are also fundamental.
> 
> I agree. So I also agree to build admin vq live migration solution based on our
> basic facilities, as Jason ever proposed.


I'm not sure it's even a vq. I suggest a minimal interface to send
admin commands. Could be used by migration, as transport, and more.

> 
> 
> 
>                 And we are implementing virito live migration, not only for PCI.
> 
>                 So both me and Jason keep repeating: We are implementing basic facilities,
>                 and the implementation is transport specific.
> 
>             But the register based facilities you proposed are extremely limited and
>             seem to only work for migration. For example, it seems mostly useless for
>             debugging because retrieving state is rather complex and would
>             interfere with normal working of the device.
> 
>         If you want to prove the register controlling interfaces are extremely
>         limited than admin vq or admin cmds,
>         you are also proving config space registers are extremely limited than
>         admin vq.
> 
>     Yes. Migration needs ability to pass large amounts of data around, and
>     is too complex a functionality to work reliably without ability to
>     report errors.
> 
> what errors? when device DMA?
> missing some dirty pages? If the device can detect such errors, it can recover
> by itself,
> or how can driver fix this?

Not just pages, there's a lot of internal device state.

You fix for example by reporting that state does not work
for a current device, and guest can be restarted on migration
source.


> for control path, virtio uses re-read for many years and it works well.

Let's not even get started with how live migration currently "works
well".  I happen to be familiar with it intimately.  We tried to
maintain migration compatiblity as best we could and we tend to break it
every second release.


> I
> believe we have
> went through this issue before.
>  
> 
> 
> 
>         So the question still here: do you want to replace current virtio-pci common
>         cfg
>         with admin vq or admin cmds?
> 
>     I think we need to add a new transport that will use admin commands.
>     Which one to use would be up to a specific device.
> 
> For new device type like SIOV, yes we need a new transport, transport vq.
> 
> Let's focus on this live migration feature, if there are new features in the
> future
> requires admin vq, let's discuss when they proposed.
> 
> 
> 
> 
>         And debug what? If you want to introduce more functionalities, we should
>         discuss
>         case by case.
> 
>         If debugging vq state, it is as easy as read queue_size, I don't see the
>         limitations
>         as queue_size work for years.
> 
>     No one reads queue_size. In fact for years we didn't have any debugging
>     functionality and we are fine. If we are adding it, it really needs to
>     be accessible when driver and device are wedged.
> 
> OK, I don't disagree to implement new device debugging features.
> 
> But let's focus on current live migration task.
> 
> 
> 
> 
>         I still believe our goal is to do our best, with our capabilities, to build
>         the most optimal virtio spec
>         as we can do. Not other goals.
> 
>         Thanks
>         Zhu Lingshan
> 
> 
> 
>                 We have proposed to build admin vq based on our register solution, this can
>                 somehow even help tp resolve the nested issue.
> 
>                 But I see the proposed has been rejected.
> 
>                 I still believe the goal is to build a best spec, not "just can work" with
>                 limitations.
> 
> 
> 
> 
> 


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

