Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16DF1552F8
	for <virtio-comment@lists.linux.dev>; Fri, 21 Jun 2024 13:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718976224; cv=none; b=ZqdntuzQKXBI5WneZEwp+pP4OfQ221Ur2iHNO7j8A1dt53UbEnDdzh5SJgR+UuUTemuF7twJ7+CRoQ5bVgiDSXNWJ7uce9mAkC4SxuH8mgqWmlyXH9J4Es27IzJBEwgYq59fYSr8KLEDMUY/J8EJZFs8tqrUmZgH4iIG4DeuZs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718976224; c=relaxed/simple;
	bh=HFknZby+ix4kvXrWIARQduBagUD4vBdG3U/E2QVL1S4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=nlifKuEZLxST784xDKy42ZpbTnf9cG9BqLlYyx/ljHX0t0iQoIjFVea5fabiGCLB/SRN3/hVlU/QMI3p7jgFG9cBJn/BP1MB5fIBMvBFzrYvgsbSRFS/N4pMNvDsC/1KULD/qYBp685bdMcikhceCxeOBF8ey0p2QsIZsiqwOro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EET8123f; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EET8123f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718976221;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OuGaric/uZe+LzUOzjNMqqnjAW5UZK+kuLXJ7RHvONU=;
	b=EET8123fszxPYLollRPn6IavTSp+co7RggnKRYcgB3UkH3ZeuGlNay2owb3DF6yK9gPsKp
	iE/d/9P97q8ogPPdHA13CQNR0MzeN1ZKmrPWudRoD9vUjSMda0fCrzupIkBL2gkeoHlGRZ
	eoa9nibf/jQtmMq9+UR5qmezBZwkj8w=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-583-KF5uiDslMWexvtrkzB6Bzg-1; Fri, 21 Jun 2024 09:23:39 -0400
X-MC-Unique: KF5uiDslMWexvtrkzB6Bzg-1
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-3d21b50f896so1945585b6e.0
        for <virtio-comment@lists.linux.dev>; Fri, 21 Jun 2024 06:23:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718976219; x=1719581019;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OuGaric/uZe+LzUOzjNMqqnjAW5UZK+kuLXJ7RHvONU=;
        b=U71Phdlo7bdhYYlwRDCkNYaFZqhKoND1EZZlwLxCTk3WiYbD+xZlOkwPpuV5xwlkKM
         /hvKNicdaSvB/OMOIHg67Em+WtX/tte9jlBsT3K/LRsEryj6rdq+SaLujRfhfgX9UBqm
         UocU/2iQj3hAOqvo9NerBFibfYNJBV276tQythkh1Xe2EzniNWwFC71YKYxFSXA8/2uL
         Ch8WNZBuKe8NJgrzT/25hpVTJmnOctGic9C9H2qvLhW8ldfWICYd48Kpc7xdajZG/kSJ
         9EEW0tFjUDzAp4xVZsqg1MlCEf530pS+98FeByftwTHp+dHj3q4gpIDimU4SzBmJAsXb
         9j0A==
X-Gm-Message-State: AOJu0YxZtEvwqRi3y75IScWdS21VRvzhehJRoYzlDuODuWaDh+JPVsTF
	RGExY80Lm9rcPwuUFjD2Ozr1V/4whWM/FptgEST+odznYKgqaVqLGrIo0GbwtvK4pqWfAZ3U4n8
	4eFPtC4ItlodUWQeyDUMwCjpljp3fGIEkkzE0Y5XEkXXfale3rBQKnVsd8nOyo6AOcgLePie4JA
	qJDLD3F/LGb2rtlQSWoccJs/kVDqN4Gxg4vExbOEGeoreJpKlJ
X-Received: by 2002:a05:6808:1290:b0:3d2:1523:8d85 with SMTP id 5614622812f47-3d51bb0aaf6mr9877530b6e.59.1718976218829;
        Fri, 21 Jun 2024 06:23:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGUvosmEElTazu1lisJxpdB7NfdC5UTIjqtZYI55xj+Vf8xhHZi3O2RCY+KkXSou161HRfvcA==
X-Received: by 2002:a05:6808:1290:b0:3d2:1523:8d85 with SMTP id 5614622812f47-3d51bb0aaf6mr9877495b6e.59.1718976218200;
        Fri, 21 Jun 2024 06:23:38 -0700 (PDT)
Received: from fedora ([2a01:e0a:257:8c60:80f1:cdf8:48d0:b0a1])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-444cbb41a48sm1494961cf.10.2024.06.21.06.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 06:23:37 -0700 (PDT)
Date: Fri, 21 Jun 2024 15:23:35 +0200
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: virtio-comment@lists.linux.dev
Cc: anton.yakovlev@opensynergy.com
Subject: Re: [PATCH] virtio-sound: use 'data buffer' instead of 'buffer'
Message-ID: <ZnV+1/3o8AFtkXrk@fedora>
References: <ZWhq3eOxSZ8a7sd1@fedora>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <ZWhq3eOxSZ8a7sd1@fedora>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 30, 2023 at 11:58:37AM +0100, Matias Ezequiel Vara Larsen wrote:
> This commit replaces the wording 'buffer' with 'data buffer' when
> referring to the payload of PCM messages. The virtio specification
> defines the word buffer as a set of zero or more device-readable
> physically-contiguous elements followed by zero or more
> physically-contiguous device-writable elements. In the virtio-sound
> section, the word is used only for the data or payload in a request. In
> this case, the data buffer is sent together with a header, i.e.,
> device-readable, and the status, i.e., device-writable. To not get
> confused with the main definition, this commit replaces those usages
> with the wording 'data buffer'.
> 
> Reviewed-by: Anton Yakovlev <anton.yakovlev@opensynergy.com>
> Signed-off-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
> ---
>  device-types/sound/description.tex | 26 +++++++++++++-------------
>  1 file changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/device-types/sound/description.tex b/device-types/sound/description.tex
> index 54c9c8e..97151fa 100644
> --- a/device-types/sound/description.tex
> +++ b/device-types/sound/description.tex
> @@ -667,8 +667,8 @@ \subsubsection{PCM Notifications}
>  
>  \subsubsection{PCM I/O Messages}\label{sec:Device Types / Sound Device / Device Operation / PCM IO Messages}
>  
> -An I/O message consists of the header part, followed by the buffer, and then
> -the status part.
> +An I/O message consists of a buffer that contains a header part, followed by
> +the data buffer, and then the status part.
>  
>  \begin{lstlisting}
>  /* an I/O header */
> @@ -697,20 +697,20 @@ \subsubsection{PCM I/O Messages}\label{sec:Device Types / Sound Device / Device
>  \item[\field{latency_bytes}] indicates the current device latency.
>  \end{description}
>  
> -Since all buffers in the queue (with one exception) should be of the size
> +Since all data buffers in the queue (with one exception) should be of the size
>  \field{period_bytes}, the completion of such an I/O request can be considered an
>  elapsed period notification.
>  
>  \paragraph{Output Stream}
>  
> -In case of an output stream, the header is followed by a device-readable buffer
> -containing PCM frames for writing to the device. All messages are placed into
> -the tx queue.
> +In case of an output stream, the header is followed by a device-readable data
> +buffer containing PCM frames for writing to the device. All messages are placed
> +into the tx queue.
>  
>  \devicenormative{\subparagraph}{Output Stream}{Device Types / Sound Device / Device Operation / PCM Output Stream}
>  
>  \begin{itemize}
> -\item The device MUST NOT complete the I/O request until the buffer is totally
> +\item The device MUST NOT complete the I/O request until the data buffer is totally
>  consumed.
>  \end{itemize}
>  
> @@ -718,13 +718,13 @@ \subsubsection{PCM I/O Messages}\label{sec:Device Types / Sound Device / Device
>  
>  \begin{itemize}
>  \item The driver SHOULD populate the tx queue with \field{period_bytes} sized
> -buffers. The only exception is the end of the stream.
> -\item The driver MUST NOT place device-writable buffers into the tx queue.
> +data buffers. The only exception is the end of the stream.
> +\item The driver MUST NOT place device-writable data buffers into the tx queue.
>  \end{itemize}
>  
>  \paragraph{Input Stream}
>  
> -In case of an input stream, the header is followed by a device-writable buffer
> +In case of an input stream, the header is followed by a device-writable data buffer
>  being populated with PCM frames from the device. All messages are placed into
>  the rx queue.
>  
> @@ -735,7 +735,7 @@ \subsubsection{PCM I/O Messages}\label{sec:Device Types / Sound Device / Device
>  \devicenormative{\subparagraph}{Input Stream}{Device Types / Sound Device / Device Operation / PCM Input Stream}
>  
>  \begin{itemize}
> -\item The device MUST NOT complete the I/O request until the buffer is full.
> +\item The device MUST NOT complete the I/O request until the data buffer is full.
>  The only exception is the end of the stream.
>  \end{itemize}
>  
> @@ -743,8 +743,8 @@ \subsubsection{PCM I/O Messages}\label{sec:Device Types / Sound Device / Device
>  
>  \begin{itemize}
>  \item The driver SHOULD populate the rx queue with \field{period_bytes} sized
> -empty buffers before starting the stream.
> -\item The driver MUST NOT place device-readable buffers into the rx queue.
> +empty data buffers before starting the stream.
> +\item The driver MUST NOT place device-readable data buffers into the rx queue.
>  \end{itemize}
>  
>  \subsubsection{Channel Map Control Messages}\label{sec:Device Types / Sound Device / Device Operation / Channel Map Control Messages}
> -- 
> 2.41.0
> 
Dear TC,

I'd like to request a vote on solving issue 190.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/190

Matias

