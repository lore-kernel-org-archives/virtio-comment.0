Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 176D82139A2
	for <virtio-comment@lists.linux.dev>; Tue, 18 Jun 2024 12:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718712875; cv=none; b=UMrAB+7rjCYRsOqse5OKQgN+YxaD3in+MPlkWXAz4pb2X7t4gfjqIAoVoy9n4QLPH77E2TD5kPKYvkxXGr1OOo+4fGXdVgXCUv1edoC8xhC0/CDtdfJkd6q0nRGoAgN5pEzjuPAm5nZUxE0CaKGljr5HaqPI0iXijSyw060B604=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718712875; c=relaxed/simple;
	bh=uASHdyNcsFm3bP+XeKCOpBr0cUM4RqHjbVQznuzYiqk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=lOKoKyc5ggZYU/U6bSOUigLPUq2igck5GOpAnp4T/Vc/IkpWBooJodXtnNU9I2SrhOvBAxicuy5OyafhZoFH03jDqTtmZcg1QwytIQsR6AHocwT+cmsj77T6G2l3qXvk+/UrsGY+QUsEf1Ra83fEYCL3X8Pf2v3WFs720UVHq2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TqCLXTNt; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TqCLXTNt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718712873;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=84KSsI9DnBmSBkwzsJ7+bVNoY6/UoCvTScA2dDjnlUU=;
	b=TqCLXTNtnZ10aHNMXDb9w+PiBXP7z8iIP4C2xY9o1IDo11rBF2rKPdrA1va0VmotFC6Zxn
	LEwukQg5kBzaRb/O9wtu1Y+qrYeJIaAO9kmvqFEmOg/ujBZthZdiCuwmAZlyJ58PnNtTRK
	JxMuVKFYmtuth2A5f3V0dae562Q4/Ug=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-312-4MOFJZdcMK60maF3ei63lQ-1; Tue, 18 Jun 2024 08:14:31 -0400
X-MC-Unique: 4MOFJZdcMK60maF3ei63lQ-1
Received: by mail-lj1-f199.google.com with SMTP id 38308e7fff4ca-2eae59f5492so48379771fa.1
        for <virtio-comment@lists.linux.dev>; Tue, 18 Jun 2024 05:14:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718712870; x=1719317670;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=84KSsI9DnBmSBkwzsJ7+bVNoY6/UoCvTScA2dDjnlUU=;
        b=lYvZPrglYBhJRw7mUegl4zeN5i11eQl5092qix6/ipx3Ritv/c3AZWttAKw171N40S
         +dD5H/BjZJNyz/Yc50ymCSL9LAB0fcMMIB04WDEzlgFblu3F3TunMBTcjrJo6XYi0RSt
         TttcFu9yRw7ggYqJD0vWzLvdwfADf3mb9wM/crtExKW9eWMz3oJ3IBMggx+ZCynRe8mn
         Q7FuhvMjeW/9d05sA1JYiHLWrQMHelnOId+VH3OjHHr85eQiAhPWf5U76Yd5pMTV+olF
         jXhDHCDO1DH1ElmVQWxncWrhVRPjs/w4w2nE5ZlrqTYK3/BCGeD8eR+b9LZM60Ruafmg
         g9rw==
X-Gm-Message-State: AOJu0YyBYRgHzPt28MDRn4rdN+oRDMH1xmz1zUW6yqCOQSSmJwmvJq7u
	vKCJeWBqqBFPLSiPWT0T2WvI6jTvzQThfEWg5srphPCGS9f8fMEWp2m/BaYw/k+8X+1/bGjSl9Z
	P7istjbpaZ5uBaETgNLTQbcIwT1+tesYtPXfBmeT3VIMdEgd60nxoodphrEoB4X5a
X-Received: by 2002:a2e:83d0:0:b0:2eb:ebe9:f76d with SMTP id 38308e7fff4ca-2ec0e482652mr102047551fa.16.1718712869959;
        Tue, 18 Jun 2024 05:14:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFktcEQvE7Oklytca76feRoAyZm0oggcc8y8W4vOa1kek95a+NtMq6UQFT0GNWTMww+3+ssbA==
X-Received: by 2002:a2e:83d0:0:b0:2eb:ebe9:f76d with SMTP id 38308e7fff4ca-2ec0e482652mr102047311fa.16.1718712869501;
        Tue, 18 Jun 2024 05:14:29 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:441:67bf:ebbb:9f62:dc29:2bdc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422870e9193sm223873835e9.21.2024.06.18.05.14.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 05:14:28 -0700 (PDT)
Date: Tue, 18 Jun 2024 08:14:19 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Keiichi Watanabe <keiichiw@chromium.org>
Cc: virtio-comment@lists.linux.dev, uekawa@chromium.org,
	takayas@chromium.org, dverkamp@chromium.org, tytso@google.com
Subject: Re: [PATCH 1/1] virito-blk: Support NOSPC error
Message-ID: <20240618081314-mutt-send-email-mst@kernel.org>
References: <20240618081858.2795400-1-keiichiw@chromium.org>
 <20240618081858.2795400-2-keiichiw@chromium.org>
 <20240618065456-mutt-send-email-mst@kernel.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240618065456-mutt-send-email-mst@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 18, 2024 at 06:58:40AM -0400, Michael S. Tsirkin wrote:
> On Tue, Jun 18, 2024 at 05:18:58PM +0900, Keiichi Watanabe wrote:
> > Add a status code to indicate that the storage is full on the virtio-blk
> > device side.
> > 
> > This is useful in scenarios where a virtio-blk disk image is provided on a
> > sparse disk and the host storage is full.
> > In this scenario, the driver cannot create a new file to the disk image
> > because the sparse disk cannot be expanded.
> > However, if the host have a service that clean up host stroage regularly
> > by wiping cache files, the guest may want to retry the request.
> > For this type of special handling, this error should have a separate
> > error code in virito-blk.
> > 
> > Signed-off-by: Keiichi Watanabe <keiichiw@chromium.org>
> 
> Unfortunately we did not think about it and did not specify how
> drivers should handle any new error status.
> So I think we need to burn a feature bit on this.
> 
> 
> > ---
> >  device-types/blk/description.tex | 13 ++++++++-----
> >  1 file changed, 8 insertions(+), 5 deletions(-)
> > 
> > diff --git a/device-types/blk/description.tex b/device-types/blk/description.tex
> > index f04c932..5a34bd5 100644
> > --- a/device-types/blk/description.tex
> > +++ b/device-types/blk/description.tex
> > @@ -532,12 +532,14 @@ \subsection{Device Operation}\label{sec:Device Types / Block Device / Device Ope
> >  
> >  The final \field{status} byte is written by the device: either
> >  VIRTIO_BLK_S_OK for success, VIRTIO_BLK_S_IOERR for device or driver
> > -error or VIRTIO_BLK_S_UNSUPP for a request unsupported by device:
> > +error, VIRTIO_BLK_S_UNSUPP for a request unsupported by device or
> > +VIRTIO_BLK_S_NOSPC for an error that device doesn't have enough space.
> >  
> >  \begin{lstlisting}
> >  #define VIRTIO_BLK_S_OK        0
> >  #define VIRTIO_BLK_S_IOERR     1
> >  #define VIRTIO_BLK_S_UNSUPP    2
> > +#define VIRTIO_BLK_S_NOSPC     7
> 
> 
> Hmm. It's the last free bit.
> Seems like a bad idea to burn it on a limited use-case like this -
> I would say we need to make bit 7 mean "any other
> status" and then report the actual status somewhere else.
> No?

Ugh it's not a bit, I was confused ;)
Pls ignore.


> 
> 
> 
> >  \end{lstlisting}
> >  
> >  The status of individual segments is indeterminate when a discard or write zero
> > @@ -567,10 +569,11 @@ \subsection{Device Operation}\label{sec:Device Types / Block Device / Device Ope
> >  Requests of type VIRTIO_BLK_T_OUT, VIRTIO_BLK_T_ZONE_OPEN,
> >  VIRTIO_BLK_T_ZONE_CLOSE, VIRTIO_BLK_T_ZONE_FINISH, VIRTIO_BLK_T_ZONE_APPEND,
> >  VIRTIO_BLK_T_ZONE_RESET or VIRTIO_BLK_T_ZONE_RESET_ALL may be completed by the
> > -device with VIRTIO_BLK_S_OK, VIRTIO_BLK_S_IOERR or VIRTIO_BLK_S_UNSUPP
> > -\field{status}, or, additionally, with  VIRTIO_BLK_S_ZONE_INVALID_CMD,
> > -VIRTIO_BLK_S_ZONE_UNALIGNED_WP, VIRTIO_BLK_S_ZONE_OPEN_RESOURCE or
> > -VIRTIO_BLK_S_ZONE_ACTIVE_RESOURCE ZBD-specific status codes.
> > +device with VIRTIO_BLK_S_OK, VIRTIO_BLK_S_IOERR, VIRTIO_BLK_S_UNSUPP or
> > +VIRTIO_BLK_S_NOSPC \field{status}, or, additionally, with
> > +VIRTIO_BLK_S_ZONE_INVALID_CMD, VIRTIO_BLK_S_ZONE_UNALIGNED_WP,
> > +VIRTIO_BLK_S_ZONE_OPEN_RESOURCE or VIRTIO_BLK_S_ZONE_ACTIVE_RESOURCE ZBD-specific
> > +status codes.
> >  
> >  Besides the request status, VIRTIO_BLK_T_ZONE_APPEND requests return the
> >  starting sector of the appended data back to the driver. For this reason,
> > -- 
> > 2.45.2.627.g7a2c4fd464-goog
> > 

