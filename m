Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F82928DF09
	for <virtio-comment@lists.linux.dev>; Mon, 28 Apr 2025 17:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745860702; cv=none; b=IwJWOS2Q5jbSg794WUWpfWqX/Ai2L9/Cr4zBOHfEnMf6ZwcXQYUc7qMVYr1mzwOW3uQsyjvbnnCLsGkP9QyPCXtiNXFEp2OlIz1NZYx8yUH8RpmPnq4BBAoWXrPISoqHK2lYyuhHEkyCmvMz385IUK5NtEmxEZTbgRhKwSIudH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745860702; c=relaxed/simple;
	bh=jyGIR02UhebsuHlTPgdy5Me3nn15u4fVwBeTwQTc2m8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=GqhTMACi4qEoQAT/eU9wdWE23ZVSTsVWXlMksZAMpZD2fEh0E/A639ZU3JBne5llDLOY6m9C+FHKJ9zwSIz1hobgT4ZyRM+FdOuMMovODoArpOrkPF47Ta8aFtpMCVE3hPBnqIlNvBR1tvW9F1SoWoW7Q9E3Y2GYI5jaqekmmVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fGn+Ks2k; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fGn+Ks2k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745860696;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RvFMSNbOOxLLzosWRQOzgS5Hxo80PMrxLi9UO0cd13g=;
	b=fGn+Ks2koTgx5VE7DD/ms/uf6HQD70LygeNVj+U/sazpzdNEcuoLabvpcuQMDuS9xV1n16
	/oxyeOZnKpvOwULGZ73OAuTmiVLGJsjN+N3VQ2lGveTIG8Ft12DHYGt8IbcdtpZnY5sd0H
	57DDFoCVuH9At/uvZfuMx/wI8uzlyoo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-250-NsFcB5gxO-O5Bs_8bzHXag-1; Mon, 28 Apr 2025 13:18:15 -0400
X-MC-Unique: NsFcB5gxO-O5Bs_8bzHXag-1
X-Mimecast-MFC-AGG-ID: NsFcB5gxO-O5Bs_8bzHXag_1745860694
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43eea5a5d80so25200485e9.1
        for <virtio-comment@lists.linux.dev>; Mon, 28 Apr 2025 10:18:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745860694; x=1746465494;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RvFMSNbOOxLLzosWRQOzgS5Hxo80PMrxLi9UO0cd13g=;
        b=q2+Iu8PsDNCMwOpPsW6p5lxkrUI1sqmNlET3uGFuK3ONIxtkTxPzNiFiFkfMCGtaHA
         oEhX1gH7Ie8+sax8uG+MYtkN+dBFvkl0uSmgImVbDyaui051ZExLx/tEyzScyjOxmiEq
         uUpSs414alN9O2MxWCSDa363QRpbYzQyp0GiC+yAVX5dvI6/3gqYWgT6fdotyPefXv3r
         Q5khHCpb2GrZS4ACbsRMRu+tGfyXgNiQjo5uNvEFuVdOu9AVAQ4a9RUf3m7aKNJnF8YU
         w+u8BgW8vs/Necwz7vBGpvj8cBzv4cU7HJ8FUjhdCE+J7NuSVBgga28O1Z8E9Rn1efki
         i2gA==
X-Forwarded-Encrypted: i=1; AJvYcCUo8oPm4I8LqeU/Okrjz8gIFDfUzpH8AohEygRBnhDIA2/cC5YFNhoIDmeVKqmkr3jLYB4GgpgdttQQrjxQAA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwJDhGwHp1NMqEcgzVWKsxwkF83cN28H/OD1M1PKZinOCRMc/i+
	7bt6FqO3aZ1ZgGZTGT6/jtWpuVYWbUn2FlxxfxKZccFFXKNns9l48d/E65UX0sylRwn/N8jjdAh
	gIuk3mE9ZT7A/pOQycyOlf+Sglijmp8dDPzQtbhx7FahQ0pRcAkPvFXudqF5o0COg
X-Gm-Gg: ASbGncsUkKIDktQLx96PT6idQAJNWZlXdDQN6cSfYiaf0fF5m53gUvr7N+yFYe8zFF3
	0ozoBNf7x/AWp7c9AGbXSfYwuC4PJjLybR3dqzEuzgDS+0nbaZJnMJyq1CQZfbQVw8rFNJ8rn/t
	5Hxpb3vAZ4fmP75YJ8IK18UVYx8M8Dm3CyZx6gylVnjW7FFJXxbWNEjJdnQ9CD6Q2Ey/jPcNsYI
	W1sfNhWdGUed7k7IOZw4kxDb8lLFxGlj23Xg6+N1GO32YVc/p/h/GdD4xvLNGFYx2aLPTscQhNa
	6oIkmA==
X-Received: by 2002:a05:600c:1e04:b0:43c:eeee:b70a with SMTP id 5b1f17b1804b1-440ab846cecmr79126665e9.22.1745860693814;
        Mon, 28 Apr 2025 10:18:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGaXFyr+uaE76NFeIrZmz2WWKsO/WEi07xMs0LlT9qNoxXR1uszhPtM6yCtkJ16BKytz3jhw==
X-Received: by 2002:a05:600c:1e04:b0:43c:eeee:b70a with SMTP id 5b1f17b1804b1-440ab846cecmr79126315e9.22.1745860693240;
        Mon, 28 Apr 2025 10:18:13 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a53870f9sm130156965e9.33.2025.04.28.10.18.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 10:18:12 -0700 (PDT)
Date: Mon, 28 Apr 2025 13:18:10 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Paolo Abeni <pabeni@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>, virtio-comment@lists.linux.dev,
	cohuck@redhat.com, mvaralar@redhat.com, shahafs@nvidia.com,
	Willem de Bruijn <willemb@google.com>,
	Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH v1] virtio-net: Fix to avoid using reserved feature bits
Message-ID: <20250428131402-mutt-send-email-mst@kernel.org>
References: <20250126062058.13695-1-parav@nvidia.com>
 <d76dc63e-8d4b-4a90-8765-0148d9c7b885@redhat.com>
 <20250423014257-mutt-send-email-mst@kernel.org>
 <20751ef1-b8e6-4e67-94e5-e8736c3a943b@redhat.com>
 <20250428045124-mutt-send-email-mst@kernel.org>
 <f2bf47cf-e789-4f41-aa6a-68adfd887504@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <f2bf47cf-e789-4f41-aa6a-68adfd887504@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: AmpNgNeCgd9VZtEmol6eqb4rSjAYBzb1wj179mf4tfU_1745860694
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 28, 2025 at 07:07:12PM +0200, Paolo Abeni wrote:
> Hi,
> 
> I'll try to consolidate here the current discussion.
> 
> My understanding is that the we are on same WRT that there is a problem
> with the current spec.
> 
> On 4/28/25 11:13 AM, Michael S. Tsirkin wrote:
> > Given features are negotiated first, we can just say the value
> > can be 64 or 128 bits? In any case, I agree it's buggy as defined.
> 
> Do you mean that the 'offload' field should be 64 or 128 bits long
> depending on the negotiated features?
> 
> Could that be problematic with VM migrations and/or backward
> compatibility? I can't see a specific faulty scenario, but the 'implied'
> field size sounds fragile to me.
> 
> /P

My idea is to say any number of le64 values, and any bits excluded
must be 0.

So looking at qemu for example, if you send it more than 64 bit
it will just ignore the top 64 bit. But it does not currently
support any low bits, so it's fine.

Again any change will break compat technicall but then
any change to reserved bits does, too.


-- 
MST

