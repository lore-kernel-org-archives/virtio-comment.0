Return-Path: <virtio-comment-return-8268-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDE70C4332F
	for <virtio-comment@archiver.kernel.org>; Wed,  8 Nov 2023 17:20:31 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 3347526A5C
	for <virtio-comment@archiver.kernel.org>; Wed,  8 Nov 2023 17:20:31 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E3C96986CBD
	for <virtio-comment@archiver.kernel.org>; Wed,  8 Nov 2023 17:20:30 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id BDB1D986CA7; Wed,  8 Nov 2023 17:20:30 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C9B22986CA8
	for <virtio-comment@lists.oasis-open.org>; Wed,  8 Nov 2023 17:19:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: f6CG2s3sP6CQrwb821HNqw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699463944; x=1700068744;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/AJczfqRo6MABs7yX9sHkRGI9GlyYDKETXvAy1tYJBE=;
        b=GO7VseM+vqnfDayLOO1aiqdQFPS5J66GNgYl9+72E92UXSOHEEVHhE3vqu/rlCrIOa
         O5siqyXyN7OBQgaodcIT8Wf6RMxw1QNOEZCOeKoNBpkT4McwgVCwhvuiaum07AcTQSHq
         5zq15Ct5gNthmteuAbORMTLsLdI/0L/OcGXA+cZwEhSxu7qhFDNdHzdDeATxN2HhkFzX
         Eih5RfkZEROWoA4XzaaicdmGkfnYdiQYVSqQuvFCwc3VKB7hmGccaNtovJ+idX7iMSE1
         Cl66vmeE6QuT9FoyyFT6KuyZD9g0N0O2l/9+xZOcsdBe0o/0rAKk327fPb4RJi8ppovf
         SDfw==
X-Gm-Message-State: AOJu0Yy0/iKbCJfwj4H9Fz6moECZEQiGfxHhcmwECuoL/1U673Y0X7oz
	tRHzCr2wQmNFUxjxoECrV8ESzXx6gL3GgL/UE1311bGdc2UuDdjSKVaEjZK/3dT/FNbuBSdsep/
	SxGyUrqfminhcvdD7YJ9PX5Oq3bhcMvU+uA==
X-Received: by 2002:a5d:658a:0:b0:32f:a254:c8b2 with SMTP id q10-20020a5d658a000000b0032fa254c8b2mr3048573wru.20.1699463944282;
        Wed, 08 Nov 2023 09:19:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHTDUhUsjfdtOtZURVW+GiSnjrgF6i0SW/qLy4rdxrhBdl3luD6WG5psHODounvc8kWiZ0O7w==
X-Received: by 2002:a5d:658a:0:b0:32f:a254:c8b2 with SMTP id q10-20020a5d658a000000b0032fa254c8b2mr3048541wru.20.1699463943879;
        Wed, 08 Nov 2023 09:19:03 -0800 (PST)
Date: Wed, 8 Nov 2023 12:18:59 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>
Cc: Parav Pandit <parav@nvidia.com>,
	"jasowang@redhat.com" <jasowang@redhat.com>,
	"eperezma@redhat.com" <eperezma@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"stefanha@redhat.com" <stefanha@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
Message-ID: <20231108121710-mutt-send-email-mst@kernel.org>
References: <20231103103437.72784-1-lingshan.zhu@intel.com>
 <20231103103437.72784-7-lingshan.zhu@intel.com>
 <20231103064730-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481D028E63E6CB0AA7F4149DCA5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <fdfda658-e89c-41f4-9f4c-77d5d9b1b642@intel.com>
 <PH0PR12MB54818179419B06412D7A9C84DCA5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231105075906-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54819604160CF0A2566AFB5DDCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231107054348-mutt-send-email-mst@kernel.org>
 <4d4dc2fc-7563-4224-b96e-2c82f6248432@intel.com>
MIME-Version: 1.0
In-Reply-To: <4d4dc2fc-7563-4224-b96e-2c82f6248432@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] Re: [PATCH V2 6/6] virtio-pci: implement dirty
 page tracking

On Wed, Nov 08, 2023 at 05:29:00PM +0800, Zhu, Lingshan wrote:
> 
> 
> On 11/7/2023 7:13 PM, Michael S. Tsirkin wrote:
> > On Mon, Nov 06, 2023 at 04:03:42AM +0000, Parav Pandit wrote:
> > > 
> > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > Sent: Sunday, November 5, 2023 9:42 PM
> > > > 
> > > > On Fri, Nov 03, 2023 at 03:47:34PM +0000, Parav Pandit wrote:
> > > > > > > [1]
> > > > > > > https://lists.oasis-open.org/archives/virtio-comment/202310/msg004
> > > > > > > 75.h
> > > > > > > tml
> > > > > > you still need to explain why this does not work for pass-through.
> > > > > It does not work for following reasons.
> > > > > 1. Because all the fields that put on the member device are not in direct
> > > > control of the hypervisor.
> > > > > The device is directly controlled by the guest including the device status and
> > > > when it resets the device all the things stored in the device are lost.
> > > > 
> > > > I think the idea is that when this gateway is in the device then device reset has
> > > > to trap. At a high level, ok. But then what?
> > > > Is a full scan of all memory required until device reset is complete?
> > > > Drivers currently tend to busy poll the reset register, if this takes very long we
> > > > might start seeing soft lockup messages. What is the idea then? Maybe for this
> > > > we need a separate weaker reset that does not touch this capability?
> > > > 
> > > You meant the gateway is not in the device, right?
> > > 
> > > I likely didn't understand. I don't see a relation to timing.
> > > 
> > > When the device reset is not trapped by the hypervisor, most things does not work, it requires trapping other things to like cvq, device registers and more.
> > > It may be fine for those use case, but it does not fullfill the requirement of passthrough mode of hw.
> > I wish we'd just stop using the term, it just confuses everyone.
> > 
> > I feel the point worth making is that currently, all this job is done
> > by hypervisors. And they manage fine! vdpa really truly does not need
> > the SUSPEND bit because it knows about devices and it
> > can just use whatever it wants in any vendor specific way it wants.
> So true, this is exact what Intel implements in some productions.
> > 
> > where all this migration work comes handy is if we say that
> > we want our device to all just do what the
> > spec says. No vendor specific tricks. And I find it exciting that
> > there are people who want to work on this instead of
> > each vendor wasting man hours on their own almost the same but
> > slightly different driver.
> I agree
> > 
> > I personally think this patch is not great for the trap use-case either.
> > Why? For example if device is somewhat slow then it will take it
> > hundreds of milliseconds to synchronize the whole guest memory, and
> > blocking reset means blocking e.g. guest boot.  I was wrong about soft
> > lockup btw - linux does msleep which I think means no soft lockups. But boot is
> > blocked and modules are not loaded.
> I am not sure SUSPEND can block RESET, I think reset can take immediate
> actions, because
> once reset, whether suspended does not matter.

No, because if you don't suspend device will keep changing memory.
You need to
1. suspend
2. get all dirty memory synced
3. reset


Reset earlier will corrupt guest memory.


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

