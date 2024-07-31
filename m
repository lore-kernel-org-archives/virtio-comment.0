Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EABDB1E86F
	for <virtio-comment@lists.linux.dev>; Wed, 31 Jul 2024 18:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722450155; cv=none; b=gdj6st949iodzuC5rV5QLvlVaKkb3bTNBWWEaNtUC1wvSmXcTt3sHuldygyXZ/oHQR/SI17bYBJluqQ1M5J02mr/fpskfw+7muaMiYAxLzTIuLSqO8tpL8MGQKvE7xHE9vNNvSitzoJuAhdijq7tBzKXivGAytvVkCbHncTOj8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722450155; c=relaxed/simple;
	bh=Hzdcg5QGpDI2Usd4tibjTS8X2g/tbRxJQo8iDgB0PL4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vBhFlO++DjUssegoNBbrpx/2ISIND31fxzJOm3yqhZUwuqUAXXbzVynrU0hEukSKN7FwmaHhQck9owQyAThsLX94HGWjQ1UcbcaXc9MaXz+nTfdmH45wlPLML+pRS0pFdJJGYHI04ObXXWMKEUfsQOxzmlpCCtQZDVMrR2uj2+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ftzn2HFH; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ftzn2HFH"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-44fe76fa0b8so410061cf.0
        for <virtio-comment@lists.linux.dev>; Wed, 31 Jul 2024 11:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722450153; x=1723054953; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DkZrPtD6q/LoRU9JVesam2HHzoILQ1FGTJATKTzpNO8=;
        b=ftzn2HFHDmeNrxs1dumM5ALtN1mnajDQfJW6szjUfe84GTPzC4SjVTsKp+Dt89C7oS
         gI+GRngeUUTS9d9RbXnoLeWJrWUm+uhsKkLAc0d3wWFpW1nrgEQgsQhjtvdaIX2ZlCLf
         +kUz4hBUUzahOORiWqsaJt80cYCO1FlGhhSYTLoDIO/cZPPduozSIR0TTsfA4sRtSPz9
         nl6HVW8bmarNY6EN/fNz6zLpzHn7KW2QpNiJLPD+aGHH12wZPk6GJEbAJSPvCjgpfYsK
         /v+Jf0Llt+9iV6Ve2gAFENgVdEzNhPvyoiOO36VJjmrlHlCRdK/z7aQt/vZmwQg7kyVl
         Pjhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722450153; x=1723054953;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DkZrPtD6q/LoRU9JVesam2HHzoILQ1FGTJATKTzpNO8=;
        b=AWl5HxXvKWrd1TFXBi9VjVeDmycHvOA2uufK145usbjV12v5OvWyMazcAw2FkdvGp/
         FT9jdT5wbtANtODOBjTvJcfrPhawBEM1iNejvrFQh7V4ZJPQNw1aEazWAJAzAf4nZbZF
         AW9/B1EHPN0gm3nRwBMsqDI+r/vbj6UGVy3rRCZfztUvQ8lxrG1MuUAJk9zmxFWfl9O3
         IpsIkpgnLi2jvW2uzBVQudN1HJu6eNeO0TiF1Sk09++GgxMmf4S9I2JWnDyFuo8JqUzN
         GpqCNeaopwA5w/qs/QQAtmR8wX/ewwvqGonYE57mDWaGFljm+d7kvgqofGaSuH5eWJxs
         WMNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuq9fDt2uumvbhUDGkG/lIjpb7dG91wVklQPwM3hQHdG60vDyo4fNCDCkeQGlbQGQVUjFIMNPl5zo70kD9x9FrdrXGrJR699Ynsiswpho=
X-Gm-Message-State: AOJu0YzeTOpAzxnN2wy9IYCp6GhdcDxVZWoIQBY4HbVlUEqzeUf4jrlx
	Yn1bXllyW619t7o7B9DjzJxMiSmS0wDB2YoX3RYB0LKcLn8Dxi7lZoHnSfAStIWWsrRPCfOmgYl
	LrYwTDWMJIVpBQ6PTqtXApDQWbdTtENMOBMSK
X-Google-Smtp-Source: AGHT+IFyWOOsc+PWsIPnYnXwGH3iJIr401sB7T9KEqFQsUt4owohTU2e7fogbAEXD5lzWFTc1tpW7iAdwRkNc6u1hds=
X-Received: by 2002:ac8:7dc5:0:b0:447:e04d:51b1 with SMTP id
 d75a77b69052e-4504314cff8mr4249431cf.11.1722450152750; Wed, 31 Jul 2024
 11:22:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1722252302.git.pabeni@redhat.com> <2977107dcc842c0665227f7c3696157ecd15a1b2.1722252302.git.pabeni@redhat.com>
 <CA+FuTSfu8Sys_s+3jpXoS0GbZC4stOVgBrEYOtA9YoTCEJkJAA@mail.gmail.com>
 <d79c4ed9-c1d5-4c9c-9f10-661745edf96c@redhat.com> <CACGkMEu6dnKOgYVYRWKadXirnk4R6Rc16ojNR=oSX-a22Rt4OA@mail.gmail.com>
 <CA+FuTScr26P+QtPfWKzD1zzadKiZ3zRs75KC1ycexdQRAQ0XuQ@mail.gmail.com> <56d62e5a-b7df-43f7-8878-517505345529@redhat.com>
In-Reply-To: <56d62e5a-b7df-43f7-8878-517505345529@redhat.com>
From: Willem de Bruijn <willemb@google.com>
Date: Wed, 31 Jul 2024 14:21:52 -0400
Message-ID: <CA+FuTScunTfXGzpEFEgZcv3FKSzVwSK0vhuO61a=Ui2HybTsJw@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] virtio-net: define UDP tunnel segmentation offload feature
To: Paolo Abeni <pabeni@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>, virtio-comment@lists.linux.dev, 
	maxime.coquelin@redhat.com, Eelco Chaudron <echaudro@redhat.com>, 
	Stefano Garzarella <sgarzare@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 31, 2024 at 1:32=E2=80=AFPM Paolo Abeni <pabeni@redhat.com> wro=
te:
>
> On 7/31/24 16:25, Willem de Bruijn wrote:
> > On Wed, Jul 31, 2024 at 12:11=E2=80=AFAM Jason Wang <jasowang@redhat.co=
m> wrote:
> >> On Tue, Jul 30, 2024 at 3:33=E2=80=AFPM Paolo Abeni <pabeni@redhat.com=
> wrote:
> >>> On 7/29/24 23:04, Willem de Bruijn wrote:
> >>>>> @@ -423,6 +441,9 @@ \subsection{Device Operation}\label{sec:Device =
Types / Network Device / Device O
> >>>>>            le32 hash_value;        (Only if VIRTIO_NET_F_HASH_REPOR=
T negotiated)
> >>>>>            le16 hash_report;       (Only if VIRTIO_NET_F_HASH_REPOR=
T negotiated)
> >>>>>            le16 padding_reserved;  (Only if VIRTIO_NET_F_HASH_REPOR=
T negotiated)
> >>>>> +        le16 outer_th_offset    (Only if VIRTIO_NET_F_HOST_UDP_TUN=
NEL_GSO negotiated)
> >>>>> +        le16 inner_protocol_type;(Only if VIRTIO_NET_F_HOST_UDP_TU=
NNEL_GSO negotiated)
> >>>>> +        le16 inner_nh_offset;   (Only if VIRTIO_NET_F_HOST_UDP_TUN=
NEL_GSO negotiated)
> >>>>>    };
> >>>>
> >>>> In relation to the above: I recall that expanding the virtio_net_hdr
> >>>> was non-trivial when I last tried to add fields ("[rfc,2/3]
> >>>> virtio-net: support receive timestamp"). If that is the experience
> >>>> again, it might be worthwhile to expand with enough space to also
> >>>> accommodate a few subsequent extensions. Headroom is not that
> >>>> expensive.
> >>
> >> Yes, but it looks like an independent issue for this.
> >
> > If this change requires new headroom, then it depends on headroom expan=
sion.
> >
> > My suggestion is to then expand it significantly immediately, to minimi=
ze the
> > number of times we have to change the virtio_net code to support new le=
ngths.
> >
> > We already have structs virtio_net_hdr, virtio_net_hdr_mrg_rxbuf,
> > virtio_net_hdr_v1, virtio_net_hdr_v1_hash.
> >
> > Adding a new struct with every new field added just adds lots of churn =
in
> > the code.
> >
> > Just a thought, feel free to skip if the maintainers disagree.
>
> I just read the old thread WRT virtio net timestamping.
>
> If we reserve additional headroom space for timestamping here, such room
> will be available only if UDP_TUNNEL is negotiated, which sounds a bit
> counterintuitive to me.
>
> I *think* ideally we want a separate virtio net feature for that?

Fair point. Agreed that extra headroom should not be dependent on this feat=
ure.

> Regarding the virtio_net_hdr parsing complexity increase, I think we
> should add to the uAPI a struct containing only the new fields, e.g. for
> UDP tunnel:
>
> struct virtio_net_udp_tunnel {
>         __virtio16 outer_th_offset;
>         // eventually __virtio16 inner_protocol_type;
>         __virtio16 inner_nh_offset;
> };
>
> At feature negotiation time both the drivers and the device compute the
> offset inside the virtio buffer where such struct is placed:
>
> if VIRTIO_NET_F_HASH_REPORT is negotiated such offset is sizeof(struct
> virtio_net_hdr_v1_hash) elsewhere is sizeof(struct virtio_net_hdr_v1)
>
> At rx time, struct virtio_net_udp_tunnel() is parsed from the above offse=
t.
>
> With all the above in place, for every additional later feature we add
> just a struct definition and the virtio_net header parsing complexity
> scales linearly.

Sounds good to me.

> >>> If we would have VIRTIO_NET_HDR_GSO_UDPv4_L4 and
> >>> VIRTIO_NET_HDR_GSO_UDPv6_L4 variants, we could avoid entirely
> >>> 'inner_protocol_type', as the network protocol will be implied by the
> >>> GSO type itself.
> >
> > But that's too late now? Probably don't want to make this work
> > depending on such a change.
> >
> > I don't entirely recall why we did not do that immediately. Perhaps
> > it is related to also only having SKB_GSO_UDP_L4.
>
> I reached the same conclusion here:
>
> https://lore.kernel.org/virtio-comment/cover.1722252302.git.pabeni@redhat=
.com/T/#mac694da6e907451d5529116a97510c940bf2edd9
>
> What about reserving an additional bit in gso_type to specify the inner
> network header protocol?

Similar to VIRTIO_NET_HDR_GSO_ECN?

Is that preferable over VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IP4 and
.._UDP_TUNNEL_IP6 variants?

And to parsing just this one byte (or nibble) from packet data using
inner_nh_offset?

If it's the best of those options, no objections from me. Definitely
no need for a u16 if the only options are IPPROTO_IP and IPPROTO_IPV6.
