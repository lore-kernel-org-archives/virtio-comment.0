Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9E932571C
	for <virtio-comment@lists.linux.dev>; Wed, 19 Nov 2025 08:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763541260; cv=none; b=O6x+2WaM8grRqdtWuVVc/VwF+KfYQ0c+H7fAckmeLRvjZPmxCwY8CS4DFks6h80YfHHASjwLEM/bp+WNRECNFf94qoq1zQdBrmNk8B9lKHzJHqhHz7pgiyive1mIxSdFC4T99Fbik2c3ltdssc61q/7hdSUNmiUeUZtYuxsblEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763541260; c=relaxed/simple;
	bh=dz4uT/2CveK88XmipHdF9J3Z+Bop6S5xmE5n7GaDnxM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=Znu+ovQP7cKZHHj8C4S8M/adXm8szKauj1JOy78mggZdbrVAp5B5Cs7WPgTo8glgDNTOWGNHGLMuG0emKGGLMBBkEGqruNi7s3An7B2KAtgPCH80oAERNVkv/9d0T7UncQT/DdZvB/9MbYZN+FI0DNBJDTHLJnN9Mnew9M6U5HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EX7Fos09; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EX7Fos09"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763541257;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6pMyK9KYepKMSqcGM/Rs8i1bJprLT3eAAL30ZiS+sG0=;
	b=EX7Fos09MNqn4WXykq394FWGj2Dj1oXDYqLIARzyqo3N9uhh9ynGfNxARegmfndNOLMEXe
	LKVEo2S2nVkmIwVbd1rK7l7I/30z8BlnMFPTpFDVttJwyKdYfh7NartvxF/j5kkyzSOx8U
	jKaChc2Pkk1L/AqKsjP6AoGyQSo5E/Q=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-668-r1Vj1uCGPoKZOHbw2v8Ltg-1; Wed, 19 Nov 2025 03:34:15 -0500
X-MC-Unique: r1Vj1uCGPoKZOHbw2v8Ltg-1
X-Mimecast-MFC-AGG-ID: r1Vj1uCGPoKZOHbw2v8Ltg_1763541255
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4779b432aecso21122425e9.0
        for <virtio-comment@lists.linux.dev>; Wed, 19 Nov 2025 00:34:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763541254; x=1764146054;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6pMyK9KYepKMSqcGM/Rs8i1bJprLT3eAAL30ZiS+sG0=;
        b=CbW0pBvsYjhJ3mYeNreOSsbHTxZtXKmKgAFpUoP6CTRygiul1zVtkQpjAOdl363WU9
         caZOiun9xWFaouqiwH/Kw/CZkMT+klTUvzxj0w8CnVzpQVe2wULRLXi7p7fJllEK2n72
         0pXSTJqU7v78z7oR3iGO9W9+2wTwHbTR02FWLlYYYsRf3DnfmrPNG+q3Y45OW4naFfRi
         1UW1Iog0eGROqP1oPXT/YKgX4sAiu6aLNdSpPbCXD8OoonRMsrUPQhZ/iOu4ONYUpFme
         N+Sv0+7mPtN1PpLJp1hPfI8mqQ2jpcUnTrBaP44S9VRIm7BOgQlEQVTvmjWLi0VU7MHL
         kPHQ==
X-Gm-Message-State: AOJu0YyIbnU5MkGRsS84l2kVTv4OMUOvZz1EiDaWWI/8i9fbs9/Mibpe
	xZBW+ToZX5eopTFv9/LSd3+qesZEalFchtACur2i5m4rTqO0PVSRo5chIR1wnSqkqtasY5UV1Re
	TEFX/aVJPYwkWgM+VrETQUrLkfwWM3ET1G/2rt4MYwUdeS1I4viIGTVWKwIb4urNRhF5y
X-Gm-Gg: ASbGnctRE75miF9Dw9zrV5nIKCDj7OJD7tzXOchWQvUIp9dSQM3hQev/iy3fFU2PIMn
	iIgWcBRNdysjjNH3jp++oFct6Pq/K/VNtYvA9x4XgNb0JrXVWWVOvWP6aIHbBqZ2Dic3xXEnb8q
	inwrW6otbxgX9Lh+ojjcwbE7dggGyD3BXZbN6Dai+cFHaFryyHBQApFNVrnmCFgdYeixl5S4oA3
	KzOzPpjQ6gW0V9SI33T6+v4aBrYq9lFIsrEl8OeSrpTh0+V2bvUzx70IovzRqa7pSt66ivRHPQu
	XlHZH/oFLHl4IET3PDkL8XBFXKyK7/7DEqqxK1Q9e2bMULQfnNPTquovehkpNbsEXaLIzCfN6Le
	Pc1eFhj731jVROetsB7m6dcD82kzByA==
X-Received: by 2002:a05:600c:3587:b0:477:5897:a0c4 with SMTP id 5b1f17b1804b1-4778fe59a00mr167782295e9.4.1763541254489;
        Wed, 19 Nov 2025 00:34:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG61mouNrcnJ1GbXTZasMd+y2alk6/js9DquLqzBXntt2pg63hWz0WJNRIUkcT9lDLNnrgHGg==
X-Received: by 2002:a05:600c:3587:b0:477:5897:a0c4 with SMTP id 5b1f17b1804b1-4778fe59a00mr167781945e9.4.1763541253986;
        Wed, 19 Nov 2025 00:34:13 -0800 (PST)
Received: from redhat.com (IGLD-80-230-39-63.inter.net.il. [80.230.39.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477b10804c8sm35759625e9.15.2025.11.19.00.34.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 00:34:13 -0800 (PST)
Date: Wed, 19 Nov 2025 03:34:11 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>
Subject: Re: [PATCH] net: pad virtio_net_ff_cap_data
Message-ID: <20251119033333-mutt-send-email-mst@kernel.org>
References: <0c8829841009a0094f24f87e013ff47e4d16721e.1763540610.git.mst@redhat.com>
 <CY8PR12MB7195A3E4ED0AF590BEB0A629DCD7A@CY8PR12MB7195.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CY8PR12MB7195A3E4ED0AF590BEB0A629DCD7A@CY8PR12MB7195.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cbG_-RKMXgDJvBkXS--PdVJSpTIp6hnFifwp5LsVTyg_1763541255
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 19, 2025 at 08:29:48AM +0000, Parav Pandit wrote:
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: 19 November 2025 01:54 PM
> > 
> > struct virtio_net_ff_cap_data has 4 byte fields but the size is not a multiple of
> > 4.  drivers can easily get it wrong since compilers tend to add padding to align
> > such structures.
> > 
> > Since we are always allowed to pad or truncate admin commands, let's do just
> > that here.
> > 
> > Fixes: 899bb0c ("virtio-net: Add flow filter capability")
> > Cc: "Parav Pandit" <parav@nvidia.com>
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > ---
> >  device-types/net/description.tex | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/device-types/net/description.tex b/device-
> > types/net/description.tex
> > index 9833d16..0b4fcac 100644
> > --- a/device-types/net/description.tex
> > +++ b/device-types/net/description.tex
> > @@ -3055,6 +3055,7 @@ \subsubsection{Flow filter}\label{sec:Device Types
> > / Network Device / Device Ope
> >          le32 rules_per_group_limit;
> >          u8 last_rule_priority;
> >          u8 selectors_per_classifier_limit;
> > +        u8 reserved[2];
> >  };
> >  \end{lstlisting}
> > 
> Thanks for the fix.
> We should align to the 8B boundary instead of 4B.
> It should be reserved[6].


I prefer the 4b one because it likely is what drivers
have been doing anyway, unknowingly.

> > @@ -3071,6 +3072,8 @@ \subsubsection{Flow filter}\label{sec:Device Types
> > / Network Device / Device Ope  \field{selectors_per_classifier_limit} is the
> > maximum number of selectors  that a classifier can have.
> > 
> > +\field{reserved} is reserved and set to zero.
> > +
> >  \subparagraph{VIRTIO_NET_FF_SELECTOR_CAP}
> >  \label{par:Device Types / Network Device / Device Operation / Flow filter /
> > Device and driver capabilities / VIRTIO-NET-FF-SELECTOR-CAP}
> > 
> > --
> > MST

