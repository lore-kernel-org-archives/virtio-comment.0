Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A01DE191F66
	for <virtio-comment@lists.linux.dev>; Wed, 18 Jun 2025 08:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750235792; cv=none; b=KocwrwHWIFn3B1MQRI+AjtaTvqPgmjNgY3Q8P/fbb8tKVvXUpEltZRG+E1MX8ZkbTQo1rn5y9kAP8iWMDvTfO5hBY4ETKAILL6jk+ObE52LOyfZnc5J0AqxpKi339oRi6GqS+vEXoRteaj7a3VFfIxlTsg1o0mP6ZSHzBBEUMhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750235792; c=relaxed/simple;
	bh=MUbgYMaMNQuIaJrpI0sm46ATohsX9NUS66MmoJNbyB0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JErTGVqJYyVhFE7v9ERvTRr41DPpa12B72dpGyeI04BuIEvn3H07tDma2t9H/BoQdJspgGfKdRaB3xzmmI39+FaGxSQ6qGlu4/E3GN+xH2eKdejgPHV3eStpX/VwY1retK89XF/jtD2WL+qgGbXnvGb5TfICu08CS2+tmSAFwaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YEpVZdAD; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YEpVZdAD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750235788;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/hTLobUYFt+/u26tWWmOm/HhRPh8LJdMsNGdQGaPtTA=;
	b=YEpVZdAD/AgUlx8bAt6isjD/JjrBYusCe+iskqYSbQGN9zCt2vH2Eww1nf6nLAGw32Tzhj
	iP3jyrbD8EIL0g3L53XOq3bs2tEOFNDfhRTFvzyrnI2qqdL0Fojvb+v/noTI4fmgBydqBH
	phpjgRLlPgwg6XPqmRwkb0rbErRpVkI=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-553-6T8l7wbaN5yrwnaJ6qThQQ-1; Wed, 18 Jun 2025 04:36:27 -0400
X-MC-Unique: 6T8l7wbaN5yrwnaJ6qThQQ-1
X-Mimecast-MFC-AGG-ID: 6T8l7wbaN5yrwnaJ6qThQQ_1750235786
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-31215090074so9304296a91.0
        for <virtio-comment@lists.linux.dev>; Wed, 18 Jun 2025 01:36:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750235786; x=1750840586;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/hTLobUYFt+/u26tWWmOm/HhRPh8LJdMsNGdQGaPtTA=;
        b=Ef8V5MpOOoyaRYnANCoVZzH5YN/3sgeVJg7JKoOLiUqSj0JSLawxgAd7h8Ul0F3ip3
         JcoX698k660DZ057IR6yfF4qp53S0whW+GkzWxUSfaA8bbFoScYw/KwmVzLJMYWfn48p
         9gn8e3dwypy/nnHHwokvARKgMHxSFLnmqJL0kX6pTHUuvnO9sEWRSGmANSQxSwBAAEUm
         rifrtdXTnFgeUX2ADgrP2MzgMUxMKtRiJnNRR9L2oYUMEQ1BIXXCE4bJIdpvIVsDZcbL
         vF+k8h9PLdVWqRvWWuFxrYL6V8vsfF8Is86sIZZ+DwFz/o592u9BYM5RSVb64mGQdvh9
         7d3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWfRBD2JtSavWWevsLuq7ug1NbWxWQzeLckFN88p56iIjWFy38JSFMWYydcYGEk+ItWOws+QtuVNU5AbipE2Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YxKnqBPl8z88M1FNeGU2MN93U8E8nFw8VXJW0FuXUoWwb8nqyTi
	HdU3CIMQ70mEJoTzFB3wFQt/eR5iRRrX08Z12dTYsnItiGwDEuZ+nOI4MDCFWly+xhOC15o57m7
	ye47cqGFIobu0XFO8LzSsghnud5AUH3IDSNvuTz1Ci+6/eI8R05udx7PXNGVGdv2HAr0LitJZXO
	cc43qw9c73VO3CTJg9wwbiZ2OB9QoPAhgsG7QrO1G0R30=
X-Gm-Gg: ASbGncsbVa/1a0FCHlgTEAQg8QfoB2F2niQTB85DJdREcUKCSuxjxVd8YlpVtuG5He/
	IE0PdaGQ8ynCxYNwVf/r73lEzseDgWLzkAmeNmFPZAYwIDcKjAmv5Bf2x9dvk4DtWHooHkWGQn5
	qPJgxh
X-Received: by 2002:a17:90a:ec86:b0:313:5d2f:5505 with SMTP id 98e67ed59e1d1-313f1db80b0mr28643267a91.16.1750235786254;
        Wed, 18 Jun 2025 01:36:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxgskdxZpheF9YbzgVcwu4rWAfKiEL7fv4x5MzQeMZ10QUQKeTQFNGcIvTS7eYMzPaj/rJ+ooLKorDVZyyYME=
X-Received: by 2002:a17:90a:ec86:b0:313:5d2f:5505 with SMTP id
 98e67ed59e1d1-313f1db80b0mr28643235a91.16.1750235785807; Wed, 18 Jun 2025
 01:36:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CACGkMEuXV_ep5VOAD84gjWc4RqRSZ6QRzDxC0yn+Zh9gu3b-Cw@mail.gmail.com>
 <20250618054006.1378278-1-niuxuewei.nxw@antgroup.com>
In-Reply-To: <20250618054006.1378278-1-niuxuewei.nxw@antgroup.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 18 Jun 2025 16:36:13 +0800
X-Gm-Features: AX0GCFsANAAORB03CwXbI8NOlra5OePRBsvvPagx20SRJL_GsHtBMHqnC0Cu_g0
Message-ID: <CACGkMEtRKJyy+ceQugN4aUyTUBiK6-2sUpFfYssRrno_vK_xyg@mail.gmail.com>
Subject: Re: [PATCH v7] virtio-vsock: Add support for multi devices
To: Xuewei Niu <niuxuewei97@gmail.com>
Cc: fupan.lfp@antgroup.com, mst@redhat.com, niuxuewei.nxw@antgroup.com, 
	parav@nvidia.com, sgarzare@redhat.com, virtio-comment@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OjdQM_0B2hNk2FZ77t1J3rpyMoqY8XBGiX5yPDNBeDU_1750235786
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 18, 2025 at 1:40=E2=80=AFPM Xuewei Niu <niuxuewei97@gmail.com> =
wrote:
>
> > On Wed, Jun 18, 2025 at 10:47=E2=80=AFAM Xuewei Niu <niuxuewei97@gmail.=
com> wrote:
> > >
> > > > On Tue, Jun 17, 2025 at 3:46=E2=80=AFPM Xuewei Niu <niuxuewei97@gma=
il.com> wrote:
> > > > >
> > > > > Resend, because it isn=E2=80=99t listed in the mailing list due t=
o my mistake.
> > > > >
> > > > > > On Mon, Jun 16, 2025 at 4:38=E2=80=AFPM Stefano Garzarella <sga=
rzare@redhat.com> wrote:
> > > > > > >
> > > > > > > On Mon, 16 Jun 2025 at 10:29, Xuewei Niu <niuxuewei97@gmail.c=
om> wrote:
> > > > > > > >
> > > > > > > > > On Fri, Jun 13, 2025 at 4:46=E2=80=AFPM Xuewei Niu <niuxu=
ewei97@gmail.com> wrote:
> > > > > > > > > >
> > > > > > > > > > > On Fri, 13 Jun 2025 at 06:57, Xuewei Niu <niuxuewei97=
@gmail.com> wrote:
> > > > > > > > > > > >
> > > > > > > > > > > > > On Sat, Apr 12, 2025 at 10:39=E2=80=AFPM Xuewei N=
iu <niuxuewei97@gmail.com> wrote:
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > This patch brings a new feature, called "multi =
devices", to the virtio
> > > > > > > > > > > > > > vsock. It introduces a "VIRTIO_VSOCK_F_MULTI_DE=
VICES" feature bit, and a
> > > > > > > > > > > > > > "device_order" field to the config for the virt=
io vsock.
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > =3D=3D Motivition =3D=3D
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > Vsock is a lightweight and widely used data exc=
hange mechanism between host
> > > > > > > > > > > > > > and guest. Currently, the virtio-vsock only sup=
ports one device, resulting
> > > > > > > > > > > > > > in the inability to enable more than one backen=
d.
> > > > > > > > > > > > >
> > > > > > > > > > > > > I wonder which part of the spec forbids more than=
 one device.
> > > > > > > > > > > >
> > > > > > > > > > > > No. The spec, however, is designed for a single dev=
ice, and lacks some
> > > > > > > > > > > > specifications for multiple devices.
> > > > > > > > > > > >
> > > > > > > > > > > > For example, we should have a mechanism to select a=
 device from all to
> > > > > > > > > > > > communicate with a peer.
> > > > > > > > >
> > > > > > > > > I wonder if this is a:
> > > > > > > > >
> > > > > > > > > 1) mechanism that needs to be mandated by the device
> > > > > > > >
> > > > > > > > Yes.
> > > > > > > >
> > > > > > > > > 2) a policy that is allowed to be tweaked by the user as =
TCP/IP did
> > > > > > > >
> > > > > > > > Not allowed in the current version.
> > > > > > > >
> > > > > > > > > (Note anyhow the driver can override what the device sugg=
ests...)
> > > > > > >
> > > > > > > I think we should follow what we described in the spec:
> > > > > > > "The virtio socket device is a zero-configuration socket comm=
unications device."
> > > > > >
> > > > > > We probably need to define "configuration" first.
> > > > > >
> > > > > > For example, if it means zero configuration from the user, it d=
oes not
> > > > > > conflict with 2), the driver can use its own algorithm to elect=
 a
> > > > > > "default" device.
> > > > >
> > > > > IMHO, it can be done, but it is not the current design.
> > > >
> > > > Well, you need at least explain the advantages or why you choose to=
 do this.
> > >
> > > I listed in the previous message. Maybe it is not clear enough. I'll =
try to
> > > explain it again.
> > >
> > > I think people should pick up the device by a `bind()` call, which ta=
kes a
> > > CID as an argument.
> > >
> > > Generally, the device is picked up by the source CID, which is achiev=
ed
> > > through a `bind()` call.
> > >
> > > The default device, which is equivalent to the current single device,=
 is
> > > used to be compatible with the existing applications.
> > >
> > > Apart from that, the default device is used to communicate with hyper=
visor
> > > for some init works, such as gathering information about other vsock
> > > devices.
> > >
> > > To summarize, users must do `bind()` call explicitly to select the de=
sired
> > > device for non-HV-VM communications.
> >
> > So if I understand correctly you need a way to select the default when
> > bind() is not called?
>
> Yes.
>
> > > > > I prefer to set the default device for VM-HV communication to do =
some init
> > > > > work. I don't think people have a strong need for this.
> > > > >
> > > > > > Another perspective, making decisions in guests may be even mor=
e
> > > > > > helpful for the case where the device is not trusted
> > > > >
> > > > > How does the guest realize the vsock device is not trusted?
> > > >
> > > > There're various ways to build trust (for example device attestatio=
n)
> > > > and more might come in the future.
> > > >
> > > > > The guest only
> > > > > knows the information from its config space, which is provided by=
 the host.
> > > >
> > > > The way to build trust is probably beyond the scope of virtio, but =
it
> > > > is something we need to consider.
> > >
> > > Agree with you. If it comes in the future, I think the driver should =
have
> > > the ability to make decisions.
> >
> >
> > Actually, I meant the way to build trust via virtio is something that
> > needs to be considered. But now we have other ways to build trust.
> > That would result a situlation:
> >
> > 1) "default" vsock device is not trusted but other might
>
> I think this topic might be beyond the scope of this patch.
>
> With the current version, there is only one device supported, which can b=
e
> considered as the "default".  We don't have a mechanism to say "we don't
> trust you", right?

No. I meant we don't have it in the virtio core but we already have it
in other layers (for example the transport layer).

> That is, it is assumed that we trust the device provided
> by the hypervisor.
>
> This patch is for multiple devices support, based on the same assumption.=
 I
> think trust is a good point to consider, but perhaps we have to address i=
t
> in the follow-up patches.

My point is not about how to build trust, it's about letting the
driver decide by itself in some cases.

A better way might be something like:

"The device_order is a hint for the driver to select a default vsock
device. Device MAY choose ...."

>
> > or
> >
> > 2) two device claims that they are all "default"
> >
> > This means anyhow we need a decision from the driver side so the
> > device side order seems to be useless here.
>
> There is only one default device. The device with the lowest device_order
> is considered the default. It is not allowed to have the same device_orde=
r.

Who can forbid two same device_order? Note that in various security
models, hypervisors are not trusted at all.

>
> > > > > > > So, IMO the guest (driver) should not be allowed to change an=
ything.
> > > > > > > E.g. Right now it's not allowed to change the CID assigned by=
 the host (device).
> > > > > >
> > > > > > A dumb question when having two cids (cid1 and cid2) in the sam=
e
> > > > > > guest, what happens if src=3Dcid1 and dst=3Dcid2?
> > > > >
> > > > > The packets will be directed to another application, if any, on t=
he same guest.
> > > >
> > > > Ok, so in your example, vhost-user-vsock should route those packets
> > > > back to kernel vsock?
> > >
> > > It depends. Two cases are possible:
> > >
> > > 1. dev0(cid1) and dev1(cid2) are from the same type of backend, e.g.
> > > vhost-vsock, so the packets will be routed back as you described.
> > > 2. dev0(cid1) from vhost-user-vsock, and dev1(cid2) from vhost-vsock,=
 the
> > > packets will be dropped if vhost-user-vsock device can't find a devic=
e
> > > whose cid is cid2.
> >
> > Well, this means the behavior depends on the implementation which is no=
t good.
>
> No, it is not. It depends on whether the device can find a proper
> target device based on the dst_cid.

This sounds really weird, two cids belong to the same guest. So guests
should expect that the two vsock devic can talk to each other?

>
> In case 2, the two devices are in different namespaces (or sort of addres=
s
> spaces). If there is no device with cid2 in the namespace of
> dev0 (vhost-user-vsock), then the packet will be dropped.

Are you talking about the implementation of the device or the spec?


>
> In case 1, the two are in the same, so that the communication can be
> established.
>
> Thanks,
> Xuewei
>
> Thanks

Thanks

>
> > >
> > > Thanks,
> > > Xuewei
> > >
> > > > Thanks
> > > >
> > > > >
> > > > > Thanks,
> > > > > Xuewei
> > > > >
> > > > > > > Thanks,
> > > > > > > Stefano
> > > > > > >
> > > > > >
> > > > > > Thanks
> > > > >
> > >
>

