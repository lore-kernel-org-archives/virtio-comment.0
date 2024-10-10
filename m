Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A8A6FE16
	for <virtio-comment@lists.linux.dev>; Thu, 10 Oct 2024 02:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728527363; cv=none; b=AtdTWyI3QzdEFPbPLFMXjiWYZh8/7Y+wDGtaqhekE03AxD+X39Yhz6m4JWKt9HB3WEBk+EjBGoAq+rKq4FeiiBw+DWaMfFkO81KLFAL8A97/76my1fGnlZrKx0eZbey7VajED4c+4FUkvdPj3K7iFu4YlKr1QBU3yX3IR+g7CgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728527363; c=relaxed/simple;
	bh=X3tsypVCA77h1KeqYguzzvB2iGqm8zSPA7r67rucd4Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Iqa0gCDWo7jIOPg1EYKL6zgdrfNGk0G1025iOaGaJ11Hj8j+bMIIo6fbK0hij5xEZOlL8HGFY9D8zJhFWsRCoJfeBnhri9T4YEGfNpAoIdm4gKVbxBIOce+Tt6gejgy25U1Y23OY4wBjiFpCueH55ud79wcUHMmeGqlLq+D8EVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SnUXGqxL; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SnUXGqxL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728527360;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X3tsypVCA77h1KeqYguzzvB2iGqm8zSPA7r67rucd4Q=;
	b=SnUXGqxLNSrOxfPoPHMrVy14rxFH8t+jeKNSCR+azSu+sipT5xK37HZRUWY2EX5rf6QjkE
	EKRsMVerIt3dt2zHQgPN1PXWHSAc5HMs59n6024GA+HH8z50mdsjEb2b0PYi4aEjDSMKW3
	yi6Pw77b4mbNDqOOp8Fj/ayy1d6+gMg=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-91-GjcwphT1PTqKGr_Xajnpag-1; Wed, 09 Oct 2024 22:29:18 -0400
X-MC-Unique: GjcwphT1PTqKGr_Xajnpag-1
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2e2d396c77fso253426a91.2
        for <virtio-comment@lists.linux.dev>; Wed, 09 Oct 2024 19:29:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728527358; x=1729132158;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X3tsypVCA77h1KeqYguzzvB2iGqm8zSPA7r67rucd4Q=;
        b=p7q/EXdZqTLITPdrpmmvjB5rb0557OK2Dux+Z9UA9tzD89t/tAb2F1Il+MYcBzI/Db
         lQkf2OmzliQHfvo8vmYtEhgkr0jmVtrbvoWGQ5FmvzY2QT5vTXvS/Ybd+3OPQ+PTLtf5
         TP99wAT+fgy5EFN6Nv9M/oKo0xAAZnQIvZJHjODiy0MZF1/ayyI2fORpyzwRoc00j7HD
         VQ9+B5T1MC+GcV8NgtYcXmecBtn6+3T6rLskBHMos6X9wbRciBmDCZ7F8xymPlPriolb
         9416hMeQEoYWac69s2mIEDnj9uajO5tEfL8o5DnewEC/VygeKs/ohAV+ShXpOUKIvre4
         Bl1Q==
X-Gm-Message-State: AOJu0YzHU79ygUz6CXhGVTK/vsPJjH2mqprAMr7bipXK7HJmTcARNU7W
	Glv+SowLVmRD5hq0smlSkOXAVg42AFnQct9tF2E6PdAlzLp4LrzzoJhd3YfaT5Un1ZWxi12batl
	bQFVj+MeUx0g2seW5GC8XUzg2dD7pTWZTEyYmbdOoS6c/afC+3yGwsgVyhdS83YtoIYdTPUjU8K
	zsckojJliUEsjVDtwj0DkKzPv1uBukHFBY9s21KBU=
X-Received: by 2002:a17:90a:d98f:b0:2e0:74c9:ecea with SMTP id 98e67ed59e1d1-2e2a2330397mr6193284a91.10.1728527357746;
        Wed, 09 Oct 2024 19:29:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFff1ax8PFcGxGOWU69qXwnUSnXoSoQ/UqnPOzMqpvVXw1jg1YiFuQmkR88DLBBIdUtTn9eqIqq21uPYAZTlIk=
X-Received: by 2002:a17:90a:d98f:b0:2e0:74c9:ecea with SMTP id
 98e67ed59e1d1-2e2a2330397mr6193264a91.10.1728527357297; Wed, 09 Oct 2024
 19:29:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1728029499.git.pabeni@redhat.com> <54b59f12-74c7-4ec4-962d-b5a9d7490580@redhat.com>
 <CACGkMEsV9jrsAHLZn2gJWeb7+R0W360n7fjg6E3QiA4CZgaUvg@mail.gmail.com> <d7accb9e-4978-400e-8675-8188d02dfda4@redhat.com>
In-Reply-To: <d7accb9e-4978-400e-8675-8188d02dfda4@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 10 Oct 2024 10:29:05 +0800
Message-ID: <CACGkMEvmhdYMHf5HKX37XqAYO2uHPq1=eWXfBPoS2gp8FJezDQ@mail.gmail.com>
Subject: Re: [PATCH v9 0/2] virtio-net: define UDP tunnel offload
To: Paolo Abeni <pabeni@redhat.com>
Cc: virtio-comment@lists.linux.dev, maxime.coquelin@redhat.com, 
	Eelco Chaudron <echaudro@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>, 
	Willem de Bruijn <willemb@google.com>, kshankar@marvell.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 9, 2024 at 4:16=E2=80=AFPM Paolo Abeni <pabeni@redhat.com> wrot=
e:
>
> On 10/9/24 09:24, Jason Wang wrote:
> > On Sat, Oct 5, 2024 at 12:53=E2=80=AFAM Paolo Abeni <pabeni@redhat.com>=
 wrote:
> >>
> >> On 10/4/24 10:13, Paolo Abeni wrote:
> >>> Note that such while the mentioned PoC is based on the previous
> >>> iteration of this change, it already deals with all the delta introdu=
ced
> >>> here except the refined DATA_VALID handling. I'll try to update the P=
oC
> >>> WRT that ASAP.
> >>
> >> The updated PoC dealing with DATA_VALID according to the spec change i=
s
> >> avail here:
> >>
> >> https://github.com/pabeni/linux-devel/commits/virtio_tunnel_gso_v9/
> >> https://github.com/pabeni/qemu/commits/virtio_tunnel_gso_v9/
> >>
> >> It's slighly less untested than the previous iteration, as the
> >> CHECKSUM_COMPLETE/DATA_VALID code path is explicitly covered allowing
> >> the user-space to configure the tun device to set DATA_VALID on the
> >> xmitted virtio hdr.
> >>
> >> @Jason, please LMK is something additional is needed to reach the boar=
d
> >> voting.
> >
> > It should work at a first glance. But the tnl_offset and new ioctl
> > seems a little odd. Any reason we can't deduce it from the features?
>
> The tun device does not know the complete layout of the virtio_net_hdr.

We can teach if it is needed.

> It knows only the total size but is not aware i.e. if the
> VIRTIO_NET_F_MRG_RXBUF or the VIRTIO_NET_F_HASH_REPORT are negotiated.
>
> To support UDP tunnel GSO offload, The tun device must be able to parse
> correctly the UDP tunnel fields, so it must know at least the tun fields
> offset inside the virtio_net_hdr structure.
>
> The new ioctl is added to pass such additional data.

Then if we want to add new fields of vnet header that tun needs, new
ioctls would be added endlessly.

> A possible
> alternative would be piggybacking the mentioned 'tunnel offset' inside
> the offload 'long'. I avoid such option because it felt quite hackish,
> but it you feel that as preferrable it's still doable.
>
> Another option would let the user-space know to tun all the relevant
> negotiated features, but that look quite more invasive (I would avoid
> such option at least for a PoC).

Yep, for POC, the current code should be sufficient. But I meant for
the formal submission, we need a better way.

For example, we can map some of the virtio features to tun features
(like GSO). or it looks to me the tnl_offset is a fixed value. I think
we can deduce it via TUNSETVNETHDRSZ.

>
> > I'm asking since the design needs to work with hardware implementation
> > as well. So any channel outside virtio (e.g the TUNSETTNLOFFLOAD) may
> > not work.
>
> I've no idea about the above. My uneducated guess is that H/W
> implementation will still need a S/W interface, and such interface could
> implement the new ioctl().

Seems not, the only interface for virtio-net-pci devices is the registers.

Looking at the qemu implementation the set tnl offset is called from
the feature negotiation path. It means for hardware it can deduce it
from the feature negotiation somehow.

> In any case I guess a new SW and/or firmware
> revision will be needed to support UDP tunnel GSO offload on virtio H/W
> impl.

Thanks

>
> /P
>

