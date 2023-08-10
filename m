Return-Path: <virtio-comment-return-7067-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB6C0C04E69
	for <virtio-comment@archiver.kernel.org>; Thu, 10 Aug 2023 15:10:47 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 6B7CFC8C5A
	for <virtio-comment@archiver.kernel.org>; Thu, 10 Aug 2023 15:10:43 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C8DAB98690C
	for <virtio-comment@archiver.kernel.org>; Thu, 10 Aug 2023 15:10:42 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 57DAA986845; Thu, 10 Aug 2023 15:10:42 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 27FB3986677
	for <virtio-comment@lists.oasis-open.org>; Thu, 10 Aug 2023 15:10:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691680240; x=1692285040;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+fpr8pNQblhM2foyzcSS44XcvkZCtxl/gbiudYAKD88=;
        b=GEXzaGXQ4rZ90maZX/CY+80CFfw6SdsXwEWUpizSXVGyQZxtiy8YaRCbQMmZjYn0wN
         XC6AXkIGigT79X3N+IK/eOcnFg+PEAJsCSSbCTyvn2D4LPX70qt77yvu0OPg1dmtBhra
         7A4l1eyYk7/iBV2QvhADdV+1z/U24Zdg2JQ3BgHkXu1U6wfOEv+HZJzHoGkwMEZbAoqb
         8wPK809r4jLBIbjcpHERmN/awDDL1oUNPlMjpeOgZOju/9Ej4lAmz0UP/nJ07pqx7P1m
         4x9KjQ3MLJCrlOT3JlYKWbjccHqK0NCGVE40hmsD6sJ81kFLygS3LQW/F7w/Ivker3st
         6obg==
X-Gm-Message-State: AOJu0YzJQ95GG2JjJGP3k59aFButzY2xfJSq8N8/JrENOoAVzfo7oFkR
	Ao44aGlwp0v7OeeB+w+3VVdA8A==
X-Google-Smtp-Source: AGHT+IH0ib+milz5Zc/MiEv3kVqNilXoqJK9dzmg0f8t2xaGhIDB5AP+6GPu8z36bZfIV8bxs/bOGQ==
X-Received: by 2002:adf:e850:0:b0:313:f68c:cfe9 with SMTP id d16-20020adfe850000000b00313f68ccfe9mr2276058wrn.35.1691680239913;
        Thu, 10 Aug 2023 08:10:39 -0700 (PDT)
Date: Thu, 10 Aug 2023 16:10:36 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: virtio-comment@lists.oasis-open.org, eric.auger@redhat.com,
	virtio-dev@lists.oasis-open.org
Message-ID: <20230810151036.GA1901900@myrica>
References: <20230803153238.541803-1-jean-philippe@linaro.org>
 <20230803153238.541803-5-jean-philippe@linaro.org>
 <ca33f633-26ea-b254-a75d-3bbf86d15d24@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ca33f633-26ea-b254-a75d-3bbf86d15d24@daynix.com>
Subject: [virtio-comment] Re: [PATCH 4/4] virtio-iommu: Clarify hot-unplug behavior

On Fri, Aug 04, 2023 at 03:19:27PM +0900, Akihiko Odaki wrote:
> On 2023/08/04 0:32, Jean-Philippe Brucker wrote:
> > Since it is not obvious what the virtio-iommu device or driver should do
> > when an endpoint is removed [1], add some guidance in the specification.
> > Follow the same principle as other (hardware) IOMMU devices: clearing
> > endpoint ID state on endpoint removal is the responsibility of the
> > driver, not the IOMMU device.
> > 
> > On most hardware IOMMU devices, the endpoint ID state is kept in tables
> > managed by the driver, so intuitively the driver should be updating the
> > tables on hot-unplug, so that a new endpoint plugged later with the same
> > ID does not inherit stale translations. Besides, hardware IOMMUs have no
> > knowledge of endpoint removal. It is less obvious for virtio-iommu
> > because endpoint states are managed with ATTACH/DETACH requests, and a
> > virtual platform could in theory update the endpoint state when it is
> > removed. Existing VMMs like QEMU don't do it, and rightly expect the
> > driver to manage endpoint ID state like with other IOMMUs. It is not
> > invalid for a VMM to clean up state on endpoint removal, but a driver
> > shouldn't count on it.
> 
> I think it's better to say it's invalid to detach on endpoint removal.

It's certainly not a clear cut choice and I'm still hesitating whether we
should allow, deny or let the VMM choose what to do.

However, it looks like crosvm already detaches the domain when an endpoint
is unplugged:

https://github.com/google/crosvm/blob/e8b2cd080e8174948563567d395c2a42416f2807/devices/src/virtio/iommu/sys/unix.rs#L68

If I understood correctly, this function is called on PCIe hot-unplug, and
endpoint_map represents the domain attached to an endpoint ID. So the
domain is detached on endpoint removal. If a DETACH request is sent
afterwards, it will still succeed (detach_endpoint() in
devices/src/virtio/iommu.rs returns detached=true, which causes DETACH to
succeed, even if the endpoint is not in endpoint_map). But I could be
wrong as I'm not familiar with crosvm or rust.

That does make the decision a little easier, because if we did
retroactively specify that detaching on removal is invalid, this code
would become a bug. But in my opinion crosvm isn't doing anything wrong
here. It feels valid and even good practice to clean up all state
associated to an endpoint when it is removed, to avoid leaks and stale
objects.

> Otherwise, the DETACH request made by the driver on endpoint removal will
> result in an error, which may make the driver emit an spurious warning. In
> fact, the Linux driver emits a warning if a DETACH request fails*
> 
> * https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/iommu/virtio-iommu.c?id=809d0810e3520da669d231303608cdf5fe5c1a70
> 

I agree that this WARN_ON is problematic, we may have to demote it to
dev_warn() or remove it entirely.

PCIe supports async removal, where a device is physically removed without
the user first pressing a button to notify the OS that the device is going
away. And I'm currently playing with a PCIe thunderbolt drive where I just
yank the device out like any USB device, without first warning the OS
(apart from unmounting partitions). If a VMM wanted to emulate that, I
guess it would remove the device, possibly detach its IOMMU domain, and
notify the OS afterwards. So the driver needs to accept a failed DETACH
request more quietly.

Thanks,
Jean

> > 
> > [1] https://lore.kernel.org/all/15bf1b00-3aa0-973a-3a86-3fa5c4d41d2c@daynix.com/
> > 
> > Reported-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> > Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > ---
> >   device-types/iommu/description.tex | 5 +++++
> >   1 file changed, 5 insertions(+)
> > 
> > diff --git a/device-types/iommu/description.tex b/device-types/iommu/description.tex
> > index fb1b840..63ccd41 100644
> > --- a/device-types/iommu/description.tex
> > +++ b/device-types/iommu/description.tex
> > @@ -407,6 +407,11 @@ \subsubsection{DETACH request}
> >   After all endpoints have been successfully detached from a domain, it
> >   ceases to exist and its ID can be reused by the driver for another domain.
> > +When an endpoint is removed from the platform (for example
> > +unplugged, or disabled with PCIe SR-IOV), the device is not
> > +required to detach the endpoint ID from its domain. It is the
> > +driver's responsibility to detach the endpoint before removal.
> > +
> >   \drivernormative{\paragraph}{DETACH request}{Device Types / IOMMU Device / Device operations / DETACH request}
> >   The driver SHOULD set \field{reserved} to zero.

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

