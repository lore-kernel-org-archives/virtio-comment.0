Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C60D7637
	for <virtio-comment@lists.linux.dev>; Tue,  1 Oct 2024 13:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727788223; cv=none; b=OntmK9sVDTdIbYoFtj+uo6mXLhyWpNfEQHMQEYkw0R0dU/FC5cXBnaewpzwkqZEcevCfvepchPHUa7aHz8xxgmSf792QmgDV2MjyePVw4z0Bp91lpnl7qz931JqbHEVcxwBqmFLoCvbiLOmhCMk/fwQQYw2Lw8+bcvhpyM71Plw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727788223; c=relaxed/simple;
	bh=5r6QDA7lkG29PsobW0z78CUbsc2QBbcWY8qHvAHhp28=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UUM6pbnkBKNF/r6XKtpScsB5Ord5jRI1tBCClQrfkJmNqAG/VhorabZi40oAIvDPM5R4sqAL8gjOyHfDLLkYcTvrGFrFzDw9xeQXoXmqFOjY0w1s0JDtJXy/IA30kClRw6ayroir0UQKuSjK9L8GeRgbh5taUd3Zvj81IeK8Ebk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EGWCN8FZ; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EGWCN8FZ"
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e02c4983bfaso5080202276.2
        for <virtio-comment@lists.linux.dev>; Tue, 01 Oct 2024 06:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727788221; x=1728393021; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5r6QDA7lkG29PsobW0z78CUbsc2QBbcWY8qHvAHhp28=;
        b=EGWCN8FZ3DmvR2rXgzcaX9ARzJdL2AYjzbhupsM09zTFBPISKQG7RRxFo4ZmqHn5dx
         o8Bq0Ph70LoLjMEShSgV9FqXX228aKXtoo1MSNk12eyjFr0BDl/gHs26AfTUiXxXLRKd
         WQD6lNyvkJyKJ7czdWhm/RC88gtnCAGBIu9kHGgcGHlNMXWbFZRwKHzbzbmwmpx5aWP5
         sFTcAycK0bWRpLdFT56vkzTOXfjfIKROEqdsjHTlAgDSjkXhNwud3KpQIEuLPnU4ID8o
         mxcsUJ5yiNy5Ffqtmy1Ivtt0Acxd296K+Dj+XHcHa4pkeJOZkcEx6k/qfiK2nxJ5AgGM
         FxBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727788221; x=1728393021;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5r6QDA7lkG29PsobW0z78CUbsc2QBbcWY8qHvAHhp28=;
        b=GP0cSgzL56IioEU5DNC02dDKLo1Kw/UE+7p78rmKNmUpAy49v0g8lUFLr/GPpRU7Wv
         n6wmA5p8a39JXadXqngblIIPkgrHymPEYj/u42i88dEn8j+wyS8Z9TkhSwpDxYRwftTP
         BOOqTLo4ad1JlPO/gCgKV9pYaYfkcOv3gSDChT7kTBqYJVihWR5aBbfMv+CpLVnicJhS
         ca/3zNTBdl+MGlT5cDq2LhaxOaR6EHrpTYqaphOrMQHB0CfU2vsTrcG5aNQjcQMN0WgK
         zarkOx7IY44PIkfuqJVGFhxt8oom3u+0JMPXC8zKY1njQpc+hADNlEjb5/yY2hHM133H
         AubA==
X-Forwarded-Encrypted: i=1; AJvYcCVAisZZ3/PzlRWVYW3cshUMVvkNf49XBWoMGxqkl+7Fhxda7JsI7ZL8i5DDg3ofRB6KQVyREfqRtgdOaHmuBA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzv1wMwOkJdJEeR0DreoIf3s5vr/3bhSia2n8KNhk1eE50P1zHe
	/3lsra8X5rttXiSzHEZZoZ0OSzdxybVwnO00WFgzARXd5NUUzJkKB4PUZr7y9pHIYhKpO5NEvdv
	Kj/4GSbjBHyR1jRlPvW8JExetFtvRps54zUJV
X-Google-Smtp-Source: AGHT+IEiXKWmZHicI9SoxH2ZpJcB2A9E9tdJE1ErEHsqyYoigh7qLzRkvt44o6xioMUV8z7F9FL3mzYURuAgcfRPhk4=
X-Received: by 2002:a05:6902:2289:b0:e25:1b5:edbe with SMTP id
 3f1490d57ef6-e2604b6dfccmr11326600276.17.1727788220401; Tue, 01 Oct 2024
 06:10:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1725463935.git.pabeni@redhat.com> <CACGkMEsXhsTpZg2DP5BqUOodjR1HOTc-a-FuaCbxffZhpPj2aQ@mail.gmail.com>
 <45c88725-bacd-4999-919c-4191ea0cbdfc@redhat.com> <1ca3a523-87d1-4450-a0bb-980b1c8109c4@redhat.com>
In-Reply-To: <1ca3a523-87d1-4450-a0bb-980b1c8109c4@redhat.com>
From: Willem de Bruijn <willemb@google.com>
Date: Tue, 1 Oct 2024 09:09:43 -0400
Message-ID: <CA+FuTSfdXbMsFqEDXRwoKZUwaRJLHi6H-BZjEF00-1bWqXvEdQ@mail.gmail.com>
Subject: Re: [PATCH v8 0/2] virtio-net: define UDP tunnel offload
To: Paolo Abeni <pabeni@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>, virtio-comment@lists.linux.dev, 
	maxime.coquelin@redhat.com, Eelco Chaudron <echaudro@redhat.com>, 
	Stefano Garzarella <sgarzare@redhat.com>, kshankar@marvell.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 30, 2024 at 3:36=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wro=
te:
>
> Hi,
>
> On 9/9/24 10:05, Paolo Abeni wrote:
> > On 9/9/24 05:16, Jason Wang wrote:
> >> On Wed, Sep 4, 2024 at 11:50=E2=80=AFPM Paolo Abeni <pabeni@redhat.com=
> wrote:
> >>>
> >>> UDP tunnel usage is ubiquitous in container deployment, and the abili=
ty
> >>> to offload UDP encapsulated GSO traffic impacts greatly the performan=
ces
> >>> and the CPU utilization of such use cases.
> >>>
> >>> This series introduces separate features to handle both UDP tunnel
> >>> segmentation offload (patch 1) and UDP tunnel outer checksum offload
> >>> (patch 2).
> >>
> >> Looks good to me.
> >>
> >> And I wonder if there's a link to the prototype code so I can have a
> >> double check.
> >
> > I still have to refresh the code from first implementation - that was
> > the base for the first draft here some time ago.
> >
> > In the next 2 weeks I'll be traveling and/or AFK, I hope I can share th=
e
> > code a little after that.
>
> A very early PoC is available here:
>
> https://github.com/pabeni/linux-devel/commits/virtio_tunnel_gso/
>
> It's very lightly tested vs a patched user-space:
>
> https://github.com/pabeni/qemu/commits/virtio_tunnel/
>
> "very lightly" is actually a strong understatement; the thing survived a
> single iperf-over-udp-tunnel run, and that is. However I hope it should
> suffice as showcase.
>
> In the tun/user-space interface I used a separate ioctl to configure the
> tunnel offload instead of re-using the existing ioctl for plain GSO,
> because AFAICS the tun driver is currently unaware of the complete
> virtio net hdr layout (e.g. ignores rx hash and VIRTIO_NET_F_MRG_RXBUF)
> and it is just notified of the total hdr struct size.
>
> With UDP tunnel offload enabled, the tun driver need to know the tunnel
> fields offset inside the virtio net hdr. Piggybacking such info inside
> the the current ioctl(TUNSETOFFLOAD) data (a single long int) is
> feasible but looks hackish. Instead I preferred implementing a separate
> ioctl(TUNSETTNLOFFLOAD) receiving as input from user-space a struct
> containing the mentioned offset and the "csum offload enabled" flag
>
> Any comments/suggestion WRT such interface more than welcome!
>
> The PoC demonstrated that the pending spec changes need some fixlet:
>
> - I wrote the patch on top of the current virtio-spec master branch, I
> need to rebase on top of virtio-1.4, I guess.
>
> - I underlooked to the VIRTIO_NET_HDR_F_DATA_VALID flag. The
> specification change allows GSO over UDP tunnel offload with DATA_VALID,
> but GSO over UDP tunnel needs the inner transport protocol information.
> This point looks more difficult and potentially controversial.
>
> With the proposed change, when DATA_VALID is set, the implementation
> will have to determine the inner transport header location via parsing,
> as currently is doing for plain GSO. Note that the PoC is currently
> bugged WRT this scenario.
>
> I'm wondering if we could revisit the spec change requiring that both
> the driver and the device, for GSO over UDP tunnel packets only, will
> fill the csum_start field when either the NEEDS_CSUM or the DATA_VALID
> bits are set.

This SGTM.

> Equivalently, for GSO over UDP tunnel packets only, the
> driver and the device, to specify CHECKSUM_UNNECESSARY packets, could
> set both the NEEDS_CSUM and DATA_VALID, with the latter flag 'taking
> precedence' WRT the actual checksum type.

Why do both need to be set to signal CHECKSUM_UNNECESSARY, rather
than only DATA_VALID?

> Note that the above will made the GSO over UDP tunnel path for
> DATA_VALID slightly different from the current plain GSO handling, but
> the difference should avoid the current rough edges of the plain GSO.
>
> Other options would be resort to the parsing the inner hdr location (as
> in the current plain GSO implementation) or not allowing DATA_VALID for
> GSO over UDP tunnel. WDYT?
>
> Thanks,
>
> Paolo
>
