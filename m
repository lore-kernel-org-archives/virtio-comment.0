Return-Path: <virtio-comment-return-7817-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58BCCCDB47E
	for <virtio-comment@archiver.kernel.org>; Wed, 18 Oct 2023 14:41:06 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id AB92C74106
	for <virtio-comment@archiver.kernel.org>; Wed, 18 Oct 2023 14:41:05 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9B0BF9868AF
	for <virtio-comment@archiver.kernel.org>; Wed, 18 Oct 2023 14:41:05 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 856CE9868A7; Wed, 18 Oct 2023 14:41:05 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 756929868A8
	for <virtio-comment@lists.oasis-open.org>; Wed, 18 Oct 2023 14:41:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697640063; x=1698244863;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rt/ss29CJe/9frHUxa5b1wD1OSXPxRIJavasTojsBsk=;
        b=ew8L7qN8Cwk1s/juqH7ss76gkyym3BUO0m8G6pSJ2x7/u36c0dz37nPOBfZ1OT6aYB
         2zvAozW0wWKB/DomCL0jkMVr8fZX7E1hfjbARHZbmTgJmggFccLULxdipiVYA4tnzvWU
         2CZAgTvr1KbeU3QTGVULEMBooQR+kxFv0W1wlNT+tfuD6tEoxwqoBMJeOdKCf3rzqzuY
         WRt2WlGsKr1NUa5hssyqY/zeE6knR1gxjWK9aBZjKix4oLJi+Zzefz6B/RhcCwafk1Fi
         TqMX1A6GMyLTROumYxjbI9qhJeGZLgYU1Ty2goTxR70hP9Dkanho//3m4ibuklXCs+3n
         P+7w==
X-Gm-Message-State: AOJu0YzYYs5QkLrm+mIU71BiFFk9EmfjBeSAzUO94YiJYuQpguJ6xaao
	szYiuG1Dm1ANzxGZ5Z5bd2LnCg==
X-Google-Smtp-Source: AGHT+IHPa925AjAqXBkqkdxNLaqlRN2gl8/u14DJPHr6oBEcsrpqsJdjaFxT+JE2n5RjDqRYM3i+fw==
X-Received: by 2002:a7b:c44c:0:b0:405:95c3:e79d with SMTP id l12-20020a7bc44c000000b0040595c3e79dmr4268715wmi.40.1697640063297;
        Wed, 18 Oct 2023 07:41:03 -0700 (PDT)
Date: Wed, 18 Oct 2023 15:41:08 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Tina Zhang <tina.zhang@intel.com>
Cc: virtio-comment@lists.oasis-open.org, vivek.gautam@arm.com,
	seb@rivosinc.com, sameo@rivosinc.com, eric.auger@redhat.com,
	kevin.tian@intel.com, "Kumar, Sanjay K" <sanjay.k.kumar@intel.com>
Message-ID: <20231018144108.GA1229555@myrica>
References: <20231006160947.2227396-3-jean-philippe@linaro.org>
 <20231006160947.2227396-4-jean-philippe@linaro.org>
 <b8d6172e-88c5-4f4d-8738-6ec6c90fdab4@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b8d6172e-88c5-4f4d-8738-6ec6c90fdab4@intel.com>
Subject: [virtio-comment] Re: [PATCH v2 1/9] virtio-iommu: Add ATTACH_TABLE request

Hi Tina,

On Wed, Oct 11, 2023 at 07:39:02PM +0800, Tina Zhang wrote:
> > +For some formats, the PASID table is managed by the device rather
> > +than driver. The ATTACH_TABLE request contains a \field{pasid}
> This is what VT-d hardware expects when working with viommu (no matter it's
> virtual VT-d iommu or virtual-iommu) with VT-d IO page table support. If a
> device is directly assigned to a guest, the guest viommu driver fully
> manages the PASIDs of that device. If a device is providing I/O device
> sharing service for multiple guests, the PASIDs value are assigned by host.
> But, in either case, the PASID table is filled by host VT-d driver, not
> guest viommu driver. So, from viommu front-end's point of view, the PASID
> table of that device is managed by viommu device (i.e., viommu back-end).

Ok, so there are two cases of device assignment:

* whole devices (eg PCIe VF) assigned to one guest. In that case,
  PASIDs used by the guest (vPASID) could be identical to PASIDs assigned
  by the host (hPASID)

* device is shared between multiple guests, sub-devices are assigned to
  guests. In that case vPASID is different from hPASID.

> > +field and a page directory. Similarly to when the driver manages
> > +the PASID table, \field{domain} corresponds to one PASID table.
> > +The driver uses the same \field{domain} for each ATTACH_TABLE
> > +request with PASID. Issuing a DETACH request without PASID
> >
> Here are some thoughts about domain id interception with VT-d IO page
> format:
> 
> Virtual VT-d driver uses the same domain id for first-stage translation is
> because it's required by the VT-d specification, though guest domain id
> never gets to hardware (i.e., host doesn't populate PASID table with guest
> domain id value).

(To make things clearer I'll use "DID" for the HW VT-d identifier and
"domain" for the virtio-iommu one)

Do you know if the host is more likely to assign a unique DID for each VM,
for each virtual device, or some other scheme?  There was a discussion
recently about the Linux host, but I don't know where it landed. I'm
trying to understand what hosts and guests could implement, so that
virtio-iommu can be supported without too much modification to host and
guest.

We should design virtio-iommu such that it's possible to share an address
space between multiple devices. For example the guest could use a single
PASID space, assign a unique PASID to each process address space, and if
the host assigns the same DID to devices in a VM, then DMA from devices
bound to the same guest address space will share TLB entries.

TLB entries are tagged with DID+PASID. So in theory, in order to share TLB
entries between multiple virtual devices, a guest that uses virtual VT-d
would write the same vDID into each virtual device's virtual PASID table,
into entries indexed by the same vPASID. That would allow the host to
understand that they are the same address space, and assign the same hDID
to entries in the HW PASID table indexed by the same hPASID, and they
would share TLB entries.

         Dev1 PASID table                     vDev1 PASID table
            +-----------+                     +-----------+
            :           :                     :           :
 hPASID=12->+-----------+                     +-----------+<-vPASID=1
            |   hDID=24 |-+-> First stage <-+-|    vDID=8 |
            +-----------+ |   page table    | +-----------+
            :           : |                 | :           :
                          |                 |
                          |                 |
         Dev2 PASID table |                 | vDev2 PASID table
            +-----------+ |                 | +-----------+
            :           : |                 | :           :
 hPASID=12->+-----------+ |                 | +-----------+<-vPASID=1
            |   hDID=24 |-+                 +-|    vDID=8 |
            +-----------+                     +-----------+
            :           :                     :           :

Conversely, a guest can use different vPASIDs to isolate address spaces,
but it could also rely on using different vDIDs, right?  It could program
the virtual VT-d PASID tables for two devices with overlapping vPASID
spaces, and different vDIDs for isolation. Which implies that the host
can't assign a unique DID for each VM, it needs to be able to use a unique
DID for each virtual devices.

That's also needed for requests-without-PASID: the guest most likely wants
to isolate no-PASID address spaces of different devices, which requires
separate DIDs.

> According to VT-d specification (section 6.2.3.1):
> "Scalable-mode PASID table entries programmed for first-
> stage translation or pass-through (PGTT equal to 001b or 100b) must be
> programmed with a DID value that is different from those used in any PASID
> table entries that are programmed for second-stage or nested translation
> (PGTT equal to 010b or 011b). This is required since hardware
> implementations tag various caches with domain-id as described in Section
> 6.2.1. Scalable-mode PASID-table entries with PGTT value of 001b or 100b are
> recommended to use the same domain-id value for best hardware efficiency."
> 
> When VT-d IO page table comes to virtual-iommu, the definition of domain id
> doesn't need to be exactly the same with the one defined in VT-d
> specification as the viommu providing the service is virtual-iommu, not
> virtual VT-d and only VT-d IO page table is being used (domain id is defined
> in PASID table which isn't being used).

Yes, even if they have the same name they don't have to mean the same
thing, we can pick for virtio-iommu the usage that's most convenient.

However, hosts have to support IOMMU emulations such as virtual VT-d as
well, so in order to reuse those host interfaces for virtio-iommu, the
safest is to specify it close to the hardware design.

Staying close to the hardware also allows supporting hardware acceleration
later, like AMD's invalidation and fault queues that can be assigned
directly to a guest. 

> So, it seems more reasonable to define the domain id as an identifier for an
> unique domain for each address space for virtual-iommu back-end
> interception. Any ideas?

Do you mean that domain would represent an address space uniquely within a
guest?

One concern I have is about reducing the number of address spaces.
DID+PASID allows for 2^36 unique address spaces, but domain alone only
allows for 2^32. Both are more than enough for current use-cases, but it
would be better not to impose such limitations.

To be compatible with DID+PASID support of hosts, maybe we should use
domain+PASID to identify an address space?  domain wouldn't represent a
PASID table as in this current draft, but it would be an arbitrary ID like
DID, that the guest can use as it wants. That would keep the design close
to virtual VT-d, which would be good for compatibility. If the host
expects a (vDID, vPASID) pair in attach and invalidate calls, then
supporting virtio-iommu would be easier with a similar interface.

If domain uniquely represents a guest address space, then the INVALIDATE
request wouldn't take a PASID field. For a host that is implemented to
support vDID+vPASID, it would then be difficult to translate
virtio-iommu's domain into hDID+hPASID in order to invalidate TLBs.

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

