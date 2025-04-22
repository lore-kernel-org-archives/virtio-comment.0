Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E44A614C5B0
	for <virtio-comment@lists.linux.dev>; Tue, 22 Apr 2025 17:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745344189; cv=none; b=I3lKerS/hx21XlW1ZPyxKEsIF6RW1h3sGR+p5mtiRa3Z2Fdp0cNqacFYEojqAqIyL9MRVS6rPAFA9v196R/0/ZHonLjO2tSMryV4Eso7VuU6+lZVWvpWW617qWRjex9LnmKuFBbzDe0m2alW+riMmS2KRT+yCDNIUm0L/o2yiXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745344189; c=relaxed/simple;
	bh=r9HX3Ad6yLslyt94nCqKMM3RWS/jzvfEfzYWZIllnHc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DK0EGyDpWQ8U2JTd/vfSW8mMMAszAMnCyU/fhH/KSPtapACki82jw/TnvgONEtnRDPezmjieFYq2DFLvQj1QzyWE+w+KeLOt07d0mZL5wFA7YmlolVL8LirgvUPHzn9pF/0oPdUw2qnw8Z8E2fdZB9Utlt6fiNNXuI+sm+429pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Eyit2AnJ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Eyit2AnJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745344186;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LGfNZsicivYKDZ6L38vKN8IkI+qqKzuD3SccRaXINLw=;
	b=Eyit2AnJx0b4XTglh/SD1zAErXYEpGqKjsYnSXoLDHo8u3D3dNEyecq+d05xXEH+qI+lN0
	znnj2zoGb54WjvLT2odlVbmX8mfwdlYNNMBZ3lHN0UEqin8enV5G6bZDF0IhwQzjT3geir
	nOVKBWXPxN3A0YYCOLEv6mPC1mZidIQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-299-j0wWhjHPMEGVzb5l8cxcYw-1; Tue, 22 Apr 2025 13:49:45 -0400
X-MC-Unique: j0wWhjHPMEGVzb5l8cxcYw-1
X-Mimecast-MFC-AGG-ID: j0wWhjHPMEGVzb5l8cxcYw_1745344184
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43d0830c3f7so41180895e9.2
        for <virtio-comment@lists.linux.dev>; Tue, 22 Apr 2025 10:49:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745344184; x=1745948984;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LGfNZsicivYKDZ6L38vKN8IkI+qqKzuD3SccRaXINLw=;
        b=Bt4cSBnS1FedynQPtnBF2N5Agih6wM9QrAECFth6WEJ0Mtpnh2OKxxqUu8wfQvF+Hz
         CmklJL7tnd2XuvjINrFdSmif9ogQF+kBHMelXRaDQjtKkDqMq03n6U8XqFhLBVqgEngG
         cm+SzyrzdrCUQD0/I3IpynHc/Ms/vzr9Dd5cLJ8aye5yfdEdujehJBdlKHgl1e14veIo
         JhUKExhvaolvL9Nm2LtAcjY9LoxviuNq6miRy7Gm1l/rL680hWbYgmwZ71DMEyhNPsuF
         mPbUBASQys9RrprklryxwzL/r48vUmnqEaz/bSJJfTdgRSLiMiBV2YuskCPUZNx3BQ7U
         lwKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZPTzu/nKfQKnOfi2f2qQ+0H6ScksLbQEleNcZxBokL1vLrLqMYr0Hc6P4uwPyeP6PiOErMKUKaCDv/W45aw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxvcX+4SHHhbHZ6wTx6jei1ACTk51NJLlIeVbH3ObGfIY1FLAfE
	oN7LzfJqJrC6HVBYtXC59zDOu/HgXYPrbuBdvzsYDfV7JWxvq37vVWv7bAiGnVlkWrAaXxs1as4
	gc/Y6LS89V98UAQr3WRvNoVhaIIifVLyTJhNsNpA/2o3sKgZYUO+JUouG4FiDf6KF
X-Gm-Gg: ASbGncs5AKgWnkO3drnLdj1al28louJkVnmZXPccPhiJVo83TqewNQm/iHOz7++zj+X
	FgsPzPp0iBdvJte3wqxPJG1Spe4uqD7uVMLPL2UngYlWzcAlOK78EkBbutnxlAz991izb0/hpkL
	mk0UYugUFoeC54HGx7FqK1/ydB9ROtCzB3BfOCui5VczQV66nbxTSO8iSk8w2V9/fK9zjs/N+F8
	EyPdunfv1EjX+t+Y/p9Gw9gaEaH6eiCdcNle/0RvTaj+xNpedk+L31EG6uzsuK13FlKQqUZn6OR
	JJdVlReDRW/0sXGoYtKtsmzcNvkP4TEbVdJh
X-Received: by 2002:a05:600c:cc4:b0:440:6a1a:d89f with SMTP id 5b1f17b1804b1-4406ab6c569mr161496265e9.4.1745344184327;
        Tue, 22 Apr 2025 10:49:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFlQxeorbQXpvdS/rs8cpufyUcvVjgxsJn2iTr4S7fdqRWYyjy4yAkWgG4Ag9MvNN7WrXF1Mg==
X-Received: by 2002:a05:600c:cc4:b0:440:6a1a:d89f with SMTP id 5b1f17b1804b1-4406ab6c569mr161496135e9.4.1745344183950;
        Tue, 22 Apr 2025 10:49:43 -0700 (PDT)
Received: from [192.168.88.253] (146-241-86-8.dyn.eolo.it. [146.241.86.8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406d5a9e50sm185205715e9.6.2025.04.22.10.49.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 10:49:43 -0700 (PDT)
Message-ID: <d76dc63e-8d4b-4a90-8765-0148d9c7b885@redhat.com>
Date: Tue, 22 Apr 2025 19:49:41 +0200
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] virtio-net: Fix to avoid using reserved feature bits
To: Parav Pandit <parav@nvidia.com>, virtio-comment@lists.linux.dev,
 mst@redhat.com, cohuck@redhat.com, mvaralar@redhat.com,
 Jason Wang <jasowang@redhat.com>
Cc: shahafs@nvidia.com, Willem de Bruijn <willemb@google.com>
References: <20250126062058.13695-1-parav@nvidia.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250126062058.13695-1-parav@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: StzdBghQ3VrkmeaeKsrd6jUvQpknZr0lId81iasWKz8_1745344184
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/26/25 7:20 AM, Parav Pandit wrote:
> @@ -136,6 +124,18 @@ \subsection{Feature bits}\label{sec:Device Types / Network Device / Feature bits
>  \item[VIRTIO_NET_F_SPEED_DUPLEX(63)] Device reports speed and duplex.
>  
>  \item[VIRTIO_NET_F_RSS_CONTEXT(64)] Device supports multiple RSS contexts.
> +
> +\item[VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO (65)] Driver can receive GSO packets
> +  carried by a UDP tunnel.
> +
> +\item[VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_CSUM (66)] Driver handles packets
> +  carried by a UDP tunnel with partial csum for the outer header.
> +
> +\item[VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO (67)] Device can receive GSO packets
> +  carried by a UDP tunnel.
> +
> +\item[VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO_CSUM (68)] Device handles packets
> +  carried by a UDP tunnel with partial csum for the outer header.
>  \end{description}

I'm finally trying to finalize the implementation and I must admit I
underlooked the implication of using features bit >= 64.

AFAICS all the virtio drivers in the Linux kernel and qemu assume that
the features can be represented with a single u64.

Supporting the above requires major reworks in both user-space and
kernel space. At least on the kernel side a similar rework (extending
the _netdev_ features field) has proven to be complex enough to defeat
any implementation attempts for years and in the end it was dismissed in
favor of lower bits reuse.

I'm wondering if we could reconsider using reserved bits here?

Thanks!

Paolo

