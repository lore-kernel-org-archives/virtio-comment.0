Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC1823A9
	for <virtio-comment@lists.linux.dev>; Wed, 18 Jun 2025 04:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750220410; cv=none; b=cNtpVrsE/YebjE7Jclp1Rfc0mOjPWwq8thefhAjer4yzdyh0Ki5+2tb6R8Xv/QzE/H6DOEwH8KzqiaK3SZre55/UiQR/8USWBwRwIgGi1Yk1pl4hdRIBguTrS36sIQkgL+9rT7Rf3YIXGyM2q4c5T8EuD1vkrnb9Nw7qzCmWCKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750220410; c=relaxed/simple;
	bh=UeNzrYUieFWZnA+JNEc6VQYM2H+IWLkwwbcwSGX5Hsk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K0HN46+5Qyh2bJAdDfCO/KknAvExSqrThau1/rT+7LFpyWlASNk4wXyFJ5pBnT8xStd8oY0Bs9RFdYAC2+2qPLSOuomtsS/CzFp4Mu9LOfMrf4OtegjmX1Z4d1Q4WoW0hp6xAUjGQonwY++Rv7cQChe10x4aWNllUqabCX/w6jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aYMUNILq; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aYMUNILq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750220407;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UeNzrYUieFWZnA+JNEc6VQYM2H+IWLkwwbcwSGX5Hsk=;
	b=aYMUNILqSG8+j2FjGIfbnT5oWuHLh7FF8uPovEBJ8Gn8O8GThv3TdOqgtmpQuKpZCrx036
	/xmNyeYmLL18TEskWhUBwEMRVNBB5ra4ANGcsz+PvbXwbiqalWvFuZxU1H6PvdfyzfvUkv
	Vz8RRsQidwqHy/2WTjUdu3+dNAD6kqA=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-413-VgyP5w-CMV6hYQNI7MBskg-1; Wed, 18 Jun 2025 00:20:05 -0400
X-MC-Unique: VgyP5w-CMV6hYQNI7MBskg-1
X-Mimecast-MFC-AGG-ID: VgyP5w-CMV6hYQNI7MBskg_1750220404
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7394772635dso4726888b3a.0
        for <virtio-comment@lists.linux.dev>; Tue, 17 Jun 2025 21:20:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750220404; x=1750825204;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UeNzrYUieFWZnA+JNEc6VQYM2H+IWLkwwbcwSGX5Hsk=;
        b=ETGr72mAVoHt5j758N2j7u/O8MKKWZS0GzyyhnpRuvFkC9Wb/95Es1hFrsy8jCpW2p
         GtyykDfPRt7v6ozQr+sAeXgk5RPNeJ8NJ4P+awhGnYZshfFVm6Teu8Xfm9NmhSZlkHDT
         1M7z8DFlg5ygtsTlc2XgK+nFAfrM88s5GpzhhP9iE7d4FmuvVE+COEcBvGu/MT6yT10h
         BW3eVKuSoUrDqCRoXnJ3Ts6qQkAFDun3v7cRcEZpZhpY+MAC2f8HNKJe2PjEpDqKyoWn
         A/wHYdnpGXY5wbBAtVPn+yT1TpFcBldRm1UsMzzCHGsi5FnTVaY0YSycnY7iL1dGcdgp
         ZM7w==
X-Forwarded-Encrypted: i=1; AJvYcCXJ6hEQgOcma+KpzB8glP0RBYK777urjJA6oHC0PfGuybsaoFVb3h1cx1T18Y0yx7/NcgJBkGGPZyFwKSUcmA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzv7UchmGPQht33dnLiZUY5C8+4UFfK4Nhpi4Q3Ubu8OI6QbYvY
	4Px0XW98AQGh/T/oBk+99st2PMSEbjdINROQ5zKrjxFM1ZQ+yBAiyFL/q0/0EQNm6F3NyV6O0LR
	Php71vv+7SPI/hqVt6BMfeNAvKKSwLyHWmw1p1Az4l4razgSJ8YNwxYr+r2yYw+CsJpxgnNz8Kr
	KrvjP79EiAETqyvLr4ZhpcSeZTCkiJbApF2Yr/ZB/dwGk=
X-Gm-Gg: ASbGncvHkejiYJwOqh/BDnizd64wCRQIU/M7pBY2fHK2M1z1VMg4tGaaPaTVm4e/DsB
	n/xlE6emOdpcJfFSrwonqmjQw7lZ/o+jdaLxohqeSOWEBplUZ59gPMMQn19FC8RQGUdG+RuHUeK
	0u1A==
X-Received: by 2002:a05:6a00:4f95:b0:747:accb:773c with SMTP id d2e1a72fcca58-7489cfff3a7mr21434517b3a.13.1750220404446;
        Tue, 17 Jun 2025 21:20:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH0xEWX5beP3bwZJkUmztRam2sTVj06YCU/oxpcuHJYOpp2z+/Lngs7giUaz5z3gmOh/0erHsNBBzjhiP+Z1Ks=
X-Received: by 2002:a05:6a00:4f95:b0:747:accb:773c with SMTP id
 d2e1a72fcca58-7489cfff3a7mr21434462b3a.13.1750220404001; Tue, 17 Jun 2025
 21:20:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CACGkMEvWwHSQsAiPt9R+VzwgCkhx=mqW8pXOBfHrK6B1Thc2jA@mail.gmail.com>
 <20250618024706.1364869-1-niuxuewei.nxw@antgroup.com>
In-Reply-To: <20250618024706.1364869-1-niuxuewei.nxw@antgroup.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 18 Jun 2025 12:19:52 +0800
X-Gm-Features: AX0GCFuYcCvFJQ95oqtAgdbT14aRInqZXxZ3y2eNdGbksw7Nyy4m4559lMlgrtQ
Message-ID: <CACGkMEuXV_ep5VOAD84gjWc4RqRSZ6QRzDxC0yn+Zh9gu3b-Cw@mail.gmail.com>
Subject: Re: [PATCH v7] virtio-vsock: Add support for multi devices
To: Xuewei Niu <niuxuewei97@gmail.com>
Cc: fupan.lfp@antgroup.com, mst@redhat.com, niuxuewei.nxw@antgroup.com, 
	parav@nvidia.com, sgarzare@redhat.com, virtio-comment@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XPhWOXNhnecALTwIzHUW1hLtmKpBQIJaRqND8lnkzeo_1750220404
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 18, 2025 at 10:47=E2=80=AFAM Xuewei Niu <niuxuewei97@gmail.com>=
 wrote:
>
> > On Tue, Jun 17, 2025 at 3:46=E2=80=AFPM Xuewei Niu <niuxuewei97@gmail.c=
om> wrote:
> > >
> > > Resend, because it isn=E2=80=99t listed in the mailing list due to my=
 mistake.
> > >
> > > > On Mon, Jun 16, 2025 at 4:38=E2=80=AFPM Stefano Garzarella <sgarzar=
e@redhat.com> wrote:
> > > > >
> > > > > On Mon, 16 Jun 2025 at 10:29, Xuewei Niu <niuxuewei97@gmail.com> =
wrote:
> > > > > >
> > > > > > > On Fri, Jun 13, 2025 at 4:46=E2=80=AFPM Xuewei Niu <niuxuewei=
97@gmail.com> wrote:
> > > > > > > >
> > > > > > > > > On Fri, 13 Jun 2025 at 06:57, Xuewei Niu <niuxuewei97@gma=
il.com> wrote:
> > > > > > > > > >
> > > > > > > > > > > On Sat, Apr 12, 2025 at 10:39=E2=80=AFPM Xuewei Niu <=
niuxuewei97@gmail.com> wrote:
> > > > > > > > > > > >
> > > > > > > > > > > > This patch brings a new feature, called "multi devi=
ces", to the virtio
> > > > > > > > > > > > vsock. It introduces a "VIRTIO_VSOCK_F_MULTI_DEVICE=
S" feature bit, and a
> > > > > > > > > > > > "device_order" field to the config for the virtio v=
sock.
> > > > > > > > > > > >
> > > > > > > > > > > > =3D=3D Motivition =3D=3D
> > > > > > > > > > > >
> > > > > > > > > > > > Vsock is a lightweight and widely used data exchang=
e mechanism between host
> > > > > > > > > > > > and guest. Currently, the virtio-vsock only support=
s one device, resulting
> > > > > > > > > > > > in the inability to enable more than one backend.
> > > > > > > > > > >
> > > > > > > > > > > I wonder which part of the spec forbids more than one=
 device.
> > > > > > > > > >
> > > > > > > > > > No. The spec, however, is designed for a single device,=
 and lacks some
> > > > > > > > > > specifications for multiple devices.
> > > > > > > > > >
> > > > > > > > > > For example, we should have a mechanism to select a dev=
ice from all to
> > > > > > > > > > communicate with a peer.
> > > > > > >
> > > > > > > I wonder if this is a:
> > > > > > >
> > > > > > > 1) mechanism that needs to be mandated by the device
> > > > > >
> > > > > > Yes.
> > > > > >
> > > > > > > 2) a policy that is allowed to be tweaked by the user as TCP/=
IP did
> > > > > >
> > > > > > Not allowed in the current version.
> > > > > >
> > > > > > > (Note anyhow the driver can override what the device suggests=
...)
> > > > >
> > > > > I think we should follow what we described in the spec:
> > > > > "The virtio socket device is a zero-configuration socket communic=
ations device."
> > > >
> > > > We probably need to define "configuration" first.
> > > >
> > > > For example, if it means zero configuration from the user, it does =
not
> > > > conflict with 2), the driver can use its own algorithm to elect a
> > > > "default" device.
> > >
> > > IMHO, it can be done, but it is not the current design.
> >
> > Well, you need at least explain the advantages or why you choose to do =
this.
>
> I listed in the previous message. Maybe it is not clear enough. I'll try =
to
> explain it again.
>
> I think people should pick up the device by a `bind()` call, which takes =
a
> CID as an argument.
>
> Generally, the device is picked up by the source CID, which is achieved
> through a `bind()` call.
>
> The default device, which is equivalent to the current single device, is
> used to be compatible with the existing applications.
>
> Apart from that, the default device is used to communicate with hyperviso=
r
> for some init works, such as gathering information about other vsock
> devices.
>
> To summarize, users must do `bind()` call explicitly to select the desire=
d
> device for non-HV-VM communications.

So if I understand correctly you need a way to select the default when
bind() is not called?

>
> > > I prefer to set the default device for VM-HV communication to do some=
 init
> > > work. I don't think people have a strong need for this.
> > >
> > > > Another perspective, making decisions in guests may be even more
> > > > helpful for the case where the device is not trusted
> > >
> > > How does the guest realize the vsock device is not trusted?
> >
> > There're various ways to build trust (for example device attestation)
> > and more might come in the future.
> >
> > > The guest only
> > > knows the information from its config space, which is provided by the=
 host.
> >
> > The way to build trust is probably beyond the scope of virtio, but it
> > is something we need to consider.
>
> Agree with you. If it comes in the future, I think the driver should have
> the ability to make decisions.


Actually, I meant the way to build trust via virtio is something that
needs to be considered. But now we have other ways to build trust.
That would result a situlation:

1) "default" vsock device is not trusted but other might

or

2) two device claims that they are all "default"

This means anyhow we need a decision from the driver side so the
device side order seems to be useless here.

>
> > > > > So, IMO the guest (driver) should not be allowed to change anythi=
ng.
> > > > > E.g. Right now it's not allowed to change the CID assigned by the=
 host (device).
> > > >
> > > > A dumb question when having two cids (cid1 and cid2) in the same
> > > > guest, what happens if src=3Dcid1 and dst=3Dcid2?
> > >
> > > The packets will be directed to another application, if any, on the s=
ame guest.
> >
> > Ok, so in your example, vhost-user-vsock should route those packets
> > back to kernel vsock?
>
> It depends. Two cases are possible:
>
> 1. dev0(cid1) and dev1(cid2) are from the same type of backend, e.g.
> vhost-vsock, so the packets will be routed back as you described.
> 2. dev0(cid1) from vhost-user-vsock, and dev1(cid2) from vhost-vsock, the
> packets will be dropped if vhost-user-vsock device can't find a device
> whose cid is cid2.

Well, this means the behavior depends on the implementation which is not go=
od.

Thanks

>
> Thanks,
> Xuewei
>
> > Thanks
> >
> > >
> > > Thanks,
> > > Xuewei
> > >
> > > > > Thanks,
> > > > > Stefano
> > > > >
> > > >
> > > > Thanks
> > >
>

