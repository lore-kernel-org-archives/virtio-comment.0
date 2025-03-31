Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F60213236
	for <virtio-comment@lists.linux.dev>; Mon, 31 Mar 2025 16:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743437781; cv=none; b=QFeLUekF6dp1HxjwbNbYeAUHj73QEcxkBjaGS6ZSl0g+tOnH2SGLNiLYW6gnwNJS7jPyyIXsBwKJaKqMWIWfDbdD6vacUg0Do/EWArWpL3MypxnCQtObU6bR2RDQ986vekx6BrkGx9xLAeTnxMNPySfQgCM6o8VYpiZ3SV2NJns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743437781; c=relaxed/simple;
	bh=Bz3Bq3Do5iRTObNmYx4FvaMVM8Oji95qYpqYVMR1ohQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=XiHcBYQwSSfXO+IbsopHMX7tSgb0z+POi1+rIheYCu5uqK7KBR6XaGktwOYDl+O1VIdatfMMpSloODOPgpn5GxQEip/gm92Perxr7IGhbQAXG6Z/dzDXG80HRuhFQHiXD0VvWgNwQ0C50M/B9/LJENWbCcqFhU1ybjJjMt4Yfqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SnsFcYMc; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SnsFcYMc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743437778;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gIX82UKBLEeiCz1qlX0MnB4da7KlbA6bfTvsiloAEIo=;
	b=SnsFcYMcsV35NY5DSg/dXIDc3U6jgW6zobRzPXRvf4XHWYls8ZQ2NCtge32F84CGEAc/2L
	tXXMh12rOGY/7Yrkwwm3BiG2+bbj3qrBYtzpBNiS4QAOUI/XB+cNHeUfejCujLyjCRn6FW
	rVMPhcnYER7dDP4Txo1QqAG77F7+YcM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-593-xJSDHV8zM0aV55kvHs1crg-1; Mon, 31 Mar 2025 12:16:16 -0400
X-MC-Unique: xJSDHV8zM0aV55kvHs1crg-1
X-Mimecast-MFC-AGG-ID: xJSDHV8zM0aV55kvHs1crg_1743437775
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3913aaf1e32so2681163f8f.0
        for <virtio-comment@lists.linux.dev>; Mon, 31 Mar 2025 09:16:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743437775; x=1744042575;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gIX82UKBLEeiCz1qlX0MnB4da7KlbA6bfTvsiloAEIo=;
        b=wZ4T8bqpJEdx3U57OHiXpU+FouBwnARFyZn4VZ42JCexTjGBFKi2y1lxExSGBfiumm
         12sOHyUkA3S4Xw3MV//Cz9bsJjiMcn58l2V8w6KkW0aHWOajtoML2zXUwnV2IJl3uyo6
         4kGmHgOM6+nRPV4sPHsObjhUgpTzUsDWwRHB1sGeCRaKulqPNwAKWUv2L0SiE3jf0fCe
         rtQh1mLlJSiyZIAi3yY6XxRTTtjvEhwNR8cNTzc0ap3daAo9pAnPsxHTw+ZQ2yUxXNxU
         2xZ3V0Gv+bxAPnWLx2vSZCgCGL28vn5J6lseSDpEjKYWq/Q4HyCBA8S0pL6qlepshnfN
         QJcQ==
X-Gm-Message-State: AOJu0YxvVsPqg0DuUC5kDZhoPyxNzED+7touZ3Rk5OZ1I/xduZBkEVgh
	RuxwLsNnXJaoWyfOT9QYMx+voVCKpOEzBJKfmuMI+2wzgUlnvObOianCJEWtDbSDDzNerKPKrI4
	CzwK0ObEvXJkv7uhzPuryV99tOvlW8dzMx9WZAOIwT1mfzMFiMOPKnxFwH/H7odSs
X-Gm-Gg: ASbGncvkSvYtednALcUvTRAmTGO8IiHlBLsR+b7OJCiDx3Aqjv4CHeS5U2MmLuHZZwZ
	eib75VshDP32CSlPvu0qn7kkNJBL9FGSuAEuubQvI7l+Ga/mv5AVP7D6SXvmNs6ZZtCPpv6KUd0
	w0uhV1itq4Ju1yumiNmaA3ieFdzwKm3WBXcEQWB+Zk2nfxzgDzfZQLoWbHhZCR1+49uWLC90xx2
	LlNJzS5ZLyte2asulWp7e28S53CVY4DvUsRiRbsqy4/mxwY4DhFjoa8c5N8SbVf2wwDjpOV1ykL
	+hqwTRFcqA==
X-Received: by 2002:a05:6000:2805:b0:391:41c9:7a8d with SMTP id ffacd0b85a97d-39c1211b763mr6550142f8f.54.1743437775095;
        Mon, 31 Mar 2025 09:16:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFBP+VCvmj3rHN8eNTnSfcvol9qF85epBJ82wUZjYuJXCtHs8KLBjr/zAt2JJSeJe8uvgXS+A==
X-Received: by 2002:a05:6000:2805:b0:391:41c9:7a8d with SMTP id ffacd0b85a97d-39c1211b763mr6550119f8f.54.1743437774772;
        Mon, 31 Mar 2025 09:16:14 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b79e0dcsm11746799f8f.64.2025.03.31.09.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 09:16:13 -0700 (PDT)
Date: Mon, 31 Mar 2025 12:16:11 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Sergio Lopez <slp@redhat.com>
Cc: virtio-comment@lists.linux.dev, dmitry.osipenko@collabora.com,
	parav@nvidia.com
Subject: Re: [PATCH v2 1/3] shared-mem: introduce page alignment restrictions
Message-ID: <20250331121538-mutt-send-email-mst@kernel.org>
References: <20250331150548.50595-1-slp@redhat.com>
 <20250331150548.50595-2-slp@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250331150548.50595-2-slp@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 55zVBW3Kd9ROIAhTy5NIm6DY6CiZu-6x5rdtpXdGj2U_1743437775
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 31, 2025 at 11:05:46AM -0400, Sergio Lopez wrote:
> Add a subsection for page alignment restrictions.
> 
> Signed-off-by: Sergio Lopez <slp@redhat.com>
> ---
>  shared-mem.tex | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/shared-mem.tex b/shared-mem.tex
> index 6e6f6c4..2021083 100644
> --- a/shared-mem.tex
> +++ b/shared-mem.tex
> @@ -34,6 +34,12 @@ \subsection{Addressing within regions}\label{sec:Basic Facilities of a Virtio De
>  The \field{shmid} may be explicit or may be inferred from the
>  context of the reference.
>  
> +\subsection{Page alignment restrictions}\label{sec:Basic Facilities of a Virtio Device / Shared Memory Regions / Page alignment restrictions}
> +
> +When requesting the device to map memory into a shared memory region
> +the driver MUST obtain the page size information from the transport
> +and honor the page alignment constrains derived from that page size.
> +

will make existing drivers autmatically incompliant with new devices.

we generally avoid things like this.

>  \devicenormative{\subsection}{Shared Memory Regions}{Basic Facilities of a Virtio
>  Device / Shared Memory Regions}
>  Shared memory regions MUST NOT expose shared memory regions which
> -- 
> 2.49.0

