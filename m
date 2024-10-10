Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9BF81F8EE5
	for <virtio-comment@lists.linux.dev>; Thu, 10 Oct 2024 07:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728546057; cv=none; b=DF+z0tHMKN5YFH18DQ5rYFZfq0zo3S1ifk/SOwxVLpa6TwTwkEAkxcfy4Cy48JMY4IjkowuMJ7WLNPsOgBNfX/C656G6FUIWEs1EvMhI8F6rc8YfdVLPAa9Oczhml86LKybLW8q4j97ANGRVUVuH3P8eo++KDwNdbLAVTtTM7+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728546057; c=relaxed/simple;
	bh=Zybr0wr4yOmm1klpq1OxMTisUd1UkIp5JZwefa8zKEQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QK4x9+1eIQv4At6JXCQsysJHGB/8MpPzddQ2AeaKNyC1AXlEWMR6OYPXyc+yBOz/v1NdS7uL9cbGef3VWsp0bD+5pcNH3CvUIBu9PDRsgA47MJsul7rlvAjoOSV86pzYI8mxhxwyJ6Jx8SZN6H7R+rQfFc3arB2kbol5j9UYJg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WHaJsQqi; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WHaJsQqi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728546053;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8ju7SKZqATM6H1ZnMLFVSk8M9maewDrUhg9s/9CXiws=;
	b=WHaJsQqiXdCk3Lm5Yc3XYZ32CymDmZ4fpNcplShpAeSeEnLZyMrIdYn2mdoTGBHs65C2mc
	OLWDorEzLijAHEUcUp4ylhX5FNXfWLr/GrDNec4UihMkE8wr8vFWCnGeeAiD91lXDME0Zq
	mQODBoZByj1v6NyIBW3ew/MO4lNx9ZA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-199-va-9I6VSNp-EHyhucgRGdA-1; Thu, 10 Oct 2024 03:40:52 -0400
X-MC-Unique: va-9I6VSNp-EHyhucgRGdA-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43119e2a879so876505e9.3
        for <virtio-comment@lists.linux.dev>; Thu, 10 Oct 2024 00:40:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728546051; x=1729150851;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8ju7SKZqATM6H1ZnMLFVSk8M9maewDrUhg9s/9CXiws=;
        b=K3gP52vWDhnRgUCXEry0k4ngkYwtHwU2xijfvxgueTPTvwoEtydi6wNWV7aZsodoav
         ccBxR8/KHyz7P2ILSsvI5bPG3xHCuWsHrKa+dzbKxDOkpFfBM8s49u21qBwy0cZVyBgL
         gTQ+R9dc/3lM93UrThnNZl0EqNQhw+8UygU7ho+iK1zlYLjijRf8CThRiWL1/48oiejJ
         qUkkDGmgj0WyZ5Tt+ofMe+5IEpNnBBe06D9AHHsFUm2MKZ69jCxjIRAxa8eQyh0yAczE
         EbRML0AdrupgeLhPEMKdngXo7WeChytC0dsGLpw1Ef3wB5l9eXb2gJiWDd1r+FUTcLjT
         qmUA==
X-Gm-Message-State: AOJu0Yzjz2T2L0oO3yhseIDPFFV1q+I3aqC/d7ChkienE4vsjvM+wTKC
	TA8aaoxdvNtWc+ty1nIKeX0W07Gr2LaIY9vIq4saTmEWozx1EvYAYoDfKTECck5C1XwGYqLLvox
	iORH7A3KN4LdjPjcV/yt+CTvrvn+BfVzr/GRdFJbtidu+/Ncjrin6qClDhQl9lgMH
X-Received: by 2002:a05:600c:284:b0:42f:8d36:855e with SMTP id 5b1f17b1804b1-431157a3bc5mr26316685e9.5.1728546050787;
        Thu, 10 Oct 2024 00:40:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGENMVeVir1T25edGO/vb4u4Xl50E9D/DlPLvgyfg0PnO/hfUSab7lyZuRQ4SH/hjNEPTDPug==
X-Received: by 2002:a05:600c:284:b0:42f:8d36:855e with SMTP id 5b1f17b1804b1-431157a3bc5mr26316475e9.5.1728546050306;
        Thu, 10 Oct 2024 00:40:50 -0700 (PDT)
Received: from [192.168.88.248] (146-241-27-157.dyn.eolo.it. [146.241.27.157])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431183565b9sm7539585e9.29.2024.10.10.00.40.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Oct 2024 00:40:49 -0700 (PDT)
Message-ID: <2b90c368-b514-4077-a6bf-43da075af4fc@redhat.com>
Date: Thu, 10 Oct 2024 09:40:48 +0200
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/2] virtio-net: define UDP tunnel segmentation offload
 feature
To: Jason Wang <jasowang@redhat.com>
Cc: virtio-comment@lists.linux.dev, maxime.coquelin@redhat.com,
 Eelco Chaudron <echaudro@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Willem de Bruijn <willemb@google.com>, kshankar@marvell.com
References: <cover.1728029499.git.pabeni@redhat.com>
 <55306969c73f62bf4d100d15074bfd6cde741417.1728029499.git.pabeni@redhat.com>
 <CACGkMEvV0gtvgpb7z1MqJLKzHm-Be_8hkf0GzqqsFsfDG8oAeA@mail.gmail.com>
 <d34f50af-4042-44c6-90e1-0acbbb899e96@redhat.com>
 <CACGkMEvrowr6CwF+=RiR+f3EagdKB=rzyCPCQcUdXee4a5MaZA@mail.gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <CACGkMEvrowr6CwF+=RiR+f3EagdKB=rzyCPCQcUdXee4a5MaZA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/10/24 05:17, Jason Wang wrote:
> On Wed, Oct 9, 2024 at 4:37 PM Paolo Abeni <pabeni@redhat.com> wrote:
>> On 10/9/24 09:18, Jason Wang wrote:
>>> On Fri, Oct 4, 2024 at 4:13 PM Paolo Abeni <pabeni@redhat.com> wrote:
>>>>
>>>> The VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV{4,6} are two gso_type flags
>>>> allowing respectively GSO over UDPv4 tunnel and GSO over UDPv6 tunnel.
>>>> They can be negotiated on both the host and guest sides.
>>>>
>>>> One constraint addressed here is that the virtio side (either device or
>>>> driver) receiving a UDP tunneled GSO packet must be able to reconstruct
>>>> completely the inner and outer headers offset - to allow for later GSO.
>>>>
>>>> To accommodate such need, new fields are introduced in the virtio_net
>>>> header: outer_th_offset and inner_nh_offset.
>>>> They map directly to the corresponding header information. The inner
>>>> transport header is implied by the (inner) checksum offload.
>>>>
>>>> Those fields are required because a virtio device H/W implementation
>>>> performing segmentation for UDP tunneled packet will need to touch
>>>> the outer transport protocol (for the UDP length filed), the
>>>> inner network protocol (for the total length field, in the IPv4
>>>> case).
>>>>
>>>> Note that segmentation will additionally need to touch
>>>> the outer network protocol and the inner transport protocol. The first
>>>> is implied/easily found with trivial parsing, the latter is identified
>>>> by the existing csum_start field.
>>>>
>>>> Note that there is no concept of UDP tunnel type negotiation (e.g.
>>>> vxlan, geneve, vxlan-gpe, etc.), as a virtio device H/W implementation
>>>> can perform segmentation for every possible UDP-tunnel given the
>>>> specified new fields.
>>>> In the reverse direction, if a virtio device H/W implementation receives
>>>> some traffic for an unknown or unsupported UDP tunnel, it will simply
>>>> not aggregate the wire packet in a GSO one.
>>>>
>>>> Signed-off-by: Paolo Abeni <pabeni@redhat.com>
>>>> ---
>>>> v8 -> v9:
>>>>    - rebased on top of virtio-1.4, changed udp-tunnel features number
>>>>      to avoid conflicts/duplications
>>>>    - fixed typos:
>>>>      VIRTIO_NET_HDR_F_UDP_TUNNEL_IPV4 -> VIRTIO_NET_HDR_F_GSO_UDP_TUNNEL_IPV4
>>>>      VIRTIO_NET_HDR_F_UDP_TUNNEL_IPV6 -> VIRTIO_NET_HDR_F_GSO_UDP_TUNNEL_IPV6
>>>>    - specified strict validation on RX side (both driver and device)
>>>>      for UDP tunneled packet: NEEDS_CSUM and plain GSO are mandatory for UDP
>>>>      tunnel GSO packets. The driver is not allowed to set DATA_VALID for UDP
>>>>      tunnel GSO packets, the driver can set both DATA_VALID & NEEDS_CSUM.
>>>
>>> DATA_VALID and NEEDS_CSUM are mutually exclusive unless I miss something.
>>
>> AFAICS the specification does not specify them to be mutually esclusive
>> and at least the linux kernel implementation allow them to be set together.
> 
> Interesting, where is such code? E.g in virtio_net_hdr_from_skb() we had:
> 
>          if (skb->ip_summed == CHECKSUM_PARTIAL) {
>                  hdr->flags = VIRTIO_NET_HDR_F_NEEDS_CSUM;
>                  hdr->csum_start = __cpu_to_virtio16(little_endian,
>                          skb_checksum_start_offset(skb) + vlan_hlen);
>                  hdr->csum_offset = __cpu_to_virtio16(little_endian,
>                                  skb->csum_offset);
>          } else if (has_data_valid &&
>                     skb->ip_summed == CHECKSUM_UNNECESSARY) {
>                  hdr->flags = VIRTIO_NET_HDR_F_DATA_VALID;
> ...

The problem is in the opposite direction, in virtio_net_hdr_to_skb().

It accepts GSO packets with the VIRTIO_NET_HDR_F_NEEDS_CSUM bit not set, 
and accepts also packets with both VIRTIO_NET_HDR_F_NEEDS_CSUM and 
VIRTIO_NET_HDR_F_DATA_VALID set. (Note that the PoC is more restrictive 
for GSO over UDP tunnel packets)

The above means that an hypervisor with a S/W virtio implementation need 
to deal with all sort of strange/unexpected combinations.

> Anyhow, when I introduce DATA_VALID, the idea is to map
> CHECKSUM_UNNECESSARY to DATA_VALID and CHECKSUM_PARTIAL maps to
> NEEDS_CSUM. My understanding is CHECKSUM_UNNECESSARY and
> CHECKSUM_PARTIAL and mutually exclusive.

AFAICS the problem is that the specification does not enforce such 
understanding (I can't see any related 'MUST'/'MUST NOT') and the s/w 
implementation allow the same freedom.

>> As a possible alternative to the change from v8 to v9 we can enforce
>> DATA_VALID and NEEDS_CSUM to be mutually esclusive.
> 
> It seems implied in this part of the spec:
> 
> """
> If the VIRTIO_NET_F_GUEST_CSUM feature was negotiated, the
> VIRTIO_NET_HDR_F_DATA_VALID bit in flags can be set: if so, device has
> validated the packet checksum. In case of multiple encapsulated
> protocols, one level of checksums has been validated.
> """
> 
> As DATA_VALID is only used in RX path, if packet has partial cusm,
> device can't do the validation anyhow. Or did you mean the hardware
> that can do hardware GRO, in that case, device should set NEEDS_CSUM
> but not DATA_VALID (maybe we need clarify this in the spec).

Indeed the above is a (possibly 'the') source of confusion. In the 
current spec (for non UDP tunneled GSO) it's unclear (I can't nee any 
related MUST/MUST NOT) if DATA_VALID can or can not be set with a GSO 
packet. AFAICS the current implementation in virtio_net_hdr_to_skb() 
allows that option.

If we restrict DATA_VALID to non GSO packet, I think most/all the doubt 
discussed here should go away. I'm unsure if we can enforce such 
restriction for non UDP tunneled GSO, it could break/conflict with 
existing setup/deplyment, but I think we can enforce that for UDP 
tunneled GSO packets.

Side note: as a consequence, sice we will not have anymore DATA_VALID 
together with VIRTIO_NET_HDR_F_GSO_UDP_TUNNEL_IPV{4,6}, the above will 
additional avoid the 'DATA_VALID with GSO over UDP tunnel means inner 
header is valid' strangeness.

>>>> @@ -639,12 +721,48 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
>>>>           header.
>>>>    \end{itemize}
>>>>
>>>> +If the VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO option has been negotiated, the
>>>> +driver MAY set the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or the
>>>> +VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit in \field{gso_type}, if so:
>>>> +\begin{itemize}
>>>> +\item the driver MUST set \field{outer_th_offset} to the outer UDP header
>>>> +  offset and \field{inner_nh_offset} to the inner network header offset.
>>>> +  The \field{csum_start} and \field{csum_offset} fields point respectively
>>>> +  to the inner transport header and inner transport checksum field.
>>>> +\end{itemize}
>>>> +
>>>> +If the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or the
>>>> +VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit in \field{gso_type} are set, the
>>>> +outer UDP header MUST NOT require checksum validation. That is, the
>>>> +outer UDP checksum value MUST be 0 or the validated complete checksum
>>>> +for such header.
>>>> +
>>>> +\begin{note}
>>>> +The valid complete checksum of the outer UDP header of individual segments
>>>> +can be computed by the driver prior to segmentation only if the GSO packet
>>>> +size is a multiple of \field{gso_size}, because then all segments
>>>> +have the same size and thus all data included in the outer UDP
>>>> +checksum is the same for every segment. These pre-computed segment
>>>> +length and checksum fields are different from those of the GSO
>>>> +packet.
>>>
>>> How could a device know if the checksum if pre-computed or not? (I
>>> could not find the relevant part in the sample kernel code).
>>
>> Note that the UDP tunnel csum offload is discusses in patch 2/2 as per
>> your request. At this point (only patch 1/2 applied) there is no concept
>> of csum offload for the outer header. With only patch 1/2 applied the
>> outer UDP will be always left-alone/ignored/not touched (either 0 or
>> pre-computed).
> 
> Correct me if I was wrong, my understanding is that, device should
> behave differently in those cases:
> 
> 0: do a full checksum
> pre-computed: checksum only the data part
> So you meant if device sees a non zero checksum, it realizes that it
> is a pre-computed one? If yes, we probably need to clarify this in the
> spec.

Lacking the UDP tunnel csum offload, the device will simply not touch 
the outer UDP csum. That will be the correct action both if the outer 
csum is 0 or the fully csum one.

>>> Firstly, it doesn't mandate the csum_start/csum_offset. Anything makes
>>> the tunnel GSO different?
>>
>> This difference is intentional, to satisfy a requested from Willem for
>> "robustness". We have a continuos flow of serious bugs in the current
>> virtio implementation due to the spec allowing "unexpected"/strange/weak
>> features combination leading to strange packet layout and crashes.
>>
>> i.e. see the kernel commits:
>> 49d14b54a527289d09a9480f214b8c586322310a
>> 6513eb3d3191574b58859ef2d6dc26c0277c6f81
>> 89add40066f9ed9abe5f7f886fe5789ff7e0c50e
>>
> 
> I see.
> 
>> The idea is that GSO over UDP tunnel specs are new, so we can be more
>> strict and we try to mandate only 'sane' flag/features/layout combinations.
> 
> But I don't see how mandating device to set csum stuffs can help.
> 
> 1) There's no way for the driver to know if device sets csum stuffs or not
> 2) Driver should not trust the device, malicious device can set
> arbitrary value, so driver needs its own validation

We are discussing only about csum validy, right? Lacking UDP tunnel csum 
offload, the device does not need to discriminate between outer zero 
csum and outer fully checksummed packets: in both case it should not 
touch the outer UDP csum.

The 'worst case scenario' is that the guest will send packets with bad 
outer csum, which is AFACS legit, unharmful and sometimes necesary (for 
testing purpose).

The guest can already send packets with bad csum in many different ways.

>>> Secondly, I think "one level of checksums" means the outer, this seems
>>> to be contradict to what we had here: 1) DATA_VALID seems to be for
>>> inner 2) no outer checksum offload
>>
>> Yes, with this spec GSO over UDP tunnel DATA_VALID specify the inner
>> head csum.
> 
> Just to make sure we are on the same page. I meant we probably need a
> clarification on the "one level of checksums" here. It looks ambiguous
> as I see we think differently here:
> 
> Assuming we have a packet with N level of tunnels.
> 
> 1) if it means the N level tunnel, this means
> 1.1) device needs complicated logic to analyze each level of the
> tunneling which seems to be impossible
> 1.2) in this case, if device want to set the csum_start/offset, we
> will need to answer if it for 0 or N
> 
> 2) if it means the 0 level tunnel (that's my understanding so far), we
> end up with my questions above
> 2.1) DATA_VALID means 0 level, we can't reuse it for inner
> 2.2) if DATA_VALID means 0 level, we should already had outer checksum
> offload at least in the RX path
> 
> Btw, I think we should clarify that the tunnel GSO only works for one level.

I hope and believe that this part should have been clarified by a 
previously discussed point: no DATA_VALID for GSO over UDP tunnel, no 
more differentiate/confusing meaning for the DATA VALID bit.

>>>> @@ -920,6 +1092,24 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
>>>>    VIRTIO_NET_HDR_F_DATA_VALID is set, the driver MUST NOT
>>>>    rely on the packet checksum being correct.
>>>>
>>>> +If both the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit and
>>>> +the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit in in \field{gso_type} are set,
>>>> +the driver MUST NOT accept the packet.
>>>> +
>>>> +If the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6
>>>> +bit in \field{gso_type} are not set, the driver MUST NOT use the
>>>> +\field{outer_th_offset} and \field{inner_nh_offset}.
>>>> +
>>>> +If either the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or
>>>> +the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit in \field{gso_type} are set, and any of
>>>> +the following is true:
>>>> +\begin{itemize}
>>>> +\item the VIRTIO_NET_HDR_F_NEEDS_CSUM is not set in \field{flags}
>>>> +\item the \field{gso_type} excluding the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4
>>>> +bit and the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit is VIRTIO_NET_HDR_GSO_NONE
>>>
>>> Maybe we can just simplify this as
>>>
>>> "VIRTIO_NET_HDR_GSO_NONE is set in \field{gso_type}"
>>
>> I considered that option, the main problem is that such statement will
>> never be true: gso_type has at least a bit set
>> (VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 or
>> VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6). I preferred to be more accurate
>> even if more verbose. I think we should preserve this accuracy.
> 
> Note that this has been under context of:
> 
> """
> If either the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or
> the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit in \field{gso_type} are set,
> """

That is my point: we know that this statement:

hdr->gso_type == VIRTIO_NET_HDR_GSO_NONE

is false. The goal is to be as accurate as possible, to avoid 
strangess/later misuse or misinterpretation.

/P

