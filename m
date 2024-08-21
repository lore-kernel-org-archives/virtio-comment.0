Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02CE4137745
	for <virtio-comment@lists.linux.dev>; Wed, 21 Aug 2024 19:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724269725; cv=none; b=Emkqu2g9qMFK0jI2YzY1nYG1sL8PVsyCMblX2Rq4GimuM+l/4TKC6qxZjARYtSDnDGAFDzv+4dazbmDD4fVNUFJehfyIvgUuHIRpIaMmSl3In6MrnQHr1oAkoq8W3jlSKxgmGsA7w71HOtdMdqyLBJi5oST+TPv9AwxoqO8wpNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724269725; c=relaxed/simple;
	bh=Iu2JMj2tU6G74liG8hgFbw0EuUJx7w81sFvu2xHkDIg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=shB8kjWmCOrFQLGLYUmDlTDMwXeuJT/EBNqEcUoSQydC/J3TdnxIkjiMtCPBuxFpHNw8ON8itT5nlSgOJ77OVnR8m/hXutHS76PNg7ze6sQjFmCNjAYtkuyqqo3kaeVZaGklBEAD5TRQkCPb+qBJF+0/iE+oljVye4jX022sS9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4YZtsKMp; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4YZtsKMp"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6b747f2e2b7so928227b3.3
        for <virtio-comment@lists.linux.dev>; Wed, 21 Aug 2024 12:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724269723; x=1724874523; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QmX0D8khKYanrs45HWITYimq0WGCxETMKcDv044czg8=;
        b=4YZtsKMpgtSacJsC7ht11EaNGinCmeJN+cqjIQfz1RbBNdm2BGEe8ioZw6ykhnvuW/
         ZrvOxL+T6oLVsqFYsAe4bEQE7hH4f7FdWgTL7Naj8GjjAIDAg53FRmsZEJrPO6aBBkBR
         n0vGVnnyqQ+LKXqf74eddPKWmv+NbB4CSEC31FJtqVvhiqD1KzKh7vhIcSkVCYSQOeUR
         qJ2N3avkSBplFirdUPuVO1iFOBv0Nn05Cd7vjWhaHTTsVSx5PhlXh86b4c6TcVaFoF7d
         Qqn0mQhBMFkXJhWSZ3q81LYpENhj3BCBAHmJXz/s51jTn97UWjF8YWScoR3dw1yeMZpA
         3FyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724269723; x=1724874523;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QmX0D8khKYanrs45HWITYimq0WGCxETMKcDv044czg8=;
        b=Y+fodlLyb8cWKVl8s66KqIG63VxuEAAHJ45fr3phGv9jSdZT9UTHlDONScagszcYf0
         Vz3VnW5m+GR4WrBlV8JqN5P/VRKY2MTz9E57yUvxLGWHcq0REKFe8OlKgYlEnOszbH9q
         IeoX07QXbR4fjqQpiDGWMVgU/pzLgC5YT1FbthNdKwjkWHPecr7qDNB3ntzowo2CpxMh
         dwhLnYFFK3CXuivSyt1FSwxNFANF67LX3bOo30/6j3Os9AQ/hCPuJxDKvs0BDRiQtxiI
         3S4Q//14GR74BUrioxf06xmQ3ra8lAwTC+Ub68oeoWsz64zL1dM5iHxZ4HAVGVzthLUX
         AMIw==
X-Gm-Message-State: AOJu0Yy7VjLrIUIuProrO40x4E4LEXgkgTMfNZF1kNCw7FOiimfi62pC
	WgQccGhL/6+zBunHfUvIb9vxhKOgfyixpaPa8dEWiWxrCGC2nXmhPT46iQ418s/qeODkFCzD1vI
	gidy5TPKDW8bZNuT05z4aL73Ti2dbQMshobfp/Jm6cNh4CqEIXIcl
X-Google-Smtp-Source: AGHT+IHvkjok5496ocESC++gyMdvCWjM0xORRyoIenV8hA7Vwdn4l3m1xnBBT1ma6m1nelYIuYyETuQ2BoMW++bnb4A=
X-Received: by 2002:a05:690c:668f:b0:644:2639:8645 with SMTP id
 00721157ae682-6c0fc8aa300mr45174177b3.26.1724269722752; Wed, 21 Aug 2024
 12:48:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1724234131.git.pabeni@redhat.com> <04089a87ff34aa518345ba5b50aecf737fb03f40.1724234131.git.pabeni@redhat.com>
 <CA+FuTScjheR1htWujZ5=adBRB3+_z5KrCyHKoRGVapGq-MGtJQ@mail.gmail.com>
In-Reply-To: <CA+FuTScjheR1htWujZ5=adBRB3+_z5KrCyHKoRGVapGq-MGtJQ@mail.gmail.com>
From: Willem de Bruijn <willemb@google.com>
Date: Wed, 21 Aug 2024 15:48:05 -0400
Message-ID: <CA+FuTSd5PW6D0iSDSYjh3S6OpGCL1Lf95q_=eOfi=APXoBZyOg@mail.gmail.com>
Subject: Re: [PATCH v7 1/2] virtio-net: define UDP tunnel segmentation offload feature
To: Paolo Abeni <pabeni@redhat.com>
Cc: virtio-comment@lists.linux.dev, maxime.coquelin@redhat.com, 
	Eelco Chaudron <echaudro@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Stefano Garzarella <sgarzare@redhat.com>
Content-Type: text/plain; charset="UTF-8"

> > +Geneve UDP tunnel (again IPv4) with no tunnel options. Note that the
> > +only relevant variable related to the tunnel type is the tunnel header length.
> > +The packet will have a 14 byte outer ethernet header, 20 byte outer IP header
> > +followed by the 8 byte UDP header (with a 0 checksum value), 8 byte Geneve header,
> > +14 byte inner ethernet header, 20 byte inner IP header
> > +and the TCP header (with the TCP checksum field 16 bytes
> > +into that header). \field{csum_start} will be 14+20+8+8+14+20 = 84 (the TCP
> > +checksum includes the header), \field{csum_offset} will be 16.
>
> The csum_offset field is not even needed in virtio_net_hdr if gso is
> enabled, as then the gso type already defines the protocol.

We recently started testing this invariant in the Linux code. We have
learned the hard way to not trust userspace processes to set up any
fields correctly.

For the new fields, we should from the start think of such invariants
that can detect bad input. For instance,

    outer_th_offset < inner_nh_offset
    inner_nh_offset < csum_start
    csum_start < pkt_len

Maybe even more stringent invariant checks are possible. The only
ones that truly matter are the ones that can affect device side
correctness (such as host kernel crashes).

Not sure that we have to call them out in the spec, but perhaps
helpful too. Either way, good to think about possible attacks on
the new interface even before coding, before the spec is complete.
