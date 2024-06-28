Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 537442139A8
	for <virtio-comment@lists.linux.dev>; Fri, 28 Jun 2024 09:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719568310; cv=none; b=D4yqJstbVuwTfn/1zJlYgqxe3hp8Ydqn9hjy9sT51xpgWVyilWwCxN7esQvOsOIsxLNW+S7o9BcCaHFEaZqf6EOmqYMhQ4idSQLFl5oyeiepHKc2hBn5iVJ9/PjHS3YkQzrb6zpwrZG2RoPxUeadvkkV00Gh6yNy5JKo7ZSMXOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719568310; c=relaxed/simple;
	bh=k+3PEPqm6VBgZM91fCVKDPCtu2mteTIDMd38xQE7f3c=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sduEmzhoNwSq0xXZC1lzC4/lk09pLscvAEgnNphFaOnvAtXITvvKmCctHrZ2DUJR39cskTe3HJ80rGDzHF1KvrPd13K0v/lFpZGJJMz0fhSYifYMiInIY/FC3MzPZhKrxu618ty/UwI5n5nAYCRFmuafF8qwJFnfhmUvc5LoiWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VkOim2JW; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VkOim2JW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719568306;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=k+3PEPqm6VBgZM91fCVKDPCtu2mteTIDMd38xQE7f3c=;
	b=VkOim2JWB1Gc2qrQKA8ab406/GIjpcqgclaNSRs48+Qm4WTGYSuV3NcrTooj1qNsBlnSWR
	UcGTyy6LbdkBlGYa8TQhIBJpAJ+RxFYza6IiRK0oUj9qr9qZr5jiGlAObYQ9UAQmJH7kqX
	APri4409TAbyghw93g3/bq40mqyjPCw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-64-Bx4qyYq_MR6KcZrMDG9A2Q-1; Fri, 28 Jun 2024 05:51:44 -0400
X-MC-Unique: Bx4qyYq_MR6KcZrMDG9A2Q-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-362a1e80424so70217f8f.2
        for <virtio-comment@lists.linux.dev>; Fri, 28 Jun 2024 02:51:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719568303; x=1720173103;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k+3PEPqm6VBgZM91fCVKDPCtu2mteTIDMd38xQE7f3c=;
        b=ZI5yDNR4IUCsthX1iFHMilwOoCjRWj1gFTeBR6DHF1l/HxXKfNgdYthUwDWhBXPdLj
         0wMBRbyF8DWTse1Gz6PtsVb/iQ4vH+4ZtTOvvTD08x27NlhT4jkGBM3GOC3CYUbNPs9c
         2BiqV5AZyoSQ/gVm4NCscWt8LBEdKfmWmnfg0JWeuoFQkaS2k0Y7PiqYXIiXgrkNorL/
         x2ICrWwrPRlmra2a2AczXlETite71ogV7lbfaXP83bQkRRxZqS6IAvOWu32O/Wvi4z+b
         gLk5hT0E6s1ViLbLL2LJLH1eIgDnxcfNMNzYdoUH/XKt/of6mdKXDSSBPNhRB68Ys6eS
         rKBQ==
X-Gm-Message-State: AOJu0Yy1dH88G3JCM/htyBEhRSvNLrJ0kSHnskKNhnrL7mbcHf5v1POR
	x90Zv5IPMYrxvmu+m0/kPcKn8F+cHRfozaMEUXgmzGR+J+YHFngjWkgxejOABJJBHSuOCc+KDNW
	SoVGSrIHfPyi/tWoxyiwbPF50FK9nVRMylt82hg887brCMYgYPZy9M7XgkC/WEgKW
X-Received: by 2002:a05:600c:4fd4:b0:425:6c50:865e with SMTP id 5b1f17b1804b1-4256c508c9emr10127045e9.2.1719568303331;
        Fri, 28 Jun 2024 02:51:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFx7GApa4V6Ys86UMDDjFoQSycCgQ3N+cU8S1eq7Qgg9c7L+uZA7KYwEYWyNiB4o7xA211CuQ==
X-Received: by 2002:a05:600c:4fd4:b0:425:6c50:865e with SMTP id 5b1f17b1804b1-4256c508c9emr10126935e9.2.1719568302889;
        Fri, 28 Jun 2024 02:51:42 -0700 (PDT)
Received: from gerbillo.redhat.com ([2a0d:3344:2716:2d10::f71])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0d9385sm1727348f8f.39.2024.06.28.02.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 02:51:42 -0700 (PDT)
Message-ID: <2f1c19591ff456ada2a1ad470032d3e3fb9f88d7.camel@redhat.com>
Subject: Re: [PATCH v5] virtio-net: define UDP tunnel offload feature
From: Paolo Abeni <pabeni@redhat.com>
To: Jason Wang <jasowang@redhat.com>, Willem de Bruijn <willemb@google.com>
Cc: virtio-comment@lists.linux.dev, maxime.coquelin@redhat.com, Eelco
 Chaudron <echaudro@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>
Date: Fri, 28 Jun 2024 11:51:37 +0200
In-Reply-To: <CACGkMEsbiN90ptOL2XHauzWS=9j5RXtnO7OD10yChPaUO3CY_A@mail.gmail.com>
References: <56ccba136272593d0d2af0303600c06f26bd84a1.1718621522.git.pabeni@redhat.com>
	 <CACGkMEt-Ep+At_4YvkJ2t8UmQHJ0-Qm6fAPbGpkV_AfVyNq2EA@mail.gmail.com>
	 <ed07e9bb9ae5bc1a171c77425cc0b96e6b87745c.camel@redhat.com>
	 <CACGkMEvD_WDN5yeRKcZ2ijRF8C2_Pmr6UZWMNt+_R6S0WHY5Fg@mail.gmail.com>
	 <e5d885e6331b18b3be63facfd59658b316f20de1.camel@redhat.com>
	 <CACGkMEsbiN90ptOL2XHauzWS=9j5RXtnO7OD10yChPaUO3CY_A@mail.gmail.com>
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

On Fri, 2024-06-28 at 10:41 +0800, Jason Wang wrote:
> On Wed, Jun 26, 2024 at 1:35=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> w=
rote:
> > On Tue, 2024-06-25 at 16:28 +0800, Jason Wang wrote:
> >=20
> > > Without UDP tunneling, GSO works with simple csum_start/csum_offset.
> > > It doesn't require things like mac/network offset.
> > > With UDP tunneling, can we just invent
> > > inner_csum_start/inner_csum_offset to make things just work?
> >=20
> > Note for UDP tunneling should be 'outer_csum_start' (as 'csum_start'
> > refers to the inner header) and 'outer_csum_offset' will not be needed,
> > as we know that the outer header is an UDP one.
>=20
> You meant it is implied by VIRTIO_NET_HDR_GSO_UDP_TUNNEL? Probably but
> we also had the case for VIRTIO_NET_HDR_GSO_UDP.

Possibly did you mean VIRTIO_NET_HDR_GSO_UDP_L4? I think that is quite
a different thing: such offload was added when the
csum_start/csum_offset field already existed, I guess it was far easier
to reuse the virtio net header as is, instead of _deleting_ an unused
field for that specific gso type?!?

To do UDP tunnel GSO we need new fields. Do I understand correctly that
there is concern about adding "too much" new fields? if so we should
avoid introducing 'outer_csum_offset' as it carries no useful
information. FTR: I think we *should* be concerned about the
virtio_net_header size increase, as it will be bad for performances.

>=20
> > Dropping the support for the use-case with no inner mac header, and
> > enforcing that the inner mac header must always be an ethernet one, the
> > following fields will suffice:
> > - outer transport header offset (or, if you prefer 'outer_csum_start')
>=20
> csum start seems to be more consistent with existing fields.
> Personally I prefer to stick to the existing fields for outer.=C2=A0

I'm unsure if I read the above correctly. AFAICS you are suggesting to
re-use the existing fields for the outer header and add new ones for
the inner header, am I correct?

Note that the outer checksum is optional - the outer UDP csum can be 0.

AFAICT using csum_start for the outer csum will be a bad choice as we
will need to change the handling of such field depending on the
gso_type and the s/w implementation will be more complex and likely
more bug prone.

> But if
> others are all fine with introducing new fields for outer, I'm fine.
>=20
> > - inner mac header offset (because we can't locate it in any robust way
> > even with parsing)
>=20
> I see, so the point is to make it protocol independent. Then we end up
> with an interesting situation:
>=20
> 1) we try to make tunnel GSO to be protocol independent
> 2) but it depends on the outer GSO when is not very clear that it is
> protocol independent or not

Note that the inner mac header offset can change on a per packet basis
even if the UDP tunnel protocol stay constant/is fixed. e.g. if the
tunnel protocol is geneve, different packets can have different geneve
options and thus different inner mac header offset.

I don't understand the point 2) above. We need some new fields to carry
the information need for UDP tunnel GSO. How that relates to the
protocol independence? We need such fields regardless of the protocol,
unless we want to resort to parsing all the way from the outer mac to
the inner transport.

> I wonder if we should introduce the PISO for GSO first (new fields)
> and build the tunnel GSO on top? (Or it might be an overkill?)

I'm not sure if PISO is suitable for the virtio net use case.

e.g. the virtio driver rx side must be able to fully reconstruct the
GSO information for later S/W segmentation, if needed.

With PISO the outer headers and the encap info are lost, the received
PSIO GSO packet will be corrupted at any later S/W segmentation.

The above problem does not affect H/W nics implementing PISO sending
the segmented packets on the wire, as the other end is going to fully
parse the incoming packets.

@Willem, feel free to correct the above statements as needed.

Let me voice my biggest concern. I feel like we are not making any
progress in the forward direction. The initial design was sound enough
to build a working PoC. The current design is completely fuzzy to me. I
would be great if we could start setting some details.
e.g. do we want to avoid parsing if possible? do we want to minimize
new fields introduction? can the virtio net header layout be 'gso_type'
dependent?

Do you think a video call would help ruling out some details? if so
please let me know if/when you are available, I'll try to set it up.

Thanks,

Paolo

