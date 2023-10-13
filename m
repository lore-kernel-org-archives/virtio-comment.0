Return-Path: <virtio-comment-return-7718-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F26BECDB47E
	for <virtio-comment@archiver.kernel.org>; Fri, 13 Oct 2023 11:52:17 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 657C62ACFD
	for <virtio-comment@archiver.kernel.org>; Fri, 13 Oct 2023 11:52:17 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4BAE5986840
	for <virtio-comment@archiver.kernel.org>; Fri, 13 Oct 2023 11:52:17 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 4125D986836; Fri, 13 Oct 2023 11:52:17 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 322CF986837
	for <virtio-comment@lists.oasis-open.org>; Fri, 13 Oct 2023 11:52:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: Cqv6BHh0PjmWQyw1YWRSwg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697197934; x=1697802734;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V3NWMSLj4v2LyzqqnYCmM2AozKpW47j2gymP82r5B64=;
        b=qLw3Nkn771WGr+g8/PXjlra/CdCItaxBzhe8+1EKqh2nc7+NKqMicCXfAec4CjW36a
         /s9z5vHEAmm/bPDEXHOUuYk1O5++jP4WaVLllr4c1mG/QKvnsr7LxqpFg59kLMNgP+GG
         irAdrxxHsa8m7ZRLQUoHWJnJyES51iftz5GGxGcwGzkkdOz/TxlQmhHoNcwkIYRSKclb
         9blISrn9UOcioPkKCn//bPpJOPN6Bbvk0u6nzE0AEguFh2uGgN2/QRWtcDOS9ajDojHR
         e6cAmXK+La8rVb7TE//ZS2m6wElW/aLh6OR6zEe7iDGjYb/GUGBFczOdWaIGXSGGIb+g
         Rxdg==
X-Gm-Message-State: AOJu0YxWUqh6QBvgjJKeeUO1B7vozIkgH+eKt3K9zPrQZLAVifN7taRh
	b5NInOZV7OXDZIUzndtYzNvRAGjKEEaTAArod49c7k6qspJi1B35XAkSCo2yaLRKKMF841B34lc
	g+UiqJtGtT1jFr0phdRWh1nuFjpeLfx8LLQ==
X-Received: by 2002:a5d:648d:0:b0:32d:812d:907e with SMTP id o13-20020a5d648d000000b0032d812d907emr9140064wri.65.1697197933901;
        Fri, 13 Oct 2023 04:52:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGggxGl3GQaDHrnX9PLhuKCK5bGdJXU9oiHfvOBK1lCasYx63rOejwzZLGgCdZ3XQCzU/4JA==
X-Received: by 2002:a5d:648d:0:b0:32d:812d:907e with SMTP id o13-20020a5d648d000000b0032d812d907emr9140046wri.65.1697197933511;
        Fri, 13 Oct 2023 04:52:13 -0700 (PDT)
Date: Fri, 13 Oct 2023 07:52:08 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Jason Wang <jasowang@redhat.com>,
	"Zhu, Lingshan" <lingshan.zhu@intel.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>
Message-ID: <20231013074948-mutt-send-email-mst@kernel.org>
References: <DM8PR12MB5480E0F15A1BBDD745EE3AF4DCCEA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <25375529-9c40-9ea9-692e-f557c514c72f@intel.com>
 <PH0PR12MB54812E59B581546FFB118F3FDCCDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <f875fa3b-4b33-71c2-e612-bc2a674a1e59@intel.com>
 <PH0PR12MB548171A06CCE458C913E4961DCCCA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <97aa9108-0715-2483-f5cf-02698c745d60@intel.com>
 <PH0PR12MB5481F4F3B4FADD79770ADEA6DCD3A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEt-pUSazfjfROukZdaLdmeX1xP7_OxQaQ=Se=jV5NXkDA@mail.gmail.com>
 <20231013071610-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54815DBB53ACE0C91A915B4DDCD2A@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB54815DBB53ACE0C91A915B4DDCD2A@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration

On Fri, Oct 13, 2023 at 11:41:21AM +0000, Parav Pandit wrote:
> 
> > From: virtio-comment@lists.oasis-open.org <virtio-comment@lists.oasis-
> > open.org> On Behalf Of Michael S. Tsirkin
> > Sent: Friday, October 13, 2023 4:56 PM
> 
> > > This is the question you never answer even if I keep asking.
> > 
> > It is, fundamentally, a question of supporting as many architectures as we can
> > as opposed to being opinionated.
> > 
> > On the one end of the spectrum, device is completely under guest control and
> > anything external has to trap to hypervisor.
> > None of existing implementations are there, at least pci config space is typically
> > under hypervisor control.
> > What Parav calls "passthrough" is built I think along these lines:
> > memory and interrupts go straight to guest, config space is trapped and
> > emulated.
> > On the other side of the spectrum is trapping everything in hypervisor.
> > Your "2 to 3 registers" is also not there, but is I think closer to that end of the
> > arc.
> > 
> > Any new feature should ideally be a building block supporting as many
> > approaches as possible. Fundamentally that requires a level of indirection, as
> > usual :) Having two completely distict interfaces for that straight off the bat?
> > Gimme a break.
> 
> There are two approaches.

I know much more than 2.
There are as many approaches as hypervisor implementations.

> 1. Passthrough a virtio member device to guest
> Only PCI config space and MSI-X table is trapped.
> MSI-X table is also trapped due to a cpu/platform limitation. I will not go in that detail for a moment.
> All the rest of the virtio member device interface is passthrough to the guest.
> This includes,
> (a) virtio common config space
> (b) virtio device specific config space
> (c) cvq if present
> (d) io vqs and more vqs
> (e) any shared memory
> (f) any new construct that arise in coming years
> 
> If one wants to do nesting, the member device should support nesting and it will be still able to do to next level.
> To my knowledge, most cpus support single level nesting, that is VMM and VM.
> Any higher-level nesting involves good amount of emulation in privileged operations.
> 
> If virtio to do even more efficient than rest of the platform, I propose that member device can support nesting, so VMM->VM_L1 and VM_L1->VM_L2 constructs are same.
> This gives the best of both. Nesting support and passthrough both.
> And since its layered approach, it naturally works for nested case.
> 
> 2. Data path accelerated in device, rest all emulated.
> This method make sense when underlying device is not a native virtio device.
> 
> But for some reason, ok, one wants to build the infrastructure, we can attempt to find common pieces between #1 and #2 methods.

We can't just build new interfaces each time someone wants a slightly
different point on the pass through/emulation curve.
I feel this is an important point for TC members to agree on.

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

