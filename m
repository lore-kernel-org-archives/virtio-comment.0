Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC251A6815
	for <virtio-comment@lists.linux.dev>; Thu, 21 May 2026 14:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779372186; cv=pass; b=NSS5DFy6i6jW5M88m3v4ADr0IfB/yKGtcrjs5FyYjBgxITuc1kIxI8s8Z/gAFdFC+F+B6sV8P7hfRWfWbebm9le835VKC7nmK/HNQCVBt7WmOvH5eCU898gk6ikpKQCqTInMybQvZs0j65Tinr5R3pzZ5bmyrwU3FMVzE6N+fAU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779372186; c=relaxed/simple;
	bh=fF9LigvOep2xnlna3pzHzNvuf32SLTa3qPqBshPCt8k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ubXtJt3I6Ogod8tDeWOHJnDuqGcdhwab4gh3+tuoA9tvJSQpwf+v39Z10bj0/a4cQUMdzbbuM46v1/0qy7HPYpzvPHiOCNzBRnGc9stigwN+OKbGXklK51VDeEF0cysOojQ5eR6pDdN+lHvD/z+lFVnXs9kdbtu2hwYHjyinjyM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X419uDqf; arc=pass smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X419uDqf"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-bcda7765d64so1335602466b.1
        for <virtio-comment@lists.linux.dev>; Thu, 21 May 2026 07:03:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779372183; cv=none;
        d=google.com; s=arc-20240605;
        b=T+PcbIik5IZIf6pH5TH7SUhjV+QX0uy8OW7+TYYoJrOcR4TD5l8TqW3eejrSvmsV6p
         denXW86XS5/BG/MwpFm7yopzyhq1ey6IwRvV6RmktKqeN1LOWx69v4c0f7ymiOJ4Cb7P
         TO3hKMdkiobOhFCyVLi0AhbVxmu0gTDQpuIoeVM/9CKVg3bAusmbfR/OYfo+Eiy6Hxi7
         6pM0PTdIfOhldCwB7V+Qxum+oAPgRgM4kz3gSIbuBlTbSUvQSHUufTq/t8kmELVrJzzp
         19QjUU7hLfzjOKl4CWDDst/u2J2kBooW5NjHuDKUDiYLiTaOAv/WW7xtcaogK9/6zpju
         CUKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fF9LigvOep2xnlna3pzHzNvuf32SLTa3qPqBshPCt8k=;
        fh=NwF0TNH5UHE2VJ31RnQuVJGRm6XzVabejgeMv+xwjd4=;
        b=OuYRwbGXiJMva+XAhZDi7tf5gxBtAr/H8ITiFtZEBnMGVsDC5GzobuXiqGe4ZGuFjV
         jJet3j11djfM2zPL/3z3I/SSv9ERvvAJSPiYUxHZkM/TVanpL+M7qziKUGKNbm6Vf6it
         vEzx+PDa0umqbEiusCMEcQZcqZ9V8bZXjCHM2aDSxu6a+QhoxViyokONtNnekKdhcw8r
         EDgQjVKffiRQHO4pG9CRfvxoiQ+vZ9CBNW4s+gLjAS5/0zDWJsnLhZH6tHPFC4MjXmOD
         b4aSvPH/ZSRPT/ev7BOMtnFS+YkkGBv6xe+s5cxH5HUNj7r6CR98ONiEgGe+n0F3kq7w
         Ji5Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779372183; x=1779976983; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fF9LigvOep2xnlna3pzHzNvuf32SLTa3qPqBshPCt8k=;
        b=X419uDqfOuphI3+SWp5dOpcDJF7BNeF9nZwSFW8jsavorQkVUWzPt7kz8A7hRArqFY
         BBwGFu38GZo/WwAPW+YamXAzMoTKMMMQiXflJ4mS7cih7QKPhJLZOjb/NZRH8m/kyXF0
         9AcAT8DyGr0xLjETKYgOr71wC/e6tn08bZ67CYDgudtLBfRP0hJPghn8Ol688/6qzz18
         qktexdjsns1TwsNomhqVCrwOHv3hvalzyQgcRODV37pYXjLHYWXgI5hW/1o82iQi1gXJ
         CGSYDd8xDxGpaOt3TchMcRLzZt/yTWDMuABMmSW5PSVI2StwElM7s9oR3OSSoySmn7pi
         Njxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779372183; x=1779976983;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fF9LigvOep2xnlna3pzHzNvuf32SLTa3qPqBshPCt8k=;
        b=C6RUYWPNJeORSOBZjs9Htma5YylzCZ5C21gQXPoZD/IAKUbKwqotAp3DScw28ULS/B
         B39trjHxdPGOdOlZJT8wf1gc3lC2/s4LosMrvenWjPBVrluEuTZe51A68OoaFfhCZ+0Q
         510oUGoamBblm0/7lALa8KgTcLELPlsuMsJV8KlNqSmifXx70ZH0iCrZQLDRf7LDsEK9
         u2y0TByJGL6Bb3BotKAghPoMFVmPC5HZOGfiIIgEDhdVmj2gsqYf2yfpaEtgBnvQdKmT
         xUckrd+Ullb5zxbs29FC0zH/PyeKFPxb2N0YFWePAVMXpt54i8dn+zwwbdVUsF9HHH4o
         iH9g==
X-Gm-Message-State: AOJu0YwHzT2ImsSSaJc4Uj80b77CrQwGhGMzo1yQrZ9aqQDdjPSEKtwt
	0PHTcRHXKD6JiV516G1K5r67SsZlVWcctluXgjbBBH8MYK6Z0wypXm9mbOqkxl0pLOtPwHIVMTV
	nBCmdm05fKzLTaTSUXxEdc7hqtOoxph9EzA3yIGUK+Q==
X-Gm-Gg: Acq92OE9cvUlU+quwEthYAEy2FLnyq6eLt1tO+Mbk3ZJlBhTtoxj+gIoV5IiXhoDuTQ
	WqryFQWut1eHRWvrUCsxyAFlfNmilcJlDfCBQfRJZyc81/tSnGweZ+ytAZuFO8Vmrglps/t+uAQ
	Mg5yDHHbUvxtjZZlyi2sqsDImnGDr0bfPizXQDnt05X/WMTclqOui0bmrxdpnnzw1RBQXhDWz0x
	a29iKD5c1OvymapQyt+mQycUnh2vq2JShFjZM5Rp85ZDQXLPDePoLpD1qb6SCRZ91AFAieb+Qqw
	3EQv3Fw+rG/fHLm2IFzs6XhlGdqmLpZq64PfyGA=
X-Received: by 2002:a17:907:7719:b0:bd8:f907:ecc9 with SMTP id
 a640c23a62f3a-bdc07eaa2afmr119668566b.12.1779372182965; Thu, 21 May 2026
 07:03:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260515-virtio-gpu-missing-structs-v2-1-c45dec740af7@linaro.org>
In-Reply-To: <20260515-virtio-gpu-missing-structs-v2-1-c45dec740af7@linaro.org>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Thu, 21 May 2026 19:32:51 +0530
X-Gm-Features: AVHnY4KoZDQaXzBSP7EQQaERWtD9t_TWvexh5F--wAv_h3LVmpSqV3-MX8D-F_E
Message-ID: <CAO_48GF0hSLLRTJTA11=wNK6rt1xnOhPfNGQ2qb4zhuf8Dd99Q@mail.gmail.com>
Subject: Re: [PATCH v2] gpu: add missing controlq (3d) struct listings
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: virtio-comment@lists.linux.dev, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Manos,

On Fri, 15 May 2026 at 15:07, Manos Pitsidianakis
<manos.pitsidianakis@linaro.org> wrote:
>
> Lifted from include/uapi/linux/virtio_gpu.h with adjustments.
>
> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/239
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

Thanks; please feel free to add:

Reviewed-by: Sumit Semwal <sumit.semwal@linaro.org>


Best,
Sumit.
