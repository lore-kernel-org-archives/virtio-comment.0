Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E2A82899
	for <virtio-comment@lists.linux.dev>; Tue,  2 Jul 2024 06:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719903038; cv=none; b=D4Ilu40FXTFkZTZanm7sxRRJU2GA70ZytK52RvZspkUVYFmwjoeQLQpTKEM6Yw5/cEafTJmHleoI25+EZ1iq3XKnwB0pf0ROs9rvF0YQS8q4XQklhNbIJwV2jZuhaZ5ngl9LOhQ2Cct3e6FYUaQSeAvdtSxaRErS6+6tLW8hRVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719903038; c=relaxed/simple;
	bh=3e540uX4gkoCjcp3dfSuJ5KMIMskd4nYnvvFAx+rGOs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t7TD78+3lcM+zvFRWwFkkLHQicOnl1ostUUI4DVdWTaZb0dhIZvpvnHK33Gy5JlNEySti+rGrI/HN3ejmCM7z+by2nrHuagzP0ZemUiMUksMFnb7IFWtH9I5BoilKBO7IFQi0C5JyC2OxjQMmzFGFD4OdfGzd7/pdGx52kPqOaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DOKibf4P; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DOKibf4P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719903034;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N+LBwYVKXJoSPBtDaARAMVAKXAxjx18OMy3++wlM4PA=;
	b=DOKibf4PTTu+TNwM1nl/Aw+K9PdNfZ0B/a2U/9AyRqG/0GFtlg6tqhL+Q4h10s4h6SvutL
	BAcYeoXhH56ErqsNjxXD4k4ZJfwI7OWFSqgXFYj53y7emrZ1GFv/GMsr5gwV/sez5FZVyu
	L+M/prSRknMRvTDKW6j8y5jn+/MQipQ=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-103-nlpEEwWzOO-l57MeQTWC9g-1; Tue, 02 Jul 2024 02:50:31 -0400
X-MC-Unique: nlpEEwWzOO-l57MeQTWC9g-1
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-3d75c33865bso1741127b6e.3
        for <virtio-comment@lists.linux.dev>; Mon, 01 Jul 2024 23:50:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719903030; x=1720507830;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N+LBwYVKXJoSPBtDaARAMVAKXAxjx18OMy3++wlM4PA=;
        b=Or3nB52sRT9QFCqVcZEwznrtQS5Q/2tRPESz8mepRQ3d2mluKqjl346b13UrCXnbON
         iicRkOYQdJx9xK5QkUWVWKSVBFPTS+C8dwpDOqbm80uHxk/bEPDTSe7aUewafF/ejioZ
         IapKRDAesNwut9TVxh7hwRyG0ww2+jQr2LkCvZAwrXc/Pp7HXYc0tmdgDOVCFRUcBeBN
         k7JyCFhABt1c8SBFQ0o/90LTOfwqovccLU5K/NG1PuApI6IasKI3td3oK9YYAqGq1eTz
         r6exa6rIBj7gymYlbv4/EfBXLoqKeSS0wIvMGlizO/gZFm5IRNEJx2sUO937M0vEgL+o
         8EfA==
X-Forwarded-Encrypted: i=1; AJvYcCW5s2q0bnEeC397Ey1y2ucYW7DV77tkF/kLQUjbilLJY4dsRNOcOeSu60hL4n4jJpg6RL9YWVk7HqcoVi1T6H2HIo/yuSo3lT0P4cmHlGs=
X-Gm-Message-State: AOJu0YxhUY80eJqSl3tbHX+jqet9sSQxYNFFYNrM2oR20qryZTbZ6VWV
	qH9caVWkCOTUmL0TOsrJutPyeLYQD47ra8nusVfD3HqXHggUDHa18HGRwDwTP4qotdCDpqIJPeK
	suPxitwva1rNh44VcjJ0A+OfkeoIvn8yvbpLYs+GpDgm2zYu7OYU0TZDRJn6/xMG25nEOVczpDe
	n9sAxOI8gCmq/6/MyiwWz6P2T8TH5Zm9sDvTDbOQI=
X-Received: by 2002:a05:6808:2187:b0:3d5:6446:33ee with SMTP id 5614622812f47-3d6b37b3c7dmr7931065b6e.31.1719903030171;
        Mon, 01 Jul 2024 23:50:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKjR/LPyaQ/ZwMUPDq6MA5eV8JRLVJQ/p5iQRwfCHjZIigdwrQsjkPmuH8ahPXb6KSn+mO+7egs0QM+pLQbYs=
X-Received: by 2002:a05:6808:2187:b0:3d5:6446:33ee with SMTP id
 5614622812f47-3d6b37b3c7dmr7931044b6e.31.1719903029554; Mon, 01 Jul 2024
 23:50:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <56ccba136272593d0d2af0303600c06f26bd84a1.1718621522.git.pabeni@redhat.com>
 <CACGkMEt-Ep+At_4YvkJ2t8UmQHJ0-Qm6fAPbGpkV_AfVyNq2EA@mail.gmail.com>
 <ed07e9bb9ae5bc1a171c77425cc0b96e6b87745c.camel@redhat.com>
 <CACGkMEvD_WDN5yeRKcZ2ijRF8C2_Pmr6UZWMNt+_R6S0WHY5Fg@mail.gmail.com>
 <e5d885e6331b18b3be63facfd59658b316f20de1.camel@redhat.com>
 <CACGkMEsbiN90ptOL2XHauzWS=9j5RXtnO7OD10yChPaUO3CY_A@mail.gmail.com>
 <2f1c19591ff456ada2a1ad470032d3e3fb9f88d7.camel@redhat.com>
 <CACGkMEv9gGrLO0OkHYKmjqrLw50kfm2yaifMk1wnb6noa5L99w@mail.gmail.com> <4497c727ea6cc696ba7d60bcb95ba9bce33f1136.camel@redhat.com>
In-Reply-To: <4497c727ea6cc696ba7d60bcb95ba9bce33f1136.camel@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 2 Jul 2024 14:50:18 +0800
Message-ID: <CACGkMEu_ODQV6O5-w6Hzg5gk-8x_iRsuWSk4fN2vzznPEYKphg@mail.gmail.com>
Subject: Re: [PATCH v5] virtio-net: define UDP tunnel offload feature
To: Paolo Abeni <pabeni@redhat.com>
Cc: Willem de Bruijn <willemb@google.com>, virtio-comment@lists.linux.dev, 
	maxime.coquelin@redhat.com, Eelco Chaudron <echaudro@redhat.com>, 
	Stefano Garzarella <sgarzare@redhat.com>, Michael Tsirkin <mst@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 1, 2024 at 5:23=E2=80=AFPM Paolo Abeni <pabeni@redhat.com> wrot=
e:
>
> On Mon, 2024-07-01 at 11:02 +0800, Jason Wang wrote:
> > On Fri, Jun 28, 2024 at 5:51=E2=80=AFPM Paolo Abeni <pabeni@redhat.com>=
 wrote:
> >
> > > I think that is quite
> > > a different thing: such offload was added when the
> > > csum_start/csum_offset field already existed, I guess it was far easi=
er
> > > to reuse the virtio net header as is, instead of _deleting_ an unused
> > > field for that specific gso type?!?
> >
> > We probably don't need to delete it. We can just leave it unused if
> > it's the case.
>
> I think the starting question on your side was about cum_start and
> csum_offset for the (outer) header checksum instead of using a new for
> that goal as initially proposed here.
>
> I read your previous message as you considered VIRTIO_NET_HDR_GSO_UDP
> and VIRTIO_NET_HDR_GSO_UDP_L4 a prior art about handling a similar
> case.
>
> My point is that VIRTIO_NET_HDR_GSO_UDP and VIRTIO_NET_HDR_GSO_UDP_L4
> were not a similar case, as when such offload where added,
> virtio_net_header already included all the fields necessary to support
> checksum offload for such GSO, while with UDP tunnel GSO we need to
> support the inner header checksum as for plain GSO and an _additional_
> csum for the outer transport header.

Ok, I think we are on the same page here.

>
> > > To do UDP tunnel GSO we need new fields. Do I understand correctly th=
at
> > > there is concern about adding "too much" new fields?
> >
> > Nope, I just want to know the reason why those fields were not
> > required for non-tunnel GSO.
>
> With plain (non-tunnel) GSO we need to offload a single checksum.
>
> With UDP tunnel GSO there are 2 separate checksums the device or the
> driver possibly need to offload: the inner transport header checksum
> and the outer transport header checksum.
>
> The latter header is always an UDP one, and the checksum there is
> optional - UDP GSO packets can have 0 csum there. Side note: that is
> different from UDP_L4, which always requires non zero csum for the such
> UDP csum.
>
> Using the existing csum_fields for the inner transport header works
> nicely, as it does not change such fields semantic nor handling, and
> does not waste the (variable) offset information.

As long as the semantic doesn't change, it's fine. More below.

>
> Still we need some more info to correctly locate the outer transport
> header and the checksum, without resorting to header parsing. Thus the
> additional field.

Maybe the "parsing" is something that causes confusion. If I
understand it correctly, you meant "driver parsing" here on the rx
side. Unfortunately, for plain (non-tunnel) GSO, csum_start and
csum_offset is necessarily set (e.g in the case of
VIRTIO_NET_F_DATA_VALID/CHECKSUM_UNNECESSARY), so the driver needs to
probe them. For example, Linux driver has this in
virtio_net_hdr_to_skb():

                /* gso packets without NEEDS_CSUM do not set transport_offs=
et.
                 * probe and drop if does not match one of the above types.
                 */
                if (gso_type && skb->network_header) {
                        struct flow_keys_basic keys;
                        ...

>
> > For tunnel GSO, this proposal introduces:
> >
> > inner_protocol: inner ethernet type
> > inner_mac_offset: inner mac header
> > inner_nh_offset: inner network header
> >
> > This gives me the impression that the tunnel GSO (at least the inner
> > part) wants to be protocol independent. This is fine but I don't fully
> > understand why the above is needed. For example, why do we need to
> > know about the inner_protocol?
>
> in some tunnel protocols e.g. geneve, the inner mac header is not
> included. In such case, inner_mac_offset =3D=3D inner_nh_offset.

I may miss something but geneve seems to have a inner mac according to:

https://datatracker.ietf.org/doc/html/rfc8926#section-3-1

> Specifically in the geneve case the inner protocol can be obtained
> parsing the geneve header itself.

Yes.

>
> Other UDP tunnel protocols (e.g. FOU), does not carry the inner header
> and additionally the inner protocol type is not specified on the wire,
> (is configured on the control plane) so there is no way to extract it
> with parsing.

I think if this proposal wants to support the case where there's no
encapsulation header, we probably need to clarify it somewhere.
(Otherwise readers may assume there's an encapsulation protocol like
geneve).

But in the case of FOU. If the control plane has mapped the port to a
specific protocol on the rx side. I don't know how the inner_protocol
can help in any place.

>
> Using all the above 3 fields allow covering all the above use-cases.

Maybe you can give me an example for this.

>
> >
> > > AFAICT using csum_start for the outer csum will be a bad choice as we
> > > will need to change the handling of such field depending on the
> > > gso_type and the s/w implementation will be more complex and likely
> > > more bug prone.
> >
> > Not sure I understand here, but I'm not sure if it's too late to
> > change that. As stated, we may introduce a new robust GSO to replace
> > it anyhow.
>
> Please see the comments above WRT the outer csum handling. At this
> point I suspect we are not on the same page. We need a new field to
> support the _additional_, outer csum offload carried by UDP GSO
> packets.

Yes, I understand we need additional fields for checksum etc.

>
> That csum field will need different handling WRT the inner one - as the
> outer csum is optional.
>
> If we use csum_start/csum_offset for the _outer_ csum, we will need to:
> - introduce additional inner_csum_start/inner_csum_offset to cope with
> the inner transport header csum.

Yes, this seems straightforward.

> - change the semantic of existing csum_start/csum_offset to cope with
> optional csum. csum_offset will carry no useful information, as it will
> be always be constant '6'.

We probably don't need to worry about this. For example, for TSO it
would always be 16? And spec has something like

"
For example, consider a partially checksummed TCP (IPv4) packet. It
will have a 14 byte ethernet header and 20 byte IP header followed by
the TCP header (with the TCP checksum field 16 bytes into that
header). csum_start will be 14+20 =3D 34 (the TCP checksum includes the
header), and csum_offset will be 16
"

> - give to the newly introduced fields couple the exact old semantic of
> csum_start/csum_offset.
>
> I actually went through the exercise of implementing a working PoC on
> top of a previous revision of this proposal. AFAICT using
> csum_start/csum_offset for the outer csum will require a more complex
> and bug prone implementation then the alternative initially proposed
> here.
>
> > >
> > Exactly. My point is (I may miss something obvious) why should we care
> > about mac header offset when we are doing segmentation? For the
> > content from outer payload start to inner transport start
> > (inner_csum_start), the device can just replicate without worrying
> > about what it has.
>
> The inner mac header offset is not needed for segmentation, it's needed
> to rebuild correct GSO packets on the 'other end'.

For "other end" did you mean the general device RX or the case of VM2VM?

>
> E.g. when the device will transmits a UDP tunnel GSO packet, the driver
> will need to be able to build a "correct" UDP tunnel GSO skbuff from
> the virtio net header.

So this seems to require the device to parse the packet during RX and
fill the vnet header. If we need a device to parse the packet, it's
somehow not protocol independent.

>
> Such skbuff must includes both inner and outer header offsets, and in
> the general case (as described above e.g. for the FOU tunnels) we can't
> reconstruct the full inner headers info, even with parsing, without
> inner mac network header offset, inner network offset and inner
> protocol type.

In the case of FOU, deivce doesn't know the inner protocol. How can it
provide inner headers?

>
> Lacking the inner offset, the skb will be corrupted by a later
> segmentation in the guest - if/when such thing will happen.

Do you mean the case of GSO packet forwarding which might require
software segmentation? For plain GSO, we don't require inner
mac/nh/protocol in order to be forwarded or software segmented (or
maybe I miss something again).

>
> > > I don't understand the point 2) above. We need some new fields to car=
ry
> > > the information need for UDP tunnel GSO. How that relates to the
> > > protocol independence? We need such fields regardless of the protocol=
,
> > > unless we want to resort to parsing all the way from the outer mac to
> > > the inner transport.
> >
> > I think we're talking about the same thing, try to avoid unnecessary
> > parsing. So I mean, we don't need to parse from outer transport
> > payload start to inner csum_start. That's why I don't get why we need
> > inner_mac/nh/ether_type.
>
> At this point I'm unsure if I made it clear why we actually need the
> mentioned fields.
>
> > >
> >
> >
> >
> > > can the virtio net header layout be 'gso_type'
> > > dependent?
> >
> > I don't get this question. Did you mean a completely new header format
> > other than the current one? I think the answer is yes if it has
> > sufficient justification but it requires a new feature.
>
> This question on my side sparked from the goal of reducing the
> virtio_net_header overhead. The idea is that a plain GSO packet will
> have the current layout (no extra fields) even when UDP tunnel GSO is
> negotiated.
>
> The new virtio_net_header layout (with outer transport, inner mac,
> inner net and inner proto type) could be used only when UDP tunnel GSO
> is negotiated _and_ 'gso_type' has the
> VIRTIO_NET_HDR_GSO_UDP_TUNNEL bit set.
>
> This way supporting UDP tunnel GSO will not pay any overhead for plain
> GSO.

Ok.

>
> >
> Cheers,
>
> Paolo
>

Thanks

