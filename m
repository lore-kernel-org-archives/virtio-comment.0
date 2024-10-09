Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8447117C9F1
	for <virtio-comment@lists.linux.dev>; Wed,  9 Oct 2024 07:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728458720; cv=none; b=OXbNIJQHtYbfRq2EQFzJelg3ArNKV/SWw6SUmufd4Z23ffBOJ1TrpuW+R7jFq4jnsaUGP+6T4PHLGaAqyb+teQj5IgdNzr+NSKnnuWEK4zeNAxujC0m+IDVSSjwcmuuDQTSmpv03CFT+E7wt6neL10nGq0nXN4+y8yFOQDdmg0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728458720; c=relaxed/simple;
	bh=wPjj7qrNG3nbu7yIlA0azB+BMx2ZOOhGRSswgO8j4Mo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UDBqrpCJBz8kEVxxUth8EGRycFS5jmVjhizOscIMcVzILNlX/WuGRK73vcJykGk6FZoTgXOTly4HC41CMqqFr2szngNpGnOvpxT+O15l6x8z/b6Pd8urM3gxuYgQy/RI8CWjHJvWymLoRV1YXK0Iy7wfbSeL8X6pqZ80VdDeI9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CEmAOR0i; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CEmAOR0i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728458717;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wPjj7qrNG3nbu7yIlA0azB+BMx2ZOOhGRSswgO8j4Mo=;
	b=CEmAOR0iLzZSiYQ7SYVQ8kNY1g0547427rASsUg1fiaCLb2sPaRH5akePdkg0kxeyI1Rcc
	nblejhER5AWw1fJt6q7SuuNN8pyAH768UcmWdjOgIOoPwfnJOJnIqnsQfV1rBbbMAF8FV9
	uVtcMxDwKvMFOTL5bAVagGLXdxAkpgs=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-78-L2u5mlNNNZm5MMnE3q2xOA-1; Wed, 09 Oct 2024 03:24:51 -0400
X-MC-Unique: L2u5mlNNNZm5MMnE3q2xOA-1
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2e29df9d3abso593179a91.3
        for <virtio-comment@lists.linux.dev>; Wed, 09 Oct 2024 00:24:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728458690; x=1729063490;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wPjj7qrNG3nbu7yIlA0azB+BMx2ZOOhGRSswgO8j4Mo=;
        b=DTPhH5/MiSuXQHiUn4tikERignrONJmPS+O20xQDEysqZp2WTne5yIRyepkLtZxuFS
         usdTjCY10uG43ma9glGf5JyEiIQX43h+XU2MM/Z+wDrZ5OMIjRFUt0d/05uv19WzldJG
         TXttNSHak3KxerbvMhG5DP03YXe0Le5VBOQBisrOYttTCMpc/oz01ZtCUtSWlh5FdwPy
         peUrwjtt03BxAc9IXZceoofUyyp+vkbIx62r9Dyv4viCs9808Uy6Q8l0ng+Lh17AaV0d
         sMRqkkC3R7yUISSGgbJv2YIYEcIASvSz8LNNA9JDW0/LRSQEk/7BHUsk8KWh6511gaux
         W1Dg==
X-Gm-Message-State: AOJu0YzKNJGtI89q59AMiZGlOZOsO+t5M4WgaXs2+5JxW+nTj2oU7HvJ
	LGDAGrv7cQKkeQp6KyztQeBfyJxcf398wBPJUQvO9bBpV/xG6E9oJNC4C7mxtvRfhf86Y9wqTL+
	71QRiI6zYS7/Gj3/U33lBdfzsiMaAGLNJ6ht2UWfUdaq83Dv0zx0S2RVgc28gUo9zomP9OQGsKg
	cygBtsrdQw4GLv+NGNg+2zlKZxn4W6+hnqSxNHAI8=
X-Received: by 2002:a17:90a:f284:b0:2e2:af05:71b9 with SMTP id 98e67ed59e1d1-2e2af057e67mr926516a91.9.1728458689788;
        Wed, 09 Oct 2024 00:24:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGV3ppY4FC5sHJz7iFPP6m/xKIHj5b4+JDI0gqBEJhBHGY9YVUE11V5CKY9u9HIp/fV21bDn8nIUnzzDjK5Zks=
X-Received: by 2002:a17:90a:f284:b0:2e2:af05:71b9 with SMTP id
 98e67ed59e1d1-2e2af057e67mr926493a91.9.1728458689212; Wed, 09 Oct 2024
 00:24:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1728029499.git.pabeni@redhat.com> <54b59f12-74c7-4ec4-962d-b5a9d7490580@redhat.com>
In-Reply-To: <54b59f12-74c7-4ec4-962d-b5a9d7490580@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 9 Oct 2024 15:24:38 +0800
Message-ID: <CACGkMEsV9jrsAHLZn2gJWeb7+R0W360n7fjg6E3QiA4CZgaUvg@mail.gmail.com>
Subject: Re: [PATCH v9 0/2] virtio-net: define UDP tunnel offload
To: Paolo Abeni <pabeni@redhat.com>
Cc: virtio-comment@lists.linux.dev, maxime.coquelin@redhat.com, 
	Eelco Chaudron <echaudro@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>, 
	Willem de Bruijn <willemb@google.com>, kshankar@marvell.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 5, 2024 at 12:53=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wro=
te:
>
> On 10/4/24 10:13, Paolo Abeni wrote:
> > Note that such while the mentioned PoC is based on the previous
> > iteration of this change, it already deals with all the delta introduce=
d
> > here except the refined DATA_VALID handling. I'll try to update the PoC
> > WRT that ASAP.
>
> The updated PoC dealing with DATA_VALID according to the spec change is
> avail here:
>
> https://github.com/pabeni/linux-devel/commits/virtio_tunnel_gso_v9/
> https://github.com/pabeni/qemu/commits/virtio_tunnel_gso_v9/
>
> It's slighly less untested than the previous iteration, as the
> CHECKSUM_COMPLETE/DATA_VALID code path is explicitly covered allowing
> the user-space to configure the tun device to set DATA_VALID on the
> xmitted virtio hdr.
>
> @Jason, please LMK is something additional is needed to reach the board
> voting.

It should work at a first glance. But the tnl_offset and new ioctl
seems a little odd. Any reason we can't deduce it from the features?

I'm asking since the design needs to work with hardware implementation
as well. So any channel outside virtio (e.g the TUNSETTNLOFFLOAD) may
not work.

Thanks

>
> Thanks,
>
> Paolo
>

