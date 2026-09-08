Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C32576ED6
	for <virtio-comment@lists.linux.dev>; Tue,  8 Sep 2026 16:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788884755; cv=none; b=EUOSHt+rCSS/rR89W8D+y63w+9mSXWPDHny/QIAubMYj8a0Cu1zAkNh+xXQXipEOJyqjSIYTE1iwigFUs8X5Edy6fFYYEpyq/eKvhYcgWPnMR4HqwjfjgS2NUAycSPH11cUhZhZQ2RzQScmFpfH12jvV0oyNcYQVWUGNlLX+iMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788884755; c=relaxed/simple;
	bh=yPYaXrKAj76mIfS5XUeO8Z1mAq6y+RqZFmJJCW9l2yw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=L0GI+vDbYk46V+wakIq+0kIPva8cAnrAbpaxeYKVWjqBFGM4lEt/Ttpi7rrnpMXR00G9PYObG38Uzvgz4YOUQYnCXnmp92JUjH2SZF9OyjVRs7w89eO2kjsfytFIE7LXljz5PdUjm7Ugt2iAoUjHvLkNpbXh/Kui+IHPqqMH0o4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=d2TBVxmF; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="d2TBVxmF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788884752;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Sz6jXmHq68rbE5vpnwpS8Zw5iDwf8kFCFuDJimcNHYQ=;
	b=d2TBVxmFw+4Z85wDyn0XLP+JkcgCosIbNypB/k+bZs9X/gXtMrvR67Mo2jXAMhLBagofG0
	uzbMNXz+RIx8SbUtd/wAJJPYRsdthyDvMzDdgHOyawhtHOtbmm6+ZOlxBsr8+ZO7r9xTX+
	KZd7ioa8GEhRyRU/qIbQcjzFwlEeWbI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-385-W11rtzH5P9emlVkod9hBUw-1; Tue, 08 Sep 2026 12:25:51 -0400
X-MC-Unique: W11rtzH5P9emlVkod9hBUw-1
X-Mimecast-MFC-AGG-ID: W11rtzH5P9emlVkod9hBUw_1788884750
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-482e538ad9fso4298938f8f.0
        for <virtio-comment@lists.linux.dev>; Tue, 08 Sep 2026 09:25:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788884750; x=1789489550;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sz6jXmHq68rbE5vpnwpS8Zw5iDwf8kFCFuDJimcNHYQ=;
        b=KRGVqxiWQ7u/P3+4FdxL1hBQDoPWHIVwA6aPxDOzEM4BHUaHYdTaXGeSFUBH5SJhEX
         WTnEgBqmjS6MVhIMeXE2uceXPhKEIglVJUum+hVxntVjsfqnZ2Okzi10d5sNenPOJejw
         0DRhPL9u9tE7b0zzqmdIQRNbq6W08DkMQoeK+404Rsfu/vtvoEX/SXSh/IOSFuj3R3Wr
         QpqEaliM6f6SgX3C8qxnuawU+gZlYiP44vx4s1K2/6W/mk0uNw2O2aFpI0armLoeUqMV
         KZ4O6h8vRDUFK7QhA3uDcjdv6bl7gENlRF1B00kP+tl93zope3FDar70vD9yiUBDi6vj
         hUHg==
X-Forwarded-Encrypted: i=1; AKwUvBzp9/BB4U43dp0UpabzPYWpG2YtlHQEDmDB+URw1s87bmxy4HFNPGOFYQDJQeDyqWOnnjPMmb7rS1XXkE7wuA==@lists.linux.dev
X-Gm-Message-State: AFuF++lxXNGtFklbisySzYCXOPVb/Ip02/atAfPoAmu+hFbLiu53Yj7V
	0yPZPP/irItqbrHOrV/t3MzXQ7DzoIqMb/qJQde92UWn6VyWr8YEZ2NQIKj/22YBkF4ix1Tq8QF
	kC1yL0pOYKq3uRHcfRKGC608rRmUDTS94iGFRutebt+1V/jntbWMM7FL6Z1h+RR3kCVCc
X-Gm-Gg: AYBFou3zE71QsscL+UVgrm0i0xSu+V1kEbnAbLOZdG/3Fr1uer0ClUIbYtyEqoPpoKe
	vnykTPYL2Ts4hAqdIIcXXHAIUOGFK4Ox5yG30gy7gTtn2bh0EtOTKgGTrb0136dpaUfAG/dN+Xu
	tWXEAl/dn+iUPTk35Jp+X3sJV3reK9w/3v82PJn7hhhcMq5LBctfmwRFRSc7BNsO5Ak1ZPSZhTh
	g/OnPlD0TAUlS3ca9gN63ZcKaMghLtlDe7o8WCiMw2TxpK9aGAIs9GODipzgK1wga+nO4kcaybA
	CDy9J0c0prO59mf49r+aZNnUwEh/IP1fXXFhHTIgVDgvyadkmxEu+XZOi6EeSY0jiBzORTZ1R0A
	LMrfXX/pvNJ5zas9tyfZfEE8=
X-Received: by 2002:a05:600c:1c23:b0:49c:eb16:9fd with SMTP id 5b1f17b1804b1-49cf820a8e3mr335033105e9.3.1788884749656;
        Tue, 08 Sep 2026 09:25:49 -0700 (PDT)
X-Received: by 2002:a05:600c:1c23:b0:49c:eb16:9fd with SMTP id 5b1f17b1804b1-49cf820a8e3mr335032295e9.3.1788884749046;
        Tue, 08 Sep 2026 09:25:49 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-79-236.inter.net.il. [80.230.79.236])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bf3f0sm41096647f8f.33.2026.09.08.09.25.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 09:25:48 -0700 (PDT)
Date: Tue, 8 Sep 2026 12:25:46 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: "Richard W.M. Jones" <rjones@redhat.com>,
	virtio-comment@lists.linux.dev
Subject: Re: [PATCH v3 1/1] device-types/blk/description.tex: Allow longer
 device IDs to be returned
Message-ID: <20260908112111-mutt-send-email-mst@kernel.org>
References: <20260908094050.915173-1-rjones@redhat.com>
 <20260908094050.915173-2-rjones@redhat.com>
 <20260908151446.GC1016680@fedora>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260908151446.GC1016680@fedora>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dbTKUCn-Wj8fdFhf73ThnEJwuJt16uwRralJkUE-m70_1788884750
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 08, 2026 at 11:14:46AM -0400, Stefan Hajnoczi wrote:
> On Tue, Sep 08, 2026 at 10:40:50AM +0100, Richard W.M. Jones wrote:
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
> > ---
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
> > +\field{data}.  The device ID string is an ASCII string which can be
> > +up to 247 bytes long.
> > +
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
> > +
> > +Although 247 byte device ID strings are allowed, there may be
> > +interoperability problems if strings longer than 128 bytes are used.
> 
> Can you be more specific? Is the concern that the guest software stack
> above of the driver may not be prepared for serial strings longer than
> 128 bytes?
> 
> > +It is also advisable to use only 7 bit ASCII characters.
> 
> Versus "The device ID string is an ASCII string which can be up to 247
> bytes long" earlier in this patch. Is ASCII a "SHOULD" or a "MUST"?

Without VIRTIO_BLK_F_LONG_ID it's a MUST I would say, since drivers
might have relied on that. With VIRTIO_BLK_F_LONG_ID we can relax this.


udev has a set of baroque rules what is allowed
in the serial everything else it replaces with _'s


int allow_listed_char_for_devnode(char c, const char *additional) {
        return
                ascii_isdigit(c) ||
                ascii_isalpha(c) ||
                strchr("#+-.:=@_", c) ||
                (additional && strchr(additional, c));
}


additional is / and space

and it allows \x followed by 2 hex digits.


And it allows any multi-byte utf-8


So in fact unicode is safer than ascii.


Does not seem like something we want in the spec to be frank.



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
> > -- 
> > 2.55.0
> > 
> > 


