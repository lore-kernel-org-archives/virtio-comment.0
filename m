Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD1332692C
	for <virtio-comment@lists.linux.dev>; Thu, 28 May 2026 05:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779947275; cv=pass; b=rIxHgzn2g+YhSLtSzNDu3A3MBljZEXbci4KlwKAo89MmnoKlIvsjGGsr4SRwTPT/fMhrZtbIMY8r6J7PVNrB6ykj+nbcuqJfXJuseLpqdS1QSGit5yj0au+y3Yy+72D/0kKx8xs8y4wCjDMemjjyNsJoxufQJqzQtIPFacjOL4M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779947275; c=relaxed/simple;
	bh=Hs4fdAapIELWu0kg2JA+OfLhGM7gMYXxzdfPZYHKjEA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=obdIbIdVVLTEwz9B7tzWh1YOsq+drgBYSCN1kutXKA6jDkXWDzt2u5YsOUePMFXFOk5sYS/fBiGqwr1D+dsN1Yt+Q1knOtj+Y/xbX2M8Hu1h1naNETf2/gGJ5yBVFgZk0DdK5jQqzMFXXW53UoDqzMXT6DVuTby+vfnh8TH+C38=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uF8GrkXF; arc=pass smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uF8GrkXF"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49050bfe053so29361725e9.3
        for <virtio-comment@lists.linux.dev>; Wed, 27 May 2026 22:47:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779947272; cv=none;
        d=google.com; s=arc-20240605;
        b=cANCaDlMaqNQaLTDQwZSTO7gx4/7pI2dKPAL7da+P3uX2yPWRFAzK1Qzg5iWUEjpgJ
         BIAXAClGGdQALRZU9kO0TdIUMNC8B9PxQ5VVnfbo/PzSIqTq9GCtXXaO4Aw4vMBc5rWf
         Nmgh6Gg4u0H1zX5VlbGFKha7MhR+nAh0horTOG9DCKfW10ErP7mzjZ0EJ2xmYkR4MS6N
         zy+YMygzChd7TGr4UNNkiGeKYaHLkAjKPrcEhDRSWMMrJ8F5QFwZxv7640BN0hqPp/7n
         QqeAr0W3MQlWQkpZ7wya7sK8/b/0Y3pbXWgM25MO+Tvz+AEVCO/F39dnKLiwna+Q3kxb
         SVJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+CtWxfDzRMgP6sNvgNmCSUCkSOaRzimkTgswO+tZCHw=;
        fh=cHefYVcgLfJR61QpmERpVQRQkUV3zWQQ1bmtgTC5wfQ=;
        b=WN4xEy1fv9pN62xJEF86g1GIqVWSjI5wwD4YVqB6X2IkVsLuXxfRnB4Nadzp4+dUpN
         D6F/WoCmVDnChg3TODkTESed212z+qhJHJRXAN4lkv8hedLWT3SW7Fvpk00wVsyQ5bTc
         OX7zShDpaNk3RBS1X8Jx/ApG3VNU2/uQVLm2Lk+i1ldKyDM4j6N+uUlzlLM2ilfvk+cf
         pCWBathSV6Iz6R5i4yfI/+AdCFYh/qmMb7AoEhAQQL6RpGHMWfzXbQID0HumyilyyOOL
         ZnzOk0vE912RrW6xJ1J+ZXRg/OOmkSJPimO8Hk34uiW6iv0CA+e29rNSDQhCGg+2HEwJ
         qTQg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779947272; x=1780552072; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+CtWxfDzRMgP6sNvgNmCSUCkSOaRzimkTgswO+tZCHw=;
        b=uF8GrkXFXZoyq/30u46sdBv/jo/T79uOZiOdvf0X2CfXv8O7jgO6ve/DyjjBaYXojr
         BU1itFQ2g7ltBIngkI+aNv9Mx3nO2ZL2f3HnluxyhMyDuYX0YLAhHT1KniThN+PZWGsZ
         XUn0yY8LMEobKFPxRpZ3EPO9GMtVPvNI7RcbwGlOe67MDRcRYWxrnYykFjxQCtL7PZ6d
         KvczaBrUMBEJcMcJLNlzq7lqmLoOcH6rPZbRG/OPwr+wWv8Z0lr0Zv6Ms1wTmv5/E3zw
         3czFZ2m9P2hIQlwFDBYTENiolj7r4RLPzCyBFiyIO7d267bdbaN2CkaXe+eeFUVkTJmy
         uU0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779947272; x=1780552072;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+CtWxfDzRMgP6sNvgNmCSUCkSOaRzimkTgswO+tZCHw=;
        b=mL0aTwwgdstKSIX6drGvJqHfGKbjPyXuWafkR81pdJRSztcvLVP9VGtjwnNZJAjPXF
         5KaMfU1HZMp4U410yBGD2f+/0+CEYX1VqAQtalNORAl+nvPZvY23rbWMAQ0KIJut8KrL
         DV5GwYl8XInvEna9dp0CE73Ki1TaQWhsSaR4DYSU6HkBXbZd+W/5aV1/pXoIqPnxiaDD
         S/zvZ+/zOFBV76SYis5gahPueZhZq6qfcHGrI3jEiMj3RFk84MCP9T5IedIlRrXT70xN
         1YwQXjMNqWHbXKevtvxsa+ELcd1MVZbnhnp6unyE1P4ny/an/3LqZcoUpIlVxhe1it0a
         7lvQ==
X-Forwarded-Encrypted: i=1; AFNElJ8/dSCoWOG9o+dSOvDTEE/Z1CcxJUmwJE1xMjBwJ6w5PdOzzaH1ql24GEnBVHeOJxHDPuKVYE75sDD+uBuhQQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxyNr5TFiHsjomSbjqKvG+n1eyW26Yi4mSPZpA0TCinbxsvLLMk
	0bFhwROoIm84v8VLPY7UaGki9vqXJ2orc40iQnGJzvInFkKHIErvHws2ILVnsAsJZXMw6kq57v5
	gIka6CLooseB7Cc2kY5rHn7O/fxbQn0BkLemk/mIYpa4H6QHpblDq
X-Gm-Gg: Acq92OEh7QIL34No78h0+e3wECJZ7XgUa/k+cG9g4NqcW5enyGOHeCvhh/RZOmX1sHk
	IXdlnnAhlgPyMROHIRbqMWi5KzU0BtvrR2hUixcFuTwWZ2j+dlkU/wdAHukjCob/iJyoGiBFNyf
	KNta+Jtps8eLmKPSgUlwQ3l+6zN25xUIhqIqQIYooS+sM+aW3e/1PjmxVQTzTz1vWV7ZZ3n0Vqk
	u3cwBgXKBBUZZtuOLv/AHWFPDzDYIUMO6Eje91mO4VL/q2yRyR86Hg/thaqck3/y5cq/Q7uiaPy
	cM7yHKCqgGLEctHbZXvFxpVyPot24IkNERFlha8Gl2zdSaYDk3h/bExpzxsOHjbZLD4qmAM=
X-Received: by 2002:a05:600c:c4a1:b0:490:1640:8269 with SMTP id
 5b1f17b1804b1-490426d1a16mr428785085e9.18.1779947271882; Wed, 27 May 2026
 22:47:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <11771164-7919-43e1-a980-03f036bdae2e@gmail.com> <SJ0PR12MB6806C5A16CB0899E095E835EDC092@SJ0PR12MB6806.namprd12.prod.outlook.com>
In-Reply-To: <SJ0PR12MB6806C5A16CB0899E095E835EDC092@SJ0PR12MB6806.namprd12.prod.outlook.com>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Thu, 28 May 2026 08:47:25 +0300
X-Gm-Features: AVHnY4KvzITPxj1p198JJwaome-NutKnWxRmAEKaptXuzTq21WVj6M2YeCA1Knk
Message-ID: <CAAjaMXYGMTok_a2CJK8aKSqbTbgLx1CbkCVZw2VnZdJVuPJ38w@mail.gmail.com>
Subject: Re: MSI-X vector limits and reserving a virtio device ID
To: Parav Pandit <parav@nvidia.com>
Cc: Demi Marie Obenour <demiobenour@gmail.com>, 
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 28, 2026 at 8:22=E2=80=AFAM Parav Pandit <parav@nvidia.com> wro=
te:
>
>
> > From: Demi Marie Obenour <demiobenour@gmail.com>
> > Sent: 28 May 2026 05:23 AM
> > To: virtio-comment@lists.linux.dev
> > Subject: MSI-X vector limits and reserving a virtio device ID
> >
> > I'd like to reserve a virtio device ID for virtio vhost-guest,
> > formally virtio vhost-user.  Would this be possible?
> >
> Vhost user is an implementation of the device.
> I believe it stays as implementation and not a new device type.

This exactly.

Furthermore, we already have a mechanism for "providing" an arbitrary
virtio device; it's called a transport.

Demi, I suggest you look into virtio-msg transport, which would allow
you to do what you want.

>
> > Also, I'd like to know which systems have a small limit on the number
> > of MSI-X vectors.
> I didn=E2=80=99t follow the question. Typically, Intel cpu has a limit of=
 256 vectors per core.
>
> > The vhost-guest device uses lots of MSI-X vectors.
> > Typical implementations will use 256 * 3 + 7 =3D 775 of them!  That can=
,
> > of course, be reduced by sharing vectors, but this is undesirable
> > as it comes at a performance cost.
> Did you get a chance to measure the performance, for which device type?
> Interrupts are generally moderated.
> In other devices (scalable functions of mlx5) I have measured perf of 8 t=
o 16 queues sharing a vectors has < 4% perf drop.
>
> > --
> > Sincerely,
> > Demi Marie Obenour (she/her/hers)

--=20
Manos Pitsidianakis
Emulation and Virtualization Engineer at Linaro Ltd
