Return-Path: <virtio-comment-return-7972-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF9F6C25B48
	for <virtio-comment@archiver.kernel.org>; Thu, 26 Oct 2023 06:23:04 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 0EC362B143
	for <virtio-comment@archiver.kernel.org>; Thu, 26 Oct 2023 06:23:04 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E4052986A4D
	for <virtio-comment@archiver.kernel.org>; Thu, 26 Oct 2023 06:23:03 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id D01DC986A46; Thu, 26 Oct 2023 06:23:03 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id BFF7F986A47
	for <virtio-comment@lists.oasis-open.org>; Thu, 26 Oct 2023 06:23:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: zIEk8VSSO76ZnREU2RnGtg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698301378; x=1698906178;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hvw4TPmjVM+Z9qxwdGepxYvouba/E9xBHKqRc4LUtgk=;
        b=kK8swdiB/nkYa7QODzX9hL2cHfH/g+XWf5HXWyGp90muXxcdmUYcWd6N1QbLUQULgK
         h2XlVmFyGwcstJIx6YaWQwRt53/QqHDNegnu/DrqNJgTe0AX+1tP9XnM2g/sLq1lyK4T
         md8hItfRl2x8fPbt119sHkkRGdIyWmaCcKdRo/VlKgZ38myPTBZR7AH+yPLujR+CI9KY
         k3/RwnxK7M2Mc9wQmJI44C1BZ2aqx0UlO8XXg1KOy+JYqxH95KQPFM+TSZmKLOSQCDOk
         EjVBEenaownzBp8MDump4mPI6yLttqtuIiZM0ltHLk0Q/GgL8hPc9kXZZqjcOrJDGosn
         sVXw==
X-Gm-Message-State: AOJu0YyPurvMUKBAUgQhJEmxOOZpuiqFEfDl7zlbswKm3Og9viD86UBA
	JKcpG1Y/5mAVY7e4PT6ExEnxvsUN7iMLJ2QYr5L6WlZQ0QK0+qhgQ6Io3HHK4AVt8l90bFrtLTo
	9fft32aHv1DlLvP/XP1sBomsUAGaYsN1UUQ==
X-Received: by 2002:a2e:2e06:0:b0:2be:54b4:ff87 with SMTP id u6-20020a2e2e06000000b002be54b4ff87mr12518365lju.40.1698301378816;
        Wed, 25 Oct 2023 23:22:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG4Sw+yQ4NMRzNqSqxIW4PCjL/LtQ+EzQU3fIXD23oS7nvEckot3ghrDYQAt6zqNpDnxnFeVw==
X-Received: by 2002:a2e:2e06:0:b0:2be:54b4:ff87 with SMTP id u6-20020a2e2e06000000b002be54b4ff87mr12518353lju.40.1698301378452;
        Wed, 25 Oct 2023 23:22:58 -0700 (PDT)
Date: Thu, 26 Oct 2023 02:22:54 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: "Zhu, Lingshan" <lingshan.zhu@intel.com>,
	Parav Pandit <parav@nvidia.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>
Message-ID: <20231026020352-mutt-send-email-mst@kernel.org>
References: <PH0PR12MB5481BE51210D429FA12EAB45DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <fb012148-a71e-4856-95fe-6e75f011f3fb@intel.com>
 <20231020053534-mutt-send-email-mst@kernel.org>
 <3932dd54-f43a-40b6-8dba-962f997f7122@intel.com>
 <20231021112420-mutt-send-email-mst@kernel.org>
 <2cc0d8fc-8ed5-4b98-b5e7-3a86d3da80b0@intel.com>
 <20231023072519-mutt-send-email-mst@kernel.org>
 <8d601578-2083-4f45-a700-6b67d0c5b789@intel.com>
 <20231025042512-mutt-send-email-mst@kernel.org>
 <CACGkMEtaw-DKy7vwWj8wgG8-_9Kg4SV3=pS1djntOEYM62Dg-g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACGkMEtaw-DKy7vwWj8wgG8-_9Kg4SV3=pS1djntOEYM62Dg-g@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration

On Thu, Oct 26, 2023 at 08:56:47AM +0800, Jason Wang wrote:
> > > We transfer data by DMA, the device writes DMA dirty pages information(bitmap)
> > > to host isolated memory region.
> > >
> >
> >
> > If you do that then I don't see any reason not to use admin
> > commands for that - either through a vq or a simpler
> > interface.
> 
> I think we need to agree that admin commands are the only interface
> for any future features before we can have an agreement here.

I don't think that needs to be the case. I do think that if
your goal is a separate channel from normal device operation
then this is what admin commands have been designed for.

> My understanding is that it is optional for the transport that
> requires administrative commands like provisioning etc. It is not
> necessarily the interface for new features.

Yes. And migration is IMO sufficiently "like provisioning".

> >
> >
> > >
> > >         Config space interfaces are fundamental for virtio-pci.
> > >
> > >
> > >     They are in fact fundamental to virtio. Multiple transports to
> > >     use config space are also fundamental.
> > >
> > > I agree. So I also agree to build admin vq live migration solution based on our
> > > basic facilities, as Jason ever proposed.
> >
> >
> > I'm not sure it's even a vq. I suggest a minimal interface to send
> > admin commands. Could be used by migration, as transport, and more.
> >
> 
> It's better if we can do that below the layer of admin commands. For
> example, we don't stick device status with any specific interface. We
> can keep doing things like this.
> 
> Thanks

Could go either way, but complex functionality like live migration
can benefit from a rich interface.

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

