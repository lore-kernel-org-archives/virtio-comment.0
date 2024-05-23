Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8922429422
	for <virtio-comment@lists.linux.dev>; Thu, 23 May 2024 08:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716453903; cv=none; b=q5IlInKHrnHZlXOkcUqbnaeehb1zIOsRuOBY6SETVlLGCA8DdNx4XQhAY28EvA7jQ3+RMJ7+blPSMmz35sPQyxyVrAHfFxBDtI+7r6c8jaRF/PhL/rmaTLQGfTjRZVStNTOZFkSP7nc+qfuP4ao0W/x71LHLgjvcWpSv5bp8cig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716453903; c=relaxed/simple;
	bh=FkuyroZP6piyFXYfRYcUnnEGFSP/UAv9igkyEQRcMo0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JdUUTxk3ckY97jYPLm7lBmjWx+cUCBvqRc+lpSU0GPRJRxDO/jcJIwPLvpHP2uokJWUEAwDq8JJPe8pVBcmnybV+C1+KGgvL7Z4TC8flYDgHk7uC+GyknumCBp0ZRctuHVN0VsIvqTpx4xuv8dR5fmADCU4/LV/leTSJmVv3LBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fXagjdQV; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fXagjdQV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716453900;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fQaVfI+D7THLgTweA04uakaoCC74vaNjBTVHs+2tQ1o=;
	b=fXagjdQVO3zTPTiySWUOeHM/E8UiF5deFmWm1Qi3hZJbd1Qcpsx99g2DG9UchwtYBORuh7
	GHBwNHEe1WZqbHDiEFiVGIZRonnesM+GFRIcQgSxgYIUtdJ+OlOCwosXIKmvcr6GNt1Pkj
	vbLgGX07ulUq2PiYDm3yE+HnKwDOfxA=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-333-NRZiJKJSOn2F3pmuy7IwwA-1; Thu, 23 May 2024 04:44:58 -0400
X-MC-Unique: NRZiJKJSOn2F3pmuy7IwwA-1
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-6f475e364b7so629899b3a.3
        for <virtio-comment@lists.linux.dev>; Thu, 23 May 2024 01:44:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716453897; x=1717058697;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fQaVfI+D7THLgTweA04uakaoCC74vaNjBTVHs+2tQ1o=;
        b=m7GQ4lfAsQ6jjVcl321WIAQiZZBVCBEbyvW8I9S9XFTWBEqnK8RBYS1Gxqd9r7vOY2
         OpFDpvEJET2wXY9/0q5vLfPlSuJeqxtsu88ZV1tCtYgVI91z7RA4jDZsfWBYD4siwdfs
         Rqe6uKaEf0jv0RAPtKofY1i0NWN2hRV0l6+pd01ENd1dLHpUjrULTGqqRZFGPjLGlr8M
         Wi0ZnMM58zbt/y+6h+P3hX4RvFOySEr8y3rv/AjyoyDm13o3xcEOB8ZWRXweEEhi2P5p
         P1vuH6DpZTh0UAg+MLFJF/fAG18DIV5YW0TBJqbherongf0UAk1sfkORwjAIXi8PXgsY
         M5hQ==
X-Gm-Message-State: AOJu0YwP1UwLx5nEM5fbiKcaKLF4ztYPARvweyZhoeDPwLZGEgsCFXFl
	qe7TN9AE7smIEVI3ZBEwdmtzReEBaNs3Srp86lLkr0ktsWnim51vgifFlSuzcT0LfQN/XaUTgXt
	rH1uA7BCGYGQ5dj4C1T2URxhOqxTclQp1KjYmbPwZafqcq9wf/3kE8TWPleYDRvJEdK4WhXtq12
	WpYLGs5b459ENWeizV1ZEom4HbAsJePs/FntaHjyY=
X-Received: by 2002:a05:6a00:179c:b0:6e7:117:c5d5 with SMTP id d2e1a72fcca58-6f6d617b03amr4341111b3a.23.1716453897403;
        Thu, 23 May 2024 01:44:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENb3zNaQoD0XLEAAgX7Y21JWmdIMX37Jrl0/JRcUK3xFa1jZHaDoK1Cggvin92K35o7D+z+A7PVT14edvLK9E=
X-Received: by 2002:a05:6a00:179c:b0:6e7:117:c5d5 with SMTP id
 d2e1a72fcca58-6f6d617b03amr4341097b3a.23.1716453896954; Thu, 23 May 2024
 01:44:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240520134331.4043979-1-aesteve@redhat.com> <34cparcvc2343gqfcnckadvlm3dnvcc7tmdh722k55se6bc4bm@3gmr5r5t2npp>
In-Reply-To: <34cparcvc2343gqfcnckadvlm3dnvcc7tmdh722k55se6bc4bm@3gmr5r5t2npp>
From: Albert Esteve <aesteve@redhat.com>
Date: Thu, 23 May 2024 10:44:45 +0200
Message-ID: <CADSE00KX6MD10gBajAsUzSed3+X6FknX1i6_S8JfaB6r_=tF-w@mail.gmail.com>
Subject: Re: [PATCH v2] README.md: remove duplicated word
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: virtio-comment@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000cd43bf06191b10d9"

--000000000000cd43bf06191b10d9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 23, 2024 at 10:10=E2=80=AFAM Stefano Garzarella <sgarzare@redha=
t.com>
wrote:

> On Mon, May 20, 2024 at 03:43:31PM GMT, Albert Esteve wrote:
> >Signed-off-by: Albert Esteve <aesteve@redhat.com>
> >---
> > README.md | 2 +-
> > 1 file changed, 1 insertion(+), 1 deletion(-)
>
> Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
>
>
> For the next time/version, I suggest you write the word removed.
> It was a long sentence (not your fault) and it took me a while to
> realize that it was only describes at the beginning that was
> duplicated :-)
>

My bad, didn't mean to waste your time.
I'll specify next time. Duplicated words are difficult to spot
as our brain tends to ignore them...

Thanks!

BR,
Albert.


>
> Thanks,
> Stefano
>
> >
> >diff --git a/README.md b/README.md
> >index 1fed245..089db50 100644
> >--- a/README.md
> >+++ b/README.md
> >@@ -11,7 +11,7 @@
> >
> > <p>This repository documents development processes and hosts the tools
> used by the OASIS Virtual I/O Device (VIRTIO) Technical Committee.  See
> also the resources in the <a href=3D"
> https://github.com/oasis-tcs/virtio-spec">virtio-spec</a> and <a href=3D"
> https://github.com/oasis-tcs/virtio-docs">virtio-docs</a> TC GitHub
> repositories</p>
> >
> >-<p>VIRTIO describes describes the specifications of the "virtio" family
> of devices. These devices are found in virtual environments, yet by desig=
n
> they look like physical devices to the guest within the virtual machine
> &mdash; and this document treats them as such. This similarity allows the
> guest to use standard drivers and discovery mechanisms.</p>
> >+<p>VIRTIO describes the specifications of the "virtio" family of
> devices. These devices are found in virtual environments, yet by design
> they look like physical devices to the guest within the virtual machine
> &mdash; and this document treats them as such. This similarity allows the
> guest to use standard drivers and discovery mechanisms.</p>
> >
> > <p>The purpose of VIRTIO and this specification is that virtual
> environments and guests should have a straightforward, efficient, standar=
d
> and extensible mechanism for virtual devices, rather than boutique
> per-environment or per-OS mechanisms.</p>
> >
> >--
> >2.44.0
> >
> >
>
>

--000000000000cd43bf06191b10d9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br clear=3D"all"><div><div dir=3D"ltr" c=
lass=3D"gmail_signature"><div dir=3D"ltr"><p style=3D"color:rgb(0,0,0);font=
-family:RedHatText,sans-serif;font-weight:bold;margin:0px;padding:0px;font-=
size:14px"><br></p></div></div></div></div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 23, 2024 at 10:10=E2=80=AF=
AM Stefano Garzarella &lt;<a href=3D"mailto:sgarzare@redhat.com">sgarzare@r=
edhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On Mon, May 20, 2024 at 03:43:31PM GMT, Albert Esteve wrote:<br>
&gt;Signed-off-by: Albert Esteve &lt;<a href=3D"mailto:aesteve@redhat.com" =
target=3D"_blank">aesteve@redhat.com</a>&gt;<br>
&gt;---<br>
&gt; README.md | 2 +-<br>
&gt; 1 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
Reviewed-by: Stefano Garzarella &lt;<a href=3D"mailto:sgarzare@redhat.com" =
target=3D"_blank">sgarzare@redhat.com</a>&gt;<br>
<br>
<br>
For the next time/version, I suggest you write the word removed.<br>
It was a long sentence (not your fault) and it took me a while to<br>
realize that it was only describes at the beginning that was<br>
duplicated :-)<br></blockquote><div><br></div><div>My bad, didn&#39;t mean =
to waste your time.</div><div>I&#39;ll specify next time. Duplicated words =
are difficult to spot</div><div>as our brain tends to ignore them...</div><=
div><br></div><div>Thanks!</div><div><br></div><div>BR,</div><div>Albert.</=
div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Thanks,<br>
Stefano<br>
<br>
&gt;<br>
&gt;diff --git a/README.md b/README.md<br>
&gt;index 1fed245..089db50 100644<br>
&gt;--- a/README.md<br>
&gt;+++ b/README.md<br>
&gt;@@ -11,7 +11,7 @@<br>
&gt;<br>
&gt; &lt;p&gt;This repository documents development processes and hosts the=
 tools used by the OASIS Virtual I/O Device (VIRTIO) Technical Committee.=
=C2=A0 See also the resources in the &lt;a href=3D&quot;<a href=3D"https://=
github.com/oasis-tcs/virtio-spec" rel=3D"noreferrer" target=3D"_blank">http=
s://github.com/oasis-tcs/virtio-spec</a>&quot;&gt;virtio-spec&lt;/a&gt; and=
 &lt;a href=3D&quot;<a href=3D"https://github.com/oasis-tcs/virtio-docs" re=
l=3D"noreferrer" target=3D"_blank">https://github.com/oasis-tcs/virtio-docs=
</a>&quot;&gt;virtio-docs&lt;/a&gt; TC GitHub repositories&lt;/p&gt;<br>
&gt;<br>
&gt;-&lt;p&gt;VIRTIO describes describes the specifications of the &quot;vi=
rtio&quot; family of devices. These devices are found in virtual environmen=
ts, yet by design they look like physical devices to the guest within the v=
irtual machine &amp;mdash; and this document treats them as such. This simi=
larity allows the guest to use standard drivers and discovery mechanisms.&l=
t;/p&gt;<br>
&gt;+&lt;p&gt;VIRTIO describes the specifications of the &quot;virtio&quot;=
 family of devices. These devices are found in virtual environments, yet by=
 design they look like physical devices to the guest within the virtual mac=
hine &amp;mdash; and this document treats them as such. This similarity all=
ows the guest to use standard drivers and discovery mechanisms.&lt;/p&gt;<b=
r>
&gt;<br>
&gt; &lt;p&gt;The purpose of VIRTIO and this specification is that virtual =
environments and guests should have a straightforward, efficient, standard =
and extensible mechanism for virtual devices, rather than boutique per-envi=
ronment or per-OS mechanisms.&lt;/p&gt;<br>
&gt;<br>
&gt;-- <br>
&gt;2.44.0<br>
&gt;<br>
&gt;<br>
<br>
</blockquote></div></div>

--000000000000cd43bf06191b10d9--

