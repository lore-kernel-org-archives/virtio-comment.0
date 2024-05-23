Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799CE171C4
	for <virtio-comment@lists.linux.dev>; Thu, 23 May 2024 07:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716450609; cv=none; b=GBoHlXFaMkkD6/aRWJSWOOy/LUa8CEfYe16BO3ZA7PBZ4zI6TBz10VLxFnr1AH1I/d7Wmo8SXXKTLZP76vWTFNfHjxpuWUGYcuXYO3xirvdHu3PVORed3at8LG1DIBNf7BskMKN1Nj6v7xGsL6TgSCPRKK3YGDcilBayPdcqx1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716450609; c=relaxed/simple;
	bh=i55dsf2x9TsiysbUuw8aysU3FgVFfczx468naGmvAhc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=loDsx62aP4VN5SvhHBHb2knR527bXRtkfKVmrjFEGJDGRXPHDBvpi/RM/9PyHD9LXq6ux5W0NMsWExy+H3rTjzZ7ZPMdNHk1lEgx8ADvSKFQn64YKGGEOWbfwx8XECxRfucz+hx0mqEcUFGGXXI2YY7ONyOsSF5pBfQCbCiLL5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=L5MAhp95; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="L5MAhp95"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716450606;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=zASBHYURVs5l/8ThI67PJfpe/x+NvokHmqTI6znGOQs=;
	b=L5MAhp95oNe4eyahOhuKU/C3y2Oc+Ljj+th5t37JZuDB0eu1pxA4iolGjckkgEE0gdW+4+
	99wD75qCCVua+dE4coADP5shpCBczS6dtex0O2mUmJCh5sjpXONSt08vShg/wkzMw3CvCo
	BIkWTl0MgpCZbcfoBvXCr5gJiuJpHEE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-45-p2LcDia3NF2czMI9D58V4A-1; Thu, 23 May 2024 03:50:05 -0400
X-MC-Unique: p2LcDia3NF2czMI9D58V4A-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-354dfd4971dso198787f8f.0
        for <virtio-comment@lists.linux.dev>; Thu, 23 May 2024 00:50:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716450603; x=1717055403;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zASBHYURVs5l/8ThI67PJfpe/x+NvokHmqTI6znGOQs=;
        b=h8gpiNUWZEw9ILbc0GEtRx1Im6L9nSNBRYhRUHtvH/CtinF0tav4nVC8+4Dl50479v
         qJt4anMda774zL6LJQg0/OH4ckA5ON35MJUrNGQZVqgrwnF/G+0d16BIFbZgMH+nzDgu
         osaXtZEB+oHqJfgLPbGj8Fiqnza0U4ixodpBZKKa60CqFFhy7ftr04Xr5UibRjeHUkBz
         rb125fzrGklbXS17FZIviLlTXTCRIv6SYE6VeVYHIbaeUue8PDGeHWtNuRAfObDR7CgT
         vsQbG089HQmw8XRZ+XFDMUKx2TJ4g0vMNbFP7K/pHj47uetiD84i3/n5eyT3YbHB2Diy
         vjnA==
X-Gm-Message-State: AOJu0YxEc+tbY2FUj3YCs5IoSkdlltXn8S2zQkV2r7kpFAseW6a5run+
	SXQaVUeCTpPoPXWfVM1gBVBQB4CuPnt35X1dB/YpRi+079BO1Ffd0L8od6KaXMZtNMJ2T8j5l/m
	bnuQ+U8EgxxjNhAeQwQTeaDVlVqmv/9APVSU0s26faj/6iC6zAx30uhLaAzj52Kkesa7kjQxiQw
	n1CPkXmayaStmW+cagkGOH+AwHXjHJ4KTU6m+7iWRfJOI8gg==
X-Received: by 2002:a05:600c:5106:b0:41f:cfe6:3646 with SMTP id 5b1f17b1804b1-420fd398cacmr29897815e9.4.1716450603561;
        Thu, 23 May 2024 00:50:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxoNRlJEYeTiinXzr0YtY5ps5KbRktcFNdB357mOzOxCdHPNkvQNRtWvH1kxlm489GBDIRAQ==
X-Received: by 2002:a05:600c:5106:b0:41f:cfe6:3646 with SMTP id 5b1f17b1804b1-420fd398cacmr29897575e9.4.1716450603043;
        Thu, 23 May 2024 00:50:03 -0700 (PDT)
Received: from gerbillo.redhat.com ([2a0d:3341:b094:ab10:29ae:cdc:4db4:a22a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-354cdbfb964sm6366277f8f.25.2024.05.23.00.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 00:50:02 -0700 (PDT)
Message-ID: <dc75f2cbc2b11976d87fd82041844ea4c896c44f.camel@redhat.com>
Subject: Re: [PATCH v4] virtio-net: define UDP tunnel offload feature
From: Paolo Abeni <pabeni@redhat.com>
To: virtio-comment@lists.linux.dev
Cc: maxime.coquelin@redhat.com, Eelco Chaudron <echaudro@redhat.com>, Jason
	Wang <jasowang@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>
Date: Thu, 23 May 2024 09:50:01 +0200
In-Reply-To: <cb89d3d6b6a7e4a7f13e60dd3fded5e950727890.1716448766.git.pabeni@redhat.com>
References: <cb89d3d6b6a7e4a7f13e60dd3fded5e950727890.1716448766.git.pabeni@redhat.com>
Autocrypt: addr=pabeni@redhat.com; prefer-encrypt=mutual; keydata=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
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2024-05-23 at 09:20 +0200, Paolo Abeni wrote:
> The VIRTIO_NET_HDR_GSO_UDP_TUNNEL is a gso_type flag allowing GSO over
> UDP tunnel. It can be negotiated on both the host and guest sides.
>=20
> UDP tunnel usage is ubiquitous in container deployment, and the ability
> to offload UDP encapsulated GSO traffic impacts greatly the performances
> and the CPU utilization of such use cases.
>=20
> One constraint addressed here is that the virtio side (either device or
> driver) receiving a UDP tunneled GSO packet must be able to reconstruct
> completely the inner and outer headers offset - to allow for later GSO.
>=20
> To accommodate such need, new optional fields are introduced in the
> virtio_net header: outer_th_offset, inner_protocol, inner_mac_offset,
> inner_nh_offset. They map directly to the corresponding header
> information.
>=20
> Note that the inner transport header is implied by the (inner) checksum
> offload, if present. Otherwise, it's up to the receiver to detect the
> inner transport header offset from the provided information, as it's
> currently the case for plain (not UDP tunneled) GSO packets.
>=20
> The outer UDP header may carry a second checksum, which can be offloaded
> independently from the inner one. Since UDP tunnel checksum offload
> support makes little sense without UDP tunnel GSO support, to avoid
> unnecessary complex feature negotiation, the
> VIRTIO_NET_HDR_GSO_UDP_TUNNEL feature implies the support for the outer
> header checksum offload and the checksum itself is handled similarly to
> the inner header one.
>=20
> Migration for GSO_UDP_TUNNEL enabled VMs should be managed alike other
> types of GSO offload: VMs that has negotiated such features could be
> migrated only on hosts supporting such features.
>=20
> Note that there is no concept of UDP tunnel type negotiation (e.g.
> vxlan, geneve, vxlan-gpe, etc.). That is intentional because:
> - given the information carried by the guest or host kernel, it's
>   impossible to probe reliably the UDP tunnel type. Specifically, the
>   outer UDP port numbers give a hint, but peers could use nonstandard
>   ones.
> - all the existing UDP tunnel protocols behave the same way WRT GSO
>   offload, carrying an immutable header on top of the outer transport
>   one.
> - if a new UDP tunnel protocol, carring packet dependant information
>   alike the inner packet length or csum should surface in the future,
>   the host and guest kernels will need explicit support for it,
>   including new, different GSO features. Additional virtio support
>   should be designed separately.
>=20
> Signed-off-by: Paolo Abeni <pabeni@redhat.com>
> ---
> v3 -> v4:
>  - new virtio_net_hdr fields depends on F_HOST_UDP_TUNNEL_GSO or
>    F_GUEST_UDP_TUNNEL_GSO (Stefano)
>  - Extended the changelog to answer Jason's questions.
>  - Clarified outer csum handling (Jason)
>  https://lore.kernel.org/virtio-dev/f0bf2db203f8061a3ecb50b7a48cf26d8f3c7=
f68.1716193086.git.pabeni@redhat.com

Overall only minor edit over v3, just to restart the conversation.

@Jason: I don't understand a question you raised on v3:

"""
1) if there's no concept of UDP tunnel type negotiation, would it be
possible for a device to just implement vxlan?
"""

Specifically, I don't understand what do you mean with 'just implement
vxlan': there is no concept of vxlan-specific GSO offload in Linux, all
UDP tunnels are exactly the same thing from GSO perspective.

e.g. see:

https://elixir.bootlin.com/linux/latest/source/drivers/net/ethernet/intel/i=
ce/ice_txrx.c#L2061

Could you please re-phrase?

> @@ -407,12 +421,14 @@ \subsection{Device Operation}\label{sec:Device Type=
s / Network Device / Device O
>  #define VIRTIO_NET_HDR_F_NEEDS_CSUM    1
>  #define VIRTIO_NET_HDR_F_DATA_VALID    2
>  #define VIRTIO_NET_HDR_F_RSC_INFO      4
> +#define VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM 8
>          u8 flags;
>  #define VIRTIO_NET_HDR_GSO_NONE        0
>  #define VIRTIO_NET_HDR_GSO_TCPV4       1
>  #define VIRTIO_NET_HDR_GSO_UDP         3
>  #define VIRTIO_NET_HDR_GSO_TCPV6       4
>  #define VIRTIO_NET_HDR_GSO_UDP_L4      5
> +#define VIRTIO_NET_HDR_GSO_UDP_TUNNEL 0x40

Note that we can't use '6' here, because GSO_UDP_TUNNEL is a 'flag'
that can be set together with other offloads e.g.
VIRTIO_NET_HDR_GSO_TCPV4 or VIRTIO_NET_HDR_GSO_TCPV6.

Quite alike VIRTIO_NET_HDR_GSO_ECN, I think.

Note that GSO_UDP_TUNNEL could additionally be set together with
VIRTIO_NET_HDR_GSO_UDP_L4.

Cheers,

Paolo

