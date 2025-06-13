Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992B31E7C2E
	for <virtio-comment@lists.linux.dev>; Fri, 13 Jun 2025 08:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749803509; cv=none; b=BqdPJduAXvTXmn8xIVZXNeN+D3R0hIKVhvh32dHv9EnSiQWSTK63epQm45eo9KLuhcLkwRLISwY62Po88aXYu9kFEMnexWRJljgEHVZUTa/cs66r75NszzqeJgVhj+VUB6JC8QysxwPRqI1QWgTvtKZuI+IKHVzKh8tFDcSGhSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749803509; c=relaxed/simple;
	bh=y9kYVb+FzCWPF4ZsWKjpXy3i9BxKzQML4LV0/OnLPCk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bWt/nfESmUfxkT/SNktca5dCYykbY+keK6O9ioz4kj/ozwy5PevLARhJvyoPWvYNxFot0LYBzEs2x2ZtGNVWLlF/wL0l+GcCas2zmuo3xLOM3XP3grx+wJuAPTN2k64TM1VYLtwobB6pOdks1ewCyJ8liQtKA2TTxyv2Zk5+F9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gL6/3k4l; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gL6/3k4l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749803505;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y9kYVb+FzCWPF4ZsWKjpXy3i9BxKzQML4LV0/OnLPCk=;
	b=gL6/3k4lmfk9ITwUhiGkxVkcf2KLsYXQCcP0AdejwlOJd+Zl5Pm3ccXVOOovlMyyjRhpzU
	gLa5uKX796Il/IPwx/+IJY7PiJFNDX41cKMFOkAPZJ5Ck95qRcZHK0i1nVJpqG7m3cjAib
	wbGNvuxCCFX8j7AM6NR4p0L9vOn1bvA=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-441-uYA9lXqiPpKy4BjNsgwdKQ-1; Fri, 13 Jun 2025 04:31:43 -0400
X-MC-Unique: uYA9lXqiPpKy4BjNsgwdKQ-1
X-Mimecast-MFC-AGG-ID: uYA9lXqiPpKy4BjNsgwdKQ_1749803503
Received: by mail-yb1-f199.google.com with SMTP id 3f1490d57ef6-e81b3e168a6so2900332276.1
        for <virtio-comment@lists.linux.dev>; Fri, 13 Jun 2025 01:31:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749803503; x=1750408303;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y9kYVb+FzCWPF4ZsWKjpXy3i9BxKzQML4LV0/OnLPCk=;
        b=Pod5MrjUTsJFHRFiT1yV3GHc17+YVhzZ9ftYal3sm/UpfFcTfyhSRVUEDU4AjnNhIL
         UhjTG8IL2lmMvbMSVFYS7rF2mfKg8nMtLIM7WgDaSteR5wNYd0TBsloOCqGMUjMH313O
         rT/UOMson7thqwd53DMZnwhEkdiZO8kiom8r1RePJrXsCFzlN/cSdFMZkstCkz7ZXed4
         gy/YMNpIqjuGJhCQDO6B8a+CXL18VeeYXFwpbNnZrlb+xkEPIG4Upv2j+Y4tiCZry/pY
         txlHu5JPyDB8LpYwL0d0vE65FyN17tjOCu8A3anxHVYE1UVBs652kGTFL1BoctXVRKdD
         SuUA==
X-Forwarded-Encrypted: i=1; AJvYcCVF9NBRrYRgqIVHus4fFtFSTdDuV9noLnt5mphiNLlHRII+U3MYh7x+xl4LnZqoCesmrljRpoB1FBeh1F1LhA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzIH3jFAUrXQE53+yMblOo3LqhrGAhKMpbPxpgMNCMqzBpEWqjP
	EzH5nqTYsimOPUh4z+GJ66J2vR6HnUvvZkzk3g8Yi0DMUuOCw5+TUOGjY6Bb0q/wgGSoqHXp8LC
	8Gb5Ph0keKouDLRy+cXVc2eQ1vwcWqe5JhfXsyr3wd6EKY7WV0k8B722myJJIcUviiKLNzsZ3pr
	wqu8VB5qV1PkECcBbswCS8A7pLLoaVL2Vcmjct/ayHVLk=
X-Gm-Gg: ASbGncvVSQogJLz2o4nBMImM7Z7cj7dPP/OHoJV6VRSDfBCXwW79leXbK4GvwiDUzoU
	UTrU8mGL6vIP05SNnxrgaCBs/4rLgjZpVtM+b1SvVNzvCxwb72m+m5U/YwtK3jeLoGIu5Pk2+9y
	aIiRhTq64dqKs64VQZVZf2aiIs6F1l5TbeAwo=
X-Received: by 2002:a05:6902:490c:b0:e81:9a1c:1c0d with SMTP id 3f1490d57ef6-e821c05d1d1mr2686309276.7.1749803503345;
        Fri, 13 Jun 2025 01:31:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGB+BpBu8XzxsddbuRY9I8FMNGxVK4B2CfQ+XjusVy977GaqOv2n8gygY0v4GkV9ZevbK8kgqq+TFMHkZ+hLc=
X-Received: by 2002:a05:6902:490c:b0:e81:9a1c:1c0d with SMTP id
 3f1490d57ef6-e821c05d1d1mr2686291276.7.1749803502987; Fri, 13 Jun 2025
 01:31:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250412142825.3180245-1-niuxuewei.nxw@antgroup.com> <CACGkMEsFYMjQgU7mrBwq3q2cFvFH_zro=5YOMfLsxDQYv5po5A@mail.gmail.com>
In-Reply-To: <CACGkMEsFYMjQgU7mrBwq3q2cFvFH_zro=5YOMfLsxDQYv5po5A@mail.gmail.com>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Fri, 13 Jun 2025 10:31:31 +0200
X-Gm-Features: AX0GCFsnmzxjKKSJameyzPpT1y6dvNKIz6i0hhfC-UR1pzB92hl2tPbTFlujv4Y
Message-ID: <CAGxU2F6-MgJTLir2hcvUdLeAeVeRygEhKzui_N+2vqsWxhBkLw@mail.gmail.com>
Subject: Re: [PATCH v7] virtio-vsock: Add support for multi devices
To: Jason Wang <jasowang@redhat.com>
Cc: Xuewei Niu <niuxuewei97@gmail.com>, parav@nvidia.com, mst@redhat.com, 
	fupan.lfp@antgroup.com, virtio-comment@lists.linux.dev, 
	Xuewei Niu <niuxuewei.nxw@antgroup.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: aa5xCoxO4c3c9x083Vxk32NJutEvCwe5RXdJCE5qSek_1749803503
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 13 Jun 2025 at 06:23, Jason Wang <jasowang@redhat.com> wrote:
>
> On Sat, Apr 12, 2025 at 10:39=E2=80=AFPM Xuewei Niu <niuxuewei97@gmail.co=
m> wrote:
> >
> > This patch brings a new feature, called "multi devices", to the virtio
> > vsock. It introduces a "VIRTIO_VSOCK_F_MULTI_DEVICES" feature bit, and =
a
> > "device_order" field to the config for the virtio vsock.
> >
> > =3D=3D Motivition =3D=3D
> >
> > Vsock is a lightweight and widely used data exchange mechanism between =
host
> > and guest. Currently, the virtio-vsock only supports one device, result=
ing
> > in the inability to enable more than one backend.
>
> I wonder which part of the spec forbids more than one device.

I don't think there isn't anything that forbid it, but what we don't
have is a kind of default gateway/interface to use when sending
messages.
So, this proposal is mostly to chose the default device to use, when
the user don't bind any CID on the source socket.

>
> > For instance, two devices
> > are required: one to transfer data to the VMM via virtio-vsock, and ano=
ther
> > to a user process via vhost-user-vsock.
> >
> > Apart from that, a side gain is that theoretically the performance migh=
t be
> > improved since each device has its own queue. But it varies depending o=
n
> > the implementation.
>
> It could implement multiqueue anyhow.

Yeah, I pointed out multiple times to skip this as justification,
since multi-queue has more much sense for that.
IMHO it's confusing to still talk about it in this proposal.

Stefano

>
> Thanks
>

