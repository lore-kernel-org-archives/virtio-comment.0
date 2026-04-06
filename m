Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A59328B62
	for <virtio-comment@lists.linux.dev>; Mon,  6 Apr 2026 09:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775467542; cv=none; b=XZhj2SFlXhjK7r2C06ihdGl4vj8kB7KN7KaXtSw6SnsTw4kF1+PiJ/qvnxsMBr1XGuOPcsIl0BDzCW6pl2bSYPb08EpqlXuRbgJZEkDiT2WqtECSjN8im0VWI09y33aBGawAcCPNPgz+DtDAraueyUdRHCG3J9y3KZZ8IZURuJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775467542; c=relaxed/simple;
	bh=2wTDZV/yIKDwZeePsuH6MOLKsZSw0R+uKPWt9uWWheQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=snkb8t8uAdZz6txmrrOYukvtkFlFJEti3ahJrbWkaPwxTJVAWpvfmtwQHkOCu5zzmuc+LVPSQYAN4rLth0a/Tcq1jJ3j+aGF7v5FuyHQ413sj5lhKCrIYjZhSncwdqQFQznc36YwkbUyBAyl5b7CLIGURDlqTDWAZ967G2OxEzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CxIoXkZH; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CxIoXkZH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775467538;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kEf8/rXwd9bLzIdBH23N+Zg3sJXpZvdmuJjZrjadARs=;
	b=CxIoXkZHlHrzeJEoLb9pS8ZDP7WZRwXHB1R8jEz4ttbG4foUlgrll/P/Qh7aKsyh5UBkFh
	lqC2YKMR8i10uJThwXDNhwJWCZ2Yrv6WbI4a8kHuh+vCEuT/ui2xgPxWHfSGKeP+HC2O1x
	upfeOkG0r3mHJGpXdDf900YJL5Y3b+k=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-414-PpxDA5f0PEqUNStHeD3q-w-1; Mon, 06 Apr 2026 05:25:34 -0400
X-MC-Unique: PpxDA5f0PEqUNStHeD3q-w-1
X-Mimecast-MFC-AGG-ID: PpxDA5f0PEqUNStHeD3q-w_1775467533
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-43d03bad787so3828953f8f.1
        for <virtio-comment@lists.linux.dev>; Mon, 06 Apr 2026 02:25:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775467533; x=1776072333;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kEf8/rXwd9bLzIdBH23N+Zg3sJXpZvdmuJjZrjadARs=;
        b=l9GImUTuPeQwkjjKUmykRmvZf/LqxMBT/4FOWw4bdATTuo9qykEuQqX5/8QfKDlPZ4
         lprowLGBdwHLjuPG3BA2kikw03zsdnQFiu+16/jwevsK6a+IJnWxhKYumuTZCUgo0bQP
         xYYUzUoB7mVJmZ5q3Ko4zi5jGV5uOF4QQEnp3Icbp2dElAKXQZ52S+6d/UqGpJIm9dGd
         YTbPK0RefnULD3JJQKzT+lZnPXN3wqvplgo4UDNEQdbSjiHrMo20lsr5G1BqVAy7YXiv
         +uSZwqZDNLULQ/pDB05JS9B2HNy4q9SBI0WVWUI0S7DyaTPfbyQ3pklb0lVMzDBUKWa2
         hqpw==
X-Gm-Message-State: AOJu0YxMLmd5U+H2tIkFbZlSUZxNJREPs5bORmlM2EQeHr/pzRxHtwhn
	yxE2A0l4ehB1D/HFC4WUFEsGzy//lbwW7T2tMInPklN8/w+No+hKxiTZPhOiPh0PsDQG68mDfx8
	ZYlhYw3cjytTmFVIldd7E+0JrxLhYsptS6omqLxlfAtcTBvkvc767ODywZXX1BOg22g0Q
X-Gm-Gg: AeBDietOp+ZOlMg0/jXyRPPplHkiLA907wKooScwD/RxIIX9dsMz9RBYRyQE/IcsQff
	RV9XGVOHQDeHwlyLI1BYZf40lxQvpyxkuCsPmvQa/UHKW3o8xK/diKRRylStp2Gcae6K8sVdXCQ
	lz/Vwjj/6MrqY1CgVD7FbBO9OQXdPKt971t27dN98DZwY8sYVeDHo/xz00q398YMtnO8je2sIVW
	4vq5ArWkP6xCcbHExfnnFvZz33BYoRNqbO0JQtzw3cNOVFc6LyrHC0CZ5BiEbMepNreN9HhQTPz
	abgtAh0KJcsXzAWqL/E09k9AS1pVZub7CFsnODEe16QW9p3opbjXnyAXaPJRlocQykwabTLs8ua
	iOQNOpAaBTTXuLlbb
X-Received: by 2002:a05:6000:208a:b0:43d:dd:8cae with SMTP id ffacd0b85a97d-43d2928bc6amr18898736f8f.22.1775467532834;
        Mon, 06 Apr 2026 02:25:32 -0700 (PDT)
X-Received: by 2002:a05:6000:208a:b0:43d:dd:8cae with SMTP id ffacd0b85a97d-43d2928bc6amr18898705f8f.22.1775467532267;
        Mon, 06 Apr 2026 02:25:32 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1525:da00:3ac2:1a22:72ff:4256])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e1fe0b0sm39990408f8f.0.2026.04.06.02.25.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 02:25:31 -0700 (PDT)
Date: Mon, 6 Apr 2026 05:25:29 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Demi Marie Obenour <demiobenour@gmail.com>
Cc: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>
Subject: Re: Should there be a mode in which the virtqueue -> MSI mapping is
 fixed?
Message-ID: <20260406051136-mutt-send-email-mst@kernel.org>
References: <e8a35333-589a-4a00-8e1a-32d497171e56@gmail.com>
 <20260404205140-mutt-send-email-mst@kernel.org>
 <b01e0d9b-086b-4a60-8ada-1ec895d46139@gmail.com>
 <20260405155501-mutt-send-email-mst@kernel.org>
 <700f6f7c-53d6-4023-9a5f-1296eacfff37@gmail.com>
 <20260405170510-mutt-send-email-mst@kernel.org>
 <3947d888-47b2-4b6a-9f05-3be9c00061be@gmail.com>
 <20260405174833-mutt-send-email-mst@kernel.org>
 <005c6635-9861-48fd-a2f7-225a743f9f10@gmail.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <005c6635-9861-48fd-a2f7-225a743f9f10@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: n4jFqR3dUC3yzudxrAKgzGGn1RLScu1j1aHiGDAC1EM_1775467533
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Apr 05, 2026 at 06:28:56PM -0400, Demi Marie Obenour wrote:
> On 4/5/26 17:50, Michael S. Tsirkin wrote:
> > On Sun, Apr 05, 2026 at 05:47:19PM -0400, Demi Marie Obenour wrote:
> >> On 4/5/26 17:09, Michael S. Tsirkin wrote:
> >>> On Sun, Apr 05, 2026 at 04:58:39PM -0400, Demi Marie Obenour wrote:
> >>>> On 4/5/26 16:15, Michael S. Tsirkin wrote:
> >>>>> On Sun, Apr 05, 2026 at 01:50:25PM -0400, Demi Marie Obenour wrote:
> >>>>>> On 4/4/26 20:56, Michael S. Tsirkin wrote:
> >>>>>>> On Sat, Apr 04, 2026 at 05:19:41PM -0400, Demi Marie Obenour wrote:
> >>>>>>>> Cloud Hypervisor's vhost-user frontend does not implement MSI-X
> >>>>>>>> properly [1].  Specifically:
> >>>>>>>>
> >>>>>>>> 1. Reads from the Pending Bit Array (PBA) always return 0.
> >>>>>>>> 2. Changes to the MSI associated with a virtqueue after the device
> >>>>>>>>    is activated are ignored.
> >>>>>>>>    
> >>>>>>>> Amazingly, there have not been any reports of this causing breakage.
> >>>>>>>> I have a fix for the first [2], which actually decreases the amount
> >>>>>>>> of code.  However, the second is trickier and I'm tempted to not
> >>>>>>>> bother unless it causes real-world problems.
> >>>>>>>>
> >>>>>>>> Are there real-world drivers that will run into either of the above
> >>>>>>>> bugs?  Linux seems to only choose anything else as a fallback, which
> >>>>>>>> presumably is not triggered.
> >>>>>>>>
> >>>>>>>> [1]: https://github.com/cloud-hypervisor/cloud-hypervisor/issues/7813
> >>>>>>>> [2]: https://github.com/cloud-hypervisor/cloud-hypervisor/pull/7963
> >>>>>>>
> >>>>>>> It will sometimes trigger.
> >>>>>>
> >>>>>> Would it be possible to provide an example?  A reproducible test
> >>>>>> case would be ideal, but conditions under which this will trigger
> >>>>>> are also sufficient.
> >>>>>
> >>>>>
> >>>>> I am not sure what does "is activated" mean.
> >>>>> For example, on latest Linux:
> >>>>>
> >>>>>         vq = vp_find_one_vq_msix(vdev, avq->vq_index, vp_modern_avq_done,
> >>>>>                                  avq->name, false, true, &allocated_vectors,
> >>>>>                                  vector_policy, &vp_dev->admin_vq.info);
> >>>>>         if (IS_ERR(vq)) {
> >>>>>                 err = PTR_ERR(vq);
> >>>>>                 goto error_find;
> >>>>>         }
> >>>>>
> >>>>>         return 0;
> >>>>>
> >>>>> error_find:
> >>>>>         vp_del_vqs(vdev);
> >>>>>         return err;
> >>>>> }
> >>>>>
> >>>>>
> >>>>> And 
> >>>>>
> >>>>> static void del_vq(struct virtio_pci_vq_info *info)
> >>>>> {
> >>>>>         struct virtqueue *vq = info->vq;
> >>>>>         struct virtio_pci_device *vp_dev = to_vp_device(vq->vdev);
> >>>>>         struct virtio_pci_modern_device *mdev = &vp_dev->mdev;
> >>>>>
> >>>>>         if (vp_dev->msix_enabled)
> >>>>>                 vp_modern_queue_vector(mdev, vq->index,
> >>>>>                                        VIRTIO_MSI_NO_VECTOR);
> >>>>>
> >>>>>         if (!mdev->notify_base)
> >>>>>                 pci_iounmap(mdev->pci_dev, (void __force __iomem *)vq->priv);
> >>>>>
> >>>>>         vring_del_virtqueue(vq);
> >>>>> }
> >>>>>
> >>>>>
> >>>>> and this happens after feature negotiation.
> >>>>>
> >>>>> It's before device_ready, however.
> >>>>
> >>>> Are there drivers that will change virtqueue => MSI-X vector mappings
> >>>> after DRIVER_OK without an intervening reset?  Cloud Hypervisor
> >>>> supports this for devices it implements internally, but it ignores
> >>>> such changes for vhost-user devices.  Is this going to cause problems
> >>>> in practice?
> >>>
> >>>
> >>> Also yes.
> >>>
> >>> For example, dpdk uses this during cleanup to block interrupts:
> >>> drivers/net/virtio/virtio_ethdev.c
> >>>
> >>>
> >>> int
> >>> virtio_dev_close(struct rte_eth_dev *dev)
> >>> {       
> >>>         struct virtio_hw *hw = dev->data->dev_private;
> >>>         struct rte_eth_intr_conf *intr_conf = &dev->data->dev_conf.intr_conf;
> >>>                                              
> >>>         PMD_INIT_LOG(DEBUG, "virtio_dev_close");
> >>>         if (rte_eal_process_type() != RTE_PROC_PRIMARY)
> >>>                 return 0;
> >>>
> >>>         if (!hw->opened)
> >>>                 return 0;
> >>>         hw->opened = 0;
> >>>
> >>>         /* reset the NIC */
> >>>         if (dev->data->dev_flags & RTE_ETH_DEV_INTR_LSC)
> >>>                 VIRTIO_OPS(hw)->set_config_irq(hw, VIRTIO_MSI_NO_VECTOR);
> >>>         if (intr_conf->rxq)
> >>>                 virtio_queues_unbind_intr(dev);
> >>>
> >>>         if (intr_conf->lsc || intr_conf->rxq) {
> >>>                 virtio_intr_disable(dev);
> >>>                 rte_intr_efd_disable(dev->intr_handle);
> >>>                 rte_intr_vec_list_free(dev->intr_handle);
> >>>         }
> >>>
> >>>         virtio_reset(hw);
> >>>         virtio_dev_free_mbufs(dev);
> >>>         virtio_free_queues(hw);
> >>>         virtio_free_rss(hw);
> >>>
> >>>         return VIRTIO_OPS(hw)->dev_close(hw);
> >>> }
> >>
> >> What would happen if DPDK received a spurious MSI-X interrupt during
> >> this time?
> > 
> > Could be a UAF?
> 
> Indeed it could, provided that DPDK is actually able to get the interrupt.
> 
> >> I know that this is non-compliant with the virtio specification.
> >> However, a problem that will trigger in practice, or which can be
> >> used for an exploit, is far more severe (and thus far more important
> >> to fix) than one that does not have practical consequences.
> >> -- 
> >> Sincerely,
> >> Demi Marie Obenour (she/her/hers)
> > 
> > 
> > 
> > You will have to read the code, and lots of old versions of it, to
> > check.
> 
> Makes sense.
> 
> Right now, I'm working a spec for a new device (vhost-guest, formally
> virtio-vhost-user).  It's a vhost-user server, so it is a virtio
> device used by one guest VM (backend) to implement a virtio device
> for use by another guest VM (frontend).  Yes, it's confusing!
> 
> The spec I am using as a basis is
> <https://stefanha.github.io/virtio/vhost-user-slave.html>.  Both its
> terminology and the spec itself are outdated and I'm going to be
> heavily changing it before submission.  The current (unpublished)
> version states that a vhost-guest device has 4 virtqueues in two pairs.
> One pair is for requests from frontend to backend and responses
> from backend to frontend.  The other is for requests from backend
> to frontend and responses from frontend to backend.  However, the
> device that the driver is implementing *also* has its own virtqueues,
> and those need extra notifications.
> 
> The spec I am using as reference states that these notifications are
> treated similar to existing virtqueue notifications.  In particular,
> the MSI-X vector associated with them can be changed at will.
> How important is it to support this in the version of the spec
> I submit?  How important is it to allow the same MSI-X vector to be
> used for multiple notifications?
> -- 
> Sincerely,
> Demi Marie Obenour (she/her/hers)

We can have a modified pci transport that doesn't allow this - just
reserve another range of IDs for that. There are a couple of other
spec mistakes we can correct if we do this.


I think the more important issue is disabling interrupts through setting
vector to 0xffff. That does not have a direct equivalent in the pci
spec.



-- 
MST

