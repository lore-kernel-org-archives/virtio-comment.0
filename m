Return-Path: <virtio-comment-return-8361-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BA46C07548
	for <virtio-comment@archiver.kernel.org>; Wed, 15 Nov 2023 07:59:46 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 70CCC77B2B
	for <virtio-comment@archiver.kernel.org>; Wed, 15 Nov 2023 07:59:45 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5F670986DA6
	for <virtio-comment@archiver.kernel.org>; Wed, 15 Nov 2023 07:59:45 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 54C4D986D99; Wed, 15 Nov 2023 07:59:45 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 468BD986D9A
	for <virtio-comment@lists.oasis-open.org>; Wed, 15 Nov 2023 07:59:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 5xblN5n1MbKV7seu7t7PAg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700035181; x=1700639981;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TEMYePnnQo8eqSBlz/Wqcc73UCkC9w5VDTnAmda6FAA=;
        b=HGKBfEFYLhKowF9HxG3qsYdRqK72MJL0jYeV2u7o0DUafuvzbO2GIqDjVdnqBh9uwg
         XjE6bB8/euo4JrAp9QmA9Yz6tz92getMpmYP96aEAOD/OI2iWX25f9uY7aX0LdlzAqyW
         r8WcOUUMnmX0Ud2gx/ffmWy+/xvLyrZBkP8tft3WKDJ8hKtflLKVxiU6QJiBJB/2EFFs
         FYIhQfeYLSuu0Cp9fTb0wahU/thUcpvQyUpRI3Rpt8LNPIyCKdzaXUEDCGPhXPRNqPzo
         l1l3/LboMJhpU2811jJ/ivA9vsvcrWaJwKMmpaIiHYiF07jWoQmsGxC8nVc7DouwpZSX
         wElw==
X-Gm-Message-State: AOJu0YzjBtgmoY+cBvrynWJdG8uFaAJpv2uNxTMrLXJzbMQgopDbUH2X
	1pIcI/+4LNGpyaGpRIHjB2owB62kqCbzl+TIy5i+q5JF55y+ZXcN4U+OoA9C7k0NPG/BdCaCTee
	XZGXWBl4G5koFK325txxPg3WhDQtp89qSWA==
X-Received: by 2002:a05:6512:1381:b0:507:98d0:bec4 with SMTP id fc1-20020a056512138100b0050798d0bec4mr11045152lfb.54.1700035181081;
        Tue, 14 Nov 2023 23:59:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF2+ALe4h+3CBT5FixxZwbGi8w+/+j4t7329Lf6GosXxG4qkKzgzj7uB4a0qSFCGmF7YCiivg==
X-Received: by 2002:a05:6512:1381:b0:507:98d0:bec4 with SMTP id fc1-20020a056512138100b0050798d0bec4mr11045123lfb.54.1700035180628;
        Tue, 14 Nov 2023 23:59:40 -0800 (PST)
Date: Wed, 15 Nov 2023 02:59:36 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Jason Wang <jasowang@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>,
	"lingshan.zhu@intel.com" <lingshan.zhu@intel.com>
Message-ID: <20231115025214-mutt-send-email-mst@kernel.org>
References: <CACGkMEuA6u-EJCsrhvBRKxB6nxG=H28SEh4ihM3Ptgn1FQdGKA@mail.gmail.com>
 <DM8PR12MB54809F8316720CE5C1BCFF33DCA7A@DM8PR12MB5480.namprd12.prod.outlook.com>
 <CACGkMEtFyH_wJAqTz=jwosVM-=SRuO+wpT7NM=Eod8ExsxfTsg@mail.gmail.com>
 <PH0PR12MB54814420718AB387C0C84C07DCA6A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtGvDxF1Dnb6FJDK8XEAUcast-7OnuzTyfAr7m0LURWMw@mail.gmail.com>
 <PH0PR12MB548152A30021BEBFFCA62AA9DCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEv8mccZfcA4n+KVwdkaWAqhM94Qhq8H5Rvw2CocCmt9UA@mail.gmail.com>
 <20231107015412-mutt-send-email-mst@kernel.org>
 <CACGkMEv+jir2+f_vHmi_KjFXf0yz+EQmEbvzX0pheHKsVJkWZw@mail.gmail.com>
 <DM8PR12MB548057EA201EE985DE6C99C9DCAFA@DM8PR12MB5480.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <DM8PR12MB548057EA201EE985DE6C99C9DCAFA@DM8PR12MB5480.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] Re: [PATCH v3 6/8] admin: Add theory of operation for write
 recording commands

On Thu, Nov 09, 2023 at 06:26:44AM +0000, Parav Pandit wrote:
> 
> > From: Jason Wang <jasowang@redhat.com>
> > Sent: Wednesday, November 8, 2023 9:59 AM
> > 
> > On Tue, Nov 7, 2023 at 3:05 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > >
> > > On Tue, Nov 07, 2023 at 12:04:29PM +0800, Jason Wang wrote:
> > > > > > > Each virtio and non virtio devices who wants to report their
> > > > > > > dirty page report,
> > > > > > will do their way.
> > > > > > >
> > > > > > > > 3) inventing it in the virtio layer will be deprecated in
> > > > > > > > the future for sure, as platform will provide much rich
> > > > > > > > features for logging e.g it can do it per PASID etc, I don't
> > > > > > > > see any reason virtio need to compete with the features that
> > > > > > > > will be provided by the platform
> > > > > > > Can you bring the cpu vendors and committement to virtio tc
> > > > > > > with timelines
> > > > > > so that virtio TC can omit?
> > > > > >
> > > > > > Why do we need to bring CPU vendors in the virtio TC? Virtio
> > > > > > needs to be built on top of transport or platform. There's no need to
> > duplicate their job.
> > > > > > Especially considering that virtio can't do better than them.
> > > > > >
> > > > > I wanted to see a strong commitment for the cpu vendors to support dirty
> > page tracking.
> > > >
> > > > The RFC of IOMMUFD support can go back to early 2022. Intel, AMD and
> > > > ARM are all supporting that now.
> > > >
> > > > > And the work seems to have started for some platforms.
> > > >
> > > > Let me quote from the above link:
> > > >
> > > > """
> > > > Today, AMD Milan (or more recent) supports it while ARM SMMUv3.2
> > > > alongside VT-D rev3.x also do support.
> > > > """
> > > >
> > > > > Without such platform commitment, virtio also skipping it would not work.
> > > >
> > > > Is the above sufficient? I'm a little bit more familiar with vtd,
> > > > the hw feature has been there for years.
> > >
> > >
> > > Repeating myself - I'm not sure that will work well for all workloads.
> > 
> > I think this comment applies to this proposal as well.
> > 
> > > Definitely KVM did
> > > not scan PTEs. It used pagefaults with bit per page and later as VM
> > > size grew switched to PLM.  This interface is analogous to PLM,
> > 
> > I think you meant PML actually. And it doesn't work like PML. To behave like
> > PML it needs to
> > 
> > 1) log buffers were organized as a queue with indices
> > 2) device needs to suspend (as a #vmexit in PML) if it runs out of the buffers
> > 3) device need to send a notification to the driver if it runs out of the buffer
> > 
> > I don't see any of the above in this proposal. If we do that it would be less
> > problematic than what is being proposed here.
> > 
> In this proposal, its slightly different than PML.
> The log buffer is a write record with the device. It keeps recording it.
> And owner driver queries the recorded pages.
> The device internally can do PML or other different implementations as it finds suitable.

I personally like it that this detail is hidden inside the device.
One important functionality that PML has and that this does not
have is ability to interrupt host e.g. if is running low on
space to record these info. Want to add it in some way?
E.g. a special command that is only used if device is low
on buffers.


> > Even if we manage to do that, it doesn't mean we won't have issues.
> > 
> > 1) For many reasons it can neither see nor log via GPA, so this requires a
> > traversal of the vIOMMU mapping tables by the hypervisor afterwards, it would
> > be expensive and need synchronization with the guest modification of the IO
> > page table which looks very hard.
> > 2) There are a lot of special or reserved IOVA ranges (for example the interrupt
> > areas in x86) that need special care which is architectural and where it is
> > beyond the scope or knowledge of the virtio device but the platform IOMMU.
> > Things would be more complicated when SVA is enabled. And there could be
> > other architecte specific knowledge (e.g
> > PAGE_SIZE) that might be needed. There's no easy way to deal with those cases.
> > 
> 
> Current and future iommufd and OS interface likely can support this already.
> In current proposal, multiple ranges are supplied to the device, the reserved ranges are not part of it.
> 
> > We wouldn't need to care about all of them if it is done at platform IOMMU
> > level.
> > 
> I agree that when platform IOMMU has support and if its better it should be first priority to use by the hypervisor.
> Mainly because the D bit of the page already there, and not a special PML queue or a racy bitmap like what was proposed in other series.

BTW your bitmap is also racy if there's a vIOMMU, unless hypervisor is
very careful to empty the bitmap when mappings change.
You should document this requirement.


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

