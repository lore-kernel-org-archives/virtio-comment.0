Return-Path: <virtio-comment-return-8573-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E62BC61DF7
	for <virtio-comment@archiver.kernel.org>; Thu, 23 Nov 2023 14:39:57 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 62C772AEDE
	for <virtio-comment@archiver.kernel.org>; Thu, 23 Nov 2023 14:39:57 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 35EF29868AF
	for <virtio-comment@archiver.kernel.org>; Thu, 23 Nov 2023 14:39:57 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 124289868A2; Thu, 23 Nov 2023 14:39:57 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 035CD9868A3
	for <virtio-comment@lists.oasis-open.org>; Thu, 23 Nov 2023 14:39:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: uJ7Z8dtBMIWQc60hb3kb2w-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700750383; x=1701355183;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nfK1YyA8koX/mkACVe3sJYDOkJW2jbDFg8/fEyOqs0A=;
        b=AvSNDDM8lZXGVY99lvyyWn7HJMTymDOI3uznEYjp3Sb06yVtWNKvsEdqW6yrdljD79
         jDxd1c3EDPVlL+iFBil4B2kvsWkW8rCA519xTYPyzuEuAo16GEQeeK9LQzz1XglIVGnV
         FrO6C3U8VCIgCRXblrOMTAY3Tv5LDkSW3RxrtaaQcLLF/ECqgL9+10tvxWPDC6HRuGgK
         1ob1oKryC9jrfo1TT65pC9n9B8e0uYOOsmgrQKff/gSVlKLa7xy9ne+oUbRWCtcQK502
         ipeMKYHjZw1CFi4DQywc/sKAjI+/fTbOa2flFvbzuaG9Ret68bGWJ7s9ey2Uq5q1v/67
         mHzA==
X-Gm-Message-State: AOJu0YyQX7+ti1vbeGQx9mvAB/Ld3k5xIVwJxmdF7HUzWFqasydbulfr
	zldEGDwWhcTcKoBQvtPUgadjyjjDtWs+JMQHkn8/0c+rJrg9Ee+K+my7F9AAEM6LnAUywRGRbwK
	g6YXkiL4m4yBiFayQGds8EHewj9uZqXWWCg==
X-Received: by 2002:a5d:64ee:0:b0:332:d296:38e4 with SMTP id g14-20020a5d64ee000000b00332d29638e4mr4550136wri.3.1700750382844;
        Thu, 23 Nov 2023 06:39:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH7cEp3qOHZ7/r/mZgvQigF5ilkzh9iZjbe3IA7+spnU6odKPnwvSk9p19MSkwoarTTxwsmEg==
X-Received: by 2002:a5d:64ee:0:b0:332:d296:38e4 with SMTP id g14-20020a5d64ee000000b00332d29638e4mr4550117wri.3.1700750382462;
        Thu, 23 Nov 2023 06:39:42 -0800 (PST)
Date: Thu, 23 Nov 2023 09:39:38 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Si-Wei Liu <si-wei.liu@oracle.com>
Cc: Jason Wang <jasowang@redhat.com>, Parav Pandit <parav@nvidia.com>,
	"Zhu, Lingshan" <lingshan.zhu@intel.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>,
	eperezma <eperezma@redhat.com>
Message-ID: <20231123093718-mutt-send-email-mst@kernel.org>
References: <20231117065740-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481C905833821171814CB13DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117073031-mutt-send-email-mst@kernel.org>
 <PH0PR12MB548103A393411CF8357B85DEDCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117085848-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481E5431DFCF96F622A7696DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEvYTVA=kOT5vZSZ7nwTm00vbMy92EUV9RMX5ycrhweeVQ@mail.gmail.com>
 <bcb86082-31d8-4c59-b731-9aca05742568@oracle.com>
 <CACGkMEuOV7fSN8hXRG6HOvfOBZYrr_ZvRE0eEJwCxeHzLHebYQ@mail.gmail.com>
 <9404c15c-9c9b-45c7-befd-636b3d831c3e@oracle.com>
MIME-Version: 1.0
In-Reply-To: <9404c15c-9c9b-45c7-befd-636b3d831c3e@oracle.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] Re: [PATCH v3 6/8] admin: Add theory of
 operation for write recording commands

On Thu, Nov 23, 2023 at 05:19:06AM -0800, Si-Wei Liu wrote:
> If anything relevant I would more like to see performance comparison with
> platform dirty tracking via IOMMUFD, but that's perhaps too early stage at
> this point to conclude anything given there's very limited availability (in
> terms of supporting software, I know some supporting hardware has been
> around for a few years) and none of the potential software optimizations is
> in place at this point to make a fair comparison for.


Exactly. I suggested shadow as a kind of fallback since it is instead
available.

> Granted device
> assisted tracking has its own set of limitations e.g. loose coupling or
> integration with platform features, lack of nested and PASID support et al.
> However, state of the art for platform dirty tracking is not perfect either,
> far off being highly optimized for all types of workload or scenarios. At
> least to me the cost of page table walk to scan all PTEs across all levels
> is not easily negligible - given no PML equivalent here, are we sure the
> whole range scan can be as efficient and scalable as memory size / # of PTEs
> grows? How large it may impact the downtime with this rudimentary dirty
> scan? No data point was given thus far. If chances are that there could be
> major improvement from device tracking for those general use cases to
> supplement what platform cannot achieve efficiently enough, it's not too
> good to kill off the possibility entirely at this early stage. Maybe a PoC
> or some comparative performance data can help prove the theory?
> 
> On the other hand, the device assisted tracking has at least one advantage
> that platform cannot simply offer - throttle down device for convergence,
> inherently or explicitly whenever needed. I think earlier Micheal suggested
> something to make the core data structure used for logging more efficient
> and compact, working like PML but using a queue or an array, and the entry
> of which may contain a list of discrete pages or contiguous PFN ranges.

Hmm no, what I really meant is a way for device to store all or parts
of this structure in host RAM as opposed to all of it in on-device
memory as it has to be now.

> On
> top of this one may add parallelism to distribute load to multiple queues,
> or add zero copy to speed up dirty sync to userspace - things virtio queues
> are pretty good at doing. After all, nothing can be perfect to begin with,
> and every complex feature would need substantial time to improve and evolve.
> It does so for shadow virtqueue from where it gets started to where it is
> now, even so there's still a lot of optimization work not done yet. There
> must be head room here for device page tracking or platform tracking, too.
> 
> Regards,
> -Siwei
> 
> 
> > 
> > Shadow virtqueue can be used with a save/load model for device state
> > recovery for sure.
> > 
> > > > But it seems the shadow virtqueue itself is not the major factor but
> > > > the time spent on programming vendor specific mappings for example.
> > > Yep. The slowness on mapping part is mostly due to the artifact of
> > > software-based implementation. IMHO for live migration p.o.v it's better
> > > to not involve any mapping operation in the down time path at all.
> > Yes.
> > 
> > Thanks
> > 
> > > -Siwei
> > > > Thanks
> > > > 
> > > > > The time didn't come from pci side or boot side.
> > > > > 
> > > > > For pci side of things you would want to compare the pci vs non pci device based VM boot time.
> > > > > 
> > > > This publicly archived list offers a means to provide input to the
> > > > 
> > > > OASIS Virtual I/O Device (VIRTIO) TC.
> > > > 
> > > > 
> > > > 
> > > > In order to verify user consent to the Feedback License terms and
> > > > 
> > > > to minimize spam in the list archive, subscription is required
> > > > 
> > > > before posting.
> > > > 
> > > > 
> > > > 
> > > > Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> > > > 
> > > > Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> > > > 
> > > > List help: virtio-comment-help@lists.oasis-open.org
> > > > 
> > > > List archive: https://lists.oasis-open.org/archives/virtio-comment/
> > > > 
> > > > Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
> > > > 
> > > > List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
> > > > 
> > > > Committee: https://www.oasis-open.org/committees/virtio/
> > > > 
> > > > Join OASIS: https://www.oasis-open.org/join/
> > > > 
> > > 
> > > This publicly archived list offers a means to provide input to the
> > > OASIS Virtual I/O Device (VIRTIO) TC.
> > > 
> > > In order to verify user consent to the Feedback License terms and
> > > to minimize spam in the list archive, subscription is required
> > > before posting.
> > > 
> > > Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> > > Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> > > List help: virtio-comment-help@lists.oasis-open.org
> > > List archive: https://lists.oasis-open.org/archives/virtio-comment/
> > > Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
> > > List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
> > > Committee: https://www.oasis-open.org/committees/virtio/
> > > Join OASIS: https://www.oasis-open.org/join/
> > > 
> > 
> > This publicly archived list offers a means to provide input to the
> > 
> > OASIS Virtual I/O Device (VIRTIO) TC.
> > 
> > 
> > 
> > In order to verify user consent to the Feedback License terms and
> > 
> > to minimize spam in the list archive, subscription is required
> > 
> > before posting.
> > 
> > 
> > 
> > Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> > 
> > Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> > 
> > List help: virtio-comment-help@lists.oasis-open.org
> > 
> > List archive: https://lists.oasis-open.org/archives/virtio-comment/
> > 
> > Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
> > 
> > List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
> > 
> > Committee: https://www.oasis-open.org/committees/virtio/
> > 
> > Join OASIS: https://www.oasis-open.org/join/
> > 


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

