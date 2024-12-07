Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F0F146599
	for <virtio-comment@lists.linux.dev>; Sat,  7 Dec 2024 12:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733574306; cv=none; b=Z1i79dzyYyy0Ik6OasOpTeHNnWTB6fx572HSIxCEXf+axxYC+VUKBHpChvRZCKuiJR0BVxqK4F/0O1vf3dL3fLStQwFjiX7U+a3ys+kbMlMrr2aHStRROR7SsjtaDwWkCt/W5hpxnIlxLKfJhB7+21wUNNR2m4r5isZQb7mkmZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733574306; c=relaxed/simple;
	bh=9smZEjLRizywp+14SnQoqxr1/xjYvEGAV/hNIbTCig8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=HmoUg8sy6F97iYIjKOZd6ifTWZteUlLB1bn1d5UgnODBGqVqkzp2QYIWi6oZIM3EiB5VU7De/EGBFH6uqxR/DWAfF2vgycu9NrkePdXk39avG+X86jNn7SxpsVsE+3JFV2bJWIeOdxWOXxrwBEZGAKSZ/wpV5TH3go437cYCQiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UK4ufwO2; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UK4ufwO2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733574303;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1DQ9fAVzXM4XpQ1vTDfEwbfgC+NIV2JIvVWQfXzmz08=;
	b=UK4ufwO2qwD5nUyU6MbxZWRSxy5s0uH+RcSt5TwDO9Y8kYXDJHipsTkfpKMzPuIbQU6f1l
	4b4QsK+2ioJ4xSj17UgolwdUoUBTZQvlsnO5KxjFi6lj9NMhHBRwid97TYqVNE30887/cx
	Tg0ZEft7k3evhkDfDeIJeIiz4YWSlAQ=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-15-0Nj6QNc5O4y5_UyxgIzehg-1; Sat, 07 Dec 2024 07:25:01 -0500
X-MC-Unique: 0Nj6QNc5O4y5_UyxgIzehg-1
X-Mimecast-MFC-AGG-ID: 0Nj6QNc5O4y5_UyxgIzehg
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-aa63b02c69cso199757866b.0
        for <virtio-comment@lists.linux.dev>; Sat, 07 Dec 2024 04:25:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733574300; x=1734179100;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1DQ9fAVzXM4XpQ1vTDfEwbfgC+NIV2JIvVWQfXzmz08=;
        b=GYTYbH5a0Pwvb3zPYv9M8rKapT5h9puWosYYwdXT+wRhxyG49dibRhLnxCku/gx/Ej
         6qQf+Ouge47TT+lAQDlkF6iAs7r+MAmd4eM+RZmnhezAoUojPQZsaZhDGi9C/N41sA6f
         MmZIPj+A8JdZ3rY0tf3K2N9XJcm3Jzo5nGyF7Y8nEMkS3pn87QJ2JXSmdr0nRMQSHQJJ
         irUBgmbwBe6UK3LsfHlmuh9wff2k0VTSFpM2eUKnXFNZ0Hwg1E6UeQFH4j0jlCmJZyNE
         LtWrqtd+OWn+EJn+TdOsSaf5wuUffv6dSu6SSeIF+FWHXXq3xaJl14gMYVB1f1AE/Fnd
         2qJw==
X-Gm-Message-State: AOJu0YzS2RwZvAO1KjACiwATtGajMMKyYoRevlgcMhByNQsYzHosVogI
	Mrs29fTPjrvfKkVmfAJyHinmUvzRe/O30QL1JOOEry5K4RK3FxQB7JQ+6PjtU8Wp+80KtWHlBSU
	tQUqTkEnefnMHIRZ9lGkEZI/NOyYfy/t4L8ZzeS7zN2zu5InpYqJ581PsbpQaKiop
X-Gm-Gg: ASbGncsBXDmoh7o2eOPgPJ3B4gItw+F4bGIOQz2Ix0/7gZoIfFPa8pL+XyFPfSZSLw6
	yJLupR0WEzf0Oj4digvqN/ve5o1mroLQ50T/zXhs2QqwOEqJXneIxYPS992Y4njVjAxduunDo4P
	j/Vizwudwsd87/MqSigugTeArKRGjUaCY0kzxL51Bq4FxdCp2MXR+u/1bHkw9pLlNw/oHZ/31jF
	3nj/OWnoJWI5BeFVWiRz0mVtiiMjsTazRgo20JPabw=
X-Received: by 2002:a17:907:3a0f:b0:aa6:2b21:ab5b with SMTP id a640c23a62f3a-aa63739e4e9mr619337266b.12.1733574300016;
        Sat, 07 Dec 2024 04:25:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH/dtaIEq+NQVOnCbcpxss0TxzxgB8B8xlp5AaSNr0ZvS6xIFN4NxQlbxbSx1qyVh9B5I0CCA==
X-Received: by 2002:a17:907:3a0f:b0:aa6:2b21:ab5b with SMTP id a640c23a62f3a-aa63739e4e9mr619334666b.12.1733574299615;
        Sat, 07 Dec 2024 04:24:59 -0800 (PST)
Received: from fedora ([89.207.171.100])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6590f5457sm63609966b.195.2024.12.07.04.24.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2024 04:24:59 -0800 (PST)
Date: Sat, 7 Dec 2024 13:24:48 +0100
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: Srujana Challa <schalla@marvell.com>
Cc: virtio-comment@lists.linux.dev, mst@redhat.com, cohuck@redhat.com,
	parav@nvidia.com, sburla@marvell.com, ndabilpuram@marvell.com,
	jerinj@marvell.com, anoobj@marvell.com
Subject: Re: [PATCH RFC 2/4] virtio-crypto: Add resource objects for IPsec
 outbound and inbound SAs
Message-ID: <Z1Q+kBWoYU2Jv7Qo@fedora>
References: <20241115114523.1787840-1-schalla@marvell.com>
 <20241115114523.1787840-3-schalla@marvell.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20241115114523.1787840-3-schalla@marvell.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zv6CmIgp0RFsGK4Gdd1UfNjYd4WL4P3CJm1f3ZQrKfI_1733574300
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 15, 2024 at 05:15:21PM +0530, Srujana Challa wrote:
> This commit introduces resource objects to enable the driver/device to
> create IPsec Security Associations (SAs) for both inbound and outbound
> directions.
> 
> The IPsec SA objects include essential parameters required for packet
> outbound and inbound processing, such as SPI, tunnel headers, IPsec mode,
> IPsec options and cipher/authentication specific data.
> 
> Signed-off-by: Srujana Challa <schalla@marvell.com>
> ---
>  device-types/crypto/description.tex | 133 ++++++++++++++++++++++++++++
>  1 file changed, 133 insertions(+)
> 
> diff --git a/device-types/crypto/description.tex b/device-types/crypto/description.tex
> index ce4b1fb..7ac6f5b 100644
> --- a/device-types/crypto/description.tex
> +++ b/device-types/crypto/description.tex
> @@ -334,6 +334,20 @@ \subsection{Device and driver capabilities}\label{sec:Device Types / Crypto Devi
>  \hline
>  \end{tabularx}
>  
> +\subsection{Device resource objects}\label{sec:Device Types / Crypto Device / Device resource objects}
> +
> +The crypto device has the following resource objects.
> +
> +\begin{tabularx}{\textwidth}{ |l||l|X| }
> +\hline
> +type & Name & Description \\
> +\hline \hline
> +0x0200 & \hyperref[par:Device Types / Crypto Device / Device Operation / IPsec Service Operation / Resource objects / VIRTIO-CRYPTO-RESOURCE-OBJ-IPSEC-OUTBOUND-SA]{VIRTIO_CRYPTO_RESOURCE_OBJ_IPSEC_OUTBOUND_SA} & IPsec outbound SA resource object \\
> +\hline
> +0x0201 & \hyperref[par:Device Types / Crypto Device / Device Operation / IPsec Service Operation / Resource objects / VIRTIO-CRYPTO-RESOURCE-OBJ-IPSEC-INBOUND-SA]{VIRTIO_CRYPTO_RESOURCE_OBJ_IPSEC_INBOUND_SA} & IPsec inbound SA resource object \\
> +\hline
> +\end{tabularx}
> +
>  \subsection{Device Operation}\label{sec:Device Types / Crypto Device / Device Operation}
>  
>  The operation of a virtio crypto device is driven by requests placed on the virtqueues.
> @@ -2026,3 +2040,122 @@ \subsubsection{IPSEC Service Operation}\label{sec:Device Types / Crypto Device /
>  \end{tabularx}
>  \end{table}
>  
> +\paragraph{Resource objects}
> +\label{par:Device Types / Crypto Device / Device Operation / IPsec Service Operation / Resource objects}
> +
> +\subparagraph{VIRTIO_CRYPTO_RESOURCE_OBJ_IPSEC_OUTBOUND_SA}\label{par:Device Types / Crypto Device / Device Operation / IPsec Service Operation / Resource objects / VIRTIO-CRYPTO-RESOURCE-OBJ-IPSEC-OUTBOUND-SA}
> +
> +A driver can have outbound SAs between 0 and \field{outb_sa_limit}, as specified by the
> +capability VIRTIO_CRYPTO_IPSEC_RESOURCE_CAP. For the IPsec outbound SA resource object
> +\field{resource_obj_specific_data} is in the format
> +\field{struct virtio_crypto_resource_obj_ipsec_sa}.
> +
> +\begin{lstlisting}
> +struct virtio_crypto_ipsec_tunnel_param {
> +        /* Tunnel type: IPv4 or IPv6 */
> +        u8 type;
> +        u8 reserved[3];
> +        union {
> +                /* IPv4 tunnel header parameters */
> +                struct {
> +                        /* IPv4 source address */
> +                        struct in_addr src_ip;
> +                        /* IPv4 destination address */
> +                        struct in_addr dst_ip;
> +                        /* IPv4 Differentiated Services Code Point */
> +                        uint8_t dscp;
> +                        /* IPv4 Don't Fragment bit */
> +                        uint8_t df;
> +                        /* IPv4 Time To Live */
> +                        uint8_t ttl;
> +                } ipv4;
> +                /* IPv6 tunnel header parameters */
> +                struct {
> +                        /* IPv6 source address */
> +                        struct in6_addr src_addr;
> +                        /* IPv6 destination address */
> +                        struct in6_addr dst_addr;
> +                        /* IPv6 flow label */
> +                        uint32_t flabel;
> +                        /* IPv6 hop limit */
> +                        uint8_t hlimit;
> +                        /* IPv6 Differentiated Services Code Point */
> +                        uint8_t dscp;
> +                } ipv6;
> +        };
> +};
> +
> +struct virtio_crypto_resource_obj_ipsec_sa {
> +        le32 spi;
> +        le32 salt;
> +        le64 options;
> +        struct virtio_crypto_ipsec_tunnel_param param;
> +        le64 esn;
> +        le16 udp_sport;
> +        le16 udp_dport;
> +        le32 replay_win_sz;
> +        le64 cipher_algo;
> +        struct {
> +            u8 *data;
> +            le16 length;
> +        } cipher_key;
> +        le64 auth_algo;
> +        struct {
> +            u8 *data;
> +            le16 length;
> +        } auth_key;
> +        le32 obj_id;
> +        u8 mode;
> +        u8 direction;
> +}
> +\end{lstlisting}
> +
> +\field{spi} is the Security Parameter Index(SPI) used to uniquely identify the IPsec SA.
> +\field{salt} is the 32 bit salt value used in the cryptographic operations. 
> +
> +\field{options} specifies the Options for configuring the IPsec SA, see
> +\ref{table:Device Types / Crypto Device / Device Operation / IPsec Service Operation / Device and driver capabilities / VIRTIO-CRYPTO-IPSEC-SA-CAP / IPsec Options}.
> +
> +\field{param} specifies the parameters for IPsec tunnel mode.
> +\field{esn} is the starting sequence number.
> +\field{udp_sport} is the source port for UDP encapsulation. \field{udp_dport} is the
> +destination port for UDP encapsulation.
> +\field{replay_win_sz} is the anti-replay window size to enable sequence replay attack
> +handling, replay checking is disabled if the window size is 0.
> +
> +\field{cipher_algo} is the cipher algorithm identifier
> +see \ref{sec:Device Types / Crypto Device / Supported crypto services  / CIPHER services}
> +\field{cipher_key} specifies the cipher key and it's length.

s/it's/its

> +\field{auth_algo} is the Authentication algorithm identifier
> +\field{auth_key} specifies the authentication key data and its length.
> +\field{obj_id} specifies the object id of the SA that can be used to retrieve
> +driver-defined data associated with the IPsec SA.
> +
> +\field{mode} specifies the mode of the IPsec SA, see
> +\ref{table:Device Types / Crypto Device / Device Operation / IPsec Service Operation / Device and driver capabilities / VIRTIO-CRYPTO-IPSEC-SA-CAP / IPsec Modes}.
> +
> +\field{direction} specifies IPsec SA direction, see
> +\ref{table:Device Types / Crypto Device / Device Operation / IPsec Service Operation / Resource objects / VIRTIO-CRYPTO-RESOURCE-OBJ-IPSEC-OUTBOUND-SA / IPsec Direction}.
> +
> +\begin{table}[H]
> +\caption{IPsec Direction}
> +\label{table:Device Types / Crypto Device / Device Operation / IPsec Service Operation / Device and driver capabilities / VIRTIO-CRYPTO-RESOURCE-OBJ-IPSEC-OUTBOUND-SA / IPsec Direction}
> +\begin{tabularx}{\textwidth}{ |l|X|X| }
> +\hline
> +Type & Name & Description \\
> +\hline \hline
> +0x0 & - & Reserved \\
> +\hline
> +0x1 & VIRTIO_CRYPTO_IPSEC_DIR_OUTBOUND & IPsec direction outbound \\
> +\hline
> +0x2 & VIRTIO_CRYPTO_IPSEC_DIR_INBOUND & IPsec direction inbound \\
> +\hline
> +\end{tabularx}
> +\end{table}
> +
> +\subparagraph{VIRTIO_CRYPTO_RESOURCE_OBJ_IPSEC_INBOUND_SA}\label{par:Device Types / Crypto Device / Device Operation / IPsec Service Operation / Resource objects / VIRTIO-CRYPTO-RESOURCE-OBJ-IPSEC-INBOUND-SA}
> +
> +A driver can have inbound SAs between 0 and \field{inb_sa_limit}, as specified by the
> +capability VIRTIO_CRYPTO_IPSEC_RESOURCE_CAP. For the IPsec inbound SA resource object
> +\field{resource_obj_specific_data} is in the format
> +\field{struct virtio_crypto_resource_obj_ipsec_sa}.
> -- 
> 2.25.1
> 
> 

