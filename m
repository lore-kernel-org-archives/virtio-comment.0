Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37EE2F4333
	for <virtio-comment@lists.linux.dev>; Fri, 13 Jun 2025 04:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749790650; cv=none; b=kECUF2ps0Glmk6zZhBrT/bL8GQeHN9OkqvOir4dKCSjrXO7Bg1zdsZ4YnGNnwP7ayfjn9GWtNYZHcQVBkZvwPrztLCD9uXuq4WT+pJxezgZMrDChkxopJSOfbzpNC+YDJaIktECuHN/0SmIn954BdppbjHyTNcoOG0YD8sBkVA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749790650; c=relaxed/simple;
	bh=gDLvYPCS/wCNPq32errTdKrhFa985+jik6axG5RkSiQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Vwr5oVqGOYg7rup3WV035poXhA2qGdcYc1q+lAMa+d2s0/RHeGWze6org/+OGD70Du9qUk2c/aE30MJGujpMbkRl15xHkXzgzYNf6beVzWmozzqVW2rwqWQqBa6WUj0u38UfULpQK+MKdSMgjGiPaaxrj4v8S9AoVQjojEi3JkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l4QRPUd4; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l4QRPUd4"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-742c73f82dfso1549382b3a.2
        for <virtio-comment@lists.linux.dev>; Thu, 12 Jun 2025 21:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749790648; x=1750395448; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yDFrdZYstFFr1ikAwEwn2uLtBMHrNSDkVizN7WRlvrI=;
        b=l4QRPUd4T1gKek7EwA05K39T5I4nS1RLsOgp+YhPWBPAnXJo/g4oXnw+UAy+rKd/Sd
         ys3IBvq1xBApEVS2MvWXIyuNX7ozH8yi5BNDEhdO+YgRrMmedFqnsAgOKE+SK5pnZXMy
         WkNymt+IZnaARwmR27Ph1d1xapswuVCyAKGU7aLy9BEl7oSwBpUMXvzHzSHBaRV8Pvxd
         MBqatcN0hx3i2ycsYbbRZnJLG7DnNaaaz4saXZVsJPQFbfCW6DRvOET24f0hxJtnhjrw
         Ve0DQNgRdl2oQYMigXMugGiqeJLAO6wWIG+PXkUAMR4V5RyeSUjfdSRO/5oNhqMdU5+0
         H7iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749790648; x=1750395448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yDFrdZYstFFr1ikAwEwn2uLtBMHrNSDkVizN7WRlvrI=;
        b=hyYE53CDD1qJTuqa9XsI3n1UEaLLfkxMkaSkfppIhf/9Lrw3RSeLwIOJbKIU+aDbQz
         V4F5woA+3gHRiWH1dh4jdNmjIa/jt1J0rORQxvDnZExT5ZuDejM3/sJIN5UN2yRm1ir/
         7mho37xZLqrZbdFsN6XN+PLP56uYgGuPpi7xJOe/xilyoWznuyz25POxC408aeyhkzpF
         c+0yRR9hB9Ce/LJD/FBoy2VKIfkblrglbf7DK+NMWwST564/IfWmNpOfpqp1M4v6Iruh
         k++FO/eU0de+G9rJkqJGDfZp8WusTQ14NJrU9NgD9PIYw42o4Zni4XSnYN3MBaVuBrcr
         5vjg==
X-Forwarded-Encrypted: i=1; AJvYcCXkGRdNTQsqADejR9dA8ft/GN4JsUjP9rRNoI22NgyAAd+8Sw1tzxo/iBmaLWAvRGgcJLtW7RJSMkm7tilNeA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy3AHQrvDkyZwJV9uwPIcFP2vZ0CWhpurFlNqzZXFCBDJgTqRQL
	Wq2mPrjsvFJFdLShhPs9NWCV7MWCJoqL5UAtrT0xF1m2+QCHeQpc+vzfQtea4kMYfRs1xmWs
X-Gm-Gg: ASbGncuP38PJnONAZVN1iezfpFkngkDcK9Y9lV0AJ7I11pD/BUQV4CQ1ec9Np3gKMPs
	wylC4gFo4Db/EcGoert8gUnZcZBJP5Ug6jRV2QlxQtRTXVTW7WmbG8WqqDbx8bd089vlOPDI3d3
	rJMLFh6ExqBH965bCymTid3Tt7zQ9d2Wb46iUzY1g3Oj7+v5eVqS3Oco/JPxoaT2021Juukssy3
	Pezs/U9+IUK5o7m3mClnynfhWXi2aMGlMOOcTeKnQu2aMQlB8Re528vP34/Mv40buGsLFjfSDH5
	k83Hl7IuDmZJtsNnbQMYmJxbwM+LMZoge0ELXGw6LjKRtppqsMaVcbAahhHSZ3Up0O/hBKt4n8s
	hY068/e9L
X-Google-Smtp-Source: AGHT+IGRBGpE0G2LO0l4ThNcvbdmN4naRabfYsho3q9eGFyAtAiN3aEaAFRwFZDWaKZJjtmjB83H3w==
X-Received: by 2002:a05:6a00:10c8:b0:742:ae7e:7da8 with SMTP id d2e1a72fcca58-7488f702611mr2940173b3a.8.1749790648132;
        Thu, 12 Jun 2025 21:57:28 -0700 (PDT)
Received: from devant.antgroup-inc.local ([47.89.83.0])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900d252esm653132b3a.163.2025.06.12.21.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 21:57:27 -0700 (PDT)
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
Date: Fri, 13 Jun 2025 12:57:19 +0800
Message-Id: <20250613045719.1081020-1-niuxuewei.nxw@antgroup.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CACGkMEsFYMjQgU7mrBwq3q2cFvFH_zro=5YOMfLsxDQYv5po5A@mail.gmail.com>
References: <CACGkMEsFYMjQgU7mrBwq3q2cFvFH_zro=5YOMfLsxDQYv5po5A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

> On Sat, Apr 12, 2025 at 10:39 PM Xuewei Niu <niuxuewei97@gmail.com> wrote:
> >
> > This patch brings a new feature, called "multi devices", to the virtio
> > vsock. It introduces a "VIRTIO_VSOCK_F_MULTI_DEVICES" feature bit, and a
> > "device_order" field to the config for the virtio vsock.
> >
> > == Motivition ==
> >
> > Vsock is a lightweight and widely used data exchange mechanism between host
> > and guest. Currently, the virtio-vsock only supports one device, resulting
> > in the inability to enable more than one backend.
> 
> I wonder which part of the spec forbids more than one device.

No. The spec, however, is designed for a single device, and lacks some
specifications for multiple devices.

For example, we should have a mechanism to select a device from all to
communicate with a peer.

This patch introduces a new feature bit "VIRTIO_VSOCK_F_MULTI_DEVICES", and
involves some modifications to the config space, device & driver norms.

> > For instance, two devices
> > are required: one to transfer data to the VMM via virtio-vsock, and another
> > to a user process via vhost-user-vsock.
> >
> > Apart from that, a side gain is that theoretically the performance might be
> > improved since each device has its own queue. But it varies depending on
> > the implementation.
> 
> It could implement multiqueue anyhow.
> 
> Thanks

Yes, indeed. As we discussed before, I marked this as a side gain. And
@Stefano said that the community has a plan to implement multiqueue for
vsock. The foundational goal of this patch is to enable vsock to support
multiple backends.

Thanks,
Xuewei
