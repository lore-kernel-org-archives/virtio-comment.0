Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8693933FE05
	for <virtio-comment@lists.linux.dev>; Sat, 19 Sep 2026 22:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789856237; cv=none; b=ooJHdtlUCY/81YHJkaebTbY7jLEvX337kWLW9bSrpv2qxRjVFHk97I/jYfloX1HOYLFZkMzrwEOxC6FiIVX5tXangmNC1BHKbCqeTQ0KgtlDH2IzkvQuVC4ZnmEoTBmRyZV/6//IacxfI87OaYpkxO5Gg0X8/dH+WwihI4xzQn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789856237; c=relaxed/simple;
	bh=pvX46K1nc7wxoGqGBNjk14ktz2nom/UsZCgGFrTPTvE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=LpCGpw0Zyi0P2e3cJl+bZUqmeE9eXtpU0JjPmpUQvjQoo96wMVllXXaE1kL3ykNWZtasXoD1nmhD2ZpBlyw7YUhUx8Xb/ixcCnyIpJwm05EDa/VWnUv2TPp4E/yFzwU3y87IwpNcMJbwx6+no4KCY+qgRMA6R6SrLN1UPauUL68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Z9P9Wcx2; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Z9P9Wcx2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789856234;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=G6fEPFlSbwhBLR+xBliSwWrNeMK0Ljs1tiGpCOeaHsc=;
	b=Z9P9Wcx2h0oVIdBvvC7kyuDPN03novvgYRdAleE6hXNSbQxFsmFGIk+aqCJTxx0b8gYO5j
	JP0L2HfuBYSGmLIIekfqr2HqzklSqQ3Sxoa13JmlEE7TIFakeIt0rSEOUEmYgct6E+E0C3
	7Kz6SgSNgxVWMyeNIn7H+9ptEDMiPLc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-649-IFtgbTdTMRS_63-576Oo-w-1; Sat, 19 Sep 2026 18:17:08 -0400
X-MC-Unique: IFtgbTdTMRS_63-576Oo-w-1
X-Mimecast-MFC-AGG-ID: IFtgbTdTMRS_63-576Oo-w_1789856227
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-49953abe51fso11189285e9.1
        for <virtio-comment@lists.linux.dev>; Sat, 19 Sep 2026 15:17:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789856227; x=1790461027;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G6fEPFlSbwhBLR+xBliSwWrNeMK0Ljs1tiGpCOeaHsc=;
        b=g4GkzFZ7vR7K740L3SUP14h6k5NaVqHT6HlxH+KohrwfOVIuOJ0nb1UhqZnELWVPcW
         20CF46fMlxKntMpNy1VL6RRa3HvXTdb7q46ZQhQHRaO0hGBND0CHpBG2GAxZkTbFq3+y
         0seR6rUxcQFIKxN27vYJ4+jD/lfZ2ZbCyJgkGCxhBwB55W1LHxnWPRmeE9gawhte8nrq
         vrvLPnGtPBWZFkALcO+1V1VevQ3xnszi66SSBqMxJ/hmVE/SXUIT52CcOEZuFtHfIS7a
         BBIsLvECXglPjQ4dnh67JqDl1P29D1KJqse0s4myBvzI5cGq7lYNhm60/caRolNhMimY
         Gklg==
X-Forwarded-Encrypted: i=1; AKwUvBwqtHvwYSY2QxzJIHeC5dPv+h7jG4ewbVtLygcf4wQV2+1xdLJShTaC3+R0LpZZbLPx9rwQMZLQKI7TBDpEuQ==@lists.linux.dev
X-Gm-Message-State: AFuF++nnPurPebdXF1pnfD4urkPK+1GMJlBbVUrEVQwn56CC7A/KLNZ4
	r/x/dW/oVVfxzC6DXBrV6rkDw9Bzb8XKT2Jy511ukHEPpJlpCgVwAfY0P0ye8J0fZhPve8xYMnI
	cswPLph/vV1Gt9vADuE1bXndgDPfnzzr4RWe+YpLar+ArZJD9V7zo/t4R/EAl/L/k3Jnt
X-Gm-Gg: AYBFou3Au7/99E4vVhvpnfSPyyP926TkOhn6NQL1sIPPt/RxrTxdNW77rSw7Jb2gOAO
	KyxKv3hw5wXR/S5Dcm1VJk9EPUd0JxDUyB5DpodKj2fBQFkEIMkWbw9uUw4jveAoe5mhVsV2a4N
	pFjRxWUM2OIaRPJXwm6Nb3uvHJvlswBRilSVfu46113knXJDncnNYhGIh6MoKyVx0/rg3KiMWFJ
	+Bak/tMObcPrPTx9cHeWyUVerMFwTo2nOFXtyGiqxTL41r+wnTdmmjRo7SLummbJxCNgeQSbmtV
	ows37lf6CJuAke7cHLGj6n0ry8QLBFoP10MHY/X3WKinKNXs2ES5WfAxod5uNyfGP2L+MZYRLA0
	aPkRUh/h2kTirMVqX0UAdC6c=
X-Received: by 2002:a05:600c:4e0a:b0:49e:7c7e:274c with SMTP id 5b1f17b1804b1-49fc5724061mr79641405e9.14.1789856227209;
        Sat, 19 Sep 2026 15:17:07 -0700 (PDT)
X-Received: by 2002:a05:600c:4e0a:b0:49e:7c7e:274c with SMTP id 5b1f17b1804b1-49fc5724061mr79641265e9.14.1789856226727;
        Sat, 19 Sep 2026 15:17:06 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-79-236.inter.net.il. [80.230.79.236])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48724562aebsm10505310f8f.14.2026.09.19.15.17.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 15:17:06 -0700 (PDT)
Date: Sat, 19 Sep 2026 18:17:03 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: "Richard W.M. Jones" <rjones@redhat.com>,
	virtio-comment@lists.linux.dev, stefanha@redhat.com
Subject: Re: [PATCH v3 1/1] device-types/blk/description.tex: Allow longer
 device IDs to be returned
Message-ID: <20260919180817-mutt-send-email-mst@kernel.org>
References: <20260908094050.915173-1-rjones@redhat.com>
 <20260908094050.915173-2-rjones@redhat.com>
 <aq13FIJ3xzCGzqzq@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <aq13FIJ3xzCGzqzq@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Oxyyv1sSJTEuTHA9DuCU1n1OquUBL-K46ehAtbd6kh0_1789856227
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 18, 2026 at 07:38:28PM +0200, Kevin Wolf wrote:
> Am 08.09.2026 um 11:40 hat Richard W.M. Jones geschrieben:
> > SCSI-based paravirtualized block devices including virtio-scsi and
> > VMware's pvscsi allow longer device IDs.  This presents an issue when
> > we change the backing of a disk from one type to another, eg from
> > pvscsi to virtio-blk, or virtio-scsi to virtio-blk.  The longer device
> > ID has to be truncated to 20 bytes.  This results in guest visible
> > changes, notably /dev/disk/by-id/ paths are different, so any
> > mountpoints or configuration files that use these paths will break.
> > 
> > Therefore extend virtio-blk to allow longer device IDs.  I chose 247
> > bytes (ASCII chars) as the new limit since SCSI serials can in theory
> > be this long.  Real serials will be much shorter than this; the aim is
> > to allow UUIDs to be preserved which would use 32 or 36 ASCII chars.
> > 
> > A new feature bit is introduced to indicate that long device IDs are
> > supported.
> > 
> > Signed-off-by: Richard W.M. Jones <rjones@redhat.com>
> 
> Please Cc: me on any future versions of the patch.
> 
> >  device-types/blk/description.tex | 27 ++++++++++++++++++++++++---
> >  1 file changed, 24 insertions(+), 3 deletions(-)
> > 
> > diff --git a/device-types/blk/description.tex b/device-types/blk/description.tex
> > index 3b3a4e7..aa3ec66 100644
> > --- a/device-types/blk/description.tex
> > +++ b/device-types/blk/description.tex
> > @@ -73,6 +73,9 @@ \subsection{Feature bits}\label{sec:Device Types / Block Device / Feature bits}
> >      VIRTIO_BLK_REQ_FLAG_OUT_FUA flag in the \field{flags} bitfield of the
> >      \field{virtio_blk_req} structure for VIRTIO_BLK_T_OUT requests.
> >  
> > +\item[VIRTIO_BLK_F_LONG_ID (20)] Device supports long device ID
> > +    strings.
> > +
> >  \end{description}
> >  
> >  \subsubsection{Legacy Interface: Feature bits}\label{sec:Device Types / Block Device / Feature bits / Legacy Interface: Feature bits}
> > @@ -516,8 +519,23 @@ \subsection{Device Operation}\label{sec:Device Types / Block Device / Device Ope
> >  zeroes.
> >  
> >  VIRTIO_BLK_T_GET_ID requests fetch the device ID string from the device into
> > -\field{data}.  The device ID string is a NUL-padded ASCII string up to 20 bytes
> > -long.  If the string is 20 bytes long then there is no NUL terminator.
> 
> (Fun fact: If I'm not missing anything, QEMU seems non-compliant with
> the NUL-padding. It merely NUL-terminates the string and leaves the
> remainer untouched.)
> 
> > +\field{data}.  The device ID string is an ASCII string which can be
> > +up to 247 bytes long.
> 
> I'd rather not replace one arbitrary limit with another one. This
> thread already shows how hard it is to agree on a good number. We can
> just leave this to the device implementations.
> > +If VIRTIO_BLK_F_LONG_ID was not negotiated, VIRTIO_BLK_T_GET_ID
> > +fetches the first 20 bytes of the device ID string.  If the ID is
> > +shorter than 20 bytes, then the response is padded with NUL bytes so
> > +its length is 20 bytes.  (Note that if the ID is 20 bytes or longer,
> > +this means the response will not be NUL terminated.)
> > +
> > +If VIRTIO_BLK_F_LONG_ID was negotiated, VIRTIO_BLK_T_GET_ID fetches
> > +the complete device ID string.  The response is always 248 bytes long,
> > +padded to this length with NUL bytes.  Since the longest permitted
> > +device ID string is 247 bytes, the response is NUL terminated.
> 
> How about this instead: The config space advertises the actual length of
> the serial [1]; the config space field is valid if the device offers
> VIRTIO_BLK_F_LONG_ID. And then VIRTIO_BLK_T_GET_ID just fetches as many
> bytes from the serial as the driver requested. If VIRTIO_BLK_F_LONG_ID
> was not negotiated, the requirement that it request exactly 20 bytes
> remains intact.

I think for compatibility with existing setups, it is preferable
to keep a way for *same* driver to say: 1. now i want the legacy 20 byte
id - or - 2. now I want a long id. because if one wants a unique 20
byte id then it is likely not a prefix of the long one - people
like doing things like using the vendor as a prefix, for example.


> A sane driver would just look at the serial length, sanitise it, and if
> it's happy with the length, it negotiates VIRTIO_BLK_F_LONG_ID and later
> issues VIRTIO_BLK_T_GET_ID with the right number of bytes.

it is quite sane to want both a 20byte id and an X byte id.

> [1] Implicitly, there would still be a limit, by us choosing either u8
>     or le16 for the field, but it would be a lot less arbitrary and not
>     involve any checks that might be forgotten to actually be performed.

I doubt it makes sense to have more than 1 byte for the length...

I'm not sure what kind of checks you have in mind.
A fixed length buffer is strictly simpler, isn't it?

What I would do though is get rid of the null termination
funkiness. just write out the serial and report the
length.


> 
> > +Although 247 byte device ID strings are allowed, there may be
> > +interoperability problems if strings longer than 128 bytes are used.
> > +It is also advisable to use only 7 bit ASCII characters.
> >  
> >  The \field{data} used for VIRTIO_BLK_T_GET_LIFETIME requests is populated
> >  by the device, and is of the form
> > @@ -911,7 +929,10 @@ \subsection{Device Operation}\label{sec:Device Types / Block Device / Device Ope
> >  virtio_blk_discard_write_zeroes for VIRTIO_BLK_T_DISCARD,
> >  VIRTIO_BLK_T_SECURE_ERASE and VIRTIO_BLK_T_WRITE_ZEROES requests.
> >  
> > -The length of \field{data} MUST be 20 bytes for VIRTIO_BLK_T_GET_ID requests.
> > +For VIRTIO_BLK_T_GET_ID requests the length of \field{data} depends
> > +on the feature VIRTIO_BLK_F_LONG_ID.  If VIRTIO_BLK_F_LONG_ID was
> > +negotiated the length of \field{data} MUST be 248 bytes, else
> > +it MUST be 20 bytes.
> >  
> >  VIRTIO_BLK_T_DISCARD requests MUST NOT contain more than
> >  \field{max_discard_seg} struct virtio_blk_discard_write_zeroes segments in
> 
> Kevin

