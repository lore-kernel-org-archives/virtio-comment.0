Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1A517BA1
	for <virtio-comment@lists.linux.dev>; Tue, 17 Jun 2025 02:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750128769; cv=none; b=jCV32d7jeStOgfbw1FyD1muCj17d0CcJLaCVO6jBLzHdDPrhznSv7x1mt1a/TpRcr6NLVVhm8Npz1zwyxj6M62mitA7im6Ba43RbhWebgTqeX+fLSwdniGQmdKFvrJaaC1Pj+zMVYDXxlvAX5kMkHrWislUyg/8LIs6+KkcxvaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750128769; c=relaxed/simple;
	bh=5L4Z+VlNXtFS/pdTZQj8TDL5rNosxFeZ1inHpFcGBgc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZN7eYMCnNmKW1ndPZUCcrEorE7fI3V+cH/mH/o+erEHdW87LUn/b7Fs/o6e7Q6QAawNK7nx5NlGRTwBTsdnbMlKhBaN4yP4x1IVoTfWd8gDPoBIkWFbyHFfRZCR62hxaoEUScKjb0Ia29YI/Xyj3jGXWMko48xxX1EOssJgz2MA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BiFM1eff; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BiFM1eff"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750128762;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5L4Z+VlNXtFS/pdTZQj8TDL5rNosxFeZ1inHpFcGBgc=;
	b=BiFM1effJtI/2dthCRTcOOjf3ZrycL6796IJs5hOY6T2lOgvwy2QnzOafnPqAh46y5yZYj
	Xx0GQrr7s6nOC/YJRvdQ3tftQiqnA85YIVjzhd+PBlyV/rFzLFHAA+4t/F2s2Njmk0fiED
	cZlxoFWpjeBIOZ4nGrmy15G6jhKnPpg=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-451-YqCvyIxWOKaexl4m_bxDjg-1; Mon, 16 Jun 2025 22:52:39 -0400
X-MC-Unique: YqCvyIxWOKaexl4m_bxDjg-1
X-Mimecast-MFC-AGG-ID: YqCvyIxWOKaexl4m_bxDjg_1750128758
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-748b4d5c045so1415689b3a.1
        for <virtio-comment@lists.linux.dev>; Mon, 16 Jun 2025 19:52:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750128758; x=1750733558;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5L4Z+VlNXtFS/pdTZQj8TDL5rNosxFeZ1inHpFcGBgc=;
        b=m0tZ7ebw4QFCncxTSCl7rRRfrb/8YVCbmqlHZ54Aampgu//kr10eLjroFe8OEYXzQO
         bssvC7m1Bpsg5PBImXmjhQ72oIeotKWRGWWudBFnAO7Kt7nreasLeOYXDqcnQswAYqdn
         NHozNvqnFmSM+006YzT45wTzKpKDCYJhBGnDJH4QFhA+MVf1E059/KRFSGJ/flYg5V2W
         XrIrDaZ1CylloSQvAKYNj0USw9GjYk0/vcCjj/VZAUoE24jVr+9z+Faa4ZbMy3LAoeDg
         n+kVXbDwNtqeuaqpBGDBBvZrKfCV8GfrGayMilxGI9GEMCErQ6pUdQ72VjudZtkeJETe
         Y7Ww==
X-Forwarded-Encrypted: i=1; AJvYcCV95ORu/fCvtcWmTIAQXsRz0sseNofZDa+It3c3kK5y/P/hDYSspKVtdg6TFHBMMItl2g3u7dozAoOATtmULw==@lists.linux.dev
X-Gm-Message-State: AOJu0YymTppoSY07fDmrNxT76zXgUichyL4XqnaTtck11riEjon2z+W8
	7Ytj94X3B6A46GeAMNRoSVQjLrWKhJeK4UvXtKy18fgjbNBZbg9+LojTZ69j20rYoDtAVf8ZQpY
	MvRoP8XLhv4FUNygBFVHg4e3hNRVtESLZmz96HUXm56GpSPk+QwF/A2XPIaqU2tHzN4prgqehCj
	RjNh4juDvoALmL/Q4KBB2nKa/9KFdiIdQclrl5j+uGEUT8/KA4zX2ZOzC2
X-Gm-Gg: ASbGncuDhKC7Q8gejpQ8rtXG6CGh1CV7SXe5bZzUBOzOq6GbUAN69FD2YI8dBCznXE0
	ngSGAPJLedtmPX2/cVu5wKUvC3lAbjSTqwJAN8mOJ5jeuyF/lN9fhbr89yC+hKxgdnZuYoiV9Y3
	GbKlDs
X-Received: by 2002:a05:6a00:2d20:b0:742:a91d:b2f6 with SMTP id d2e1a72fcca58-7489d00b6b0mr15352310b3a.13.1750128757908;
        Mon, 16 Jun 2025 19:52:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtKn8Pbu746eLqH0OTKikFmeZhaH1eXNKMWOog8lBL5ai0nZv/Zkn4H0uCCQSDwq1RXEFHpiIfIxNIYlY4Kps=
X-Received: by 2002:a05:6a00:2d20:b0:742:a91d:b2f6 with SMTP id
 d2e1a72fcca58-7489d00b6b0mr15352290b3a.13.1750128757503; Mon, 16 Jun 2025
 19:52:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CACGkMEuV41G8S2gt=HozCK5GR6fv-QSChscR5TsG2HLO3H5FUQ@mail.gmail.com>
 <20250616082914.1159976-1-niuxuewei.nxw@antgroup.com> <CAGxU2F4fjuvPK_4tU4-Tm0mYg3Rd5AhL6uaJmCmSTRzaqzAr6g@mail.gmail.com>
In-Reply-To: <CAGxU2F4fjuvPK_4tU4-Tm0mYg3Rd5AhL6uaJmCmSTRzaqzAr6g@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 17 Jun 2025 10:52:25 +0800
X-Gm-Features: AX0GCFsF1bkf0a2RXathKWrWd5jy2SMKsDUW1QrgIRsRys8DpKtYXLNotVNsSrM
Message-ID: <CACGkMEtAyjx2XF9dRzhhNGsmKyWR0RvLsYbemvK5LbPUCGyKYg@mail.gmail.com>
Subject: Re: [PATCH v7] virtio-vsock: Add support for multi devices
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: Xuewei Niu <niuxuewei97@gmail.com>, fupan.lfp@antgroup.com, mst@redhat.com, 
	niuxuewei.nxw@antgroup.com, parav@nvidia.com, virtio-comment@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: HBC7nHUERx1V2MpadmV-ocNqdY6WH41kUKzfxT9dOR4_1750128758
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 16, 2025 at 4:38=E2=80=AFPM Stefano Garzarella <sgarzare@redhat=
.com> wrote:
>
> On Mon, 16 Jun 2025 at 10:29, Xuewei Niu <niuxuewei97@gmail.com> wrote:
> >
> > > On Fri, Jun 13, 2025 at 4:46=E2=80=AFPM Xuewei Niu <niuxuewei97@gmail=
.com> wrote:
> > > >
> > > > > On Fri, 13 Jun 2025 at 06:57, Xuewei Niu <niuxuewei97@gmail.com> =
wrote:
> > > > > >
> > > > > > > On Sat, Apr 12, 2025 at 10:39=E2=80=AFPM Xuewei Niu <niuxuewe=
i97@gmail.com> wrote:
> > > > > > > >
> > > > > > > > This patch brings a new feature, called "multi devices", to=
 the virtio
> > > > > > > > vsock. It introduces a "VIRTIO_VSOCK_F_MULTI_DEVICES" featu=
re bit, and a
> > > > > > > > "device_order" field to the config for the virtio vsock.
> > > > > > > >
> > > > > > > > =3D=3D Motivition =3D=3D
> > > > > > > >
> > > > > > > > Vsock is a lightweight and widely used data exchange mechan=
ism between host
> > > > > > > > and guest. Currently, the virtio-vsock only supports one de=
vice, resulting
> > > > > > > > in the inability to enable more than one backend.
> > > > > > >
> > > > > > > I wonder which part of the spec forbids more than one device.
> > > > > >
> > > > > > No. The spec, however, is designed for a single device, and lac=
ks some
> > > > > > specifications for multiple devices.
> > > > > >
> > > > > > For example, we should have a mechanism to select a device from=
 all to
> > > > > > communicate with a peer.
> > >
> > > I wonder if this is a:
> > >
> > > 1) mechanism that needs to be mandated by the device
> >
> > Yes.
> >
> > > 2) a policy that is allowed to be tweaked by the user as TCP/IP did
> >
> > Not allowed in the current version.
> >
> > > (Note anyhow the driver can override what the device suggests...)
>
> I think we should follow what we described in the spec:
> "The virtio socket device is a zero-configuration socket communications d=
evice."

We probably need to define "configuration" first.

For example, if it means zero configuration from the user, it does not
conflict with 2), the driver can use its own algorithm to elect a
"default" device.

>
> So, IMO the guest (driver) should not be allowed to change anything.
> E.g. Right now it's not allowed to change the CID assigned by the host (d=
evice).

A dumb question when having two cids (cid1 and cid2) in the same
guest, what happens if src=3Dcid1 and dst=3Dcid2?

>
> Thanks,
> Stefano
>

Thanks

