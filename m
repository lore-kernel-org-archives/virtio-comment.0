Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD2BF2848A7
	for <virtio-comment@lists.linux.dev>; Sun,  5 Apr 2026 21:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775423402; cv=none; b=EINYlIPLrJOoGriKE3/YkvPioLm/UEt2HHZdaNfL+I3uCtTJvQh3V83Sp92nZgZp8LPzLKG7JsKK/XvcFssZYVdaWTFyvC2HsW836G+8DsN9m0GaayNSaB2RmlxgsqIRpbq2FOGCtZ/nsS0ihW1gfa0ce+bSnSoNHKPpM3Eot1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775423402; c=relaxed/simple;
	bh=hsfXtsxUK8th4yGLKIF1JFt5l1jsQpJ7CNccqnBxMus=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=qvtA945EBQzvilu/oUb9XsE335t7iD69cMgjEtTt0DlDmsj5aPvmTRk4uEGPpC0QgZB63vdIAWYrUtMy/fPSZT9ie9q6OuNc7C/0mctT0g/S/9LsZ+nGb6oaujkXXBxiV1anRE8t8X5hkwA4pbDsUkmPsih1t5vCCXPx7+8YNJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cwcH5JHw; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cwcH5JHw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775423399;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GRqMvumYNyNXPQNSyAZe9TFOePH9wicDkiXx7ILn+uA=;
	b=cwcH5JHwU7yTuNScpg5SAFhxUJ9COxNzCc54fvXcfO8EhWJnmXd4O7eTtSgVvoYzid0fje
	UorbO1nvs1TrZpbdlRJyU9kqOZwTijqsC/0/Wo4+fA8Q1ichulW2v6ySNOOV6N1LEWNGJg
	B/e3ItQWLlsugU5ULNkuYRcgGXMAvOw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-547-CoAemUIsO-qrzUxHpAywqg-1; Sun, 05 Apr 2026 17:09:58 -0400
X-MC-Unique: CoAemUIsO-qrzUxHpAywqg-1
X-Mimecast-MFC-AGG-ID: CoAemUIsO-qrzUxHpAywqg_1775423397
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-43d03bad787so3467272f8f.1
        for <virtio-comment@lists.linux.dev>; Sun, 05 Apr 2026 14:09:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775423397; x=1776028197;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GRqMvumYNyNXPQNSyAZe9TFOePH9wicDkiXx7ILn+uA=;
        b=SwHa1cxaCNdE/sEtxAgYgiCvvqP5A5usb6jpFv8hvNZ67Bm/yICW5KfkTxzyVNRwlN
         +o75iU8KdWlczEWX4LJds/MXtTGnWIfbFI7UY4l6qYXIwg/FSc9W4/v0jtXCOceZgE5f
         o8N+mhjw9g9aVl1jImJsAJPLPooHMuw7pzG0qw3FkJ/lfk5M/cyOnYy+N5/w+PmlS9ub
         nXELmEazuPh+RpiZcmLovYnKE8q1PmQD/5+meYo6nUN7yev0VHRKbfinAbrn5k4Py2/k
         QGMqnp71gkKk6w5re2K1QbjuEYzZNf+p/Bwv0qGZpdtu3Twpz4Nzv4OPe1Fe828HSYjo
         1OpA==
X-Gm-Message-State: AOJu0YzU9G7+ni1WO/jfe0Y45T1iHExUpFTBxlwUJ34FqWgotCRsqttS
	4DUyPpjK6k0lhH6YOAl8KE2J8iayFjEb3r6xW9f44StMHvaZNtWZyeF/NpB62WdS4H9Qe8UFcqs
	M/9TYxLPWxXTJB07xEQzhfYX+dI1wpSXlKFE0vqaMwWnb5YF+mElDywne1JOj11VWh6an
X-Gm-Gg: AeBDievb0PLgLksc52YBzHx6U/oJP+dSyypq7QbNSD93Ewe1qGwyIHulUx3tCoc/Kh6
	7Tvw01yZ/tK0ug3kQLcnosFVrOHX3vgnTPoCwtjK8vVRZSuWi1fbQhopIOq7WF6MbA9IIRdG2Lk
	K9oI/bpMMhnpt0AofylNLlaJfdloBpivcQw2KswuPDfAYKBw01VGT85jybkle2T0JsdSJxbWhPO
	SYjn6eUIET/1xvShems9oIij9vWjubM+aw17Bt598Pv1JOdTB3QNCqDptfiv+wRQOntafGZMNH6
	N3ytybS3pr1LRKH0ePbX8WwxmtOpqzvn8xwtc9tzuK+VlDKUd890bGxQDWiCoteHtuaxcfoal8/
	H30AtITTkXlDi4+Ft
X-Received: by 2002:a05:6000:26c3:b0:43c:cf25:f29a with SMTP id ffacd0b85a97d-43d29267fa5mr15754734f8f.8.1775423396930;
        Sun, 05 Apr 2026 14:09:56 -0700 (PDT)
X-Received: by 2002:a05:6000:26c3:b0:43c:cf25:f29a with SMTP id ffacd0b85a97d-43d29267fa5mr15754720f8f.8.1775423396426;
        Sun, 05 Apr 2026 14:09:56 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1525:da00:3ac2:1a22:72ff:4256])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4e6224sm35767039f8f.25.2026.04.05.14.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 14:09:55 -0700 (PDT)
Date: Sun, 5 Apr 2026 17:09:53 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Demi Marie Obenour <demiobenour@gmail.com>
Cc: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>
Subject: Re: Should there be a mode in which the virtqueue -> MSI mapping is
 fixed?
Message-ID: <20260405170510-mutt-send-email-mst@kernel.org>
References: <e8a35333-589a-4a00-8e1a-32d497171e56@gmail.com>
 <20260404205140-mutt-send-email-mst@kernel.org>
 <b01e0d9b-086b-4a60-8ada-1ec895d46139@gmail.com>
 <20260405155501-mutt-send-email-mst@kernel.org>
 <700f6f7c-53d6-4023-9a5f-1296eacfff37@gmail.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <700f6f7c-53d6-4023-9a5f-1296eacfff37@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5T5WuOBaS8vFVygGANelCjElzH7ST8UL9YmndaIyjkk_1775423397
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Apr 05, 2026 at 04:58:39PM -0400, Demi Marie Obenour wrote:
> On 4/5/26 16:15, Michael S. Tsirkin wrote:
> > On Sun, Apr 05, 2026 at 01:50:25PM -0400, Demi Marie Obenour wrote:
> >> On 4/4/26 20:56, Michael S. Tsirkin wrote:
> >>> On Sat, Apr 04, 2026 at 05:19:41PM -0400, Demi Marie Obenour wrote:
> >>>> Cloud Hypervisor's vhost-user frontend does not implement MSI-X
> >>>> properly [1].  Specifically:
> >>>>
> >>>> 1. Reads from the Pending Bit Array (PBA) always return 0.
> >>>> 2. Changes to the MSI associated with a virtqueue after the device
> >>>>    is activated are ignored.
> >>>>    
> >>>> Amazingly, there have not been any reports of this causing breakage.
> >>>> I have a fix for the first [2], which actually decreases the amount
> >>>> of code.  However, the second is trickier and I'm tempted to not
> >>>> bother unless it causes real-world problems.
> >>>>
> >>>> Are there real-world drivers that will run into either of the above
> >>>> bugs?  Linux seems to only choose anything else as a fallback, which
> >>>> presumably is not triggered.
> >>>> 
> >>>> [1]: https://github.com/cloud-hypervisor/cloud-hypervisor/issues/7813
> >>>> [2]: https://github.com/cloud-hypervisor/cloud-hypervisor/pull/7963
> >>>
> >>> It will sometimes trigger.
> >>
> >> Would it be possible to provide an example?  A reproducible test
> >> case would be ideal, but conditions under which this will trigger
> >> are also sufficient.
> > 
> > 
> > I am not sure what does "is activated" mean.
> > For example, on latest Linux:
> > 
> >         vq = vp_find_one_vq_msix(vdev, avq->vq_index, vp_modern_avq_done,
> >                                  avq->name, false, true, &allocated_vectors,
> >                                  vector_policy, &vp_dev->admin_vq.info);
> >         if (IS_ERR(vq)) {
> >                 err = PTR_ERR(vq);
> >                 goto error_find;
> >         }
> > 
> >         return 0;
> > 
> > error_find:
> >         vp_del_vqs(vdev);
> >         return err;
> > }
> > 
> > 
> > And 
> > 
> > static void del_vq(struct virtio_pci_vq_info *info)
> > {
> >         struct virtqueue *vq = info->vq;
> >         struct virtio_pci_device *vp_dev = to_vp_device(vq->vdev);
> >         struct virtio_pci_modern_device *mdev = &vp_dev->mdev;
> > 
> >         if (vp_dev->msix_enabled)
> >                 vp_modern_queue_vector(mdev, vq->index,
> >                                        VIRTIO_MSI_NO_VECTOR);
> > 
> >         if (!mdev->notify_base)
> >                 pci_iounmap(mdev->pci_dev, (void __force __iomem *)vq->priv);
> > 
> >         vring_del_virtqueue(vq);
> > }
> > 
> > 
> > and this happens after feature negotiation.
> > 
> > It's before device_ready, however.
> 
> Are there drivers that will change virtqueue => MSI-X vector mappings
> after DRIVER_OK without an intervening reset?  Cloud Hypervisor
> supports this for devices it implements internally, but it ignores
> such changes for vhost-user devices.  Is this going to cause problems
> in practice?


Also yes.

For example, dpdk uses this during cleanup to block interrupts:
drivers/net/virtio/virtio_ethdev.c


int
virtio_dev_close(struct rte_eth_dev *dev)
{       
        struct virtio_hw *hw = dev->data->dev_private;
        struct rte_eth_intr_conf *intr_conf = &dev->data->dev_conf.intr_conf;
                                             
        PMD_INIT_LOG(DEBUG, "virtio_dev_close");
        if (rte_eal_process_type() != RTE_PROC_PRIMARY)
                return 0;

        if (!hw->opened)
                return 0;
        hw->opened = 0;

        /* reset the NIC */
        if (dev->data->dev_flags & RTE_ETH_DEV_INTR_LSC)
                VIRTIO_OPS(hw)->set_config_irq(hw, VIRTIO_MSI_NO_VECTOR);
        if (intr_conf->rxq)
                virtio_queues_unbind_intr(dev);

        if (intr_conf->lsc || intr_conf->rxq) {
                virtio_intr_disable(dev);
                rte_intr_efd_disable(dev->intr_handle);
                rte_intr_vec_list_free(dev->intr_handle);
        }

        virtio_reset(hw);
        virtio_dev_free_mbufs(dev);
        virtio_free_queues(hw);
        virtio_free_rss(hw);

        return VIRTIO_OPS(hw)->dev_close(hw);
}


> 
> If device_ready is what sets DRIVER_OK, and the virtqueue => MSI-X
> vector mappings subsequently stay static until reset, then everything
> should work fine unless I misunderstood the Cloud Hypervisor code.





> >>>> One reason I am asking is that I am working on an updated
> >>>> virtio-vhost-user spec, which I've renamed vhost-guest.  A vhost-guest
> >>>> device implements a vhost-user server, and requires one MSI for each
> >>>> virtqueue of _the device being implemented_.  The existing spec
> >>>> allows the guest to select which MSIs are used, but that seems to
> >>>> be pointless additional complexity.  A simpler option would be to
> >>>> hard-code the MSI assignments:
> >>>>
> >>>> - 0: Configuration change interrupt.
> >>>>
> >>>> - 1..N (inclusive): Queue interrupts for the N virtqueues provided
> >>>>   by the vhost-guest device.
> >>>>
> >>>> - N+1..N+M (inclusive): Buffer availability interrupts for each of
> >>>>   the M virtqueues that the driver is implementing.
> >>>
> >>>
> >>> you can do this, and imply ask drivers to share msi vector values.
> >>
> >> Are there drivers that cannot do this?  Is this the reason that the
> >> virtio spec allows using the same MSI for multiple virtqueues?
> >>
> > 
> > No, it's because of the devices:
> > 1. it's easier for device to detect sharing when it's explicit,
> >    rather than matching msi vectors which can change at any time at all.
> > 2. we thought it might be more portable to non pci transports.
> 
> Makes sense!  Thank you so much for your time and effort!
> -- 
> Sincerely,
> Demi Marie Obenour (she/her/hers)





