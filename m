Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EFB83F413A
	for <virtio-comment@lists.linux.dev>; Mon,  7 Sep 2026 19:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788809254; cv=none; b=nwXnU4jA6z+SVnFi9Q5ItN/zAvdHSzslYIAYz/lWO8QJXUoJmWrN2rLFcBXFxEuSsA+neBhVTW7qbPbDvjrd8KytTTL023062Gm8/ZwYvqmhqYZajPiN+CgXnciSBJxx4RvNXeJO7YO2OT3cO9C4S1zfSBroX9KTPh7rMRM6EVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788809254; c=relaxed/simple;
	bh=WpUe8p3NHBptY9/IW9PdqVa0oAJ+72uVWtZ8JaXo/H0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=i0QmpmWOivEr34Ct0x66+MXZYnOT5bPhRvHzvdfYhB4p34E50MoilxYM0K9oPegO47t+wBDd9czsUPYa33RCT+j0wxqPExRB7iZasi+O/P0bGRZmB1hx9fTWpAb2sgvIp2DSc3hSXCM/LZnGs0fR54JRMfuUJ9Bp4BAgwtMTdcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Gb17IsHn; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Gb17IsHn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788809251;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=H5QrBAA9iPG3f+22p1LUDJWDsRo3ZV6KAayNLNYMw2Y=;
	b=Gb17IsHnKv+WA+B5LYSc5QShnTP7v7ZKEHgFcibpIY5iLI5A7Jc/DEPamg3gtdGXackmvo
	MileKa5rj5WwuUD9UwiiDPZ4TtIg7Khhpol08alV/hTEonvmpQXdCLZ1UwrZ693Sj+9L4i
	Xz1EFz7J8OG1unpFbjGUFwhNqpSn44c=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-355-N3ACf7E0NQ-kOMxCYHSnUQ-1; Mon, 07 Sep 2026 15:27:30 -0400
X-MC-Unique: N3ACf7E0NQ-kOMxCYHSnUQ-1
X-Mimecast-MFC-AGG-ID: N3ACf7E0NQ-kOMxCYHSnUQ_1788809249
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-47d81cf0c4cso2417392f8f.2
        for <virtio-comment@lists.linux.dev>; Mon, 07 Sep 2026 12:27:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788809249; x=1789414049;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H5QrBAA9iPG3f+22p1LUDJWDsRo3ZV6KAayNLNYMw2Y=;
        b=lZLniYEHjJsrokIE/7XV3S/l0RHwS3GSqCixjTVoFC3q9gAmOop3wUtpHjRWVNregM
         xVe8iwZrAjciXBN3133ivDovJFqMg3zXDLZ9ejR0PXpaiAx6lynHNmK7BS3fRvt0uOKM
         XPsUQNzUHjl7xXQgn3pcX8q+LkWMLdBrPUb+PHSjgr+DpY+1555o3XRamGJk9z2gZFkX
         59RJi3HLuuS4QP3d2rMNezy90+4zSmuLId6aztPov/Q82O1h/R+1rxPLu/KVbL7DdY1j
         vi0aEsR8yrvQll2a6Ej5foe9gP/syuyiS9Lew8Q+JQVqXxuS2tQBtFJdM7W0HvL32uDx
         QuHg==
X-Gm-Message-State: AFuF++mM+szN1vAZ7pE2C/1kir2qIhVkbO7jooW7lKtt2mv9mBe4rBvd
	auPSlHorX1Gem9zoGUJpnnrPcRfyD/Ymb2J8c7dPksMKHhLdIG5WgB+CYZc/OU+8EzXtmXL4B1e
	P2XE7lxguKHiRSUqcKwPrBw7XZjbjgqi3dXNF4dNHoj4PZBO8S+0qtukjaNpFEJIwwEOS8xnCqX
	CW
X-Gm-Gg: AYBFou0eVriWQ1/CpD9jTX31O29rdvxRTfgg1Qt9az9td98y1MiXG/OQAAnDahMJ3+8
	1eCsh4b+9y8WTS9OuWqgG7/QBT0KBO0XnEJ2ilkEfy1qEZ49HI+4LO+GGmceDWBcVjmmsG+iw+c
	62kTKJrnKSNd7u2C6OSxlRBA0RzFcdCa9y/SkHG/NTkR/QmVhPrPlvquPSqitFSSTNm8wP8o7vs
	7gGeNuj71+eHx7/gb0nIMXNSiQQTmGK033kDeFn4icsnpDE79jnXknBbzIWAz8yXFK94mikRhy8
	AQhmTLAERKSt11+SOuvR3ysTZ6gh7r/AnxsOl8aCg1DpUKRKexGj2oXOTivDiM5To+oZnEFVIRk
	0sIIwz3Rj7vv2H3cdD6CDohI=
X-Received: by 2002:a05:6000:4819:b0:482:fc30:a1b4 with SMTP id ffacd0b85a97d-4858704686dmr53574223f8f.5.1788809248822;
        Mon, 07 Sep 2026 12:27:28 -0700 (PDT)
X-Received: by 2002:a05:6000:4819:b0:482:fc30:a1b4 with SMTP id ffacd0b85a97d-4858704686dmr53574168f8f.5.1788809248314;
        Mon, 07 Sep 2026 12:27:28 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-79-236.inter.net.il. [80.230.79.236])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883be709sm31068473f8f.21.2026.09.07.12.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 12:27:27 -0700 (PDT)
Date: Mon, 7 Sep 2026 15:27:25 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Richard W.M. Jones" <rjones@redhat.com>
Cc: virtio-comment@lists.linux.dev
Subject: Re: [PATCH 1/1] device-types/blk/description.tex: Allow longer
 device IDs to be returned
Message-ID: <20260907123437-mutt-send-email-mst@kernel.org>
References: <20260906145444.127570-1-rjones@redhat.com>
 <20260906145444.127570-2-rjones@redhat.com>
 <20260907033334-mutt-send-email-mst@kernel.org>
 <20260907140224.GQ1436@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260907140224.GQ1436@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: deqOkuNja5366K37mQvyr-qzQkBFoKYT48x1CbCcG-Y_1788809249
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 07, 2026 at 03:02:24PM +0100, Richard W.M. Jones wrote:
> On Mon, Sep 07, 2026 at 03:56:56AM -0400, Michael S. Tsirkin wrote:
> > why 247? It feels like a lot, especially given we are padding. I'd say
> > 128 maybe.  This way it fits in a single pci express packet on most
> > systems.
> 
> virtio-scsi supports, at least in theory, 248 bytes, see:
> 
> https://gitlab.com/qemu/qemu/-/blob/cacd3462963a0a4f5bab4263ce79c2aa4b32692d/hw/scsi/scsi-disk.c#L708
> 
> This is chosen because of the maximum page size of a SCSI VPD (256)
> minus the 8 bytes used for the header in VPD page 0x83.

Can I see a spec which says that is the maximum size?

> Windows supports up to 128 "characters" and does support Unicode:
> 
> https://learn.microsoft.com/en-us/windows-hardware/drivers/ddi/storport/ns-storport-stor_serial_number
> 
> Although ...
> 
> > And as long as we are relaxing things, let's allow unicode?
> 
> ... I feel we're just going to be introducing a world of pain by
> trying to support Unicode, and I think anyone trying to use Unicode
> serial numbers is doing it wrong.  Or anything outside numbers,
> letters and dashes TBH.

Really anything close to NAME_MAX is already a world of pain
for guests.


> Serials that I actually care about for my use case (converting from
> VMware) are written as 32 hex characters, which VMware refers to as
> "UUIDs" (they are actually encoded in binary by pvscsi but that's not
> relevant here).
> 
> I think we could choose 247 or 248, but recommend that serials never
> exceed 128 characters if implementers are concerned about
> interoperability issues.  We still want to permit virtio-scsi serials
> to be compatible with virtio-blk which argues for the larger sizes.
> 
> 247 has the minor advantage that the response is always NUL-terminated.
> 
> > > +VIRTIO_BLK_T_GET_ID fetches the first 20 bytes of the device ID
> > > +string.  If the ID is shorter than 20 bytes, then the response is
> > > +padded with NUL bytes so its length is 20 bytes.  (Note that if the ID
> > > +is 20 bytes or longer, this means the response will not be NUL
> > > +terminated.)
> > 
> > Why first specifically?
> 
> For backwards compatibility (assuming I understand the question).
> qemu's current behaviour is to truncate.

That's just a qemu command line quirk then.
At least from spec POV it isn't - the id must be <= 20.

> > > +Device drivers MAY choose a mechanism to opt in to longer device IDs,
> > > +to prevent existing guests from breaking when they see a longer
> > > +(non-truncated) device ID.
> > >  In this case a guest which has not opted
> > > +in will continue to use VIRTIO_BLK_T_GET_ID and ignore the complete
> > > +ID.
> > 
> > But we don't know that the first 20 bytes are unique or descriptive
> > enough.
> 
> Sure, in fact we know it is _not_, which is exactly the reason to
> introduce the longer serials.
> 
> I'm preparing a follow up which I'll post shortly.
> 
> Rich.
> 
> -- 
> Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
> Read my programming and virtualization blog: http://rwmj.wordpress.com
> libguestfs lets you edit virtual machines.  Supports shell scripting,
> bindings from many languages.  http://libguestfs.org

