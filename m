Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E60317163
	for <virtio-comment@lists.linux.dev>; Thu, 28 May 2026 05:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779945745; cv=none; b=GD2wBLbjloWt5CxRIh/93a+OWPw5AuT2ymC0a2wvA8SRp38BqZASFWda0y3IIJ89hsILrUaYQP1VKZl/HPJ2KpOxIhRY1Zt0/EJ0YbgkzSzuMCdI1cVnwWneC/PRTDKEe8CqCP4z1mTlxi4dWGofJksfb6s1ea+poOY6NwYc5O8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779945745; c=relaxed/simple;
	bh=lAacw5v3dO3EoN1ecEzwUPxr9SbZVcD6Fwjpmo2NtKo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=KtG7x93Il7HP22uHDj3EujWDi+HmEYIIvCmwjVsrNw795SlFPRB57E/BNW2L2uMp3II7JQcacIJv0ScZT2IZwwaYEAUvjfqeZFJpjHnI0fPs1L48pJf3waso/7anLAeVx4mGxVqLIpCTkDLWb/WlpvkXRSSaMZeoZfhdzjTP8f0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bPEdx2FY; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bPEdx2FY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779945742;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HLvtWF1sndVG4KRJdIHOEE6Bk7FwopnHIxwmGKn99y0=;
	b=bPEdx2FY51m6H6MlzY4Lro8R0k9uNJfpuz55tCt8z2AH4D7BgzvGCMb2HLqb+Gozhhvufi
	okAhVnZQePAkTgECP/uRPR4JGIbLnxHhX5dY3g/wrOiEPig9Dhza61UEbDQiDt4+yhgbZG
	3mVauyn6Q3VocVtuNF0pLVZVydQIVl8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-281-M2lAWeunMzueVArDEoj39Q-1; Thu, 28 May 2026 01:22:20 -0400
X-MC-Unique: M2lAWeunMzueVArDEoj39Q-1
X-Mimecast-MFC-AGG-ID: M2lAWeunMzueVArDEoj39Q_1779945739
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4905428aad6so42499355e9.1
        for <virtio-comment@lists.linux.dev>; Wed, 27 May 2026 22:22:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779945739; x=1780550539;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HLvtWF1sndVG4KRJdIHOEE6Bk7FwopnHIxwmGKn99y0=;
        b=r9FgTCYZQ6WjUIsG/MbYo/Zu1Vn/VGVSuYNNts/8Gnd41AKMiswXQnBHQDT7E0cl/U
         0LVb3NkVSXvF4twhmsSxkjPlgN4hkCTh52efUXjuI7qVFcSIIBQX0TuD/LwHJhJSeCu1
         agEURulPucG5YIzs3e3UwigZ9fqb72ZfOk2XgTuq9b7isCxpsGXmbrrlwU/G4jjj4B73
         yCic4pXF2euw2sHjM94bBjiR+R3c82vQC+muDIqrDz122zlOKx6svEqURZ7sjs+QnziA
         OItaw2pXSExY4E4Q9rMznCmZlfJZ+4Jhng9ktpwl8rj1CqFmqQJ/otfwfz9+Lzw5yxj8
         5Qkw==
X-Gm-Message-State: AOJu0YwaMTX6h64cI+2HAFEpWZL0wVoneQuitoqEb0Rna6T1aX8PWVPx
	R1/DRuYf6mGohspiUelJXnZp7MfF3TCmWeF6I1C5LuANMAJdRwKkO/fWgiIPWzBQEi/LHV/dlZe
	suenjp+4ZLDvWrWVj2wkMJ1o8oWs6hAy9L3BKlDpyh4TamlC6yq5+bQSlTWY4x+T8O2Dp3MMQGT
	47
X-Gm-Gg: Acq92OECRGABmQKDZZ5P1s3mLWMNgpXRP0LC/pAMYCqBzJpCkpGgvgy+5IsnQaKr9UW
	bLKQCecQs1xfXgXWMH0v1V748dQvNtQdrfFQy5pjIj1SE/4D3rj4ggA9vRY9784F2WIx8N9qLfn
	yZXZgw2a9nlR5+NJNPoT9DTATwNN8Gu52x0ZOq51caPamWWsYzd8j5SKppJbyDW+SSx0tbTxaVE
	oADhLRaiy7v2IOuHVSI+QfZJDh9W5BsMSgC6WbRM5BUpsp86Hbe4JGKDIflqSHQVpbYVqU/jNh3
	z4KClCin8i3XUkGAR/km+2lOpOMEf5+jafKA44IuAtcVqQ4XjmAXnnZH9snYKqMdm7i/Q5xZ0e0
	OXR5QFEz3aXibTH5/TYLqhM+Ja4g7fMwS6yQRBJYw6jaPX6gjteSzHg==
X-Received: by 2002:a05:600c:4ecc:b0:488:a824:fdff with SMTP id 5b1f17b1804b1-490426d190cmr422571275e9.22.1779945739021;
        Wed, 27 May 2026 22:22:19 -0700 (PDT)
X-Received: by 2002:a05:600c:4ecc:b0:488:a824:fdff with SMTP id 5b1f17b1804b1-490426d190cmr422570855e9.22.1779945738608;
        Wed, 27 May 2026 22:22:18 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-25-45.inter.net.il. [80.230.25.45])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49092968066sm15584235e9.15.2026.05.27.22.22.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 22:22:17 -0700 (PDT)
Date: Thu, 28 May 2026 01:22:15 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Demi Marie Obenour <demiobenour@gmail.com>
Cc: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>
Subject: Re: MSI-X vector limits and reserving a virtio device ID
Message-ID: <20260528010721-mutt-send-email-mst@kernel.org>
References: <11771164-7919-43e1-a980-03f036bdae2e@gmail.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <11771164-7919-43e1-a980-03f036bdae2e@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rA_WEXC4MYp0ZgfH1B-wY4-IU8R80Vn45FbhXdidTiM_1779945739
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 27, 2026 at 07:53:11PM -0400, Demi Marie Obenour wrote:
> I'd like to reserve a virtio device ID for virtio vhost-guest,
> formally virtio vhost-user.  Would this be possible?

yes, follow the regular process for reserving IDs.

> Also, I'd like to know which systems have a small limit on the number
> of MSI-X vectors.  The vhost-guest device uses lots of MSI-X vectors.
> Typical implementations will use 256 * 3 + 7 = 775 of them!  That can,
> of course, be reduced by sharing vectors, but this is undesirable
> as it comes at a performance cost.

A single cpu x86 system?

> -- 
> Sincerely,
> Demi Marie Obenour (she/her/hers)





