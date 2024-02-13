Return-Path: <virtio-comment-return-9106-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D48DFC4829D
	for <virtio-comment@archiver.kernel.org>; Tue, 13 Feb 2024 00:20:30 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 1B40E2B029
	for <virtio-comment@archiver.kernel.org>; Tue, 13 Feb 2024 00:20:30 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D76DA986483
	for <virtio-comment@archiver.kernel.org>; Tue, 13 Feb 2024 00:20:29 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id B0A96986318; Tue, 13 Feb 2024 00:20:29 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C6EE6986420
	for <virtio-comment@lists.oasis-open.org>; Tue, 13 Feb 2024 00:19:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707783583; x=1708388383;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+dH4gigqvQ8H2fzCUakOiRzTn9m/CzDYR85Ns+20STg=;
        b=aAFRABvNC+NX7u3HwbWOClr1Nhx+wiZ4CCyyR3LlkcyudU6IdcNlGMna7XvOAsZ7Dr
         mHd8b1c644tBGgQ/vSMSh68Ujt0kDFp5pjLAMg27MqQD5c6nOdg6KcQTkyVPzQJUwIB3
         JeOhvHwnh8K88lWHx6YqF7CTUA9h3o8iNUmz13iU2IoyuZ7j4e2Ev5qLpXULWobHgbB6
         Te4XUE33/LpGS39sCoUc7iOOBM1qEc/Jxv2unPz2LP4pX8OFHqZh9yAVdHeDgPxYwMd3
         MLy1lJRmZbDayH1gAg20moovLAbea3fJcqZlukojfy53lS4vaAM05pGaXse+P6HIpaTh
         y8Jg==
X-Gm-Message-State: AOJu0YxC9c1isP75Sk4JLm4YTVpd/NzniNJKut9KKaoRjQK9UnHDsdY1
	E9XB5vYkWWOALqklfBQzDV35EBrJ6XJURghevOrpThFOcRx3femu/BwPTFQ8pnepWOvtsDS9D+U
	H2Q==
X-Google-Smtp-Source: AGHT+IHK3m6UhuiPzUq9YJLoLpwaTWjJJ1l3AKpLE1Co82guGNU7tzVrxuYW6HWqnYQvNGNlkWv0dQ==
X-Received: by 2002:a05:6512:3d15:b0:511:4fec:b976 with SMTP id d21-20020a0565123d1500b005114fecb976mr6853598lfv.51.1707783582462;
        Mon, 12 Feb 2024 16:19:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU/2Qw6jnoq5Xv9Mr03BM8gAWtRK6w9nB8QnK3CTtiaCliR1Qr14u1wA9jy2mBqJmUS4VTI3lihl+kR3lVT82a9MTWxpTpln0wupWcQ0MaU3ir1+A==
X-Received: by 2002:a50:9fad:0:b0:55f:cb23:1f1b with SMTP id
 c42-20020a509fad000000b0055fcb231f1bmr46794edf.0.1707783581429; Mon, 12 Feb
 2024 16:19:41 -0800 (PST)
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
 <CAAfnVBkb_xaRcAa9bwiW9GUEiqxQ=UGnW42T5s1JquX4Xw1YwQ@mail.gmail.com> <CAF6AEGsRremaP08tqKOmgfMK+yjgEkBsBpbNcgDkaZVUzE49OA@mail.gmail.com>
In-Reply-To: <CAF6AEGsRremaP08tqKOmgfMK+yjgEkBsBpbNcgDkaZVUzE49OA@mail.gmail.com>
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Mon, 12 Feb 2024 16:19:28 -0800
X-Gmail-Original-Message-ID: <CAAfnVBnMwGkX_aLkc2n4TPDwnvt6AqoQxEVB=3owXQnq3pDvdA@mail.gmail.com>
Message-ID: <CAAfnVBnMwGkX_aLkc2n4TPDwnvt6AqoQxEVB=3owXQnq3pDvdA@mail.gmail.com>
To: Rob Clark <robdclark@gmail.com>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>, Yiwei Zhang <zzyiwei@chromium.org>, 
	Ryan Neph <ryanneph@chromium.org>, Gerd Hoffmann <kraxel@redhat.com>, Huang Rui <ray.huang@amd.com>, 
	Sergio Lopez <slp@redhat.com>, 
	Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, 
	Colin Downs-Razouk <colindr@google.com>, Kaiyi Li <kaiyili@google.com>, 
	virtio-comment@lists.oasis-open.org
Content-Type: multipart/alternative; boundary="000000000000b9c8d506113859ba"
Subject: [virtio-comment] Re: [PATCH v1] virtio-gpu: Document new fence-passing feature

--000000000000b9c8d506113859ba
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 9, 2024 at 1:56=E2=80=AFPM Rob Clark <robdclark@gmail.com> wrot=
e:

> tbh, I don't think VIRTGPU_EXECBUF_SHARED_FENCE is a good idea either.
> A non-shareable fence fd is kind of an oxymoron.
>

We can call it VIRTGPU_EXECBUF_HOST_SHAREABLE_FENCE
and VIRTIO_GPU_FLAG_FENCE_HOST_SHAREABLE to denote the difference.
Currently, no fences are shareable across host
contexts/virtio-devices/displays.  With the new feature bit, they are.


>
> > So in summary with my review comments:
> >     - Can we get a FLAG_SHAREABLE in v2?
>
> We _can_.. I don't think it is a good idea, but a useless bit in the
> protocol isn't the end of the world.  I prefer that non-shareable
> fences be handled in context specific protocol.  And I suspect that
> sooner or later any fence that is visible at the virtgpu level, will
> need to be shareable.
>

We will definitely use the bit.  We might build some-type of fence LRU
cache or something using the flag, to avoid the last signalled fence trick.

than within a particular renderer instance.. and in that case it can
> be handled with context specific protocol.
>
> >     - Can we get a RESOURCE_FLUSH(in_fence) for KMS integration in v2?
>
> Nak, and nak for DESTROY_FENCE(S)
>

I think +Kaiyi Li <kaiyili@google.com> +Colin Downs-Razouk
<colindr@google.com> have a use case for RESOURE_FLUSH with an acquire
fence.  Hopefully, they can describe it here and the timeline (I think Q2
.. not far?).

I think all Android VMs "in a box" (not ARCVM-style) would find such an API
useful.


> Lack of fence lifetime built into the protocol isn't a deficiency,
> it's a feature.  It keeps the design as simple and lightweight and
> flexible as possible.
>
> BR,
> -R
>
> >     - Regarding transiency:
> >            - Good idea, but can we add it to the spec level rather than
> being implementation defined?
> >            - For it to be transient everywhere, we'll need even
> virtio-video to take an in-fence at-least?
> >            - I recommend more research on the transient subject, it
> *could* work
> >
> > [1]
> https://lists.nongnu.org/archive/html/qemu-devel/2023-05/msg00595.html
> >
> >>
> >> The last_signaled_fence may be a workaround that leads to weird edge
> >> cases.. but over-complicating transient resource lifetime in the
> >> protocol is not the answer.
> >>
> >> BR,
> >> -R
> >>
> >> > We can probably survive these oddities, but we can probably avoid
> them too, so that's why it would be nice for the guest to provide the
> information it has.
> >> >
> >> >>
> >> >> > Though, the guest kernel already tracks fence lifetimes through
> dma_fence.  What if we add:
> >> >> >
> >> >> > - DESTROY_FENCES(fence_ids, num_fences)
> >> >> > - a virtio-config ("fence_destroy_threshold"), which controls
> num_fences in DESTROY_FENCES
> >> >> >
> >> >> > When fence_destroy_threshold =3D=3D 0, this would be the current
> proposed solution (fence lifetimes implementation defined).  However, a
> user can make "fence_destroy_threshold" 100 or something like that, to
> cause a VM-exit everytime 100 fences have been destroyed.
> >> >> >
> >> >> > This attempts a tunable compromise between API purity and
> performance concerns.  WDYT?
> >> >>
> >> >> Tbh, I think the current approach is cleaner from the PoV of what a
> >> >> fence is.. it is just a seqno, it should not have a lifetime.
> >> >>
> >> >> BR,
> >> >> -R
> >> >>
> >> >> >
> >> >> >>
> >> >> >>
> >> >> >> But this is all implementation detail
> >> >> >>
> >> >> >> BR,
> >> >> >> -R
> >> >> >>
> >> >> >> >
> >> >> >> > Essentially, let's do our due diligence and verify the most
> important use case (gpu --> display) actually works.
> >> >> >> >
> >> >> >> >>
> >> >> >> >>
> >> >> >> >> BR,
> >> >> >> >> -R
> >> >> >> >>
> >> >> >> >> >> --
> >> >> >> >> >> Best regards,
> >> >> >> >> >> Dmitry
> >> >> >> >> >>
>

--000000000000b9c8d506113859ba
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Feb 9, 2024 at 1:56=E2=80=AFP=
M Rob Clark &lt;<a href=3D"mailto:robdclark@gmail.com" target=3D"_blank">ro=
bdclark@gmail.com</a>&gt; wrote:</div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">
tbh, I don&#39;t think VIRTGPU_EXECBUF_SHARED_FENCE is a good idea either.<=
br>
A non-shareable fence fd is kind of an oxymoron.<br></blockquote><div><br><=
/div><div>We can call=C2=A0it VIRTGPU_EXECBUF_HOST_SHAREABLE_FENCE and=C2=
=A0VIRTIO_GPU_FLAG_FENCE_HOST_SHAREABLE to denote the difference.=C2=A0 Cur=
rently, no fences are shareable across host contexts/virtio-devices/display=
s.=C2=A0 With the new feature bit, they are.</div><div>=C2=A0</div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex"><br></blockquote><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
&gt; So in summary with my review comments:<br>
&gt;=C2=A0 =C2=A0 =C2=A0- Can we get a FLAG_SHAREABLE in v2?<br>
<br>
We _can_.. I don&#39;t think it is a good idea, but a useless bit in the<br=
>
protocol isn&#39;t the end of the world.=C2=A0 I prefer that non-shareable<=
br>
fences be handled in context specific protocol.=C2=A0 And I suspect that<br=
>
sooner or later any fence that is visible at the virtgpu level, will<br>
need to be shareable.<br></blockquote><div><br></div><div>We will definitel=
y use the bit.=C2=A0 We might build some-type of fence LRU cache or somethi=
ng using the flag, to avoid the last signalled fence trick.=C2=A0</div><div=
><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
than within a particular renderer instance.. and in that case it can<br>
be handled with context specific protocol.<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0- Can we get a RESOURCE_FLUSH(in_fence) for KMS int=
egration in v2?<br>
<br>
Nak, and nak for DESTROY_FENCE(S)<br></blockquote><div><br></div><div>I thi=
nk=C2=A0<a class=3D"gmail_plusreply" id=3D"plusReplyChip-0" href=3D"mailto:=
kaiyili@google.com" tabindex=3D"-1">+Kaiyi Li</a>=C2=A0<a class=3D"gmail_pl=
usreply" id=3D"plusReplyChip-1" href=3D"mailto:colindr@google.com" tabindex=
=3D"-1">+Colin Downs-Razouk</a>=C2=A0have=C2=A0a use case for RESOURE_FLUSH=
 with an acquire fence.=C2=A0 Hopefully, they can describe it here and the =
timeline (I think Q2 .. not far?).=C2=A0=C2=A0</div><div><br></div><div>I t=
hink all Android VMs &quot;in a box&quot; (not ARCVM-style) would find such=
 an API useful.=C2=A0</div><div><br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">
<br>
Lack of fence lifetime built into the protocol isn&#39;t a deficiency,<br>
it&#39;s a feature.=C2=A0 It keeps the design as simple and lightweight and=
<br>
flexible as possible.<br>
<br>
BR,<br>
-R<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0- Regarding transiency:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - Good idea, but can we add i=
t to the spec level rather than being implementation defined?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - For it to be transient ever=
ywhere, we&#39;ll need even virtio-video to take an in-fence at-least?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - I recommend more research o=
n the transient subject, it *could* work<br>
&gt;<br>
&gt; [1] <a href=3D"https://lists.nongnu.org/archive/html/qemu-devel/2023-0=
5/msg00595.html" rel=3D"noreferrer" target=3D"_blank">https://lists.nongnu.=
org/archive/html/qemu-devel/2023-05/msg00595.html</a><br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; The last_signaled_fence may be a workaround that leads to weird ed=
ge<br>
&gt;&gt; cases.. but over-complicating transient resource lifetime in the<b=
r>
&gt;&gt; protocol is not the answer.<br>
&gt;&gt;<br>
&gt;&gt; BR,<br>
&gt;&gt; -R<br>
&gt;&gt;<br>
&gt;&gt; &gt; We can probably survive these oddities, but we can probably a=
void them too, so that&#39;s why it would be nice for the guest to provide =
the information it has.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt; Though, the guest kernel already tracks fence lifeti=
mes through dma_fence.=C2=A0 What if we add:<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; - DESTROY_FENCES(fence_ids, num_fences)<br>
&gt;&gt; &gt;&gt; &gt; - a virtio-config (&quot;fence_destroy_threshold&quo=
t;), which controls num_fences in DESTROY_FENCES<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; When fence_destroy_threshold =3D=3D 0, this would be=
 the current proposed solution (fence lifetimes implementation defined).=C2=
=A0 However, a user can make &quot;fence_destroy_threshold&quot; 100 or som=
ething like that, to cause a VM-exit everytime 100 fences have been destroy=
ed.<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; This attempts a tunable compromise between API purit=
y and performance concerns.=C2=A0 WDYT?<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Tbh, I think the current approach is cleaner from the PoV=
 of what a<br>
&gt;&gt; &gt;&gt; fence is.. it is just a seqno, it should not have a lifet=
ime.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; BR,<br>
&gt;&gt; &gt;&gt; -R<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; But this is all implementation detail<br>
&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; BR,<br>
&gt;&gt; &gt;&gt; &gt;&gt; -R<br>
&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; Essentially, let&#39;s do our due diligence=
 and verify the most important use case (gpu --&gt; display) actually works=
.<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; BR,<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; -R<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; --<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; Best regards,<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; Dmitry<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;&gt;<br>
</blockquote></div></div>

--000000000000b9c8d506113859ba--
