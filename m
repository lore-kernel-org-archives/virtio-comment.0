Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E2AF46444
	for <virtio-comment@lists.linux.dev>; Mon, 10 Jun 2024 09:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718010575; cv=none; b=si5FGEStvlfeBHrigtb5iwN72zHEEwc7M+IMAsZ5t1hSLareajIfyYUwZ/ccJAgvxIQPjTsq3QSL3l0Z4EaGFepzN5v5RwR0E4XP+pENIjm0pfR1NbK+QmH/JTmOEtl49ychynD47DFerdB0gHQ7q5qTyRYDgvgz9EHxiwh0ddI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718010575; c=relaxed/simple;
	bh=jhfxrq9ltg0jXYQOyuBp4Lbtvx2jUCxE4Sumkc6V82E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qZjRxW93LP173VS5Nlj2DsLZt/WJnyOUN3m0ARRe8YdHQaLVsVSK5nYDxytI3nKHDE+N2YHKMQ08nJkSrGXWU3HO6dlwuTfndKk+NRrpdX5PdIferIouhuwCVHY0BTnQgVyFR3bGlWpAG4inMFkpwdsFsqGak0XTy4VQC5KaULk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=X+Vf0Emb; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="X+Vf0Emb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718010572;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ATk/0GyNkm5toJFyNQGSzSoAlGIKFIK4saRZmB/BOrU=;
	b=X+Vf0EmbDyD9e1v3vZ3aPtunz8HIuDcWhKa70glHouuDGsvKd9uE9LSLmlLZ+OBDwJONs8
	7+8l/GLb+KKeeOtOXtKarsDrGwjLWSyMhqN3S7+m8pRb5FqZFriWgDUXkH0PAnZQGRzBDr
	OXqu17TMs5xbr+4rHc/vBblQ8TGEg4U=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-12-febQf4m8PRCSz-V8N7gXPw-1; Mon, 10 Jun 2024 05:09:30 -0400
X-MC-Unique: febQf4m8PRCSz-V8N7gXPw-1
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-6ea972a3547so1055378a12.1
        for <virtio-comment@lists.linux.dev>; Mon, 10 Jun 2024 02:09:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718010569; x=1718615369;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ATk/0GyNkm5toJFyNQGSzSoAlGIKFIK4saRZmB/BOrU=;
        b=krPGIENrAOsNEa0Kloqh4RhNRQ6756fvPzaDeKoC5KZZx0mDWu97mwtgB79LGzFJHY
         umMb0EC15Orv3GCAQwUr7VzV0yUNKHKG8sOm/a/6umob6w1L7c306tMJGGs6R0ciyt2t
         zZFuIHWP3AZ7ch72v+Y/tuEDK0nm2e6pUlySKNlTSrNN3EDI6meaLVO1nogNXgOeC6d1
         0KvMQbozqh5uiWCy6BzygyqHTj3mHBflVLwgpqx+uwOACgZ1gcZXIf4EyVj0JfURG8JZ
         vZRc3UT12QlFq+Grr4R3knElK/DcsRY2GKYB7fQdqVU3GhZARa1UxcBsFeQFc/kodz7n
         YRLQ==
X-Gm-Message-State: AOJu0Yyya4LuB5XWH+jWoqVQ3247iV2CmIIIkCXhrB651CjMPXZgZAXE
	LumD3v3/1dCsDd4pMfCwrumhK2qj6UN5H8zR3DU/uKn9k0CvTQ9mZ+Jh/l0OqhsrcUeZXKgzcyQ
	PwUXmxfmS7WvszN87tZqKjToHfLCD5s9xQ5oCm7WegowrknyJv51rtiqZMZv+blky2Xckqq9MPE
	fvELNlGvcx78A5OGplf+9ratldbXLgUty+h3l9hd4AXnLSIsY=
X-Received: by 2002:a05:6a20:9683:b0:1af:acf6:f790 with SMTP id adf61e73a8af0-1b2f9ca362cmr7728882637.48.1718010568767;
        Mon, 10 Jun 2024 02:09:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHQx7k9bVl03XiHXHyjcMeYKckzBUUvNC04PMf5fBR0HfaBlStaL2UDfuUQqEy7qliiezEuyRaCPCQVNvymOk=
X-Received: by 2002:a05:6a20:9683:b0:1af:acf6:f790 with SMTP id
 adf61e73a8af0-1b2f9ca362cmr7728863637.48.1718010568283; Mon, 10 Jun 2024
 02:09:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240607133508.1400529-1-aesteve@redhat.com>
In-Reply-To: <20240607133508.1400529-1-aesteve@redhat.com>
From: Albert Esteve <aesteve@redhat.com>
Date: Mon, 10 Jun 2024 11:09:17 +0200
Message-ID: <CADSE00K5RjuLY1UKfPiAMXv=HWJC3hdp9yvo_t7yr9HqhAVotw@mail.gmail.com>
Subject: Re: [PATCH v2 0/1] virtio-media: Add device specification
To: virtio-comment@lists.linux.dev
Cc: changyeon@google.com, eballetb@redhat.com, daniel.almeida@collabora.com, 
	Alexander.Gordeev@opensynergy.com, ribalda@google.com, acourbot@chromium.org, 
	mst@redhat.com, gurchetansingh@google.com, Matti.Moell@opensynergy.com, 
	cohuck@redhat.com, nicolas.dufresne@collabora.com, alex.bennee@linaro.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000a4b1b2061a858187"

--000000000000a4b1b2061a858187
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alex, allow me to recover your message to repond.

On Fri, Jun 7, 2024 at 3:29=E2=80=AFPM Alexander Gordeev <
alexander.gordeev@opensynergy.com> wrote:

> Hi Albert,
>
>

>
> I'd like to add some general considerations:
>
> 1. virtio-media device capability discovery is very chatty
>
> V4L2 requires potentially hundreds of system calls to get the full view
> of the device capabilities. This is inherited by virtio-media.
> AFAIU V4L2 developers agree there is room for enhancement here, see [1],
> [2]. Also I've been told VIDIOC_G_EXT_CTRLS/VIDIOC_S_EXT_CTRLS were
> added for similar reasons.
>
>  From the point of view of virtualization developers like my colleagues
> and me hundreds of hypervisor "exits" are excessive and costly. It can
> noticeably increase boot times, which is something we fight against in
> automotive. AFAIU other virtio developers agree with this, see [3].


> In contrast virtio-video has been doing this in one command from day
> one. Yes, the data was incomplete. That's why in draft v9 I added TLV as
> a way to store all possible capabilities. I hope the linux-media folks
> could take a look on it. Maybe this is something, that can be adopted in
> V4L2?


> 2. virtio-media has a hard dependency on V4L2
>
> There are certainly some "patches" on top of V4L2 in virtio-media, like
> the representation of the extended controls (which actually looks
> similar to the representation of the controls in virtio-video) or
> VIRTIO_MEDIA_EVT_DQBUF. But how far can this go? Is it OK to add your
> own ioctl ids in virtio-media?
>
> AFAIK the linux-media maintainers have been overloaded for years, see
> [4]. Would they be happy to deal with the additional requirements? Would
> virtio community like to have a dependency here?
>
> 2.1. an example: format modifiers
>
> There is a patchset aiming at unifying V4L2 pixel formats and extending
> them with DRM format modifiers. It is now at version 7 submitted in
> 2023, see [5]. The first version was submitted in 2019, see [6]. Not
> merged yet AFAIK.
>
> In virtio-video I just added them in draft v9.
>
> I'm absolutely not trying to criticize here. I just try to highlight
> that there is a lot of legacy and the process is painful. Right now we
> have an opportunity to design a new API according to the current state
> of the art of the stateful codecs.
>
> 3. uncertainty with cameras
>
> AFAIK there is still no agreement about how cameras should be
> virtualized, see [3], [7], [8], [9]. virtio-media provides support for
> cameras in a specific way, which might not be desirable.
>
> 4. (minor) is it possible/hard to implement the device in hardware/on a
> micro controller?
>
> This is something I thought about recently, there might be a use-case
> for it in the future. One of the concerns is that dynamic memory
> allocations are IMHO inevitable in virtio-media or virtio-video up to
> draft v8. I think multiple virtqueues in virtio-video draft v9 would
> help here. Not sure yet...
>
> There are also other minor concerns, that are probably tolerable.
>
> [1]
>
> https://lore.kernel.org/linux-media/20230922100303.GF19112@pendragon.idea=
sonboard.com/
> [2] Page 6 in
>
> https://hverkuil.home.xs4all.nl/mediasummit2023-pdfs/Hsia-Jun%20Li%20-%20=
V4L2%20M2M%20EXT%20API%20enhancement.pdf
> [3] https://old.linaro.org/blog/the-challenges-of-abstracting-virtio/
> [4]
>
> https://lore.kernel.org/linux-media/4b6b1355-9baa-ff1e-e1c0-89dfdc83ad04@=
xs4all.nl/
> [5]
>
> https://lore.kernel.org/linux-media/20230206043308.28365-2-ayaka@soulik.i=
nfo/
> [6]
>
> https://lore.kernel.org/linux-media/20190319145243.25047-1-boris.brezillo=
n@collabora.com/
> [7] https://lore.kernel.org/virtio-dev/87354dtp30.fsf@linaro.org/
> [8]
>
> https://lore.kernel.org/linux-media/00f53c06-e66d-aa46-ca4f-c3baab6cf455@=
xs4all.nl/
> [9]
>
> https://lore.kernel.org/virtio-dev/CAAFQd5BrhDZtFX3vdhBVSLXthe8CykYsZzVQ9=
ddZxVNvNS3ArA@mail.gmail.com/
>
>
As I mentioned in the previous drop of the specs, I prefer not to
re-open the debate video vs media. Most of the points raised here
were already discussed previously, and yet it led nowhere as there
was not real agreement.

Personally, I think there are big advantages relying on a well established
API
and lessons learned from v4l2, and using them for virtualizing a video
device. That allowed to produce code for the driver and a reusable device,
already available in the spec source repository for anyone to try:
https://github.com/chromeos/virtio-media/blob/main/TRY_IT_OUT.md

Also, new devices with new requisites appear, and the V4L2 API is forced to
evolve fast. The virtio-media approach makes the spec less volatile, as it
lets v4l2 do the heavy lifting for adapting.

But really, this is mainly to avoid having virtio-media as a downstream-onl=
y
device. It also opens the spec to feedback from experts, and makes it
more visible. There were already changes from v1 to v2 following the
feedback, and these changes are also already reflected in the available
driver and device implementations.

BR,
Albert.


> --
> Alexander Gordeev
> Senior Software Engineer
>
> OpenSynergy GmbH
> Rotherstr. 20, 10245 Berlin
> www.opensynergy.com
>
>
>

--000000000000a4b1b2061a858187
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr" class=3D"gmail_signature=
"><div dir=3D"ltr"><div class=3D"gmail_attr">Hi Alex, allow me to recover y=
our message to repond.</div><div dir=3D"ltr" class=3D"gmail_attr"><br></div=
><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jun 7, 2024 at 3:29=E2=80=AF=
PM Alexander Gordeev &lt;<a href=3D"mailto:alexander.gordeev@opensynergy.co=
m" target=3D"_blank">alexander.gordeev@opensynergy.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Albert,<br><br></b=
lockquote><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
"><br>I&#39;d like to add some general considerations:<br><br>1. virtio-med=
ia device capability discovery is very chatty<br><br>V4L2 requires potentia=
lly hundreds of system calls to get the full view<br>of the device capabili=
ties. This is inherited by virtio-media.<br>AFAIU V4L2 developers agree the=
re is room for enhancement here, see [1],<br>[2]. Also I&#39;ve been told V=
IDIOC_G_EXT_CTRLS/VIDIOC_S_EXT_CTRLS were<br>added for similar reasons.<br>=
<br>=C2=A0From the point of view of virtualization developers like my colle=
agues<br>and me hundreds of hypervisor &quot;exits&quot; are excessive and =
costly. It can<br>noticeably increase boot times, which is something we fig=
ht against in<br>automotive. AFAIU other virtio developers agree with this,=
 see [3].=C2=A0</blockquote><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x"><br>In contrast virtio-video has been doing this in one command from day=
<br>one. Yes, the data was incomplete. That&#39;s why in draft v9 I added T=
LV as<br>a way to store all possible capabilities. I hope the linux-media f=
olks<br>could take a look on it. Maybe this is something, that can be adopt=
ed in<br>V4L2?</blockquote><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
"><br>2. virtio-media has a hard dependency on V4L2<br><br>There are certai=
nly some &quot;patches&quot; on top of V4L2 in virtio-media, like<br>the re=
presentation of the extended controls (which actually looks<br>similar to t=
he representation of the controls in virtio-video) or<br>VIRTIO_MEDIA_EVT_D=
QBUF. But how far can this go? Is it OK to add your<br>own ioctl ids in vir=
tio-media?<br><br>AFAIK the linux-media maintainers have been overloaded fo=
r years, see<br>[4]. Would they be happy to deal with the additional requir=
ements? Would<br>virtio community like to have a dependency here?<br><br>2.=
1. an example: format modifiers<br><br>There is a patchset aiming at unifyi=
ng V4L2 pixel formats and extending<br>them with DRM format modifiers. It i=
s now at version 7 submitted in<br>2023, see [5]. The first version was sub=
mitted in 2019, see [6]. Not<br>merged yet AFAIK.<br><br>In virtio-video I =
just added them in draft v9.<br><br>I&#39;m absolutely not trying to critic=
ize here. I just try to highlight<br>that there is a lot of legacy and the =
process is painful. Right now we<br>have an opportunity to design a new API=
 according to the current state<br>of the art of the stateful codecs.<br><b=
r>3. uncertainty with cameras<br><br>AFAIK there is still no agreement abou=
t how cameras should be<br>virtualized, see [3], [7], [8], [9]. virtio-medi=
a provides support for<br>cameras in a specific way, which might not be des=
irable.<br><br>4. (minor) is it possible/hard to implement the device in ha=
rdware/on a<br>micro controller?<br><br>This is something I thought about r=
ecently, there might be a use-case<br>for it in the future. One of the conc=
erns is that dynamic memory<br>allocations are IMHO inevitable in virtio-me=
dia or virtio-video up to<br>draft v8. I think multiple virtqueues in virti=
o-video draft v9 would<br>help here. Not sure yet...<br><br>There are also =
other minor concerns, that are probably tolerable.<br><br>[1]<br><a href=3D=
"https://lore.kernel.org/linux-media/20230922100303.GF19112@pendragon.ideas=
onboard.com/" rel=3D"noreferrer" target=3D"_blank">https://lore.kernel.org/=
linux-media/20230922100303.GF19112@pendragon.ideasonboard.com/</a><br>[2] P=
age 6 in<br><a href=3D"https://hverkuil.home.xs4all.nl/mediasummit2023-pdfs=
/Hsia-Jun%20Li%20-%20V4L2%20M2M%20EXT%20API%20enhancement.pdf" rel=3D"noref=
errer" target=3D"_blank">https://hverkuil.home.xs4all.nl/mediasummit2023-pd=
fs/Hsia-Jun%20Li%20-%20V4L2%20M2M%20EXT%20API%20enhancement.pdf</a><br>[3]=
=C2=A0<a href=3D"https://old.linaro.org/blog/the-challenges-of-abstracting-=
virtio/" rel=3D"noreferrer" target=3D"_blank">https://old.linaro.org/blog/t=
he-challenges-of-abstracting-virtio/</a><br>[4]<br><a href=3D"https://lore.=
kernel.org/linux-media/4b6b1355-9baa-ff1e-e1c0-89dfdc83ad04@xs4all.nl/" rel=
=3D"noreferrer" target=3D"_blank">https://lore.kernel.org/linux-media/4b6b1=
355-9baa-ff1e-e1c0-89dfdc83ad04@xs4all.nl/</a><br>[5]<br><a href=3D"https:/=
/lore.kernel.org/linux-media/20230206043308.28365-2-ayaka@soulik.info/" rel=
=3D"noreferrer" target=3D"_blank">https://lore.kernel.org/linux-media/20230=
206043308.28365-2-ayaka@soulik.info/</a><br>[6]<br><a href=3D"https://lore.=
kernel.org/linux-media/20190319145243.25047-1-boris.brezillon@collabora.com=
/" rel=3D"noreferrer" target=3D"_blank">https://lore.kernel.org/linux-media=
/20190319145243.25047-1-boris.brezillon@collabora.com/</a><br>[7]=C2=A0<a h=
ref=3D"https://lore.kernel.org/virtio-dev/87354dtp30.fsf@linaro.org/" rel=
=3D"noreferrer" target=3D"_blank">https://lore.kernel.org/virtio-dev/87354d=
tp30.fsf@linaro.org/</a><br>[8]<br><a href=3D"https://lore.kernel.org/linux=
-media/00f53c06-e66d-aa46-ca4f-c3baab6cf455@xs4all.nl/" rel=3D"noreferrer" =
target=3D"_blank">https://lore.kernel.org/linux-media/00f53c06-e66d-aa46-ca=
4f-c3baab6cf455@xs4all.nl/</a><br>[9]<br><a href=3D"https://lore.kernel.org=
/virtio-dev/CAAFQd5BrhDZtFX3vdhBVSLXthe8CykYsZzVQ9ddZxVNvNS3ArA@mail.gmail.=
com/" rel=3D"noreferrer" target=3D"_blank">https://lore.kernel.org/virtio-d=
ev/CAAFQd5BrhDZtFX3vdhBVSLXthe8CykYsZzVQ9ddZxVNvNS3ArA@mail.gmail.com/</a><=
br><br></blockquote><div><br></div><div>As I mentioned in the previous drop=
 of the specs, I prefer not to<br>re-open the debate video vs media. Most o=
f the points raised here<br>were already discussed previously, and yet it l=
ed nowhere as there<br>was not real agreement.<br><br>Personally, I think t=
here are big advantages relying on a well established API<br>and lessons le=
arned from v4l2, and using them for virtualizing a video<br>device. That al=
lowed to produce code for the driver and a reusable device,<br>already avai=
lable in the spec source repository for anyone to try:=C2=A0</div><div><a h=
ref=3D"https://github.com/chromeos/virtio-media/blob/main/TRY_IT_OUT.md" ta=
rget=3D"_blank">https://github.com/chromeos/virtio-media/blob/main/TRY_IT_O=
UT.md</a></div><div><br>Also, new devices with new requisites appear, and t=
he V4L2 API is forced to<br>evolve fast. The virtio-media approach makes th=
e spec less volatile, as it<br>lets v4l2 do the heavy lifting for adapting.=
<br><br>But really, this is mainly to avoid having virtio-media as a downst=
ream-only<br>device. It also opens the spec to feedback from experts, and m=
akes it<br></div><div>more visible. There were already changes from v1 to v=
2 following the</div><div>feedback, and these changes are also already refl=
ected in the available</div><div>driver and device implementations.</div><d=
iv><br></div><div>BR,</div><div>Albert.</div><div>=C2=A0</div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">--<br>Alexander Gordeev<br>Senior Soft=
ware Engineer<br><br>OpenSynergy GmbH<br>Rotherstr. 20, 10245 Berlin<br><a =
href=3D"http://www.opensynergy.com/" rel=3D"noreferrer" target=3D"_blank">w=
ww.opensynergy.com<br></a><br></blockquote></div></div></div><div class=3D"=
gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
</blockquote></div></div>

--000000000000a4b1b2061a858187--

