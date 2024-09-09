Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0633918EAB
	for <virtio-comment@lists.linux.dev>; Mon,  9 Sep 2024 02:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725848434; cv=none; b=jeFHIvRMdoCBlECKiGEmtCZAYUYKCOqY366GZqgpdtKAK3ZsvkpplXKWmWs0pFGwksuFuCj0p1jiv7faz+iNeWjjOtEd0GECGlaQ/+7B+o8s3zsn9HJl/FqInXTqkmmU00eBRBJc1xXpDHhSTlB40WzzUgmaXadQ5PO9y3aoh2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725848434; c=relaxed/simple;
	bh=maHabc+q3ZyjpaK7AN3Vfhg65K8U7AkS8hUhoHJgQ3I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q9/Z9eiyPcZcGxLuBNe/hQCKpOefJqodOOXd7XdP9fDe5uBZhTx6zpsuTcwNujLysvRQVj0rH9VYwbeeyXGlobQ4YcPSOYnt4XoZ6g4w16iI/hTxG7U0FWzByjd5r+BrwIxcNDjlRxC8tqEtfI7QVdGkSKYQBUfytxaXFvr1PJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=F7aehtNB; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="F7aehtNB"
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e0875f1e9edso3530023276.1
        for <virtio-comment@lists.linux.dev>; Sun, 08 Sep 2024 19:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1725848432; x=1726453232; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gQ0Uk8MtbKR82gkyN7r7Dvpy1cbQavSouUpuuzr5+/4=;
        b=F7aehtNBlM0iNNG8zOMtcAqnQGKOUef9EhkpO9t6N2kL9U+13jsH7wRwyqkSr7ZvU5
         DjcFMsfKBHrq/459iZBfj+MkdQ8sf/LHlJdh4pDk/QjyOg3mDCIgXrtwPYxN3okrxzWc
         lI2ZRfvWYUHuZMqEqxpkbRIQEuygFKT/eYIvMI0VFPdN99xiJzSNDKQ0FBEGKHeIL6No
         rrbbgr6V+JQMzBqYHcau3XmGb1X4cPAcW4e5o2B6uMzUL6ltUxOaUvSZM+FJqK1ks19/
         70EIJ3NS4lyjIxomxy96sfcDdBRAwWOaC+RMkcmQYogw1Jp23rBHMQMzcPWTMXVwTU2b
         Nyvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725848432; x=1726453232;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gQ0Uk8MtbKR82gkyN7r7Dvpy1cbQavSouUpuuzr5+/4=;
        b=MdGRoNxR7OKWezsDN0HaYW8Q7CG/97DJ1YEAlGHOoyXKLB21mSm6eHX7Tqk2rXfjek
         byUFqZkEP2p6+3jKYto2ME4fhozOToNLvTIr8zJAmZCx6Cbtbe9HklW4XXWuyWXfwMO4
         /HRnBl30sNty8zuJKKrtB1ZHkUA1L5pNlYjiXZ4uKM1jStdHNFPmBSaqlgyPfVdw0qd4
         6nDrp1AFXY9ulULaU1ZVrkoX254HAfb9gX5rFstS10pMI2IsGSf86NsGoKWLRL5u95Y2
         w6FJtfeUAyiS1hGjTkXZyapybRvQJGOnem9S+2UCREWu5TXWQaDopLkyAu8ftAAyHODc
         7HNQ==
X-Gm-Message-State: AOJu0YwZAA5sup3bxxtwv2yq8GjNwHLrS8aLu2TuYadcp1dSTrd7lNmI
	SYID/f9ehVs5+afO9CrJNIkyfyhlFy6ph5EhwUE6My2XgJ0GdD4QdEIZ6qyrpGDRxYG0euhbgqa
	wS287BhgSaXRHO9qOxINUdm/NiHaGbV6xKdx5
X-Google-Smtp-Source: AGHT+IHgqvMo4y0DHoYnQGPpJX+Wjd3sc3XXDQUBafMtlmCABnU1kpzKOcQgUS7rxSWpwYms6E9RJ+QVvh+kmth7Joo=
X-Received: by 2002:a05:6902:161c:b0:e1d:333f:4bd5 with SMTP id
 3f1490d57ef6-e1d3488652amr10124610276.14.1725848431720; Sun, 08 Sep 2024
 19:20:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1725463935.git.pabeni@redhat.com>
In-Reply-To: <cover.1725463935.git.pabeni@redhat.com>
From: Willem de Bruijn <willemb@google.com>
Date: Sun, 8 Sep 2024 22:19:53 -0400
Message-ID: <CA+FuTSe_R6EbpTFwqYtDCxc-Pwh8BDz0GbGSuq9wgingyU069Q@mail.gmail.com>
Subject: Re: [PATCH v8 0/2] virtio-net: define UDP tunnel offload
To: Paolo Abeni <pabeni@redhat.com>
Cc: virtio-comment@lists.linux.dev, maxime.coquelin@redhat.com, 
	Eelco Chaudron <echaudro@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Stefano Garzarella <sgarzare@redhat.com>, kshankar@marvell.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 4, 2024 at 11:50=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wro=
te:
>
> UDP tunnel usage is ubiquitous in container deployment, and the ability
> to offload UDP encapsulated GSO traffic impacts greatly the performances
> and the CPU utilization of such use cases.
>
> This series introduces separate features to handle both UDP tunnel
> segmentation offload (patch 1) and UDP tunnel outer checksum offload
> (patch 2).
>
> Changes from v7:
> - minor cleanup in patch 1/2
> - dropped confusing wording about csum validation in patch 2/2
>
> Changes from v6:
> - replaced inner_protocol_type with
>   VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV{4,6}
> - many clarifications and cleanup, see the individual patches changelog
>   for the details
>
> Changes from v5:
> - split in 2 patches
> - dropped outer_mh_offset field
> - many csum related clarification
>
> Paolo Abeni (2):
>   virtio-net: define UDP tunnel segmentation offload feature
>   virtio-net: define UDP tunnel checksum offload feature

Series looks great to me. No further comments from me. Thanks Paolo.
