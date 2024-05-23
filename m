Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEAE713D296
	for <virtio-comment@lists.linux.dev>; Thu, 23 May 2024 10:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716461553; cv=none; b=ds+hfJwxsG/85UKIRylR/c9NuErPK7+kUEdzZvnNjyBDZbcIIM/NbJtWClRzddvCDl4cMQweeiDSK92OAmBY65hShEZv36KfrxFyvYCI8u3/R8tOJ274AXefKWATEv/ZAULlLPgUP77tVV/o8KKRq19OJWZ4qYA8nk2cvJWcm/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716461553; c=relaxed/simple;
	bh=7SVP3PezU63YFWv1hSarKU3XbmByseKWXT50pj/RuJM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=lY8VJSCOn/ziP+0BB6W4N3Noxx88aWhe7vD7oYHW6mb5Zs4na4P2tu2schiYVL4ZSgxdQ9RGiSOC/lFtfQng5hKlNFfoZLlSh8TDrD8vz4FBW+fploImIC0AIp1DiZh1ueCWOF5dHn59JlTCeo6KoZbT/VUh/tHOavbms5F2JMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Q1dT+36M; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Q1dT+36M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716461550;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iOIAEXHqj3RZiAqqB8FDUqgIA4SBO8At6dDdu4xwbkU=;
	b=Q1dT+36M6Wem53BE+AGuZ+XaSYPURlbqmA5D7K/PwZmhaOhxrhoxaQUeQK1SjAaqRy5QvI
	x7s21w4Mgmu/KE+jPX/DTKW0uNC2hOOZAsPHzCsTJgelxjvIzkdj15rFLjU9ai+K8Bqkhm
	EqyLSWyY25MrAkCboDc8ZSdvzUqcfzA=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-553-d3v6z2c5MH-Iva1eV3zd3Q-1; Thu, 23 May 2024 06:52:28 -0400
X-MC-Unique: d3v6z2c5MH-Iva1eV3zd3Q-1
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-792b8d07e71so1929872785a.2
        for <virtio-comment@lists.linux.dev>; Thu, 23 May 2024 03:52:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716461548; x=1717066348;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iOIAEXHqj3RZiAqqB8FDUqgIA4SBO8At6dDdu4xwbkU=;
        b=pW9ctlhW3b35rfFyoOlxYw1nPwc57r4WjqnGl5gQH26yd9/wBN9SIJNMG5fq82hiIG
         dMj9WzVWT9zAyXVnHF7s+Bh/ZGrdJs0aSLqP/HDSQRuFiu9/6ZfrA5aBdVFUM6nzFTNS
         nXNEYj306JZuw/5NH2lDt+QZTA63tFB9E9H0IVM/XT4BCaJ/PJNz1piteH/eguW5lHAR
         CNXu8iDU9ym4gwzIXsK+QfgmNu8e6J1hBZ7t0uErXBwKdW5uyhclXGteHnPjz3F8onVS
         aQ/HWKgA3fHMC4FNlYZ4XI3CC3g0BEvTYrLYKI0tIh1337Ywg0jp2IJjjsf85BQEJoar
         u66g==
X-Gm-Message-State: AOJu0YxvFD60xvPWJpb3kJ7WlPUqi8OMCOSaLKDciX4RMQl/m7rjtfeT
	TtlEnQPQ/SvvZw059RfApcsxUgti3qNGO8VDYhe+JHlucQ36kY4xF5PuEW6TvyzvmODQ0e8f9vw
	ZYMBcCLyUO1qXvhVrBQ9skbGI0xBviIBZPpvofaVVajmMfJLMFTW3Wzeb8Rb4yVNEsTjMCikM
X-Received: by 2002:a05:620a:51c7:b0:792:b8c8:8654 with SMTP id af79cd13be357-7949941ea3cmr455486585a.17.1716461547736;
        Thu, 23 May 2024 03:52:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHeJ92A6EZrBlO0owTXjXvZ3Vgs8VpVWvUYChWFQd6q9HmeAm7YKJE7YMKA18K0RYkIFIs4wA==
X-Received: by 2002:a05:620a:51c7:b0:792:b8c8:8654 with SMTP id af79cd13be357-7949941ea3cmr455485085a.17.1716461547404;
        Thu, 23 May 2024 03:52:27 -0700 (PDT)
Received: from sgarzare-redhat (host-79-53-30-109.retail.telecomitalia.it. [79.53.30.109])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-792c3ef7caesm1411384985a.57.2024.05.23.03.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 03:52:27 -0700 (PDT)
Date: Thu, 23 May 2024 12:52:21 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Cc: virtio-comment@lists.linux.dev, anton.yakovlev@opensynergy.com
Subject: Re: [PATCH v1 Resend] virtio-sound: add latency_bytes definition
Message-ID: <47kotbmasmkqf4yrm33buotfhw7oddiw46ylg5xifnhykb3nzt@3j3knrbnhgdg>
References: <Zky3vZU+P37H4VPb@fedora>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <Zky3vZU+P37H4VPb@fedora>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On Tue, May 21, 2024 at 05:03:25PM GMT, Matias Ezequiel Vara Larsen wrote:
>This commit aims at providing a better definition of latency_bytes. To
>do so, this commit defines latency_bytes as is defined in Crosvm.
>
>Signed-off-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
>---
>Changelog:
>v0 -> v1:
> * specify that the delay is due to the device implementation.
>---
> device-types/sound/description.tex | 5 ++++-
> 1 file changed, 4 insertions(+), 1 deletion(-)

LGTM!

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

>
>diff --git a/device-types/sound/description.tex b/device-types/sound/description.tex
>index 54c9c8e..a138e5b 100644
>--- a/device-types/sound/description.tex
>+++ b/device-types/sound/description.tex
>@@ -694,7 +694,10 @@ \subsubsection{PCM I/O Messages}\label{sec:Device Types / Sound Device / Device
> \begin{description}
> \item[\field{status}] contains VIRTIO_SND_S_OK if an operation is successful,
> and VIRTIO_SND_S_IO_ERR otherwise.
>-\item[\field{latency_bytes}] indicates the current device latency.
>+\item[\field{latency_bytes}] indicates the current additional delay caused by
>+the device's implementation. For playback, this is the amount of bytes that
>+must be consumed before the current request can be played. For capture, this is
>+the latency in terms of bytes that the capture buffer was recorded.
> \end{description}
>
> Since all buffers in the queue (with one exception) should be of the size
>-- 
>2.41.0
>
>

