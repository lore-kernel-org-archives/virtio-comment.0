Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DDB2158853
	for <virtio-comment@lists.linux.dev>; Tue,  2 Jul 2024 23:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719963843; cv=none; b=k2dJVGS8sPYmu0raO8hUc4uy9XwzJQbQnJnNSogZmwhxPpQ7ODX0RFXho28d0PKKhWA03OMMiM6Tl/N9DlL3RqSRkbJ1LxHNRexW+o0sro34xTGS5TzvGX8E09tEImhHk6MzEgitRgGvlRVHboWgyQQpqHL7uYKFWZQ734txSqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719963843; c=relaxed/simple;
	bh=tjgRnPyI4bbunYcx1kcRrkKylFuUnt6PAuU0MDfmifE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RpUdJBz21LPlgjtAMQD2H+kLOSmRnjPADyPm9Twgu2576SNCT9YTlJWDKSH9CnUmR1MSE0M2jjMqhRaWiPvc8Zlwbsj9fDXgrVwnGHGrrU0wi7KrTTrQ2svDHCjRuqGYhjkt67kcVZgA1fhh/GZOYIzNqsodIp9RlYjHf3Cc9rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3LnFkuk4; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3LnFkuk4"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-447bee1aef5so26671cf.1
        for <virtio-comment@lists.linux.dev>; Tue, 02 Jul 2024 16:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719963841; x=1720568641; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SudeXdTuTkeBoJsghBIjV74AqY2tXADZVntWIeS/3Sg=;
        b=3LnFkuk4HkHuopeEH02nWrWQE/Bcb8EpyHP+NExicBRomdhvuI3Gb1VVfOKVgOtFBE
         eIWqNYQ2O0kFVp9KdYAWAjXMIJLWjnh4fhVYSrAdyKVTeRWxiX6wRamsGvFbCpxTyq8j
         wE8Ws9UazzActrTQN2VPvO29DkOTL6ZGXIVnM9KNi993eeomabsYUeltaK/w3OxplVbI
         VoUmiFWb0rgrqt58gV9OjOcfklt8HGzb+P+LtWJqdppCYD8fcLwjgymVfGB31irYatHO
         jgJLM7iBmx8bPCiL3b8tjmBambZLQPGdWcOXQOnciFJqw28+MCql5zM0gVtrV5u1AI5F
         QIjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719963841; x=1720568641;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SudeXdTuTkeBoJsghBIjV74AqY2tXADZVntWIeS/3Sg=;
        b=Jg2+O0SWe9JUYHbHX/AijbLeCd0HRKNVAT3LAfYUNv+z/RfECvfGVrl3qsVALIdsqe
         /GyWSg2XUOxoSuNZm4i5IBLQ1jEFE++cru/8AfnEpU7FMaNX0WLPl9eeWWYdftTvBUEK
         ejZxW4XVzNOe9oaumA0EmF+vJ8QITOC3vXURbsKZu9giCc9YyF8X5PPX/A2+zauZ3HY/
         HolDbWg7LZS9QI6JCLwcXKYvXNG7cdA6J05gmpaGhj7r6V60Q3JmZ1wO+no4HjMIBTgr
         vO9HVweoOsEX0upyWgSMFijbnMDL5pNXHrghhFdgqe6LhDo1h6hA/qP46Y99bic0+9cJ
         e/5A==
X-Forwarded-Encrypted: i=1; AJvYcCUcEon/zAY7imvavmmOHKXx/PF29zmx6GFHY9ljP5lmLESJcPEDA9hzcnZ21H4r8pD0FJN/ghjqLcefp3KMMhAK+wcj1FBvwnPdTKzbolk=
X-Gm-Message-State: AOJu0YzbN6+Z5TMIzMgkJDO8AtH/0La92vkZI/T8PqFElOxO1qv0n7E1
	Oc2Pisl9bWspaWTCO0OAz4LI3OFN3BpbshynHi2uwodiwK4h45aoEJmmc0cvEadourS1n0x3pkW
	+Pwf/IEVJT9gFvvuCXpKzpbZ1I28zFxH8uq35
X-Google-Smtp-Source: AGHT+IHFj2so9/3KL2Mn0Rq5ySYdSwS/mHs4E7oTgmpWbBilo+aBXBR+sB+vmu2CUHgkVsvRxn/pqc1DI52fRubOLVE=
X-Received: by 2002:ac8:6c1:0:b0:441:54bb:50eb with SMTP id
 d75a77b69052e-447bc38f19fmr1156461cf.28.1719963840906; Tue, 02 Jul 2024
 16:44:00 -0700 (PDT)
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
 <4497c727ea6cc696ba7d60bcb95ba9bce33f1136.camel@redhat.com>
 <CACGkMEu_ODQV6O5-w6Hzg5gk-8x_iRsuWSk4fN2vzznPEYKphg@mail.gmail.com>
 <CA+FuTSdAB3m2gD8gA9VyRY5+C4UJqE38cTbkTbYhZbh=yNofyA@mail.gmail.com> <383c106f9f9abd34ee5fbb050c68feb9f0b6cf60.camel@redhat.com>
In-Reply-To: <383c106f9f9abd34ee5fbb050c68feb9f0b6cf60.camel@redhat.com>
From: Willem de Bruijn <willemb@google.com>
Date: Tue, 2 Jul 2024 19:43:21 -0400
Message-ID: <CA+FuTSfsAuj0PLSoezWAP=ZREhNp4KR7VcBFbc+7hL7wBeZ5Sw@mail.gmail.com>
Subject: Re: [PATCH v5] virtio-net: define UDP tunnel offload feature
To: Paolo Abeni <pabeni@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>, virtio-comment@lists.linux.dev, 
	maxime.coquelin@redhat.com, Eelco Chaudron <echaudro@redhat.com>, 
	Stefano Garzarella <sgarzare@redhat.com>, Michael Tsirkin <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 2, 2024 at 12:38=E2=80=AFPM Paolo Abeni <pabeni@redhat.com> wro=
te:
>
> On Tue, 2024-07-02 at 08:46 -0400, Willem de Bruijn wrote:
> >
> > > VIRTIO_NET_F_DATA_VALID/CHECKSUM_UNNECESSARY), so the driver needs to
> > > probe them. For example, Linux driver has this in
> > > virtio_net_hdr_to_skb():
> > >
> > >                 /* gso packets without NEEDS_CSUM do not set transpor=
t_offset.
> > >                  * probe and drop if does not match one of the above =
types.
> > >                  */
> > >                 if (gso_type && skb->network_header) {
> > >                         struct flow_keys_basic keys;
> > >                         ...
> >
> > One of my main interests here is to ensure that we avoid
> > introducing more such permissive combinations of flags
> > that no real application uses, but syzbot exploits.
>
> As mentioned in my previous email, the current proposal does not
> specify it, but UDP tunnel GSO could mandate (inner) csum offload as a
> pre-req, avoiding a few edge cases.

GSO always requires checksum offload. It would be good to state this
explicitly too.

> > > > That csum field will need different handling WRT the inner one - as=
 the
> > > > outer csum is optional.
> >
> > So that I understand, is the plan to allow only these two
> >
> > 1. a zero outer checksum + inner checksum offload
> > 2. outer checksum offload + inner checksum offload
> >
> > And skip trying to support PISO?
>
> That is my intention, yes. Additionally, I raise a doubt about PISO
> feasibility in the virtio net case.
>
> Let suppose virtio support PISO, the device transmits an UDP tunnel GSO
> packet, the driver receives it and fill the skbuff. The inner protocol
> and mac are unknown. Even skb->encapsulation is left zeroed. When/if
> such packet is later S/W segmented bad thing will happen.

I think these could be addressed with the right virtio_net_hdr fields.

But it's fine to skip too.

> > I don't think many hardware devices will support 2, but the focus here
> > appears to be VM to VM.
>
> Note that even without PISO support it should be easy to expose GSO
> PARTIAL support on top of virtio_net, even for packets requiring outer
> checksum offload.

I guess by virtue of

The packet will get SKB_GSO_UDP_TUNNEL_CSUM | SKB_GSO_TCPV4.

The physical device advertises
    features =3D NETIF_F_TSO
    gso_partial_features =3D NETIF_F_GSO_UDP_TUNNEL_CSUM

And so the virtio device will send it to software segmentation to
create the partial gso pair of packets?
