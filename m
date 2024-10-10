Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB0F28F6A
	for <virtio-comment@lists.linux.dev>; Thu, 10 Oct 2024 03:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728530261; cv=none; b=B3tL5znjUcZbyWJMHcVkno0bHka9hXtNZmsWHUjekUTWV218UZL1PD0pxurZ2k/xZKOxMz3qQQGp7+CyNy1zxUZESvRRCgdJ0btlLD3qH+7suViUZCmvFS1OEEFJPXVhF9tasFq/PmZi3rcBpdRvasra7Ij7p6Uosj0fqScUWSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728530261; c=relaxed/simple;
	bh=dXgwrixxxlvG2FwAbPQiQouO0AvyVy9+m0qGs3S1Pm0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S261UpV3J/ZgMTqexWuas6DhG+UziHY2SsQKn6TK3uN1G1hOzIJG6n34GP/cSjEYGPZJO8Lef0wA5NrsLNcOjr0nHG1cyrfcDvCGeMsmoyWULdfoVx88GPvUL+rudL8jEI4RGfcp/nm2vSpqw4n0L1xwUi1xmMRvaUXRhDg5wUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=f2LSfOaO; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="f2LSfOaO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728530257;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MpGokQ0Um6dnPfyMAlN2rvL0ej33oOIxU08QtZhm8Bw=;
	b=f2LSfOaOqi9yl6EVPRPvhZaySL0betC3AH4sQW4HObbGzVClb+DEJXxdvYZuATWQtEccUX
	Wrmsic8k149mUE2qLeAy/LLznwB6no+xi2Vp+BcmJehLpZg5LC8Y3OWqkPyWxoRd/vWO0v
	jAOsovytsUlyc5xT/AoYGc0lIZJyOZE=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-313-Q0igb9H-MI64Z9VgpcwMEw-1; Wed, 09 Oct 2024 23:17:36 -0400
X-MC-Unique: Q0igb9H-MI64Z9VgpcwMEw-1
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2e2dbda65e7so58917a91.0
        for <virtio-comment@lists.linux.dev>; Wed, 09 Oct 2024 20:17:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728530255; x=1729135055;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MpGokQ0Um6dnPfyMAlN2rvL0ej33oOIxU08QtZhm8Bw=;
        b=VpBQPNDy2eKICeBIgLi/5C1o3fr+t2ofKKgOyYP8Kz66utGm9HijNaOtE1Dzsgi8s8
         sDL+tHN7qNOVKPclir7BLhC9jJcM7NanL+VqMFOeVP5czmBKMIF52LqYIEokQd7yXgii
         fhmCR7Ereaf5jdG+IL+U84TUBVet378l0N8wNAsFfqWlV2+FtGpmT+1cIKdUkMluDmrh
         lgvYqufeLfw7vFsvrKIcuH39NtPw5glNyNedq86hjsTvwPxSwlQvLkaESNaNEAWzcmLS
         RFUH3hsIe1t58Vy+yWvBur7zFAAJJa1RjAhNyMgC0YuOBQjUV64MrGZeVlH7XUI7IaIY
         RgzQ==
X-Gm-Message-State: AOJu0YxlAeoRFfpKazdISowh8qiVwuDzHXHkBjgThwyAWluNO4YOp2a+
	QNjhiE7DhwpRRl3dts+6axRCQyBuah85xoWfiZ0EwgmLaLS40WdPzhCufUdCtao20sbMIKOQOyz
	3998Gk13utKAuMELKCwlfh5Ss5NiqO/AFCRCzckZB2Z/ls/YF67rKDRXoxOoYIM2KbjSjr6sa83
	jNWCPLv4W2AeaWJzXkXluno5hszAIsKuVjvcXx8RM=
X-Received: by 2002:a17:90a:1b82:b0:2e2:d33b:cc with SMTP id 98e67ed59e1d1-2e2d33b0279mr923181a91.21.1728530254453;
        Wed, 09 Oct 2024 20:17:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE8vjuXo5VlEAwQxTeLlMEueKjqaA6YZvCFNKvKThVx5gQkUhi6VXB3jWVwagsvmBphAg01gyNlWl86SiLqyuE=
X-Received: by 2002:a17:90a:1b82:b0:2e2:d33b:cc with SMTP id
 98e67ed59e1d1-2e2d33b0279mr923156a91.21.1728530253860; Wed, 09 Oct 2024
 20:17:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1728029499.git.pabeni@redhat.com> <55306969c73f62bf4d100d15074bfd6cde741417.1728029499.git.pabeni@redhat.com>
 <CACGkMEvV0gtvgpb7z1MqJLKzHm-Be_8hkf0GzqqsFsfDG8oAeA@mail.gmail.com> <d34f50af-4042-44c6-90e1-0acbbb899e96@redhat.com>
In-Reply-To: <d34f50af-4042-44c6-90e1-0acbbb899e96@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 10 Oct 2024 11:17:11 +0800
Message-ID: <CACGkMEvrowr6CwF+=RiR+f3EagdKB=rzyCPCQcUdXee4a5MaZA@mail.gmail.com>
Subject: Re: [PATCH v9 1/2] virtio-net: define UDP tunnel segmentation offload feature
To: Paolo Abeni <pabeni@redhat.com>
Cc: virtio-comment@lists.linux.dev, maxime.coquelin@redhat.com, 
	Eelco Chaudron <echaudro@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>, 
	Willem de Bruijn <willemb@google.com>, kshankar@marvell.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 9, 2024 at 4:37=E2=80=AFPM Paolo Abeni <pabeni@redhat.com> wrot=
e:
>
> On 10/9/24 09:18, Jason Wang wrote:
> > On Fri, Oct 4, 2024 at 4:13=E2=80=AFPM Paolo Abeni <pabeni@redhat.com> =
wrote:
> >>
> >> The VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV{4,6} are two gso_type flags
> >> allowing respectively GSO over UDPv4 tunnel and GSO over UDPv6 tunnel.
> >> They can be negotiated on both the host and guest sides.
> >>
> >> One constraint addressed here is that the virtio side (either device o=
r
> >> driver) receiving a UDP tunneled GSO packet must be able to reconstruc=
t
> >> completely the inner and outer headers offset - to allow for later GSO=
.
> >>
> >> To accommodate such need, new fields are introduced in the virtio_net
> >> header: outer_th_offset and inner_nh_offset.
> >> They map directly to the corresponding header information. The inner
> >> transport header is implied by the (inner) checksum offload.
> >>
> >> Those fields are required because a virtio device H/W implementation
> >> performing segmentation for UDP tunneled packet will need to touch
> >> the outer transport protocol (for the UDP length filed), the
> >> inner network protocol (for the total length field, in the IPv4
> >> case).
> >>
> >> Note that segmentation will additionally need to touch
> >> the outer network protocol and the inner transport protocol. The first
> >> is implied/easily found with trivial parsing, the latter is identified
> >> by the existing csum_start field.
> >>
> >> Note that there is no concept of UDP tunnel type negotiation (e.g.
> >> vxlan, geneve, vxlan-gpe, etc.), as a virtio device H/W implementation
> >> can perform segmentation for every possible UDP-tunnel given the
> >> specified new fields.
> >> In the reverse direction, if a virtio device H/W implementation receiv=
es
> >> some traffic for an unknown or unsupported UDP tunnel, it will simply
> >> not aggregate the wire packet in a GSO one.
> >>
> >> Signed-off-by: Paolo Abeni <pabeni@redhat.com>
> >> ---
> >> v8 -> v9:
> >>   - rebased on top of virtio-1.4, changed udp-tunnel features number
> >>     to avoid conflicts/duplications
> >>   - fixed typos:
> >>     VIRTIO_NET_HDR_F_UDP_TUNNEL_IPV4 -> VIRTIO_NET_HDR_F_GSO_UDP_TUNNE=
L_IPV4
> >>     VIRTIO_NET_HDR_F_UDP_TUNNEL_IPV6 -> VIRTIO_NET_HDR_F_GSO_UDP_TUNNE=
L_IPV6
> >>   - specified strict validation on RX side (both driver and device)
> >>     for UDP tunneled packet: NEEDS_CSUM and plain GSO are mandatory fo=
r UDP
> >>     tunnel GSO packets. The driver is not allowed to set DATA_VALID fo=
r UDP
> >>     tunnel GSO packets, the driver can set both DATA_VALID & NEEDS_CSU=
M.
> >
> > DATA_VALID and NEEDS_CSUM are mutually exclusive unless I miss somethin=
g.
>
> AFAICS the specification does not specify them to be mutually esclusive
> and at least the linux kernel implementation allow them to be set togethe=
r.

Interesting, where is such code? E.g in virtio_net_hdr_from_skb() we had:

        if (skb->ip_summed =3D=3D CHECKSUM_PARTIAL) {
                hdr->flags =3D VIRTIO_NET_HDR_F_NEEDS_CSUM;
                hdr->csum_start =3D __cpu_to_virtio16(little_endian,
                        skb_checksum_start_offset(skb) + vlan_hlen);
                hdr->csum_offset =3D __cpu_to_virtio16(little_endian,
                                skb->csum_offset);
        } else if (has_data_valid &&
                   skb->ip_summed =3D=3D CHECKSUM_UNNECESSARY) {
                hdr->flags =3D VIRTIO_NET_HDR_F_DATA_VALID;
...

Anyhow, when I introduce DATA_VALID, the idea is to map
CHECKSUM_UNNECESSARY to DATA_VALID and CHECKSUM_PARTIAL maps to
NEEDS_CSUM. My understanding is CHECKSUM_UNNECESSARY and
CHECKSUM_PARTIAL and mutually exclusive.

>
> As a possible alternative to the change from v8 to v9 we can enforce
> DATA_VALID and NEEDS_CSUM to be mutually esclusive.

It seems implied in this part of the spec:

"""
If the VIRTIO_NET_F_GUEST_CSUM feature was negotiated, the
VIRTIO_NET_HDR_F_DATA_VALID bit in flags can be set: if so, device has
validated the packet checksum. In case of multiple encapsulated
protocols, one level of checksums has been validated.
"""

As DATA_VALID is only used in RX path, if packet has partial cusm,
device can't do the validation anyhow. Or did you mean the hardware
that can do hardware GRO, in that case, device should set NEEDS_CSUM
but not DATA_VALID (maybe we need clarify this in the spec).

> GSO over UDP tunnel
> needs the csum_start offset; with DATA_VALID and NEEDS_CSUM mutually
> esclusive exclusive we must either:
> - NOT allow GSO over UDP tunnel with DATA_VALID
> or
> - required csum_start being set with GSO over UDP tunnel and DATA_VALID

I have some comment for this, see below.

>
> Please LMK which one is the preferred option.
>
> >> @@ -639,12 +721,48 @@ \subsubsection{Packet Transmission}\label{sec:De=
vice Types / Network Device / De
> >>          header.
> >>   \end{itemize}
> >>
> >> +If the VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO option has been negotiated, t=
he
> >> +driver MAY set the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or the
> >> +VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit in \field{gso_type}, if so:
> >> +\begin{itemize}
> >> +\item the driver MUST set \field{outer_th_offset} to the outer UDP he=
ader
> >> +  offset and \field{inner_nh_offset} to the inner network header offs=
et.
> >> +  The \field{csum_start} and \field{csum_offset} fields point respect=
ively
> >> +  to the inner transport header and inner transport checksum field.
> >> +\end{itemize}
> >> +
> >> +If the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or the
> >> +VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit in \field{gso_type} are set, t=
he
> >> +outer UDP header MUST NOT require checksum validation. That is, the
> >> +outer UDP checksum value MUST be 0 or the validated complete checksum
> >> +for such header.
> >> +
> >> +\begin{note}
> >> +The valid complete checksum of the outer UDP header of individual seg=
ments
> >> +can be computed by the driver prior to segmentation only if the GSO p=
acket
> >> +size is a multiple of \field{gso_size}, because then all segments
> >> +have the same size and thus all data included in the outer UDP
> >> +checksum is the same for every segment. These pre-computed segment
> >> +length and checksum fields are different from those of the GSO
> >> +packet.
> >
> > How could a device know if the checksum if pre-computed or not? (I
> > could not find the relevant part in the sample kernel code).
>
> Note that the UDP tunnel csum offload is discusses in patch 2/2 as per
> your request. At this point (only patch 1/2 applied) there is no concept
> of csum offload for the outer header. With only patch 1/2 applied the
> outer UDP will be always left-alone/ignored/not touched (either 0 or
> pre-computed).

Correct me if I was wrong, my understanding is that, device should
behave differently in those cases:

0: do a full checksum
pre-computed: checksum only the data part

So you meant if device sees a non zero checksum, it realizes that it
is a pre-computed one? If yes, we probably need to clarify this in the
spec.

>
> In patch 2/2 is specified that the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit
> in flags carries the info about the outer csum offload. When set the
> outer csum is offloaded, when cleared is either 0 or precomputed.
>
> >> @@ -776,12 +913,19 @@ \subsubsection{Processing of Incoming Packets}\l=
abel{sec:Device Types / Network
> >>   \item If the VIRTIO_NET_F_GUEST_CSUM feature was negotiated, the
> >>     VIRTIO_NET_HDR_F_DATA_VALID bit in \field{flags} can be
> >>     set: if so, device has validated the packet checksum.
> >> +  If the VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO feature has been negotiate=
d,
> >> +  and either the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or the
> >> +  VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit in \field{gso_type} are set,
> >> +  the device can additionally set the VIRTIO_NET_HDR_F_DATA_VALID bit
> >> +  in \field{flags}, meaning that the device validated the checksum,
> >> +  set the csum_start and csum_offset fields, but did not provide the
> >> +  partial checksum for the transport header.
> >
> > Interesting, we had this in the spec now:
> >
> > """
> > \item If the VIRTIO_NET_F_GUEST_CSUM feature was negotiated, the
> >    VIRTIO_NET_HDR_F_DATA_VALID bit in \field{flags} can be
> >    set: if so, device has validated the packet checksum.
> >    In case of multiple encapsulated protocols, one level of checksums
> >    has been validated.
> > """
> >
> > Firstly, it doesn't mandate the csum_start/csum_offset. Anything makes
> > the tunnel GSO different?
>
> This difference is intentional, to satisfy a requested from Willem for
> "robustness". We have a continuos flow of serious bugs in the current
> virtio implementation due to the spec allowing "unexpected"/strange/weak
> features combination leading to strange packet layout and crashes.
>
> i.e. see the kernel commits:
> 49d14b54a527289d09a9480f214b8c586322310a
> 6513eb3d3191574b58859ef2d6dc26c0277c6f81
> 89add40066f9ed9abe5f7f886fe5789ff7e0c50e
>

I see.

> The idea is that GSO over UDP tunnel specs are new, so we can be more
> strict and we try to mandate only 'sane' flag/features/layout combination=
s.

But I don't see how mandating device to set csum stuffs can help.

1) There's no way for the driver to know if device sets csum stuffs or not
2) Driver should not trust the device, malicious device can set
arbitrary value, so driver needs its own validation

>
> > Secondly, I think "one level of checksums" means the outer, this seems
> > to be contradict to what we had here: 1) DATA_VALID seems to be for
> > inner 2) no outer checksum offload
>
> Yes, with this spec GSO over UDP tunnel DATA_VALID specify the inner
> head csum.

Just to make sure we are on the same page. I meant we probably need a
clarification on the "one level of checksums" here. It looks ambiguous
as I see we think differently here:

Assuming we have a packet with N level of tunnels.

1) if it means the N level tunnel, this means
1.1) device needs complicated logic to analyze each level of the
tunneling which seems to be impossible
1.2) in this case, if device want to set the csum_start/offset, we
will need to answer if it for 0 or N

2) if it means the 0 level tunnel (that's my understanding so far), we
end up with my questions above
2.1) DATA_VALID means 0 level, we can't reuse it for inner
2.2) if DATA_VALID means 0 level, we should already had outer checksum
offload at least in the RX path

Btw, I think we should clarify that the tunnel GSO only works for one level=
.

>
> AFAICS the simpler option is allowing DATA_VALID with GSO over UDP
> tunnel without only with outer header csum offload, too.

Not sure I get this, but it seems to be if DATA_VALID is for outer, it
would be simpler.

>
> > It looks like we want to reuse hdr->flags for inner, not sure if it
> > would result come conflict when introducing outer checksum offload. Or
> > maybe we should introduce a dedicated inner_flags.
>
> I could not follow the above, could you please re-phrase?

I meant e.g for RX we would have the following matrix

inner: NEEDS_CUSM, DATA_VALID
outer: NEEDS_CSUM, DATA_VALID

Do we want to support all of the four combinations? It looks to me
thing would be simpler, if NEEDS_CSUM, DATA_VALID is for outer (0
level of tunnel), and new flags or fields were introduced for inner.

>
> >> @@ -920,6 +1092,24 @@ \subsubsection{Processing of Incoming Packets}\l=
abel{sec:Device Types / Network
> >>   VIRTIO_NET_HDR_F_DATA_VALID is set, the driver MUST NOT
> >>   rely on the packet checksum being correct.
> >>
> >> +If both the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit and
> >> +the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit in in \field{gso_type} are=
 set,
> >> +the driver MUST NOT accept the packet.
> >> +
> >> +If the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or the VIRTIO_NET_HDR_G=
SO_UDP_TUNNEL_IPV6
> >> +bit in \field{gso_type} are not set, the driver MUST NOT use the
> >> +\field{outer_th_offset} and \field{inner_nh_offset}.
> >> +
> >> +If either the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or
> >> +the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit in \field{gso_type} are se=
t, and any of
> >> +the following is true:
> >> +\begin{itemize}
> >> +\item the VIRTIO_NET_HDR_F_NEEDS_CSUM is not set in \field{flags}
> >> +\item the \field{gso_type} excluding the VIRTIO_NET_HDR_GSO_UDP_TUNNE=
L_IPV4
> >> +bit and the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit is VIRTIO_NET_HDR_=
GSO_NONE
> >
> > Maybe we can just simplify this as
> >
> > "VIRTIO_NET_HDR_GSO_NONE is set in \field{gso_type}"
>
> I considered that option, the main problem is that such statement will
> never be true: gso_type has at least a bit set
> (VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 or
> VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6). I preferred to be more accurate
> even if more verbose. I think we should preserve this accuracy.

Note that this has been under context of:

"""
If either the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or
the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit in \field{gso_type} are set,
"""

(Anyhow, if we can leave this to the native speaker)

>
> Thanks,
>
> Paolo
>

Thanks

