Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A59D39E6F5
	for <virtio-comment@lists.linux.dev>; Fri, 15 May 2026 09:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778837724; cv=none; b=rkTdpZWfsKS9CP7B4gEOfjF3OB7tcHAOD7/qsNcB245JWl5PQSGfZ2QHjy0vxbYongPHDJ2N/5QHw23e/K/gXrNefIjc5D4tiiwOLgSAHmKspDZjRc/wOojah3y9pDNxPY727Zr5VyzCgT/eacruQ6aCKV4cvtDeN/gALGjdWbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778837724; c=relaxed/simple;
	bh=eU/wyqY3P1nrDrpN+eTqU5qWfppAoFBshM5NUpBzQx4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=phS1wc1yK3Ly17Cn6ubc879BnkpcOY+hhio+pS9wrPW7ohT3TZKem/jLAnaB/1QZAYxy2na2e7jRdUk2xgYAw7uhveEBxqgbV+E+0CpZtjtivheIEQkDFa8xlBxqdK8m00jJdaByK5oh31FuTpWtaXe2wV1n3au+n82PL7PKjOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Lm2V+qD3; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Lm2V+qD3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778837722;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9VPyGY0WS2tMHvuPNBh0cbp17iUuJWrIX+cTf77o9Kg=;
	b=Lm2V+qD3F8pSNyr8MJzHm+XU7d/p2CRmnmZEuDAfF/w3tK7xp7ueav5NRRnN4/lhgvfGEp
	A+40UAwIkImObQIB2l9ejd3xZZI9Pt11NvMr7NsEfg+j7vAVWMQvBvCbPSiwWsLH0aUc3O
	/pKMPCMo+2VACAvEBiBc1i8BkxkGpB4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-351-EW7cV6n-NzOWkE2Y1a3sQw-1; Fri, 15 May 2026 05:35:20 -0400
X-MC-Unique: EW7cV6n-NzOWkE2Y1a3sQw-1
X-Mimecast-MFC-AGG-ID: EW7cV6n-NzOWkE2Y1a3sQw_1778837719
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-45ae994d9aaso4609766f8f.1
        for <virtio-comment@lists.linux.dev>; Fri, 15 May 2026 02:35:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778837719; x=1779442519;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9VPyGY0WS2tMHvuPNBh0cbp17iUuJWrIX+cTf77o9Kg=;
        b=FUpxnDEjvIVOoBKr7iYg5E5T2ZJyJ2N4Spo7WelA7b4r3rEnWX7B7wE8Td/Ut9JvaY
         7G2S7BUxUBf/jMDr48E2PG284WLqnuD1aDvF/6CwJMnb1Kg8LPbaz/Hujs+NRTzc6WWW
         FCdxESlLQPsC24squVWp1ITU0Vi60Dc8Alf8Jrh1hVhm2RZTZRbqhPnCP9ne8gKa67qm
         Wa1RQiv1Yr5MTCNw43qLvopFrHtJBKcgeq3qzD+fanvao+Q08M91JSzXT5+B3U8BzXk5
         ItKHbF6bzwGL3SEdY8vtrLTywqUR/RLQ//HYc8LvI6KosdTFBy8vKgEQqduHmqVBMdsz
         Xs2g==
X-Gm-Message-State: AOJu0YxxbnwB3eYZtkQy1zsfNi+9ZkyLv8I6LFRPWtUG9ODMnyqS5IOr
	/lWowPuDqPOYHcg5ud8nWElFEOr7hDSngwRo1caocO0Nnv17lnC011fX9I17MFG6eR9ege3FGKN
	PVkeGkuFL2WnHseEYrEojHaBvWjSlxsJs0PiUs7YCCpc6gBixD9kMiTsFx6rk71TCjxyG
X-Gm-Gg: Acq92OEsDNRD0BS37inF/GRUIKWtTRY9EJES2pMxtxr4ibiSEvOIqgNssGHHD6T+V8c
	DY3tRuWs/WYoQ9VoiY6jvBJEoV6R5VyXo/RsnJWvSGcEVSI+FHAgthccm8yUMHynD4oiZ2sa8UO
	N8AhqB7ZWr50gdiBTZhuiqL8+pAdiVKnVKrIvChLjb/0gWM++OLXdaJBVaDX9G2pFw9vif1J9lJ
	jgA1DIgvK2KSLCF0J4K1gU46hYKITO7MG4bfVBVP4s4CzEiAsTrmmkdPJ5tp8pmlHO0Th1sCyMV
	Xr09Y3Rzc1/Z6AZwbTJ1y39Juhbjvc9d7M1llsrwKh/YtbR1Ki1S9nFSE6HYySkqw9aXYV18DQm
	DYyoO3Nfalq3Y07v+CvammRvwCqGRJlEnvzkPcE0d
X-Received: by 2002:a05:6000:40cd:b0:439:c62a:6dc2 with SMTP id ffacd0b85a97d-45e5c5ddd3dmr4192050f8f.41.1778837719233;
        Fri, 15 May 2026 02:35:19 -0700 (PDT)
X-Received: by 2002:a05:6000:40cd:b0:439:c62a:6dc2 with SMTP id ffacd0b85a97d-45e5c5ddd3dmr4192013f8f.41.1778837718664;
        Fri, 15 May 2026 02:35:18 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-48-7.inter.net.il. [80.230.48.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9e768c4fsm13375325f8f.8.2026.05.15.02.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 02:35:18 -0700 (PDT)
Date: Fri, 15 May 2026 05:35:15 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: virtio-comment@lists.linux.dev
Subject: Re: [PATCH v4 3/3] balloon: add
 VIRTIO_BALLOON_F_DEVICE_INIT_ON_INFLATE
Message-ID: <20260515052929-mutt-send-email-mst@kernel.org>
References: <cover.1778140241.git.mst@redhat.com>
 <b29dee815f250b3332651a1a5aeabc4e49ec6914.1778140241.git.mst@redhat.com>
 <CAAjaMXZggBhThMSrR8-YWx=AZDi00hm9or6CSB+v3xgjvbaotg@mail.gmail.com>
 <20260515052118-mutt-send-email-mst@kernel.org>
 <CAAjaMXYMOjxEL6uwVgzmfiH0PDkkdOrsCw2AzwOgj6Oie3D7Xw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAAjaMXYMOjxEL6uwVgzmfiH0PDkkdOrsCw2AzwOgj6Oie3D7Xw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WTARQmhjRMRuovMvNdfc8YOFf0EAbnN6r6Y7OKLpmtQ_1778837719
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, May 15, 2026 at 12:28:14PM +0300, Manos Pitsidianakis wrote:
> On Fri, May 15, 2026 at 12:23 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Fri, May 15, 2026 at 12:09:24PM +0300, Manos Pitsidianakis wrote:
> > > On Thu, May 7, 2026 at 10:52 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > >
> > > > Add VIRTIO_BALLOON_F_DEVICE_INIT_ON_INFLATE (bit 7): the device
> > > > initializes inflated pages and returns a per-page bitmap indicating
> > > > which pages were successfully initialized.
> > > >
> > > > Update Security Considerations Data Integrity subsection to cover
> > > > both DEVICE_INIT_REPORTED and DEVICE_INIT_ON_INFLATE.
> > > >
> > > > Fixes: https://github.com/oasis-tcs/virtio-spec/issues/242
> > > > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > > > ---
> > > >  device-types/balloon/description.tex | 73 +++++++++++++++++++++++++++-
> > > >  1 file changed, 71 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/device-types/balloon/description.tex b/device-types/balloon/description.tex
> > > > index fa33105..7afdb24 100644
> > > > --- a/device-types/balloon/description.tex
> > > > +++ b/device-types/balloon/description.tex
> > > > @@ -52,6 +52,9 @@ \subsection{Feature bits}\label{sec:Device Types / Memory Balloon Device / Featu
> > > >  \item[ VIRTIO_BALLOON_F_DEVICE_INIT_REPORTED(6) ] The device initializes
> > > >      reported pages.
> > > >
> > > > +\item[ VIRTIO_BALLOON_F_DEVICE_INIT_ON_INFLATE(7) ] The device initializes
> > > > +    inflated pages.
> > > > +
> > > >  \end{description}
> > > >
> > > >  \subsubsection{Feature bit requirements}\label{sec:Device Types / Memory Balloon Device / Feature bits / Feature bit requirements}
> > > > @@ -249,6 +252,10 @@ \subsection{Device Operation}\label{sec:Device Types / Memory Balloon Device / D
> > > >  and before detecting its physical number in a deflate request
> > > >  and acknowledging the deflate request.
> > > >
> > > > +If VIRTIO_BALLOON_F_DEVICE_INIT_ON_INFLATE is negotiated, the
> > > > +device MUST NOT modify a page after reporting it as initialized
> > > > +in the bitmap.
> > > > +
> > > >  \paragraph{Legacy Interface: Device Operation}\label{sec:Device
> > > >  Types / Memory Balloon Device / Device Operation / Legacy
> > > >  Interface: Device Operation}
> > > > @@ -672,6 +679,67 @@ \subsubsection{Device Initialized Reported Pages}\label{sec:Device Types / Memor
> > > >  If VIRTIO_BALLOON_F_PAGE_POISON is not negotiated, the device
> > > >  MUST fill each initialized page with zeros.
> > > >
> > > > +\subsubsection{Device Initialized Pages on Inflate}\label{sec:Device Types / Memory Balloon Device / Device Operation / Device Initialized Pages on Inflate}
> > > > +
> > > > +When VIRTIO_BALLOON_F_DEVICE_INIT_ON_INFLATE is negotiated, the
> > > > +device initializes inflated pages and reports which pages were
> > > > +successfully initialized via a per-page bitmap.
> > > > +
> > > > +The driver appends a device-writable bitmap buffer to each inflate
> > > > +descriptor chain, after the PFN outbuf.
> > >
> > > Maybe we could say "page physical number" instead of PFN to stay
> > > consistent with the rest of the balloon spec.
> > >
> > > > The bitmap contains one
> > > > +bit per balloon page (4KB), where bit N corresponds to the Nth PFN
> > > > +in the inflate request (0-indexed). Bit N is stored as bit (N mod 8)
> > > > +of byte (N / 8), with bit 0 being the least significant bit.
> > > > +The device sets a bit to 1 if it successfully initialized the
> > > > +corresponding page, or 0 if it did not.
> > >
> > > Does this mean page size cannot be larger than 4kb?
> >
> > With legacy balloon, pretty much.
> > This hack of sticking right-shifted PFNs in an outbuf
> > is a broken interface that can't even support large guests.
> > If someone worked on a better one, would be great.
> > But for now, this just supports zero reporting with that.
> 
> Makes sense. Should we mention it in the traditional balloon device
> description? Or even put device and driver MUST statements that page
> size is always 4kb.
> 
> For this patch:
> 
> Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
> 
> >
> > --
> > MST
> >

Well it says:

  \item The driver constructs an array of addresses of unused memory
    pages. These addresses are divided by 4096\footnote{This is historical, and independent of the guest page size.
} and the descriptor
    describing the resulting 32-bit array is added to the inflateq.
  \end{enumerate}


having said that:

- it should be "a device read-only buffer is made available in the
  inflateq".

- the text mixes "pages as in arbitrary chunks of memory" for page
  hinting/reporting
and
- pages as in 4k chunks for inflate/deflate


if there's work to modernize balloon, fixing these might be a
prerequisite

