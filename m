Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B1C9417BD9
	for <virtio-comment@lists.linux.dev>; Mon,  7 Sep 2026 07:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788766417; cv=none; b=M77IOMcNGKKU3vfqTJCadOtBp/7LDGCjNMwv7QuhtNVjKqKZxIXMVo+5Tjv+IUinSP88QSsr9OLz8ykdIv0kdLwp5+bk098CabWYjmJLZA5AcHEyYS6FBznTOxijzO/rwfVBZ63fQMZIfXW9XCndG8/FKQ4FlyuKnGs5xqOdr/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788766417; c=relaxed/simple;
	bh=LlmdZzW163OazU49ITLQ++1bXE055ZOUjLcSZQKvTsM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=XUxYjl7RwMtfpkRBsrNDmEoYWYxxf1lqwU5wuJ0uxw1ueVIpKPuk9YTIJ2Rl2NFi0m0maJwj8ody3FbNdh8atS2BaVURY7j9gbHLYKPvZ1uJ+14zGpc6CUExHOKDkbO4a65hI1Ov+gYaz3l9MkWXKgGKZLOiRZ2Mxud/QmtYl9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cEBS7ACp; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cEBS7ACp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788766414;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7dnuMl52ksOTFRQH5zIfeKB3JB1KpJVo1xqPQU+GdfM=;
	b=cEBS7ACpJSkrIp1US2dQ8kymQCV9Tp5DAVOpD27cZUDv/GmVx/HEkPcEoTLUh8MEQsknZo
	WwuxzjKXaUKiE4Z9seOT3OtReTBGMk968Nq2hJPdXk99FFdUGLNXEOFOQWUJfBlxv5HCqO
	OmGXe5bgLAb3jUG1ryFPBvzLSBxiPBE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-370-5VExdRbNNF6e0pom-Y2jhQ-1; Mon, 07 Sep 2026 03:33:33 -0400
X-MC-Unique: 5VExdRbNNF6e0pom-Y2jhQ-1
X-Mimecast-MFC-AGG-ID: 5VExdRbNNF6e0pom-Y2jhQ_1788766412
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-49cf4cc2125so14659245e9.2
        for <virtio-comment@lists.linux.dev>; Mon, 07 Sep 2026 00:33:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788766412; x=1789371212;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7dnuMl52ksOTFRQH5zIfeKB3JB1KpJVo1xqPQU+GdfM=;
        b=hfrW4ljrxJUlqVaYRkbLkGoKBUhQWkVtRJioKO9BBGeE0ExBOjmpQX7keWk6/ELOtC
         DnHb1eEmtoktP/8YYuuVFCfE9g+BzP+6B+NNveR7lRlvsabxGGCPdkkibYE9tpWm8cu0
         1wTg7WB9u1Lfy7QsyoESVCtFDRkXH1VF693pwXLWJJMkFdsPcOERqYYNB5PAN/8W3Eb4
         zt87Blei0W7pr3AG9NtjaO7cVD65lmmUcuhqWsBCte4gb0rVICzY6k8htE873pFHPkmc
         gG3Cw4iVCcdyG76lz1d+HnBIilelg29eAwX/wAqd9myxNV6nUql21Wo92XdsKIZrlMYA
         2Q1g==
X-Gm-Message-State: AFuF++kcwRIb6xQvIE3kwpjP6BNRbx6VqLSzvCgKOO5o8+HPjmExneuR
	9AqbIrRDnr0MQljVTFwm3g+QVd70mR53dp3ZRPPflrK6PBj8hKyrV9Pl9XgCWTsIm+zWwynODb7
	yZnv0JJKWW/lJmPyrhGBSKamIWPq2gaoIY9Ggd9c5lsbxH+3q3fKxCRb8UCJDuhDAsqi8sF+o93
	XH
X-Gm-Gg: AYBFou1BjmuJjlVMbwg0hngXX1UbmXliKNqEHSnq7EyV8Ee9qTw+yXtx4/Zw4QWg5GJ
	Utt7Zw6lVuUY50gCFY+b8g3cmBpEboLaNwgkBAt7vGWRz9mhB9llgI+wawB0X5AJiJTU73ohJ+S
	MwG1LRmHPK1pvgx4DBvMqTJ1l6JhdtAh5gfgw5eHU3QRurbCdZXBBKUdQC/ZuE+rPFzCQNrLB3t
	UJv+LPao67EWJnVIZrGQ9DZ5A4NQ6eI8uI2Gw0cqOPEOYSU8P7HmUPOqT1jDzTITB2mKOqgr7CU
	q1UvGs6CwzN/UWsV0E++qpxCQIxuH8Oy3S7Pdn7TEu9cVJ4NN/M71GATGnRl+FcMN+reh+F9i5X
	DJWpICw4cRGJOyrYYsxDluBE=
X-Received: by 2002:a05:600c:1990:b0:49d:1012:893a with SMTP id 5b1f17b1804b1-49d101289e2mr70357865e9.7.1788766411838;
        Mon, 07 Sep 2026 00:33:31 -0700 (PDT)
X-Received: by 2002:a05:600c:1990:b0:49d:1012:893a with SMTP id 5b1f17b1804b1-49d101289e2mr70357255e9.7.1788766411345;
        Mon, 07 Sep 2026 00:33:31 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-79-236.inter.net.il. [80.230.79.236])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf772692dsm346579315e9.10.2026.09.07.00.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 00:33:30 -0700 (PDT)
Date: Mon, 7 Sep 2026 03:33:28 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Richard W.M. Jones" <rjones@redhat.com>
Cc: virtio-comment@lists.linux.dev
Subject: Re: [PATCH 1/1] device-types/blk/description.tex: Allow longer
 device IDs to be returned
Message-ID: <20260907032412-mutt-send-email-mst@kernel.org>
References: <20260906145444.127570-1-rjones@redhat.com>
 <20260906145444.127570-2-rjones@redhat.com>
 <20260906110725-mutt-send-email-mst@kernel.org>
 <20260906160625.GJ1436@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260906160625.GJ1436@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dhVbs1DGLr6aBfAFSthoLhlu5NpaNfVHr6FZLO6D7SI_1788766412
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Sep 06, 2026 at 05:06:25PM +0100, Richard W.M. Jones wrote:
> On Sun, Sep 06, 2026 at 11:13:39AM -0400, Michael S. Tsirkin wrote:
> > On Sun, Sep 06, 2026 at 03:54:44PM +0100, Richard W.M. Jones wrote:
> [...]
> > U also want a feature bit otherwise driver does not know if it's safe to
> > send VIRTIO_BLK_T_GET_LONG_ID.
> 
> Interestingly (at least for Linux) sending VIRTIO_BLK_T_GET_LONG_ID
> when the hypervisor doesn't support it returns -EOPNOTSUPP, but I can
> add a feature bit as well.
> 
> > >  \end{lstlisting}
> > >  
> > >  The \field{flags} bitfield is ignored by the device unless
> > > @@ -515,9 +516,26 @@ \subsection{Device Operation}\label{sec:Device Types / Block Device / Device Ope
> > >  the device to discard the specified range, provided that following reads return
> > >  zeroes.
> > >  
> > > -VIRTIO_BLK_T_GET_ID requests fetch the device ID string from the device into
> > > -\field{data}.  The device ID string is a NUL-padded ASCII string up to 20 bytes
> > > -long.  If the string is 20 bytes long then there is no NUL terminator.
> > > +VIRTIO_BLK_T_GET_ID or VIRTIO_BLK_T_GET_LONG_ID requests fetch the
> > > +device ID string from the device into \field{data}.  The device ID
> > > +string is an ASCII string which can be up to 247 bytes long.
> > > +
> > > +VIRTIO_BLK_T_GET_ID fetches the first 20 bytes of the device ID
> > > +string.  If the ID is shorter than 20 bytes, then the response is
> > > +padded with NUL bytes so its length is 20 bytes.  (Note that if the ID
> > > +is 20 bytes or longer, this means the response will not be NUL
> > > +terminated.)
> > > +
> > > +VIRTIO_BLK_T_GET_LONG_ID fetches the complete device ID string.  The
> > > +response is always 248 bytes long, padded to this length with NUL
> > > +bytes.  Since the longest permitted device ID string is 247 bytes, the
> > > +response MUST be NUL terminated.
> > 
> > That's a lot of padding) Sure u do not want to use the actual length?
> 
> I'm not too clear on this (and the spec is also unclear), but it seems
> the buffer is allocated in the guest RAM?



Yes. But the driver specifies the length to the device.
So do we need a new type of request? We could just
change the length depending on a feature bit.


>  In that case since it
> doesn't know the length in advance it must allocate a fixed size buffer.
> 
> [...]

That's certainly the simplest way to do it, so that's what the spec
does:

The length of \field{data} MUST be 20 bytes for VIRTIO_BLK_T_GET_ID requests.




> > > +(non-truncated) device ID.  In this case a guest which has not opted
> > 
> > avoid "guest"
> 
> Is "driver" preferred?


yes

> I'll send a follow up addressing your other points, but probably not today.
> 
> Rich.

I have some more comments from reading more about it.

> -- 
> Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
> Read my programming and virtualization blog: http://rwmj.wordpress.com
> nbdkit - Flexible, fast NBD server with plugins
> https://gitlab.com/nbdkit/nbdkit

