Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792658506;
	b=cUgdkeB76ZHBvqNEIUOOqQ8ot1mLe3bIVcLdM2Goj8Es67j3waVzoaSCWlIJhHUMyG/o
	 +bM3BpjQQ5fZRPCB8QtSaVZoXy7vqDDRwP6IzUq15EPpU6WMPwxokUFAr30IW4ZE61X7t
	 rV2Dj9JtQdiICGB0crmAWcU6eiRl9US8N/R0XiwsZvymzkvCl7k5VCsjAmyFNy0t1YjI5
	 7QvYYCMWhczo4S3UCrinqktESAvaYixOj9PqC/C/Z9l49MH4vd+UFNrWJez+3iiKuqae8
	 0Yo8YPU5OJfHkMaEJFDX6JUIOGc3ogvC8Yjdl2sRUQc5BfD7bV4tedXhDyXrSU0nOWw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792658506;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Ee5x7ePzxpKhx1NvEN7MyEZlE2vCthZ8xAlG0Xoniu4=;
	b=NPT+E2h8iNuQ5Pp1Q7EgCw68vNqlU2yy4oi1WKor2P/K+NoFZ8ZUezbngrlvC1hriDeY
	 aNDsGat9t7uzqYO6XfLhefYIDBXp4T+eTa5U/ZMoklwt+AwhpqP76e/xETx17wKIGRHwH
	 YlGLNLd3WN3xL2phGH+Wq1n0yJlhD7d9oC7OPcPMhMPutnamxC429X6JNpw0WglI/AMYi
	 2rCe9nt7l/a/sMugsCMhAxoGBQiHMzYbRqeqYN767hZIeImAhulyOTxUUwyQFu2eW/RST
	 gXWMQpObluYvSEjCWnWf2RmnKqs/rzwyEyBUGmECX++VpZGHsrIqUmfhdICLy41+pIQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=rZwlb0wz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C86606A319
	for <virtio-comment@lists.linux.dev>; Thu, 22 Oct 2026 08:41:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17C86606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=rZwlb0wz
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48c5358fc28so1330772f8f.0
        for <virtio-comment@lists.linux.dev>; Thu, 22 Oct 2026 01:41:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792658504; cv=none;
        d=google.com; s=arc-20260327;
        b=GrEMnV4+spE8Q9Gd8keva+c8J9IDnfrjxFIUQmEVCzEAkEiamOBPOf4XrvfTgl3Ye1
         CInn12VuuqTRDfjVPBDE1sPD7OTYVeZelmElekowemEfwMgDlm2V24JJFbyI0TFGPGpS
         xnKWchyIe0O3IUKPA73sPAQSNWgkmpBqMZUwIf8R3atD6dX8OihhUv35x6P6UYwmzEaw
         gmspQgxO2E/5UJh4oEShkGoXJ553Eq0lRr0LAKJSgaGRfkrkTeqC7Rs+yNK839vMIoGq
         wl57O+N6zjA47PbkC4YVEFP1grnylk0U71gqNhyekr6BNnB8OIiyVtqP+8MXGqZZdNzH
         tZrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ee5x7ePzxpKhx1NvEN7MyEZlE2vCthZ8xAlG0Xoniu4=;
        fh=KDk0GCmx5jltcR+BrL/cc5KIfJGF2Lu8KovYPPM4IgA=;
        b=Uabc/TFtjbtjPGjOqEaiI70xfENmhHEl4ZSrMk5C7bbZmxbrhhYJqrGveSvYUuf+pD
         0rC2Pj1AdhdU7iUrneqwQqswfVQmdHS3ZXPVvBrOqtbKMzk9sHGYBYkLY1HtyClhUXQx
         +sB8p13THAba+lL+4VKTAZy3cZ+YODNai0YiXnGapRlh7sa5zrnKkAQMzpiPy2h4gge6
         WIiQy7viktieFRUJiyGlSWKmbpAqLMJwAqRuaq2aSw38apzYj7Ua4SfRJsHY5RrDuDGW
         WW5bUG2vFwuHlI1cO17dbFTVaqM8QaZbh4LzeYDFP8AZHl2UfpBPTZyol+LycFu5rdtc
         TVqw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792658504; x=1793263304; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ee5x7ePzxpKhx1NvEN7MyEZlE2vCthZ8xAlG0Xoniu4=;
        b=rZwlb0wzFqmUyVER/tVi1oXEhXPThb2YUYXq5snwpx3fRYAqYFXyVm1yxMkFX8xYYW
         RqEbAyqFdOGkFieU/J1+ER20T4afjQGcGC+Ompu2fawJf0Qm/ya4kYag1f1obRR2ODdA
         GDW1gX71CSv5NcfTv8UG6eLZeErJx1aWWyTeasDgtAjuuKomJCmTUpRz4x/c5bTAMAgo
         ZHehaMIOv2slBYJpKHWmyqF/BHPwj0F8AuPk85v4kk3Vuo4dhEv4hnBH5GjUYs7wYRjR
         W6BMYP7QYtC4RkadoN4DSOT5lqhPuChQEt2eodDOQLokpeyDBpGI7y4Z+XVRJWoMLgxU
         Q1Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792658504; x=1793263304;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ee5x7ePzxpKhx1NvEN7MyEZlE2vCthZ8xAlG0Xoniu4=;
        b=M4XQJbZHc18Mrhxbm5ANkG8ApvL8jxskYrot6mr2PRFAoTOqoHlMkGIQdRKnCFAXG7
         G+/C7haEE/eJHBW5+Y1LhrP+eNbaEF212v2PgUefbJRAdZ9au81Y+iXJffX4jfSD0Bb/
         R+oyFxsKAoL1ufTkw3axSGo/NK6Lzwhvi8qzLEfQ3lox34ZiaezlMVbNvDhnr9rq28wb
         Tsn7lLQY+7ZM52xYRLjjEXv7ZXhG8oy6lgAsHhHlGw6/8zy2FoPJ9cdTwwxSJQfp3537
         Q6R9AM4IFMvNUGyDq1LCFh88P+a72iG6H6F9iZaudJyY8QOPhM0la+vC66ksPKOZsG8D
         haeQ==
X-Forwarded-Encrypted: i=1; AKwUvBxjzFDz0K9FlrTcSlSOz3dPRtpq72Ug0okcPpLpfh6PwuV5nT94fV7uWuwfN2diMiDlH10NEaQ/9QvcMb2SHQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYLB3rujLUndrvTdiLqi+vAtu2URYUA8N1FQEG3qVw1L1mkkwRqo
	5ia+9ZyWUjH61TWW45n4nqxfwKQhxcnGfp6b0X+vjzb6+FhE74Q1JB4Jh0bDsYXvJ4gb8zXanAX
	TmZugo8LE3CQtWAbo77Jpoe3Ky8Hszu9k3XZUAIdfag==
X-Gm-Gg: AYBFou3ZTtdP81nmBII7ZJuxcLFi94veJQu7deh08QGMEl02vyLoFNwMWudzqZlTW0/
	kj3Z+wgQ88AQQV6pD+2hPrzRQxE2f/hw+vprBHXbSIvtMYQTA5BJcX/QwVB9hRsPxCHtd8bOjqS
	2DE4wwhzwexD1tP5NQEB/5+0UhxHEvDZ6Or/jDYqJVZ2VTT7KyalFWELivkNzhzuF6BZYhiWyfm
	NiJPtDpzeKtQ7d1TEdiVwABBLLzrm9OhXsh0k9/IuIETSHGKrAqAEmB9x8y/LaIP3ZXTKKFZB35
	9T3wtfyX0dQCwVnNp0O4vyF8lLoSnaPPQESm70U9jyZg/BiFryWTYBoO9f3GXNF72db9vAZw40i
	SX+22Y51cZOlY+0D9VKR7Y8nUdDtisQIt0p+Ewd/SZjbc76P1OGNAKpHULNzNnQNUgjM74S/CSk
	Yj5CQJLecatqxEcPKZocXAM/uBUGmDMwAb7pNcuB0J/mxi0/UKik+Yhb0MpCplpJyVtJLfKOZ8J
	ieQen8BWhSC6lHz3LHb+P0RhEN2F529mp361P+1
X-Received: by 2002:a05:6000:41d2:b0:48b:4c8:7b07 with SMTP id
 ffacd0b85a97d-48e264e28b3mr9537904f8f.52.1792658504281; Thu, 22 Oct 2026
 01:41:44 -0700 (PDT)
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Post: <mailto:virtio-comment@lists.linux.dev>
List-Help: <mailto:virtio-comment+help@lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
List-Owner: <mailto:virtio-comment+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261021180031.7175-1-peter.hilber@oss.qualcomm.com>
 <d4a11a65-ebed-41c9-8482-cf0ec94dce79@gmail.com> <20261021154801-mutt-send-email-mst@kernel.org>
 <87mrs62vzj.fsf@redhat.com> <26e6efbe-abc0-452d-a682-611cf91e41b8@gmail.com> <20261022032118-mutt-send-email-mst@kernel.org>
In-Reply-To: <20261022032118-mutt-send-email-mst@kernel.org>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Thu, 22 Oct 2026 11:41:17 +0300
X-Gm-Features: AclHuK8fCMOcdgzPJZ1f03_ZSfVav4aS10_ugPymgocvqfcK2ay-Ws-xeg22o_U
Message-ID: <CAAjaMXZgKGWL0dJJSh74Pf20EezY8zPOsSg1aNkp_ssvXuP7BQ@mail.gmail.com>
Subject: Re: [PATCH v2] content: Reserve ID 52 for QPSFI device
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Demi Marie Obenour <demiobenour@gmail.com>, Cornelia Huck <cohuck@redhat.com>, 
	Peter Hilber <peter.hilber@oss.qualcomm.com>, virtio-comment@lists.linux.dev, 
	Jan Kiszka <jan.kiszka@siemens.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
	Trilok Soni <trilok.soni@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2026 at 10:24=E2=80=AFAM Michael S. Tsirkin <mst@redhat.com=
> wrote:
>
> On Thu, Oct 22, 2026 at 03:07:41AM -0400, Demi Marie Obenour wrote:
> > On 10/22/26 00:35, Cornelia Huck wrote:
> > > On Wed, Oct 21 2026, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> > >
> > >> On Wed, Oct 21, 2026 at 03:25:31PM -0400, Demi Marie Obenour wrote:
> > >>> On 10/21/26 14:00, Peter Hilber wrote:
> > >>>> Reserve a device ID for QPSFI devices (Qualcomm Platform Subsystem
> > >>>> Firmware Interface). QPSFI devices expose functionality across SoC
> > >>>> subsystems through a common Virtio-based protocol. There are no pl=
ans to
> > >>>> standardize the devices.
> > >>>>
> > >>>> The Linux DCP display driver series is planned as the first user o=
f this
> > >>>> device ID:
> > >>>>
> > >>>> https://lore.kernel.org/all/20261015-jshekhar-drm-msm-dcp-v1-v1-10=
-48aad0fe4f72@oss.qualcomm.com/
> > >>>>
> > >>>> Device ID 51 is already reserved for the Virtio HAB device:
> > >>>>
> > >>>> https://lore.kernel.org/virtio-comment/20260702140939.3535968-1-ze=
loren@qti.qualcomm.com/
> > >>>>
> > >>>> Signed-off-by: Peter Hilber <peter.hilber@oss.qualcomm.com>
> > >>>> ---
> > >>>>
> > >>>>     v2:
> > >>>>
> > >>>>     - Rename the device from "Snapdragon device" to "QPSFI device"=
.
> > >>>>
> > >>>>     - Refer to DCP Linux driver patch as planned first QPSFI user.
> > >>>>
> > >>>>     v1:
> > >>>>
> > >>>>     - Was posted as "content: Reserve ID 52 for Snapdragon device"=
:
> > >>>>
> > >>>>       https://lore.kernel.org/virtio-comment/20260826115504.1955-1=
-peter.hilber@oss.qualcomm.com/
> > >>>>
> > >>>>  content.tex | 2 ++
> > >>>>  1 file changed, 2 insertions(+)
> > >>>>
> > >>>> diff --git a/content.tex b/content.tex
> > >>>> index 243ce2dde36b..7416939e67d3 100644
> > >>>> --- a/content.tex
> > >>>> +++ b/content.tex
> > >>>> @@ -805,6 +805,8 @@ \chapter{Device Types}\label{sec:Device Types}
> > >>>>  \hline
> > >>>>  50         &   Video encoder/decoder device \\
> > >>>>  \hline
> > >>>> +52         &   QPSFI device \\
> > >>>> +\hline
> > >>>>  \end{longtable}
> > >>>>
> > >>>>  Some of the devices above are unspecified by this document,
> > >>>
> > >>> I think it would be best to have a single ID for vendor-specific de=
vices.
> > >>> I believe most of the ID space has already been used, at least for =
virtio-PCI.
> > >>> --
> > >>> Sincerely,
> > >>> Demi Marie Obenour (she/her/hers)
> > >>
> > >> Sounds like a good idea to me. And then qualcomm can do what they
> > >> want, like check subsystem id for pci or whatever?
> > >> Only issue is there is no way to distinguish for mmio/ccw.
> > >> Maybe, add vendor specific id as first e.g. 8 bytes ro in the config=
 space?
> > >> Peter?
> > >
> > > Using some information in the config space looks like the most flexib=
le
> > > way to me. Are we still happy with how the device ids are organized i=
n
> > > general (i.e. when do we want a new one, and when do we want to exten=
d
> > > an existing device?)
> >
> > For a platform device like this, I'd prefer to pass the information out
> > of band.  After all, this device will only ever be found on Qualcomm
> > SoCs, and presumably the kernel knows exactly which PCI device is
> > supposed to be the QPSFI device.  This means that the kernel can just
> > special-case it.
>
> Yes but we are discussing making this id a general "vendor specific
> device", as opposed to a "qualcomm device".

Is there a reason why a generic VIRTIO_ID_VENDOR wouldn't work?

Instead of adding more and more IDs for different devices that will
never been upstreamed.

Then, a kernel can discover all vendor devices when enumerating the
transport, ignore them unless it knows specifically about them through
ACPI or device tree.

It doesn't make sense to me that HAB/QPSFI need an ID when they are
unusable to anyone except for qualcomm kernel drivers so maybe we
should require that an ID allocation always needs an explicit
justification (i.e. "the spec will be upstreamed", or "we cannot use
VIRTIO_ID_VENDOR because X/Y/Z").



--=20
Manos Pitsidianakis
Emulation and Virtualization Engineer at Linaro Ltd
