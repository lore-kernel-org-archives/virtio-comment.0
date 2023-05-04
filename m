Return-Path: <virtio-comment-return-5755-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97195C7EE21
	for <virtio-comment@archiver.kernel.org>; Thu,  4 May 2023 06:31:09 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id D1B4D44345
	for <virtio-comment@archiver.kernel.org>; Thu,  4 May 2023 06:31:08 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CE2E19866B4
	for <virtio-comment@archiver.kernel.org>; Thu,  4 May 2023 06:31:08 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id C5C50983EB5; Thu,  4 May 2023 06:31:08 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B26499866B2
	for <virtio-comment@lists.oasis-open.org>; Thu,  4 May 2023 06:31:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: dYVpEX89Nwekp0QkKrvPtw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683181855; x=1685773855;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ijHy8M86XtSR7kwmnq7aGSGB3lz17yxCF/KzfpbaU3M=;
        b=ZOhq0HeboyZStqfScP5VxglAstNh1o+DdPiir2mC8RS2PlcvAbCwkRR8mICzxAEQPL
         r+a8uVdhDpUpvP5W+YmoG1GVC/C4hx5kz+AVoeeYxx7749u2xtxowChi9pyb36yrKuRF
         rMLhgblmbAPqtnnKrjCKQxFwNZIeZz006Pm2wsanSiZ+Waf2O9S2CLNyG3KOdUNQbdRs
         jiiFvne6W+CzzC6h5n8Z4mbmMkSD2Ljo0AWQG0gnIsISoOImF3IXKJ9KKXnbJIohm7IS
         6j29OIumJYuf9r/1WCQdAtO5Ci1F9BOcunKeZrJrQEGD9DSUUTFuSwtRwPQv10jXgPv+
         AXUQ==
X-Gm-Message-State: AC+VfDyQ0Kvpk55vA92K5wjrjtHXsEvd/95t9LV8klVFHzrlZL0oPwah
	g0YD80YCln80zB8gk0fYQlfBlb3dXPF1Va3+bWM+OSEbLOOPKgcQ5IeQm9kxkfYf0Ho7TJeSIGC
	1Ms3izb+ibc43X++AoipMsD4qnDx0lH2U8Q==
X-Received: by 2002:a1c:f20f:0:b0:3f3:888b:ab78 with SMTP id s15-20020a1cf20f000000b003f3888bab78mr3615392wmc.37.1683181855698;
        Wed, 03 May 2023 23:30:55 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ66ManI/pKe9Esa0DMz9CtlEODQzfLJIvNiQ9YAqgDhNaza345Fmt27tmBFUhqWB5/QtHKqnw==
X-Received: by 2002:a1c:f20f:0:b0:3f3:888b:ab78 with SMTP id s15-20020a1cf20f000000b003f3888bab78mr3615371wmc.37.1683181855347;
        Wed, 03 May 2023 23:30:55 -0700 (PDT)
Date: Thu, 4 May 2023 02:30:51 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: virtio-dev@lists.oasis-open.org, cohuck@redhat.com,
	david.edmondson@oracle.com, sburla@marvell.com, jasowang@redhat.com,
	virtio-comment@lists.oasis-open.org, shahafs@nvidia.com,
	Yishai Hadas <yishaih@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>
Message-ID: <20230504023034-mutt-send-email-mst@kernel.org>
References: <20230503032659.530330-1-parav@nvidia.com>
 <20230503032659.530330-2-parav@nvidia.com>
 <20230503011627-mutt-send-email-mst@kernel.org>
 <c0ece552-d618-cbe3-c841-6c6fe72e8f18@nvidia.com>
 <20230503124212-mutt-send-email-mst@kernel.org>
 <ba053f8a-4adb-5395-ed75-ac1d0bfe20ee@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <ba053f8a-4adb-5395-ed75-ac1d0bfe20ee@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH v1 1/2] transport-pci: Introduce legacy registers access
 commands

On Wed, May 03, 2023 at 01:21:39PM -0400, Parav Pandit wrote:
> 
> 
> On 5/3/2023 12:48 PM, Michael S. Tsirkin wrote:
> 
> > > > As simple as it is, I feel this falls far short of describing how
> > > > a device should operate.
> > > > Some issues:
> > > > 	- legacy device config offset changes as msi is enabled/disabled
> > > > 	  suggest separate commands for device/common config
> > > This is fine and covered here. The one who is making msix enable/disable
> > > knows which registers to access before/after disable/enable and device also
> > > knows it as it is supplying the register.
> > > So they just follow the standard legacy register access behavior.
> > 
> > But do VFs support INT#x? I will have to re-read the spec.
> > 
> VFs do not support INTx.
> When hypervisor knows that it cannot support msix for the guest, it can
> avoid using the VF for the guest.

it's the guest that does not support msix. Not host.

> > > > 	- legacy device endian-ness changes with guest
> > > > 	  suggest commands to enable LE and BE mode
> > > guest endianeness is not known to the device.
> > 
> > But is known to hypervisor.
> > 
> It can be an extension command in future as part of the VF administration
> command to set it by the hypervisor PF.
> 
> > > Currently it is only for the
> > > LE guests who had some legacy requirement.
> > 
> > I don't like tying this to LE implicitly some devices might be BE only.
> > With my idea device can support command to set LE, command to set BE or
> > both.
> > 
> It can be an addition in future if needed.
> 
> > > and PCIe is LE anyway.
> > 
> > PCIE config endian-ness does not matter heere.
> > 
> > > > 	- legacy guests often assume INT#x support
> > > > 	  suggest a way to tunnel that too;
> > > INT#x is present on the PCI device itself. So no need to tunnel it.
> > > Also INT#x is very narrow case. When MSI-X is not supported, a hypervisor
> > > can choose not to even connect such device to the guest VM.
> > 
> > devices will support MSI. But *guest* might not support MSIX you only
> > find out late when it is driving the device.
> > 
> It is a pathological case that may not exist because legacy drivers and
> linux kernels all the way upto 2.6.32 have msix support.
> 
> And in case if hypervisor sw wants to support for unknown scenario, it can
> use the one msix based interrupt to emulate intx.
> 
> > > > I expected to see more statements along the lines of
> > > >           command ABC has the same effect as access
> > > >           to register DEF of the member through the legacy pci interface
> > > > 
> > > Yes, good point. I will add it in the theory of operation section for this
> > > mapping detail.
> > 
> > OK, and overall if you see an existing statement about legacy do not
> > copy it, just explain how it is mapped.
> > 
> Yes, will not copy, only the mapping part to add.


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

