Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FDE584A3E
	for <virtio-comment@lists.linux.dev>; Tue, 17 Jun 2025 02:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750128886; cv=none; b=rVJngg26+cZnRQQTiO7cuPftf6vPUzNVbdQYR6c3pf2nk3aIe4uBH6tWX7QXnLHKhMPbBmiFg6GLy0EAmUerCq9Qj5Gco/l+5uLJYgZXoZFSWJSW63wBS2GE+hAa607g6HwSWT0a9EOnbCBZdTAT+NVh8LxG/4kZDVcJi8u2heo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750128886; c=relaxed/simple;
	bh=73cHaWInECK9xb+qbj7ZiLtC/JLJKTnopzd/yJZ5QqI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LFQXrORw6CxQUFF5imZBIumaflRdYO0LuRVGqa/sdzqSzPCGP+tatEqgMskc+EqGAGMM2E1+vLigSHSYX4W4fTlGPEnQyBNlqgEDZPwhiEM5wDO21M3AgaSCK7iYdU70J50nCH3TAZXeCt4fV8Y8eUsdUfJgdgHWJbWhRtwV/CI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NjyjkbSe; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NjyjkbSe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750128882;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=73cHaWInECK9xb+qbj7ZiLtC/JLJKTnopzd/yJZ5QqI=;
	b=NjyjkbSeTXUigUpAHxWth6QmHazdx8isyr8h+y3jc+E7WwRsoop0EczRFbBYDTsG9Ezy8p
	yvk/iT4NGegs833uOV92T0kpOJxOT7YT38fnHbXdR0u/+C7DbTPEKYJq7KavurUSILjZ6g
	G3SVJ+4d3KNbr/I/da4xvbtgd2hb4Xs=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-140-DPVIV0hNP5q8GW9yWJMkPg-1; Mon, 16 Jun 2025 22:54:40 -0400
X-MC-Unique: DPVIV0hNP5q8GW9yWJMkPg-1
X-Mimecast-MFC-AGG-ID: DPVIV0hNP5q8GW9yWJMkPg_1750128879
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-af59547f55bso3070274a12.0
        for <virtio-comment@lists.linux.dev>; Mon, 16 Jun 2025 19:54:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750128878; x=1750733678;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=73cHaWInECK9xb+qbj7ZiLtC/JLJKTnopzd/yJZ5QqI=;
        b=i1PnXe4qKpRkJlz3KJdct/QIyMdpH1MALaWBzKbA1a7fWO7Jj7RZzQ/GvedjdhetRS
         AOu65S4Lomj4W6RsJzq5vuOR2dxe5HYClidKmgATTgYqhd7AJBCi9qKr+7vDat6dNabN
         KGND9CgRDI6AW8dPSgGFDXpK/Sknx+bsceOR0yYILaSSBIepTr/xSUnf4bIFQRvFCyHV
         IRC4R9mry7wi4VYnnnyurx+X1UKgjYriZ9scRMCPH1JjmQM+EZd7rnjbMZ4wZgRZL6y7
         V9TW7UrP4N9Su2S9pgKIX1+XdAQGlJNQZPMChSs6j28ctVuktSlgElB0dPqNoomSR4ak
         nJpg==
X-Forwarded-Encrypted: i=1; AJvYcCXxyA/n4/gNy4kgdHbFe63TuBT80F4PA68+tnNxkmNUTZV39toEa0/ab+72NswHAH3MMk/gQ8/nNGA3/SOsVw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwhfpWxT+omB3ETB34oalkKRP59Pm89nqQPvzyZ2f3XfmaprAxF
	IH87lIPt4Gfz1khRZPWhTowPkqA2PTf7KG5unmNxyyDO8zZ+5KW0ss/giA5miKMHBCfArFe6VQh
	q3zDXYIII9tzbXGLejW7rWA/g0assW9fGO9BxWUF6Ogoct3ctGGGBliE/OldqlDeA5gSrT/QcOb
	ZqdcIkvbPWLUtpdkyJUukCSGLyzrVulQuC7hWbUDK3MU6rGvkmJ4BEWanC
X-Gm-Gg: ASbGncsc3PA69blTtQ4pbv/H0GpbDq9IepIEOttxUznFH0amMftmqIS47iVzs8mffEi
	M5hvzuDh4Jo9427XclxL+gm4lmU8cfMZ9zjqkuvOotiUOBiHoYTe1mYBvw0Ej1Szwn163zaCKWo
	MJie0N
X-Received: by 2002:a05:6a21:3399:b0:21a:e091:ac25 with SMTP id adf61e73a8af0-21fbd505f24mr20480985637.6.1750128878599;
        Mon, 16 Jun 2025 19:54:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG93JZVyI/A4aE5kZFRs3369FpKP4Z8vSUpGIHppqO5Q4VqdX7OyvWlaPEHI7BsNMxQ8L1+FcOSJQ35ZJ5a0Bs=
X-Received: by 2002:a05:6a21:3399:b0:21a:e091:ac25 with SMTP id
 adf61e73a8af0-21fbd505f24mr20480955637.6.1750128878207; Mon, 16 Jun 2025
 19:54:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CACGkMEuV41G8S2gt=HozCK5GR6fv-QSChscR5TsG2HLO3H5FUQ@mail.gmail.com>
 <20250616082914.1159976-1-niuxuewei.nxw@antgroup.com> <CAGxU2F4fjuvPK_4tU4-Tm0mYg3Rd5AhL6uaJmCmSTRzaqzAr6g@mail.gmail.com>
 <CACGkMEtAyjx2XF9dRzhhNGsmKyWR0RvLsYbemvK5LbPUCGyKYg@mail.gmail.com>
In-Reply-To: <CACGkMEtAyjx2XF9dRzhhNGsmKyWR0RvLsYbemvK5LbPUCGyKYg@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 17 Jun 2025 10:54:26 +0800
X-Gm-Features: AX0GCFvjipi12UzkZ0vojQx2iNrVCuxoTQyo9B5Nm9ITVAvEw2CuWzUlL7-_ZbY
Message-ID: <CACGkMEv2-p9XyEmkhe=WTLwAVYdxoqyv=exSxmscE7ZyXOt6tQ@mail.gmail.com>
Subject: Re: [PATCH v7] virtio-vsock: Add support for multi devices
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: Xuewei Niu <niuxuewei97@gmail.com>, fupan.lfp@antgroup.com, mst@redhat.com, 
	niuxuewei.nxw@antgroup.com, parav@nvidia.com, virtio-comment@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dDkR6HE01QbzSNiBL7k4loDYVBj1-Q28u_4HSaPxRJo_1750128879
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 17, 2025 at 10:52=E2=80=AFAM Jason Wang <jasowang@redhat.com> w=
rote:
>
> On Mon, Jun 16, 2025 at 4:38=E2=80=AFPM Stefano Garzarella <sgarzare@redh=
at.com> wrote:
> >
> > On Mon, 16 Jun 2025 at 10:29, Xuewei Niu <niuxuewei97@gmail.com> wrote:
> > >
> > > > On Fri, Jun 13, 2025 at 4:46=E2=80=AFPM Xuewei Niu <niuxuewei97@gma=
il.com> wrote:
> > > > >
> > > > > > On Fri, 13 Jun 2025 at 06:57, Xuewei Niu <niuxuewei97@gmail.com=
> wrote:
> > > > > > >
> > > > > > > > On Sat, Apr 12, 2025 at 10:39=E2=80=AFPM Xuewei Niu <niuxue=
wei97@gmail.com> wrote:
> > > > > > > > >
> > > > > > > > > This patch brings a new feature, called "multi devices", =
to the virtio
> > > > > > > > > vsock. It introduces a "VIRTIO_VSOCK_F_MULTI_DEVICES" fea=
ture bit, and a
> > > > > > > > > "device_order" field to the config for the virtio vsock.
> > > > > > > > >
> > > > > > > > > =3D=3D Motivition =3D=3D
> > > > > > > > >
> > > > > > > > > Vsock is a lightweight and widely used data exchange mech=
anism between host
> > > > > > > > > and guest. Currently, the virtio-vsock only supports one =
device, resulting
> > > > > > > > > in the inability to enable more than one backend.
> > > > > > > >
> > > > > > > > I wonder which part of the spec forbids more than one devic=
e.
> > > > > > >
> > > > > > > No. The spec, however, is designed for a single device, and l=
acks some
> > > > > > > specifications for multiple devices.
> > > > > > >
> > > > > > > For example, we should have a mechanism to select a device fr=
om all to
> > > > > > > communicate with a peer.
> > > >
> > > > I wonder if this is a:
> > > >
> > > > 1) mechanism that needs to be mandated by the device
> > >
> > > Yes.
> > >
> > > > 2) a policy that is allowed to be tweaked by the user as TCP/IP did
> > >
> > > Not allowed in the current version.
> > >
> > > > (Note anyhow the driver can override what the device suggests...)
> >
> > I think we should follow what we described in the spec:
> > "The virtio socket device is a zero-configuration socket communications=
 device."
>
> We probably need to define "configuration" first.
>
> For example, if it means zero configuration from the user, it does not
> conflict with 2), the driver can use its own algorithm to elect a
> "default" device.

Another perspective, making decisions in guests may be even more
helpful for the case where the device is not trusted.

>
> >
> > So, IMO the guest (driver) should not be allowed to change anything.
> > E.g. Right now it's not allowed to change the CID assigned by the host =
(device).
>
> A dumb question when having two cids (cid1 and cid2) in the same
> guest, what happens if src=3Dcid1 and dst=3Dcid2?
>
> >
> > Thanks,
> > Stefano
> >
>
> Thanks

Thanks

