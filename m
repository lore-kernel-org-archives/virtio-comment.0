Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F614F21D
	for <virtio-comment@lists.linux.dev>; Thu, 28 Nov 2024 03:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732762911; cv=none; b=DVH3ESt9rHS4LVSsTvC7DUyx4YyjubFqXOX2LwnrsA/Q5Psv8IN9L3QVULm9K8+IGcaYhALD/dZFvDPZLmDGIQ3ovm2cfmpYw8J/ribEvSvPlMr4mh3QXIrxKzNK8wqkOHUbis41bUxeij9MnbhYF/58rBgYp/iRdtVDKZzY/R8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732762911; c=relaxed/simple;
	bh=J1I1NGFND3gCNQw+iTfjeUw+Vme5BUqXDw8wp622M80=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TuhRiXv8j+fYrpvX5CNWZPf9OKg540/rwUfR09W+YH/Yp7R+cTZI7LxK2iHpDxLu+Ub1JBsoKnEzCex7ck/rtj5RTZKHva/1bfKeRsnBYH0dVMC2xLrrlVYOcV11ODa2OSeQGUO7I8o2j/ysIxE8TdkDUerWcGdd+zv2mh/HN+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SOarkFjH; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SOarkFjH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732762909;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ADhYw3BASEmmxql4wBBgnezI+R5IV88aSyjCdPq4lYo=;
	b=SOarkFjH3uBmDXppB77sIjTKlSVnOLJI+NBZgXXCUba9bb+4+gea0tGBx6lVn7tfYWC/vi
	DWLOfcaeJBxHVuNBm+A5U6zTs6EFUsTHUJBbjbQOvT2ErsedzNwmAlvnSvR+JXnPGDwVzh
	o0Fr8aN1wPf4tcUMtGzXGERybgiPCeo=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-365-YTD03-OlN2CDoGrUNuDftg-1; Wed, 27 Nov 2024 22:01:47 -0500
X-MC-Unique: YTD03-OlN2CDoGrUNuDftg-1
X-Mimecast-MFC-AGG-ID: YTD03-OlN2CDoGrUNuDftg
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2ea2bf5b5fbso397466a91.2
        for <virtio-comment@lists.linux.dev>; Wed, 27 Nov 2024 19:01:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732762906; x=1733367706;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ADhYw3BASEmmxql4wBBgnezI+R5IV88aSyjCdPq4lYo=;
        b=frL9ryB2vM2RS5ckbsaFrTXg4xWGuHWS9BDyIrqsoI/0wGAvrQ+8d9jXjruEUE3T6P
         N2QrA0E1OPqg8OKGZkRwiwlI8qftWxNGzvjnpLXFsvm5jGousGX1u5b5H9wAqmgv4ptW
         Shtn+UuSjTtmkbVkEtiAXAxT/TUKfYfh7tgFQVKfIOnNoq8GL8Z1TAmr9fWTft7OJe9i
         puB1PjXVb/71YkxAHB0dMAkNIcgnMf5SxSksjkWmF8SeKUl6UEjcxMECcHT9B/yZ4/r1
         9QyWkWBN0pqDJORqzpk53VFBRhaN55Q5mrmBfGrA5SxoLPwPcMBPgUsZc2HdU8SslfHe
         bb3Q==
X-Gm-Message-State: AOJu0Yzw7rYKy1rmVrOHFhX/6Ka325UN+5qjy6i+fevB2HPjU/0qs2hA
	CIAUKtN7VKcXFzwKSIouoHqZgslKKxBq+vhwTaCj3/FjfpCPBnY/QRhEwPtIEi0luHBmCPLym7e
	7fGqTVz9hwbMMlaqQO0lXKB597lnVoKRooWZYf7vNX5HbG7YffwVkNn7C0g25tKrZIAU85ZZPRm
	jdqC1pNk0nTjt33YUMmc2afyHYCANcp1KAckkWBs/eyX2icZefcChI
X-Gm-Gg: ASbGnctx7sPOvGhkEZaY0mcE90CQV1NWCi0ntJy2Pix3yz4b0n8MwNZJ6deBpYkI3aV
	Qhp63fJwJBcElH825MdDqtzAbMeG/lLsU
X-Received: by 2002:a17:90b:1fcd:b0:2ea:4578:46c8 with SMTP id 98e67ed59e1d1-2ee097bf353mr5915617a91.26.1732762905779;
        Wed, 27 Nov 2024 19:01:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHVSDJpYXH29sTzJzzJh+huUw331yxUuzb064C748m0aKt76D5qMEbD5OIQFv0RePUeqsjCpdeAZJphTu6+Qkg=
X-Received: by 2002:a17:90b:1fcd:b0:2ea:4578:46c8 with SMTP id
 98e67ed59e1d1-2ee097bf353mr5915587a91.26.1732762905305; Wed, 27 Nov 2024
 19:01:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1732699986.git.pabeni@redhat.com> <3e1c45071c8cf4efc7ca0ecc7b52a73c6bf983fe.1732699986.git.pabeni@redhat.com>
In-Reply-To: <3e1c45071c8cf4efc7ca0ecc7b52a73c6bf983fe.1732699986.git.pabeni@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 28 Nov 2024 11:01:34 +0800
Message-ID: <CACGkMEuwEzSaFnup_npjbGVQeUoy5OJexJzwWT9BGmTmayT8RA@mail.gmail.com>
Subject: Re: [PATCH v11 3/4] virtio-net: define UDP tunnel segmentation
 offload feature
To: Paolo Abeni <pabeni@redhat.com>
Cc: virtio-comment@lists.linux.dev, maxime.coquelin@redhat.com, 
	Eelco Chaudron <echaudro@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>, 
	Willem de Bruijn <willemb@google.com>, kshankar@marvell.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: VmQJj62RSyHXI8Z7x_7I1_PtlWaNGoGyBYeMurzra3w_1732762906
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 27, 2024 at 5:37=E2=80=AFPM Paolo Abeni <pabeni@redhat.com> wro=
te:
>
> The VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV{4,6} are two gso_type flags
> allowing respectively GSO over UDPv4 tunnel and GSO over UDPv6 tunnel.
> They can be negotiated on both the host and guest sides.
>
> One constraint addressed here is that the virtio side (either device or
> driver) receiving a UDP tunneled GSO packet must be able to reconstruct
> completely the inner and outer headers offset - to allow for later GSO.
>
> To accommodate such need, new fields are introduced in the virtio_net
> header: outer_th_offset and inner_nh_offset.
> They map directly to the corresponding header information. The inner
> transport header is implied by the (inner) checksum offload.
>
> Those fields are required because a virtio device H/W implementation
> performing segmentation for UDP tunneled packet will need to touch
> the outer transport protocol (for the UDP length filed), the
> inner network protocol (for the total length field, in the IPv4
> case).
>
> Note that segmentation will additionally need to touch
> the outer network protocol and the inner transport protocol. The first
> is implied/easily found with trivial parsing, the latter is identified
> by the existing csum_start field.
>
> Note that there is no concept of UDP tunnel type negotiation (e.g.
> vxlan, geneve, vxlan-gpe, etc.), as a virtio device H/W implementation
> can perform segmentation for every possible UDP-tunnel given the
> specified new fields.
> In the reverse direction, if a virtio device H/W implementation receives
> some traffic for an unknown or unsupported UDP tunnel, it will simply
> not aggregate the wire packet in a GSO one.
>
> Signed-off-by: Paolo Abeni <pabeni@redhat.com>
> ---
> v10 -> v11:
>  - clarified only a single encapsulation level is supported
>  - s/TCP or UDP GSO packets/GSO packets/
>
> v9 -> v10:
>  - mandate DATA_VALID and VIRTIO_NET_HDR_F_NEEDS_CSUM as mutually exclusi=
ve
>    for GSO over UDP tunnels packets.
>  - clarified that hdr_len includes the inner transport header for GSO ove=
r
>    UDP tunnels packets
>  - highlighted that csum_offset refers to the inner header in a specific
>    note
>
> v8 -> v9:
>  - rebased on top of virtio-1.4, changed udp-tunnel features number
>    to avoid conflicts/duplications
>  - fixed typos:
>    VIRTIO_NET_HDR_F_UDP_TUNNEL_IPV4 -> VIRTIO_NET_HDR_F_GSO_UDP_TUNNEL_IP=
V4
>    VIRTIO_NET_HDR_F_UDP_TUNNEL_IPV6 -> VIRTIO_NET_HDR_F_GSO_UDP_TUNNEL_IP=
V6
>  - specified strict validation on RX side (both driver and device)
>    for UDP tunneled packet: NEEDS_CSUM and plain GSO are mandatory for UD=
P
>    tunnel GSO packets. The driver is not allowed to set DATA_VALID for UD=
P
>    tunnel GSO packets, the driver can set both DATA_VALID & NEEDS_CSUM.
>
> v7 -> v8:
>  - dropped 'Note that' in note
>  - NOT set neither A nor B -> NOT set either A or B
>  - specify that 'gso_partial' needs uh->len set to the wire one
>
> v6 -> v7:
>  - replaced inner_protocol_type with VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 &=
&
>    VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4
>  - UDP_TUNNEL now depends on all the TCP and USO segmentation features
>  - reworded the 'VIRTIO_NET_HDR_GSO_UDP_TUNNEL' bit driver normative
>  - specified that  csum_start/offset points to the inner header in the
>    driver normative, too
>  - new fields presence depends on either VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO=
 or
>    VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO
>  - e.g. ->  i.e.
>  - zero -> positive zero (0x0)
>  - checksumming -> checksum validation
>  - explain why we the outer UDP csum can be precomputed only
>    when the GSO packet length is a multiple of gso_size
>  - added an example note for the tunnel-related fields value
>  https://lore.kernel.org/virtio-comment/cover.1722252302.git.pabeni@redha=
t.com/T/#t
>
> v5 -> v6:
>  - split in 2 patches
>  - dropped the unneeded outer_mh_offset field
>  https://lore.kernel.org/virtio-comment/56ccba136272593d0d2af0303600c06f2=
6bd84a1.1718621522.git.pabeni@redhat.com/
>
> v4 -> v5:
>  - add separate negotiation for UDP_TUNNEL_CSUM
>  - much more verbose specification of outer csum handling
>  - UDP_TUNNEL_CSUM requires GSO_UDP_TUNNEL
>  https://lore.kernel.org/virtio-comment/cb89d3d6b6a7e4a7f13e60dd3fded5e95=
0727890.1716448766.git.pabeni@redhat.com/
>
> v3 -> v4:
>  - new virtio_net_hdr fields depends on F_HOST_UDP_TUNNEL_GSO or
>    F_GUEST_UDP_TUNNEL_GSO (Stefano)
>  - Extended the changelog to answer Jason's questions.
>  - Clarified outer csum handling (Jason)
>  https://lore.kernel.org/virtio-dev/f0bf2db203f8061a3ecb50b7a48cf26d8f3c7=
f68.1716193086.git.pabeni@redhat.com
>
> v2 -> v3:
>  - UDP_TUNNEL -> UDP_TUNNEL_GSO
>  - add explicit fields for the inner meta-data
>  - more verbose changelog
>  https://lists.oasis-open.org/archives/virtio-dev/202206/msg00026.html
>
> v1 -> v2:
>  - explicitly state that the outer header probing is mandatory
>  - explicitly state that GSO_UDP is not allowed with GSO_UDP_TUNNEL
>  - clarify hdr_len usage
>  - clarify UDP_TUNNEL_CSUM bit usage
>  - fix a few typos
>  https://lists.oasis-open.org/archives/virtio-dev/202205/msg00037.html
> ---
>  device-types/net/description.tex | 223 +++++++++++++++++++++++++++++--
>  1 file changed, 215 insertions(+), 8 deletions(-)

Reviewed-by: Jason Wang <jasowang@redhat.com>

Thanks

