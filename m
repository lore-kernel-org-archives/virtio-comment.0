Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 848722AEF1
	for <virtio-comment@lists.linux.dev>; Wed,  9 Jul 2025 09:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752053519; cv=none; b=D2ryHVT3RL1Ll3wM+D9rVcNBqyF/vPWs5Shak3LmqQAhAaRs+sDM2VVwlruwHo9Y8JwKmukUa/pfWC16TXXzPAQbF8rxNmBu62EQs7AaoKbeYtMOfcmaT3b0q40VEcU5o1wRqeWPM8bQsBXvsmGJOyKD03jeEdltLBO8cAByc+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752053519; c=relaxed/simple;
	bh=3j6Nw/3rjmNWsp7wMUc57MfhAZqkykwvsioUl7MnQUI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=M//M+57nL+FbE11g0vhrOAhW0jFaMPHENG1qK5fW+0Zp1OYFQfrfZ3WfyopMTiNspsZL8zSezapJX8kxqsBFa7LjKrFVJze7v1XjEXVAE8v4uo+eSHPcQ97R0KYcppD8ZszmpgCUnxVD8Yl31GsjOqYJlNEAfMtx0ecQoLxXYfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zr6ixYke; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zr6ixYke"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-60702d77c60so10443497a12.3
        for <virtio-comment@lists.linux.dev>; Wed, 09 Jul 2025 02:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752053516; x=1752658316; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3j6Nw/3rjmNWsp7wMUc57MfhAZqkykwvsioUl7MnQUI=;
        b=zr6ixYke2WuJdUa1c1skcVoUfWXBrqnKuMXRZiS+DYs1o0/EAiV6M0kvN6Eb+PLOme
         DLLbTj92WQ8wJ3hm0C6JHQN1LrnentGA8iIbVQ4eKWu4d6xH6QlH+yfp9HOhhVflGt74
         oLnZgljuSrLDic1ZdFqkBwq9HV19+Y+qhkcADDcCO8kQIe7UMvLFRfMFXl9KcIulfvza
         E3DyhGMI0AZUs9RHo0zfigM1uuHrcXHu71449bYvkxvbF6UIuOK2M1tY2Hlrwiqtvfgf
         ci8Cn/Gves7RnPz6IokpXylHLMMi4r0UF5cmQtrRKkvr9zj3DluAijway/lOjuDdJU1t
         LIsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752053516; x=1752658316;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3j6Nw/3rjmNWsp7wMUc57MfhAZqkykwvsioUl7MnQUI=;
        b=g6wjzR4EI4ntKCUY6RoW8ti5Ou21WS0/lLyMDHr7URhBqU3a7wAd4vxMXjr8GuPiP1
         2YQlLrxjaOcd2VxLk/s+4S8ve/JSiR9/gPRu1+fCkRHj+5sbbi5QnbvP+6S6F/wYNTJ1
         CyKF4aXFRqxrPLxDsTqZyH5t1ekHw31HVNSv409lptliOLRKCMzAdK85ViU0N/OIyKdU
         8FNFlKfoU6J89rQvp+0D3zrsVTBON68a9s5rOgkhY2tRkXhQjjgtMNwQNRQpn+Dcj4Dw
         P0Gjr9jmSRsx2lXYGqkkVRGbjVlWmxeICDqo0b3z+tg56ErL9Jz9c0oQQ+nwzwgqvcH5
         w82Q==
X-Forwarded-Encrypted: i=1; AJvYcCV0dloJbQ7zqIu0VLKcLzLZv+7KieSQlyG28uGlQgSr2y6DH6eR4T0HUtpbprAvzZs1Q4dUZMEAPr2PvsMcxA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzeJmJQOkCHFvFvDLn1H4FFG19Rdl3mKtLw+ToYGIS8optNX9IE
	9znAXM04WFmYTxT1NgybeWHbxZKsz7zOhybBDZUxR4DYu6rpP2nels4vbZht/yjZncE=
X-Gm-Gg: ASbGncvIWqXBvtrjzfm+KYHwiy0q56RY81XSnR9E38S3ZNiw+CSradWZUouspZWFTIn
	7FCEVTGotgS9VC23lnsahxKQiP9ApeRmiNyjK6t0pJ26QGL2R74O7AsBV7taauS03WWXvZ9aSIl
	vlVO5qB6rVkUixPNXpLlFtaYSw8AqAo0WCTpEImielK6Q9H7wdL/ziY4nCcyir6PavLCtlEFsjs
	aHX48bxN2RJJBoipNy99SVP8U+JzorMjYcn6n26YwTbM5CfJuXv+3/e2+GTrukcUOvzvA+1YmeT
	XXqy1KyBa0hTTzTssWiYAodqAjjzGVfyuLZveCCtmLlU+NRRPsEu9yIrGaYoBek=
X-Google-Smtp-Source: AGHT+IGfXv6UT6eMTxLabX2ErY3DxGgn1lwBfnlMUyZSq9ZsEvdxBXFBBlOksKpMnZpZA6oSuXIwkQ==
X-Received: by 2002:a17:907:2d1f:b0:acb:abff:a5b6 with SMTP id a640c23a62f3a-ae6cf5bc2c5mr164183366b.13.1752053515655;
        Wed, 09 Jul 2025 02:31:55 -0700 (PDT)
Received: from draig.lan ([185.126.160.19])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6d94baf65sm33241566b.89.2025.07.09.02.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 02:31:54 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id D7E9B5F767;
	Wed, 09 Jul 2025 10:31:53 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Albert Esteve <aesteve@redhat.com>
Cc: Alexandre Courbot <gnurou@gmail.com>,  virtio-comment@lists.linux.dev,
  nicolas.dufresne@collabora.com,  cohuck@redhat.com,  adelva@google.com,
  mvaralar@redhat.com,  hverkuil@xs4all.nl,  mst@redhat.com,
  dverkamp@chromium.org,  gurchetansingh@google.com,  changyeon@google.com,
  daniel.almeida@collabora.com,  agordeev@qti.qualcomm.com,
  eballetb@redhat.com,  ribalda@google.com
Subject: Re: [PATCH v8 1/1] virtio-media: Add virtio media device specification
In-Reply-To: <CADSE00L_ZGgqXYCttwGqD3ceBBaZaSVnPi9n6A1O+CyPBJe8nA@mail.gmail.com>
	(Albert Esteve's message of "Tue, 18 Mar 2025 10:02:41 +0100")
References: <20250304130134.1856056-1-aesteve@redhat.com>
	<20250304130134.1856056-2-aesteve@redhat.com>
	<D8G0UC5KFCYY.32BN79B9WOK33@gmail.com>
	<CADSE00L_ZGgqXYCttwGqD3ceBBaZaSVnPi9n6A1O+CyPBJe8nA@mail.gmail.com>
User-Agent: mu4e 1.12.11; emacs 30.1
Date: Wed, 09 Jul 2025 10:31:53 +0100
Message-ID: <87a55dvhfa.fsf@draig.linaro.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Albert Esteve <aesteve@redhat.com> writes:

> On Fri, Mar 14, 2025 at 2:26=E2=80=AFPM Alexandre Courbot <gnurou@gmail.c=
om> wrote:
>>
>> Hello Albert,
>>
>> On Tue Mar 4, 2025 at 10:01 PM JST, Albert Esteve wrote:
>> > Virtio-media is an encapsulation of the V4L2 UAPI into
>> > virtio, able to virtualize any video device supported
>> > by V4L2.
>> >
>> > Note that virtio-media does not require the use of a
>> > V4L2 device driver on the host or guest side -
>> > V4L2 is only used as a host-guest protocol,
>> > and both sides are free to convert it from/to any
>> > model that they wish to use.
>>
>> Thank you for your patience with this. I have done a final pass on this
>> version and it looks great to me!
>>
>> Reviewed-by: Alexandre Courbot <gnurou@gmail.com>
>>
>
> Thanks! Could we please open a voting ballot for these changes?
>
> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/214

What was the result of the ballot?

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
