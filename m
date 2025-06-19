Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 989592BB15
	for <virtio-comment@lists.linux.dev>; Thu, 19 Jun 2025 01:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750295423; cv=none; b=Y1Z9uzsDHo+Yq2yTCdIekrW7mCPsA3z7PvUqpY47lCOrsLHTQWIvuOBDwARo8y4ymFFDJQk3lc2gckS9rBa2wnOTow9uXdE4wfxmPJdty1F8D9Y5CQpaaknOcNnXV88gPs1zzamUN2yHyfZupy6srJcKvTulf5ar+sSxxN5AS3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750295423; c=relaxed/simple;
	bh=id4UpwnVQGA1ZvprHgzUhG1LMECO7Yz9S3+36HR0cLo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JmKCZtjVTMUv1nsWJnqQ37S6lT7AWaM7k3QyIukyVBJgQhKZOMdHSX1i+EbOqI6TGAs1ItaHODwBfpjM2MvEYoX5pd3+vEJZhlLLX4wT50Aekg8/cxkLeyOr3pZRt9MQb8VYEXLsGaEF5kbaoxvkOTxZrOLhH7aouyW5fDGI8Ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=E9h8J6i8; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="E9h8J6i8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750295418;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bOH96ovYQSnkjtLSzfx6f4Hd8vkPryq0uOsGDCy5Joc=;
	b=E9h8J6i8AcQgGnsLrJhpmcOTo4yn8KdHZKXotS8SfzxhQF8TNfOvd8QJ2Ec9xir5DZaOJ3
	GnV2e8Q057BvP0XUAfp+pTigGHHpNywyCm3pu40RgQY8mkr/p97BfM55ViIkZgGAUVw/jx
	+dFr5YXt7JYmQQ9MNcfzYIabWikbdRs=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-307-UyIt6-o1PAqEZ7MYs1Yd-A-1; Wed, 18 Jun 2025 21:10:17 -0400
X-MC-Unique: UyIt6-o1PAqEZ7MYs1Yd-A-1
X-Mimecast-MFC-AGG-ID: UyIt6-o1PAqEZ7MYs1Yd-A_1750295414
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-311e98ee3fcso201837a91.0
        for <virtio-comment@lists.linux.dev>; Wed, 18 Jun 2025 18:10:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750295414; x=1750900214;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bOH96ovYQSnkjtLSzfx6f4Hd8vkPryq0uOsGDCy5Joc=;
        b=Z7Q3GzJzloVxSYSpjggOryNNR2GuQcuTWyLN7TfL4FvqswX8w3N6jFAV7TioduBqj+
         /mG1jPLe626KCBslALlu7zAZUqXTuq9/FcCHIo0mBSHez0GInb0/hViaIp+ahqYt1FJM
         aoQnKCRU6xjusqcWzP9qk87oSymydohL/LCS7Yz1BkzviCXwXW6Bo9LubZXNEeO2SrUl
         mg3S9j+BqGFNhspXeT9PXbOTGAnqJQTX45/Is7tChCNFpESTKNdCCW0p9dn5SY6876RU
         SKKFYcviQ5aRxrNeVR3bT49/9jhZiHI635WM/xTXbpH0fXCjINll9ppR5yy4eAnJKFSw
         1XRA==
X-Forwarded-Encrypted: i=1; AJvYcCW+rH5zohBLGS+5maF7RZ6ZHEdEkNnbM/cmapefwy+0ptmBE4EHClFz6gWz/vq3bzRzcdo+EMI/p/DYSSi7Gw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwkGmtALDIM7tkpW2porGqw7W01+JTWSwYR30MzF0HnKAR6Cr8o
	7yECj/A5vPmmzZzGLFfSp5rw8HAD3XuWWDy6G7H764AXIJMmgnmJGAOclWJU7HT57fP+XH1Zm4M
	NJTp+6eX2TnqDktzwmxR9CuFH+OLF/aCTaaC4kt2sPWDM+Yb5+WjB3hyXxmn5+oKJtb+vsNGDSc
	MDd8C/tMJ9yjUfY2WKA6mEVshossrcSl1puypFlKet0z0=
X-Gm-Gg: ASbGncvUHq7ccsuFU8JILi95HJ88nd5TnZiXovKLlh65w95jvKd+3kxz/+FLXhOkVnP
	zMQneE1iLpWmmOtwrUiSeXsEudXyVNTlG3Yr9Z9Jz61by8wB6EM97yprJgRbmQpRjEvP+/Y16/L
	Qt
X-Received: by 2002:a17:90b:4fd1:b0:313:d342:448c with SMTP id 98e67ed59e1d1-3158ac4d267mr2346765a91.17.1750295413973;
        Wed, 18 Jun 2025 18:10:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXBvMjFBnH87PmLwg+VxHabUh5HiuCuQjjm9RpVnltDCWtttzadv/ZawaskXxa4/RryrktSVGrewRiYvSypCU=
X-Received: by 2002:a17:90b:4fd1:b0:313:d342:448c with SMTP id
 98e67ed59e1d1-3158ac4d267mr2346719a91.17.1750295413428; Wed, 18 Jun 2025
 18:10:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CACGkMEtRKJyy+ceQugN4aUyTUBiK6-2sUpFfYssRrno_vK_xyg@mail.gmail.com>
 <20250618095139.1412138-1-niuxuewei.nxw@antgroup.com>
In-Reply-To: <20250618095139.1412138-1-niuxuewei.nxw@antgroup.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 19 Jun 2025 09:10:02 +0800
X-Gm-Features: AX0GCFsIMVExebO8adZzmSeI3n7RiQrRGfP5muxzjhherbAls_elVCBbRYRDFhc
Message-ID: <CACGkMEseO0Y2jTYNswvdcr9ihN9ZN7s-TXGMNdLyHwRyNFys2g@mail.gmail.com>
Subject: Re: [PATCH v7] virtio-vsock: Add support for multi devices
To: Xuewei Niu <niuxuewei97@gmail.com>
Cc: fupan.lfp@antgroup.com, mst@redhat.com, niuxuewei.nxw@antgroup.com, 
	parav@nvidia.com, sgarzare@redhat.com, virtio-comment@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kMc0xPNih_741bNIKDIsaBpcsg6JxBERx99CuyNTsbs_1750295414
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 18, 2025 at 5:51=E2=80=AFPM Xuewei Niu <niuxuewei97@gmail.com> =
wrote:
>
> > On Wed, Jun 18, 2025 at 1:40=E2=80=AFPM Xuewei Niu <niuxuewei97@gmail.c=
om> wrote:
> > >
> > > > On Wed, Jun 18, 2025 at 10:47=E2=80=AFAM Xuewei Niu <niuxuewei97@gm=
ail.com> wrote:
> > > > >
> > > > > > On Tue, Jun 17, 2025 at 3:46=E2=80=AFPM Xuewei Niu <niuxuewei97=
@gmail.com> wrote:
> > > > > > >
> > > > > > > Resend, because it isn=E2=80=99t listed in the mailing list d=
ue to my mistake.
> > > > > > >
> > > > > > > > On Mon, Jun 16, 2025 at 4:38=E2=80=AFPM Stefano Garzarella =
<sgarzare@redhat.com> wrote:
> > > > > > > > >
> > > > > > > > > On Mon, 16 Jun 2025 at 10:29, Xuewei Niu <niuxuewei97@gma=
il.com> wrote:
> > > > > > > > > >
> > > > > > > > > > > On Fri, Jun 13, 2025 at 4:46=E2=80=AFPM Xuewei Niu <n=
iuxuewei97@gmail.com> wrote:
> > > > > > > > > > > >
> > > > > > > > > > > > > On Fri, 13 Jun 2025 at 06:57, Xuewei Niu <niuxuew=
ei97@gmail.com> wrote:
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > > On Sat, Apr 12, 2025 at 10:39=E2=80=AFPM Xuew=
ei Niu <niuxuewei97@gmail.com> wrote:
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > This patch brings a new feature, called "mu=
lti devices", to the virtio
> > > > > > > > > > > > > > > > vsock. It introduces a "VIRTIO_VSOCK_F_MULT=
I_DEVICES" feature bit, and a
> > > > > > > > > > > > > > > > "device_order" field to the config for the =
virtio vsock.
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > =3D=3D Motivition =3D=3D
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > Vsock is a lightweight and widely used data=
 exchange mechanism between host
> > > > > > > > > > > > > > > > and guest. Currently, the virtio-vsock only=
 supports one device, resulting
> > > > > > > > > > > > > > > > in the inability to enable more than one ba=
ckend.
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > I wonder which part of the spec forbids more =
than one device.
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > No. The spec, however, is designed for a single=
 device, and lacks some
> > > > > > > > > > > > > > specifications for multiple devices.
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > For example, we should have a mechanism to sele=
ct a device from all to
> > > > > > > > > > > > > > communicate with a peer.
> > > > > > > > > > >
> > > > > > > > > > > I wonder if this is a:
> > > > > > > > > > >
> > > > > > > > > > > 1) mechanism that needs to be mandated by the device
> > > > > > > > > >
> > > > > > > > > > Yes.
> > > > > > > > > >
> > > > > > > > > > > 2) a policy that is allowed to be tweaked by the user=
 as TCP/IP did
> > > > > > > > > >
> > > > > > > > > > Not allowed in the current version.
> > > > > > > > > >
> > > > > > > > > > > (Note anyhow the driver can override what the device =
suggests...)
> > > > > > > > >
> > > > > > > > > I think we should follow what we described in the spec:
> > > > > > > > > "The virtio socket device is a zero-configuration socket =
communications device."
> > > > > > > >
> > > > > > > > We probably need to define "configuration" first.
> > > > > > > >
> > > > > > > > For example, if it means zero configuration from the user, =
it does not
> > > > > > > > conflict with 2), the driver can use its own algorithm to e=
lect a
> > > > > > > > "default" device.
> > > > > > >
> > > > > > > IMHO, it can be done, but it is not the current design.
> > > > > >
> > > > > > Well, you need at least explain the advantages or why you choos=
e to do this.
> > > > >
> > > > > I listed in the previous message. Maybe it is not clear enough. I=
'll try to
> > > > > explain it again.
> > > > >
> > > > > I think people should pick up the device by a `bind()` call, whic=
h takes a
> > > > > CID as an argument.
> > > > >
> > > > > Generally, the device is picked up by the source CID, which is ac=
hieved
> > > > > through a `bind()` call.
> > > > >
> > > > > The default device, which is equivalent to the current single dev=
ice, is
> > > > > used to be compatible with the existing applications.
> > > > >
> > > > > Apart from that, the default device is used to communicate with h=
ypervisor
> > > > > for some init works, such as gathering information about other vs=
ock
> > > > > devices.
> > > > >
> > > > > To summarize, users must do `bind()` call explicitly to select th=
e desired
> > > > > device for non-HV-VM communications.
> > > >
> > > > So if I understand correctly you need a way to select the default w=
hen
> > > > bind() is not called?
> > >
> > > Yes.
> > >
> > > > > > > I prefer to set the default device for VM-HV communication to=
 do some init
> > > > > > > work. I don't think people have a strong need for this.
> > > > > > >
> > > > > > > > Another perspective, making decisions in guests may be even=
 more
> > > > > > > > helpful for the case where the device is not trusted
> > > > > > >
> > > > > > > How does the guest realize the vsock device is not trusted?
> > > > > >
> > > > > > There're various ways to build trust (for example device attest=
ation)
> > > > > > and more might come in the future.
> > > > > >
> > > > > > > The guest only
> > > > > > > knows the information from its config space, which is provide=
d by the host.
> > > > > >
> > > > > > The way to build trust is probably beyond the scope of virtio, =
but it
> > > > > > is something we need to consider.
> > > > >
> > > > > Agree with you. If it comes in the future, I think the driver sho=
uld have
> > > > > the ability to make decisions.
> > > >
> > > >
> > > > Actually, I meant the way to build trust via virtio is something th=
at
> > > > needs to be considered. But now we have other ways to build trust.
> > > > That would result a situlation:
> > > >
> > > > 1) "default" vsock device is not trusted but other might
> > >
> > > I think this topic might be beyond the scope of this patch.
> > >
> > > With the current version, there is only one device supported, which c=
an be
> > > considered as the "default".  We don't have a mechanism to say "we do=
n't
> > > trust you", right?
> >
> > No. I meant we don't have it in the virtio core but we already have it
> > in other layers (for example the transport layer).
>
> Are you referring to virito-vsock transport layer?

Yes, for example the PCI layer.

>
> > > That is, it is assumed that we trust the device provided
> > > by the hypervisor.
> > >
> > > This patch is for multiple devices support, based on the same assumpt=
ion. I
> > > think trust is a good point to consider, but perhaps we have to addre=
ss it
> > > in the follow-up patches.
> >
> > My point is not about how to build trust, it's about letting the
> > driver decide by itself in some cases.
> >
> > A better way might be something like:
> >
> > "The device_order is a hint for the driver to select a default vsock
> > device. Device MAY choose ...."
>
> Okay, I'll do that.
>
> > >
> > > > or
> > > >
> > > > 2) two device claims that they are all "default"
> > > >
> > > > This means anyhow we need a decision from the driver side so the
> > > > device side order seems to be useless here.
> > >
> > > There is only one default device. The device with the lowest device_o=
rder
> > > is considered the default. It is not allowed to have the same device_=
order.
> >
> > Who can forbid two same device_order? Note that in various security
> > models, hypervisors are not trusted at all.
>
> The driver does. Indeed, the driver is able to deny devices if they viola=
te
> the spec.

Yes, that's the point, anyhow driver need to do the decision.

>
> > > > > > > > > So, IMO the guest (driver) should not be allowed to chang=
e anything.
> > > > > > > > > E.g. Right now it's not allowed to change the CID assigne=
d by the host (device).
> > > > > > > >
> > > > > > > > A dumb question when having two cids (cid1 and cid2) in the=
 same
> > > > > > > > guest, what happens if src=3Dcid1 and dst=3Dcid2?
> > > > > > >
> > > > > > > The packets will be directed to another application, if any, =
on the same guest.
> > > > > >
> > > > > > Ok, so in your example, vhost-user-vsock should route those pac=
kets
> > > > > > back to kernel vsock?
> > > > >
> > > > > It depends. Two cases are possible:
> > > > >
> > > > > 1. dev0(cid1) and dev1(cid2) are from the same type of backend, e=
.g.
> > > > > vhost-vsock, so the packets will be routed back as you described.
> > > > > 2. dev0(cid1) from vhost-user-vsock, and dev1(cid2) from vhost-vs=
ock, the
> > > > > packets will be dropped if vhost-user-vsock device can't find a d=
evice
> > > > > whose cid is cid2.
> > > >
> > > > Well, this means the behavior depends on the implementation which i=
s not good.
> > >
> > > No, it is not. It depends on whether the device can find a proper
> > > target device based on the dst_cid.
> >
> > This sounds really weird, two cids belong to the same guest. So guests
> > should expect that the two vsock devic can talk to each other?
>
> Yes, a little bit complicated.
>
> Two constraints should be applied:
>
> 1. No CID conflicts within the driver;
> 2. No CID conflicts within the address space.
>
> Here is a diagram to illustrate the situation where it does not violate t=
he
> constraints:
>
>  =E2=94=8C=E2=94=80 kernel=E2=94=80(as0)=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90
>  =E2=94=82   =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90                  =
    =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90  =E2=94=8C=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=90=E2=94=82
>  =E2=94=82   =E2=94=82 dev0(cid0)=E2=94=82                      =E2=94=82=
 dev2(cid1)=E2=94=82  =E2=94=82 dev3(cid2)=E2=94=82=E2=94=82
>  =E2=94=82   =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=AC=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98                  =
    =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=AC=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98  =E2=94=94=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=AC=E2=94=80=
=E2=94=80=E2=94=98=E2=94=82
>  =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=BC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=
=94=80=E2=94=98
>   =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=BC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90   =E2=
=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=94=80=E2=94=90
>   =E2=94=82      =E2=94=82  =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90   =
     =E2=94=82   =E2=94=82      =E2=94=82  =E2=94=8C=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=90    =E2=94=82   =E2=94=82
>   =E2=94=82      =E2=94=94=E2=94=80=E2=94=80=E2=96=BA dev0(cid0)=E2=94=82=
        =E2=94=82   =E2=94=82      =E2=94=94=E2=94=80=E2=94=80=E2=96=BA dev=
2(cid1)=E2=94=82    =E2=94=82   =E2=94=82
>   =E2=94=82         =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98        =
=E2=94=82   =E2=94=82         =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98   =
 =E2=94=82   =E2=94=82
>   =E2=94=82         =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90        =
=E2=94=82   =E2=94=82         =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90   =
 =E2=94=82   =E2=94=82
>   =E2=94=82      =E2=94=8C=E2=94=80=E2=94=80=E2=96=BA dev1(cid1)=E2=94=82=
        =E2=94=82   =E2=94=82         =E2=94=82 dev3(cid2)=E2=97=84=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98   =E2=94=82
>   =E2=94=82      =E2=94=82  =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98   =
  VM0=E2=94=82   =E2=94=82         =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=98     VM1=E2=94=82
>   =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=BC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98   =E2=
=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98
>    vhost-user-vsock
> =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=90
> =E2=94=82   =E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=90                  =
                                 =E2=94=82
> =E2=94=82   =E2=94=82 dev1(cid1)=E2=94=82                                =
                   =E2=94=82
> =E2=94=82   =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98                  =
                                 =E2=94=82
> =E2=94=94=E2=94=80userapp=E2=94=80(as1)=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=98
>
> - VM0
>     - dev0
>         - dst_cid =3D 2 (well-known cid): connect to host;
>         - dst_cid =3D cid1: connect to dev2 (they are in the same as0);
>         - dst_cid =3D cid2: connect to dev3;
>     - dev1
>         - dst_cid =3D 2 (well-known cid): connect to userapp;
>         - dst_cid =3D cid0: failure (no cid0 is available in as1, even th=
ough
>         cid1 is available in the VM0);
>         - dst_cid =3D cid1: connect to dev0;
> - VM1
>     - dev2
>         - dst_cid =3D 2 (well-known cid): connect to host;
>         - dst_cid =3D cid0: connect to dev0;
>         - dst_cid =3D cid2: connect to dev3;
>     - dev3: skip the same as dev2.
>
> So back to your question, my answer is that it depends on the address
> space. Hope it could be helpful.

This brings an interesting question, for example if vm0 tries to
connect to vm1, how does it know which device it needs to use (lacking
the concept like switch/route/address announcing etc...)?

Thanks

