Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41DD2F2D
	for <virtio-comment@lists.linux.dev>; Mon, 25 Nov 2024 02:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732503132; cv=none; b=LkDXC3g72kfwVSD3XgJUiA/w+MC+FAy7H6jgq9ARVAwph5fZUcC4YWvhClyIFaeJOo+X7OuBLhKJuLJsDAnoa99VFSr9pr9qwmkcxsQrKkGqBwsdTMOfWphIcQgDJVj+L6qHDBotlthGVuhhDrLtg+ajvFcsQ3BiY1LbC4WY7ME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732503132; c=relaxed/simple;
	bh=pQ0YOx8D/TMUj7IztJxei8otm2Bc/qqYaRMe09YAGAs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tj0W8jiiX4SNlLm15yA1Cz7JivrDQHVVG8U3Tahy5CIGhDtF3dduTzX/bOB/lhvYbv+Z0OIXB98O0HqLxSvizxrfntTD2/DrYWaf2YBwdxDPeSzx/sj8atZ08jwjlUr/QLijoOicNp4sFzYGvS0873OWTOE9zSaA0uUPdB/G+lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=duTyRub8; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="duTyRub8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732503129;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x/Uuzwhql8SXWN+w+F7VgrCJRFP9+ooYzRr1TX9ErpI=;
	b=duTyRub8WDj+pvWkPXXKofTNHLd4vlC60Lxp18JgJkyTjzR98CcI8DlqzabqsGyD7LUzpu
	CTdFfzy5KBxfA2fhPnEC6Q7dWU68xXKEKnjmGdGbRmkWGvi3UdDdSdYn3d7xq9Mqhf+pWY
	lbNWCoaGmbV2PhUHSmUCgmU1s4+uyeY=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-543-tNfagykvPvqdfdot5RZlnQ-1; Sun, 24 Nov 2024 21:52:08 -0500
X-MC-Unique: tNfagykvPvqdfdot5RZlnQ-1
X-Mimecast-MFC-AGG-ID: tNfagykvPvqdfdot5RZlnQ
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2ea1c9416fcso3229531a91.1
        for <virtio-comment@lists.linux.dev>; Sun, 24 Nov 2024 18:52:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732503126; x=1733107926;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x/Uuzwhql8SXWN+w+F7VgrCJRFP9+ooYzRr1TX9ErpI=;
        b=MF+8HYYdJcfyK8b70YdAezS8efQxXqxPsBLjC7w7ZcD0DEHdgT2Ilo7j7u0dugjRiC
         d94xu/oCkXCFt7/oYoBhM5HFas4Jkpb/Klh/lWSnRS/ugo6J5mGqhszUbuqDvKT9RvrC
         diGePOPU44l2Ru8HaAFuDrfg8ure1JrrBIfnBztILG2WdxXsZ6Sjyzs7oORRqDbNhoho
         thFCH+5J4AmzxQuz+gUxjjN4ZVZmW7oGcSoRA0xsjtXvQxXh9l6bS58Yzb0BXtEczbNs
         XACoQVJqalI8Ag6z7fMXBKyjGZNZcJ0wmz4aLvBffS85F0ewBasjeLlwlzx+e6LAiUO/
         6Beg==
X-Gm-Message-State: AOJu0YxRBRVtfIBl1E+vZabaBZdqrS3iqpFNl88J5afccH7hvVMIwM7B
	/i8dH2ChNPa0T+msVCnaX7m0ILtjXvO7AN7BBitD+hJcurAm7PqI85B8yALGERR6BXsuB6zZKrR
	bsZAyDVqQjrhbzBKpidy6Hhav2RlaLyPaW7ni639pPxVIuow+mKQgQED5tWSzOTLkscFAuVca+D
	rJKyqVinctNhr/rgAvsvpyqZcUQ1RpSXqTtFyXCO9OBo0VUQ8=
X-Gm-Gg: ASbGncu4bX9fKUFoLkDCg36IKUrw93pUaQkN4l8eoWGsORy25amG9P2wMQ2x8KIYL6w
	loGMnyinh0RXzTKjM2/Mcn3pS7Q5oRFDf
X-Received: by 2002:a17:90a:c906:b0:2ea:a9dc:79d5 with SMTP id 98e67ed59e1d1-2eaebf2ed95mr23250156a91.18.1732503126424;
        Sun, 24 Nov 2024 18:52:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFuUd87r3lqfKFtW7GsLhH7AkKaaE6xSJbeKKiaj67UuFlgPBzemIsIidjBAWpvrfR1L4Ynhal4r7HdpGkoDL4=
X-Received: by 2002:a17:90a:c906:b0:2ea:a9dc:79d5 with SMTP id
 98e67ed59e1d1-2eaebf2ed95mr23250133a91.18.1732503125991; Sun, 24 Nov 2024
 18:52:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1731084277.git.pabeni@redhat.com> <c03a1ec585fd7755eaeea25b690e1704ad5260db.1731084277.git.pabeni@redhat.com>
In-Reply-To: <c03a1ec585fd7755eaeea25b690e1704ad5260db.1731084277.git.pabeni@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 25 Nov 2024 10:51:54 +0800
Message-ID: <CACGkMEsxRJVS5vyhJedj2RYuWG6B7ME6JbVEo1H9sgTgJR=ubg@mail.gmail.com>
Subject: Re: [PATCH v10 1/3] virtio-net: clarify NEEDS_CSUM semantic for GSO packats.
To: Paolo Abeni <pabeni@redhat.com>
Cc: virtio-comment@lists.linux.dev, maxime.coquelin@redhat.com, 
	Eelco Chaudron <echaudro@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>, 
	Willem de Bruijn <willemb@google.com>, kshankar@marvell.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: TomvT81aEXZlCI3X8leon_ApHt3JpX8Yh0y9HfdjA7U_1732503127
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 9, 2024 at 12:53=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wro=
te:
>
> The current wording is a bit unclear hinting to possible additional
> nested headers. For GSO packets virtio net (currently) supports
> offload for the checksum of single transport header, explicitly state
> that in both the driver and device sections.
>
> Signed-off-by: Paolo Abeni <pabeni@redhat.com>
> ---
>  device-types/net/description.tex | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/device-types/net/description.tex b/device-types/net/descript=
ion.tex
> index b2a0d39..3099c6f 100644
> --- a/device-types/net/description.tex
> +++ b/device-types/net/description.tex
> @@ -605,6 +605,11 @@ \subsubsection{Packet Transmission}\label{sec:Device=
 Types / Network Device / De
>  \item the driver MUST validate the packet checksum at
>         offset \field{csum_offset} from \field{csum_start} as well as all
>         preceding offsets;
> +\begin{note}
> +If \field{gso_type} differs from VIRTIO_NET_HDR_GSO_NONE, \field{csum_of=
fset}
> +points to the only transport header present in the packet, and there are=
 no
> +additional preceding checksums validated by VIRTIO_NET_HDR_F_NEEDS_CSUM.
> +\end{note}

I wonder if this defeats the purpose of LCO where the outer checksum
could be deduced.

>  \item the driver MUST set the packet checksum stored in the
>         buffer to the TCP/UDP pseudo header;
>  \item the driver MUST set \field{csum_start} and
> @@ -805,7 +810,11 @@ \subsubsection{Processing of Incoming Packets}\label=
{sec:Device Types / Network
>    if bit VIRTIO_NET_HDR_F_RSC_INFO is not set in \field{flags},
>    then \field{csum_start} and \field{csum_offset} indicate how to calcul=
ate it
>    (see Packet Transmission point 1).
> -
> +\begin{note}
> +If \field{gso_type} differs from VIRTIO_NET_HDR_GSO_NONE, \field{csum_of=
fset}
> +points to the only transport header present in the packet, and there are=
 no
> +additional preceding checksums validated by VIRTIO_NET_HDR_F_NEEDS_CSUM.
> +\end{note}
>  \end{enumerate}

This looks fine.

Thanks

>
>  If applicable, the device calculates per-packet hash for incoming packet=
s as
> --
> 2.45.2
>

