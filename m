Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8741632EA
	for <virtio-comment@lists.linux.dev>; Fri, 25 Oct 2024 13:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729862969; cv=none; b=cC4DiWoq15RFiRPZkzN4dQ9jEN0h9y9Gh09m0cU1tf8he6TMxEJ33c6BrkURqNZNRPax1Nzx1M0Q4hUwog9kHTmgSyPNqLizrtrfzggGuXGad2X2pGqnmXCyhwDrOKkWMTVJaiDeuPATSnxJ2Nz31zj+vEauh6UbesrYjKJ8ePQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729862969; c=relaxed/simple;
	bh=4t9T08tYPZCIPOVVZzHSZrqACgCD9YTgs1Bz3FtZ5LA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QJSwzCVH3+mOb0Xw82i6EYKZn6EDqu/6Jg++w/L3KLa8uqz981p0s0VjgqtEgrQI4F5f/JW7Vw6yBija0NdUTdAuDPRkhQlPAP/1KVSfrsBqEK2PZ3MwA6h8EWFXT2sYTW/gbaCHxr+S0l6tvkQceSxRUszpKe5oJNuWCP27Q90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=W5YyT+Ot; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="W5YyT+Ot"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6e5b7cd1ef5so20127317b3.1
        for <virtio-comment@lists.linux.dev>; Fri, 25 Oct 2024 06:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729862965; x=1730467765; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ssdldt32CTCE+WMld7vM73WalSnHDIVMu7Ccn9x+ixI=;
        b=W5YyT+Ot+r3InM0TbKe8AYp7JItyjg5+S2Q0gyTe4bR/tu83zSla+5D+s980TTTZV3
         e+Bes2raF6mNN9R6Kn0jZKkyb70MyFlCAH2eaHEL1bFS3JxD5o6dkK/vudzeg1/chLkQ
         Wz6Qz2l5QsNNJev1lh3VlWNb/eX8Z24RsNJeistMa5dqzReMh5NGEJuvDhVIjAPTDnt8
         WSQc1HujrjJhY9/afRUxKJAIXYM3R/HsSpXeEg+dolQyM6EMcHGM5Lnf3Kt19XLtkv5l
         qv6zjk3mdnpHmoEvDQTspYFch0XsyvH1v8R7u9URe2XNJV/9eVJOvcKjhkp33I44WnLB
         2e9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729862965; x=1730467765;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ssdldt32CTCE+WMld7vM73WalSnHDIVMu7Ccn9x+ixI=;
        b=iEJ3bSwYIzcxzXI+yWrrIM8ejNU6Bd2jESSujWSvEFCfn2HUivBDy7xjm54478Gtbg
         nSoEQjyiS3NbVoNh00rhvmmdvDsukT5ofN+N93czstXUDHISQIbV7EyNC0yQydqz+TU5
         FLtLBgyiI99XqaJTE0DEKTi4SwsRXFa96wf+BWGBA8AGYX8p0iK7vXghf3mXJ02oMFyH
         cjL9+a44uIknCJEhx04TrIuZBJO4f+KAkJzF/A2zRCwzWB9sIJwL2jIq4Eb+IF3SP4C9
         ZobJEqzNIrvngMmHpFgD90C5EbDM7NOQFFyAVRGizkDdojxSqJjgQJB3dyKwJRBQM3RM
         7DKg==
X-Forwarded-Encrypted: i=1; AJvYcCUNPwzOSw91YGD3xbtylcftHC3uIcHiwoNnfU2ihOHo368+ZrGViln/Bf3rQrKeKJwCTw7ba+YO84zQFhukCA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxroPi4iOgu0tganRZF6dfrtgEZfIMf3L5XFnfkrSK/pglmEFdu
	ZJlRau7wyENsSECgQGI0TXuyDtHwXhiY03sESVZtBbtk/1Doz/U0rRGt2XDc/wVc5LGe8sx0gE9
	8qJxpe6NxO3gIcgy2KJC07zcptw50Njmsoq4W
X-Google-Smtp-Source: AGHT+IFWQ9WxAyFdlw+F4OTkoqcMFRUkmBEtLLbjSqp8ln7PLuR6wRsW9vveQR5fSH+5v9gK2qIWd23wOzNjv9x/+Rw=
X-Received: by 2002:a05:690c:101:b0:6dd:cdb9:cf2a with SMTP id
 00721157ae682-6e85814cd0bmr54305587b3.1.1729862964762; Fri, 25 Oct 2024
 06:29:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1728029499.git.pabeni@redhat.com> <CACGkMEvV0gtvgpb7z1MqJLKzHm-Be_8hkf0GzqqsFsfDG8oAeA@mail.gmail.com>
 <d34f50af-4042-44c6-90e1-0acbbb899e96@redhat.com> <CACGkMEvrowr6CwF+=RiR+f3EagdKB=rzyCPCQcUdXee4a5MaZA@mail.gmail.com>
 <2b90c368-b514-4077-a6bf-43da075af4fc@redhat.com> <CACGkMEu5GWZrYVRN==F=vrRQQGnxj_WqX86YZ+diqC3s3m2m_A@mail.gmail.com>
 <10bc51b2-efbe-4f33-a1b3-827de4d0cd10@redhat.com> <CACGkMEuhJXMd0hGopyehESO1eNVRXVX+FaF7m8f6Y9yWCzoESA@mail.gmail.com>
 <44be2d9c-5624-4419-8e9c-e5302a5f6b2f@redhat.com> <CACGkMEsgJT1c93RZur20fUyjtxSX6dMPePEJvzbmNWpAHd92Mg@mail.gmail.com>
 <3e3d6984-65d3-46b0-aaa3-e6591123f95a@redhat.com> <CACGkMEsiRJ2zAcys0iFQkiL0h9MY-LOE4=LP7s4ksN=T+HY_Xw@mail.gmail.com>
 <7f40f3da-aa6e-437c-af73-97e44e1982d1@redhat.com> <CACGkMEu-83JEcs73R4Eym2tkcUT5Zsj7i2qOsB-9ivmLNf0b5g@mail.gmail.com>
 <5da197a8-a022-4c2d-a4ae-09e0948e620e@redhat.com> <CACGkMEu-AQea98e5xqj4Vfo4zog_nzeJQ_pLADAOY9ZogsS8AQ@mail.gmail.com>
 <a6ad7c40-d65d-4b95-a7ae-86d77eda4bdf@redhat.com>
In-Reply-To: <a6ad7c40-d65d-4b95-a7ae-86d77eda4bdf@redhat.com>
From: Willem de Bruijn <willemb@google.com>
Date: Fri, 25 Oct 2024 09:28:46 -0400
Message-ID: <CA+FuTScZXfqm+Y=i6MY4QFCwZnoBg4EG4jZktvX9Y5G5FeoRHg@mail.gmail.com>
Subject: Re: [PATCH v9 1/2] virtio-net: define UDP tunnel segmentation offload feature
To: Paolo Abeni <pabeni@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>, virtio-comment@lists.linux.dev, 
	maxime.coquelin@redhat.com, Eelco Chaudron <echaudro@redhat.com>, 
	Stefano Garzarella <sgarzare@redhat.com>, kshankar@marvell.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 25, 2024 at 7:50=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wro=
te:
>
> On 10/25/24 10:28, Jason Wang wrote:
> > On Wed, Oct 23, 2024 at 12:56=E2=80=AFAM Paolo Abeni <pabeni@redhat.com=
> wrote:
> >> I proposed the following:
> >>
> >> For GSO over UDP tunnel VIRTIO_NET_HDR_F_DATA_VALID is allowed if and
> >> only even  VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM is set in flags.
> >>
> >> That means that the device supports csum offload for both the inner an=
d
> >> the outer and both csums are valid. The corresponding skb will have
> >> CHECKSUM_UNNECESSARY and csum_level =3D=3D 1.
> >
> > Nit: csum_level seems to be Linux specific.
>
> Note: the above was an informal description of the proposal, not the
> actual wording to be used in the spec.
>
> >> There is actually another point which I'm quite scared to mention
> >> because it caused v9 and implicitly all this discussion.
> >>
> >> I want to prevent the driver receiving from the device GSO over UDP
> >> tunnel packets without csum_start/csum_offset, because the header
> >> probing code looks fragile and bug-prone and will be even more complex
> >> in case of tunnels.
> >
> > This needs more thought. For example, it seems not specific to GSO.
> > Should we have a new feature for this? (And build a GSO UDP tunnel on
> > top?)
>
> Double checking I read the above correctly.
>
> Do you mean something alike the following to negotiated another feature
> controlling a new bit in flag telling 'the csum_start field is set even
> if NEEDS_CSUM is not set'?
>
> What about using the flag already defined in patch 2 instead (currently
> named VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM, possibly a different better name
> can be used [suggestion more than welcome])?
>
> The overall schema will be:
>
> - DATA_VALID retains its current semantic when GSO over UDP features are
> not negotiated and when VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM is not set
>
> - when VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM is set that means the following:
>   - 2 checksums are offloaded - the 2 outer-most one in case the packet
> carries more nested headers.

Is this on transmit, receive or both. Can we be very explicit in all cases?

>   and
>   - 'csum_start' points to the innermost offloaded header
>
> - DATA_VALID can be set together with VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM,
>   meaning:
>   - CHECKSUM_UNNECESSARY with csum_level =3D=3D 1,
>   and
>   - csum_start -> inner transport offset. If the packet carries many
> nested headers csum_start points to the 2nd outermost one.

Given LCO, is there ever a compelling reason to support offload of more tha=
n the
inner checksum?

And iff there is, can csum_start imply the innermost offloaded header, such
that all checksums preceding it have been verified, rather than hardcoding
this as exactly 2?


>
> - VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV{4,6} can be set/used if and only if:
>   - NEEDS_CSUM is set (csum_start/csum_offset avail)
>     or
>   - DATA_VALID and VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM are both set
>     (meaning 2 csums are offloaded and csum_start is avail)
>
> Note that even the following will be also allowed:
>
> VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV{4,6} is set, NEEDS_CSUM is set,
> VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM is set.
>
> meaning it's GSO over UDP tunnel packets, with both checksum offloaded
> and CSUM_PARTIAL.
>
> WDYT?
>
> Thanks,
>
> Paolo
>
