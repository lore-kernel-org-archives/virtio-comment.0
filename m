Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0143B1B983F
	for <virtio-comment@lists.linux.dev>; Wed, 26 Mar 2025 10:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742985148; cv=none; b=bDoyFmSy9C4sSSouG8MwiEB19Q3s1iRxxaZ1iucQX4fhxClUtFbjOnCcg/+0zRcDeyagN1cLm7T49OdzHugye0UoCHbu4BguLzCl9u8BPcq3XEeaqRlFn6CfleTNWPH/OCxiYh/HIIqEpMszOMFKo6yic6zUG9Ih0rQzGnMkz1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742985148; c=relaxed/simple;
	bh=85bE8Sw4UB4d/EGotkenrFRjLbdtnWccFMEqm3paM1M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=WWjw/23N5EWf8UOnT/MWd4iQRNwJfVz5qNhPkFC3280gWQdJ5oxNVQMDYgeB8A+1pLTaDvf0/P6NDom3XwUEcdPtvilJM2A7zc+vNC9RHZigcBslCCtgqlCSZ7IHYJDn1pJbK1oZg4kyR+Ut7Pdwz5hgjdZKMq/78W8mOiISgko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cp/MWFX8; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cp/MWFX8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742985145;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ltwnm9oHyhbrvhpjT9vGwhz5PhwOGYhcakWT1ujNdx0=;
	b=cp/MWFX8D/CA9DP0D6iENhJj0xShjXpfNm8Vu8d2iBJG/3OL+JfxiC1qO8VgXxqnSHkiIJ
	pk2dHGjGAh/ucfkDm3K+q7BzfuZK2avRKel280GAiF/QleFxGAMA4GedZCN7GWTrnQAWmX
	qNDave/e4ipNCgkfhKvXc/jaGt0BzXg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-639-KFdz3ORTM-SmA2_fOhwyGA-1; Wed, 26 Mar 2025 06:32:24 -0400
X-MC-Unique: KFdz3ORTM-SmA2_fOhwyGA-1
X-Mimecast-MFC-AGG-ID: KFdz3ORTM-SmA2_fOhwyGA_1742985143
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43bd0586a73so43971395e9.2
        for <virtio-comment@lists.linux.dev>; Wed, 26 Mar 2025 03:32:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742985143; x=1743589943;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ltwnm9oHyhbrvhpjT9vGwhz5PhwOGYhcakWT1ujNdx0=;
        b=e1J41VVEndQjHLN+bNwm2VRG/tCLyCJZO8x5I8siFNYhu+M5Qao4rj4WGSV0YItyLp
         etT2FP1vzbEHSAc/KiXq2aje9DaHXFPAK5I65mecO8yoGX4TtWA41+9+/I3sy/rLyic7
         D1dO1UPsiNzf17PQc/UmE3FD3I6f5lwVxXgvDpEp+YQ8DyWBEi6aIIx8M47n8FoWCk+H
         UTOebK/blpCTgU9joq6zOtUe9HSIR8v3P9YL3x7tNaRafVQTutaJJI9LvlP7sQ6Tu4yZ
         vk4BiOVDMbq/SEiccvMZDT1bn6qxPKKmPJEmgS1A3Nxulzn1UBdopgICCkhPV5ROfIBU
         jL6g==
X-Forwarded-Encrypted: i=1; AJvYcCWaD+51L/jt2FLAH4Bjn9QS28Gx1CKejgT0mv0bvSPIEM+Rq46BjYk0y1tXtfV0i+aCGoG4CYJwnB3MWdIzlw==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywb5IN7MmVqNejXFUIpblXcQowSO9UxP3Cfx3HrUKXnAWwNF522
	C8D5ql6SJoTbJGXnwHoUrhFLYFbML7ILHGuZk+xje8a8Q260xXiwvFruEJJagX7NoRYaUi6nGEL
	4ZLUEZOGEP4HygaYxyKve99zurPjRuFwiCO0RwmifrZoGlxQx0xHk/y/aGOt4f8mK
X-Gm-Gg: ASbGncuDc4rdktNzk1n2oUVoOx0Wk0Ma6g8RrdMYrNoutMXHxqJPpVP5XbGOdI8rtDt
	zPKZ61kTORkzLOkGvKjiA4XBDPbNrMk/EwgMaJW9inrXkAuRjUp8/P7yw5W+8u5fQSF9p81MqTM
	9HFxbcdLLHpegNkzkM9YQEd/Z6KMHLS6DAhrK36/1xgdcrhU1/2ggTZrT77lputHre3i9A7yOGs
	4fB8PsFWPnPmR/MSHv7lpOWuIKCaE0crOryjiB47d2y3qPEYsyk2WV/rMvwy3bb4hwm9nAcfIdR
	6ySQeYNWpdxuweDtAAHFJrAq8PU7HpNULGsLDp1ivWKShMfo549ZQwh4r6KH1fPJ
X-Received: by 2002:a05:6000:1a8b:b0:391:a43:8bbd with SMTP id ffacd0b85a97d-3997f902c6bmr19212761f8f.21.1742985143286;
        Wed, 26 Mar 2025 03:32:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG4befh/+5ioaU0YOq5pwxEycT8w/lyJ5BEZuwWjnC3hiiQ0UH2RUbQ8+0Mx7Ws1hbVs/rNVg==
X-Received: by 2002:a05:6000:1a8b:b0:391:a43:8bbd with SMTP id ffacd0b85a97d-3997f902c6bmr19212718f8f.21.1742985142695;
        Wed, 26 Mar 2025 03:32:22 -0700 (PDT)
Received: from sgarzare-redhat (host-87-12-25-55.business.telecomitalia.it. [87.12.25.55])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4fd9e960sm177410495e9.29.2025.03.26.03.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 03:32:22 -0700 (PDT)
Date: Wed, 26 Mar 2025 11:32:18 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Xuewei Niu <niuxuewei97@gmail.com>
Cc: fupan.lfp@antgroup.com, mst@redhat.com, niuxuewei.nxw@antgroup.com, 
	parav@nvidia.com, virtio-comment@lists.linux.dev
Subject: Re: [PATCH v6 RESEND] virtio-vsock: Add support for multi devices
Message-ID: <fiqrmwvxg36dljg6krolmxbjquazjbnu7vwg2savfk7y4pn7en@ejvem5zwoydz>
References: <7o7pkrmbwp6zyybgqqliybesezk2zpnopwwgzlbfpnw2m7relz@mxyhzve6lote>
 <20250326100031.2197645-1-niuxuewei.nxw@antgroup.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250326100031.2197645-1-niuxuewei.nxw@antgroup.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2TcYJTumltJmxX2s2O_G_C_yr4RPaDOHfPECmk8KFpk_1742985143
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On Wed, Mar 26, 2025 at 06:00:31PM +0800, Xuewei Niu wrote:
>> On Tue, Mar 25, 2025 at 11:19:46AM +0800, Xuewei Niu wrote:
>> >> On Mon, Mar 24, 2025 at 02:43:35PM +0800, Xuewei Niu wrote:
>> >> >This patch brings a new feature, called "multi devices", to the virtio
>> >> >vsock. It introduces a "VIRTIO_VSOCK_F_MULTI_DEVICES" feature bit, and a
>> >> >"device_order" field to the config for the virtio vsock.
>> >> >
>> >> >== Motivition ==
>> >> >
>> >> >Vsock is a lightweight and widely used data exchange mechanism between host
>> >> >and guest. Currently, the virtio-vsock only supports one device, resulting
>> >> >in the inability to enable more than one backend. For instance, two devices
>> >> >are required: one to transfer data to the VMM via virtio-vsock,
>> >>
>> >> Come to think of it, AF_VSOCK defines CID 0 (VMADDR_CID_HYPERVISOR) to
>> >> communicate with the hypervisor, but in virtio-vsock we never supported
>> >> it. Could this be the use case?
>> >>
>> >> We could in this way add a new feature for those devices that
>> >> communicate only with the VMM, where the CID of the VM is quite useless.
>> >> So instead of having multiple CIDs per VM, we could continue to have a
>> >> single CID, but the transport could support 2 devices, one to
>> >> communicate with the VMM (CID = 0) and one to communicate with the host
>> >> apps (CID = 2).
>> >>
>> >> Maybe this is orthogonal to this proposal, though, because it might
>> >> still make sense to have multiple vsock devices, even though it's not
>> >> very clear to me.
>> >
>> >In terms of the current situation, two devices are enough.
>> >
>> >We are the team of Kata Containers, so we are focusing on cloud-native
>> >computing. What I mentioned below might be beyond the scope of the virtio
>> >spec, just for your reference.
>> >
>> >The background is that the architecture of proxy mesh has been evolved over
>> >the past few years: from per-pod to per-host (e.g. Istio Ambient Mesh[1]).
>> >
>> >Thanks to the TSI[2] and vhost-user protocol, network packets can bypass
>> >both host and guest network stacks. It is possible to establish a fast path
>> >between the pod and the proxy.
>> >
>> >When we have multiple networks, it is intuitive to have multiple NICs. So
>> >does vsock.
>>
>> Be careful though, we don't want to complicate vsock to become like a
>> NIC.
>>
>> >
>> >When multiple networks are availble, it means that it is possible to have
>> >multiple proxies(i.e. user processes). In this case, two devices are not
>> >enough. This feature makes vsock more flexible and scalable.
>>
>> This is a good point, but I really don't understand why a VM should have
>> multiple CIDs assigned.
>
>I think priority is not the biggest issue here. So let us focus on how to
>route the connection to the right device among more than two devices.

That's why I was recommending a different approach. IMO the user should 
not do this, but that should be transparent, hidden in the driver.

By supporting VMADDR_CID_HYPERVISOR, we know very well if a packet is to 
be sent to the VMM, then we have to use the device that supports it.
Whereas if the user connects to VMADDR_CID_HOST we have to use the other 
device.

The user doesn't have to do anything, only use the right destination CID 
if it wants to talk to the VMM or another host process.

>
>Our solution uses CID as device identification. From the users'
>perspective, they can direct the connection to the appropriate device by
>specifying a CID in either the `connect` or `bind` syscall.

How does the user know which device/CID to bind if it wants to talk with 
the VMM or with the application?

>
>Assigning one CID to a VM looks good to me. But I am not sure how to
>distinguish the devices. For example, should we expose a ioctl or a
>sockopt?

Nope, just simply use the right destination CID in the connect() 
(VMADDR_CID_HYPERVISOR or VMADDR_CID_HOST), without doing any bind().

For receiving, the user can check the source CID after connection and 
decide to discard connections from VMADDR_CID_HYPERVISOR or 
VMADDR_CID_HOST depending of the service.

Thanks,
Stefano

