Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BAC93176E1
	for <virtio-comment@lists.linux.dev>; Wed, 19 Nov 2025 09:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763545276; cv=none; b=Qv+/U5syPzPh5gw4bpdLjO+Zke2lNGAC0aU/+uZoJNiaUrUpd66zw8vZ9EA3W/AUGn2oSls6Q0RXYdqMUw0qmMHj+IwyzygqGa1BCL+j6R/K/YqMIZmd/zd/gjZofNHCJozY7gXvmzcQ/59sR1e5GElh6mQPgcvIIzg6pd/uKlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763545276; c=relaxed/simple;
	bh=nFLoivlF+URiSKenKMAUcDDND5pUpAXtXNzjKo/4poU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=iSZqQugO1SBHS5BwNrujziOcYnjcOVm70R5ukjAYaD8I2SU2TpYkmVfEns1thAfZyUPG5VvSvR6rzhUBv7BZJBOKcPl3sx6IRjfqJVQIx56Nsxbu6aAXx30gQUqnf2GhAooPsRSqR9fciBusJl/YTWsaTRGccZIFXxtH6acw6eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=THEChqoT; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="THEChqoT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763545273;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=S/nZrIQCuvyI/DpNot5REN+0ESNSh+aoQplA7Ane4PI=;
	b=THEChqoTlCFM1qEEvlzGWIy4/dXTlYtMon5ZUCve8RSGT3A9iclxts4hZ42KC3XKCTI/zz
	sv2uEFMowz+xeJb9+sMBLlILcMstQ40HSnPq+jkYoypeo0r/DHETTHwVPtX9kKAIGk2S/b
	htbqpqQqDI429W7w+RHQU30mgqWfdsc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-372-k4GbXGZqOGOZsYCTXoBdEg-1; Wed, 19 Nov 2025 04:41:12 -0500
X-MC-Unique: k4GbXGZqOGOZsYCTXoBdEg-1
X-Mimecast-MFC-AGG-ID: k4GbXGZqOGOZsYCTXoBdEg_1763545271
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-42b2ad2a58cso3624143f8f.0
        for <virtio-comment@lists.linux.dev>; Wed, 19 Nov 2025 01:41:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763545271; x=1764150071;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S/nZrIQCuvyI/DpNot5REN+0ESNSh+aoQplA7Ane4PI=;
        b=UJtxijeks24ezBNC23q+dwQt1U4QhIhrYKKZAIEZC7V4JDIxM7m5HPLVW5pvaVp9KJ
         G4feQhY2zeew2qEaou359pJrwyYovvM0/jWr6HmvvqrtLMBY4BIvP1Jo6fJUMNnCuDYJ
         RNcjGg/ih9uZXbadh86VK4IbW5IKQkAb721WPU0BZIgu/t2PfJFJuITovjznMqcIzweQ
         oV4BPDbUKyzuPm5r0XeUQAxH0PP5Guqi7ehflkueZQSU6SOTRpeDUUWU3HYk3IoEwS9j
         z457fHPnMKECfYiz1ROUUWB/GEZCAzOomyXBaWIXNj6DnRInRQQl0nez1PytBE2eyt9X
         ZPSw==
X-Gm-Message-State: AOJu0YwU9TDdbdCQyR+z8bB6T93bpsC5pUBhfE1kjyJQ87dRVi28P1ji
	19mbN33oGwl0e8sl0S8NjzUjOIoZCL7ANcIqogKK3m/OAlsKH8u/ZV9YUx4CCWCJJQ/MaZ9U+Sk
	6gv+yQn5H4HOg4dkXFq6Lhz8EFcCV4FVo5DeOjcrxggZNFks6sc0BdJxcmdhNQ+ZjuPM+
X-Gm-Gg: ASbGncvCvjUJHM8cUF9v6HGRNwxHpwWPeNn07Q7MVdxC4diw9eyXL7pnjCsVZpBhU5u
	/zC51ZVMkWhPBbpzsYvsGmETvNf84LZS3eWdNxbBxnl9Un+0FfYWWm3A4nKDbxnm6gZVVoc4WO8
	R8U8fUYMTbGgIuadvM8rlUGFCqikpp2OtFp1xGS5pz/JUgS+7b40+0/q3EJFNhBaODcyzTqkN6Z
	wi5mXhPkoAQ0JbU6qiMGq6QFANPNBOXPZhTGIg1+eM7UtoE21Ylc58B4QVi38/Y6DiAQJ1lNYg+
	hKodM6zRpPUOM5pdom2IzbpmqtDYXsiiB6MHyKY5otXFo+lg8I1HWSIlM7NybbJSzhybtlhHDsH
	BFv7ed47Xlas4T4ggqbt1N6eY/991Xg==
X-Received: by 2002:a05:6000:4011:b0:42b:3bc4:16e9 with SMTP id ffacd0b85a97d-42b59339422mr16653649f8f.4.1763545271005;
        Wed, 19 Nov 2025 01:41:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH8gI8XUOXuvFPE0rJ8P9XDtaEtwDZUG/4ejI+AsXdzamqsv8PQPS90rGcjvMxMeQgkNJEcVQ==
X-Received: by 2002:a05:6000:4011:b0:42b:3bc4:16e9 with SMTP id ffacd0b85a97d-42b59339422mr16653624f8f.4.1763545270485;
        Wed, 19 Nov 2025 01:41:10 -0800 (PST)
Received: from redhat.com (IGLD-80-230-39-63.inter.net.il. [80.230.39.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f203afsm37724038f8f.39.2025.11.19.01.41.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 01:41:09 -0800 (PST)
Date: Wed, 19 Nov 2025 04:41:07 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>
Subject: Re: [PATCH] net: pad virtio_net_ff_cap_data
Message-ID: <20251119044029-mutt-send-email-mst@kernel.org>
References: <0c8829841009a0094f24f87e013ff47e4d16721e.1763540610.git.mst@redhat.com>
 <CY8PR12MB7195A3E4ED0AF590BEB0A629DCD7A@CY8PR12MB7195.namprd12.prod.outlook.com>
 <20251119033333-mutt-send-email-mst@kernel.org>
 <CY8PR12MB7195E4A973474CAF2A68E001DCD7A@CY8PR12MB7195.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CY8PR12MB7195E4A973474CAF2A68E001DCD7A@CY8PR12MB7195.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xi7Guw-CuYPyzVzbhXojx1uMGBwkEbwWC9Ik6T4Xej4_1763545271
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 19, 2025 at 09:38:18AM +0000, Parav Pandit wrote:
> 
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: 19 November 2025 02:04 PM
> > 
> > On Wed, Nov 19, 2025 at 08:29:48AM +0000, Parav Pandit wrote:
> > >
> > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > Sent: 19 November 2025 01:54 PM
> > > >
> > > > struct virtio_net_ff_cap_data has 4 byte fields but the size is not
> > > > a multiple of 4.  drivers can easily get it wrong since compilers
> > > > tend to add padding to align such structures.
> > > >
> > > > Since we are always allowed to pad or truncate admin commands, let's
> > > > do just that here.
> > > >
> > > > Fixes: 899bb0c ("virtio-net: Add flow filter capability")
> Prefer 12 letter tag.
> Not a must as we are about to release.
> So will change locally when I merge.

thanks


> > > > Cc: "Parav Pandit" <parav@nvidia.com>
> > > > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > > > ---
> > > >  device-types/net/description.tex | 3 +++
> > > >  1 file changed, 3 insertions(+)
> > > >
> > > > diff --git a/device-types/net/description.tex b/device-
> > > > types/net/description.tex index 9833d16..0b4fcac 100644
> > > > --- a/device-types/net/description.tex
> > > > +++ b/device-types/net/description.tex
> > > > @@ -3055,6 +3055,7 @@ \subsubsection{Flow filter}\label{sec:Device
> > > > Types / Network Device / Device Ope
> > > >          le32 rules_per_group_limit;
> > > >          u8 last_rule_priority;
> > > >          u8 selectors_per_classifier_limit;
> > > > +        u8 reserved[2];
> > > >  };
> > > >  \end{lstlisting}
> > > >
> > > Thanks for the fix.
> > > We should align to the 8B boundary instead of 4B.
> > > It should be reserved[6].
> > 
> > 
> > I prefer the 4b one because it likely is what drivers have been doing anyway,
> > unknowingly.
> >
> Ok.
>  
> > > > @@ -3071,6 +3072,8 @@ \subsubsection{Flow filter}\label{sec:Device
> > > > Types / Network Device / Device Ope
> > > > \field{selectors_per_classifier_limit} is the maximum number of selectors
> > that a classifier can have.
> > > >
> > > > +\field{reserved} is reserved and set to zero.
> > > > +
> > > >  \subparagraph{VIRTIO_NET_FF_SELECTOR_CAP}
> > > >  \label{par:Device Types / Network Device / Device Operation / Flow
> > > > filter / Device and driver capabilities /
> > > > VIRTIO-NET-FF-SELECTOR-CAP}
> > > >
> > > > --
> > > > MST
> Reviewed-by: Parav Pandit <parav@nvidia.com>

