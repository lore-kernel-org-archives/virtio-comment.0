Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63391482E6
	for <virtio-comment@lists.linux.dev>; Fri,  6 Sep 2024 06:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725605099; cv=none; b=nu5yaUoV8L9Zfjz8Ax6fukq5Y3FEWmP94de2TjQ5IloutDOEPV1uabEGnhu/A5O/MtBt4Yz5PJRoQV0swTRIpaZ6Rj0XVuGR770L23JqOgfyKTeNEx/1FtNxDNMU2W4ite3k772RtVth6sl9c0ekrLPY/FdM1GsR+fp89eqrTzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725605099; c=relaxed/simple;
	bh=pS2PhxZokgsHXna3LJ4ZeXFenx0vw8+kzr6flvGn6I8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oilKcFA2cg+Wgi8o6grmVdSmB/bC5sneNgch7nKOsfZivoOSi92qR2KqiyPJxZQ3hzZLYtLlxXj5kSvayL3PIwyeqXz2nMDBXNqh97gV5DRyB88qDybk65Qeu7fYEO3n/fBJ7WgV1jpFNFCQMZAgbjHu/+1+k2TlqeAs32MDrHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XAbPmK2H; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XAbPmK2H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725605088;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0nPmFoXsowJQGecGVZDL7DM6F1hsROCmae5DzWO1HwU=;
	b=XAbPmK2HMTjuu+FSWhx2D7qN7LJgdm6lGswG5mxYw6MLjZK5sq42mGLFtUXA3tCLVmH66A
	ZtNp91N61nG7p0fkmK+ZviF4rwr6vR5/ZQ18Qhxf9iKW/7CDvQn4LKg//sA19GvOuOtNmj
	zzbcSq7VUgz6Caoci0q9ICnJ1nRmVII=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-88-8N9pwY2pN-WGOESAmFTg-A-1; Fri, 06 Sep 2024 02:44:47 -0400
X-MC-Unique: 8N9pwY2pN-WGOESAmFTg-A-1
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2d88116d768so2078339a91.0
        for <virtio-comment@lists.linux.dev>; Thu, 05 Sep 2024 23:44:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725605086; x=1726209886;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0nPmFoXsowJQGecGVZDL7DM6F1hsROCmae5DzWO1HwU=;
        b=sn2D6R/DGgq3Nu5pq8Iq2VZQ84wZknwiLXO+/Q3GbcKbyOVWTEEplZZ8H3We/LWTYk
         labKMBGypftpkW9co7efi5MfiEFjazKX2h58k8Lzz7z5iyum7sZNHBEuW7aJp4XJUEAe
         37SgrWD3tCJ8vK1mVAxkakp6z0MRZcPod+Kkw8zixlBvIFPHeHMxaSwOpT2Q+Py0/7mG
         imc8xFcPGTUuoLwEbt6SmmGTtwibvVD338fsl3h0Z5npwmw83kjVlQgFr6ZaKBNy6SN+
         hd/st1kGdAqa698oa/UTCYTeUyCzKk4DOyYl27xk8mRTE0v1no8BZkxniPIwtZQD1ppV
         jNMw==
X-Gm-Message-State: AOJu0YyTmoooYGSPImCja5cneVrWSBKgjDDfTo74QjBEyX07lLQnqPLY
	PMu3Zr5O3YxV/AIWFxn1g0d3aqD8flOA2dEtFdjiEY02v5uwYOFXYFocHi2v0bqYS2Ma6Oh3++N
	5uNybfpJvb4rL7etjrcWFwdek9FYuDSgJ7gtSyd/cZpYtNSiPidjbxxR+0NSm43TqqeMmtPNnGi
	VfhO3Jx+T40Flux8X8QI0sCmtMFkXjJVNNr5vfS4wRZvqDgTQ=
X-Received: by 2002:a17:90a:fe06:b0:2d8:8a04:1b16 with SMTP id 98e67ed59e1d1-2dad50f99d4mr2055196a91.33.1725605086055;
        Thu, 05 Sep 2024 23:44:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZWbGdaUMJRMuI26VmEtVyaYr8OxSaNAdCYX78Rzh8M6cyglO+U/9PzRSg4snkVN+tDsWuMpF/GJWJblE1S00=
X-Received: by 2002:a17:90a:fe06:b0:2d8:8a04:1b16 with SMTP id
 98e67ed59e1d1-2dad50f99d4mr2055186a91.33.1725605085680; Thu, 05 Sep 2024
 23:44:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240905073018.1766082-1-aesteve@redhat.com>
In-Reply-To: <20240905073018.1766082-1-aesteve@redhat.com>
From: Albert Esteve <aesteve@redhat.com>
Date: Fri, 6 Sep 2024 08:44:34 +0200
Message-ID: <CADSE00LirezidLjewHKWxZjb90o9jAUNXiL4082oMcXamxbazA@mail.gmail.com>
Subject: Re: [PATCH v2] content: Reserve ID for media device
To: virtio-comment@lists.linux.dev
Cc: acourbot@chromium.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000027abde06216dbe7f"

--00000000000027abde06216dbe7f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 5, 2024 at 9:30=E2=80=AFAM Albert Esteve <aesteve@redhat.com> w=
rote:

> Reserve device ID 46 for media device.
>

I just realized that the ID in the commit message is outdated.
I apologize in advance for the extra noise, but I will send a v3
of this patch so that everything is in order.

BR,
Albert.


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

--00000000000027abde06216dbe7f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div><div dir=3D"ltr" class=3D"gmail_sign=
ature"><div dir=3D"ltr"><br></div></div></div></div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 5, 2024 at 9:30=
=E2=80=AFAM Albert Esteve &lt;<a href=3D"mailto:aesteve@redhat.com">aesteve=
@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Reserve device ID 46 for media device.<br></blockquote><div><br>=
</div><div>I just realized that the ID in the commit message is outdated.</=
div><div>I apologize in advance for the extra noise, but I will send a v3</=
div><div>of this patch so that everything is in order.</div><div><br></div>=
<div>BR,</div><div>Albert.</div><div>=C2=A0</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">
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
<br>
</blockquote></div></div>

--00000000000027abde06216dbe7f--

