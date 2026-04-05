Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E27BF2DCC13
	for <virtio-comment@lists.linux.dev>; Sun,  5 Apr 2026 20:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775420127; cv=none; b=vAciPmZK2kB+RFs4IHlnjD6fCQE6ghp/9jwHrKf5BZH6v+BSB/CSIKOpsRVtfnKBiGSt791wBgDxvd2eI7jmzrjNbtXphaLLYptNO3+Y+J5tAxyrbBuu02fm04rDl9g40RgJ41X9Hcr/2z/vHSkw6HN9Nn56bQn+4pqw9M1JTuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775420127; c=relaxed/simple;
	bh=KTJzIpdZa4nbskFMSgJF9b75M7Q4Xp+URe+XettEamw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=KmZJqOR2Cd4CIYPgbTuKpgoLGUIZGurAITtWaYc6SvCk56zdXVxkfRcYxKsqInbgbs0qm2voqqefsfh0ZW1aX0CNHhaNHKQ/WP6OHSmzwq2hodoTgEjJ4WubBHmruAqF+4azvoUARuonozWQG403AE96tFKAccajxMX/IfWpsqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hO36jB32; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hO36jB32"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775420125;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SoIjg4KrgSHs8UrgR4kvTKQWjjGMzBenAtRY3d+EoFs=;
	b=hO36jB32MS+bgTjjZj4q+Ov7H0UmRzeaXm1OJZ1U4Vnfd16fzN0trHmo74DG8cOL7P4MI0
	TOjiaa8Nk/eN0GOVfeFWrGK0Kw9XBJFxhFamzRLWnIVafcDbP6ZobmMDWjQ2HfOwj6oILy
	R3JPfw9mv6WO8qBa93b/XPxLoyHRK1E=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-550-tbX5197BNyul_5PmNCzcGg-1; Sun, 05 Apr 2026 16:15:23 -0400
X-MC-Unique: tbX5197BNyul_5PmNCzcGg-1
X-Mimecast-MFC-AGG-ID: tbX5197BNyul_5PmNCzcGg_1775420122
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-43d1ceb2ddfso2894977f8f.2
        for <virtio-comment@lists.linux.dev>; Sun, 05 Apr 2026 13:15:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775420122; x=1776024922;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SoIjg4KrgSHs8UrgR4kvTKQWjjGMzBenAtRY3d+EoFs=;
        b=FNIOiZugFbC6QIuiMSKXKgOZOQ4yG3UKzELAhQ6b0ZcsvS3shDlJXoqUHc9SX5bBlX
         il2kNM9Ut0C8cfrOr1rM+F8MqcHnGc890fzF3uWgkqlaiOERDxyNXis8XC2vGa7suoq0
         HsEjTnmGbxIEH0BWQ6Roiv9oR7/vjvtpt3Bx6V1WsLoNFTsU8Qx7mN+1t5iaOP1uQeb7
         +qE+nnkJ126im4oh3JMD2SYe20PQDHxP156HNIqQjzCOTUDggCOeZZ9BdipA/BVp8yNJ
         lbI08VPaAyf+0c67CN0pmkESWTLjSD4+ZVe5ud7RsCfN+3al9nd6bAxeEJJo9Rl94keX
         TyVw==
X-Gm-Message-State: AOJu0YzeKiGHdx0arrjBtxA+qi9SdQcTiN+rw6VvrSgnpZdR4v2dQw04
	wxYKV8xqClEQol96AYfSd5FW+7XgXhxjQvI16QUfuDAwPbeNEWYD/0+Q3T7H2pUzqfZd209Q80L
	ulSkWZTCgnHPcUJUEojBjwAsJ7lTcmHrzNWWGbeTn0s4H5gr9gvsqlPfaMy6pIlYQFzWDQO42Pu
	hD
X-Gm-Gg: AeBDievQwLr28b+ybjPLRwyniavsnR3bvSOz9moqR7msu3QZwO9/E7tvBciRevkGhGW
	/YvNKiY9HQTX+PMO6qCDlS+OwvN5N0zuUAuulEBNXB+PcgYpcQX64g2LCOGZ2VdUpY23OpqPFrl
	5dTOv1NXMvuSaUE/Z0YFgYrXk90OI0HU4RTX99YAgOhy/etJ9lZTXPaOHPoCSxLF0Nyc6L5lfQW
	NouGBywoAjdCIyhprQS/53FFYnbiSmL6TJfNdCXI4RygGSlyMtkRzcGkYO3sD23zHWKfUWpFuhC
	ZsTHSm1rE3SSKAasa1LHTa4R3iSvHemxUnAGoSgC/xxqbq5tAZZKzeMyY2o3eX4uOIdq/gt0ZVj
	RfiglLGyp1KDuJdTD
X-Received: by 2002:a05:600c:4e0b:b0:488:869c:eda6 with SMTP id 5b1f17b1804b1-488997d6b8dmr166653265e9.29.1775420120772;
        Sun, 05 Apr 2026 13:15:20 -0700 (PDT)
X-Received: by 2002:a05:600c:4e0b:b0:488:869c:eda6 with SMTP id 5b1f17b1804b1-488997d6b8dmr166653075e9.29.1775420120274;
        Sun, 05 Apr 2026 13:15:20 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1525:da00:3ac2:1a22:72ff:4256])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2a6f73sm37445055f8f.8.2026.04.05.13.15.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 13:15:19 -0700 (PDT)
Date: Sun, 5 Apr 2026 16:15:17 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Demi Marie Obenour <demiobenour@gmail.com>
Cc: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>
Subject: Re: Should there be a mode in which the virtqueue -> MSI mapping is
 fixed?
Message-ID: <20260405155501-mutt-send-email-mst@kernel.org>
References: <e8a35333-589a-4a00-8e1a-32d497171e56@gmail.com>
 <20260404205140-mutt-send-email-mst@kernel.org>
 <b01e0d9b-086b-4a60-8ada-1ec895d46139@gmail.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <b01e0d9b-086b-4a60-8ada-1ec895d46139@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: G5kdDJCI0-QI7xepDZLrn2gC-iPaf7yGxBX1wiMTycw_1775420122
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Apr 05, 2026 at 01:50:25PM -0400, Demi Marie Obenour wrote:
> On 4/4/26 20:56, Michael S. Tsirkin wrote:
> > On Sat, Apr 04, 2026 at 05:19:41PM -0400, Demi Marie Obenour wrote:
> >> Cloud Hypervisor's vhost-user frontend does not implement MSI-X
> >> properly [1].  Specifically:
> >>
> >> 1. Reads from the Pending Bit Array (PBA) always return 0.
> >> 2. Changes to the MSI associated with a virtqueue after the device
> >>    is activated are ignored.
> >>    
> >> Amazingly, there have not been any reports of this causing breakage.
> >> I have a fix for the first [2], which actually decreases the amount
> >> of code.  However, the second is trickier and I'm tempted to not
> >> bother unless it causes real-world problems.
> >>
> >> Are there real-world drivers that will run into either of the above
> >> bugs?  Linux seems to only choose anything else as a fallback, which
> >> presumably is not triggered.
> > 
> > It will sometimes trigger.
> 
> Would it be possible to provide an example?  A reproducible test
> case would be ideal, but conditions under which this will trigger
> are also sufficient.


I am not sure what does "is activated" mean.
For example, on latest Linux:

        vq = vp_find_one_vq_msix(vdev, avq->vq_index, vp_modern_avq_done,
                                 avq->name, false, true, &allocated_vectors,
                                 vector_policy, &vp_dev->admin_vq.info);
        if (IS_ERR(vq)) {
                err = PTR_ERR(vq);
                goto error_find;
        }

        return 0;

error_find:
        vp_del_vqs(vdev);
        return err;
}


And 

static void del_vq(struct virtio_pci_vq_info *info)
{
        struct virtqueue *vq = info->vq;
        struct virtio_pci_device *vp_dev = to_vp_device(vq->vdev);
        struct virtio_pci_modern_device *mdev = &vp_dev->mdev;

        if (vp_dev->msix_enabled)
                vp_modern_queue_vector(mdev, vq->index,
                                       VIRTIO_MSI_NO_VECTOR);

        if (!mdev->notify_base)
                pci_iounmap(mdev->pci_dev, (void __force __iomem *)vq->priv);

        vring_del_virtqueue(vq);
}


and this happens after feature negotiation.

It's before device_ready, however.







> >> One reason I am asking is that I am working on an updated
> >> virtio-vhost-user spec, which I've renamed vhost-guest.  A vhost-guest
> >> device implements a vhost-user server, and requires one MSI for each
> >> virtqueue of _the device being implemented_.  The existing spec
> >> allows the guest to select which MSIs are used, but that seems to
> >> be pointless additional complexity.  A simpler option would be to
> >> hard-code the MSI assignments:
> >>
> >> - 0: Configuration change interrupt.
> >>
> >> - 1..N (inclusive): Queue interrupts for the N virtqueues provided
> >>   by the vhost-guest device.
> >>
> >> - N+1..N+M (inclusive): Buffer availability interrupts for each of
> >>   the M virtqueues that the driver is implementing.
> > 
> > 
> > you can do this, and imply ask drivers to share msi vector values.
> 
> Are there drivers that cannot do this?  Is this the reason that the
> virtio spec allows using the same MSI for multiple virtqueues?
>

No, it's because of the devices:
1. it's easier for device to detect sharing when it's explicit,
   rather than matching msi vectors which can change at any time at all.
2. we thought it might be more portable to non pci transports.


> > but sharing has to work because # of vectors in the system is limited.
> 
> Sharing vectors will indeed work.  It's just sharing MSIs that won't.
> 
> >> I expect that all real-world drivers for vhost-guest will select
> >> MSIs in this manner.  Hard-coding it makes the device implementation
> >> (and specification!) simpler.  I'd also rather not ship the first
> >> implementation with a known bug!
> >>
> >> [1]: https://github.com/cloud-hypervisor/cloud-hypervisor/issues/7813
> >> [2]: https://github.com/cloud-hypervisor/cloud-hypervisor/pull/7963
> -- 
> Sincerely,
> Demi Marie Obenour (she/her/hers)





