Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190F6155333
	for <virtio-comment@lists.linux.dev>; Wed, 25 Sep 2024 06:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727247012; cv=none; b=StNwycUz0ildCkJF3c7gvhoDW1KrVqJ5/8KS6trAGowwOVLX/u1uAWixMsmoGxhx2zwDx+HInR/5SOpiPKoAZd7dC1nuJQMhTbQ8dXIWgwAo94FysjzQEsV9npLGfNQ5WY4FSdepncLmpoBqABNXSFlPLvPBmGjeZocDO1KfuSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727247012; c=relaxed/simple;
	bh=Wq6m9jxt+pXILWDNweuSD5ED6fqynX4mQ3+8wG4HovE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JLHRbWCFpZ2ZmeuQFGMY7ghCsGQSGeOaqEI2f8jUWtydQ1rua+HJjGmf3NYob/2IwmEWav+RGgnIG4JiGvwK9YotagA67WMHUA9h4/b0sW2iCqNEJEFu/NI+IPfMF5ABvcTzoEFZmyEbSdtpA1DN5V15Kn93V2cbgtezPIbYIxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZWCKkpxM; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZWCKkpxM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727247009;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uBj8wDxmh09tWhCMrPSa0yrSQInb0s2qx+iL2FCxADE=;
	b=ZWCKkpxMs+wijMRNYsoQEOMnfDnxknpveTv9jPjEXPstwKEqwt+7s8w3dPF5XmFoWDEYAz
	zt+xqpeOwbAM/FWDmSbrQcBMi8PdlgpF3MVk9CRxN9KO483hZDPfS1fh0N+jYhUs1DYl8r
	0rthQgrLc7h9piRwvXjLSLTMlWXcNPw=
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com
 [209.85.160.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-403-Mn1Q2rO0P8qtV3G_uW_6pg-1; Wed, 25 Sep 2024 02:50:05 -0400
X-MC-Unique: Mn1Q2rO0P8qtV3G_uW_6pg-1
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-27808f6bfefso7046962fac.2
        for <virtio-comment@lists.linux.dev>; Tue, 24 Sep 2024 23:50:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727247004; x=1727851804;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uBj8wDxmh09tWhCMrPSa0yrSQInb0s2qx+iL2FCxADE=;
        b=HYONlUOZ7/oEl+8JuNWkOA0WbHXepXBSo2wdox7lbYp55pHxc3CgQKEtOMXDTvy3nO
         u1MklvgkWJWZns8StyAndGsi/QnkJMVWBrCtRYLLOEwk+hTAy4BemBPS7sGiQOgl/nD/
         DQeSw2RN6dd5byrJGFQlUwFxNi+u6Bigtk8q5ZnWklR4ytHZk8WkUozvMWc9yuGyotfr
         jr+Y/ymWSEGtyFWpiloWgK+GJcoeMTpnIwzxk5RGu/o4iUtBJ36sW8Z1i38+I12pxeHo
         3y4+mOqPY9aI5IH4wrORCaoSApIc7f1OXh110YOrr9itqQ+2lYy1kWZg3kHPJFJP/r+w
         FjhQ==
X-Gm-Message-State: AOJu0YwEJocjIA39hMokPJX8r9UIkvTbQ5ZnpejkAjQDwu1Uyid9SgZ9
	WX3L4TLfCquzXh5v3ndkTnfUtFnzWB73/2Ze4R4kmzzD6xGD13+2Yj8jpaufJ4BLW6cidc35D3B
	gxwwW+AG87Qt9nNMCxD2fI7O4cefYJigQezRpfTc0AMvDY9+vBtwTLGoivl1drB4617Ke1/DiFg
	Bq1laJyQIgPNfI9eTroftZS9XSV5HojaCriNN416gxr/Fa2vg=
X-Received: by 2002:a05:6870:2897:b0:270:129f:8e65 with SMTP id 586e51a60fabf-286e15ff2b2mr1342028fac.34.1727247004485;
        Tue, 24 Sep 2024 23:50:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGItzzPP94T+s/h1SKfpdMQsNUUoTk5r4EJrAh5S/ZYm7NEHeLmkc27V09LJPm9U0/W6TTOR/Z+riN3hqMYjWQ=
X-Received: by 2002:a05:6870:2897:b0:270:129f:8e65 with SMTP id
 586e51a60fabf-286e15ff2b2mr1342018fac.34.1727247004158; Tue, 24 Sep 2024
 23:50:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240906070833.1949727-1-aesteve@redhat.com>
In-Reply-To: <20240906070833.1949727-1-aesteve@redhat.com>
From: Albert Esteve <aesteve@redhat.com>
Date: Wed, 25 Sep 2024 08:49:52 +0200
Message-ID: <CADSE00KO=VZy4_4FfgC7ODON32mZ8khWkPUcXheP6pTiEZAyHA@mail.gmail.com>
Subject: Re: [PATCH v3] content: Reserve ID for media device
To: virtio-comment@lists.linux.dev
Cc: acourbot@chromium.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000001f69560622ec08b0"

--0000000000001f69560622ec08b0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 6, 2024 at 9:08=E2=80=AFAM Albert Esteve <aesteve@redhat.com> w=
rote:

> Reserve device ID 49 for media device.
> Compatible with video encoder, video decoder,
> and capture devices.
>
> Signed-off-by: Albert Esteve <aesteve@redhat.com>
> ---
>  content.tex | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/content.tex b/content.tex
> index 0a62dce..6d6b3d8 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -739,6 +739,8 @@ \chapter{Device Types}\label{sec:Device Types}
>  \hline
>  45         &   SPI master \\
>  \hline
> +49         &   Media device \\
> +\hline
>  \end{tabular}
>
>  Some of the devices above are unspecified by this document,
> --
> 2.45.2
>
>
Dear TC,

It has been a while since I posted and there has been no
comments/objections.
I would like to start a vote for issue #202.

 Fixes: https://github.com/oasis-tcs/virtio-spec/issues/202

Thanks!

--0000000000001f69560622ec08b0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 6, 2024 at 9:08=E2=80=AFA=
M Albert Esteve &lt;<a href=3D"mailto:aesteve@redhat.com" target=3D"_blank"=
>aesteve@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">Reserve device ID 49 for media device.<br>
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
index 0a62dce..6d6b3d8 100644<br>
--- a/content.tex<br>
+++ b/content.tex<br>
@@ -739,6 +739,8 @@ \chapter{Device Types}\label{sec:Device Types}<br>
=C2=A0\hline<br>
=C2=A045=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;=C2=A0 =C2=A0SPI master \\<b=
r>
=C2=A0\hline<br>
+49=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;=C2=A0 =C2=A0Media device \\<br>
+\hline<br>
=C2=A0\end{tabular}<br>
<br>
=C2=A0Some of the devices above are unspecified by this document,<br>
-- <br>
2.45.2<br>
<br></blockquote><div><br></div><div>Dear TC,</div><div><br></div><div>It h=
as been a while since I posted and there has been no comments/objections.</=
div><div>I would like to start a vote for issue #202.</div><div><br></div><=
div>=C2=A0Fixes: <a href=3D"https://github.com/oasis-tcs/virtio-spec/issues=
/202" target=3D"_blank">https://github.com/oasis-tcs/virtio-spec/issues/202=
</a><br></div><div><br></div><div>Thanks!</div></div></div>

--0000000000001f69560622ec08b0--

