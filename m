Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6C316C685
	for <virtio-comment@lists.linux.dev>; Wed, 12 Jun 2024 07:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718178229; cv=none; b=c2zX8ZIal6wjO/Sw1HzONhHJy8egUB/6WgXrL6Yh76jU0vaYlrUrfDXfEBjvjb8UNy78MbMRnDeU4M74cMxPnIKq2+1ej40EVVH2/QAxAAdAbofGINWUpoOmM5wrOJ0g0ExbmAKx9iu+SQOKyf/3xbyGjoGKSxHaJRvr1BwY2sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718178229; c=relaxed/simple;
	bh=/CkkqUtfzxARH1bisfb8aqrgYwoVmLLSy2cO3TPeH3o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y8aJoFxEDe5RJiurhRYxKWaKJWTaFLhyngcyntME9JwqVkMFRHWO1RkwlzZLsa19OK3z49Vm3QyCUx+NHXPkA8WeBwmGKzb5BcG7SP0IW4OajVhm1hNPhslMIJP3Xm9FOvNFlxydqhJo/noD7o0qV5LnbkfVbjD5HW9VspBkbGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kIOyJYk3; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kIOyJYk3"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52c7f7fdd24so2453860e87.1
        for <virtio-comment@lists.linux.dev>; Wed, 12 Jun 2024 00:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718178226; x=1718783026; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/CkkqUtfzxARH1bisfb8aqrgYwoVmLLSy2cO3TPeH3o=;
        b=kIOyJYk3/FJmPu9YR2QJcVMWeAs38vBGj/EByUd2z5m/BpfO7rk7B62WNI0+0usZ0B
         p47z85ahsdr0SciXbXDjHgfPFcwCxrAgFav5xaB/RJO53aNBWW2Y34LohQhCDeq3h73v
         AbvUlMJjrPf1VjtRx0tzMGVOFMazQmy29/s6s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718178226; x=1718783026;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/CkkqUtfzxARH1bisfb8aqrgYwoVmLLSy2cO3TPeH3o=;
        b=Seu0nQu7iLVnHb51OtSFd8f/VIu5hfs9aIMVuoGYPBwsEB14B7MLHpnBwvMNWeAan7
         oYjsK32VXzNKh7deYKHlJxqDh408obq0bmNXPvpxVac7dnmdS6FhkJZY0lXaRPF51KIE
         eGYlBDO0IWjYm18fX95uxh0IfgCjPQjgYXE0ffZKTTTZXZ67w6r1ncYW/WiJweRFRKNZ
         Vp0BElcxZgVm42MRasR0C1HCCjAYIjUtDz6tUre2g3EPolwpM0qx2ZHD9aZ/4Zxn2W/x
         5Bewy94ZXJjJ1m21MxG3zJrLSclFbrDdVA9VviB9l/8mpRrqzvO3aJYceYSVw1lviGuD
         f0fA==
X-Forwarded-Encrypted: i=1; AJvYcCWLKjajE8mvJ4iR6dH4LqctgakJlIegeI/GvsfhQ/7mjQF4obMJT6/+3zHi/vN2wJ+yrwz+dlQmdFFcKC1qKrFcMBonTfad+5rQ05jsjyk=
X-Gm-Message-State: AOJu0YyJIjnXDWJZtaWF/cU19yy33eLNmBNkO0azECGenDfeOmz/z/qO
	Ka6tRGBLkjsIUZCvdf9Tuh3WcdwYN33GjV6q1512iKJcQmr4VQxKucYTooT4hIRE8WzCpLEr7Jo
	U/EJW/J04kacuL7kpdHA3W9PfxYeh54db6esM
X-Google-Smtp-Source: AGHT+IH6WrpZEtoPYo6UOCLhNbG3P9Xqp8tW5hO1mMMF9wnhpdtfdPdDcEn2tDxhD1K+5dSZNhmkZjsqu3SHW9OXyds=
X-Received: by 2002:a05:6512:521:b0:52c:8210:13bc with SMTP id
 2adb3069b0e04-52c9a406806mr509374e87.64.1718178225604; Wed, 12 Jun 2024
 00:43:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240607074246.7647-1-lingshan.zhu@amd.com> <87zfrskcmq.fsf@redhat.com>
 <3e7b83f0-541b-4878-a1c5-4405b2a9e075@amd.com>
In-Reply-To: <3e7b83f0-541b-4878-a1c5-4405b2a9e075@amd.com>
From: David Stevens <stevensd@chromium.org>
Date: Wed, 12 Jun 2024 16:43:34 +0900
Message-ID: <CAD=HUj4RBeLS4L=ehyPGtejeu+sGZ5j8PRtrK8AvxjEgEBd5ZA@mail.gmail.com>
Subject: Re: [PATCH v5] virtio: introduce SUSPEND bit in device status
To: Cornelia Huck <cohuck@redhat.com>, mst@redhat.com
Cc: jasowang@redhat.com, virtio-comment@lists.linux.dev, 
	=?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	Zhu Lingshan <lingshan.zhu@amd.com>
Content-Type: text/plain; charset="UTF-8"

> >> +\item The driver MUST NOT make any more buffers available to the device.
> >> +\item The driver MUST NOT access any fields of any virtqueues or notify any virtqueues.
> > "send notifications for any virtqueues"?
> OK
> >
> >> +\item The driver MUST NOT access Device Configuration Space.
> > ...except for the status field, if it is part of the config space?
> Yes, that is the original design, then I am convinced that the status fields is
> not a part of the config space because it has a dedicated section in the spec.
>
> I will add this sentence in the next version.

In the discussion on v3 (unarchived due to the migration), Michael stated:

> by the way device status is not in device configuration space at all
> so this sentence does not make sense either.

Doesn't that assertion directly contradict Cornelia's feedback on this
series, which seems to be saying that the device status field can be
part of the config space? Can we get some clarity here on what exactly
the existing spec is?

-David
