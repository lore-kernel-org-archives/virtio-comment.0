Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D7D94248BB
	for <virtio-comment@lists.linux.dev>; Mon,  7 Sep 2026 07:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788767827; cv=none; b=ZlQ2TBYurHnp4Mf0CFl5EkE4dyuafshZVzSANY2ZT2BWrByyOW74IR4DZje8UQEJqksLaV3rnvWOVP5L2TNOmrypf00tn3nl63SA8+nXYRluhMmz7sBkbZJ2APcsbn25edxU2by+QQ1FW1uMf31TcxtSBatzrryChVCJzDrl1vM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788767827; c=relaxed/simple;
	bh=GnRvOVCGGTseURfhdUaEQOgrXd1eka4XD5p6/CW/Uiw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=PoTDgf4jxHgSfJLZ7Nm9Q4rhmorwYf7vaKSH0G3qSoD43m/cWPmW0rDcSAyi7TQJhHrh2oVdgZ75OQh7+BD/+GhoRyVoB9k3IXfmI0lZSK01L/fowGwD2et0mdH608TUpBU0zjZ+7qURNPXSQUyCrl1YiifLzeKcaDlENW97c2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gJRiABI8; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gJRiABI8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788767823;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gjeb+BmNyEXqaAYmgBFe5t+iIRrBZFArtarK7EYURK0=;
	b=gJRiABI8qI8Dnm+0IDfRLv3NOeveOJBFgZB9fW9YloH/F6NEo4KQyOcdzDsFMfRU2m3F/8
	dd9NHC8ObZiZELaLgCeYvQqEgp1r1cpn1mIlWxSkSgdFaYtgTGYb2pJitL662kcn8uNh5N
	5OB8XucEZxscCFpAvKYiJJgkf1I25rg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-477-WIJvs8UnOMq364o5YT_y_w-1; Mon, 07 Sep 2026 03:57:01 -0400
X-MC-Unique: WIJvs8UnOMq364o5YT_y_w-1
X-Mimecast-MFC-AGG-ID: WIJvs8UnOMq364o5YT_y_w_1788767821
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-48439eea716so2092256f8f.2
        for <virtio-comment@lists.linux.dev>; Mon, 07 Sep 2026 00:57:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788767821; x=1789372621;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gjeb+BmNyEXqaAYmgBFe5t+iIRrBZFArtarK7EYURK0=;
        b=QmS7a3aSCIiXLCORJBwqpD488kOowrvICJpqUZRINT8yBghyd0rlerAhlJNqxQS5HV
         3Rew+KEFD5VofybVH6OkW+2hjOqtUCIS/D1hM2VTCgSBWc2eJ/GyjG9NIgY5FqodVPY0
         MoC1uUib1H5i6xM+DvGo0RULd8hcm5+Qt3nnNyRTy8/zFEaY7djyioeQJKqCOhCnaV3p
         B0vl5dnqvJHBhshqnQVslEjAp67gEwr1L7I89dm1Fx2EpUeiUD/N/FyN2rAceFjmGZMV
         hcJF3xGoXdH01FOaXow/39jDH9AlpuRLYh6IjRu5RUEZ6UUHpJ0+ZgtYY0PSq/vUvHbM
         3DBA==
X-Gm-Message-State: AFuF++lGSCUWaBIJ61yyXK/2cnSprMss8pC+I6glZzBMlsND/9wuMiZO
	exKY6/PyAdI9xejAZnWxRHyTqLyuasFwXAB3x8EjZo37Xirk9tEBfdEUu1Yl0DnuRJOHkxMu4gM
	bDNdK3Dj0vSD0iedzac160ljTrPkZSQvNWrZY80gpk8B2RcDQHtjV5mYc6wu1bxwJB2kp
X-Gm-Gg: AYBFou2S3yxgte2kqHZV/7LGrPC2ztZPxXQD7S20xB0OL707kqyM21lpp67mmMaJQWc
	JdZUIeLVSJd6emmWBEtRs0aFDWavXbZLOHZiw0Pg3V74aFG2pOtExwlCQ7M0WiGR4hqJ+QMCODE
	8PSuvN/xrMgV1dmuRH7uwEAfMIrkHdlPiyrIxqXeHDf3dQtTsj2b66Cq31FwdyYEYs6H+0O90l8
	t7kXpxHLh5s2dhkDPEkdi4Fq5mo9l3vt7HPaqH8GsmpbqLXEm+7TCJx8TPUCe6WcseAubRw2ODw
	ExrvGLrE6HbYfFe4UYhFXDUWwpT5IEVS+5PrBhdT8zVJp2vO21lNOK7T/cOVP3JGDOdn8fnfPzx
	BIFndPXnzTMY/eCyYRfbQR/g=
X-Received: by 2002:a05:600c:190d:b0:49d:72d:9ba3 with SMTP id 5b1f17b1804b1-49d072d9bccmr114895875e9.14.1788767820512;
        Mon, 07 Sep 2026 00:57:00 -0700 (PDT)
X-Received: by 2002:a05:600c:190d:b0:49d:72d:9ba3 with SMTP id 5b1f17b1804b1-49d072d9bccmr114895395e9.14.1788767819911;
        Mon, 07 Sep 2026 00:56:59 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-79-236.inter.net.il. [80.230.79.236])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48588394fa1sm25756686f8f.8.2026.09.07.00.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 00:56:59 -0700 (PDT)
Date: Mon, 7 Sep 2026 03:56:56 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Richard W.M. Jones" <rjones@redhat.com>
Cc: virtio-comment@lists.linux.dev
Subject: Re: [PATCH 1/1] device-types/blk/description.tex: Allow longer
 device IDs to be returned
Message-ID: <20260907033334-mutt-send-email-mst@kernel.org>
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
X-Mimecast-MFC-PROC-ID: UzW0d3z3AQbUifBvTsUTY3yw6DxuaHmmXDlwCWAZ7NI_1788767821
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


I think it is time we folded this list with the defines below,
to avoid repetition, and help implementers:


	The type of the request is one of the following:
	....

	#define VIRTIO_BLK_T_GET_LIFETIME 10 /* get device lifetime */
	#define VIRTIO_BLK_T_DISCARD      11 /* discard */


> @@ -469,7 +469,8 @@ \subsection{Device Operation}\label{sec:Device Types / Block Device / Device Ope
>  #define VIRTIO_BLK_T_GET_LIFETIME 10
>  #define VIRTIO_BLK_T_DISCARD      11
>  #define VIRTIO_BLK_T_WRITE_ZEROES 13
> -#define VIRTIO_BLK_T_SECURE_ERASE   14
> +#define VIRTIO_BLK_T_SECURE_ERASE 14
> +#define VIRTIO_BLK_T_GET_LONG_ID  32
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

why 247? It feels like a lot, especially given we are padding. I'd say
128 maybe.  This way it fits in a single pci express packet on most
systems.

And as long as we are relaxing things, let's allow unicode?



> +
> +VIRTIO_BLK_T_GET_ID fetches the first 20 bytes of the device ID
> +string.  If the ID is shorter than 20 bytes, then the response is
> +padded with NUL bytes so its length is 20 bytes.  (Note that if the ID
> +is 20 bytes or longer, this means the response will not be NUL
> +terminated.)

Why first specifically?


> +
> +VIRTIO_BLK_T_GET_LONG_ID fetches the complete device ID string.

Until we add LONG_LONG_ID )

>  The
> +response is always 248 bytes long, padded to this length with NUL
> +bytes.  Since the longest permitted device ID string is 247 bytes, the
> +response MUST be NUL terminated.
> +
> +Device drivers MAY choose a mechanism to opt in to longer device IDs,
> +to prevent existing guests from breaking when they see a longer
> +(non-truncated) device ID.
>  In this case a guest which has not opted
> +in will continue to use VIRTIO_BLK_T_GET_ID and ignore the complete
> +ID.

But we don't know that the first 20 bytes are unique or descriptive
enough.

>  The \field{data} used for VIRTIO_BLK_T_GET_LIFETIME requests is populated
>  by the device, and is of the form
> -- 
> 2.55.0
> 
> 

