Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3FD52F7457
	for <virtio-comment@lists.linux.dev>; Wed, 19 Nov 2025 08:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763541203; cv=none; b=BFEPAkuMiA9GAR2aJfVCIakYFIy4yxHA500ZjZNSSAXzbzV3Fu1yN5N4q7W3vFsCfERz7vgKp8sx2KyndypfUDYvU78cjVm2ciECtJw71fTSztTHaTRjFQDRd/qgpQEhCuYB0SYr52DJEYjOPyDLs34b2HkzEG/1jglrua7/5Do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763541203; c=relaxed/simple;
	bh=WUECok5njII3BVb/+fgOGiXjEwibl05uAJDxJSymSTI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=FpeCBrPTmaYg55NeZbommO6Am0bJArrKFPlG+HoF1p3oBzixxNfbPMJAhdYjLmxg2UIgFhkjNEeCYmk+N6qv/xuVKyN15ln3Lo8O8erf+lbn7Oxt+LbiSgv+E7aso/nUtR/CsXCFYngeHBYu/ycBvY7IqQ10ZwswTRl1t7u4tQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hbAQ/t+S; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hbAQ/t+S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763541200;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NgmYs6sBWN50AGAZePnu6UbFbo+L+Xx4cO2R3RWWF8M=;
	b=hbAQ/t+SPNJfyo376xgqqm6S1Vo1ivNK3JMIIX4ny19b33DWekbRRJCMIT0fttoMnpdbg6
	76WBkRfgoYjln4AWuA2QaNHzaG+ZAiVW5SS/HzPbJ/rieZ2zIvlVE2SnOMFr+adPrvq3sm
	QsV2nchHeS3FDq5MFuMtTj1Nq2wbDSw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-354-DTJQBSpeNMa3l28Zn3R0Vg-1; Wed, 19 Nov 2025 03:33:19 -0500
X-MC-Unique: DTJQBSpeNMa3l28Zn3R0Vg-1
X-Mimecast-MFC-AGG-ID: DTJQBSpeNMa3l28Zn3R0Vg_1763541198
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-477a1e2b372so30719965e9.2
        for <virtio-comment@lists.linux.dev>; Wed, 19 Nov 2025 00:33:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763541198; x=1764145998;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NgmYs6sBWN50AGAZePnu6UbFbo+L+Xx4cO2R3RWWF8M=;
        b=d8eClGF/8lqugAIkMs3+dbZNZDEnckb4vSvxp5bPBpc78fJhjrZ99QOi/qTSOXBog8
         HY++MRNDG/kaWHpzsbqcCeTUNKQAMoz8Gzk89fKBHYOmW7iQ2sGzpMAimwFLUxWz2lQ3
         cx/H/Bt6DLraXe3ib+p9k2jq6B6Trm+U6ai4l1s4cZSFTrXe0mLCUkpn+KYrLV+osnB0
         rDX0uPTEBM0yXx7F4nKXLynjDDKm3w8XyA+u0nPTyl7eCgNWiKg8bked1yIRt7jo8NnG
         m0A8ZVVYo3MlrWublCAe5t8BbNHTXqb7R5Qx6NA6WMJb1jfpPrgXmRWAN/qInDQJr10/
         mWQQ==
X-Gm-Message-State: AOJu0Yx8tgIeA5F/A9fEUGpfuQXV0zteFH3pzvBI26daZ9C4ZiSirg6n
	gaAuRNwArNrYNDbEMeOIqfdTIakCz2eoL4BL5X5NhbCfeVZsbPm/QfH6FuN+DsACqCFTlVGHaYU
	xol9P2Xs+Uiappevlp8dtIe9/9PJ2ARzRygcYk19+mKkmEU3WEyXO/h5EfsNDydHmw3nTRevEzS
	ee
X-Gm-Gg: ASbGncvuUHKTk6Fh5aFoBgtCBazxZh2BHpPnb2AfRZV+nbNYujIgOAO/C+u2r7L6RX/
	iO6SyWuoQMt9qH3J0IeO5RVM3/lZ1V6QYyIsJmROI9dRpWQTh/hI/VvK1O7DKofQzGEekcwpvU9
	Vr0YkCs+Lmfkv4jf7GcvhOI+bNsbUziXWHXY4bPokAN4m+uiG4FF3bIcrecrlXco3VEUW7ewW64
	FJkUnJjSGBZ8tDLi8616QDZm6oll2TjZ9+ga94dJJHvCGPX0T4qX9Yr1802QI7jTTxsEeYnR2dA
	nPkvbA2LE9bjApCYo/GGOO5+dt4Fq2QZHUvnoU50AWpVA71nwrSPjE0QuMNxtN/ICOvdzQP6d9+
	W+ui2J0s2Qr0gU/avOWeURZX5snaK7Q==
X-Received: by 2002:a05:600c:6287:b0:46e:1fb7:a1b3 with SMTP id 5b1f17b1804b1-4778fe9b4edmr210948645e9.23.1763541197591;
        Wed, 19 Nov 2025 00:33:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF4S/huHzl7WJWVSRzf3xQLlJJAfR5i4JjytzafKJK9ZDV5O8VUPZC0mhy65tAgugoBqvTi4A==
X-Received: by 2002:a05:600c:6287:b0:46e:1fb7:a1b3 with SMTP id 5b1f17b1804b1-4778fe9b4edmr210948395e9.23.1763541197221;
        Wed, 19 Nov 2025 00:33:17 -0800 (PST)
Received: from redhat.com (IGLD-80-230-39-63.inter.net.il. [80.230.39.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a9731a75sm37443465e9.2.2025.11.19.00.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 00:33:16 -0800 (PST)
Date: Wed, 19 Nov 2025 03:33:14 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>
Subject: Re: [PATCH] net: pad virtio_net_ff_cap_data
Message-ID: <20251119033147-mutt-send-email-mst@kernel.org>
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
X-Mimecast-MFC-PROC-ID: fmdsxEOLhlLwyTYZDXb7kBS5YOz88cPdc-9B7rsr-hU_1763541198
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

We can but we don't have to. We need to align on the
size of the largest field in the structure. This one
only has 4B fields.


> It should be reserved[6].
> 
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

