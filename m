Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25C2EC8FF
	for <virtio-comment@lists.linux.dev>; Wed, 31 Jul 2024 04:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722399065; cv=none; b=CjMBnX9GdgRPgWPwPiFYzKNr+uSbtleNKXZzFaaArA8osQKCLHXM1+8FtPGqXcuuw6PiIVjAem3rg5Wj1Stg8G16f5pc4hWcCwvbnET2uHeps4MKDwid6KziGptl/1vWZfnSKpW0Rkrw3jgSOtTooNEstd9cLOJ2QkRN8ooSCLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722399065; c=relaxed/simple;
	bh=ClDxbPNF0UYEbS+p3CXx9nfJVyRu0dlOr9CnAt9aLfw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YqxvIqTeinLPQI5engZ2BdLJiR0S2rQD0jF/4phaPX3IxQhs7NG+R+yjp17BVAanQIQhBzEZxcDzpxMOEBzx63aJEa6pyRNg3dek6hrjtWC4JBueUpb4ClQ8+fpkagnBBvZAmU/TcGjrITcGcRVmhp8vcu99Iq7YWqhdfhp1qAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KVn5M1Lp; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KVn5M1Lp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722399061;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h+UTKLX6fXDvBxNpSDfhiKTq1iJawCgm57T6bgFFt5U=;
	b=KVn5M1LpvnWquw0lNPvHhVnS1bjd6NF4jegXlCl70uW4DctGVT8dL3Z+tJpZPeW9Qeos9x
	SWogA7l2KRsBhVhoXzvVahxqBHimOkW+ghPhjtHpgNlqCJM8t8CY2zNHb5bBVU50uG8zBW
	VjrasBZR0wn4D1bZGiLpEmHiJ6eosEQ=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-232--k1bCYVyNrGHRc-PXDW-eQ-1; Wed, 31 Jul 2024 00:11:00 -0400
X-MC-Unique: -k1bCYVyNrGHRc-PXDW-eQ-1
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2cb6b642c49so561876a91.1
        for <virtio-comment@lists.linux.dev>; Tue, 30 Jul 2024 21:11:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722399059; x=1723003859;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h+UTKLX6fXDvBxNpSDfhiKTq1iJawCgm57T6bgFFt5U=;
        b=cAqR2TOj4eZL1Z5y9hZOm+Y/btDvQGqFmT7FyJJTMAQEWk68qqjNE0J6l0S4igg3LS
         PlAp3rxVrJutWQz+4kob7G0wnvONSHj/XHzElKgrKIBCE39vy+xAPir7MQpnehb60IEy
         sRi4O4TTzLDXpz+ipWLjqVV/t/U4XD5id+1p6jeWhaxcEaFxl427CF3bUY7f9QTQ/GYZ
         E9YnVcIP5ge6Eh7zcPBq7ZASpbch3oc1G00TqlKGanqFFA8IiLW5xSFpMd6eoGoFtRQZ
         rFG4JmwMkKCkwBcRt4efd78FWSlOjstbOyk0q7gUk7Oy+hZqcFi1FTUnFGlJAOkp1aVK
         UkCw==
X-Forwarded-Encrypted: i=1; AJvYcCWGuMcFL6Zkse3rObr0RzzAMPIBtsQll7s+B4MGvmWqCF3V8hpAU078Te+7sFUPLVDSK2aBNxC85ax5/2tLMPwluos9C1wIf9F7b1Uxmvc=
X-Gm-Message-State: AOJu0Ywg3GfVF09OLuWFxYxvslYIQ+Bhy90VapibAq5ZPLLdcs8+/UYo
	/hMQnQHDSR4dZ0I03Q5+scuxczpa275SBi2iOA00eu7SzIn4BraUfagWb+vfiMJEj62kM4mJ73I
	LFhbYmsSW+mM0ilYXiyZ8WwODsNaOgbeNC69PCRZDlG5RiTIQf9fXiwq3L+c9IugJtvq22ntFuQ
	iyTFVSBkNA5uX6PQBNnHd5Qi4kubJ5/isxz2FwQ4U=
X-Received: by 2002:a17:90a:ae11:b0:2cb:5883:8fb0 with SMTP id 98e67ed59e1d1-2cfcab87f83mr6393633a91.14.1722399059347;
        Tue, 30 Jul 2024 21:10:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2LM545Ix9/2prfICWWc1+uiIChp5cgRWLB1wEbN0Lga6HYGeRTp+SUd5CFJTuBgoU3invmPfXqcLvgLAbF2M=
X-Received: by 2002:a17:90a:ae11:b0:2cb:5883:8fb0 with SMTP id
 98e67ed59e1d1-2cfcab87f83mr6393604a91.14.1722399058808; Tue, 30 Jul 2024
 21:10:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1722252302.git.pabeni@redhat.com> <2977107dcc842c0665227f7c3696157ecd15a1b2.1722252302.git.pabeni@redhat.com>
 <CA+FuTSfu8Sys_s+3jpXoS0GbZC4stOVgBrEYOtA9YoTCEJkJAA@mail.gmail.com> <d79c4ed9-c1d5-4c9c-9f10-661745edf96c@redhat.com>
In-Reply-To: <d79c4ed9-c1d5-4c9c-9f10-661745edf96c@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 31 Jul 2024 12:10:47 +0800
Message-ID: <CACGkMEu6dnKOgYVYRWKadXirnk4R6Rc16ojNR=oSX-a22Rt4OA@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] virtio-net: define UDP tunnel segmentation offload feature
To: Paolo Abeni <pabeni@redhat.com>
Cc: Willem de Bruijn <willemb@google.com>, virtio-comment@lists.linux.dev, 
	maxime.coquelin@redhat.com, Eelco Chaudron <echaudro@redhat.com>, 
	Stefano Garzarella <sgarzare@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 30, 2024 at 3:33=E2=80=AFPM Paolo Abeni <pabeni@redhat.com> wro=
te:
>
> On 7/29/24 23:04, Willem de Bruijn wrote:
> > You have a working software implementation, right? Will this be sent
> > (as RFC) to the public netdev or so mailing list before this becomes a
> > standard? I assume that there is a standard process for virtio that
> > you are following. I'd just be more confident in a thumbs up if we
> > also review the code that implements the text.
>
> My plan is to write the S/W virtio_net implementation, too, but it's
> currently not ready. I had a working PoC for the first draft of this
> changeset, long time ago. Things are changed enough that I'll need a
> rewrite. I can try to shared such a thing on netdev ASAP (where "soon"
> here is a very relative terms ;)
>
> Also I don't know the standardization process. I hope for some guidance
> from Jason and/or Michael.

It should be something like this. When there's no future comment, open
an issue https://github.com/oasis-tcs/virtio-spec/issues and ask for a
vote. When it passes the voting, it would be merged.

>
> >
> >> @@ -423,6 +441,9 @@ \subsection{Device Operation}\label{sec:Device Typ=
es / Network Device / Device O
> >>           le32 hash_value;        (Only if VIRTIO_NET_F_HASH_REPORT ne=
gotiated)
> >>           le16 hash_report;       (Only if VIRTIO_NET_F_HASH_REPORT ne=
gotiated)
> >>           le16 padding_reserved;  (Only if VIRTIO_NET_F_HASH_REPORT ne=
gotiated)
> >> +        le16 outer_th_offset    (Only if VIRTIO_NET_F_HOST_UDP_TUNNEL=
_GSO negotiated)
> >> +        le16 inner_protocol_type;(Only if VIRTIO_NET_F_HOST_UDP_TUNNE=
L_GSO negotiated)
> >> +        le16 inner_nh_offset;   (Only if VIRTIO_NET_F_HOST_UDP_TUNNEL=
_GSO negotiated)
> >>   };
> >
> > In relation to the above: I recall that expanding the virtio_net_hdr
> > was non-trivial when I last tried to add fields ("[rfc,2/3]
> > virtio-net: support receive timestamp"). If that is the experience
> > again, it might be worthwhile to expand with enough space to also
> > accommodate a few subsequent extensions. Headroom is not that
> > expensive.
>

Yes, but it looks like an independent issue for this.

> Do you mean, by adding 'padding' or 'unused' fields?
>
> Side note: the above is not 32 bit aligned, do we need such aligment?

Maybe, but it should be an independent topic.

> If we would have VIRTIO_NET_HDR_GSO_UDPv4_L4 and
> VIRTIO_NET_HDR_GSO_UDPv6_L4 variants, we could avoid entirely
> 'inner_protocol_type', as the network protocol will be implied by the
> GSO type itself.

I may miss something, but can it be done by just introducing a new
gso_type without vnet header extension?

>
> >> +\item If the driver negotiated the VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO f=
eature,
> >> +  the VIRTIO_NET_HDR_GSO_UDP_TUNNEL bit in \field{gso_type} indicates=
 that
> >> +  the GSO protocol is encapsulated in a UDP tunnel.
> >> +  The outer UDP header must not require checksumming, e.g. the outer =
UDP checksum
> >> +  must be zero.
> >
> > nit: "e.g." should be "i.e.," here
> >
> > and maybe must be a positive zero (0x0) checksum as defined in UDP RFC =
768.
> >
> >> +If the bit VIRTIO_NET_HDR_GSO_UDP_TUNNEL in \field{gso_type} is set, =
the outer
> >> +UDP header MUST NOT require checksumming. That is the, the outer UDP =
checksum
> >> +value must be 0, or the valid complete checksum for such header.
> >
> > MUST NOT require checksum validation. [..] or the validated complete ch=
ecksum
>
> Ack to all the above.
>
> Thanks!
>
> Paolo
>

Thanks

