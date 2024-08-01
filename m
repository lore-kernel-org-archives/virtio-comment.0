Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72FD01B8EBC
	for <virtio-comment@lists.linux.dev>; Thu,  1 Aug 2024 16:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722528313; cv=none; b=uFKIGr7JxP7ChO5J79sMjMase8zB9Oi8caNCd4a6yjryYP/igK3y6BaXc8CLQmq3tIdvOynYqcOwwYOQkO37tLJ16cAaT2ezogFcoHXeuj5gsLu0lHkhaZ0+LwrgroW97Xu+TY6hiIBeeGP/h/O3ogDYwHga3+QGhRkYNfqnZ8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722528313; c=relaxed/simple;
	bh=pHcU7Sdn7Ev4vUZsFy7Epbwcs/uD9Q6s4oHjtr9xL8E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S/9HZ5vqn3481+ZeaBIuk+kO1lSfeFB/0xxgkyiHcdC4T50w/X9sf852WpH0zAtW23Qh/K5p3I2oG+vBJL0vYJ/7qpLI/Vb0i0rcZjGsf03kxg0+tzppIoge4MtqouY4XlcNf6ewT+IGnWwi/v6DuQe0ILllPgSAk8lzZT7KCFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CwMeu8da; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CwMeu8da"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-44fee2bfd28so791931cf.1
        for <virtio-comment@lists.linux.dev>; Thu, 01 Aug 2024 09:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722528311; x=1723133111; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pHcU7Sdn7Ev4vUZsFy7Epbwcs/uD9Q6s4oHjtr9xL8E=;
        b=CwMeu8daBBi4h5sEFbYp9F+Jg8L+A9DRLPfCkici512tHX4kQMrdRiZJpq4oys2Wsm
         AsvO3ozYQIw8zZ4/HCyDE9SVipc9fC4i/l7m5YuY3/8FPVDvAWYZaP6c3DOQwL+X5lZe
         rw7fVb4cf8sMOKIejOCNkrnJGpPy/ymmhEF9vSJbSqdYJC2pq2UXOcGpiE3MUwz4KDbw
         9SUEv+FOLGuiPLGXDADT+lG0wFoqQ0Uk0rGIRtbIGGClIr7Te5urN2AlLskYdHHmV4W6
         cHVBB1e1AVE9Tw7dpJWmjFSzCW6NIQj0JRvxrU/622BgEwdyZAIXDhSXvkTqZYDqvOmS
         toWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722528311; x=1723133111;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pHcU7Sdn7Ev4vUZsFy7Epbwcs/uD9Q6s4oHjtr9xL8E=;
        b=c9l4poPJC91ONSI7wuqinCqzQUwm3iI8VFCwCUZ0tXky6E9nqCvWL1MujtoG8tmJFc
         pcMGwHaCSV7hrnRAwornprRISyXMsi2nhOJdyHlulSXxqBwFS9LRjwG+2XCygqLgxVi0
         Ll8cmYw6Pguyg8GoZx6QZDf8p2LKoEGGcO1GVLwgAbUVG7lVOQk0MFnfcr2W8a5J7Vn9
         bEA90/a0DEnCKR509rRWBJkui46NWb4akMhkaSDRT1n0vXRynvk+BNDREOcRKXttL7Z3
         fHxq4HuJ+Q8NwZmm2JpvLuXrlOABfrcAoZzu6Q+VvuvjLrzOOp0+FxjjR0s7eqGQaAVA
         qbYA==
X-Forwarded-Encrypted: i=1; AJvYcCXf2FUthEhLfzwi4wm4Fn2YSM64YsO+wJ+zMaGzkBXskhDDe7j4YGxj7gLncE04k9pTRQwRwQLH/yNr3U0BG1iqfdjSZ9XvugvgEk+GgMo=
X-Gm-Message-State: AOJu0Yyh1T5ci/HfH0yWWW8yJPQtdyE9WxnbxlNwVD6CzUFRpeoLXEAx
	3CFJHlZQuN9FM8u0Erdy6amIvhhKZBlsLO3TEx+eLZT3FjypBf9Tl/Dz9zS4mWdRT1ed2oLbIZs
	PJC2Ja+Ypt1mI8sS9S0+TaNjEnfjpHI/6XIyM
X-Google-Smtp-Source: AGHT+IEwyB5dR+/v8EJsjXaIaTVpgDgqJv86mqExcEnXj3g66tzH3zk7QRPNbMCkPdRoZP/YdMZiWdqwuEXXiumjFvk=
X-Received: by 2002:ac8:7f4d:0:b0:447:f108:f80e with SMTP id
 d75a77b69052e-451809bd28fmr2896891cf.16.1722528310953; Thu, 01 Aug 2024
 09:05:10 -0700 (PDT)
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
 <494ee50c-eae3-41fb-9823-595ce00b0c35@redhat.com>
In-Reply-To: <494ee50c-eae3-41fb-9823-595ce00b0c35@redhat.com>
From: Willem de Bruijn <willemb@google.com>
Date: Thu, 1 Aug 2024 12:04:31 -0400
Message-ID: <CA+FuTSfiec0x0f3rQjkZpiihEhcu_JcoU4c+Qd=8GM0kDjDoiw@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] virtio-net: define UDP tunnel segmentation offload feature
To: Paolo Abeni <pabeni@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>, virtio-comment@lists.linux.dev, 
	maxime.coquelin@redhat.com, Eelco Chaudron <echaudro@redhat.com>, 
	Stefano Garzarella <sgarzare@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 1, 2024 at 11:34=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wro=
te:
>
> On 7/31/24 20:21, Willem de Bruijn wrote:
> > On Wed, Jul 31, 2024 at 1:32=E2=80=AFPM Paolo Abeni <pabeni@redhat.com>=
 wrote:
> >> What about reserving an additional bit in gso_type to specify the inne=
r
> >> network header protocol?
> >
> > Similar to VIRTIO_NET_HDR_GSO_ECN?
> >
> > Is that preferable over VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IP4 and
> > .._UDP_TUNNEL_IP6 variants?
>
> Should be basically the same, as VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IP4
> VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IP6 will be 2 separate bits in gso_type,
> right?

One difference is that we have to update other code to use a bitmask.

I'd prefer the two types for that reason.
