Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 893A41922EC
	for <virtio-comment@lists.linux.dev>; Wed,  5 Jun 2024 11:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717585207; cv=none; b=SMDd0FjJ2+xJfSJCMSOS5mirXTw6Nuk1QR+QOwdmTDZkojOlQMjMKCserDrTjEvZ0vn6lNqSYn7UZnSscgN/kSL3sRglUM+GIkredfwLgnl0kN01m0YMpxV1jIPf3xF1BIWS8q1LDyj4HdNLWUy/gZopuZezNbjK4k/pTYEdGTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717585207; c=relaxed/simple;
	bh=qhE6dImjEDbmPL2dH2wUCWJ08c7hXqubJjJyyYMkNzE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V3vq83rB/HVpX+HGsApieBWr5mfxumgblG2WGzJ5TJyyc1Dvw1yexMjf9SDKeyAUTNzPX8X/CcMj06tsJqb3jDeSckiP34nLVgpgC5LXSFDo4gOZp6Q5SCleYhFz8ntRQxVwcPqp7+jSXlb2jllxD1yLNXQcc31UopGw6SvFWQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dc63JADu; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dc63JADu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717585204;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=rqUm2+NE/t+/SvXMN6p1fiRV6xC/L3v8sfWFPg+TcPw=;
	b=dc63JADuXy2TSe8NQvomd3uJ1GArUDeSF9soZ3NpD/hA6jPxxdAGQOCGPkzik6GX7pPMMn
	AbcjHp8QPXdugE23nhxl+kVaolcIhQ7d/LGFxDcIQHoW8csalGuiCwzYORJqSGg3+1pmVM
	GfBGoAjm+gZlv8bbNREjFcO/oTtbi5U=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-457-bgV41b-IOIaLAsFOQTv9Cg-1; Wed, 05 Jun 2024 07:00:01 -0400
X-MC-Unique: bgV41b-IOIaLAsFOQTv9Cg-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-354e0f2b1d0so60413f8f.0
        for <virtio-comment@lists.linux.dev>; Wed, 05 Jun 2024 04:00:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717585200; x=1718190000;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rqUm2+NE/t+/SvXMN6p1fiRV6xC/L3v8sfWFPg+TcPw=;
        b=HO2f25bBfbwftnXyTx5TxKdFV+qufx9VUpRZ8R4DwMO0b5h/EsKkxrLCyiaFEAqPw/
         +YjSjdB2AQ4j6OuhWeDThjcwD1qzg/O2DlW0rIT7wgPGdpZvIZiC1/kktWpDv4oUPp0x
         6K2XVMvK6/n5cUjLDHWlT25kGO/cNqYgUf/5WdNs6AXfEDADH6nfmWb8Bag/JaLeOHG6
         Ht/XkQkn58B8ZYc7XUj7b3pJYgTScY0dUYI6QFHlCO2gxCb5UnhWh1nTmcnY6qQ1AMTC
         7efwtePVUkHSTPXMANDjSNxzLfyIVmBKJQ87Qjtq/pOq53fgq7Ekek0yD/EYxGoBFJ7j
         vb4g==
X-Gm-Message-State: AOJu0YzcFUUTdAFpEkuVy8lNpKx34a5M/buMrm+weCdPP4Z0cKxxGRMI
	cNg+HBpKb4IjVAKjLStjpt7Zedpt+gz9eo2wzQmZmV9XghhixsiofdvRrnDqCYkCHhCVbyUuB9t
	20uiBFD7/EOa0oxozixFigDSsoz8G7RkhYINO7Gxf9MMAaCzxCgyKv6TdDF4eD8yH
X-Received: by 2002:a5d:62c4:0:b0:358:a09:2677 with SMTP id ffacd0b85a97d-35e84046ff8mr1521028f8f.2.1717585200548;
        Wed, 05 Jun 2024 04:00:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGIR9g73Ral2UJgJQp740RqByZgZUmMsARiKMFADFjdNKRBdE1XTH63GaT1/k3a8Hd3duVKew==
X-Received: by 2002:a5d:62c4:0:b0:358:a09:2677 with SMTP id ffacd0b85a97d-35e84046ff8mr1521017f8f.2.1717585200120;
        Wed, 05 Jun 2024 04:00:00 -0700 (PDT)
Received: from gerbillo.redhat.com ([2a0d:3344:1b74:3a10::f71])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35eb6fd4695sm1956109f8f.117.2024.06.05.03.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 03:59:59 -0700 (PDT)
Message-ID: <65b844076079002a5dc61edcb15a1e14c73cb516.camel@redhat.com>
Subject: Re: [PATCH v4] virtio-net: define UDP tunnel offload feature
From: Paolo Abeni <pabeni@redhat.com>
To: Willem de Bruijn <willemb@google.com>, Jason Wang <jasowang@redhat.com>
Cc: virtio-comment@lists.linux.dev, maxime.coquelin@redhat.com, Eelco
 Chaudron <echaudro@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>
Date: Wed, 05 Jun 2024 12:59:58 +0200
In-Reply-To: <CA+FuTSf=YwKFVan8wLNuyyJXOX6dncFW2KZZYqdFEL_nadvoxg@mail.gmail.com>
References: <cb89d3d6b6a7e4a7f13e60dd3fded5e950727890.1716448766.git.pabeni@redhat.com>
	 <ed730a7e12853339c6f5f298fa6c240a39942a74.camel@redhat.com>
	 <CACGkMEtetmg=YUtPW+yL+s5MzhbKKkJyrx3EDOtf2aF=q5_b8g@mail.gmail.com>
	 <CA+FuTSfCm-GpLHYztQCxti2adCcFPV7GyKBH1zTDB8tM2w1NNg@mail.gmail.com>
	 <794dd45767bf54385613c5d18c32ee11d474db87.camel@redhat.com>
	 <CA+FuTSeDqrQ3FVjpmmQ31UbyGQA-fUsYz3=NmizC1U7Q8w6E3Q@mail.gmail.com>
	 <4745e6a149bb8424ab3931ecf04ee941e6830c47.camel@redhat.com>
	 <CA+FuTSfcte_aXYoog9=bQqH1v21xLk+G2V9zNo9KOwXCt8x2Tw@mail.gmail.com>
	 <9d617e706dd834aedf07a5a61ebf994ab11fd1da.camel@redhat.com>
	 <CA+FuTSf=YwKFVan8wLNuyyJXOX6dncFW2KZZYqdFEL_nadvoxg@mail.gmail.com>
Autocrypt: addr=pabeni@redhat.com; prefer-encrypt=mutual; keydata=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
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2024-06-03 at 13:41 -0400, Willem de Bruijn wrote:
> On Mon, Jun 3, 2024 at 10:17=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> w=
rote:
> > On Fri, 2024-05-31 at 11:13 -0400, Willem de Bruijn wrote:
> > > On Thu, May 30, 2024 at 1:15=E2=80=AFPM Paolo Abeni <pabeni@redhat.co=
m> wrote:
> > > > On Thu, 2024-05-30 at 12:23 -0400, Willem de Bruijn wrote:
> > > > > > > > > > inner transport header offset from the provided informa=
tion, as it's
> > > > > > > > > > currently the case for plain (not UDP tunneled) GSO pac=
kets.
> > > > > > > > > >=20
> > > > > > > > > > The outer UDP header may carry a second checksum, which=
 can be offloaded
> > > > > > > > > > independently from the inner one. Since UDP tunnel chec=
ksum offload
> > > > > > >=20
> > > > > > > Just require local checksum offload? Computing the outer chec=
ksum is
> > > > > > > always cheap. Optional double checksum offload might add comp=
lexity
> > > > > > > that is not needed, as it is so cheap.
> > > > > >=20
> > > > > > The rationale behind the making the outer csum offload manadato=
ry was
> > > > > > to keep the specification change simple and prevent the exhaust=
ion of
> > > > > > the virtio_net_hdr flags and gso_type exhaustion. With this cha=
nge,
> > > > > > 'flags' has 4 bits used out of 8 and will raise to 5. 'gso_type=
' has 3
> > > > > > 5 bits used and will raise to 6 (even if only 3 of them will be
> > > > > > bitfields).
> > > > >=20
> > > > > Perhaps we're talking about something different. I'm suggesting t=
hat
> > > > > the outer checksum is not offloaded at all, because outer checksu=
m
> > > > > generation and validation is always cheap in software. This is th=
e
> > > > > premise of LCO.
> > > >=20
> > > > If the guess produces GSO packets with outer checksum, and the virt=
io
> > > > driver does not support the outer csum offload, the guest will have=
 to
> > > > do s/w segmentation. Even if computing the outer csum will be cheap=
,
> > > > the segmentation will be bad enough by itself.
> > > >=20
> > > > Am I missing something?
> > >=20
> > > Do you mean virtio driver (in the guest) or device (in the host)?
> > >=20
> > > All segmentation offload packets imply checksum offload. So the
> > > virtual device must support checksum offload. In this case, of both
> > > checksum fields.
> >=20
> > I feel confused. I think the starting point was your request to avoid
> > supporting (in the virtual device) outer checksum offload, and I read
> > the above as quite the opposite?!?
>=20
> Sorry for the confusion.
>=20
> I agree that the outer transport offset is needed, after all.
>=20
> Without segmentation offload, the outer checksum can be calculated
> cheaply software.
>=20
> But with segmentation offload, this either
> - has to happen after segmentation, or
> - the outer headers must already be setup for segments (GSO_PARTIAL)
>=20
> The first approach requires the field.
>=20
> The second is probably too much to ask of a virtio interface. Demanding
> GSO_PARTIAL.
>=20
> It would require the driver to
> - split a tunnel GSO packet into a GSO and
>   non-GSO pair if it payload length is not a multiple of mss.
> - rewrite the outer headers to adjust the length fields
> - compute the outer csum using LCO
>=20
> It's not entirely crazy. The Linux kernel already can already do this for
> drivers that advertise tunnel offload only as part of gso_partial_feature=
s.

I'm sorry for the latency.

Wrapping-up the above, I (mis?) understand you are ok with the proposed
virtio_net_hdr layout changes.

WRT UDP tunnel outer header csum offload, I guess I could add (back,
IIRC was there in a previous revision) the feature negotiation for the
outer UDP header checksum.=C2=A0

I think such feature negotiation makes sense only in the guest ->
hypervisor direction, that is, device receive path, where we could hit
possibly H/W implementation constraints.=20

In the opposite direction it's just a matter of s/w support, it would
be strange to me introduce UDP tunnel GSO and UDP tunnel outer checksum
support separately.

WDYT, does the above makes sense to you? Or do you think we should
negotiate the csum feature in both directions, for better symmetry?

Thanks!

Paolo

