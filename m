Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A424163C8
	for <virtio-comment@lists.linux.dev>; Sun, 14 Jul 2024 15:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720972268; cv=none; b=nUTJIqeYvEZgfhYYW5WmxSIZIBxvtl/kFlEUdxeFRcASspWRGl0A7bA/i7OEKAQJAsaA8DBM0+7swq8ID3puwjeAybHqVtriLeYEbQIpQVYB0iFwP0gJWsCYTDMh8BK7ZOn0IHRaQvvEXkcqhNT6AI4TJNPL+vd+NLWrubPAKIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720972268; c=relaxed/simple;
	bh=R70g1wyBzbsIOitm1f+ZYBhekDb3Ud7OX7TgdYQwbK0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=A5bUQAsr+XF/6rqJbz5r0+xYGpyhQOaMyZ5pDOlUtP0d/V/k67Grt261+DqOcchRE2ZT2GhrzP3mUsoC8LXuvGGeHiqgK6/xHPwev5kjC+yIRh9ycMeg80zDsS+bT5/P5U+41w13S8yxGIzubp55QumMD+Pj8H6D76KGnR14AvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HOt4i6OU; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HOt4i6OU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720972263;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PGlSOfFXGkkCOgDO70JhGZ3YVZz0/M4/VAc5L2PNBQo=;
	b=HOt4i6OUPsYrq251m6U8SCLeWOHtr4Judk4Q164HtjkjJ303eZm0L3qmffOFRDsue7a5BM
	JvGAZ6k7njWownRnM9+YWI2fmpiZ9Hj6Zj3PU1lXfPcPZ+0/IaJP122MZ1Y2jFfJUEas6s
	2RpLBb+B0oIQSqyxMdqM+5PWuZqb4Xs=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-308-5KmpRKU_OuG1zoHo0SyF1A-1; Sun, 14 Jul 2024 11:51:01 -0400
X-MC-Unique: 5KmpRKU_OuG1zoHo0SyF1A-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-36794fcfdd6so1998159f8f.3
        for <virtio-comment@lists.linux.dev>; Sun, 14 Jul 2024 08:51:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720972260; x=1721577060;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PGlSOfFXGkkCOgDO70JhGZ3YVZz0/M4/VAc5L2PNBQo=;
        b=uYjde/4WJCcr/gsi/HXaNzAHFaTxUXRred5e5/ZY8Q0YaKRa4d8FTM7ClPW9C1BdhB
         ruyrWQee8ZWslSem0cv851l4nF4p343uz49Mss7gkCTotHHTWRWm0EEyJu3QGqVg25o0
         HY3wG2/olsalT5r2kwJDbmhWTYcXxIIYcJXzOVJhGpI7eBlfkgXAIr/7an1LRkZG3JYm
         wbsu1kxDOisLU0Xj/qTcdG24J/oVGwVvDW30EXJdYvyklgqJao1ozMgTV9q7Ia3yXoJo
         e3qp8/JDHZZ00MFaBRP/D2KSv0G6A8yv2dqEpxEEiiCnK5NTQhdCRHQtAvTFV0e7/+V0
         xaYw==
X-Gm-Message-State: AOJu0YxW+IUb/apG1hJAvcXPR358u9PgW/UZy7eMHW+II6C2vTR7pahK
	kvY3kRwFd8fGwSuSaLHa5jiXtqlxcA7iWteeRKBP07Qfw71h9hsvGgD6qn0jLD5zPlo0PaHzyqA
	X402KIxKlIMxqSy+QCkCthoZyNUJjZ8KFZAzpBV4PlyWlwGr0+yi+jCXQbWPCpNo5
X-Received: by 2002:adf:f20b:0:b0:367:4dfe:3e8d with SMTP id ffacd0b85a97d-367cea45a27mr10648098f8f.13.1720972260405;
        Sun, 14 Jul 2024 08:51:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG6Mypgcr9gX8vK/ws4NV0GPMSu4kdl0uxmzQabfIjzmzPMLy0SnSw57k+EDDI6AJDgsLWPpA==
X-Received: by 2002:adf:f20b:0:b0:367:4dfe:3e8d with SMTP id ffacd0b85a97d-367cea45a27mr10648089f8f.13.1720972259837;
        Sun, 14 Jul 2024 08:50:59 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:240:5146:27c:20a3:47d4:904])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3680db047f0sm4105184f8f.99.2024.07.14.08.50.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jul 2024 08:50:59 -0700 (PDT)
Date: Sun, 14 Jul 2024 11:50:56 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: virtio-comment@lists.linux.dev, cohuck@redhat.com
Subject: Re: [PULL v4 ] administration commands for device parts
Message-ID: <20240714115023-mutt-send-email-mst@kernel.org>
References: <20240714150028.3292710-1-parav@vr-arch-host06.mtvr.labs.mlnx>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240714150028.3292710-1-parav@vr-arch-host06.mtvr.labs.mlnx>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jul 14, 2024 at 03:01:07PM +0000, Parav Pandit wrote:
> From: Parav Pandit <parav@nvidia.com>
> 
> Hi Michael, Cornelia,
> 
> The following changes since commit 9b3129fe72360a78e76b6dd890d3abc5a45fa915:
> 
>   virtio_pci_cap64: specify offset_hi, length_hi endianness (2024-07-12 06:43:53 -0400)
> 
> are available in the Git repository at:
> 
>   https://github.com/paravmellanox/virtio-spec.git tags/for_1.4_v4
> 
> for you to fetch changes up to f89c2818bba1bd0d80bb12372973deb6908931f2:
> 
>   editorial: replace hyperref with ref (2024-07-14 17:44:14 +0300)
> 
> If the change f89c2818bba1bd0d80bb12372973deb6908931f2 still not reaches to your
> expected quality level, can you please pull upto 52d320c8b3c54ae035c0ddc1d23ae997cbfa13b2?
> I will supply the requested improvements on top of virtio-1.4 branch on top of
> 52d320c8b3c54ae035c0ddc1d23ae997cbfa13b2 once merged.
> 
> ----------------------------------------------------------------
> This tag contains administration commands for device parts
> 
> changelog:
> v3->v4:
> - addressed Michael's comment to add fixes tag to the patches
>   in editorial patch
> v2->v3:
> - added message-id to the last patch
> - fixed reference to named reference in the last patch
> v1->v2:
> - fixed hyper reference to name reference
> - fixed typo in commit log
> - reduced the patches of pull request due to rebase of virtio-1.4 branch
> v0->v1:
> - resolved merge conflict for an empty line in newdevice.tex
> 
> 
> ----------------------------------------------------------------
> Parav Pandit (6):
>       admin: Add theory of operation for device parts
>       admin: Extend resource objects for sr-iov group type
>       admin: Add admin commands for device parts
>       admin: Define common device parts
>       admin: Add requirements of device parts commands
>       editorial: replace hyperref with ref
> 
>  admin-cmds-capabilities.tex     |  16 ++
>  admin-cmds-device-parts.tex     | 469 ++++++++++++++++++++++++++++++++++++++++
>  admin-cmds-resource-objects.tex |  29 ++-
>  admin.tex                       |  12 +-
>  conformance.tex                 |   2 +
>  content.tex                     |   1 +
>  device-parts.tex                | 232 ++++++++++++++++++++
>  newdevice.tex                   |  24 +-
>  8 files changed, 778 insertions(+), 7 deletions(-)
>  create mode 100644 admin-cmds-device-parts.tex
>  create mode 100644 device-parts.tex


Parav, makediff fails. Did you, in fact, run make diff and
inspect the changes?
Because it's not really practical to review the whole document
each time ...

-- 
MST

