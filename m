Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB14A7263A
	for <virtio-comment@lists.linux.dev>; Mon, 16 Jun 2025 03:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750043203; cv=none; b=T9heuX6jIGVJjA7BZBMUawJkeGjh5ma3vev5HY6tMre+fI29PQ1Righ80y2hvMNBq8HRbNIilzoD7w9t9nKcuMqvknB5XgUFntIN3Y4NSYSAUV36h3xH9LS9RGHfn3YooDjL5ioj/hm90To3i+XHRhYdh9NI5h3f7F5rCdxMvhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750043203; c=relaxed/simple;
	bh=OQDMvM9aFhcBnl4ou1ONEhObmXVAwrFdmdqmaWSauyk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cIBAGp4DuruvvQPuiCS+n6+WcfLGoSzwrVjtEUEccdIKp5LDbSUvpb8oTZBucJb5Rfd1ZE10bGNDbEx7GTpj19vSyUZ5Ij2/tmrvvCNEwRVm5BesYLzEWdBD4V6RaxUiuipIQrNIZaOLQ/fGRJXpRzJQ8vMlldzbEpZLV7Hin8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bSmSB/ny; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bSmSB/ny"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750043196;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OQDMvM9aFhcBnl4ou1ONEhObmXVAwrFdmdqmaWSauyk=;
	b=bSmSB/nyxppuwyQu7KjJeSwRR7LLerQdW1XEer/eDjOUVmYYtVfmgVXJN2GVK0QjWTgpaT
	pv6k+DEiDU3wxrxAhwtKe83OLN01CmSD0NQc+Q/92sw38MdzMxAYk14dy0Ulsk7CHjHgGN
	CGVF628f+gTP6kNRjGnUDjkiR5AUKNA=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-439-pqgbcXFnOuiCC2_ZLCW42Q-1; Sun, 15 Jun 2025 23:06:35 -0400
X-MC-Unique: pqgbcXFnOuiCC2_ZLCW42Q-1
X-Mimecast-MFC-AGG-ID: pqgbcXFnOuiCC2_ZLCW42Q_1750043194
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b2c36d3f884so2650768a12.2
        for <virtio-comment@lists.linux.dev>; Sun, 15 Jun 2025 20:06:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750043194; x=1750647994;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OQDMvM9aFhcBnl4ou1ONEhObmXVAwrFdmdqmaWSauyk=;
        b=AtdxeIK14fK6++OkdKNA4lsIssmThv/L+okyILmMKatTm0d0y881FsG/I0nG+EOohQ
         FXaAhKF53228vc6iJtRpSgrzjrMOeTb4r5apx62L1/5aO+RYsbFlTg2DHyUErLRjnygQ
         ++K+qwh97Mk9WYdO/4qPhcvsBr+HVD9unTSQ1lFyyoAk8yFRFZRW7Bj/qlYK+5QBPTHX
         zqylZIFlCXRxarezX6vemLb867kw+hN61Ymogt4zrmUWVjvWjr9CwNIDw8I1WRm5eM/8
         z1TNNstw69hdGQqN73WNgAEA1PuSa/A03Rqz6LyUOt+v84UBTk3AeqEdTvicTm4fONvM
         rhOQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2UabjaOsbWxhS7+pMlUTuC9D264TxUWr9Sj2VmQzxTvp3T0bgtnQrIUnirA3LWW9rnRG3rAmfShfbzNKtSw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxsHe99ftSMNnNkT7XmaKbSbQS+cQw41on6p+PaOCaA9M9e7okq
	rawrFJfdIrOTQSKJFyS7OTqoT045X3gnbqJB8lACJh8Gu5CeK9VPi7LcPLQPtBRVbDf/mchavib
	ApsK2o5v02mJXq3ESplRdrPAjG+AE0Ps/o6CjYfZqIjCGj6NTAso+ZdFqfZKsJNAc5/Zw6HMdKW
	ZJZhD8YjGKVebVUuVitdlxF8qUMAKF8KofOdF/v1U62gc=
X-Gm-Gg: ASbGncsmsdYTJf0g0Cj6xZIamY9OqhP+606Ku4pvvs/SWyX6BfHxnY2QPqsFrn0morA
	Ct/0QT2jyPdDHc6ESjcQGDa71ky+hTnBitvXRZBPOpLeWxgUeY2D/iy6tEPVrauyCRgJ0VJZg7K
	BHnQ==
X-Received: by 2002:a05:6a21:512:b0:21f:568c:713a with SMTP id adf61e73a8af0-21fbd4dffe7mr9415448637.17.1750043194338;
        Sun, 15 Jun 2025 20:06:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/xOOzH4CUzYAf/vmgAOMfLQYdkx6k2c4S+6vvFrg3u/OJXmJLmIkxHgQkYFY+ImXXS9+6B/V3etNr5EqWa7M=
X-Received: by 2002:a05:6a21:512:b0:21f:568c:713a with SMTP id
 adf61e73a8af0-21fbd4dffe7mr9415411637.17.1750043193858; Sun, 15 Jun 2025
 20:06:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAGxU2F6LtwfO_AgTxk+wEeqv1vKCmMGJNzyu08ttGYUfad3mGA@mail.gmail.com>
 <20250613084622.1088250-1-niuxuewei.nxw@antgroup.com>
In-Reply-To: <20250613084622.1088250-1-niuxuewei.nxw@antgroup.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 16 Jun 2025 11:06:22 +0800
X-Gm-Features: AX0GCFvztOGkQaGDpw7m8ZRnajqPR5i3d1ITM4SL9u4D5-CynyJeDgF7B-fW07k
Message-ID: <CACGkMEuV41G8S2gt=HozCK5GR6fv-QSChscR5TsG2HLO3H5FUQ@mail.gmail.com>
Subject: Re: [PATCH v7] virtio-vsock: Add support for multi devices
To: Xuewei Niu <niuxuewei97@gmail.com>
Cc: sgarzare@redhat.com, fupan.lfp@antgroup.com, mst@redhat.com, 
	niuxuewei.nxw@antgroup.com, parav@nvidia.com, virtio-comment@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1mu_HJosEewUfqkUbdRqERTxMz1WwVUXouuIf-F7dsE_1750043194
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 13, 2025 at 4:46=E2=80=AFPM Xuewei Niu <niuxuewei97@gmail.com> =
wrote:
>
> > On Fri, 13 Jun 2025 at 06:57, Xuewei Niu <niuxuewei97@gmail.com> wrote:
> > >
> > > > On Sat, Apr 12, 2025 at 10:39=E2=80=AFPM Xuewei Niu <niuxuewei97@gm=
ail.com> wrote:
> > > > >
> > > > > This patch brings a new feature, called "multi devices", to the v=
irtio
> > > > > vsock. It introduces a "VIRTIO_VSOCK_F_MULTI_DEVICES" feature bit=
, and a
> > > > > "device_order" field to the config for the virtio vsock.
> > > > >
> > > > > =3D=3D Motivition =3D=3D
> > > > >
> > > > > Vsock is a lightweight and widely used data exchange mechanism be=
tween host
> > > > > and guest. Currently, the virtio-vsock only supports one device, =
resulting
> > > > > in the inability to enable more than one backend.
> > > >
> > > > I wonder which part of the spec forbids more than one device.
> > >
> > > No. The spec, however, is designed for a single device, and lacks som=
e
> > > specifications for multiple devices.
> > >
> > > For example, we should have a mechanism to select a device from all t=
o
> > > communicate with a peer.

I wonder if this is a:

1) mechanism that needs to be mandated by the device
2) a policy that is allowed to be tweaked by the user as TCP/IP did

(Note anyhow the driver can override what the device suggests...)


> > >
> > > This patch introduces a new feature bit "VIRTIO_VSOCK_F_MULTI_DEVICES=
", and
> > > involves some modifications to the config space, device & driver norm=
s.
> >
> > Maybe we should think a better name to avoid confusion, like "F_DEVICE_=
ORDER".
> > I'm not good at name, so if others are better suggestion, they are welc=
ome.
>
> Naming things is tough for me, too. I'm good with "F_DEVICE_ORDER", and
> will update it in the next. I am still open to other suggestions.

If we agree on the idea, I agree we need a better name.

Thanks

>
> Thanks,
> Xuewei
>
> > >
> > > > > For instance, two devices
> > > > > are required: one to transfer data to the VMM via virtio-vsock, a=
nd another
> > > > > to a user process via vhost-user-vsock.
> > > > >
> > > > > Apart from that, a side gain is that theoretically the performanc=
e might be
> > > > > improved since each device has its own queue. But it varies depen=
ding on
> > > > > the implementation.
> > > >
> > > > It could implement multiqueue anyhow.
> > > >
> > > > Thanks
> > >
> > > Yes, indeed. As we discussed before, I marked this as a side gain. An=
d
> > > @Stefano said that the community has a plan to implement multiqueue f=
or
> > > vsock.
> >
> > I'm not sure there is a plan, but yeah, we should do it some day.
> > As I mention in the previous email, I'd remove any reference to perform=
ance.
> >
> > I'd just talk about a mechanism to select a default out device, when
> > the source socket is not bound to any address, like a default gateway.
> >
> > Thanks,
> > Stefano
> >
> > > The foundational goal of this patch is to enable vsock to support
> > > multiple backends.
> > >
> > > Thanks,
> > > Xuewei
>

