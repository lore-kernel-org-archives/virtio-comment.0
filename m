Return-Path: <virtio-comment-return-7681-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13876CDB46E
	for <virtio-comment@archiver.kernel.org>; Thu, 12 Oct 2023 10:45:18 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 5AB8C13E5B0
	for <virtio-comment@archiver.kernel.org>; Thu, 12 Oct 2023 10:45:18 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 34B92986839
	for <virtio-comment@archiver.kernel.org>; Thu, 12 Oct 2023 10:45:18 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 0B481986474; Thu, 12 Oct 2023 10:45:18 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id EFAC398660E
	for <virtio-comment@lists.oasis-open.org>; Thu, 12 Oct 2023 10:45:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: P7VjXOHiMRORpfYuYFEb6Q-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697107514; x=1697712314;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hf5mi88Ib93ZXbXAIjvCxsnY/cDllg4eXIzH/AI4yDo=;
        b=rsjtv/TkZXSOC3XnIIYIt1K/DQMXZjsAjkVG15QFwAw09+CexosNWQ+Ib96JpXoFiN
         DCgt5ja4HrF6RnFMnVeL9UavqTq6PgS5IAmzeTrVpPMBOE0dK/Uxu+dtqtexqUOonNXJ
         Hd/7BbllLXb008EP5D65l1lU7kNMvE4Shvn3ZsKcFxflJNOTngjhtXzo1GzSPALu5owv
         W1bgpSehJYPwJngqsNnbXrNmFX6FT15Z5cYXnxCmahRCrzy4nhAwKNjkkYHZwkyPcH4f
         hpt5RYUWA6P6L4eVf6gZMwLzEjhHWP/gPjVh2gxYJ+nBo40ZSCjeMGESZ3ErhjbSi2c1
         JTWg==
X-Gm-Message-State: AOJu0YwMUXWCn9Dcsc9zFtz6JqT758AUM2bv5TKflPX8Ri22Rj3T/YNl
	NzVw05PevJL6UX6cTnevuoVkYwzFTwzzTJN2CDAgG9nZmIF79Wy7fjKMSCY+QcQQOrH4BBPGiog
	gqhjB/0l5nfrkdP15gntp7Eot5ODXncpr6A==
X-Received: by 2002:a05:6000:1d81:b0:32d:8a4b:2715 with SMTP id bk1-20020a0560001d8100b0032d8a4b2715mr2828959wrb.8.1697107514538;
        Thu, 12 Oct 2023 03:45:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSQEybyoU2hPiKizgNY1GzoqohIFhQWLPJTlGHx9ZKC6R79NCnaKuRxuFf/aWzt3ON37TFYw==
X-Received: by 2002:a05:6000:1d81:b0:32d:8a4b:2715 with SMTP id bk1-20020a0560001d8100b0032d8a4b2715mr2828942wrb.8.1697107514192;
        Thu, 12 Oct 2023 03:45:14 -0700 (PDT)
Date: Thu, 12 Oct 2023 06:45:10 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "Zhu, Lingshan" <lingshan.zhu@intel.com>,
	Jason Wang <jasowang@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>
Message-ID: <20231012063407-mutt-send-email-mst@kernel.org>
References: <20231008112555.473895-4-parav@nvidia.com>
 <20231008073912-mutt-send-email-mst@kernel.org>
 <2fa89e37-a097-d785-e1ee-cda151b0d872@intel.com>
 <DM8PR12MB548001B88B5FA72B403A2AC9DCCEA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <85c59856-b68e-940c-08ed-a14e5a02554d@intel.com>
 <PH0PR12MB548135EDA034FDF7AE77C5FDDCCDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <cbf6b0b4-c49f-6809-cac8-2d8336a8cc76@intel.com>
 <PH0PR12MB5481A03DDF43FCBD4184693FDCCCA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <e2696020-8444-0ff3-a774-0b41151a18fb@intel.com>
 <PH0PR12MB548184740ED3C1011C2A85DEDCD3A@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB548184740ED3C1011C2A85DEDCD3A@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration

On Thu, Oct 12, 2023 at 10:09:30AM +0000, Parav Pandit wrote:
> 
> > From: Zhu, Lingshan <lingshan.zhu@intel.com>
> > Sent: Thursday, October 12, 2023 3:30 PM
> > 
> > On 10/11/2023 6:54 PM, Parav Pandit wrote:
> > >> From: Zhu, Lingshan <lingshan.zhu@intel.com>
> > >> Sent: Wednesday, October 11, 2023 3:38 PM
> > >>
> > >>>> The system admin can choose only passthrough some of the devices
> > >>>> for nested guests, so passthrough the PF to L1 guest is not a good
> > >>>> idea, because there can be many devices still work for the host or L1.
> > >>> Possible. One size does not fit all.
> > >>> What I expressed is most common scenarios that user care about.
> > >> don't block existing usecases, don't break the userspace, nested is common.
> > > Nothing is broken as virtio spec do not have any single construct to support
> > migration.
> > > If nested is common, can you share the performance number with real virtio
> > device with/without 2 level nesting?
> > > I frankly don’t know how they look like.
> > virtio devices support nested, I mean don't break this usecase And end user
> > accept performance overhead in nested, this is not related to this topic.
> > 
> Can you show an example of virtio device nesting and live migration already supported where the device has _done_ the live migration.
> Due to which you claim that new feature of admin command-based owner and member device breaks something?
> 
> Please don’t use the verb "break".
> Your proposal is the first of its kind that supports migrating nested device.
> This is why new patches of config register or admin command does not break anything existing.

Wording aside, new features should support as wide a variety of configs
as possible, if some config is not supported there should be
a very good reason.

> > >
> > >>>>> In second use case, where one want to bind only one member device
> > >>>>> to one VM, I think same plumbing can be extended to have another
> > >>>>> VF, to take
> > >>>> the role of migration device instead of owner device.
> > >>>>> I don’t see a good way to passthrough and also do in-band
> > >>>>> migration without
> > >>>> lot of device specific trap and emulation.
> > >>>>> I also don’t know the cpu performance numbers with 3 levels of
> > >>>>> nested page
> > >>>> table translation which to my understanding cannot be accelerated
> > >>>> by the current cpu.
> > >>>> host_PA->L1_QEMU_VA->L1_Guest_PA->L1_QEMU_VA->L2_Guest_PA and
> > so
> > >> on,
> > >>>> there can be performance overhead, but can be done.
> > >>>>
> > >>>> So admin vq migration still don't work for nested, this is surely a blocker.
> > >>> In specific case of member devices are located at different nest
> > >>> level, it does
> > >> not.
> > >> so you got the point, so this series should not be merged.
> > >>> Why prevents you have a peer VF do the role of migration driver?
> > >>> Basically, what I am proposing is, connect two VFs to the L1 guest.
> > >>> One VF is
> > >> migration driver, one VF is passthrough to L2 guest.
> > >>> And same scheme works.
> > >> A peer VF? A management VF? still break the existing usecase. and how
> > >> do you transfer ownership of L2 VF from PF to L1 VF?
> > > A peer management VF which services admin command (like PF).
> > > Ownership of admin command is delegated to the management VF.
> > interesting, do you plan to cook a patch implementing this?
> No. I am hoping that you can help to draft those patches for nested case to work when one wants to hand of single VM to single nested guest VM.
> I will not be able to test any of nested things and show its performance value either, as I don’t see how rest of the eco system can match up for the nested.
> Hence, your expertise in drafting extension for nested is desired.
> 
> > Really make sense?
> > 
> > How do you transfer the ownership?
> An additional ownership deletgation by a new admin command.
> > How to you maintain a different group?
> One to one assignment.
> > How do you isolate the groups?
> Not sure, what it means. The explicit group is created and VFs are placed in this group.
> > How to you keep the guest or host secure?
> Please be specific. Its very broad question when it comes to defining the interface.
> > How do you manage the overlaps?
> Overlaps between?
> > How do you implement the hardware support that?
> Please consult your board designers. Hard to say how to implement something in generic.
> > How do you change the PCI routing?
> Why anything to be changed in PCI routing?
> 
> > > It does not break any existing deployments.
> > we are talking about nested, don't break nested
> Virtio spec for nested is not defined yet. Hence nothing is broken. Please avoid using the verb, _break_.

Well people are passing virtio devices through to nested guests.
Ideally such configs should, somehow, support nested hypervisors
migrating nested guests. Considering e.g. write tracking
needs decent performance for live migration to deserve the name,
I doubt pulling data across PCIe with synchronous MMIO
operations with no pipelining will work well enough.
At the same time, if the maintainance cost at spec level is
low and the feature is self-contained, then why not.
Which this one poking at existing registers with subtle semantics,
isn't.

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

