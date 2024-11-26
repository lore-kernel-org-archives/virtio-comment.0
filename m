Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E47FBE65
	for <virtio-comment@lists.linux.dev>; Tue, 26 Nov 2024 03:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732590082; cv=none; b=s5dMM2xs9/xoU24Z15YYZpLOOeepJXE44T2wQckUCWv6kPumxr1XQUuL006pOJeWHwQSHFya4qEx2IHqTIkWmrHejlADjYze+ccmVQfysENTEkqScJoVS58FAw09b/7AZyMkpx4XfuZ7vVEr45vm/r0CInlfUTOU3pg391vLx8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732590082; c=relaxed/simple;
	bh=H7khB+vkdmvNskppIOmw/xIDbDNsTImWAEJBh6hllvE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kelY5UdBowBuL62VoxJRt0JuqFGrwPfNbBu9gcJPPEzGV7yC153WXvIQdJCnRct+U23ZqS8M728/5DZVEffSrn8fNcb65GMfedZ2zv6wBmGSxCKVHdk+z4rYpMcc8AVXTSjFJV9D0J9uwn7T0RWdJ3FWYapdVqcl2wqgBpPeN0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QywlYdcz; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QywlYdcz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732590078;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ILDx9j1eEn5gmMNxd+Y+nRXDfvB2I0AMCAvf4tN53Ss=;
	b=QywlYdczdWdIVfU0QM1MFWkaZ/mSFa5PgW8pMu6oVMzMOMZz+fnbUfoxd9wIIzAj7PyQtC
	d/UUYB3w+K8z7Up7k+UHeoSDKPUzQzCXCHx5DkuSO3OD3rWdWrioBEbGEohaegYbI7OiTP
	kuP8DwTdlTuEh9+xM+0KLOCutCQWons=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-158-6FxGDNYQNVKKJ51eepdzvw-1; Mon, 25 Nov 2024 22:01:14 -0500
X-MC-Unique: 6FxGDNYQNVKKJ51eepdzvw-1
X-Mimecast-MFC-AGG-ID: 6FxGDNYQNVKKJ51eepdzvw
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-7ee3c2a2188so4545037a12.3
        for <virtio-comment@lists.linux.dev>; Mon, 25 Nov 2024 19:01:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732590072; x=1733194872;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ILDx9j1eEn5gmMNxd+Y+nRXDfvB2I0AMCAvf4tN53Ss=;
        b=a2iDsMWUZpXUXwGi45PHEGdX7JkWZgYgov0woQZq3C8WnARRG9IuMPQ3YGgAdS/Gnh
         X2567iP9XJ/jyO7Ur4t4TpYtsLpO+WuBiuidczu5R/+KvW4Wq6+Jewjh8tIHwvCXYVpS
         o+JGjDcgRcX9owQ05DWhlAXV/On9sOMLJDt4DKTWvKtkBwyXFQBGYnjJqEd/C1aBjUWx
         AoNFtI0KCKJXZ06qooCMVHReK/NwvZPElmn3lPfJiAoWOKoOaJeaf5bpknzmbsvoo5Q1
         f4Fh4huJZ940Qa9UhNLZFgxZ2KIoXgfPLHZJbiOGLOSQakCxRmG86v0z5K84iFSdOYR4
         Hgxw==
X-Gm-Message-State: AOJu0YxSYKJF/EwQA/iOYvxjCJqQU358fTyzW1mbHtNXLp/cfNov1pLP
	4OBhpFV6m128Izw1rbXysbNFsuBMkNbdlmSikRSxtkp8ubbSa+pYBXttp0t+x5u97lRi+2OubPk
	Pqr28DihKyW+TggXBXxHkdmR2JugS8O8+qZo1/lUk35cz6VdEuu4mO+0U2WsrxFpLjhJI4vtFTl
	Ha4iEtlsSTSUxTWJ2rFzVeyJstuZ0Srinf8fVbopQ=
X-Gm-Gg: ASbGnctOm+05KD/4IaN7ixMoxvdaPPpFZ4zVTnTVEg1iS9ofEx79y7xwaPspZKE7rT0
	gd3wmedch6CPMv5Krf8vFcbTFQzwF6Q==
X-Received: by 2002:a17:90b:3c8c:b0:2ea:9309:759f with SMTP id 98e67ed59e1d1-2eb0e024abemr18439936a91.1.1732590072570;
        Mon, 25 Nov 2024 19:01:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHtx5gLB90b0V/YQsFJcV9klNQdVQKqaIcysjP14Fxc7mzqAvF7NIzXg925hb5zeO9cMEueLawEPVNAwmUQesc=
X-Received: by 2002:a17:90b:3c8c:b0:2ea:9309:759f with SMTP id
 98e67ed59e1d1-2eb0e024abemr18439910a91.1.1732590072151; Mon, 25 Nov 2024
 19:01:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1731084277.git.pabeni@redhat.com> <c03a1ec585fd7755eaeea25b690e1704ad5260db.1731084277.git.pabeni@redhat.com>
 <CACGkMEsxRJVS5vyhJedj2RYuWG6B7ME6JbVEo1H9sgTgJR=ubg@mail.gmail.com> <067ebefd-8d1b-437a-97c0-f5f771102a94@redhat.com>
In-Reply-To: <067ebefd-8d1b-437a-97c0-f5f771102a94@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 26 Nov 2024 11:01:00 +0800
Message-ID: <CACGkMEvVAoQAfKYnvuN5ZQqG-UgG+nUuhoAHruSmmV_rDSrc5w@mail.gmail.com>
Subject: Re: [PATCH v10 1/3] virtio-net: clarify NEEDS_CSUM semantic for GSO packats.
To: Paolo Abeni <pabeni@redhat.com>
Cc: virtio-comment@lists.linux.dev, maxime.coquelin@redhat.com, 
	Eelco Chaudron <echaudro@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>, 
	Willem de Bruijn <willemb@google.com>, kshankar@marvell.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1js6xQc0WUxe2cx-OGMfy81H2V0ge2NIr2XCB4lBQUE_1732590073
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 26, 2024 at 12:01=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wr=
ote:
>
> On 11/25/24 03:51, Jason Wang wrote:
> > On Sat, Nov 9, 2024 at 12:53=E2=80=AFAM Paolo Abeni <pabeni@redhat.com>=
 wrote:
> >>
> >> The current wording is a bit unclear hinting to possible additional
> >> nested headers. For GSO packets virtio net (currently) supports
> >> offload for the checksum of single transport header, explicitly state
> >> that in both the driver and device sections.
> >>
> >> Signed-off-by: Paolo Abeni <pabeni@redhat.com>
> >> ---
> >>  device-types/net/description.tex | 11 ++++++++++-
> >>  1 file changed, 10 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/device-types/net/description.tex b/device-types/net/descr=
iption.tex
> >> index b2a0d39..3099c6f 100644
> >> --- a/device-types/net/description.tex
> >> +++ b/device-types/net/description.tex
> >> @@ -605,6 +605,11 @@ \subsubsection{Packet Transmission}\label{sec:Dev=
ice Types / Network Device / De
> >>  \item the driver MUST validate the packet checksum at
> >>         offset \field{csum_offset} from \field{csum_start} as well as =
all
> >>         preceding offsets;
> >> +\begin{note}
> >> +If \field{gso_type} differs from VIRTIO_NET_HDR_GSO_NONE, \field{csum=
_offset}
> >> +points to the only transport header present in the packet, and there =
are no
> >> +additional preceding checksums validated by VIRTIO_NET_HDR_F_NEEDS_CS=
UM.
> >> +\end{note}
> >
> > I wonder if this defeats the purpose of LCO where the outer checksum
> > could be deduced.
>
> I don't see how?!? The added statement is not a behavior change, it just
> clarifies the existing text. I don't see any implications WRT LCO.
>
> Could you please describe in details the eventual problem?

Not a native speaker, just want to check if "no additional preceding
checksums validated by VIRTIO_NET_HDR_F_NEEDS_CSUM" is in conflict
with the case when we apply LCO for the outer. Or do we treat outer
checksum as "preceding checksums" here.

Thanks

>
> Thanks,
>
> Paolo
>

