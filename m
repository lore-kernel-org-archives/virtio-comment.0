Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FEDE269CE5
	for <virtio-comment@lists.linux.dev>; Mon, 19 May 2025 08:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747642747; cv=none; b=lNYkdngYBkVBgK8cJA/xmmOnnt3ZQi0JZIcu1bNW5Pq29aIsRtHk5g11qpvN865IgqlFaIHAsdaQm9+JopzcjYdky3Ckuy6DvUlTW54IZX9DmqRRx1s4fmpVPKWmW3qJBb+ItvqhUP2oGO4AzJS+/M7u6b7a3mSLV8ZSj+vTMqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747642747; c=relaxed/simple;
	bh=bpNMFiSO65YqREFKfph54Li2ZC08i0gZG+fmPAm0pLA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CFFM1lCHrpII2UDSwNs/SG+lvBI5x48a8kW7i0Bpg7Bm9WRKkvbE+In/m4X4wpwJSuAN2ad4JKeFNsknIN6iTWmWN2F0QZDDzxAJB+qahxuoCzKpKLOoivdliYKc/imhnqiy7RPV+Zghzl9za0f8DynM4lwfbyGGbP1xviEqGJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l90DR0ug; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l90DR0ug"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5efe8d9ebdfso7446505a12.3
        for <virtio-comment@lists.linux.dev>; Mon, 19 May 2025 01:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747642743; x=1748247543; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vFkdQmhSeQUF05kWJRA2SbiD0uKNt5o+G9EfIhwY3+k=;
        b=l90DR0ugRv64RXc912nLnwncutjev9KbtCkzGZRNQ75dzuFCZlrfkwdDSvbL+lc04Z
         2AeX+TAb2sODLITWf1Yfwu/Fa88WrLglYAvRs/4ksjxGAiEbHhVSwuDyK83L8PREo6rW
         nkoyG1STJVLfC9Y3YG+wtSBiu2YHSrs+EmkLacJ5W88tSSiBMcRx2HJJWoOwPYZEOs6f
         e8nrJiMvwxZbDEY/YWyVvVvGh3FYYXNoLxr7FpI3iDQ3s7rruc44qoLIye8W6gajvh66
         SduVvCq5SoFqgt7c0K5n18cqLvbwFnHQjPyaQYKjXg10S+2cAfrQ2LZu/XZcaZ17AHrJ
         cLsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747642743; x=1748247543;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vFkdQmhSeQUF05kWJRA2SbiD0uKNt5o+G9EfIhwY3+k=;
        b=jDZ2GuGWBGJPVrSw5H3p10Czy3dya9VeuC78/j1/w/YWoaTEOKwez6IG8/PiYvnrrC
         d+Q+lYKNW7NkkJVaOKAbU/ymdnK6txy1EAbeeLS2IXw79Z5cpC7lp1BDbYqT0PeaEvet
         FbrtaBaZRRimypUcAWuKCznP4haKS4RR8utlRgnJZ69Nm+NUY2wSY9KivWmOKIZa+qbi
         Ao9MGFgCzH3V/gJEvnkfFRdqOoiit3HvFklrsDZ9DpRVFX7wpgUmn1wGLb010iSBlLpf
         ahN6Wmm2yMpFd9MSL/XjqY/NxgUhZSB1eghuPeussLvUUTCeqj5WHRKjnqe/D3mj11pk
         sRSA==
X-Gm-Message-State: AOJu0Yxwa2rXERrnPGd4Wz49we2PPj+0hkXodKsRE6AwEDe4liijV3tZ
	/ovzKA6sto1682t6sBplwQ49HUEDa3dL4uxpHZV+XoHTv4tPJn+8w3oohsb/cdnTgXgA1tGFJHs
	IpmSi3HHCxOzYa1FqIqh2tkptlKfu+pdUMMyOQMOwMw==
X-Gm-Gg: ASbGncsdJAPJiQRjJZ92f6La9zRu6TAosLwGUY3Cfc6KJsdDC1KnsKRgx++lgCtYlgp
	wACuaMXsXtzesLVkmcig+p86NMWJCwQ0FrE9ZM58IlTowYkcbZ7RFNnEYFZ+l5XDROcu4dWaViT
	EUSe9wNolWfMNy8mtWGDfQNRxoeMT17jhwQRTAAQ==
X-Google-Smtp-Source: AGHT+IE0/H9inREnSVyj/Suujp07Mlf5Xo6tWTYrEZeV2VJoZHeIMJJtuOAU5r9+KwA6nJ0ORsjdG4wZi1NQrlepmiM=
X-Received: by 2002:a05:6402:520f:b0:5fb:ad3c:d0c0 with SMTP id
 4fb4d7f45d1cf-6011407dd5amr9385079a12.1.1747642743479; Mon, 19 May 2025
 01:19:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <87semtpjrt.fsf@draig.linaro.org> <CAAjaMXZgeNpExoiDKr3RRms_voE0bU9G033gOmawDqsFbGj2Gw@mail.gmail.com>
 <20250519034810-mutt-send-email-mst@kernel.org> <CAAjaMXafNUEk6jAkh-9iY6JNSKzawM+GRJAHAxZ6X9dkwhMyfg@mail.gmail.com>
 <20250519041030-mutt-send-email-mst@kernel.org>
In-Reply-To: <20250519041030-mutt-send-email-mst@kernel.org>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Mon, 19 May 2025 11:18:36 +0300
X-Gm-Features: AX0GCFvF733KtOG_gIuwXmsOvfZpe_0HfQL9YTj8FGW-zt3EiirLxzumKFTA7vY
Message-ID: <CAAjaMXZZX+i86U4_N1_8+czc2kcWP3=NUgLjT8BMemCYBD6uUw@mail.gmail.com>
Subject: Re: Central repo for VirtIO conformance tests?
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtio-comment@lists.linux.dev, 
	VirtIO Dev List <virtio-dev@lists.linux.dev>, Bill Mills <bill.mills@linaro.org>, 
	David Hildenbrand <david@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
	Stefano Garzarella <sgarzare@redhat.com>, Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
	Sergio Lopez <slp@redhat.com>, Cornelia Huck <cohuck@redhat.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 19, 2025 at 11:15=E2=80=AFAM Michael S. Tsirkin <mst@redhat.com=
> wrote:
>
> On Mon, May 19, 2025 at 11:03:43AM +0300, Manos Pitsidianakis wrote:
> > Hello Michael, thanks for the reply,
> >
> > On Mon, May 19, 2025 at 10:54=E2=80=AFAM Michael S. Tsirkin <mst@redhat=
.com> wrote:
> > >
> > > On Mon, May 19, 2025 at 10:43:33AM +0300, Manos Pitsidianakis wrote:
> > > > Pinging this thread to ask the OASIS people: Would it be possible t=
o
> > > > host a software project (this testsuite) under OASIS but with a
> > > > lighter contribution process? We expect everyone to be contributing=
 to
> > > > them, from open source/proprietary hypervisor developers, to kernel=
/OS
> > > > developers, hobbyists and professionals alike. So I think a low
> > > > barrier of entry would be reasonable here.
> > >
> > > Take a look here pls:
> > > https://www.oasis-open.org/open-repositories/#licensingRules
> > >
> > >
> > >
> > > > Seeing as a test suite is essentially tied to the published VIRTIO
> > > > spec itself it also makes it a good fit semantically. Having a suit=
e
> > > > with multiple VIRTIO implementations including slim images with Lin=
ux
> > > > would also give a wider frame of reference for downstream consumers=
 of
> > > > the spec. Currently, the Linux kernel is the de facto (because it's
> > > > also open source) VIRTIO implementation on the frontend side and
> > > > oftentimes we end up looking at what Linux does to implement backen=
ds.
> > > >
> > > > We'd like to potentially:
> > > >
> > > > - Expand the array of rootfs images with more Linux userspace tests
> > > > for more devices
> > > > - Expand the array of rootfs images with other open source OSes as
> > > > they gain VIRTIO functionalities
> > > > - Implement missing VIRTIO spec features in our unikernel test and
> > > > also exercise realistic but basic VIRTIO command use scenarios for
> > > > more devices
> > > > - (This is on my personal wishlist) write a VIRTIO fuzzer framework=
,
> > > > similar in spirit to Google's syzkaller project (unsupervised
> > > > coverage-guided kernel fuzzer)
> > > > - As a stretch goal, provide a reference test runner framework to r=
un
> > > > the images with QEMU and rust-vmm vhost-user backends for people to
> > > > adapt to their setups.
> > > >
> > > > PS: The git repositories Alex linked are temporarily inaccessible d=
ue
> > > > to internal unrelated issues, and will be public again.
> > >
> > >
> > > At the moment, from the above link, and if you want it tied to OASIS
> > > open repositories, it has to be one of:
> > >
> > > BSD-3-Clause License (which shall apply if the TC makes no license se=
lection in its approval action); Apache License v 2.0; CC-BY 2.0; CC-BY 4.0=
; Eclipse Public License v 1.0.
> >
> > OK that's doable and completely reasonable.
> >
> > > I am not a lawyer, but can full OS images we licensed under one of
> > > these? If not, you are better off creating the repository itself outs=
ide
> > > the confines of OASIS.
> >
> > We'd be hosting essentially build recipes for the images, for tests
> > where we use other people's code. The build recipes would have the
> > same license.
> >
> > If I understand the CLA requirement correctly, even if the
> > contribution is merged by a maintainer who has signed the CLA, the
> > original contributor who has no write access to the repository, has to
> > sign the CLA as well?
>
>
> I think is would be the OASIS equivalent of the Linux DCO:
>         Each person making a repo contribution must be bound to the terms=
 of the
>         CLA, by obtaining their signature (which may be an equivalent ele=
ctronic
>         assent)

So just a Signed-off-by? That massively simplifies things!

> If you like I can reach out to OASIS to confirm.

Yes, that'd be very helpful, thank you.


--=20
Manos Pitsidianakis
Emulation and Virtualization Engineer at Linaro Ltd
