Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB3E272809
	for <virtio-comment@lists.linux.dev>; Fri, 13 Jun 2025 08:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749803776; cv=none; b=b8xQji3GO2HFVWnkpFBWA58QfNYbTEeM/Jz3JiV0bMoNoalkg6bBfmFtvcE6Hhpv0ROxF2tJCshfZV7tZFSrYWwDQgLUUgO8nAEpQiPT5mnKa7n46Jf895Uhp4TpCBi1sHU8jcWaaBoDMLi2iLsA1VJ/R8R80ka9Zf3+KVa2v7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749803776; c=relaxed/simple;
	bh=Ho5O/icJphqpc6gQ3IiG5wkxhNcwVBPcjflbgTq8/A8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NiGTHVIIUJLkL/GZBnnFk1IckxaJE+yaFcGD6Jnq8QaSunxRDP4rub/ypoHXy2mF1MLpJsi5g9nre9Y1Ph4OkIFDFoxTMU2SphwmBNeG0OFlVOz9wHkJeh8yH4runl1TnhOuCsXs+HBhdfsVPb7uLAfHtX/wCnVjaWgDV+WPp5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Oi9PM8Z2; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Oi9PM8Z2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749803773;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ho5O/icJphqpc6gQ3IiG5wkxhNcwVBPcjflbgTq8/A8=;
	b=Oi9PM8Z2sQ3d7KSXNOioB95yTnJNRj+G8w4EQWNmCQCZT4GSWwUf/unkktVkNQBf5KZUGh
	RFBHFhHiO1AfaA8fw/LhR1oUs8eSZZBDC2Bxf3uTuqpc4ZxhcqXxPX6JCkwxxK6dXMsl2V
	pbIafMBY1lpHXifJog9XZNsHgKCyeP8=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-688-6GeReDfoNlq_EsMu4CQ54w-1; Fri, 13 Jun 2025 04:36:11 -0400
X-MC-Unique: 6GeReDfoNlq_EsMu4CQ54w-1
X-Mimecast-MFC-AGG-ID: 6GeReDfoNlq_EsMu4CQ54w_1749803771
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-710f05af33eso24445967b3.1
        for <virtio-comment@lists.linux.dev>; Fri, 13 Jun 2025 01:36:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749803771; x=1750408571;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ho5O/icJphqpc6gQ3IiG5wkxhNcwVBPcjflbgTq8/A8=;
        b=nfemHeQ2p1i7qb3eHZ8rf6v6usS5Dlih3GlmMcH6KHwTaCjnr3u1cL4uGMj+3YX8XT
         WY5DZfekubpm0qMO0sledDJdI1uc2npyMZ8sMWRoyrpko4WCiudbyuZPTlA/jCCJ08II
         h71sgH001lWtu1MDbN52kOomJin2gAkneBkTzTGIAEAeGPnxeZG9r1uSzCmM9V2g1Io8
         pYXTpHnnZf/BHvyidKvyqX+jBW21KZzZVyV9PN8Xep4lQSrrny62g47i1w5I269ZP8rr
         MIGmMczDT5nFDIorfu0R0wX+klIxdxcufoXX3QFR9dBkKd9rQ01j5BEdfWnVTKqFWM86
         ZNFw==
X-Forwarded-Encrypted: i=1; AJvYcCU9S/vW00sLGbeGcJ38PCSWbpPEFhRRXbmqr4BOe/afDkckVpCMZhHwxdWLEiBJC3YC/pTyZ6r/GIM6idApBg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyvbvQrYft+jiP6cNIB31zX72gf8zA49G/JSdA3hwcnLaOPxthP
	ENG+GwjDeUH2YsdANrPPFmMBRzufQZHa6Jm0NJ2azZKo5AHE9a8kntBqIWO+bwX5jW0/LEn1xBQ
	fG324sUgoXlnqSr6htNJuMPca6ARNsS9N/M3oYHjOLESWllzjAcVWLM6zI6AIj7MO6Deu8z0Goa
	PMt6r/hHu7V/do2EqZyb8hOAQygsMxuc/CN6c94yCYqwo=
X-Gm-Gg: ASbGncscSY8txguYp+u59UbXLyombFvJVVMOTtZWYezbB9lhbwR89wl6oMgX1OZyxRH
	cPK1dzjh5Tz+s1XWSaWQpeCkDt9Fh6rBnRCYasiHSdggEhPKTUrUnp2UpTaEqWxzwNTHx/RKCus
	NzkkazC+V/Ts3QllDHk5ocYL5AxIcsaMGLBVY=
X-Received: by 2002:a05:690c:c:b0:710:e8a8:7768 with SMTP id 00721157ae682-711637e52e2mr32673997b3.31.1749803771135;
        Fri, 13 Jun 2025 01:36:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSHU5mZj0y1bYkbcq6nGurbhJUQu3u+V3xGMmbNLoXewgm/oOnBFGtaiXvnMMZB1jEQku46jtkYSb+SkQq3Ps=
X-Received: by 2002:a05:690c:c:b0:710:e8a8:7768 with SMTP id
 00721157ae682-711637e52e2mr32673767b3.31.1749803770753; Fri, 13 Jun 2025
 01:36:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CACGkMEsFYMjQgU7mrBwq3q2cFvFH_zro=5YOMfLsxDQYv5po5A@mail.gmail.com>
 <20250613045719.1081020-1-niuxuewei.nxw@antgroup.com>
In-Reply-To: <20250613045719.1081020-1-niuxuewei.nxw@antgroup.com>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Fri, 13 Jun 2025 10:35:59 +0200
X-Gm-Features: AX0GCFuMIeeAsJaaewCnfcJWYqIS7RZaq7ubAV9yBxPT6p123icSNE7PmLXr6VA
Message-ID: <CAGxU2F6LtwfO_AgTxk+wEeqv1vKCmMGJNzyu08ttGYUfad3mGA@mail.gmail.com>
Subject: Re: [PATCH v7] virtio-vsock: Add support for multi devices
To: Xuewei Niu <niuxuewei97@gmail.com>
Cc: jasowang@redhat.com, fupan.lfp@antgroup.com, mst@redhat.com, 
	niuxuewei.nxw@antgroup.com, parav@nvidia.com, virtio-comment@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: d6HZeYMprcMAOkKiXaDSXpnfcUlkUP7XvRVD2rO7_CU_1749803771
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 13 Jun 2025 at 06:57, Xuewei Niu <niuxuewei97@gmail.com> wrote:
>
> > On Sat, Apr 12, 2025 at 10:39=E2=80=AFPM Xuewei Niu <niuxuewei97@gmail.=
com> wrote:
> > >
> > > This patch brings a new feature, called "multi devices", to the virti=
o
> > > vsock. It introduces a "VIRTIO_VSOCK_F_MULTI_DEVICES" feature bit, an=
d a
> > > "device_order" field to the config for the virtio vsock.
> > >
> > > =3D=3D Motivition =3D=3D
> > >
> > > Vsock is a lightweight and widely used data exchange mechanism betwee=
n host
> > > and guest. Currently, the virtio-vsock only supports one device, resu=
lting
> > > in the inability to enable more than one backend.
> >
> > I wonder which part of the spec forbids more than one device.
>
> No. The spec, however, is designed for a single device, and lacks some
> specifications for multiple devices.
>
> For example, we should have a mechanism to select a device from all to
> communicate with a peer.
>
> This patch introduces a new feature bit "VIRTIO_VSOCK_F_MULTI_DEVICES", a=
nd
> involves some modifications to the config space, device & driver norms.

Maybe we should think a better name to avoid confusion, like "F_DEVICE_ORDE=
R".
I'm not good at name, so if others are better suggestion, they are welcome.

>
> > > For instance, two devices
> > > are required: one to transfer data to the VMM via virtio-vsock, and a=
nother
> > > to a user process via vhost-user-vsock.
> > >
> > > Apart from that, a side gain is that theoretically the performance mi=
ght be
> > > improved since each device has its own queue. But it varies depending=
 on
> > > the implementation.
> >
> > It could implement multiqueue anyhow.
> >
> > Thanks
>
> Yes, indeed. As we discussed before, I marked this as a side gain. And
> @Stefano said that the community has a plan to implement multiqueue for
> vsock.

I'm not sure there is a plan, but yeah, we should do it some day.
As I mention in the previous email, I'd remove any reference to performance=
.

I'd just talk about a mechanism to select a default out device, when
the source socket is not bound to any address, like a default gateway.

Thanks,
Stefano

> The foundational goal of this patch is to enable vsock to support
> multiple backends.
>
> Thanks,
> Xuewei
>

