Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65227223313
	for <virtio-comment@lists.linux.dev>; Wed, 26 Feb 2025 17:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740590457; cv=none; b=C2coXYSKj+9f3GUQjwU0BX0M1LA8JwxZshZGlEv8Cmcv6p+UuAARIRlfXTSZstupR9I9HqRUWxO/4P1B4fm97BgYUn289GoBU6uZ8AHBkFaKHEkWXIliKAqKxEf7CaepDgSIljTeA/1+9pgp8e+qtmXcTlSeaVpXomf0WLIN1hI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740590457; c=relaxed/simple;
	bh=w1lqkoWlwvhtMLt6OveyR5BucoxzDaxv1zEKR6Zl2wA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=UNIt1MrBO40WCDoViIMVvb3Jdp9qQM08pxBMsw5ysUatDXXlv7Chrv1v/Rz7p6yicYFV0pMhIAIEh2PrK8jxr0Y10lOVB6jQSXNZ5tHwCYGe40OOeUbNph0ZNq37USpInEfKHSG3rzUM/xUSuWd6ZoTaB8NHzTeLvI9Yj19sEcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dheN/0ah; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dheN/0ah"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740590454;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pztqIgGrlT7ovoQZBG1FmMY2l2/srihnH7gFnrcJmt0=;
	b=dheN/0ahTfemDPVMrNmq486Dh04a6BFPw1VhiHglQ98de0F96EBZemE/5BODUCn86n6KWN
	V+iApTcpJHhjKAxjtHsZAGCNmzwwbj7AvzenNRkhfU8l7CSAbdQdDsqxeF5VMC0gmC5K6R
	ZXr+XYsECm7w5yLbCMQ/eO60rHlh1g4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-453-Z9219YQePQeukUyJT_RarA-1; Wed, 26 Feb 2025 12:20:53 -0500
X-MC-Unique: Z9219YQePQeukUyJT_RarA-1
X-Mimecast-MFC-AGG-ID: Z9219YQePQeukUyJT_RarA_1740590452
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-38f4bf0d5faso648f8f.0
        for <virtio-comment@lists.linux.dev>; Wed, 26 Feb 2025 09:20:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740590452; x=1741195252;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pztqIgGrlT7ovoQZBG1FmMY2l2/srihnH7gFnrcJmt0=;
        b=P8uhmqukVED1AIQ3KFvuNIKM+KhSZhudHaHje2KZWtl076zdNIzCA4DG27hFjBbgdS
         jNBAqmKQGvByUzbqfT/vMLUDOAbLd0GLl4+XjlHzGWtt3SidlYq0fWXs/0HjHJEuWezU
         EbYVP3dW16OapXn3aG+36zc77SvKH+nnSjssYyF6fWbZWsIDzI2DXko8DvT1jOPkGyRv
         mIAOejAiABV3oqFsMGq6z7DbxzgyfH8xg7XGDS/OzuW5la26wHqipj/ph3QO5wK1RPst
         0O+mcmpE123//UZ+MCeZ0PIgLcJHWmDL6n5trA6ZGcvg5cDHdgjXmJ/vBqzq6FXh04AQ
         eYEw==
X-Gm-Message-State: AOJu0YyvUxlJISyblZvdaphUNrTDEASBIf7CLV6fn+5W92soidq8ey+U
	k5NAtl4wDfBGc4UXRWMtDoPVMol8xw4s3fruuXuYd7WpQlmIxHb3KHyFBOnDSRpY6I7eO0tei+R
	XEuygsae1fQmMn/Wckmyhca8Blk49v/klHrF5ZjzbYchwSJY8flSnYyrOmR6/2aHV
X-Gm-Gg: ASbGncvsMwI3KiWSmTMJY2CJbxphzNd2eZcrt8EvfY4k5xLFRVQFnS+wusIMIjm3+YQ
	XOHMb9sulkfVVLayfYDDpDEc5lztUJvtlJnut/LyBeS/OvQTXDlOwEwm60u+lBB7GnWcQMC8c8d
	zYGJdGv8d8tlZfs7xhOdAti7YG7MuJvZXZZcCe0GLnD3Mcc4Teq5qz309hNFtVRPzDjSHUr0HyE
	lSbKuF59Pu2WndS+txHccBn2bb2w0jFmEqLsvLlqRL95RNGQ3n/sV85UVvFCJcBA7QblCbMU+Hp
	MY9t2FCWRA==
X-Received: by 2002:a5d:588f:0:b0:38d:e48b:1787 with SMTP id ffacd0b85a97d-390d4f3bef6mr3724800f8f.14.1740590451744;
        Wed, 26 Feb 2025 09:20:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFExcR3KTXlmlL1bn8AyZWwbrGSlptbYQOwkLVAfUl5JEgIuJbxuXOV1+0R/ipXqNlfiNlVMA==
X-Received: by 2002:a5d:588f:0:b0:38d:e48b:1787 with SMTP id ffacd0b85a97d-390d4f3bef6mr3724786f8f.14.1740590451421;
        Wed, 26 Feb 2025 09:20:51 -0800 (PST)
Received: from redhat.com ([2a02:14f:1eb:e270:8595:184c:7546:3597])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390cd86ca0asm6413916f8f.32.2025.02.26.09.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 09:20:50 -0800 (PST)
Date: Wed, 26 Feb 2025 12:20:47 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Cc: virtio-comment@lists.linux.dev, cohuck@redhat.com, parav@nvidia.com
Subject: Re: [PATCH] README.md: add example email for TC vote request
Message-ID: <20250226121740-mutt-send-email-mst@kernel.org>
References: <20250226153318.1243033-1-mvaralar@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250226153318.1243033-1-mvaralar@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -bHijMxr5gofJ2T47amBKmBXSwb2TVri2TpY058tD5M_1740590452
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 26, 2025 at 04:33:18PM +0100, Matias Ezequiel Vara Larsen wrote:
> Signed-off-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
> ---
>  README.md | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/README.md b/README.md
> index c06caf6..5f76e0d 100644
> --- a/README.md
> +++ b/README.md
> @@ -206,7 +206,13 @@ The mail requesting the vote should include the following, on a line by itself:<
>  <code>
>  Fixes: https://github.com/oasis-tcs/virtio-spec/issues/NNN
>  </code>
> -(NNN is the issue number)</li>
> +(NNN is the issue number)<br>
> +For example, you can use the following template when requesting the TC vote:<br>
> +<code>
> +Could please open a voting ballot for these changes?
> +
> +Fixes: https://github.com/oasis-tcs/virtio-spec/issues/NNN
> +</code></li>
>  <li>Please make sure to allow time for review between posting a comment
>  and asking for a vote. </li>
>  </ol>

Maybe add

Subject: Re: <description of changes>
To: virtio-comment@lists.linux.dev


?




> base-commit: 124fcd0e97f209aab19639e7369116d99ede22a2
> -- 
> 2.42.0

