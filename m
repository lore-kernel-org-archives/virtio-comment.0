Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDFA617B4FF
	for <virtio-comment@lists.linux.dev>; Thu, 12 Dec 2024 10:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733998526; cv=none; b=A7MkLWdg8ja1kCE1PQ8NaVAItL7op/R3W1YTg0gqGYsoHbMHEGgGdADYBkpr4jJFPYqpMHX+QJpIAf7HbRiLT/Qux2XXiCEePh8eTMTsH05X6WrIA4uCpFNdwYrnapfVVGMT5RERlw+4PyZo4UGSLW2TWBaY9BtPkI6GUCoOONc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733998526; c=relaxed/simple;
	bh=hWvvoR/IXZnxBk1tVWhOnjV9lrHshaNSuf92Hb9AZm8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=V38rZVUU54sz3k80sU5bveCgkBKASH4MNaVfYc4YsHqpV9Qdz5YNQaAFjGzHLDO4W4QKk9hTYM7WXxE1QpGn8HkLX0AF6dxSpvZbvCYCzJFc6mbV17raccbRiRZLQCPyYi8DZc9Pl/M7ksAPa1sGHnZoIBip4EeVm14gt7gSg2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=U0YsXmBZ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="U0YsXmBZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733998523;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SGcuGeRVQlq1hDZ24psHHBwzzcbD/ZKJz1UVOJ4xPAk=;
	b=U0YsXmBZrSxz5C0ODphX47O75NpVDStueUgBp2rc03qwz/i2Tf2GAqT6A8Pojzijx5ImIo
	lsM6XT0VEyi6HgXt34/swuugdXPj6peNv8MMWRqcRKXVF5Q9zvqEg7i+VHmfO9MdodhH+e
	sUe973nRyETg/P5EScuJgCQ1Pl5q5ls=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-678-fu7kcwoqMpKD9bjI_gwD6w-1; Thu, 12 Dec 2024 05:15:16 -0500
X-MC-Unique: fu7kcwoqMpKD9bjI_gwD6w-1
X-Mimecast-MFC-AGG-ID: fu7kcwoqMpKD9bjI_gwD6w
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3860bc1d4f1so236980f8f.2
        for <virtio-comment@lists.linux.dev>; Thu, 12 Dec 2024 02:15:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733998515; x=1734603315;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SGcuGeRVQlq1hDZ24psHHBwzzcbD/ZKJz1UVOJ4xPAk=;
        b=lCRRge+msmce/0LF9Nn7PvI0+lBbd/aoAyH9dQKzUvnlImlLnrJRjLJOBKnPvnmDaG
         OJMJkPWrQQMYgDZzO79FZaQAQyhyJz93TWr2hNpdczA5+r6bjiCVS9GGwJGNjGw5EJhF
         7ifnCbhOAjVvbh2xSxoLgBMq8u40hFxiM3+8Pbzvj7jvHwcJW3hYbOQsParHd2CNx9rn
         NYaOLcCvqGeBWEghaGC9HtxIh2gAFxmDhNK5YIKdC4wbzRF07jRsxn4aTBY3wsJu19De
         fhoVNCOT0fKJ7/G7ibhAqggL2N0/bl9iXA1wl5HtXpO2mPjxpu7a9KKyJCMZSZxqi+nY
         wT1g==
X-Gm-Message-State: AOJu0Yzmo6yiywVAkd4cMIRHCuQLUBH2g7k4kVrgqrp5/sa2tTUL7cmk
	/ykBS8+oJWNEtVUWFHicMGUtbC6ZNrYcwI8feyproa47jFJT2DMX6X1H4A674NlueiBGdd5sIyy
	RRfXkV3hgao2550dHsJjuo1RZGhB7za9ZvS+HtWohdsTTLWgI97eP6X0nOJzVym2D
X-Gm-Gg: ASbGnctE5Czt4/VVsQwmAjhYceh2b4c++ONGZS5L4jZYEUn0evZCmwQNEDMb0M6aKsl
	dcR4h0Jed5Q6kMHWFIN9EkfwNMvd6o9lztArdxOJ5+U5dKPgjGgeXHM9t3Fq6g1RYuD2/I2I1CQ
	SGb/brbDy10zVAJM4ysOra1LL8yNxkW2FsGAYznxPjrb5BKHDx7cbUl3kN+nhcuZDriwmKwNGH8
	l/LvqHhLer9LTTy95Zy/aFatvG7/Nb59G9H4NFLnGP40wgtoBc=
X-Received: by 2002:a05:6000:2d86:b0:385:df5d:622c with SMTP id ffacd0b85a97d-3864ce9f5bamr3281444f8f.30.1733998515229;
        Thu, 12 Dec 2024 02:15:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEh1xl0nrKIXVteGzqF+kvEg8vYeip/RpFewNgA0h5dxG42itpxe+znonlk5IBm49HjiehNhg==
X-Received: by 2002:a05:6000:2d86:b0:385:df5d:622c with SMTP id ffacd0b85a97d-3864ce9f5bamr3281418f8f.30.1733998514745;
        Thu, 12 Dec 2024 02:15:14 -0800 (PST)
Received: from fedora ([2a01:e0a:257:8c60:80f1:cdf8:48d0:b0a1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-387824c50b7sm3539863f8f.57.2024.12.12.02.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 02:15:14 -0800 (PST)
Date: Thu, 12 Dec 2024 11:15:12 +0100
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: Srujana Challa <schalla@marvell.com>
Cc: virtio-comment@lists.linux.dev, mst@redhat.com, cohuck@redhat.com,
	parav@nvidia.com, sburla@marvell.com, ndabilpuram@marvell.com,
	jerinj@marvell.com, anoobj@marvell.com
Subject: Re: [PATCH RFC 4/4] virtio-crypto: Add device and driver
 requirements for IPsec operation
Message-ID: <Z1q3sGBBsOMSLyY/@fedora>
References: <20241115114523.1787840-1-schalla@marvell.com>
 <20241115114523.1787840-5-schalla@marvell.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20241115114523.1787840-5-schalla@marvell.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: A7wF8LuWd3mVW_OWkqd6_m5TdLnz-ekkJODy1NOqtLI_1733998515
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 15, 2024 at 05:15:23PM +0530, Srujana Challa wrote:
> Add device and driver requirements for IPsec Operation.
> 
> Signed-off-by: Srujana Challa <schalla@marvell.com>
> ---
>  device-types/crypto/description.tex        | 100 +++++++++++++++++++++
>  device-types/crypto/device-conformance.tex |   1 +
>  device-types/crypto/driver-conformance.tex |   1 +
>  3 files changed, 102 insertions(+)
> 
> diff --git a/device-types/crypto/description.tex b/device-types/crypto/description.tex
> index 9c878f7..5ca6602 100644
> --- a/device-types/crypto/description.tex
> +++ b/device-types/crypto/description.tex
> @@ -2238,3 +2238,103 @@ \subsubsection{IPSEC Service Operation}\label{sec:Device Types / Crypto Device /
>  \field{src_data_len} is the length of source data.
>  \field{dst_result} is the result plain IP packet and
>  \field{dst_data_len} is the length of it.
> +
> +\devicenormative{\paragraph}{IPsec Service Operation}{Device Types / Crypto Device / Device Operation / IPsec Service Operation}
> +
> +When the device supports IPsec operations,
> +\begin{itemize}
> +\item the device MUST set VIRTIO_CRYPTO_IPSEC_RESOURCE_CAP, VIRTIO_CRYPTO_IPSEC_SA_CAP
> +capability in the \field{supported_caps} in the command VIRTIO_ADMIN_CMD_CAP_SUPPORT_QUERY.
> +\item the device MUST support the administration commands
> +VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE,
> +VIRTIO_ADMIN_CMD_RESOURCE_OBJ_MODIFY, VIRTIO_ADMIN_CMD_RESOURCE_OBJ_QUERY,
> +VIRTIO_ADMIN_CMD_RESOURCE_OBJ_DESTROY for the resource types
> +VIRTIO_CRYPTO_RESOURCE_OBJ_IPSEC_OUTBOUND_SA and VIRTIO_CRYPTO_RESOURCE_OBJ_IPSEC_INBOUND_SA.
> +\end{itemize}
> +
> +When any of the VIRTIO_CRYPTO_IPSEC_RESOURCE_CAP or VIRTIO_CRYPTO_IPSEC_SA_CAP
> +capability is disabled, the device MUST set \field{status} to
> +VIRTIO_ADMIN_STATUS_Q_INVALID_OPCODE for the commands
> +VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE,
> +VIRTIO_ADMIN_CMD_RESOURCE_OBJ_MODIFY, VIRTIO_ADMIN_CMD_RESOURCE_OBJ_QUERY,
> +and VIRTIO_ADMIN_CMD_RESOURCE_OBJ_DESTROY.
> +
> +The device MUST set \field{status} to VIRTIO_ADMIN_STATUS_EEXIST for the
> +command VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE when the resource \field{type}
> +is VIRTIO_CRYPTO_RESOURCE_OBJ_IPSEC_OUTBOUND_SA or VIRTIO_CRYPTO_RESOURCE_OBJ_IPSEC_INBOUND_SA,
> +if the object is already exists with the supplied \field{id}.

Remove `is` in last sentence.

> +
> +The device MUST set \field{status} to VIRTIO_ADMIN_STATUS_EBUSY for the
> +command VIRTIO_ADMIN_CMD_RESOURCE_OBJ_DESTROY when the resource \field{type}
> +is VIRTIO_CRYPTO_RESOURCE_OBJ_IPSEC_OUTBOUND_SA or VIRTIO_CRYPTO_RESOURCE_OBJ_IPSEC_INBOUND_SA,
> +if the object is in use.
> +
> +The device MUST fail the command VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE with
> +the \field{status} set to VIRTIO_ADMIN_STATUS_EINVAL, for the
> +VIRTIO_CRYPTO_RESOURCE_OBJ_IPSEC_OUTBOUND_SA object if,
> +\begin{itemize}
> +\item \field{id} is greater than or equal to \field{outb_sa_limit}.
> +\item the supplied SA parameters, such as mode, options, cipher and authentication
> +      algorithms is not supported in the capabitlity VIRTIO_CRYPTO_IPSEC_SA_CAP.

s/is/are

> +\end{itemize}
> +
> +The device MUST fail the command VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE with
> +the \field{status} set to VIRTIO_ADMIN_STATUS_EINVAL, for the
> +VIRTIO_CRYPTO_RESOURCE_OBJ_IPSEC_INBOUND_SA object if,
> +\begin{itemize}
> +\item \field{id} is greater than or equal to \field{inb_sa_limit}.
> +\item the supplied SA parameters, such as mode, options, cipher and authentication
> +      algorithms is not supported in the capabitlity VIRTIO_CRYPTO_IPSEC_SA_CAP.

s/is/are

> +\end{itemize}
> +
> +The device SHOULD maintain a table for subsequent lookups for inbound/outbound data
> +processing with the corresponding SA based on the supplied \field{id}.
> +
> +The device MUST allow recreating the resource objects using the command
> +VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE which was previously destroyed using
> +the command VIRTIO_ADMIN_CMD_RESOURCE_OBJ_DESTROY respectively without
> +undergoing a device reset.
> +
> +The device MAY fail the command VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE with
> +the \field{status} set to VIRTIO_ADMIN_STATUS_EINVAL for the
> +VIRTIO_CRYPTO_RESOURCE_OBJ_IPSEC_OUTBOUND_SA or VIRTIO_CRYPTO_RESOURCE_OBJ_IPSEC_INBOUND_SA
> +commands if the resource object with the same \field{spi} already exists.
> +
> +On device reset, the device MUST destroy all the resource objects which have been created.
> +
> +The device MUST copy the result of IPsec operation in the \field{dst_data[]}.
> +The device MUST set the \field{status} field in struct virtio_crypto_inhdr to
> +one of the following values of enum VIRTIO_CRYPTO_STATUS:
> +\begin{itemize*}
> +\item VIRTIO_CRYPTO_OK if the operation success.
> +\item VIRTIO_CRYPTO_NOTSUPP if the requested algorithm or operation is unsupported.
> +\item VIRTIO_CRYPTO_BADMSG if the integrity check is failed for IPsec decryption.
> +\item VIRTIO_CRYPTO_INVSESS if the session ID invalid.
> +\item VIRTIO_CRYPTO_ERR if any failure not mentioned above occurs.
> +\end{itemize*}
> +
> +\drivernormative{\paragraph}{IPsec Service Operation}{Device Types / Crypto Device / Device Operation / IPsec Service Operation}
> +
> +The driver MUST query the capabilities using VIRTIO_ADMIN_CMD_CAP_ID_LIST_QUERY
> +to discover the capability types the device offers.
> +
> +The driver MUST get VIRTIO_CRYPTO_IPSEC_RESOURCE_CAP and VIRTIO_CRYPTO_IPSEC_SA_CAP
> +if listed in VIRTIO_ADMIN_CMD_CAP_ID_LIST_QUERY command result, using
> +VIRTION_ADMIN_CMD_DEVICE_CAP_GET to discover the capabilities the device is
> +able to offer.
> +The driver MUST set VIRTIO_CRYPTO_IPSEC_RESOURCE_CAP and VIRTIO_CRYPTO_IPSEC_SA_CAP
> +using VIRTIO_ADMIN_CMD_DEVICE_CAP_SET to indicate the device which capability
> +the driver uses.
> +
> +For the command VIRTIO_ADMIN_CMD_RESOURCE_OBJ_CREATE, when creating a resource
> +VIRTIO_CRYPTO_RESOURCE_OBJ_IPSEC_OUTBOUND_SA, the driver MUST set all the parameters
> +in \field struct virtio_crypto_resource_obj_ipsec_sa with relevant values.
> +And when create a resource object VIRTIO_CRYPTO_RESOURCE_OBJ_IPSEC_INBOUND_SA,
> +the driver MUST set all the parameters except
> +\field struct virtio_crypto_ipsec_tunnel_param.
> +
> +The driver MUST set \field{session_id} in struct virtio_crypto_op_header to a
> +valid VIRTIO_CRYPTO_RESOURCE_OBJ_IPSEC_OUTBOUND_SA or
> +VIRTIO_CRYPTO_RESOURCE_OBJ_IPSEC_INBOUND_SA \field{id} .

Remove space at the end.

> +The driver MUST set the \field{opcode} field in struct virtio_crypto_op_header
> +to one of VIRTIO_CRYPTO_IPSEC_OUTBOUND and VIRTIO_CRYPTO_IPSEC_INBOUND.
> diff --git a/device-types/crypto/device-conformance.tex b/device-types/crypto/device-conformance.tex
> index 1667120..5d1c59f 100644
> --- a/device-types/crypto/device-conformance.tex
> +++ b/device-types/crypto/device-conformance.tex
> @@ -10,4 +10,5 @@
>  \item \ref{devicenormative:Device Types / Crypto Device / Device Operation / MAC Service Operation}
>  \item \ref{devicenormative:Device Types / Crypto Device / Device Operation / Symmetric algorithms Operation}
>  \item \ref{devicenormative:Device Types / Crypto Device / Device Operation / AEAD Service Operation}
> +\item \ref{devicenormative:Device Types / Crypto Device / Device Operation / IPsec Service Operation}
>  \end{itemize}
> diff --git a/device-types/crypto/driver-conformance.tex b/device-types/crypto/driver-conformance.tex
> index 672d0f6..4083ea4 100644
> --- a/device-types/crypto/driver-conformance.tex
> +++ b/device-types/crypto/driver-conformance.tex
> @@ -11,4 +11,5 @@
>  \item \ref{drivernormative:Device Types / Crypto Device / Device Operation / MAC Service Operation}
>  \item \ref{drivernormative:Device Types / Crypto Device / Device Operation / Symmetric algorithms Operation}
>  \item \ref{drivernormative:Device Types / Crypto Device / Device Operation / AEAD Service Operation}
> +\item \ref{drivernormative:Device Types / Crypto Device / Device Operation / IPsec Service Operation}
>  \end{itemize}
> -- 
> 2.25.1
> 
> 

