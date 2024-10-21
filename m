Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66621957E7
	for <virtio-comment@lists.linux.dev>; Mon, 21 Oct 2024 06:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729493673; cv=none; b=ghqAZNDbhX5GE0FuQoOASMt1yybjc8fFan3JWYWnxoinNuKy/BJMsXKU7BlkNZs08WI3cOcNP52dl0/4YwYwhpJu1KstehgHN6EUdEZFuNk8vO/2sx2S2Rw/wSMaqCPKXZXWd+9gnyqIPn0fZUr6e/l63pwQY/JvA2VabYKGUvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729493673; c=relaxed/simple;
	bh=2mFZTWJvb1O3SGUg3UoRcz8tcpTML7HJpbEazpISrGs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EyVUs9yOvBxFZIxySO0qnxT7evBSvpy+3PBfURhzpsMJxHzU2EerF5FfPydaUjWIVCmXyvYIX+3IxczY9a05ohVri57HzuJaJcvg4DrOjfQ/Xn/eAIpsGn7sRDicxDOuSNmX00zjeqNelO6CtalEYFoWNLCW57XCUeVkxctONE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=A0Z5bi2F; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="A0Z5bi2F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729493670;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uWFYmZ9/5GjUAwaQudzkw/NhjndyfH0uAPrH2pCDwXw=;
	b=A0Z5bi2FMhrRjcVjcidpBOn6Siw8LL34YRmNKffRkubxr35pD9SSlTRjezHBDciHBsCE+5
	ranyygA9USMp36TDBVnRer6kUP+l+oXZQ51Wwr1QPIV5bmcaTZo/xBw/berC1tDtd79TeR
	MSluTfL6BqDitMPI4glNd6cHdaPk+ZE=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-85-WuNH8msiO5meU3nLwa8lJg-1; Mon, 21 Oct 2024 02:54:29 -0400
X-MC-Unique: WuNH8msiO5meU3nLwa8lJg-1
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-71e578061ffso4819727b3a.1
        for <virtio-comment@lists.linux.dev>; Sun, 20 Oct 2024 23:54:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729493668; x=1730098468;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uWFYmZ9/5GjUAwaQudzkw/NhjndyfH0uAPrH2pCDwXw=;
        b=etCezogLsf3/CXTbPr9b9IxA8Uk5K2LjmVvMFg6vRA/zrMHLtlcCj1YNi38wp60KSR
         sp9XNqA/EKT+kVcuOMpH5cfUZyXo33IAYrIgxnd3KYibyw3arjZ+7nGLtP+8dfbmZCNL
         JqIYeRDGf9l3FQ1B30GYqFkNDQaEKaLzJiPiJebCrJYvfhfUuJUaG+e6conHCWbx9Ojm
         lgcdPa6keymOnXhpVb8z6uWIkwJRLJYvZYJ+DcsYJl57onh2xLdUxvaN1YMGU+r9QSbD
         zz7iEV7SEgrfyWen4cpiWThpjIOcHItKfGqWJeGuwiKBC/dohQDSbZwPVf9SYu1rFIvg
         lkZw==
X-Gm-Message-State: AOJu0Yzt3Wp5ZLZunPQSzDWTqonor22LVUF48T/1wvo3zlN2ImcZhuPO
	ibGaFxJWcrfTD3HVqnuN8RjGjafSeGTPKRSZ4t1TGHIMb/MpjOOZDYjnAFl+t8A/+rb1Vwy22pL
	COQAIlS+MiWpVAvowkcBI/0SyDMsVeZ93/9LnB6Y7iyu6KEB+XAQDkYKs5MJXQZ4L13bqBjq50J
	hHV3xCdwDDeTTxerI08jP8QqT+2z4tRcwh+KtHxvQ=
X-Received: by 2002:a05:6a00:14c4:b0:71d:feb7:37f4 with SMTP id d2e1a72fcca58-71ea31d794cmr15700804b3a.6.1729493667826;
        Sun, 20 Oct 2024 23:54:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZgMbkQjqjU8IGoJgP+Q5wy9UKtMxtszvgmiaudCzvL1cflV9X98bPdP1u0lHcLHcusUHAVaD6Ss/or5ztZ+U=
X-Received: by 2002:a05:6a00:14c4:b0:71d:feb7:37f4 with SMTP id
 d2e1a72fcca58-71ea31d794cmr15700772b3a.6.1729493667327; Sun, 20 Oct 2024
 23:54:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1728029499.git.pabeni@redhat.com> <55306969c73f62bf4d100d15074bfd6cde741417.1728029499.git.pabeni@redhat.com>
 <CACGkMEvV0gtvgpb7z1MqJLKzHm-Be_8hkf0GzqqsFsfDG8oAeA@mail.gmail.com>
 <d34f50af-4042-44c6-90e1-0acbbb899e96@redhat.com> <CACGkMEvrowr6CwF+=RiR+f3EagdKB=rzyCPCQcUdXee4a5MaZA@mail.gmail.com>
 <2b90c368-b514-4077-a6bf-43da075af4fc@redhat.com> <CACGkMEu5GWZrYVRN==F=vrRQQGnxj_WqX86YZ+diqC3s3m2m_A@mail.gmail.com>
 <10bc51b2-efbe-4f33-a1b3-827de4d0cd10@redhat.com> <CACGkMEuhJXMd0hGopyehESO1eNVRXVX+FaF7m8f6Y9yWCzoESA@mail.gmail.com>
 <44be2d9c-5624-4419-8e9c-e5302a5f6b2f@redhat.com> <CACGkMEsgJT1c93RZur20fUyjtxSX6dMPePEJvzbmNWpAHd92Mg@mail.gmail.com>
 <3e3d6984-65d3-46b0-aaa3-e6591123f95a@redhat.com>
In-Reply-To: <3e3d6984-65d3-46b0-aaa3-e6591123f95a@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 21 Oct 2024 14:54:15 +0800
Message-ID: <CACGkMEsiRJ2zAcys0iFQkiL0h9MY-LOE4=LP7s4ksN=T+HY_Xw@mail.gmail.com>
Subject: Re: [PATCH v9 1/2] virtio-net: define UDP tunnel segmentation offload feature
To: Paolo Abeni <pabeni@redhat.com>
Cc: virtio-comment@lists.linux.dev, maxime.coquelin@redhat.com, 
	Eelco Chaudron <echaudro@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>, 
	Willem de Bruijn <willemb@google.com>, kshankar@marvell.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 18, 2024 at 6:10=E2=80=AFPM Paolo Abeni <pabeni@redhat.com> wro=
te:
>
> On 10/18/24 06:26, Jason Wang wrote:
> > On Thu, Oct 17, 2024 at 11:34=E2=80=AFPM Paolo Abeni <pabeni@redhat.com=
> wrote:
> >> i.e. all the checks in
> >>
> >> https://elixir.bootlin.com/linux/v6.12-rc2/source/include/linux/virtio=
_net.h#L97
> >> ..L112
> >>
> >> will be meaningless in such scenario and the GSO over UDP tunnel helpe=
r
> >> code must replicate them with the correct offsets.
> >
> > I don't understand here. It works like a charm for non GSO UDP tunnel,
> > anything that makes it can't work for GSO?
>
> I we chose to use csum_start for the outer header, for GSO over UDP
> tunnel packets:
>
> 1) the 'all headers in linear part' check:
>
> https://elixir.bootlin.com/linux/v6.12-rc3/source/include/linux/virtio_ne=
t.h#L111
>
> and all the need preeceeding algebra will be useless,

This part I don't understand. We still need a validation for the outer
header and we've already done this for non GSO tunnels already.

> as we will have
> later to do the same for inner header.

Did you mean we only need inner validation? E.g in your POC

virtio_net_hdr_tnl_to_skb():
        ...
        /* Let the basic parsing deal with plain GSO features. */
        hdr->gso_type &=3D ~gso_tunnel_type;
        ret =3D virtio_net_hdr_to_skb(skb, hdr, little_endian);

It seems we lose some validation for the outer header.

>
> 2) the 'thlen' as computed by the previous switch statement:
>
> https://elixir.bootlin.com/linux/v6.12-rc3/source/include/linux/virtio_ne=
t.h#L62
>
> will be incorrect if we use csum_start to point the outer header, as
> VIRTIO_NET_HDR_GSO_{TCPV{4,6},UDP} refers to the inner header.

Just to make sure we are on the same page here. I meant having new
dedicated fields/flags for inner. In this case, all the existing
checks were still done for outer check in e.g virtio_net_hdr_to_skb().
And we can do tunnel specific check inside it:

virtio_net_hdr_to_skb() {
      ......
      if (skb is UDP tunnel GSO) {
            do_udp_tunnel_gso_check() // using separated flags/fields for i=
nner.
      }
}

>
> 3) the csum_start/csum_offset assignment performed by:
>
> https://elixir.bootlin.com/linux/v6.12-rc3/source/include/linux/virtio_ne=
t.h#L104
>
> will yeld the wrong values - as they should point to the inner header
> for GSO over UDP tunnel packets.

See above, it just works as a non GSO UDP tunnel.

>
> 4) the gso_size validation checks done under the if statement:
>
> https://elixir.bootlin.com/linux/v6.12-rc3/source/include/linux/virtio_ne=
t.h#L156
>
> will be incorrect - we need to account for the inner

Still, it's the check for outer, inner can have a dedicated check if
necessary. Or if we only need validation for the inner, it needs to be
explained.

>
> Basically all actions and checks performed by virtio_net_hdr_to_skb()
> will be wrong or irrelevant.

See above, if we stick to using existing fields/flags, those checks
would just work as is for the outer.

>
> Instead, by using the virtio_net_hdr csum_start for the inner header,
> all the above mentioned checks are be correct and meaningful.
>
> I wrote a longer reply, addressing every later point, but I fear it
> would distract from the main point using csum_offset for the outer is a
> poor and inconsistent choice.

Right, let's figure out this part first.

>
> Cheers,
>
> Paolo
>
> p.s. I think you got scared by the many checks that the tnl helpers
> implementation carry: such helpers are much more strict than the non tnl
> ones to avoid injecting into the stack packets with bad layout. A
> functional PoC could be implemented without most of them, but I think we
> actually want those additional checks no matter what layout we use for
> the virtio_net_hdr.

I'm totally fine with adding those checks. The main issue left is if
it's better to reuse existing fields for inner or not.

Thanks

>

