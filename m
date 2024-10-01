Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE9BF19CC0A
	for <virtio-comment@lists.linux.dev>; Tue,  1 Oct 2024 09:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727773670; cv=none; b=AJI2A4Axacs80KAkW3kMLUWywswxEfiUGb3yWdsYMziNtsDpmnFrt47gXJ16IVHuZozNhcvM/dSpHC+or/MpCaGBx1e6gSHGZP9AsctihsBtQ96JRHZXaQq6yj/xtItTQyT/B8p3UnzSBlRzRGxW0M+s+RIdzFqZi5pbV7KO2nU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727773670; c=relaxed/simple;
	bh=fkB4haNEB/2AQssvcQGcq5SH0uErDyIgBca+yJNKzKY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aU5LebE15Kgl2PN/m5ZtFRzO343n77cZAUGwwU67uxZpSRCynU1bXa3tbwDUEhjDs9hEnEVPU6M0ALdTG1A+Psb7Z/ea7U3IzvsAEz9G/8B146VGZEoImWLERyFxOfRe5xznvh/qS/VtuRhY1FhoAJFEbLtNVhdzM6Ozkyh8jps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HPWH1rTt; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HPWH1rTt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727773667;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Y3LVUgtXkSgVcoqC3disGrP+K2MUIDCtKv5zC/BDltU=;
	b=HPWH1rTtLlNsOcnd6Vg3+T968o+U87JT1r2YDFTjWGm+RPywL/8uU4YXjlS1G8qOq9XBK4
	c6wCSmUTqS9NXv/dvb7grPWJdYy6Ls65o8SAsuKIxa/lqEQkppvCnaJF8jeqCHjxQkv58b
	tG36f8hGVWbvffibK7RBl/Gj5OLJxMY=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-208-FM2eg3TyNgewS6kTbVvTIA-1; Tue, 01 Oct 2024 05:07:46 -0400
X-MC-Unique: FM2eg3TyNgewS6kTbVvTIA-1
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-50806e7ef72so883188e0c.1
        for <virtio-comment@lists.linux.dev>; Tue, 01 Oct 2024 02:07:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727773666; x=1728378466;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y3LVUgtXkSgVcoqC3disGrP+K2MUIDCtKv5zC/BDltU=;
        b=RWLrNj0ceEFfqB+JjYtVYI1ktNH7rahZoDpuu8+BSQiZdJmhy2+0VqL8bvX1sxhj87
         Tvq6HsLBFl2tYkrtU6K7MCzm7TdtYWNUlLWLxqrTz3PyQJKe+xkbjwdCCB49WW/7xmVZ
         DDKlSThay1/98MipQIE7g09mowS47oD67wL0Btp6zOFkpR6tfwRUg70l7U55UQA9+ijg
         XNIuUcVWcOsz4KdOykzdn0/LmHdQI1/MB+iugJ7Nb3Lk5ldwSCO+YopbSj5nnawQ7Qr9
         nQUJf6SD6lwv3JSc2ADKShaOSTxkM0gljNgnXP8u3EcDnw1oUkMsnroUF6wbU7J06xfM
         bm5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVEbumkNVv7x1v8poa71C30MZNt+OGI7NWW8W/EV0wlGZiFEl+3lM3Xa8CAPBa3ixjjfwr2xMe2WzGuxzkdEg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxNObyCW/ZMDgxsopwaVFub2HY1NpSXjyLsp2ca1oHIDPZtsj2S
	viUap/ch9SIEEYXq3K1rPBVVPWKUgZ0CC34a7sJQM5unIfOmMjKAThuXS7UMuIb1du4Xz5TxjM0
	1/s/Bd2NxQ0ctmUx9ezngYELbTnTu7AR2IZYisjUe39GM8DMEitZFIWmV+wyzsJnCvhQoD+VG0W
	W0ndNnxAjrLo6BHlk7VabpsjX3iynsOU8eS1J5fYQ=
X-Received: by 2002:a05:6102:3f05:b0:49b:f255:179a with SMTP id ada2fe7eead31-4a2cefda215mr11933657137.5.1727773665873;
        Tue, 01 Oct 2024 02:07:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3ghqTGYoYc+0lNLosFCmaKbMSc9jmHPWdpihzCHR4phh9mLrrvw+EASCS1LQT9muYuP86S3eIv0PE39QjZDc=
X-Received: by 2002:a05:6102:3f05:b0:49b:f255:179a with SMTP id
 ada2fe7eead31-4a2cefda215mr11933648137.5.1727773665523; Tue, 01 Oct 2024
 02:07:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240906070833.1949727-1-aesteve@redhat.com> <CADSE00KO=VZy4_4FfgC7ODON32mZ8khWkPUcXheP6pTiEZAyHA@mail.gmail.com>
 <IA0PR12MB8713CC178EDB984292755C5DDC772@IA0PR12MB8713.namprd12.prod.outlook.com>
 <IA0PR12MB87130D5F5839629436E0A748DC772@IA0PR12MB8713.namprd12.prod.outlook.com>
 <87ikucrysk.fsf@redhat.com>
In-Reply-To: <87ikucrysk.fsf@redhat.com>
From: Albert Esteve <aesteve@redhat.com>
Date: Tue, 1 Oct 2024 11:07:34 +0200
Message-ID: <CADSE00KJCSDBmkyBPXdpkb0X-b=wFickv8XR6AEtgSv4N2ai_g@mail.gmail.com>
Subject: Re: [PATCH v3] content: Reserve ID for media device
To: Cornelia Huck <cohuck@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>, 
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>, 
	"aiswarya.cyriac@opensynergy.com" <aiswarya.cyriac@opensynergy.com>, 
	"acourbot@chromium.org" <acourbot@chromium.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000961117062366a735"

--000000000000961117062366a735
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I really wouldn't mind resending, but given that the voting has started,
not sure if it is worth canceling/changing it now.

But we can perhaps try to move the next device that tries to standardize to
fit in the gap that this patch created.


On Tue, Oct 1, 2024 at 10:51=E2=80=AFAM Cornelia Huck <cohuck@redhat.com> w=
rote:

> On Tue, Oct 01 2024, Parav Pandit <parav@nvidia.com> wrote:
>
> >> From: Parav Pandit <parav@nvidia.com>
> >> Sent: Tuesday, October 1, 2024 1:35 PM
> >> To: Albert Esteve <aesteve@redhat.com>; virtio-comment@lists.linux.dev=
;
> >> aiswarya.cyriac@opensynergy.com
> >> Cc: acourbot@chromium.org
> >> Subject: RE: [PATCH v3] content: Reserve ID for media device
> >>
> >> Hi Albert,
> >>
> >> From: Albert Esteve <aesteve@redhat.com>
> >> Sent: Wednesday, September 25, 2024 12:20 PM
> >>
> >>
> >> On Fri, Sep 6, 2024 at 9:08=E2=80=AFAM Albert Esteve <mailto:aesteve@r=
edhat.com
> >
> >> wrote:
> >> Reserve device ID 49 for media device.
> >> Compatible with video encoder, video decoder,
> >> and capture devices.
> >>
> >> Signed-off-by: Albert Esteve <mailto:aesteve@redhat.com>
> >> ---
> >>  content.tex | 2 ++
> >>  1 file changed, 2 insertions(+)
> >>
> >> diff --git a/content.tex b/content.tex
> >> index 0a62dce..6d6b3d8 100644
> >> --- a/content.tex
> >> +++ b/content.tex
> >> @@ -739,6 +739,8 @@ \chapter{Device Types}\label{sec:Device Types}
> >>  \hline
> >>  45         &   SPI master \\
> >>  \hline
> >> +49         &   Media device \\
> >> +\hline
> >>  \end{tabular}
> >>
> >> The id 48 request was made several months ago in May-24 for usb, no
> further
> >> interest has been shown on it.
> >> Better to avoid holes in the device id assignment.
> >> So id 48 would be better to use for media that has interest.
> >> Added virtio-usb proposer to thread to see if it is still interesting,
> in that case
> >> 49 seems good here.
> >>
> >> Given the voting has started, I am not sure if the real id value
> matters as long
> >> as one of the unique id is reserved.
> >>
> >> And do not prefer to restart the voting for such a small change either
> on my
> >> late observation of this hole.
> >>
> >> I think when the maintainer merges the proposed patch to assign id 48,
> >> should be fine.
> >>
> >> Michael,
> >> Are you ok this way? Or you have better suggestion?
> >>
> >> Aishwarya,
> >> Is virtio-usb still interesting? If so, can you please request for the
> vote? So that
> >> we avoid the hole in device id assignment.
> > I received auto reply from Aishwarya's employer that they are not
> reachable due to acquisition.
> > So not sure if virtio-usb and 48 is still relevant.
>
> OTOH, a gap in the id list doesn't really matter?
>
>

--000000000000961117062366a735
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div dir=3D"ltr" class=3D"gmail_signature" data-smart=
mail=3D"gmail_signature">Hi,</div></div><div dir=3D"ltr" class=3D"gmail_sig=
nature" data-smartmail=3D"gmail_signature"><br></div><div class=3D"gmail_si=
gnature" data-smartmail=3D"gmail_signature">I really wouldn&#39;t mind rese=
nding, but given that the voting has started, not sure if it is worth cance=
ling/changing it now.</div><div class=3D"gmail_signature" data-smartmail=3D=
"gmail_signature"><br></div><div class=3D"gmail_signature" data-smartmail=
=3D"gmail_signature">But we can perhaps try to move the next device that tr=
ies to standardize to fit in the gap that this patch created.</div><br></di=
v><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On T=
ue, Oct 1, 2024 at 10:51=E2=80=AFAM Cornelia Huck &lt;<a href=3D"mailto:coh=
uck@redhat.com">cohuck@redhat.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On Tue, Oct 01 2024, Parav Pandit &lt;<a h=
ref=3D"mailto:parav@nvidia.com" target=3D"_blank">parav@nvidia.com</a>&gt; =
wrote:<br>
<br>
&gt;&gt; From: Parav Pandit &lt;<a href=3D"mailto:parav@nvidia.com" target=
=3D"_blank">parav@nvidia.com</a>&gt;<br>
&gt;&gt; Sent: Tuesday, October 1, 2024 1:35 PM<br>
&gt;&gt; To: Albert Esteve &lt;<a href=3D"mailto:aesteve@redhat.com" target=
=3D"_blank">aesteve@redhat.com</a>&gt;; <a href=3D"mailto:virtio-comment@li=
sts.linux.dev" target=3D"_blank">virtio-comment@lists.linux.dev</a>;<br>
&gt;&gt; <a href=3D"mailto:aiswarya.cyriac@opensynergy.com" target=3D"_blan=
k">aiswarya.cyriac@opensynergy.com</a><br>
&gt;&gt; Cc: <a href=3D"mailto:acourbot@chromium.org" target=3D"_blank">aco=
urbot@chromium.org</a><br>
&gt;&gt; Subject: RE: [PATCH v3] content: Reserve ID for media device<br>
&gt;&gt; <br>
&gt;&gt; Hi Albert,<br>
&gt;&gt; <br>
&gt;&gt; From: Albert Esteve &lt;<a href=3D"mailto:aesteve@redhat.com" targ=
et=3D"_blank">aesteve@redhat.com</a>&gt;<br>
&gt;&gt; Sent: Wednesday, September 25, 2024 12:20 PM<br>
&gt;&gt; <br>
&gt;&gt; <br>
&gt;&gt; On Fri, Sep 6, 2024 at 9:08=E2=80=AFAM Albert Esteve &lt;mailto:<a=
 href=3D"mailto:aesteve@redhat.com" target=3D"_blank">aesteve@redhat.com</a=
>&gt;<br>
&gt;&gt; wrote:<br>
&gt;&gt; Reserve device ID 49 for media device.<br>
&gt;&gt; Compatible with video encoder, video decoder,<br>
&gt;&gt; and capture devices.<br>
&gt;&gt; <br>
&gt;&gt; Signed-off-by: Albert Esteve &lt;mailto:<a href=3D"mailto:aesteve@=
redhat.com" target=3D"_blank">aesteve@redhat.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt; =C2=A0content.tex | 2 ++<br>
&gt;&gt; =C2=A01 file changed, 2 insertions(+)<br>
&gt;&gt; <br>
&gt;&gt; diff --git a/content.tex b/content.tex<br>
&gt;&gt; index 0a62dce..6d6b3d8 100644<br>
&gt;&gt; --- a/content.tex<br>
&gt;&gt; +++ b/content.tex<br>
&gt;&gt; @@ -739,6 +739,8 @@ \chapter{Device Types}\label{sec:Device Types}=
<br>
&gt;&gt; =C2=A0\hline<br>
&gt;&gt; =C2=A045=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;=C2=A0 =C2=A0SPI ma=
ster \\<br>
&gt;&gt; =C2=A0\hline<br>
&gt;&gt; +49=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;=C2=A0 =C2=A0Media devic=
e \\<br>
&gt;&gt; +\hline<br>
&gt;&gt; =C2=A0\end{tabular}<br>
&gt;&gt; <br>
&gt;&gt; The id 48 request was made several months ago in May-24 for usb, n=
o further<br>
&gt;&gt; interest has been shown on it.<br>
&gt;&gt; Better to avoid holes in the device id assignment.<br>
&gt;&gt; So id 48 would be better to use for media that has interest.<br>
&gt;&gt; Added virtio-usb proposer to thread to see if it is still interest=
ing, in that case<br>
&gt;&gt; 49 seems good here.<br>
&gt;&gt; <br>
&gt;&gt; Given the voting has started, I am not sure if the real id value m=
atters as long<br>
&gt;&gt; as one of the unique id is reserved.<br>
&gt;&gt; <br>
&gt;&gt; And do not prefer to restart the voting for such a small change ei=
ther on my<br>
&gt;&gt; late observation of this hole.<br>
&gt;&gt; <br>
&gt;&gt; I think when the maintainer merges the proposed patch to assign id=
 48,<br>
&gt;&gt; should be fine.<br>
&gt;&gt; <br>
&gt;&gt; Michael,<br>
&gt;&gt; Are you ok this way? Or you have better suggestion?<br>
&gt;&gt; <br>
&gt;&gt; Aishwarya,<br>
&gt;&gt; Is virtio-usb still interesting? If so, can you please request for=
 the vote? So that<br>
&gt;&gt; we avoid the hole in device id assignment.<br>
&gt; I received auto reply from Aishwarya&#39;s employer that they are not =
reachable due to acquisition.<br>
&gt; So not sure if virtio-usb and 48 is still relevant.<br>
<br>
OTOH, a gap in the id list doesn&#39;t really matter?<br>
<br>
</blockquote></div>

--000000000000961117062366a735--

