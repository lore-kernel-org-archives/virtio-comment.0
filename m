Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A89158DC8
	for <virtio-comment@lists.linux.dev>; Tue,  2 Jul 2024 12:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719924417; cv=none; b=S9ObLHvZ4vXgo2cNmEvCYmL8REINQloTTfvgeAYTDTGIU1BNbIUWOK1Pkf6AJWFVkTu0HUE/TYxo3Jb265Wn3DrBs0YoR/QUMvYWcK16zrEGgjP4G94LGNnb6/IQUGZgXMYYZEOdmhTAngZmAfuwCw4n8tbamcOQLxr+OxKbIII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719924417; c=relaxed/simple;
	bh=8O7JtvaaMcmojVF3n2r0AiCyUDpsXR3fic0wBrPVWCw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DnePpHuw/TyMYgeh18wA4pBwQCjUqmRdrDM7JjZDVIFxFYolan+0alDSb0ONG+x7NSlIx9Jl9nLvxmFnOB8eLkK10atQi2Ttebyrt1TGW6VkUtFEE4ISnRyHPyXAoVq66ROwJpO/UEREtCY7MdHUmmdS/YtURIS1lRFf92T/v+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Q9n0pS+b; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Q9n0pS+b"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-44664ad946eso693071cf.1
        for <virtio-comment@lists.linux.dev>; Tue, 02 Jul 2024 05:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719924415; x=1720529215; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AU8kBOq4dA2km0kzm40tPKG/wHhvFNmYzIrkGnbghdk=;
        b=Q9n0pS+bRzZuiWoZle5e84SyXpklDqtCXGgB5qNq+a6Y+YQg4UdDqbI7NbPWHdVg0Y
         KD7n9elpMTCpZD1rfzLaFbe0Iz1NHeud7ayAxhhfR/BgFkuqev9Wdk3Xws7ZPl6FJ9Fx
         6qzHckZ4dAJaGa57Kz2LAc2BoJr75gHP7vl03wXsUs5Pvwz5remUUxUXbbqWSFtuX7oA
         /2zwzo3O199T0NQPGnp/kqZ0Pp6Lwl7tkDDaUvJ9m9ki1H5wurfGMTJ4veg0BNrempip
         rDl81uSO8SoC8DNlPAIoyRwA2OVpxLD4xU68+YigyYSLvc7CG6IWrH8RZGvEXsK5Wtxg
         d1wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719924415; x=1720529215;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AU8kBOq4dA2km0kzm40tPKG/wHhvFNmYzIrkGnbghdk=;
        b=cF6PricVEzr36c/+w/VOVjZ5533HgAlW6YVS+/bTP9i1l6obfz23z5qHd5lG8hDJ4C
         DKgCnopjajmXkDF82DqBXgIUCF7doRPN8n8wyoM1JroaaYWKnLGpHXCIHmqnl9SVQ+eY
         ol+ajQcWT2+xu624K56KrTEeBF2ouFtgtip2PlNisIPBE4jzzc8ULp7gj6qoE9d7JHH8
         rofMToA1s+Qz6y4sTHLTioFCLdxPijigVVWTwvIJX5/SVyk24+6Eg9EgcMb34aGgNqVy
         B6KBJRZaxkWtv0Ej5sGApC+VkYVnURRTrpYkae+RTiT1QJZVanyoMMdyHF56JiLWgABE
         mczA==
X-Forwarded-Encrypted: i=1; AJvYcCWD0Z3WptmuiPqyrg4SvPMhaAvxeBfNyh/zwbJa5UyDC1BNS1Wr6ShbBa5rlkeqhEeZ+r3dzeU36BbXEI232xcEfo75PkcvCp4MF6qST6k=
X-Gm-Message-State: AOJu0YwyEquz/AItXWP/v6plABGBIxim9Ix3suQC5y2H2C6Pnpg4AeLx
	AN1rJfN0LkRH/TpGKyjXyjm9Ex7PKhyUat7JZDVAhSPQ/+Bgs0w/tTsSp1HGh9A057NYt3UEovo
	IjehfytSnITCawXR2WsWeh9xFpQjBCJk1BdYs
X-Google-Smtp-Source: AGHT+IFTOnn2LMrmw/KUpHsxLPIoyCimNAloTTtRjTDEakQp3ZKdZsUz6jNvTTMjdsHsTX0Dl2yiMQ1T3Jg0TPnwiYg=
X-Received: by 2002:a05:622a:15d4:b0:446:4c9b:235c with SMTP id
 d75a77b69052e-4465df52c6fmr9224491cf.11.1719924414462; Tue, 02 Jul 2024
 05:46:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <56ccba136272593d0d2af0303600c06f26bd84a1.1718621522.git.pabeni@redhat.com>
 <CACGkMEt-Ep+At_4YvkJ2t8UmQHJ0-Qm6fAPbGpkV_AfVyNq2EA@mail.gmail.com>
 <ed07e9bb9ae5bc1a171c77425cc0b96e6b87745c.camel@redhat.com>
 <CACGkMEvD_WDN5yeRKcZ2ijRF8C2_Pmr6UZWMNt+_R6S0WHY5Fg@mail.gmail.com>
 <e5d885e6331b18b3be63facfd59658b316f20de1.camel@redhat.com>
 <CACGkMEsbiN90ptOL2XHauzWS=9j5RXtnO7OD10yChPaUO3CY_A@mail.gmail.com>
 <2f1c19591ff456ada2a1ad470032d3e3fb9f88d7.camel@redhat.com>
 <CACGkMEv9gGrLO0OkHYKmjqrLw50kfm2yaifMk1wnb6noa5L99w@mail.gmail.com>
 <4497c727ea6cc696ba7d60bcb95ba9bce33f1136.camel@redhat.com> <CACGkMEu_ODQV6O5-w6Hzg5gk-8x_iRsuWSk4fN2vzznPEYKphg@mail.gmail.com>
In-Reply-To: <CACGkMEu_ODQV6O5-w6Hzg5gk-8x_iRsuWSk4fN2vzznPEYKphg@mail.gmail.com>
From: Willem de Bruijn <willemb@google.com>
Date: Tue, 2 Jul 2024 08:46:15 -0400
Message-ID: <CA+FuTSdAB3m2gD8gA9VyRY5+C4UJqE38cTbkTbYhZbh=yNofyA@mail.gmail.com>
Subject: Re: [PATCH v5] virtio-net: define UDP tunnel offload feature
To: Jason Wang <jasowang@redhat.com>
Cc: Paolo Abeni <pabeni@redhat.com>, virtio-comment@lists.linux.dev, 
	maxime.coquelin@redhat.com, Eelco Chaudron <echaudro@redhat.com>, 
	Stefano Garzarella <sgarzare@redhat.com>, Michael Tsirkin <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"

> Maybe the "parsing" is something that causes confusion. If I
> understand it correctly, you meant "driver parsing" here on the rx
> side. Unfortunately, for plain (non-tunnel) GSO, csum_start and
> csum_offset is necessarily set (e.g in the case of

is there a not missing here ..

> VIRTIO_NET_F_DATA_VALID/CHECKSUM_UNNECESSARY), so the driver needs to
> probe them. For example, Linux driver has this in
> virtio_net_hdr_to_skb():
>
>                 /* gso packets without NEEDS_CSUM do not set transport_offset.
>                  * probe and drop if does not match one of the above types.
>                  */
>                 if (gso_type && skb->network_header) {
>                         struct flow_keys_basic keys;
>                         ...

One of my main interests here is to ensure that we avoid
introducing more such permissive combinations of flags
that no real application uses, but syzbot exploits.

> > That csum field will need different handling WRT the inner one - as the
> > outer csum is optional.

So that I understand, is the plan to allow only these two

1. a zero outer checksum + inner checksum offload
2. outer checksum offload + inner checksum offload

And skip trying to support PISO?

I don't think many hardware devices will support 2, but the focus here
appears to be VM to VM.

> >
> > If we use csum_start/csum_offset for the _outer_ csum, we will need to:
> > - introduce additional inner_csum_start/inner_csum_offset to cope with
> > the inner transport header csum.
>
> Yes, this seems straightforward.

Paolo's suggestion of adding a separate outer_csum_start and keeping the
existing for the inner four tuple seems more logical to me too.
