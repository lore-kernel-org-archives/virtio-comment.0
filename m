Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C34F1925BD
	for <virtio-comment@lists.linux.dev>; Thu,  5 Sep 2024 07:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725520728; cv=none; b=cTeNzaeDKu51Q25yQvfkPOngw5FyTJPztF9qpKUV/f2ZmIMjDyXlb/qeI7RoHwvkYKlIi62XHGZ2ZfpJ9wDVahFsKGuB+odlow64ZpNPJJKRl9EyppdpM5Sec2vaVhKEOJ05t3Zf8fWZKLXGQkWQtfqW0Wy0Wg14cNcYYMHsLfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725520728; c=relaxed/simple;
	bh=SRwZ/I7OKRybvEdLYqwQ9YjH6VEY9Xni0cfaJMzK3/w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=LPcBqZ+HzBPNkwUFtmpGaQoo8ZVllHdk+b+byGAzShf93ZfpVlsdSXm7OvnA9cK0yr4jZ5myMz2EOeAxjRyrwRBTrmLO59xYKJ/1xXcZklktlj80cx1azOE2HFSOPaCjW22VsfzUfCxMBIz6yfakjR19bgccc5cgrqFi5Qd9Bzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Fb+lH4Cl; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Fb+lH4Cl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725520726;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QV/sq6N5F8CE7ztYfPmaViLveW5vWQTHbS1RUhlxWok=;
	b=Fb+lH4Cly4qkq7sCssrFSJ+xyY8FM4F7sdUw7eEwAnGuLsi8iMHx/QRlu6hnZi4MQ0XhTw
	sy5BQl4OeQQmMT0U4l5WUL3p1SC8JOVVhCX3fN14W/mDuBf27iC5p/wuGimuL12OMhZN9j
	KQ86DpRheGfjTqCvGJJcvcizuP4giWE=
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com
 [209.85.160.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-43-wpyuZ9xwMIyqM0PqIZJyQA-1; Thu, 05 Sep 2024 03:18:44 -0400
X-MC-Unique: wpyuZ9xwMIyqM0PqIZJyQA-1
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-277e6462843so623200fac.1
        for <virtio-comment@lists.linux.dev>; Thu, 05 Sep 2024 00:18:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725520723; x=1726125523;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QV/sq6N5F8CE7ztYfPmaViLveW5vWQTHbS1RUhlxWok=;
        b=XscJ6DBv2MF+513ALcoauaQeR5I6v++l0IxFD+UfE4NYgK94eaWVMdbQgxVXkjJv6q
         xdJBQkLcTZ5cbwoP4UcWxdnzrKHIwF8bfzoHhOq3TTUBPpT7CFRhn8K662eFB5s3joLD
         bGDGm7h1xTaXn0SoVQMT3TTJbRsjm8RNLPo7bDVpuIk8zesnfEOqxwrMOudkaT27ueww
         aQfWLkwZ7ZCp0CpsVdpwDHC/wlOXYkY+ZVkK57sugs9FKJf+KACl7Fv2tG4/kehjGOYb
         hS01b+lZkeovjjsPLOYzYqYTef2RznzDcsaGj6u2RcFW4s66iOykL0qblkXC9w5OIWk0
         Vz7g==
X-Gm-Message-State: AOJu0Yy+MxVFcZZiZtV1ks48uYNIj2/bUGzZ1tGkDTYt0v6EZ3fsJBHO
	LztqzKqeNlx/F3XH0yFh1dXs3oFJNFGFxf7mTuMSvPMswiYO2QsM91PPVtYmWYIMo/F8l77bY3h
	xII+xxv6IJvJg+KevFUtjoxq/UTQYWwxPboZfG2BLbbMeXOThxiuypPXN0eyAMT/5jPROSSUnRb
	2MLtSmyHydLJCUsU6eE74WzGB1mNop/ZbuoKY9bvV2fPF5N+g=
X-Received: by 2002:a05:6870:9d98:b0:277:e6bc:330c with SMTP id 586e51a60fabf-277e6bc3a0bmr15536214fac.29.1725520723317;
        Thu, 05 Sep 2024 00:18:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGbCAd7aNWLSTe+7PtlafaaHV+HgIkTXxNQ7b6Fg1cmSeAgn2h6Aq0ftZrLbY5KEgAbespbw72MezXFbPmRnxA=
X-Received: by 2002:a05:6870:9d98:b0:277:e6bc:330c with SMTP id
 586e51a60fabf-277e6bc3a0bmr15536201fac.29.1725520722954; Thu, 05 Sep 2024
 00:18:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240905070351.1761683-1-aesteve@redhat.com>
In-Reply-To: <20240905070351.1761683-1-aesteve@redhat.com>
From: Albert Esteve <aesteve@redhat.com>
Date: Thu, 5 Sep 2024 09:18:31 +0200
Message-ID: <CADSE00+fJ_4i0-hj4S2W7E+Jvs4v7LK+zgvLi7yahOA+_i6ztg@mail.gmail.com>
Subject: Re: [PATCH] content: Reserve ID for media device
To: virtio-comment@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000bea65e06215a1946"

--000000000000bea65e06215a1946
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry for the spamming virtio-dev, I removed it from CC.

For some reason I still have older settings in my git-publish
config file. I'll try to fix it for next time.


On Thu, Sep 5, 2024 at 9:03=E2=80=AFAM Albert Esteve <aesteve@redhat.com> w=
rote:

> Reserve device ID 46 for media device.
> Compatible with video encoder, video decoder,
> and capture devices.
>
> Signed-off-by: Albert Esteve <aesteve@redhat.com>
> ---
>  content.tex | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/content.tex b/content.tex
> index 0a62dce..1bfa755 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -739,6 +739,8 @@ \chapter{Device Types}\label{sec:Device Types}
>  \hline
>  45         &   SPI master \\
>  \hline
> +46         &   Media device \\
> +\hline
>  \end{tabular}
>
>  Some of the devices above are unspecified by this document,
> --
> 2.45.2
>
>

--000000000000bea65e06215a1946
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div dir=3D"ltr" class=3D"gmail_signature" data-smart=
mail=3D"gmail_signature"><div>Sorry for the spamming virtio-dev, I removed =
it from CC.</div><div><br></div><div>For some reason I still have older set=
tings in my git-publish</div><div>config file. I&#39;ll try to fix it for n=
ext time.</div></div></div><br></div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Thu, Sep 5, 2024 at 9:03=E2=80=AFAM Alber=
t Esteve &lt;<a href=3D"mailto:aesteve@redhat.com">aesteve@redhat.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Reserv=
e device ID 46 for media device.<br>
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

--000000000000bea65e06215a1946--

