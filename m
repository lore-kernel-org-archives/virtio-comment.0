Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90AD1BA87B
	for <virtio-comment@lists.linux.dev>; Mon,  9 Sep 2024 14:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725890581; cv=none; b=ptvcZsk6Ju9uv2piqa+EVrO+vQljd25hyOB3G+6pgwAVV+eK6MBpXrXzjdTL5z4KnwRux8qUdM1F7f8F1RnLQBP+U4xDzZxs+zH3f69+Qmz3Kj8M2MEaS6Wot+1Hi5PtoRgopM+egLku6ub/xnntrbD9p5rIw319We11UBnTCbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725890581; c=relaxed/simple;
	bh=cCDsfcccP2Bbb5GEs6u2SrlRncPiRSRurPRUp1EFtHw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=DwLG3eBcTWvNzDAFOF7lpAZlJkU7msfdp2RVKhDLPVC5Zqb9lG8LHuWW9VgUEQLQAGmyaSPRBXiiZ4TVhcjCnzhSP1lCRdzLWCxgGMVzFebFT3i6vT4hlS7M/AcQDbGNRc2coWm18PwKMiurs4zt3PfY9k7aoyZxJNmg84JpjTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=b1VsaJI3; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="b1VsaJI3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725890578;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zwbUY2WKpw5CP2QmIp+NjcG1ckagt+qId3e7kJ6xcXg=;
	b=b1VsaJI33B/NWWZirciaQw19YLo2GC0aioSjfbVQiAxUCeRfhy1BxxykuBMVEae7ARKSRC
	DfcX7pL+vI16eW6uEGpwiEkuaMrtMXm/6ZpjZqJMe3TUlJOmkoCAFj/XH2lah3FOocD608
	+qZCplwdwDOuIY094UKe9tWtGg1dyIk=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-519-uIZ9iPq_P_-hpb6rqPHE5Q-1; Mon, 09 Sep 2024 10:02:57 -0400
X-MC-Unique: uIZ9iPq_P_-hpb6rqPHE5Q-1
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-458373c736fso9373561cf.0
        for <virtio-comment@lists.linux.dev>; Mon, 09 Sep 2024 07:02:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725890575; x=1726495375;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zwbUY2WKpw5CP2QmIp+NjcG1ckagt+qId3e7kJ6xcXg=;
        b=NOKeJ0DvXm1BuunGTYte75q1i3nHTd+1mP+1sbMC11iD83Xd7jTggWYiO6z0qDzo3/
         47bkaB16+f9xjPt9i5nO2maMGn46CZA+5+nTiDtkB8OdYHz6pMsGlxrs3DjXhPXMQXhu
         7QtFKXpZlmPTfzK28Os3rbEb2EdBlhKz36tU12E4GNv/LtiQI4XG2qxCsxrBWN/Xjq38
         yAhllR88AotBhFb8MAOM09i+3zR5DZYW2t/bS7LGeKwGzKlE3ESQWyaL+agggIlbyAOM
         Iu+uDCKeWwzJzDJMIZQs5jhDBg+YxjSKgH949U5gBtudFckDw22HJwbMASHXiP7sKfoC
         XoTA==
X-Gm-Message-State: AOJu0Ywq03M1xgjeRlpZKNCq442TMt/b1Y4m3+TW8/9Q6fRdGJAA4TRn
	Mzggo7E2NvzQqoLa21zWOzJBmuhAQSeMyGbHtud1X03ipgccTm7YOPRT8gV+HDFoJaADEXzP2IR
	eTsnuSFisIPpIfLexz5n5cTMKEHET8azgc1MAwFOhug8SYq7+WVo8Qc676D5CcENC
X-Received: by 2002:ac8:7f14:0:b0:456:959d:ec34 with SMTP id d75a77b69052e-4581f5eeedbmr99265001cf.45.1725890574887;
        Mon, 09 Sep 2024 07:02:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH02FEv+FOtXOiSrgCzjDa9qRahHTuHmoUm2U0EO9Dp8qyyLSLegVwiwkL+nA5mTL2kagfVkA==
X-Received: by 2002:ac8:7f14:0:b0:456:959d:ec34 with SMTP id d75a77b69052e-4581f5eeedbmr99264391cf.45.1725890574108;
        Mon, 09 Sep 2024 07:02:54 -0700 (PDT)
Received: from fedora (193-248-58-176.ftth.fr.orangecustomers.net. [193.248.58.176])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45822f61ac7sm20535811cf.71.2024.09.09.07.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 07:02:53 -0700 (PDT)
Date: Mon, 9 Sep 2024 16:02:51 +0200
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: virtio-comment@lists.linux.dev, mst@redhat.com, cohuck@redhat.com,
	shahafs@nvidia.com
Subject: Re: [PATCH 1/3] crypto: editorial: Fix spelling errors
Message-ID: <Zt8ACyZA01Pf0+Oa@fedora>
References: <20240907174819.778971-1-parav@nvidia.com>
 <20240907174819.778971-2-parav@nvidia.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240907174819.778971-2-parav@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Sep 07, 2024 at 08:48:17PM +0300, Parav Pandit wrote:
> Fix spelling errors.
> 
> Branch: virtio-1.4
> Fixes: a385dd3366a2 ("virtio-crypto: Add virtio crypto device specification")
> Signed-off-by: Parav Pandit <parav@nvidia.com>
> ---
>  device-types/crypto/description.tex | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/device-types/crypto/description.tex b/device-types/crypto/description.tex
> index 5705e26..e053cc7 100644
> --- a/device-types/crypto/description.tex
> +++ b/device-types/crypto/description.tex
> @@ -424,11 +424,11 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Crypto Device / Devic
>  
>  \field{header} is a general header (see above).
>  
> -\field{op_flf} is the opcode (in \field{header}) specific fixed-length paramenters.
> +\field{op_flf} is the opcode (in \field{header}) specific fixed-length parameters.
>  
>  \field{flf_len} depends on the VIRTIO_CRYPTO_F_REVISION_1 feature bit (see below).
>  
> -\field{op_vlf} is the opcode (in \field{header}) specific variable-length paramenters.
> +\field{op_vlf} is the opcode (in \field{header}) specific variable-length parameters.
>  
>  \field{vlf_len} is the size of the specific structure used.
>  \begin{note}
> @@ -509,7 +509,7 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Crypto Device / Devic
>  \subparagraph{Session operation: HASH session}\label{sec:Device Types / Crypto Device / Device
>  Operation / Control Virtqueue / Session operation / Session operation: HASH session}
>  
> -The fixed-length paramenters of HASH session requests is as follows:
> +The fixed-length parameters of HASH session requests is as follows:
>  
>  \begin{lstlisting}
>  struct virtio_crypto_hash_create_session_flf {
> @@ -1386,7 +1386,7 @@ \subsubsection{Symmetric algorithms Operation}\label{sec:Device Types / Crypto D
>  \end{itemize*}
>  
>  The length of \field{op_type_flf} is fixed to 40 bytes, the data of unused
> -part (if has) will be ingored.
> +part (if has) will be ignored.
>  
>  \field{op_type_vlf} is the \field{op_type} specific parameters, it MUST starts
>  with or be one of the following structures:
> @@ -1536,7 +1536,7 @@ \subsubsection{Symmetric algorithms Operation}\label{sec:Device Types / Crypto D
>  \end{itemize*}
>  
>  The length of \field{op_type_flf} is fixed to 72 bytes, the data of unused
> -part (if has) will be ingored.
> +part (if has) will be ignored.
>  
>  \field{op_type_vlf} is the \field{op_type} specific parameters, it MUST starts
>  with or be one of the following structures:
> -- 
> 2.34.1
> 
> 

Reviewed-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>

Thanks.

