Return-Path: <virtio-comment-return-8168-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D45FC4332F
	for <virtio-comment@archiver.kernel.org>; Sun,  5 Nov 2023 16:12:26 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 60ECA2AEE2
	for <virtio-comment@archiver.kernel.org>; Sun,  5 Nov 2023 16:12:26 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2DCFF9866C7
	for <virtio-comment@archiver.kernel.org>; Sun,  5 Nov 2023 16:12:26 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 0B03D9866B4; Sun,  5 Nov 2023 16:12:26 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id EEA559866B5
	for <virtio-comment@lists.oasis-open.org>; Sun,  5 Nov 2023 16:12:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: zsF00c5yOlCFOgMgSxeR9A-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699200740; x=1699805540;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UcYhQj4UJ8JQLTfJODneDeQb6IvWQtFg6tuSqQNv2j8=;
        b=fIjHtlQUy/QWXVi84xehPmi9E4iGwzZLqTcoq8RwF47pADRhi9BjWWp6c5mVtS5hWs
         AFJKfpDvAJduhQ31c7vgzuqPYn2l854aiiJclRXiX9/yTHB+LP6HZUB//lielvvGngVC
         OuRqIDoWT1K0okpcjerbm80IxNO4P0pXMl+exd2o8eJR8MRU1RKMoAfP9Ltp4xmiaC82
         L8zGN0LgVVHvFLUh6lw3ZRPQ5zwLxR3ihKsGiajbvWdiUlbbsdtYw++F+PuoyQMJTNZL
         uzoLAzyoWGpYY0BHvn+H8SdOm8Dgd4bKsbsCpQcNU3WLqJQtG8Ee8P+zGIjAG/jWg3tJ
         uD7A==
X-Gm-Message-State: AOJu0Ywa0PT8S0lBLPC+sVvxf0vJ6ANmTE5JCdrFWAHrBVjInmr3vfLk
	jYGDt4dUEMjELcp9fPGOm2+l7f/W53zM3T+DGREFL2kijoKF9EOjgSTfBH3YTRsHecFaG7mJMB6
	QgEpPFE/grGOIdVt6Nl364hFLqekIIhLBhQ==
X-Received: by 2002:a17:907:9306:b0:9c7:5667:5643 with SMTP id bu6-20020a170907930600b009c756675643mr12961983ejc.72.1699200740338;
        Sun, 05 Nov 2023 08:12:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFDnsduOPiMYyH6C3QMI44GI+EXf8hspmNNwMfGqSAT4atAYe00UphHb0N/z2cI8Hk51BrmnQ==
X-Received: by 2002:a17:907:9306:b0:9c7:5667:5643 with SMTP id bu6-20020a170907930600b009c756675643mr12961974ejc.72.1699200740055;
        Sun, 05 Nov 2023 08:12:20 -0800 (PST)
Date: Sun, 5 Nov 2023 11:12:13 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "Zhu, Lingshan" <lingshan.zhu@intel.com>,
	"jasowang@redhat.com" <jasowang@redhat.com>,
	"eperezma@redhat.com" <eperezma@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"stefanha@redhat.com" <stefanha@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
Message-ID: <20231105075906-mutt-send-email-mst@kernel.org>
References: <20231103103437.72784-1-lingshan.zhu@intel.com>
 <20231103103437.72784-7-lingshan.zhu@intel.com>
 <20231103064730-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481D028E63E6CB0AA7F4149DCA5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <fdfda658-e89c-41f4-9f4c-77d5d9b1b642@intel.com>
 <PH0PR12MB54818179419B06412D7A9C84DCA5A@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB54818179419B06412D7A9C84DCA5A@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH V2 6/6] virtio-pci: implement dirty page tracking

On Fri, Nov 03, 2023 at 03:47:34PM +0000, Parav Pandit wrote:
> > > [1]
> > > https://lists.oasis-open.org/archives/virtio-comment/202310/msg00475.h
> > > tml
> > you still need to explain why this does not work for pass-through. 
> It does not work for following reasons.
> 1. Because all the fields that put on the member device are not in direct control of the hypervisor.
> The device is directly controlled by the guest including the device status and when it resets the device all the things stored in the device are lost.

I think the idea is that when this gateway is in the device then
device reset has to trap. At a high level, ok. But then what?
Is a full scan of all memory required until device reset is complete?
Drivers currently tend to busy poll the reset register,
if this takes very long we might start seeing soft lockup
messages. What is the idea then? Maybe for this we need a separate
weaker reset that does not touch this capability?

>
> 2. the PCI FLR is clearing all the registers you exposed here.

Same problem, though FLR at least is expected to take a long time.


> 3. Endless expansion of config registers of dirty tracking is not scalable, as they are not init time registers not following the Appendix B guidelines.

> 4. bitmap based dirty tracking is not atomic between cpu and device.
> Hence, it is racy.

Well pcie atomics exist. Not sure whether it's reasonable to rely on
them. Any data on who common implementations are?

> 5. All the device context needed for passthrough based hypervisor for a device type specific is missing.
> All of those can be used for non-passthrough as well.
> [1] https://lists.oasis-open.org/archives/virtio-comment/202311/msg00085.html
> 
> > And I
> > remember this is a point-less topic as MST ever wants to mute another "pass-
> > through" thread.
> No. he did not say that.
> He meant to not endlessly debate which one is better.
> He clearly said, try to see if you can make multiple hypervisor model work.
> And your series shows a clear ignorance of his guidance.

I think you mean "ignoring" :)


> 
> > >
> > >>> +optionally the device is permitted to set the entire byte, which
> > >>> +encompasses
> > >> the relevant bit, to 1.
> > >>> +
> > >>> +The device MAY increase \field{gra_power} to reduce
> > \field{bitmap_length}.
> > >>> +
> > >>> +The device must ignore any writes to \field{pasid} if PASID
> > >>> +Extended Capability is absent or the PASID functionality is
> > >>> +disabled in PASID Extended Capability
> > >>
> > >> I have to say this is going to work very badly when the number of
> > >> dirty pages is
> > >> small: you will end up scanning and re-scanning all of bitmap.
> > >> And the resolution is apparently 8 pages? You have just multiplied
> > >> the migration bandwidth by a factor of 8.
> > > Yeah.
> > > And device does not even know previously reported pages are read by driver
> > or not. All guess work game for driver and device.
> > see my reply to him
> Please see above reply.


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

