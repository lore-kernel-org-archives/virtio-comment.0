Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795772734;
	b=NVj6q9dVW9jAN5wn8Lvay7d+E+afxqnm2BmotcfNi2qv+PWmJXYBKcbSRpYAxjiLfyei
	 Q5rtt7TUVgOm+CXAkGMJHcN/B3pRE4IQ61dXtU20TKDtwciRU8U+O2hZcvL5REo7j4pFR
	 Rw8qeJ08YzYZcjoq3TYcswAdCCD7AZ4aZSubLh+l2mcvOgzbrhohxsWZHCM8/SHJmOtsE
	 03B0WjMv77ZyjvkNlCTCQ7C34heCPEJK/pNJ2JAK7IeQxNmrmKYh6ev4gQ8P7gNnqUGq1
	 sh/zz9iaXNoYSCMz0drEeINUM6MWBCIsCUVqWnmqyYO+EAio7E+0P7a/ymtdyX0jh9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795772734;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=LNeZhvd+C87WwGbs1Hzix7J0JxjApNY+TcV9ZYU3JSA=;
	b=TsyxaSYmrVQf5oad6mFqTrMystEW+WqtMrJN/Rsap6xB6fCQKHWoZ/+g+RTwrQbTcxlu
	 HTyOJGG6tMAusWyJLslTKdq1zNBzkIlOWJXA4rm7qRs1QnynfnMBiOXlXxwHy6pzW996z
	 5oA8ifw6I+/sstf3E1SO45vXtv2uy9b9QF2f2BdbvwFvCm3Ppd6IWo16iYVw+BljM/mAY
	 tl7a+8ouj7XI8mRIKSy8nRNI/yFzGc/OLwEjfmViZcSnmjkt6ZFXLCrODqDxdYVKyxWic
	 ik0FpyqbOXUJcElPW1Ue34hkEra/vd2Ru5ayg32BnPYn2SF5aXqY32FcHqRGj+EsCNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=wlTRPk24;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D6A8606A31C
	for <virtio-comment@lists.linux.dev>; Fri, 27 Nov 2026 09:45:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D6A8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=wlTRPk24
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48e3b22e971so4149875f8f.0
        for <virtio-comment@lists.linux.dev>; Fri, 27 Nov 2026 01:45:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795772733; x=1796377533; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :user-agent:references:in-reply-to:subject:cc:to:from:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LNeZhvd+C87WwGbs1Hzix7J0JxjApNY+TcV9ZYU3JSA=;
        b=wlTRPk24NJe0985tXwHh9pEMtB7MrlDFO7z7ExkAdFw49UIyR3SSmsxuQVazkWoAXP
         /cGY9F+eu1mE+HwvmcDtRnFpPoL9tBtRB3+S/tWqp91fLwdNfsVPxO0lVWiWoim4Yc1P
         LynVzuijbyZgYY+ionTo7qnFQFB0dYXNSy6FDoqBzceeP/h4H86NgrnMD9uxvkJOMhnC
         qJbvdykNra3mq1q9ke35OZWvF5LTrmUOlE5WEeXn54bH2ZEHNuX9nmJKcFkZWOj318J5
         x1kXrnxtH2z/iFblDUr2tZ6vRLJHQlGkJcMRIcoDn5qzYV8CdpT9Dim4/n6x9M0e5Y8k
         +uiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795772733; x=1796377533;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :user-agent:references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LNeZhvd+C87WwGbs1Hzix7J0JxjApNY+TcV9ZYU3JSA=;
        b=arEweta+xI2HUs8N3P+yIFFUZr13hVOtB3hURLY6Gobr8FBNpsUawOadZtOTkF6Oyb
         eq/cnCzWIjosOljMmmfE3sgaAYMassI101eQ1ixosqnrcSua2HqMl/WmVmhv3tucbnfc
         QyOimJReRjWcrh4QGowMYf3XxBZUjCXGLyrOqq8eh/2x5HOdixpTwv64JF1tl0pa7Lgq
         qxtycBqANt7m1eLStHBM+//fjuJt0oOAw96EqhsiIaS86PRRutfgY5D/OWq9YPwDcejH
         Z9KyuIElO+MAXl8o4HD8B0tNe9pX/BurnjxAIE+FeAZFDvV2CrWLvOwALlDe+SkeZfyS
         cJoQ==
X-Gm-Message-State: APuU4Z/k3mNjoe/NkQXL/5cN3gExnZk1U/3foT+QS7G3D07uwv+lSb72
	E0BwCZeQRYFe9MAwHz0QOIxnYUbn0w+fMfFE64U0sQdDe1hxS34Ge1v0oPKy0+iOJCDvv1enlYy
	WQU7o
X-Gm-Gg: AZFdTZfTjwy6Dzzh2aEwH9Kh4R9A7WOXXrBMidwNi8tC+Tq9K/f30Ae1iJZpBf7yAE2
	+wz8S7e3Xv/0HWXNo6u4gcN4FQgrG5m+zuUmyWC7RRaEIKD9QFZnvJOT9M4UEAOrBm8wuHztZRF
	H0lv++ooXOj9cZRNJga06Kk1mz5q/dvnPM402x63CY1sj+vHfYb18ni3QEbJkRFLJXATL1CEEzu
	BB+FjNr0CPUyAfWf5P8UWObg7pVlTc1qqg27g1W7nEGYOanAGWAnmFPm2uCmx1CeFh1AKZIXK0M
	x+2nXzKKphV3X6KSeLuj1Ys1sWKO8XHrOUCosEa7y4Ii6X5ikmiaRWnuAHaOCovD2wvcif/MvFq
	w3znPBG67duGs/cdBWmxmjxiPH7D7v+LIrr6em2Y6ytDndovpN0/36xK7jggUL5OmvwUCl49R5g
	mmNBaEM1u5dDynaaR213PHwLpp8u42Z+6tFUP50jsEiqlrjqvYhhQ0Fn1WF/q/C8+0/iX9WcqoW
	F1P9yrOwh/yDMxJkNthNVz+BHqXiF3r0BD73qZ7axoh/qYo2iZfho/BvvV1iHiEpyN6fckb+JrU
	mUr7EWgNmDRkiEOkhMLLgeabPJNR
X-Received: by 2002:a05:6000:470c:b0:491:ed89:a38f with SMTP id ffacd0b85a97d-4abb04b0a94mr44031075f8f.23.1795772732369;
        Fri, 27 Nov 2026 01:45:32 -0800 (PST)
Received: from draig.lan ([185.124.0.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f204sm55575776f8f.21.2026.11.27.01.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:45:31 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 7BB505F7FE;
	Fri, 27 Nov 2026 09:45:30 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: virtio-comment@lists.linux.dev
Subject: Re: [PATCH v4 06/12] virtio.tex: sort package list
In-Reply-To: <tp5e8i.jz6212a121pa@linaro.org> (Manos Pitsidianakis's message
	of "Fri, 27 Nov 2026 08:32:12 +0200")
References: <20261126194632.2429425-1-alex.bennee@linaro.org>
	<20261126194632.2429425-7-alex.bennee@linaro.org>
	<tp5e8i.jz6212a121pa@linaro.org>
User-Agent: mu4e 1.14.5-pre2; emacs 30.1
Date: Fri, 27 Nov 2026 09:45:30 +0000
Message-ID: <87ld6etxol.fsf@draig.linaro.org>
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Post: <mailto:virtio-comment@lists.linux.dev>
List-Help: <mailto:virtio-comment+help@lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
List-Owner: <mailto:virtio-comment+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Manos Pitsidianakis <manos.pitsidianakis@linaro.org> writes:

> On Thu, 26 Nov 2026 21:46, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>>This will make auditing and adding new packages easier. Unlike its
>>cousin for virtio-html.tex it is slight complicated by the additional
>>optional arguments for each packages.
>>
>>There is one package that breaks things so we keep it out of order and
>>add commentary.
>>
>>Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>
>>---
>
> I think this patch is unnecessary, since \usepackage order matters in
> LaTeX, as you discovered.

I can drop it. I think generally having some sort of order around
inclusion is useful when trying to figure out what is already in when
you need to add something new. I don't even know if we actually use all
the packages that are included here.

>
> But in any case:
>
> Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
>
>>v4
>>  - handle the fontspec special case
>>---
>> virtio.tex | 41 ++++++++++++++++++++++-------------------
>> 1 file changed, 22 insertions(+), 19 deletions(-)
>>
>>diff --git a/virtio.tex b/virtio.tex
>>index e02b341..9071cb2 100644
>>--- a/virtio.tex
>>+++ b/virtio.tex
>>@@ -6,40 +6,43 @@
>> \documentclass[10pt,titlepage]{report}
>> -\usepackage[top=3D1in,left=3D1in,bottom=3D0.5in,right=3D1in,paperwidth=
=3D8.5in,
>> paperheight=3D11in]{geometry}
>>-\usepackage{parskip}
>>-\usepackage{setspace}
>>-\usepackage[english]{babel}
>> \usepackage{ae,aecompl} +\usepackage{array}
>>+\usepackage[english]{babel}
>>+\usepackage{courier}
>>+\usepackage{enumitem}
>>+\usepackage{etoolbox}
>>+\usepackage{fancyhdr}
>>+\usepackage{fancyvrb}
>>+\usepackage{float}
>> \usepackage[T1]{fontenc}
>>-\usepackage[xetex]{graphicx}
>>-\usepackage{placeins}
>> \usepackage{framed}
>>+\usepackage[top=3D1in,left=3D1in,bottom=3D0.5in,right=3D1in,paperwidth=
=3D8.5in, paperheight=3D11in]{geometry}
>>+\usepackage[xetex]{graphicx}
>> \usepackage[xetex]{hyperref}
>>+\usepackage{lastpage}
>> \usepackage{lineno} \usepackage{listings}
>>-\usepackage{courier}
>>-\usepackage{fancyvrb}
>>-\usepackage{array}
>> \usepackage{longtable}
>>+\usepackage{ltablex}
>>+\usepackage{mdwlist}
>> \usepackage{multirow}
>>+\usepackage{parskip}
>>+\usepackage{placeins}
>> \usepackage{rotating}
>>-\usepackage{fancyhdr}
>>-\usepackage{lastpage}
>>-\usepackage{xcolor}
>>+\usepackage{setspace}
>>+\usepackage{tabularx}
>> \usepackage[explicit]{titlesec}
>>-\usepackage{mdwlist}
>>+\usepackage{underscore}
>> \usepackage{url}
>>+\usepackage{xcolor}
>> \usepackage{xifthen}
>>+% fontspec must be loaded after titlesec (which freezes ex-based heading
>>+% spacing at load time) and before xltxtra (which loads fontspec without
>>+% [no-math]).
>> \usepackage[no-math]{fontspec}
>> \usepackage{xltxtra}
>>-\usepackage{etoolbox}
>>-\usepackage{tabularx}
>>-\usepackage{ltablex}
>>-\usepackage{underscore}
>> \usepackage{xstring}
>>-\usepackage{enumitem}
>>-\usepackage{float}
>> \IfFileExists{ellipsis.sty}{\usepackage{ellipsis}}{
>> \message{!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!}
>> \message{LaTeX Warning: Missing ellipsis.sty: dots (...) will look ugly}
>> -- 2.47.3
>>
>>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
