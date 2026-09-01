Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6042431E65
	for <virtio-comment@lists.linux.dev>; Tue,  1 Sep 2026 15:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788276297; cv=pass; b=N1N6ZKFQu2T5pDH0Q1F2N0JnVneJnsFS8Rlob7G2ZcRgSa5/0JZrfVxDJ3lSsJ5RudhsAxzpeyFo1HdV3JFoo2k5viN51m7Wiz2MaYVuSLKKCLiIZ51hy3JJMewNxE3pYdtjwUOdKqLHz5ZuuLvnw/0c+ChLMp1E/H6fhzCASaA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788276297; c=relaxed/simple;
	bh=TgUnON74rNIPzCACnlWcMjhs9GWaK073PF6GnvdhUIw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gAvY8hh/9/xLHCNXkxZEl9Nv7QpCpIefrWhdPxSBS239hJ1TnPCsnTUubVmGReaRPRiLOp8cZfZhPtNEMP+x/4EAyZuQomIMRIiQG5Ib0HSfKcuaO6xIhOIz6jOW6Ap/xTBFpmT1rTlJqL0S3SaWiW8MY/o6w8FkMU0544r63IA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jv9p13dj; arc=pass smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jv9p13dj"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5b4a0e5aefeso4885772e87.3
        for <virtio-comment@lists.linux.dev>; Tue, 01 Sep 2026 08:24:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788276294; cv=none;
        d=google.com; s=arc-20260327;
        b=WIRn0CD98XejM9wgZ5sQXkaQGvpddg9/UXO5l1PvSPaM7WraAAsWuls8jonlY/ulkb
         h1dqtD8WpDAN8g5skL1ZCqFQ+sntVSXaVyQCCZp0wA/6cebGS85MRc8+F9TGmml388cI
         FM9kDgfpjz8Ke5zCp42o0nIiVh222bWStEigqKfJrgsJBOM6oFa4oPO+doKEgItwVQpd
         enxNgcMREw61otMeuPg5ryzq3MGXVpoUyuB6MGpt3lU2sHMxjmWytEy0K6ScQ7s7tugK
         UrsyS2GmkFVM6YMvizU3Rouw4oxASHYtPME708TmdyTngdSJ0ACWzuPtMOD4Ev0fB5il
         2ptQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=orkLciSZ3MLrrGcvB39d2nSSeF6Slkqgc+LXMypkC8M=;
        fh=WWAN/yp0y/n1MpR6NLM3XI+eQLYR228Zl96Ueeu3R7I=;
        b=hnJdARafOZczEKp8FLo34rAFHFRDZ82DYXMmzaO+KpK8sJlckQsSp3wJJVkrZyZ7DD
         cI2fyuen3wP3uf9kpNFOW/mykE5EJ/eYcycJXba4LS5/stdFs0KibqP4gyItkvonm6Ca
         B4qX/VquyikuU3Gdev+BOkbOzLM6pGV52dUDpzeobr6VI/GQwmKFFzKJcBCnjsHabm78
         LlO2FgkXKfAfhJuq4P2gFiMuwfNMo8Wd8dvtTmP7U1y1BvdRyevdCby/4+l+WmiYSdEd
         VKSx8dZ/ZOKZshollvGJ3OzH9D71IysCwRXl+dDVlakzJR8bHpLWshdJY1dgKqnctZNu
         hANw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788276294; x=1788881094; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=orkLciSZ3MLrrGcvB39d2nSSeF6Slkqgc+LXMypkC8M=;
        b=jv9p13dj/LJNmkFe/YG6eHLjESjYBtDZTFGYoZVvzemwyDZUHpGXO369vtzyb7xfLt
         CeM2EFz0TUQuos8qgq9CV5+YCxG82S6zy5VSPG6S9VYwxnWENMBDRbVTTSB6uRLzTzl8
         9GnfZmg49zglgtA/fjWfIG3U4z4a8KzPijCUzuVDZ6Vj+7c0FBBy47Z6/p5rsb7l4UfI
         NKFz+va1AA68nZercWlGGKiZNW09bB2hoOFN2wo/d1VdQpteKDwUmtfF7kYR40gzLCXE
         QolXIXPDnoAaVbk+rwxWe4g0yVb5KsrH7BRMjM2wmc8S4dI7dh0GzNXBDaI9Rhbf+KqW
         9Xuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788276294; x=1788881094;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=orkLciSZ3MLrrGcvB39d2nSSeF6Slkqgc+LXMypkC8M=;
        b=l6hrZtrToDBEMweuJWC2LEoEFqgvbIi/LD4WY3lnN3yGIggGSCbhUhoHYrdtyBZpGJ
         /Jte9N+whF2bIRbXRp+KHGdnXo1b4oIgMyQMm/blfis3APlNdjGSTomztf3ibZyskhG6
         v4+hiMGtkJRBYbpaR5bomQWyh4HkvsIOo7unRY+TrpYG6YW2pZRR3cyRhom2F5l4Pw41
         c/j/fagGVVE+724hLbQ/AEJBakpCkvYnzuxx6XTI+ez9j30auxw0R91dEQb/QKpYMpKk
         OJIkYPYjQoLCf9oy0R4TwBSpT74C0MWf/Lx7L6yvWkA1T389ViiEUYquuVljVI+wQ81A
         mYiA==
X-Gm-Message-State: AFuF++lK1QNp7YhhxCrtH5r1qgb0Tkgm5hnYx2owuocfKBTnYX/29ElO
	Jpo0I0sKwtLMP6/AHjAIkUCpj1xXfgZu2kRPZiM6S/g0GKv+cSBrWsq1Bnw1pnASZMLQASIT/7R
	rsQGchcfBNPyKEjQ4uToZgvTmjfdyPdgPQzslkE3Ybw==
X-Gm-Gg: AYBFou1axjNi2HDf8G+znuTGkQAcqIw8oFrF2peHGVeLPwtkg9h4ZOd3b0RJqZDOIeV
	d49J08igo6d3iMlzOQdbm+mIqUpysjMkhrW61olTDOaSvdMJEkuIk/XaeLiXe2tnuk/ba3OrvCM
	OeYcpQEtMWAj4O428QYBZyR4PhpF5ru6q4rmdsCWSmuhI8BjeAwaYw8sbSpNHOZKs4WCAc3Jb0P
	WKI35Em/z8vYbVGyPviQOGTek8qnPai60Zif3kZmWjhpQ+l4I/9P53bevvGHj2ohZ7ANu5Rc+79
	fEFMko4nHEmX/sH+jw+8Qgia18ApoRGMDZJI9iXR2xwJEizMIzfnw+X3
X-Received: by 2002:a05:6512:1293:b0:5b2:a967:c0bf with SMTP id
 2adb3069b0e04-5b5e68c4c94mr11247225e87.10.1788276293668; Tue, 01 Sep 2026
 08:24:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1781514628.git.bertrand.marquis@arm.com>
In-Reply-To: <cover.1781514628.git.bertrand.marquis@arm.com>
From: Viresh Kumar <viresh.kumar@linaro.org>
Date: Tue, 1 Sep 2026 20:54:41 +0530
X-Gm-Features: AcwNN1Vy1sLuN5FEuOMSgIcGrR_RRWm0iW6XKPePUPT9qYoPm65AGQe0dP0fCrs
Message-ID: <CAKohponVcUOE09DFtF0yKCtTnfXYbQzNvzZ1vbHp57DTphNuww@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] virtio-msg transport layer
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: virtio-comment@lists.linux.dev, 
	"Edgar E . Iglesias" <edgar.iglesias@amd.com>, Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
	Alex Bennee <alex.bennee@linaro.org>, Armelle Laine <armellel@google.com>
Content-Type: multipart/alternative; boundary="0000000000003eb1db065a6d8580"

--0000000000003eb1db065a6d8580
Content-Type: text/plain; charset="UTF-8"

On Mon, 15 Jun 2026, 14:40 Bertrand Marquis, <bertrand.marquis@arm.com>
wrote:

> This series adds the virtio-msg transport layer.
>
> The individuals and organizations involved in this effort have had
> difficulty in
> using the existing virtio-transports in various situations and desire to
> add one
> more transport that performs its transport layer operations by sending and
> receiving messages.
>
> Implementations of virtio-msg will normally be done in multiple layers:
> * common / device level
> * bus level
>
> The common / device level defines the messages exchanged between the driver
> and a device. This common part should lead to a common driver holding most
> of the virtio specifics and can be shared by all virtio-msg bus
> implementations.
> The kernel implementation in [3] shows this separation. As with other
> transport
> layers, virtio-msg should not require modifications to existing virtio
> device
> implementations (virtio-net, virtio-blk etc). The common / device level is
> the
> main focus of this version of the patch series.
>
> The virtio-msg bus level implements the normal things a bus defines
> (enumeration, dma operations, etc) but also implements the message send and
> receive operations. A number of bus implementations are envisioned,
> some of which will be reusable and general purpose. Other bus
> implementations
> might be unique to a given situation, for example only used by a PCIe card
> and its driver.
>
> The standard bus messages are an effort to avoid different bus
> implementations
> doing the same thing in different ways for no good reason. However the
> different environments will require different things. Instead of trying to
> anticipate all needs and provide something very abstract, we think
> implementation specific messages will be needed at the bus level. Over
> time,
> if we see similar messages across multiple bus implementations, we will
> move to
> standardize a bus level message for that.
>

Bertrand Marquis (6):
>   virtio-msg: add new command for bus normative
>   virtio-msg: Add the FF-A bus bibliography reference
>   virtio-msg: Add virtio-msg, a message based virtio transport layer
>   virtio-msg: link virtio-msg content
>   virtio-msg: add conformance entries in conformance chapter
>   virtio-msg: add message transport to core references
>

Reviewed-by: Viresh Kumar <viresh.kumar@linaro.org>

>

--0000000000003eb1db065a6d8580
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Mon, 15 Jun 2026, 14:40 Bertrand Marquis, &lt;<a hr=
ef=3D"mailto:bertrand.marquis@arm.com" target=3D"_blank" rel=3D"noreferrer"=
>bertrand.marquis@arm.com</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex">This series adds the virtio-msg transport layer.<br>
<br>
The individuals and organizations involved in this effort have had difficul=
ty in<br>
using the existing virtio-transports in various situations and desire to ad=
d one<br>
more transport that performs its transport layer operations by sending and<=
br>
receiving messages.<br>
<br>
Implementations of virtio-msg will normally be done in multiple layers:<br>
* common / device level<br>
* bus level<br>
<br>
The common / device level defines the messages exchanged between the driver=
<br>
and a device. This common part should lead to a common driver holding most<=
br>
of the virtio specifics and can be shared by all virtio-msg bus implementat=
ions.<br>
The kernel implementation in [3] shows this separation. As with other trans=
port<br>
layers, virtio-msg should not require modifications to existing virtio devi=
ce<br>
implementations (virtio-net, virtio-blk etc). The common / device level is =
the<br>
main focus of this version of the patch series.<br>
<br>
The virtio-msg bus level implements the normal things a bus defines<br>
(enumeration, dma operations, etc) but also implements the message send and=
<br>
receive operations. A number of bus implementations are envisioned,<br>
some of which will be reusable and general purpose. Other bus implementatio=
ns<br>
might be unique to a given situation, for example only used by a PCIe card<=
br>
and its driver.<br>
<br>
The standard bus messages are an effort to avoid different bus implementati=
ons<br>
doing the same thing in different ways for no good reason. However the<br>
different environments will require different things. Instead of trying to<=
br>
anticipate all needs and provide something very abstract, we think<br>
implementation specific messages will be needed at the bus level. Over time=
,<br>
if we see similar messages across multiple bus implementations, we will mov=
e to<br>
standardize a bus level message for that.<br></blockquote></div></div><div =
dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">Bertrand Marquis (6):<br>
=C2=A0 virtio-msg: add new command for bus normative<br>
=C2=A0 virtio-msg: Add the FF-A bus bibliography reference<br>
=C2=A0 virtio-msg: Add virtio-msg, a message based virtio transport layer<b=
r>
=C2=A0 virtio-msg: link virtio-msg content<br>
=C2=A0 virtio-msg: add conformance entries in conformance chapter<br>
=C2=A0 virtio-msg: add message transport to core references<br></blockquote=
></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Reviewed-by: Vir=
esh Kumar &lt;<a href=3D"mailto:viresh.kumar@linaro.org" target=3D"_blank" =
rel=3D"noreferrer">viresh.kumar@linaro.org</a>&gt;</div><div dir=3D"auto"><=
div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
</blockquote></div></div></div>

--0000000000003eb1db065a6d8580--
