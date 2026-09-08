Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9755D5632AF
	for <virtio-comment@lists.linux.dev>; Tue,  8 Sep 2026 15:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788882407; cv=none; b=KV3gNyxAxdoAnDOxWgAlfOeGw9TMu2NCFxeYS1bis7mXiFKcEVYS6Ru6YVHumHHHhQXssjUqmBWStt4nzmhNOxQv4JjppS2BPr2FMRX0nl5jvPmwMZNM9Oio0aGk7ZjH7ACCiKrdruCjLU9MKX9iJFTCnPJ5Wfr2W3aWToPiAA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788882407; c=relaxed/simple;
	bh=MJPfXpqXiT9OeYj0doOBY5mtXDy6s9pkqVi5CpVGgJw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=LZZ0lVtv4XXqy22XO0mMWJTQ/0tuRRazGrK9U1M5a3D7j4tvepZqQZJRoz3Ai3CYk34Tqxi22n24E6qze5zKbRRg4R46qaadi89Rso+jnFJuFO01//lut1ArcXOhCp7gxro/ee9Cv4dQLXtvxMbiIlBJjHwAxv5llUN5PM43HaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=axIV+Cff; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="axIV+Cff"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788882404;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GtEQSEqsp0OphxHgpEZn0AfJhKr7WsPxC8hEVD/COhE=;
	b=axIV+Cffi5HiegZv99HrlE+EHjEb3z7xgsrF5wc618a+0oE+JnbhULm2HLHiu38fumsAD4
	7af/ZvuDIYC0SZewNvgvBUhuUT2PkDUuheBogQskQaGjbxzFC37vNw6RP8FCVGsZjxViCd
	t/ThowEv3WR8QopblzMhIntUE7ttaS4=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-275-AGR3T1GAO8ai5CeCLQ-UMw-1; Tue,
 08 Sep 2026 11:46:43 -0400
X-MC-Unique: AGR3T1GAO8ai5CeCLQ-UMw-1
X-Mimecast-MFC-AGG-ID: AGR3T1GAO8ai5CeCLQ-UMw_1788882402
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 251881806D2E
	for <virtio-comment@lists.linux.dev>; Tue,  8 Sep 2026 15:46:42 +0000 (UTC)
Received: from localhost (unknown [10.44.32.28])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 709BA180049F;
	Tue,  8 Sep 2026 15:46:40 +0000 (UTC)
Date: Tue, 8 Sep 2026 16:46:40 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: virtio-comment@lists.linux.dev, "Michael S . Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v3 1/1] device-types/blk/description.tex: Allow longer
 device IDs to be returned
Message-ID: <20260908154640.GW1436@redhat.com>
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
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YvOWwX1eQj_KX6jTTJRFDSki7bW3HJhNYQAFh9oQ5o0_1788882402
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 08, 2026 at 11:14:46AM -0400, Stefan Hajnoczi wrote:
> On Tue, Sep 08, 2026 at 10:40:50AM +0100, Richard W.M. Jones wrote:
> > +Although 247 byte device ID strings are allowed, there may be
> > +interoperability problems if strings longer than 128 bytes are used.
> 
> Can you be more specific? Is the concern that the guest software stack
> above of the driver may not be prepared for serial strings longer than
> 128 bytes?

I'll add more detail in the next version, but in brief the problems
are twofold:

(1) Windows supports up to 128 "characters" (they're not precise but
they probably mean Unicode codepoints from the Basic Multilingual Plane):

https://learn.microsoft.com/en-us/windows-hardware/drivers/ddi/storport/ns-storport-stor_serial_number

(2) When udev tries to encode a very long serial into a
/dev/disk/by-id path you end up uncomfortably close to NAME_MAX (255).

> > +It is also advisable to use only 7 bit ASCII characters.
> 
> Versus "The device ID string is an ASCII string which can be up to 247
> bytes long" earlier in this patch. Is ASCII a "SHOULD" or a "MUST"?

It's "SHOULD".  I can't see any good coming from trying to use
anything except letters, numbers and dashes in a serial, but both
Linux and Windows (see above) could in theory handle Unicode.

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
Fedora Windows cross-compiler. Compile Windows programs, test, and
build Windows installers. Over 100 libraries supported.
http://fedoraproject.org/wiki/MinGW

