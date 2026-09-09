Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178663CDBB7
	for <virtio-comment@lists.linux.dev>; Wed,  9 Sep 2026 07:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788937536; cv=none; b=UNS9U1L4EkEPW8cCsui+dKuhXmJRP2/btFgJCDSgn4u3YYfCaMjq4FniGTbyXh21u9b760m39Xb/zhKDjQ1sM/rbH2i8rwIucIfAWBTg5pzwTTX0M1NZyQSYpNgAsO8PfAM94bYRJS7x0lMAgps/mAgeNdaCZRQU4jQLUUceHn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788937536; c=relaxed/simple;
	bh=0dvOb23Amw7z/9CobJTjlFLZlXQvE8wmx62kZ4bJpZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=lZbpZxGqez4WXyPHuZZa5boEN33OIjjn8zCY+FhsphhxdspM1s4qi1inPwfk+wTapcFwQotAniZPN27lUVAVMK4XsQXazMgun70xVTiXDGRIw3X9dfmhTFgzYMWmajyA1OhXlFfEDnAfVVMd+Iz/a9R5VAADEl1xzJrU3XS/Pik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hF2f3iqY; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hF2f3iqY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788937532;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=H/HVWPIg8ef8sKtMj7ooWqwpU90e36C5wYV08HYl/ns=;
	b=hF2f3iqYBy9cOnpu+8wgA9HHQXlFmXbXRMJUMHDQKVvWnf0TswmXHYJ35SXqslWEOZI9uT
	A/CeYd4bzHVP4bmJA6RaTMPcHpKSNMGc5gej/AuqTlSF9Z8X9y7fcKMjKY+m0Sh95Qy38c
	nqU0Y6lKRDNgG4CU2v+MKgNHKzlt8yA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-379-4t-yg9ioN4KmbUX-D1D2qQ-1; Wed, 09 Sep 2026 03:05:31 -0400
X-MC-Unique: 4t-yg9ioN4KmbUX-D1D2qQ-1
X-Mimecast-MFC-AGG-ID: 4t-yg9ioN4KmbUX-D1D2qQ_1788937530
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-49d1a778b9dso17468115e9.0
        for <virtio-comment@lists.linux.dev>; Wed, 09 Sep 2026 00:05:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788937530; x=1789542330;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H/HVWPIg8ef8sKtMj7ooWqwpU90e36C5wYV08HYl/ns=;
        b=m98eaMOQbYxjRfFD2CNYB1G5W2Xtweo1m+00y4VP7fb9pfyo+HL6SjBLPbrp3u36qy
         SRtsB9xFchA2HCc+QUtH+49YVKLE5i/q/AfqjSFj293n3pGM3JbHbUg5ptYyTKDFWups
         vkXmiwLjpdUl+9FGimGIosx5rHn3NIV8ZCgNFwAFzfCCHmLD4aUd1YwSmn6fJSdSmv+a
         7B5vbtCBtBa76KfZC+SvM31CR/Bb4oa9/A6Iw2RDG6nyC7LgZ1BS2Wwa8WcgN1ruLlol
         UP5qmh7H/Tu10StIoJ7ULejD7/h2mQ7SyaWzOCMVbqMb2ocXB83Q1DqP/iTkz7ioBL2D
         kuFQ==
X-Forwarded-Encrypted: i=1; AKwUvBz7q53/YgE4D7fPIb6afbRgurGsssUFoObjDjg7usYaCPjRCLM4/SqM4qmJT3ccRVmrMjGHZup92JH/s8XFIA==@lists.linux.dev
X-Gm-Message-State: AFuF++nJiKRCDP/A4dZpaxeyCifAHTga5gDddEAC73UW3/ys9I7nWdjA
	+HSrQjaQ5knQ+dzifsgRdTAsxlfc0ycWHMHIGixPfJs65qYUEONCcO99dmCnowlcQGJ5YtuqECZ
	+REHvP6S6JvYJe4bzKSDkFQzbZ5wYsE8Fl2PwabAJ0jZMODkQTZ4P6TYc/mgnsTSgDA4t
X-Gm-Gg: AYBFou2ajxC6VPFrDLTy03JH+Q8qrgCmI0mWK1xqgGdhb2z6OqS9hi9GqZUcy52dbI5
	AgBMEH7CN54P1vLzfvJhh6n+8AhIZjQs8SmDIAdlqaZYqC06um1B/IvX4C76oWjCBUft+l/2Pwl
	RsxdMTuo0I7aFmcAN+kdbnCMVaeFCXtoKBNdk7k7z/mcWC3rom1ASiOGmr7YK2VSl5IWgklXiap
	u9dC3l8wM2pa59qK0+R1D2rSOEpkzfpa28WyqxN1YEA9aUsW7t8hUnXPTsx0+F+8Bxz5EZsL5L0
	uT7IjSep9BRfYw2ewq2AJn4/vNLDVFJr27eOzkjoyObtsw0m9od2pE8OEhOOBt4q1gObLgu8nih
	gxwmINADOHNqD5aFnGo3mnKk=
X-Received: by 2002:a05:6000:41cb:b0:482:f61c:7cdd with SMTP id ffacd0b85a97d-48586e4a6bbmr72910683f8f.4.1788937530324;
        Wed, 09 Sep 2026 00:05:30 -0700 (PDT)
X-Received: by 2002:a05:6000:41cb:b0:482:f61c:7cdd with SMTP id ffacd0b85a97d-48586e4a6bbmr72910544f8f.4.1788937529760;
        Wed, 09 Sep 2026 00:05:29 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-79-236.inter.net.il. [80.230.79.236])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4859207c28fsm36731316f8f.5.2026.09.09.00.05.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 00:05:29 -0700 (PDT)
Date: Wed, 9 Sep 2026 03:05:26 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Demi Marie Obenour <demiobenour@gmail.com>
Cc: "Richard W.M. Jones" <rjones@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	virtio-comment@lists.linux.dev
Subject: Re: [PATCH v3 1/1] device-types/blk/description.tex: Allow longer
 device IDs to be returned
Message-ID: <20260909025456-mutt-send-email-mst@kernel.org>
References: <20260908094050.915173-1-rjones@redhat.com>
 <20260908094050.915173-2-rjones@redhat.com>
 <20260908151446.GC1016680@fedora>
 <20260908154640.GW1436@redhat.com>
 <20260908123542-mutt-send-email-mst@kernel.org>
 <14dea311-7050-41e5-9645-ee8e3b719db6@gmail.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <14dea311-7050-41e5-9645-ee8e3b719db6@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: X_g9gIuRR6W33YE3Nx1Tl6TytNk69RyRc7E_CMKZTAA_1788937530
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 08, 2026 at 10:12:03PM -0400, Demi Marie Obenour wrote:
> On 9/8/26 12:43, Michael S. Tsirkin wrote:
> > On Tue, Sep 08, 2026 at 04:46:40PM +0100, Richard W.M. Jones wrote:
> >> On Tue, Sep 08, 2026 at 11:14:46AM -0400, Stefan Hajnoczi wrote:
> >>> On Tue, Sep 08, 2026 at 10:40:50AM +0100, Richard W.M. Jones wrote:
> >>>> +Although 247 byte device ID strings are allowed, there may be
> >>>> +interoperability problems if strings longer than 128 bytes are used.
> >>>
> >>> Can you be more specific? Is the concern that the guest software stack
> >>> above of the driver may not be prepared for serial strings longer than
> >>> 128 bytes?
> >>
> >> I'll add more detail in the next version, but in brief the problems
> >> are twofold:
> >>
> >> (1) Windows supports up to 128 "characters" (they're not precise but
> >> they probably mean Unicode codepoints from the Basic Multilingual Plane):
> >>
> >> https://learn.microsoft.com/en-us/windows-hardware/drivers/ddi/storport/ns-storport-stor_serial_number
> >>
> >> (2) When udev tries to encode a very long serial into a
> >> /dev/disk/by-id path you end up uncomfortably close to NAME_MAX (255).
> >>
> >>>> +It is also advisable to use only 7 bit ASCII characters.
> >>>
> >>> Versus "The device ID string is an ASCII string which can be up to 247
> >>> bytes long" earlier in this patch. Is ASCII a "SHOULD" or a "MUST"?
> >>
> >> It's "SHOULD".  I can't see any good coming from trying to use
> >> anything except letters, numbers and dashes in a serial, but both
> >> Linux and Windows (see above) could in theory handle Unicode.
> >>
> >> Rich.
> > 
> > 
> > Linux actually has code to try and handle that. unicode
> > is actually the less problematic part - ascii is
> > full of pitfalls, eith things like
> > slashes are much weirder - e.g. udev will create
> > a subdirectory with slashes. what will windows do?
> > and what will it do with backslashes? /me shrugs
> 
> What about /../../../../../../../../..?

what do you want to know, whether it's valid?

the answer is no - systemd validates paths and will not
attempt to create paths it considers invalid, such as ones with dots.

That code is in path-util.h,

https://github.com/systemd/systemd/blob/main/src/basic/path-util.h

peruse it if you want to know more.

> Honestly, the simplest way to protect against problems is to
> just use a hex-encoded or base32-encoded cryptographic hash as
> the name.

I don't know that it's simplest, but yes, some do that.
Other subsets are safe, too.  But as I said,
unicode multibyte codepoints are not really problematic at all.


-- 
MST

