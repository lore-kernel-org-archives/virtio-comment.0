Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792733904;
	b=q6Hp9jLBahdEJZHVqlUXEXoIbJgfnrhP/XgU4FTZ8ICPBWDGflF65vCWS3vV7Il6BNtf
	 SmLtrViLXLRKbHh0elVuyfIDtb10Cq4AijOLBHkDppUwmoD1tUeNfvUZp3ZQKMMxOfcfk
	 lkL3pUqdUq05fe1jWUHyN/Hq66b4vOB4cHaVImjSpiQ3zkhGaF6mdFNRs5uMt5FU6qOMe
	 m7tA5UXrtSfMFlsZBvz4mRQJ3MLzasDo94xHluxuf7Mz0h9Tm/Zhl1x8VelbbHcQNzrb1
	 YLX/i+Nkff5E/Pnw6vtSduZph1NhSNTA91piPIFuxnjhetcq69c4p+WuFAbHwpMkxIw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792733904;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=9IYuk8JOv/sFqxYOGX9IrczsFmUlGH0joNwe6/n/pqw=;
	b=kMCHyaEgdP+RNmv5d35GlSf/aoBkO7Oo11Ko2scaX5cIraeKytv4O+eVLyIk6BwT4ZIX
	 RShq7iz4V7AQLiNnRFT5L5vQ2NNROQBG8RvlDILLqDd7om/ccDv/kHC4QYZc6HrBSFnHd
	 PHRNzuShqN0F5cOXYoMpc9Pamvu/4kVL6Kazbr/+H7cGREglHupvxO8ykGw8JW9LFruYL
	 EcvyMLVpc9nfYBKlD01k+n0ny1mZd4EXspUDffTJjEQWQy1cVRwD7zY+ojS7UQDJfLGi0
	 H66c7FmmdGEintERPoubF7MxHeUMSePGe0H+ysu5Y1VxqbHHWLxemR2uzVhNKBGK14g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ElFAG8K4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2512D606A319
	for <virtio-comment@lists.linux.dev>; Fri, 23 Oct 2026 05:38:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2512D606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ElFAG8K4
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a1df146015so3129245e9.0
        for <virtio-comment@lists.linux.dev>; Thu, 22 Oct 2026 22:38:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792733902; cv=none;
        d=google.com; s=arc-20260327;
        b=KJJcdjdCNK2ehfASdxCujiphmU96itSESRaBTCykui/+m3m0n0X2YhFA/XJbPZK3+K
         kfWliSdWMJCDRTPfcPTOJ0yj/elam2P+g0v5yPeOBrxDtTr12uNmUbiYqL7iimede2cK
         Fi6qz3sV/xoWX5s4dISh04l+iMnkCUuKj1t+iGU8PSnkOkmKvkksOLxdipsf2bSDeIMz
         PJ7ed4we3LDILSVWwatZMm+1CwWZ+XcBfYkZs28JoBuON+rIjmiCnEDQtySXPJWkzzXm
         iNRcu4w7yVL8u3TcvMUcfUoNjsb+6pIKhfZE55ygh8hO1ET1hziha/26F2E60iCHO4DQ
         oZFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9IYuk8JOv/sFqxYOGX9IrczsFmUlGH0joNwe6/n/pqw=;
        fh=WTh+e+mS8rjTJ2tzm4rpx4Y21xRPkMgscOomaF7laKA=;
        b=ZkrSN9yY7k+RHEuhUpehOMinWJdfwMxt7eoOzlxd4Ho/5+hFytdeWZCm1D0qapTzes
         0D1o1d3SOdeX0nYzxs9TU0mzbp+gIECz14qZByypnRHJFAybzBjk4WVlqDNYr7Uenf6O
         oHwqX3+0ptdt2mgfbpaBpgla7pQAg6ZItVSPse6Ym0Y2X0S+Ygn3SP8ndnPeP7zS/uw4
         ohJNLLgWTWmesbYuwEcqhhQiTiNuwtcYauD1TDH7wFZQveGinem8e60EOmP8ftBsZICI
         2C/A/YypdOj3CnQmS+lEMIqKo42pHSMbvsHGFcpfbJrtKl6S9/qr9JFhFAgx7+wJ2qU2
         MjXw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792733902; x=1793338702; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9IYuk8JOv/sFqxYOGX9IrczsFmUlGH0joNwe6/n/pqw=;
        b=ElFAG8K42wEjb1oC37Pr058Ois0el9pzC8IMdTrtMSs8KHzyH8+JHmI64NykzB729C
         9L7UIVENq7wFOM+ZY9sJHdvdCnJ6AhoCGXFV1iipT+NQ0knxE/XUmTVRhNkgnYH4CKld
         wwSsIh4ApdT4uUbbG9mAcCqY+2ApAqDPo8dcIcFMIlp/2wfiTKqbsYd8hFXAKHxEaX8Q
         ap4WA7JEln204YZ5WHOKiPZmceKJK8lkxRqgDPvZ5WAd7XfwKW+CKhqRem3TdP4Gbra4
         1DbZ0MCqzTOb9pvF9ySXGehHbiLjaF6dsiZqDfvDmBPSB6dy7lD3USFNlmD5JUQJRSLv
         8nOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792733902; x=1793338702;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9IYuk8JOv/sFqxYOGX9IrczsFmUlGH0joNwe6/n/pqw=;
        b=tV8btFx/BvjtOxB5Hz1iUm/w3JTectOS9CXhb3bhbEg390wxBGJeBkIgoCUtqOyL7q
         B3OWTX4xOvnfX0a0lPVkFBhg3McKQdVqYpZQlgXRtYDZUo2SclnsrMwiJ6MeWzMfdN3i
         5lF8KwpjS4x2RyZJG5kS+/dwMC1zB3XInoL9uZGvYPMbKkoGihLayeK22+3uMo06bois
         kl4GoQqEHu7ZlB5dqgJF9IMqFQrFsfIEYVaT47e+jHWo4NSiEFRXCnmat+dUQ0Wg0jTV
         M8Y9vxeq4BEsOb8LvotgAS3mZsuZ1LcrxNiPIr+b0Ff1gcKtscsJrBSaO1EW84gIcWIs
         gX1A==
X-Forwarded-Encrypted: i=1; AKwUvBxcrEg7ZM00uGgSB7UG1QvAFoIJmTs4G5wEAl0Yxu+LrlDCgKJUms2y4P6jxg8tiQMUWpcJlyyc0S7fI+xu4w==@lists.linux.dev
X-Gm-Message-State: AFq9FYJvnLwXPH+dS7aBOyX1KC7eop5jx+IUFSu+knEQnO8hZYMZypub
	Yw0BkUK2dSeha80DDKicHTzo7mH0aCQ9iflHmNLO7zzyTs19d9g3xgy/zgaJ2uJD2gPYkD6ZBFb
	3ThoB/GCoSocXDRWlQVh+tqNzd4f2MAELr3fInvx7dA==
X-Gm-Gg: AYBFou0t6tTdlZp7ovRowJVF52RRLoAY8x4E+MKCdOAsj1uuCCi7Y01cBgUkM6fOlS5
	nlmQU4DzzPFN5zOCmaFwHPLFARSXyE+KUTr9xJ+Dy7uAZjrmzzzpbcWSfK4vzurW+zNrgm3edpm
	NkcPX2jyzP+J/8gVOLxOh9KHPqK0Kqu1Cg2jPtVreBGPVPBuqyQqpwGzeVktE8Kb78vWH8WU/mv
	Z8MKFBBYilLKcbFUrLx1N8Mq0N5vaGDAmj8US0cvb3Pekeo9oWILSeRaq6cDOyoAl7rj8qQsPu9
	cYhoLVxhwLdkjHJ1Aprk+Cq4lPXbZtOCTYOucJUWYF8stnT1cLttWfVVA/86ecjppacHouS/kvb
	KqTNeFBS7RD/k1saI6vFNc85omhKEGyPGnLUFAk9JNvpPlqPpGrGKS/1+FrAbA084LSSMs7ezrq
	hUNqdocSDnF7ZVZC+Y7KJbgpA6ECjEaHr8hxXZZlFkT2hV5ThdSggKXipVeuysBc+shgtknq1cE
	4frXz2LVKeXaDyi6U8yC/d+5VU6wss69Hxte1na
X-Received: by 2002:a05:600c:46c3:b0:4a1:fb01:13 with SMTP id
 5b1f17b1804b1-4a211ca6258mr17818065e9.18.1792733902410; Thu, 22 Oct 2026
 22:38:22 -0700 (PDT)
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Post: <mailto:virtio-comment@lists.linux.dev>
List-Help: <mailto:virtio-comment+help@lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
List-Owner: <mailto:virtio-comment+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <CAAjaMXZgKGWL0dJJSh74Pf20EezY8zPOsSg1aNkp_ssvXuP7BQ@mail.gmail.com>
 <20261022091645-mutt-send-email-mst@kernel.org> <oinsf3ecwsrgxuff2m4q3qsjzfg3quldsqv3wjnlzxqbiyzhrz@m4s7bjwc2fsf>
 <87h5id3he3.fsf@redhat.com> <SJ0PR12MB6806C8FCEDA2E3D40CA82EB6DC652@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20261022114028-mutt-send-email-mst@kernel.org> <SJ0PR12MB6806C7432951E2DB6CB3C945DC652@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20261022115837-mutt-send-email-mst@kernel.org> <SJ0PR12MB68066B4C6D821EF792DAA220DC652@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20261022122727-mutt-send-email-mst@kernel.org> <xkzvep5mx77zm57l5im3qef6k3uiqfdnyi3lxuvmsiu7rjkeeu@ey5gquhbb2s4>
In-Reply-To: <xkzvep5mx77zm57l5im3qef6k3uiqfdnyi3lxuvmsiu7rjkeeu@ey5gquhbb2s4>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Fri, 23 Oct 2026 08:37:56 +0300
X-Gm-Features: AclHuK-rubTEzgzeAbUIxgmdeXgbWrYnYjJTQ2uBHNielQdamKpMroKDAfg6Dms
Message-ID: <CAAjaMXbFY8d_H6YJSbb+2ycx-Bh7wBym0UpCy2Z4XsftkhQSzA@mail.gmail.com>
Subject: Re: [PATCH v2] content: Reserve ID 52 for QPSFI device
To: Peter Hilber <peter.hilber@oss.qualcomm.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Parav Pandit <parav@nvidia.com>, Cornelia Huck <cohuck@redhat.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Demi Marie Obenour <demiobenour@gmail.com>, 
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>, Jan Kiszka <jan.kiszka@siemens.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>, Trilok Soni <trilok.soni@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2026 at 1:39=E2=80=AFAM Peter Hilber
<peter.hilber@oss.qualcomm.com> wrote:
>
> On Thu, Oct 22, 2026 at 12:29:31PM -0400, Michael S. Tsirkin wrote:
> > On Thu, Oct 22, 2026 at 04:20:51PM +0000, Parav Pandit wrote:
> > >
> > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > Sent: 22 October 2026 09:32 PM
> > > >
> > > > On Thu, Oct 22, 2026 at 03:49:51PM +0000, Parav Pandit wrote:
> > > > >
> > > > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > > > Sent: 22 October 2026 09:12 PM
> > > > > >
> > > > > > On Thu, Oct 22, 2026 at 03:35:51PM +0000, Parav Pandit wrote:
> > > > > > >
> > > > > > > > From: Cornelia Huck <cohuck@redhat.com>
> > > > > > > > Sent: 22 October 2026 08:35 PM
> > > > > > > >
> > > > > > > > On Thu, Oct 22 2026, Dmitry Baryshkov <dmitry.baryshkov@oss=
.qualcomm.com> wrote:
> > > > > > > >
> > > > > > > > > Let's define some standard way for the vendors to declare=
 that this
> > > > > > > > > device is "Qualcomm", "NXP" or "hobbyist which doesn't ow=
n PCI or USB id
> > > > > > > > > block".
> > > > > > > >
> > > > > > > > Are we able to use the first <n> bytes of config space for =
that? I guess
> > > > > > > > that is the only way that can possibly work for any transpo=
rt.
> > > > > > > >
> > > > > > > > Then, maybe something like one or two bytes for a vendor id=
 (including
> > > > > > > > one for "testing purposes" or so), and the rest to be used =
in a
> > > > > > > > vendor-specific way.
> > > > > > > >
> > > > > > > device ids are independent of the transport.
> > > > > > >
> > > > > > > but Peter already announced that:
> > > > > > > " Reserve a device ID for QPSFI devices (Qualcomm Platform Su=
bsystem
> > > > > > > Firmware Interface). QPSFI devices expose functionality acros=
s SoC
> > > > > > > subsystems through a common Virtio-based protocol. There are =
no plans to
> > > > > > > standardize the devices."
> > > > > > >
> > > > > > > So, I am unable to understand why should it be part of vendor=
 agnostic virtio spec?
> > > > > > > Why a vendor specific implementation of device and driver is =
not sufficient?
> > > > > >
> > > > > > I don't really think we should vendors burn up device IDs every
> > > > > > times they want something non standard. Reserving ID 52 as
> > > > > > "vendor specific" so vendors can go wild sounds good,
> > > > > > but a bit more needs to be done than just reserving:
> > > > > > document what is expected, e.g. no auto load based on ID
> > > > > > alone.
> > > > >
> > > > > First, you indicate to open virtio to vendor specific extension. =
This is huge in itself.
> > > >
> > > > Not as such.  It's just reserving an id. People always do things li=
ke
> > > > implement some crazy spec saying "we will upstream later" and later=
 they
> > > > do not.
> > > > And then the ID conflicts with a standard one. Suboptimal.
> > > >
> > > > So if we can tell everyone "always use this ID, and use platform
> > > > specific tool dor discovery, until your device is in the spec"
> > > > then that's not too bad.
> > > >
> > > >
> > > >
> > > > > that should be first discussed.
> > > > > If you suggest this, may be every device type should be able to e=
xtend, and not just demux at device id level.
> > > > >
> > > > > Second, one reserved id is not enough, because a given system may=
 have multiple such different vendors devices installed.
> > > >
> > > > I don't think we should care.
> > > >
> > > than all 0xffff as one experimental id once for all is good enough.
> > > than vendor FOO, BAR, differentiation is not needed.
> >
> > I don't think we want 0xffff, a lot of systems treat that value as
> > special, pci comes to mind.
> >
> > > And if it is not for experimental purpose, not sure why would vendor =
stop at only one device.
> >
> > They can reuse that id as many times as they want and differentiate
> > with a device specific or out of band methods.
> > First X bytes of config space was mentioned. or whatever.
> >
> > We can add a recommentation maybe if vendors desire that.
> >


Hello Peter,

> Thank you to everybody contributing to the discussion and to the concept
> of a vendor-specific device.

I'd like to echo the sentiment that it unfortunately doesn't seem
necessary to call vendor devices virtio at all.

 > Just for clarity, Qualcomm intends to
> upstream Linux kernel drivers for this new device type, so would
> definitely want to use a registered device ID.

But no upstream specification, correct? There's no point without an
open device specification to being included in a specification. People
can only implement frontend drivers for this vendor device, and only
by reading the upstream code - no spec to follow. Similar to a vendor
SoC in concept.

>
> In case of an in-band approach, I suppose we would then have an explicit
> vendor list in the spec where vendors have to register?
>
> Best regards,
>
> Peter
>
>
> > > > > So why to bend things so much and re-invent the wheel?
> > > > > Why for say PCI transport's any vendor and device id are not suff=
icient to indicate a vendor and device?
> > > > >
> > > > > and if so, why to even document it in the virtio spec?
> > > > >
> > > > > I guess, I am missing the basic motivation part.
> > > >
> > > > For the virtio spec? Above. For Qualcomm since they decided never t=
o
> > > > upstream - donnu. Don't care much, either...
> > >
> > > ok. so yeah, let vendor's platform device be in the vendor's OSS zone=
.
> >
