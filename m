Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36DDC139E
	for <virtio-comment@lists.linux.dev>; Fri,  5 Jul 2024 09:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720171392; cv=none; b=RmR0ZSNfRnQlqf+c8dVO2X2ggxkTffA8sgMEN+nVrFgbR9YWo+vJe01EykB/FChRlNb5XpN3V44bIlL8gpkm8SP0nzPiO7TaTiNy3neQLzqLM+u+87ADcgWfmxuA1wlCGgj7Te0zD73AHv1CUttbOS6ae3zHlX+CdwVvafOAUkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720171392; c=relaxed/simple;
	bh=8VO07NXnUFt9YuclEuBz6vR3rr578U2X1sQQWNxZSog=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UDULu+gaVItI4zrvw8RWnmzluqUoF1lQXD0QjmdlDXHSlaiUoE5+SnY3HQoAb2dzokyaPa4JDMUQyywDUe6FiOv+6aiWkXxU362N955XnN4AOr2hUGIlDRceIcIPj0gzZybsdOcpzpOKmNrNLpwqU8qwUjJ0dPY6maZ44jp+wnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=McGOJd/8; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="McGOJd/8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720171390;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=8VO07NXnUFt9YuclEuBz6vR3rr578U2X1sQQWNxZSog=;
	b=McGOJd/8AiZCiFrXlqducsRoXEPrXWDvAVBYn1bI+i7QzvOK4rCxsV3ifoEz1CkX4ScZHM
	YHahmD7K4X88LEvNFMR+FGK4Yua6xx0WIPVt7ConfrI8bj1wqD5O1tT5iU755GGhl7/vvF
	EWEuS8uJ7lR144EXsl8fnpy3XPNpkQQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-513-9c8UruvxOcO-d_dbjzjXDw-1; Fri, 05 Jul 2024 05:23:07 -0400
X-MC-Unique: 9c8UruvxOcO-d_dbjzjXDw-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-42568f0bc56so2616255e9.3
        for <virtio-comment@lists.linux.dev>; Fri, 05 Jul 2024 02:23:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720171386; x=1720776186;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8VO07NXnUFt9YuclEuBz6vR3rr578U2X1sQQWNxZSog=;
        b=lFOjljCnYzwh37pdZewHcUmizvAC05kC9ZA+WKo/RiXhsAS+vKSbKy+UT5Hgp8nmId
         aY2geOgzE3dkmcVodsjuvT4zoEfK8CJzfj1aZu5Vm1DBK4OE83q8qehApwZ9c6hBnc/R
         qneCLUHF8XXx8UG2Kp3CHGy0B4AFpLxaxUsvP85K4Ay3HO/u5+OcUoCsSSmXI+pERyUP
         S6SfE4OrbJvGeaH7xhql6jVHIWkji3bl3N+7O0L8a7xlzgg+ozMBkydwbMruG2ux70PW
         kmYHYuEEi6YuuxTKv/E7T1Pn3RS+eeOqzU9oHZj4GjE1gGA9GvygyY5AmpjEafhbQMEp
         aoPA==
X-Forwarded-Encrypted: i=1; AJvYcCUzT59ir7TWzLWyfU7W3oG8Ut9Ud/SnJ+RMOhI0i3pf6DsFuYUp1YcsFID3/uOlVLHufswlqtJBmmZVnCatUh8a5FXm8s5ie9E908CSWqg=
X-Gm-Message-State: AOJu0YywHGjo3we8nm9B419+EvG7s/ww+u2Ohveqqsn7oC9Tj+EjtLBn
	GGannSKfvYYcCu5/zlo2lSbruuWNTQUbbfq9Zh7+NnZJ1e6Ti5B8xNnhu7z0SXAYs3ydXFWlaYI
	emg3M8FoCkS5FGvcn1jYQTsYYP6lcKAQrOCetHfNq5ux0v1G/TTeN7ohkTRQOlqkK
X-Received: by 2002:a05:600c:510d:b0:426:4920:2842 with SMTP id 5b1f17b1804b1-4264a45f67amr27815345e9.4.1720171386011;
        Fri, 05 Jul 2024 02:23:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+xcs2tcxlVAPPexCejyI0HTq8cmN7BmWx3HhZlFbR83J/C7gPgR6BOCqFpIpnlh2XxB7i4A==
X-Received: by 2002:a05:600c:510d:b0:426:4920:2842 with SMTP id 5b1f17b1804b1-4264a45f67amr27815235e9.4.1720171385634;
        Fri, 05 Jul 2024 02:23:05 -0700 (PDT)
Received: from gerbillo.redhat.com ([2a0d:3344:1712:b10:dc4e:8e03:a5d:f914])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367990b305bsm4355414f8f.115.2024.07.05.02.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 02:23:05 -0700 (PDT)
Message-ID: <a1a7625f669d58f17e047adee64e050f438d9fbb.camel@redhat.com>
Subject: Re: [PATCH v5] virtio-net: define UDP tunnel offload feature
From: Paolo Abeni <pabeni@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: Willem de Bruijn <willemb@google.com>, virtio-comment@lists.linux.dev, 
 maxime.coquelin@redhat.com, Eelco Chaudron <echaudro@redhat.com>, Stefano
 Garzarella <sgarzare@redhat.com>, Michael Tsirkin <mst@redhat.com>, Parav
 Pandit <parav@nvidia.com>
Date: Fri, 05 Jul 2024 11:23:03 +0200
In-Reply-To: <CACGkMEtsqjnFGFnZzF825ur8zz9--QovkxW5oCi+TT6Pu7S9oQ@mail.gmail.com>
References: <56ccba136272593d0d2af0303600c06f26bd84a1.1718621522.git.pabeni@redhat.com>
	 <CACGkMEt-Ep+At_4YvkJ2t8UmQHJ0-Qm6fAPbGpkV_AfVyNq2EA@mail.gmail.com>
	 <ed07e9bb9ae5bc1a171c77425cc0b96e6b87745c.camel@redhat.com>
	 <CACGkMEvD_WDN5yeRKcZ2ijRF8C2_Pmr6UZWMNt+_R6S0WHY5Fg@mail.gmail.com>
	 <e5d885e6331b18b3be63facfd59658b316f20de1.camel@redhat.com>
	 <CACGkMEsbiN90ptOL2XHauzWS=9j5RXtnO7OD10yChPaUO3CY_A@mail.gmail.com>
	 <2f1c19591ff456ada2a1ad470032d3e3fb9f88d7.camel@redhat.com>
	 <CACGkMEv9gGrLO0OkHYKmjqrLw50kfm2yaifMk1wnb6noa5L99w@mail.gmail.com>
	 <4497c727ea6cc696ba7d60bcb95ba9bce33f1136.camel@redhat.com>
	 <CACGkMEu_ODQV6O5-w6Hzg5gk-8x_iRsuWSk4fN2vzznPEYKphg@mail.gmail.com>
	 <5914dd3b40bca9ca0a49aa31845a2bda49c862c2.camel@redhat.com>
	 <CACGkMEtun+4xhh1s6o8kEnGGg4gvVS2ocuUr2yvubTNQqGcNkw@mail.gmail.com>
	 <ead6fe1f23295906b7239cf946d51762132b29de.camel@redhat.com>
	 <CACGkMEtsqjnFGFnZzF825ur8zz9--QovkxW5oCi+TT6Pu7S9oQ@mail.gmail.com>
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

On Fri, 2024-07-05 at 11:26 +0800, Jason Wang wrote:
> On Thu, Jul 4, 2024 at 12:33=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> w=
rote:
>=20
> > Anyway if a device can't perform H/W GRO it will send to the driver non
> > GSO packet. It will not need to fill any fields for that.
> >=20
> > Let's suppose we have to host with H/W virtio net support, both
> > exposing F_GUEST_UDP_TUNNEL_GSO, host1 can do geneve H/W GRO, host2
> > can't. I don't see migration issues between host1 and host2. The latter
> > will not generate any UDP TUNNEL GSO packet for geneve, but will send
> > to the driver plain packets, as on the wire.
> >=20
> > What I'm missing?
>=20
> Probably not but not sure if this is a actual bug, but consider:
>=20
> Guests can only know inner protocol X and Y. So did host 1. But after
> migrating to host2, it can have inner protocol Z. Can this happen or
> not?

As mentioned, the guest will not parse the packet, it just need to
validate the fields.

Yes, the above scenario can happen, but AFAICS it will not cause any
bugs.

The guest will be able to process and segment the UDP tunnel GSO
packets with unknown UDP tunnel protocol thanks to the mentioned
additional fields added to the virtio net header.

Obviously, if the guest don't understand geneve packets, and the host
suddenly starts sending them, at some point such packets will be
dropped inside the guest. =20

>=20
> > > 2) Is there any existing NIC that can do RX UDP tunneling GSO?
> >=20
> > AFAICS, the only NICs supporting HW GRO for UDP tunnel packet use the
> > bnxt driver. and think the implementation is buggy (it does not
> > set/fill must sk_buff fields).
>=20
> Ok, I see.
>=20
> So in conclusion, I think we are kind of on the same page. I
> understand that those inner fields were designed mostly for VM2VM or
> VM2Host.=C2=A0

Even for the Host2VM case, too - to allow the VM to reconstruct correct
GSO packet.

> And still something needs to be considered:
>=20
> 1) inner nh/mac/protocol seems to be meaningless for hardware
> virtio-net implementation, anything we can optimize on this? (maybe
> not since e.g num_buffers is meaningless for TX as well)

Do you mean in the Host2VM direction? They are needed to the VM, to
fully understand/build the GSO packet.

Or do you mean in the the VM2Host direction? The device will need them
to do H/W segmentation of the packet.

AFAIK some (most?) high-end modern NICs have programmable H/W parsers
able to extract a quite considerable amount of programmable data out of
the packet.=20

> 2) do we need to hear from hardware vendors to see if there's a chance
> to implement RX UDP Tunnel?

The bnxt driver proves it's feasible. The lack of other NICs with such
support hints it's difficult and/or there are is no large demand for
that (I wild guess the latter).

Possibly we can make the life easier for H/W driver implementations
adding a configuration command -say VIRTIO_NET_CTRL_UDP_TUNNEL_CONFIG -
and allow the guest to explicitly request/enable specific UDP tunnel
types?

Somewhat related question: what happens after a migration to the
configuration send by the driver to the device? is up the the VM
somehow catch the migration event and re-send them? Or after the
migration the VM is expected to run on top of a driver with a different
configuration?

Thanks,

Paolo

