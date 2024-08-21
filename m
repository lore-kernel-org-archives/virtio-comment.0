Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE74A31
	for <virtio-comment@lists.linux.dev>; Wed, 21 Aug 2024 19:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724269396; cv=none; b=eDJQ0fX8VEscC47dzM+p5ajyXCeuwONMDEVBjkR1XS+g9FxsrSjqKWYt9VS0GrWLB+TPdXerQn2yAeXdkUty5lgoM9C6TLU0HSwKNxeP0aJG1gtv2TCkAj5M4h4TV5iEg5i0mBTzTgBmi9PO2CxBht7UWMEqKTIq5d+h3VhweX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724269396; c=relaxed/simple;
	bh=qowCXZlKrYfYsCDKNj3Nyi9+kKflofxzUO7XNAeR2es=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cl7wTfmSZU3wMt4O4Eb73zaRfWctlE77iBj9tiOOY6pfZVrCV/RbCAsXAuJhfiF3v9YOaFZyE66MnN1TVQDhE6gXfL0Mj4hVy4OsONmfhBJuZhL/tREKgrQpxKDOvI8i1Bvfz1cAK2ZJ1VYsKLonA536rKPodIwCwgrPvza7oXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sQj1BDji; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sQj1BDji"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-690af536546so817317b3.3
        for <virtio-comment@lists.linux.dev>; Wed, 21 Aug 2024 12:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724269393; x=1724874193; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3k7zlLuDIX8QrZM1pTu9RNhYzP9YIxKBTi+4qx9olg4=;
        b=sQj1BDjiO8SxYgwrVJUD4H/2G2WfSQPtu+4yxgVfDoc+2wDmqI6JTJ5fwc4957WFCy
         A0e5FWW1GY4PpONs9MNFv+qJel/SG+DI2qwJOtSSlh6RQoxjulhaWEHtB0HyGh2wFXjK
         SGtPgXpixY9ieaLYUuHLohTL/2Jga/1YAodH91jXS7kua9gruhsTjzgQxcIV/AoMtFgP
         Wx/6MmOMedlmPOaG7oVgL9hcRkE387K8QCcBkGm6VXfGcVtMbIMkSsqK+3HEYSZQrZ8b
         QQpmpURdJK3EYAXIwcALhXAoQCDmZpHt9FfTKTr7L8kiiuO03ldYDsmhm71pPPjbePBl
         /I/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724269393; x=1724874193;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3k7zlLuDIX8QrZM1pTu9RNhYzP9YIxKBTi+4qx9olg4=;
        b=CB5C2EFYTRCMDHxk+F9bHs7MO1Vjw1ATtugtQ2gySH5ipY6FiA4FVmfnEtovjwh8iH
         OTcTrAOgk99/7Ch49JBMjkoC4j4Ri0lHVIF5x3Cd/7wxDXNaGrB6Zkf3AtjTMmk1OLKs
         T9g+Gh7nNYQ+4DEWPyejKc8R1etMLhdLBXxuz9VyXaZoy2zqsEjfViMaylLrWZjkDY42
         LYu2Sr3Fc28RqNSkjeeQSWythWvvF7F82g/YO7xaFeltKYQbzNy9Zagog8VwdA2zrAl7
         sBjL0sIUGoDcSjeiTXNjUuBkh38K8tsj5hl+OWzm3vXRrTS++fSeF8WhcBCwGAyoEu2p
         d+/A==
X-Gm-Message-State: AOJu0YwKotI/uRplisbKvoVnt2pV/J0iIi5BSkbex/ZAR8ohuupKoUr1
	BF00kcNxTV5i7eSyEAhKZxbVdBUseQgvqbRBzFVhybQpj6S8yG3m3Tg1ZYlod9gsx4QCRkvI95t
	xYBpVKLTww7nrwdISrzBH3FzwuWk4OsmwlwZb
X-Google-Smtp-Source: AGHT+IFL2PA2bAsMN/ZqjK8z40FLxp4LZuN9nH4HeMB81UnxtrSDg2WuIihD6W8gRKDtdqmsbbeFvAkImgWjl+vtb98=
X-Received: by 2002:a05:690c:2b0d:b0:65f:80bb:e6b2 with SMTP id
 00721157ae682-6c09c59a49bmr37983087b3.14.1724269393103; Wed, 21 Aug 2024
 12:43:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1724234131.git.pabeni@redhat.com> <b3a93378fbe02aefe4450f97e21138a757c41036.1724234131.git.pabeni@redhat.com>
In-Reply-To: <b3a93378fbe02aefe4450f97e21138a757c41036.1724234131.git.pabeni@redhat.com>
From: Willem de Bruijn <willemb@google.com>
Date: Wed, 21 Aug 2024 15:42:33 -0400
Message-ID: <CA+FuTSe1Wz8T5NDUA-h1izZ1mhz3z0jsK8XH6tgtREz00B9nhw@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] virtio-net: define UDP tunnel checksum offload feature
To: Paolo Abeni <pabeni@redhat.com>
Cc: virtio-comment@lists.linux.dev, maxime.coquelin@redhat.com, 
	Eelco Chaudron <echaudro@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Stefano Garzarella <sgarzare@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 21, 2024 at 6:03=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wro=
te:
>
> This complements the previous change, additionally
> introducing the UDP tunnel checksum offload feature.
>
> Differently from the plain checksum offload feature, this
> depends on UDP tunnel segmentation being available, as outer checksum
> computation for non GSO packets is cheap and H/W implementation of
> such a feature is complex.
>
> UDP tunnel checksum offload does not introduce additional fields,
> instead it leverages the outer transport offset introduced by the
> UDP tunnel segmentation feature to locate the outer checksum
> inside the packet.
>
> When  UDP tunnel checksum offload is enabled, the VIRTIO_NET_HDR_F_DATA_V=
ALID
> bit semantic is extended, in the device -> driver direction, to
> cover both the inner and the outer checksum validation.
>
> Signed-off-by: Paolo Abeni <pabeni@redhat.com>

> +\begin{note}
> +The dependency between UDP_TUNNEL_GSO_CSUM and UDP_TUNNEL_GSO is intenti=
onally
> +in the opposite direction with respect to the plain GSO features and the=
 plain
> +checksum offload because UDP tunnel checksum offload gives very little g=
ain
> +for non GSO packets is quite complex to implement in H/W.

packets [and] is quite

>    See \ref{sec:Device Types / Network Device / Device Operation /
>  Setting Up Receive Buffers}~\nameref{sec:Device Types / Network
>  Device / Device Operation / Setting Up Receive Buffers} and
> @@ -425,6 +446,7 @@ \subsection{Device Operation}\label{sec:Device Types =
/ Network Device / Device O
>  #define VIRTIO_NET_HDR_F_NEEDS_CSUM    1
>  #define VIRTIO_NET_HDR_F_DATA_VALID    2
>  #define VIRTIO_NET_HDR_F_RSC_INFO      4
> +#define VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM 8

Only now notice: since this is only valid with GSO, should this be a
gso_type bit, like VIRTIO_NET_HDR_GSO_ECN?

> +If the VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO_CSUM feature has been negotiated=
,
> +and the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or
> +VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit in \field{gso_type} are set,
> +the driver MAY set the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit in
> +\field{flags}, if so:
> +\begin{enumerate}
> +\item the driver MUST validate the packet checksum at
> +       offset 6 from \field{outer_th_offset} as well as all
> +       preceding offsets;

I don't follow this comment: when programming checksum offload, why
does the driver have to validate any checksums?

Same in two other locations.
