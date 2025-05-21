Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456F2433D1
	for <virtio-comment@lists.linux.dev>; Wed, 21 May 2025 01:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747789522; cv=none; b=WwlGCIdY4ZF7aGkhGGBX1K0IEFwhOy1S0VnE4uuhXca+1wtF2dRrZTn+rsF/40wb1vXjLi8vb7TgZhJg7BYC1s5QF/fu65AYBUivCOO3TrxgbuunnL99hmjDgXIUVAFnzy7oEIk9I3eqBk3nBfAR2PB64zaOIHogdmr0cXMZ5x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747789522; c=relaxed/simple;
	bh=y1bXz/XNbp9uUkEV+NPgDycPQzWHm7qG6JgjLtx2jQo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KVWIYHwhEnnulozkWLWGByN41L7ROranMokmRzaBLrjRtnUY5ReZ0YMD7gJ5LC5gLuQu3YM1epzORggKMafLaEmQswmWZuXL5UlKJ90v/O6+m7UElOFq9wItqcS8Ezrk9Ad2EmkOPyNchucHNkvRpP4x67/n6VxRFkKavRzsLgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aZuFiK35; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aZuFiK35"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747789519;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Re/Gvc15lXTCtiQRzijzFuIPr+jjYRgThgogCqYNQCU=;
	b=aZuFiK35XueXYo7rJC9sTN0kXw9R5Ue3sTp2HLFV86wYGaoAITU1p/xzy7uFJ0QAWcb5sA
	7kbKg0Wx9BpeP/i7D3XNgbzVLvor029alhNe9Moz31DAYZ1W5Tel9b1LViSZ1lhZc1Lqn7
	OHDpqRdybOSdX4UDJkP15F+qORfQ4Hc=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-451-IY-SmlljPeC2YeYacxk30A-1; Tue, 20 May 2025 21:05:17 -0400
X-MC-Unique: IY-SmlljPeC2YeYacxk30A-1
X-Mimecast-MFC-AGG-ID: IY-SmlljPeC2YeYacxk30A_1747789516
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-30e9338430eso3713421a91.3
        for <virtio-comment@lists.linux.dev>; Tue, 20 May 2025 18:05:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747789516; x=1748394316;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Re/Gvc15lXTCtiQRzijzFuIPr+jjYRgThgogCqYNQCU=;
        b=lbl1OJPWETfYDcRoyUqhzRE2xPK6mIg8XzOsBzhQqt1j8RhzgzrWj19uLwpsyecSAt
         D8kiBNkQPS2JEnAmU4qZJZw7Tyhslx5PF23v38LVLgjQv8uqRr+vzkc82i6bB/z9Rayy
         bi5PLsRmcvClT4gc2HZEVWCaqr3YrGxdLFFE2sag5onZFAmLXPrOyaDs1uSU0uZacCO5
         jOLylPEbvTWpNdqRg1sJNSLOzPLfAsbQTrSc/5/UW4TE/dnAk+VKcZ9feRX6JuprCDyd
         hJhSx8R9SxdccI2X/wjsPcYQNHhSHijquDNgeFU9B14K/8RnXQ+qSsFEeQe3+SC0hPw6
         y3mw==
X-Gm-Message-State: AOJu0YwvSds9xqTPvU4vbXxEipbOUTiXfPFZHKT5mG8ChVxj2GuYuUuu
	Q7NK9JMTC8QVXr1RBWoyF5j/uKo9BV4PxUVUOIdxR11pGaPdh9L7rq4H0oWRgc+Y/R1wPCMrKtF
	vSMOotU5Y/uYs4LHz3B4Sd2L578k55BFcNh2TganARH+GNVX8amSD5hdkOyuxKjZD0EqFJL/C1k
	g2GUDM1N7LEC1RWij/KsPivSueBDXwS0mBpHqZs3SvY/c=
X-Gm-Gg: ASbGncvchrnuwe3WihHvhmwUlbMun/Z3wXtQxO4Rnr+i3OhmrdzcE+nSUSuDZrKtok+
	2JIX+hWJrpBEuhv6ZoPf6bQa8Aq1Net/VoX2osR5Xouh8fWGkYzKPjQ8cF8B5XtTosCCeqg==
X-Received: by 2002:a17:90b:1648:b0:2ff:698d:ef7c with SMTP id 98e67ed59e1d1-30e7d5bd935mr29046107a91.29.1747789516473;
        Tue, 20 May 2025 18:05:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHLSay5eyst4mYl9Rm4ZRK7wjYpiXRQi22wCd8EwkUi7oX1AVU4FChgasZwUD9yiosXNnNPE208YXXXa10ZW2o=
X-Received: by 2002:a17:90b:1648:b0:2ff:698d:ef7c with SMTP id
 98e67ed59e1d1-30e7d5bd935mr29046064a91.29.1747789515963; Tue, 20 May 2025
 18:05:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <a30de484ff56065f56e37446e08dcdfa4850f101.1747649330.git.pabeni@redhat.com>
 <CACGkMEvyLNKn7_-bfXAEog5vMK9yz7Ms__HUTjH6cy+tdfHA+g@mail.gmail.com> <9c742c68-f673-4145-be97-f7528055ddf2@redhat.com>
In-Reply-To: <9c742c68-f673-4145-be97-f7528055ddf2@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 21 May 2025 09:05:04 +0800
X-Gm-Features: AX0GCFsEWraJ6YZz0jk46ILn6BdIoHsAxCWKmC9oXM_f0mB6E6ODMwROjw4I5Cc
Message-ID: <CACGkMEuQhbeg_=Cvyd+aLJyF2ikq_yXUvFURkLasYJCgfK2zpQ@mail.gmail.com>
Subject: Re: [PATCH] virtio-net: clarify guest offloads <> features mapping
To: Paolo Abeni <pabeni@redhat.com>
Cc: virtio-comment@lists.linux.dev, Willem de Bruijn <willemb@google.com>, mst@redhat.com, 
	Parav Pandit <parav@nvidia.com>, mvaralar@redhat.com, cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0BwzZSmYlv-xRQiFk_vJRCTMWbXOugN4U-vmM_FlSS4_1747789516
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2025 at 2:39=E2=80=AFPM Paolo Abeni <pabeni@redhat.com> wro=
te:
>
> On 5/20/25 2:50 AM, Jason Wang wrote:
> > On Mon, May 19, 2025 at 6:12=E2=80=AFPM Paolo Abeni <pabeni@redhat.com>=
 wrote:
> >> The guest offloads, as specified by 'Setting Offloads State,' use a
> >> 64-bit wide space, while some of the corresponding virtio net features
> >> are in the upper 64 bits of a 128-bit wide space.
> >>
> >> Clarify the relevant mapping as somewhat implied by the current text.
> >> Also rename the offload definitions to avoid referring to different
> >> numeric values with the same name in the features table and in the
> >> offload table.
> >>
> >> Signed-off-by: Paolo Abeni <pabeni@redhat.com>
> >> ---
> >>  device-types/net/description.tex | 7 +++++--
> >>  1 file changed, 5 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/device-types/net/description.tex b/device-types/net/descr=
iption.tex
> >> index 1b6b54d..8c501bc 100644
> >> --- a/device-types/net/description.tex
> >> +++ b/device-types/net/description.tex
> >> @@ -2186,8 +2186,8 @@ \subsubsection{Control Virtqueue}\label{sec:Devi=
ce Types / Network Device / Devi
> >>  #define VIRTIO_NET_F_GUEST_TSO6       8
> >>  #define VIRTIO_NET_F_GUEST_ECN        9
> >>  #define VIRTIO_NET_F_GUEST_UFO        10
> >> -#define VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO  46
> >> -#define VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_CSUM 47
> >> +#define VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_MAPPED  46
> >> +#define VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_CSUM_MAPPED 47
> >
> > As the introduction of more offload features in the future, I wonder
> > if it's better to just avoid reusing feature names here.
>
> No strong objections, but than it would make less clear the 1to1 mapping
>  between offloads and features.

Right, so let's start from the patch.

>
> > For example, rename all here to something like
> >
> > VIRTIO_NET_CTRL_GUEST_OFFLOAD_TSO6
> > ...
> >
> > Or introduce a new command to be as wide as the feature bits.
>
> I would prefer to avoid such additional specification and code churn,
> especially given there is already a lot of stuff pending due to the
> features space extension. Note that the benefit will be limited, as
> there are a lot of bits available in the 'offloads' field and we could
> easily map more features, as needed.
>
> I think the new command should be added as a last resort after
> 'offloads' space exhaustion (hopefully far in the future).

Agree.

>
> Cheers,
>
> Paolo
>
>

Thanks

