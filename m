Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E954C2F7AA3
	for <virtio-comment@lists.linux.dev>; Tue, 18 Nov 2025 22:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763503787; cv=none; b=U5Qw6HmzzhOUM0NJXHAMTKQ2QfXXlBlUC2/xcn6/jwQVA5XTscAD9ndHeyuZTcK3cMh5VAg9vO0dHZtdQdsJR6BbyR2xUNsX34vXhr134wSab/YTXCOsQ1e1jCWv1QjMHL5eAprNxI2fr6H3tADguAO+TMobRlB2cN3iyqZ3j3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763503787; c=relaxed/simple;
	bh=kzoz5m0WyYbGFMTkodHV8Hd84pcqH2VIb1Q9Y5LZ/EE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=HeqqOQnVyObgoKyVr+EEaJ/Qg1cO5t+BJTeRZct4jVXHLwu+d9T68ut3ySSYo8SsVwSqmnzoewdQ6mOvslsiv+6PRVCn3guRvBNPONRQLTwQCQFISFrLJG97FOV6h5UPavyk4gyZ1v26r3IbOXCgdes4F4cnseGQ3lqAp+n1JRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=doWixn5H; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="doWixn5H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763503785;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wMr/cpASRLFPrghCltzVCBgKC77vu0Wa1GT/MmVTEts=;
	b=doWixn5HmmgUVhgJDPkSe0dR91xHvIWLTd08Km2s/4ntIJKs8wXjfxQ3/lY050ZQpm32ZR
	Bx2LRQB3Y6N0vIV+PWFJ9432+GCQgoYTH84pJYyRHTdV64Gc6PkHt+qGerhXlpQQrcKPyI
	CgKslkL0QYmJNgk43YGgY54JYdq+ri4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-84-M6hL7pxtNWqLf2psb1YuMQ-1; Tue, 18 Nov 2025 17:09:43 -0500
X-MC-Unique: M6hL7pxtNWqLf2psb1YuMQ-1
X-Mimecast-MFC-AGG-ID: M6hL7pxtNWqLf2psb1YuMQ_1763503782
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4776079ada3so58552385e9.1
        for <virtio-comment@lists.linux.dev>; Tue, 18 Nov 2025 14:09:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763503782; x=1764108582;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wMr/cpASRLFPrghCltzVCBgKC77vu0Wa1GT/MmVTEts=;
        b=GG7uSXTEYnlTbWb5JKn7ooMIaETNlTp8yBy/KUwBeWlERH3Pg9rvN0pS+SmSZUqlKt
         nhoWlZuTsaCaXzKNyuu1gbWuVM8xTPsyNn/EL6zpSiPoqEM1RlfP4vGLkLwVM/mrHX7T
         wGMxVeJ2oohMckgbSlT/dlRztaHn6SU+U13VwzpZRD6nHsEnmnZLLi78VVu+NymF6atd
         XiV/xeu6ZhUTjY/ooND731/Xc74L+ePx90zxl2b2DO1EztoBptYmZgSHktLVw7WvIy8C
         tIRIJyBSvu+KZDSdy4jdszM76WqOgDvAUQodJBHDByHyi4rcqYBard04Marwgehufv3D
         +Ryw==
X-Gm-Message-State: AOJu0YzjWoo4y9bJjofpgpypsgI2u2OPXvUexoOvaorGOo6jscig5Y6m
	Zwv2x94xUa4nLLffVpSo0qx0C0AfuHN7Ry9U0h6LJBGPbMNSdo1v3xIsfY36p7ZIPMtp0GgtFFy
	WG+Vh3+fcgividH7W1zU1pblux3oj0xfJJD8gCYBdljyLIIPMtn90y9fvy338oLJL4sAL
X-Gm-Gg: ASbGncvZy/6vvGsMl2ckwzmynm8COIHbgkE1xPhd3S+raHyzRdsEK2wTlLf/eWbmqzS
	OTEPR74nQaJcUtyMFvNVYzqGiGzFkEpZneaBPFWeDGLGZLm8ILMmqzFf+vKqV0XXtCjnJ6lyxm+
	ggYXw8v3I9wDUFw3U3akIf/wcxX0iOflp81fk0aS3Xoxp/tiLzZOZ3la4zJVxb7R8qZiy2meNTS
	PSGtj3rDRita1UqGkUH9bzicDI6QjiAiOfr+/OtXV0eeDVrPbxTC3P8G2bIffe7A+b56iIsUu9q
	h1P4Z4OQMkdBJQ6NqtEmNMy05b6LgwuDZIvmBJKZuAMw9Yy0vwvdZ2ECvDLDp/yRROGZBjqh1uQ
	S8n+dnnyDiBCTfTFNtPLDwq1Rt4oORA==
X-Received: by 2002:a05:600c:c177:b0:477:7975:30ea with SMTP id 5b1f17b1804b1-4778fea1336mr182973795e9.29.1763503782487;
        Tue, 18 Nov 2025 14:09:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE7eJLJyy5+brldSmF8A8mPPjmnPDbWvuY3sXJ7IZ3/hNn6ou7rHlCJEd2/m1BD0RWE0fQPCQ==
X-Received: by 2002:a05:600c:c177:b0:477:7975:30ea with SMTP id 5b1f17b1804b1-4778fea1336mr182973625e9.29.1763503782053;
        Tue, 18 Nov 2025 14:09:42 -0800 (PST)
Received: from redhat.com (IGLD-80-230-39-63.inter.net.il. [80.230.39.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477b102422asm12958325e9.7.2025.11.18.14.09.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 14:09:41 -0800 (PST)
Date: Tue, 18 Nov 2025 17:09:38 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: virtio-comment@lists.linux.dev, cohuck@redhat.com,
	hengqi@linux.alibaba.com, sburla@marvell.com, shahafs@nvidia.com,
	si-wei.liu@oracle.com, peter.hilber@opensynergy.com,
	jasowang@redhat.com, xuanzhuo@linux.alibaba.com
Subject: Re: [PATCH v11 09/13] virtio-net: Add flow filter capability
Message-ID: <20251118170742-mutt-send-email-mst@kernel.org>
References: <20240604132903.2093195-1-parav@nvidia.com>
 <20240604132903.2093195-10-parav@nvidia.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240604132903.2093195-10-parav@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8Ekx0Nnu6gCJ3FNXmbr5AyS5WzCKcqV38cpjYGUC8oI_1763503782
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 04, 2024 at 04:28:59PM +0300, Parav Pandit wrote:
> +\begin{lstlisting}
> +struct virtio_net_ff_cap_data {
> +        le32 groups_limit;
> +        le32 selectors_limit;
> +        le32 rules_limit;
> +        le32 rules_per_group_limit;
> +        u8 last_rule_priority;
> +        u8 selectors_per_classifier_limit;
> +};
> +\end{lstlisting}


I don't know how I missed this, but this structure is not
aligned properly. In a typical compiler there's going
to be a 2 byte padding here :(


It's been a year ... do you think it's too late to fix?
Parav?
If it's been out too long then maybe we need a flag to fix it.

-- 
MST

