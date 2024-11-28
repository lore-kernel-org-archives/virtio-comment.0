Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90EC7381AF
	for <virtio-comment@lists.linux.dev>; Thu, 28 Nov 2024 03:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732762883; cv=none; b=IRUCNpOtsHefBcF15XOWB/MRLnJvM4M/2HqcZUEsRbszEGY0fVsGlVHd4A0pGd8aTfIc8F/CSvHu01RDciwYgeO4YiWMiwfP9chfMf+uzQAosKII8YD78l0ND7EIkLSjL057rf0CCJE5DS33D1xeR+KBlXfscfpL9L1GhK8KOq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732762883; c=relaxed/simple;
	bh=srO29zHTK1RzqqHbAE4ituzm2e0puAQu56faka6DRdM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ghfPWDi5BPODlAZd7LXyzj27JlPvra9MkHxnx1rwJ7KvCrGo0irLo5f0nfInYmFYs71WmuYrbk10+ijmagmLW/ESqxnlqHklYjSAkOg/itPJP4Nk9v5OB7jv4WclDWUFGmgWl4byYvSFsTUktWAd0vuQEcbYz/arZJUgmp1KnsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MyFsT4Es; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MyFsT4Es"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732762880;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=srO29zHTK1RzqqHbAE4ituzm2e0puAQu56faka6DRdM=;
	b=MyFsT4EsG9jTAXs1BcgrcnY9hOOkx6Jwkidy+pKWlVMERQuFJxiO0pnSs7Iotk7bfg9xFv
	/q7jP0Az3bWqiQ9nAFLVCZzAbaK9F85lKlYC3tkVKSLyuQHCdNdnFS8vPKsoKtJQ62kpRs
	fH5nUpS9ACGKlhkfgJRsLWHnil1jVnQ=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-392-zGjDllcyOECw4SB0rmdgQQ-1; Wed, 27 Nov 2024 22:01:19 -0500
X-MC-Unique: zGjDllcyOECw4SB0rmdgQQ-1
X-Mimecast-MFC-AGG-ID: zGjDllcyOECw4SB0rmdgQQ
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2ea4c541b61so471305a91.0
        for <virtio-comment@lists.linux.dev>; Wed, 27 Nov 2024 19:01:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732762878; x=1733367678;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=srO29zHTK1RzqqHbAE4ituzm2e0puAQu56faka6DRdM=;
        b=RbgSaf58avRET+rDYhb8x2Ls4WyLpJ5dtjbX+po5OoN2wxEnUP4Mp6muKlSPn3gSOM
         AJ+aN+REvpqGs2Dica3Mr/7KlZ/GObqMuhdyFFzSAKtnn/kB1tw6zPB9R2S7mColrb+x
         ozQocLD7Dlr3/jbp02C3g5XSdKbbz3rcvEs8+Q0MMt+S0GuGpufVBL9f37oSe5NfKJLr
         4NWwOoUiqAbKTI5KI3xYj/rxHNHQcza3cmX8aw1ESB6nU7XIozNCmxDLeHpauJpdb/Ut
         NicK6OVGukiK2o/PBad9Uo3uhT4MEF17rkph2iRtI3bb1Odu1ZlsmkdUZKDg4iofODUL
         R5gQ==
X-Gm-Message-State: AOJu0YzrTYcmkmSLAPr+n5d/x5UHIT8AMh2WQ+rmLDB6wkm6wTY4PLVG
	/M6GNFigP/H8VWHxwvg4VkgiszB1ywXyJBZaAK8zWDAo5YNw3yTnS5YiOZHRoKfbNjyEfNmhzoh
	zK1OKoWp4UVUGkqFsruwUYi/dEwoGSE92e0dV+J1/bQC0mqCmL5dVn2AK9vkQJdAZfsnGVT0B86
	fj+lEbu5do/2OAxLLo6GZzDbif8nAJJvKestXN2S8=
X-Gm-Gg: ASbGncv/GZCNoo3oQqAD7lg1GurhuNRmIV1wKzzepvxAiZ/Iz1KC12ziaWRWeHr+6Ew
	A1KXyMgdzDnphD6MfGIcWaQkmewY0Ge2b
X-Received: by 2002:a17:90b:1a90:b0:2ea:37b4:5373 with SMTP id 98e67ed59e1d1-2ee08eb1d9cmr6888359a91.10.1732762878057;
        Wed, 27 Nov 2024 19:01:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEXCWB9HrP+E14VOcmdGxK94ztNdVzWB3CtXoGbG22TgfFQcllcQYLmj0HbKiZI/GTMoj22r/LhIUgoWu2NmwQ=
X-Received: by 2002:a17:90b:1a90:b0:2ea:37b4:5373 with SMTP id
 98e67ed59e1d1-2ee08eb1d9cmr6888326a91.10.1732762877678; Wed, 27 Nov 2024
 19:01:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1732699986.git.pabeni@redhat.com> <ec6fdbfba2c4fc1969d83799836ebb694a01fb30.1732699986.git.pabeni@redhat.com>
In-Reply-To: <ec6fdbfba2c4fc1969d83799836ebb694a01fb30.1732699986.git.pabeni@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 28 Nov 2024 11:01:06 +0800
Message-ID: <CACGkMEuLe4TxSuprbLdgK6a5dn-x2qxA9UZ-EORQvSszrrAwTA@mail.gmail.com>
Subject: Re: [PATCH v11 2/4] virtio-net: clarify DATA_VALID semantic for encap protos.
To: Paolo Abeni <pabeni@redhat.com>
Cc: virtio-comment@lists.linux.dev, maxime.coquelin@redhat.com, 
	Eelco Chaudron <echaudro@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>, 
	Willem de Bruijn <willemb@google.com>, kshankar@marvell.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: UaZ5KSUurheqtVHW6Yw4r9Y7atuA_hij-TeWCZvU9co_1732762878
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 27, 2024 at 5:37=E2=80=AFPM Paolo Abeni <pabeni@redhat.com> wro=
te:
>
> DATA_VALID allows offloading a single checksum level, leaving
> unspecified which header checksum is offloaded when one or more
> encapsulated protocols are present.
>
> In such a case, the only option usable from the guest OS is
> offloading the outermost checksum. That also matches the existing
> implementation.
>
> Explicitly state such the constraint, to remove any ambiguity and
> make later changes more straightforward.
>
> Signed-off-by: Paolo Abeni <pabeni@redhat.com>

Reviewed-by: Jason Wang <jasowang@redhat.com>

Thanks

