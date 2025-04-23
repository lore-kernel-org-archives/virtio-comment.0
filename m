Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30BAD2820B2
	for <virtio-comment@lists.linux.dev>; Wed, 23 Apr 2025 16:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745425782; cv=none; b=n6aHdJnJsf9+rgSA7hw8FSOSwaLnacaQUZu1J4fhd0D51ufiF14Q8bOWWQ98tSyFS81hTBgdtwaoRnXo6QAL4F1IOrOEcIMBj17KnA1AiwXC+dHuAXgRQ1V/FrZNQtRiaGNUpG0lZeehfddWtIz4Sbz74Fx3gRmrATGoSWM70WE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745425782; c=relaxed/simple;
	bh=UW4B+YHjHcZX1NmyFbqlK/7bttKnRAO3my0HPi2qI5w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MEMjdqCjCHsyP+yDeXZWGdp6vbFLHrHqHaHw/2PZnBsOPtJcz1oeB+2Fm3muWqoTxy9V7Fdr82xHSsuu/rjQF4S+fYzXKS3W0auwn87sPSd98qhrNd6MZanrzUQ9zWPsTrCtTp5ud4jnkW2sBGvi4dfm06ODUlNU0EBjtGzoaPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dXp8F0PI; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dXp8F0PI"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-301a8b7398cso10937a91.1
        for <virtio-comment@lists.linux.dev>; Wed, 23 Apr 2025 09:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745425780; x=1746030580; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eUCuv4HdQ89hZaxOQeTu1OXW8KOtDSV1N7bdWGEVI6w=;
        b=dXp8F0PINr1cnr7HfL7l2rS8MVS05rbKKlxLwaYQ+7J1YV/5Yw7gO6rKTKGzSznYNq
         KvtitB1wCBiaZoHWBxfBn4zLiOjYzPMU/yygFw2pXkWvph9meRBKBUnf1zfhAq8GU9Wn
         AQh7/MMiLyNPWjasDDtnf6urn812TwiWWnaoU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745425780; x=1746030580;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eUCuv4HdQ89hZaxOQeTu1OXW8KOtDSV1N7bdWGEVI6w=;
        b=NTpCoQ+76EBDNAevbdq2Yy+DhIjIIYdbdTC/JYXMIiP539PkPXfgQvn3fw51pLmG1D
         mG50bM056mUDqYQ9aQ0ycp7z7u9Hiu0vKJ5hWY8rh0vFB3JbT1esep0xMioSBXAPvjNO
         VneJiifROHCNmc8fB4bghe/ir4FzENADFlqQx4WMTQtHBLhuszKrPCkg5g9jV588mEM4
         wmIlYCaoCumgUHB6unvM81NEK5KRvNOM7X0tXVVc5EN72H4c/Ee1ZMs3gaHTHApDkMSZ
         /vhRjIZSv7KMSHAAp7FOPKrKE0vWt+CWOxhRAIKleeU+qEVkD2SQ1ZvhS6ATlbnj4XHQ
         E+Yg==
X-Forwarded-Encrypted: i=1; AJvYcCUmH11QVwLHR0Mg6Xg2/WMqzG67GsXmD/yxEQdyyP/Cm0ZbORozJ+m4XpBPJ3brpLvsOVGkNPeNoI0XBOtpJQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy02+z6qfS+54R2Qg4It+d6c+18Kxg9pb2E0VGng6GdnzDQDVE6
	5rHZuqA6dzPpxuq/euUOMg1uQaFx0m12lqTFUE61PLJjDY80NJepBD1Xa0kfPZAorPCYLW0/OeI
	=
X-Gm-Gg: ASbGncvvKgwUYgKALlCJd86EOaMHOOJ7XAoGNF1SUQOmGN9KFD7eijpFfc8aBhrIdTS
	rNTzRMjqgJ+3oiCo8r6sXc5hZ+8olOwElEW3o8veN9rIl3F6eB4avFE/JoUuT3r3VlKRoS9NL34
	ZqOegmtvpjp92LJuNfq1wE7Ql9gTfWBY03sJKMxii8uyMv0yunqhSQ0ZO+QWO58EhoC47Z9SSTa
	lMlnBZ3IKJUBJZ17yspvHx/j8nwxNoC+GNlHIA9GqmIHMd+VHo1/CMwwBbZtIfTbEA/A3vhq7+q
	1YFeRLzu1cOiHLqGICXagPEH2hJFTsofZOo7E3+vXxt48zV5l+/Ebyj3H6Ol5zrSR9um/p5v0gt
	PnCHIRgMN3ZZXNRxbgIo=
X-Google-Smtp-Source: AGHT+IGCjbCqI6lSWYO3F2rYTtV2tyEjteI8jB3wbf691Fny5Jk1RkE/pzlLADc2+ZUdDL69E8FAcA==
X-Received: by 2002:a17:90b:1c82:b0:2fe:b879:b68c with SMTP id 98e67ed59e1d1-309dee5db21mr1839674a91.6.1745425780245;
        Wed, 23 Apr 2025 09:29:40 -0700 (PDT)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com. [209.85.215.169])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309dfa0aa9esm1855118a91.13.2025.04.23.09.29.38
        for <virtio-comment@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 09:29:39 -0700 (PDT)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-879d2e419b9so5578858a12.2
        for <virtio-comment@lists.linux.dev>; Wed, 23 Apr 2025 09:29:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVuI7q01pYbzZX30x7Nx0l0o37jpqIfIkb+NssiOfLczLPmK38+YZkkwno/swEYVElx+F95YK8LWqMDSD6kRQ==@lists.linux.dev
X-Received: by 2002:a05:6a21:648c:b0:1f5:59e5:8ad2 with SMTP id
 adf61e73a8af0-204410a8d05mr164059637.24.1745425778099; Wed, 23 Apr 2025
 09:29:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250126062058.13695-1-parav@nvidia.com> <d76dc63e-8d4b-4a90-8765-0148d9c7b885@redhat.com>
 <20250423014257-mutt-send-email-mst@kernel.org>
In-Reply-To: <20250423014257-mutt-send-email-mst@kernel.org>
From: Daniel Verkamp <dverkamp@chromium.org>
Date: Wed, 23 Apr 2025 09:29:11 -0700
X-Gmail-Original-Message-ID: <CABVzXA=Uof+TdU6H+eoiOOVjCZwfXfnLV8wAMP87Gz4G92fncA@mail.gmail.com>
X-Gm-Features: ATxdqUGGfNGtqpgp5rpW4KIvD4T2l47-OK_ot7Qa-QK158AQjKC6Q4QIFtNrczQ
Message-ID: <CABVzXA=Uof+TdU6H+eoiOOVjCZwfXfnLV8wAMP87Gz4G92fncA@mail.gmail.com>
Subject: Re: [PATCH v1] virtio-net: Fix to avoid using reserved feature bits
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Paolo Abeni <pabeni@redhat.com>, Parav Pandit <parav@nvidia.com>, virtio-comment@lists.linux.dev, 
	cohuck@redhat.com, mvaralar@redhat.com, Jason Wang <jasowang@redhat.com>, 
	shahafs@nvidia.com, Willem de Bruijn <willemb@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 22, 2025 at 10:46=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com=
> wrote:
>
> On Tue, Apr 22, 2025 at 07:49:41PM +0200, Paolo Abeni wrote:
> > On 1/26/25 7:20 AM, Parav Pandit wrote:
> > > @@ -136,6 +124,18 @@ \subsection{Feature bits}\label{sec:Device Types=
 / Network Device / Feature bits
> > >  \item[VIRTIO_NET_F_SPEED_DUPLEX(63)] Device reports speed and duplex=
.
> > >
> > >  \item[VIRTIO_NET_F_RSS_CONTEXT(64)] Device supports multiple RSS con=
texts.
> > > +
> > > +\item[VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO (65)] Driver can receive GSO=
 packets
> > > +  carried by a UDP tunnel.
> > > +
> > > +\item[VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_CSUM (66)] Driver handles pa=
ckets
> > > +  carried by a UDP tunnel with partial csum for the outer header.
> > > +
> > > +\item[VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO (67)] Device can receive GSO =
packets
> > > +  carried by a UDP tunnel.
> > > +
> > > +\item[VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO_CSUM (68)] Device handles pac=
kets
> > > +  carried by a UDP tunnel with partial csum for the outer header.
> > >  \end{description}
> >
> > I'm finally trying to finalize the implementation and I must admit I
> > underlooked the implication of using features bit >=3D 64.
> >
> > AFAICS all the virtio drivers in the Linux kernel and qemu assume that
> > the features can be represented with a single u64.
> >
> > Supporting the above requires major reworks in both user-space and
> > kernel space. At least on the kernel side a similar rework (extending
> > the _netdev_ features field) has proven to be complex enough to defeat
> > any implementation attempts for years and in the end it was dismissed i=
n
> > favor of lower bits reuse.
> >
> > I'm wondering if we could reconsider using reserved bits here?
> >
> > Thanks!
> >
> > Paolo
>
> :(
>
> It's been there for 2 months now.
>
> And if you want to avoid using all bits > 63 then it's even more of
> a mess, you need to move VIRTIO_NET_F_RSS_CONTEXT which has been
> there for a year and a half.
>
> I'm afraid we'll have to bite the bullet.

One other issue with bits > 63 is that the vhost-user protocol
VHOST_USER_GET_FEATURES and VHOST_USER_SET_FEATURES messages use u64
to represent the features, so vhost-user-net devices can't query or
enable these features. vhost-user is outside the scope of the virtio
spec, though, and I think it's reasonable to extend the protocol to
enable high feature bits rather than avoiding them forever.

Thanks,
-- Daniel
