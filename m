Return-Path: <virtio-comment-return-8227-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A5ABC4332F
	for <virtio-comment@archiver.kernel.org>; Tue,  7 Nov 2023 08:33:40 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 5AB992B146
	for <virtio-comment@archiver.kernel.org>; Tue,  7 Nov 2023 08:33:39 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2DCD1986B5D
	for <virtio-comment@archiver.kernel.org>; Tue,  7 Nov 2023 08:33:39 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 0A25D9867F0; Tue,  7 Nov 2023 08:33:39 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id EE3B69867F1
	for <virtio-comment@lists.oasis-open.org>; Tue,  7 Nov 2023 08:33:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: iBsiLsfjN8mowkkVIPzyJg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699346011; x=1699950811;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r2fb8GRF7wLNhCpE3e8qsDzfUt38whwzSY4uTXH9xkQ=;
        b=nTVjM2Je1pOeKRtBh6y6xCWQ15r91F26LRrG+7eP2tZ8UuA0nt1ALHX74JDwlXI352
         PXav3qvdDqRTPgW8xUHXF6r3Tzw2BkCeZKSFd6AID/qM0N8x1Qxwgcu6/J94ZiCCC37x
         7rmyPe0/rl3yUWpZ304tLdAmUtYYCIiCBRtG1IJjxX/rZyv2c5ocgWsBpslYA6VNKvH8
         QzvpyVCXgVfeJaXaLJ5dVxgjAGfZCxtZcTggUYEQzqdaBqQxWvuGVimr2EjGeNtHqtG7
         yaksPmeSJgZeHdTomGLpI1dsQWZk0D9119A58DhoxkXK33r6ql0hDSXH/ToNroPB9Vy3
         7/rg==
X-Gm-Message-State: AOJu0Yw4rudP4AxM6CmZgVqERYsMla5iPGs99MSr7OtrmQ5GL6DxOOOh
	yXELuchoPeezX1u8dlUMt9C//tr8FdXgArW6xeZpNlh+99adFEbOLuknB5nEZKfH0iuKzNadBeD
	ZToXIcWhscXeExcNKJnbK5WGmfTzSOJIDAQ==
X-Received: by 2002:a05:600c:4587:b0:3fe:1232:93fa with SMTP id r7-20020a05600c458700b003fe123293famr1603859wmo.22.1699346011263;
        Tue, 07 Nov 2023 00:33:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IENobNi8htCh1uGSfd/vObBFzAnM4xnuyu7zBDQ9C2JXYcfxPqZbAoiOKByymVjXqGd/px4gQ==
X-Received: by 2002:a05:600c:4587:b0:3fe:1232:93fa with SMTP id r7-20020a05600c458700b003fe123293famr1603846wmo.22.1699346010917;
        Tue, 07 Nov 2023 00:33:30 -0800 (PST)
Date: Tue, 7 Nov 2023 03:33:25 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>
Cc: Parav Pandit <parav@nvidia.com>,
	"jasowang@redhat.com" <jasowang@redhat.com>,
	"eperezma@redhat.com" <eperezma@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"stefanha@redhat.com" <stefanha@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
Message-ID: <20231107032314-mutt-send-email-mst@kernel.org>
References: <20231103103437.72784-1-lingshan.zhu@intel.com>
 <20231103103437.72784-3-lingshan.zhu@intel.com>
 <PH0PR12MB54814E8B9E7D16C9EF421C82DCA5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <78f206cd-1e07-4c20-a281-1ddf74cf4d84@intel.com>
 <PH0PR12MB5481F05E5A952E9A43B96F73DCA5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <8eb1a4c5-eb7d-4f8d-8afd-4aab5559a8d6@intel.com>
 <PH0PR12MB5481CD22F4AFF3DFA7F53B91DCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <850caea9-f7dc-4dee-ae00-936766287ba3@intel.com>
 <PH0PR12MB54810A60FD26411387DBC7D9DCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <5c659db2-9263-4f9c-b1ac-073de5c01446@intel.com>
MIME-Version: 1.0
In-Reply-To: <5c659db2-9263-4f9c-b1ac-073de5c01446@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] RE: [PATCH V2 2/6] virtio: introduce SUSPEND
 bit in device status

On Tue, Nov 07, 2023 at 04:21:13PM +0800, Zhu, Lingshan wrote:
> > > This can work, right?
> > Unfortunately no, as non atomic bitmap cannot reside in the host memory,
> as explained before, PCI and CPU supports atomic read/write. Please refer to
> PCI spec and CPU ISA.

I don't see how atomic read or write does anything useful here but maybe.
You need to explain how you are using atomics in your proposal then.


> > And whatever is in the device gets reset on device reset and/or FLR. So the dirty map detail is lost.
> > Similarly the device context is also lost on these two events triggered by guest.
> we explained before, when reset, the device should clear everything.

then migration will corrupt memory. Not great.



> > 
> > > > > As you can see, the dirty page tracking facility has a PASID for
> > > > > isolation. But still, the question is, we should better use platform
> > > > > dirty page tracking
> > > > > 
> > > > Nothing to do with PASID, as PASID is owned by the guest.
> > > It looks you don't know how PASID work.
> > > Host can setup PASID to isolate some facilities, right?
> > There are few limitations with PASID.
> > a. All platforms do not have PASID and
> As we have explained for many times, this is a basic facility,
> and the implementation is transport-specific.
> 
> We given an example of PCI implementation, and PCI support PASID, right?

Yes it's a limitation but maybe one we can live with
for this feature.  It does mean that we might need solutions
for systems without this support. virtio use is not limited
to servers or high end systems.


> > b. I explained above PASID do not work always as PASID only bifurcates DMA not the device _functionality_.
> With a PASID, a cap can be considered to be placed in another logical
> address space, which is not accessible to the guest.
> > c. PASID to be available to guest as_is what is present on the device
> host hypervisor sets the PASID, transparent to the guest.

Lingshan whenever people ask you a ton of questions in response to
your spec proposal then respose should not be to simply
answer on the mailing list and then repost without a lot of changes
since spec readers will likely have questions exactly like these
and we can not make them go and read this flame war.
And frankly, most of this TC stopped following this thread a while ago,
it seems to be going nowhere.
The response should be to add the explanation in the spec.
Look at Parav's live migration proposals with "theory of operation" chapters
for an example of how this can be done.

> > 
> > > > > Then suspend the device after guest freeze, to stabilize the device
> > > > > status, then read the status.
> > > > > 
> > > > > How can you say this does not work???
> > > > I explained above.
> > > see above


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

