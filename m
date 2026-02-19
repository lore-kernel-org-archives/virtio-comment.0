Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F7326A0DD
	for <virtio-comment@lists.linux.dev>; Thu, 19 Feb 2026 08:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771489840; cv=pass; b=m0olfpAsziisB0zP+B2jHuOmFzTdMNFlm7+8dpnlZol5djKjb55lcogNknpFgkFv6wAK6SJGWiKEf8hJJvF0cB0Yg9W2d1BcWfZRwJsPl8gVGBGEv0WHo45MuxiPyFFVlhMtpBfT1L/7VRKbCZyj/4DhWpG+jvXd+py5Ere67PE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771489840; c=relaxed/simple;
	bh=QEmWD3ZyKrLy5Z+W33bPjrumr8l7UBfhy/UgG+68KP0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t+dqqZshcwf5RhwRGhqOrPYSHjYkTZSRBAfZYVDDkMTTMfLdpun56XUz5uH0QxolcwkfWVLmtxINTyuQ32j+4k5y3tcu54DmsFDNdED9d+RJJpk18qZu1mhuHy+HKLegawcsDULC75C4Vx8vTiHvkDufBdh4kyaWxGmBXUY8pcM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ULTvtN/y; arc=pass smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ULTvtN/y"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-437711e9195so439682f8f.1
        for <virtio-comment@lists.linux.dev>; Thu, 19 Feb 2026 00:30:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771489837; cv=none;
        d=google.com; s=arc-20240605;
        b=fBkDCBSeb11nDiy/88+J9kTfCQWszt0Jm39lgyt4HbRYoWeUpckfzmLs9jKEICws7A
         bhqC4ijSuSOjfdzQZZHjBF7oWs7MZSfvST7auSxUXLs4Ijlrx87yb/6wfL3GAx2S1fD+
         tOlRpkHmcTUtOQ/VnwFBZHOgXXdRrd2ihJhhpOut2aUQlVtqGFZlRnxcFygFNewy18/S
         SmnhC1wU1SaoZqd2RXAzl7fReV93ykpZpX9nsk1vMOzYSf7on70Jt4B9Du1y7gE2v9yU
         KVLnfbT50NsBzc+88E6qBZPVvslQboAU0qMqxGUpa0dUfuFnJqkteKIVaNl0ux7zqzE7
         mqTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UeMWAeZ4SqekMDbI6wZP7/k7Bm5lBxSb9I1aR5BxnR0=;
        fh=rjBb7IxhhnsGnt8HksEH6pMEU66l46qhxJFEEALZbJk=;
        b=hws7BZedYh4Q2UQOufT0BCen9G7KOcCDVc1wT2C0tjyhSIwXh5RE/nKYMoYLeOO+0I
         2BVZHWVUP7AXSlVbOwfry0sUlmAiHwNWqfDCFGG9QMcq2oxA9Cp15box1o62d4b4/hb/
         92VlMzV8EYFVG8bWkD4ZCiu8sYmqYoXXtffapHCKR/hG5L5ShEKwJAxP3fN2fD0rtJ9l
         nlHzcsdKG8pqwOVzDLgGSlb4Fy/+OlrJUJuduC7nCUPWr6Wt192wWsbre7FVBOvf0yGB
         rpYD3CpoEarTJCxndBrd7UmDAXZIx2nidFSVSeB/6lJiqqduo8P2qLek1YR6RAlmas53
         l70A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771489837; x=1772094637; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UeMWAeZ4SqekMDbI6wZP7/k7Bm5lBxSb9I1aR5BxnR0=;
        b=ULTvtN/yogZFSs4xRdNLLgYkRXF3TOBoXI6pIZHRYsoRM7zRUvSP4gNnB2bj7N4MUV
         ZAPQybTgqyQAPZWrAQyDmONle84QfHYrLcaLjlZnyTxfhgPkekx5QU1akzp0akyE/b/Q
         onIWnFhVFUihdQBvpnfgga1Az9/UDRP+CAG8eu+GE0dGvZX53FAvqgayDX9htx5Yv9bP
         i6eNWscKIEWqamLnE9acMX0uU3up6owmORBcUZC0/gtjjnLvLehJ1oaDqGqjxmXXulTr
         bQLZ66WIPv1xwHu2/qFIWzi4MCjfbePZzCJDVQH70pePLJpNiME+bVu/WfOklpJlftAJ
         sf7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771489837; x=1772094637;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UeMWAeZ4SqekMDbI6wZP7/k7Bm5lBxSb9I1aR5BxnR0=;
        b=GHAOe+McPSOMeazILw9hMsc4bPbRpVMShzWeeIXa9O8N+2ZCYwovB0LddX0uK2Nd0I
         l1eZp0Yw+x1S+tzQRQq+ou3C1R1H8vcz2//O2yKeDfhIhMugyoqJ+Tl2GxKXYbnGlf6Q
         6GkxGdwGb5Pwg3iHnzY4BKwxxLk7G51PL95AVWu9vNKfzEuX+60jzJGRpSbGfQtUevKy
         Si9KgKh4QzLs5gI3hmN8mmWBK7Y/k+aeMynzV9TLZR10VhhxYQJ6oPPpBLtPArd0EEAp
         xrrQBTz1WlEycoChf0dtG3/XdZGpRzPo1apkA6385NRfzuA8jDIe4OOSAvwV1ZsaLdf2
         vjFw==
X-Gm-Message-State: AOJu0YyvcV5dMB9gXJZJdAaILWJYKyLFT3A8/PGctIhn9A25ahaSPQMF
	GN2BGenKqwIJYcBWnrMoMdixwCde+B2oTcAKtBsWY1hDHfqOsy0kfcACOQBL426nsVZLIH8hhfc
	BkWiKpxOIb3J0QFutJe4u6gxHbV+tcha8Dy/FxNZuqA==
X-Gm-Gg: AZuq6aLEFEv8wf/l4lMOFvHYPRus4lf9/WFnFVQL8IArIzzpnmf64qVb8sh5y1qhox+
	yHApzcg8ifmWazydk2AlUm7aaPF+VXDl7qeRI87XgGr5TQf+gi9TYu3hAq+xfMY36UQMSaWaL1B
	bN8PTn0YGVtm+whIrsZ0wsOIojaO2SKA8BzCICAeJ4kijUZw0W/42xREZd0gVLFXag4NElQbd3K
	cr3WHhgk0j0/YrXpGZsaumR2EV+E3PFSKPkncti5qzmcfheQhAIJjZDi6t+qBhutOZoub4O8c+F
	putp8qDFT0vqOfdFxaYXNO2GlXaF1c3gTdH3E+iKwtXZTAwYiQ==
X-Received: by 2002:a05:6000:2407:b0:435:a7fa:249a with SMTP id
 ffacd0b85a97d-43796b0548dmr35402707f8f.61.1771489837013; Thu, 19 Feb 2026
 00:30:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <oasis-tcs/virtio-spec/issues/239@github.com> <20260216081453-mutt-send-email-mst@kernel.org>
In-Reply-To: <20260216081453-mutt-send-email-mst@kernel.org>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Thu, 19 Feb 2026 10:30:11 +0200
X-Gm-Features: AaiRm50MzfnyXIHwM44-446qgSKxE7xfJ3OO_Q4eQbv0aPnAmzQaZxr38PpMnhk
Message-ID: <CAAjaMXYs+zHdL0w4-LFWZhhZV=6buSAPXVJ4+hWD=cO7utP9TA@mail.gmail.com>
Subject: Re: [oasis-tcs/virtio-spec] Missing struct definitions in GPU device
 "5.7.6.9 Device Operation: controlq (3d)" (Issue #239)
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtio-comment@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 16, 2026 at 3:16=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com>=
 wrote:
>
> On Mon, Feb 16, 2026 at 04:36:00AM -0800, Manos Pitsidianakis wrote:
> > =E2=97=8Fepilys created an issue (oasis-tcs/virtio-spec#239)
> >
> > These structs are defined in Linux UAPI ^1 but not in the spec, is this=
 an
> > oversight or on purpose?
> >
> > https://github.com/oasis-tcs/virtio-spec/blob/
> > 1ba6e8108644d598cf9c772bac7b856fb5c7df6b/device-types/gpu/description.t=
ex#
> > L752-L767
> >
> > Should I submit a patch to add these definitions?
> >
> > Footnotes
> >
> >  1. https://github.com/torvalds/linux/blob/
> >     0f2acd3148e0ef42bdacbd477f90e8533f96b2ac/include/uapi/linux/virtio_=
gpu.h#
> >     L296 =E2=86=A9
> >
> > =E2=80=94
> > Reply to this email directly, view it on GitHub, or unsubscribe.
> > You are receiving this because you are subscribed to this thread.*Messa=
ge ID:
> > <oasis-tcs/virtio-spec/issues/239@github.com>
>
>
> Pls direct all spec comments to the virtio-comments mailing list.
> Sending a patch is a great way to start a discussion. Thanks!


Thanks for the response Michael, I wasn't sure if this was on purpose
or not and did not want to send noise to the list. Will send a patch
if nobody objects.

--=20
Manos Pitsidianakis
Emulation and Virtualization Engineer at Linaro Ltd
