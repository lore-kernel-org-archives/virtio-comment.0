Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55FB128A701
	for <virtio-comment@lists.linux.dev>; Wed,  9 Jul 2025 09:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752053914; cv=none; b=jQO8I+BsuXpwpl1Yfjt+njd2YYQh3aW/wvgnq9HfyBgMFmGPWWDlJxjQ6uRLHayxGHD8eygD/+UEE5mW8ilvYTW+cai/01VuvuHPhyXHMEEafYn+TWLs8Dsw+/rsAd5Ebqm/uPGKkWm+jLR3w8Cd6rrXA1B0aJKtGgFTopPkco8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752053914; c=relaxed/simple;
	bh=L/QBIT2tEPqYVtYODqO8TdUCzWBophUHcVQW8vTtzAM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sIcG7xZC632qGUSQJPxL4FW7ua7kHKZXBjwQHgdmuM+Ltu2CgmNhTHEjOf1VccAZWjhmz52AEfXAn3j+Sa2fKh1+L2FGEROKUEPP/ekw+/GwIU7A+K9/gkixL+ycEQoYWLFy1Ku2VgOqBUPRDjOwWGkpYhJ0yvN+CApeiugtI1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PZuypdp8; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PZuypdp8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752053911;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L/QBIT2tEPqYVtYODqO8TdUCzWBophUHcVQW8vTtzAM=;
	b=PZuypdp8qVD0/v2SU+r5FUoFCRBmp92y+KFZslIBoRR+Q0CDgw5p56a4YKRyGvLKMxPwHs
	DBgrvc00ywWY+Lyim83jnvMC7241j4sO/jaOhHvJuRMrizemRO6PAI/f2zOibhNK08A7lR
	fkikKK9T/IhdlFgpA0zJzaBpd62LpKw=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-655-LMyjg6DuNEyGMshkprE53Q-1; Wed, 09 Jul 2025 05:38:30 -0400
X-MC-Unique: LMyjg6DuNEyGMshkprE53Q-1
X-Mimecast-MFC-AGG-ID: LMyjg6DuNEyGMshkprE53Q_1752053909
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3141f9ce4e2so7526864a91.1
        for <virtio-comment@lists.linux.dev>; Wed, 09 Jul 2025 02:38:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752053909; x=1752658709;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L/QBIT2tEPqYVtYODqO8TdUCzWBophUHcVQW8vTtzAM=;
        b=BcH8FPlWdI6VKmYeHWwbRpFEZBMwo/5ZW92Loa0TaeHdWS8elDrrHhXyqlK6dJkDHc
         Hd0RR/RSPsgpUpPm+dXYo9xx2WjGV0dxnqfUzIvSq5CqdO4Im5k7bJRKO6m0vJLtpfHd
         iCy6Q7cuWB6kwPQQZZLRw1Sf24gF+nU8Efs8DUVmd81eeniGxQX38G3/ZEtYSc2WXa81
         wx5oy5UvKuAzoZMHDQFGQsNSNDEpMvBQ+knnGRCysKYLFI3NBDKmgD2qMk+Yaa/zyS+c
         Miy1e6JQ9JqBvitsoMm4xX6eoGlW2mAkAIzZqwyba5qvWJeXSsqOfPyUFLuOY+7FOp7g
         ekHg==
X-Forwarded-Encrypted: i=1; AJvYcCUxNg+NaF+l0WxcQPDXY8LCn9HaeKspxRPabnGk8SdraVlJ0VW5P+UgCws7rfxdKeD/alCEmZvn53XMzlMd4Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YxJtiYfSeu1qi7l9AMCSy49hyqP924/KiwVnYTJslMqp5nBj3Zo
	pnS14OMWrPd8uB5u11LUxZ3dnvG3A1bxKm0bmCvtbwTpNn2v3xJ+b6HCExBDu+UxdxNWw0H+J2f
	XRjKs5OlW5JfyR/uYaMikCekWY6pB+lCXwGFy83pAR8bGLMugk4KcUNMgjjz6ZpgUJoqis0Bt+e
	pXAQnqcjQvjWbhijdh+Ui9h7dfRTFvXM3IM9kjmgxzZBw=
X-Gm-Gg: ASbGncuVqntXNuFx9Vy8o91hID8Hr/GoX58gTQ7/fzFexobJouuw0NNKeOYMkXge/lu
	aLXonrpLyFIM+M00T0Lqq3xhvFun4UzKxFb2yKDJl516kfDZO7IXoCGx6dyYw2URhLOhEd7Hmdh
	typBU=
X-Received: by 2002:a17:90b:35c6:b0:31a:b92c:d679 with SMTP id 98e67ed59e1d1-31c2fdffd38mr2709002a91.35.1752053908979;
        Wed, 09 Jul 2025 02:38:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6nf9ftDPE2d8ac+XwRyiXXjZP+F5BULwXNzrSTpgomHQ8MEK7NQwCVQ/WynHjHV8b/QEE+hJWHFjxV2Iqxsc=
X-Received: by 2002:a17:90b:35c6:b0:31a:b92c:d679 with SMTP id
 98e67ed59e1d1-31c2fdffd38mr2708974a91.35.1752053908565; Wed, 09 Jul 2025
 02:38:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250304130134.1856056-1-aesteve@redhat.com> <20250304130134.1856056-2-aesteve@redhat.com>
 <D8G0UC5KFCYY.32BN79B9WOK33@gmail.com> <CADSE00L_ZGgqXYCttwGqD3ceBBaZaSVnPi9n6A1O+CyPBJe8nA@mail.gmail.com>
 <87a55dvhfa.fsf@draig.linaro.org>
In-Reply-To: <87a55dvhfa.fsf@draig.linaro.org>
From: Albert Esteve <aesteve@redhat.com>
Date: Wed, 9 Jul 2025 11:38:16 +0200
X-Gm-Features: Ac12FXwMM_l_m4ZQ3VpjDAnaPvV1Q_0gyVD0-wLP03BtSvew2xcARgpeneftrtM
Message-ID: <CADSE00LPw5hVzx0=rqwcc4AfJ3Eo4DXLfcy7x4LsVQMgRZocTg@mail.gmail.com>
Subject: Re: [PATCH v8 1/1] virtio-media: Add virtio media device specification
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, virtio-comment@lists.linux.dev, 
	nicolas.dufresne@collabora.com, cohuck@redhat.com, adelva@google.com, 
	mvaralar@redhat.com, hverkuil@xs4all.nl, mst@redhat.com, 
	dverkamp@chromium.org, gurchetansingh@google.com, changyeon@google.com, 
	daniel.almeida@collabora.com, agordeev@qti.qualcomm.com, eballetb@redhat.com, 
	ribalda@google.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -K3L-nFQhq7kXzPSQV39_XUGAwXA5LmlPg1cEJvp8cI_1752053909
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 9, 2025 at 11:32=E2=80=AFAM Alex Benn=C3=A9e <alex.bennee@linar=
o.org> wrote:
>
> Albert Esteve <aesteve@redhat.com> writes:
>
> > On Fri, Mar 14, 2025 at 2:26=E2=80=AFPM Alexandre Courbot <gnurou@gmail=
.com> wrote:
> >>
> >> Hello Albert,
> >>
> >> On Tue Mar 4, 2025 at 10:01 PM JST, Albert Esteve wrote:
> >> > Virtio-media is an encapsulation of the V4L2 UAPI into
> >> > virtio, able to virtualize any video device supported
> >> > by V4L2.
> >> >
> >> > Note that virtio-media does not require the use of a
> >> > V4L2 device driver on the host or guest side -
> >> > V4L2 is only used as a host-guest protocol,
> >> > and both sides are free to convert it from/to any
> >> > model that they wish to use.
> >>
> >> Thank you for your patience with this. I have done a final pass on thi=
s
> >> version and it looks great to me!
> >>
> >> Reviewed-by: Alexandre Courbot <gnurou@gmail.com>
> >>
> >
> > Thanks! Could we please open a voting ballot for these changes?
> >
> > Fixes: https://github.com/oasis-tcs/virtio-spec/issues/214
>
> What was the result of the ballot?

AFAIU the ballot was approved. There were conflicts with the
virtio-1.4 branch, which may have delayed the integration. I've just
sent a new version of the patch rebased to virtio-1.4 to try to ease
the process.

>
> --
> Alex Benn=C3=A9e
> Virtualisation Tech Lead @ Linaro
>

