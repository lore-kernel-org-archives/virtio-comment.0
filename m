Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB22D14AD0D
	for <virtio-comment@lists.linux.dev>; Wed, 22 Apr 2026 15:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776872352; cv=none; b=QiYyyRvnEj0hwlOzoFOq3DvRg8d954TVaRhFxfZYlY4MiGd2djiCAvIb277bPgioW5+fu1M0JupNLheMcUF29kf0bcao9LcGsgUwFdm24FJbGsKMABrfTcC35+ZkKNgrr2qTjDxIg63bW/otq23jKhkpZj5urHzTAKPsPSUjmvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776872352; c=relaxed/simple;
	bh=ghwTvicbwcpeZVRFyz+jRM2h6z4E5QqZSWWawANuqng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=g1OSTIl45dnY54FH0T9Zy2NXQeqeU+9QW0cnziZOOUDi4Bo0BZ3b8tu4tybKdfnfgk4PWptvL0dDN8b/P5kWAZ3WfsOInHbJ3STLORMnekXkOUpA26nmrd1UMj3omN4uS4OfofiNE67EqUrm0DJ8T2bf0sWXyJktja+NC1OMrGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=W1vdr2Pu; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="W1vdr2Pu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776872350;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9wx/SoDj4p4XMgUxvx4ee52uuyL674aJ+ZhIbx1HV0U=;
	b=W1vdr2Pu4vu6MoZJajDmafBxFU1m/X3d1aKev9Ema2WGK123P0zRQswSVYPjoPbImGFxaP
	3v02qEBhid8Q17IckNG11kBE8DQppyePNI15cstTYuseY2p9Ll78Wn9RGHfBoVdD3bC8S9
	L7U82Y1FanMRD4ShY0LK71p9pTpUWO0=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-371-3p0C43Z3NO6SH8m_VoKvmQ-1; Wed, 22 Apr 2026 11:39:09 -0400
X-MC-Unique: 3p0C43Z3NO6SH8m_VoKvmQ-1
X-Mimecast-MFC-AGG-ID: 3p0C43Z3NO6SH8m_VoKvmQ_1776872348
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35da8eb0553so6444516a91.1
        for <virtio-comment@lists.linux.dev>; Wed, 22 Apr 2026 08:39:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776872347; x=1777477147;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9wx/SoDj4p4XMgUxvx4ee52uuyL674aJ+ZhIbx1HV0U=;
        b=fl9DZHuoW/z3NR5ZD4ubosgdP62mEo49TKZ09rugEwlTbWNTOd0vzrTJNpJr7ZG7AS
         Yd2+UrpEeLbUrDHvNLOukTCn+2yHcxtZTkZ6+Dojfa88CXnA+lGUsAKpX0DcUOD5332A
         XfWont5hM8KeMpElnn14bbJ7QCtHhoPDhH9jUjiVPDed1UlBcACbNo/OwoAXfcOcGJWd
         YJdFYAs2KSVdA0KjxOhk2/da/kYUUikNtbwFqOpu/L1d706AlSRd5J2pznERhFEkx6Jf
         Ix/JfDgMIzepa7TG72XbfzxvzYE6Sv7nn7jWwrRhG+e2L5Y5ph1DQrmGmlBHvqyYrDMS
         AUiA==
X-Gm-Message-State: AOJu0Yzw2j8AJ1rGj93jrDNgv8CwR7u+dBAa/o/Rtdl+ZPrNiOpETnzT
	M5H7dNoMJ0n4jacCooIqcyIa41bwKFaJFF2XH/h7onLHInyxFid7brhagljsSJwGtQuSbbkqd4E
	rsxTu7YcIKo/sU6iyz5giNdjxlTIuyTa2w70pYKUhIgNHhG/y9QGcMNi++gyOXH5J9zVctgpvOM
	/W
X-Gm-Gg: AeBDiesqtgz6pJOG/p6tksCNI+rU3ES+8xtkG+W7NhLRdxVNwzLbfGNDMAZaCi1bx1w
	dcPj34id0d4EXuViFMF3kcU9dHqkwSnrTPBC+6jP3bAv609/5N3TgFnDD0oH4t61rdYz8Syxpjg
	sCH4/ljqSPqeXZ1/m/iOw1pF8Gvxm0vHTLC+Smrv1cROi6TN9eP8TBPS3XIT0ZbdY9+acNUT5Ow
	U1mdF4fklNSEBX9+h0wQgWxP09oLIle9//9KLzOQD4Jfki3Qxrw4yLwv67rOLsKSH+L/iAzHFkw
	8kzHZ+t4pFGCDd7Bdk+jice8x2zyvb/4QYXiXiv+Ao7RwIxo13W3WytBAiek8cbANXBasb34vM9
	9+K8mudJW7XWWcKksIdQ49SAgHw==
X-Received: by 2002:a17:90b:3ec5:b0:35f:b4c1:91ea with SMTP id 98e67ed59e1d1-361402ee818mr17985150a91.13.1776872346979;
        Wed, 22 Apr 2026 08:39:06 -0700 (PDT)
X-Received: by 2002:a17:90b:3ec5:b0:35f:b4c1:91ea with SMTP id 98e67ed59e1d1-361402ee818mr17985131a91.13.1776872346501;
        Wed, 22 Apr 2026 08:39:06 -0700 (PDT)
Received: from fedora ([2a01:e0a:257:8c60:80f1:cdf8:48d0:b0a1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3614189343esm17261762a91.6.2026.04.22.08.39.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 08:39:05 -0700 (PDT)
Date: Wed, 22 Apr 2026 17:38:56 +0200
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: Demi Marie Obenour <demiobenour@gmail.com>
Cc: virtio-comment <virtio-comment@lists.linux.dev>
Subject: Re: Max number of descriptors in a virtio-blk chain
Message-ID: <aejrkBlN3VtoNFwx@fedora>
References: <8a7f186f-f240-4f58-a857-5900a2c0c217@gmail.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <8a7f186f-f240-4f58-a857-5900a2c0c217@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dMYIGXibyINMgBn61TXC5cgoXgpav1CPRrb6R3o5ZCM_1776872348
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

On Wed, Apr 22, 2026 at 04:02:06AM -0400, Demi Marie Obenour wrote:
> Is there a limit to the number of descriptors that a virtio-blk driver
> can use in a request?  In at least Cloud Hypervisor's implementation,

I think this is limited to the number of descriptors that you expose to
the device in the descriptor ring. In addition, I think the index is 16
bits long.

Matias

> and I suspect others, the device must allocate an array of iovecs as
> long as the number of descriptors.
> -- 
> Sincerely,
> Demi Marie Obenour (she/her/hers)





