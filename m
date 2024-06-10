Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0199F7441A
	for <virtio-comment@lists.linux.dev>; Mon, 10 Jun 2024 09:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718011481; cv=none; b=X6qPXfr/Pzy7eLCYLeTuVkak+m3+VrdTiobAm6LONB35pBZIatS5oJNIxlWDdrLWEdHM+H2EqfKmXSyU9jH+YBZkmp+yI6Bzsss1XNxq7/nL8NPbTD3ZgfJBJpiK2unzc4uM5sedRVpTXqEPDOEspfQcSzc+6sQiyEHoFytdB4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718011481; c=relaxed/simple;
	bh=wG2fkdYf7Fic5DL2Y1aMlk9zd8pbi4Q13EaRbNm+uDc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YK078nTgE9gs6z0tVa3LKHcduPctYIk/nnDxTqu8fDPn5GVS3mU0SHC6BngezLcksdUGCcV9gREnhTS5meBdWWiaxJRsmijcPbiqkUNMIOiQHpwxhRRBLKXxDU42yT2bTZMv7prmasxwMnk7YWQE5LW4DN70/AoEDDTx+WYsUkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KWxIgpgX; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KWxIgpgX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718011479;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=W61Bw2A1eyxnp/wIDr2wWNLB5mbHyUmGfo3EquHuKw4=;
	b=KWxIgpgXssHKypwf3IPJKuzy5sdoqP/90MRV6Kim6sMkyUcY6a5IWPIBNoNOt0U8BguMDJ
	IHLUEbVRuGRCCO+3dK8T9JZoqNjTBj5SSnvQR69y2z4nBQzLNpUeO/ZSWGID1Omu6V7JMv
	ph7AeEOniDP/xtlMqc+DdK84N6CiYUI=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-455-S9PK950oP4OWhRftxu7twA-1; Mon, 10 Jun 2024 05:24:36 -0400
X-MC-Unique: S9PK950oP4OWhRftxu7twA-1
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-1f310201aefso20217675ad.3
        for <virtio-comment@lists.linux.dev>; Mon, 10 Jun 2024 02:24:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718011475; x=1718616275;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W61Bw2A1eyxnp/wIDr2wWNLB5mbHyUmGfo3EquHuKw4=;
        b=hRCXXSay3oZNMzuIuldd/lD7O2mMft0t0gyo8n0v7SCi6xOqCbUpOA6/Bbif2gSryK
         N9P5bNfCgN2FgkG8geKElDwuqF4lCPMw4S+RWVGrWGE46x4zSV7lgLUn2ml/UyKEDlBb
         K5OVsn9PoP1xzOnP/zBmmkXsgWb/i+OEx3/vUTOAPHehCXSwjsKYu95JubFzUbLdYFm0
         CBhrR/NWbYXToJA9l0gXK2s5UcpmeUZTzQ8iTcSdO0vfXMDlTxI5kAldoXiBuf5D5frf
         ETPugM8Dm8w6J023oAx8RDVANuOWg2iAAFQ7XNKnFaqIuZhh5+FjGsOE6nFk/fSfGUWy
         +c3A==
X-Gm-Message-State: AOJu0Yx/yHBfqRuwMu/b5A6SLr3sUfnJ+IFgR21j3nX2B4WsdeZioNOA
	jB3FMddiP+IdG9EsQC+zYEy41kMV6v4I4Q6OCrRQvuuw7/7J6wd9vD9XW6+nHO517H4+G/EDZ6g
	6C6OTjxhrkXr72F9Dm+uSW9a7URuua+W0A4MdAwt9RrPnnxyJiWDqttX4I937UZMqRKeOjlwl/c
	mKa2bMmft5TZ+hsFOXqYlrAdvYMBAGMzOUvhOeqrF5fayE9Yoqsg==
X-Received: by 2002:a05:6a21:329c:b0:1af:4faf:e4a8 with SMTP id adf61e73a8af0-1b2f9a5f4d8mr9119924637.33.1718011474611;
        Mon, 10 Jun 2024 02:24:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHvq0rCFkFw1h9OQ0v8opDTbzNpYFClDFgOHahF3GxaPMD7zT5qCVbhAN4ctpM2uY43DL9ugIPk6vQo1Lru/v8=
X-Received: by 2002:a05:6a21:329c:b0:1af:4faf:e4a8 with SMTP id
 adf61e73a8af0-1b2f9a5f4d8mr9119914637.33.1718011474151; Mon, 10 Jun 2024
 02:24:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240607133508.1400529-1-aesteve@redhat.com> <CADSE00K5RjuLY1UKfPiAMXv=HWJC3hdp9yvo_t7yr9HqhAVotw@mail.gmail.com>
In-Reply-To: <CADSE00K5RjuLY1UKfPiAMXv=HWJC3hdp9yvo_t7yr9HqhAVotw@mail.gmail.com>
From: Albert Esteve <aesteve@redhat.com>
Date: Mon, 10 Jun 2024 11:24:22 +0200
Message-ID: <CADSE00Kcc-uVKYkNT-LHX3kQwmhQNLgKp8FRMrWz0hWg+e_c8g@mail.gmail.com>
Subject: Re: [PATCH v2 0/1] virtio-media: Add device specification
To: virtio-comment@lists.linux.dev
Cc: changyeon@google.com, eballetb@redhat.com, daniel.almeida@collabora.com, 
	Alexander.Gordeev@opensynergy.com, ribalda@google.com, acourbot@chromium.org, 
	mst@redhat.com, gurchetansingh@google.com, Matti.Moell@opensynergy.com, 
	cohuck@redhat.com, nicolas.dufresne@collabora.com, alex.bennee@linaro.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000a3211e061a85b7de"

--000000000000a3211e061a85b7de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 10, 2024 at 11:09=E2=80=AFAM Albert Esteve <aesteve@redhat.com>=
 wrote:

> Hi Alex, allow me to recover your message to repond.
>
> On Fri, Jun 7, 2024 at 3:29=E2=80=AFPM Alexander Gordeev <
> alexander.gordeev@opensynergy.com> wrote:
>
>> Hi Albert,
>>
>>
>
>>
>> I'd like to add some general considerations:
>>
>> 1. virtio-media device capability discovery is very chatty
>>
>> V4L2 requires potentially hundreds of system calls to get the full view
>> of the device capabilities. This is inherited by virtio-media.
>> AFAIU V4L2 developers agree there is room for enhancement here, see [1],
>> [2]. Also I've been told VIDIOC_G_EXT_CTRLS/VIDIOC_S_EXT_CTRLS were
>> added for similar reasons.
>>
>>  From the point of view of virtualization developers like my colleagues
>> and me hundreds of hypervisor "exits" are excessive and costly. It can
>> noticeably increase boot times, which is something we fight against in
>> automotive. AFAIU other virtio developers agree with this, see [3].
>
>
>> In contrast virtio-video has been doing this in one command from day
>> one. Yes, the data was incomplete. That's why in draft v9 I added TLV as
>> a way to store all possible capabilities. I hope the linux-media folks
>> could take a look on it. Maybe this is something, that can be adopted in
>> V4L2?
>
>
>> 2. virtio-media has a hard dependency on V4L2
>>
>> There are certainly some "patches" on top of V4L2 in virtio-media, like
>> the representation of the extended controls (which actually looks
>> similar to the representation of the controls in virtio-video) or
>> VIRTIO_MEDIA_EVT_DQBUF. But how far can this go? Is it OK to add your
>> own ioctl ids in virtio-media?
>>
>> AFAIK the linux-media maintainers have been overloaded for years, see
>> [4]. Would they be happy to deal with the additional requirements? Would
>> virtio community like to have a dependency here?
>>
>> 2.1. an example: format modifiers
>>
>> There is a patchset aiming at unifying V4L2 pixel formats and extending
>> them with DRM format modifiers. It is now at version 7 submitted in
>> 2023, see [5]. The first version was submitted in 2019, see [6]. Not
>> merged yet AFAIK.
>>
>> In virtio-video I just added them in draft v9.
>>
>> I'm absolutely not trying to criticize here. I just try to highlight
>> that there is a lot of legacy and the process is painful. Right now we
>> have an opportunity to design a new API according to the current state
>> of the art of the stateful codecs.
>>
>> 3. uncertainty with cameras
>>
>> AFAIK there is still no agreement about how cameras should be
>> virtualized, see [3], [7], [8], [9]. virtio-media provides support for
>> cameras in a specific way, which might not be desirable.
>>
>> 4. (minor) is it possible/hard to implement the device in hardware/on a
>> micro controller?
>>
>> This is something I thought about recently, there might be a use-case
>> for it in the future. One of the concerns is that dynamic memory
>> allocations are IMHO inevitable in virtio-media or virtio-video up to
>> draft v8. I think multiple virtqueues in virtio-video draft v9 would
>> help here. Not sure yet...
>>
>> There are also other minor concerns, that are probably tolerable.
>>
>> [1]
>>
>> https://lore.kernel.org/linux-media/20230922100303.GF19112@pendragon.ide=
asonboard.com/
>> [2] Page 6 in
>>
>> https://hverkuil.home.xs4all.nl/mediasummit2023-pdfs/Hsia-Jun%20Li%20-%2=
0V4L2%20M2M%20EXT%20API%20enhancement.pdf
>> [3] https://old.linaro.org/blog/the-challenges-of-abstracting-virtio/
>> [4]
>>
>> https://lore.kernel.org/linux-media/4b6b1355-9baa-ff1e-e1c0-89dfdc83ad04=
@xs4all.nl/
>> [5]
>>
>> https://lore.kernel.org/linux-media/20230206043308.28365-2-ayaka@soulik.=
info/
>> [6]
>>
>> https://lore.kernel.org/linux-media/20190319145243.25047-1-boris.brezill=
on@collabora.com/
>> [7] https://lore.kernel.org/virtio-dev/87354dtp30.fsf@linaro.org/
>> [8]
>>
>> https://lore.kernel.org/linux-media/00f53c06-e66d-aa46-ca4f-c3baab6cf455=
@xs4all.nl/
>> [9]
>>
>> https://lore.kernel.org/virtio-dev/CAAFQd5BrhDZtFX3vdhBVSLXthe8CykYsZzVQ=
9ddZxVNvNS3ArA@mail.gmail.com/
>>
>>
> As I mentioned in the previous drop of the specs, I prefer not to
> re-open the debate video vs media. Most of the points raised here
> were already discussed previously, and yet it led nowhere as there
> was not real agreement.
>
> Personally, I think there are big advantages relying on a well establishe=
d
> API
> and lessons learned from v4l2, and using them for virtualizing a video
> device. That allowed to produce code for the driver and a reusable device=
,
> already available in the spec source repository for anyone to try:
> https://github.com/chromeos/virtio-media/blob/main/TRY_IT_OUT.md
>
> Also, new devices with new requisites appear, and the V4L2 API is forced =
to
> evolve fast. The virtio-media approach makes the spec less volatile, as i=
t
> lets v4l2 do the heavy lifting for adapting.
>
> But really, this is mainly to avoid having virtio-media as a
> downstream-only
> device. It also opens the spec to feedback from experts, and makes it
> more visible. There were already changes from v1 to v2 following the
> feedback, and these changes are also already reflected in the available
> driver and device implementations.
>
> BR,
> Albert.
>

Just saw Alex Courbot's point-per-point response in the previous thread.
I'll link it here, as I'd prefer to move the discussion:
https://lore.kernel.org/all/CAPBb6MW36YaZFaWgksePQ=3DfMC7QffJD6ZpHN-iSzhLYp=
9Ho0sg@mail.gmail.com/

Again, sorry for the confusion.


>
>
>> --
>> Alexander Gordeev
>> Senior Software Engineer
>>
>> OpenSynergy GmbH
>> Rotherstr. 20, 10245 Berlin
>> www.opensynergy.com
>>
>>
>>

--000000000000a3211e061a85b7de
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jun 10, 2024 at 11:09=E2=80=
=AFAM Albert Esteve &lt;<a href=3D"mailto:aesteve@redhat.com">aesteve@redha=
t.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr" class=3D"gmail_sign=
ature"><div dir=3D"ltr"><div class=3D"gmail_attr">Hi Alex, allow me to reco=
ver your message to repond.</div><div dir=3D"ltr" class=3D"gmail_attr"><br>=
</div><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jun 7, 2024 at 3:29=E2=
=80=AFPM Alexander Gordeev &lt;<a href=3D"mailto:alexander.gordeev@opensyne=
rgy.com" target=3D"_blank">alexander.gordeev@opensynergy.com</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Albert,<br><=
br></blockquote><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex"><br>I&#39;d like to add some general considerations:<br><br>1. virt=
io-media device capability discovery is very chatty<br><br>V4L2 requires po=
tentially hundreds of system calls to get the full view<br>of the device ca=
pabilities. This is inherited by virtio-media.<br>AFAIU V4L2 developers agr=
ee there is room for enhancement here, see [1],<br>[2]. Also I&#39;ve been =
told VIDIOC_G_EXT_CTRLS/VIDIOC_S_EXT_CTRLS were<br>added for similar reason=
s.<br><br>=C2=A0From the point of view of virtualization developers like my=
 colleagues<br>and me hundreds of hypervisor &quot;exits&quot; are excessiv=
e and costly. It can<br>noticeably increase boot times, which is something =
we fight against in<br>automotive. AFAIU other virtio developers agree with=
 this, see [3].=C2=A0</blockquote><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><br>In contrast virtio-video has been doing this in one command =
from day<br>one. Yes, the data was incomplete. That&#39;s why in draft v9 I=
 added TLV as<br>a way to store all possible capabilities. I hope the linux=
-media folks<br>could take a look on it. Maybe this is something, that can =
be adopted in<br>V4L2?</blockquote><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><br>2. virtio-media has a hard dependency on V4L2<br><br>There a=
re certainly some &quot;patches&quot; on top of V4L2 in virtio-media, like<=
br>the representation of the extended controls (which actually looks<br>sim=
ilar to the representation of the controls in virtio-video) or<br>VIRTIO_ME=
DIA_EVT_DQBUF. But how far can this go? Is it OK to add your<br>own ioctl i=
ds in virtio-media?<br><br>AFAIK the linux-media maintainers have been over=
loaded for years, see<br>[4]. Would they be happy to deal with the addition=
al requirements? Would<br>virtio community like to have a dependency here?<=
br><br>2.1. an example: format modifiers<br><br>There is a patchset aiming =
at unifying V4L2 pixel formats and extending<br>them with DRM format modifi=
ers. It is now at version 7 submitted in<br>2023, see [5]. The first versio=
n was submitted in 2019, see [6]. Not<br>merged yet AFAIK.<br><br>In virtio=
-video I just added them in draft v9.<br><br>I&#39;m absolutely not trying =
to criticize here. I just try to highlight<br>that there is a lot of legacy=
 and the process is painful. Right now we<br>have an opportunity to design =
a new API according to the current state<br>of the art of the stateful code=
cs.<br><br>3. uncertainty with cameras<br><br>AFAIK there is still no agree=
ment about how cameras should be<br>virtualized, see [3], [7], [8], [9]. vi=
rtio-media provides support for<br>cameras in a specific way, which might n=
ot be desirable.<br><br>4. (minor) is it possible/hard to implement the dev=
ice in hardware/on a<br>micro controller?<br><br>This is something I though=
t about recently, there might be a use-case<br>for it in the future. One of=
 the concerns is that dynamic memory<br>allocations are IMHO inevitable in =
virtio-media or virtio-video up to<br>draft v8. I think multiple virtqueues=
 in virtio-video draft v9 would<br>help here. Not sure yet...<br><br>There =
are also other minor concerns, that are probably tolerable.<br><br>[1]<br><=
a href=3D"https://lore.kernel.org/linux-media/20230922100303.GF19112@pendra=
gon.ideasonboard.com/" rel=3D"noreferrer" target=3D"_blank">https://lore.ke=
rnel.org/linux-media/20230922100303.GF19112@pendragon.ideasonboard.com/</a>=
<br>[2] Page 6 in<br><a href=3D"https://hverkuil.home.xs4all.nl/mediasummit=
2023-pdfs/Hsia-Jun%20Li%20-%20V4L2%20M2M%20EXT%20API%20enhancement.pdf" rel=
=3D"noreferrer" target=3D"_blank">https://hverkuil.home.xs4all.nl/mediasumm=
it2023-pdfs/Hsia-Jun%20Li%20-%20V4L2%20M2M%20EXT%20API%20enhancement.pdf</a=
><br>[3]=C2=A0<a href=3D"https://old.linaro.org/blog/the-challenges-of-abst=
racting-virtio/" rel=3D"noreferrer" target=3D"_blank">https://old.linaro.or=
g/blog/the-challenges-of-abstracting-virtio/</a><br>[4]<br><a href=3D"https=
://lore.kernel.org/linux-media/4b6b1355-9baa-ff1e-e1c0-89dfdc83ad04@xs4all.=
nl/" rel=3D"noreferrer" target=3D"_blank">https://lore.kernel.org/linux-med=
ia/4b6b1355-9baa-ff1e-e1c0-89dfdc83ad04@xs4all.nl/</a><br>[5]<br><a href=3D=
"https://lore.kernel.org/linux-media/20230206043308.28365-2-ayaka@soulik.in=
fo/" rel=3D"noreferrer" target=3D"_blank">https://lore.kernel.org/linux-med=
ia/20230206043308.28365-2-ayaka@soulik.info/</a><br>[6]<br><a href=3D"https=
://lore.kernel.org/linux-media/20190319145243.25047-1-boris.brezillon@colla=
bora.com/" rel=3D"noreferrer" target=3D"_blank">https://lore.kernel.org/lin=
ux-media/20190319145243.25047-1-boris.brezillon@collabora.com/</a><br>[7]=
=C2=A0<a href=3D"https://lore.kernel.org/virtio-dev/87354dtp30.fsf@linaro.o=
rg/" rel=3D"noreferrer" target=3D"_blank">https://lore.kernel.org/virtio-de=
v/87354dtp30.fsf@linaro.org/</a><br>[8]<br><a href=3D"https://lore.kernel.o=
rg/linux-media/00f53c06-e66d-aa46-ca4f-c3baab6cf455@xs4all.nl/" rel=3D"nore=
ferrer" target=3D"_blank">https://lore.kernel.org/linux-media/00f53c06-e66d=
-aa46-ca4f-c3baab6cf455@xs4all.nl/</a><br>[9]<br><a href=3D"https://lore.ke=
rnel.org/virtio-dev/CAAFQd5BrhDZtFX3vdhBVSLXthe8CykYsZzVQ9ddZxVNvNS3ArA@mai=
l.gmail.com/" rel=3D"noreferrer" target=3D"_blank">https://lore.kernel.org/=
virtio-dev/CAAFQd5BrhDZtFX3vdhBVSLXthe8CykYsZzVQ9ddZxVNvNS3ArA@mail.gmail.c=
om/</a><br><br></blockquote><div><br></div><div>As I mentioned in the previ=
ous drop of the specs, I prefer not to<br>re-open the debate video vs media=
. Most of the points raised here<br>were already discussed previously, and =
yet it led nowhere as there<br>was not real agreement.<br><br>Personally, I=
 think there are big advantages relying on a well established API<br>and le=
ssons learned from v4l2, and using them for virtualizing a video<br>device.=
 That allowed to produce code for the driver and a reusable device,<br>alre=
ady available in the spec source repository for anyone to try:=C2=A0</div><=
div><a href=3D"https://github.com/chromeos/virtio-media/blob/main/TRY_IT_OU=
T.md" target=3D"_blank">https://github.com/chromeos/virtio-media/blob/main/=
TRY_IT_OUT.md</a></div><div><br>Also, new devices with new requisites appea=
r, and the V4L2 API is forced to<br>evolve fast. The virtio-media approach =
makes the spec less volatile, as it<br>lets v4l2 do the heavy lifting for a=
dapting.<br><br>But really, this is mainly to avoid having virtio-media as =
a downstream-only<br>device. It also opens the spec to feedback from expert=
s, and makes it<br></div><div>more visible. There were already changes from=
 v1 to v2 following the</div><div>feedback, and these changes are also alre=
ady reflected in the available</div><div>driver and device implementations.=
</div><div><br></div><div>BR,</div><div>Albert.</div></div></div></div></di=
v></blockquote><div><br></div><div>Just saw Alex Courbot&#39;s point-per-po=
int response in the previous thread.</div><div>I&#39;ll link it here, as I&=
#39;d prefer to move the discussion:</div><div><a href=3D"https://lore.kern=
el.org/all/CAPBb6MW36YaZFaWgksePQ=3DfMC7QffJD6ZpHN-iSzhLYp9Ho0sg@mail.gmail=
.com/">https://lore.kernel.org/all/CAPBb6MW36YaZFaWgksePQ=3DfMC7QffJD6ZpHN-=
iSzhLYp9Ho0sg@mail.gmail.com/</a><br></div><div><br></div><div>Again, sorry=
 for the confusion.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr" class=
=3D"gmail_signature"><div dir=3D"ltr"><div>=C2=A0</div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">--<br>Alexander Gordeev<br>Senior Software En=
gineer<br><br>OpenSynergy GmbH<br>Rotherstr. 20, 10245 Berlin<br><a href=3D=
"http://www.opensynergy.com/" rel=3D"noreferrer" target=3D"_blank">www.open=
synergy.com<br></a><br></blockquote></div></div></div><div class=3D"gmail_q=
uote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
</blockquote></div></div>
</blockquote></div></div>

--000000000000a3211e061a85b7de--

