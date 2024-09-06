Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 782561C8FD8
	for <virtio-comment@lists.linux.dev>; Fri,  6 Sep 2024 09:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725616583; cv=none; b=NjcdCSNIaurqi8ah3k6zCy9/zpP4o2JsG8nAcwPGR5m8ucGAqenvHQR4oj5JpxMSyLnn3ph0bVKmvzHBYSggeBU40BnebDi7UQTqSry9czI4S2vyB01lLv3uci+rDiFLpS7wrOAN/sYMo2fMaUhjWv8xI5tyEn1ZlyC0FiwrXu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725616583; c=relaxed/simple;
	bh=p7vaoru6ffGr/VLOLquAJh+gfXrycZYHwSMPUrgT3+E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=qfKr3JZZO/BqKpoNq0aoZgBJhdIgpos4exqHg/OI3CT83cGHhReag+fvnv6U5dk3PZAHKlQ64QVO2oINhs/XDP8da65s1ivtHuwBLOl9LjizQVbsaxvoqbnh+lsSmzWfDFL/I3/GaQBOpwV6nBVynhbAY9KnGU67uzmhTrdT2HA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LMmatdL6; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LMmatdL6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725616580;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i2nFHvJAERwprx1728W5AL+dVMNR8Ub1en/BQR8zVYg=;
	b=LMmatdL6bE3DTDf8RzEvtGXwuYCXvpE3R7/5G0hzbebWKglp73apS/8ZXS5m7XUxJpkNrk
	44I1MDqhAY1HroaMwxU9Se3VWXz287j288qOB7nzfPMifJhl4QEVGQusBSNVOzEWxnoJY7
	JRf/zd4x1YfWRBfxFvsue9aLWsnMVok=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-63-ClrBULJoP6OWLJMsph_IyQ-1; Fri, 06 Sep 2024 05:56:19 -0400
X-MC-Unique: ClrBULJoP6OWLJMsph_IyQ-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-374b35856aeso1164992f8f.3
        for <virtio-comment@lists.linux.dev>; Fri, 06 Sep 2024 02:56:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725616578; x=1726221378;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i2nFHvJAERwprx1728W5AL+dVMNR8Ub1en/BQR8zVYg=;
        b=m5KJ6XAHdibmUIAz6lXHUWaHKsMzkf2yaybEZXwdj2fbQyH0zE0uBvtnKE7TI1zDhl
         /L0xF1ozu5ztLcGSwlwK/WE2y46XIg/T/Zc4fM6x4ITXr+I0B5gVljaW3aTvb6SSJykQ
         wvGRo+rerR9+7HvT/gvbVLsUd0k4HnXvSYYUcxmntfiakO02i/ikn3KdNcDT0D2zyHj2
         J/AJ7/0mH8zvFlts497qGjP5mbHqFvBWmATqFp5JnfINPlhtauVEfe9EggxAC8BAfTvs
         dT5M2tae13mRU94ZoR1aI59sAEnk4Fxpf9XQ3qB0h0bjjAMfE2uF9EcgLbwxokAd8986
         QZ5g==
X-Gm-Message-State: AOJu0Yy/4DPg0wRIhzj82M8GXIqjuZsc4QiPLVjBTXW+ozwTkJjOXVFy
	eQPCdRtJM89d1XnvdO1Y7iu38anmDaLeNruCDLLGdWRSVkX09WcPbgK9YKDvaXGBkqVYD0g10rB
	ZFfNy7wPZ4H/wAe/qiLlBFjYy2m9Rbcezw6eTzbyKctwhxq556tHSPhh9ctKKT0Gu
X-Received: by 2002:a5d:6743:0:b0:374:93c4:2f61 with SMTP id ffacd0b85a97d-378895c4851mr1448907f8f.5.1725616578094;
        Fri, 06 Sep 2024 02:56:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQMdV5QRJBI0U00xjIhXlmLSpd91RclD530qDvpkXtHHp4NG9ZIGkjT8IgtvRnVdBwOkeL/A==
X-Received: by 2002:a5d:6743:0:b0:374:93c4:2f61 with SMTP id ffacd0b85a97d-378895c4851mr1448860f8f.5.1725616576895;
        Fri, 06 Sep 2024 02:56:16 -0700 (PDT)
Received: from redhat.com ([155.133.17.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-374ba593876sm17651067f8f.5.2024.09.06.02.56.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2024 02:56:16 -0700 (PDT)
Date: Fri, 6 Sep 2024 05:56:12 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Albert Esteve <aesteve@redhat.com>
Cc: virtio-comment@lists.linux.dev, acourbot@chromium.org
Subject: Re: [PATCH v2] content: Reserve ID for media device
Message-ID: <20240906055449-mutt-send-email-mst@kernel.org>
References: <20240905073018.1766082-1-aesteve@redhat.com>
 <CADSE00LirezidLjewHKWxZjb90o9jAUNXiL4082oMcXamxbazA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CADSE00LirezidLjewHKWxZjb90o9jAUNXiL4082oMcXamxbazA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, Sep 06, 2024 at 08:44:34AM +0200, Albert Esteve wrote:
> 
> 
> On Thu, Sep 5, 2024 at 9:30 AM Albert Esteve <aesteve@redhat.com> wrote:
> 
>     Reserve device ID 46 for media device.
> 
> 
> I just realized that the ID in the commit message is outdated.
> I apologize in advance for the extra noise, but I will send a v3
> of this patch so that everything is in order.
> 
> BR,
> Albert.
>  

Don't forget to update the link in the github issue.


>     Compatible with video encoder, video decoder,
>     and capture devices.
> 
>     Signed-off-by: Albert Esteve <aesteve@redhat.com>
>     ---
>      content.tex | 2 ++
>      1 file changed, 2 insertions(+)
> 
>     diff --git a/content.tex b/content.tex
>     index 0a62dce..6d6b3d8 100644
>     --- a/content.tex
>     +++ b/content.tex
>     @@ -739,6 +739,8 @@ \chapter{Device Types}\label{sec:Device Types}
>      \hline
>      45         &   SPI master \\
>      \hline
>     +49         &   Media device \\
>     +\hline
>      \end{tabular}
> 
>      Some of the devices above are unspecified by this document,
>     --
>     2.45.2
> 
> 

