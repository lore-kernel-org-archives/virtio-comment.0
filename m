Return-Path: <virtio-comment-return-8395-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA10DC197A0
	for <virtio-comment@archiver.kernel.org>; Thu, 16 Nov 2023 07:14:26 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 1676841F2C
	for <virtio-comment@archiver.kernel.org>; Thu, 16 Nov 2023 07:14:26 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E2769986DDB
	for <virtio-comment@archiver.kernel.org>; Thu, 16 Nov 2023 07:14:25 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id CB2B6986DD2; Thu, 16 Nov 2023 07:14:25 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id BB931986DD3
	for <virtio-comment@lists.oasis-open.org>; Thu, 16 Nov 2023 07:14:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 0-7S0wAAMjipl1txQn10sA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700118862; x=1700723662;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Z2CS7megaRGlAzV1CbwdhLr86r3L35+5UL7/ELKs80=;
        b=QxKTaNAR4WIjd+E+yhjp/5tJxMV53PCMJ7VN0QnDGsJrlzgeo89bS2GI7T4kUegjWY
         wAqQFwyfK/+ZZflY15wgY5jg/qH9u35J8l0FowUWBtkH/GuyMSMu2r9o2w9e4iWQRa5H
         I9gqC1BmoBaVAi4bEcjKYU2C6GE7jWnOOcAvR8eSdXOfBvg2bJEt9l3vpHDbymu7KX4Z
         B2r+D7oEZdwK2Hul0J+JxJxPhKc16o/q4qC7ZYLM6NqwQA1GNdOPDOs1VTX0IljcBKhb
         wdPAWCbcD6WK9Z06Vhti9yRAT7ShULVSaeIXvOnEhEU3sJ1HMSTqrNYBV1QeaGUwaUN8
         3NWQ==
X-Gm-Message-State: AOJu0YwRC9eAC9dXFxqvxBpHlk5BqiUkv1v1c4Ks2xJRUXdOhdbF75kN
	f+j48q8G4EK52Y32tsj8YDs3U+gHuYfBGVi0zaJttds4kZpi2OrRaBObvXpszKzKFErw8QHP6PB
	mvIY2hKdyrGpVDT/Vp7DqhheZGo3MtHIW6A==
X-Received: by 2002:a05:600c:600a:b0:405:e492:8aef with SMTP id az10-20020a05600c600a00b00405e4928aefmr1279832wmb.40.1700118861789;
        Wed, 15 Nov 2023 23:14:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGPbH/6bl+lucheR1JwFNmX7LVJeQr5tqvh30ewhHi3DDKOyoSkSPa7C004vYxesd7+aYKyqw==
X-Received: by 2002:a05:600c:600a:b0:405:e492:8aef with SMTP id az10-20020a05600c600a00b00405e4928aefmr1279816wmb.40.1700118861378;
        Wed, 15 Nov 2023 23:14:21 -0800 (PST)
Date: Thu, 16 Nov 2023 02:14:18 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Jason Wang <jasowang@redhat.com>,
	"Zhu, Lingshan" <lingshan.zhu@intel.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>
Message-ID: <20231116020431-mutt-send-email-mst@kernel.org>
References: <CACGkMEsfcEjue1UZmuNs8k65o3HSM94VsweSbWLH3383STR97A@mail.gmail.com>
 <PH0PR12MB548149E1E51DA9C1C094ABCADCB1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEt277yYUHf98dCkypS-PXzu7JrRSVBAQ2cCRg4XzCLPzw@mail.gmail.com>
 <PH0PR12MB5481DB04DEB1A540185ED1ECDCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231116012208-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54811F4CE5686AE4BEA826C1DCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231116013650-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481D1A55E02DE4FB63E62BBDCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231116015424-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54816851C613AAC9A34A7FCDDCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB54816851C613AAC9A34A7FCDDCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration

On Thu, Nov 16, 2023 at 07:02:23AM +0000, Parav Pandit wrote:
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Thursday, November 16, 2023 12:27 PM
> > 
> > On Thu, Nov 16, 2023 at 06:43:05AM +0000, Parav Pandit wrote:
> > >
> > >
> > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > Sent: Thursday, November 16, 2023 12:09 PM
> > > >
> > > > On Thu, Nov 16, 2023 at 06:34:23AM +0000, Parav Pandit wrote:
> > > > >
> > > > >
> > > > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > > > Sent: Thursday, November 16, 2023 11:53 AM
> > > > > >
> > > > > > On Thu, Nov 16, 2023 at 05:28:19AM +0000, Parav Pandit wrote:
> > > > > > > You continue to want to overload admin commands for dual
> > > > > > > purpose, does
> > > > > > not make sense to me.
> > > > > >
> > > > > > dual -> as a transport and for migration? why can't they be used
> > > > > > for this? I was really hoping to cover these two cases when I proposed
> > them.
> > > > > For following reasons.
> > > > >
> > > > > 1. migration needs incremental reads of only changed context
> > > > > between two reads
> > > > >
> > > > > 2. migration writes covers large part of the configurations not
> > > > > just virtio
> > > > common config and device config.
> > > > > Such as configuration occurred through the CVQ. All of these is
> > > > > not needed
> > > > when done from guest directly via member's own CVQ.
> > > > >
> > > > > For backward compatible SIOV transport, one may need them to
> > > > > transport
> > > > without above two properties.
> > > > >
> > > > > 3. None of this transport is needed for PFs, VFs and non-backward
> > > > > compatible
> > > > SIOVs.
> > > > > Each device to have its own transport that is not intercepted by
> > > > > the hypervisor
> > > > and follow the equivalency principle uniformly for all 3 device types.
> > > > >
> > > >
> > > > To clarify. Above seems to justify why the admin commands for
> > > > migration must be distinct from admin commands for transport. But I
> > > > don't see why (e.g. two sets of) admin commands can not be used for both.
> > Do you?
> > >
> > > I didn't follow, "used for both".
> > > Can you please explain?
> > > Both meaning,
> > > a. for device migration and
> > > b. for transporting configuration by owner device on behalf of member
> > device?
> > 
> > Yes, so one set of commands for migration another for passing config space
> > accesses. We do in fact have admin commands as transport for legacy, do we
> > not? And in this model we can have new group types, e.g. SIOV's subfunction or
> > even a "self" group.
> 
> This is only need for backward compatible SIOV device.
> And I am not sure if one should create such or not.
> In some internal test we see device and platform tend to saturate at various levels beyond a certain scale, due to which building backward compatible SIOV is not very useful.

Can we see some reports of all this performance testing you are doing
behind the scenes? It would be really benefitial since everyone
is just discussing things theoretically and here finally someone
did some experiments. This is a strong point in your favor but not
if you just obliquely refer to "certain scale".

> For non-backward compatible SIOV device, PFs, and VFs all the
> configurations must be done directly from the driver to device without
> mediation layers as listed in above #3.

/facepalm. You keep bringing this up.  There's no must here because all
hypervisor have some kind of mediation. Whenever you have some solution
in mind you immediately brand whatever it does not do "not mediation" or
"out of scope" and whatever it does "mediation". The distinction does
not matter.


> Hence, there is really no point in doing transport VQ for future.
> Each device doing its runtime configuration using its own transport method solves scale and security both uniformly across PF, VF, SIOV.

Yes, there's a point.
The point is that low end uses of virtio dwarf the high end scalable
things you are so preoccupied with - understandably as representative of
a hardware vendor who wants high margins. This is why we need to keep
simple things in config space and this means that yes, we will keep
expanding config space. And this in turn means that if you want
to do things over DMA then you need a way to access config space over DMA.
This way needs to use *some kind of command* and maybe that can be admin
command format.

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

