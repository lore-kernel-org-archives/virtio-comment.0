Return-Path: <virtio-comment-return-8100-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BF37C4332F
	for <virtio-comment@archiver.kernel.org>; Wed,  1 Nov 2023 15:47:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 6A4EC2ACB1
	for <virtio-comment@archiver.kernel.org>; Wed,  1 Nov 2023 15:47:35 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 48347986BD2
	for <virtio-comment@archiver.kernel.org>; Wed,  1 Nov 2023 15:47:35 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 2A89A986BC6; Wed,  1 Nov 2023 15:47:35 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 17C83986BC7
	for <virtio-comment@lists.oasis-open.org>; Wed,  1 Nov 2023 15:47:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698853653; x=1699458453;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mx56Vcu3NZEyCxpE5sHv5Uom6/mxWXTLKC0CeQaA9jg=;
        b=YzLJTlFZ/T6AL/lUrlyjRMEnxUL0J0/3vMNdPJEmMFrFXYflFSR7WsOmpf7AvoC+P1
         6LSilcrP+IZt73fZ1An94m+P+wHLZ+aMipKYejM2ml+CCdU/CAEfL6CmJzHqw/qR+HmL
         QCKbOdCWiJDqX30fJFB4tSKvHZiCVvBrxS4IYnLQFMtd8i+ZV40KTJWuW0weQyCKwdFr
         uzib9Ea0skMrsKnYNhJVYwb2xqIt+z0HIX10QCshisWAwkTQgo9/gpsTOcCwp5V+jQlC
         3que+1ZKEa0kZE915+os5s5jyqLJgufZt9FUqsvAy9AZcZxtcmRXu8Q+QpX5Pt7HBUp6
         jkTw==
X-Gm-Message-State: AOJu0YxVCCPNVZnzPWwTYvOyfHLdnUuQ/AEA0JYig+wq14jfNUDhb9uF
	HDsvtXTO4YWw4w+9lY/aGSIs8aY0eUrEFIBP29I=
X-Google-Smtp-Source: AGHT+IE6lap6dLUytrB//epEUz0tr2Tpt1A5GbO2573sfIcmJZiFcPxys/mMu5YSLB+g/S9oXiZYPw==
X-Received: by 2002:a5d:67c8:0:b0:32d:e478:9d7c with SMTP id n8-20020a5d67c8000000b0032de4789d7cmr12551409wrw.24.1698853653034;
        Wed, 01 Nov 2023 08:47:33 -0700 (PDT)
Date: Wed, 1 Nov 2023 15:47:40 +0000
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Tina Zhang <tina.zhang@intel.com>
Cc: virtio-comment@lists.oasis-open.org, vivek.gautam@arm.com,
	seb@rivosinc.com, sameo@rivosinc.com, eric.auger@redhat.com,
	kevin.tian@intel.com, "Kumar, Sanjay K" <sanjay.k.kumar@intel.com>
Message-ID: <20231101154740.GA318666@myrica>
References: <20231006160947.2227396-3-jean-philippe@linaro.org>
 <20231006160947.2227396-8-jean-philippe@linaro.org>
 <b905a036-199c-47b7-ab51-4c31f39193a1@intel.com>
 <20231018145501.GB1229555@myrica>
 <dc59408b-4900-47d5-ba15-8ccade7666b8@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dc59408b-4900-47d5-ba15-8ccade7666b8@intel.com>
Subject: [virtio-comment] Re: [PATCH v2 5/9] virtio-iommu: Add VT-d IO page table

On Fri, Oct 27, 2023 at 11:14:24AM +0800, Tina Zhang wrote:
> > > I think two more definitions are needed:
> > > #define VIRTIO_IOMMU_HW_INTEL_VTD_ECAP_NEST    (1 << 26)
> > > #define VIRTIO_IOMMU_HW_INTEL_VTD_ECAP_FSTS    (1 << 47)
> > > 
> > > The ECAP_NEST tells if VT-d hardware supports nested translations.
> > > The ECAP_FSTS tells if VT-d hardware supports PASID granular translation
> > > type of first-stage.
> > 
> > It doesn't hurt to add them. Would the guest behave differently if NEST or
> > FSTS is set or clear?  I didn't add them because I assumed NEST is a
> > prerequisite for supporting guest page tables, and it requires FSTS.
> Yes, they have some effects. According to VT-d driver and Spec, only NEST=1
> means nested translation is supported by the hardware, otherwise nested
> translation is not supported. But the NEST=1 doesn't automatically mean
> FSTS=1 which reports if the hardware supports PASID granular translation
> type of first-stage table.

I though NEST=1 implies FSTS=1 because of this in VT-d 4.1:

NEST	Hardware implementations reporting Scalable Mode Translation
	Support (SMTS) field as Clear or First-stage Translation Support
	(FSTS) field as Clear or Second-stage Translation Support (SSTS)
	field as Clear also report this field as Clear.

But it doesn't matter for this discussion, I'm just curious.

>
> So if FSTS=0 or NEST=0, guest VT-d driver/lib
> will refuse to allocate a VT-d IO page table for virtio-iommu.
> 
> If we want the virtio-iommu backend to check these bits before reporting the
> supported page-table fmt, then we don't need the virtio-iommu frontend to
> check them again. So, here are two questions:
> 
> 1) If we want the virtio-iommu backend to check vendor IOMMU specific
> capabilities, does it mean we need to add all those details defined by
> vendor Spec into virtio-iommu Spec (like what we did in this version)? Does
> it make sense to virtio-iommu. My understanding is virtio Spec may try to
> avoid vendor specific things and leave them to venders drivers/libs. (I saw
> your comments below. I just want to post my concern here).
> 
> 2) If the virtio-iommu backend just delivers vendor specific cap/ecap to
> virtio-iommu frontend and doesn't do any checking before exposing cap/ecap
> to guest, then virtio-iommu frontend can invoke some generic io-pgtable APIs
> (e.g., in Linux it's io_pgtable_init_fns.alloc()) to allocate a io_pgtable ,
> which operation invokes vendor's alloc() callback and vendor driver/lib can
> do the checking there. Return success if the cap/ecap makes sense to vendor
> IO page-table support and allocate a set of page tables, otherwise return
> unsuccess. If this is the direction, then we probably don't need to add
> IOMMU vendor's specific definitions into virtio-iommu spec. Right?

Yes, that makes sense, I'd like to avoid vendor details in the spec where
possible.

I was wondering whether the virtio-iommu device needs to sanitize hardware
registers for security (hide bits from ecap not relevant to the guest).
I don't think so: it should be impossible for the guest to use the
extraneous information in the cap registers for anything nefarious,
because that implies a vulnerability is always present, and masking
feature bits is not the correct protection against that.

It's still not completely obvious to me that presenting raw ecap registers
is safe, because it's made of more than just 1-bit features. For example I
see a 10-bit "IRO: IOTLB Register Offset" field in there, but I'm guessing
that it doesn't contain secrets, and an attacker couldn't do anything with
that information.

> > More generally there are several ways we could describe these registers in
> > the specification:
> > 
> > (1) Don't describe any fields.
> > (2) Describe only fields that directly influence the configuration of
> >      ATTACH_TABLE and INVALIDATE.
> > (3) Describe fields related in any way to page table support.
> > (4) Describe all fields.
> > 
> > (1) is the easiest from a spec point of view. I tried doing (2) to ease
> I like (1), too. But I don't object to other options, as long as it makes
> sense to virtio-iommu.

Ok, I'll probably go with (1) in next version

> > writing driver and device code, but without explaining in detail what the
> > fields mean because I think that's best left to the hardware
> Agree. We should leave details to vendors Spec.
> 
> > specification. (3) would include NEST, FSTS and possibly others. (4)
> > wouldn't really be useful, we may as well do (1).
> > 
> > Maybe (3) is better. This way the device can use this description to
> > sanitize the registers before passing them to the guest, and the values
> > read by the guest still make sense. Because if we only describe (2), and
> > then the device decides to only provide those bits and clear everything
> > else, then it may be confusing for the driver to find NEST and FSTS clear
> > in the cap registers. Should it then even attach tables?  Maybe in the
> > future there will be a use-case for presenting NEST and FSTS clear to the
> > guest.
> I assume that you are talking about virtio-iommu working with VT-d IO page
> table on platform that has no nested translation support or the nested
> translation support is disable. Right?

Yes, I was thinking of a virtio-iommu implementation that doesn't support
page tables but still wants to communicate some hardware IOMMU features to
the driver. I don't have an example for Intel, but for Arm we'll want to
communicate support for multiple page granules (4KB, 16KB, 64KB), even for
the map/unmap interface. At the moment we present a single granule to the
guest, which is fine on x86 where 4KB is the only granule, but it doesn't
work for Arm setups where the host uses a different granule than the
guest. We need a spec update to support this, and I'm still wondering if
we can reuse the probe property that this series introduces for Arm SMMU,
or if we should introduce separate ones.

Anyway, even if Intel never needs to reuse this probe property for
non-page-table support, it's probably best to have cap/ecap be as close to
their hardware values as possible. It keeps the virtio-iommu device
implementation simple and is easier to extend in the future.

> So, there are three usages:
> 1) On the platform having VT-d hardware nested translation support and the
> functionality is being used by a guest, guest VT-d driver/lib allows
> virtio-iommu frontend to allocate VT-d IO page tables.
> 
> 2) On the platform having no VT-d hardware nested translation support or
> having the support but not being used by a guest, guest VT-d driver/lib
> doesn't allow virtio-iommu frontend to allocate VT-d IO page tables. So
> virtio-iommu legacy map/unmap() is being used (no IO page tables in guest).
> 
> 3) On the platform having no VT-d hardware nested translation support or
> having the support but not being used by a guest, virtio-iommu front-end may
> want to use some virtual IO page table. My understanding is this virtual IO
> page table is generic to vendor IOMMUs. So it should work w/o any help of
> vendor IOMMU driver/lib. Is my understanding right?

That's my thinking as well, although virt page tables (3) isn't useful for
assigned HW devices. For those, either VT-d page tables when supported (1)
or map/unmap (2) can be used. They could also use special tables like
coIOMMU for pinning rather than mapping, which resembles (3). For virtual
devices (eg. virtio-net), page tables would provide better performance
than map/unmap (2), and in this case I think generic virt page tables (3)
is better suited than vendor tables.

Thanks,
Jean


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

