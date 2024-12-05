Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09FE217707
	for <virtio-comment@lists.linux.dev>; Thu,  5 Dec 2024 12:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733400254; cv=none; b=cDAMsrJUh0G6rssIdLvsyVp0S7dt0QZJWTye8NgZMD9niapOLDrcjnL4k7dsfZpIzXmMX//tlWKYKIIqJ5CXAidO3f+bcvHHp6+9yd9RcZ0NDxliw2NSdDXgKVw9xupIGPu/3Lx6JLfdVIB+qgRUvBYONhmTv5NhcNFTJ0u0m08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733400254; c=relaxed/simple;
	bh=o00srngiqA6v30fjulrpJ2udob9q6DRPKTnNwYQVPN4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=iEDyM5Ik6b2w77HOA/mkFYFVbrkJnjrwgaCigykKL95nI1P5Tc7o6P7HwxG6392y4ubAcSgS1g5vikLkQiNygEFXikiNq2HFnI9yhgTQ2Ce7Zk3N1yxJawLHn7fGA/IdB5Ia+YEDI/Gfrt636bDKmlBYCQtda83g/ab0OhZKe/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=I0J0lRZS; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="I0J0lRZS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733400250;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=C0eakQUs/WFhYIQlXwgOfZmRlAlVMaGlbpxDa9zBW1A=;
	b=I0J0lRZSgeW+pbOLHWqy/T6uY91nKSVu857LuqPIfQ84FhQyoOXj0ype3cVMS1EuTxWNC/
	5xGCbjh0bdfjsWqD9VtBg5WCm0Dvc27U94JRlikXb/yHztu6nTuN9sa7JE26vVrfHSMFGn
	LYY7hBY640Ige12IPfOUmggaHlwQFeU=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-494-hYrF7AiNNuujVbnqXZonyw-1; Thu, 05 Dec 2024 07:04:09 -0500
X-MC-Unique: hYrF7AiNNuujVbnqXZonyw-1
X-Mimecast-MFC-AGG-ID: hYrF7AiNNuujVbnqXZonyw
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6d8d44e17a2so22576976d6.3
        for <virtio-comment@lists.linux.dev>; Thu, 05 Dec 2024 04:04:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733400249; x=1734005049;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C0eakQUs/WFhYIQlXwgOfZmRlAlVMaGlbpxDa9zBW1A=;
        b=hUAX/TPAGGSp5TOUbzkeQuVZ+lZYFZiFPDba29H+lQ3YColhXyn/YEHc3gxvaHNGXm
         iJw6eEGPzUAf6OFmx6pRKtQ32F/mxKReANBj3vm1W8+fjmDzWRQ1HYP/OwXvWck0Bosb
         Byt70Mys1KRQRUJCQb7Xax9aabue4T4ueswsaknAghJkM/zUcpMHIIdoXV/CpYgGzKUE
         OMytyeganQxviEHPo/MLBmZGgmqaj5QMb9WHKGK85ldguh/w2AuNeKVPNirlXl1FBO3N
         Dmz2woAZbkzKvkcdrtmORUO0ZnXDXzZ3Ezn6nJvSz0o9TpfKYZiyF65nOtTn+o6h97Wr
         CZBA==
X-Gm-Message-State: AOJu0YxHTAM+AF+DXhFLs7f6t6yJetLKau2mhOTpq98zM9CfwvVTine6
	t4ZUDBmsEINo9u1Wkr5EfcfLC34hoC25EBvR2+KA8riohQ5GSog8k0SrWSvNsgsr3VJnmjOyUpR
	0WOuXshZbaBccBtGhc2iomr3My5oORDodMlrbQ8USy8rxwBvmWq9DlRuhebWBaj+y
X-Gm-Gg: ASbGncvN+XX+2YfPQ+F3Y4cLwsN5goc6/0G8x4z+mJBqgXR+jb7J9SrESwS0DwA1osd
	JKjvjmq1nO8VocVEogM/6axCctPeATm9TxYxq8ZWNf5Ig2N+dY5xkR1LKORW9UJKB0jiU1cLeGe
	fS6i3cWP29tpx4CsMudRx8mVbpk+FlzGFq6WfDb5PRnC72C+uKWX+H8umLq9aoNXEgIDGpu2e/4
	vvFRGWcEW6hWGuRT1xw8X34FssXaDZFzrd44oxRTA==
X-Received: by 2002:a05:6214:411a:b0:6d8:8874:2127 with SMTP id 6a1803df08f44-6d8b72e0676mr153333436d6.5.1733400249336;
        Thu, 05 Dec 2024 04:04:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHl6pn1qkp54EvQy8+8IgaUMq3t1hutXoY9EOeM8OJ0rNOkqikaz3lCXb8NSAKBlgu3bpVevg==
X-Received: by 2002:a05:6214:411a:b0:6d8:8874:2127 with SMTP id 6a1803df08f44-6d8b72e0676mr153333026d6.5.1733400248949;
        Thu, 05 Dec 2024 04:04:08 -0800 (PST)
Received: from fedora ([212.157.222.2])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d8da696d9esm5811226d6.46.2024.12.05.04.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 04:04:08 -0800 (PST)
Date: Thu, 5 Dec 2024 13:04:05 +0100
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: Srujana Challa <schalla@marvell.com>
Cc: virtio-comment@lists.linux.dev, mst@redhat.com, cohuck@redhat.com,
	parav@nvidia.com, sburla@marvell.com, ndabilpuram@marvell.com,
	jerinj@marvell.com, anoobj@marvell.com
Subject: Re: [PATCH RFC 1/4] virtio-crypto: Add IPsec service operation and
 Capabilities
Message-ID: <Z1GWtTWaQJvVrBxj@fedora>
References: <20241115114523.1787840-1-schalla@marvell.com>
 <20241115114523.1787840-2-schalla@marvell.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20241115114523.1787840-2-schalla@marvell.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Bg3gmIqXdyb4YIM05Eiipwh4EKm2YV0UMG0F9uAz3Y0_1733400249
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello, 

I left some minor comments:

On Fri, Nov 15, 2024 at 05:15:20PM +0530, Srujana Challa wrote:
> This commit introduces the IPsec service operation to the Crypto
> device, enabling offloading of IPsec processing.
> 
> Capabilities:
> 
> 1. IPsec Resource Capability (VIRTIO_CRYPTO_IPSEC_RESOURCE_CAP):
>    Indicates the device's IPsec resource limits, such as the number of
>    outbound and inbound Security Associations (SAs).
> 2. IPsec SA Capability (VIRTIO_CRYPTO_IPSEC_SA_CAP): Specifies the
>    supported IPsec modes, along with the supported cryptographic
>    algorithms, authentication algorithms, IPsec options and
>    anti-replay window size.
> 
> Signed-off-by: Srujana Challa <schalla@marvell.com>
> ---
>  device-types/crypto/description.tex | 164 +++++++++++++++++++++++++++-
>  1 file changed, 159 insertions(+), 5 deletions(-)
> 
> diff --git a/device-types/crypto/description.tex b/device-types/crypto/description.tex
> index 5705e26..ce4b1fb 100644
> --- a/device-types/crypto/description.tex
> +++ b/device-types/crypto/description.tex
> @@ -2,11 +2,11 @@ \section{Crypto Device}\label{sec:Device Types / Crypto Device}
>  
>  The virtio crypto device is a virtual cryptography device as well as a
>  virtual cryptographic accelerator. The virtio crypto device provides the
> -following crypto services: CIPHER, MAC, HASH, AEAD and AKCIPHER. Virtio crypto
> -devices have a single control queue and at least one data queue. Crypto
> -operation requests are placed into a data queue, and serviced by the
> -device. Some crypto operation requests are only valid in the context of a
> -session. The role of the control queue is facilitating control operation
> +following crypto services: CIPHER, MAC, HASH, AEAD, AKCIPHER and IPSEC.
> +Virtio crypto devices have a single control queue and at least one data
> +queue. Crypto operation requests are placed into a data queue, and serviced
> +by the device. Some crypto operation requests are only valid in the context
> +of a session. The role of the control queue is facilitating control operation
>  requests. Sessions management is realized with control operation
>  requests.
>  
> @@ -72,6 +72,8 @@ \subsection{Supported crypto services}\label{sec:Device Types / Crypto Device /
>  #define VIRTIO_CRYPTO_SERVICE_AEAD   3
>  /* AKCIPHER (Asymmetric Key Cipher) service */
>  #define VIRTIO_CRYPTO_SERVICE_AKCIPHER 4
> +/* IPSEC service */
> +#define VIRTIO_CRYPTO_SERVICE_IPSEC  5
>  \end{lstlisting}
>  
>  The above constants designate bits used to indicate the which of crypto services are
> @@ -318,6 +320,20 @@ \subsection{Device Initialization}\label{sec:Device Types / Crypto Device / Devi
>  \item The driver MUST read the supported algorithms based on \field{crypto_services} field.
>  \end{itemize*}
>  
> +\subsection{Device and driver capabilities}\label{sec:Device Types / Crypto Device / Device and driver capabilities}
> +
> +The crypto device has the following capabilities.
> +
> +\begin{tabularx}{\textwidth}{ |l||l|X| }
> +\hline
> +Identifier & Name & Description \\
> +\hline \hline
> +0x0800 & \hyperref[par:Device Types / Crypto Device / Device Operation / IPsec Service Operation / Device and driver capabilities / VIRTIO-CRYPTO-IPSEC-RESOURCE-CAP]{VIRTIO_CRYPTO_IPSEC_RESOURCE_CAP} & IPsec resource capability \\
> +\hline
> +0x0801 & \hyperref[par:Device Types / Crypto Device / Device Operation / IPsec Service Operation / Device and driver capabilities / VIRTIO-CRYPTO-IPSEC-SA-CAP]{VIRTIO_CRYPTO_IPSEC_SA_CAP} & IPsec Security Association(SA) capability \\
> +\hline
> +\end{tabularx}
> +
>  \subsection{Device Operation}\label{sec:Device Types / Crypto Device / Device Operation}
>  
>  The operation of a virtio crypto device is driven by requests placed on the virtqueues.
> @@ -1872,3 +1888,141 @@ \subsubsection{AKCIPHER Service Operation}\label{sec:Device Types / Crypto Devic
>  \item VIRTIO_CRYPTO_ERR if any failure not mentioned above occurs.
>  \end{itemize*}
>  \end{itemize*}
> +
> +\subsubsection{IPSEC Service Operation}\label{sec:Device Types / Crypto Device / Device Operation / IPSEC Service Operation}
> +
> +A crypto device can support the programming of IPsec Security Associations(SAs).
> +In addition to standard crypto processing, the IPsec protocol processing is
> +also offloaded to the Crypto Device as lookaside operation.
> +
> +IPsec Inbound processing: The device will perform decryption, authentication,
> +integrity checking and remove additional headers, including tunnel headers if
> +in tunnel mode, as well as the ESP/AH header from the packet. The resulting
> +packet contains only the plain data.
> +
> +IPsec Outbound processing: The device will perform encryption, attach ICV,
> +update/add IP headers, add ESP/AH headers/trailers.
> +
> +A crypto device can support number of IPsec SAs, allowing it to manage multiple secure
> +connections simultaneously.
> +
> +The device and the driver indicates IPsec SA resource limits using the capability

s/indicates/indicate

> +VIRTIO_CRYPTO_IPSEC_RESOURCE_CAP specifying the limits on the number of IPsec outbound and
> +inbound SA resource objects.
> +The capability VIRTIO_CRYPTO_IPSEC_SA_CAP specifies which IPsec protocol capabilities
> +the device supports. The driver indicates the IPsec parameters(Crypto algorithm,
> +IPsec mode, anti-replay window size, etc.) it is using by setting the IPsec SA capability,
> +prior to adding any resource objects.
> +

I think you mean:
`The driver indicates the IPsec parameters by setting the IPsec SA
capability prior to adding any resource objects`.

> +The driver controls the IPsec SA resource objects using administration commands described in
> +\ref{sec:Basic Facilities of a Virtio Device / Device groups / Group administration commands / Device resource objects}.
> +
> +\paragraph{Device and driver capabilities}
> +\label{par:Device Types / Crypto Device / Device Operation / IPsec Service Operation / Device and driver capabilities}
> +
> +\subparagraph{VIRTIO_CRYPTO_IPSEC_RESOURCE_CAP}
> +\label{par:Device Types / Crypto Device / Device Operation / IPsec Service Operation / Device and driver capabilities / VIRTIO-CRYPTO-IPSEC-RESOURCE-CAP}
> +
> +The capability VIRTIO_CRYPTO_IPSEC_RESOURCE_CAP indicates the IPsec SA resource limits.
> +\field{cap_specific_data} is in the format
> +\field{struct virtio_crypto_ipsec_resource_cap}.
> +
> +\begin{lstlisting}
> +struct virtio_crypto_ipsec_resource_cap {
> +        le32 inb_sa_limit;
> +        le32 outb_sa_limit;
> +};
> +\end{lstlisting}
> +
> +\field{inb_sa_limit}, and \field{outb_sa_limit} denote the maximum number of IPsec
> +security Associations (SAs) that can be utilized for IPsec inbound and outbound processing,
> +respectively, which the device is capable of creating.
> +
> +\subparagraph{VIRTIO_CRYPTO_IPSEC_SA_CAP}
> +\label{par:Device Types / Crypto Device / Device Operation / IPsec Service Operation / Device and driver capabilities / VIRTIO-CRYPTO-IPSEC-SA-CAP}
> +
> +The capability VIRTIO_CRYPTO_IPSEC_SA_CAP lists the supported IPsec modes along with

I think here `capability` goes after `VIRTIO_CRYPTO_IPSEC_SA_CAP`. I
think this also applies to cases above.

> +the supported cryptographic, authentication algorithms and anti-replay window size for
> +each IPsec mode.
> +\field{cap_specific_data} is in the format \field{struct virtio_crypto_ipsec_sa_cap_data}.
> +
> +\begin{lstlisting}[label={lst:Device Types / Crypto Device / Device Operation / IPsec Service Operation / Device and driver capabilities / VIRTIO-CRYPTO-IPSEC-SA-CAP / virtio-crypto-ipsec-mode-cap}]
> +struct virtio_crypto_ipsec_mode_cap {
> +        le32 replay_win_sz_max;
> +        le32 options;
> +        le64 cipher_algo;
> +        le64 hmac_algo;
> +        le32 aead_algo;
> +        le32 max_cipher_key_len;
> +        le32 max_auth_key_len;
> +        u8 mode;
> +        u8 padding[3];
> +};
> +
> +struct virtio_crypto_ipsec_sa_cap_data {
> +        u8 count;
> +        u8 reserved[7];
> +        struct virtio_crypto_ipsec_mode_cap mode[];
> +};
> +\end{lstlisting}
> +
> +\field{count} indicates number of valid entries in the \field{mode} array.
> +\field{mode[]} is an array of supported IPsec modes. Within each array entry:
> +
> +\field{mode} specifies the IPsec mode, as defined in table
> +\ref{table:Device Types / Crypto Device / Device Operation / IPsec Service Operation / Device and driver capabilities / VIRTIO-CRYPTO-IPSEC-SA-CAP / IPsec Modes}.
> +\field{replay_win_sz_max} specifies the maximum anti-replay window size the device supports.
> +
> +\field{options} represents the IPsec protocol options the device supports, as defined in table
> +\ref{table:Device Types / Crypto Device / Device Operation / IPsec Service Operation / Device and driver capabilities / VIRTIO-CRYPTO-IPSEC-SA-CAP / IPsec Options}.
> +
> +\field{cipher_algo} CIPHER algorithms mask, see \ref{sec:Device Types / Crypto Device / Supported crypto services  / CIPHER services}.
> +
> +\field{hmac_algo} HMAC algorithms mask, see \ref{sec:Device Types / Crypto Device / Supported crypto services  / MAC services}.
> +
> +\field{aead_algo} AEAD algorithms mask, see \ref{sec:Device Types / Crypto Device / Supported crypto services  / AEAD services}.
> +
> +\field{max_cipher_key_len} is the maximum length of cipher key supported by the device.
> +
> +\field{max_auth_key_len} is the maximum length of authenticated key supported by the device.
> +
> +\begin{table}[H]
> +\caption{IPsec Modes}
> +\label{table:Device Types / Crypto Device / Device Operation / IPsec Service Operation / Device and driver capabilities / VIRTIO-CRYPTO-IPSEC-SA-CAP / IPsec Modes}
> +\begin{tabularx}{\textwidth}{ |l|X|X| }
> +\hline
> +Type & Name & Description \\
> +\hline \hline
> +0x0 & - & Reserved \\
> +\hline
> +0x1 & VIRTIO_CRYPTO_IPSEC_MODE_ESP_TUNNEL & IPsec ESP protocol in tunnel mode \\
> +\hline
> +0x2 & VIRTIO_CRYPTO_IPSEC_MODE_ESP_TRANSPORT & IPsec ESP protocol in transport mode \\
> +\hline
> +0x3 & VIRTIO_CRYPTO_IPSEC_MODE_AH_TUNNEL & IPsec AH protocol in tunnel mode \\
> +\hline
> +0x4 & VIRTIO_CRYPTO_IPSEC_MODE_AH_TRANSPORT & IPsec AH protocol in transport mode \\
> +\hline
> +\end{tabularx}
> +\end{table}
> +
> +\begin{table}[H]
> +\caption{IPsec Options}
> +\label{table:Device Types / Crypto Device / Device Operation / IPsec Service Operation / Device and driver capabilities / VIRTIO-CRYPTO-IPSEC-SA-CAP / IPsec Options}
> +\begin{tabularx}{\textwidth}{ |l|X|X| }
> +\hline
> +Type & Name & Description \\
> +\hline \hline
> +0x0 & - & Reserved \\
> +\hline
> +0x1 & VIRTIO_CRYPTO_IPSEC_ESN & Specifies whether extended sequence number is supported \\
> +\hline
> +0x2 & VIRTIO_CRYPTO_IPSEC_UDP_ENCAP & Specifies whether udp encapsulation is supported \\
> +\hline
> +0x3 & VIRTIO_CRYPTO_IPSEC_COPY_DSCP & Specifies whether copy dscp is supported \\
> +\hline
> +0x4 & VIRTIO_CRYPTO_IPSEC_DEC_TTL & Specifies whether decrementing the time to live is supported \\
> +\hline
> +\end{tabularx}
> +\end{table}
> +
> -- 
> 2.25.1
> 
> 

