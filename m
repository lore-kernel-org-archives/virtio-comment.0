Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4031186E5E
	for <virtio-comment@lists.linux.dev>; Wed,  3 Jul 2024 18:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720032313; cv=none; b=vAbCMXZ2MdGsfmWUEdEOEwjkUV6dbWRoeKxBeKPD8RLKTWT+8Xrwq3tCNbBCobZJgFm6d/pHuuB8fXbkiziDKX+Wyy7jhqiW2qncm8ejTB5+gbRhTTTukmefw/6xu9/B+4VlYzl+L47uzZbXCwbp5YPohViADnck/9M5dDC0g3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720032313; c=relaxed/simple;
	bh=dIqW3Fx5a7CFz7gfFourc1z8Z+d4Fg61pOAQtQ9nbZ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K+HZmZTEsFmfKXSl2xHmlmUUawS2kmrxAgWWBbwWBmGdJdZk1N/yKRt89qtXW5fYa4A648kRDjcOvSLb45cLuW37LSBzHKQz4XGJ5nICREmaEGrWx/de0WOwpVQsIO60aQoPxAGJmDSt45VDH2zgX0lKDHC39ovhnFzEvg6sjbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0KrZInpi; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0KrZInpi"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1f70ec6ff8bso25335ad.0
        for <virtio-comment@lists.linux.dev>; Wed, 03 Jul 2024 11:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1720032311; x=1720637111; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dIqW3Fx5a7CFz7gfFourc1z8Z+d4Fg61pOAQtQ9nbZ4=;
        b=0KrZInpiIyhzQ16BWLohNh7EsZQxncWDkf/VJ/vUXIqveveBng2BjfSPJm5ThfC7Ox
         ZViRdnYX1c4lDKUnF+or2UAvbeYzvYotNhoj8y0NMHVy/IIq0LPm1LplGeX4qfrVLZVv
         TUsnd8rqMcQF2lXANqgxX/T5QJZuOsBeQKDEV62yAEE9EFxdtpvn8AXqZ6aXbrfJcOWt
         I5MvoVXFPTAmLJQq4SNblpDizMS4Hl914fMMuUHPXw0feNPUHf+p3OKitkbThKFJEN8/
         S8tonJnRawn96g1yX5kQxEXBWVMAmDKM5ZfrYwzlagNXu2fRJN97Je1CmQ25+ZY8bwRy
         HNag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720032311; x=1720637111;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dIqW3Fx5a7CFz7gfFourc1z8Z+d4Fg61pOAQtQ9nbZ4=;
        b=krJjZ1HVC2ieSPbXCvqtNMZQmLmv+w8UlV6k9HvrS/v+/f2VPn7brDZvhQ6exDLu0y
         8LbvO3D9sSubGYklEMU6i2F64qHUDKNUWDHsKPYWhL6leFDuiMDLcVmO0NJx9CFAZwwA
         R6mQ6wzP38qCVr/l+rXRDJ/K6mIGGmv7LcLQ8qAtSFvUTFlhL4+ByeXp3w1nt/aPcYNG
         ckRhijKfDCpgIBcbDj/hfnGrpqolA+432HRLEzAeQaubcDAmBXJl4iy47HOSbbn6RhrD
         zAn8eY9TsmOFzFhSk0aR6wHoyAs2kcPN3EMDKo/yGrR9hwd8Cwo0t/PtEhi8qreZdrU7
         HhjA==
X-Forwarded-Encrypted: i=1; AJvYcCVLs271AoRZny0hBTX/vUIGfDslfvn55bRiksbwRXcZb7DSwYEJdtVjUu3/9EZx5djEiM7AVhREihmy09SLi6hVPF9yc9moMLFDiQ7XWvw=
X-Gm-Message-State: AOJu0YyQS5efRJk6jhtGnrb4BQwMtjEIBXkBfgdgVraEsq0uhoDoK2PO
	OuEZocY7sSwIPsq5dlZSy4IqTc0oaZSBT31RnpWndelfxnzUnKDFwrxnIw9zqGZjCJdvZNXrqV5
	xttpn5yIiinDtbdurcIMLQGddQLEBK/o/wfQ+
X-Google-Smtp-Source: AGHT+IFvtWUnURHx+djD/f8/lfWmddDUv24sT9jyzziyxEIultTNxDjH5+t3Nji1Dl3kaGmgdra1Oib8n38sGx71cC8=
X-Received: by 2002:a17:902:ab86:b0:1f6:828e:bbab with SMTP id
 d9443c01a7336-1fb30dcf8bdmr213475ad.19.1720032310756; Wed, 03 Jul 2024
 11:45:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <56ccba136272593d0d2af0303600c06f26bd84a1.1718621522.git.pabeni@redhat.com>
 <CACGkMEt-Ep+At_4YvkJ2t8UmQHJ0-Qm6fAPbGpkV_AfVyNq2EA@mail.gmail.com>
 <ed07e9bb9ae5bc1a171c77425cc0b96e6b87745c.camel@redhat.com>
 <CACGkMEvD_WDN5yeRKcZ2ijRF8C2_Pmr6UZWMNt+_R6S0WHY5Fg@mail.gmail.com>
 <e5d885e6331b18b3be63facfd59658b316f20de1.camel@redhat.com>
 <CACGkMEsbiN90ptOL2XHauzWS=9j5RXtnO7OD10yChPaUO3CY_A@mail.gmail.com>
 <2f1c19591ff456ada2a1ad470032d3e3fb9f88d7.camel@redhat.com>
 <CACGkMEv9gGrLO0OkHYKmjqrLw50kfm2yaifMk1wnb6noa5L99w@mail.gmail.com>
 <4497c727ea6cc696ba7d60bcb95ba9bce33f1136.camel@redhat.com>
 <CACGkMEu_ODQV6O5-w6Hzg5gk-8x_iRsuWSk4fN2vzznPEYKphg@mail.gmail.com>
 <CA+FuTSdAB3m2gD8gA9VyRY5+C4UJqE38cTbkTbYhZbh=yNofyA@mail.gmail.com>
 <383c106f9f9abd34ee5fbb050c68feb9f0b6cf60.camel@redhat.com>
 <CA+FuTSfsAuj0PLSoezWAP=ZREhNp4KR7VcBFbc+7hL7wBeZ5Sw@mail.gmail.com> <3dd4b01fbc53bcd4e42a5ac8ea6445b91cc2d50b.camel@redhat.com>
In-Reply-To: <3dd4b01fbc53bcd4e42a5ac8ea6445b91cc2d50b.camel@redhat.com>
From: Willem de Bruijn <willemb@google.com>
Date: Wed, 3 Jul 2024 14:44:32 -0400
Message-ID: <CA+FuTSejcfSkEcQHEXtarS+Ejg=qGRgE-A+dU4icR_H7aLE2nw@mail.gmail.com>
Subject: Re: [PATCH v5] virtio-net: define UDP tunnel offload feature
To: Paolo Abeni <pabeni@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>, virtio-comment@lists.linux.dev, 
	maxime.coquelin@redhat.com, Eelco Chaudron <echaudro@redhat.com>, 
	Stefano Garzarella <sgarzare@redhat.com>, Michael Tsirkin <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 3, 2024 at 11:00=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wro=
te:
>
> On Tue, 2024-07-02 at 19:43 -0400, Willem de Bruijn wrote:
> > On Tue, Jul 2, 2024 at 12:38=E2=80=AFPM Paolo Abeni <pabeni@redhat.com>=
 wrote:
> >
> > > Additionally, I raise a doubt about PISO
> > > feasibility in the virtio net case.
> > >
> > > Let suppose virtio support PISO, the device transmits an UDP tunnel G=
SO
> > > packet, the driver receives it and fill the skbuff. The inner protoco=
l
> > > and mac are unknown. Even skb->encapsulation is left zeroed. When/if
> > > such packet is later S/W segmented bad thing will happen.
> >
> > I think these could be addressed with the right virtio_net_hdr fields.
>
> (Almost philosophical question) If we add more field beyond the outer
> header offset, is that still PISO? Or just ~ this proposal?

We would only add them to make the device-side Linux implementation
happy and be able to treat this as a tunneled packet.

I suppose that philosophically speaking, PISO treats the entire packet
as a non-tunneled packet with a very long undefined header. Linux
should already be able to handle that.

> > But it's fine to skip too.
