Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB2741E9B27
	for <virtio-comment@lists.linux.dev>; Thu, 12 Dec 2024 09:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733996785; cv=none; b=GH3l7AQiVe7bGwufLbK7UmlcCzLjTQuAEwhkNxKVzU1awh3pvuFCHiWM0UJUXvgOw1156HiKh8DVtpXFcSzWwqsWn82ohjsNLaGnb5MSheU0E+AOXqkdJVqDKDITAb4zhlQOHLVgLr8mGmIcwFyCVmSpiHqT4xf64xNQLawsqA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733996785; c=relaxed/simple;
	bh=1OwEMxqFSD0C5yb4gHXEkqO/jo+Wsms3uTgI8E1H0Ws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=P1TtwFXXEb5xpDH9ECPQiVqXu1GV+aLpHs7Qb9yu4SCxz7nCiJ1iZtsx3eP26hAQ1LhGtnadXP/3FOfUTcMMJ8OIc0mXqABhsMY65yfiCbiibISx85uRzqq6Pt2BV+nuNSVVx6hHC99+eBNW8WgXlK5Smfk94WN1sPKdLDdRluk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QVLD11xd; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QVLD11xd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733996782;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=x8vPwTQ7Tl/1W++S2P9ht2UlXqms5Xz6HMhfiGsmLKo=;
	b=QVLD11xdb2IzEPnCgD4eQB/I1QCXEZpensGZPnLgvjwGMPZxQXkMJ6K+Uj7qZ0G6vPSaQp
	44iXXAiq8Jah48ezuZt2zwP5wHsHVrnwNYSPcIydEfsuSN7nBM/zfjfK6hfxd5k7MDrcXo
	pFQR/RI49GQX9ebpsJNVigf5sREN5Uo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-196-lS8f9ILaNeuxqFD6GsFL6w-1; Thu, 12 Dec 2024 04:46:21 -0500
X-MC-Unique: lS8f9ILaNeuxqFD6GsFL6w-1
X-Mimecast-MFC-AGG-ID: lS8f9ILaNeuxqFD6GsFL6w
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-385fdff9db5so189331f8f.0
        for <virtio-comment@lists.linux.dev>; Thu, 12 Dec 2024 01:46:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733996780; x=1734601580;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x8vPwTQ7Tl/1W++S2P9ht2UlXqms5Xz6HMhfiGsmLKo=;
        b=MON7SR35bQMHpmtU23Alqu1rjgHS00DWLUF2BLVzbrdH+ppNKJQfldwbWXnWE1sdEa
         x9b5AhN3N21cOBch0z1EVKLb06f+VPM0WZ7kfc42aj07kb2vkssOaBncejsqyYW6VOkI
         3FB98i9puf2CzHWsjoyDIs/fa2oXfYpi8YUJyycVXVFagEXsLdieSQqeQTMJF4H9D+8k
         g8wgOB37mcBx+7HAT6pJZY8i+7JBYHsi96kpSCXSf5fORVh9yP/RF7CA/l1OpadNcihx
         MrBW/vGYLhpZ4h8Y0AOxSMq01T8+JuwI8MUvFHmnWeB9jCrLESYTJQJKVEW+aYU0zx2O
         CkAw==
X-Gm-Message-State: AOJu0YwTiijEUyhZLm/MdHYEvxXiftg3IbL/pNpSeOwV5g7vrW1RQmsW
	GthGSIaQJ0mwHgF9xilXmYgBlZCXExgh9X+M2mVLDihegcOscih7HMgqdQyKwGTD73zFIpyDkDx
	njfOcJg4PwnaTifO4yoFBRRp7SLqA325KyJbtOr4wMyTZoIBwm16mWJcmmwomNcML
X-Gm-Gg: ASbGncvNuNqNNMHXuyAwxAReIk8BE+YPyZOKsYUvJfXKV7AuVzU47sRZTEa9CWF/ZUc
	bzijg7maAXAkosv/KUu03Al7ByF0UNP2ouGzTzOdlZAFw/L/gUClTej5HMwE+MQLBXxkzJbQlYr
	/sChMRszK/05P7v2spva0MGw3MYH3U7hbSpo3WnuxLJOYM9JHxGzweEReMCVtG01+TuB8KBMcCd
	esOcdzRaCyIzU/dM21fU+aoGFVKsgsTl3YDEqI7K0Wef6bE/jI=
X-Received: by 2002:a5d:5f42:0:b0:385:e8ff:b9c9 with SMTP id ffacd0b85a97d-3864ce985bemr4180813f8f.42.1733996779789;
        Thu, 12 Dec 2024 01:46:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFw4JD3DBrv0sM88zzMiw0RFXlBHaQNuJuciMXvgzURcs2VRNkGJO6yXpUBRQkTpzJskbsh3w==
X-Received: by 2002:a5d:5f42:0:b0:385:e8ff:b9c9 with SMTP id ffacd0b85a97d-3864ce985bemr4180794f8f.42.1733996779371;
        Thu, 12 Dec 2024 01:46:19 -0800 (PST)
Received: from fedora ([2a01:e0a:257:8c60:80f1:cdf8:48d0:b0a1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-387824a4a25sm3544550f8f.27.2024.12.12.01.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 01:46:18 -0800 (PST)
Date: Thu, 12 Dec 2024 10:46:16 +0100
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: Srujana Challa <schalla@marvell.com>
Cc: virtio-comment@lists.linux.dev, mst@redhat.com, cohuck@redhat.com,
	parav@nvidia.com, sburla@marvell.com, ndabilpuram@marvell.com,
	jerinj@marvell.com, anoobj@marvell.com
Subject: Re: [PATCH RFC 3/4] virtio-crypto: Add new IPsec opcodes to data
 request
Message-ID: <Z1qw6EwP8de2PgqP@fedora>
References: <20241115114523.1787840-1-schalla@marvell.com>
 <20241115114523.1787840-4-schalla@marvell.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20241115114523.1787840-4-schalla@marvell.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8TVWRqLHtDOyUtnjD5HhAeW-n0dQFbmR4qMRMiB_Aak_1733996780
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 15, 2024 at 05:15:22PM +0530, Srujana Challa wrote:
> Adds new IPsec opcodes, VIRTIO_CRYPTO_IPSEC_OUTBOUND and
> VIRTIO_CRYPTO_IPSEC_INBOUND and defines opcode specific
> data structures for IPsec data processing.
> 
> Signed-off-by: Srujana Challa <schalla@marvell.com>
> ---

Reviewed-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>


>  device-types/crypto/description.tex | 81 ++++++++++++++++++++++++++++-
>  1 file changed, 80 insertions(+), 1 deletion(-)
> 
> diff --git a/device-types/crypto/description.tex b/device-types/crypto/description.tex
> index 7ac6f5b..9c878f7 100644
> --- a/device-types/crypto/description.tex
> +++ b/device-types/crypto/description.tex
> @@ -990,6 +990,10 @@ \subsubsection{Data Virtqueue}\label{sec:Device Types / Crypto Device / Device O
>      VIRTIO_CRYPTO_OPCODE(VIRTIO_CRYPTO_SERVICE_AKCIPHER, 0x02)
>  #define VIRTIO_CRYPTO_AKCIPHER_VERIFY \
>      VIRTIO_CRYPTO_OPCODE(VIRTIO_CRYPTO_SERVICE_AKCIPHER, 0x03)
> +#define VIRTIO_CRYPTO_IPSEC_OUTBOUND \
> +    VIRTIO_CRYPTO_OPCODE(VIRTIO_CRYPTO_SERVICE_IPSEC, 0x00)
> +#define VIRTIO_CRYPTO_IPSEC_INBOUND \
> +    VIRTIO_CRYPTO_OPCODE(VIRTIO_CRYPTO_SERVICE_IPSEC, 0x01)
>      le32 opcode;
>      /* algo should be service-specific algorithms */
>      le32 algo;
> @@ -1007,6 +1011,17 @@ \subsubsection{Data Virtqueue}\label{sec:Device Types / Crypto Device / Device O
>  If VIRTIO_CRYPTO_F_REVISION_1 is negotiated but VIRTIO_CRYPTO_F_<SERVICE>_STATELESS_MODE
>  is not negotiated, then the device SHOULD reject <SERVICE> requests if
>  VIRTIO_CRYPTO_FLAG_SESSION_MODE is not set (in \field{flag}).
> +
> +For VIRTIO_CRYPTO_IPSEC_OUTBOUND and VIRTIO_CRYPTO_IPSEC_INBOUND opcodes,
> +\field{algo} is ignored.
> +
> +For VIRTIO_CRYPTO_IPSEC_OUTBOUND opcode, \field{session_id} MUST be set to
> +one of the resource objects \field{id} created using
> +VIRTIO_CRYPTO_RESOURCE_OBJ_IPSEC_OUTBOUND_SA resource type.
> +
> +For VIRTIO_CRYPTO_IPSEC_INBOUND opcode, \field{session_id} MUST be set to
> +one of the resource objects \field{id} created using
> +VIRTIO_CRYPTO_RESOURCE_OBJ_IPSEC_INBOUND_SA resource type.
>  \end{note}
>  
>  The dataq request is composed of four parts:
> @@ -1094,6 +1109,13 @@ \subsubsection{Data Virtqueue}\label{sec:Device Types / Crypto Device / Device O
>          and struct virtio_crypto_akcipher_data_flf is padded to 48 bytes if NOT negotiated,
>          and \field{op_vlf} is struct virtio_crypto_akcipher_data_vlf.
>      \end{itemize*}
> +\item If the the opcode (in \field{header}) is VIRTIO_CRYPTO_IPSEC_OUTBOUND
> +    or VIRTIO_CRYPTO_IPSEC_INBOUND then:
> +    \begin{itemize*}
> +    \item \field{op_flf} is struct virtio_crypto_ipsec_data_flf.
> +        and \field{op_vlf} is struct virtio_crypto_ipsec_data_vlf.
> +	Works only for session mode.
> +    \end{itemize*}
>  \end{itemize*}
>  
>  \field{inhdr} is a unified input header that used to return the status of
> @@ -1914,8 +1936,23 @@ \subsubsection{IPSEC Service Operation}\label{sec:Device Types / Crypto Device /
>  in tunnel mode, as well as the ESP/AH header from the packet. The resulting
>  packet contains only the plain data.
>  
> +The driver can offload IPsec Inbound processing by
> +\begin{itemize*}
> +\item Creating inbound SAs using the VIRTIO_CRYPTO_RESOURCE_OBJ_IPSEC_INBOUND_SA command.
> +\item Setting the \field{opcode} in struct virtio_crypto_op_data_req to
> +VIRTIO_CRYPTO_IPSEC_INBOUND.
> +\end{itemize*}
> +
>  IPsec Outbound processing: The device will perform encryption, attach ICV,
> -update/add IP headers, add ESP/AH headers/trailers.
> +update/add IP headers, add ESP/AH headers/trailers during data processing.
> +
> +The driver can offload IPsec outbound processing by creating outbound SAs
> +\begin{itemize*}
> +\item Creating inbound SAs using the VIRTIO_CRYPTO_RESOURCE_OBJ_IPSEC_OUTBOUND_SA command.
> +\item Setting the \field{opcode} in struct virtio_crypto_op_data_req to
> +VIRTIO_CRYPTO_IPSEC_OUTBOUND.
> +\end{itemize*}
> +See \ref{sec:Device Types / Crypto Device / Device Operation / IPsec Service Operation / Data processing}
>  
>  A crypto device can support number of IPsec SAs, allowing it to manage multiple secure
>  connections simultaneously.
> @@ -2159,3 +2196,45 @@ \subsubsection{IPSEC Service Operation}\label{sec:Device Types / Crypto Device /
>  capability VIRTIO_CRYPTO_IPSEC_RESOURCE_CAP. For the IPsec inbound SA resource object
>  \field{resource_obj_specific_data} is in the format
>  \field{struct virtio_crypto_resource_obj_ipsec_sa}.
> +
> +\paragraph{Data processing}
> +\label{par:Device Types / Crypto Device / Device Operation / IPsec Service Operation / Data processing}
> +
> +Data requests for IPsec processing are as follows:
> +
> +\begin{lstlisting}
> +struct virtio_crypto_ipsec_data_flf {
> +        /* length of source data, full IP/IPsec packet */
> +        le32 src_data_len;
> +        /* length of dst data */
> +        le32 dst_data_len;
> +};
> +
> +struct virtio_crypto_ipsec_data_vlf {
> +        /* Device read only portion */
> +        /* Source data */
> +        u8 src_data[src_data_len];
> +
> +        /* Device write only portion */
> +        /* Pointer to output data */
> +        u8 dst_data[dst_data_len];
> +};
> +\end{lstlisting}
> +
> +Each data request uses the virtio_crypto_ipsec_data_flf structure and
> +the virtio_crypto_ipsec_data_vlf structure to store information used to
> +run the IPSEC operations.
> +
> +For IPsec encryption:
> +\field{src_data} is the full IP packet that will be processed.
> +\field{src_data_len} is the length of source data.
> +\field{dst_result} is the result ESP encrypted packet and
> +\field{dst_data_len} is the length of it. Please note,
> +dst_data_len SHOULD include additional header and trailer
> +lengths.
> +
> +For IPsec decryption:
> +\field{src_data} is the IPsec packet that will be processed.
> +\field{src_data_len} is the length of source data.
> +\field{dst_result} is the result plain IP packet and
> +\field{dst_data_len} is the length of it.
> -- 
> 2.25.1
> 
> 

