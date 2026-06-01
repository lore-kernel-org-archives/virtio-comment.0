Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C4D1E9B37
	for <virtio-comment@lists.linux.dev>; Mon,  1 Jun 2026 13:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780319171; cv=none; b=Dzu63NSSQ2IsY9bFYvTNPb+z58jd/6nIRGb8bBvL2B4x0fNZoOeKCxKmRvXuxYJeMw+dCt+wH2XtvqKXczGZMsZR1xdyEj5itUb9Jf98NRQVnAMqKQK1Ozz/ZbKG85IslJ4vxvUpQdSEikoS0U2lM46UVmhRgXvWTTUFlSLsy/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780319171; c=relaxed/simple;
	bh=2UuXwSU1+wmSiIhk1/F/cVK3SfiopHwKQC8J6BQEZZA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q0wFEVbNufiNWwjszwE5fFR1hfl/QYASKDbDw07FRykrHqo8Hd76ttpUliVQCRoisEcNGg63RzE3wI86f9d/q3D8/fyzLx4RSIlRUCTZswT1eyNQq1eM/6x80ITpmyGh3NdAG3RWnST5FD3WDzid7D7RI+ofg6Q58+/76E6j/38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PGUa9W9L; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PGUa9W9L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780319169;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a3EOOtKkYtNzlyL7wJDq11Tzx8zN1iGmDGeYtUEcaj4=;
	b=PGUa9W9Lgm+ZTD9jvrWbMHWMGNcXXWiP7N0YSTkN/xm2QmeEILCaSuXnQGE3qBejwQpsa9
	EP4S3GwEs9XZ20G+RjKZplqnXCEmmdzc4INQl7KctZiWH3tKSyrf6FxkqI0HFWEw4ZAzze
	4jI9lMB/ijYqPBI1ulXoGlplY6VB6S0=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-205-9I55uag-OMihStfKv51caQ-1; Mon, 01 Jun 2026 09:06:08 -0400
X-MC-Unique: 9I55uag-OMihStfKv51caQ-1
X-Mimecast-MFC-AGG-ID: 9I55uag-OMihStfKv51caQ_1780319167
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-7d296b0a093so165218987b3.3
        for <virtio-comment@lists.linux.dev>; Mon, 01 Jun 2026 06:06:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780319167; x=1780923967;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a3EOOtKkYtNzlyL7wJDq11Tzx8zN1iGmDGeYtUEcaj4=;
        b=rDhAQA99eXA2lamPigFvo0GUK23U51J78DtNNVNMWhZ3Ro3d4zCi8Lcw90kHWu4WsS
         ItYGLl/elq8lK5RpAd6/aqRkl5U9KBAtxIPxzafLFhXaPMbsTb3GUif10UCWvASdatl+
         NSSRUowpUdeC42lr4ftMFVaXj8J3VavbGm8gZU8BCKJaMsqHI711zCvzTXx3SikJoHzD
         ZdzUS+Bv5OjP7xh/iDCf1ArU1336ieGKZXJMjiz2bgy1G+K45FciV9GlTi0Edh7PlEgU
         yX4U1lgWKIyRZCiBa1MfJitNMt5FfIdYnljAfW7qnG4cKfABuIv3ywtivVbUK/1AudMX
         tdsg==
X-Forwarded-Encrypted: i=1; AFNElJ/DxJWFKaknt3zfm2JhtXhGishgI6JRTQighdGMAMwMgOVzLs7bO4YCv4WeCePKyXt5xTFcEeXpV2NrQ3Ts7w==@lists.linux.dev
X-Gm-Message-State: AOJu0YyMii6OAf6/UF0ytNjHzEElbjpIA/VApPIFz7xVrx1CF1ORCcxl
	Mwf4Jo3Hi2MlQuo+5+BWYYNYzWaQ3XzGkQ2IO5AFBhOy7THI6YB14gRvUeEqo09U/FCi34I/11S
	LlIKurSNa4XU/A53nQ2agB70dWz/WKxnXU53GuBWxouEP9SnUOFuXs+uO/ly+2ry6fSXDV/NKjh
	eORHFU2VMwFksYgjBhzeG7DdrYoIqX2BD/Jw+qlbwqN2A=
X-Gm-Gg: Acq92OGfTFUXc6llwBvk7NUF7I0wthk1F9OtW7qZFr9yAjSDNNd+8H4Fsn4hoI1eUKV
	vWNU+GnHqRrZXLYhTt3D7xup/FyyIEgR5VgS3kDe96vq5Gps8zMJrdTGU+QQUv2oh60v3zdfG9s
	aduodHl6zpAgdNZkHqsCT6G3gYi/1MncaWJew08GCD0NcdBnbQIMav76izDoUnuGj0MV2jEpdpx
	zxV4SXiY249m/IQ
X-Received: by 2002:a05:690c:3391:b0:79a:c40d:b734 with SMTP id 00721157ae682-7e05ea48534mr91668427b3.48.1780319167181;
        Mon, 01 Jun 2026 06:06:07 -0700 (PDT)
X-Received: by 2002:a05:690c:3391:b0:79a:c40d:b734 with SMTP id
 00721157ae682-7e05ea48534mr91663157b3.48.1780319162192; Mon, 01 Jun 2026
 06:06:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <874ijtz038.fsf@draig.linaro.org> <CADSE00+RdBUhFVBDSXtVd1J5SaccqWy+RBxqnxuLKUYcitFMPw@mail.gmail.com>
 <20260601083628-mutt-send-email-mst@kernel.org>
In-Reply-To: <20260601083628-mutt-send-email-mst@kernel.org>
From: Albert Esteve <aesteve@redhat.com>
Date: Mon, 1 Jun 2026 15:05:50 +0200
X-Gm-Features: AVHnY4KxqNrVCAnBvGqVDNl4sx_O6LVtLUuikZg1pVoCVm_RBbEptTRzSNfWocM
Message-ID: <CADSE00+kRnEC08LLVu6H065u2KaxBm-KnSN_8y6+964-FLbJMA@mail.gmail.com>
Subject: Re: Where should the vhost-user specification live?
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	qemu-devel <qemu-devel@nongnu.org>, virtio-comment@lists.linux.dev, 
	dev@lists.cloudhypervisor.org, rust-vmm@lists.opendev.org, 
	Stefano Garzarella <sgarzare@redhat.com>, Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, 
	Demi Marie Obenour <demi@invisiblethingslab.com>, Alyssa Ross <hi@alyssa.is>, 
	Mark Burton <MBURTON@qti.qualcomm.com>, Matti Moell <matti@qti.qualcomm.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Dorinda Bassey <dbassey@redhat.com>, Sergio Lopez <slp@redhat.com>, 
	Vishwanath Seshagiri <vishs@meta.com>, Rob Bradford <rbradford@meta.com>, 
	Zhengyu Zhao <zhaozhengyu@bytedance.com>, "Jorge E. Moreira" <jemoreira@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: G0Vwu9KC2PE1ygcu3SdJxSrMjC60V5wNpFe2IGNHFQs_1780319167
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 1, 2026 at 2:39=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com> =
wrote:
>
> On Mon, Jun 01, 2026 at 02:32:11PM +0200, Albert Esteve wrote:
> >  But also because, in my opinion, separating
> > the specification would improve development agility by decoupling
> > specification development from QEMU's review and release cycles.
>
> Generally for QEMU this will be less agility, unless I misunderstand
> what is proposed)
>
> Because presumably there will need to be spec releases then?
>
> So
>         new feature -> spec tree -> spec release -> qemu implementation -=
> qemu release
>
> is surely longer that what we have now.

I see your point.

However, we do not really need to introduce a heavy release management
layer. We could just operate it as a living document, where the main
branch is the authoritative source of truth.

For the workflow, development doesn't have to be strictly sequential
either. A contributor can propose the spec update while working on the
implementation, much like we do for VirtIO updates. Actually, this way
one update/change supports the other.

I guess my point is that a dedicated repository could lower the
barrier for new changes AND keep QEMU's own development speed mostly
unaffected.

BR,
Albert

>
> Whether there will be more agility for non qemu users will depend on
> how often spec releases are cut.
>
>
>
> --
> MST
>

