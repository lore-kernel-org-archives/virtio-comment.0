Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FFD92D46DA
	for <virtio-comment@lists.linux.dev>; Tue,  7 Oct 2025 13:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759842903; cv=none; b=IlkJH3vmlbX8ioLJjsmYo67B/AtzcQ3qDviIXbBPK5kn1rrepEPDH6e3nG5WcIXXCpdc/vgMy+cihj2ExBCMKZGaFTV5Aa4VjbUCEXmCfsVxZf1JJ+g6J9/ICIdAn+g+2g82bDEJKjHmqMWoL7ZsLkfYgG+e47vfaV/LV28YpzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759842903; c=relaxed/simple;
	bh=MgLsXqKce+PJq10LjoKQuQuPuDuJoYwkB5BwK6jFsAE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=HoO8dTc4zhW8UiagnFS+SOTanR6y8OB0BZkWRwUCrnfCzCQr1yMo2lDsm+Nx9mge+it/Xn4oEFVEgMsOS/LMiHaoQU9cxoPqHO6yK78PvCzr4LXK5ZlyWtVM96OlFqApWX0NVzkYyJbvCy+UOIR9KqLlRXjLbsUFJzMrXaHQn4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yD0PuVTh; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yD0PuVTh"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-46e326e4e99so37660325e9.1
        for <virtio-comment@lists.linux.dev>; Tue, 07 Oct 2025 06:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759842900; x=1760447700; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x/vcfU1OPoRPNi5tLjk2ErnCd65kO+ckAzAGDbV+2pw=;
        b=yD0PuVThNALsyUW9vdsz1dbKiFyfI6/XHMRFczQrR6ZcwVOe1JqnrG9bIgaPKhyv8O
         Iz14Cs9MxZoS7X3Z85HRSKcKDwlgRjyEo9XmJa1VlYklP79myQ5jgU+MC+qQS3H4deG4
         OmOlSvBq9o8K23ac/9iPR4lWUnF7Dk6ibhX+QZqBiRhkD65aybIRFANdoweb12pK4XiI
         kcPWRltizmNgVNsptir66uJJUJQd8lvuPZJwJ9A49cLuqmGBKXknDrJTkrlDE6SDlG4X
         uFYC7O58Q6wK08bb2tjkvbLF0gj8H7GO/frjc8nET5snJiH+gTk7LTjum3+ok4vS7O2p
         hmjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759842900; x=1760447700;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=x/vcfU1OPoRPNi5tLjk2ErnCd65kO+ckAzAGDbV+2pw=;
        b=k+8CrKldYA/wt0g36N66COJzB6XgjH80R4qkS9Gv5xNA2msviwYnGi06dAFmvN+1iE
         diKsRgqrNZ8xVxNJg+IoajydUb7GN0w5qgcmys+sDOpMx6tSDyZeQiiZung6QuHej4mC
         9D6Uy1yOm6EVUsypZ/eex9lxnbTB4vbJvjQgEy7ZFth/VyPf05sKD+ceijtwfr9L2Gcf
         l41fa7qO8Qf4dSMS2Qq7RWOMr6sfAfCYWCPfRNkwH7QquLNXwYB/ShU9oMTg0vLL+ZL6
         IjH+damKOKJv22O/vmvE6WEm4MQ9N2FAEeIfX4EG87frAgyY0DqizgSfxuCXVNlo+VD2
         2wGQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+yLfkR+SU55+AIJoa/3pCv/RFtgrwtJxjvhOJ0TJYjsHtLdrv2wfPZrU8eOrIiPd3kxvAxXb2Ik+UeYiZ3w==@lists.linux.dev
X-Gm-Message-State: AOJu0YxsNkwU9frJWuNQFvQ6FTtDr/bTPiTQf0oLk70aePUY0GZjoz6o
	hqp0Csv6RKn8D3b4UhyN/uFoNM9TV0EDVl6c3ir6btxosknyjLZDTPgdycSxM4l1STs=
X-Gm-Gg: ASbGncs6I+TeSGZP2YAeBTg+r8SC+odtlpwmdZRBCeq1YJI5AtVbWC6A17xRbqTM8qR
	DuqyjmBABZsZt777eg278v6TBlZW46nPMs9CkvpYnlQZkbPjbTO/eqSRGF2BmAeIYw0QEIeSMOW
	M1UV/6oiIzKJr+wuid+ajC0A0KkqUCvzpLRtnNGVclGz+gsd1CcTX+AgtpJPkX9unWEJjMSD91Y
	j4oOwQSnYEbwOXYJn2qAtcMZQSN4dwZya+8p26BhRbIhuguLQB6X76rTGoG6DCnftO1gdjIqaAS
	95koryHRDjR6J5KYj9tAfadF1uQdrg8igxnCSSNe+JcXYptMcULzB6hZLS4MCO/C+xY4UZvmdZF
	QcrO1RjtPfUdui+xIcU7IALkNapg7ZnItuNB+EnIxF4CSCxmvPaIL9YmYgHwaBQ==
X-Google-Smtp-Source: AGHT+IGafO+i8ZOYT5H7Kj44F1E9fILcpBlS3UZrhQqIRrIf9/SmYRTDVHnEO+F8Jdj/0UMQrUvTpw==
X-Received: by 2002:a7b:ca44:0:b0:46d:e5bd:2ba4 with SMTP id 5b1f17b1804b1-46fa29ffedemr16004465e9.18.1759842899903;
        Tue, 07 Oct 2025 06:14:59 -0700 (PDT)
Received: from draig.lan ([185.126.160.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e61a16e13sm306117925e9.15.2025.10.07.06.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 06:14:59 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 309505F812;
	Tue, 07 Oct 2025 14:14:58 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: tex-live@tug.org,  virtio-comment@lists.linux.dev,  tex4ht@tug.org
Subject: Re: VirtIO html render failure using htlatex
In-Reply-To: <CAAjaMXb+_DXG+P+3-bVAOCcSgSO-OVEWFX6-JNNbbyRoFTy0iA@mail.gmail.com>
	(Manos Pitsidianakis's message of "Tue, 7 Oct 2025 11:33:39 +0300")
References: <87frbzgaxu.fsf@draig.linaro.org>
	<CAAjaMXb+_DXG+P+3-bVAOCcSgSO-OVEWFX6-JNNbbyRoFTy0iA@mail.gmail.com>
User-Agent: mu4e 1.12.14-dev1; emacs 30.1
Date: Tue, 07 Oct 2025 14:14:58 +0100
Message-ID: <875xcqzwdp.fsf@draig.linaro.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Manos Pitsidianakis <manos.pitsidianakis@linaro.org> writes:

> On Fri, Oct 3, 2025 at 8:19=E2=80=AFPM Alex Benn=C3=A9e <alex.bennee@lina=
ro.org> wrote:
>>
>>
>> Hi,
>>
>> I was attempting to re-build the VirtIO specifications since upgrading
>> my main machine to Debian Trixie. The build fails to complete with:
>>
>>   ! Undefined control sequence.
>>   \f:HBorder ...border-top:1px solid \#\hline:color
>>                                                     ;"></td>
>>   l.867 R
>>          ead / Write & Device Specific & \\
>>   ?
>>   ! Emergency stop.
>>   \f:HBorder ...border-top:1px solid \#\hline:color
>>
>
> The problem are the tabular environment's \cline macros in
> transport-pci.tex, removing them will make compilation work.
>
> Perhaps this tex4ht version does not define it like it defines \hline?
>
> CC'ing tex4ht mailing list.

Karl already forwarded it:

  https://tug.org/pipermail/tex4ht/2025q4/003775.html

and:

  https://svn.gnu.org.ua/viewvc/tex4ht/trunk/lit/tex4ht-html4.tex?r1=3D1750=
&r2=3D1749&pathrev=3D1750

I'm going to roll the workaround in my virtio spec patches in a bit.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
