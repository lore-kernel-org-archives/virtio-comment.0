Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB8784962F
	for <virtio-comment@lists.linux.dev>; Thu,  6 Jun 2024 06:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717654426; cv=none; b=o8VU7ACq8ii35JbzCJ5Rm2I2N/Ki46dUnWDQ4DNqsO3qvqbrOUFPJr7WicUf8v9fn4s2DnznZzVxxZAKe5ZTBlfEHOVoZusiMQi7wMcrKm9RsKGyyM4R4hhyvWWbdl93F+WKsbJ6OEI56fFprwfN2TyF7OBa6wT0vVfkPbxe16o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717654426; c=relaxed/simple;
	bh=Q0aR0wD5FeTZivjqhq16FxXyv9J4xHEfIzChwa4W/fE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=IsGt+Qsgj9iP8kHL6aFcvijeKAXbUJd1PBUM6IG3Oj6RiLcHOGhrSAK/NaxcSmJiV6p8rOO+sd0j7cXxbBXKf6iP28c9FoIUQMHuRoyOTE+lx3oid4uJhFwTXD+dVEXXvojyN5Zpzuelj8UbcdyrkhWwCnYi3ADcbivTf8VtYxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Aew9/dAO; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Aew9/dAO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717654423;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Cqi0rvOCJb8qDRKlyzBIaEMbrpUDrbGGo7XZoYbKFB8=;
	b=Aew9/dAOHgnm9lgDaZ6Mt4+4aucsOQPHP+V+Glncn2vY3DyOsb12asnWwetEpC6xus5jHD
	KOKxTEYL0+9rHRQ0hATMzb1ayyHHtvJ1CroqayjMfONB76XqB1Gh/slSxGpyL9XACh13mF
	CmbZB47KfQZyQgSGR8Qzz9gewKJo7tg=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-611-LadAEu0FM8yZ1wnWwIGFgg-1; Thu, 06 Jun 2024 02:13:42 -0400
X-MC-Unique: LadAEu0FM8yZ1wnWwIGFgg-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-57a524f1f7eso65797a12.2
        for <virtio-comment@lists.linux.dev>; Wed, 05 Jun 2024 23:13:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717654420; x=1718259220;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cqi0rvOCJb8qDRKlyzBIaEMbrpUDrbGGo7XZoYbKFB8=;
        b=RJyE8oNhN0sKLtn6G5sxEz6VVolNkBJAJI8OSmu4YoiFg7gENK1U4kb82aDlrkZ/q7
         OwjK1FLIX1xCCXA4aDcDjlzUB3WZKis7Mubt7q4iYMnR5C+HnL2WS8kpKXT5KFp94UUh
         E+9AolpXARe+JrUgAcqceAzYmd2tzoiQpJT5RiO6j0jWTEUIXgPbelDw0KoK14PbBvrV
         NWMPXm6uBHs0fOQKGWw+Fc8RVaLsn2MhMh8Q7sCKUTbYxGD2vvz5BTeHCFCEut+PAbAx
         O3XvVOyLon1L0wDrr5k+tSiMl5oWoH4YDlhD+593fb1jaQEAX8D4jrihr2U/902zY/Ro
         SDQA==
X-Gm-Message-State: AOJu0YxM7kTLxYvX34k8jlWpmUxot7sdWxoiAbscRPw5eY7j2arJ/sVr
	gN5kKJ+h6RjZpW/Mp0+Ky40ZfBEzH0hmVN1sLHaieQQehF6X94CcoitRWFzMzs9zOklPeFbKDYh
	6/TQPYRvCbhyn1u+OUKIH5OOz7ZZAGiU8b12zsumU/5R57FNzYN0Dpyf6NNN1u7rlhG5qnxk1
X-Received: by 2002:a17:906:2a13:b0:a68:c3fe:c8ff with SMTP id a640c23a62f3a-a699fbd456emr249061666b.17.1717654420442;
        Wed, 05 Jun 2024 23:13:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFp9IaI3Z8u5mLlhdyifUlsOPHdnNtgoVgO5eC5cmeVc2ODA8haV+5RmKIc/acXnWWQevjqGg==
X-Received: by 2002:a17:906:2a13:b0:a68:c3fe:c8ff with SMTP id a640c23a62f3a-a699fbd456emr249059866b.17.1717654419988;
        Wed, 05 Jun 2024 23:13:39 -0700 (PDT)
Received: from redhat.com ([2.55.59.85])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6c80581c1csm46561666b.17.2024.06.05.23.13.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 23:13:39 -0700 (PDT)
Date: Thu, 6 Jun 2024 02:13:36 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: zhenwei pi <pizhenwei@bytedance.com>
Cc: virtio-comment@lists.linux.dev, david@redhat.com
Subject: Re: [PATCH v2 2/2] balloon: link virtual memory management URL
Message-ID: <20240606021002-mutt-send-email-mst@kernel.org>
References: <20240606033544.400000-1-pizhenwei@bytedance.com>
 <20240606033544.400000-3-pizhenwei@bytedance.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240606033544.400000-3-pizhenwei@bytedance.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 06, 2024 at 11:35:44AM +0800, zhenwei pi wrote:
> More and more memory statistics have been added into stats VQ, add a
> link for Linux, this would be helpful to understand these counters.
> 
> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
> ---
>  device-types/balloon/description.tex | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/device-types/balloon/description.tex b/device-types/balloon/description.tex
> index 7ef4e3f..cfe5b8c 100644
> --- a/device-types/balloon/description.tex
> +++ b/device-types/balloon/description.tex
> @@ -425,6 +425,9 @@ \subsubsection{Memory Statistics Tags}\label{sec:Device Types / Memory Balloon D
>    directly by the running task (in bytes).
>  \end{description}
>  
> +Please see \url{https://docs.kernel.org/admin-guide/mm/concepts.html}
> +for above guidance of virtual memory management on Linux.
> +

Unclear. If you want to refer to this - maybe add the link to
normative references and actually call it out where
you use a concept from that page.


>  \subsubsection{Free Page Hinting}\label{sec:Device Types / Memory Balloon Device / Device Operation / Free Page Hinting}
>  
>  Free page hinting is designed to be used during migration to determine what
> -- 
> 2.43.0
> 

