Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC4A22301
	for <virtio-comment@lists.linux.dev>; Mon, 27 May 2024 08:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716797200; cv=none; b=m4RM354laD9ZlIfyp0+6gePyiBd5YBDpr8y/szO44yf8u0T81ARb5gHj58m5F1JzIW3jv7lNl2WR6dsCMAaWDfbZQ/vXv+B2UC8OdFR2tKr2Gt7/CHJ0xzJ1ayZ9w4sY6mGkmflHcD1GL3Mh7A+BflxFq/q0VwOqXmXdVmZzRus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716797200; c=relaxed/simple;
	bh=dmxvZOF9dLhR9Pp81tldsYweV2PuIbi+E/xVPmYPLlk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qTMWZ59J5fYiVwFCpgfrBXQQEVlKRWX4orc/Urc6/3hq9DWNXHuRqLCe00wQe6ss08inyDdQ6UrJ3lNOiSvmMhPaHaWaPUF1muEXsStrs6pstWcm48KMhxl7MJCjltG4hn7zVZAwDVMi6Ide/qQ0Ob49xmDwsHw5MKd9h7v5WyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=c6VraeVW; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="c6VraeVW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716797198;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=EDf5EqDNhJ0Zm5ZPyp05FZYplP2N2oA2fM7EuWB876s=;
	b=c6VraeVWPUvSQrOGv9INKCMCp1c3mU+LiUKEJxemjsSrgAoGHxwbVAsBMlD6StJcO6Wsjv
	UeerhBzDqR3bGojrAsWgqg69wZwR5Qruokg3obfFpMo6+xpaTTX3FlNUv6x7ayQmn7ivwo
	FSx8EUfoV1g/XQpkrfaRe5UyLmiZ8qg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-222-aNVhZ3hYPWi0VleP_iLeSg-1; Mon, 27 May 2024 04:06:36 -0400
X-MC-Unique: aNVhZ3hYPWi0VleP_iLeSg-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-355072f3014so326429f8f.2
        for <virtio-comment@lists.linux.dev>; Mon, 27 May 2024 01:06:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716797195; x=1717401995;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EDf5EqDNhJ0Zm5ZPyp05FZYplP2N2oA2fM7EuWB876s=;
        b=YEQYtqVPe50njAojkV0F5gMYpzxFcPlX9MeLKW5KiKm/b4Ic9XWtXKRB2uHO46yyAO
         Im55QXwNMhkq4H1Tu2D9K2x9hYPckVmnFsB9bjlpZu5qKcekqAY21iiJCzju7xbTnHP1
         ZmQMVVFh/wJhaMKDDyuoZpAWgJrcNdrl2CplidFEcRvnGssJ3jZP7WZRcjDT750xwcph
         YVR0k9QpLja3dRC6AvyUQ2Qb2QVxDbwIgKZNBBtnn7Qaa5iXnZFwOkkz+LSYh+/coZPl
         bY5mC7LwsygGmgPXAs1aF4BA0fumeulrKWjihSQssG/25+UvZyxOr2ZEAzgoE73YxDBt
         VuFQ==
X-Gm-Message-State: AOJu0YyeUit89JgATgInFraK6I4kmDGtohXadhYpQmBRKX36HeA/vqRu
	k8MV/DETlp+7fWEGsHTuHkH36oHW/49Ljuzl+I4cntMKFHWE/st3nX0+UNg623TzQfTZsYArRrC
	whT7uFPRt2pC94Zb+CzPzZrSjudTBHJDfLpJ747h4QZUyHn8N2muU4DydGp+N+Tb3
X-Received: by 2002:a05:600c:4709:b0:419:f4d6:5044 with SMTP id 5b1f17b1804b1-42108a01442mr65643855e9.2.1716797195045;
        Mon, 27 May 2024 01:06:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHyIUKAbHX9cda+6Cbzcn++uxW+R2cTgq9oB56gCbRd9CB7HLGHIvlIZrFZkEYXP2O8MmLMag==
X-Received: by 2002:a05:600c:4709:b0:419:f4d6:5044 with SMTP id 5b1f17b1804b1-42108a01442mr65643725e9.2.1716797194581;
        Mon, 27 May 2024 01:06:34 -0700 (PDT)
Received: from gerbillo.redhat.com ([2a0d:3341:b094:ab10:29ae:cdc:4db4:a22a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42100fad970sm133202165e9.37.2024.05.27.01.06.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 01:06:34 -0700 (PDT)
Message-ID: <a630f422b86ea4dd96418a84b5eea196fc98f326.camel@redhat.com>
Subject: Re: [PATCH v4] virtio-net: define UDP tunnel offload feature
From: Paolo Abeni <pabeni@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: virtio-comment@lists.linux.dev, maxime.coquelin@redhat.com, Eelco
 Chaudron <echaudro@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>
Date: Mon, 27 May 2024 10:06:32 +0200
In-Reply-To: <CACGkMEtetmg=YUtPW+yL+s5MzhbKKkJyrx3EDOtf2aF=q5_b8g@mail.gmail.com>
References: <cb89d3d6b6a7e4a7f13e60dd3fded5e950727890.1716448766.git.pabeni@redhat.com>
	 <ed730a7e12853339c6f5f298fa6c240a39942a74.camel@redhat.com>
	 <CACGkMEtetmg=YUtPW+yL+s5MzhbKKkJyrx3EDOtf2aF=q5_b8g@mail.gmail.com>
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

On Mon, 2024-05-27 at 11:26 +0800, Jason Wang wrote:
> On Thu, May 23, 2024 at 4:47=E2=80=AFPM Paolo Abeni <pabeni@redhat.com> w=
rote:
> >=20
> > On Thu, 2024-05-23 at 09:20 +0200, Paolo Abeni wrote:
> > > The VIRTIO_NET_HDR_GSO_UDP_TUNNEL is a gso_type flag allowing GSO ove=
r
> > > UDP tunnel. It can be negotiated on both the host and guest sides.
> > >=20
> > > UDP tunnel usage is ubiquitous in container deployment, and the abili=
ty
> > > to offload UDP encapsulated GSO traffic impacts greatly the performan=
ces
> > > and the CPU utilization of such use cases.
> > >=20
> > > One constraint addressed here is that the virtio side (either device =
or
> > > driver) receiving a UDP tunneled GSO packet must be able to reconstru=
ct
> > > completely the inner and outer headers offset - to allow for later GS=
O.
> > >=20
> > > To accommodate such need, new optional fields are introduced in the
> > > virtio_net header: outer_th_offset, inner_protocol, inner_mac_offset,
> > > inner_nh_offset. They map directly to the corresponding header
> > > information.
> > >=20
> > > Note that the inner transport header is implied by the (inner) checks=
um
> > > offload, if present. Otherwise, it's up to the receiver to detect the
> > > inner transport header offset from the provided information, as it's
> > > currently the case for plain (not UDP tunneled) GSO packets.
> > >=20
> > > The outer UDP header may carry a second checksum, which can be offloa=
ded
> > > independently from the inner one. Since UDP tunnel checksum offload
> > > support makes little sense without UDP tunnel GSO support, to avoid
> > > unnecessary complex feature negotiation, the
> > > VIRTIO_NET_HDR_GSO_UDP_TUNNEL feature implies the support for the out=
er
> > > header checksum offload and the checksum itself is handled similarly =
to
> > > the inner header one.
> > >=20
> > > Migration for GSO_UDP_TUNNEL enabled VMs should be managed alike othe=
r
> > > types of GSO offload: VMs that has negotiated such features could be
> > > migrated only on hosts supporting such features.
> > >=20
> > > Note that there is no concept of UDP tunnel type negotiation (e.g.
> > > vxlan, geneve, vxlan-gpe, etc.). That is intentional because:
> > > - given the information carried by the guest or host kernel, it's
> > >   impossible to probe reliably the UDP tunnel type. Specifically, the
> > >   outer UDP port numbers give a hint, but peers could use nonstandard
> > >   ones.
> > > - all the existing UDP tunnel protocols behave the same way WRT GSO
> > >   offload, carrying an immutable header on top of the outer transport
> > >   one.
> > > - if a new UDP tunnel protocol, carring packet dependant information
> > >   alike the inner packet length or csum should surface in the future,
> > >   the host and guest kernels will need explicit support for it,
> > >   including new, different GSO features. Additional virtio support
> > >   should be designed separately.
> > >=20
> > > Signed-off-by: Paolo Abeni <pabeni@redhat.com>
> > > ---
> > > v3 -> v4:
> > >  - new virtio_net_hdr fields depends on F_HOST_UDP_TUNNEL_GSO or
> > >    F_GUEST_UDP_TUNNEL_GSO (Stefano)
> > >  - Extended the changelog to answer Jason's questions.
> > >  - Clarified outer csum handling (Jason)
> > >  https://lore.kernel.org/virtio-dev/f0bf2db203f8061a3ecb50b7a48cf26d8=
f3c7f68.1716193086.git.pabeni@redhat.com
> >=20
> > Overall only minor edit over v3, just to restart the conversation.
> >=20
> > @Jason: I don't understand a question you raised on v3:
> >=20
> > """
> > 1) if there's no concept of UDP tunnel type negotiation, would it be
> > possible for a device to just implement vxlan?
> > """
> >=20
> > Specifically, I don't understand what do you mean with 'just implement
> > vxlan': there is no concept of vxlan-specific GSO offload in Linux, all
> > UDP tunnels are exactly the same thing from GSO perspective.
> >=20
> > e.g. see:
> >=20
> > https://elixir.bootlin.com/linux/latest/source/drivers/net/ethernet/int=
el/ice/ice_txrx.c#L2061
> >=20
> > Could you please re-phrase?
>=20
> I meant, virtio is not necessarily for a software implementation.
> Various hardware vendors started to implement it as well.

Note that the above links refers to an HW offload implementation for
TCP over UDP tunnel TSO support.

> I wonder if hardware is as flexible as Linux to support general UDP
> tunnel offload.

I don't have additional information WRT HW specific limitations.=20

Perhaps the vendors (nvidia? intel? who else?) could chime here to
specify such limitation if any.

How is that kind of scenario managed with plain TCP TSO for virtio?
e.g. let's suppose that some virtio H/W only supports a limited number
of segments per TSO packet.

Thanks,

Paolo


