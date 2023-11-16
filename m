Return-Path: <virtio-comment-return-8391-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE20BC197A0
	for <virtio-comment@archiver.kernel.org>; Thu, 16 Nov 2023 06:50:28 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 21BC72AD47
	for <virtio-comment@archiver.kernel.org>; Thu, 16 Nov 2023 06:50:28 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D6B64986DE1
	for <virtio-comment@archiver.kernel.org>; Thu, 16 Nov 2023 06:50:27 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id A2469986DD1; Thu, 16 Nov 2023 06:50:27 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4B6E3986DD2
	for <virtio-comment@lists.oasis-open.org>; Thu, 16 Nov 2023 06:49:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: jahvJyv0PJ25DkfdTmD8gg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700117372; x=1700722172;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SlGbPUh15ch3tV/JgK3X8aE2A/31pii/lpYK2AINfdE=;
        b=nLqJO4aTNnB9hLcDzmSEI6MEeuhOsddIiaGstTq3dV6qaK4isep3cwF1XX5+W0o/NE
         iX+IfpJnaUzRooR2dVyMfMLyeWhoFaHOdAqp+D11RGRVXJKYemhYAOTcUefo5+jK/NT1
         968xTreAcnCfnxVmnACcQ1g455VlxA3FnGQx//tePKRS4Rj8/XzC44kPZOksgLPjy5Za
         IUeE/vnCWImhph1DAu1CVPXElPzkq9CsLZmYKnECUolUT/tUnWv9SvATJuRqdilS8cug
         c5AtX6vk3Y5RGihzRzFK/TNd9Lh0b9w+VgPKSWBhWf82U4VhOzZ6dV19MAKC+htRRur+
         NBaQ==
X-Gm-Message-State: AOJu0YxS2miXQ8zPQQg1CQz6vr15biWUINZPvfcobBj3sFcHKHnXR977
	1VdUq5QWXYPF9srLiKziVgyXY4+SDm0jBzWaV9mbsATPLU5VV5zHYRR6f/2BpH6OdwJQDZREnmo
	23RqX1t0ZoCjeNGzVBBs57uiOsd48jgxvIQ==
X-Received: by 2002:a5d:648f:0:b0:32d:967d:1baf with SMTP id o15-20020a5d648f000000b0032d967d1bafmr12168527wri.1.1700117372502;
        Wed, 15 Nov 2023 22:49:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFaD2ajFlbQd1n26q41m8an5UDBoAR5Emhw9SQuJ8wYly60R6XVv7lvjZIhTiquzHIH+5nscw==
X-Received: by 2002:a5d:648f:0:b0:32d:967d:1baf with SMTP id o15-20020a5d648f000000b0032d967d1bafmr12168504wri.1.1700117372146;
        Wed, 15 Nov 2023 22:49:32 -0800 (PST)
Date: Thu, 16 Nov 2023 01:49:28 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>,
	"lingshan.zhu@intel.com" <lingshan.zhu@intel.com>
Message-ID: <20231116014250-mutt-send-email-mst@kernel.org>
References: <CACGkMEv8mccZfcA4n+KVwdkaWAqhM94Qhq8H5Rvw2CocCmt9UA@mail.gmail.com>
 <20231107015412-mutt-send-email-mst@kernel.org>
 <CACGkMEv+jir2+f_vHmi_KjFXf0yz+EQmEbvzX0pheHKsVJkWZw@mail.gmail.com>
 <20231108025854-mutt-send-email-mst@kernel.org>
 <CACGkMEvkQawXWCvu7rZHnZk8YsNunS_B-fcQmEHEe_N87Q6y6g@mail.gmail.com>
 <20231109022647-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54813C84CFA5601DB1B47885DCAEA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEu-Zs-dxcYRjtV+hLBVy5Tv9JzgT2c83Zjzt7A-a1QR2A@mail.gmail.com>
 <PH0PR12MB54810DA3AAA7631319B2C1BFDCB1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsWN38gptqRBN=50LY6S-yJ0cRQcJk=kih9Dj-7bm0V6Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACGkMEsWN38gptqRBN=50LY6S-yJ0cRQcJk=kih9Dj-7bm0V6Q@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] Re: [PATCH v3 6/8] admin: Add theory of operation for write
 recording commands

On Thu, Nov 16, 2023 at 12:24:27PM +0800, Jason Wang wrote:
> On Thu, Nov 16, 2023 at 1:37 AM Parav Pandit <parav@nvidia.com> wrote:
> >
> >
> > > From: Jason Wang <jasowang@redhat.com>
> > > Sent: Monday, November 13, 2023 9:11 AM
> > >
> > > On Fri, Nov 10, 2023 at 2:46 PM Parav Pandit <parav@nvidia.com> wrote:
> > > >
> > > > Hi Michael,
> > > >
> > > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > > Sent: Thursday, November 9, 2023 1:29 PM
> > > >
> > > > [..]
> > > > > > Besides the issue of performance, it's also racy, assuming we are
> > > > > > logging
> > > > > IOVA.
> > > > > >
> > > > > > 0) device log IOVA
> > > > > > 1) hypervisor fetches IOVA from log buffer
> > > > > > 2) guest map IOVA to a new GPA
> > > > > > 3) hypervisor traverse guest table to get IOVA to new GPA
> > > > > >
> > > > > > Then we lost the old GPA.
> > > > >
> > > > > Interesting and a good point. And by the way e.g. vhost has the same
> > > > > issue.  You need to flush dirty tracking info when changing the
> > > > > mappings somehow.  Parav what's the plan for this? Should be addressed in
> > > the spec too.
> > > > >
> > > > As you listed the flush is needed for vhost or device-based DPT.
> > >
> > > What does DPT mean? Device Page Table? Let's not invent terminology which is
> > > not known by others please.
> > >
> > Sorry for using the acronym. I meant dirty page tracking.
> >
> > > We have discussed it many times. You can't just depend on ATS or reinventing
> > > wheels in virtio.
> > The dependency is on the iommu which would have the mapping of GIOVA to GPA like any sw implementation.
> > No dependency on ATS.
> >
> > >
> > > What's more, please try not to give me the impression that the proposal is
> > > optimized for a specific vendor (like device IOMMU stuffs).
> > >
> > You should stop calling this specific vendor thing.
> 
> Well, as you have explained, the confusion came from "DPT" ...
> 
> > One can equally say that suspend bit proposal is for the sw_vendor device who is forcing virtio hw device to only implement ioqueues + PASID + non_unified interface for PF, VF, SIOVs + non_TDISP based devices.
> >
> > > > The necessary plumbing is already covered for this in the query (read and
> > > clear) command of this v3 proposal.
> > >
> > > The issue is logging via IOVA ... I don't see how "read and clear" can help.
> > >
> > Read and clear helps that ensures that all the dirty pages are reported, hence there is no mapping/unmapping race.
> 
> Reported as IOVA ...
> 
> > As everything is reported.
> >
> > > > It is listed in Device Write Records Read Command.
> > >
> > > Please explain how your proposal can solve the above race.
> > >
> > In below manner.
> > 1. guest has GIOVA to GPA_1 mapping
> > 2. RX packets occurred to GIOVA
> > 3. device reported dirty page log for GIOVA (hypervisor is yet to read)
> > 4. guest requested mapping change from GIOVA to GPA_2
> > 4.1 During this IOTLB is invalidated and dirty page report is queried ensuring, it can change the mapping
> 
> It requires
> 
> 1) hypervisor traps IOTLB invalidation, which doesn't work when
> nesting could be offloaded (IOMMUFD has started the work to support
> nesting)
> 2) query the device about the dirty page on each IOTLB invalidation which:
> 2.1) A huge round trip: guest IOTLB invalidation -> trapped by
> hypervisor -> start the query from the device -> device return ->
> hypervisor reports IOTLB invalidation is done -> let guest run. Have
> you benchmarked the RTT in this case? There are just too many places
> that cause the delay in the middle.

To be fair invalidations are already expensive e.g. with vhost iotlb
it requires a slow system call.
This will make them *even more* expensive.

Problem for some but not all workloads.  Again I agree motivation,
tradeoffs and comparison with both dirty tracking by iommu and shadow vq
approaches really should be included.


> 2.2) Guest triggerable behaviour, malicious guest can simply do
> endless IOTLB invalidation to DOS the e.g admin virtqueue

I'm not sure how much to worry about it - just don't allow more
than one in flight per VM.



> >
> > > >
> > > > When the page write record is fully read, it is flushed.
> > > > How/when to use, I think its hypervisor specific, so we probably better off not
> > > documenting those details.
> > >
> > > Well, as the author of this proposal, at least you need to know how a hypervisor
> > > can work with your proposal, no?
> > >
> > Likely yes, but it is not the scope of the spec to list those paths etc.
> 
> Fine, but as a reviewer I need to know if it can work with a hypervisor well.
> 
> >
> > > > May be such read is needed in some other path too depending on how
> > > hypervisor implemented.
> > >
> > > What do you mean by "May be ... some other path" here? You're inventing a
> > > mechanism that you don't know how a hypervisor can use?
> >
> > No. I meant hypervisor may have more operations that map/unmap/flush where it may need to implement it.
> > Some one may call it set_map(), some may say dma_map()...
> 
> Ok.
> 
> Thanks


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

