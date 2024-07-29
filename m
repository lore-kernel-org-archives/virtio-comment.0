Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D09E188CDA
	for <virtio-comment@lists.linux.dev>; Mon, 29 Jul 2024 21:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722289040; cv=none; b=PYZAzpiIitdsUMnePc7kS/KOnW6x+lj7R+2EupbUxWRoih8F2+Te+x//HmxhapzrjvQaxtjhNIKgPgt6THiXDf+ul9CyPSWGAbOuHySs9e/SsGdWxSObHpGMuJyqifXFGeYDmApMqwr2x6/En5ENcAA+WUC87osGMl21/ydUMV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722289040; c=relaxed/simple;
	bh=zdTHpyI7M9/J+A+OWBTgt0E8pKuDwVZUthUD6+iYOn4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uXKxCb11oCkGM9NpjzOZcfPxQNqJcpxqvxMGtsVxwvw6KhFidpRLH8hQdt9VEtHjFR55vzuaJaxP/+q9fSU6gvGq4d0zUlCNpZeMFPL4kJCPcjeTy4u7XL4ZHr0SBh9wX9kPQqlaq2QQgJzITkdLOS07Z810Uz8xGqKo/TFsvWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ARpaOeOM; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ARpaOeOM"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-44fdc70e695so125621cf.0
        for <virtio-comment@lists.linux.dev>; Mon, 29 Jul 2024 14:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722289038; x=1722893838; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zdTHpyI7M9/J+A+OWBTgt0E8pKuDwVZUthUD6+iYOn4=;
        b=ARpaOeOMIqDKjf/Uyi080x6N/5F0E7s85IyeMqKXpIiGIVIZlNZ66Iy9QSX7C/zDjH
         1hzFs7H/duu+mWEObGh6mjG3VMbMAoFmfQmaR4Le9g6JJ9Q0pV2TJnU/JUv6pjMjPoMl
         oyaEMHTepgVk5x5YXB8trtTtz9rlUJl/Sp6C7Ft9syrZhzLqmIdl3KWMsaps4ruahXec
         XP3nA9vyI2wNPpCjHfY3+kFg5ox5/mi7xGE9A/yQvJ71wlInzimtWwPCwGilF81XpcCI
         T1EAQS30tX4TZ296ojNXHuIBg+Li6HSBN82fVTbC9ALk8slCCWcdTToht7R+b4ngpRGh
         zLIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722289038; x=1722893838;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zdTHpyI7M9/J+A+OWBTgt0E8pKuDwVZUthUD6+iYOn4=;
        b=FCD2I5cg/geaB6pfL9R84e88kmD3RtlOA6e2xxY/lfRMYykJZHhYKeRph+xR5oYUfy
         lM1Q0Hd3Tp5v1Gmohsa6PLyPQ2ptdOSVKtoX3WhhfjMh9/3MqmXj0MIfZf52BnO3REcJ
         oT9NmvEwf03L16O9HGhmH2b0eXiejIE3cZA+1eOgQBpL+N50ObglzBbyAhr9kW4HRITy
         57/nUeZO3i/fU8/MLAvvBEuHVwCjBTiePq+5yHP8IFYfzkHWBDSLFwueiS9MlNRUHiQs
         Sx3ksF3QvAntfXlrCLRniE329DSZxhqTNOTZg3DiMMCA7G3ZDMuHMSKOkfofSp6/m3Ll
         tamQ==
X-Gm-Message-State: AOJu0YznCTuWUCS/RN4ULv6R573QYqn9PBlHuhDV9ZaMTIn1I6ohe0pC
	LnqFqKPxiCayea25ACiMkbE7QmvRa6/bth2xw9tBeRXg3oSg7XB+XdCOttTHvgZucuo6m3efC4y
	S5mCSuByEfVSIEd+tnHtxeUuEaFSsjXAy+9KV
X-Google-Smtp-Source: AGHT+IF4Ppl97y6YzUFReAKm5ZHzdZ7IhBjr7hmP8jqx7aPmv3gjL+68J7zbf3UEcPK4LJfNIsWK9aEoaXkHlNtgOaM=
X-Received: by 2002:a05:622a:1191:b0:447:e59b:54eb with SMTP id
 d75a77b69052e-4503640c4b0mr246821cf.26.1722289037904; Mon, 29 Jul 2024
 14:37:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1722252302.git.pabeni@redhat.com> <2977107dcc842c0665227f7c3696157ecd15a1b2.1722252302.git.pabeni@redhat.com>
 <CA+FuTSfu8Sys_s+3jpXoS0GbZC4stOVgBrEYOtA9YoTCEJkJAA@mail.gmail.com>
In-Reply-To: <CA+FuTSfu8Sys_s+3jpXoS0GbZC4stOVgBrEYOtA9YoTCEJkJAA@mail.gmail.com>
From: Willem de Bruijn <willemb@google.com>
Date: Mon, 29 Jul 2024 17:36:39 -0400
Message-ID: <CA+FuTSc7hoJPuWSWwZCogzyUHcnD_2d5+ihFZZaKFAn7R==2UQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] virtio-net: define UDP tunnel segmentation offload feature
To: Paolo Abeni <pabeni@redhat.com>
Cc: virtio-comment@lists.linux.dev, maxime.coquelin@redhat.com, 
	Eelco Chaudron <echaudro@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Stefano Garzarella <sgarzare@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 29, 2024 at 5:04=E2=80=AFPM Willem de Bruijn <willemb@google.co=
m> wrote:
>
> On Mon, Jul 29, 2024 at 7:30=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> w=
rote:
> >
> > The VIRTIO_NET_HDR_GSO_UDP_TUNNEL is a gso_type flag allowing GSO over
> > UDP tunnel. It can be negotiated on both the host and guest sides.
> >
> > One constraint addressed here is that the virtio side (either device or
> > driver) receiving a UDP tunneled GSO packet must be able to reconstruct
> > completely the inner and outer headers offset - to allow for later GSO.
> >
> > To accommodate such need, new fields are introduced in the virtio_net
> > header: outer_th_offset, inner_protocol_type and inner_nh_offset.
> > They map directly to the corresponding header information. The inner
> > transport header is implied by the (inner) checksum offload.
> >
> > Those fields are required because a virtio device H/W implementation
> > performing segmentation for UDP tunneled packet will need to touch
> > the outer transport protocol (for the UDP length filed), the
> > inner network protocol (for the total length field, in the IPv4
> > case).
> >
> > Note that segmentation will additionally need to touch
> > the outer network protocol and the inner transport protocol. The first
> > is implied/easily found with trivial parsing, the latter is identified
> > by the existing csum_start field.
> >
> > Note that there is no concept of UDP tunnel type negotiation (e.g.
> > vxlan, geneve, vxlan-gpe, etc.), as a virtio device H/W implementation
> > can perform segmentation for every possible UDP-tunnel given the
> > specified new fields.
> > In the reverse direction, if a virtio device H/W implementation receive=
s
> > some traffic for an unknown or unsupported UDP tunnel, it will simply
> > not aggregate the wire packet in GSO one.
> >
> > Signed-off-by: Paolo Abeni <pabeni@redhat.com>

> > +
> > +\begin{note}
> > +The valid complete checksum of the outer UDP header of individual segm=
ents
> > +can be computed by the driver prior to segmentation only if the GSO pa=
cket
> > +size is a multiple of \field{gso_size}.
> > +\end{note}
>
> Might be helpful to explain why. E.g., ", because then all segments
> have the same size and thus all data included in the outer UDP
> checksum is the same for every segment. These pre-computed segment
> length and checksum fields are different from those of the GSO
> packet."

Does this part belong in patch 2/2?
