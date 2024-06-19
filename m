Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E758F12FB31
	for <virtio-comment@lists.linux.dev>; Wed, 19 Jun 2024 13:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718802420; cv=none; b=hA0v72HvZKr/10irqiV9eyPBT7AyG5halRyonq1qAx45NzB05dcC3FRX6vRQI+xF3HLnhSfA9SjUhhxNKZplUVppgCOuWW8bYdYQmhsc2FYmtP6XV+5ddbwMx0jYAhzEH4SPT4M0HRweQbcDU14Tl17t5pnQuuqU6p3xa1CWrLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718802420; c=relaxed/simple;
	bh=o1SAdi4BwppTmtdmZ6FQ+k4gPD/uLKLfC0aelPNzNQI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hdscsZYKa8t0int4OVPEXRqTsOaqRc4Z65qGv4Bl675okuJsOCBaigzgkHZ3Pa/dalyZ9kBpUqwNwrMncJlbQ4fgTUUrd17Zn6PXMMyj9yF0ZTf1L+smEr/pDNwov+jxNaHiVWDTfshLSIDizRSwab1vk+TiUhxgZNfYrYbKq5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZWlur4fd; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZWlur4fd"
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-dfa48f505dfso7047345276.3
        for <virtio-comment@lists.linux.dev>; Wed, 19 Jun 2024 06:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718802418; x=1719407218; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eIjvy6CtuMX2ZmcYTjFW1FbCZRt+YbEv3ng1Y84X8n4=;
        b=ZWlur4fdXahlCCNPebufms0v3FUQaJ1kAemZSFcr86EqvStojYMzjBmp60U1aS12KG
         r9DOHsXjbjk58I6/xgQhP5lqDQNg/u8hWrz8eBhPKmL542A2lcihfMjjy0TuFBO3pgBM
         160bu4nkKSSkE+CPwoDfSRUP3r42C/kIIUpYk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718802418; x=1719407218;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eIjvy6CtuMX2ZmcYTjFW1FbCZRt+YbEv3ng1Y84X8n4=;
        b=UaZMtLJdPHE0KWa8X0qQt1PG/QRjdUBLfwcHn+Mr1K6j1F0L08YlovGkzYQ9eHkcMb
         ph/Wtb7H/fdhiXKUWTbADsdoe5jh1fYaGmDMqhpvQ1Uu97jneukq6ZQ4eVBhDDvS2sDQ
         ZxbCFuGzUZi3HtaEcUc0xCzkRoGU637LfRvyAmDIaYaEDcG48peM9iL8Z2TA5grm33CG
         t48JtAHsYvUW3dEHOdwR8vKZQBABL5cQPseF+GgN3Do+gQd7XEA8iJCCQuz/9QJXzPyw
         nIc8UXMSeFrw1UgPlLCgMRD3mUHcQ5b4D21pzP4O5XDXvI79uJFDiO5aDXIO5G9HMvdp
         Qttg==
X-Gm-Message-State: AOJu0Yzb3lTc0M8Zby3qm4J1K4yeXk/gGIdwBWTDoE84PQenPmp1YgsF
	Xa6xREDLBOkCjdki9X5W9ZBTvXalm9jz3vI4PSDMLzPLCV0ympbD47QvAiAybqY66gEu1ZVprni
	jS6poOlUBpDF1Oa9Wd2XtratKZFmGS7D5newr
X-Google-Smtp-Source: AGHT+IFC0viMUY4kPXlVNGF0VNWcJ5mdn6xDUYVesiBzTgHFZrXRSZ04639ExCCezpDjD0BfGI/hCKl6wDU6HP/D57s=
X-Received: by 2002:a25:d0d4:0:b0:de6:71e:584c with SMTP id
 3f1490d57ef6-e02be1f2758mr2584457276.47.1718802417939; Wed, 19 Jun 2024
 06:06:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240618081858.2795400-1-keiichiw@chromium.org> <20240618064959-mutt-send-email-mst@kernel.org>
In-Reply-To: <20240618064959-mutt-send-email-mst@kernel.org>
From: Keiichi Watanabe <keiichiw@chromium.org>
Date: Wed, 19 Jun 2024 22:06:46 +0900
Message-ID: <CAD90Vca3e8j0uNe6-porp-pVtXtMe3xFouNsa+zC8pWfde8FiQ@mail.gmail.com>
Subject: Re: [PATCH 0/1] A new virtio-blk error code for host-side ENOSPC
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtio-comment@lists.linux.dev, uekawa@chromium.org, takayas@chromium.org, 
	dverkamp@chromium.org, tytso@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry, I'll do so next time.

On Tue, Jun 18, 2024 at 7:54=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com>=
 wrote:
>
> On Tue, Jun 18, 2024 at 05:18:57PM +0900, Keiichi Watanabe wrote:
> > This patch proposes a new error code VIRTIO_BLK_S_NOSPC to report
> > the device's ENOSPC error to the driver so the driver can treat it
> > in a different way from other IO errors.
> > More motivation is explained in fs-devel mail [1].
> >
> > [2] is a prototype implementation in crosvm and [3] is in virtio-blk
> > driver. Idealy, the error should be propagated to the guest file system
> > and handled smartly, but the part is still under discussion.
> >
> > [1]: https://lore.kernel.org/linux-fsdevel/CAD90VcZybb0ZOVrhE-MqDPwEya8=
878uzA1RBwd68U7x4CufkTQ@mail.gmail.com/T/#u
> > [2]: https://crrev.com/c/5599649
> > [3]: https://crrev.com/c/5600325
> >
>
> > *** BLURB HERE ***
>
>
> it's a single patch, pls just send directly no cover letter needed.
>
> > Keiichi Watanabe (1):
> >   virito-blk: Support NOSPC error
> >
> >  device-types/blk/description.tex | 13 ++++++++-----
> >  1 file changed, 8 insertions(+), 5 deletions(-)
> >
> > --
> > 2.45.2.627.g7a2c4fd464-goog
> >
>
