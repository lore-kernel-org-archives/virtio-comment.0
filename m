Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F7D71C20
	for <virtio-comment@lists.linux.dev>; Mon,  8 Jul 2024 02:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720404703; cv=none; b=D+icSsz0ITqdZSH5u+6tL91c+7MLwidYzPfeMZC98WdUUCc0vLQTYvj7X6+ZzNH4Gp72xRofkjoEOt8tIhe8ydLSq/SAxLvM/hSnOPi1y+r6lbcAxFNFRcYkr6hvDfZ7t+HUSNecy0jdLxcLIxnaIYdrwt1+CIgx2g56dLfpsBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720404703; c=relaxed/simple;
	bh=Fadm00vxUD8EIzmFC+mMgWXEwj+23uLvVSQImY53AVc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nVKxDtb3pkNq9s83RbCpE7D4st7TICDnAsisa8vHWg4j0L+92IVOzucRQ9mOgAEtbhLFidFygdbtY/7nwEQktwK+2kuooi2YRGKEQNR6NsBwKgmXmSaWjiXuZQDxuOwBJmnHM7PftjdTl4rNFlUfr7elxv3CN/CRWpwiOScaDgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hWQQk1PD; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hWQQk1PD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720404700;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Fadm00vxUD8EIzmFC+mMgWXEwj+23uLvVSQImY53AVc=;
	b=hWQQk1PD7r5GWeWCU10UZLQjCLLh3RD9Cc8xAoaTqtmTMm1nqlI39fywHMDcMpF0IxGZ3v
	umkyjzKnmtcqt2SM6eCrpG54GHDhNn2g7eDlf+Q6DTjpfKpWrfNsdDNx4WhWzwn30p3YNf
	tZh+WWjtyuSJhnqKu8o/QwA4hjrojwI=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-641-BkgvPJvYPqqnROKo6909Gw-1; Sun, 07 Jul 2024 22:11:38 -0400
X-MC-Unique: BkgvPJvYPqqnROKo6909Gw-1
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-7f6218c0d68so440089139f.3
        for <virtio-comment@lists.linux.dev>; Sun, 07 Jul 2024 19:11:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720404698; x=1721009498;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fadm00vxUD8EIzmFC+mMgWXEwj+23uLvVSQImY53AVc=;
        b=Xh24a68wNsn2G3sK52z+vC5nYnR7wXxI4wo/xszDM0Owmo0zX5u6KKANfRLTuvlrFW
         k81NT05JT2zYffvnQa1sF+Skq+/7mcoZv5DalYo5TjcYGo4FQKcxIRpIUBbkX8INeRZQ
         qwuBECtkQmBzNV3pHjuhq1OJKxlSFV/F6Eqc4EWTojpdGk+wwENLByWZ1FGntPEVXsiX
         sMga+XzTJ5d1Oj06lQh5jCDLj3VMViPzPLaGKYSKAj+k0AxpkKTCDFECFutDJ1Hz/eE+
         IIkp1DoIKUl0llAMJtav4wtSSKPJR/zg+EPTSHJv/Tylru4CYnVdJveiqrZ2p2m9wVuI
         StgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFv9PiP1YOeeema9X8hLW0fsK3PGbFIXp3gYxwFi039TUsgwNEfY2Ndm0UHyQJtmlDPvtdRCgJxbZ+/mHX/lfpX5cbizAfpglENkbvKQk=
X-Gm-Message-State: AOJu0YxVFLAUgHkn72fpOfjtWaJqWJ6a5+lIL8A/nmi34ovVYRfvr8lz
	fQZPXvWs9D/jKQVl3MQ8aSSQ+nlq+TfDWOuIk1Dq7/m6WeTM/TBSHS6ldA8JiWv2yUrKE8RjAw7
	/l7udU6aMyjc1ht1nI7yYTL0Lm+qt6umiu50YYOxNYaj0OXIhnWrxn4rQPF1z1Y1ob29LhRNKFJ
	RAGBNsKKNsYyA5DF1vJeYdilqOXrNn1bkI8S4WRMA=
X-Received: by 2002:a05:6e02:20e7:b0:375:9e3f:5f6 with SMTP id e9e14a558f8ab-3839843161amr140065795ab.6.1720404697995;
        Sun, 07 Jul 2024 19:11:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEEuxe9DVzVWJpiQC6RagF0xy9arFp8UHTD191lrrKHrbxkS6B7xhNG4HSdMq1Bw9/s93XxxWxBpsm63NmP2u8=
X-Received: by 2002:a05:6e02:20e7:b0:375:9e3f:5f6 with SMTP id
 e9e14a558f8ab-3839843161amr140065665ab.6.1720404697719; Sun, 07 Jul 2024
 19:11:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
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
 <CACGkMEtsqjnFGFnZzF825ur8zz9--QovkxW5oCi+TT6Pu7S9oQ@mail.gmail.com> <a1a7625f669d58f17e047adee64e050f438d9fbb.camel@redhat.com>
In-Reply-To: <a1a7625f669d58f17e047adee64e050f438d9fbb.camel@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 8 Jul 2024 10:11:19 +0800
Message-ID: <CACGkMEvn8_uJewGw=RNg0133a68KFeoi2ctk2-vxZk=x8z8anQ@mail.gmail.com>
Subject: Re: [PATCH v5] virtio-net: define UDP tunnel offload feature
To: Paolo Abeni <pabeni@redhat.com>
Cc: Willem de Bruijn <willemb@google.com>, virtio-comment@lists.linux.dev, 
	maxime.coquelin@redhat.com, Eelco Chaudron <echaudro@redhat.com>, 
	Stefano Garzarella <sgarzare@redhat.com>, Michael Tsirkin <mst@redhat.com>, Parav Pandit <parav@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 5, 2024 at 5:23=E2=80=AFPM Paolo Abeni <pabeni@redhat.com> wrot=
e:
>
> On Fri, 2024-07-05 at 11:26 +0800, Jason Wang wrote:
> > On Thu, Jul 4, 2024 at 12:33=E2=80=AFAM Paolo Abeni <pabeni@redhat.com>=
 wrote:
> >
> > > Anyway if a device can't perform H/W GRO it will send to the driver n=
on
> > > GSO packet. It will not need to fill any fields for that.
> > >
> > > Let's suppose we have to host with H/W virtio net support, both
> > > exposing F_GUEST_UDP_TUNNEL_GSO, host1 can do geneve H/W GRO, host2
> > > can't. I don't see migration issues between host1 and host2. The latt=
er
> > > will not generate any UDP TUNNEL GSO packet for geneve, but will send
> > > to the driver plain packets, as on the wire.
> > >
> > > What I'm missing?
> >
> > Probably not but not sure if this is a actual bug, but consider:
> >
> > Guests can only know inner protocol X and Y. So did host 1. But after
> > migrating to host2, it can have inner protocol Z. Can this happen or
> > not?
>
> As mentioned, the guest will not parse the packet, it just need to
> validate the fields.
>
> Yes, the above scenario can happen, but AFAICS it will not cause any
> bugs.
>
> The guest will be able to process and segment the UDP tunnel GSO
> packets with unknown UDP tunnel protocol thanks to the mentioned
> additional fields added to the virtio net header.
>
> Obviously, if the guest don't understand geneve packets, and the host
> suddenly starts sending them, at some point such packets will be
> dropped inside the guest.

Ok, I meant for example, guests don't understand UDP GSO geneve
packets but can understand non GSO geneve packets.

>
> >
> > > > 2) Is there any existing NIC that can do RX UDP tunneling GSO?
> > >
> > > AFAICS, the only NICs supporting HW GRO for UDP tunnel packet use the
> > > bnxt driver. and think the implementation is buggy (it does not
> > > set/fill must sk_buff fields).
> >
> > Ok, I see.
> >
> > So in conclusion, I think we are kind of on the same page. I
> > understand that those inner fields were designed mostly for VM2VM or
> > VM2Host.
>
> Even for the Host2VM case, too - to allow the VM to reconstruct correct
> GSO packet.

Exactly.

>
> > And still something needs to be considered:
> >
> > 1) inner nh/mac/protocol seems to be meaningless for hardware
> > virtio-net implementation, anything we can optimize on this? (maybe
> > not since e.g num_buffers is meaningless for TX as well)
>
> Do you mean in the Host2VM direction? They are needed to the VM, to
> fully understand/build the GSO packet.
>
> Or do you mean in the the VM2Host direction? The device will need them
> to do H/W segmentation of the packet.

I meant for example bare metal usage, host is using virtio-net NIC. If
the NIC can't do VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO, could we avoid
those inner headers?

>
> AFAIK some (most?) high-end modern NICs have programmable H/W parsers
> able to extract a quite considerable amount of programmable data out of
> the packet.
>
> > 2) do we need to hear from hardware vendors to see if there's a chance
> > to implement RX UDP Tunnel?
>
> The bnxt driver proves it's feasible. The lack of other NICs with such
> support hints it's difficult and/or there are is no large demand for
> that (I wild guess the latter).
>
> Possibly we can make the life easier for H/W driver implementations
> adding a configuration command -say VIRTIO_NET_CTRL_UDP_TUNNEL_CONFIG -
> and allow the guest to explicitly request/enable specific UDP tunnel
> types?

Probably but then we need to deal with compatibility issues. E.g src
support tunnel X but dst doesn't.

>
> Somewhat related question: what happens after a migration to the
> configuration send by the driver to the device? is up the the VM
> somehow catch the migration event and re-send them?

I think not, when command X succeeds in the source, the guest will
assume it will succeed in the destination.

> Or after the
> migration the VM is expected to run on top of a driver with a different
> configuration?

Nope, migration is totally transparent to the guest.

Thanks

>
> Thanks,
>
> Paolo
>

