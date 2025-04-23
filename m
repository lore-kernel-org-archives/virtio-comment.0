Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880301A315C
	for <virtio-comment@lists.linux.dev>; Wed, 23 Apr 2025 18:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745431648; cv=none; b=Z4K+3XZN3kvaOb6v7yCdi81QvOuCeK26nV+y8yjAtLrd6MvwM9C+DB/aUwnOtszMIGqHeHx12SNpLlDBXixstqKdFlPaCHecT8dIfskNwwg88tGJwmOQl2zLDnGKJzANJKAvTZiSWBjvgcBjftB02M2v8RUTTKNAEsx/8czmtfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745431648; c=relaxed/simple;
	bh=mOCS3XlrU2/XDJFSqFU/sS/jT/+h5C9m/PYyLBwPcR4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=C2g5nK7F2zNlLyQHHPv+mNcG/EvriUMVDZzLZMOrkMfx1z82EIFA1ne8zIN8JaJpI1a3XvxfWg0CX0UO6mRyFnhdjeULRprwuEhKZMqlTZZWsyrHva7leUaaQSlKFT5sdrKw/8IpG1L4Y7pqFaeDG7wK7LXKZUQPMfJvHG5aO8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DYWmIY0f; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DYWmIY0f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745431645;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jglduVQtvk+nZ5CtUTy8iH4v24cHRkDWhkmD8cUdpRs=;
	b=DYWmIY0fnDfU76+qEP7JANljT2DJtlYjzXdbd1g3Awp/OlW6jh+IjDMXspeD1Nj2SQ8PiL
	W3RED0CbFWAH51S2fTNptgVIVSStfccSvAFPN2GdxsbjXH/6y8/l49bBPNV73+InsSmC0z
	C8VohwEgz4n60U8icFNXOl2Qc9uwxMU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-483-9MfKZpNONBWsaNwVQCo-JA-1; Wed, 23 Apr 2025 14:07:23 -0400
X-MC-Unique: 9MfKZpNONBWsaNwVQCo-JA-1
X-Mimecast-MFC-AGG-ID: 9MfKZpNONBWsaNwVQCo-JA_1745431643
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43d733063cdso843465e9.0
        for <virtio-comment@lists.linux.dev>; Wed, 23 Apr 2025 11:07:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745431643; x=1746036443;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jglduVQtvk+nZ5CtUTy8iH4v24cHRkDWhkmD8cUdpRs=;
        b=dAG3N95wrDbkaaEPb3UfHFtLB8GmA5vDZQe5soSMo8uKAVpPnD2fDWxv+uG1sJw+E4
         wUsM/DdPF63kICR+ZV7i++TVM/ybYUjsoL/5XQiJqGUTHQmqkWannJ1FZzmLVtFwEKb2
         UmvbjCAmBLmPlSpV05L65ESRQiaOEk8lblMiV448Pu9WrlncR2qTfgViHw4j1O4KJuP2
         UPjKn3xzOSCt4r9fwxn597RhizDFWYbQ8sq8uYDaP2LYC7Dn7dd2zW52YECJ4kI6+KyU
         /9a6vgW03GcSzee95eQKHMBQ2c+xzxAPMtySxgvCh8xknU5tQ44px37q5kFT0VureMVV
         KFDA==
X-Forwarded-Encrypted: i=1; AJvYcCUANfZvlEr/ZtvHtB9nJPGirHB9oJ0DVRU/r7ZGum2zEE+G3hwlCt2ay1zcjz8nxIw9zLyXoHsXl5W8pbastw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyn0GAauJ9H/pH0m5S2WTxeE5Uu794zCApDPbCIbRsP8ogWKOTc
	6+Cgi8izK1H7RyEgfBpGzCw1hO6DS1RudJgzbsJvqaJqb9LiHq5pmO4eC+zf/o7lIR4j+rf0rMj
	t61hHzOiz2crRUnAz1mqieIMzPH2KbBXsxBnsGrf3JK/ocW9Wi0zyN1vQ0aE/Zttg
X-Gm-Gg: ASbGncsezLRet2lsbI6VtmSLxyXWGvzyAQYCemvSI5DeodC/SItMf2knpU/cLxPw/RG
	dgKrXnyGtJzq3XY0OpAiGZChPwKFBfruzw66xNo9xqq9nCeLHOfDe+Fo7QiA+fV98vV5Nm3JTtX
	0AL2H+Ue2+KGFOCAMw9lXbutvqht9mZcCS4fCKt+mNhvW8mL6F5WVsYUgm5yiK8dv0H/ydwN4pb
	Yzps4uFJFa1rVbBwIdd8HOPsp2hvpjPKWebENPtJgLwrKTcWKhsRi2x8lPl80ZLgjb/zqDsdLs/
	6AiQ1Q==
X-Received: by 2002:a05:600c:1e12:b0:43d:fa59:af98 with SMTP id 5b1f17b1804b1-4409a1e3a00mr4220415e9.33.1745431642760;
        Wed, 23 Apr 2025 11:07:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFORwrgVQdrDQ3RE3fpEjnB+b8lTkQY/GoEGmsFI/v3hbMlMh38G+Pzoy9fF1ryVxaZmSSCdQ==
X-Received: by 2002:a05:600c:1e12:b0:43d:fa59:af98 with SMTP id 5b1f17b1804b1-4409a1e3a00mr4220045e9.33.1745431642267;
        Wed, 23 Apr 2025 11:07:22 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-44092db2b0fsm34570375e9.32.2025.04.23.11.07.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 11:07:21 -0700 (PDT)
Date: Wed, 23 Apr 2025 14:07:17 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Daniel Verkamp <dverkamp@chromium.org>
Cc: Paolo Abeni <pabeni@redhat.com>, Parav Pandit <parav@nvidia.com>,
	virtio-comment@lists.linux.dev, cohuck@redhat.com,
	mvaralar@redhat.com, Jason Wang <jasowang@redhat.com>,
	shahafs@nvidia.com, Willem de Bruijn <willemb@google.com>
Subject: Re: [PATCH v1] virtio-net: Fix to avoid using reserved feature bits
Message-ID: <20250423140404-mutt-send-email-mst@kernel.org>
References: <20250126062058.13695-1-parav@nvidia.com>
 <d76dc63e-8d4b-4a90-8765-0148d9c7b885@redhat.com>
 <20250423014257-mutt-send-email-mst@kernel.org>
 <CABVzXA=Uof+TdU6H+eoiOOVjCZwfXfnLV8wAMP87Gz4G92fncA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CABVzXA=Uof+TdU6H+eoiOOVjCZwfXfnLV8wAMP87Gz4G92fncA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: wi5aUbQJxlKXvfdXOQ7AZwUDMwK372gsu0QnWkUCd1w_1745431643
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Apr 23, 2025 at 09:29:11AM -0700, Daniel Verkamp wrote:
> On Tue, Apr 22, 2025 at 10:46 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Tue, Apr 22, 2025 at 07:49:41PM +0200, Paolo Abeni wrote:
> > > On 1/26/25 7:20 AM, Parav Pandit wrote:
> > > > @@ -136,6 +124,18 @@ \subsection{Feature bits}\label{sec:Device Types / Network Device / Feature bits
> > > >  \item[VIRTIO_NET_F_SPEED_DUPLEX(63)] Device reports speed and duplex.
> > > >
> > > >  \item[VIRTIO_NET_F_RSS_CONTEXT(64)] Device supports multiple RSS contexts.
> > > > +
> > > > +\item[VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO (65)] Driver can receive GSO packets
> > > > +  carried by a UDP tunnel.
> > > > +
> > > > +\item[VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_CSUM (66)] Driver handles packets
> > > > +  carried by a UDP tunnel with partial csum for the outer header.
> > > > +
> > > > +\item[VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO (67)] Device can receive GSO packets
> > > > +  carried by a UDP tunnel.
> > > > +
> > > > +\item[VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO_CSUM (68)] Device handles packets
> > > > +  carried by a UDP tunnel with partial csum for the outer header.
> > > >  \end{description}
> > >
> > > I'm finally trying to finalize the implementation and I must admit I
> > > underlooked the implication of using features bit >= 64.
> > >
> > > AFAICS all the virtio drivers in the Linux kernel and qemu assume that
> > > the features can be represented with a single u64.
> > >
> > > Supporting the above requires major reworks in both user-space and
> > > kernel space. At least on the kernel side a similar rework (extending
> > > the _netdev_ features field) has proven to be complex enough to defeat
> > > any implementation attempts for years and in the end it was dismissed in
> > > favor of lower bits reuse.
> > >
> > > I'm wondering if we could reconsider using reserved bits here?
> > >
> > > Thanks!
> > >
> > > Paolo
> >
> > :(
> >
> > It's been there for 2 months now.
> >
> > And if you want to avoid using all bits > 63 then it's even more of
> > a mess, you need to move VIRTIO_NET_F_RSS_CONTEXT which has been
> > there for a year and a half.
> >
> > I'm afraid we'll have to bite the bullet.
> 
> One other issue with bits > 63 is that the vhost-user protocol
> VHOST_USER_GET_FEATURES and VHOST_USER_SET_FEATURES messages use u64
> to represent the features, so vhost-user-net devices can't query or
> enable these features. vhost-user is outside the scope of the virtio
> spec, though, and I think it's reasonable to extend the protocol to
> enable high feature bits rather than avoiding them forever.
> 
> Thanks,
> -- Daniel


Yes you would use VHOST_USER_SET_PROTOCOL_FEATURES to make VHOST_USER_GET_FEATURES
return two u64s, or even a new message returning an array.

