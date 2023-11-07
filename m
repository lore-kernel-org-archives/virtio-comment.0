Return-Path: <virtio-comment-return-8244-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1693C4332F
	for <virtio-comment@archiver.kernel.org>; Tue,  7 Nov 2023 11:13:59 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 48CF62B14C
	for <virtio-comment@archiver.kernel.org>; Tue,  7 Nov 2023 11:13:59 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 41C03986BE5
	for <virtio-comment@archiver.kernel.org>; Tue,  7 Nov 2023 11:13:59 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 385699867FB; Tue,  7 Nov 2023 11:13:59 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2B8929867FC
	for <virtio-comment@lists.oasis-open.org>; Tue,  7 Nov 2023 11:13:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: VZHNEa7NOFeo3F7GTB6-HQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699355636; x=1699960436;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NYiHw96E8rk18V1xtv6usIaCdAjVmMeqDPdJshzSMJ8=;
        b=dh9MDVc1M4e6KjIlvallx1QRPMjiEs9tk7WUfcp5WXUPl1X9APUO5cKcV5pEUtxGG6
         XBaogq6b3qtQfJq3l76dBt14n004w9RgG1BxW3EWFYQDmImZuxHSOUgNqEvwo2n3plde
         ccFUJAqOuDj3LwsEMd1prls2rQyjJZxNydHv/oirDRzx0jFe7MA+4RK3deueRj8ZBJf9
         aMUNZ/ZHbujb2xFLgKjRIZfu8L4vuUHuCJ7/bmXPWHI6pBKK6aDBMNsYVYx3DELW68YU
         CkOvQv1/no0RMUzoUjZwhMmd/Nrfk/3FrEkhBNlEcTaVPbRW9wXt156bcT7qIrKInYlL
         bu1A==
X-Gm-Message-State: AOJu0Yy7NtblqqEM1dm+Cd1ybHcLjbN+zey6TvCPe7YaqSpsy3i0AVWG
	fOByf1x0bD5soTKvM2XljzKxo0pML2qEuBv6S5s7jTGsVt10Gw2A9G/PgNJ9Zmk25PlujM51DtV
	952dZjHNcPvtpkjxsW+DEe2bEBGrvGWeQBg==
X-Received: by 2002:a17:907:2087:b0:9c4:b8c9:1bf2 with SMTP id pv7-20020a170907208700b009c4b8c91bf2mr12290804ejb.60.1699355635981;
        Tue, 07 Nov 2023 03:13:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHdTUJjiAuER1UfA4NtFke9lMuRS5HCxY8XcLe6gAsYKqe6qsE79gch5RjI9Oh3fD+xcjAxSg==
X-Received: by 2002:a17:907:2087:b0:9c4:b8c9:1bf2 with SMTP id pv7-20020a170907208700b009c4b8c91bf2mr12290793ejb.60.1699355635622;
        Tue, 07 Nov 2023 03:13:55 -0800 (PST)
Date: Tue, 7 Nov 2023 06:13:48 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "Zhu, Lingshan" <lingshan.zhu@intel.com>,
	"jasowang@redhat.com" <jasowang@redhat.com>,
	"eperezma@redhat.com" <eperezma@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"stefanha@redhat.com" <stefanha@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
Message-ID: <20231107054348-mutt-send-email-mst@kernel.org>
References: <20231103103437.72784-1-lingshan.zhu@intel.com>
 <20231103103437.72784-7-lingshan.zhu@intel.com>
 <20231103064730-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481D028E63E6CB0AA7F4149DCA5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <fdfda658-e89c-41f4-9f4c-77d5d9b1b642@intel.com>
 <PH0PR12MB54818179419B06412D7A9C84DCA5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231105075906-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54819604160CF0A2566AFB5DDCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB54819604160CF0A2566AFB5DDCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH V2 6/6] virtio-pci: implement dirty page tracking

On Mon, Nov 06, 2023 at 04:03:42AM +0000, Parav Pandit wrote:
> 
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Sunday, November 5, 2023 9:42 PM
> > 
> > On Fri, Nov 03, 2023 at 03:47:34PM +0000, Parav Pandit wrote:
> > > > > [1]
> > > > > https://lists.oasis-open.org/archives/virtio-comment/202310/msg004
> > > > > 75.h
> > > > > tml
> > > > you still need to explain why this does not work for pass-through.
> > > It does not work for following reasons.
> > > 1. Because all the fields that put on the member device are not in direct
> > control of the hypervisor.
> > > The device is directly controlled by the guest including the device status and
> > when it resets the device all the things stored in the device are lost.
> > 
> > I think the idea is that when this gateway is in the device then device reset has
> > to trap. At a high level, ok. But then what?
> > Is a full scan of all memory required until device reset is complete?
> > Drivers currently tend to busy poll the reset register, if this takes very long we
> > might start seeing soft lockup messages. What is the idea then? Maybe for this
> > we need a separate weaker reset that does not touch this capability?
> >
> You meant the gateway is not in the device, right?
> 
> I likely didn't understand. I don't see a relation to timing.
> 
> When the device reset is not trapped by the hypervisor, most things does not work, it requires trapping other things to like cvq, device registers and more.
> It may be fine for those use case, but it does not fullfill the requirement of passthrough mode of hw.

I wish we'd just stop using the term, it just confuses everyone.

I feel the point worth making is that currently, all this job is done
by hypervisors. And they manage fine! vdpa really truly does not need
the SUSPEND bit because it knows about devices and it
can just use whatever it wants in any vendor specific way it wants.

where all this migration work comes handy is if we say that
we want our device to all just do what the
spec says. No vendor specific tricks. And I find it exciting that
there are people who want to work on this instead of
each vendor wasting man hours on their own almost the same but
slightly different driver.

I personally think this patch is not great for the trap use-case either.
Why? For example if device is somewhat slow then it will take it
hundreds of milliseconds to synchronize the whole guest memory, and
blocking reset means blocking e.g. guest boot.  I was wrong about soft
lockup btw - linux does msleep which I think means no soft lockups. But boot is
blocked and modules are not loaded.

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

