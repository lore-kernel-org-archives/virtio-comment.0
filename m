Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D3C3186A
	for <virtio-comment@lists.linux.dev>; Fri, 21 Jun 2024 13:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718978187; cv=none; b=o77tqIRwA1S1dPGITcArLgpA4CQwoR+eAJWQUHoJilf5sknoTxa/hlRS4/LniWblzI2o80AoLgtlxYEAR/Atmy7Acc5CCDbauvWizH+brlpS9yw2luruhsBh4/HU1n65m9RJ4c7mD0bm8Jod2rqbLYIAQ7nIjFc9Zuc732Xa4CI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718978187; c=relaxed/simple;
	bh=acnyg+4GrlNrTfxOdfqr3cwanUGd25fTH3MG8Ifogvo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=Eh3flO0/frjAtNXKR0qM6HRwg5FIjd4ee92zagokl6VoTXNs8/rERG89C2oMgxoZGhU7ovutMX7THrY12Q7z4rEvtKSWr2tIwrwuTX+8FX0r1Qtt0kdlpWkxnHp4Fh1MkhsUkRbQFQpo8tFSTwkk+tT10HpO632RTVKYE3eI6fU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=E8aw6T6p; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="E8aw6T6p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718978184;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vfIcr+gArSeDkLS4wwnJDT1ZruQ9ARGa6V/xHrA0t68=;
	b=E8aw6T6p8RJRZzi4xpfGixuAIJaJY4hGEpYBdSMZ+MgAd5N0KEnrkqb8AWArwN3ABW7S3b
	f7K0KgfJaVnoPd4TpJXEd4MroZhn2HIRunA8WeylmcxoG9dk+IRZaTNSYWdwMdUV4t+rAB
	B1F6sYatSK8YNdqfh0SAK8qGTt6HWFc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-190-apyu96_fNSKSSfh1uThzyA-1; Fri, 21 Jun 2024 09:56:22 -0400
X-MC-Unique: apyu96_fNSKSSfh1uThzyA-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-362c63ffb64so998948f8f.0
        for <virtio-comment@lists.linux.dev>; Fri, 21 Jun 2024 06:56:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718978181; x=1719582981;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vfIcr+gArSeDkLS4wwnJDT1ZruQ9ARGa6V/xHrA0t68=;
        b=ut/i7W2w3IyYox5SqPrHnywjRt6MrdCrnt4K2FbCwGQEJQGUnhziZKWhtAe4CC8LNk
         lH1i8gASlhFOcPp7oOyym07z4kiNQr4zYQtKgBVKdU/YQdQ2q4V/knoY+MIcLtQFgXDo
         ElBpV4T1PaJTo9mbPGtjDhv+y8PrnFBkKwzkyAloZV/DmkZixit5TUpFMzg82264BqDt
         Fuq6MdcrPap75tUg1OmgvHkFf/0F3/O+f3LWWmrpP5peEHFfKkK0O0Rjpt0lJiBR/fyX
         kKC6TKcoIpR0cZ4oNEIFSM7mB46D020htilIRRy0fuRhGNIeQB7nniuGsef+nZvk9Nuk
         /RAw==
X-Gm-Message-State: AOJu0YyHsV+ygRSDgXgGr/o9cIaVsnaxJmjzK7izziPhzl/EtMesydRt
	WJCkl5iAg95Gr9vCKgaCOt3PQRnmVENLZy70j0tw9AQF2R5GhqCvq1frgQhbb62qBVHXSsaG3RK
	4bCfbauh8VH6Q/pEW4gtZKXI9kKP06IxIgFRpYAWLZ5ztjYt/HoQUwpragyBWGlSc
X-Received: by 2002:a05:6000:e81:b0:362:ad01:5435 with SMTP id ffacd0b85a97d-3630191cd53mr8143212f8f.29.1718978181464;
        Fri, 21 Jun 2024 06:56:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFS+EmbFN8Pii5M66TjZmXgsOhIcUON0hy+7EHPqUaHn5BD+MUDjMl/JsYzm/2/rFzFnGJbVQ==
X-Received: by 2002:a05:6000:e81:b0:362:ad01:5435 with SMTP id ffacd0b85a97d-3630191cd53mr8143179f8f.29.1718978180692;
        Fri, 21 Jun 2024 06:56:20 -0700 (PDT)
Received: from redhat.com ([2.52.146.100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3663a8cb6d2sm1812025f8f.111.2024.06.21.06.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 06:56:19 -0700 (PDT)
Date: Fri, 21 Jun 2024 09:56:16 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Cc: virtio-comment@lists.linux.dev, anton.yakovlev@opensynergy.com,
	sgarzare@redhat.com
Subject: Re: [PATCH v1 Resend] virtio-sound: add latency_bytes definition
Message-ID: <20240621095414-mutt-send-email-mst@kernel.org>
References: <Zky3vZU+P37H4VPb@fedora>
 <ZnWCGR9tkSrKPzX2@fedora>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <ZnWCGR9tkSrKPzX2@fedora>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 21, 2024 at 03:37:29PM +0200, Matias Ezequiel Vara Larsen wrote:
> On Tue, May 21, 2024 at 05:03:25PM +0200, Matias Ezequiel Vara Larsen wrote:
> > This commit aims at providing a better definition of latency_bytes. To
> > do so, this commit defines latency_bytes as is defined in Crosvm.
> > 
> > Signed-off-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
> > ---
> > Changelog:
> > v0 -> v1:
> >  * specify that the delay is due to the device implementation.
> > ---
> >  device-types/sound/description.tex | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/device-types/sound/description.tex b/device-types/sound/description.tex
> > index 54c9c8e..a138e5b 100644
> > --- a/device-types/sound/description.tex
> > +++ b/device-types/sound/description.tex
> > @@ -694,7 +694,10 @@ \subsubsection{PCM I/O Messages}\label{sec:Device Types / Sound Device / Device
> >  \begin{description}
> >  \item[\field{status}] contains VIRTIO_SND_S_OK if an operation is successful,
> >  and VIRTIO_SND_S_IO_ERR otherwise.
> > -\item[\field{latency_bytes}] indicates the current device latency.
> > +\item[\field{latency_bytes}] indicates the current additional delay caused by
> > +the device's implementation. For playback, this is the amount of bytes that
> > +must be consumed before the current request can be played. For capture, this is
> > +the latency in terms of bytes that the capture buffer was recorded.


the last "was recorded" seems agrammatical. Do you mean "has recorded"?

> >  \end{description}
> >  
> >  Since all buffers in the queue (with one exception) should be of the size
> > -- 
> > 2.41.0
> > 
> Dear TC,
> 
> I'd like to request a vote on solving issue 198.
> 
> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/198
> 
> Matias


OK. Can you pls add a bit more detail about the issue and
the proposal in github?

