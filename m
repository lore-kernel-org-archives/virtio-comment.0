Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E5828382
	for <virtio-comment@lists.linux.dev>; Mon,  3 Jun 2024 17:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717436521; cv=none; b=RedwH0YcQu2cf6tpWeZ1usw+BxO6hWf6BdXHV6fy8j5AV4C2sgS1Q7SqR03GfOvvLmO4M30L42LbDZTJuawOuENFKsp2IqJsnf8803qdyfzNZ+ASXOzOtAv+GMMw5+Ljnl38rFXVz4UpzOwIjwz6iYhhze/Y4w+ubtJnc+9FadU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717436521; c=relaxed/simple;
	bh=2UOhv6nAy1lM7ROOJEQWadBvp5DQN3nhnm6WQwMS/vg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CRQfGNOycoLp8cSR4J872WngxjAn6sG7BLcVmaJG/jikCIN3k6Zwui5YTIfkY5Lkchff1zTRHAIrjlBLJDg5pMoYTSxttJoTohIWtU1LF6Dx019+eTeFFCl6yTO7WkkVlicptdK9zzYpnoNu4ceLIXX2qOP55c0SRbM0EnYgZp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GAiPLokz; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GAiPLokz"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-43fe3289fc5so24141cf.1
        for <virtio-comment@lists.linux.dev>; Mon, 03 Jun 2024 10:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717436518; x=1718041318; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IaIYKVBAg6XXvldf74mlAzdkTinTC2BL+2jnxb7OslI=;
        b=GAiPLokz6hDHSkkDoshATkbA0jimGPE5+fMbDvrxVl3IFvWeC1TxzHaL96CW/g0JGJ
         wFvzLGHJ1WQOwyxvnMOrp9z5oG2K4ExmwjHNg622ZMlOzDair5rSOnCnM1q+bbOPvwht
         jcmOvSO0itvijWT4gNj/Y48NYkqXJWeJChGI12Q81ATfyhbNa1Z2isSFMO7aJBWl9yIk
         OtYhMkCwSkw9AQj1cwYXDKhfzfGwSf0itfdG+Z9MUq//I5hOkBZhgL3eVbo3POmNp8Ct
         jXLYSyNUfs9RQw+CJnW6S2DJxya73Oij1SvXD1KfJloaWwFSvw+JuaPKeTv4zHOVLg8m
         YXng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717436518; x=1718041318;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IaIYKVBAg6XXvldf74mlAzdkTinTC2BL+2jnxb7OslI=;
        b=gjvO47IgfSVgl9AFuK1CPoG7pfwuzauHW2yhHpafL0PzcxMjFFImpvi1nOY6xAdoP3
         7qSyo/lrc9fsvgmcZ524JEmf8dpAOxR1EVIHowD0vB75HAHgE6jCOuA40DNu0sZrGDIL
         v0WNrN+3B/JUgTtCoDhxhk7TthFf7HqbMqo9EoGtBFk/Dc4BszGUJl7KSXn7X/NQIY7r
         /1G/CnHkUM54Cr6iOFhmN5jwSBK+vjVBQlEq8Ugl+k0KdiE9aqLY6RwY1mGY8V36FV3D
         3plqXJkawEmXvbw6NF8XciyuTcHGJYBgPONy/f8JoP13SCSSy+IocVFOQzx4SNR8o8sf
         toFQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0wQgG5LBeKlqgqcafa4TNhtMoIO+eNArdH1FYw1qo6JCZJewqe8JFZROzpcSlS0Q8LO+/ePKP0NfhluDFn6ysybNOKni0CatLIhTRnMQ=
X-Gm-Message-State: AOJu0YxsjZcu4DHzpUXIo/eaBFOoUitGHTVXnTZTtKoEIfqq/TK9f3HN
	OUY0pDuN/y9hndDo1QADalkO3a1pg8n1MgrehzkMzNoQP3V/gbX3T9Y5MGapM0jTuj+U2521MoL
	EV21+MZFu3qyIumJz0HLuaiBV2ey0IK5ceeUL
X-Google-Smtp-Source: AGHT+IFBknksb4kbxtiDyAZX0jWcQA67HQIU58Oc1kHKe1I2gj53X+gygEU+iZBOdJA/S6/v0uXZUiGlyNNVN7WFFLI=
X-Received: by 2002:a05:622a:5509:b0:43a:db0c:ed9c with SMTP id
 d75a77b69052e-43fff375484mr5404631cf.15.1717436517273; Mon, 03 Jun 2024
 10:41:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cb89d3d6b6a7e4a7f13e60dd3fded5e950727890.1716448766.git.pabeni@redhat.com>
 <ed730a7e12853339c6f5f298fa6c240a39942a74.camel@redhat.com>
 <CACGkMEtetmg=YUtPW+yL+s5MzhbKKkJyrx3EDOtf2aF=q5_b8g@mail.gmail.com>
 <CA+FuTSfCm-GpLHYztQCxti2adCcFPV7GyKBH1zTDB8tM2w1NNg@mail.gmail.com>
 <794dd45767bf54385613c5d18c32ee11d474db87.camel@redhat.com>
 <CA+FuTSeDqrQ3FVjpmmQ31UbyGQA-fUsYz3=NmizC1U7Q8w6E3Q@mail.gmail.com>
 <4745e6a149bb8424ab3931ecf04ee941e6830c47.camel@redhat.com>
 <CA+FuTSfcte_aXYoog9=bQqH1v21xLk+G2V9zNo9KOwXCt8x2Tw@mail.gmail.com> <9d617e706dd834aedf07a5a61ebf994ab11fd1da.camel@redhat.com>
In-Reply-To: <9d617e706dd834aedf07a5a61ebf994ab11fd1da.camel@redhat.com>
From: Willem de Bruijn <willemb@google.com>
Date: Mon, 3 Jun 2024 13:41:18 -0400
Message-ID: <CA+FuTSf=YwKFVan8wLNuyyJXOX6dncFW2KZZYqdFEL_nadvoxg@mail.gmail.com>
Subject: Re: [PATCH v4] virtio-net: define UDP tunnel offload feature
To: Paolo Abeni <pabeni@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>, virtio-comment@lists.linux.dev, 
	maxime.coquelin@redhat.com, Eelco Chaudron <echaudro@redhat.com>, 
	Stefano Garzarella <sgarzare@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 3, 2024 at 10:17=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wro=
te:
>
> Hi,
>
> On Fri, 2024-05-31 at 11:13 -0400, Willem de Bruijn wrote:
> > On Thu, May 30, 2024 at 1:15=E2=80=AFPM Paolo Abeni <pabeni@redhat.com>=
 wrote:
> > > On Thu, 2024-05-30 at 12:23 -0400, Willem de Bruijn wrote:
> > > > > > > > > inner transport header offset from the provided informati=
on, as it's
> > > > > > > > > currently the case for plain (not UDP tunneled) GSO packe=
ts.
> > > > > > > > >
> > > > > > > > > The outer UDP header may carry a second checksum, which c=
an be offloaded
> > > > > > > > > independently from the inner one. Since UDP tunnel checks=
um offload
> > > > > >
> > > > > > Just require local checksum offload? Computing the outer checks=
um is
> > > > > > always cheap. Optional double checksum offload might add comple=
xity
> > > > > > that is not needed, as it is so cheap.
> > > > >
> > > > > The rationale behind the making the outer csum offload manadatory=
 was
> > > > > to keep the specification change simple and prevent the exhaustio=
n of
> > > > > the virtio_net_hdr flags and gso_type exhaustion. With this chang=
e,
> > > > > 'flags' has 4 bits used out of 8 and will raise to 5. 'gso_type' =
has 3
> > > > > 5 bits used and will raise to 6 (even if only 3 of them will be
> > > > > bitfields).
> > > >
> > > > Perhaps we're talking about something different. I'm suggesting tha=
t
> > > > the outer checksum is not offloaded at all, because outer checksum
> > > > generation and validation is always cheap in software. This is the
> > > > premise of LCO.
> > >
> > > If the guess produces GSO packets with outer checksum, and the virtio
> > > driver does not support the outer csum offload, the guest will have t=
o
> > > do s/w segmentation. Even if computing the outer csum will be cheap,
> > > the segmentation will be bad enough by itself.
> > >
> > > Am I missing something?
> >
> > Do you mean virtio driver (in the guest) or device (in the host)?
> >
> > All segmentation offload packets imply checksum offload. So the
> > virtual device must support checksum offload. In this case, of both
> > checksum fields.
>
> I feel confused. I think the starting point was your request to avoid
> supporting (in the virtual device) outer checksum offload, and I read
> the above as quite the opposite?!?

Sorry for the confusion.

I agree that the outer transport offset is needed, after all.

Without segmentation offload, the outer checksum can be calculated
cheaply software.

But with segmentation offload, this either
- has to happen after segmentation, or
- the outer headers must already be setup for segments (GSO_PARTIAL)

The first approach requires the field.

The second is probably too much to ask of a virtio interface. Demanding
GSO_PARTIAL.

It would require the driver to
- split a tunnel GSO packet into a GSO and
  non-GSO pair if it payload length is not a multiple of mss.
- rewrite the outer headers to adjust the length fields
- compute the outer csum using LCO

It's not entirely crazy. The Linux kernel already can already do this for
drivers that advertise tunnel offload only as part of gso_partial_features.


> > Unless from the start we incorporate partial GSO, and expect the
> > guest to prepare the outer packet as they have to be for the individual
> > segments. Then it could also compute the outer checksum in software
> > using LCO.
> >
> > I encourage physical hardware vendors to only implement offload for
> > a single checksum, based on explicit csum_start/csum_off passed by
> > the host.
> >
> > Because multiple checksum generally are implemented using packet
> > parsing, which requires protocol knowledge and thus is fragile.
> >
> > I suppose you could define a virtio_net_hdr with an extra
> > outer_csum_start/outer_csum_off. With software segmentation, this
> > can still apply LCO cheaply.
>
> The proposed spec change adds to the virtio_net_hdr the outer transport
> offset, and enforces the outer transport being UDP, no parsing should
> be needed (nor s/w segmentation).

Good point.

> > Is there physical hardware that supports tunnel TSO with multiple
> > explicit outer_csum_start + inner_csum_start instructions?
>
> I don't have any insights there. Skimming over some major device
> drivers in the Linux kernel, I can't find any specific hint of that.
