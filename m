Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CEF53B42CC
	for <virtio-comment@lists.linux.dev>; Tue,  8 Sep 2026 10:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788865040; cv=none; b=ryZoFBr3LV6v1nOO8rDTQf1nYrNUvdSte46XnHXlTp3w4+eJ4q9gPl5SO8ccitT0EENgh93rbtPUJxSZVkaBhF5n6unRjD5V9f/TlxvzOvJpa6k8fGiM5g+HoOiD+sS6hcwYEPOht9lgX+mLEELw9fo4J2Pww5UbKnXvaA/TtYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788865040; c=relaxed/simple;
	bh=03sw34jbwgpZQpJ3w2oi3Datc6rdSm32A5FvzQWQ1B8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=W92CkgXdqCZm+vLbT4SGS6L+/ATvUauaDtYEROKpybvtI7ZWq8hsHGiPBdGse6hwCofNqGbdbpg34WVFCqoxlc/vHSCkoFOqwtGosCmtf/fdXrjiNqbHFbPo8o+T5DDvvCOCN9uY/Awg0LIDKLekMx456B0mByi48q4xlxByCSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BXKIkflr; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BXKIkflr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788865033;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uXe5td4q4LJREYt1OlIXM1jOq3DmrcLFV3ljcoatZu0=;
	b=BXKIkflrZxdCojrL9gtdP2itReiDbOXs6Dm+trg6odYWkFRdzomUalosZbEcU9aOKJg6H4
	XHmDQT81sz5eoBqpiTcJD/AQkBLguVtA4HGw43jHSSI3LK75yXzkBziOT37fr7S2C3DFVb
	j6DO7PX7/QebyvlFMPeiyAsA84B9gC8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-453-KRFsLw9bMZmMl3fUVVyS9A-1; Tue, 08 Sep 2026 06:57:12 -0400
X-MC-Unique: KRFsLw9bMZmMl3fUVVyS9A-1
X-Mimecast-MFC-AGG-ID: KRFsLw9bMZmMl3fUVVyS9A_1788865032
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4994aebe932so58437815e9.3
        for <virtio-comment@lists.linux.dev>; Tue, 08 Sep 2026 03:57:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788865031; x=1789469831;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uXe5td4q4LJREYt1OlIXM1jOq3DmrcLFV3ljcoatZu0=;
        b=dgsNX+vslVOF/We+AjnYxF8ECNsUlPzKGasQw1x0CSNYrzgcP+dPPaRxx4aRKf+kZr
         lb74naxviHTgfx+cWm7hmMzO8djOneRekt2GNuZVTHqi5KdFeuxr+U3tW0psxqL8WNmo
         prnTA3ssBh99dMKfR7cYudUnmRNN2qu0Mx3fFnF5kx4wKPGH6VtddV7NDxktyQ8Gi2r+
         8IN9lyv6QR8FEzYCUqOyuGM8V/jfaJz6nRm2RU3NjFoO0T+t3tDEDExd/xlDkyDVeHSk
         rY+O0A03UCLQ9TBvrSZX6NzoCV+eb14SVNTF8wK5NSAJr8Goz3HDg/e1oUsP2upit7ru
         Ytwg==
X-Gm-Message-State: AFuF++nIQq1bRiOHf11yCVcaSlyzdcF6zb06ObCLPsNhZjauhhHX0Sqf
	YNjV83RvhwexfBvNhm/pgoZj8n2TX5yD/t02Qc1gTJlktwfUBDfcgPI388Tr+8wi/mTD+MgzvvF
	JcYWfxC3UrQs8Zjj5Mw761UvN6eQg4GkvbMUrsoUfUNg5Ct1FK5E8u55y2gubXo+pbFp4d3hj3y
	nU
X-Gm-Gg: AYBFou2hxEC+JAeJW+zQq0Fd9JFmYNdRudR1WXYCGOkO0HK+n9m797Mb67N77uKZqMD
	u3Bwe9mkrxusDSpyYqfO46gAqY9VrfXiBViI82TqC0lHurlOCwQvrmHkmtR859jSARaS9U95lEB
	hj2jr6cx02RjbeBDbf8d53BpXRDxnyjmpPNE0CDrOa3CfV8cUC2xOVT9d4MCEwG0coKvKZh9wwm
	QmgSH+nlcN8uOTEoinIWNJeD3yL6wY8W3QSPfWu5ohFEE+J2B+NVyqYkij2ChUB+O0/p4i8fs2k
	+J68gnDE/mi7Vbu8LoW5ePkZSfONuQ9mtliWLS84itnZZTzDN61WFTopcR0trrzuDYDUx8hTMoh
	VrM0FmruqiVo1gSvuQvuqePw=
X-Received: by 2002:a05:600c:3485:b0:49c:cee0:e7c1 with SMTP id 5b1f17b1804b1-49cf825c119mr616678815e9.16.1788865031461;
        Tue, 08 Sep 2026 03:57:11 -0700 (PDT)
X-Received: by 2002:a05:600c:3485:b0:49c:cee0:e7c1 with SMTP id 5b1f17b1804b1-49cf825c119mr616677945e9.16.1788865030920;
        Tue, 08 Sep 2026 03:57:10 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-79-236.inter.net.il. [80.230.79.236])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf7740d44sm843488875e9.15.2026.09.08.03.57.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 03:57:10 -0700 (PDT)
Date: Tue, 8 Sep 2026 06:57:08 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Richard W.M. Jones" <rjones@redhat.com>
Cc: virtio-comment@lists.linux.dev
Subject: Re: [PATCH v3 1/1] device-types/blk/description.tex: Allow longer
 device IDs to be returned
Message-ID: <20260908060804-mutt-send-email-mst@kernel.org>
References: <20260908094050.915173-1-rjones@redhat.com>
 <20260908094050.915173-2-rjones@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260908094050.915173-2-rjones@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: eGJL_pPw8nXeEeE59OcX0-dM1JI5SAAaTSu1um1-6rg_1788865032
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Thanks for the patch! Yes something to improve:

On Tue, Sep 08, 2026 at 10:40:50AM +0100, Richard W.M. Jones wrote:
> SCSI-based paravirtualized block devices including virtio-scsi and
> VMware's pvscsi allow longer device IDs.  This presents an issue when
> we change the backing of a disk from one type to another, eg from
> pvscsi to virtio-blk, or virtio-scsi to virtio-blk.  The longer device
> ID has to be truncated to 20 bytes.  This results in guest visible
> changes, notably /dev/disk/by-id/ paths are different, so any
> mountpoints or configuration files that use these paths will break.
> 
> Therefore extend virtio-blk to allow longer device IDs.  I chose 247
> bytes (ASCII chars) as the new limit since SCSI serials can in theory
> be this long.  Real serials will be much shorter than this; the aim is
> to allow UUIDs to be preserved which would use 32 or 36 ASCII chars.
> 
> A new feature bit is introduced to indicate that long device IDs are
> supported.
> 
> Signed-off-by: Richard W.M. Jones <rjones@redhat.com>
> ---
>  device-types/blk/description.tex | 27 ++++++++++++++++++++++++---
>  1 file changed, 24 insertions(+), 3 deletions(-)
> 
> diff --git a/device-types/blk/description.tex b/device-types/blk/description.tex
> index 3b3a4e7..aa3ec66 100644
> --- a/device-types/blk/description.tex
> +++ b/device-types/blk/description.tex
> @@ -73,6 +73,9 @@ \subsection{Feature bits}\label{sec:Device Types / Block Device / Feature bits}
>      VIRTIO_BLK_REQ_FLAG_OUT_FUA flag in the \field{flags} bitfield of the
>      \field{virtio_blk_req} structure for VIRTIO_BLK_T_OUT requests.
>  
> +\item[VIRTIO_BLK_F_LONG_ID (20)] Device supports long device ID
> +    strings.
> +
>  \end{description}
>  
>  \subsubsection{Legacy Interface: Feature bits}\label{sec:Device Types / Block Device / Feature bits / Legacy Interface: Feature bits}
> @@ -516,8 +519,23 @@ \subsection{Device Operation}\label{sec:Device Types / Block Device / Device Ope
>  zeroes.
>  
>  VIRTIO_BLK_T_GET_ID requests fetch the device ID string from the device into
> -\field{data}.  The device ID string is a NUL-padded ASCII string up to 20 bytes
> -long.  If the string is 20 bytes long then there is no NUL terminator.
> +\field{data}.  The device ID string is an ASCII string which can be
> +up to 247 bytes long.

Judging by the below, it does not have to be ASCII? just a nul
terminated string?


247 is just a very weird limit.
So we get another
arbitrary number drivers need to worry about. Ugh.
I just don't get all the references
to scsi vpd or whatever. It's your motivation I get that
but we should not set policy.

Let's just simply limit the string to  255 bytes and
make data 255 bytes too?
Then with the status byte the write buffer fits in a 256 pcie packet.

Maybe others feel differently.

> +
> +If VIRTIO_BLK_F_LONG_ID was not negotiated, VIRTIO_BLK_T_GET_ID
> +fetches the first 20 bytes of the device ID string.  If the ID is
> +shorter than 20 bytes, then the response is padded with NUL bytes so
> +its length is 20 bytes.  (Note that if the ID is 20 bytes or longer,
> +this means the response will not be NUL terminated.)

But the driver can not both negotiate and not negotiate
VIRTIO_BLK_F_LONG_ID.

So what does this requirement that the two configs share
a prefix buy us, practically?

Why don't we just say that the ID is up to either 20 bytes or
255 bytes depending on the feature negotiation?


> +
> +If VIRTIO_BLK_F_LONG_ID was negotiated, VIRTIO_BLK_T_GET_ID fetches
> +the complete device ID string.  The response is always 248 bytes long,
> +padded to this length with NUL bytes.  Since the longest permitted
> +device ID string is 247 bytes, the response is NUL terminated.

Let's just handle short and long forms consistently please.
If the string fills all of data then it is not terminated. end of story.

All the subtle differences are just a source for confusion.  Can we not
define something like "maximum ID length" and then use it everywhere,
instead of all the duplication?

> +
> +Although 247 byte device ID strings are allowed, there may be
> +interoperability problems if strings longer than 128 bytes are used.

I think you mean 127? so it's 128 with the NUL.

> +It is also advisable to use only 7 bit ASCII characters.

ASCII == 7 bit. Maybe you mean printable characters?


Pls add both these recommendations in the conformance section.


>  
>  The \field{data} used for VIRTIO_BLK_T_GET_LIFETIME requests is populated
>  by the device, and is of the form
> @@ -911,7 +929,10 @@ \subsection{Device Operation}\label{sec:Device Types / Block Device / Device Ope
>  virtio_blk_discard_write_zeroes for VIRTIO_BLK_T_DISCARD,
>  VIRTIO_BLK_T_SECURE_ERASE and VIRTIO_BLK_T_WRITE_ZEROES requests.
>  
> -The length of \field{data} MUST be 20 bytes for VIRTIO_BLK_T_GET_ID requests.
> +For VIRTIO_BLK_T_GET_ID requests the length of \field{data} depends
> +on the feature VIRTIO_BLK_F_LONG_ID.  If VIRTIO_BLK_F_LONG_ID was
> +negotiated the length of \field{data} MUST be 248 bytes, else
> +it MUST be 20 bytes.
>  
>  VIRTIO_BLK_T_DISCARD requests MUST NOT contain more than
>  \field{max_discard_seg} struct virtio_blk_discard_write_zeroes segments in
> -- 
> 2.55.0

