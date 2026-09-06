Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 358B93A901C
	for <virtio-comment@lists.linux.dev>; Sun,  6 Sep 2026 16:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788710793; cv=none; b=hQiAVchoTQAB9upGkkThl42fqBqBx8z/20r+Prlm9gNDja6IyR/fXJ3NlJsY9oqXu1jPJAKSfB9AqVosT2iJDycde9jlObukDfyzeSxm4/xrYKElB4FzbgJhb+neZvzebm8A38LrePIl5v6LQik0olv85WMSD9fPhuzu+DVdNkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788710793; c=relaxed/simple;
	bh=s1f6acpwdquNLpts8yOGWTCCujNrKhiT4ZMyJxxJ8p0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=KK22KOQhBNnT/B9t5saYLidg1p6kbmw37c2PoxZeVflbxZZvGMfi5jXRhPlDN94ejxGO64Ac/hIEpT8XymJcMuT66XxYZjGeLVSYyOmSLbo6mRgFzkSQwGc//LwbocRAldbDp0kOadWWCPIwaqwx/Mb6yRS80UiV6d7LCKeESJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GMgzJm8B; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GMgzJm8B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788710789;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=i5JcruhYhl1HXtR8BViIkR/2S5RPwaDEEEHr32ArwWs=;
	b=GMgzJm8BXbKzNoBzfGY6XVOLDDyz6MemhKXZxmGACRnSl7gTyrYUtcZrjhqxxsynNlJiV5
	X+tgSP41WSxYGZ0XTmkao8MEGmFkdiM9FQIskH6uLRQBEypbTwbas/nVAaBQsjERjd04R5
	gB5t/d30z8gnU8m4xuJGPCIOqKcPT+M=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-195-aZmZnRcZNZ-_PUjehHjGMg-1; Sun,
 06 Sep 2026 12:06:28 -0400
X-MC-Unique: aZmZnRcZNZ-_PUjehHjGMg-1
X-Mimecast-MFC-AGG-ID: aZmZnRcZNZ-_PUjehHjGMg_1788710787
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AD58D1954190
	for <virtio-comment@lists.linux.dev>; Sun,  6 Sep 2026 16:06:27 +0000 (UTC)
Received: from localhost (unknown [10.44.32.28])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id DDC2230002ED;
	Sun,  6 Sep 2026 16:06:26 +0000 (UTC)
Date: Sun, 6 Sep 2026 17:06:25 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtio-comment@lists.linux.dev
Subject: Re: [PATCH 1/1] device-types/blk/description.tex: Allow longer
 device IDs to be returned
Message-ID: <20260906160625.GJ1436@redhat.com>
References: <20260906145444.127570-1-rjones@redhat.com>
 <20260906145444.127570-2-rjones@redhat.com>
 <20260906110725-mutt-send-email-mst@kernel.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260906110725-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cF2ByPOs3TYHwtYgzbcmLGPg9yH5swbjQPWC-4vPBi0_1788710787
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Sep 06, 2026 at 11:13:39AM -0400, Michael S. Tsirkin wrote:
> On Sun, Sep 06, 2026 at 03:54:44PM +0100, Richard W.M. Jones wrote:
[...]
> U also want a feature bit otherwise driver does not know if it's safe to
> send VIRTIO_BLK_T_GET_LONG_ID.

Interestingly (at least for Linux) sending VIRTIO_BLK_T_GET_LONG_ID
when the hypervisor doesn't support it returns -EOPNOTSUPP, but I can
add a feature bit as well.

> >  \end{lstlisting}
> >  
> >  The \field{flags} bitfield is ignored by the device unless
> > @@ -515,9 +516,26 @@ \subsection{Device Operation}\label{sec:Device Types / Block Device / Device Ope
> >  the device to discard the specified range, provided that following reads return
> >  zeroes.
> >  
> > -VIRTIO_BLK_T_GET_ID requests fetch the device ID string from the device into
> > -\field{data}.  The device ID string is a NUL-padded ASCII string up to 20 bytes
> > -long.  If the string is 20 bytes long then there is no NUL terminator.
> > +VIRTIO_BLK_T_GET_ID or VIRTIO_BLK_T_GET_LONG_ID requests fetch the
> > +device ID string from the device into \field{data}.  The device ID
> > +string is an ASCII string which can be up to 247 bytes long.
> > +
> > +VIRTIO_BLK_T_GET_ID fetches the first 20 bytes of the device ID
> > +string.  If the ID is shorter than 20 bytes, then the response is
> > +padded with NUL bytes so its length is 20 bytes.  (Note that if the ID
> > +is 20 bytes or longer, this means the response will not be NUL
> > +terminated.)
> > +
> > +VIRTIO_BLK_T_GET_LONG_ID fetches the complete device ID string.  The
> > +response is always 248 bytes long, padded to this length with NUL
> > +bytes.  Since the longest permitted device ID string is 247 bytes, the
> > +response MUST be NUL terminated.
> 
> That's a lot of padding) Sure u do not want to use the actual length?

I'm not too clear on this (and the spec is also unclear), but it seems
the buffer is allocated in the guest RAM?  In that case since it
doesn't know the length in advance it must allocate a fixed size buffer.

[...]
> > +(non-truncated) device ID.  In this case a guest which has not opted
> 
> avoid "guest"

Is "driver" preferred?

I'll send a follow up addressing your other points, but probably not today.

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
nbdkit - Flexible, fast NBD server with plugins
https://gitlab.com/nbdkit/nbdkit

