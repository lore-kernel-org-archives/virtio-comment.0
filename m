Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C91A55
	for <virtio-comment@lists.linux.dev>; Mon, 28 Apr 2025 09:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745831599; cv=none; b=R0MsowBR7a6/gTm7Kgz2j9FJpd2pa58+xoBGDnWowRmXHxCxN6DLYnvLfl9huYo4ok/l+QvplILPS4gtVEiranQTubjP4AvWVGl7MUeCe+hP42zBXXcSpTYuPAvIvwabrD+kgEUv2QJ+Og4ZwJfDghSwn/khmjYUNxkSWuS/qf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745831599; c=relaxed/simple;
	bh=70tUhFD0GKVUhF/rGOp/br8JXgycQCTRx3WVURVxC+E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=knkcRSujTe/y2kK8+Mj2eftfeIYxpsR0Qq7fqYrnUh0+OUj6+KjTTtZnjn/AcYLI+ESlOoe7Im3XT/bT7Jy0rf3/nEZWOMTHxlONm0ShGW48mGzYtvkaLqbDwIviSWHw5b4GzjrA14Dlqenkut2JZas9KmtKnyBrdIPTdSLhn2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NY3bqGHR; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NY3bqGHR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745831594;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hRLTPXv/rME2nSBp01MTdriDH/JTTFMip3sS5JB46pc=;
	b=NY3bqGHRWV1WuTA9BxP4lZWxJAnSza3BZh3mInkrrRjfjDqXt3GJd00vABVGr5PdaVnxch
	VunX0EglphTZ2bkZmBOtputRqku76fV7kDIGBL//JKe8eIceY3uz7zd+QlbR5DaSdDkpfR
	sxAuWQiYGLGLrBNCG3HoL6yzMNgSu9w=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-505--SViBLDiPE64tkELMz0d6A-1; Mon, 28 Apr 2025 05:13:11 -0400
X-MC-Unique: -SViBLDiPE64tkELMz0d6A-1
X-Mimecast-MFC-AGG-ID: -SViBLDiPE64tkELMz0d6A_1745831591
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-39d9243b1c2so1325491f8f.2
        for <virtio-comment@lists.linux.dev>; Mon, 28 Apr 2025 02:13:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745831591; x=1746436391;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hRLTPXv/rME2nSBp01MTdriDH/JTTFMip3sS5JB46pc=;
        b=c+euVZuI6Hp0lMRHo5CEXXoC3veGJbfxSGC6hTXaYR92u3zBq7mmHhuygoh2GpffYL
         yAigGDGk5cZMZuTE42hNYrzb2l3yUbx8c2HVQsijxX6LbJgvmKZbEl3sOI29WSA4/Tlu
         yEabSfPs17k3ykwCKUW3z0eHenh1wQEApoQfGUJNxUX/ltlvAescS3TjwR+lBMXeUKbf
         vF+OGCsam7vJgg5OBAs329RQAX574KXh+QIQHCljkFsrjWIiDEbXRO6ji0NIRhC2hgHw
         guYegltKANZMlQuacVya+v8VfvT2LNPZ1bl69vcccg1R4HsoDY/JqI7tBo0BUseZMQ3Y
         R+qw==
X-Forwarded-Encrypted: i=1; AJvYcCUUww3TRb/Xtrj50dVAcpXadqQ6GB3cexb3F+y6x0XgNF6/B8/4eVrMUPq+lF6/1ZJdsjPpRpp038/yafMeQA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzPuqNIMxTBrej233py6dBT8Kw/KENAnxL6Ji4yPdN3UCColJkz
	wy/HP2zbY1jOuR9aBz/YWf3OuSy8adCVEWuB+n834gxTB5hGJQvO72eFHaVbfRFaFiKWqMAwx8H
	M2W5e6JPmaqgm18J995ADk0yHet1pFgAiaSlkLBXXn3e9o6xnH1h9sBAHpRzr9uu3
X-Gm-Gg: ASbGncsaK4CkZHxS7LAYRtRtVVCfZgcXQeEPF7bnX6gfM+KlONshceCsmPmf3IU5481
	AXNy24xJXdeLHoArJtygReeKFgZqlFe8Ye7pmiPXuNTF2MNcDkXf1IDtkYzEUjsD8e+qnOxLa7p
	ewf0ztwj+c6DpB2aQFCN2YXO6b7fHAl5y1YQnC2yWLLnbyzhRpscnAZUf6ypHhfF/NH+n5lhAQZ
	Fkp4T6RV/8n1koXeZ8h0iAspozX7HLc9NZCfLu8eZWkSnL89SZUDKQ13Dnh1rvng7c2xiUpZItt
	A3tV9g==
X-Received: by 2002:a05:6000:1f03:b0:3a0:7a8f:db22 with SMTP id ffacd0b85a97d-3a07aa6b57emr4526580f8f.24.1745831590706;
        Mon, 28 Apr 2025 02:13:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2cj5IL6e94xC9qZltQihjK5pI2XVx7g5YLcrc0WZrEU2XoiHRTQx6mW/Iu2Y25vHE4XJG4g==
X-Received: by 2002:a05:6000:1f03:b0:3a0:7a8f:db22 with SMTP id ffacd0b85a97d-3a07aa6b57emr4526561f8f.24.1745831590287;
        Mon, 28 Apr 2025 02:13:10 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073c8cab5sm10658194f8f.10.2025.04.28.02.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 02:13:09 -0700 (PDT)
Date: Mon, 28 Apr 2025 05:13:07 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Paolo Abeni <pabeni@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>, virtio-comment@lists.linux.dev,
	cohuck@redhat.com, mvaralar@redhat.com, shahafs@nvidia.com,
	Willem de Bruijn <willemb@google.com>,
	Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH v1] virtio-net: Fix to avoid using reserved feature bits
Message-ID: <20250428045124-mutt-send-email-mst@kernel.org>
References: <20250126062058.13695-1-parav@nvidia.com>
 <d76dc63e-8d4b-4a90-8765-0148d9c7b885@redhat.com>
 <20250423014257-mutt-send-email-mst@kernel.org>
 <20751ef1-b8e6-4e67-94e5-e8736c3a943b@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20751ef1-b8e6-4e67-94e5-e8736c3a943b@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qnTkd6LVT9kmumxoFvMwEn_BKE-DlGb8NTlT-X7BAZk_1745831591
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 23, 2025 at 06:05:43PM +0200, Paolo Abeni wrote:
> On 4/23/25 7:46 AM, Michael S. Tsirkin wrote:
> > On Tue, Apr 22, 2025 at 07:49:41PM +0200, Paolo Abeni wrote:
> >> On 1/26/25 7:20 AM, Parav Pandit wrote:
> >>> @@ -136,6 +124,18 @@ \subsection{Feature bits}\label{sec:Device Types / Network Device / Feature bits
> >>>  \item[VIRTIO_NET_F_SPEED_DUPLEX(63)] Device reports speed and duplex.
> >>>  
> >>>  \item[VIRTIO_NET_F_RSS_CONTEXT(64)] Device supports multiple RSS contexts.
> >>> +
> >>> +\item[VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO (65)] Driver can receive GSO packets
> >>> +  carried by a UDP tunnel.
> >>> +
> >>> +\item[VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_CSUM (66)] Driver handles packets
> >>> +  carried by a UDP tunnel with partial csum for the outer header.
> >>> +
> >>> +\item[VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO (67)] Device can receive GSO packets
> >>> +  carried by a UDP tunnel.
> >>> +
> >>> +\item[VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO_CSUM (68)] Device handles packets
> >>> +  carried by a UDP tunnel with partial csum for the outer header.
> >>>  \end{description}
> >>
> >> I'm finally trying to finalize the implementation and I must admit I
> >> underlooked the implication of using features bit >= 64.
> >>
> >> AFAICS all the virtio drivers in the Linux kernel and qemu assume that
> >> the features can be represented with a single u64.
> >>
> >> Supporting the above requires major reworks in both user-space and
> >> kernel space. At least on the kernel side a similar rework (extending
> >> the _netdev_ features field) has proven to be complex enough to defeat
> >> any implementation attempts for years and in the end it was dismissed in
> >> favor of lower bits reuse.
> >>
> >> I'm wondering if we could reconsider using reserved bits here?
> >>
> >> Thanks!
> >>
> >> Paolo
> > 
> > :(
> > 
> > It's been there for 2 months now.
> 
> Unfortunately I was not able to get back earlier.
> 
> > And if you want to avoid using all bits > 63 then it's even more of
> > a mess, you need to move VIRTIO_NET_F_RSS_CONTEXT which has been
> > there for a year and a half.
> 
> I started the 'support [arbitrary] larger features bitmap' exercise and
> I think there is a difference between the VIRTIO_NET_F_RSS_CONTEXT bit
> and UDP_TUNNEL_GSO related ones: AFAICS the latter go through the
> VIRTIO_NET_CTRL_GUEST_OFFLOADS_SET command, which in turn limit the
> offload to 64 bit:
> 
> """
> The class VIRTIO_NET_CTRL_GUEST_OFFLOADS has one command:
> VIRTIO_NET_CTRL_GUEST_OFFLOADS_SET applies the new offloads configuration.
> 
> le64 value passed as command data is a bitmask, bits set define
> offloads to be enabled, bits cleared - offloads to be disabled.
> """
> 
> while I don't see similar constraints for the  VIRTIO_NET_F_RSS_CONTEXT
> feature.
> 
> The current specification is inconsistent, as it does not allow enabling
> the UDP_TUNNEL guest offloads.

Through the command, yes.


> AFAICS we have to either add the specification for another
> VIRTIO_NET_CTRL_GUEST_OFFLOADS command to allow passing the additional
> data

Given features are negotiated first, we can just say the value
can be 64 or 128 bits? In any case, I agree it's buggy as defined.

> or reconsider using reserved bits just for the UDP_TUNNEL offload
> (I'm sorry for reiterating on this, it still looks like a very tempting
> path).
> 
> Thanks,
> 
> Paolo

Parav what's your take on this one?

-- 
MST

