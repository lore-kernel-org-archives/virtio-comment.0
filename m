Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794981606;
	b=n4AxbhSKuBNAWgh3+qnySatfiZsvsIj9D4ze9eN0z//u/zU0h6ZJWVOnOD3/MmnbtrWp
	 x+HphU3yuD9eTqMYnKBPRm/maVrqDCpa49+QxTIh81IoHpMaVRzqIksE7kH69kpsrB/3q
	 HBZ87dTWNjSuvzoWCluMagx8ds/nHOZUSRjEDZv9z833cIXQ1n2Nr0AU/XgbQ8Kp83cBP
	 G7W7IFNhg5LOChQybZc05QlVgV65xxC+GMGsMavKswKWhyN+prU+I0iL23eDa7maajTG2
	 pZAxK4voRx5LtulVmKQNrzXcuwSd4XsDqfVKSDcYqOuRGzzizyfZ1vKZsWj5VY5y0Og==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794981606;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=4t8GDgg6910malDk6ZYGA8pR09APYud8NhROc9PxTm0=;
	b=MOwpfRgidt4XmeKh5e2GSJYx9bbpxWijoTvzGjSVmFxFEM4uP3kkkW+My0yBMKchqElN
	 OD22NhKaFO4DsL6xu8X4mYGxjOtquyWuudXBeob1dhuD9ZENwys/PMFMOnbazzBwlaNvo
	 H2wOaZjGOLFWrXm53FChujbxeDkL3wetMNN1RfsFpr00UFbzT9EIEIhsuwxjIL7o45WxA
	 8D12BgEsQxSZYVWFYmHSrahQb6/ZWDUVLy9MJLNyXH/XJIn0iTDuFw67tgVAd5OQwD/v0
	 gAW5o6shacZHv/RIKjFPWgq84f+zzqjhLPa8CzY/Z7t0MiVhPm9xGBDbcN4QcbiNR4g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=xNi1yp4X;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B412F606A325
	for <virtio-comment@lists.linux.dev>; Wed, 18 Nov 2026 06:00:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B412F606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=xNi1yp4X
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so5748895e9.3
        for <virtio-comment@lists.linux.dev>; Tue, 17 Nov 2026 22:00:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794981604; cv=none;
        d=google.com; s=arc-20260327;
        b=b8uEpfJWLOtHDwb3q2v8Lrkzo+hKOkceAdm7DT1RHP4JS6Pwoscnl44ob+sB+tznoX
         IHNbTxhLJFv+BG5qSXr8dciKmXiysylMvRrgCZF2z5EqmWEG+x2wZtjDseyybShfiIet
         gbKVOZMQfgHG9A3R+HpOO0tauyDQdjXtBrK7+86uxUfxBJlt4hghoiPzIuByyZbUpCbO
         OBofqf7stisCKLDJrGTBU4he0/8ZU6xswdXnCd+KJfyMEJjs1ZCwcSUo4SRQow3LQsw8
         Pbu27x4E/lEX6bem6cKm7P/e/6E02cYqF32fvVDNijAtFUWZdXmgeqaFz0Tf+n3pDPw0
         Xyiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4t8GDgg6910malDk6ZYGA8pR09APYud8NhROc9PxTm0=;
        fh=og1HMxyjlOZJ7/+HGcvFnsYmhEMvq8q/ocCxZPFlArg=;
        b=eNoN8GS4ZVNgEBhEYSmO+UeWwoqrl7GSHPFOmri8pozUQnYv776G7qP/o5GV9Vm9eW
         oWNZbVAOmwiGjFMMlOHABMvgRsNbmYkHFOwGYbbu2o8e2/pYkZGgP+zell+0prAwqxo4
         JOtpbkmh+cB832YR7EJjV/dPhUliX3bAPqMT4ul4GAS706PJ8+u/ymi0Tg72PVp0ht28
         Ox3sZtCjJO674jYQ7M2/PbpqyvR/O1ElrgezHRCyQ3YFpwK8quzV4OZZGaHGYKy8DXN2
         zT4gwai5deteFB3EzwB4FK6/zZx0FTLX04pKW3YelOr3l/7ph3UyjP/apn6//w4mbANK
         r9VQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794981604; x=1795586404; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4t8GDgg6910malDk6ZYGA8pR09APYud8NhROc9PxTm0=;
        b=xNi1yp4XmCuhmGYcQRyTtaUeoJhPZW4pmqTb2mD9B6YrraioVU/j2+PUl66GYFnUuq
         a0du/XuYXrMBk+r5J+iWsMy5qCImVkYNK1JB3J/UjTXSDH0TWN9dxT6bP3AcT29v3p+K
         XBYULB4Od9Dk9UatvKNAhP9kdT3ZtsibCR4QBjO8jbX9GcvJcGMSiEcyIRe6VNuXB4u5
         pru8IdfzlhOgCeVyIiw+McUvyMbjPv7i6aIOKSAnlvzj4PTk4JQUaDMrK97sHHro6w2y
         DTDcXAEt2UTWwncq5oj8XKO/NDvCb9ogvFK9ddhYskZ6WOsmO8+qkRUfTRjo+8IXBoVs
         4zIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794981604; x=1795586404;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4t8GDgg6910malDk6ZYGA8pR09APYud8NhROc9PxTm0=;
        b=02De0jb2KIZH3NoDrjCA9/aTrqsdLWAbrbHI4bgI20eCrFjeGhLSOq3U4r4FPxFtEe
         gm7zU7jOA2UL6+mW0h5lVv5BLQYrx6/QMwyQSPIoxDIqBNRHyM/uLE+Pe1F/jB7TKrFJ
         Nd8rCdwqBVC5pKvPGs0KlNEI1S8Fch1YuCuT2nwGvoQIo4AVhzaOWmVRFbLaA7WA5U7f
         bP8AmWpgAMyhBL8GuShq8uh+tYPiJCcWWQrmNugRrKT/EMMYTuDDZ2DdgskOYrzOjF+7
         CDQQgfgjlyvPCRVoV+H6Oa2idQcsBSdjnXEE7WvRJTDVNL/xgd+Vkisi6SX6z341SxWt
         EJpQ==
X-Forwarded-Encrypted: i=1; AL+hErETsjdqsTY02uirrYNoFz27wUOrV4jFkYzcZdwgbR+kFx8IGHhQdOPQvQ/h+2n1qnDlEhgNCwgTEnkTQwDk2Q==@lists.linux.dev
X-Gm-Message-State: APuU4Z/g7AqxVI4INAcYp38UdRDeRwO5kilZyYOJjX+Y9oTk4Q0culcq
	nwLAE+YjpqX2LsjZJF6x3ancfxj+WZFExH8IQKDiraySvRpMbhlMIWu8nNNnsPVuhSzqxPM2tE0
	Mu4t+/d+tOGe10gL5xNxxi7FNGqI9nRqSyfX2kyhF+w==
X-Gm-Gg: AYBFou1nY9SxWOXqtWONBkR8nmKmqhvd0oiPxoVaIWzFsIA1ZqkrwtZ5yB4S9mN2duh
	2dOfyqKdTSQVuXWxd7e8VmYxqi3NGxvXa+skSoZbvEj2d7XnG4YFALGZF25mZhEQAE2QnQMqjtN
	L/RsI/Woi4kU7CHr/5okZwSg3OK9J2QE7p9/SaLmV2wzz2XD+PlrOwTGi6k7BdMXo+FHtNz63xq
	MmN+fF79vaUmd8QGAmPwPCjVevqHr2oQLV6vZ/h70WDZae8ohXgygGPyU88iG4PSh8vVux83s7r
	q12U/99W3E5RPZWiFGCDA9rWmzEWWe80ZbnwGqiTS3QQCGp6QW105pEycdR2r7ocULLlNd11sLf
	EnPYkEPfg7m+DTMZWqlExUsnZ1wTnk/M7Th+IIGcjFqFvxNVYEprYlK3bfgdmCuHekrfEm5ox6B
	p2F5qNVVp+xV8S+oWdHeBt/y3kntR/ssKNZ2LDSChpN756bHQORz7qD3Mf7rYXM+KcwnXBAWsw8
	v75T36ZZ15l0+793Bo3apYfxTbxHo3D2u1qrko=
X-Received: by 2002:a05:600c:4e92:b0:4bb:6a2d:b440 with SMTP id
 5b1f17b1804b1-4bb7d6d1df0mr29951155e9.2.1794981603926; Tue, 17 Nov 2026
 22:00:03 -0800 (PST)
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Post: <mailto:virtio-comment@lists.linux.dev>
List-Help: <mailto:virtio-comment+help@lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
List-Owner: <mailto:virtio-comment+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <xkzvep5mx77zm57l5im3qef6k3uiqfdnyi3lxuvmsiu7rjkeeu@ey5gquhbb2s4>
 <CAAjaMXbFY8d_H6YJSbb+2ycx-Bh7wBym0UpCy2Z4XsftkhQSzA@mail.gmail.com>
 <fe70886a-b119-4302-b35d-f99dfab4b018@gmail.com> <rltfxbrlfrqixbuevqknfake6hmcs62vjwgpk66tzvyswvfuej@6imyqn2npcby>
 <875wyo3557.fsf@redhat.com> <mkmnrjrkzjg6gdh4u3l6lib7ggovl7oiqwki76pkdboue2szdi@lhpg3ik33w7y>
 <4222d5ec-e44f-46a1-8a14-a2f3fb6d84d1@oss.qualcomm.com> <20261104094014-mutt-send-email-mst@kernel.org>
 <ce7dc70a-13d0-4c8b-9b0c-b46e9a0af54d@oss.qualcomm.com> <CAO9ioeWo8b9CaFHiE7Q7kAeYtkaq_gXZ1+_BGnNFHUF_EfBx7g@mail.gmail.com>
 <20261117192921-mutt-send-email-mst@kernel.org>
In-Reply-To: <20261117192921-mutt-send-email-mst@kernel.org>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Wed, 18 Nov 2026 07:59:37 +0200
X-Gm-Features: Aa3M54pdYZQ5D5hv-OF7IslaLf99yrt2Ii2OemphFmRYEy3HscIeXQjkxh2e4B0
Message-ID: <CAAjaMXa0w1PQAFiT=H6KKnkXWe__jJ-nc_fu60tAbUyTCpnupg@mail.gmail.com>
Subject: Re: [PATCH v2] content: Reserve ID 52 for QPSFI device
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Matti Moell <matti.moell@oss.qualcomm.com>, Peter Hilber <peter.hilber@oss.qualcomm.com>, 
	Cornelia Huck <cohuck@redhat.com>, Demi Marie Obenour <demiobenour@gmail.com>, 
	Parav Pandit <parav@nvidia.com>, 
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>, Jan Kiszka <jan.kiszka@siemens.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>, Trilok Soni <trilok.soni@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 2:30=E2=80=AFAM Michael S. Tsirkin <mst@redhat.com>=
 wrote:
>
> On Tue, Nov 17, 2026 at 11:52:10PM +0100, Dmitry Baryshkov wrote:
> > On Tue, 17 Nov 2026 at 19:30, Matti Moell <matti.moell@oss.qualcomm.com=
> wrote:
> > >
> > >
> > > On 04/11/2026 15:46, Michael S. Tsirkin wrote:
> > > >
> > > > Ugh. Let's keep it simple. Reserve ID 52 as vendor specific, qualco=
m
> > > > can do what qualcom wants with a qualcom subsystem vendor id,
> > > > or just you know, use its own device/vendor ID.
> > > >
> > >
> > > Just for clarification, so you'd be fine with reserving ID 52 as
> > > "Qualcomm Subsystem"?
> >
> > I think the agreement was to define it for vendor-specific devices,
> > further using other means (like UUID) to identify the particular
> > device.
>
> Right, and I'd say let each vendor find their own way to pass that UUID
> around.
>

It seems to me Device ID 0 is sufficient for this usecase. It is
invalid and reserved, so it will not be interpreted by anyone as
virtio and never will.

I think it would be helpful to understand why a non-virtio device such
as this has to look like a virtio device in the first place. Why is it
a necessity that QPSFI fits in a virtio-shaped hole even though it
won't be upstreamed? Our discussion about vendor IDs and UUIDs seem to
take it for granted that this is a logical thing to do. So maybe we
need more elaboration.

> > >
> > >
> > > >>
> > > >> On another note. We are here because there just aren't enough devi=
ce IDs
> > > >> available
> > > >
> > > > Nope, I don't think we want to go too far to accomodate devices wit=
h no
> > > > plans to be part of the virtio spec. That's why we are here,
> > > > the lack of IDs we'll fix.
> > >
> > > Got it.
> > >
> > > Cheers,
> > >
> > >                 Matti
> >
> >
> >
> > --
> > With best wishes
> > Dmitry
>

--=20
Manos Pitsidianakis
Emulation and Virtualization Engineer at Linaro Ltd
