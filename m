Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13213221F32
	for <virtio-comment@lists.linux.dev>; Fri, 27 Jun 2025 07:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751010458; cv=none; b=shnH4VJCQVXbz7HgOUS5uevaqBeTtadvrE0+91X2388nw40dngxtAap+gL1OVwtNdkYsrOmEp4FoWY/FS+haXV122jHQaGwHqbKOyNV63zJYsCNSH28HaIDZutyFEkEIzGfmzm45fdAmlKFllW79esFD27HSQoMu1msDTwjpdgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751010458; c=relaxed/simple;
	bh=CBPTy0KwBPy51fGRTrP2D+XwTMSokDkTSPwUTw85VGA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=gF+GvYS2XvB7P4MR6wHoRuihMjeVaroSX/QSSKQsqHCNpdW/WklkUtWCDnQnZtfYaGUYqkUpgfVa5Aq67Qg9yNf/MEBvuEbgUu8qU2k9quA2F/cdWFcTHICMW3TCfSmudhYb0HDbi+dF5mEL02oGqvtYad4ydlkBiB/lHSyiHmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AoOuvCet; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AoOuvCet"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751010454;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VTFbvD2FuoGEEzM+wuTJtqyECbuzqDm8VRgIjWxA3AE=;
	b=AoOuvCetCCcVzSXOAbWcEbPHDZ87Y3Z0+oqoijQ6Ux7lmvCqfWj/hbZb9nmFbO/b64bgxK
	z6ZmeMFmRy1oOzIRQSCxk+FCpKyJPN4H2s6V4GuUqaJpkLPahUPuiDVz8Pj3g3llAeqlmp
	4+2Ke5HU6i6/SVhzaL+c1JihwAACQRI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-499-Ha0jRZsGOO6h-cq_xTxDgw-1; Fri, 27 Jun 2025 03:47:32 -0400
X-MC-Unique: Ha0jRZsGOO6h-cq_xTxDgw-1
X-Mimecast-MFC-AGG-ID: Ha0jRZsGOO6h-cq_xTxDgw_1751010451
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a50816ccc6so1165417f8f.1
        for <virtio-comment@lists.linux.dev>; Fri, 27 Jun 2025 00:47:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751010451; x=1751615251;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VTFbvD2FuoGEEzM+wuTJtqyECbuzqDm8VRgIjWxA3AE=;
        b=dF7X1LJl4w57lB/8wOejCWA0GCd9Vf5BlLnH/6e6KZUeUrnlcOpg3k0+BvdCZsImNY
         VeZWe1bsdD5XlhgdF/Ub1TWGdYc6V5q1UzH9mYzKzGNYVWs3+fRKBzgeirN1lRNo51pL
         UNwbXkDMIGC7pypQ5uqYSrm+vueYUadS1f7weCaPfgaOjZtsswZclyTIqC9xsi3C0b64
         RshAl1F0cb8xfnw2o6Z1pQJSFoXYK4vhf07pITH6gUFvRE/AW3HkP4Zsfp4k4VQ01fnT
         tJUjBgvuNCHj2pBboWML2bXdxYP8Q6WMd2Nvbg0AQ6VlDNU9Vhih96VXo7yOVhITYWDI
         6L6g==
X-Gm-Message-State: AOJu0YzWJlu6GoIqgJOgtpLUlKN14eI+la+8X5SF1geO+LerDBqAgD79
	VGkOV1UfeMDwY9Pq0RK/wrg32X+4t6LIsHh1Y3m41JaZf4JgcbqwSMCfJeZfCEvHgP7xG8CqmRN
	S4RD7CxZsbHpyJ7q0uBBkNNxtK4ZRnIJ95M3aqVNKrApJHLauSU2vXGaQdCwqhQhe5G1F
X-Gm-Gg: ASbGnctbHa01Fq+Uc1PpFwf2yF8nAZPJ3FbpKxAoLg8LPgjbjEfVmBYhxWMsvQh+HJc
	3dObzf9cNW9x4foKc+ZAFKMdOprENAcWWs+gW0AnFg76O7IhsCRknpcdZC5JEQXyWQ3mS6UFrzd
	i0oRMY3aNOe3F2A2FdIHXLCVo5f05ljX8gj556lMBw0TwxWipH/zTPkf3z3dQkUWGcizXZt+tB8
	uwgHmRLsHPUfjYhnDnOxRAIHvl6wSRD0K1DeZQWoWdmMDs0cEMfT3FuKlthv9xYehaiVg++u3cY
	MdzKXGFwIQf2eUAt
X-Received: by 2002:a05:6000:2089:b0:3a4:d64a:3df6 with SMTP id ffacd0b85a97d-3a8f435e178mr2057149f8f.3.1751010450785;
        Fri, 27 Jun 2025 00:47:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHBmEOqwPXn6yv8yO6bHoNMUdv3AsZ5jj6lkYgbMeqBMqWXufym3bMDxjxX7IRHA+NTi7dRdg==
X-Received: by 2002:a05:6000:2089:b0:3a4:d64a:3df6 with SMTP id ffacd0b85a97d-3a8f435e178mr2057126f8f.3.1751010450357;
        Fri, 27 Jun 2025 00:47:30 -0700 (PDT)
Received: from fedora ([2a01:e0a:257:8c60:80f1:cdf8:48d0:b0a1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7fa54dsm1932523f8f.23.2025.06.27.00.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 00:47:29 -0700 (PDT)
Date: Fri, 27 Jun 2025 09:47:28 +0200
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: virtio-comment@lists.linux.dev, mst@redhat.com, cohuck@redhat.com,
	shahafs@nvidia.com
Subject: Re: [PATCH] introduction: Clarify RFC 2119 key words usage
Message-ID: <aF5MkGKqJwGvg0mG@fedora>
References: <20250627041954.400922-1-parav@nvidia.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250627041954.400922-1-parav@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lu1ZAABoNybDzXwiSh26ctd9R-gcgoxFhR6YI1AWz3g_1751010451
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 27, 2025 at 07:19:54AM +0300, Parav Pandit wrote:
> RFC 2119 key words should be used in Requirements and Conformance
> sections; these key words to be avoided in rest of the sections.
> 
> The motivations for such clarity are:
> 
> 1. To clarify the intent:
> These key words carry precise semantic weight. When a spec says MUST,
> it means compliance is not optional. Using such terms in general or
> explanatory text risks misinterpreting guidance as a requirement.
> 
> 2. Avoiding Ambiguity:
> If normative language is used in non-normative (informative) sections,
> it becomes unclear whether the reader is required to follow it or
> if it's just background or suggestion.
> 
> 3. Informative sections explain context, rationale, or examples.
> Normative sections define rules. Mixing the two muddies the structure
> and weakens the authority of the normative part.
> 
> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/230
> Signed-off-by: Parav Pandit <parav@nvidia.com>
> ---
>  introduction.tex | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)


Reviewed-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>

