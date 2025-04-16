Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D5D622087
	for <virtio-comment@lists.linux.dev>; Wed, 16 Apr 2025 14:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744815580; cv=none; b=TuutUX3HmDW6muQ5cYHZtnF4awxmp4gEyIMoRonqRCpFsYW+nIKE1EABxh77rMIJghenBM7vIjQBkJuEdYZbR2lO+hMcTdk+Ao+FXbCq2ZPn53F+nBhHRYbO8a5MnPdMS3GwXLuMQ8tTUeG/d+9RrLead0OeqMuiPj8adNIIRuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744815580; c=relaxed/simple;
	bh=mzD2uZqbITX53fKlZSd7+BxLYfGC3ENUYfwzBoSfTdM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fVv7L0tmYUJwLSXF0OBK6f6xKrl0vMKwpD4mGm/eO6Wxi4U/Zh131Rasn52uyg+NMBDsjJbtw8a4eyadnrgW1IWy60lrsg0aMvGaeYn8s0ZANfjW6R+dvUK8xed63luhflLFJA2DHeIKzaDTHE5MyhfSNAu7b/6Zpiyby3749bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hZyee2cl; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hZyee2cl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744815577;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M90aQgUTFK/P3jbkYiOzEpfhfkPkAJiGzu6cEWsw73E=;
	b=hZyee2clcgp1zdJaoNUvu6uOVNGtpC6XWD/xmvWR+d3LGET1K3QBrEKT7aJXSWImNg1Uku
	WBkKXfJFHYoewaOVHZz9a5l/JkMnEJbAYyFCWUcZdw3MVh0w3FcqSEI7g2YsHngwk64NiU
	lX2BXGjn6NR0QuZ3M6rYPDQODdl9E4o=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-611-r-265ctSOIaZhXbGKgj8HQ-1; Wed, 16 Apr 2025 10:59:35 -0400
X-MC-Unique: r-265ctSOIaZhXbGKgj8HQ-1
X-Mimecast-MFC-AGG-ID: r-265ctSOIaZhXbGKgj8HQ_1744815574
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-5f435440b1cso3329894a12.3
        for <virtio-comment@lists.linux.dev>; Wed, 16 Apr 2025 07:59:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744815574; x=1745420374;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M90aQgUTFK/P3jbkYiOzEpfhfkPkAJiGzu6cEWsw73E=;
        b=tFMcgkzm2Fm3x0ahldc6UkmvSJV1vpSdZAeATIavKjt5nwGXwEnKTO4OjI4q0hxhwX
         15+15za4td4pL1INYqreh+WhotpIU76HNmA1NyFlc9UoeZ2pcXDI19gIyw8jm0OUP6Z5
         jt+S+pPLxNZmJabtl2DEmWoAC5vhBAATJfZASt+fWZHikj+0AacygkQrzu/A8mOcTprY
         lO/nKL3FA0imtWMTZissFAQSJhXpVkhWVzYXOvz0Lgu6cP8c4tEQsSNdwRNqOqCxuq+5
         7TIhvqMEuy3Ct+Pl2/KKJCZvxIKk/t7SSkxfDMkdSc4C/txjx1oBwTdcyw1G6Osz1NWH
         dzFQ==
X-Gm-Message-State: AOJu0YzKXe4cPEsET3DAoNJRXWr8PaZKh7+vlwZXHgQFbMjG2bYdtR/n
	EyeskQyisOTj5evL5ItYr8aJ2PlE4qfQ/NMMIM3NJp3qr15dYIWKci1fJ92oV5gzpyTLAlf/U3/
	OgVS/qoBnpLPnrq1PRcBikHAmelcku5m2gNcEZFqatJFrAld5xeTWs2yc3FiOhErgrqdo0Vn+ON
	ZgAcKRODQJuSMdfUjWz9SqcdOsPRByXc+jGeuRbVM=
X-Gm-Gg: ASbGnctyhTR0gd2ozDd07t4euZSrqgCt8XloobiE/QPzyBZbvYHFZX4p5uhWo2GjaBL
	Cr/hDl6sOsQ/laF1IKhj8sXGIz0LQdJjYfc4OjqAxmXRuDqy8f1Gu1l33eizKhc5cxRjRiSBox2
	GaAyO3/23HJet68yy/sq1AKlvQ
X-Received: by 2002:a05:6402:4404:b0:5ed:6535:b6d2 with SMTP id 4fb4d7f45d1cf-5f4b7343608mr2113757a12.15.1744815573934;
        Wed, 16 Apr 2025 07:59:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFuhrS7h8S6h/1U9VA4V57KYUt/iXFcY6I/35VYJabXu+f08FPTCw3cT+qoBtT+tII359i3yvmNhfBXwEK+6Y8=
X-Received: by 2002:a05:6402:4404:b0:5ed:6535:b6d2 with SMTP id
 4fb4d7f45d1cf-5f4b7343608mr2113731a12.15.1744815573547; Wed, 16 Apr 2025
 07:59:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250306095112.1293-1-quic_philber@quicinc.com>
 <Z/+qe+tyH5EGaIXq@fedora> <o24texxar6qou44fvtul24x7q3ymd7vrq6m4k6kkvgh7rpwvqk@7p44quglxnql>
In-Reply-To: <o24texxar6qou44fvtul24x7q3ymd7vrq6m4k6kkvgh7rpwvqk@7p44quglxnql>
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Date: Wed, 16 Apr 2025 16:59:22 +0200
X-Gm-Features: ATxdqUGIL4P9mD_hmVw4N2pi2bGVMsdfkJXDdGY17dE1K0ozq0A0tjMJJZztgkY
Message-ID: <CAHYGQ0zj3ZDCuUxK=r61dSzeS=8m2rwJvBjiMMx1mk__N8DroA@mail.gmail.com>
Subject: Re: [PATCH v8 0/4] virtio-rtc: Add device specification
To: Peter Hilber <quic_philber@quicinc.com>
Cc: virtio-comment@lists.linux.dev, Cornelia Huck <cohuck@redhat.com>, 
	Parav Pandit <parav@nvidia.com>, Jason Wang <jasowang@redhat.com>, 
	David Woodhouse <dwmw2@infradead.org>, "Ridoux, Julien" <ridouxj@amazon.com>, 
	Trilok Soni <quic_tsoni@quicinc.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WYkmZvLFJM8hstyXjqcpX8Y_fTrH01I1V-5AgsmKlZs_1744815574
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 16, 2025 at 4:45=E2=80=AFPM Peter Hilber <quic_philber@quicinc.=
com> wrote:
>
> On Wed, Apr 16, 2025 at 03:02:51PM +0200, Matias Ezequiel Vara Larsen wro=
te:
> > Hello Peter,
> >
> > I only now had time to share my comments. I could not cover all the
> > patches though. These are minor changes. Apologies for the delay.
>
> Hi Matias,
>
> not sure which patches you did not address. I got your replies for all 4
> patches. Is it the Linux kernel driver patches?
>

No, sorry I meant that I could not cover all the sections in the
patches. I think I stopped at Device Requirements: Alarm Operation.

Matias

> Thanks for the comments,
>
> Peter
>
> >
> > Matias
> >
> > On Thu, Mar 06, 2025 at 10:51:08AM +0100, Peter Hilber wrote:
> > > This iteration of the spec should address multiple review findings fr=
om
> > > Matias Ezequiel Vara Larsen.
> > >
> > > Summary
> > > -------
> > >
> > > The RTC (Real Time Clock) device provides information about current
> > > time. The device can provide different clocks, for the UTC or TAI tim=
e
> > > standards, or for physical time elapsed since some past epoch. For UT=
C
> > > clocks, the device can also indicate how leap seconds are handled. Th=
e
> > > driver can read the clocks with simple or more accurate methods.
> > > Optionally, the driver can set an alarm.
> > >
> > > Changelog
> > > ---------
> > >
> > > v8:
> > >
> > > - Explicitly describe alarm enabled status, where relevant (Matias Ez=
equiel
> > >   Vara Larsen).
> > >
> > > - Reword multiple sentences and requirements (Matias Ezequiel Vara La=
rsen).
> > >
> > > - Drop unnecessary or redundant requirements (Matias Ezequiel Vara La=
rsen).
> > >
> > > - Change word order from "field X" to "the X field" (Matias Ezequiel =
Vara
> > >   Larsen).
> > >
> > > - Change word order from "flag X" to "the X flag" or "X".
> > >
> > > - Move requirements to serve alarm expiration events before requireme=
nts
> > >   about stopping to serve (Matias Ezequiel Vara Larsen).
> > >
> > > v7:
> > >
> > > - Remove leap second and performance indications from struct
> > >   virtio_rtc_resp_read_cross. Remove backing definitions.
> > >
> > > - Move wording change which was mistakenly placed in last patch to fi=
rst
> > >   patch.
> > >
> > > v6:
> > >
> > > - Make leap second status information optional if the clock smears (o=
r
> > >   might smear) leap seconds.
> > >
> > > - Do not use union for leap second indication.
> > >
> > > - Improve wording.
> > >
> > > - Refer to the new POSIX.1-2024 for UTC epoch definition.
> > >
> > > v5:
> > >
> > > - Change structure and wording to support adding shared memory like
> > >   vmclock [2].
> > >
> > > - Add dedicated clock types for UTC leap second smearing (David
> > >   Woodhouse).
> > >
> > > - Extend leap second indications.
> > >
> > > - Replace VIRTIO_RTC_SUBTYPE_ by VIRTIO_RTC_SMEAR_.
> > >
> > > - For Arm Generic Timer, only support Virtual Count Register (David
> > >   Woodhouse).
> > >
> > > - Rename MONO clock to MONOTONIC clock.
> > >
> > > - Harmonize bit widths with vmclock [2].
> > >
> > > - Change formatting.
> > >
> > > v4:
> > >
> > > - Distinguish UTC clocks with and without leap smearing (David
> > >   Woodhouse).
> > >
> > > - Add UTC leap second and TAI offset indication (David Woodhouse).
> > >
> > > - Add clock performance information (David Woodhouse).
> > >
> > > - Drop distinction of Arm Generic Timer virtual and physical counter.
> > >
> > > - Change requirements so that driver can reset alarm to clean slate, =
and
> > >   document how driver can achieve this (Cornelia Hell, Jason Wang).
> > >
> > > - Device should assume that driver reads clock from first vCPU (David
> > >   Woodhouse).
> > >
> > > - Driver should read clock to confirm that alarm has expired.
> > >
> > > - Require driver to set unused flags to zero.
> > >
> > > - Require device to support all expressible alarm times.
> > >
> > > - Formatting and wording improvements.
> > >
> > > v3:
> > >
> > > - Address comments from Parav Pandit.
> > >
> > > - Add an optional alarm feature.
> > >
> > > - Various other changes.
> > >
> > > v2:
> > >
> > > - Address comments from Cornelia Huck.
> > >
> > > [1] https://lore.kernel.org/lkml/61364452-bdf5-4bd8-adb1-a9e6236c9d26=
@opensynergy.com/
> > > [2] https://lore.kernel.org/lkml/20240708092924.1473461-1-dwmw2@infra=
dead.org/
> > > [3] https://lore.kernel.org/all/78969a39b51ec00e85551b752767be65f6794=
b46.camel@infradead.org/
> > > [4] https://lore.kernel.org/lkml/20241219204208.3160-1-quic_philber@q=
uicinc.com/
> > >
> > >
> > > Peter Hilber (4):
> > >   virtio-rtc: Add initial device specification
> > >   virtio-rtc: Add initial normative statements
> > >   virtio-rtc: Add alarm feature
> > >   virtio-rtc: Add normative statements for alarm feature
> > >
> > >  conformance.tex                         |    2 +
> > >  content.tex                             |    3 +-
> > >  device-types/rtc/description.tex        | 1100 +++++++++++++++++++++=
++
> > >  device-types/rtc/device-conformance.tex |   13 +
> > >  device-types/rtc/driver-conformance.tex |   11 +
> > >  introduction.tex                        |    6 +
> > >  6 files changed, 1134 insertions(+), 1 deletion(-)
> > >  create mode 100644 device-types/rtc/description.tex
> > >  create mode 100644 device-types/rtc/device-conformance.tex
> > >  create mode 100644 device-types/rtc/driver-conformance.tex
> > >
> > >
> > > base-commit: 124fcd0e97f209aab19639e7369116d99ede22a2
> > > --
> > > 2.43.0
> > >
> >
>

