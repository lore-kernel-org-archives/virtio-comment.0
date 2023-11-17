Return-Path: <virtio-comment-return-8452-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC99DC072A2
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 11:35:29 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 2E79E157EAA
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 11:35:29 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0CDEA986E20
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 11:35:29 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id E12DD986E1D; Fri, 17 Nov 2023 11:35:28 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4F781986E1E
	for <virtio-comment@lists.oasis-open.org>; Fri, 17 Nov 2023 11:34:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 1rsRA3r5NL-K_OzB9036-Q-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700220838; x=1700825638;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NzIKJQiGPAl6K0i0jA8OFObniyKWkAUjEU2tv2KaXhw=;
        b=IDPvwhyXrZxFpsx1nkBEG5BIoNYZIUy4mwRvxcXjYNLJnwT5BxRhnBuZu7N2DpNnL8
         HzAnG6tcYEc9EU09kd6f2brxAAwTfeXCb7TmXfp9ruj2BYVi9+f3PGKBAQCsQvn1na4t
         OyqRifqPwHtrwg/tutN3BZqmnqpxavBJX0KAlhDpAKdaUXd9x2tAxbknR/oqOPmWb783
         Dxy8jeGRlHuIIQYLrSJzFF4nPVKj3CspP43/TYCIYu8dVjG61J3zN+Sx6ZEXcQFy/4jv
         JRphL9eobuHZ+ZZuC6k13Ayc0XmgI3KGJpWpnLj69s4cPiVnkRtVirhAMeSTAphecV4M
         6dvA==
X-Gm-Message-State: AOJu0Yz15qah2kj3OjYyISRCmDA8E3bHSnp6jNIzcxj84eSJRH7xsrCc
	T+bD9Uu+9TgeCmeJKQRMJ6CJEMd8Juy4Z14gsPLofmRG4AATrKAwR5r9h6ebk061u0O5GQNUvDY
	6k7LfCco9JxphqWo36DzD87ilyC8jCEIZBA==
X-Received: by 2002:a05:6000:1446:b0:32f:91d2:6f1b with SMTP id v6-20020a056000144600b0032f91d26f1bmr14364580wrx.5.1700220838579;
        Fri, 17 Nov 2023 03:33:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHOSQm2XTpPHeveYfTC/2UJX0Rt010UEWwirs0MKwlUQR+RJrXvP/ttejW3oouCXFB70StMOA==
X-Received: by 2002:a05:6000:1446:b0:32f:91d2:6f1b with SMTP id v6-20020a056000144600b0032f91d26f1bmr14364561wrx.5.1700220838195;
        Fri, 17 Nov 2023 03:33:58 -0800 (PST)
Date: Fri, 17 Nov 2023 06:33:51 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "Zhu, Lingshan" <lingshan.zhu@intel.com>,
	Jason Wang <jasowang@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>
Message-ID: <20231117063304-mutt-send-email-mst@kernel.org>
References: <PH0PR12MB54810AFC15EAC51755CFC045DCB1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtP+W4mdfn5PszoSHW3tNS+KPAMKXvJhpWKa_NchxVpZA@mail.gmail.com>
 <PH0PR12MB54815F616E0CF024927984C2DCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231116004037-mutt-send-email-mst@kernel.org>
 <b0ad9991-4372-4900-8baf-a111777f6d92@intel.com>
 <20231116065416-mutt-send-email-mst@kernel.org>
 <705e728a-368a-4e28-a7b2-61afddb15ce9@intel.com>
 <PH0PR12MB5481C2B37901FDBBE672EF98DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117054650-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54813446F8F2BBDBC74BF393DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB54813446F8F2BBDBC74BF393DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] Re: [PATCH v3 6/8] admin: Add theory of
 operation for write recording commands

On Fri, Nov 17, 2023 at 11:05:16AM +0000, Parav Pandit wrote:
> 
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Friday, November 17, 2023 4:30 PM
> > 
> > On Fri, Nov 17, 2023 at 10:03:47AM +0000, Parav Pandit wrote:
> > >
> > >
> > > > From: Zhu, Lingshan <lingshan.zhu@intel.com>
> > > > Sent: Friday, November 17, 2023 3:30 PM
> > > >
> > > > On 11/16/2023 7:59 PM, Michael S. Tsirkin wrote:
> > > > > On Thu, Nov 16, 2023 at 06:28:07PM +0800, Zhu, Lingshan wrote:
> > > > >>
> > > > >> On 11/16/2023 1:51 PM, Michael S. Tsirkin wrote:
> > > > >>> On Thu, Nov 16, 2023 at 05:29:54AM +0000, Parav Pandit wrote:
> > > > >>>> We should expose a limit of the device in the proposed
> > > > WRITE_RECORD_CAP_QUERY command, that how much range it can track.
> > > > >>>> So that future provisioning framework can use it.
> > > > >>>>
> > > > >>>> I will cover this in v5 early next week.
> > > > >>> I do worry about how this can even work though. If you want a
> > > > >>> generic device you do not get to dictate how much memory VM has.
> > > > >>>
> > > > >>> Aren't we talking bit per page? With 1TByte of memory to track
> > > > >>> -> 256Gbit -> 32Gbit -> 8Gbyte per VF?
> > > > >>>
> > > > >>> And you happily say "we'll address this in the future" while at
> > > > >>> the same time fighting tooth and nail against adding single bit
> > > > >>> status registers because scalability?
> > > > >>>
> > > > >>>
> > > > >>> I have a feeling doing this completely theoretical like this is problematic.
> > > > >>> Maybe you have it all laid out neatly in your head but I suspect
> > > > >>> not all of TC can picture it clearly enough based just on spec text.
> > > > >>>
> > > > >>> We do sometimes ask for POC implementation in linux / qemu to
> > > > >>> demonstrate how things work before merging code. We skipped this
> > > > >>> for admin things so far but I think it's a good idea to start
> > > > >>> doing it here.
> > > > >>>
> > > > >>> What makes me pause a bit before saying please do a PoC is all
> > > > >>> the opposition that seems to exist to even using admin commands
> > > > >>> in the 1st place. I think once we finally stop arguing about
> > > > >>> whether to use admin commands at all then a PoC will be needed
> > before merging.
> > > > >> We have POR productions that implemented the approach in my series.
> > > > >> They are multiple generations of productions in market and
> > > > >> running in customers data centers for years.
> > > > >>
> > > > >> Back to 2019 when we start working on vDPA, we have sent some
> > > > >> samples of production(e.g., Cascade Glacier) and the datasheet,
> > > > >> you can find live migration facilities there, includes suspend,
> > > > >> vq state and other features.
> > > > >>
> > > > >> And there is an reference in DPDK live migration, I have provided
> > > > >> this page
> > > > >> before:
> > > > >> https://doc.dpdk.org/guides-21.11/vdpadevs/ifc.html, it has been
> > > > >> working for long long time.
> > > > >>
> > > > >> So if we let the facts speak, if we want to see if the proposal
> > > > >> is proven to work, I would
> > > > >> say: They are POR for years, customers already deployed them for years.
> > > > > And I guess what you are trying to say is that this patchset we
> > > > > are reviewing here should be help to the same standard and there
> > > > > should be a PoC? Sounds reasonable.
> > > > Yes and the in-marketing productions are POR, the series just
> > > > improves the design, for example, our series also use registers to
> > > > track vq state, but improvements than CG or BSC. So I think they are proven
> > to work.
> > >
> > > If you prefer to go the route of POR and production and proven documents
> > etc, there is ton of it of multiple types of products I can dump here with open-
> > source code and documentation and more.
> > > Let me know what you would like to see.
> > >
> > > Michael has requested some performance comparisons, not all are ready to
> > share yet.
> > > Some are present that I will share in coming weeks.
> > >
> > > And all the vdpa dpdk you published does not have basic CVQ support when I
> > last looked at it.
> > > Do you know when was it added?
> > 
> > It's good enough for PoC I think, CVQ or not.
> > The problem with CVQ generally, is that VDPA wants to shadow CVQ it at all
> > times because it wants to decode and cache the content. But this problem has
> > nothing to do with dirty tracking even though it also mentions "shadow":
> > if device can report it's state then there's no need to shadow CVQ.
> 
> For the performance numbers with the pre-copy and device context of patches posted 1 to 5, the downtime reduction of the VM is 3.71x with active traffic on 8 RQs at 100Gbps port speed.

Sounds good can you please post a bit more detail?
which configs are you comparing what was the result on each of them.

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

