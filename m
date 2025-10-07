Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49DFE2D7DE8
	for <virtio-comment@lists.linux.dev>; Tue,  7 Oct 2025 08:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759826051; cv=none; b=HfrO0VoQKKvV0x45hhGU3FopjTwbuzGjNc7fZFkM8ZnZSDTHpeLLZoZEnLacq82m9ckuEjgT6gTq3iO7JJ8cLhppV3T+S599iWL7BjmmuIhnk24la3tblYRfGsi9GkaOjRYhbe793y2nrl/KvYP2yTSg+vj1c8B2onR5LYHQpmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759826051; c=relaxed/simple;
	bh=wrn7PRRFCbNMQG8SSOwFzTQ/LC4TKGDhEt+piBX0cAk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Km7A5lM4rfB9rbIJPzbRhuFJy9StiQoTEl66MIPamFoCRzX3NXJ+Ec82KUWAS59GoeZi/0kXmkBt08omeLHFyewL0Pd6N8pPcwy4An5XdIlrP+q1xIlWft0YCxuH1XHAS7dQ2azqza+VMByc+IsTqiF5IU8qjTTjO634WmrUPtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M3aSb57S; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M3aSb57S"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-62fc89cd68bso12527036a12.0
        for <virtio-comment@lists.linux.dev>; Tue, 07 Oct 2025 01:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759826045; x=1760430845; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kuj9JfuGmdY2jNfHDDRZ579e5zCY1nGuFCwZHMWx+rY=;
        b=M3aSb57SVfm3Np7e0GvlYikHRAUiYl7LyhRTZ3e9u+cSgbu6s9Qwz/es2KWQIpi6BX
         7rAEUceaPO6Gc1A7WBJEUwoNmxZXDaCBjfs/9KHl14mY5x2b8XWXYqWSCn48zG/Fy40y
         SVqWKlFhFhrgEUbQarSUPEXMiUq1vs8iCXfxQ05FQnuzGQ5tQtJUo/FKJK2L8uLbIkeE
         oRIa3JyUtDO5DD42qI2U9yqcpNUhSJyyS2l7geSwgCR36tLDy92HcZcZuAfR0V8BJnLb
         i9W/fmM72YoJs1OR4MfU6vOVm7iwClqKgGTF7WaIpzxJntl4kwO4sSE0/a1V679cLksM
         dK7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759826045; x=1760430845;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kuj9JfuGmdY2jNfHDDRZ579e5zCY1nGuFCwZHMWx+rY=;
        b=DfwZIIL2G0VhXqFCw9wN7A/AgFtC1+Q5MBVj/9YiYsqQYrBJBQ6FfwNcRakFYZDTGz
         UIUPasNG4jZvSq22TqPfxtDdVETEJisKYbpb4CBQeaHFcsXEdsaHq3oENH0z5yHN1l1G
         1BlxJrf9/LIFgCtTm0AXBkjHKjrNDwP1rp9XbZuY60vfpuyRwweEq6KRagIVEjZpPOEk
         sYyh6FMHE0nNf5h4frM846vDbsRZKk2JLdPJssqZyR+OST0r7vL2Ayi9G+a6gf1GO9ia
         8UiDyI7cfqCUvhTdA4MZctSDhL8+LgpZFsv6ybQwYNILQu7amgW3HQmNG02XkGFV7MIg
         cubQ==
X-Forwarded-Encrypted: i=1; AJvYcCWG0f3Rl9Trn4uGgJBrfwTGt/F8+ij7/Q0NP/bAozYpUDGlNS2e+3AtBgzHCpUc0TMYNt6Vvrlu9bVXQywapg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwYC4Tj+PpKF2+ySr3S/JOuZtJtTW2m6msR7Wuln2rEBZJDmQRl
	abq9ueJplkVuZ2ilPqu2ZUW/3HCm4i7SqcngX39ebvqDNLqg/kGBVADjnanHgPcwnVg8oJd/bCi
	14b2guEDKEYQLAJccKZ+sPwfSHiJMUSr8V2zBr6U0jX+ORW6aFDVePP0=
X-Gm-Gg: ASbGncvWhAA6YwMifdp6LMQTJZNmHFGXczd8NM5UEzsxT96DDAIXrijW4UYWukmnb1Z
	s7qML0iy1g43wzYDfEjEGup7+Ox0cCOp9NAbTCycfuPYgkJeJBfe01J1i4JK0Vlpq2bxc4GqGdz
	NZzT/l6NqKqBviwN6lSSqSSWO5XVJhMhy1aHO/panEI8da3Zj3XIAAT08Ki3EEtIorb/cYI0BMb
	WOZyclZugkR6zhK7KElmwSA74kPzwj0Fz9r
X-Google-Smtp-Source: AGHT+IEQkEktN8UNWdPgKmeYw3NRgIclERYF9Elh+FahXlB2xUuXXFHsIpHEbn9U4mkQnKXGLyVvn8n9+co2tJeqKps=
X-Received: by 2002:aa7:c65a:0:b0:637:8faa:9e0a with SMTP id
 4fb4d7f45d1cf-63939c34f51mr11652199a12.30.1759826045485; Tue, 07 Oct 2025
 01:34:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <87frbzgaxu.fsf@draig.linaro.org>
In-Reply-To: <87frbzgaxu.fsf@draig.linaro.org>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Tue, 7 Oct 2025 11:33:39 +0300
X-Gm-Features: AS18NWAEtuMQ4mwP8l9nDn-RvgzNK65gTmBoBOT73KR9PHqwXpkFyC822Ffxg30
Message-ID: <CAAjaMXb+_DXG+P+3-bVAOCcSgSO-OVEWFX6-JNNbbyRoFTy0iA@mail.gmail.com>
Subject: Re: VirtIO html render failure using htlatex
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: tex-live@tug.org, virtio-comment@lists.linux.dev, tex4ht@tug.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 3, 2025 at 8:19=E2=80=AFPM Alex Benn=C3=A9e <alex.bennee@linaro=
.org> wrote:
>
>
> Hi,
>
> I was attempting to re-build the VirtIO specifications since upgrading
> my main machine to Debian Trixie. The build fails to complete with:
>
>   ! Undefined control sequence.
>   \f:HBorder ...border-top:1px solid \#\hline:color
>                                                     ;"></td>
>   l.867 R
>          ead / Write & Device Specific & \\
>   ?
>   ! Emergency stop.
>   \f:HBorder ...border-top:1px solid \#\hline:color
>

The problem are the tabular environment's \cline macros in
transport-pci.tex, removing them will make compilation work.

Perhaps this tex4ht version does not define it like it defines \hline?

CC'ing tex4ht mailing list.

--=20
Manos Pitsidianakis
Emulation and Virtualization Engineer at Linaro Ltd
