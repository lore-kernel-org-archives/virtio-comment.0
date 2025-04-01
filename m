Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AABE81E5B7E
	for <virtio-comment@lists.linux.dev>; Tue,  1 Apr 2025 11:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743506167; cv=none; b=tlbE3YBHtrubDE/eetoUZ14CmI9DxPr5EQH8VpSD6ZLZoE7B/DhgFmq0nLZku5MZuuqgBv8jCaheCke7TkGTK6Rglm0u1d7HAFo+J+Pn10eaHVw/h88reNKjkX07HFhUhkfO+6ZgP286vkDOnXKyxjwhLTMOxSSqjCfDeTg4h20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743506167; c=relaxed/simple;
	bh=qrXkKhgp/MlbfwQqgAcAOvhhiDdOLTwRrNxpwSd2gvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=FqAmgl2l8zdRhS+BsyDEqltt+Wipt9A7M5/HnMFnGdxRTtZyC68+wyHe3M08liLIyLqqZgxIigyWkvOQyLy2mBKqSWkGX4m0qcEVXqhh7wFig4nydE6PGlHVA2D23s/Sg9XD3kpDj5tZe6j8p5XeA05miOnPwj5wCZ1NRzzmuT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WUv8E+ZU; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WUv8E+ZU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743506164;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KVkGhDCp0r0hgraM+k4LByuX2Jhj1Bs7XZpkdiYRVfA=;
	b=WUv8E+ZU5P7ZgxgPVjPPZkxncHDvR0amRstQ1YqRqeBl3Yj+Ea0PjamUGrHPi4U4W86HDM
	vUlj/ByJDAxZBgYgH1ZjaE9Ti7hRph+9rl1kc9LLPR3X4kqGp6EO5OwoVjJ+ISUHeg/YUB
	VyNy7ALSG6IFN3ve23HIiaAeQdOUs1I=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-259-CX0c1IdnPdCAM1xZTzo3uw-1; Tue, 01 Apr 2025 07:16:03 -0400
X-MC-Unique: CX0c1IdnPdCAM1xZTzo3uw-1
X-Mimecast-MFC-AGG-ID: CX0c1IdnPdCAM1xZTzo3uw_1743506162
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-39c184b20a2so871836f8f.1
        for <virtio-comment@lists.linux.dev>; Tue, 01 Apr 2025 04:16:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743506162; x=1744110962;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KVkGhDCp0r0hgraM+k4LByuX2Jhj1Bs7XZpkdiYRVfA=;
        b=k2X8+KoAceCeDxAX7DMrEq6s74K/tRxxxkvsA6Dhff4nl3l0CRn5RGN05KUDtqZNRW
         3DCaf+5o2ayRIpQPZzprchsqUp/3HsMuEW0cDl8RV2xV1jP80ke93lCoXDOFYw2hj9JZ
         8+No7Eg8ZWj2ucgykq9F4vpt1d2ORUlBKO1QKbwVYy1q/U0zpWr2xxb9J0cT2T46Spnj
         QJuEUAE1/5suYaqeB78Sb7fS3DsBhsn2D5WQ7kFMoIGn/WfvFiULN2p+bWeFk8fSoXui
         +OYco0mUuxW1eDN2agDDh5Ua6gC1ehYsUhdG21ecyidBBVllLg998eTQLgPIbNCPOq0u
         qmeg==
X-Forwarded-Encrypted: i=1; AJvYcCUKQU37R9B4wrldfbsiTiMny0tr71KihgmoTjxpa/xaSLLAQbCaLNTds4P8bHoX3RzoqL1nkitjYCuYHjaVrg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxu7y09T2LJU2z9t+6rfsbIDEIN6zAshkOr3XOTkvU8pjuD0vWy
	Lo5QxpaBE0O2u4QzwvkETXYW/PuFUyfNV2XOLMYEB68QT6V7KIibhQkhLGpqwizjJMfLsz6G+la
	2KxLmX9bLS1XtV6i/RE9BgI+rOtmwLIxXNXeFfNbAyLBriomZz9gcgdIMOC7C3JnT
X-Gm-Gg: ASbGncu5k8Q0By+W13DmTfexh0gFy+MYx9F4Sau0oAuKlB2OJPDKAKvrn+GOUwXusm4
	8+BRiX5NBW6HMJZLlJIL/RjGUKYixKsOCUbrqD71/4ExfTG2wE9rDbTCO3U27rhVAHFT8mXGTfU
	B2YSq39RovGmqehihs0v1WXnh/NIohbDqT7E+I2XHRVowNFMmX3ptGcizl7oUA1yqPX0JClo9hV
	5Udyt+SDeAftTRM4aRJVduAdqRNbgp/Mx24rF3Z/7PnAaC8mma3e5BmiVa18nBG7wWNxr0z4UjR
	KgUxqfGiR4i6PY+GGzZO15OCuD/Z+h92poJQNIVsE3VT2kt4s13xcC40h/E=
X-Received: by 2002:a5d:5984:0:b0:390:fbcf:56be with SMTP id ffacd0b85a97d-39c12097a4bmr11994046f8f.0.1743506162270;
        Tue, 01 Apr 2025 04:16:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFjT5FRSfjMQ3DWtwTg+x5I4kEevtpfeJbsJcc8vnKi/QsNSa5EKTOx0UZIz0sITQV78yoRJQ==
X-Received: by 2002:a5d:5984:0:b0:390:fbcf:56be with SMTP id ffacd0b85a97d-39c12097a4bmr11994013f8f.0.1743506161756;
        Tue, 01 Apr 2025 04:16:01 -0700 (PDT)
Received: from sgarzare-redhat (host-87-11-6-59.retail.telecomitalia.it. [87.11.6.59])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b79e14csm13872801f8f.76.2025.04.01.04.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 04:16:01 -0700 (PDT)
Date: Tue, 1 Apr 2025 13:15:46 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Xuewei Niu <niuxuewei97@gmail.com>
Cc: fupan.lfp@antgroup.com, mst@redhat.com, niuxuewei.nxw@antgroup.com, 
	parav@nvidia.com, stefanha@redhat.com, virtio-comment@lists.linux.dev
Subject: Re: [PATCH v6 RESEND] virtio-vsock: Add support for multi devices
Message-ID: <lr6fvhjts6ytekqnlbvccvvjbnmbgspzynme4yii4bla6fiyig@mzgor4y3ojsh>
References: <20250327081830.2309856-1-niuxuewei.nxw@antgroup.com>
 <20250331061827.2500867-1-niuxuewei.nxw@antgroup.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250331061827.2500867-1-niuxuewei.nxw@antgroup.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: wapxuQAKjXJjMh_yyCEAlFvbNahKW1coXw2ZMl1UycM_1743506162
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On Mon, Mar 31, 2025 at 02:18:27PM +0800, Xuewei Niu wrote:
>> > On Wed, 26 Mar 2025 at 11:32, Stefano Garzarella <sgarzare@redhat.com> wrote:
>> > > On Wed, Mar 26, 2025 at 06:00:31PM +0800, Xuewei Niu wrote:
>> > > >> On Tue, Mar 25, 2025 at 11:19:46AM +0800, Xuewei Niu wrote:
>> > > >> >> On Mon, Mar 24, 2025 at 02:43:35PM +0800, Xuewei Niu wrote:
>> > > >> >> >This patch brings a new feature, called "multi devices", to the virtio
>> > > >> >> >vsock. It introduces a "VIRTIO_VSOCK_F_MULTI_DEVICES" feature bit, and a
>> > > >> >> >"device_order" field to the config for the virtio vsock.
>> > > >> >> >
>> > > >> >> >== Motivition ==
>> > > >> >> >
>> > > >> >> >Vsock is a lightweight and widely used data exchange mechanism between host
>> > > >> >> >and guest. Currently, the virtio-vsock only supports one device, resulting
>> > > >> >> >in the inability to enable more than one backend. For instance, two devices
>> > > >> >> >are required: one to transfer data to the VMM via virtio-vsock,
>> > > >> >>
>> > > >> >> Come to think of it, AF_VSOCK defines CID 0 (VMADDR_CID_HYPERVISOR) to
>> > > >> >> communicate with the hypervisor, but in virtio-vsock we never supported
>> > > >> >> it. Could this be the use case?
>> > > >> >>
>> > > >> >> We could in this way add a new feature for those devices that
>> > > >> >> communicate only with the VMM, where the CID of the VM is quite useless.
>> > > >> >> So instead of having multiple CIDs per VM, we could continue to have a
>> > > >> >> single CID, but the transport could support 2 devices, one to
>> > > >> >> communicate with the VMM (CID = 0) and one to communicate with the host
>> > > >> >> apps (CID = 2).
>> > > >> >>
>> > > >> >> Maybe this is orthogonal to this proposal, though, because it might
>> > > >> >> still make sense to have multiple vsock devices, even though it's not
>> > > >> >> very clear to me.
>> > > >> >
>> > > >> >In terms of the current situation, two devices are enough.
>> > > >> >
>> > > >> >We are the team of Kata Containers, so we are focusing on cloud-native
>> > > >> >computing. What I mentioned below might be beyond the scope of the virtio
>> > > >> >spec, just for your reference.
>> > > >> >
>> > > >> >The background is that the architecture of proxy mesh has been evolved over
>> > > >> >the past few years: from per-pod to per-host (e.g. Istio Ambient Mesh[1]).
>> > > >> >
>> > > >> >Thanks to the TSI[2] and vhost-user protocol, network packets can bypass
>> > > >> >both host and guest network stacks. It is possible to establish a fast path
>> > > >> >between the pod and the proxy.
>> > > >> >
>> > > >> >When we have multiple networks, it is intuitive to have multiple NICs. So
>> > > >> >does vsock.
>> > > >>
>> > > >> Be careful though, we don't want to complicate vsock to become like a
>> > > >> NIC.
>> > > >>
>> > > >> >
>> > > >> >When multiple networks are availble, it means that it is possible to have
>> > > >> >multiple proxies(i.e. user processes). In this case, two devices are not
>> > > >> >enough. This feature makes vsock more flexible and scalable.
>> > > >>
>> > > >> This is a good point, but I really don't understand why a VM should have
>> > > >> multiple CIDs assigned.
>> > > >
>> > > >I think priority is not the biggest issue here. So let us focus on how to
>> > > >route the connection to the right device among more than two devices.
>> > >
>> > > That's why I was recommending a different approach. IMO the user should
>> > > not do this, but that should be transparent, hidden in the driver.
>> > >
>> > > By supporting VMADDR_CID_HYPERVISOR, we know very well if a packet is to
>> > > be sent to the VMM, then we have to use the device that supports it.
>> > > Whereas if the user connects to VMADDR_CID_HOST we have to use the other
>> > > device.
>> > >
>> > > The user doesn't have to do anything, only use the right destination CID
>> > > if it wants to talk to the VMM or another host process.
>> >
>> > Obviously, if we want to support more than 2 devices, we need this
>> > that you are proposing. But IMO we need also to support
>> > VMADDR_CID_HYPERVISOR, and we should prevent the user from doing
>> > bind() on a random CID if one of the two devices only talks to the
>> > VMM.
>>
>> I agree with supporting `VMADDR_CID_HYPERVISOR` for virtio-vsock. I can
>> work on this later.

Would be nice to have both together, but I'm fine if you want to 
postpone it.

>>
>> > Because, again, how does the user know which CID to bind?
>>
>> Nice catch! I am trying to give a solution for this issue regarding the
>> scenario of more than two devices.
>>
>> Let users access the `device_order` and the `guest_cid` field. Host user
>> program and guest user program can make an advance agreement. For example,
>> the first device (whose `device_order` is smallest) is used to communicate
>> with host process 1, the second device is used to host process 2, and so
>> on.
>>
>> The guest user program want to direct the message to host process 2, then
>> the things would be:
>>
>> 1. Guest user program gets the second device's `guest_cid`.
>> 2. Guest user program binds to the CID.
>>
>> This could be worked because the `device_order` is a VM-level
>> configuration. (On the contrary, the `guest_cid` is a host-level
>> configuration).
>>
>> If people don't need this feature (use 1 or 2 devices only), they can use
>> vsock as the simple way. Otherwise, people should accept the more
>> complicated way.
>>
>> WDYT?
>
>Or we can replace the device_order with the guest_lid (aka local id). The
>guest_lid is a VM-level address space, while the guest_cid is a host-level
>address space.
>
>```c
>struct virtio_vsock_config {
>	__le64 guest_cid;
>	__le16 guest_lid; /* previous device_order */
>};
>```
>
>With this design, the relationship between the device and the guest_lid
>should be set properly before building the guest app and launching the
>VM.
>
>For example, host process 0's guest_lid is 1000, and host process 1's is
>2000. Their guest_cid will be determined when the VM started. The device
>table should be like this:
>
>* device0: process=VM   guest_lid=0     guest_cid=0 <default device>
>* device1: process=0    guest_lid=1000  guest_cid=x
>* device2: process=1    guest_lid=2000  guest_cid=y
>
>The driver should expose an interface, such as ioctl, receiving a
>local_cid. Guest apps can use it to obtain the actual guest_cid.

No, please, I don't think adding virtio-specific behaviour in AF_VSOCK 
is what we want.

Let's continue with device_order and see what others say.

I think we need to try to get a better understanding of what to do, 
depending on the direction:

- host -> guest: it might make sense multiple devices with different
   CIDs, and the host will know which one to use depending on the CID
   assigned to the device (e.g. vhost, vhost-user, device in VMM)

- guest -> host: again I think we should differentiate the device to use
   depending on the destination CID which can be VMADDR_CID_HOST,
   VMADDR_CID_HYPERVISOR, or in the case where sibling communication is
   supported a CID >= 3, so maybe we should have some features or flags
   in the config space to describe destination CID supported for each
   device so that the guest knows which device to use depending on the
   destination CID.

I don't want to stop this patch, but I would like to make it easy for 
the user to use.

Thanks,
Stefano

