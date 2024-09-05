Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2303A83CC1
	for <virtio-comment@lists.linux.dev>; Thu,  5 Sep 2024 07:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725521167; cv=none; b=FL2N51KoVQRyeDMmefcRv4IrzWVoesAZaPD9fYA8w1dpi2DjMZmeBIvVHDJVfzyDtHUZfe6vZBeuYmc6tLUal99+10eKq1oEtWbBGhkhGvGW/w9uIspYMf62gOA2QGhEyzQAl5dz7C+I3EldOo04x+b5GmLlya4ZrFfZFllljKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725521167; c=relaxed/simple;
	bh=jqm26/3F5c8P3qY30FNJfabDwI5rGKgSLo4sTt50jCU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=nzzQj82cS+eCOMUSdC+Zl4VhW2x0CoqT98WBNmSU8A0m5umpz/W0MHOPycc4GSyzKJthb2yEImE+PzQ+rXr60QXSGvKgPEmGz5MjYASTyO+xEKRONAt76JcYe+vYd3oTl/RFmzYQhduUUEsvKuNE3B5ir2MRvJZOI5wWZrCZJqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GFEYiVEQ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GFEYiVEQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725521164;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fpKqdMpGfywyqDrusdfWJbb5Q3ad4adHi9ua6j3L2Xc=;
	b=GFEYiVEQ6wcCJsR5bUlB7gHU6dNP/2fZhxpqLeoEEvpzrLOEa6PKLY6c/q5K3vThg4EbS2
	eyv6QQhwhZM4p/FNGkT8xPubBQkce91mkF0dt5YNWfG3lzpJGBPUQrvCR7cv2EWuqllMBs
	gBSQUBTATy/0rc0SuPNAoj72S/mYcrE=
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com
 [209.85.160.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-626-3tJYAldSOy63rvCvZP24nQ-1; Thu, 05 Sep 2024 03:26:03 -0400
X-MC-Unique: 3tJYAldSOy63rvCvZP24nQ-1
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-277e6462843so632009fac.1
        for <virtio-comment@lists.linux.dev>; Thu, 05 Sep 2024 00:26:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725521162; x=1726125962;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fpKqdMpGfywyqDrusdfWJbb5Q3ad4adHi9ua6j3L2Xc=;
        b=OgCsyMhvedRFhBymCUTRjI8WWBcHek2qa59OQ+hoInSf8K9WrczhYmAytxG3NWMOb4
         S9O4PH6fD4Nss1k7Q+t2d0fzcNJ4W6uAnO+DDHdeTnACXw8J5X2az99tCTYGR81w/bbc
         vKy5vw55e9Lrye774dpkcIpqqIVlQ/nneLic+hMEQ68lYdOv/MtqB4h/Y+/r7KmfG0z+
         QHhhdHtgeufO+1wbx2ys6noE5UrlLrMIdut7FqE/WcQc7krk5jDOrqcbC0r0jY4Mvphd
         qShq5T5x4kilPzdFi0LcZGyEPPAeETpl5k39We7RYjTZevn9CM9Er0GzKSWgjsDFEKyE
         4YJg==
X-Gm-Message-State: AOJu0Yw9yDLBdususjriNfD6Kx6oW50BKsmR5x1/OO2vGrX8vS0ujZ4Q
	E0drqpWWrTLYE22WaKjxb8P3ZTnGxUSa+Tmii+8jWNje5Q6b5JL9CW0kxxu640IrCVaDtgRn3Ea
	iOrCA4WeJXCmlgnJGge+6WJVCohxPz850QPwFEzQ3oZ6MNRoGloIbgNa5s0BU1NRkCbqseNj6JM
	t5erAmp96J0DMqakVQJhBfMF/W9VJXu4uTgXIMmr7YbyS2DAA7gQ==
X-Received: by 2002:a05:6871:2b10:b0:261:360:746c with SMTP id 586e51a60fabf-277901159fcmr26229738fac.19.1725521162644;
        Thu, 05 Sep 2024 00:26:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFaVLuMMW4ko48Qi+GfZdRwdjPahD7u2Z/6vBws3oLNpnS0rgf5TS+d/SgYZLO17n1SIu3+M/dWv+gBLNRbUhA=
X-Received: by 2002:a05:6871:2b10:b0:261:360:746c with SMTP id
 586e51a60fabf-277901159fcmr26229718fac.19.1725521162316; Thu, 05 Sep 2024
 00:26:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240905070351.1761683-1-aesteve@redhat.com> <CADSE00+fJ_4i0-hj4S2W7E+Jvs4v7LK+zgvLi7yahOA+_i6ztg@mail.gmail.com>
In-Reply-To: <CADSE00+fJ_4i0-hj4S2W7E+Jvs4v7LK+zgvLi7yahOA+_i6ztg@mail.gmail.com>
From: Albert Esteve <aesteve@redhat.com>
Date: Thu, 5 Sep 2024 09:25:50 +0200
Message-ID: <CADSE00KZnmb0+bin1ReBvzFypxOzXzrthNXi=sRKS+x6n9SKrg@mail.gmail.com>
Subject: Re: [PATCH] content: Reserve ID for media device
To: virtio-comment@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000eecac106215a33b5"

--000000000000eecac106215a33b5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Scratch this, I realized that there are issues created for up to ID 48
already.
I'll resend the patch with the ID 49.


On Thu, Sep 5, 2024 at 9:18=E2=80=AFAM Albert Esteve <aesteve@redhat.com> w=
rote:

> Sorry for the spamming virtio-dev, I removed it from CC.
>
> For some reason I still have older settings in my git-publish
> config file. I'll try to fix it for next time.
>
>
> On Thu, Sep 5, 2024 at 9:03=E2=80=AFAM Albert Esteve <aesteve@redhat.com>=
 wrote:
>
>> Reserve device ID 46 for media device.
>> Compatible with video encoder, video decoder,
>> and capture devices.
>>
>> Signed-off-by: Albert Esteve <aesteve@redhat.com>
>> ---
>>  content.tex | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/content.tex b/content.tex
>> index 0a62dce..1bfa755 100644
>> --- a/content.tex
>> +++ b/content.tex
>> @@ -739,6 +739,8 @@ \chapter{Device Types}\label{sec:Device Types}
>>  \hline
>>  45         &   SPI master \\
>>  \hline
>> +46         &   Media device \\
>> +\hline
>>  \end{tabular}
>>
>>  Some of the devices above are unspecified by this document,
>> --
>> 2.45.2
>>
>>

--000000000000eecac106215a33b5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=
=3D"gmail_signature"><div dir=3D"ltr"><div style=3D"color:rgb(0,0,0);font-f=
amily:RedHatText,sans-serif;font-size:medium;margin-top:12px"><span style=
=3D"color:rgb(34,34,34);font-family:Arial,Helvetica,sans-serif;font-size:sm=
all">Scratch this, I realized that there are issues created for up to ID 48=
 already.</span></div><div style=3D"color:rgb(0,0,0);font-family:RedHatText=
,sans-serif;font-size:medium;margin-top:12px"><span style=3D"color:rgb(34,3=
4,34);font-family:Arial,Helvetica,sans-serif;font-size:small">I&#39;ll rese=
nd the patch with the ID 49.</span></div><div style=3D"margin-top:12px"><br=
></div></div></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">On Thu, Sep 5, 2024 at 9:18=E2=80=AFAM Albert Esteve &lt=
;<a href=3D"mailto:aesteve@redhat.com">aesteve@redhat.com</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><=
div><div dir=3D"ltr" class=3D"gmail_signature"><div>Sorry for the spamming =
virtio-dev, I removed it from CC.</div><div><br></div><div>For some reason =
I still have older settings in my git-publish</div><div>config file. I&#39;=
ll try to fix it for next time.</div></div></div><br></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 5, 2024 =
at 9:03=E2=80=AFAM Albert Esteve &lt;<a href=3D"mailto:aesteve@redhat.com" =
target=3D"_blank">aesteve@redhat.com</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">Reserve device ID 46 for media device.<=
br>
Compatible with video encoder, video decoder,<br>
and capture devices.<br>
<br>
Signed-off-by: Albert Esteve &lt;<a href=3D"mailto:aesteve@redhat.com" targ=
et=3D"_blank">aesteve@redhat.com</a>&gt;<br>
---<br>
=C2=A0content.tex | 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/content.tex b/content.tex<br>
index 0a62dce..1bfa755 100644<br>
--- a/content.tex<br>
+++ b/content.tex<br>
@@ -739,6 +739,8 @@ \chapter{Device Types}\label{sec:Device Types}<br>
=C2=A0\hline<br>
=C2=A045=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;=C2=A0 =C2=A0SPI master \\<b=
r>
=C2=A0\hline<br>
+46=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;=C2=A0 =C2=A0Media device \\<br>
+\hline<br>
=C2=A0\end{tabular}<br>
<br>
=C2=A0Some of the devices above are unspecified by this document,<br>
-- <br>
2.45.2<br>
<br>
</blockquote></div>
</blockquote></div>

--000000000000eecac106215a33b5--

