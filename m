Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC3E61E3DD8
	for <virtio-comment@lists.linux.dev>; Tue, 11 Feb 2025 09:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739265330; cv=none; b=eORICG2aK38AvMfiNOtSvrZnHpQksjl31jAnvdhlbI3RwNI0JQVnLb5Cb1f8742E0q3uF2xa+cFlRKd4uqIUs4PkuKlwbIeaxSctIdXswqRXa74XJNpAE28+6K8B53zSan3cIPJ7XsZpLTsovre0oGVafdFU4MUva0LYClnWtr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739265330; c=relaxed/simple;
	bh=d//F+NAzUhr+kGeBJjioym+gM6MIEUKpkTGZz3RfdMI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=egqHLF7HAKpXrS56ut9LHz7vVWn3nuAtPJJH2FO3PtzwTtMKSqnW1a8/3niDgme1XxZhrYyXXf/8kLxnF+NNQJDf9U1nHbMeuTLGk/eCJlsScTWcMdOuNP7X43Xxdhy9fw4JRrqjGk4YdOxg6VXbZ3FXdrj/uL/G6frHcmCLfj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fiR4Pk1A; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fiR4Pk1A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739265327;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pReKHvO8luBDmYeKEifWFEbGYU2IEuiDlDH5tWo4V7s=;
	b=fiR4Pk1AQ2M1Sp/YcFgADAyCZZLMh3Ygoz6GPA6ntp7NyGZMrpiRbKPn78XR7MM0lopWqS
	fwKVpSRtMfUzVxAwHaK15HgfPlxrAu98xPOMgk0tQ00Hgt8hKXfdFWV9Zayl/q/cXHToAP
	JO6tItO/NGroKnWv1Wc9J8Ys5XDSMMU=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-228-oVtU0zsCPzyST_qBS6Igog-1; Tue, 11 Feb 2025 04:15:26 -0500
X-MC-Unique: oVtU0zsCPzyST_qBS6Igog-1
X-Mimecast-MFC-AGG-ID: oVtU0zsCPzyST_qBS6Igog
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2fa668c0d35so4347758a91.1
        for <virtio-comment@lists.linux.dev>; Tue, 11 Feb 2025 01:15:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739265325; x=1739870125;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pReKHvO8luBDmYeKEifWFEbGYU2IEuiDlDH5tWo4V7s=;
        b=F7LKfWVkxXtmOD6s9K6lUTw73CNBtX/CgZy2safMcminMqrkkbJ+c2ZOsioHF+fnsx
         2qWEWPmP4B12t8p99+VwQGNX7GwLi3d35pmXzmSH991fnXVpCL3si3WxzYG/6gIE9ehz
         5HLrl6H1tR/yeeWZOy+vZmYgm0nEEqTgx04XP89c3JHx+0f5IjJywoQQEHD8UVILHKiq
         AbxC6znoB61BZojBfP8JJRuyFjWwUxYbJ28x+GHcBmDdxj+kRT94r/Nn9nrhjo43Kf2t
         A5ZV7+wNOEBY8jg4kW2dBvsjgeKHdn/Y6SvygU9Voc/6dOM3X9HjLJCyq7E5h91pWy5u
         Ewlw==
X-Gm-Message-State: AOJu0YxZ5arWvjVcgRBeH3qBHBcXDOf3CRRU+kzzu6ClA6y9SZMFdbzg
	am7mAuCWJHvXE6cuFrQ2em7jrb+o2USBpcS8rRennTIYtk91rxxC//AFYXM7G6dnejqXlBPnAfA
	VmnnwgmdYM/b/1yU7mghtBNSsa+Y75Mxx+M/e5C0CzGnmAKHKAkD++KmdVrCeILooK4fJhO1PDk
	09GqsXX8nIdYL7KXoGYmLN7aQO53MDsRVdLARVK0E=
X-Gm-Gg: ASbGncuAZ7TNz0okKk8Dw8H0hGtbj/kBsD5z/mvrVI4oITrFeDBBCKtUf4p7xmwO6NH
	GbEUmP5mNWRrx9L5uTMPOX3BRkXsWn6lqDVnbEEKLtNH03yhICSMilKQ5GQZ9NkQ0
X-Received: by 2002:a17:90b:2e47:b0:2fa:20f4:d277 with SMTP id 98e67ed59e1d1-2fa243e39dbmr25530010a91.24.1739265325393;
        Tue, 11 Feb 2025 01:15:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHJGSZ/ipSaJNMxlY0GZZH07u3DTmI1VMnobdJgjdwER7TK53mQE2L69agTVXMfifK9cvu0l/7mzjzpumnkJnc=
X-Received: by 2002:a17:90b:2e47:b0:2fa:20f4:d277 with SMTP id
 98e67ed59e1d1-2fa243e39dbmr25529976a91.24.1739265325137; Tue, 11 Feb 2025
 01:15:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250205153301.133040-1-aesteve@redhat.com> <20250205153301.133040-2-aesteve@redhat.com>
 <Z6nwDxbNZ6ZAPbGQ@fedora>
In-Reply-To: <Z6nwDxbNZ6ZAPbGQ@fedora>
From: Albert Esteve <aesteve@redhat.com>
Date: Tue, 11 Feb 2025 10:15:13 +0100
X-Gm-Features: AWEUYZkTBODOCZoBguDde6DGwVzrQTOpiRgWbylwbesW3cAAPi4g8648XQe4HUg
Message-ID: <CADSE00LCgziXZmHs=X60AY6cBnWOEOR8Kyh1AFTFg=b7AHuMqA@mail.gmail.com>
Subject: Re: [PATCH v6 1/1] virtio-media: Add virtio media device specification
To: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Cc: virtio-comment@lists.linux.dev, eballetb@redhat.com, adelva@google.com, 
	gnurou@gmail.com, cohuck@redhat.com, daniel.almeida@collabora.com, 
	ribalda@google.com, dverkamp@chromium.org, agordeev@qti.qualcomm.com, 
	alex.bennee@linaro.org, nicolas.dufresne@collabora.com, 
	gurchetansingh@google.com, changyeon@google.com, hverkuil@xs4all.nl, 
	mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OlOrHYeeM-H5GgPPJjBpFrtqKN81Qp7Crxa9MjOr5Ww_1739265325
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 10, 2025 at 1:24=E2=80=AFPM Matias Ezequiel Vara Larsen
<mvaralar@redhat.com> wrote:
>
> On Wed, Feb 05, 2025 at 04:33:01PM +0100, Albert Esteve wrote:
> > Virtio-media is an encapsulation of the V4L2 UAPI into
> > virtio, able to virtualize any video device supported
> > by V4L2.
> >
> > Note that virtio-media does not require the use of a
> > V4L2 device driver on the host or guest side -
> > V4L2 is only used as a host-guest protocol,
> > and both sides are free to convert it from/to any
> > model that they wish to use.
> >
> > Signed-off-by: Albert Esteve <aesteve@redhat.com>
> > ---
> >  conformance.tex                           |  13 +-
> >  content.tex                               |   1 +
> >  device-types/media/description.tex        | 617 ++++++++++++++++++++++
> >  device-types/media/device-conformance.tex |  12 +
> >  device-types/media/driver-conformance.tex |  10 +
> >  5 files changed, 649 insertions(+), 4 deletions(-)
>
> Reviewed-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
>

Thanks a lot Matias for your patience and dedication.

I may wait a few days before trying to move this forward. Either way,
now I'd need to follow the normal procedure, open a issue and ask for
a vote here for integration, right?

BR,
Albert

