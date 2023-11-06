Return-Path: <virtio-comment-return-8201-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28E48C4332F
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Nov 2023 10:22:54 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id EAA6560D3F
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Nov 2023 10:22:52 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id ADC6298671D
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Nov 2023 10:22:52 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 8D897986717; Mon,  6 Nov 2023 10:22:52 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7D432986718
	for <virtio-comment@lists.oasis-open.org>; Mon,  6 Nov 2023 10:22:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: YBi_PJ1TPVS8IzLhKQaA8w-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699266169; x=1699870969;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hpWxMtbJSv+jIBiWzwM3j5DM6Sa9AZpqZ4Q8aITaE64=;
        b=LRGRKqo0ZCj8zfTzXpb85gyHTHPuhAJDxx5eFLqSu2ME4gaoCvy3PDMUpvEmhojLeN
         RFYmygACgvPZjV+ZpTmNoNc8N5qxjOdiVWPYR8ySNPBX+7RZeE7dX+0wb7SzHNu3SmFP
         LuO3HwMynmBgcEnmHMC2yRgynkBjAcfG6PEjO2ulGfjYdMxOxbIAjqV3DmgiPBRAiEmn
         Ud0A8eIXKB/yY7XNlHlnLNlM6Ih7QDBKLWsXozNl0XKqLaPQVoWGlqcFzOTm/+N9py5w
         6cUNJCmwHFRG8+jaE2G3Cq3NJhnQOjauIR7aYq5ui7Igtmp3SRbUifRKt61Q9C5KTGDW
         wpwg==
X-Gm-Message-State: AOJu0YwWwMkFcZF1fWf+YPtFA7IhZ04DpDazJqHuf4YzE9A0fEHeMWbq
	+/QAdHq78KEp0fUFTfGUp+8tZPIfs0yVPNvqwfF+C1f/KebbY+1MY3EBIKfY8jeOLAz1yEryEPc
	nxNW+h0qVJHIgoR9n+NG5y7sHbnRbwAJMZg==
X-Received: by 2002:a2e:9116:0:b0:2c5:56b:cbd1 with SMTP id m22-20020a2e9116000000b002c5056bcbd1mr22898454ljg.10.1699266168864;
        Mon, 06 Nov 2023 02:22:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFbETBJ9QeZbuXFx5mnEafmouvBolYnE3JdN3RpXerfyeqFIzYbd5SdRonWuCBtu8XfBlebtg==
X-Received: by 2002:a2e:9116:0:b0:2c5:56b:cbd1 with SMTP id m22-20020a2e9116000000b002c5056bcbd1mr22898437ljg.10.1699266168549;
        Mon, 06 Nov 2023 02:22:48 -0800 (PST)
Date: Mon, 6 Nov 2023 05:22:44 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>
Cc: jasowang@redhat.com, eperezma@redhat.com, cohuck@redhat.com,
	stefanha@redhat.com, virtio-comment@lists.oasis-open.org,
	parav@nvidia.com
Message-ID: <20231106051550-mutt-send-email-mst@kernel.org>
References: <20231103103437.72784-1-lingshan.zhu@intel.com>
 <20231103103437.72784-7-lingshan.zhu@intel.com>
 <20231103064730-mutt-send-email-mst@kernel.org>
 <a9103f82-c95e-47a6-9284-667c1c991aba@intel.com>
 <20231105111232-mutt-send-email-mst@kernel.org>
 <e139335c-3d51-4f75-b686-34681120e4ff@intel.com>
MIME-Version: 1.0
In-Reply-To: <e139335c-3d51-4f75-b686-34681120e4ff@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] Re: [PATCH V2 6/6] virtio-pci: implement dirty
 page tracking

On Mon, Nov 06, 2023 at 12:06:39PM +0800, Zhu, Lingshan wrote:
> > > Intel production work with similar bitmap
> > > based dirty page tracking solution for years.
> > and then VMs became bigger and PML was introduced.
> So you agree we should track dirty pages through the platform facilities?
> I am glad to hear that!

I just said that I thought there's no PML in platform facilities and that
might be a problem. Am I wrong?

> > 
> > > Otherwise the device should report PFN which is not very practical.
> > Why not?
> Really? the device report PFN?
> What can happen if the device keep writing a small piece of memory???

then you just report the PFN once. Should work like PML really -
IOW devices maintains a bit per page internally and reports
PFN when bit is set.

> > 
> > >      And the resolution is apparently 8 pages? You have just multiplied
> > >      the migration bandwidth by a factor of 8.
> > > 
> > > No, as described in the comments, the tacking granularity is controlled by \
> > > field{gra_power}, one bit represents a page with page_size = 2^(12 +
> > > gra_power). This can also be used to reduce the size of the bitmap.
> > .. at the cost of increasing migration bandwidth.
> The device is very likely to write a neighbor page,

how likely? and e.g. with slab randomization too? please collect some
data and show it.

> and this happens
> everywhere for example CPU read 64 bytes aligned data.

CPUs don't need to send their cache across a bandwidth constrained
shared network.

> 
> This is a tradeoff

tradeoff between which two options?

> > 
> > > "To prevent a read-modify-write procedure, if a memory page is dirty,
> > > optionally the device is permitted to set the entire byte, which encompasses the relevant bit, to 1."
> > > 
> > > This is optional and DMA is very likely to write a neighbor page, and the device transmit a whole byte anyway
> > > when a bit is dirty.
> > > 
> > > How about we use platform dirty page tracking facility then implement this in virtio, as Jason suggested?
> > > 
> > Without something like PML it likely won't scale either.
> So that would be platform issue which we don't need to take care of?
> Intel VT-d can do this for sure.

Intel VT-d supports PML from the IOMMU? I didn't realize. Could you help
me find it in the doc please? Which hardware supports this in the field?
What about other vendors?

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

