Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D38E24E005
	for <virtio-comment@lists.linux.dev>; Wed, 26 Feb 2025 10:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740566685; cv=none; b=G1/PvVNXGZRKXRx7IR4aLtkBL4oXmFPfpVRtwfordBpO0yxSDOQYSsXRPxSUSMUx0P0Glj627Zz3Dci+FyA3a8IOjuCdBQqt27MHFSCROMGf8u8q33bX3XxdHFo5jb14/z0SGOB+YtvfhNyn5BBbTMHcntG4VnV3jz5XP0o40Mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740566685; c=relaxed/simple;
	bh=QPlAGSCFlX4gllPUjmFg73E6iZxxpNCnc+wc+zHZu4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=UsHOckX1wf6q7EVou6nkc5ETHVugzF9lokqjYZxtafntIZHPjeE29hByRclch2ph3Kb/vs9sMPm9M3I/pLALQSOvqThPVQoYOnThyXzlorZrXp1Gn7ZFgiy6qPjhA6yrBkRYRtzrHnRuLvKNE2L37dZklZauyuaYTdWK1vUYxKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AVadgV/c; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AVadgV/c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740566682;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ShdtRWzgdeNrmru38Ziy/nVn11fihYRN+GwNWgiWQac=;
	b=AVadgV/c8iK2LJowIkXQhoFVVn164LRg4ptIfkRD6uUe2JQnNjRlMR/B9TF6Wcj9bBiP6d
	2HrO+rNnk/fuPSEYTMdHjZv2p+d+c6fdFPs86RyPThCaLLMLIaRBCiV4S5hpWUUuKuk37p
	PUpFQlNx67Tx5ebz89dGZ31oVD++sVM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-595-WszGcj17PMCJBU8PGgXbcA-1; Wed, 26 Feb 2025 05:44:40 -0500
X-MC-Unique: WszGcj17PMCJBU8PGgXbcA-1
X-Mimecast-MFC-AGG-ID: WszGcj17PMCJBU8PGgXbcA_1740566680
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4399304b329so31363795e9.3
        for <virtio-comment@lists.linux.dev>; Wed, 26 Feb 2025 02:44:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740566680; x=1741171480;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ShdtRWzgdeNrmru38Ziy/nVn11fihYRN+GwNWgiWQac=;
        b=K82lo+K/cCfIHveC1KaHhInlxMGeW5H2yvrxxpvHe/Ut3HLXu3muur62N5SOGdeA02
         p/y1OWRa0938NoaJG7C1bV2Vgu7Q1441FJ/zmVUSyG7gPTvUgf1GLYGFbR4FTeS0MR/N
         4qwvRFPjqFZ8MjNbn/8BeG7RHvWHsxBYWOHFgugMq6TF326RJ9etkisRnnUADUt8OSXb
         dbJ51yt6RpHaSyO6N4oH/zcfam5dLyf4OrZHIVSKz237vwZOd9qx1B/EQnGIP5sVM50v
         7dCnoYh0wUw3zDUutImPX/j+YpS3Kr+cm7sSnBUH7+DVQ3b459/rkSvg0vJ97nmMNsCt
         ca1w==
X-Gm-Message-State: AOJu0Yzen9+x/pLeINXKrJT6l584eJigsK2uHgENOv7Dpy22YYYHK80R
	dEyUHGxl3F31gH9EqTmUykC4722Ftux4Y9i/k6qHDFrTeYpfek1MmRrn8Gl/b2YjZLuE6tsl60Y
	5jous0JB8f4j3r7LlFB1o0m/uSAzwzeFTNtD0fwLUxVAlfVXoYmgR5sQzmUuZVoqW
X-Gm-Gg: ASbGnctr+z+wRdNIia6FiYmD2xPIdKXJj+h+8eeCw3Ot09WIcFBlNyM1wPVGmGWb5FN
	QPl0YmPfK9Ar6kEFjht3F11zdZcE+REaBm5RNNH9tTdclJ20Q2Zw1WTEi0BMoHU1n0qIYgo1bSR
	H8rBa4MOv7xeHF7S9FSVCLN1tZH4kn8h4mpkvUzemdEUbLV0oCy0RPPjzs6d8iXWWMWnuBP+4Jr
	jPrYlyjAIs/qgbb2+inC9gshcrXRhEQ+hzpZvQlfi5C4HSLzEt5p/i21bIHVvWZSq+Kz2ckUWmQ
	9j8IaeLDqQ==
X-Received: by 2002:a05:600c:3148:b0:439:88bb:d024 with SMTP id 5b1f17b1804b1-43ab902aa93mr20509655e9.25.1740566679766;
        Wed, 26 Feb 2025 02:44:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEimf8yDb8xevWGE9IKHdwDS+cwBk3iZjGLqci8FS8uTYoe63G6jHHN16DSmAPQLCilekpgqw==
X-Received: by 2002:a05:600c:3148:b0:439:88bb:d024 with SMTP id 5b1f17b1804b1-43ab902aa93mr20509515e9.25.1740566679424;
        Wed, 26 Feb 2025 02:44:39 -0800 (PST)
Received: from fedora ([2a01:e0a:257:8c60:80f1:cdf8:48d0:b0a1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390cd8fc31fsm5064414f8f.87.2025.02.26.02.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 02:44:39 -0800 (PST)
Date: Wed, 26 Feb 2025 11:44:37 +0100
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: Julia Zhang <julia.zhang@amd.com>
Cc: virtio-comment@lists.linux.dev, "Michael S . Tsirkin" <mst@redhat.com>,
	Chen Jiqian <Jiqian.Chen@amd.com>,
	Zhu Lingshan <lingshan.zhu@amd.com>, Huang Rui <ray.huang@amd.com>
Subject: Re: [PATCH v2 1/1] virtio-gpu: get p2pdma distance
Message-ID: <Z77wlXhOk+8fZocC@fedora>
References: <20250226092753.1082042-1-julia.zhang@amd.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250226092753.1082042-1-julia.zhang@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: HzwKJrYQdr-YnF7JAsNUGNd6hAYl33t6r_OHK-TBap4_1740566680
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 26, 2025 at 05:27:54PM +0800, Julia Zhang wrote:
> PCI peer-to-peer DMA transaction may be used in guest for some scenes.
> For example, dGPU prime feature will let virtio-iGPU access to
> passthrough dGPU buffer.
> 
> To support P2P DMA transaction in guest, virtio-gpu needs to check the
> compatibility which is represented by p2pdma_distance. This defines a
> command VIRTIO_GPU_CMD_P2PDMA_DISTANCE to allow guest send virtual pci
> notation of two devices to host and get host physical p2pdma_distance
> of these two PCI devices.
> 
> Fixes:https://github.com/oasis-tcs/virtio-spec/issues/217
> Signed-off-by: Julia Zhang <julia.zhang@amd.com>
> Reviewed-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
> ---
> Hi all,
> 
> We are trying to implement dGPU prime feature in guest which will let
> virtio-iGPU read rendered data of passthrough dGPU. Before that, virtio gpu
> driver needs to get p2pdma_distance to check if P2P DMA transaction is
> possible or not.
> 
> To implement getting p2pdma_distance, QEMU needs to handle the command from
> guest with virtual pci notations of two PCI devices and send it to host
> kernel and return host physical distance back to guest.
> 
> So this defines the new command follow the suggestion in https:
> //lore.kernel.org/all/20241207105537.542441-4-julia.zhang@amd.com/
> 
> changes from v1:
>  - add issue link to commit msg
> 
> Regards,
> Julia
> ---

I think what is missing is to explicitly request a vote as is explained
in 2) at
https://github.com/oasis-tcs/virtio-spec/blob/master/README.md#use-of-github-issues.

Thanks, Matias

