Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8B72F85C
	for <virtio-comment@lists.linux.dev>; Tue, 26 Nov 2024 03:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732590490; cv=none; b=DQFODsP1xBf40A0YnyRXFV0r57xV6oi4gaDKoWoQW7DuwSOfISQlVsqgkd2kLLMy3Nbh4dyL8hmCTKduQonn/muK7hzbPG5pD6pT6np1ApgLV0x6+UN4t7LyyaqhStHJWjmEI8CyhRK+iH7vaPYt0QUhiHfTiBvAParirGALnLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732590490; c=relaxed/simple;
	bh=djc2LTegJIQAWUnIMtPo5aZojA3X244LIAydQB0/bN8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nchxTY+CNL0Saft9LIZjyViY82tr1V1GQV0fP69pDvzKYY17m90dPQNfgJdFz0lA93EATV+0bk0X2AYav2ZHfNG5bcO5mNT6zW7BPvtkDTpMXgCzWXNokCf80dJNWpofkAW7QBGtc7jBG14sVsn4BrwgEqlEO6oRCuvDIjnYDcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Zzs0SiaD; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Zzs0SiaD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732590487;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pkQ4vy1e59dG1XWuUMu1k6drbq/8sMH/6Q2489um78Y=;
	b=Zzs0SiaDiq5Cg+DTUlRIGxn1cZiwlZRxHikTMI2DwoNX2UaZkM7uniX7SdrwcgHtO705XY
	BMOcbhFo67CsnMze0jemgQOjYSJspSQDWPFDqjF7W69upGr5wATahNRpA2+Gyuw5lkpMUE
	QChexEQWFAkuXThi7Y+y+Q+u260Dj8M=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-608-qBw45T3cP3GtAvTzY-ve_w-1; Mon, 25 Nov 2024 22:08:05 -0500
X-MC-Unique: qBw45T3cP3GtAvTzY-ve_w-1
X-Mimecast-MFC-AGG-ID: qBw45T3cP3GtAvTzY-ve_w
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2e95713327eso4955541a91.1
        for <virtio-comment@lists.linux.dev>; Mon, 25 Nov 2024 19:08:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732590485; x=1733195285;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pkQ4vy1e59dG1XWuUMu1k6drbq/8sMH/6Q2489um78Y=;
        b=q/Ktr5eGyFaN6iQ8gtc93CguUIKmBEyGUcVlH+8E4TIZAu+pq6WZSbNO/SgJ1uDzhb
         jAQWZhGBf8FuyXjDUkEgOyMvakuxPxl9XwOvwqzmhsUV+kHgWA8memFO9oQpl/7hkdE7
         m5Y6byPE4CKi82QeisbUj3vA/Yc7LwSt3Dh2lAihv0HWtukhU3QCzirVHUaznpJn3zMB
         j2L/expeJwWwECv9C/Ug+pw5O0Qc0KNMm6QQlX/62xUpEn+SW64YknOhgsdd6+XdPR3G
         MlnBRVlbMtVAIeRrrGUpaLwkVx4QZNQAe9D0fjK6wMADAta+9gCFvCo+NwKe92SukauQ
         hMgg==
X-Gm-Message-State: AOJu0YyzGGKFdFTsR5pkVAzZdA2F/tqxF7Eg5oiLR4QsUzt+Wxa0NtO9
	5p211vYpLmxbvKpXQxzlj3D2yXiTnCkdZAuYIwtCEYJJ0Z4DA09GPPdJkszZx/i9MjCMKseXv8D
	N/tBGSSZIuAx9SYl1o9eeYFqHHj9bAe/ZWhmUVKRoLKsd6TfAs7JgPC+jkbk8mzi/7W9T5krCIL
	+MrPBxlL37YDKiRYpIUkaFr0YneoypfEsD4I1+d4c=
X-Gm-Gg: ASbGncsoqBOVy2/guQLlvA30M6VrfAKHR9QAqM36tLfDhpYD0UiSQbGQXri0djCFUNq
	QiEEl2NmY+ub/zeoWzNkfINK71GOxrA==
X-Received: by 2002:a17:90b:38ca:b0:2ea:3f34:f194 with SMTP id 98e67ed59e1d1-2eb0e233a0bmr19113510a91.10.1732590484814;
        Mon, 25 Nov 2024 19:08:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHX+zdyY7L9gzvQykdeTkT0a4q7O+m4xXZIvMApsppEibYmowTx4ITEryLb/oHXa/W8gQgDn0da1dE+2m07r+0=
X-Received: by 2002:a17:90b:38ca:b0:2ea:3f34:f194 with SMTP id
 98e67ed59e1d1-2eb0e233a0bmr19113467a91.10.1732590484388; Mon, 25 Nov 2024
 19:08:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1731084277.git.pabeni@redhat.com> <4a81d0cac760abddfdeeb71da4c42ee0ba83cc4d.1731084277.git.pabeni@redhat.com>
 <CACGkMEtR62pqGA9fi3np7fmpexq6F1MAx3XD2s0bctKKSofrug@mail.gmail.com> <88fa80f1-d82a-49c8-b933-7621d24b15df@redhat.com>
In-Reply-To: <88fa80f1-d82a-49c8-b933-7621d24b15df@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 26 Nov 2024 11:07:52 +0800
Message-ID: <CACGkMEshn+s75cRO-_AxpErMisQvewVoG7dr2cr5tCgiP5zamg@mail.gmail.com>
Subject: Re: [PATCH v10 3/3] virtio-net: define UDP tunnel checksum offload feature
To: Paolo Abeni <pabeni@redhat.com>
Cc: virtio-comment@lists.linux.dev, maxime.coquelin@redhat.com, 
	Eelco Chaudron <echaudro@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>, 
	Willem de Bruijn <willemb@google.com>, kshankar@marvell.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: d8s5Mewek69LyQPZaixb242Q4IrxYY3TyjwsUvsqvY4_1732590485
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 26, 2024 at 12:44=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wr=
ote:
>
> On 11/25/24 04:41, Jason Wang wrote:
> >> @@ -744,8 +797,23 @@ \subsubsection{Packet Transmission}\label{sec:Dev=
ice Types / Network Device / De
> >>    to the inner transport header and inner transport checksum field.
> >>  \end{itemize}
> >>
> >> +If the VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO_CSUM feature has been negotia=
ted,
> >> +and the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or
> >> +VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit in \field{gso_type} are set,
> >> +the driver MAY set the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit in
> >> +\field{flags}, if so the driver MUST set the packet outer UDP header =
checksum
> >> +to the outer UDP pseudo header.
> >
> > Is this "to the checksum of the outer UDP pseudo header."?
>
> Yes, good catch. I'll fix in the next version.
>
> >> @@ -926,8 +1003,11 @@ \subsubsection{Processing of Incoming Packets}\l=
abel{sec:Device Types / Network
> >>  \item If the VIRTIO_NET_F_GUEST_CSUM feature was negotiated, the
> >>    VIRTIO_NET_HDR_F_DATA_VALID bit in \field{flags} can be
> >>    set: if so, device has validated the packet checksum.
> >> -  In case of multiple encapsulated protocols, one level of checksums
> >> -  has been validated.
> >> +  If the VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_CSUM feature has been nego=
tiated,
> >> +  and the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit is set in \field{flags=
},
> >> +  both the outer UDP checksum and the inner transport checksum
> >> +  have been validated, otherwise only one level of checksums (the out=
er one
> >> +  in case of tunnels) has been validated.
> >
> > Not a must but I'd suggest making this an independent patch. (I meant
> > the " (the outer one in case of tunnels) has been validated." part).
> >
> > Or after some thought, maybe it's just better to leave it as is. This
> > means let the device choose which part has been validated:
> >
> > 1) more flexibility that it allows the device to choose the level it
> > can do the validation
> > 2) no need to worry about the migration compatibility
> >
> > But it would
> >
> > 1) complicate the implementation of both the device and driver
>
> Note that offloading the inner checksum only would be quite useless, as
> AFAIK no OS as support for such a thing on RX.

Yes it is, a small concern is that it might be too late to do such
clarification. Rethink this, I think it would be still better to have
a clarification like this.

>
> I think it would be simpler to move the ' (the outer one in case of
> tunnels)" in the previous patch. Why do you think it would be better to
> have this single statement on a separate patch?

Because it's an independent clarification not for GSO.

>
> >>  \end{enumerate}
> >>
> >>  Additionally, VIRTIO_NET_F_GUEST_CSUM, TSO4, TSO6, UDP, UDP_TUNNEL
> >> @@ -968,12 +1048,22 @@ \subsubsection{Processing of Incoming Packets}\=
label{sec:Device Types / Network
> >>    bit MAY be set. In such case the \field{outer_th_offset} and
> >>    \field{inner_nh_offset} fields indicate the corresponding
> >>    headers information.
> >> +\item If the VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_CSUM feature was
> >> +negotiated, and
> >> +  the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or the VIRTIO_NET_HDR_GS=
O_UDP_TUNNEL_IPV6
> >> +  are set in \field{gso_type}, the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM b=
it in the
> >> +  \field{flags} can be set: if so, the outer UDP checksum has been va=
lidated
> >> +  and the UDP header checksum at offset 6 from from \field{outer_th_o=
ffset}
> >> +  is set to the outer UDP pseudo header checksum.
> >
> > For tunnel GSO, as replied in the patch 2, I think we need to clarify
> > the behavior for multiple levels of encapsulation.
>
> Please LMK if the reply on patch 1 suffices: this infra supports offload
> for a single level of encapsulation.

Replied in another thread.

>
> Cheers,
>
> Paolo
>

Thanks

