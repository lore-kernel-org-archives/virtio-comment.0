Return-Path: <virtio-comment-return-7711-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8870CDB47E
	for <virtio-comment@archiver.kernel.org>; Fri, 13 Oct 2023 11:26:29 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id DD337C6110
	for <virtio-comment@archiver.kernel.org>; Fri, 13 Oct 2023 11:26:28 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9CD8E98683D
	for <virtio-comment@archiver.kernel.org>; Fri, 13 Oct 2023 11:26:28 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 834D99865D9; Fri, 13 Oct 2023 11:26:28 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 741EE986836
	for <virtio-comment@lists.oasis-open.org>; Fri, 13 Oct 2023 11:26:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: gIxL4OWWNJyOSk828J0o5Q-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697196385; x=1697801185;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LO4h5ABCacSRp2HkmKrfeXHLxW6CVSB1CKvkpvnX6Do=;
        b=iZkozon2Wh0WzNAOxv8AI/+kL5OgZ61GLhceS3NOPsru58pZZB56lbd21qn71k72Jl
         rCIWqN5IOWaX3fAT1AI+CmWEM4YtTLnLL9PUA7x584iGBLO0HhdE9RIAV+JlWhgQZXlB
         Yzh5IdHrDOg+nCag6RB+n6HAjLiSw7CirX4RuXpPUPNeLfH2JdnOWJkjEbCP/dgMm8FB
         EGWxpqNk8IIw/0V3QTADj+rfIiJA3Y700D6QZ3a5yftQDqHj16ZLyFH15kw8E8r3CNl/
         77wXp69qaZMXA4tnFHBcHHOZjzvAnP6MrwEpL9ZzT2fAQFb9/bhSBwKi8gXtqRUdXmLD
         /1mw==
X-Gm-Message-State: AOJu0Yxm2EiYvWYWtfh+Ke6HNahqcpqiqCsqZ4Po8t9cON2zk+Hd6hOX
	J6hvN4PNQU8tA4+Rkoo5JA/68RVa98nXv6ak6ouK0fSwnEHW/xjv7V3KVl6eebpioiOZziIxipU
	NlrJNZjt8ZWme5DAHnqM4tWb0aMIojLsZnQ==
X-Received: by 2002:a05:600c:210b:b0:405:1dbd:f77 with SMTP id u11-20020a05600c210b00b004051dbd0f77mr22560310wml.31.1697196385168;
        Fri, 13 Oct 2023 04:26:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEEkcfcP3yoHP5w94TKLIiZfjQlL73ODyF9QJcUA4yHFhsT5YXsUN8Xy/waAyEPSyFh4Ei+jg==
X-Received: by 2002:a05:600c:210b:b0:405:1dbd:f77 with SMTP id u11-20020a05600c210b00b004051dbd0f77mr22560290wml.31.1697196384701;
        Fri, 13 Oct 2023 04:26:24 -0700 (PDT)
Date: Fri, 13 Oct 2023 07:26:19 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>,
	"Zhu, Lingshan" <lingshan.zhu@intel.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>
Message-ID: <20231013071610-mutt-send-email-mst@kernel.org>
References: <DM8PR12MB54801E873241AA02CC32CDCBDCCEA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <20231009121638-mutt-send-email-mst@kernel.org>
 <DM8PR12MB5480E0F15A1BBDD745EE3AF4DCCEA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <25375529-9c40-9ea9-692e-f557c514c72f@intel.com>
 <PH0PR12MB54812E59B581546FFB118F3FDCCDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <f875fa3b-4b33-71c2-e612-bc2a674a1e59@intel.com>
 <PH0PR12MB548171A06CCE458C913E4961DCCCA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <97aa9108-0715-2483-f5cf-02698c745d60@intel.com>
 <PH0PR12MB5481F4F3B4FADD79770ADEA6DCD3A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEt-pUSazfjfROukZdaLdmeX1xP7_OxQaQ=Se=jV5NXkDA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACGkMEt-pUSazfjfROukZdaLdmeX1xP7_OxQaQ=Se=jV5NXkDA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration

On Fri, Oct 13, 2023 at 09:16:43AM +0800, Jason Wang wrote:
> On Thu, Oct 12, 2023 at 6:58 PM Parav Pandit <parav@nvidia.com> wrote:
> >
> >
> > > From: Zhu, Lingshan <lingshan.zhu@intel.com>
> > > Sent: Thursday, October 12, 2023 3:51 PM
> > >
> > > On 10/11/2023 7:43 PM, Parav Pandit wrote:
> > > >> From: Zhu, Lingshan <lingshan.zhu@intel.com>
> > > >> Sent: Wednesday, October 11, 2023 3:55 PM
> > > >>>>>>> I don’t have any strong opinion to keep it or remove it as most
> > > >>>>>>> stakeholders
> > > >>>>>> has the clear view of requirements now.
> > > >>>>>>> Let me know.
> > > >>>>>> So some people use VFs with VFIO. Hence the module name.  This
> > > >>>>>> sentence by itself seems to have zero value for the spec. Just drop it.
> > > >>>>> Ok. Will drop.
> > > >>>> So why not build your admin vq live migration on our config space
> > > >>>> solution, get out of the troubles, to make your life easier?
> > > >>>>
> > > >>> Your this question is completely unrelated to this reply or you
> > > >>> misunderstood
> > > >> what dropping commit log means.
> > > >> if you can rebase admin vq LM on our basic facilities, I think you
> > > >> dont need to talk about vfio in the first place, so I ask you to re-consider
> > > Jason's proposal.
> > > > I don’t really know why you are upset with the vfio term.
> > > > It is the use case of the cloud operator and it is listed to indicate how proposal
> > > fits in a such use case.
> > > > If for some reason, you don’t like vfio, fine. Ignore it and move on.
> > > >
> > > > I already answered that I will remove from the commit log, because the
> > > requirements are well understood now by the committee.
> > > >
> > > > Your comment is again unrelated (repeated) to your past two questions.
> > > >
> > > > I explained you the technical problem that admin command (not admin VQ)
> > > of basic facilities cannot be done using config registers without any mediation
> > > layer.
> > > OK, I pop-ed Jason's proposal to make everything easier, and I see it is refused.
> > Because it does not work for passthrough mode.
> 
> How and why? What's wrong with just passing through the newly
> introduced 2 or 3 registers to guests?
> 
> This is the question you never answer even if I keep asking.

It is, fundamentally, a question of supporting as many architectures
as we can as opposed to being opinionated.

On the one end of the spectrum, device is completely under guest control
and anything external has to trap to hypervisor.
None of existing implementations are there, at least pci config space
is typically under hypervisor control.
What Parav calls "passthrough" is built I think along these lines:
memory and interrupts go straight to guest, config space
is trapped and emulated.
On the other side of the spectrum is trapping everything in hypervisor.
Your "2 to 3 registers" is also not there, but is I think closer to that end
of the arc.

Any new feature should ideally be a building block supporting as many
approaches as possible. Fundamentally that requires a level of
indirection, as usual :) Having two completely distict interfaces for
that straight off the bat?  Gimme a break.
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

