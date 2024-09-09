Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D92335A7
	for <virtio-comment@lists.linux.dev>; Mon,  9 Sep 2024 03:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725851786; cv=none; b=tjUu8u/8V1bPESwolWEdyWaZyrlWYYiKSAvtMZhs/Hr2UiNWvLu3y++iFESK73FfDGlJ/3ug27kukIVTwQwUz1iFF/rXQuX0ven9WhyMIkMaxao91mJHgCH13MN+/WgxaPdjFC4ewT8h7d+mDVE1C/9IU/fRvIrbCeytMABSM4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725851786; c=relaxed/simple;
	bh=yTZ2b8cnGq0eD4j9Fx36cZOhWVlQwUyAoS7ArX+bcAA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VF6nV12biappddj+NZI2s0WDA5ILwzeyXrDlbfn4jWTAEp3BkEsm1hS2XW1hrDAzbX2pGKJmZ43YhpFfddrcfD85C+DwfJUryoPcLhKAe51lURzJOQGm5SW6Me4NfWpYegAtD2fgKPlEVBEjdvEEVaOWAlyoCzk+jwptuqi9bzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HGfkyGa5; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HGfkyGa5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725851783;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IXTEWM2UZn2QGTG1fU5if8cfxPg9oH0zn6zsltOEotI=;
	b=HGfkyGa5A/bdOoZ1L9szJPY07H6qTRoWYzyd7DK2VMsWgkJ/qj+GZFfWsz93uWJP1npZKK
	x+kAsWEs0uwc0xUVvQtSnQ84d5IjcZXbXWvpq5F20upDtFEqBopY+2jPO6ofIwG8DGjyBO
	z6HDk58wzuLf+AoEvW+PY4L6+nGkO9Y=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-474-bLKwCgYMOSi73A91Q8YHwA-1; Sun, 08 Sep 2024 23:16:22 -0400
X-MC-Unique: bLKwCgYMOSi73A91Q8YHwA-1
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2d8b4a23230so4207919a91.0
        for <virtio-comment@lists.linux.dev>; Sun, 08 Sep 2024 20:16:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725851781; x=1726456581;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IXTEWM2UZn2QGTG1fU5if8cfxPg9oH0zn6zsltOEotI=;
        b=IagXtaqVkcIsfW5Jyp89gaG6CWwq61F07zzgRPpIPhbQlV5ihOJsSaj9nYw39KdBQg
         jHgrRRzBOdTT+fAhFo8M55bK38S0iwbZqCk0Ladyn7mnHBFNiDg0lHI7ZV3tJZ5kFuqR
         CogO0pPSAqr6wi0c19c9TTejcnxqXPTWfQevQmD9vU6LzI06dwKaISY5Uvon7Jhf1yDq
         ekv83zpjbkod8GINQqYtpXnLi3DY1cayCdLmvIh5qFKSx5sFyVjYSkWlJFEBLQFMgbyL
         5E8wbxIfzugpRHExQ4/dVEae0L2Hlj0LVAoRV9PXWnyb1rwtWWw2/usWYvzN5IQYF/fY
         h2Yw==
X-Gm-Message-State: AOJu0YwCYt3IzKY0iWU/D2YM5/sMfdOqAjwtWzLdtzfpQ8dRDzyDFnkQ
	NAJBePsZC46m8WQO4oqfievSD4faJb5cUtbgHk469vS45/Pfo8vBfeuZmgMrTv1c1MtDLGypBzu
	HiW5mA0OSjcATvvuustfDtHzWLJErOCVAaV68ul+jmWYSQzAWGTtDimbk0sO5GSlfceUyYhO4zk
	pu+Tf552TFGRyOVn2NxKxX8/qrY17wJaM2NloEsJw=
X-Received: by 2002:a17:90b:2645:b0:2da:9115:15ce with SMTP id 98e67ed59e1d1-2daffa8057amr7671326a91.15.1725851781716;
        Sun, 08 Sep 2024 20:16:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHMUT/tDJxtlXOQqOqD5V44ygiJ6iIBtCqwjIY9v9MjD8znWnN+5UNVQ0dCe+3aDMV0DuZhl052x051SYjL8Ew=
X-Received: by 2002:a17:90b:2645:b0:2da:9115:15ce with SMTP id
 98e67ed59e1d1-2daffa8057amr7671306a91.15.1725851781294; Sun, 08 Sep 2024
 20:16:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1725463935.git.pabeni@redhat.com>
In-Reply-To: <cover.1725463935.git.pabeni@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 9 Sep 2024 11:16:10 +0800
Message-ID: <CACGkMEsXhsTpZg2DP5BqUOodjR1HOTc-a-FuaCbxffZhpPj2aQ@mail.gmail.com>
Subject: Re: [PATCH v8 0/2] virtio-net: define UDP tunnel offload
To: Paolo Abeni <pabeni@redhat.com>
Cc: virtio-comment@lists.linux.dev, maxime.coquelin@redhat.com, 
	Eelco Chaudron <echaudro@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>, 
	Willem de Bruijn <willemb@google.com>, kshankar@marvell.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 4, 2024 at 11:50=E2=80=AFPM Paolo Abeni <pabeni@redhat.com> wro=
te:
>
> UDP tunnel usage is ubiquitous in container deployment, and the ability
> to offload UDP encapsulated GSO traffic impacts greatly the performances
> and the CPU utilization of such use cases.
>
> This series introduces separate features to handle both UDP tunnel
> segmentation offload (patch 1) and UDP tunnel outer checksum offload
> (patch 2).

Looks good to me.

And I wonder if there's a link to the prototype code so I can have a
double check.

Thanks

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
>
>  device-types/net/description.tex | 262 +++++++++++++++++++++++++++++--
>  1 file changed, 252 insertions(+), 10 deletions(-)
>
> --
> 2.45.2
>

