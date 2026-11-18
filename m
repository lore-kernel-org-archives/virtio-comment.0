Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794961813;
	b=nUFLU0QZtQutrgEZ9vwR0BI+OklK68pSL5SSyCeNiEYf8F7JHsXalCwduMfb2eJPa19o
	 E1Ip5iCtLKZ7jcUajN5+bQMXme3PjEwe/SrnYXE8x+53KUngu08lsmeoZZ/hq14hubzaB
	 Bt5iTJpWCNFPXnpQQWjSibzveu7nDfTiVyzi1PiTtDAL3JpHMvZ1cVoCVOhwleD1aAgLG
	 U9wLIzsPM6sWjUkVw3eQWew6Y4Xaf2OUmWyV3b6um8iYO0Q8UXmNxA+4f7pMrx8ARvEKB
	 oQ/r6MrJ0itXowaLFdg7TYs33YQW8zsebU2jlyGpsyndSChHWdNDtdyCr39UQK323Eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794961813;
	h=DMARC-Filter:DKIM-Signature:X-MC-Rep:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:In-Reply-To:X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:
	 X-Mimecast-Originator:Content-Type:Content-Disposition;
	bh=TrnCrdkQD/qCJyU9pqVOExnHAZOZCD9IFqQ1kQUyJjo=;
	b=s8fm29Ud4supyYpE4OAYGEJC+4E/Xre/bF5fRR62Mx5iK3pJDzjC3FP9WzHSqNs9y0zu
	 nlA1tOvMZfhxh6KSfeCg5k8WbCRdOlEOkvjoGLNuSSH7aHBEq3ofe/mXrt1SmH5BPTqcr
	 l/WN/v1XCsMoyLJQE4yxg8mDFlzM+maKP8Y9RKs4LZIrNTT9wpcWqNscxz0TKxtrCImKi
	 lnzeAHqcVZKe1YjezsC82HmyHl1MAino5p+BysnCqSTk64m6+EjYMuV+KmY9ttj6JkM9C
	 Fp/GiGiExZwC29HfyvS/zyrwmfocyriKbM+7iEXY0R3aqB8OZBIPl3rJ7BmawIdG9+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OXVji1TW;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94381606A331
	for <virtio-comment@lists.linux.dev>; Wed, 18 Nov 2026 00:30:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94381606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OXVji1TW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794961811;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TrnCrdkQD/qCJyU9pqVOExnHAZOZCD9IFqQ1kQUyJjo=;
	b=OXVji1TWefZYcXify3mJ+FuWe5yP5dJXv1XQPOnOhvuJ3UpUNR0vCYoHPznygwIdk3yzcT
	4ibclw0fizDtkqjM8uI5gV+y/H/Wc4TNfcc+ZkYHzqmLBVC8/ztGUVxSCiZj2DZ9tCBUP0
	xk2GnKBAbdbHMMtanhu/qNlbkTtd+jE=
X-MC-Rep: binary re single
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-31-SH-WK-2YMFmhuQUea3HpyQ-1; Wed, 18 Nov 2026 00:30:10 +0000
X-MC-Unique: SH-WK-2YMFmhuQUea3HpyQ-1
X-Mimecast-MFC-AGG-ID: SH-WK-2YMFmhuQUea3HpyQ_1794961809
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4ba078f26f4so2413845e9.2
        for <virtio-comment@lists.linux.dev>; Tue, 17 Nov 2026 16:30:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794961809; x=1795566609;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TrnCrdkQD/qCJyU9pqVOExnHAZOZCD9IFqQ1kQUyJjo=;
        b=j8/LxgUMH13XSwQ5P9EDPpvG/g4tK4ot/hQKCY0CdWL+XSZueBOXMnSKcNIN14ElWK
         r+gkbpNm16AnhXW1Wll28xbyBB7TSMjlwKbU81vuNVTJGUHto6FxM1jj1UvMxpuQF1kD
         R3jmT3ppnvxPWZEv2aVjmbqRMCSfnd7Ne50YMMNwiF5Khv6Ow9uG1HjREtoeZ1sMz4Ol
         r6gtdHruhCiO9VoMwW/gSrE2ZLnRkisZVFeMCQmaprsl2v373JvFsCQ83awWcrKjuCrA
         QEWtv3t8uCUdydq2pyAzS3gLX2RqvzknQ+vZKPhrdEJqRccF61aL50uP3EqCXvG475rG
         Qwtg==
X-Forwarded-Encrypted: i=1; AL+hErGGZRK/zDi4bXwRwlxQefCefMZ/JhjqZHVJmCsARw8xXg0sp5bfESmQ1JdHNDkmzYNgEeAHcuT/Yi8hvX4NXQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z/f3OoXKJJyOzYLzj3VU+UYX++pdqTt1Zks841HjK3uQh5cyT2A
	HbA5tcH+vLjcKlb4L5Od1ODvUw/V/nXlzCLR2DFa3UR0bApqcvR0lJfFDAmZQvuMYnF36CWSH0Y
	1BYlF1SXJ3UcMr8imnJJ71m5rTUPUyCANL653ELoKETsz8dHEwAd96TPCHVIpNCa3FjWE
X-Gm-Gg: AYBFou3TmlGTdxkesZZFFNJHc/dqHUyyQcU0/qZ/d2lvWU/HmXpsTnye0be4dvdN1XN
	0zR9w9hwor1eHLhDbf/3SZ+nL6YEqTrhKDkzIfNL4TaVf++Ttz2+K7qSDKB9uavv0SD20qnWdyj
	v9Gccnoe3/aqMNtC+2MeR1fZEYOLkYx93R31PvUu3Rkbw9UQer7o51PWcKUfqyRtNGV7IqefAZ9
	6IhaLk5d22VphlhxIYyDc7t+GPyDoJiT3m7aWJIsBS84MNLuErz7/n9UrmMb54dxz9Dg2iaFLbW
	reEKNl0R8lNc5EjpDhy3gTq0nlTgmU+hlK8A3eYyXbTGos7OzZByQdb2xpoaPimgDfLAApWRgJ7
	bVCiTjEYigeVHn4y1ogNEN9tOhk6s+FXeJgnqY88c520=
X-Received: by 2002:a05:600c:4e04:b0:4a1:fc98:1cb1 with SMTP id 5b1f17b1804b1-4bb7d5d4113mr15814665e9.2.1794961808878;
        Tue, 17 Nov 2026 16:30:08 -0800 (PST)
X-Received: by 2002:a05:600c:4e04:b0:4a1:fc98:1cb1 with SMTP id 5b1f17b1804b1-4bb7d5d4113mr15814255e9.2.1794961808379;
        Tue, 17 Nov 2026 16:30:08 -0800 (PST)
Received: from redhat.com ([2a0d:6fc0:1520:4400:d78d:7b2d:2f5d:e08f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb78420edasm151483715e9.9.2026.11.17.16.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 16:30:07 -0800 (PST)
Date: Tue, 17 Nov 2026 19:30:04 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Matti Moell <matti.moell@oss.qualcomm.com>,
	Peter Hilber <peter.hilber@oss.qualcomm.com>,
	Cornelia Huck <cohuck@redhat.com>,
	Demi Marie Obenour <demiobenour@gmail.com>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Parav Pandit <parav@nvidia.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Trilok Soni <trilok.soni@oss.qualcomm.com>
Subject: Re: [PATCH v2] content: Reserve ID 52 for QPSFI device
Message-ID: <20261117192921-mutt-send-email-mst@kernel.org>
References: <xkzvep5mx77zm57l5im3qef6k3uiqfdnyi3lxuvmsiu7rjkeeu@ey5gquhbb2s4>
 <CAAjaMXbFY8d_H6YJSbb+2ycx-Bh7wBym0UpCy2Z4XsftkhQSzA@mail.gmail.com>
 <fe70886a-b119-4302-b35d-f99dfab4b018@gmail.com>
 <rltfxbrlfrqixbuevqknfake6hmcs62vjwgpk66tzvyswvfuej@6imyqn2npcby>
 <875wyo3557.fsf@redhat.com>
 <mkmnrjrkzjg6gdh4u3l6lib7ggovl7oiqwki76pkdboue2szdi@lhpg3ik33w7y>
 <4222d5ec-e44f-46a1-8a14-a2f3fb6d84d1@oss.qualcomm.com>
 <20261104094014-mutt-send-email-mst@kernel.org>
 <ce7dc70a-13d0-4c8b-9b0c-b46e9a0af54d@oss.qualcomm.com>
 <CAO9ioeWo8b9CaFHiE7Q7kAeYtkaq_gXZ1+_BGnNFHUF_EfBx7g@mail.gmail.com>
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Post: <mailto:virtio-comment@lists.linux.dev>
List-Help: <mailto:virtio-comment+help@lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
List-Owner: <mailto:virtio-comment+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <CAO9ioeWo8b9CaFHiE7Q7kAeYtkaq_gXZ1+_BGnNFHUF_EfBx7g@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: J48xn-ZMISWSVM8fEmM_JMUk3cvFNaON6H5U-_C90dI_1794961809
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 17, 2026 at 11:52:10PM +0100, Dmitry Baryshkov wrote:
> On Tue, 17 Nov 2026 at 19:30, Matti Moell <matti.moell@oss.qualcomm.com> wrote:
> >
> >
> > On 04/11/2026 15:46, Michael S. Tsirkin wrote:
> > >
> > > Ugh. Let's keep it simple. Reserve ID 52 as vendor specific, qualcom
> > > can do what qualcom wants with a qualcom subsystem vendor id,
> > > or just you know, use its own device/vendor ID.
> > >
> >
> > Just for clarification, so you'd be fine with reserving ID 52 as
> > "Qualcomm Subsystem"?
> 
> I think the agreement was to define it for vendor-specific devices,
> further using other means (like UUID) to identify the particular
> device.

Right, and I'd say let each vendor find their own way to pass that UUID
around.

> >
> >
> > >>
> > >> On another note. We are here because there just aren't enough device IDs
> > >> available
> > >
> > > Nope, I don't think we want to go too far to accomodate devices with no
> > > plans to be part of the virtio spec. That's why we are here,
> > > the lack of IDs we'll fix.
> >
> > Got it.
> >
> > Cheers,
> >
> >                 Matti
> 
> 
> 
> -- 
> With best wishes
> Dmitry

