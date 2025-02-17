Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2575E148832
	for <virtio-comment@lists.linux.dev>; Mon, 17 Feb 2025 15:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739804760; cv=none; b=gWZNPCaOICdUVqPQTxM1MCq+QQgsHmazrwiYB9hSMQEtfWqHr0VnKAypn2IlBcxfP4l2PwHRar0BOY2QxRhEs94PBvWb0/xXVDY3BIHDFnsBjkNgiLAMNRnauIroqqxEUFtDHFeIIp6M/fFNPjryh3RjM9mpDrGmAYgIHXzh/pQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739804760; c=relaxed/simple;
	bh=Mw5BveR4KL6vLTXdbTpYLQ6yoKJPvgr7d99siYTDj5k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=o6dYfBDkDHSzqxseg7j6RNWIlCphfnLfODUui4sse7VkN7vqmeu2VgNCf1MifxgtvywACoRGK3Rf0/Kc5JT4rblfF78sAjQRwXJF5Oua51DJIPHCtxr5eDhTfUaJp3Xcllr7WtR68LTcTXYo2d3GeH9I2V5HmNsMjhojrgKPLFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cWV18UxA; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cWV18UxA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739804758;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OocG/plIhFCcIwZrkxdpDHTYdkawnMLwINU7pIESrmU=;
	b=cWV18UxAS83KchNrEmFsLlBXU5ttdJ+0sb2LRpuhXqn3zypFrNMfqV9VOqZOqR0oAHCf96
	SifLseZmfCVoERM+MacuF9lOpzB5qYkvLXEReZOmiznhzUQlEKHnSx8TqGziRwYtt4DzL7
	rd6SYkclO/TkMK0345yAoZ2niBj/YyQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-385-ySCujQWMNTm9N9ryLN4cXA-1; Mon, 17 Feb 2025 10:05:56 -0500
X-MC-Unique: ySCujQWMNTm9N9ryLN4cXA-1
X-Mimecast-MFC-AGG-ID: ySCujQWMNTm9N9ryLN4cXA_1739804756
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4393535043bso25679615e9.1
        for <virtio-comment@lists.linux.dev>; Mon, 17 Feb 2025 07:05:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739804756; x=1740409556;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OocG/plIhFCcIwZrkxdpDHTYdkawnMLwINU7pIESrmU=;
        b=HwvZJSmusGhRpqIoivq3JWc4aRR9YiIYIKN37syvOYd1pFJ/NpS9N2miVs85+WxRaF
         BcjHjEuRZxsXarDvm+TyvuT+euSygqPgBSGT/m3iJN9ylpVxotAgvxjgr4B00wLyiKyJ
         FQjZXYaD4+zcay9EkN3Dwa/5Rqxlhb96Io7eNw6TqJgyV0E5Zx5I8tH4zYKYkyts32XV
         MYdkbNED+x3cmrAus/6J3qM2mAkqsZ9NyCcx+qIDFrkJphootBZzAndsz5o9wWzbuVk1
         QFSF88V4Mh5pCvWjC+WJGJL/VF5u2EuuUHvGWgGtdOfSMEuRf5QxejPNA/bR6WsRkICv
         5Umg==
X-Gm-Message-State: AOJu0YzM5S2csQJnkV4ujy3d2HZTJF9PeeDeqe/n1PnYYe9HwAxepKr2
	nCE5OHQTHKwfaxdNomMea/QU2D4Xf7bqblfrourrf8nUU+XjXnNRbASZAl6WAtQjegG4uz6wxnX
	yCttVMHGhg30S7NKsQKv3qg/2jPbB9LZvLEfnJ+4L+1fI8B2jrE+s5SGMxkBJN505
X-Gm-Gg: ASbGnct4NDdT5I0/qVaaWiUORpCNovv3acwHthBmJzmaRmZeObgzYTgG+VLIS9OqKhC
	GNWckq85ea2/eCSjd97FhCj4d3NfJIXiZInPxMaEFGFX5I6tylP2yYvq0Ru7G+Y2I6H1rAokZn7
	UKGcvmch6LE2d2YWJVQOd5I12vILVQQIet+IEUKINwBKrhwp5cK21B6rLHR9D+431Tiht5/BIG+
	xxR8jGNit1bCExU8gCwpeIgAYYaR/fCGQl0TvK5UfgSdpXuGX5DIj3chYVsxB0zUpDAgm8+Vec=
X-Received: by 2002:a05:600c:2d03:b0:439:7ef0:a112 with SMTP id 5b1f17b1804b1-4397ef0a282mr42096595e9.10.1739804755673;
        Mon, 17 Feb 2025 07:05:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFSDby9clNGlJmgg2pshCFJreBWeL6UBi8rVJagRUqQ9dMiRgDqUSHtiaBUz1r3hzytfnf6wA==
X-Received: by 2002:a05:600c:2d03:b0:439:7ef0:a112 with SMTP id 5b1f17b1804b1-4397ef0a282mr42096235e9.10.1739804755221;
        Mon, 17 Feb 2025 07:05:55 -0800 (PST)
Received: from fedora ([2a01:e0a:257:8c60:80f1:cdf8:48d0:b0a1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4398ba53406sm14374245e9.14.2025.02.17.07.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 07:05:54 -0800 (PST)
Date: Mon, 17 Feb 2025 16:05:47 +0100
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: virtio-comment@lists.linux.dev, mst@redhat.com, cohuck@redhat.com,
	shahafs@nvidia.com
Subject: Re: [PATCH v1] virtio-net: Rename selectors_limit to
 classifiers_limit
Message-ID: <Z7NQSyMUPunN5a+n@fedora>
References: <20250215061158.21053-1-parav@nvidia.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250215061158.21053-1-parav@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: N4cg1_Mnm-O9bdQ7oPbLb-5zDPdLZooaIFf4Ura389k_1739804756
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Feb 15, 2025 at 08:11:58AM +0200, Parav Pandit wrote:
> A classifier object consists of one or more selectors. The number of
> selectors per classifier object is already annotated in the field
> selectors_per_classifier_limit.
> 
> The field selectors_limit is intended to reflect the limit of
> classifier objects. Hence, rename it to classifiers_limit.
> 
> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/215
> Fixes: 3b7b7371dbed ("virtio-net: Add flow filter device and driver requirements")
> Fixes: 899bb0ca24d8 ("virtio-net: Add flow filter capability")
> Signed-off-by: Parav Pandit <parav@nvidia.com>
> ---
> changelog:
> v0->v1:
> - fixed to replace description of selectors to classifiers
> ---
>  device-types/net/description.tex | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 

Reviewed-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>

