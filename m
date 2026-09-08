Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81CD84BCAA9
	for <virtio-comment@lists.linux.dev>; Tue,  8 Sep 2026 11:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788868284; cv=none; b=krnzsKh9rHT5dn0IiKy2hrnMl4GY3nYbrFAOp0v3xDpkB5zj1tUorlkQGkjA/Ojc6ng+4j8AmB2QGRxpsHZ9pdhn0UtpH/cfQaNwNqPAM7k4IuaDfyf+a3hfG+9Kn3VLgSt8CYFaFxniImAfXn2+e079yvhUCOyTD5eEobH+b7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788868284; c=relaxed/simple;
	bh=V8d0FZsga+dKmuWUrJi/iLoCzAD0fLzWRQ9rcakJSn8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=Zvoo3ivjuCuM7BAbChHUX1LCp/8yNbFlG4yoIjHoTkK3vsh2iP2nmzNyVFcExb0Go4b6i7E09Xi7AAxk+kNO/GcxeqOy7Hh242KZfb8FMNWRnHknE35fSAOoogYlljy3gWXp/MwWdU7lz6cQCum06V2hly8zjYrZT5wO6ai3Vuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=V6wsp4xu; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="V6wsp4xu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788868272;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FY8hHo1rRUn1jx6PqRn9koPsOrUw7GcmrjubEn6T51U=;
	b=V6wsp4xuFpoIcaOziTJiefkUNcUXkqtKui5eRomNSbJCZ7Z0WJjp9BCGe6lgQrQbpd2Mxq
	FnlFtdteEHSAwDZs3WNsJiJFmxKjbfNdNhT2H6wnC8NkRAghtTIbDRH0vgfFOGVCxpJBnP
	TVc63WrVTrsws2by0rcPrAFTo0w/SKg=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-361-hXeAUoxXNsW-si2NRmx-Og-1; Tue,
 08 Sep 2026 07:51:11 -0400
X-MC-Unique: hXeAUoxXNsW-si2NRmx-Og-1
X-Mimecast-MFC-AGG-ID: hXeAUoxXNsW-si2NRmx-Og_1788868270
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9EC831933FBC
	for <virtio-comment@lists.linux.dev>; Tue,  8 Sep 2026 11:51:10 +0000 (UTC)
Received: from localhost (unknown [10.44.32.28])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0E66A1955F0C;
	Tue,  8 Sep 2026 11:51:09 +0000 (UTC)
Date: Tue, 8 Sep 2026 12:51:08 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtio-comment@lists.linux.dev
Subject: Re: [PATCH v3 1/1] device-types/blk/description.tex: Allow longer
 device IDs to be returned
Message-ID: <20260908115108.GV1436@redhat.com>
References: <20260908094050.915173-1-rjones@redhat.com>
 <20260908094050.915173-2-rjones@redhat.com>
 <20260908060804-mutt-send-email-mst@kernel.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260908060804-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GlJWbGnwPaI4UVo4hJRqc5dKMP7YNJR0kMBzWCdqU8M_1788868270
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 08, 2026 at 06:57:08AM -0400, Michael S. Tsirkin wrote:
> Thanks for the patch! Yes something to improve:
> 
> On Tue, Sep 08, 2026 at 10:40:50AM +0100, Richard W.M. Jones wrote:
> >  VIRTIO_BLK_T_GET_ID requests fetch the device ID string from the device into
> > -\field{data}.  The device ID string is a NUL-padded ASCII string up to 20 bytes
> > -long.  If the string is 20 bytes long then there is no NUL terminator.
> > +\field{data}.  The device ID string is an ASCII string which can be
> > +up to 247 bytes long.
> 
> Judging by the below, it does not have to be ASCII? just a nul
> terminated string?
> 
> 
> 247 is just a very weird limit.
> So we get another
> arbitrary number drivers need to worry about. Ugh.
> I just don't get all the references
> to scsi vpd or whatever. It's your motivation I get that
> but we should not set policy.
> 
> Let's just simply limit the string to  255 bytes and
> make data 255 bytes too?

I wonder actually if 128 is better.  It fits within the Windows limit
and it doesn't hurt for Linux either because of NAME_MAX limitations
that you would encounter with udev.

> Then with the status byte the write buffer fits in a 256 pcie packet.
> 
> Maybe others feel differently.
> 
> > +
> > +If VIRTIO_BLK_F_LONG_ID was not negotiated, VIRTIO_BLK_T_GET_ID
> > +fetches the first 20 bytes of the device ID string.  If the ID is
> > +shorter than 20 bytes, then the response is padded with NUL bytes so
> > +its length is 20 bytes.  (Note that if the ID is 20 bytes or longer,
> > +this means the response will not be NUL terminated.)
> 
> But the driver can not both negotiate and not negotiate
> VIRTIO_BLK_F_LONG_ID.

Interesting .. so I think I misunderstood how feature negotiation
works.  I _thought_ that the driver sends back features it
understands, via the features array:

https://github.com/torvalds/linux/blob/28924df2a08f440c73991b83028032c901de2ae4/drivers/block/virtio_blk.c#L1669

and therefore the host side can see if the driver supports
VIRTIO_BLK_F_LONG_ID.  Is that not how it works?

> So what does this requirement that the two configs share
> a prefix buy us, practically?
> 
> Why don't we just say that the ID is up to either 20 bytes or
> 255 bytes depending on the feature negotiation?

We can just drop the "first" language.

> > +
> > +If VIRTIO_BLK_F_LONG_ID was negotiated, VIRTIO_BLK_T_GET_ID fetches
> > +the complete device ID string.  The response is always 248 bytes long,
> > +padded to this length with NUL bytes.  Since the longest permitted
> > +device ID string is 247 bytes, the response is NUL terminated.
> 
> Let's just handle short and long forms consistently please.
> If the string fills all of data then it is not terminated. end of story.
> 
> All the subtle differences are just a source for confusion.  Can we not
> define something like "maximum ID length" and then use it everywhere,
> instead of all the duplication?

Sure.

> > +
> > +Although 247 byte device ID strings are allowed, there may be
> > +interoperability problems if strings longer than 128 bytes are used.
> 
> I think you mean 127? so it's 128 with the NUL.
> 
> > +It is also advisable to use only 7 bit ASCII characters.
> 
> ASCII == 7 bit. Maybe you mean printable characters?
> 
> 
> Pls add both these recommendations in the conformance section.

OK.

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
nbdkit - Flexible, fast NBD server with plugins
https://gitlab.com/nbdkit/nbdkit

