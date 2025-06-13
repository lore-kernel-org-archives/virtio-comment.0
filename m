Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 478122459D2
	for <virtio-comment@lists.linux.dev>; Fri, 13 Jun 2025 08:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749804392; cv=none; b=L7Zh8LYcP2rtagSr8c3mRlqMrDiwvhdIhIRKxvCDgkweYwgKfWLJsmZR8P1vGKLwWOAXwU1s6BIT9bnDZx8/v4QeMJ9uvg0bGSLSfQ6tD8V3DMNkdICIjzYhgoJoDPWxf7fdaWvPQ3VOORozHggsLE2JvBIYWQG0S0bX4ICTSCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749804392; c=relaxed/simple;
	bh=SN+Y3N6JQ1wwZc0CB5gCvXy1ewcqQHY9tzH0X0Rdeuo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kx2EbvTIyRvbkNtQbn+cSNN0z6v1tq7zqeKH034Yb+foefuoQ4AuDjrZx3xwBFg/21KUu8n+6OvigceK3ziITInTI5SiGFracnkPotopdUvwrmncQ4ppCmq+TlxxsyOfmY9IgHM8khkr8D0/y49XyD7Yx3g9YcDIKhhFmP5Gu9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mxz2i3vg; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mxz2i3vg"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3134c67a173so2134149a91.1
        for <virtio-comment@lists.linux.dev>; Fri, 13 Jun 2025 01:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749804390; x=1750409190; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/1wDFTFbe6fHWvHTsVelUNgUeKk8CtJRkvd2Eu0fB2w=;
        b=Mxz2i3vgaOqryC22s/Agv03I9Sc3rVLkQGd8FsfP0z/nj3VDLy6N4aaY85vCRfsFB0
         jaTjvi5E0aU7U6iiPQg7o0dLjNzEkB2k4ETGVLa1FcG4gxpTEqmuJ+rGAgWOzLHZQxXV
         GqUTX6nfR7UAJYodhWyzc/ungdyXLvqMeIxTFteiXHi+yNZUBm8zD8tO1CdoJyLhhvWv
         6EoiAqpj45sk8NQrt6OOtajl6bqXX9bTTbRlymDonHXJl3QAShvZPlK7CUG7p1pAk0h3
         iHM9IA0s1D8encuV2pz6pCqBKghMiN9itU2Ln/vTPTEd+RfhU3der439aqeQv76VEueU
         916w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749804390; x=1750409190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/1wDFTFbe6fHWvHTsVelUNgUeKk8CtJRkvd2Eu0fB2w=;
        b=s3v3fi5NjFFHENO3ghrTn9Wfp9tOlwR5mx5r+mgU3OlnJVvNlCo+2cmPJMpYttiu9+
         u2WTMTPN6AFvH2UCgCPiXF+e1x/Q6+KF0WFjmKbMrk+T+2sDsAPdQ5kcvc/5GOBwE2m8
         F8i/ZXbPpCt7IN+NZPBYues1gkzYyJUllAUQVlDkVW+cyXZRSTojiQe05PHNgytLzQiH
         n4/lzbIFp+Ijqz1XtMb7YWNYr9IlaZl3AT03FUKrbxlTuXu96GiGAPDNLg+RLatSf37n
         S/UuajlEHHIvq/AICJHmsD+fycxCoe1/viv4kVU4Z3WVc26Qx4x+BkrSr7Tiy6XVaZxY
         M12A==
X-Forwarded-Encrypted: i=1; AJvYcCXJbOK3ECM79tE+8JMxFuqqn3eZztB1D6Fnc+WHSw+CyDPROiWiIRkr3PIwZ2Lx11bxIcvj7f+qS16rYXQbpA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzyBQ99pUVv9gxKC7fTmkDVPox9MyO+9k8JYYfPoXdbiVaD/UjP
	lMLtwtZfevMy3LmQXIn1pPnHqi/PXRGZJD+qpu0WcA6QP4Y5B+zJQVD8
X-Gm-Gg: ASbGnctGbAFTBCoze8zb0zm3IvFVDoWGTny97zEUOLQOBTyioMBV/dbbNMKeB6Q+0Zm
	Z33eLJGDxDm+tgS2OKSywg0pw8PA4XOTMtihkT7yHUvndseijS/S9NbLwrxfa5oLhvT1akkHT5a
	rX7JvX+/qeTEMfWDcESyS9Lxu2cWsbTclt0Ood+MjqwxsWctSzRaAXycEvZn6J8o/4gsGj8Oqmf
	wAl+O0QuLMLURSdIave11ar5YPMtJ7aeXbdTNLrudFDCCD2jFnZCHjOH0RY6CLlxfDMG3PuRBp3
	RabRYs0rASjH5YxWnNzbTpyFv6UTrldJxdnjdBO37PgJ7ekRfCyJ8cQw/ncB9D3fAVh6a8LcG1K
	A6NgPaUlpDhixQtcRDW0=
X-Google-Smtp-Source: AGHT+IELeapZNX1r6Vmr0yfUqvhB9BdUPvvwV+AdAyTUzRiF45uLUaYmhzVj3c2axmDLkiz/C8SVsg==
X-Received: by 2002:a17:90b:510b:b0:311:a314:c2cf with SMTP id 98e67ed59e1d1-313d9eb558fmr3284687a91.30.1749804390196;
        Fri, 13 Jun 2025 01:46:30 -0700 (PDT)
Received: from devant.antgroup-inc.local ([47.89.83.0])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c1c5d816sm2810389a91.34.2025.06.13.01.46.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 01:46:29 -0700 (PDT)
From: Xuewei Niu <niuxuewei97@gmail.com>
X-Google-Original-From: Xuewei Niu <niuxuewei.nxw@antgroup.com>
To: sgarzare@redhat.com
Cc: fupan.lfp@antgroup.com,
	jasowang@redhat.com,
	mst@redhat.com,
	niuxuewei.nxw@antgroup.com,
	niuxuewei97@gmail.com,
	parav@nvidia.com,
	virtio-comment@lists.linux.dev
Subject: Re: [PATCH v7] virtio-vsock: Add support for multi devices
Date: Fri, 13 Jun 2025 16:46:22 +0800
Message-Id: <20250613084622.1088250-1-niuxuewei.nxw@antgroup.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CAGxU2F6LtwfO_AgTxk+wEeqv1vKCmMGJNzyu08ttGYUfad3mGA@mail.gmail.com>
References: <CAGxU2F6LtwfO_AgTxk+wEeqv1vKCmMGJNzyu08ttGYUfad3mGA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

> On Fri, 13 Jun 2025 at 06:57, Xuewei Niu <niuxuewei97@gmail.com> wrote:
> >
> > > On Sat, Apr 12, 2025 at 10:39 PM Xuewei Niu <niuxuewei97@gmail.com> wrote:
> > > >
> > > > This patch brings a new feature, called "multi devices", to the virtio
> > > > vsock. It introduces a "VIRTIO_VSOCK_F_MULTI_DEVICES" feature bit, and a
> > > > "device_order" field to the config for the virtio vsock.
> > > >
> > > > == Motivition ==
> > > >
> > > > Vsock is a lightweight and widely used data exchange mechanism between host
> > > > and guest. Currently, the virtio-vsock only supports one device, resulting
> > > > in the inability to enable more than one backend.
> > >
> > > I wonder which part of the spec forbids more than one device.
> >
> > No. The spec, however, is designed for a single device, and lacks some
> > specifications for multiple devices.
> >
> > For example, we should have a mechanism to select a device from all to
> > communicate with a peer.
> >
> > This patch introduces a new feature bit "VIRTIO_VSOCK_F_MULTI_DEVICES", and
> > involves some modifications to the config space, device & driver norms.
> 
> Maybe we should think a better name to avoid confusion, like "F_DEVICE_ORDER".
> I'm not good at name, so if others are better suggestion, they are welcome.

Naming things is tough for me, too. I'm good with "F_DEVICE_ORDER", and
will update it in the next. I am still open to other suggestions.

Thanks,
Xuewei

> >
> > > > For instance, two devices
> > > > are required: one to transfer data to the VMM via virtio-vsock, and another
> > > > to a user process via vhost-user-vsock.
> > > >
> > > > Apart from that, a side gain is that theoretically the performance might be
> > > > improved since each device has its own queue. But it varies depending on
> > > > the implementation.
> > >
> > > It could implement multiqueue anyhow.
> > >
> > > Thanks
> >
> > Yes, indeed. As we discussed before, I marked this as a side gain. And
> > @Stefano said that the community has a plan to implement multiqueue for
> > vsock.
> 
> I'm not sure there is a plan, but yeah, we should do it some day.
> As I mention in the previous email, I'd remove any reference to performance.
> 
> I'd just talk about a mechanism to select a default out device, when
> the source socket is not bound to any address, like a default gateway.
> 
> Thanks,
> Stefano
> 
> > The foundational goal of this patch is to enable vsock to support
> > multiple backends.
> >
> > Thanks,
> > Xuewei
