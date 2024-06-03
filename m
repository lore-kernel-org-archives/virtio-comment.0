Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E607412E1C4
	for <virtio-comment@lists.linux.dev>; Mon,  3 Jun 2024 14:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717424267; cv=none; b=Me0gUpr3eDio7F0LwIJG5rfxLUkCR/Noj4cdM2GUNnZFmUB/okSeGdnJIUTwgdIu1Hx/zXbF6xZSahgQ0ZN60GivJyRmOlwvqcTk6dCZgqoKtxyZSUIh8B0zjtp/RKugFHLGP/aFxH88/omvT56Bpus3LeHDSykExigFRz+Kq4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717424267; c=relaxed/simple;
	bh=w0ZlWv+afAGp6pIvB6sd309gTerzl5y8qr8mU+XKXTM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b57cQQHP7sX70o8DcOPpl0mZmeaw4gxhghPezdjejx+90gKpEKE32mToNnftAjyPJ8bdw4J/c+FYGQGr9sw+m7ecB09XO3EI7aVvypDctJIEdBEEA52tP050ieifIspTo/mUs6DNOZv9dGjn9LFUPcrbJ955Ca2I1coQoN/Cw7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EaZzTxNo; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EaZzTxNo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717424264;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=w0ZlWv+afAGp6pIvB6sd309gTerzl5y8qr8mU+XKXTM=;
	b=EaZzTxNooAXwr+1UYn+i+rDbeOWikfnOGV2WUIQuNx2du28Vkt89cclA8j42896vDGG2O5
	cSjpan175J7wDFhKnmIiSQHfnGGuQydDIWKE39Ln7I2m5SaXBRfjs7iW0L5H/botY8JlHD
	uyZFxa58mqsgPTUaEgwVpQHoKPTv7OU=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-652-qbni5Q77PSCn0MGHCh9tYA-1; Mon, 03 Jun 2024 10:17:43 -0400
X-MC-Unique: qbni5Q77PSCn0MGHCh9tYA-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a6265d3c48bso17226466b.0
        for <virtio-comment@lists.linux.dev>; Mon, 03 Jun 2024 07:17:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717424262; x=1718029062;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w0ZlWv+afAGp6pIvB6sd309gTerzl5y8qr8mU+XKXTM=;
        b=uBHalXjG8sxb+/UXJrZ/4FWTBOIiQdn/zYFBTMP1U1IrSqGeT73Ud4j+HSjYoFYqFM
         wludsjX3H/s3Y7Et8HCeatMMtN0Xrt3u+k9jXwjiRSEY9UzrSITbL0EefNOPMdc5Cot3
         Mvh7SLdVd2AUb7HP3VmwT9ad4G5/kBermEBZaQgGQ3rfM3sdYtbZkUvy+pU3dIebw0Nh
         loe7htxlNDKaPsf8vDuqfxtuaNs8npR8BaNAe+fJBC8aJMheazq5dUTaAvng72IkyY4r
         Pst8YEh0yvbfDfehuH5s3rCi7CFidy8Odyh/j92F+6ZZ9pLfaJJUY5MbhHc4oAXLUKDQ
         5mpw==
X-Forwarded-Encrypted: i=1; AJvYcCXQXPAPBKOvhXV3Xr08PG/9e3EZGC3MXIeLDBmXCA41jrBV+WLe9hLruiNVAYlHN+UcvAEGANZ+LO75cCVkS8NAdIJGtfhSX+JO3cRqAww=
X-Gm-Message-State: AOJu0Yw2QePc6BamgMnFtXKQeJlxqAMbL0phWeJce/bgIB55Q2E0kM8H
	zV7cViWzULATgtGuRHKHS97yqKAbWpBK/bVbmXvxfuMKo8rLrdGYLy0w9AB1lilQii9bBR1w1Zz
	W4zE5qfOYnb1Srsbp5R6B977Dmovrp9fQa52Cy9veUeBvcylwdiDlbyAGXVv8wYcp
X-Received: by 2002:a17:906:2656:b0:a68:73a8:5dfd with SMTP id a640c23a62f3a-a6873a85e7dmr523009466b.6.1717424262425;
        Mon, 03 Jun 2024 07:17:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFyFs+wrzSW7xSD1yXxL6w/XJEY0PfqIvz0L/o5+9nR6pxvLIIpZIE4V3+4WgjfBUciyds1jA==
X-Received: by 2002:a17:906:2656:b0:a68:73a8:5dfd with SMTP id a640c23a62f3a-a6873a85e7dmr523007366b.6.1717424261940;
        Mon, 03 Jun 2024 07:17:41 -0700 (PDT)
Received: from gerbillo.redhat.com ([2a0d:3344:1b74:3a10::f71])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a67eab85ecbsm497314466b.173.2024.06.03.07.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 07:17:41 -0700 (PDT)
Message-ID: <9d617e706dd834aedf07a5a61ebf994ab11fd1da.camel@redhat.com>
Subject: Re: [PATCH v4] virtio-net: define UDP tunnel offload feature
From: Paolo Abeni <pabeni@redhat.com>
To: Willem de Bruijn <willemb@google.com>
Cc: Jason Wang <jasowang@redhat.com>, virtio-comment@lists.linux.dev, 
	maxime.coquelin@redhat.com, Eelco Chaudron <echaudro@redhat.com>, Stefano
	Garzarella <sgarzare@redhat.com>
Date: Mon, 03 Jun 2024 16:17:40 +0200
In-Reply-To: <CA+FuTSfcte_aXYoog9=bQqH1v21xLk+G2V9zNo9KOwXCt8x2Tw@mail.gmail.com>
References: <cb89d3d6b6a7e4a7f13e60dd3fded5e950727890.1716448766.git.pabeni@redhat.com>
	 <ed730a7e12853339c6f5f298fa6c240a39942a74.camel@redhat.com>
	 <CACGkMEtetmg=YUtPW+yL+s5MzhbKKkJyrx3EDOtf2aF=q5_b8g@mail.gmail.com>
	 <CA+FuTSfCm-GpLHYztQCxti2adCcFPV7GyKBH1zTDB8tM2w1NNg@mail.gmail.com>
	 <794dd45767bf54385613c5d18c32ee11d474db87.camel@redhat.com>
	 <CA+FuTSeDqrQ3FVjpmmQ31UbyGQA-fUsYz3=NmizC1U7Q8w6E3Q@mail.gmail.com>
	 <4745e6a149bb8424ab3931ecf04ee941e6830c47.camel@redhat.com>
	 <CA+FuTSfcte_aXYoog9=bQqH1v21xLk+G2V9zNo9KOwXCt8x2Tw@mail.gmail.com>
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

Hi,

On Fri, 2024-05-31 at 11:13 -0400, Willem de Bruijn wrote:
> On Thu, May 30, 2024 at 1:15=E2=80=AFPM Paolo Abeni <pabeni@redhat.com> w=
rote:
> > On Thu, 2024-05-30 at 12:23 -0400, Willem de Bruijn wrote:
> > > > > > > > inner transport header offset from the provided information=
, as it's
> > > > > > > > currently the case for plain (not UDP tunneled) GSO packets=
.
> > > > > > > >=20
> > > > > > > > The outer UDP header may carry a second checksum, which can=
 be offloaded
> > > > > > > > independently from the inner one. Since UDP tunnel checksum=
 offload
> > > > >=20
> > > > > Just require local checksum offload? Computing the outer checksum=
 is
> > > > > always cheap. Optional double checksum offload might add complexi=
ty
> > > > > that is not needed, as it is so cheap.
> > > >=20
> > > > The rationale behind the making the outer csum offload manadatory w=
as
> > > > to keep the specification change simple and prevent the exhaustion =
of
> > > > the virtio_net_hdr flags and gso_type exhaustion. With this change,
> > > > 'flags' has 4 bits used out of 8 and will raise to 5. 'gso_type' ha=
s 3
> > > > 5 bits used and will raise to 6 (even if only 3 of them will be
> > > > bitfields).
> > >=20
> > > Perhaps we're talking about something different. I'm suggesting that
> > > the outer checksum is not offloaded at all, because outer checksum
> > > generation and validation is always cheap in software. This is the
> > > premise of LCO.
> >=20
> > If the guess produces GSO packets with outer checksum, and the virtio
> > driver does not support the outer csum offload, the guest will have to
> > do s/w segmentation. Even if computing the outer csum will be cheap,
> > the segmentation will be bad enough by itself.
> >=20
> > Am I missing something?
>=20
> Do you mean virtio driver (in the guest) or device (in the host)?
>=20
> All segmentation offload packets imply checksum offload. So the
> virtual device must support checksum offload. In this case, of both
> checksum fields.

I feel confused. I think the starting point was your request to avoid
supporting (in the virtual device) outer checksum offload, and I read
the above as quite the opposite?!?

> Unless from the start we incorporate partial GSO, and expect the
> guest to prepare the outer packet as they have to be for the individual
> segments. Then it could also compute the outer checksum in software
> using LCO.
>=20
> I encourage physical hardware vendors to only implement offload for
> a single checksum, based on explicit csum_start/csum_off passed by
> the host.
>=20
> Because multiple checksum generally are implemented using packet
> parsing, which requires protocol knowledge and thus is fragile.
>=20
> I suppose you could define a virtio_net_hdr with an extra
> outer_csum_start/outer_csum_off. With software segmentation, this
> can still apply LCO cheaply.

The proposed spec change adds to the virtio_net_hdr the outer transport
offset, and enforces the outer transport being UDP, no parsing should
be needed (nor s/w segmentation).

> Is there physical hardware that supports tunnel TSO with multiple
> explicit outer_csum_start + inner_csum_start instructions?

I don't have any insights there. Skimming over some major device
drivers in the Linux kernel, I can't find any specific hint of that.

Cheers,

Paolo
> > >=20

