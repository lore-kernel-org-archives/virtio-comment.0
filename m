Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A052940B
	for <virtio-comment@lists.linux.dev>; Tue, 26 Nov 2024 03:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732590289; cv=none; b=L/S2YUdlNXkA91TrxWJydRGHarrqd8dQODMwprYAZ6iI2FOZ2eX3iyvGKCOZsnuOlH941SC8F5rhS4WzWR/9ZPv0slGOVeWxGmtHwRbbpPhcuoc2saZjQF5lf84+o7cGBmfi8z3n37p+W1lf8fT9hEmjrFbtHLFaJ3m+7EQlQXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732590289; c=relaxed/simple;
	bh=c+730PUM9giW/ssGgrUteKGNaQZXcuo8riYRMOximXY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CNS4I+EnU1PvkxH8s06T29oLUlY7A/H83MOvqkL8+18qSCxvjcOJVRd7frwDgtB36GlHfmz5L6m/USWKLyPjghogoO3yVhGzRNn9kvzVCOTvxuG5M22UQpg+KoNpeOXDNeM5Uaz4XZsmzae4oGXCL4eycun4ZwdGO+m3uTU6N0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DtiezPLq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DtiezPLq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732590286;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AsRhFfY2f8SiphskzdAJI+WA9Ycz2mG7D9fGHkOeThI=;
	b=DtiezPLq4uZI39JRCGfJgYF+j+wuQ2I+d1YvaaPJ9wza3iA09HL45oEuYRlQcx1ChoE0sA
	tbwThB36TT6BpObMkFUxl7b+qQoxQLt7lTYBnPDXJrXGRAeV/QHz2wMt8poJbb/nUELPmQ
	VBSr0kIuSw4Tw+avgIg/giRPR0PWHiM=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-590-OqjJDv2WPJS0zMPIBwPVBA-1; Mon, 25 Nov 2024 22:04:44 -0500
X-MC-Unique: OqjJDv2WPJS0zMPIBwPVBA-1
X-Mimecast-MFC-AGG-ID: OqjJDv2WPJS0zMPIBwPVBA
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2ea050e557dso6100460a91.1
        for <virtio-comment@lists.linux.dev>; Mon, 25 Nov 2024 19:04:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732590283; x=1733195083;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AsRhFfY2f8SiphskzdAJI+WA9Ycz2mG7D9fGHkOeThI=;
        b=adWoh20pO+NYxeAbV0Zz8sQpKekaIURg5UXXX4Dtn0aPMW3DAlkORBg6Szuq3SP13t
         Cyx+h1UPlJUtWM2QTEnHogV09jgpLIFFVrUTZO42Xv2m9Kw9T6dL79oGyMD8Brrrm1NK
         v5jA69pJiv4kKjhsQSrYRFj+aK4MgrYGHDO5RoJFIbNfwn4bhP2pF+8Y+zyWUlMIoUfU
         MYY1W00H9s9BYiAnndw6pxBjqtAnrv38KvwI0eKYwT2w6sDmJbw0gDe/ZME8rQk8roKv
         ZDjlv+kIyesIDGmx5AyYYT6J7JqNLfYxPhd4UOCG09CTbI2YDWfWfxSudlf/hgpJFDvG
         iHFg==
X-Gm-Message-State: AOJu0Yyzd9r7dYT0eEZtzVrQcgMUhbyFiJOv0j610R/+jq/ikvT49Qt4
	4BQn667+B1PNksT2HSjMKqOoGIyLn9etbe1Xp7fkO8TmpcPsJzs77end2BMFdcDEJjocvS4QS9q
	Jciydrpjuc50MAL9goK1mcmDiW3Er+5IS0cilzJElK3JEeRfFQwb3QgH+xp933SPtnJeqxfrVCM
	srpuOcsl0SaLLiF6e1Sgv1f5k+8dqKhwMe7A6T69E=
X-Gm-Gg: ASbGncuSg0VqSFmsXdqWgWwlsUZUD3p7bMGHNAK2eFLj7DG5PErMM5wq7N/VeFhRdn/
	OEoc9hALrOiAKXwqadACKVZwYv9vXGQ==
X-Received: by 2002:a17:90a:dfd0:b0:2ea:a13f:f815 with SMTP id 98e67ed59e1d1-2eb0e887e49mr17762415a91.32.1732590283355;
        Mon, 25 Nov 2024 19:04:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFUSCVIEkcG7mRZiqD316yDJX2qx29Ij9hbkNgquFN0/rzXH8uPu2IpoIdx9tFm5+TxcfKcC9fgtVorUQBtKmE=
X-Received: by 2002:a17:90a:dfd0:b0:2ea:a13f:f815 with SMTP id
 98e67ed59e1d1-2eb0e887e49mr17762397a91.32.1732590282963; Mon, 25 Nov 2024
 19:04:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1731084277.git.pabeni@redhat.com> <c35d4e23bc260494a54f79479b8b722755bad66f.1731084277.git.pabeni@redhat.com>
 <CACGkMEs17PaqS2LmJo=DeB3eDF9EzzAfshPGvveEZ4xiEe4sgQ@mail.gmail.com> <b534b09a-76f8-4bc1-9d55-d5d667813e21@redhat.com>
In-Reply-To: <b534b09a-76f8-4bc1-9d55-d5d667813e21@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 26 Nov 2024 11:04:31 +0800
Message-ID: <CACGkMEtZ195J=KC76undRVq1ANoQaxSNEeqC5bgHTooTuJbZ_w@mail.gmail.com>
Subject: Re: [PATCH v10 2/3] virtio-net: define UDP tunnel segmentation
 offload feature
To: Paolo Abeni <pabeni@redhat.com>
Cc: virtio-comment@lists.linux.dev, maxime.coquelin@redhat.com, 
	Eelco Chaudron <echaudro@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>, 
	Willem de Bruijn <willemb@google.com>, kshankar@marvell.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: PxTgGR0Dlge7qk26Ejix2_HWU5jDHp98bUJFYylMJ9g_1732590283
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 26, 2024 at 12:31=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wr=
ote:
>
> On 11/25/24 03:50, Jason Wang wrote:
> >> @@ -554,6 +583,39 @@ \subsubsection{Packet Transmission}\label{sec:Dev=
ice Types / Network Device / De
> >>  specifically in the protocol.}.
> >>     \end{itemize}
> >>
> >> +\item If the driver negotiated the VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO f=
eature and the
> >> +  \field{gso_type} has the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or
> >> +  VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit set, the GSO protocol is enc=
apsulated
> >> +  in a UDP tunnel.
> >> +  The outer UDP header must not require checksum validation, i.e. the=
 outer UDP
> >> +  checksum must be a positive zero (0x0) as defined in UDP RFC 768.
> >> +  The other tunnel-related fields indicate how to replicate the packe=
t
> >> +  headers to cut it into smaller packets:
> >> +
> >> +  \begin{itemize}
> >> +  \item \field{outer_th_offset} field indicates the outer transport h=
eader within
> >
> > Do we need to clarify if "outer" here means outmost? Or we are
> > assuming a 1 level of encapsulation here. We probably need more
> > clarification in either cases.
>
> Note that this is not the first place referring to the 'outer header'.
>
> What if I extend the paragraph introducing
> 'VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO' a few lines above with:
>
> """
>   GSO over UDP tunnels packets carry two sets of headers: the outer ones
>   and the inner ones. The outer transport protocol is UDP, the inner
>   could be either TCP or UDP. Only a single level of encapsulation
>   offload is supported.
> """
>
> The whole paragraph will read as:
>
> """
> \item If the VIRTIO_NET_F_HOST_TSO6, VIRTIO_NET_F_HOST_TSO4 and
> VIRTIO_NET_F_HOST_USO
>   segmentation features are negotiated, a driver can
>   use TCP segmentation or UDP segmentation on top of UDP encapsulation
>   offload, when the outer header does not require checksumming - e.g.
>   the outer UDP checksum is zero - by negotiating the
>   VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO feature.
>   GSO over UDP tunnels packets carry two sets of headers: the outer ones
>   and the inner ones. The outer transport protocol is UDP, the inner
>   could be either TCP or UDP. Only a single level of encapsulation
>   offload is supported.
> """
>
> WDYT?

Looks good to me.

>
> >> @@ -598,6 +660,29 @@ \subsubsection{Packet Transmission}\label{sec:Dev=
ice Types / Network Device / De
> >>  driver MUST set the VIRTIO_NET_HDR_GSO_ECN bit in
> >>  \field{gso_type}.
> >>
> >> +If VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO is negotiated, the driver MAY set
> >> +VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or the VIRTIO_NET_HDR_GSO_UDP_=
TUNNEL_IPV6 bit
> >> +in \field{gso_type} according to the inner network header protocol ty=
pe
> >> +to request TCP or UDP GSO packets over UDPv4 or UDPv6 tunnel
> >> +segmentation, otherwise the driver MUST NOT set either the
> >> +VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or the VIRTIO_NET_HDR_GSO_UDP_=
TUNNEL_IPV6 bit
> >> +in \field{gso_type}.
> >> +
> >> +When requesting TCP or UDP GSO segmentation over UDP tunnel,
> >
> > I wonder if we can just remove this as
> >
> > 1) if we want to support other type of GSO in the future, we need to
> > add those types back to here
> > 2) it only matters with the inner network protocol type
>
> It's not clear to me which part would you prefer to remove.

I meant "When requesting TCP or UDP GSO segmentation over UDP tunnel,".

> Do you mean
> to rephrase the above as something alike:
>
> """
> If VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO is negotiated, the driver MAY set
> VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or the
> VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit
> in \field{gso_type} according to the inner network header protocol type
> to request GSO packets over UDPv4 or UDPv6 tunnel
> segmentation, otherwise the driver MUST NOT set either the
> VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or the
> VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit
> in \field{gso_type}.
>
> When requesting GSO segmentation over UDP tunnel,
> """

Yes, something like this.

>
> basically I applied: "sed -e 's/TCP or UDP GSO/GSO/'"
>
> Or did you mean something different?
>
> Thanks,
>
> Paolo

Thanks

>
>
>
>

