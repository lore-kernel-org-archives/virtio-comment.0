Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE35F3D3336
	for <virtio-comment@lists.linux.dev>; Wed,  9 Sep 2026 07:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788937656; cv=none; b=HSpKS6yBsReEzIZs+GpnyFPPIGqjhJ0EQo2YVdrnKjmCQzkiD5dQZmtvfCCTqQfLThmnfAqb2VfdepmtqIxC3CDMZitEjSiNMvZL0ld5uOkBsO1maInhzrtpsSPJ6J8Sk43ixHsENrEo/MjK5nkNg/xXD9dGw9mNzE1KsKuOpzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788937656; c=relaxed/simple;
	bh=Xj2wvP/O/9PLVtJb7IDSQCQYCFyx+d169np5R4Ucaxk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=iiQS4OO4DqMM2YIL79cNXOiN4vyv0hP34LojRcIZdyzIlk3Rkg/T2FIt+sNMq5X5cGJ3MJMXEdUFS2ujvvnICK6ughOEMXpu6t0WIEAM8nHnQqC/5i+u+43gRr0nfIKhlCotMuNj3dcoJevkS1E3YpRllHsaJRqdcP9HKnHneXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iygXlotG; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iygXlotG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788937648;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=C9z9y99uYj/TDTlzNtK6gonzdrVitC2H7w8g1XWaCKI=;
	b=iygXlotGdnbqeRSsFRYVJREiWOvjvvakHrsOKQ5o4FhK3667oNo2xZIbV5YlVAKlQtO7JZ
	1ra+Sl7yu44SH+Q4Ttm1PZaw7tbdAmueVr+DhTyMieJSm1QH9EHb++4Ac4g3mzGWuK3auY
	tb2IoX33PhTzZw6L1DKzrmnCFsTuC5Y=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-400-H3MvgQ7sPqur-NfHzQs8iw-1; Wed, 09 Sep 2026 03:07:26 -0400
X-MC-Unique: H3MvgQ7sPqur-NfHzQs8iw-1
X-Mimecast-MFC-AGG-ID: H3MvgQ7sPqur-NfHzQs8iw_1788937645
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-496bbcf7d1eso49325985e9.0
        for <virtio-comment@lists.linux.dev>; Wed, 09 Sep 2026 00:07:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788937645; x=1789542445;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C9z9y99uYj/TDTlzNtK6gonzdrVitC2H7w8g1XWaCKI=;
        b=WfW77tGcQkHYCwKfcN11Dj4KkBSAQfiOv78K29+DCxDBEec4Yfs7SdRrbKVc77qlWX
         meSppXy6u06XhPu9mqMZuAwbU0bxNIRMlWwg4O+eb/33h7o8cpWwlJu8cfQ07wHxsNKe
         toH5qHOEFlf4MnlDmqXl3e9k1m/273vkCVNX/z/WD1h3xeUpV5JJ3U/ySztE8JcnQn64
         3/YPEv+3suzjTIYEfm7xTtTtDoc84PEm9ey3cpX5VdbCwrWGBIFVCZq6OR6Qec0XI5pM
         3GKK4K3MwqULgXaxguUAV+rOqIGWwJ9XvvsDjMc1J1MzornWtP+4VV4foARsfSV1YrQS
         1JLg==
X-Forwarded-Encrypted: i=1; AKwUvBylLk4Qc/S1VmRSlfsn4mlptvdSfX8Sp8b3GVIgeQ830FS5VBvkJ1FH2DgQjKBV2eWeilLuBkcAdVBXdnK4hA==@lists.linux.dev
X-Gm-Message-State: AFuF++m3hHHqdnK9aIMXYwkEoIFrX16pOb6TJt6IODErAVvlEUGN2noX
	MFfAsk0E/+kf9PJ2RsIRv7Vp0JpKmIWeq4ANvhnFgbfCKFSv4SxyjVC8nZyGd8PE68cOdFBr/bi
	K1n2ugQLoFL5SQTIc953/oQe4CymegVPEH0kpcIhl0EOeIQKmchVuSfqw9cidS5ork+G/C57p4A
	h8
X-Gm-Gg: AYBFou0LvXQzXdE26QGJ8GtzMphM4aw5cVdd0JtrlfCEqej5YR/Q+0VyO3DaiVfJa3K
	R6uR/D/epNhS6RJje8IwtI1gxkijWOOpNskOCUmtqr8qxZH89FCBrvdFCQUmyk3TC7drm47lL6S
	0z2ZZqZ6c920lCwDhDzosu5FdA6T55SEdbHF475GSTpgn/5tjPKeG9UsjFYFHd09b9LjIQcxYOL
	0LsgHAaUwfKtOGFlUzz6lkAHoVX6rzA27uHwo4Ee0Lu9Lrve5qYWV3am3y7KYm2rNPloxtYJuCS
	/EAItpq2TzeYE7weYu2DCFiCB3fcA2j/Y1Qn0LO3EFe67JE9LeHGIFe48MUZ0zjjN6P7LzT+WlM
	jmWzOJdw1/VLmciPOxsLmZds=
X-Received: by 2002:a05:600c:34c2:b0:49d:10d6:fd55 with SMTP id 5b1f17b1804b1-49d10d6fdeemr168615675e9.1.1788937645397;
        Wed, 09 Sep 2026 00:07:25 -0700 (PDT)
X-Received: by 2002:a05:600c:34c2:b0:49d:10d6:fd55 with SMTP id 5b1f17b1804b1-49d10d6fdeemr168615195e9.1.1788937644897;
        Wed, 09 Sep 2026 00:07:24 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-79-236.inter.net.il. [80.230.79.236])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d0af538d0sm323214535e9.8.2026.09.09.00.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 00:07:24 -0700 (PDT)
Date: Wed, 9 Sep 2026 03:07:21 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Demi Marie Obenour <demiobenour@gmail.com>,
	"Richard W.M. Jones" <rjones@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>
Subject: Re: [PATCH v3 1/1] device-types/blk/description.tex: Allow longer
 device IDs to be returned
Message-ID: <20260909030536-mutt-send-email-mst@kernel.org>
References: <20260908094050.915173-1-rjones@redhat.com>
 <20260908094050.915173-2-rjones@redhat.com>
 <20260908151446.GC1016680@fedora>
 <20260908154640.GW1436@redhat.com>
 <20260908123542-mutt-send-email-mst@kernel.org>
 <14dea311-7050-41e5-9645-ee8e3b719db6@gmail.com>
 <SJ0PR12MB6806E5F5BE02AC29440E8056DCB02@SJ0PR12MB6806.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <SJ0PR12MB6806E5F5BE02AC29440E8056DCB02@SJ0PR12MB6806.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: tabLo0A7oHgja12osU2SYYGHBW5E386ZmBZbqUHTZnI_1788937645
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 09, 2026 at 03:34:25AM +0000, Parav Pandit wrote:
> 
> 
> > From: Demi Marie Obenour <demiobenour@gmail.com>
> > Sent: 09 September 2026 07:42 AM
> 
> 
> > On 9/8/26 12:43, Michael S. Tsirkin wrote:
> > > On Tue, Sep 08, 2026 at 04:46:40PM +0100, Richard W.M. Jones wrote:
> > >> On Tue, Sep 08, 2026 at 11:14:46AM -0400, Stefan Hajnoczi wrote:
> > >>> On Tue, Sep 08, 2026 at 10:40:50AM +0100, Richard W.M. Jones wrote:
> > >>>> +Although 247 byte device ID strings are allowed, there may be
> > >>>> +interoperability problems if strings longer than 128 bytes are used.
> > >>>
> > >>> Can you be more specific? Is the concern that the guest software stack
> > >>> above of the driver may not be prepared for serial strings longer than
> > >>> 128 bytes?
> > >>
> > >> I'll add more detail in the next version, but in brief the problems
> > >> are twofold:
> > >>
> > >> (1) Windows supports up to 128 "characters" (they're not precise but
> > >> they probably mean Unicode codepoints from the Basic Multilingual Plane):
> > >>
> > >> https://learn.microsoft.com/en-us/windows-hardware/drivers/ddi/storport/ns-storport-stor_serial_number
> > >>
> > >> (2) When udev tries to encode a very long serial into a
> > >> /dev/disk/by-id path you end up uncomfortably close to NAME_MAX (255).
> > >>
> > >>>> +It is also advisable to use only 7 bit ASCII characters.
> > >>>
> > >>> Versus "The device ID string is an ASCII string which can be up to 247
> > >>> bytes long" earlier in this patch. Is ASCII a "SHOULD" or a "MUST"?
> > >>
> > >> It's "SHOULD".  I can't see any good coming from trying to use
> > >> anything except letters, numbers and dashes in a serial, but both
> > >> Linux and Windows (see above) could in theory handle Unicode.
> > >>
> > >> Rich.
> > >
> > >
> > > Linux actually has code to try and handle that. unicode
> > > is actually the less problematic part - ascii is
> > > full of pitfalls, eith things like
> > > slashes are much weirder - e.g. udev will create
> > > a subdirectory with slashes. what will windows do?
> > > and what will it do with backslashes? /me shrugs
> > 
> > What about /../../../../../../../../..?
> > 
> > Honestly, the simplest way to protect against problems is to
> > just use a hex-encoded or base32-encoded cryptographic hash as
> > the name.
> > --
> Any issues in just using the UUID format?

Not as such, you can use it if you want. limiting ourselves to that
isn't addressing what Rich is trying to address, which is a lot
of legacy guests, since there are lots of users with lots of different ideas
what a serial should be.


> > Sincerely,
> > Demi Marie Obenour (she/her/hers)

