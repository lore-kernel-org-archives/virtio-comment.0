Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6974C1EB4B4
	for <virtio-comment@lists.linux.dev>; Fri,  2 Aug 2024 03:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722569437; cv=none; b=r2Vz1+JrBoWGec6wMZFVvGO0/2UR7dvbFGr15LNGpLdPTwsbyml5LezCSOEY5I13aQThN8fzvG7lvLFVbYM8XzgerqBoZzsCN/iVONeecfmL9wrB/gmw89EvxakIlZwAoP5EY/7ZN0NboIbh8U71WzpG44YxF0OUMg9Rjf/OxvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722569437; c=relaxed/simple;
	bh=6QSZmXiLMwqI9WUBTcFLQaMZHuCRq7wpDfK+tAH8a6o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ye+9GFbFQ6P5OkAXhPOvl0bd8Q35fUpUf6HHX4fzE0RONus4uGeFhbHotIl7grmS8rSmS8/RvZoe/VGMnmMXj1EbBdjzdA5fg4J0Xq70CzMhIbniHn7EVb5jajZVvm382vjRnvpqbC25tr4sMOpjxEuangohVY48b0xDX4kZLOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IlXPCEEe; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IlXPCEEe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722569435;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VAMsP/LeLGtiGqI8rI4ltyFH4zV6PKJ1Gd1nKXZZC/U=;
	b=IlXPCEEeHxwgUdlNDEJcqL6AYVsI3vrqGYOBVSSRsdlH06CJHkpThC2flZScIejEGr3oq9
	LdTbsUQu5No2D3bwPMOiWDRcHRr2vyc59/wC7O9SP5kzMeBRDBnsTK9pvvGXqqp87INbVn
	XW/+Ly/0RflznObQ7BlnBno2bGm/mkU=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-272-qKcZdrR3MCiCXM0O9BXOgw-1; Thu, 01 Aug 2024 23:30:34 -0400
X-MC-Unique: qKcZdrR3MCiCXM0O9BXOgw-1
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2c96e73c886so7647850a91.3
        for <virtio-comment@lists.linux.dev>; Thu, 01 Aug 2024 20:30:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722569433; x=1723174233;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VAMsP/LeLGtiGqI8rI4ltyFH4zV6PKJ1Gd1nKXZZC/U=;
        b=md04yuppVD8AWAU0bVOVdgR2CV1x/NYb3F042oqSOUq/ZdL72PAxdSaJMqqX0yNdkN
         H26jekgHlubh/lOb/p9pdHW6E/Cu/KUhMlQxsNgjjApzO9YsJhUdOEu+0XTlwGn+iNrM
         cVSnYnnsc/2CkZd/uib/Y4t4/KAdOTRt086KtNi2TrJRIsfTnWn/g6mJNkJsIad4IQK0
         QhP6MdOR9x7GHS6Ml8THtmoEWILRVnNE2HkHHdoGECQvX3L7ZkjZA9CtU23MzzTTK2UF
         eXYK2RRUYum815eFnpXiWGw8oBCE/WlPk+q3fTEvqQDFfs7uny+P9dLBAWNeQp4G9MBF
         9Jfw==
X-Forwarded-Encrypted: i=1; AJvYcCU2G6AUWQnvrLdpfU25oKhFfuUeWAcRcy+dBKlfzN+tmS+p5bWwpta0QOcwLmffBVxnaeMDDRSrf8MBvbaeAa5K1yzDpO7MCNIb1BVRWck=
X-Gm-Message-State: AOJu0Yy1b7Vvowdb8ew+MUctnRyFaqK2GkLPIPWPDo47oJfb9ScEGqnn
	VWxDDiu34yyqDopr4NHIXgWjzyFx/iOPpTyHzUNzG4JBizt9MQQOWVD+ZhmigWUc8QlhPehT2/X
	6l0DtDkt2/6HXENInJfLrcrnm11DDtgYwy6g3Txem1P4rq5El26uEncuNg8Y3BdeHBxHQF9Acd3
	iTihgBv0FP7H2gpRWL9yyNtOOXWDGss/EwmUbd/q4=
X-Received: by 2002:a17:90a:a38d:b0:2c8:f3b4:421 with SMTP id 98e67ed59e1d1-2cff93d40d9mr2953791a91.4.1722569432966;
        Thu, 01 Aug 2024 20:30:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHdthWi6U6O2fV9F2xR9VB1T2xdTeX71CBKLoKAqQb6a74f2BQj79mvBU1iov8QeGXiT0HVcJXb67GbT8eD68Y=
X-Received: by 2002:a17:90a:a38d:b0:2c8:f3b4:421 with SMTP id
 98e67ed59e1d1-2cff93d40d9mr2953751a91.4.1722569432138; Thu, 01 Aug 2024
 20:30:32 -0700 (PDT)
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
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 2 Aug 2024 11:30:21 +0800
Message-ID: <CACGkMEs84aVTUM8BE3yus8EgDrbfLatqk5wqbtW7142tTWAfpQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] virtio-net: define UDP tunnel segmentation offload feature
To: Paolo Abeni <pabeni@redhat.com>
Cc: Willem de Bruijn <willemb@google.com>, virtio-comment@lists.linux.dev, 
	maxime.coquelin@redhat.com, Eelco Chaudron <echaudro@redhat.com>, 
	Stefano Garzarella <sgarzare@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 2, 2024 at 12:26=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wro=
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

Yes, I think this makes sense.

>
> How would you define VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IP4 and
> VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IP6?
>
> Thanks,
>
> Paolo
>

Thanks

