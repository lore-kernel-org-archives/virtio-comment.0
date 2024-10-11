Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 899D31D131E
	for <virtio-comment@lists.linux.dev>; Fri, 11 Oct 2024 02:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728612549; cv=none; b=LzrOkOO2FCal6XPOazmCPNmfazd2DT4PtZ6DBMQqJxLBSd9WGzcWgafHZcrbNn/QomxTz50ygHo99XyyjxEB/ZW+iKizdNaVBhqV93l8l/RKvRWisatInuHI8HOPHgbBwx5NC0Z8iOd3FXtLBGj1d0rYhF8b44x9QvvsQKNfl2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728612549; c=relaxed/simple;
	bh=Z9nwmlbAoJEVeDPZ4hPhKjwet/LMlz7gZ6+tg80lSNE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DDf2nyGqHremotOK04S7/XvUiKIE1GX16BP87plk6Oa3YAUaBHErAN0ZuJHjUVgC0Ztu/X6omHz903QUM805wDvGSmVojwwhp7LwM0L8OIXZmbe7GHPiWqm9MuJKssEuVgQlrmGHV5TY/wf9yytECemvyzMKVvZmgrfFy26hvzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=V+tVQbir; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="V+tVQbir"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728612544;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VNqgMBgHj3bk7cx9HoZ+RiZMfmC7mfpzA/eqhL5cFkY=;
	b=V+tVQbirkkNdDx3lECxKXzMQxkq98Pkk3dWbg3YseC5B84MP3sMd2Kiu2oDu54II2kFENN
	NwR1CayPISAitBphdH5RrEZs3OKVQBnPYQcW6Pn63aR/znGjYoH16AI3TtTa98s6JKpJM4
	yoEszpxgS2Hs/irfiJmxeP2D9B8YVtA=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-333-s7iWlUNAN3CrYtm7KK78yQ-1; Thu, 10 Oct 2024 22:08:59 -0400
X-MC-Unique: s7iWlUNAN3CrYtm7KK78yQ-1
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-7e6cc094c2fso2135545a12.1
        for <virtio-comment@lists.linux.dev>; Thu, 10 Oct 2024 19:08:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728612537; x=1729217337;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VNqgMBgHj3bk7cx9HoZ+RiZMfmC7mfpzA/eqhL5cFkY=;
        b=mXXFfaHdPMns9GOqPDGgg6NR5bN6zG6koVb4Ez0WPmpSsq9/cJeGHC/HVE18Xxmsrr
         C4Cx8aTa2REnilTXgfHZulSsjRYbIWrQ+XcqoVT/h1JQq/7gMRQA9shrqReZQO2VWBfU
         u6NyOihKFDBLWj3KMiZnLzV6lnMPK1ryzteCzZSz2dZ4VIvbel5d1hUTNCKJDpHABgak
         7h8nCSYoJbkaX+yEOnNAtGfxosFjCaQx7fULdW8yFZqZBxx8ynbX70dsT7LzQnDwcPMT
         pbU3jfcxlO/EwP85Ox6+7DWYFnbclNZ91fhi+Y76v2SlIu8ECcIsjHDbx7Ht/BvWUFHP
         Ci7A==
X-Gm-Message-State: AOJu0Ywe1xeDWTk8+ALrEDV3T+62aJyBvJwIL1yHUEC9O4iV19P4Rkue
	4vPFa2sGkw696fua5B/u17gFd37Xe/UK06x2CXfMOQaAN/KuvhqNzTNmb2XiJjMZGSjUr/K/xKj
	qpJ9uIU8lb40S6sUEUatPRTytmoz41zqHeQjg1XXflsJX7lOF2Slb/ECEbR31Oe+5WAdleUvLbl
	DyeCCeOvX46Jom4f3n5uk7T7UVROwnwz9r7HC2w4w=
X-Received: by 2002:a17:90a:9c6:b0:2e0:7e80:2011 with SMTP id 98e67ed59e1d1-2e2c81ba38fmr8369045a91.16.1728612537272;
        Thu, 10 Oct 2024 19:08:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFyFZN2ZdiuR/qPqDnFjpvXTlbsOQA17eZXSG+/mghQl+zSM8kmMo1aWH7X9e6thbtxRbidiKn38D+3CnX/3+U=
X-Received: by 2002:a17:90a:9c6:b0:2e0:7e80:2011 with SMTP id
 98e67ed59e1d1-2e2c81ba38fmr8369004a91.16.1728612536608; Thu, 10 Oct 2024
 19:08:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1728029499.git.pabeni@redhat.com> <55306969c73f62bf4d100d15074bfd6cde741417.1728029499.git.pabeni@redhat.com>
 <CACGkMEvV0gtvgpb7z1MqJLKzHm-Be_8hkf0GzqqsFsfDG8oAeA@mail.gmail.com>
 <d34f50af-4042-44c6-90e1-0acbbb899e96@redhat.com> <CACGkMEvrowr6CwF+=RiR+f3EagdKB=rzyCPCQcUdXee4a5MaZA@mail.gmail.com>
 <2b90c368-b514-4077-a6bf-43da075af4fc@redhat.com>
In-Reply-To: <2b90c368-b514-4077-a6bf-43da075af4fc@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 11 Oct 2024 10:08:44 +0800
Message-ID: <CACGkMEu5GWZrYVRN==F=vrRQQGnxj_WqX86YZ+diqC3s3m2m_A@mail.gmail.com>
Subject: Re: [PATCH v9 1/2] virtio-net: define UDP tunnel segmentation offload feature
To: Paolo Abeni <pabeni@redhat.com>
Cc: virtio-comment@lists.linux.dev, maxime.coquelin@redhat.com, 
	Eelco Chaudron <echaudro@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>, 
	Willem de Bruijn <willemb@google.com>, kshankar@marvell.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 10, 2024 at 3:40=E2=80=AFPM Paolo Abeni <pabeni@redhat.com> wro=
te:
>
> On 10/10/24 05:17, Jason Wang wrote:
> > On Wed, Oct 9, 2024 at 4:37=E2=80=AFPM Paolo Abeni <pabeni@redhat.com> =
wrote:
> >> On 10/9/24 09:18, Jason Wang wrote:
> >>> On Fri, Oct 4, 2024 at 4:13=E2=80=AFPM Paolo Abeni <pabeni@redhat.com=
> wrote:
> >>>>
> >>>> The VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV{4,6} are two gso_type flags
> >>>> allowing respectively GSO over UDPv4 tunnel and GSO over UDPv6 tunne=
l.
> >>>> They can be negotiated on both the host and guest sides.
> >>>>
> >>>> One constraint addressed here is that the virtio side (either device=
 or
> >>>> driver) receiving a UDP tunneled GSO packet must be able to reconstr=
uct
> >>>> completely the inner and outer headers offset - to allow for later G=
SO.
> >>>>
> >>>> To accommodate such need, new fields are introduced in the virtio_ne=
t
> >>>> header: outer_th_offset and inner_nh_offset.
> >>>> They map directly to the corresponding header information. The inner
> >>>> transport header is implied by the (inner) checksum offload.
> >>>>
> >>>> Those fields are required because a virtio device H/W implementation
> >>>> performing segmentation for UDP tunneled packet will need to touch
> >>>> the outer transport protocol (for the UDP length filed), the
> >>>> inner network protocol (for the total length field, in the IPv4
> >>>> case).
> >>>>
> >>>> Note that segmentation will additionally need to touch
> >>>> the outer network protocol and the inner transport protocol. The fir=
st
> >>>> is implied/easily found with trivial parsing, the latter is identifi=
ed
> >>>> by the existing csum_start field.
> >>>>
> >>>> Note that there is no concept of UDP tunnel type negotiation (e.g.
> >>>> vxlan, geneve, vxlan-gpe, etc.), as a virtio device H/W implementati=
on
> >>>> can perform segmentation for every possible UDP-tunnel given the
> >>>> specified new fields.
> >>>> In the reverse direction, if a virtio device H/W implementation rece=
ives
> >>>> some traffic for an unknown or unsupported UDP tunnel, it will simpl=
y
> >>>> not aggregate the wire packet in a GSO one.
> >>>>
> >>>> Signed-off-by: Paolo Abeni <pabeni@redhat.com>
> >>>> ---
> >>>> v8 -> v9:
> >>>>    - rebased on top of virtio-1.4, changed udp-tunnel features numbe=
r
> >>>>      to avoid conflicts/duplications
> >>>>    - fixed typos:
> >>>>      VIRTIO_NET_HDR_F_UDP_TUNNEL_IPV4 -> VIRTIO_NET_HDR_F_GSO_UDP_TU=
NNEL_IPV4
> >>>>      VIRTIO_NET_HDR_F_UDP_TUNNEL_IPV6 -> VIRTIO_NET_HDR_F_GSO_UDP_TU=
NNEL_IPV6
> >>>>    - specified strict validation on RX side (both driver and device)
> >>>>      for UDP tunneled packet: NEEDS_CSUM and plain GSO are mandatory=
 for UDP
> >>>>      tunnel GSO packets. The driver is not allowed to set DATA_VALID=
 for UDP
> >>>>      tunnel GSO packets, the driver can set both DATA_VALID & NEEDS_=
CSUM.
> >>>
> >>> DATA_VALID and NEEDS_CSUM are mutually exclusive unless I miss someth=
ing.
> >>
> >> AFAICS the specification does not specify them to be mutually esclusiv=
e
> >> and at least the linux kernel implementation allow them to be set toge=
ther.
> >
> > Interesting, where is such code? E.g in virtio_net_hdr_from_skb() we ha=
d:
> >
> >          if (skb->ip_summed =3D=3D CHECKSUM_PARTIAL) {
> >                  hdr->flags =3D VIRTIO_NET_HDR_F_NEEDS_CSUM;
> >                  hdr->csum_start =3D __cpu_to_virtio16(little_endian,
> >                          skb_checksum_start_offset(skb) + vlan_hlen);
> >                  hdr->csum_offset =3D __cpu_to_virtio16(little_endian,
> >                                  skb->csum_offset);
> >          } else if (has_data_valid &&
> >                     skb->ip_summed =3D=3D CHECKSUM_UNNECESSARY) {
> >                  hdr->flags =3D VIRTIO_NET_HDR_F_DATA_VALID;
> > ...
>
> The problem is in the opposite direction, in virtio_net_hdr_to_skb().
>
> It accepts GSO packets with the VIRTIO_NET_HDR_F_NEEDS_CSUM bit not set,

This seems to be fine, it requires software checksum.

> and accepts also packets with both VIRTIO_NET_HDR_F_NEEDS_CSUM and
> VIRTIO_NET_HDR_F_DATA_VALID set. (Note that the PoC is more restrictive
> for GSO over UDP tunnel packets)

This is actually a bug that needs to be fixed.

        if (flags & VIRTIO_NET_HDR_F_DATA_VALID)
                skb->ip_summed =3D CHECKSUM_UNNECESSARY;

        if (virtio_net_hdr_to_skb(skb, &hdr->hdr,

The code may overwrite CHECKSUM_UNNECESSARY with CHECKSUM_PARTIAL.

>
> The above means that an hypervisor with a S/W virtio implementation need
> to deal with all sort of strange/unexpected combinations.

Driver and device doesn't trust each other, they must do necessary
validation no matter what features were negotiated.

>
> > Anyhow, when I introduce DATA_VALID, the idea is to map
> > CHECKSUM_UNNECESSARY to DATA_VALID and CHECKSUM_PARTIAL maps to
> > NEEDS_CSUM. My understanding is CHECKSUM_UNNECESSARY and
> > CHECKSUM_PARTIAL and mutually exclusive.
>
> AFAICS the problem is that the specification does not enforce such
> understanding (I can't see any related 'MUST'/'MUST NOT') and the s/w
> implementation allow the same freedom.

Spec can be unclear and it's hard to prove an implementation is 100%
compliant with spec. There are quirks in both side to workaround buggy
implementation in other side. We need to fix the spec if it causes
confusion.

>
> >> As a possible alternative to the change from v8 to v9 we can enforce
> >> DATA_VALID and NEEDS_CSUM to be mutually esclusive.
> >
> > It seems implied in this part of the spec:
> >
> > """
> > If the VIRTIO_NET_F_GUEST_CSUM feature was negotiated, the
> > VIRTIO_NET_HDR_F_DATA_VALID bit in flags can be set: if so, device has
> > validated the packet checksum. In case of multiple encapsulated
> > protocols, one level of checksums has been validated.
> > """
> >
> > As DATA_VALID is only used in RX path, if packet has partial cusm,
> > device can't do the validation anyhow. Or did you mean the hardware
> > that can do hardware GRO, in that case, device should set NEEDS_CSUM
> > but not DATA_VALID (maybe we need clarify this in the spec).
>
> Indeed the above is a (possibly 'the') source of confusion. In the
> current spec (for non UDP tunneled GSO) it's unclear (I can't nee any
> related MUST/MUST NOT) if DATA_VALID can or can not be set with a GSO
> packet.

According to this

"""
If the VIRTIO_NET_F_GUEST_CSUM feature has been negotiated, the device
MAY set the VIRTIO_NET_HDR_F_DATA_VALID bit in flags, if so, the
device MUST validate the packet checksum (in case of multiple
encapsulated protocols, one level of checksums is validated).
"""

It doesn't have any care for GSO, so my understanding is that
DATA_VALID can be set for GSO packet.

> AFAICS the current implementation in virtio_net_hdr_to_skb()
> allows that option.
>
> If we restrict DATA_VALID to non GSO packet, I think most/all the doubt
> discussed here should go away. I'm unsure if we can enforce such
> restriction for non UDP tunneled GSO, it could break/conflict with
> existing setup/deplyment,

Yes, it's too late to do that.

> but I think we can enforce that for UDP
> tunneled GSO packets.

It looks like there are some existing drivers that support GRO_HW as
well as CHECKSUM_UNNECESSARY. If it doesn't turn out to be too hard,
we need to find way to support that.

>
> Side note: as a consequence, sice we will not have anymore DATA_VALID
> together with VIRTIO_NET_HDR_F_GSO_UDP_TUNNEL_IPV{4,6}, the above will
> additional avoid the 'DATA_VALID with GSO over UDP tunnel means inner
> header is valid' strangeness.

Well, then we will still have the issue with NEEDS_CSUM? For example,
as I ask in patch 2, if we want to offload outer checksum where do we
put the out csum_start/csum_offset?

>
> >>>> @@ -639,12 +721,48 @@ \subsubsection{Packet Transmission}\label{sec:=
Device Types / Network Device / De
> >>>>           header.
> >>>>    \end{itemize}
> >>>>
> >>>> +If the VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO option has been negotiated,=
 the
> >>>> +driver MAY set the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or the
> >>>> +VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit in \field{gso_type}, if so:
> >>>> +\begin{itemize}
> >>>> +\item the driver MUST set \field{outer_th_offset} to the outer UDP =
header
> >>>> +  offset and \field{inner_nh_offset} to the inner network header of=
fset.
> >>>> +  The \field{csum_start} and \field{csum_offset} fields point respe=
ctively
> >>>> +  to the inner transport header and inner transport checksum field.
> >>>> +\end{itemize}
> >>>> +
> >>>> +If the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or the
> >>>> +VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit in \field{gso_type} are set,=
 the
> >>>> +outer UDP header MUST NOT require checksum validation. That is, the
> >>>> +outer UDP checksum value MUST be 0 or the validated complete checks=
um
> >>>> +for such header.
> >>>> +
> >>>> +\begin{note}
> >>>> +The valid complete checksum of the outer UDP header of individual s=
egments
> >>>> +can be computed by the driver prior to segmentation only if the GSO=
 packet
> >>>> +size is a multiple of \field{gso_size}, because then all segments
> >>>> +have the same size and thus all data included in the outer UDP
> >>>> +checksum is the same for every segment. These pre-computed segment
> >>>> +length and checksum fields are different from those of the GSO
> >>>> +packet.
> >>>
> >>> How could a device know if the checksum if pre-computed or not? (I
> >>> could not find the relevant part in the sample kernel code).
> >>
> >> Note that the UDP tunnel csum offload is discusses in patch 2/2 as per
> >> your request. At this point (only patch 1/2 applied) there is no conce=
pt
> >> of csum offload for the outer header. With only patch 1/2 applied the
> >> outer UDP will be always left-alone/ignored/not touched (either 0 or
> >> pre-computed).
> >
> > Correct me if I was wrong, my understanding is that, device should
> > behave differently in those cases:
> >
> > 0: do a full checksum
> > pre-computed: checksum only the data part
> > So you meant if device sees a non zero checksum, it realizes that it
> > is a pre-computed one? If yes, we probably need to clarify this in the
> > spec.
>
> Lacking the UDP tunnel csum offload, the device will simply not touch
> the outer UDP csum. That will be the correct action both if the outer
> csum is 0 or the fully csum one.

Just to make sure we are talking the same thing. Actually, I meant for
TX you propose the following text:

"""
+The valid complete checksum of the outer UDP header of individual segments
+can be computed by the driver prior to segmentation only if the GSO packet
+size is a multiple of \field{gso_size}, because then all segments
+have the same size and thus all data included in the outer UDP
+checksum is the same for every segment. These pre-computed segment
+length and checksum fields are different from those of the GSO
+packet.
"""

If I understand correctly, you are talking about the precomputed
checksum by the driver which should be TX. If no checksum offload, I
don't get how such pre-computing can help.

>
> >>> Firstly, it doesn't mandate the csum_start/csum_offset. Anything make=
s
> >>> the tunnel GSO different?
> >>
> >> This difference is intentional, to satisfy a requested from Willem for
> >> "robustness". We have a continuos flow of serious bugs in the current
> >> virtio implementation due to the spec allowing "unexpected"/strange/we=
ak
> >> features combination leading to strange packet layout and crashes.
> >>
> >> i.e. see the kernel commits:
> >> 49d14b54a527289d09a9480f214b8c586322310a
> >> 6513eb3d3191574b58859ef2d6dc26c0277c6f81
> >> 89add40066f9ed9abe5f7f886fe5789ff7e0c50e
> >>
> >
> > I see.
> >
> >> The idea is that GSO over UDP tunnel specs are new, so we can be more
> >> strict and we try to mandate only 'sane' flag/features/layout combinat=
ions.
> >
> > But I don't see how mandating device to set csum stuffs can help.
> >
> > 1) There's no way for the driver to know if device sets csum stuffs or =
not
> > 2) Driver should not trust the device, malicious device can set
> > arbitrary value, so driver needs its own validation
>
> We are discussing only about csum validy, right?

Kind of, actually the context is whether mandating the device to set
csum_start/offset for DATA_VALID can help.

So I meant there's no difference in the following two cases:

1) Device doesn't set csum_start/offset, driver need to probe and
validate the packet
2) Device set the csum_start/offset, driver still need to probe and
validate the packet

And as replied before, there's no way for the driver to know if device
set csum_start/offset or not.

> Lacking UDP tunnel csum
> offload, the device does not need to discriminate between outer zero
> csum and outer fully checksummed packets: in both case it should not
> touch the outer UDP csum.
>
> The 'worst case scenario' is that the guest will send packets with bad
> outer csum, which is AFACS legit, unharmful and sometimes necesary (for
> testing purpose).
>
> The guest can already send packets with bad csum in many different ways.

DATA_VALID is not used in TX I think. But the point is, in any case,
validation in each side (driver or device) is a must.

>
> >>> Secondly, I think "one level of checksums" means the outer, this seem=
s
> >>> to be contradict to what we had here: 1) DATA_VALID seems to be for
> >>> inner 2) no outer checksum offload
> >>
> >> Yes, with this spec GSO over UDP tunnel DATA_VALID specify the inner
> >> head csum.
> >
> > Just to make sure we are on the same page. I meant we probably need a
> > clarification on the "one level of checksums" here. It looks ambiguous
> > as I see we think differently here:
> >
> > Assuming we have a packet with N level of tunnels.
> >
> > 1) if it means the N level tunnel, this means
> > 1.1) device needs complicated logic to analyze each level of the
> > tunneling which seems to be impossible
> > 1.2) in this case, if device want to set the csum_start/offset, we
> > will need to answer if it for 0 or N
> >
> > 2) if it means the 0 level tunnel (that's my understanding so far), we
> > end up with my questions above
> > 2.1) DATA_VALID means 0 level, we can't reuse it for inner
> > 2.2) if DATA_VALID means 0 level, we should already had outer checksum
> > offload at least in the RX path
> >
> > Btw, I think we should clarify that the tunnel GSO only works for one l=
evel.
>
> I hope and believe that this part should have been clarified by a
> previously discussed point: no DATA_VALID for GSO over UDP tunnel, no
> more differentiate/confusing meaning for the DATA VALID bit.

Rethink of the design, the root cause is that we're trying to re-use
existing fields for inner which works for outer before:

For example. consider the case for non GSO tunneling, all
csum_start/offset/hdr_flags etc were for the outer, and we change the
semantic when GSO tunnel is supported. Such asymmetry might end up of
a lot of complexity in both the spec and the implementation.

I wonder why not just introduce new fields for the inner, like what
has beed done in the linux sk_buff implementation? I know I propose
this before, but now I think it can help to reduce the complexity and
more aligned with the for non GSO tunneling.

...
        union {
                __be16          inner_protocol;
                __u8            inner_ipproto;
        };
...
        __u16                   inner_transport_header;
        __u16                   inner_network_header;
        __u16                   inner_mac_header;

        __be16                  protocol;
        __u16                   transport_header;
        __u16                   network_header;
...

Thanks


>
> >>>> @@ -920,6 +1092,24 @@ \subsubsection{Processing of Incoming Packets}=
\label{sec:Device Types / Network
> >>>>    VIRTIO_NET_HDR_F_DATA_VALID is set, the driver MUST NOT
> >>>>    rely on the packet checksum being correct.
> >>>>
> >>>> +If both the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit and
> >>>> +the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit in in \field{gso_type} a=
re set,
> >>>> +the driver MUST NOT accept the packet.
> >>>> +
> >>>> +If the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or the VIRTIO_NET_HDR=
_GSO_UDP_TUNNEL_IPV6
> >>>> +bit in \field{gso_type} are not set, the driver MUST NOT use the
> >>>> +\field{outer_th_offset} and \field{inner_nh_offset}.
> >>>> +
> >>>> +If either the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or
> >>>> +the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit in \field{gso_type} are =
set, and any of
> >>>> +the following is true:
> >>>> +\begin{itemize}
> >>>> +\item the VIRTIO_NET_HDR_F_NEEDS_CSUM is not set in \field{flags}
> >>>> +\item the \field{gso_type} excluding the VIRTIO_NET_HDR_GSO_UDP_TUN=
NEL_IPV4
> >>>> +bit and the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit is VIRTIO_NET_HD=
R_GSO_NONE
> >>>
> >>> Maybe we can just simplify this as
> >>>
> >>> "VIRTIO_NET_HDR_GSO_NONE is set in \field{gso_type}"
> >>
> >> I considered that option, the main problem is that such statement will
> >> never be true: gso_type has at least a bit set
> >> (VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 or
> >> VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6). I preferred to be more accurate
> >> even if more verbose. I think we should preserve this accuracy.
> >
> > Note that this has been under context of:
> >
> > """
> > If either the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or
> > the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit in \field{gso_type} are set,
> > """
>
> That is my point: we know that this statement:
>
> hdr->gso_type =3D=3D VIRTIO_NET_HDR_GSO_NONE
>
> is false. The goal is to be as accurate as possible, to avoid
> strangess/later misuse or misinterpretation.
>
> /P
>

