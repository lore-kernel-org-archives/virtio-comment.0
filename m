Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4221E1CD215
	for <virtio-comment@lists.linux.dev>; Thu, 26 Dec 2024 07:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735198156; cv=none; b=h6uOMLaaRur7IfgfhKrRv3N8OlzV4IelfnzJHG3Ia0xlVFsOOs1tRMDgB3OhONxnE9QexUu2xyuCsUFWeGlonxh9v7H4wlD//5FqjbitR7eCwB7VhIFLDlOf2j8DJEFham9iBQCvDZMdwSHOEbO5F8SPmaWggYo/de0s1Qi6w8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735198156; c=relaxed/simple;
	bh=8NXBTrj7N+WOyfXoOYUJIyg1N2pPMEXUluTCzSGpNhU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=VOAGwMZcyXJKFJ9ok9TJHRztJb7+EeE6ln6v2TBeNjjFQ9/yORvRH4sWUpF/3u/1soD2kB2/gprf9uNAdaILY3pDNdqV/i7rYfnTIWaoQVHo24hjOWUS8Ur329c/FlVlKyAevn327M3x67lA8ojZMZvS+L5yYAn1+4hb0TB+l50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Xf9yuq+w; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Xf9yuq+w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1735198153;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IbP4qKhIgH1Oy1+4J0inweL5dgw3/eCPCWfxrTlZIcA=;
	b=Xf9yuq+wrBv4AXy5XfAatpoEI4/DNUqvTygAed5J7TN7MDU4meFtwJjkZ944AUlXZHHVh4
	5uxIMygKHlNJBe7cf96ZM/kBNcFy2aYoyXOLUHUUFwTNeZWhjml2W2UmfK92JkFC85lyXl
	p3gw2qrRX6M9Wwi8Z49hffUli2AGBJw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-467-i3Y3oSziNB60FuCOoksLIw-1; Thu, 26 Dec 2024 02:29:11 -0500
X-MC-Unique: i3Y3oSziNB60FuCOoksLIw-1
X-Mimecast-MFC-AGG-ID: i3Y3oSziNB60FuCOoksLIw
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4359eb032c9so48317425e9.2
        for <virtio-comment@lists.linux.dev>; Wed, 25 Dec 2024 23:29:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735198150; x=1735802950;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IbP4qKhIgH1Oy1+4J0inweL5dgw3/eCPCWfxrTlZIcA=;
        b=dspa9E9vMJ/TR3jQs1aZah1sN8duVMPZIuTvR8sdO/IzmRUJaiMDe4NO1B0nK15eUo
         h/mRKnVz161o6sFvgANe24LC7LE9yvO9/C2H9y76HAMAL9YX6PY8rohUWgY0RGZ0d6RS
         uXCJRPphjOCqEbVR+Dv5UdiZiyIYhrunjeZqYG/n7YKS7IakUfIOAPAMZaUUYts94mE3
         gz04aAD3lusosQ+tHuOIrfNMlSGd6YVyxLjMV8IyUF7YBO0tDCGb7JKLGNSvpKdwIpug
         TGAogKOo2rw0kn/LvklGFjDRwXy6MU1CVHLTcqkHSNL5LxDKI+yGNahfSIIxoS1qVpq9
         rw1Q==
X-Gm-Message-State: AOJu0YzI1wLhGblCFAEnoAIRPZyxenpNAfQ1Dzyh/sBoupmEPzGx5453
	ZtMsrLwaUWC6LPhjn3w9a7CpEfRLKw2bzFumk9fCmpKDPi53Zo2knPfUF7lRLoujYgWU+mz2IJt
	0cqYpVW33xTImPxl82fVH0JU5qmBy1K4YtVaBMYuPhszC68hBT7F8d76fMz/NzBPWVzEJP2ON
X-Gm-Gg: ASbGnctxItaQfTOrehl+eFHhRpciwIXOuXteZoqbHQFp5oSB/ze5HpxBnDGUp8TT96W
	gHwRFZKx65H/NyQpCGrcFVLPtClXWmbSz3tTh0AJmENmL+1BbFVLHZ4r9bWpBIXFCiaTjI/gPdt
	1eXzq9/H72fFFBrri+WJwnjXxUsatCgWdMWds/nOcnlaMQieJiBpuxqlCacewJfhNkp0hluPQ0l
	7loWcvfGou8682O9A8uCr71rUXzfKQq6DIfMi4JNvDybkzzDw==
X-Received: by 2002:a5d:64cf:0:b0:382:3c7b:9ae with SMTP id ffacd0b85a97d-38a221f6746mr19644579f8f.16.1735198150179;
        Wed, 25 Dec 2024 23:29:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEqKcF2DuYuypl7FtlG+Uc7BIVq/MFRAeE3I0rCfaKuNnjkKZknGpNCzCIkF1vSqx0didn2Zw==
X-Received: by 2002:a5d:64cf:0:b0:382:3c7b:9ae with SMTP id ffacd0b85a97d-38a221f6746mr19644563f8f.16.1735198149810;
        Wed, 25 Dec 2024 23:29:09 -0800 (PST)
Received: from redhat.com ([2a02:14f:1f2:9e6:f7bb:3b80:d3c1:75b1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8a8d7esm18823688f8f.101.2024.12.25.23.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Dec 2024 23:29:09 -0800 (PST)
Date: Thu, 26 Dec 2024 02:29:05 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: virtio-comment@lists.linux.dev, Jason Wang <jasowang@redhat.com>,
	Parav Pandit <parav@nvidia.com>, devel@daynix.com
Subject: Re: [PATCH] virtio-net: Ignore num_buffers when unused
Message-ID: <20241226022749-mutt-send-email-mst@kernel.org>
References: <20241226-reserved-v1-1-39ca566889c0@daynix.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20241226-reserved-v1-1-39ca566889c0@daynix.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: T_ckEmnGt_ZexxPOwRkDW6u3Qo0VbtJLoFiEmbAbKS4_1735198150
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 26, 2024 at 02:37:17PM +0900, Akihiko Odaki wrote:
> If VIRTIO_NET_F_MRG_RXBUF has not been negotuated, vhost_net and QEMU
> sets num_buffers to zero while the specification tells to set it to one.
> 
> Let drivers ignore the field to make them compatible with both
> vhost_net/QEMU and devices already compliant with the specification.
> Also, remove statements requiring devices to set the field to one to
> make vhost_net and QEMU compliant.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>  device-types/net/description.tex | 26 +++++++++++---------------
>  1 file changed, 11 insertions(+), 15 deletions(-)
> 
> diff --git a/device-types/net/description.tex b/device-types/net/description.tex
> index 76585b0..b82fe8f 100644
> --- a/device-types/net/description.tex
> +++ b/device-types/net/description.tex
> @@ -683,15 +683,12 @@ \subsubsection{Setting Up Receive Buffers}\label{sec:Device Types / Network Devi
>  
>  \devicenormative{\paragraph}{Setting Up Receive Buffers}{Device Types / Network Device / Device Operation / Setting Up Receive Buffers}
>  
> -The device MUST set \field{num_buffers} to the number of descriptors used to
> -hold the incoming packet.
> +If VIRTIO_NET_F_MRG_RXBUF was negotiated, the device MUST set
> +\field{num_buffers} to the number of descriptors used to hold the incoming
> +packet.
>  
>  The device MUST use only a single descriptor if VIRTIO_NET_F_MRG_RXBUF
>  was not negotiated.
> -\begin{note}
> -{This means that \field{num_buffers} will always be 1
> -if VIRTIO_NET_F_MRG_RXBUF is not negotiated.}
> -\end{note}
>  
>  \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network Device / Device Operation / Processing of Incoming Packets}
>  \label{sec:Device Types / Network Device / Device Operation / Processing of Packets}%old label for latexdiff
> @@ -704,9 +701,8 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
>  Processing incoming packets involves:
>  
>  \begin{enumerate}
> -\item \field{num_buffers} indicates how many descriptors
> -  this packet is spread over (including this one): this will
> -  always be 1 if VIRTIO_NET_F_MRG_RXBUF was not negotiated.
> +\item If VIRTIO_NET_F_MRG_RXBUF was negogiated, \field{num_buffers} indicates
> +  how many descriptors this packet is spread over (including this one).
>    This allows receipt of large packets without having to allocate large
>    buffers: a packet that does not fit in a single buffer can flow
>    over to the next buffer, and so on. In this case, there will be
> @@ -717,9 +713,9 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
>    The other buffers will not begin with a struct virtio_net_hdr.
>  
>  \item If
> -  \field{num_buffers} is one, then the entire packet will be
> -  contained within this buffer, immediately following the struct
> -  virtio_net_hdr.
> +  VIRTIO_NET_F_MRG_RXBUF was not negotiated or \field{num_buffers} is one, then
> +  the entire packet will be contained within this buffer, immediately following
> +  the struct virtio_net_hdr.
>  \item If the VIRTIO_NET_F_GUEST_CSUM feature was negotiated, the
>    VIRTIO_NET_HDR_F_DATA_VALID bit in \field{flags} can be
>    set: if so, device has validated the packet checksum.
> @@ -764,9 +760,6 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
>  \devicenormative{\paragraph}{Processing of Incoming Packets}{Device Types / Network Device / Device Operation / Processing of Incoming Packets}
>  \label{devicenormative:Device Types / Network Device / Device Operation / Processing of Packets}%old label for latexdiff
>  
> -If VIRTIO_NET_F_MRG_RXBUF has not been negotiated, the device MUST set
> -\field{num_buffers} to 1.
> -
>  If VIRTIO_NET_F_MRG_RXBUF has been negotiated, the device MUST set
>  \field{num_buffers} to indicate the number of buffers
>  the packet (including the header) is spread over.
> @@ -863,6 +856,9 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
>  This is due to various bugs in implementations.
>  \end{note}
>  
> +If VIRTIO_NET_F_MRG_RXBUF has not been negotiated, the driver MUST ignore
> +\field{num_buffers}.
> +
>  If neither VIRTIO_NET_HDR_F_NEEDS_CSUM nor
>  VIRTIO_NET_HDR_F_DATA_VALID is set, the driver MUST NOT
>  rely on the packet checksum being correct.


There could be drivers relying on it.
We can add a SHOULD not and ask drivers not to look at it,
and we should fix devices.


> ---
> base-commit: b495841a8e80d12c1130f8868f4128866291142d
> change-id: 20241226-reserved-d5960f173223
> 
> Best regards,
> -- 
> Akihiko Odaki <akihiko.odaki@daynix.com>

