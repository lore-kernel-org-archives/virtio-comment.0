Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7FB31E008B
	for <virtio-comment@lists.linux.dev>; Tue, 17 Jun 2025 07:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750146357; cv=none; b=NNoLRhgvvXIPd6b90eoGCNjKvxZ72CF+Hynt+o9AFELhiCb6YOwND5k17GjtBFwnshefKs/udWhLcU52xh7+eGszjqLyohXHDh3ZQb0ews1XsNuxfAzOKj2D5TGTCpUsLqnGcVobJ3a93LZFzBgJQvsGWfYsyaMxmz4TNA/kxaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750146357; c=relaxed/simple;
	bh=FCAcjXCeRwwJQLf8VX47KTWNMdCHWsI++gREGXwTYR0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ks/XbOYS55Rt2OlRgCKrU6Nn2Vu7siQnOf3CCScSpuOJYzzh9StxGz9qc+qjHy63rZuQl9coOUy0QB/QNSkEs84tZV2nN7RvoucfVJuN/JuBJHHtQGquQEl7kcbYdJmhsSaiIhBbhcudCcUco+n1YuFgSFtlwp4ourTx9T1ppKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CYLSzrR9; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CYLSzrR9"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b2fd091f826so3893636a12.1
        for <virtio-comment@lists.linux.dev>; Tue, 17 Jun 2025 00:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750146355; x=1750751155; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FCAcjXCeRwwJQLf8VX47KTWNMdCHWsI++gREGXwTYR0=;
        b=CYLSzrR97NrSmkzEW6xxikVm87HZKWBSq2YDdUfUr2PV4bLMOUXe5FexG+gO64z26Z
         cBCoOp33mdn2fnyBkO1tqZZ0E/MGCwTqnXlfsqMxTNLkLwwTbZkrC3SI5C7OZyjHUao+
         FctdYKKYimqrsQIKAOV4DGi7EaCEwtBhZwvskcBxGYCIBr78gtCTqNyYwlN2UXfCbGxp
         G/gK46bMkldufX8BDGgGkF8vJWn+3rpKEd54uUwdoTFE+Sk4iZL0Lq50iOx7qhXz89Ig
         OSbn2LCaXuG997KHI+YTEd+Kn2upSM/wtwnjTO1JdLdUL7UU+55osQRXw0gkBI6MVPvg
         Iqfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750146355; x=1750751155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FCAcjXCeRwwJQLf8VX47KTWNMdCHWsI++gREGXwTYR0=;
        b=B28PZ6db4oQrig0pqTyW5l2ARSSE+SgO1XmsMeNvz+FwfJGIxEZXwuna2hmRAWCJ+b
         YwW2iYvSJAuq5JV5BAWigs/XDVYpJuiD2jWrot2OG3A9SJOWaY4N4pCLTRM/0qqC1ajv
         zu9WE7Mo5dUzHeXJkhhntBRDCfaS49I7X7S02x7kFasgOxF3bgFzhrHiMCszMxAtCx9h
         qAsmPNKHqh2yEOW1VJiWrumhB/Ky2qhSo6L6dIEKHy2rNlp1y9Q+Ynd50EH3N+wtD/YO
         gid5+rLtFgqMlCgeL24sARw69e0ZGAz4TqsAQRoLQ+dn8alLULzVjvxi3pQ6RCMmzL+5
         knXw==
X-Forwarded-Encrypted: i=1; AJvYcCULOO55L7AfDtu6sReiLQHA1jZjIVoPKfIcAfCAWZHGj4u2cUElzizg2NSfE93kn8Fd3Gn1il5FnU0IgG+JIA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzZ9nyZFoEQrrrZorTCGlEqwW6fmhHsJWIsuVGx8BMnnOgcxY5X
	AHpmtRpmkf7vASl9noVikrubZKExdV5EE+pVhYpgBM4m6iVg4KQYsEHq
X-Gm-Gg: ASbGncsmGn0SDlQ4f+8+frmpf36qABxmBQop8xaO6aPYHxNbASHEohIk5Wv6VmWM/Fl
	EGgAAZi7QwhVboA4P456By/D3e5wM8a5zJzmn94+t4159baGhdDfI3iVyCHyUZykFWZDab88nZ4
	mvENUPzSej9UGkyadil5rYf2bAvjWbuUjQ1stNKtHtuoXpL2nHj91CnbiVtWfz6o3JGwT+PYviC
	wPQ94H7aV5A1cVLLjOBVk6x2cwx1dFDySxGlK6/CAESfIwvpWCMO38VoXnAG8tRrQgdJG+OpPSO
	znpqE1OWOH/v47s9J9ve7qEuhtHUWjue6CY8WgZ5GFvXhmcqPkTSBltlk18KxsT2rspcom/rLEg
	3Uzty5s3a
X-Google-Smtp-Source: AGHT+IFJdriQp2i4f+3tFNoKloyLYVunkBjZUsfCnjwk6goS9J8RrU3T0x7l+KYbB9ARkOey0TT9OA==
X-Received: by 2002:a05:6a21:3294:b0:1f3:26ae:7792 with SMTP id adf61e73a8af0-21fbc7e6c47mr17456944637.18.1750146355068;
        Tue, 17 Jun 2025 00:45:55 -0700 (PDT)
Received: from devant.antgroup-inc.local ([47.89.83.0])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2fe16803c3sm8180449a12.41.2025.06.17.00.45.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 00:45:54 -0700 (PDT)
From: Xuewei Niu <niuxuewei97@gmail.com>
X-Google-Original-From: Xuewei Niu <niuxuewei.nxw@antgroup.com>
To: jasowang@redhat.com
Cc: fupan.lfp@antgroup.com,
	mst@redhat.com,
	niuxuewei.nxw@antgroup.com,
	niuxuewei97@gmail.com,
	parav@nvidia.com,
	sgarzare@redhat.com,
	virtio-comment@lists.linux.dev
Subject: Re: [PATCH v7] virtio-vsock: Add support for multi devices
Date: Tue, 17 Jun 2025 15:45:45 +0800
Message-Id: <20250617074545.1320089-1-niuxuewei.nxw@antgroup.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CACGkMEv2-p9XyEmkhe=WTLwAVYdxoqyv=exSxmscE7ZyXOt6tQ@mail.gmail.com>
References: <CACGkMEv2-p9XyEmkhe=WTLwAVYdxoqyv=exSxmscE7ZyXOt6tQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Resend, because it isn’t listed in the mailing list due to my mistake.

> On Mon, Jun 16, 2025 at 4:38 PM Stefano Garzarella <sgarzare@redhat.com> wrote:
> >
> > On Mon, 16 Jun 2025 at 10:29, Xuewei Niu <niuxuewei97@gmail.com> wrote:
> > >
> > > > On Fri, Jun 13, 2025 at 4:46 PM Xuewei Niu <niuxuewei97@gmail.com> wrote:
> > > > >
> > > > > > On Fri, 13 Jun 2025 at 06:57, Xuewei Niu <niuxuewei97@gmail.com> wrote:
> > > > > > >
> > > > > > > > On Sat, Apr 12, 2025 at 10:39 PM Xuewei Niu <niuxuewei97@gmail.com> wrote:
> > > > > > > > >
> > > > > > > > > This patch brings a new feature, called "multi devices", to the virtio
> > > > > > > > > vsock. It introduces a "VIRTIO_VSOCK_F_MULTI_DEVICES" feature bit, and a
> > > > > > > > > "device_order" field to the config for the virtio vsock.
> > > > > > > > >
> > > > > > > > > == Motivition ==
> > > > > > > > >
> > > > > > > > > Vsock is a lightweight and widely used data exchange mechanism between host
> > > > > > > > > and guest. Currently, the virtio-vsock only supports one device, resulting
> > > > > > > > > in the inability to enable more than one backend.
> > > > > > > >
> > > > > > > > I wonder which part of the spec forbids more than one device.
> > > > > > >
> > > > > > > No. The spec, however, is designed for a single device, and lacks some
> > > > > > > specifications for multiple devices.
> > > > > > >
> > > > > > > For example, we should have a mechanism to select a device from all to
> > > > > > > communicate with a peer.
> > > >
> > > > I wonder if this is a:
> > > >
> > > > 1) mechanism that needs to be mandated by the device
> > >
> > > Yes.
> > >
> > > > 2) a policy that is allowed to be tweaked by the user as TCP/IP did
> > >
> > > Not allowed in the current version.
> > >
> > > > (Note anyhow the driver can override what the device suggests...)
> >
> > I think we should follow what we described in the spec:
> > "The virtio socket device is a zero-configuration socket communications device."
>
> We probably need to define "configuration" first.
>
> For example, if it means zero configuration from the user, it does not
> conflict with 2), the driver can use its own algorithm to elect a
> "default" device.

IMHO, it can be done, but it is not the current design.

I prefer to set the default device for VM-HV communication to do some init
work. I don't think people have a strong need for this.

> Another perspective, making decisions in guests may be even more
> helpful for the case where the device is not trusted

How does the guest realize the vsock device is not trusted? The guest only
knows the information from its config space, which is provided by the host.

> > So, IMO the guest (driver) should not be allowed to change anything.
> > E.g. Right now it's not allowed to change the CID assigned by the host (device).
>
> A dumb question when having two cids (cid1 and cid2) in the same
> guest, what happens if src=cid1 and dst=cid2?

The packets will be directed to another application, if any, on the same guest.

Thanks,
Xuewei

> > Thanks,
> > Stefano
> >
>
> Thanks
