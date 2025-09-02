Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF16526C3A5
	for <virtio-comment@lists.linux.dev>; Tue,  2 Sep 2025 19:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756842315; cv=none; b=bHrrYJWJeso940kQxLMbqwdJj12SxzpawjADHX2L67kVtOMnkZYtZCP6nKjQ7uxq05/FNWv1eEV+5buFaJqGGmKZPAsQEE0Sfx+IXOJP0oR6KSPOKyAJsUvEtXahTVgwgY/xx0rANRTYMaFbOvfI+U09NFZTvX3sH3abPenNDjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756842315; c=relaxed/simple;
	bh=qpubTuFQ0XJgkzn18zYMK5klh0fuHZn1xA+8y7IKDeo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PxtSASbZctc92/hqzRUu//gL9u21mZsPET1oKNcX8HqNYlmF/oUL0YjTM0rh+rrtR31wNTwNUuIrOjqqEiByYC7sm6r/+JDkLzRVPBhSIUldalbW7PQmeYrmu6kiN/LlvnlX+XgD38AmdGurTR/OL6JLc3ndkHX0I/3rrkPjFW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=h11SUiOs; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="h11SUiOs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756842312;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qpubTuFQ0XJgkzn18zYMK5klh0fuHZn1xA+8y7IKDeo=;
	b=h11SUiOs1FAR8yabQ+f2lEzAJHiPEQqbvVAt84B9yrNAbko9E5o45xGsI6FIyoVv1/dQkr
	TxC5Zn5i6gLI3YkKI5FdjnWHsXrQbyDIKcfg4oIgN9XODG2eHQRwadpxydVzk1rq0tspMP
	HB16ssq6mRC6vu3xx6Zr41nbh8iDfVI=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-523-ZILqIjmVPcOgXLPivlPw8w-1; Tue, 02 Sep 2025 15:45:10 -0400
X-MC-Unique: ZILqIjmVPcOgXLPivlPw8w-1
X-Mimecast-MFC-AGG-ID: ZILqIjmVPcOgXLPivlPw8w_1756842309
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-61e9dd3aac8so2997822a12.3
        for <virtio-comment@lists.linux.dev>; Tue, 02 Sep 2025 12:45:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756842309; x=1757447109;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qpubTuFQ0XJgkzn18zYMK5klh0fuHZn1xA+8y7IKDeo=;
        b=twjCAiZf8Iqsq273+jGm+uSYpHEHg/zH3XmX+wPgIIGYLEHdn79dfuZESG0XBuwjQ/
         QCp1Oj4MGNIS5stbmKUFRb08S534k0XYr+5N4NjjHHvCqurv3LKvVhuDPpHGytyLZ29E
         M+wwZ9LV8yeTc1+L4FOQs6fQ3v9I6OTDF6Jad1dTHLhOYch3oG28/AlzlWxujl2icvpz
         PaPsLBOv2cgjHCWdHFW90Jxr3VpWoXobKq3W3ynlm4v2mEp9F5Xrtl9+NbFx1PZkLlaO
         vXHY+uTXiu1amhSbJK3sOvyoyXfGCld8PI9SEUrA9KYrrNkcuFXjRDZvv4wuVH3cenck
         Qx9A==
X-Forwarded-Encrypted: i=1; AJvYcCV12jHkEHtGt2pKZiX/7DTpdwIfFqIlmQ4pRZd4EcrUyw12J6enIBXULZuay0dLEPdZC+ecGqnpLdUcP2I0pA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwGVUZsQtodhBNDjPcMKhmkbhwHdsKv2moLTgety4FGRrbpIeBJ
	9mb7HtVZLGDDomyja8nv6/putOeyR3LZR7fmTaZOWmbCr0iUvztjnIZmBuwdZqQ6Iidm/omEqTM
	a6s6cpfQQL4BrgCVuA+aCJqkENl8Mm4sojdPRo3OJTWE+gG7GDCGsBeFsKZTEz7BY9HHVbhn+62
	y4ncVqn2ArdzV4+zMWQmabbZ9x/BlAzlhBIKhlew/CUYQ=
X-Gm-Gg: ASbGncuj/T7m5RhZEuszHhoJ5RM8mDxN6EEpHTnlfs1RE9ukPyraUJNLcQPPEvVxfYZ
	ZXRuNehA8OB6bDMLQ1sMx6jwPhLWX6NkwkGSQntDFRQgH2/53SzfBjwwUnwFOQnwtWDr/pq7ucY
	XnvdHWhRtks9ksUcbW6wkTzAni+IooUwqQyXSoc3EC7WitnRSK1mwL
X-Received: by 2002:a05:6402:520b:b0:61c:6855:d92d with SMTP id 4fb4d7f45d1cf-61d270e4601mr11122992a12.31.1756842309282;
        Tue, 02 Sep 2025 12:45:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEmCPa7q4+UqSdmkV6AOCZ0CpWh0Rl35iOsq5Mdo3urxkg4cwNeMlcK+g0mVpI3UBfOAdJPdwSTDh4HDnh+gSc=
X-Received: by 2002:a05:6402:520b:b0:61c:6855:d92d with SMTP id
 4fb4d7f45d1cf-61d270e4601mr11122975a12.31.1756842308913; Tue, 02 Sep 2025
 12:45:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250620224426.3923880-1-bill.mills@linaro.org>
 <20250620224426.3923880-2-bill.mills@linaro.org> <87iki234wq.fsf@draig.linaro.org>
In-Reply-To: <87iki234wq.fsf@draig.linaro.org>
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Date: Tue, 2 Sep 2025 21:44:58 +0200
X-Gm-Features: Ac12FXz7EAtqDSpX1uCRjkm8HT32_pTfO-2BJCDbgkRmEbbfk2PHcqDZyY1pbKI
Message-ID: <CAHYGQ0yqVSqUN3vAkr4MrMT-1eqta3u6g_LNzwDx10yGcSaXtQ@mail.gmail.com>
Subject: Re: [PATCH RFC v2 1/1] virtio-msg: Add virtio-msg, a message based
 virtio transport layer
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Bill Mills <bill.mills@linaro.org>, virtio-comment@lists.linux.dev, 
	Bertrand Marquis <bertrand.marquis@arm.com>, "Edgar E . Iglesias" <edgar.iglesias@amd.com>, 
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Viresh Kumar <viresh.kumar@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: VNc6yQLoZp1GueOsz58JCCmy-_OK4j6ue1BnIxD3bpc_1756842309
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 1, 2025 at 11:37=E2=80=AFAM Alex Benn=C3=A9e <alex.bennee@linar=
o.org> wrote:
>
> Bill Mills <bill.mills@linaro.org> writes:
>
> > Add a new transport layer that is based on messages.
> >
> > This transport layer still uses virtqueues as the other transport layer=
s do
> > but implements transport layer operations by sending and receiving mess=
ages
> > instead of the "MMR" reads and writes used in virtio-mmio and virtio-pc=
i.
> >
> > This transport is useful when the device and driver are both implemente=
d in
> > software but the trap and emulate operations of virtio-mmio and virtio-=
pci
> > can not be used.
> >
> > This transport is intended to be used in many situations, including:
> > * between a host processor and its co-processors
> > * between two different systems (not SMP) connected via PCIe
> > * between normal and secure worlds
> > * host to vm
> > * vm to vm
> >
> > This is an RFC and not yet intended to be merged. There are multiple
> > know issues including not conforming to virtio spec standards.
> >
> > Signed-off-by: Bill Mills <bill.mills@linaro.org>
> > Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> > Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> > Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>
> Ping?
>
> I'll be around at KVM Forum if anyone has any questions about our
> use-cases. We've reviewed stuff pretty thoroughly internally but
> obviously we need to input from the wider VirtIO community before
> proposing a vote.
>

I am interested in understanding the use-case. I'll also attend the
KVM Forum. I am afraid I won't have time before we meet to read the
patches.

Matias


> --
> Alex Benn=C3=A9e
> Virtualisation Tech Lead @ Linaro
>

