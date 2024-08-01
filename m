Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5508F148FEB
	for <virtio-comment@lists.linux.dev>; Thu,  1 Aug 2024 18:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722535517; cv=none; b=fbKak06fej0Utdu/krSWQtFuSADqPMgkG8kaXQLUHPxeVXvIjU6VBnL5ZsJWCDeycHpOCEc8080PKJgJX50WzcXnmIVlxPPNynys7qPIA04IGqB72TffFC7sVPZLB4rt9mGTHOlIzyVk6dCRDZkthlyKHdQBhjaTVeG6xKW2Ccs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722535517; c=relaxed/simple;
	bh=7WQ8ugEaprOzqs22GMpEH4H5ewPqMSSYHOHh8J1DUq8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A+yVxXIoT+wUvvAg/FQrivafuq4ospAhANtVOwaJaBojxWLOpWVzIb3MwavecWni8+4OZW6J7qxHJW6e5Am9RohHWp21ywGNR/CBGO9hEigw1LF+lQtD71p+ZH1uxbrJZhDhzTV9DxE+4E6B4MowpfU0GE4WQ1biVBUCuGeTUsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2ujf5dK6; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2ujf5dK6"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1fc4aff530dso522975ad.0
        for <virtio-comment@lists.linux.dev>; Thu, 01 Aug 2024 11:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722535515; x=1723140315; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qvqSG74ylVaGV+z3NuZQrYHYP6UHfWqp4xsrUo1N8SI=;
        b=2ujf5dK62e+FmdplPzKHy4/oU7oY0FGimAKRHa7uzvQRQwZrw39oFmjUS6gSWUqRnI
         R9H10+5zqZ50U89Bez27DHjgW1LLYggQjWyXA2dm5j9CAONfFNAYp+kbw90di+ve7p8C
         qF7OlphsTni0RBw3gm9z2u9FwtXGD13LMhEFXFkcnL6VKN5vLuSmnMb5AhFENUvuXfua
         YDpKAgijqb5hNf/rFeHL4FPmTFg9XLEQ9Bn9XZd8EF1TxfP7Bc4XCpBs6ryCN2AP9kB7
         KAZF3fIfmHgE6GQ7o2Y+TJmxyYctliZ0ytvsrvMKxxURWIQ/oU4MDhAukK1xuAzfqfjZ
         iuLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722535515; x=1723140315;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qvqSG74ylVaGV+z3NuZQrYHYP6UHfWqp4xsrUo1N8SI=;
        b=ksotG1MYoBB+/yeiNgL7gd8sC1rH8iwbCBvZYmhgeHhMqMMNLffxU8sUZ6s27/CwXV
         uj0dqe1AbPbxogAlHGyrSH3VB9D9pR29RIp+rrq8bRFQ+iQ4moGlVeD60VoYRLC9zYi/
         OYeA5sQdcfSi1D3sPx5FyWVIj065NnEpP76PatR6knxdUw0PDPBd5V3csarE66sWes0W
         di164MXuDumnLFVFzG+jSf6RkHcHdsv6inpaHgdoFUlSQuDUWV7BpDSOLFEIFBQCzAgq
         9p12dhCa7v7GT0LNCcHdoFX4q/iS6QxprLXWFZr++uI4ZR5vgfmNb1/dVDjigmDc6VjH
         V0oA==
X-Forwarded-Encrypted: i=1; AJvYcCU7vmaSZ8IBePkiOMZTuHAz81l5qB8rkcmqEOxvzw8GvvZuc6kmjlHb+E1D2Tvm2m56QThKEkZjUy8bxZzlb9DNQI5/OqmsICNKCBaZkjI=
X-Gm-Message-State: AOJu0YxVmSFQlijq1SnlMHGTeONmrlVKSxr6HXZUM4OhIphjqyEhupQD
	gFc76TgNUAg8UOf6OwqwvuSkfRuJLh8le+2K5hifqE5BJ1oCCwixFYySBI57aRbXFIfdMZ4Ir5J
	YAvbXSiQqxjN+/uytfLemwKXj4bmF2CjY1Tuf
X-Google-Smtp-Source: AGHT+IEjuGx5RhQUaYR34MuiUaZffsdYsIrlZfBEDaIinvQ/7D7jhkXR+jAVAj36Fn2RXDEp6Ogc88pBQBU8mZLo7wc=
X-Received: by 2002:a17:902:f683:b0:1ff:57f2:53c8 with SMTP id
 d9443c01a7336-1ff5a3ecc47mr154615ad.24.1722535514163; Thu, 01 Aug 2024
 11:05:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1722252302.git.pabeni@redhat.com> <2977107dcc842c0665227f7c3696157ecd15a1b2.1722252302.git.pabeni@redhat.com>
 <CA+FuTSfu8Sys_s+3jpXoS0GbZC4stOVgBrEYOtA9YoTCEJkJAA@mail.gmail.com>
 <d79c4ed9-c1d5-4c9c-9f10-661745edf96c@redhat.com> <CACGkMEu6dnKOgYVYRWKadXirnk4R6Rc16ojNR=oSX-a22Rt4OA@mail.gmail.com>
 <CA+FuTScr26P+QtPfWKzD1zzadKiZ3zRs75KC1ycexdQRAQ0XuQ@mail.gmail.com>
 <56d62e5a-b7df-43f7-8878-517505345529@redhat.com> <CA+FuTScunTfXGzpEFEgZcv3FKSzVwSK0vhuO61a=Ui2HybTsJw@mail.gmail.com>
 <494ee50c-eae3-41fb-9823-595ce00b0c35@redhat.com> <CA+FuTSfiec0x0f3rQjkZpiihEhcu_JcoU4c+Qd=8GM0kDjDoiw@mail.gmail.com>
 <b5e8135e-9034-45f1-9e78-a5405073dfc6@redhat.com>
In-Reply-To: <b5e8135e-9034-45f1-9e78-a5405073dfc6@redhat.com>
From: Willem de Bruijn <willemb@google.com>
Date: Thu, 1 Aug 2024 14:04:36 -0400
Message-ID: <CA+FuTSfjDRva6JSvMVCkZGcKX46nRGh9gtZw1CGO2ajmikw9zA@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] virtio-net: define UDP tunnel segmentation offload feature
To: Paolo Abeni <pabeni@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>, virtio-comment@lists.linux.dev, 
	maxime.coquelin@redhat.com, Eelco Chaudron <echaudro@redhat.com>, 
	Stefano Garzarella <sgarzare@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 1, 2024 at 12:26=E2=80=AFPM Paolo Abeni <pabeni@redhat.com> wro=
te:
>
> On 8/1/24 18:04, Willem de Bruijn wrote:
> > On Thu, Aug 1, 2024 at 11:34=E2=80=AFAM Paolo Abeni <pabeni@redhat.com>=
 wrote:
> >>
> >> On 7/31/24 20:21, Willem de Bruijn wrote:
> >>> On Wed, Jul 31, 2024 at 1:32=E2=80=AFPM Paolo Abeni <pabeni@redhat.co=
m> wrote:
> >>>> What about reserving an additional bit in gso_type to specify the in=
ner
> >>>> network header protocol?
> >>>
> >>> Similar to VIRTIO_NET_HDR_GSO_ECN?
> >>>
> >>> Is that preferable over VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IP4 and
> >>> .._UDP_TUNNEL_IP6 variants?
> >>
> >> Should be basically the same, as VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IP4
> >> VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IP6 will be 2 separate bits in gso_type,
> >> right?
> >
> > One difference is that we have to update other code to use a bitmask.
> >
> > I'd prefer the two types for that reason.
>
> Please pardon me for the high-frequency spamming. I'd love to have this
> topic well defined.
>
> I'm unsure how to read your suggestion exactly.
>
> VIRTIO_NET_HDR_GSO_UDP_TUNNEL needs to be "combined" (set together) with
> VIRTIO_NET_HDR_GSO_TCPV4, VIRTIO_NET_HDR_GSO_TCPV6 or
> VIRTIO_NET_HDR_GSO_UDP_L4, so it's currently defined as a bit flag:
>
> #define VIRTIO_NET_HDR_GSO_UDP_TUNNEL 0x40
>
>  From an implementation perspective this allow us reusing the existing
> code for to fill inner headers related field, masking such bit in the
> gso_type before invoking the existing virtio_hdr parsing helper - it
> will be used unmodified.
>
> Due to all the above, I thought the IPv4 and IPv6 variant would be
> defined as:
>
> #define VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IP4 0x20
> #define VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IP6 0x40
>
> How would you define VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IP4 and
> VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IP6?

Sorry for the confusion. I agree with your proposal.

I had forgotten that it already adds a bit that will have to be masked
out in any branch that only deals with the inner type.
