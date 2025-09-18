Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F7F9248F75
	for <virtio-comment@lists.linux.dev>; Thu, 18 Sep 2025 17:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758215860; cv=none; b=AKLNBSxyQ6tZ6VQNMvupAKHrUN97sDK1GSNCUH6k3ZDTcctu+ZIaNPHxm2Yfa/UM3eCYm4O7/gynP5kJDTGjpJks4Do1GwnbAhdWs+XVNVkZvUfcbW1qPgVhaS3y9oQ4FQKENFjIVz7VWYksRQAI+l6SdCg9iJ3ZQIdVXR7BC78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758215860; c=relaxed/simple;
	bh=d4+ZaYTy3IyZdJjmTQwfHnWSzzpMhRNOn84QZwKXEc4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=SVK3WCdIJYJm/YGka5R8mRtN9763zhRF+7ZdqoJ/J6CpcuDtVYSVx63A4eJmJebAXvnt9DD08dwoB/L2vsww4Rm4kTDP9vPwgwpg5Ei8lRD9EzO5kXAgTaZun8fhbbQjHDZErYwlqqZb3LWrwZrerozhwj3pJL2mIwTun2Z/ypA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QspbkVxI; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QspbkVxI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758215857;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VxjarIaxPfZLXXNVHDmu9ey0qZJHKz+lQfD7zu0DV6M=;
	b=QspbkVxIBn18+Xc7vpd3U/2eZmDzEgtMpv/e2MpUbMppBsf7+BnipPmZpPoopRk3UHpElu
	0NiZOrF1luWlO2Nqc5qYjbJaHlKeMf5FcV0IZEYEdH863YVEAgFCJ0TcEQBQi66DL24Vuo
	YxXYmI+oGaNT7bfBrgRaXsbUSqAcOVE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-99-zKorUZx8OSy5kPEivGS-Lg-1; Thu, 18 Sep 2025 13:17:35 -0400
X-MC-Unique: zKorUZx8OSy5kPEivGS-Lg-1
X-Mimecast-MFC-AGG-ID: zKorUZx8OSy5kPEivGS-Lg_1758215855
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-45f2b9b99f0so7490455e9.1
        for <virtio-comment@lists.linux.dev>; Thu, 18 Sep 2025 10:17:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758215854; x=1758820654;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VxjarIaxPfZLXXNVHDmu9ey0qZJHKz+lQfD7zu0DV6M=;
        b=ax7RXkyPWUB5QmKRUoD/eYZeINm9ekeXMdVu8rGI0BcBuGatjfsxrlJbIH4Xypa4bU
         hLswEsR0g4PgB7Nu2PvChGtSJke4wCcXyXJEGdtYlnnkYhdHiBXzDAuQEShryWDvXHZh
         0HxV6460Ox2GiFT6fHT6EQz0eNYXOlE3gRY4HaNzziZiK2tzDWhTkgy5GbMXc5hfJzNH
         AsWPE2lCk7QZhlv5bCnarlUkZAWPeU0O0iE9Dn2ugMyYpdSolCkKnNdjeDTPdDGYrV2i
         TfI5d6d6G2GrZ9PW6SS58F+qLXgJNGn6rjkwr6YM1hW6ZU3kBkQkwN3KvhfPb/fY01Cc
         TvZw==
X-Gm-Message-State: AOJu0YziwE3fRCwuSJXLdpP6isQzPiai1PFaP53nFNN8eCjOMbisN0Bt
	pbpnUxkp1KzzvEI0gCnTkb58mF7HsLLNugETJafzTJ3nyT5qV4JKw5NEfZZT7GnWfKsoMzHf6iA
	cpd2yh4snoQEVQ0WGLMCDMTxccYuMooyJugXZk6OXJ6NDnY332ZaYgyIJanr6Fjcd0HAP
X-Gm-Gg: ASbGncsV2+DTaNAaUdTSmIIK91xxKsyoGrNCuO4LFiCc5rTysdLamEpBrBzHGTTNb1j
	k341oghAY+5tde1fB0vaJ0qlUGTt6gDcyYDfYM16//7EK2hlHK8fh7choPAzCCjsn1+4+Rshaml
	ZSgI+NJSzQ75LuxKNkI5r7LJ3R/1TyVzyxptOW+kBQXbKtowwOfRhOG+ZKUd+QNP5U7UXw/b4RX
	l3M0dMzhO7LPgyPYhqCc2w4kEjjy2ijo+CxbQt36gmFzuCDhEdEVDHxOr9yCIGiSMG8R4am+XyP
	GgLYlQHrinsbLBlezwMtXiwZnSUgWVW56A==
X-Received: by 2002:a05:600c:43c5:b0:45d:d295:fddc with SMTP id 5b1f17b1804b1-464f7027ee6mr27091765e9.4.1758215854620;
        Thu, 18 Sep 2025 10:17:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFweR2ub/lRhcEEuJVMb27fD/EhTL17/22pD90faYqsQhRGaCRAgp5zZ6yO40koIW2NA1X9Sg==
X-Received: by 2002:a05:600c:43c5:b0:45d:d295:fddc with SMTP id 5b1f17b1804b1-464f7027ee6mr27091605e9.4.1758215854185;
        Thu, 18 Sep 2025 10:17:34 -0700 (PDT)
Received: from fedora ([2a01:e0a:257:8c60:80f1:cdf8:48d0:b0a1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45f3262f6aesm61866825e9.8.2025.09.18.10.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 10:17:33 -0700 (PDT)
Date: Thu, 18 Sep 2025 19:17:31 +0200
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtio-comment@lists.linux.dev, Filip Hejsek <filip.hejsek@gmail.com>,
	Maximilian Immanuel Brandtner <maxbr@linux.ibm.com>
Subject: Re: [PATCH] virtio_console: fix order of fields cols and rows
Message-ID: <aMw+q+rMKHxZqCsI@fedora>
References: <7b939d85ec0b532bae4c16bb927edddcf663bb48.1758212319.git.mst@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <7b939d85ec0b532bae4c16bb927edddcf663bb48.1758212319.git.mst@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5Hz_v-un22lmvOy7AYIZLES6v2T3Au8ZtWBv80lraFo_1758215855
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 18, 2025 at 12:18:47PM -0400, Michael S. Tsirkin wrote:
> Filip Hejsek pointed out the following:
> 
> The problem is that for a long time, the
> Linux kernel used a different field order from what was specified in the
> virtio spec. The kernel implementation was apparently merged around 2010,
> while the virtio spec came in 2014, so when a previous version of this
> patch series was being discussed here on the qemu-devel mailing list in
> 2020, it was decided that QEMU should match the Linux implementation,
> and ideally, the virtio spec should be changed.
> 
> There are about 15 years' worth
> of kernel versions with the swapped field order, including the kernel
> currently shipped in Debian stable. The effects of the swapped dimensions
> can sometimes be quite annoying - e.g. if you have a terminal with
> 24 rows, this will be interpreted as 24 columns, and your shell may limit
> line editing to this small space, most of which will be taken by your
> prompt.
> 
> While commit 5326ab737a47278dbd16ed3ee7380b26c7056ddd in Linux made it
> match the spec, no one seems to have implemented it yet host side. It
> seems better to just drop the change (it was only in 2 releases so far),
> going back to the status quo.
> 
> Change the spec to match.
> 
> Reported-by: Filip Hejsek <filip.hejsek@gmail.com>
> Cc: "Maximilian Immanuel Brandtner" <maxbr@linux.ibm.com>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>  device-types/console/description.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>

