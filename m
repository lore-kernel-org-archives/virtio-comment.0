Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8985817D8AB
	for <virtio-comment@lists.linux.dev>; Thu, 30 May 2024 15:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717081768; cv=none; b=usoPZadhgvjtD5L2mI3mpOcox0DjrdENzNIy5yBoGX0/NXOudSzwlhvV7lbXqQLSzVFxy6KKrb+DV9IZTkkIU1aQ3j+U8i6lJ74w3pOAvJwUlNC8fLKkruCvzH1X99FbqGR4TkNLtMNP7ms324qhPIU1vT6BIyCG17snkRHf0I8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717081768; c=relaxed/simple;
	bh=mf4LH38d0qbQL7wShjnz/sZU77IB7nD8ex3vDXpiJTk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jx8Q+Bfy/FwdQXGg6B9ZfOuEI1LI0+IcFctQDi/pFVvVqV4Vfbrj/Cg9rw0r/EJELKDuUUGXqqnvn3WlzJ73SUPjuaSO/OombaIBeGr5ZaRMGvfD7fJcoH2hdEPeiylljXXsQ9sl5gKEI7k9lQri5VNZAw5uLPqPRmwQLNgDRug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=s0sbRpxD; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="s0sbRpxD"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-43e14f0bd75so293961cf.1
        for <virtio-comment@lists.linux.dev>; Thu, 30 May 2024 08:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717081765; x=1717686565; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oiekJBqqMHzy/MDvkxpuLBdrvSwCb8fs19+P81KACr4=;
        b=s0sbRpxDC0xO1cdhFY1GJlI2ICd/qkGqUe0aTjsZP7BQs9FmklZgNilf6oKqDnSFwG
         MqGOrrOJLgLzxPTG2IUxs6+RjAFJa5U1yJVPntKL/224WzJqEG9pvH2CfBOoMRGZGZ4N
         1eMEaxVxNr4aGX5dEXJR4qz5Dl253t9D+EZkMNNk7evjgDBK5yhN8bk1vi5WAkdpq6wE
         al+K0FB4T4xcoB3syjzU8cyU9z24P05n+H5A3vYFey5/AAMJ8FKxJTVpC8q9LLkpUSqk
         Lgiu0Pxixhldf9LSxhV3nK5UgQFWuuhOSqdhsvwJu1V1gS3fGm2wXPfICynQVSAgG8Uz
         xrSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717081765; x=1717686565;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oiekJBqqMHzy/MDvkxpuLBdrvSwCb8fs19+P81KACr4=;
        b=OLalPIVpw/iI8mVxjjZZ9ij6BbjW06up+/ff/IJm7VInuUj/4LuQwkXpYXOnaIwuvF
         J0Ug5/LwuveFwm6LDuF+6JOIgw7IOkP92PoeHhxAo4Yrp69fD7En5MNE73t4S9ddZ3X1
         Z07b2JuYbELM6v3hmZ/wnGMuIEqVGjNm1AswEVIoGAWE3XD3C3bG6GIhK+xo1JKEIQmn
         V8ZKJQznqv2A2W4gE2pJwx8C6Ve2YFnRkhUQCAW80N9GhwWee7X58dR7v8jL0qjCa0xW
         3baSZjS2Mx8i5F0Am5Yp6qil1yQDC0vJ6ukxFhXQr0D1BsV2ph3b6LAWtbkHpyAe/qZe
         APQA==
X-Forwarded-Encrypted: i=1; AJvYcCXYwsFUStRiQ7F1c9rEKvHvswnCLNWL33pa5SDmc6mzMhyM4gNSXDICACJLeiVK3siV03JaNPhxIBJzAKITMdUWXPGdC/hOgF589srfN7c=
X-Gm-Message-State: AOJu0Yw3KvPj/eTjXp0gX57xPhkh/QQBCb5xld7O1QZaGgdoMeO/fVda
	5PsmatIbYw9RHZaXdpRFLt4C5FVRxCbMf4dxtlvBdIa2fFrxPHVduTFy4LUvGrwNcEz+AyHuJip
	3mpbdD/xmbtnO6+el1QM+AiSZBrmyCBHW6Vix
X-Google-Smtp-Source: AGHT+IHiFde7IoW3Sd8uyie0A60iSEE0v6jgK35BDvrHP+Gx1lBJAosUloEYJZbmx1AS5a7pqEuKyejEyBzgA8ExeAM=
X-Received: by 2002:a05:622a:6083:b0:43d:85ae:bee with SMTP id
 d75a77b69052e-43feb3a298dmr2056411cf.7.1717081765127; Thu, 30 May 2024
 08:09:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cb89d3d6b6a7e4a7f13e60dd3fded5e950727890.1716448766.git.pabeni@redhat.com>
 <ed730a7e12853339c6f5f298fa6c240a39942a74.camel@redhat.com> <CACGkMEtetmg=YUtPW+yL+s5MzhbKKkJyrx3EDOtf2aF=q5_b8g@mail.gmail.com>
In-Reply-To: <CACGkMEtetmg=YUtPW+yL+s5MzhbKKkJyrx3EDOtf2aF=q5_b8g@mail.gmail.com>
From: Willem de Bruijn <willemb@google.com>
Date: Thu, 30 May 2024 11:08:46 -0400
Message-ID: <CA+FuTSfCm-GpLHYztQCxti2adCcFPV7GyKBH1zTDB8tM2w1NNg@mail.gmail.com>
Subject: Re: [PATCH v4] virtio-net: define UDP tunnel offload feature
To: Jason Wang <jasowang@redhat.com>
Cc: Paolo Abeni <pabeni@redhat.com>, virtio-comment@lists.linux.dev, 
	maxime.coquelin@redhat.com, Eelco Chaudron <echaudro@redhat.com>, 
	Stefano Garzarella <sgarzare@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 26, 2024 at 11:26=E2=80=AFPM Jason Wang <jasowang@redhat.com> w=
rote:
>
> On Thu, May 23, 2024 at 4:47=E2=80=AFPM Paolo Abeni <pabeni@redhat.com> w=
rote:

Sorry, late to this proposal. Originally introduced in 2022?

> >
> > On Thu, 2024-05-23 at 09:20 +0200, Paolo Abeni wrote:
> > > The VIRTIO_NET_HDR_GSO_UDP_TUNNEL is a gso_type flag allowing GSO ove=
r
> > > UDP tunnel. It can be negotiated on both the host and guest sides.
> > >
> > > UDP tunnel usage is ubiquitous in container deployment, and the abili=
ty
> > > to offload UDP encapsulated GSO traffic impacts greatly the performan=
ces
> > > and the CPU utilization of such use cases.
> > >
> > > One constraint addressed here is that the virtio side (either device =
or
> > > driver) receiving a UDP tunneled GSO packet must be able to reconstru=
ct
> > > completely the inner and outer headers offset - to allow for later GS=
O.
> > >
> > > To accommodate such need, new optional fields are introduced in the
> > > virtio_net header: outer_th_offset, inner_protocol, inner_mac_offset,
> > > inner_nh_offset. They map directly to the corresponding header
> > > information.
> > >
> > > Note that the inner transport header is implied by the (inner) checks=
um
> > > offload, if present. Otherwise, it's up to the receiver to detect the

Can we just require filling checksum start and checksum off for tunnel
types. Even if the checksum offload flag is not set.

> > > inner transport header offset from the provided information, as it's
> > > currently the case for plain (not UDP tunneled) GSO packets.
> > >
> > > The outer UDP header may carry a second checksum, which can be offloa=
ded
> > > independently from the inner one. Since UDP tunnel checksum offload

Just require local checksum offload? Computing the outer checksum is
always cheap. Optional double checksum offload might add complexity
that is not needed, as it is so cheap.

> > > support makes little sense without UDP tunnel GSO support, to avoid
> > > unnecessary complex feature negotiation, the
> > > VIRTIO_NET_HDR_GSO_UDP_TUNNEL feature implies the support for the out=
er
> > > header checksum offload and the checksum itself is handled similarly =
to
> > > the inner header one.
> > >
> > > Migration for GSO_UDP_TUNNEL enabled VMs should be managed alike othe=
r
> > > types of GSO offload: VMs that has negotiated such features could be
> > > migrated only on hosts supporting such features.
> > >
> > > Note that there is no concept of UDP tunnel type negotiation (e.g.
> > > vxlan, geneve, vxlan-gpe, etc.). That is intentional because:
> > > - given the information carried by the guest or host kernel, it's
> > >   impossible to probe reliably the UDP tunnel type. Specifically, the
> > >   outer UDP port numbers give a hint, but peers could use nonstandard
> > >   ones.
> > > - all the existing UDP tunnel protocols behave the same way WRT GSO
> > >   offload, carrying an immutable header on top of the outer transport
> > >   one.
> > > - if a new UDP tunnel protocol, carring packet dependant information
> > >   alike the inner packet length or csum should surface in the future,
> > >   the host and guest kernels will need explicit support for it,
> > >   including new, different GSO features. Additional virtio support
> > >   should be designed separately.
> > >
> > > Signed-off-by: Paolo Abeni <pabeni@redhat.com>

Can you reconsider the choice to only allow UDP encap that includes an
inner MAC header?

There are useful UDP based tunnels that skip that, such as GUE. Virtio
revisions are a long process. If we can accommodate those in the
design from the start, that saves us much work later. Or, at minimum
make sure that the proposed design can easily be extended to such
protocols.

> I meant, virtio is not necessarily for a software implementation.
> Various hardware vendors started to implement it as well.
>
> I wonder if hardware is as flexible as Linux to support general UDP
> tunnel offload.

Do you mean TSO with tunnels? Using software parser mode, devices can
support that. See also protocol independent segmentation offload
(PISO, https://www.opencompute.org/w/index.php?title=3DCore_Offloads#Protoc=
ol_Independent_Segmentation_Offload)
