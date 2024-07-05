Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D13C1643D
	for <virtio-comment@lists.linux.dev>; Fri,  5 Jul 2024 03:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720150106; cv=none; b=q5DCbtVhAUiZqhq1L0iLytYDqcYUmgsDKoBRxD6mW6OQjIAbBUdNohkBwe07j1BxxhiqZyB8DbvskbLwmQYQw1f+ieuQ8vh46SSFdSz0yp8aMt3rZeBwabuyyJ36VJ21Mof6QmV5WBzYldibjEaYbFHGLWit0VTSKjKo9f6CxOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720150106; c=relaxed/simple;
	bh=Yj++7A3aRjWeU03ebldIF6xKzE2MEfKTRwKN2kAw2HQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DEMq9bwCwhlV2p5JVwqevCCt6mX8vSufgd1e7PHwUdjDvi7RkeZ8hL/XSRvrGQrwVUD96YQyHmBdpTqjmOc78ZOFDS5CScOdxXUb8ubQeESGV6XyZCzWhuedM+ATlzvQCQOQT3Ow9J+VZEVsLS/xvb4TDYahCr8mkNNbFt/UV/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Q2O98y3V; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Q2O98y3V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720150103;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Yj++7A3aRjWeU03ebldIF6xKzE2MEfKTRwKN2kAw2HQ=;
	b=Q2O98y3Vr7kQBiqv72hG9IcZmVg2BBl2mk7dqDhJGN/iWpQ5UrZa8w5DNTrQ18jAeuaR60
	TBbCzHj5dHOF4q1Ctzr1pQkZROM3rKM3mirpZNHmFlSZZT8vQZB6oKulHGEYKwIxWVRccN
	zccjltIt2LNUqGcv0WqQwCyu1rcz1LY=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-151-qjxt0HtvNjyVQnoOKFLZog-1; Thu, 04 Jul 2024 23:28:21 -0400
X-MC-Unique: qjxt0HtvNjyVQnoOKFLZog-1
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2c973f95c13so1046354a91.3
        for <virtio-comment@lists.linux.dev>; Thu, 04 Jul 2024 20:28:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720150100; x=1720754900;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yj++7A3aRjWeU03ebldIF6xKzE2MEfKTRwKN2kAw2HQ=;
        b=oqHESjLf/jWKyD/bFXx/6s01u5EnnJOAIpK6EI8moJQCZ3/2/jNuOuFygsPh16Ey0C
         EvcBYmnyDaj6zL8BSRxch3esjTxITzkgoPKjoSuLhR/8a1gAVRqhXhAp7YCTvKaPrFCH
         2s4nmcXaxeQm6UpQ1rtx/C7G0Su8Hi0971Yy+4wW5aamHRnkhQDXB9b+w6bQDHCnx+UN
         +vNdaialLtnDiyweGoJANKP4CYv4egefRlBe/y5b2q0OIosCGkrlVIYmBkR6UlUuH0do
         nKu0TJ7zd1i48X7Q3mR1B4kDXXKlijKWNCafrsx9pg+ITNHwyLKT68f29kNTQ2H6yF89
         VQaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUV4KWw8WErPtpm9oB42qCz5/4oJ2TBfbfEvndMo6O5s00LHfSrjEH2Zmp1UZtJb7znTKHIqxDp1W5S8eYuewdy1biQl3xbTKeSfc/R2D4=
X-Gm-Message-State: AOJu0Yw+r8g5wELqH+R0su+YF7qaa3AgGDle09OTkjv3kiSspzvdtTG3
	6GPfBnjGDpkhg4mQ9OVe3ZCI/3BRjpppFsuwYN6EFWozEg7R5pwN3DSKb2Bpq2dwEJthfcYJj2s
	IucPyDF9t0hlu7tlhFW40e/2gauGScS1bN57Erym9iVDgKVaa+2QqzMYaWbcn/mnyiJ+7S3Y2cj
	Wur0OQmGaNH6IMRDsy56bJY7rw+kjrZ15PwBYqMoI=
X-Received: by 2002:a17:90b:1981:b0:2c9:b72:7a1f with SMTP id 98e67ed59e1d1-2c99c6bde44mr2357878a91.28.1720150100537;
        Thu, 04 Jul 2024 20:28:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHsIoCe7noHrTCI9XsYAdqYImYRgXBAUVhOLAVJRSAxDVL1kUZvxwtmmcQsfKJfE1PISoW/Zs4JtPMDMKpRrAs=
X-Received: by 2002:a17:90b:1981:b0:2c9:b72:7a1f with SMTP id
 98e67ed59e1d1-2c99c6bde44mr2357862a91.28.1720150100028; Thu, 04 Jul 2024
 20:28:20 -0700 (PDT)
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
 <CA+FuTSdAB3m2gD8gA9VyRY5+C4UJqE38cTbkTbYhZbh=yNofyA@mail.gmail.com>
 <383c106f9f9abd34ee5fbb050c68feb9f0b6cf60.camel@redhat.com>
 <CA+FuTSfsAuj0PLSoezWAP=ZREhNp4KR7VcBFbc+7hL7wBeZ5Sw@mail.gmail.com>
 <3dd4b01fbc53bcd4e42a5ac8ea6445b91cc2d50b.camel@redhat.com> <CA+FuTSejcfSkEcQHEXtarS+Ejg=qGRgE-A+dU4icR_H7aLE2nw@mail.gmail.com>
In-Reply-To: <CA+FuTSejcfSkEcQHEXtarS+Ejg=qGRgE-A+dU4icR_H7aLE2nw@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 5 Jul 2024 11:28:06 +0800
Message-ID: <CACGkMEsk59FLBZkyuHr9h_4ACu=7K21c5DC585mjKqhgALw_RA@mail.gmail.com>
Subject: Re: [PATCH v5] virtio-net: define UDP tunnel offload feature
To: Willem de Bruijn <willemb@google.com>
Cc: Paolo Abeni <pabeni@redhat.com>, virtio-comment@lists.linux.dev, 
	maxime.coquelin@redhat.com, Eelco Chaudron <echaudro@redhat.com>, 
	Stefano Garzarella <sgarzare@redhat.com>, Michael Tsirkin <mst@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 4, 2024 at 2:45=E2=80=AFAM Willem de Bruijn <willemb@google.com=
> wrote:
>
> On Wed, Jul 3, 2024 at 11:00=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> w=
rote:
> >
> > On Tue, 2024-07-02 at 19:43 -0400, Willem de Bruijn wrote:
> > > On Tue, Jul 2, 2024 at 12:38=E2=80=AFPM Paolo Abeni <pabeni@redhat.co=
m> wrote:
> > >
> > > > Additionally, I raise a doubt about PISO
> > > > feasibility in the virtio net case.
> > > >
> > > > Let suppose virtio support PISO, the device transmits an UDP tunnel=
 GSO
> > > > packet, the driver receives it and fill the skbuff. The inner proto=
col
> > > > and mac are unknown. Even skb->encapsulation is left zeroed. When/i=
f
> > > > such packet is later S/W segmented bad thing will happen.
> > >
> > > I think these could be addressed with the right virtio_net_hdr fields=
.
> >
> > (Almost philosophical question) If we add more field beyond the outer
> > header offset, is that still PISO? Or just ~ this proposal?
>
> We would only add them to make the device-side Linux implementation
> happy and be able to treat this as a tunneled packet.
>
> I suppose that philosophically speaking, PISO treats the entire packet
> as a non-tunneled packet with a very long undefined header.

That's my understanding as well. So I wonder if everything would be
simplified if we just implement PISO for virtio-net.

But looking at the doc you point to us, it looks like it just
introduces a piso_off. So I wonder if it considers the case of VM2VM
and VM2Host communication.

> Linux
> should already be able to handle that.
>
> > > But it's fine to skip too.
>

Thanks

