Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633CC2905
	for <virtio-comment@lists.linux.dev>; Mon, 27 May 2024 03:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716780392; cv=none; b=sOJDLaAFs1lJ7EpvQbvjgaGSF5lGwKlATKfALo6BiDQohQ+Bv5MJDzUvlHMFjQ8jHHf2bDPuTZrQYT51ugcChIL9ajIJeU1cY1bhoP61SOXMyyvptx9edRiRVcMhXi7OWkRg3MAjeeMXtqoC5oQQLwi2WbtRA2Vif0dxBKhN1ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716780392; c=relaxed/simple;
	bh=yL1Hk5BIa0MJrKpAtdJBLJWMxeWEVRSJe9zskdEPDHk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T2J4vCo+wRN2ZL+DAw9MjoR++L2TKLm70SwNodNNoDYE9kO0lit9J/MyonkTM7/blSfiqKofptLblbAJe7HVvVQcuOCqqi6/9ID7UZXi9Tr8lcR8dow/hxs8wJaRabh3x2qA7aHwyXmsGCewUVYjAQuvw/rNe9mS48V3d4INzZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cVCdEXRD; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cVCdEXRD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716780389;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H3pR3Voxdap3srCKwz4XQ7m2Pg8pKTieWRch7I82YP0=;
	b=cVCdEXRDLjsCuexTr+SY6iyWEZxbAR+ehh7zcUfjKiY67DL9QvEY1hZAhTWPUpeMxObbko
	jJtPDpIGwnKr7OZU+kfRF83ug5mb5cesn1u0rbRb4yBLZZT7jdbwayf7aTd9rIp0UsTlZD
	IUShnu3IcviDgYB3/0gY5/nac3Kt2S0=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-689-QdFckwp-MIeCf0wbycPspw-1; Sun, 26 May 2024 23:26:27 -0400
X-MC-Unique: QdFckwp-MIeCf0wbycPspw-1
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2bf9410c954so1591758a91.3
        for <virtio-comment@lists.linux.dev>; Sun, 26 May 2024 20:26:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716780387; x=1717385187;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H3pR3Voxdap3srCKwz4XQ7m2Pg8pKTieWRch7I82YP0=;
        b=DvvNOow+d0n27kv1PhR6lMpuS9vVDeBrcz16tMwnVzfLxfHHF4DBagSjEdKJqWH7a5
         dkpB7P7lU6vJu3P7WaUroocgo7hz9P/o6R3SZmbGTfThC4hSTwOmuNWxb7luEaplzCKP
         Fgfegt6c8BLm+z+i1Bz6RcuU10EE/bgakGKy9mxekM/FasGiISmFu9Lh5flxPsZ1eibm
         gcW+ZNZkZw/E8eweXjLRoO760fWJwhKj52oKwQSbQD9uSx2RAgyBI6KjuZyB9QOCk54G
         NF6KjvrEWPtAwT6C1TwPrkv513OZHH+zCKZWih2VybLk39hGZOFtlGGWiUZHO2fKwyCy
         1JPQ==
X-Gm-Message-State: AOJu0YySk1qSVwarHJF/GwrcyysMz5Kv31ivcJu3h8cvH7pThChNIFoo
	9llNvvxuNMnkvN4ZM67O53rMw92KjLIlIKdoylFhp+TMAF9zHNo0wfWNbkm+ngBcDVHcfdBiyhP
	EonRR5h0zGdtTMclnAd9Gw9sc6BMNgM61dVVuH+gup49s9HFl79xAg6MfJpVxRcC54BjJnF/i22
	XVwKSAyNvYk4Gy5uiXZ7Hr7x4337uuQMCh0nUG5eA=
X-Received: by 2002:a17:90b:358d:b0:2b5:6e92:1096 with SMTP id 98e67ed59e1d1-2bf5ef1c8d0mr7760688a91.28.1716780386810;
        Sun, 26 May 2024 20:26:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGEFMoN+/Age5GM0oGIxPxisr/Kt2LtnWxpX8ZZnryhs8aQtPAYEVKLqpAGJAJQRhDz/j8mj/ZkAv3mivrRgTU=
X-Received: by 2002:a17:90b:358d:b0:2b5:6e92:1096 with SMTP id
 98e67ed59e1d1-2bf5ef1c8d0mr7760671a91.28.1716780386381; Sun, 26 May 2024
 20:26:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cb89d3d6b6a7e4a7f13e60dd3fded5e950727890.1716448766.git.pabeni@redhat.com>
 <ed730a7e12853339c6f5f298fa6c240a39942a74.camel@redhat.com>
In-Reply-To: <ed730a7e12853339c6f5f298fa6c240a39942a74.camel@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 27 May 2024 11:26:15 +0800
Message-ID: <CACGkMEtetmg=YUtPW+yL+s5MzhbKKkJyrx3EDOtf2aF=q5_b8g@mail.gmail.com>
Subject: Re: [PATCH v4] virtio-net: define UDP tunnel offload feature
To: Paolo Abeni <pabeni@redhat.com>
Cc: virtio-comment@lists.linux.dev, maxime.coquelin@redhat.com, 
	Eelco Chaudron <echaudro@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 23, 2024 at 4:47=E2=80=AFPM Paolo Abeni <pabeni@redhat.com> wro=
te:
>
> On Thu, 2024-05-23 at 09:20 +0200, Paolo Abeni wrote:
> > The VIRTIO_NET_HDR_GSO_UDP_TUNNEL is a gso_type flag allowing GSO over
> > UDP tunnel. It can be negotiated on both the host and guest sides.
> >
> > UDP tunnel usage is ubiquitous in container deployment, and the ability
> > to offload UDP encapsulated GSO traffic impacts greatly the performance=
s
> > and the CPU utilization of such use cases.
> >
> > One constraint addressed here is that the virtio side (either device or
> > driver) receiving a UDP tunneled GSO packet must be able to reconstruct
> > completely the inner and outer headers offset - to allow for later GSO.
> >
> > To accommodate such need, new optional fields are introduced in the
> > virtio_net header: outer_th_offset, inner_protocol, inner_mac_offset,
> > inner_nh_offset. They map directly to the corresponding header
> > information.
> >
> > Note that the inner transport header is implied by the (inner) checksum
> > offload, if present. Otherwise, it's up to the receiver to detect the
> > inner transport header offset from the provided information, as it's
> > currently the case for plain (not UDP tunneled) GSO packets.
> >
> > The outer UDP header may carry a second checksum, which can be offloade=
d
> > independently from the inner one. Since UDP tunnel checksum offload
> > support makes little sense without UDP tunnel GSO support, to avoid
> > unnecessary complex feature negotiation, the
> > VIRTIO_NET_HDR_GSO_UDP_TUNNEL feature implies the support for the outer
> > header checksum offload and the checksum itself is handled similarly to
> > the inner header one.
> >
> > Migration for GSO_UDP_TUNNEL enabled VMs should be managed alike other
> > types of GSO offload: VMs that has negotiated such features could be
> > migrated only on hosts supporting such features.
> >
> > Note that there is no concept of UDP tunnel type negotiation (e.g.
> > vxlan, geneve, vxlan-gpe, etc.). That is intentional because:
> > - given the information carried by the guest or host kernel, it's
> >   impossible to probe reliably the UDP tunnel type. Specifically, the
> >   outer UDP port numbers give a hint, but peers could use nonstandard
> >   ones.
> > - all the existing UDP tunnel protocols behave the same way WRT GSO
> >   offload, carrying an immutable header on top of the outer transport
> >   one.
> > - if a new UDP tunnel protocol, carring packet dependant information
> >   alike the inner packet length or csum should surface in the future,
> >   the host and guest kernels will need explicit support for it,
> >   including new, different GSO features. Additional virtio support
> >   should be designed separately.
> >
> > Signed-off-by: Paolo Abeni <pabeni@redhat.com>
> > ---
> > v3 -> v4:
> >  - new virtio_net_hdr fields depends on F_HOST_UDP_TUNNEL_GSO or
> >    F_GUEST_UDP_TUNNEL_GSO (Stefano)
> >  - Extended the changelog to answer Jason's questions.
> >  - Clarified outer csum handling (Jason)
> >  https://lore.kernel.org/virtio-dev/f0bf2db203f8061a3ecb50b7a48cf26d8f3=
c7f68.1716193086.git.pabeni@redhat.com
>
> Overall only minor edit over v3, just to restart the conversation.
>
> @Jason: I don't understand a question you raised on v3:
>
> """
> 1) if there's no concept of UDP tunnel type negotiation, would it be
> possible for a device to just implement vxlan?
> """
>
> Specifically, I don't understand what do you mean with 'just implement
> vxlan': there is no concept of vxlan-specific GSO offload in Linux, all
> UDP tunnels are exactly the same thing from GSO perspective.
>
> e.g. see:
>
> https://elixir.bootlin.com/linux/latest/source/drivers/net/ethernet/intel=
/ice/ice_txrx.c#L2061
>
> Could you please re-phrase?

I meant, virtio is not necessarily for a software implementation.
Various hardware vendors started to implement it as well.

I wonder if hardware is as flexible as Linux to support general UDP
tunnel offload.

Thanks

>
> Thanks!
>
> Paolo
>

