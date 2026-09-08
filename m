Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE0D5202F70
	for <virtio-comment@lists.linux.dev>; Tue,  8 Sep 2026 16:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788885799; cv=none; b=FTn97PO1xgjxi5G4wgjLg0n4J0n1AWhG+POoKzgQQgSzQiS3BaTxTgt3bzI1RW258QdUYgHna3blCS48iGEG2/E1Jq4F0Decf98jyOJTVt/zKcKcLbOMWXBvAlajCvQY3aXHHG6nV6DGFs+3ltCk6UlL2eayBROBn/ejOdS/3Co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788885799; c=relaxed/simple;
	bh=JiRFWRykqcS3CM0cEWug4ZHBfWC6KwC7RaK+KGgy/NQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=XfJ2SPOto/2uIXvU3OhF21dpQHDTIRFqjmQzlBOyMhqBjTg9KxteMveFyxXnD3xYY44jEy95AzCD6aInfjAkLlyXOv9Gm9tJx8Sba8zCqrJmRLY9uM0/B010tO9LB8FJ0PEl9RS4rE7AC2xHprEXvsTglQ5TPO3/DA45FFt9s0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KaDuB7Oc; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KaDuB7Oc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788885796;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SKYZq5J60TM/qXB0ngYxOYxel1VI7xmaq0lD8NVjY3U=;
	b=KaDuB7OcQ4UN/Pv66dwQ3feTAsBnd1I7/o1SEOY3LzBqVmXXGjTbTAXdszWA95KazHC5HJ
	ckeiOa+2J7cwMa33/zhj9xw2PQnVt71EtKlUgRn+LuZ2vrZdqH2tKVg56kLc1Jtrfxrh0p
	IW2xA1AJfDvkcSQxVZDJcWdcIZ1qhcU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-458-nUB6vLYAPAiyaesPo9DW7Q-1; Tue, 08 Sep 2026 12:43:15 -0400
X-MC-Unique: nUB6vLYAPAiyaesPo9DW7Q-1
X-Mimecast-MFC-AGG-ID: nUB6vLYAPAiyaesPo9DW7Q_1788885794
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-484337a63bbso3024855f8f.3
        for <virtio-comment@lists.linux.dev>; Tue, 08 Sep 2026 09:43:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788885794; x=1789490594;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SKYZq5J60TM/qXB0ngYxOYxel1VI7xmaq0lD8NVjY3U=;
        b=sLZCeEOhqJm9liCd8jpp2eXeBIQA38P/l2Ay/FAvm2kV1ntIAezoJfsT1m1H/tfEmG
         T5b2hOfcuERN/AX/jj97HHGr2HsXsu4IllgTC2q2+EVzxDwKpeack0PtHgC4F2EAv+dl
         haEASt8tkkNRNEhycu1icLmxF2GSWTFO6MloP53if4hRsYziVQzWcfCqYwA0f4oRYexv
         5yLKDEhB3VW81KNrwmmhncXA5+OIi6f4/HnUvh5c/37R4xrfpHpq6awBrABFTl2SRRTj
         z+T+yrQeVg0cnL29IwxQ2P4vPv3SftedWqVLBgK+9ZA2JHnCmt874oC767R4VKybirrg
         qqkg==
X-Forwarded-Encrypted: i=1; AKwUvBzoL2wmQZkkqWPhsPEShBO+VtuQsePuLt9Ev/kc1gR6fBlZ+Tv4MWU1TRjw9H6Yl7GwO8TDOC8f7OzS3Dq33Q==@lists.linux.dev
X-Gm-Message-State: AFuF++lbBBp/nMbWhv5QL7eAQ3uiuGM6N1r8seGalpxJY2RNAXKVCawk
	tFFYol8QOsYvarma+FB6ocXij5t9xBzw19QQwgunfTV50j/VIog3hXQBysfKw0Hq1Ao1n2mnFDE
	odw/UzMPtXstyQ7IV/ap5zolBi86Ya6yiGopisMRtFVbzrEBTrfHE2g261hxX9LiUjgJG
X-Gm-Gg: AYBFou3Jycbi2DuvrcF4S8jc4U1SCGejEPvu4/r4uXsFNDWSuECEljN9KRHITJI0Pmg
	xOmmDh9Mianp5TUa4Q3MVQfLJ+Vwymwaai+W4WboyMUncod9bGOWgfS80vEeq0SWLCWTjYCQsZl
	keFSXGh5RejSPFI3P3XUua7nvfdyVp8UNSvND+/1vSE88lw0Nz47296SOOrr5ab1lga5GjelTYD
	zuDxerJPV2FcLpviKu53D//80J+wBBRqEUlfPRosRhcZFAro+Z+VozZn2bzzOEglmgdB8isIXg2
	c6iS2ArM+6fb/1Np0WQYt5trxG/2bl69qmGT9Y8j+Uxnp8+NXwMibuDMBlMM1uZphK6Bl7vxSuO
	TrVPL5btVXVKHZkJs4DqK8YM=
X-Received: by 2002:a05:600c:4713:b0:49c:fa20:cc00 with SMTP id 5b1f17b1804b1-49cfa20cd4dmr286964795e9.23.1788885793820;
        Tue, 08 Sep 2026 09:43:13 -0700 (PDT)
X-Received: by 2002:a05:600c:4713:b0:49c:fa20:cc00 with SMTP id 5b1f17b1804b1-49cfa20cd4dmr286964175e9.23.1788885793288;
        Tue, 08 Sep 2026 09:43:13 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-79-236.inter.net.il. [80.230.79.236])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5d476esm536052775e9.1.2026.09.08.09.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 09:43:12 -0700 (PDT)
Date: Tue, 8 Sep 2026 12:43:09 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Richard W.M. Jones" <rjones@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, virtio-comment@lists.linux.dev
Subject: Re: [PATCH v3 1/1] device-types/blk/description.tex: Allow longer
 device IDs to be returned
Message-ID: <20260908123542-mutt-send-email-mst@kernel.org>
References: <20260908094050.915173-1-rjones@redhat.com>
 <20260908094050.915173-2-rjones@redhat.com>
 <20260908151446.GC1016680@fedora>
 <20260908154640.GW1436@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260908154640.GW1436@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: tHuD-Ceo97B3yRppXWLe2pNu0Sml8V2GIgteCOJr3dI_1788885794
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 08, 2026 at 04:46:40PM +0100, Richard W.M. Jones wrote:
> On Tue, Sep 08, 2026 at 11:14:46AM -0400, Stefan Hajnoczi wrote:
> > On Tue, Sep 08, 2026 at 10:40:50AM +0100, Richard W.M. Jones wrote:
> > > +Although 247 byte device ID strings are allowed, there may be
> > > +interoperability problems if strings longer than 128 bytes are used.
> > 
> > Can you be more specific? Is the concern that the guest software stack
> > above of the driver may not be prepared for serial strings longer than
> > 128 bytes?
> 
> I'll add more detail in the next version, but in brief the problems
> are twofold:
> 
> (1) Windows supports up to 128 "characters" (they're not precise but
> they probably mean Unicode codepoints from the Basic Multilingual Plane):
> 
> https://learn.microsoft.com/en-us/windows-hardware/drivers/ddi/storport/ns-storport-stor_serial_number
> 
> (2) When udev tries to encode a very long serial into a
> /dev/disk/by-id path you end up uncomfortably close to NAME_MAX (255).
> 
> > > +It is also advisable to use only 7 bit ASCII characters.
> > 
> > Versus "The device ID string is an ASCII string which can be up to 247
> > bytes long" earlier in this patch. Is ASCII a "SHOULD" or a "MUST"?
> 
> It's "SHOULD".  I can't see any good coming from trying to use
> anything except letters, numbers and dashes in a serial, but both
> Linux and Windows (see above) could in theory handle Unicode.
> 
> Rich.


Linux actually has code to try and handle that. unicode
is actually the less problematic part - ascii is
full of pitfalls, eith things like
slashes are much weirder - e.g. udev will create
a subdirectory with slashes. what will windows do?
and what will it do with backslashes? /me shrugs

> -- 
> Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
> Read my programming and virtualization blog: http://rwmj.wordpress.com
> Fedora Windows cross-compiler. Compile Windows programs, test, and
> build Windows installers. Over 100 libraries supported.
> http://fedoraproject.org/wiki/MinGW

