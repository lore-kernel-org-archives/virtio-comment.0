Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F6233F54C8
	for <virtio-comment@lists.linux.dev>; Fri, 15 May 2026 09:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778837324; cv=pass; b=LHF87xvak+/2Mbm/c4SE7oXlu8/OYjqdyrTCc2qThpLYFWf8UyIPXUNI85lHMsd9jpd66devsKX0qZTcErqWwNLVibqhZI7OXr4/w8Vl35nsrWB0aPdGno8qkIiy70wQ8XppTmH1JQc6cD/JgV3x6aJPOYg7qIzFEuSEDGAGG7I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778837324; c=relaxed/simple;
	bh=TA1LNvdr9zSvGfsiMYJw4zRIXHtuoDHKfIJjdj1a1iU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cIVLmByYkx2eVfILiBUF1qAkCj38qE5nHGfWEtjPfj27F+RtLe9qyBSqYNrwlUywMvqzsXJHYtnDlLpGjI8QLcSqq84Tb5Ynp4iEmNcpSoJ1Yqwg3XeTxaq56hCewxfyjFaeHs4NRFoJ2rrhXt7FKe9ebYYq/Ec4pOUAWh7ua58=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WzJnYH8L; arc=pass smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WzJnYH8L"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-452169ae568so6907566f8f.3
        for <virtio-comment@lists.linux.dev>; Fri, 15 May 2026 02:28:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778837321; cv=none;
        d=google.com; s=arc-20240605;
        b=fBl/JRNPqtJ9TxdTnbGzzK8fRuzHo5IKCDBOoHfI0i4PCw1RRILyqd6b+pal29vNSz
         3lwU7FLhEzJjLeV9WdlRh3jcOF8MgkXOPCanyb0brNyLPDdPSXB5sXMwKFUjJo8X4/4V
         uwGzFumMo4UKmxpBIoYG2qgXMrtVlMXCxuIE1cskj+fgaSbho+OwgvpRi9MFcgzPEoOJ
         VYBObb1G7y+eIhGwOJoG2Sy/fUcAhqEWed14MMJ/TjB9sQ7hQctKkBYmRUFzjGfxSdVQ
         P1wJn9IUVGy4uspbYy1QQGVVz6C4GWgEHqqfylAX46hMO5NZwXlfwK4w5/C+qd99nYaV
         HCfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jScLVhjanJszCEaPZix6O7Rs93LqcHuHfAeXMa7PGw0=;
        fh=rjBb7IxhhnsGnt8HksEH6pMEU66l46qhxJFEEALZbJk=;
        b=kgwjKoAXXW9sabN4BQpBmaKR7Q935xaxdIllSQT6ss5K06RttQ2yw9Yi6A/YivUq6a
         Pq3dIMAbrV38o4IxkgcMeOtxhAD/kf7I1G7L8hD3pVRAMaktOsEQ0TWjmWmpsrgECde5
         K16dI00DXeyO2b81WLxCWeFpOBScEJwbpkiP7vqWj2tUI90qI3GghQVczORqhv11DAlN
         W/K+iboXzBMXULCCz8dpq788LvGGayHYV7+3y+0z/wMOjS2Vns44MhtwxSUUSrYcmwkW
         Uda1/umJW5rAZhRx59GxG1oSlpeBHpGPmqMjPgjZ/3C8Em/ItUIDd+pYvXaPetddPqBN
         UTkA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778837321; x=1779442121; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jScLVhjanJszCEaPZix6O7Rs93LqcHuHfAeXMa7PGw0=;
        b=WzJnYH8LUtzYHk2sXRerf7zF/ZjEZGJkQY46k6QgfMs/gppmdvOx1ZPwUBMY9GxoqM
         FvbQbD00FwsgSIIlz+HgPkBLoPANi8Xukn3auxOWSpjCtsvNfYekUdDQl2LI6hytUpET
         ZjrIuSyxV2q6BNuvV3H5SyRpbGr5G6t12AcI0LmAnldmhGEV+nvRPaGZNB7JJayixzsX
         0CN8ATy5ZcqTzMfxd92qWiz11MsujM6pxYwIDVTiPFq1FBjdqxmLmfWx7MD0rTRUBM8e
         XiklIGZmXXEJg04HDr18U5qn3RDc6cA7wQj/he015sf4+aD+e30YhxtTp9HN/17neNjS
         sdUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778837321; x=1779442121;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jScLVhjanJszCEaPZix6O7Rs93LqcHuHfAeXMa7PGw0=;
        b=oWg6w5hnqoh58yqNQvet7SY7mYB9sWtS1/r+6DB8DcZw30Sdnke1pCvMmGMVzUikn8
         f1iVOy2jlZd4/IIl/qsvewhmDtO1h8J2PozY+0/fCuW/pVXt0bfTmgiVa0nYbCd7rOao
         Uu3cZ+nvHX0ZKha8Rqe8bs9XI0Bg1pvAwePA+/g0fEZcvwlgdvMfZSnVRxEntv3YiHO9
         7gGekXRd9hswxaeakOUIDiZPLT4juQA+JpZ5t1z7Do+KrfjutxkL5hpEg0Nz5ERC8B1s
         A+6vRfaQ/h01qVYiu3hM+NcZkZ2T9TxmCJvAtkLSYwJXVtqt/oOyejgaWWu7+8IMXw10
         mVfA==
X-Gm-Message-State: AOJu0YwQD6FQRX46ekHinCQrnuyECVpXjLbAm+c4VVBW+yNRfNlo1623
	EjWtLegygrBVA4gFGs6q7iB0gEgncSTcQ9ovx1CDCPLUAb0wJ9VFTueFIJYEJLIrj5G15u/EP3t
	kQRhh5VklTBXAbYpRdNPEkxZsdmpYRMiITZllbxiccA==
X-Gm-Gg: Acq92OGV2cQCzES2GwU1QSNOgeSXq47s4QhicSChmOKiXt4F5G2GCklDe5hhz6sDfhY
	jrzE3lkcsd8JseLLBWNnIUHEpKtvznL4AbgUAhFKHCH0JJUa4h73yQ+KGEFxH8oMvH35UAz105T
	agBipDHYYSLUumh7yq5c3hP5qkeKlYLKgCbdMe53Pg1naIG3+umcNf3ZIL9clezE0FU7RHsqdNU
	kTR6nVEyvNrN30flsDjoiQ6PpQBC9mJDhuvRzTJvoMt7jTZFMd/O0itqQCNzXv2cDZKgmdOPY24
	fnI3eiisyFWiM0gsu5Ajoq26jMrW6g3P6mhSyKP2iU1F7ipe2g==
X-Received: by 2002:a5d:5d01:0:b0:452:a293:4d91 with SMTP id
 ffacd0b85a97d-45e5c34b279mr4264080f8f.0.1778837321485; Fri, 15 May 2026
 02:28:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1778140241.git.mst@redhat.com> <b29dee815f250b3332651a1a5aeabc4e49ec6914.1778140241.git.mst@redhat.com>
 <CAAjaMXZggBhThMSrR8-YWx=AZDi00hm9or6CSB+v3xgjvbaotg@mail.gmail.com> <20260515052118-mutt-send-email-mst@kernel.org>
In-Reply-To: <20260515052118-mutt-send-email-mst@kernel.org>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Fri, 15 May 2026 12:28:14 +0300
X-Gm-Features: AVHnY4Iio0GgpBfut0eZZkWMC8860Mbd8li1l5QBRhJfuZPkGGPHa_hNXb0FilM
Message-ID: <CAAjaMXYMOjxEL6uwVgzmfiH0PDkkdOrsCw2AzwOgj6Oie3D7Xw@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] balloon: add VIRTIO_BALLOON_F_DEVICE_INIT_ON_INFLATE
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtio-comment@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 15, 2026 at 12:23=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com=
> wrote:
>
> On Fri, May 15, 2026 at 12:09:24PM +0300, Manos Pitsidianakis wrote:
> > On Thu, May 7, 2026 at 10:52=E2=80=AFAM Michael S. Tsirkin <mst@redhat.=
com> wrote:
> > >
> > > Add VIRTIO_BALLOON_F_DEVICE_INIT_ON_INFLATE (bit 7): the device
> > > initializes inflated pages and returns a per-page bitmap indicating
> > > which pages were successfully initialized.
> > >
> > > Update Security Considerations Data Integrity subsection to cover
> > > both DEVICE_INIT_REPORTED and DEVICE_INIT_ON_INFLATE.
> > >
> > > Fixes: https://github.com/oasis-tcs/virtio-spec/issues/242
> > > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > > ---
> > >  device-types/balloon/description.tex | 73 ++++++++++++++++++++++++++=
+-
> > >  1 file changed, 71 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/device-types/balloon/description.tex b/device-types/ball=
oon/description.tex
> > > index fa33105..7afdb24 100644
> > > --- a/device-types/balloon/description.tex
> > > +++ b/device-types/balloon/description.tex
> > > @@ -52,6 +52,9 @@ \subsection{Feature bits}\label{sec:Device Types / =
Memory Balloon Device / Featu
> > >  \item[ VIRTIO_BALLOON_F_DEVICE_INIT_REPORTED(6) ] The device initial=
izes
> > >      reported pages.
> > >
> > > +\item[ VIRTIO_BALLOON_F_DEVICE_INIT_ON_INFLATE(7) ] The device initi=
alizes
> > > +    inflated pages.
> > > +
> > >  \end{description}
> > >
> > >  \subsubsection{Feature bit requirements}\label{sec:Device Types / Me=
mory Balloon Device / Feature bits / Feature bit requirements}
> > > @@ -249,6 +252,10 @@ \subsection{Device Operation}\label{sec:Device T=
ypes / Memory Balloon Device / D
> > >  and before detecting its physical number in a deflate request
> > >  and acknowledging the deflate request.
> > >
> > > +If VIRTIO_BALLOON_F_DEVICE_INIT_ON_INFLATE is negotiated, the
> > > +device MUST NOT modify a page after reporting it as initialized
> > > +in the bitmap.
> > > +
> > >  \paragraph{Legacy Interface: Device Operation}\label{sec:Device
> > >  Types / Memory Balloon Device / Device Operation / Legacy
> > >  Interface: Device Operation}
> > > @@ -672,6 +679,67 @@ \subsubsection{Device Initialized Reported Pages=
}\label{sec:Device Types / Memor
> > >  If VIRTIO_BALLOON_F_PAGE_POISON is not negotiated, the device
> > >  MUST fill each initialized page with zeros.
> > >
> > > +\subsubsection{Device Initialized Pages on Inflate}\label{sec:Device=
 Types / Memory Balloon Device / Device Operation / Device Initialized Page=
s on Inflate}
> > > +
> > > +When VIRTIO_BALLOON_F_DEVICE_INIT_ON_INFLATE is negotiated, the
> > > +device initializes inflated pages and reports which pages were
> > > +successfully initialized via a per-page bitmap.
> > > +
> > > +The driver appends a device-writable bitmap buffer to each inflate
> > > +descriptor chain, after the PFN outbuf.
> >
> > Maybe we could say "page physical number" instead of PFN to stay
> > consistent with the rest of the balloon spec.
> >
> > > The bitmap contains one
> > > +bit per balloon page (4KB), where bit N corresponds to the Nth PFN
> > > +in the inflate request (0-indexed). Bit N is stored as bit (N mod 8)
> > > +of byte (N / 8), with bit 0 being the least significant bit.
> > > +The device sets a bit to 1 if it successfully initialized the
> > > +corresponding page, or 0 if it did not.
> >
> > Does this mean page size cannot be larger than 4kb?
>
> With legacy balloon, pretty much.
> This hack of sticking right-shifted PFNs in an outbuf
> is a broken interface that can't even support large guests.
> If someone worked on a better one, would be great.
> But for now, this just supports zero reporting with that.

Makes sense. Should we mention it in the traditional balloon device
description? Or even put device and driver MUST statements that page
size is always 4kb.

For this patch:

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

>
> --
> MST
>
