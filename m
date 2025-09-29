Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE55A23026B
	for <virtio-comment@lists.linux.dev>; Mon, 29 Sep 2025 18:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759170177; cv=none; b=RniKJFrWeR++K2jQx2DqDq+qyiBb1N/rTwB3fI4xStydR9ryK/0Cmh7vlhc62V5eyBjGy1ywH3ppZqRzynb7or6/LzEls5Oh+XrbyofXuS0ZuMEnUo3unzudFpB4ex3k6yIW6Wax0u9F6kXIvk+kih41absBlMRh0YMrb3SdpzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759170177; c=relaxed/simple;
	bh=jO2cGGv8cI2XFDJ7t1t66kdPb9H1BvHc7+jMBG00YAo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=QMlyA86GOVUdWBhZ9Gyj2ShbOhOXtJtJ+BarKDVWna2bLUB2sBye4nIeU03Gt/fxj1NgQfdvusMxfDjVTp33MVJl3LfbZM2ZTpcAUgV+m+7QoUh0VK1C4XytAbJ2MgBy3b0gJ8X9Ho7x/TSWu4INrIMw6UXzpDxGAil56LuDd4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Q6NkqRC1; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q6NkqRC1"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-46e4c9083a0so17337815e9.0
        for <virtio-comment@lists.linux.dev>; Mon, 29 Sep 2025 11:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759170174; x=1759774974; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H1pQyV6mgwwu+snxIDyLIkIYr16Zx68daKn6T0auYqM=;
        b=Q6NkqRC15dBsPIY7snB1ZmOxF/Cpw+8y72aG6BAQ1PWDAsVuE/r1WqXz3OGXy5cL13
         c7Un4k1yUn937fYnE8rlSkvAGyw3QbKcwOgk0Mk6KLbYo5/41ihm0gUIKPBAcuYC0NYe
         BdkCvx884sB5j/F0ErU454dCWkDsM53FwCwR8n51ciMTI1xJK2/BNBX4AM6k3fiz3EuQ
         /24exD4P4ksFDFXYBy6GlwRrwf8N0s5Dshhq1TsVEJqHoRZEvA1j6uyJlCTjwVLHkUgY
         nha7+pedzZdblAdBh1UlsYsbm++pCMk6Hh0E92fAaGcT9dltuLFjIMLylpD1KdK53zrF
         GZLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759170174; x=1759774974;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=H1pQyV6mgwwu+snxIDyLIkIYr16Zx68daKn6T0auYqM=;
        b=gTed1iny52g/44hSwyBUQEbAN9a/+ZOe2WRFUXsV9TzAjrsLIQ4hp6F76m1+wgiNO1
         JULKP0LL7jxJgI8gYI0vb+WQj3928Ekh2bPaKxkgeqDriAhlnZshMlDcrDF90N0S2n0N
         msIoXSzkmmEwW1pA5Kv3nGsoMLq4ySShEEsQqZOxzI5j105F08JKn+Z5Tq3rYahpZO2A
         P4uoJHbYmPy34Hns7kTRb0kD8+99C2fRIWrpqy2QSkZruj/PC4SMfFZzm+XBUfMfERHJ
         LJrGwh7c6u1wZ70wP90i7L5YtbIbGuS4EyCCZpXDwjjac5ATbTysuJOu5jPGFjZkMdNG
         e88g==
X-Gm-Message-State: AOJu0Yw0RMm6PkxQdFbVEM2rAgWSUH5y9ycN25Q+KKskEeHasWCp9JdP
	J/z1rIhhm3nwoBnWcIW8y9voQqluqUY5UVlpPFyWO6p0H1tXi+PtwCQyd2Zohb0SRrU=
X-Gm-Gg: ASbGncviJlaxSIWpNFZzay+O8JIUJSJ0tF5wCRa1N/Oo61mTPkSNl/MPAa3eFlmtsYa
	95hXEgq7agYbyIfVy6qQCYOXpdUcw/sxmj6rK/V3QnxtXffXPJy7sOj60+qGiUnIaWy3Z1UyL89
	dAb9AMbY9HHB3hYLJ8/8Y9O4uMNQopPBB+t2zREJTmRfWyYQNBr2jp0JWUmyo7PMGGYol+hA6nz
	XpIJ6Ty7044PbvYZ6TA8JN2PqQ5xv+8cBecG9JeihgKu7Q8gu7hc1TBW/bwHO5RgbFSMWU5WOvQ
	mvx/odHEov/OgvCH2ljlZVZ8UoKbVirSEG7FnEdv2OEW+Ecdl80wIS8yqkYrAnwK/nVuiWgd7gR
	Cgf2f/W115aD3LoJCQlJH5/W9KOIAyVGROg==
X-Google-Smtp-Source: AGHT+IFRSa27D8ilmBP1hKK5XJvXqm4VKjwSCXYst7GUp2kg4bihxoltyEioGlinBt70LrPKyvOx5Q==
X-Received: by 2002:a05:600c:198e:b0:458:b8b0:6338 with SMTP id 5b1f17b1804b1-46e58aac146mr18289895e9.6.1759170173825;
        Mon, 29 Sep 2025 11:22:53 -0700 (PDT)
Received: from draig.lan ([185.126.160.19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-40fb72fb1a3sm19664797f8f.10.2025.09.29.11.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 11:22:53 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 1A0425F83A;
	Mon, 29 Sep 2025 19:22:52 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Parav Pandit <parav@nvidia.com>
Cc: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
  Michael S.Tsirkin <mst@redhat.com>,  Cornelia Huck
 <cornelia.huck@redhat.com>,  Bill Mills <bill.mills@linaro.org>
Subject: Re: Use of LaTeX for the specification
In-Reply-To: <CY8PR12MB719523C466209B552DE30000DC1BA@CY8PR12MB7195.namprd12.prod.outlook.com>
	(Parav Pandit's message of "Mon, 29 Sep 2025 16:51:29 +0000")
References: <87ms6dl3sh.fsf@draig.linaro.org>
	<CY8PR12MB719523C466209B552DE30000DC1BA@CY8PR12MB7195.namprd12.prod.outlook.com>
User-Agent: mu4e 1.12.14-dev1; emacs 30.1
Date: Mon, 29 Sep 2025 19:22:52 +0100
Message-ID: <87o6qtjeyr.fsf@draig.linaro.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Parav Pandit <parav@nvidia.com> writes:

>> From: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Sent: 29 September 2025 08:11 PM
>>=20
>>=20
>> Hi,
>>=20
>> I recently updated my distro to Trixie and found that HTML generation is
>> broken.=20
>
> I test html and pdf generation regularly on merging patches.
> And it seems to work for me with below version.
> Which one are you using that fails?
>
> XeTeX 3.141592653-2.6-0.999993 (TeX Live 2022/dev/Debian)
> kpathsea version 6.3.4/dev
> Copyright 2021 SIL International, Jonathan Kew and Khaled Hosny.
> There is NO warranty.  Redistribution of this software is
> covered by the terms of both the XeTeX copyright and
> the Lesser GNU General Public License.
> For more information about these matters, see the file
> named COPYING and the XeTeX source.
> Primary author of XeTeX: Jonathan Kew.
> Compiled with ICU version 70.1; using 70.1
> Compiled with zlib version 1.2.11; using 1.2.11
> Compiled with FreeType2 version 2.11.1; using 2.11.1
> Compiled with Graphite2 version 1.3.14; using 1.3.14
> Compiled with HarfBuzz version 2.7.4; using 2.7.4
> Compiled with libpng version 1.6.37; using 1.6.37
> Compiled with pplib version v2.05 less toxic i hope
> Compiled with fontconfig version 2.13.1; using 2.13.1

=E2=9E=9C  xetex --version
XeTeX 3.141592653-2.6-0.999996 (TeX Live 2025/dev/Debian)
kpathsea version 6.4.0/dev
Copyright 2024 SIL International, Jonathan Kew and Khaled Hosny.
There is NO warranty.  Redistribution of this software is
covered by the terms of both the XeTeX copyright and
the Lesser GNU General Public License.
For more information about these matters, see the file
named COPYING and the XeTeX source.
Primary author of XeTeX: Jonathan Kew.
Compiled with ICU version 76.1; using 76.1
Compiled with zlib version 1.3.1; using 1.3.1
Compiled with FreeType2 version 2.13.3; using 2.13.3
Compiled with Graphite2 version 1.3.14; using 1.3.14
Compiled with HarfBuzz version 10.2.0; using 10.2.0
Compiled with libpng version 1.6.47; using 1.6.48
Compiled with pplib version v2.2
Compiled with fontconfig version 2.15.0; using 2.15.0

It also fails run with the texlive distro:

=F0=9F=93=A6[alex@texlive virtio-spec.git]> xetex --version
XeTeX 3.141592653-2.6-0.999997 (TeX Live 2025)
kpathsea version 6.4.1
Copyright 2025 SIL International, Jonathan Kew and Khaled Hosny.
There is NO warranty.  Redistribution of this software is
covered by the terms of both the XeTeX copyright and
the Lesser GNU General Public License.
For more information about these matters, see the file
named COPYING and the XeTeX source.
Primary author of XeTeX: Jonathan Kew.
Compiled with ICU version 76.1; using 76.1
Compiled with zlib version 1.3.1; using 1.3.1
Compiled with FreeType2 version 2.13.3; using 2.13.3
Compiled with Graphite2 version 1.3.14; using 1.3.14
Compiled with HarfBuzz version 10.2.0; using 10.2.0
Compiled with libpng version 1.6.46; using 1.6.46
Compiled with pplib version v2.2
Compiled with fontconfig version 2.13.1; using 2.15.0

>
>
>> As far as I can tell this comes down to the use of \cline as shown in th=
is
>> minimal example:
>>=20
>>   \documentclass{article}
>>   \usepackage{hhline}
>>   \begin{document}
>>   \begin{tabular}{ |l||l|l| }
>>   \hline
>>   Bits & Device Specific & Purpose \\
>>   \cline{1-2}
>>   Read / Write & Device Specific & \\
>>   \cline{1-2}
>>   Purpose & Device Specific & \\
>>   \hline
>>   \end{tabular}
>>   \end{document}
>>=20
>> which results in TeX ending early:
>>=20
>>   ! Undefined control sequence.
>>   \f:HBorder ...border-top:1px solid \#\hline:color
>>                                                     ;"></td>
>>   l.8 R
>>        ead / Write & Device Specific & \\
>>   ?
>>   ! Emergency stop.
>>=20
>> I'm liaising with Debian and the TexLive authors to try and figure out w=
hats
>> going on. However it does raise a bigger question for the specification =
- why do
>> we use LaTeX?
>>=20
>> I don't doubt that is a powerful typesetting system but its arcane synta=
x is a
>> bit of a barrier to entry especially for casual contributors. With the r=
ecent
>> breakage I wonder if I'm the canary in the coal mine and this will poten=
tially be
>> a problem for everyone else once their TeX setups upgrade.
>>=20
>> I'd like to augment the repo with some GitHub actions so we can keep an =
upto
>> date rendered draft available as well as some lint checks so we can avoid
>> introducing dodgy markup. But firstly I want to ask is LaTeX the right s=
ource
>> format for the spec going forward? Is this something mandated by OASIS or
>> just an accident of history?
>>=20
>> Thanks,
>>=20
>> --
>> Alex Benn=C3=A9e
>> Virtualisation Tech Lead @ Linaro

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
