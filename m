Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8649132111
	for <virtio-comment@lists.linux.dev>; Thu,  1 Aug 2024 03:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722482084; cv=none; b=kJwNmw1ZGSpkihArDvf424JOPMrRq83CCfpiDOMixoX366aOGFEce4n9f739+Q0jhgSBuo6SnNY099Do9BZANVlIATKPwudSM7mboFOlGRMtWN3dBOu/C0PtFzY9VO5I97corC4A2n5pM1d3C4SAc1mpRjhiAa0V5Ph3gRT8Zgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722482084; c=relaxed/simple;
	bh=jEKNs0SPHwhx6m7Bt7lLFCEKaJ046b5T7oh4FFkIPmA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X0tfxBTYKA5IbjaaFf0/wWmZ8+YBiiFFMszISEMeltC6SeuZi1Ijz8YzBbOiAiEN+jR0QI7nv7MC5JoNInqYktFFGgeD6xhBIiotpx3A5i7B3m6SUqsNTHzehSIwFWhTaH8t4VhMpA5qTGQqtYfo0ZAel1i/AToz5CAmg4+fw8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=D3jbGmNY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D3jbGmNY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722482081;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zllglvmxcaJtH9ibCzCFX9edG1ONuPPoc5u732u84eU=;
	b=D3jbGmNYb2AlJN6+/XutFczjz8uCUTrXuB1yC3GXp34czfOhkRu+xEw8mJ9tq8YKOT7A/m
	yfYEuHaDv7qeg2dvhlPJnDxxXoKjln6ajtZ5b2uu3FJ0PmFvBUCK50Pg/XEZXVUrqnXtUR
	JRLApmUeCuRyU1XfI8YMekSNm0c036Y=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-636-duZ6s0t8MuSNF2eoYOfgbQ-1; Wed, 31 Jul 2024 23:14:40 -0400
X-MC-Unique: duZ6s0t8MuSNF2eoYOfgbQ-1
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2cd2c7904dcso6500051a91.0
        for <virtio-comment@lists.linux.dev>; Wed, 31 Jul 2024 20:14:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722482079; x=1723086879;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zllglvmxcaJtH9ibCzCFX9edG1ONuPPoc5u732u84eU=;
        b=B0Ax8G9R2P3JXIr927HAkTBNPOXC+/VNAXru2UYi6/TLlhUeVRCMH45EcZJKsZD7Np
         1ODnAgY3T0dBIGO2HQ/XCp8SXClgCCl9Df+4bNSuu+DQU+Fd7Zgq5RbQLmgFqNJ4aR5U
         jgUB1UkAugb1HIsNULK+8CRDPEw4ZPZa+Ow1IEMNnieNDhf7GcR2UDac6sU4jJKQqIYP
         YjoyokII7fxo22RsnCrOx5YhVN5gCRPvNavTJ03DwBprThGDeM8/6VMJY8aOuJUfJdYx
         WfbLefrYBza10vkG1GVydgYD0IQbz13WwxLdLyWcUTfyGT1KF3FLF5WSOvu6n+n7Tanx
         wOIg==
X-Forwarded-Encrypted: i=1; AJvYcCXwvhxmtiPy9ez1Ry3L+psOo8Mtyd5n62abizfc8jWNLeV6gk/b53f6YatrmgG1kWfPiez9H/8Z4IDaVOUekA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzDQdEjmtlyO9v/P8B8hg8qZgoGnyH6hliAMToG7T/E9RFTt9Ge
	Gh6aKqQ2r8i15acJnNraMensy2kB0BKZBeodBAYEqvutjZSgIYvKs9VeeOSF16nndb4xoX37Hdi
	0StWITHgjG+mJA8RR4yYj28LFAPy1j8RLJGqTlUW86s+Z8O+O/USUQgcFfQGatIYImQpQml/jKX
	M/ifHp9OH2ZD/vfBrPvgvXk54/YbujNwS12JbF/7YgX6ereJ5Sv5HG2HM=
X-Received: by 2002:a17:90b:1c06:b0:2c9:5a85:f8dd with SMTP id 98e67ed59e1d1-2cfe7884e5fmr1538876a91.18.1722482078920;
        Wed, 31 Jul 2024 20:14:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF3NR4b9TP9luMfYGJ7OyoVhQ2BDLLDxXdRaf4hJxty6GcNfZoHQckAFN1dRSqTZCUvpd3YqyAy8Soq7q4/K/c=
X-Received: by 2002:a17:90b:1c06:b0:2c9:5a85:f8dd with SMTP id
 98e67ed59e1d1-2cfe7884e5fmr1538857a91.18.1722482078356; Wed, 31 Jul 2024
 20:14:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1722252302.git.pabeni@redhat.com> <2977107dcc842c0665227f7c3696157ecd15a1b2.1722252302.git.pabeni@redhat.com>
 <CA+FuTSfu8Sys_s+3jpXoS0GbZC4stOVgBrEYOtA9YoTCEJkJAA@mail.gmail.com>
 <d79c4ed9-c1d5-4c9c-9f10-661745edf96c@redhat.com> <CACGkMEu6dnKOgYVYRWKadXirnk4R6Rc16ojNR=oSX-a22Rt4OA@mail.gmail.com>
 <db018dea-d186-40e7-88e6-e493fa3c24ab@redhat.com>
In-Reply-To: <db018dea-d186-40e7-88e6-e493fa3c24ab@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 1 Aug 2024 11:14:26 +0800
Message-ID: <CACGkMEuMQdrGmKhKw23mXab3K=Wad=5N+LWhrRVxkLBikh7OZw@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] virtio-net: define UDP tunnel segmentation offload feature
To: Paolo Abeni <pabeni@redhat.com>
Cc: Willem de Bruijn <willemb@google.com>, virtio-comment@lists.linux.dev, 
	maxime.coquelin@redhat.com, Eelco Chaudron <echaudro@redhat.com>, 
	Stefano Garzarella <sgarzare@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 31, 2024 at 5:02=E2=80=AFPM Paolo Abeni <pabeni@redhat.com> wro=
te:
>
> On 7/31/24 06:10, Jason Wang wrote:
> > On Tue, Jul 30, 2024 at 3:33=E2=80=AFPM Paolo Abeni <pabeni@redhat.com>=
 wrote:
> >> On 7/29/24 23:04, Willem de Bruijn wrote:
> >>>> @@ -423,6 +441,9 @@ \subsection{Device Operation}\label{sec:Device T=
ypes / Network Device / Device O
> >>>>            le32 hash_value;        (Only if VIRTIO_NET_F_HASH_REPORT=
 negotiated)
> >>>>            le16 hash_report;       (Only if VIRTIO_NET_F_HASH_REPORT=
 negotiated)
> >>>>            le16 padding_reserved;  (Only if VIRTIO_NET_F_HASH_REPORT=
 negotiated)
> >>>> +        le16 outer_th_offset    (Only if VIRTIO_NET_F_HOST_UDP_TUNN=
EL_GSO negotiated)
> >>>> +        le16 inner_protocol_type;(Only if VIRTIO_NET_F_HOST_UDP_TUN=
NEL_GSO negotiated)
> >>>> +        le16 inner_nh_offset;   (Only if VIRTIO_NET_F_HOST_UDP_TUNN=
EL_GSO negotiated)
> >>>>    };
>
> [...]
>
> >> If we would have VIRTIO_NET_HDR_GSO_UDPv4_L4 and
> >> VIRTIO_NET_HDR_GSO_UDPv6_L4 variants, we could avoid entirely
> >> 'inner_protocol_type', as the network protocol will be implied by the
> >> GSO type itself.
> >
> > I may miss something, but can it be done by just introducing a new
> > gso_type without vnet header extension?
>
> Yep, that is what I mean above: we could replace the
> 'inner_protocol_type' field - which carries a single bit information,
> inner ipv4 vs ipv6 - with some (inner) GSO-type related info.
>
> Unfortunately that last step does not look 110% 'clean' to me, as the
> inner GSO type is already specified by VIRTIO_NET_HDR_GSO_TCPV4,
> VIRTIO_NET_HDR_GSO_TCPV6 or
> VIRTIO_NET_HDR_GSO_UDP_L4. In case of inner TCP, the inner network
> protocol is already specified, but it's not in case of UDP.
>
> I'm wondering: why the single VIRTIO_NET_HDR_GSO_UDP_L4 value has been
> preferred to a pair of ipv4/ipv6 variants? Could we add such variants
> now? Note that I would like such option very much, as it will make this
> change even more complex, but looks IMHO quite clean.

Actually, I point out that when it is proposed. And I was told that it
is because Linux doesn't differ that.

>
> Otherwise another option would be to allocate another bit in the GSO
> type field, set such field when VIRTIO_NET_HDR_GSO_UDP_TUNNEL is set,
> too, and use such field specify the inner header network protocol. I
> don't like much even this option because the new bit will carry
> duplicate information in case of TCP, and it's implementation looks bug
> prone.
>
> I don't see other options, any suggestions/preferences welcome!
>
> Thanks,
>
> Paolo

Thanks

