Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE74E2E736F
	for <virtio-comment@lists.linux.dev>; Sun,  6 Sep 2026 15:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788707628; cv=none; b=Y9DtQfAmzshag1qa/Bty70cVVXyP0eUOfngU2jy/jwxxlxSqVa5wPlbi2GSIIvoGUQwdu89HWGWfvV+I2EGnQh7vuejIZZviNeB5Vn1x/WMRS5mzMShyV9Hs1wU9C33rbL6+Hvbp9S3nOCiPvlXuDT1GrByLEpx1OKPHva4mS9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788707628; c=relaxed/simple;
	bh=oMC/pYaqZBOWJ8jPvYEKZ9Yr8lWQiou83SEFxKyEw28=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=GIiQv9bKyE4g/SbuBeZ6ZKW3jTkMp7zUdS6C3YLzDQUbMkhpEZEru8n7JZnxgXUgYOHWqTdBHRDRBtMSd6GONDCvM7jIopFpR6cIGNpzuK8I8tSS8+IJD87C5M1cEhKO+YVEc/umZUhrdndvfMcv/clBgfZtgwSlyFtYrsKvgi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=R8j0f5aT; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="R8j0f5aT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788707625;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=liYZ7UYPvSdsOdntX7rVsGZqFmXeQRuu7zFU4btIHi8=;
	b=R8j0f5aTSy9q7rxMYaw8XsJOYJizLEx02IKL0XLkapP1KRXJrWWg6+ViqziXM9WhwvlRvT
	+sFaevZV1bjXC6epG/7NzezsPyb/KKx6K/UYzzudigsy5T2dYuI2+EiknCOoqU9LlFWbpI
	npI8ro5iILcPgd84GdupG+c4jSBOZl4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-520-n-lNcn5bNimbNBg0vQF38Q-1; Sun, 06 Sep 2026 11:13:44 -0400
X-MC-Unique: n-lNcn5bNimbNBg0vQF38Q-1
X-Mimecast-MFC-AGG-ID: n-lNcn5bNimbNBg0vQF38Q_1788707623
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-495529a93f9so24948555e9.3
        for <virtio-comment@lists.linux.dev>; Sun, 06 Sep 2026 08:13:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788707623; x=1789312423;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=liYZ7UYPvSdsOdntX7rVsGZqFmXeQRuu7zFU4btIHi8=;
        b=jyANbgqk2EoGmQVr6u0jY6bIzm1LkoQl4O/KVsIUrTPQQp4CKnW9HqKg9kP9cr17ox
         bfm/94vL0Zd/Llvxw/pkqaHVZ2fO0yMRiJlLUSTWAtY/d2QVW2fhWT+prm35Id461n2h
         QFerTEVxV1YPAfIcAjNIyn2cRTqdhxFEzoc5dP9DssH3ySg6ZlbU/EbAO/T8xDwNEPQE
         NmYPg6XuSxiDX5EasFEZcRNGQ7zn4X+WnkhDmG/3yLIpVbBDJS6+W0r893WgTxkOUmtx
         /DkeqOBApxyF71CzeEhy6Y/tqRQYsd8JOPC4EEoytvyh2QRoWkkwOHhCrEkEto+vJtrP
         bQ0w==
X-Gm-Message-State: AFuF++m1hYtrP+RF/Utq9IpyDeOTYyyCYutQRi2HFe5w7+r/bk/VnkpG
	zJU2/zEkgeVIw9pEkDFyT4OMb+BgoXCt4QWZTzOfmmmt9WiFw1IB2px9Yv37XoiU92s45bLVkWH
	ghOI2fDDB1RipGV7DxMacsEEs48tilgEaqqlQIMRNBMPLWZJRLpQ+njJ0DztXIHaz5gKG
X-Gm-Gg: AYBFou3U3JdVxYq/exL8gul0DsB0hP5XZJYc32DqmV8u3HgWrFHt7W87f5e7tH55qIL
	JMsXYWIqcjKhKkom7MrCz1IFAXDgKBK6qJjrZ5RDWWk77FJgQYR06/NLopBDSP69SL5IuD7iFsM
	4Q/tdmPArHaEHrmBSQYFU3xXqXP4+RNQ6AtDgM4hMYp8xQonfyt8HpafwSlDLNVz98sPmtgPULI
	gjkM/pf831TPLQKOVYTv2V8zOHIuvzb250nIo/tnhZNmkmjsjXCd9NtsAEDW6kjtGapA8exYgmn
	mUzRENWEcBBfTlrspEyGoDHPlaVmimNTbIZvFojWk9ObciigeKYa7sLi88SbYui2EPVJ9TIhu69
	LlP5WRyWO40aNGH+Uff2gnSQ=
X-Received: by 2002:a05:600c:4691:b0:49c:fea1:f792 with SMTP id 5b1f17b1804b1-49cfea1f79cmr142060815e9.12.1788707622710;
        Sun, 06 Sep 2026 08:13:42 -0700 (PDT)
X-Received: by 2002:a05:600c:4691:b0:49c:fea1:f792 with SMTP id 5b1f17b1804b1-49cfea1f79cmr142060425e9.12.1788707622155;
        Sun, 06 Sep 2026 08:13:42 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-79-236.inter.net.il. [80.230.79.236])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfe14sm22350201f8f.35.2026.09.06.08.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 08:13:41 -0700 (PDT)
Date: Sun, 6 Sep 2026 11:13:39 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Richard W.M. Jones" <rjones@redhat.com>
Cc: virtio-comment@lists.linux.dev
Subject: Re: [PATCH 1/1] device-types/blk/description.tex: Allow longer
 device IDs to be returned
Message-ID: <20260906110725-mutt-send-email-mst@kernel.org>
References: <20260906145444.127570-1-rjones@redhat.com>
 <20260906145444.127570-2-rjones@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260906145444.127570-2-rjones@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: g-_5hSJStshQZn4SposGhotIZUdop3G1ZOBuXDda7wg_1788707623
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Sep 06, 2026 at 03:54:44PM +0100, Richard W.M. Jones wrote:
> SCSI-based paravirtualized block devices including virtio-scsi and
> VMware's pvscsi allow longer device IDs.  This presents an issue when
> we change the backing of a disk from one type to another, eg from
> pvscsi to virtio-blk, or virtio-scsi to virtio-blk.  The longer device
> ID has to be truncated to 20 bytes.  This results in guest visible
> changes, notably /dev/disk/by-id/ paths are different, so any
> mountpoints or configuration files that use these paths will break.
> 
> Therefore extend virtio-blk to allow longer device IDs.  I chose 247
> bytes (ASCII chars) as the new limit since it can cope with any SCSI
> device serial.  Real serials will be much shorter than this; the aim
> is to allow UUIDs to be preserved which would use 32 or 36 ASCII
> chars.
> 
> We have to be cautious about breaking existing guests where the
> hypervisor is currently silently truncating a longer ID to 20 bytes.
> I suggest in the specification that virtio-blk device drivers allow a
> way to opt in to longer IDs, but this is ultimately up to the guests /
> drivers to decide.
> 
> Signed-off-by: Richard W.M. Jones <rjones@redhat.com>

With 1 patch pls dont use a cover letter next time.
And Pls Cc relevant people)

> ---
>  device-types/blk/description.tex | 32 +++++++++++++++++++++++++-------
>  1 file changed, 25 insertions(+), 7 deletions(-)
> 
> diff --git a/device-types/blk/description.tex b/device-types/blk/description.tex
> index 3b3a4e7..d42ca21 100644
> --- a/device-types/blk/description.tex
> +++ b/device-types/blk/description.tex
> @@ -457,9 +457,9 @@ \subsection{Device Operation}\label{sec:Device Types / Block Device / Device Ope
>  The type of the request is either a read (VIRTIO_BLK_T_IN), a write
>  (VIRTIO_BLK_T_OUT), a discard (VIRTIO_BLK_T_DISCARD), a write zeroes
>  (VIRTIO_BLK_T_WRITE_ZEROES), a flush (VIRTIO_BLK_T_FLUSH), a get device ID
> -string command (VIRTIO_BLK_T_GET_ID), a secure erase
> -(VIRTIO_BLK_T_SECURE_ERASE), or a get device lifetime command
> -(VIRTIO_BLK_T_GET_LIFETIME).
> +string command (VIRTIO_BLK_T_GET_ID or VIRTIO_BLK_T_GET_LONG_ID),
> +a secure erase (VIRTIO_BLK_T_SECURE_ERASE), or a get device lifetime
> +command (VIRTIO_BLK_T_GET_LIFETIME).
>  
>  \begin{lstlisting}
>  #define VIRTIO_BLK_T_IN           0
> @@ -469,7 +469,8 @@ \subsection{Device Operation}\label{sec:Device Types / Block Device / Device Ope
>  #define VIRTIO_BLK_T_GET_LIFETIME 10
>  #define VIRTIO_BLK_T_DISCARD      11
>  #define VIRTIO_BLK_T_WRITE_ZEROES 13
> -#define VIRTIO_BLK_T_SECURE_ERASE   14
> +#define VIRTIO_BLK_T_SECURE_ERASE 14
> +#define VIRTIO_BLK_T_GET_LONG_ID  32


U also want a feature bit otherwise driver does not know if it's safe to
send VIRTIO_BLK_T_GET_LONG_ID.

>  \end{lstlisting}
>  
>  The \field{flags} bitfield is ignored by the device unless
> @@ -515,9 +516,26 @@ \subsection{Device Operation}\label{sec:Device Types / Block Device / Device Ope
>  the device to discard the specified range, provided that following reads return
>  zeroes.
>  
> -VIRTIO_BLK_T_GET_ID requests fetch the device ID string from the device into
> -\field{data}.  The device ID string is a NUL-padded ASCII string up to 20 bytes
> -long.  If the string is 20 bytes long then there is no NUL terminator.
> +VIRTIO_BLK_T_GET_ID or VIRTIO_BLK_T_GET_LONG_ID requests fetch the
> +device ID string from the device into \field{data}.  The device ID
> +string is an ASCII string which can be up to 247 bytes long.
> +
> +VIRTIO_BLK_T_GET_ID fetches the first 20 bytes of the device ID
> +string.  If the ID is shorter than 20 bytes, then the response is
> +padded with NUL bytes so its length is 20 bytes.  (Note that if the ID
> +is 20 bytes or longer, this means the response will not be NUL
> +terminated.)
> +
> +VIRTIO_BLK_T_GET_LONG_ID fetches the complete device ID string.  The
> +response is always 248 bytes long, padded to this length with NUL
> +bytes.  Since the longest permitted device ID string is 247 bytes, the
> +response MUST be NUL terminated.

That's a lot of padding) Sure u do not want to use the actual length?

And pls avoid MUST outside conformance statements.
Here "is NUL terminated".

> +
> +Device drivers MAY choose a mechanism to opt in to longer device IDs,

same here, avoid MAY

> +to prevent existing guests

existing where?

> from breaking when they see a longer
> +(non-truncated) device ID.  In this case a guest which has not opted

avoid "guest"

> +in will continue to use VIRTIO_BLK_T_GET_ID

continue in what sense?

> and ignore the complete
> +ID.


No idea what does the above imply.

Maybe add conformance statements that say exactly what you mean.



>  
>  The \field{data} used for VIRTIO_BLK_T_GET_LIFETIME requests is populated
>  by the device, and is of the form
> -- 
> 2.55.0
> 
> 

