Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA802DC78C
	for <virtio-comment@lists.linux.dev>; Sun,  5 Apr 2026 21:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775425847; cv=none; b=vCV1CoAbg4tfGVs3QfaEK/QebNbHkB5eM6o1IRKcDzxxVZ2L8FBooxqjcs2cWfeEieJMVynWV5xQrlLYPYNuurmzbvCKbPJpODyQigIsUDVTq/4jt0JbP1NEM5xERZyoOkwurEiUf9eaVcpGkc+s0eT3L8odVSi+s/tMYWEGqbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775425847; c=relaxed/simple;
	bh=sehKOeYAA8bToW4TY5PHddISSDMqaNMHtvGS4+M/eoU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=K7wZTwGzMO83JDXLAK2yJo5RSjhDyDQGfV874MftCIQdauNAa1/cJiY7YxE1QIMXU+znzyAe+jkPlYSyd8T+mDxsFfq3jiIvhE8B6YPOW2QLYA1Dscaxr5mhpsGo8vmYjKPH97MfEz2ZuVq0+mJi5Ap5GScqhqcRLFxLWM/0oO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=C+dmBKTk; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="C+dmBKTk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775425844;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dhZx81W7GrxWFD8HumK7iACBridSdrA0pueSoTfcwcI=;
	b=C+dmBKTkdjVUa4diaFkpy9taVYF0AvZxdXe3XwZAkjA6Y07uItWxmEmBhaTt2BbF6U1POl
	ZZ5x0Rcwb53nM0SytDtvwIsqKSZAipNoqwo9oZoRfEjiGxtzsxcNO2ehepK4eGZ46LHr02
	xkA9Xo4posi2YaBrQ/9X5bQTMnpZO/w=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-587-qZLkrTQMMbedRI31WktEYA-1; Sun, 05 Apr 2026 17:50:43 -0400
X-MC-Unique: qZLkrTQMMbedRI31WktEYA-1
X-Mimecast-MFC-AGG-ID: qZLkrTQMMbedRI31WktEYA_1775425842
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-43b96365ea8so4439813f8f.2
        for <virtio-comment@lists.linux.dev>; Sun, 05 Apr 2026 14:50:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775425842; x=1776030642;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dhZx81W7GrxWFD8HumK7iACBridSdrA0pueSoTfcwcI=;
        b=AX6VpUY+kJi/q/uBl//Zc7UV/ppdUKwHloVavw4hacUU6j3dWCj+SgfO63WBABxUCd
         cIYtvnzGWZWRBr6LVEk1wYr3+gdLZiATdr0DE47xV1KPRHQyS0L6EygNR1b94PMcbUN4
         SGKNNo5z4V32JmMUTtd4Vk3vln8u35Dpg+/4gWt+YggSpKQ+vJrZrDnnGKuWrCk5BPnl
         vgjWNWXBxenlH7dIzpOk+1wKP97EWFdf3NbT1/68V9QyIWta1K5XHcvyRCQMyC/f+Qxs
         SOQ2HlqaZsuZGqCHFVvqqjYh+s7uRkMrwkxHBsfdQNQi7W6rf78RUvYjo+ro2/u4fvep
         +Caw==
X-Gm-Message-State: AOJu0YxkqSSPW4LJtrfTXBiHLx6o0qxQCz2j96EAp7DjGAnDWhzG96pA
	Ft2ojeJIGyIBvgflRE31BhWoQxulQFxexc0PWVV0hRs9KXpwwheifLUQP/F5XgmhGDBZUqBkZph
	9doBtw9+EmQttq28zf291+IXuiJIFIEGXKy79pvadM44Rz2ee2x6rSjP7mJuk9Fk1DyITtM9Uc3
	Kg
X-Gm-Gg: AeBDies8ZRhKw5LmZZ0IY789pZc1tKIsAmX3DppYvYg51DquV8174Pl0etunis8iByt
	5vHmDv59KO7o4uqzOn5Q5iWPeE0HavpHyge7+cubWoucqXw7ygl528wnap39c/8PuByki90vJwF
	rY94pMzKvDvFNorZIBNeeyS/sfb2ZTlhpJZmEL+BrUDT2x6VkSV4zKmwIrLb9lEXvSo1bxBTFST
	DCJgo0yfgNA8ylRdWYi+0d5KJEX5E7Gzlc9cPdT1uyuK3g2Im61EmhK3H/ANvyObRolnTVrbxLV
	Vws1oarlUP50Ch3UI/7KGOgtd0HZFnp+ayM9wOsQqSGaUuOT42ehb5dVUqRGPX1kdASieEVokv1
	2cYq+P6+zrLZ6NWSf
X-Received: by 2002:a5d:64e4:0:b0:439:fc2c:363e with SMTP id ffacd0b85a97d-43d2928b7b2mr15387789f8f.13.1775425841956;
        Sun, 05 Apr 2026 14:50:41 -0700 (PDT)
X-Received: by 2002:a5d:64e4:0:b0:439:fc2c:363e with SMTP id ffacd0b85a97d-43d2928b7b2mr15387771f8f.13.1775425841440;
        Sun, 05 Apr 2026 14:50:41 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1525:da00:3ac2:1a22:72ff:4256])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2c5468sm34962697f8f.13.2026.04.05.14.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 14:50:40 -0700 (PDT)
Date: Sun, 5 Apr 2026 17:50:38 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Demi Marie Obenour <demiobenour@gmail.com>
Cc: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>
Subject: Re: Should there be a mode in which the virtqueue -> MSI mapping is
 fixed?
Message-ID: <20260405174833-mutt-send-email-mst@kernel.org>
References: <e8a35333-589a-4a00-8e1a-32d497171e56@gmail.com>
 <20260404205140-mutt-send-email-mst@kernel.org>
 <b01e0d9b-086b-4a60-8ada-1ec895d46139@gmail.com>
 <20260405155501-mutt-send-email-mst@kernel.org>
 <700f6f7c-53d6-4023-9a5f-1296eacfff37@gmail.com>
 <20260405170510-mutt-send-email-mst@kernel.org>
 <3947d888-47b2-4b6a-9f05-3be9c00061be@gmail.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <3947d888-47b2-4b6a-9f05-3be9c00061be@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: tauXbtjSzB4ddea6-yaonnJcA5lED7GnoeYXxi-MCe0_1775425842
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Apr 05, 2026 at 05:47:19PM -0400, Demi Marie Obenour wrote:
> On 4/5/26 17:09, Michael S. Tsirkin wrote:
> > On Sun, Apr 05, 2026 at 04:58:39PM -0400, Demi Marie Obenour wrote:
> >> On 4/5/26 16:15, Michael S. Tsirkin wrote:
> >>> On Sun, Apr 05, 2026 at 01:50:25PM -0400, Demi Marie Obenour wrote:
> >>>> On 4/4/26 20:56, Michael S. Tsirkin wrote:
> >>>>> On Sat, Apr 04, 2026 at 05:19:41PM -0400, Demi Marie Obenour wrote:
> >>>>>> Cloud Hypervisor's vhost-user frontend does not implement MSI-X
> >>>>>> properly [1].  Specifically:
> >>>>>>
> >>>>>> 1. Reads from the Pending Bit Array (PBA) always return 0.
> >>>>>> 2. Changes to the MSI associated with a virtqueue after the device
> >>>>>>    is activated are ignored.
> >>>>>>    
> >>>>>> Amazingly, there have not been any reports of this causing breakage.
> >>>>>> I have a fix for the first [2], which actually decreases the amount
> >>>>>> of code.  However, the second is trickier and I'm tempted to not
> >>>>>> bother unless it causes real-world problems.
> >>>>>>
> >>>>>> Are there real-world drivers that will run into either of the above
> >>>>>> bugs?  Linux seems to only choose anything else as a fallback, which
> >>>>>> presumably is not triggered.
> >>>>>>
> >>>>>> [1]: https://github.com/cloud-hypervisor/cloud-hypervisor/issues/7813
> >>>>>> [2]: https://github.com/cloud-hypervisor/cloud-hypervisor/pull/7963
> >>>>>
> >>>>> It will sometimes trigger.
> >>>>
> >>>> Would it be possible to provide an example?  A reproducible test
> >>>> case would be ideal, but conditions under which this will trigger
> >>>> are also sufficient.
> >>>
> >>>
> >>> I am not sure what does "is activated" mean.
> >>> For example, on latest Linux:
> >>>
> >>>         vq = vp_find_one_vq_msix(vdev, avq->vq_index, vp_modern_avq_done,
> >>>                                  avq->name, false, true, &allocated_vectors,
> >>>                                  vector_policy, &vp_dev->admin_vq.info);
> >>>         if (IS_ERR(vq)) {
> >>>                 err = PTR_ERR(vq);
> >>>                 goto error_find;
> >>>         }
> >>>
> >>>         return 0;
> >>>
> >>> error_find:
> >>>         vp_del_vqs(vdev);
> >>>         return err;
> >>> }
> >>>
> >>>
> >>> And 
> >>>
> >>> static void del_vq(struct virtio_pci_vq_info *info)
> >>> {
> >>>         struct virtqueue *vq = info->vq;
> >>>         struct virtio_pci_device *vp_dev = to_vp_device(vq->vdev);
> >>>         struct virtio_pci_modern_device *mdev = &vp_dev->mdev;
> >>>
> >>>         if (vp_dev->msix_enabled)
> >>>                 vp_modern_queue_vector(mdev, vq->index,
> >>>                                        VIRTIO_MSI_NO_VECTOR);
> >>>
> >>>         if (!mdev->notify_base)
> >>>                 pci_iounmap(mdev->pci_dev, (void __force __iomem *)vq->priv);
> >>>
> >>>         vring_del_virtqueue(vq);
> >>> }
> >>>
> >>>
> >>> and this happens after feature negotiation.
> >>>
> >>> It's before device_ready, however.
> >>
> >> Are there drivers that will change virtqueue => MSI-X vector mappings
> >> after DRIVER_OK without an intervening reset?  Cloud Hypervisor
> >> supports this for devices it implements internally, but it ignores
> >> such changes for vhost-user devices.  Is this going to cause problems
> >> in practice?
> > 
> > 
> > Also yes.
> > 
> > For example, dpdk uses this during cleanup to block interrupts:
> > drivers/net/virtio/virtio_ethdev.c
> > 
> > 
> > int
> > virtio_dev_close(struct rte_eth_dev *dev)
> > {       
> >         struct virtio_hw *hw = dev->data->dev_private;
> >         struct rte_eth_intr_conf *intr_conf = &dev->data->dev_conf.intr_conf;
> >                                              
> >         PMD_INIT_LOG(DEBUG, "virtio_dev_close");
> >         if (rte_eal_process_type() != RTE_PROC_PRIMARY)
> >                 return 0;
> > 
> >         if (!hw->opened)
> >                 return 0;
> >         hw->opened = 0;
> > 
> >         /* reset the NIC */
> >         if (dev->data->dev_flags & RTE_ETH_DEV_INTR_LSC)
> >                 VIRTIO_OPS(hw)->set_config_irq(hw, VIRTIO_MSI_NO_VECTOR);
> >         if (intr_conf->rxq)
> >                 virtio_queues_unbind_intr(dev);
> > 
> >         if (intr_conf->lsc || intr_conf->rxq) {
> >                 virtio_intr_disable(dev);
> >                 rte_intr_efd_disable(dev->intr_handle);
> >                 rte_intr_vec_list_free(dev->intr_handle);
> >         }
> > 
> >         virtio_reset(hw);
> >         virtio_dev_free_mbufs(dev);
> >         virtio_free_queues(hw);
> >         virtio_free_rss(hw);
> > 
> >         return VIRTIO_OPS(hw)->dev_close(hw);
> > }
> 
> What would happen if DPDK received a spurious MSI-X interrupt during
> this time?

Could be a UAF?


> I know that this is non-compliant with the virtio specification.
> However, a problem that will trigger in practice, or which can be
> used for an exploit, is far more severe (and thus far more important
> to fix) than one that does not have practical consequences.
> -- 
> Sincerely,
> Demi Marie Obenour (she/her/hers)



You will have to read the code, and lots of old versions of it, to
check.



-- 
MST

