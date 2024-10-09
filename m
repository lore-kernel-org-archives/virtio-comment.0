Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2437416D9DF
	for <virtio-comment@lists.linux.dev>; Wed,  9 Oct 2024 07:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728460033; cv=none; b=G8NcyJujvvUozKzsk+wlr6+XxF8M/tyS8kWUrrn8Nqsnp9yu0dZwBCuaCiirOooxPCU2hhdYoIYOwsOe1Ol++jM7Ul7Xtr9tlU9gThKoX9Mlhi7nuDs/hPjJyW70aBwaAVdlX4iEa0JUZno1moMaXntpGvH6r4dyIh737KeFSWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728460033; c=relaxed/simple;
	bh=2v/yxzB8XI383TjDy3w2LuJF2IFfPqAZ6wZMvGhw+2s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qavJnuizjNIRnDc1Fnpux0Smc4B5w6csZi5dsOkaG07Ahlvz48d3PsaF6ForfnMzOTyOQ0xZFS7O9jr6BfeUhDBgReA86BiHzV6Jz1uvVz49BPSDiZYG7TOH/clJoM0PlwyOMRgA5j3h21BVwzxcHFxGQRWAHyS5LcPZvxweuvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GyUtkUU1; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GyUtkUU1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728460029;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DI91+mWKEupTTHkPrEC3IxYAaOxU5dVUFCKUenvqF6c=;
	b=GyUtkUU1AQG8stFbWhSE1kpu/Kf4H9yv/hiHiQXylVnQWUNcYLpfnlywqZ4VQxArv96I3l
	qiZdft9Gq8orDfdEqzSIMsBYuJB4iacrJNwei+xj6ETYF2v2Rc75Dob64HGMeOxMcb1jDk
	JrUBV/IwOGH+Qy/jYUwLOJVSo/OeteY=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-443-lyiC0frROJCDa1lYe6_hcw-1; Wed, 09 Oct 2024 03:46:05 -0400
X-MC-Unique: lyiC0frROJCDa1lYe6_hcw-1
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4581e5e3e48so143038451cf.2
        for <virtio-comment@lists.linux.dev>; Wed, 09 Oct 2024 00:46:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728459960; x=1729064760;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DI91+mWKEupTTHkPrEC3IxYAaOxU5dVUFCKUenvqF6c=;
        b=KFmmm44U3T2YBUxGlOGwH6b/0sW6RGaZLctuqYgblZ3+rSZbuMyo19Rj6F+k1Epdqu
         GCDc4HNcH2fVoHR85gzl99/cIXulMtexM9kB2b8dlHa7d4KNpKKDC0V0n3S+1wazRb7H
         HCthJO4kNCNz1Cobnlyz6B7ZUjc4cspfq8Ccu1PwjF+urkKi2Oatvx0lGuVaw8AkXW1w
         hprQFRuGQLcLxjhmjWTb9WmaSdeHr//mVXlV03P6yg16LOgNpqYYERMsz+BK6YAWCp0h
         AqzOBJLQBbIB2293DZXIM9RLV9H1yN8W8KnbMzWgG8U0dRU37HHHyB/qyVK8sc+Sgljx
         xm2w==
X-Forwarded-Encrypted: i=1; AJvYcCWncdMflSQjeXkVxpMOglSmgDRdorhFy5Q0Tw8+g8G4oR4XNCYUa2jrDCBRhiSi/btRPu/Lahv+QMG7Q8jpaA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxufeDP1XhOSymdb8o2NNHqmllpBZSbiuqbtaG6da7vzVpkitkZ
	0SKzZh9erfH4K+5CqFlxvYPR+0WKknal7KwYBGV1zmWOMxPqf7QhDAj06aUxuuAo6O/FvxKwRiZ
	0mboFNLVrIb81jsQqPdWH/lhsl/J2vAjSj7i8TrPdDSfot+UB2GVoVeUzOEGap2I5flArsTLj/q
	ZXr9FA+z8HFxnfdMLzuNuVqfGXG7e5tAK2FiCQ49k=
X-Received: by 2002:a05:622a:1f10:b0:458:1de8:4e46 with SMTP id d75a77b69052e-45fa5eca39fmr27299401cf.6.1728459959983;
        Wed, 09 Oct 2024 00:45:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH0B8vQ321YDaPe5PfifAzOzyvkgZTNvxFKK6Pzoso82GUVbZ/eBtGsh6PNpfN2kVsO/YQbBYHLh1wM3Me8M54=
X-Received: by 2002:a05:622a:1f10:b0:458:1de8:4e46 with SMTP id
 d75a77b69052e-45fa5eca39fmr27299241cf.6.1728459959684; Wed, 09 Oct 2024
 00:45:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240809140403.484556-1-jmarcin@redhat.com> <11d91474-5b53-49f8-9301-a2db885948a0@redhat.com>
 <ZwPutFATuftmzHK6@fedora> <12281338-d1e7-4b4e-91f4-571059e1410b@redhat.com>
In-Reply-To: <12281338-d1e7-4b4e-91f4-571059e1410b@redhat.com>
From: Juraj Marcin <jmarcin@redhat.com>
Date: Wed, 9 Oct 2024 09:45:48 +0200
Message-ID: <CAC2qdxDh=xX1D6s29sYVVGFfGQxr5E2-btZtpQ6u4=0GHQ_ULA@mail.gmail.com>
Subject: Re: [PATCH] virtio-mem: introduce VIRTIO_MEM_F_PERSISTENT_SUSPEND
To: David Hildenbrand <david@redhat.com>
Cc: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>, virtio-comment@lists.linux.dev, 
	Cornelia Huck <cohuck@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000e7e40a0624067186"

--000000000000e7e40a0624067186
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 8, 2024, 15:14 David Hildenbrand <david@redhat.com> wrote:

> On 07.10.24 16:22, Matias Ezequiel Vara Larsen wrote:
> > On Mon, Oct 07, 2024 at 10:17:23AM +0200, David Hildenbrand wrote:
> >> On 09.08.24 16:03, Juraj Marcin wrote:
> >>> Before, the behavior while suspending to a deep sleep state and waking
> >>> up was not specified. For example, in x86 QEMU VM all devices receive a
> >>> reset request during wake-up. This would lead to unplugging of all the
> >>> plugged memory blocks. Due to this, suspending is disallowed in the
> >>> Linux Kernel, when plugged memory is present and
> >>> VIRTIO_MEM_F_PERSISTENT_SUSPEND feature flag is not advertised by the
> >>> virtio-mem device.
> >>>
> >>> This new flag should signal to the guest driver, that the device can
> >>> correctly suspend to a deep sleep state and then wake up without
> >>> disrupting the plugged memory blocks. This feature flag is already
> >>> supported in the Linux Kernel [1] and should be soon also supported in
> >>> QEMU [2].
> >>>
> >>> [1]:
> https://lore.kernel.org/all/20240318120645.105664-1-david@redhat.com/
> >>> [2]:
> https://lore.kernel.org/all/20240806160756.182524-1-jmarcin@redhat.com/
> >>>
> >>> Signed-off-by: Juraj Marcin <jmarcin@redhat.com>
> >>> ---
> >>>    device-types/mem/description.tex | 12 ++++++++++++
> >>>    1 file changed, 12 insertions(+)
> >>>
> >>> diff --git a/device-types/mem/description.tex
> b/device-types/mem/description.tex
> >>> index 0a6d558..5bff24c 100644
> >>> --- a/device-types/mem/description.tex
> >>> +++ b/device-types/mem/description.tex
> >>> @@ -60,6 +60,8 @@ \subsection{Feature bits}\label{sec:Device Types /
> Memory Device / Feature bits}
> >>>    access unplugged memory. \footnote{On platforms with memory
> properties that
> >>>    might get modified implicitly on memory access, this feature is
> expected to
> >>>    be offered by the device.}
> >>> +\item[VIRTIO_MEM_F_PERSISTENT_SUSPEND (2)] The driver can allow the
> guest
> >>> +system to enter suspended state (deep sleep, suspend-to-RAM).
> >>>    \end{description}
> >>>    \subsection{Device configuration layout}\label{sec:Device Types /
> Memory Device / Device configuration layout}
> >>> @@ -174,6 +176,9 @@ \subsection{Device Initialization}\label{Device
> Types / Memory Device / Device I
> >>>    The device MUST NOT modify memory or memory properties of plugged
> memory
> >>>    blocks during device reset.
> >>> +The device SHOULD offer VIRTIO_MEM_F_PERSISTENT_SUSPEND if the
> platform
> >>> +supports suspending (deep sleep, suspend-to-RAM) with plugged memory
> blocks.
> >>> +
> >>>    \subsection{Device Operation}\label{sec:Device Types / Memory
> Device / Device Operation}
> >>>    The device notifies the driver about the amount of memory the
> device wants
> >>> @@ -268,6 +273,9 @@ \subsection{Device Operation}\label{sec:Device
> Types / Memory Device / Device Op
> >>>    memory blocks to unplug them, or it would not be able to make use of
> >>>    unplugged memory blocks after plugging them (e.g., alignment).
> >>> +If VIRTIO_MEM_F_PERSISTENT_SUSPEND has not been negotiated, the
> driver MUST NOT
> >>> +allow the guest system to enter a suspended state (deep sleep,
> suspend-to-RAM).
> >
> > I think `guest system` could be simply `guest` but I do not have a
> > strong opinion about it.
>
> Makes sense. @Juraj, can you respin with that adjusted?
>

Sure thing. I will update it and respin it shortly.

Thanks!



> I'll open an issue afterwards and request a vote.
>
> --
> Cheers,
>
> David / dhildenb
>

>

--000000000000e7e40a0624067186
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Tue, Oct 8, 2024, 15:14 David Hildenbrand &lt;<a href=
=3D"mailto:david@redhat.com">david@redhat.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex">On 07.10.24 16:22, Matias Ezequiel Vara Larsen wr=
ote:<br>
&gt; On Mon, Oct 07, 2024 at 10:17:23AM +0200, David Hildenbrand wrote:<br>
&gt;&gt; On 09.08.24 16:03, Juraj Marcin wrote:<br>
&gt;&gt;&gt; Before, the behavior while suspending to a deep sleep state an=
d waking<br>
&gt;&gt;&gt; up was not specified. For example, in x86 QEMU VM all devices =
receive a<br>
&gt;&gt;&gt; reset request during wake-up. This would lead to unplugging of=
 all the<br>
&gt;&gt;&gt; plugged memory blocks. Due to this, suspending is disallowed i=
n the<br>
&gt;&gt;&gt; Linux Kernel, when plugged memory is present and<br>
&gt;&gt;&gt; VIRTIO_MEM_F_PERSISTENT_SUSPEND feature flag is not advertised=
 by the<br>
&gt;&gt;&gt; virtio-mem device.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; This new flag should signal to the guest driver, that the devi=
ce can<br>
&gt;&gt;&gt; correctly suspend to a deep sleep state and then wake up witho=
ut<br>
&gt;&gt;&gt; disrupting the plugged memory blocks. This feature flag is alr=
eady<br>
&gt;&gt;&gt; supported in the Linux Kernel [1] and should be soon also supp=
orted in<br>
&gt;&gt;&gt; QEMU [2].<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; [1]: <a href=3D"https://lore.kernel.org/all/20240318120645.105=
664-1-david@redhat.com/" rel=3D"noreferrer noreferrer" target=3D"_blank">ht=
tps://lore.kernel.org/all/20240318120645.105664-1-david@redhat.com/</a><br>
&gt;&gt;&gt; [2]: <a href=3D"https://lore.kernel.org/all/20240806160756.182=
524-1-jmarcin@redhat.com/" rel=3D"noreferrer noreferrer" target=3D"_blank">=
https://lore.kernel.org/all/20240806160756.182524-1-jmarcin@redhat.com/</a>=
<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Signed-off-by: Juraj Marcin &lt;<a href=3D"mailto:jmarcin@redh=
at.com" target=3D"_blank" rel=3D"noreferrer">jmarcin@redhat.com</a>&gt;<br>
&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 device-types/mem/description.tex | 12 +++++++++++=
+<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 1 file changed, 12 insertions(+)<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; diff --git a/device-types/mem/description.tex b/device-types/m=
em/description.tex<br>
&gt;&gt;&gt; index 0a6d558..5bff24c 100644<br>
&gt;&gt;&gt; --- a/device-types/mem/description.tex<br>
&gt;&gt;&gt; +++ b/device-types/mem/description.tex<br>
&gt;&gt;&gt; @@ -60,6 +60,8 @@ \subsection{Feature bits}\label{sec:Device T=
ypes / Memory Device / Feature bits}<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 access unplugged memory. \footnote{On platforms w=
ith memory properties that<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 might get modified implicitly on memory access, t=
his feature is expected to<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 be offered by the device.}<br>
&gt;&gt;&gt; +\item[VIRTIO_MEM_F_PERSISTENT_SUSPEND (2)] The driver can all=
ow the guest<br>
&gt;&gt;&gt; +system to enter suspended state (deep sleep, suspend-to-RAM).=
<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 \end{description}<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 \subsection{Device configuration layout}\label{se=
c:Device Types / Memory Device / Device configuration layout}<br>
&gt;&gt;&gt; @@ -174,6 +176,9 @@ \subsection{Device Initialization}\label{D=
evice Types / Memory Device / Device I<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 The device MUST NOT modify memory or memory prope=
rties of plugged memory<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 blocks during device reset.<br>
&gt;&gt;&gt; +The device SHOULD offer VIRTIO_MEM_F_PERSISTENT_SUSPEND if th=
e platform<br>
&gt;&gt;&gt; +supports suspending (deep sleep, suspend-to-RAM) with plugged=
 memory blocks.<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 \subsection{Device Operation}\label{sec:Device Ty=
pes / Memory Device / Device Operation}<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 The device notifies the driver about the amount o=
f memory the device wants<br>
&gt;&gt;&gt; @@ -268,6 +273,9 @@ \subsection{Device Operation}\label{sec:De=
vice Types / Memory Device / Device Op<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 memory blocks to unplug them, or it would not be =
able to make use of<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 unplugged memory blocks after plugging them (e.g.=
, alignment).<br>
&gt;&gt;&gt; +If VIRTIO_MEM_F_PERSISTENT_SUSPEND has not been negotiated, t=
he driver MUST NOT<br>
&gt;&gt;&gt; +allow the guest system to enter a suspended state (deep sleep=
, suspend-to-RAM).<br>
&gt; <br>
&gt; I think `guest system` could be simply `guest` but I do not have a<br>
&gt; strong opinion about it.<br>
<br>
Makes sense. @Juraj, can you respin with that adjusted?<br></blockquote></d=
iv></div><div dir=3D"auto"><br></div><div dir=3D"auto">Sure thing. I will u=
pdate it and respin it shortly.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Thanks!</div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></=
div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex">
<br>
I&#39;ll open an issue afterwards and request a vote.<br>
<br>
-- <br>
Cheers,<br>
<br>
David / dhildenb<br></blockquote></div></div><div dir=3D"auto"><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><br></blockquote></div></di=
v></div>

--000000000000e7e40a0624067186--

