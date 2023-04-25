Return-Path: <virtio-comment-return-5636-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E44DC77B61
	for <virtio-comment@archiver.kernel.org>; Tue, 25 Apr 2023 13:31:49 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id D5BB03711D
	for <virtio-comment@archiver.kernel.org>; Tue, 25 Apr 2023 13:31:47 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D120798664A
	for <virtio-comment@archiver.kernel.org>; Tue, 25 Apr 2023 13:31:47 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id C86C598644C; Tue, 25 Apr 2023 13:31:47 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B6CB7986449
	for <virtio-comment@lists.oasis-open.org>; Tue, 25 Apr 2023 13:31:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: ehJCM7iSPVSc1STzlqt2Sw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682429499; x=1685021499;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GtNHPIFUbzsrcR2eLCwa84RGhSSok/fmbns0yW72U6Y=;
        b=TyO4Tu89jnAYDLrNm+HSeZdwtHlvL4CSgj9FIXeBFRLcYjoQTc5/Y62KiY5KtC8v1x
         AkCud4FE4okFl8imZBNmUyb2KjMXozy5D49AgzdlFJ5yRfy/AWbNZsOwcGLBbEilWa/C
         p3VHLKCLEAhf0M0HAn6zvEm48XNAzSEOnx2PBS59yGsaCMzy+JKKUBThz2V6n03GkljT
         6fqJpZ9UIh4eCEB8Vg1mP2jDpxv6A6Ev2AyUEeswzENsSTSomiR3auf3Ohcv91zEeZke
         NYqHffl07zX+++UQs3l6L3nCl3aTor4U/rYFU65Majdu0Opnh/6e/dNvrI975U760AFo
         tDgQ==
X-Gm-Message-State: AAQBX9fkvFZSC7VKWcrb4Ciq+A8e+9kRboWl/hH72nROewtgGyT7ZSz3
	su4qkP3olIXn7rx3qFlzWp8qj9AhNEkUl/dNfYg+7ujN7rFeeWuR+YiPO7Ff3ZpnNUZAPktyVq+
	DfR4VMzyOkmhvgqUQY8oA9lj1OtkfXM3z6Q==
X-Received: by 2002:a5d:6789:0:b0:2ef:e73d:605d with SMTP id v9-20020a5d6789000000b002efe73d605dmr15074067wru.30.1682429499131;
        Tue, 25 Apr 2023 06:31:39 -0700 (PDT)
X-Google-Smtp-Source: AKy350bRc9SL5vtgWdeIRBqGhRR3kfPP1YYgAQksent31BtCYhjsuqK6fwVSxp8dNj4vW41wpPJ2WA==
X-Received: by 2002:a5d:6789:0:b0:2ef:e73d:605d with SMTP id v9-20020a5d6789000000b002efe73d605dmr15074047wru.30.1682429498775;
        Tue, 25 Apr 2023 06:31:38 -0700 (PDT)
Date: Tue, 25 Apr 2023 09:31:34 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	"jasowang@redhat.com" <jasowang@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sgarzare@redhat.com" <sgarzare@redhat.com>,
	"stefanha@redhat.com" <stefanha@redhat.com>,
	"nrupal.jani@intel.com" <nrupal.jani@intel.com>,
	"Piotr.Uminski@intel.com" <Piotr.Uminski@intel.com>,
	"hang.yuan@intel.com" <hang.yuan@intel.com>,
	"virtio@lists.oasis-open.org" <virtio@lists.oasis-open.org>,
	Jiri Pirko <jiri@nvidia.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
	"pasic@linux.ibm.com" <pasic@linux.ibm.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Max Gurtovoy <mgurtovoy@nvidia.com>
Message-ID: <20230425092651-mutt-send-email-mst@kernel.org>
References: <cover.1682354275.git.mst@redhat.com>
 <79c27bca6f72e4ea5d1d0e3a6b1a54369b03fb30.1682354275.git.mst@redhat.com>
 <e9256f17-f9ab-de6d-0377-d9fc210a7cc0@nvidia.com>
 <20230425020925-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481D9A42176A43075D4AD4DDC649@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481D9A42176A43075D4AD4DDC649@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH v12 03/10] admin: introduce group administration commands

On Tue, Apr 25, 2023 at 01:25:24PM +0000, Parav Pandit wrote:
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Tuesday, April 25, 2023 2:20 AM
> 
> > > Below paragraph is no longer applies as we already discussed more use
> > > cases of the AQ such as accessing the PCI VF's legacy config space registers.
> > > Please drop below paragraph.
> > 
> > Look - at one point you want commit log to record design process, an another
> > you turn around and ask me to drop it.
> > I feel like keeping this around frankly. Maybe I will add a sentence or two along
> > the lines of "Note that nothing limits us from extending this down the road
> > though - but let's focus on what we already know for now".
> > 
> I am requesting to drop the commit point that limits the usage of the AQ.
> Do you agree that AQ can be extended for use beyond VF and SIOV group management commands?
> Or one should create a new VQ type?
> If it is the later, I don't see the need of multiple AQ.

not management. that is old term and indeed too narrow.
administration as in hypervisor (admin) access through PF while 
guest has access through VF.

legacy access you link to below seems to fall within scope:
we access VF through a PF.

So what is the problem?

maybe we'll change the meaning down the road. I do not
see the immediate need currently though.


> > This extreme focus on commit log is poinless anyway - it makes much more
> > sense for code since commit log describes the change in english. Here the
> > whole change is english anyway.
> > 
> > > > Without this the admin vq would become a "whatever" vq which does
> > > > not do anything specific at all, just a general transport like thing.
> > > > I feel going this way opens the design space to the point where we
> > > > no longer know what belongs in e.g. config space what in the control
> > > > q and what in the admin q.
> > > > As it is, whatever deals with groups is in the admin q; other things
> > > > not in the admin q.
> > > >
> > >
> > > A PF can use same or different AQ with a new struct
> > > virtio_legacy_register_access with a different opcode range.
> > 
> > We'll get to that bridge and we'll cross it, the proposal is not on list even yet. 
> It is at [1].
> [1] https://lists.oasis-open.org/archives/virtio-dev/202304/msg00511.html
> I cannot draft the legacy command using AQ because AQ patch-5 in v12 fails to merge.
> 
> Before I draft it, I sent [1] on the design way forward.
> 
> > I
> > actually think that yes, you need it in a separate function. If PF is passed
> > through to guest then PF can not also safely DMA into host memory.
> That is fine. Only some user tests would pass the PF and VF to the VMs.
> One can create N combinations to make it not work.
> In all practical purposes, PF is owned by the hypervisor, trusted sw as listed in the PCI spec.
> 
> > Alternatively, we could use an MMIO based mechanism for admin commands.
> > And maybe that would be a good fit.
> We discussed that MMIO is not a good fit for the VFs at scale as listed in [1].
> 
> [1] https://lists.oasis-open.org/archives/virtio-dev/202304/msg00511.html

Then I don't see a problem. It's just commit log, not spec. Let it
slide is my suggestion, this is spec text not code.

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

