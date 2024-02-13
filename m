Return-Path: <virtio-comment-return-9109-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEEE9C4829A
	for <virtio-comment@archiver.kernel.org>; Tue, 13 Feb 2024 22:37:46 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 35CF62AEE8
	for <virtio-comment@archiver.kernel.org>; Tue, 13 Feb 2024 22:37:46 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0D75A986590
	for <virtio-comment@archiver.kernel.org>; Tue, 13 Feb 2024 22:37:46 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id E6A2598656F; Tue, 13 Feb 2024 22:37:45 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D2852986572
	for <virtio-comment@lists.oasis-open.org>; Tue, 13 Feb 2024 22:37:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707863864; x=1708468664;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hadwAHDiaAj+8nxI+qsK9De/HObj/TasLHuLjiqvzmg=;
        b=L7xNN1uWZ786AzAZPiKixYYYYguWCYYwg1stBHiklGHKXfhnIJyulzwTVxgMVRILjO
         9y0CV36vDqV7Yxd/acGLkp2FaNVjkjg8WpYtZd1iQBP8u+L3quEYxLrP9Fg+7ehbRri/
         s6fU5aOR1gwWfxluAe8HabGQzY+2Z8bYVzhdw0ZIREKProry7AK5qdeaOaIUlmB4GPVz
         LNWyqiUcivH2mddZ8Sz+v2nGunTmMjfOsqtJD3MMqJFgqcdz2aDVHM3wUoaY6Ul9CtW6
         0wBJpaJD8Wv/MymL4xeKBUo3RCQR4E7xgh1ewhBCn+qTea2F26bxlIiKlz8OUbC/rXTU
         FEcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyssqQqMM1FDWa5reeOVM/kqJBE+gAZQW1iQ8aQXWaKeAasDM+w2W5wkOQteKhm263q3mZCnVpckD2X7bYku4wpydplgzXntmfvvHJs8xMVEooxA==
X-Gm-Message-State: AOJu0YxTfZeTRdxp0uPWH9I+welZuayfmLnYdHh117tefqZVHqNGhEWP
	fpyCogL/pFMXrHc+SFYU4HysYZ2F2DKBISmDQWg4clbn/RKMkQr7fl4JblvL2pN+p+LYOGDipVk
	A0A==
X-Google-Smtp-Source: AGHT+IEePbJF+TaNPtKL9ByZud5e1hwHePSjX+NucC7sfHXch/MxgkYB4mz18lFOp5zloFFjhGV1eA==
X-Received: by 2002:a05:620a:11a6:b0:787:199f:23b8 with SMTP id c6-20020a05620a11a600b00787199f23b8mr1068827qkk.64.1707863863898;
        Tue, 13 Feb 2024 14:37:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWTRs4K2wWH/gFtkB5HBMkyxzK3Xc9HLzIuagO5uitVTEFVZE9G1KkwcjvRnkd/GMP9lJYnl9KHuZwu8Hz24mhvnbAUyWm34Fa9BhEsShfcZYt42Q==
X-Forwarded-Encrypted: i=1; AJvYcCVUopr/HXZn8O0Y3OrOz4XnNdc6VsW/Y+l0u3pReNRJKXiT3xdmERclWHMiolkNKwL8SaAamanKv4gFUJcjw8JGiYyICMbY7ApYjQ8ex7JGJZy2zA==
X-Received: by 2002:a50:8d13:0:b0:55f:8851:d03b with SMTP id
 s19-20020a508d13000000b0055f8851d03bmr52800eds.5.1707863862232; Tue, 13 Feb
 2024 14:37:42 -0800 (PST)
MIME-Version: 1.0
References: <20240128191218.392061-1-dmitry.osipenko@collabora.com>
 <CAAfnVBnieT4TfahEv6nG-pvSxKSLh7s=Tf1FB=v1mX1oL8QeOg@mail.gmail.com>
 <9b02c7ba-4cab-46bf-8a85-cd34d943a49a@collabora.com> <CAAfnVBnGCP2m2WoXY=NKAQ4vQncB19c4YVMrC51r5KdsSq7uxQ@mail.gmail.com>
 <CAF6AEGtSGULUVVZ-45sdhUpffsqi7yM15aHSyPSt9=TMr8iEHw@mail.gmail.com>
 <CAAfnVBn-8a1kKe9M3RN75D9q9rdzep-=-7ixspmDDJu-Wz4C_Q@mail.gmail.com>
 <CAF6AEGuQD-zuHjkjeBEuteyvQE33pGeF0XPDjGDZrZBrr=tNJg@mail.gmail.com>
 <CAAfnVBmasMmXRcNnxG3J_8bg8w-Bq3yKZ66sLKxv+Q3gbbgr3g@mail.gmail.com>
 <CAF6AEGtmfFuh0iZpnzm9wbROeCcGx5hGU-BnnJKMcj0awhcZFQ@mail.gmail.com>
 <CAAfnVBnb9RcpCX03trdfxOTehUioCOXAkNfuW=5vS26qt_YSdQ@mail.gmail.com>
 <CAF6AEGu4tE5AoE9tjhbPYg94fyEyOLQAHhtsBK-DvC2ULRkgzQ@mail.gmail.com>
 <CAAfnVBkb_xaRcAa9bwiW9GUEiqxQ=UGnW42T5s1JquX4Xw1YwQ@mail.gmail.com>
 <CAF6AEGsRremaP08tqKOmgfMK+yjgEkBsBpbNcgDkaZVUzE49OA@mail.gmail.com>
 <CAAfnVBnMwGkX_aLkc2n4TPDwnvt6AqoQxEVB=3owXQnq3pDvdA@mail.gmail.com> <CAF6AEGv0CH6TvD1AbMQhsCa51Kr=xsx50etCjSinbqfCEbJ_wA@mail.gmail.com>
In-Reply-To: <CAF6AEGv0CH6TvD1AbMQhsCa51Kr=xsx50etCjSinbqfCEbJ_wA@mail.gmail.com>
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Tue, 13 Feb 2024 14:37:29 -0800
X-Gmail-Original-Message-ID: <CAAfnVB=M_ztJ_keMEDeSbxibC-pfKZH+xnM4Z+9E_KR-vTXGwg@mail.gmail.com>
Message-ID: <CAAfnVB=M_ztJ_keMEDeSbxibC-pfKZH+xnM4Z+9E_KR-vTXGwg@mail.gmail.com>
To: Rob Clark <robdclark@gmail.com>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>, Yiwei Zhang <zzyiwei@chromium.org>, 
	Ryan Neph <ryanneph@chromium.org>, Gerd Hoffmann <kraxel@redhat.com>, Huang Rui <ray.huang@amd.com>, 
	Sergio Lopez <slp@redhat.com>, 
	Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, 
	Colin Downs-Razouk <colindr@google.com>, Kaiyi Li <kaiyili@google.com>, 
	virtio-comment@lists.oasis-open.org
Content-Type: multipart/alternative; boundary="000000000000d5e11906114b0ab7"
Subject: [virtio-comment] Re: [PATCH v1] virtio-gpu: Document new fence-passing feature

--000000000000d5e11906114b0ab7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 12, 2024 at 6:15=E2=80=AFPM Rob Clark <robdclark@gmail.com> wro=
te:

> On Mon, Feb 12, 2024 at 4:19=E2=80=AFPM Gurchetan Singh
> <gurchetansingh@chromium.org> wrote:
> >
> >
> >
> > On Fri, Feb 9, 2024 at 1:56=E2=80=AFPM Rob Clark <robdclark@gmail.com> =
wrote:
> >>
> >> tbh, I don't think VIRTGPU_EXECBUF_SHARED_FENCE is a good idea either.
> >> A non-shareable fence fd is kind of an oxymoron.
> >
> >
> > We can call it C and VIRTIO_GPU_FLAG_FENCE_HOST_SHAREABLE to denote the
> difference.  Currently, no fences are shareable across host
> contexts/virtio-devices/displays.  With the new feature bit, they are.
> >
>
> sure, but the point I'm getting at is that existing fence fd APIs
> (whether uapi, wsi, vk, or egl) don't differentiate between guest and
> host shareability, so in practice we are just going to have to mark
> everything as host-shareable if the producing and consuming ctx both
> support host-shareable.. but if you actually need to make this
> differentiation there is something I don't understand about your
> use-case or you don't understand about the design.
>

I'll send you a CL that makes use of VIRTIO_GPU_FLAG_FENCE_HOST_SHAREABLE
so we can move this discussion to code.


>
> >>
> >>
> >> > So in summary with my review comments:
> >> >     - Can we get a FLAG_SHAREABLE in v2?
> >>
> >> We _can_.. I don't think it is a good idea, but a useless bit in the
> >> protocol isn't the end of the world.  I prefer that non-shareable
> >> fences be handled in context specific protocol.  And I suspect that
> >> sooner or later any fence that is visible at the virtgpu level, will
> >> need to be shareable.
> >
> >
> > We will definitely use the bit.  We might build some-type of fence LRU
> cache or something using the flag, to avoid the last signalled fence tric=
k.
>
> if you need to avoid the "trick", I have concerns about your fence
> implementation.
>
> >
> >> than within a particular renderer instance.. and in that case it can
> >> be handled with context specific protocol.
> >>
> >> >     - Can we get a RESOURCE_FLUSH(in_fence) for KMS integration in v=
2?
> >>
> >> Nak, and nak for DESTROY_FENCE(S)
> >
> >
> > I think +Kaiyi Li +Colin Downs-Razouk have a use case for RESOURE_FLUSH
> with an acquire fence.  Hopefully, they can describe it here and the
> timeline (I think Q2 .. not far?).
> >
> > I think all Android VMs "in a box" (not ARCVM-style) would find such an
> API useful.
>
> If there is an independent reason for RESOURCE_FLUSH, then sure, we
> can discuss it on it's merits.. or even a related reason.  I'm not too
> concerned about the timeline, but want someone to describe a use-case
> where the existing proposal doesn't fit.  It should always be "safe"
> to substitute a later signaled fence for an earlier one (possibly
> modulo CONTEXT_LOST, but then, you know, everything is undefined)
>

Yes, I'll let others comment on RESOURCE_FLUSH + acquire fence since I'm
not the only gfxstreamist out there...


>
> BR,
> -R
>
> >
> >>
> >> Lack of fence lifetime built into the protocol isn't a deficiency,
> >> it's a feature.  It keeps the design as simple and lightweight and
> >> flexible as possible.
> >>
> >> BR,
> >> -R
> >>
> >> >     - Regarding transiency:
> >> >            - Good idea, but can we add it to the spec level rather
> than being implementation defined?
> >> >            - For it to be transient everywhere, we'll need even
> virtio-video to take an in-fence at-least?
> >> >            - I recommend more research on the transient subject, it
> *could* work
> >> >
> >> > [1]
> https://lists.nongnu.org/archive/html/qemu-devel/2023-05/msg00595.html
> >> >
> >> >>
> >> >> The last_signaled_fence may be a workaround that leads to weird edg=
e
> >> >> cases.. but over-complicating transient resource lifetime in the
> >> >> protocol is not the answer.
> >> >>
> >> >> BR,
> >> >> -R
> >> >>
> >> >> > We can probably survive these oddities, but we can probably avoid
> them too, so that's why it would be nice for the guest to provide the
> information it has.
> >> >> >
> >> >> >>
> >> >> >> > Though, the guest kernel already tracks fence lifetimes throug=
h
> dma_fence.  What if we add:
> >> >> >> >
> >> >> >> > - DESTROY_FENCES(fence_ids, num_fences)
> >> >> >> > - a virtio-config ("fence_destroy_threshold"), which controls
> num_fences in DESTROY_FENCES
> >> >> >> >
> >> >> >> > When fence_destroy_threshold =3D=3D 0, this would be the curre=
nt
> proposed solution (fence lifetimes implementation defined).  However, a
> user can make "fence_destroy_threshold" 100 or something like that, to
> cause a VM-exit everytime 100 fences have been destroyed.
> >> >> >> >
> >> >> >> > This attempts a tunable compromise between API purity and
> performance concerns.  WDYT?
> >> >> >>
> >> >> >> Tbh, I think the current approach is cleaner from the PoV of wha=
t
> a
> >> >> >> fence is.. it is just a seqno, it should not have a lifetime.
> >> >> >>
> >> >> >> BR,
> >> >> >> -R
> >> >> >>
> >> >> >> >
> >> >> >> >>
> >> >> >> >>
> >> >> >> >> But this is all implementation detail
> >> >> >> >>
> >> >> >> >> BR,
> >> >> >> >> -R
> >> >> >> >>
> >> >> >> >> >
> >> >> >> >> > Essentially, let's do our due diligence and verify the most
> important use case (gpu --> display) actually works.
> >> >> >> >> >
> >> >> >> >> >>
> >> >> >> >> >>
> >> >> >> >> >> BR,
> >> >> >> >> >> -R
> >> >> >> >> >>
> >> >> >> >> >> >> --
> >> >> >> >> >> >> Best regards,
> >> >> >> >> >> >> Dmitry
> >> >> >> >> >> >>
>

--000000000000d5e11906114b0ab7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Feb 12, 2024 at 6:15=E2=80=AF=
PM Rob Clark &lt;<a href=3D"mailto:robdclark@gmail.com" target=3D"_blank">r=
obdclark@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On Mon, Feb 12, 2024 at 4:19=E2=80=AFPM Gurchetan Singh<b=
r>
&lt;<a href=3D"mailto:gurchetansingh@chromium.org" target=3D"_blank">gurche=
tansingh@chromium.org</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On Fri, Feb 9, 2024 at 1:56=E2=80=AFPM Rob Clark &lt;<a href=3D"mailto=
:robdclark@gmail.com" target=3D"_blank">robdclark@gmail.com</a>&gt; wrote:<=
br>
&gt;&gt;<br>
&gt;&gt; tbh, I don&#39;t think VIRTGPU_EXECBUF_SHARED_FENCE is a good idea=
 either.<br>
&gt;&gt; A non-shareable fence fd is kind of an oxymoron.<br>
&gt;<br>
&gt;<br>
&gt; We can call it C=C2=A0and VIRTIO_GPU_FLAG_FENCE_HOST_SHAREABLE to deno=
te the difference.=C2=A0 Currently, no fences are shareable across host con=
texts/virtio-devices/displays.=C2=A0 With the new feature bit, they are.<br=
>
&gt;<br>
<br>
sure, but the point I&#39;m getting at is that existing fence fd APIs<br>
(whether uapi, wsi, vk, or egl) don&#39;t differentiate between guest and<b=
r>
host shareability, so in practice we are just going to have to mark<br>
everything as host-shareable if the producing and consuming ctx both<br>
support host-shareable.. but if you actually need to make this<br>
differentiation there is something I don&#39;t understand about your<br>
use-case or you don&#39;t understand about the design.<br></blockquote><div=
><br></div><div>I&#39;ll send you a CL that makes use of VIRTIO_GPU_FLAG_FE=
NCE_HOST_SHAREABLE so we can move this discussion to code.</div><div>=C2=A0=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; &gt; So in summary with my review comments:<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0- Can we get a FLAG_SHAREABLE in v2?<br>
&gt;&gt;<br>
&gt;&gt; We _can_.. I don&#39;t think it is a good idea, but a useless bit =
in the<br>
&gt;&gt; protocol isn&#39;t the end of the world.=C2=A0 I prefer that non-s=
hareable<br>
&gt;&gt; fences be handled in context specific protocol.=C2=A0 And I suspec=
t that<br>
&gt;&gt; sooner or later any fence that is visible at the virtgpu level, wi=
ll<br>
&gt;&gt; need to be shareable.<br>
&gt;<br>
&gt;<br>
&gt; We will definitely use the bit.=C2=A0 We might build some-type of fenc=
e LRU cache or something using the flag, to avoid the last signalled fence =
trick.<br>
<br>
if you need to avoid the &quot;trick&quot;, I have concerns about your fenc=
e<br>
implementation.<br>
<br>
&gt;<br>
&gt;&gt; than within a particular renderer instance.. and in that case it c=
an<br>
&gt;&gt; be handled with context specific protocol.<br>
&gt;&gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0- Can we get a RESOURCE_FLUSH(in_fence) fo=
r KMS integration in v2?<br>
&gt;&gt;<br>
&gt;&gt; Nak, and nak for DESTROY_FENCE(S)<br>
&gt;<br>
&gt;<br>
&gt; I think +Kaiyi Li +Colin Downs-Razouk have a use case for RESOURE_FLUS=
H with an acquire fence.=C2=A0 Hopefully, they can describe it here and the=
 timeline (I think Q2 .. not far?).<br>
&gt;<br>
&gt; I think all Android VMs &quot;in a box&quot; (not ARCVM-style) would f=
ind such an API useful.<br>
<br>
If there is an independent reason for RESOURCE_FLUSH, then sure, we<br>
can discuss it on it&#39;s merits.. or even a related reason.=C2=A0 I&#39;m=
 not too<br>
concerned about the timeline, but want someone to describe a use-case<br>
where the existing proposal doesn&#39;t fit.=C2=A0 It should always be &quo=
t;safe&quot;<br>
to substitute a later signaled fence for an earlier one (possibly<br>
modulo CONTEXT_LOST, but then, you know, everything is undefined)<br></bloc=
kquote><div><br></div><div>Yes, I&#39;ll let others comment on RESOURCE_FLU=
SH=C2=A0+ acquire fence since I&#39;m not the only gfxstreamist out there..=
.</div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
<br>
BR,<br>
-R<br>
<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; Lack of fence lifetime built into the protocol isn&#39;t a deficie=
ncy,<br>
&gt;&gt; it&#39;s a feature.=C2=A0 It keeps the design as simple and lightw=
eight and<br>
&gt;&gt; flexible as possible.<br>
&gt;&gt;<br>
&gt;&gt; BR,<br>
&gt;&gt; -R<br>
&gt;&gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0- Regarding transiency:<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - Good idea, but can=
 we add it to the spec level rather than being implementation defined?<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - For it to be trans=
ient everywhere, we&#39;ll need even virtio-video to take an in-fence at-le=
ast?<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - I recommend more r=
esearch on the transient subject, it *could* work<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; [1] <a href=3D"https://lists.nongnu.org/archive/html/qemu-dev=
el/2023-05/msg00595.html" rel=3D"noreferrer" target=3D"_blank">https://list=
s.nongnu.org/archive/html/qemu-devel/2023-05/msg00595.html</a><br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; The last_signaled_fence may be a workaround that leads to=
 weird edge<br>
&gt;&gt; &gt;&gt; cases.. but over-complicating transient resource lifetime=
 in the<br>
&gt;&gt; &gt;&gt; protocol is not the answer.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; BR,<br>
&gt;&gt; &gt;&gt; -R<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt; We can probably survive these oddities, but we can p=
robably avoid them too, so that&#39;s why it would be nice for the guest to=
 provide the information it has.<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; Though, the guest kernel already tracks fen=
ce lifetimes through dma_fence.=C2=A0 What if we add:<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; - DESTROY_FENCES(fence_ids, num_fences)<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; - a virtio-config (&quot;fence_destroy_thre=
shold&quot;), which controls num_fences in DESTROY_FENCES<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; When fence_destroy_threshold =3D=3D 0, this=
 would be the current proposed solution (fence lifetimes implementation def=
ined).=C2=A0 However, a user can make &quot;fence_destroy_threshold&quot; 1=
00 or something like that, to cause a VM-exit everytime 100 fences have bee=
n destroyed.<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; This attempts a tunable compromise between =
API purity and performance concerns.=C2=A0 WDYT?<br>
&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; Tbh, I think the current approach is cleaner fro=
m the PoV of what a<br>
&gt;&gt; &gt;&gt; &gt;&gt; fence is.. it is just a seqno, it should not hav=
e a lifetime.<br>
&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; BR,<br>
&gt;&gt; &gt;&gt; &gt;&gt; -R<br>
&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; But this is all implementation detail<b=
r>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; BR,<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; -R<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt; Essentially, let&#39;s do our due =
diligence and verify the most important use case (gpu --&gt; display) actua=
lly works.<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; BR,<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; -R<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; --<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; Best regards,<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; Dmitry<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt;<br>
</blockquote></div></div>

--000000000000d5e11906114b0ab7--
