Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E88F2135AD
	for <virtio-comment@lists.linux.dev>; Wed, 25 Feb 2026 09:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772013281; cv=none; b=kWfbQHI5/3IJWHff+n3Dz2inaDYcmYIl3pftX0rjHHoDtsNrLi0WEIWSfteO4ti8+ICgwjXVZ3Hjm8ZC5QOUN4Hm17LWasKXHXc+k4L7xOtBBBbyNvFlGPebQWP0Is4VebWMJNPd5Riz3MZOLbLF8lF+R23gXTxcB85T7U9MyOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772013281; c=relaxed/simple;
	bh=LH6eqqmLlKwmfDLZtsgJScQdDh9My8KvdtEDDlOa4C0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=WSChPoZa3W7ujLFBSsTuSJS8mVKT4uF6MbnqjkZT7y7a/d7Mf/HhR9m38y7pGTO6w1TIWdPs97GcgyppQqo1MNpzxjk9yB7RD+8WOK7cZK2W/im3vtx2sR0bsh2v35lOv/knBBXGFqMqwpyCYFgtil7TfcyjNJBRj0AX6JOI3Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=i+YSSZUs; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="i+YSSZUs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772013279;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Q4+YXcvZdITmIoWMDNlt3EDUd8ZiA2NI7tljhOXO23U=;
	b=i+YSSZUsUSMKy7ic2ZHsiqfqFtTnY49okhbzwz/Eo4IAz+7+0V4G3BkyX3snBoowalObhn
	FwRxIgltcusLA/DAoYFKrC5o7HiowFOoRLJtz6w8FlqUUl8j0xMvFsRFuPI2GWJcU5q/lZ
	M2DKjf4C0NjpJG2l+0Po31yqYLrpq2Q=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-649-vMQzaCcAMHWC75WDDin0Rg-1; Wed, 25 Feb 2026 04:54:37 -0500
X-MC-Unique: vMQzaCcAMHWC75WDDin0Rg-1
X-Mimecast-MFC-AGG-ID: vMQzaCcAMHWC75WDDin0Rg_1772013277
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4836cd6dfe6so31496895e9.2
        for <virtio-comment@lists.linux.dev>; Wed, 25 Feb 2026 01:54:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772013276; x=1772618076;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q4+YXcvZdITmIoWMDNlt3EDUd8ZiA2NI7tljhOXO23U=;
        b=Hn1YT7yipDTLN0+2CN8OJaiaGm7KR3CSN7m1esXGWZAQPdj1WZ514UlrC5rKP+Z/66
         Jv/vWDE5kcfbz+n6qzJaJkfXxhPFSQMN7ck/tcrMP77wMNai04emTiPh77WzrxRGQIIN
         6huSTvXf9tBmakGorvq+OWcrcZwnf/JdSBY8VGdVLaUIiUjBLrNWNWj1StDYUIGFdyuQ
         BKBx3kCP25MHMRfnYzw//SUZAPrpmeFONYgVKGmptVApa8RhRp1iEccBB0CjZrN9f01J
         HhZP9aNRg9EARgsFbg/noaukLIR0Y0Kej5WnceDp2fTLkhE9qM/w0OFjeOnNTrhDB+Hs
         gE4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUKayIF7WZowZ9ZIuOdh2BhdK1R07VvXXTMqk/KBvzbtf32WPcquiAeDVsBeInYNNcG6lV04qcf99rNKsuIPw==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywe4i1X+UW08AzuHysGO+TPua9zHaOg7uNtCQ+n7DEhtjb2Ov44
	9VCjHJB3qhUaacK8UI/6F32Ctvv4T1zE+OTCw7f82HF7RhMfrVpMGqdHe0ue/KKUV20r8uvJhMO
	KlGYqkxN/CfvcQYGrwGw/30CGWVUmUwgg7c8bpwS6Y2VzFYOXF5+5IDBBUro7LCoHXV6I
X-Gm-Gg: ATEYQzyZ+YZgV2OmHzJBa0Z/WwPdqnAbDyw9Bi5nroh9n1jiWaccy0ivOI0HlFP+gId
	twl1KBtDxYyaSkEEs+NPJaVD0E7Ai5JHopCE+jXDT4hZtkBeuyC4f/qcvZZ1Qn8mseemNYomPO6
	M6UxNl8KiThZApYVo07th2NPE6dXk2/zQbfxHCMrQhGCwu+PjpT+ObykNmN15Bc3EWepJ8Y29nD
	sLitATpwrexkBadQNJeKY/tvCtCcME1U2H5IICQhiYFHuvfXlojRpl1Lg4oI0wUz3IN7YXI2mf+
	Kk19e7kP/jIHLMWqVGWOH3KXqkNb5hHc8Ahocz57RYSkK6bxaZEzeOUqMtFxvX8uAvDGhP0y9GQ
	rAHGuCOPm7X8tWRb9Iob4KcRaKSdZlAU7oLJRWxPJGZbFXg==
X-Received: by 2002:a05:600c:35c1:b0:47d:25ac:3a94 with SMTP id 5b1f17b1804b1-483bef4aa5bmr33534835e9.17.1772013276132;
        Wed, 25 Feb 2026 01:54:36 -0800 (PST)
X-Received: by 2002:a05:600c:35c1:b0:47d:25ac:3a94 with SMTP id 5b1f17b1804b1-483bef4aa5bmr33534385e9.17.1772013275590;
        Wed, 25 Feb 2026 01:54:35 -0800 (PST)
Received: from redhat.com (IGLD-80-230-79-166.inter.net.il. [80.230.79.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd6f19f5sm142631155e9.1.2026.02.25.01.54.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 01:54:35 -0800 (PST)
Date: Wed, 25 Feb 2026 04:54:32 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Parav Pandit <parav@nvidia.com>,
	"Bill Mills (bill.mills@linaro.org)" <bill.mills@linaro.org>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"Edgar E . Iglesias" <edgar.iglesias@amd.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Alex Bennee <alex.bennee@linaro.org>,
	Armelle Laine <armellel@google.com>
Subject: Re: [PATCH v1 0/4] virtio-msg transport layer
Message-ID: <20260225045338-mutt-send-email-mst@kernel.org>
References: <20260126163230.1122685-1-bill.mills@linaro.org>
 <SJ0PR12MB680610C1B53CA4E8B4470411DC61A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20260219185034-mutt-send-email-mst@kernel.org>
 <SJ0PR12MB6806F703CB616D184FCBE5B3DC68A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20260220050136-mutt-send-email-mst@kernel.org>
 <SJ0PR12MB6806139282845EA52421A9E2DC75A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20260225022229-mutt-send-email-mst@kernel.org>
 <SJ0PR12MB6806E3A4D9783E5DB5FA5EC4DC75A@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20260225041945-mutt-send-email-mst@kernel.org>
 <701B1A68-655E-4ECD-BD17-5784AF7DFE40@arm.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <701B1A68-655E-4ECD-BD17-5784AF7DFE40@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: l2xbSZQggY2vJiwRRkMXMVmV_ZnQ2NP4maDk1bavyIg_1772013277
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 25, 2026 at 09:35:29AM +0000, Bertrand Marquis wrote:
> Hi Michael and Parav,
> 
> > On 25 Feb 2026, at 10:22, Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Wed, Feb 25, 2026 at 09:18:58AM +0000, Parav Pandit wrote:
> >>
> >>> From: Michael S. Tsirkin <mst@redhat.com>
> >>> Sent: 25 February 2026 12:55 PM
> >>>
> >>> On Wed, Feb 25, 2026 at 05:09:45AM +0000, Parav Pandit wrote:
> >>>>
> >>>>
> >>>>> From: Michael S. Tsirkin <mst@redhat.com>
> >>>>> Sent: 20 February 2026 03:33 PM
> >>>>>
> >>>>> On Fri, Feb 20, 2026 at 06:13:55AM +0000, Parav Pandit wrote:
> >>>>>>>> 4. I dont find the transport messages to read and write to the driver memory supplied in VIRTIO_MSG_SET_VQUEUE addresses to
> >>>>> operate
> >>>>>>> the virtqueues.
> >>>>>>>> Dont we need VIRTIO_MEM_READ, VIRTIO_MEM_WRITE request and response?
> >>>>>>>
> >>>>>>> surely this can be an optional transport feature bit.
> >>>>>>>
> >>>>>> How is this optional?
> >>>>>> How can one implement a transport without defining the basic data transfer semantics?
> >>>>>> For example for TCP transporting, driver side OS is implementing header format foo, and device side is using header format bar.
> >>>>>> How does it work?
> >>>>>
> >>>>> I'm not sure what do foo/bar refer to, or what TCP transporting means.
> >>>> This proposal is subset of past proposal of [1].
> >>>>
> >>>> Proposal [1] covered transporting virtio control and data operations using something other than MMIO and PCI.
> >>>> And current proposal is similar, except that it didn't define the transport binding at all for the specific bus.
> >>>> It is only a partial 'control-transport'.
> >>>>
> >>>> [1] https://yhbt.net/lore/virtio-comment/20231023104647.290759-2-pizhenwei@bytedance.com/
> >>>>
> >>>> So foo and bar are the definitions I expect as listed in the patch-5 of [1].
> >>>> If it has to be done by the bus, lets write up this as 'control-transport'.
> >>>>
> >>>>> The simplest way to do TCP on top of virtio is to layer it above virtio
> >>>>> net. That uses VQs for data transfers.
> >>>>>
> >>>> The intention of this proposal is not to do TCP on top of virtio.
> >>>> The intention of this proposal is to do virtio on transports other than MMIO, PCI and channel.
> >>>> Such a transport can be anything - not defined in virtio spec.
> >>>
> >>>> It could be FFA, some two SoC as written in cover letter example, or it can be something else such as TCP or UDP or vsock or whatever else.
> >>>
> >>> I feel this "anything" is simply too broad a requirement.
> >>> I did not see any demand for  virtio over TCP.
> >>> And, making it work with existing drivers will be a mess.
> >> Why would it be a mess? Because of load/store semantics?
> >> If so, would the message layer also faces the same challenge?
> >
> > not sure what "the message layer" is.
> >
> >>> We can scope this for buses that can do DMA for now.
> >> That looks reasonable good start.
> >> However, "Appendix C. Creating New Transports" needs modification.
> >>
> >> Following two likely needs to stay outside of the "control transport".
> >>
> >> A transport provides a mechanism for the device to send device notifications to the driver, such as used
> >> buffer notifications.
> >> A transport provides a mechanism for the driver to send driver notifications to the device, such as available
> >> buffer notifications.
> >
> >
> > Well existing transports sure do include these.
> >
> >> We also need to fix the Appendix to describe about control transport and full transport.
> >> Current definition of Appendix C is listing MMIO And PCI transport, yet it misses virtqueue implementation by _full_ transport.
> >
> > because they all share a single virtqueue implementation.
> >
> >>>
> >>>
> >>>
> >>>>
> >>>> And hence, data transfer part must be scoped properly.
> >>>> Maybe I am yet to read this text in the 1600 lines of proposed patch...
> >>>
> >>>
> >>> Once we get into "support everything in the most abstract way possible"
> >>> we have already lost.
> >> Unlikely.
> >> Nvme over TCP is present since 2021.
> >> NVMe over RDMA is present since 2017.
> >> iSCSI over TCP is present from 2014.
> >> NFS ..
> >> List continues...
> >>
> >> The idea is to not define most abstract thing.
> >> The idea is to define the practical spec that cater to requirements already listed, including the TCP one in [1].
> >
> > I don't object to virtio over TCP. just do not want to block this
> > work on that.
> >
> >
> >>> No one asked for virtio over carrier pigeons.
> >> CSP user already explained the use case of virtio over network transport in [1].
> >> Considering above many use cases already done on similar non virtio devices as pigeons is severe undermining the scope of virtio.
> >>
> >> One can say, I only want to engineer control transport ignoring needs of [1].
> >> However, we must have the doors and vision open so that users of [1] can also use it without creating yet another 'fabric transport'.
> >>
> >> At the same time, we must define the binding to the bus where it is going to be used for the DMA.
> >>
> >> For example, cover letter mentions about " between a host processor and its co-processors"
> >> And " between normal and secure worlds"
> >>
> >> How can one implement a driver if the bus driver does not know how to enumerate/discover it?
> >>
> >> In the proposed example, of host processor and co-processor if they are connected via Xenbus or AMBA bus,
> >> how should driver discover this device?
> >>
> >> If this bus binding is not part of the virtio spec, how can it be ever implemented and yet comply to the virtio spec?
> >> Can someone please explain this?
> >>
> >> I frankly expect an ARM FF-A bus binding transport section in virtio-spec.
> >> So that device and driver can inter-operate implemented by two different entities.
> >> Only virtio level messages do not seem sufficient.
> >
> > I agree at least one should be shown at least as an rfc.
> 
> Here is a link to the current virtio message bus over FF-A specification:
> https://developer.arm.com/documentation/den0153/0101/
> 
> 1.0 Alpha 1 version in sync with this version of the virtio message spec will be released later today, you will be redirected to
> 1.0 Alpha 0 version until it is  which is in sync with the previous RFC we sent.
> 
> Regards
> Bertrand
> 
> 
> IMPORTANT NOTICE: The contents of this email and any attachments are confidential and may also be privileged. If you are not the intended recipient, please notify the sender immediately and do not disclose the contents to any other person, use it for any purpose, or store or copy the information in any medium. Thank you.


thanks. pls include that in the series as [PATCH RFC 5/4]

