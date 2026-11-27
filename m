Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795761238;
	b=yPgyrs3x/G0EjiDMMeZmjFlpW15wmXPpj1mA9sI3rtwILrPXoFOWGi0HLjaZ4NaJV0Qu
	 JzkWl+fQJepITwPvUeZKWLk/pd6pJW/aZ44y92a9kt/ihEsB09YQgZa3WI4aLCyYZFDzw
	 R5U+KL3ep/ifEhsnWTjee3KoNbfMNgOQjCRjhe3JbvmV9enPBC2m9pFG7qoMs9w3V5PRl
	 OqRA4b1861xnbVqQrhq1k7qvcDJ1ZusaSzKgxvdITdR3sZrxmvHzjBn2HhObkr1yJXhf0
	 mAnrZu8cIG9/6vMRHvOJlsSP3WJpYaDXH3dygqojZL9z684JJzQNHKEbzB/xs1pKEAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795761238;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:User-Agent:References:In-Reply-To:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	bh=YuDHMt+iSDIsJqy0jhQKwM74U74DaJ17lv5quJERFRE=;
	b=sy90irobpXkNba3p0ursfdL2FCxzQdH/K5vKAbgDUcC2gEvhDE6p2MLe1UFektRBjwvB
	 DauoR6aus40NCkaUqUEMIUhvBUf4QWxDmttGfmzfdHAaKBeHfUJ4xnDt1XwvVvLTh8f3r
	 59Jy+wazQi9Cf8iFKI4H/K82bVc9ejwPw2nhenDSUUTCXlDSCjcGGqX0b5bC3alYr47lg
	 hl5XJnI0frGTN+wxiEKha2yqg53CiCpGVIUlaW64Eeh1AuvPGNWZirvBHsEcpSdSoqZ6z
	 +C4zvHw1CJ1rXYNH8EFqLt0fJ5cItysbDfjUDwPFkoPKUC9Gp5aw+fcjZY5F4g/zZ6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=HPvFasI9;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859C5606A32C
	for <virtio-comment@lists.linux.dev>; Fri, 27 Nov 2026 06:33:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 859C5606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=HPvFasI9
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb606491faso40764495e9.3
        for <virtio-comment@lists.linux.dev>; Thu, 26 Nov 2026 22:33:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795761236; x=1796366036; darn=lists.linux.dev;
        h=content-type:content-transfer-encoding:mime-version:message-id
         :in-reply-to:references:user-agent:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=YuDHMt+iSDIsJqy0jhQKwM74U74DaJ17lv5quJERFRE=;
        b=HPvFasI9Sd5QpEDL66ghd6K7K0xLDC6mdVN3D6gWoV+zMFmEaQL9v4f3QE2XQioB78
         9Sk0dGaORrghtqTD/Uy29W8qRGG8rIRAC3WpavB6wdbDSbI/LvHf8/7mAvEE3DJtQyt5
         v173HEXvEH4B7O88S7Xt6U73ogAK/5vdv1yknaiYPSKoOclXZ7BiQpyxSWcml6swjBjC
         amlX+ceCAL247LNJvW7kxVt+x7RRgGeieKRpeQIUm9ujXYlTBU+SM0Bdh6a99quphif4
         SsLBRvk/CsfbTB6zIecirUxt90tqnGZ6SlWHr0iEDctqeRsoMwSmaMr4PaImpsrO9WoH
         Lrfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795761236; x=1796366036;
        h=content-type:content-transfer-encoding:mime-version:message-id
         :in-reply-to:references:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YuDHMt+iSDIsJqy0jhQKwM74U74DaJ17lv5quJERFRE=;
        b=aTrcv10JoTFzRg/ZCt8Mq/+6XXq/uKyIyt7WiMtMmgnpwsLbQLnD62REJan3DpjzYG
         PU6Zak9a9Yk8S5IZDAdPMC7Kij8FxY3sAngx1vvZHX5r3TI14gyG61Y8ybtuxs6CgwYH
         +lJvvGYRtbEKbgDE8asAupbHDYLhwJCzCz4r1fvzwutIhFGmp0qNib+rcJu5LMU0nYI0
         CmW1/Avbg17+vcvWkZ2dwimploAJSs8GI0lfgkakqbkVj9RQfasB+G8AHeJFQaq6CNIJ
         pjOB347Fv4vur4Ae0ZJHd4fbIuymYu+cPaG69Ybyw5ER7qhcVOuJjrp3sT103auMy6vG
         HoOg==
X-Gm-Message-State: APuU4Z88frNW4aMDBzLwp/45cOeQBOT/GFwO+X9AQ8ZlX1axR4LAYeAh
	opxfEvHQ61GxZDB6rpe1T3um99i5OT9HlH8noc4ZUxpjIi6pVELVZeSl0QDTGrSZr57k/jFFUr5
	Ozz63Ew8=
X-Gm-Gg: AZFdTZffmfGlmkvCTdgx6AKIf2tQ3mcc0HEC+SCsZGipmRHflycNCFMPPwsZzL+JNZi
	UfXIE8iH+6DjgssJHoWPnOyRMgcUCpF6rCis6SnC9fS3NnhIHt28XDwzA3FX21U6UCWt0uMgL8a
	+UBqtGGtQiPFabhhgEqFztX0wJbq3ZJ+ACYbkyyyrND0uaWQtaAz8F5jfeaFPpfY/k66qVPrXjk
	ZafEy5iBcyfwo1XBBpZgCaCvHYxUnIzyUiOdAnNY8j+x1c3QnWBc1/pYyzmyMI7tVaIh8iv0cNI
	0i7oGtwu/B3FX0q5uys3AJoyjKsoaLLiB5jdw0EnXL/py5+foHDdPLVtUlugvDg6C/my+W3ShwX
	0854R+c0MSRNMnuEl7Ize5Hi7crTpf9hxnMe7xqL2uWUYiRsoswWgMiqF3HwGMsOkE0Qugeth8t
	vDiPh2O4tGX32eXXHH82TI4cgn2tLJN6TUH+wQvbgLoTKZcQv+azAghHkHQk4cyNtzhBeIzsxCV
	0mlWVh2oFsg3Yd293w2bMPOaswJ1rkNe5JnqX4hOD28MD0xL+7W5OLihQr+3bxPcBfFfkaMpzJI
	kiGFMJ9zWPI92CZaVsuvQFHBTMN1SQNPNzEfkzTNNuAsLab+9VZhCFyFdo8XHOXcNPMUnxI7xHb
	tvuINoNLN4hprr0C4BqNKihvLlRAuFZbTqXuSa/V5kMk3z7/q6l1RQal6+022ok9RcGpf/KLFxS
	SMJmSvIOnkE2Xrwvc98UG20V1Qs3v79Q7pVMkBAxm3VP1nXpWpvj2LvI81TV9IlX7/TkBARP+dZ
	Y5RLOK+7Dw7s1mYrQ==
X-Received: by 2002:a05:600d:82d3:b0:49f:e701:51c8 with SMTP id 5b1f17b1804b1-4bb8880f0ebmr514254735e9.9.1795761235863;
        Thu, 26 Nov 2026 22:33:55 -0800 (PST)
Received: from meli-email.org (athedsl-4431069.home.otenet.gr. [79.129.140.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d55sm44890373f8f.5.2026.11.26.22.33.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Nov 2026 22:33:55 -0800 (PST)
Date: Fri, 27 Nov 2026 08:32:12 +0200
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: virtio-comment@lists.linux.dev, Alex Benn=?UTF-8?B?w6ll?= <alex.bennee@linaro.org>
Cc: Alex Benn=?UTF-8?B?w6ll?= <alex.bennee@linaro.org>
Subject: Re: [PATCH v4 06/12] virtio.tex: sort package list
User-Agent: meli/0.9.0
References: <20261126194632.2429425-1-alex.bennee@linaro.org> <20261126194632.2429425-7-alex.bennee@linaro.org>
In-Reply-To: <20261126194632.2429425-7-alex.bennee@linaro.org>
Message-ID: <tp5e8i.jz6212a121pa@linaro.org>
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Post: <mailto:virtio-comment@lists.linux.dev>
List-Help: <mailto:virtio-comment+help@lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
List-Owner: <mailto:virtio-comment+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"; format=flowed

On Thu, 26 Nov 2026 21:46, Alex Bennée <alex.bennee@linaro.org> wrote:
>This will make auditing and adding new packages easier. Unlike its
>cousin for virtio-html.tex it is slight complicated by the additional
>optional arguments for each packages.
>
>There is one package that breaks things so we keep it out of order and
>add commentary.
>
>Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>
>---

I think this patch is unnecessary, since \usepackage order matters in 
LaTeX, as you discovered.

But in any case:

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

>v4
>  - handle the fontspec special case
>---
> virtio.tex | 41 ++++++++++++++++++++++-------------------
> 1 file changed, 22 insertions(+), 19 deletions(-)
>
>diff --git a/virtio.tex b/virtio.tex
>index e02b341..9071cb2 100644
>--- a/virtio.tex
>+++ b/virtio.tex
>@@ -6,40 +6,43 @@
> 
> \documentclass[10pt,titlepage]{report}
> 
>-\usepackage[top=1in,left=1in,bottom=0.5in,right=1in,paperwidth=8.5in, paperheight=11in]{geometry}
>-\usepackage{parskip}
>-\usepackage{setspace}
>-\usepackage[english]{babel}
> \usepackage{ae,aecompl} 
>+\usepackage{array}
>+\usepackage[english]{babel}
>+\usepackage{courier}
>+\usepackage{enumitem}
>+\usepackage{etoolbox}
>+\usepackage{fancyhdr}
>+\usepackage{fancyvrb}
>+\usepackage{float}
> \usepackage[T1]{fontenc}
>-\usepackage[xetex]{graphicx}
>-\usepackage{placeins}
> \usepackage{framed}
>+\usepackage[top=1in,left=1in,bottom=0.5in,right=1in,paperwidth=8.5in, paperheight=11in]{geometry}
>+\usepackage[xetex]{graphicx}
> \usepackage[xetex]{hyperref}
>+\usepackage{lastpage}
> \usepackage{lineno} 
> \usepackage{listings}
>-\usepackage{courier}
>-\usepackage{fancyvrb}
>-\usepackage{array}
> \usepackage{longtable}
>+\usepackage{ltablex}
>+\usepackage{mdwlist}
> \usepackage{multirow}
>+\usepackage{parskip}
>+\usepackage{placeins}
> \usepackage{rotating}
>-\usepackage{fancyhdr}
>-\usepackage{lastpage}
>-\usepackage{xcolor}
>+\usepackage{setspace}
>+\usepackage{tabularx}
> \usepackage[explicit]{titlesec}
>-\usepackage{mdwlist}
>+\usepackage{underscore}
> \usepackage{url}
>+\usepackage{xcolor}
> \usepackage{xifthen}
>+% fontspec must be loaded after titlesec (which freezes ex-based heading
>+% spacing at load time) and before xltxtra (which loads fontspec without
>+% [no-math]).
> \usepackage[no-math]{fontspec}
> \usepackage{xltxtra}
>-\usepackage{etoolbox}
>-\usepackage{tabularx}
>-\usepackage{ltablex}
>-\usepackage{underscore}
> \usepackage{xstring}
>-\usepackage{enumitem}
>-\usepackage{float}
> \IfFileExists{ellipsis.sty}{\usepackage{ellipsis}}{
> \message{!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!}
> \message{LaTeX Warning: Missing ellipsis.sty: dots (...) will look ugly}
>-- 
>2.47.3
>
>
