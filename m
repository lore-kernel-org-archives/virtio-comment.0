Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A41546AF
	for <virtio-comment@lists.linux.dev>; Thu, 23 May 2024 08:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716454038; cv=none; b=ce+IzAfi6jbxO6qUx2NhdkjilBVNOhxFJXHEQoihV0LRRGlpkxFamCYEpGvcZniawuFj96v8MqDoDdrTqHswZUV40E9hbopMCYDKy8WNNuR77s84Wb5v1ybp5SLCgEp0mVdvhMq29AnVQfELrcBHuQhKkV494/tA0NSyGUJsYNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716454038; c=relaxed/simple;
	bh=H8OGDMWEYg3AZh0fA8Isd3wpt4OaqMkFtI1SStfzTA0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F+u1AKCRvB2DxrjpPb/rHnAI3ZmwjiCk09DhfSJdigTePsrKpAPj4OD4SYh/Ho4F+8DvnpFFp4Axu6M4IoN/ZmeP7RgXiXjMG4SCsbnE3AUsEbdq977HdzJ5Tg16Zqe/OQ2RHeDDBAljx9T00b18Lxfk2Nxe3PKRgxvheRBIKqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VnjUb6oo; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VnjUb6oo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716454035;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=pM3wAEHlubVpG2q7grG9WEipML6hhx4AvCV2AUE0wGY=;
	b=VnjUb6ooRpJc59KLvjWq7pvWDbTIozDHxOWvqM/HBWMKxtp7JH5KUlJKYHh1Z/HJ7FHLpF
	Sa6FY8FzXYaV5+N/8xXGWan6IaimQ2+ejpD1VJb+9lpJC7ws4Z7Yu3G933hm1duZZytAV4
	q9FakgM20kZekfM7Z0Sz/KfAmrFSbmg=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-631-Xdq-vlHOPmivGg1Sps4Lag-1; Thu, 23 May 2024 04:47:11 -0400
X-MC-Unique: Xdq-vlHOPmivGg1Sps4Lag-1
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-792d97e9195so10066185a.1
        for <virtio-comment@lists.linux.dev>; Thu, 23 May 2024 01:47:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716454031; x=1717058831;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pM3wAEHlubVpG2q7grG9WEipML6hhx4AvCV2AUE0wGY=;
        b=uE6xYBDtBUifrq2MjB+fyoEFxxtTluQfkhM7cwegnWpjYiQHqsR5bM82dN4JSx2uGq
         DsjSzNi6MWkre5cRnzuhlPGbABol46MYwbKh49DGM//r1soTdE2sHcfSDmAdsua0l7mv
         SRf1eaAftlwmM37ctop+i5gAw5m+Z8rHKD0/uGx1Rulgfv0feMGF6r3jlc6FehPwFPUS
         l18LbYTWGmr9hdtgHubjdEWTE76qC7yu1NVCbHInvMebqIqMQqEeRj1HufzclK2zXm6c
         og8+ZLgjff0Plfy1vwbknnogF7U+R+PyQLbo0D1ufNStWwX5jIbNQQvjPKFL7OZ/pFIi
         UKog==
X-Gm-Message-State: AOJu0YzjO+uzekMPnmQzzjCxnZ9buu4MWDpxvoqlG2puf8TaWwDll5V8
	5cnmVc7oKgHwief+LbjfD17CwbQfr/VkFVgG3Zg0oxWROviOLUoEyDkO+axJs49NgFzije2b22Z
	3BLJGEmy7gmm6tD8Ztd/36bp1gv18JN1qxhQb658UBAX82OgZ6sD9bKMIufhbnAWuO4cDY1kMy2
	LFHTlx+8mtOAmXBqA+4WeX0KOr5NOo98z/IHVJO5tVKEJXKQ==
X-Received: by 2002:a05:622a:15c1:b0:43d:f5d7:bfae with SMTP id d75a77b69052e-43f9e20bc18mr46832361cf.6.1716454030645;
        Thu, 23 May 2024 01:47:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGuvZ1wNBU18kip67rdfp0rzdS309Yx0D5le9526Vaz7ETB/g1H2c/VhXge/0EbGiarXhbZg==
X-Received: by 2002:a05:622a:15c1:b0:43d:f5d7:bfae with SMTP id d75a77b69052e-43f9e20bc18mr46832031cf.6.1716454029990;
        Thu, 23 May 2024 01:47:09 -0700 (PDT)
Received: from gerbillo.redhat.com ([2a0d:3341:b094:ab10:29ae:cdc:4db4:a22a])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-43df5506fbbsm183171651cf.41.2024.05.23.01.47.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 01:47:09 -0700 (PDT)
Message-ID: <ed730a7e12853339c6f5f298fa6c240a39942a74.camel@redhat.com>
Subject: Re: [PATCH v4] virtio-net: define UDP tunnel offload feature
From: Paolo Abeni <pabeni@redhat.com>
To: virtio-comment@lists.linux.dev
Cc: maxime.coquelin@redhat.com, Eelco Chaudron <echaudro@redhat.com>, Jason
	Wang <jasowang@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>
Date: Thu, 23 May 2024 10:47:07 +0200
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

Thanks!

Paolo

