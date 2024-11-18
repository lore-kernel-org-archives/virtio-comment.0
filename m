Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49EF741C71
	for <virtio-comment@lists.linux.dev>; Mon, 18 Nov 2024 20:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731962747; cv=none; b=PUJ0FuWOO6vsVXFiMhXCfkBLXA7cJBzugaUA8ZEb9OgMsKrNXu3uOqgxwwDF/ZYpyddJSfwRH412rbeanH3V8hrJv6QTMA/8M8S4Sc+qY+W7DKkzG8lBm0eY3kdD+Kuh6OJpe7DH+gKHoENmjPKbDyQ8SKJSQXe5Rr+yjUFe8wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731962747; c=relaxed/simple;
	bh=U8QQpfFQvNi0cGRxBS0Nn1aCO/zNxOaiJ8MJtr8vQ2k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u7vwEVqSKHaPdYXtEscZtHpmtE2JjU7GOf8hqFhHlUDd9pRd46IOhYtbIKtKWmq5WQE1vN/L5vsSE+DQBsbWMovYbbL2sCSCmba7PomZJqRV0VNSqU8cinCPfWuuW43+h9i0UP+ihEvewK98Ov3vh0a74QLq70x2OaOJmnwYDnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BYNhyU1s; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BYNhyU1s"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6e3c3da5bcdso40581497b3.2
        for <virtio-comment@lists.linux.dev>; Mon, 18 Nov 2024 12:45:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731962745; x=1732567545; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U8QQpfFQvNi0cGRxBS0Nn1aCO/zNxOaiJ8MJtr8vQ2k=;
        b=BYNhyU1s7MJ7OnxXXBZRqlll38C1M6YCuDP7oC76PYBSRIy1KDh/H1HfyXjqbMmpiH
         6HY6kGmYQ0PYiAPw2mUgXuxpNT1WX4avwiq9xnloc/Lqy6snK6AdciMEEF9wexHFKSCo
         +ym+LNsJAmT+idzB+AgHHcW/JrAvzcfrwosOmSHebxpuzfhgrF5f4ZzG3y6Xu9ZBx4mA
         8pgtOQdKrVLkfcWDSjnhHRpl40Xs+7hhLHuyJfs/j9f2ZeF+xGgycW6gkMPQr1jnoFml
         CuS2F81aEL54FdhSjGscqKjMNCb+goSTevUeESmbjE5mGebYLKAdEaco85rNOfyq08z/
         2ktA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731962745; x=1732567545;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U8QQpfFQvNi0cGRxBS0Nn1aCO/zNxOaiJ8MJtr8vQ2k=;
        b=AXHmvFtukzXmAH569HGKGHELwhA+6GRgseaTzB7GFIRolrO1cz6oqR8r8r9EpCY+K8
         aZ9TYsE7NSoi4oNNGJTnqXQx5VVB9ru/87Fb9ZuPhAcuUzatmzK/r88BKlNSIp+p/H9v
         WtAY27h0RgKhNAOvmao7EaKQsUXTTNZAhitLhf4MLjx7yInQxkXqZRekr+e0ktMgwiBO
         jfR+jaNu87FNKyNvFe4iHOaFv+3l9U4QoQT8gknOjimrwe5P57rdLG2B6YFeSJtgXnJl
         iyHmKHHf7i+/zSP4eSNA9GnROKbF4l5kw/W9Nnmm/fA/kuNK0nLyP3c/QPQBEBma5lWj
         D5fQ==
X-Gm-Message-State: AOJu0Ywd4Pay5SKl1k80anRbFUjODnIeFK2ze4WZ/8qYty2WgRgVL9VR
	9QAyxlARJoByBLs3gB/0xLVYAeWyI1NSx2yAUKOAl62YYDefiHcI6BuIZazuPvziROLRG15W0fO
	ywRa2qgjuZ3epGgiEJowQCj9j0G4ndxajVtek
X-Google-Smtp-Source: AGHT+IG6jh2RJ9oS55aSatUL3jQCtIPvacMdj1kqJDmno5HUS2CE/XuwDvQhC3aaal4bYEr26F1E01KmYqMjtOqULsE=
X-Received: by 2002:a05:690c:368d:b0:6af:6762:eba1 with SMTP id
 00721157ae682-6ee55c1d4eamr146891727b3.20.1731962745127; Mon, 18 Nov 2024
 12:45:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1731084277.git.pabeni@redhat.com> <76709a7a-4c02-4bbc-b9bc-4f1105cda660@redhat.com>
In-Reply-To: <76709a7a-4c02-4bbc-b9bc-4f1105cda660@redhat.com>
From: Willem de Bruijn <willemb@google.com>
Date: Mon, 18 Nov 2024 15:45:07 -0500
Message-ID: <CA+FuTSeexgaL7nQFYa7sEMVjOpakNrrrwozfnVQ146xJ5ZRamA@mail.gmail.com>
Subject: Re: [PATCH v10 0/3] virtio-net: define UDP tunnel offload
To: Paolo Abeni <pabeni@redhat.com>
Cc: virtio-comment@lists.linux.dev, maxime.coquelin@redhat.com, 
	Eelco Chaudron <echaudro@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Stefano Garzarella <sgarzare@redhat.com>, kshankar@marvell.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 15, 2024 at 12:44=E2=80=AFPM Paolo Abeni <pabeni@redhat.com> wr=
ote:
>
> On 11/8/24 17:52, Paolo Abeni wrote:
> > UDP tunnel usage is ubiquitous in container deployment, and the ability
> > to offload UDP encapsulated GSO traffic impacts greatly the performance=
s
> > and the CPU utilization of such use cases.
> >
> > This series includes:
> > - a clarification on the current semantic of
> > NEEDS_CSUM offload (patch 1) to make later changes easier to follow,
> > - new features definition to handle both UDP tunnel segmentation
> > offload (patch 2).
> > - new features definition to handleUDP tunnel outer checksum offload
> > (patch 2).
> >
> > A PoC implementation is available here:
> >
> > https://github.com/pabeni/linux-devel/commits/virtio_tunnel_gso_v10/
> > https://github.com/pabeni/qemu/tree/virtio_tunnel_gso_v9
> >
> > Note that the user-space implementation has not been updated since
> > the previous iteration, since the kernel changes are transparent to it.
> >
> > Changes from v9:
> > - added patch 1
> > - clarified that 'hdr_len' accounts for the inner header for GSO over
> > UDP tunnel packets
> > - DATA_VALID is not be allowed for GSO over UDP tunnel packets.
> > https://lore.kernel.org/virtio-comment/cover.1728029499.git.pabeni@redh=
at.com/
>
> As a reference this is the cumulative diff WRT v9:

Thanks Paolo. I think this matches our conversation and addresses the
open comments to v8.
