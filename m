Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7730118C32C
	for <virtio-comment@lists.linux.dev>; Wed, 26 Mar 2025 09:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742979867; cv=none; b=LfT8RLfB2xUy8TXmJ1oAf7a11L3ue7/FUWjOwesyL+ojsrFs2M/Um094QhtExvPlQn4a2IUiVsAxEbPshiyBTEkiHgDvTHe/0wZwND2X4O/8z654KAl+Nsyyi2L7fNVnRk9vwtic4fq+AxvTuVnarxq+yV2UElyu2ETeiruI9f4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742979867; c=relaxed/simple;
	bh=UM5E5WKo/qTJmlWej1b4mj3dx0JHGLSPLO5zdcwU0yQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=JWM8pjRaaLk1saQNfZS/PZme2P5TQ/9JdkuIfyZdyENJ7Xe5JUOODqp84I5mRUtL4A14Y9yTLcLzeicf/5qS4tZLD83LDDxNnnvDTNCZEMMM7JFnn1gDTHQ8Fdoj80S6kW1gmFYKUPBUbKnEHtEo+lmetP/5s8kZjgCM3NGISqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SPcOlVdF; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SPcOlVdF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742979864;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hUZPEpqXaLYy//2IXAdqOsKfV/msQxZCN6p6R+PAWo0=;
	b=SPcOlVdFGqQxKucrRT65RJWJXHDFtHxIFiHpuJ3eD+ZNiQvrC7Ovjav92pRLWirtHPTFY0
	9+Rz5raUxTj46aYZrjGnnjPIYSmzNsOqiRYjjHVmP75GFvqyGilFoQ5wwij9W0kEH/+usr
	fCN6Hdwcr2G8LQ7hsGOAUlO4OEHeiKM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-5-WUSaVOSbMlyGYwn9N-B0wQ-1; Wed, 26 Mar 2025 05:03:53 -0400
X-MC-Unique: WUSaVOSbMlyGYwn9N-B0wQ-1
X-Mimecast-MFC-AGG-ID: WUSaVOSbMlyGYwn9N-B0wQ_1742979832
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-39131f2bbe5so2725343f8f.3
        for <virtio-comment@lists.linux.dev>; Wed, 26 Mar 2025 02:03:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742979832; x=1743584632;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hUZPEpqXaLYy//2IXAdqOsKfV/msQxZCN6p6R+PAWo0=;
        b=DmhbUt70QU0oyXcAlfEGfPwwiOwEyeNEN0YsF5CWV01xRMxovrhVvNcDCXcZgFqQ47
         sQ5PWlbQdnRtYkaTg66WbfEEhUgcHP61jUL5DTgQZjaszacXeZ07ONjfWDCzbkk4p9m1
         AR3s0lgLEr485ffOBkrU9Px26ZJNXXhG5hGmvSvS0iyDsdlBAlw4T/iWyxeYNYl5qyVB
         37lkqxnFY9qbi8ZuFB0QnYnyUFUZgfpHA7yge31NtXczg0vbdNv+ujTS3iRcd69w38ij
         +yNZVOo1jnso7cX+Q1P1q6ogcf68x3Vr1FaruwaNNkW0OgwoDD9ose7JboLHnc9DIJX1
         mAFA==
X-Forwarded-Encrypted: i=1; AJvYcCVHEnWcxHVm16/ZSgTDSkhQEgKaEkKGbwZXMT4x+NHvNEfoX8+rVFuQnuE4R5SK38tF4iF/8gDMrNB7SzdjeA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyfks2jn5lpzC6pAQQCaQeJn3ggJE3g/SYRXW5XN/HBdPfVY9iT
	X5/71QzSz8JwCnh5/2zBpJDHJ0j8KQzM5S937EiurvHXp4j7xHoZC6i00S6JT1zRqA7H78KJThx
	BKXbE8LvhdhTDMqOXzd0VkXTIVHXoTfq4LqBF3HW7ItLPgZi9027kpRhFGZdPE3fA
X-Gm-Gg: ASbGncsiQN1VUxexz+/ts0lFtNLHwT1NU7xYnNPKDCWmukvasVtUHPj0VrKby1qquCN
	C7eQ97yJXJ+Y6jnrMSI2RbhDVH2Hib9oOC8rIvoXRX339ttu9V761IgI4hvTZDcInBaCbTIPLpf
	BRNKWK/zsWY0/NqVYICXBHcFzzJvJ73e4eQl2UzxpSdo/8FUJDvn41ExVpyttH/6/327ifSuePC
	9tEjfnGpFH+2si45Em+XTYUh0d/nO9+3OjumLChkHyYmLaMzQkLKepJSDa0JrXB6iLj2QWbN1/v
	m3qHer+rGBwgnjXzBOM00Qbhm0HraTWDVlsM88LLFmRolLpm0RHmO+w0JI2giH2K
X-Received: by 2002:a05:6000:2187:b0:39a:ca0b:e7c7 with SMTP id ffacd0b85a97d-39aca0be8demr3345659f8f.36.1742979831753;
        Wed, 26 Mar 2025 02:03:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEp+7HSnaQMyoXzQRNT5cuZm+GXLQoVGutTVumWGefbrPFRAbFOMOtUjjNYRyepeJuBVQpNJA==
X-Received: by 2002:a05:6000:2187:b0:39a:ca0b:e7c7 with SMTP id ffacd0b85a97d-39aca0be8demr3345636f8f.36.1742979831178;
        Wed, 26 Mar 2025 02:03:51 -0700 (PDT)
Received: from sgarzare-redhat (host-87-12-25-55.business.telecomitalia.it. [87.12.25.55])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9b26a6sm15970652f8f.44.2025.03.26.02.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 02:03:50 -0700 (PDT)
Date: Wed, 26 Mar 2025 10:03:46 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Xuewei Niu <niuxuewei97@gmail.com>, mst@redhat.com, 
	stefanha@redhat.com
Cc: fupan.lfp@antgroup.com, mst@redhat.com, niuxuewei.nxw@antgroup.com, 
	parav@nvidia.com, virtio-comment@lists.linux.dev
Subject: Re: [PATCH v6 RESEND] virtio-vsock: Add support for multi devices
Message-ID: <jvqe4zwumc5lxpcltzjfgtwi3uppi4hc2wpbgphpb2vbezsg3b@n5hmgt3gwayk>
References: <h5vwvrs7gsnkyw3vmkumhbtuqdecfmksnwlvfmxr62t2lhz3hc@lpinl24bwkte>
 <20250326025952.2027968-1-niuxuewei.nxw@antgroup.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250326025952.2027968-1-niuxuewei.nxw@antgroup.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: EYUPujfKicbHoq0YFNqnSlyJo6plGqhhGVglTT7tZgg_1742979832
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On Wed, Mar 26, 2025 at 10:59:52AM +0800, Xuewei Niu wrote:
>> On Mon, Mar 24, 2025 at 02:43:35PM +0800, Xuewei Niu wrote:
>> >This patch brings a new feature, called "multi devices", to the virtio
>> >vsock. It introduces a "VIRTIO_VSOCK_F_MULTI_DEVICES" feature bit, and a
>> >"device_order" field to the config for the virtio vsock.
>> >
>> >== Motivition ==
>> >
>> >Vsock is a lightweight and widely used data exchange mechanism between host
>> >and guest. Currently, the virtio-vsock only supports one device, resulting
>> >in the inability to enable more than one backend. For instance, two devices
>> >are required: one to transfer data to the VMM via virtio-vsock,
>>
>> Come to think of it, AF_VSOCK defines CID 0 (VMADDR_CID_HYPERVISOR) to
>> communicate with the hypervisor, but in virtio-vsock we never supported
>> it. Could this be the use case?
>>
>> We could in this way add a new feature for those devices that
>> communicate only with the VMM, where the CID of the VM is quite useless.
>> So instead of having multiple CIDs per VM, we could continue to have a
>> single CID, but the transport could support 2 devices, one to
>> communicate with the VMM (CID = 0) and one to communicate with the host
>> apps (CID = 2).
>>
>> Maybe this is orthogonal to this proposal, though, because it might
>> still make sense to have multiple vsock devices, even though it's not
>> very clear to me.
>>
>> > and another to a user process via vhost-user-vsock.
>>
>> So to recap, one device would be used only to communicate with the VMM,
>> and the other device to communicate with other external processes,
>> right?
>>
>> Do you have any other use cases?
>>
>> >
>> >Apart from that, a side gain is that theoretically the performance might be
>> >improved since each device has its own queue. But it varies depending on
>> >the implementation.
>>
>> This though might be easier to implement supported multi-queue in the
>> device, instead of adding n devices to the VM.
>
>How to specify virtqueue for a connection?

This should not be done by the user, and that's exactly the problem with 
having multiple devices!

How do you decide which application should use one device and which 
should use another device? You have to add some kind of scheduler or 
static assignment that really makes it super complicated.

This has to be transparent to the user, so if you have multiple queues 
(usually one per vCPU), the driver automatically uses the right queue 
according to the vCPU it's running on avoiding the bottleneck with the 
other vCPUs.

>
>For example, I have a higher priority connection, and some of lower
>connections. How to route the higher one to vq0 group (including tx and
>rx), and route the lower to vq1?

That's still another problem, some kind of QOS and again, this shouldn't 
be done by inventing some kind of logic that the user has to use device 
X instead of device Y because X is higher priority.

We should just expose a sockopt like SO_PRIORITY to the user to decide 
the priority and the driver decides which queue to use according to it 
(e.g. we could have an extra queue only for those at higher priority, 
etc.).

>
>I think it could be easier to be achieved with multi-device feature.

No, I don't think QOS and performance should be solved by adding 
devices, but by adding queues.

More devices are only needed to use addresses differently or because 
virtqueue needs to be consumed in different entities, but again we don't 
have to complicate the user's life at all who has to use one device or 
another for QOS or performance.

That said, I'm not totally against this change; it might make sense to 
attach a virtio-vsock device consumed by the VMM, one consumed by 
vhost-vsock, and one consumed by vhost-user-vsock to the VM. I simply 
would not use performance or QOS to justify this, but your original 
problem might be a justification.

@Michael, @Stefan, any thoughts on this?

Thanks,
Stefano

