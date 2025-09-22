Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E01523093B8
	for <virtio-comment@lists.linux.dev>; Mon, 22 Sep 2025 13:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758549253; cv=none; b=mtZltskjBjoQSL7hxrG9SjkzP7Bz53HP4TqL5ZCuzTxZAZAZCWQlTd4TVT/sx6YKHqpNUH6x1Najjd3XsDe7fbQlvichT3+BXNRBvHoUIRK2eM58oeCMOAVhHQ4xhbL/aH2qHwyx+S8zdrWTKPGU3wFbUOWGV28rejQ312aiJw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758549253; c=relaxed/simple;
	bh=0gBUbaMzr1sQZOmog+R2JOVfb+8J7i461H3umjEh4pE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WXeLkbLlzgO36RepflWDoicVySn2v3CRborCY2QchXRes0h+1ziwLC6UhjzG4Ce20/0bCQjSIwIWNWtxkGrRH+FdH1YdIwF8NJizP78kIJiA51nW7Q4IUOtdJMjSeTw2keQN2kImZUZx3Xvl5C7nGvpyfI3yyK9mVVcfPMCrP+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QVrSX4VF; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QVrSX4VF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758549249;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s56qGOC0WUeh0NoSrtC7JKYCxShhajmLCDl4nGe579U=;
	b=QVrSX4VFqGrqO735bcUCB7FT+r7DfEJuWXGrwC8g3Ho/k20yN8JCOQYibsAgAeGYx2vteq
	NO6e8pODxFloRrVQjbBxph4g5GhRBhor/yLx9moRP0BmR3Sq+Pg/figFifD6G/5EKHewMK
	deva4QQgTsVPtEe+tKE9ZB7rcy1itjY=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-206-poWSmTs-PzGLPFxVGxXtkg-1; Mon, 22 Sep 2025 09:54:08 -0400
X-MC-Unique: poWSmTs-PzGLPFxVGxXtkg-1
X-Mimecast-MFC-AGG-ID: poWSmTs-PzGLPFxVGxXtkg_1758549247
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-b04206e3d7eso190464066b.1
        for <virtio-comment@lists.linux.dev>; Mon, 22 Sep 2025 06:54:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758549247; x=1759154047;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s56qGOC0WUeh0NoSrtC7JKYCxShhajmLCDl4nGe579U=;
        b=G1EKvSdj6UB9GHivRzqnxTF2qEjMTXE9ZU3oxlIpJOxEFamawtlKra4ojAZ+RTv9nC
         KHyKX31Z9L2eXYUp1a5P/7yAFBDKJbbvpNOAdNq6NlIvu1Qul1jJiM2y3xZjuVcOpMwm
         EXOzNDY+ZxwQnDNkWSmrYEJa9U7MtyiKeMPQp03etV6D76JhmYlancLOhzfmE9twx/eo
         JQC+7fk4MlVFDFbaOCCHErkov/jjjzJOMootCJEvQjkP3bvXw9GulVUqOEWM6gG+zsnH
         UCaTZsXZGtr+jZiaIkeCabP5FRfwSyxk5Dthk3d4wRilEXsP1kFTHdgbqY56/Z86lJLe
         ye+Q==
X-Gm-Message-State: AOJu0YwEK/Lb07tDey3zxuL3jhnofWlqta4Ms63+WBLepQ9/3U4rgIW+
	Wwhl//ro2DgM18Sd32tepJgfL1Iwf3JqWq9CmwtsBcGmJ5vCRVoulLGAX5UmBpuP28QgOEtOcTE
	d3cUcD9QWOMB3X7EskDTYeMkTLXF3cydS7l+yDP8P0PAoKHjIdMiOp5dJA37v8NI/KYSyg4wqgv
	i0MjFP2nV5T8YPGAalJpJ8cuhNIV5lGt4+r8lTshK9qvM=
X-Gm-Gg: ASbGncttT+femZy0jWQ26nm6Lp89vQz1jai0Gfqom/YMw1DK1sA/2JqSYWwZnnhNLl+
	utCm9Tea54iJp5HepeQ/fRhXWRMm7FiCUuKypFCw64l1/L93a8ygtpMiIM6B0W1ga80CM5meXX1
	ufmad4SM4PcdrgrX8+2A1rmHjKoskUWtJsgfF4nCqXhSCe8gCrJIak
X-Received: by 2002:a17:907:26ce:b0:b04:3cd2:265b with SMTP id a640c23a62f3a-b2488299ad9mr1479865466b.5.1758549247071;
        Mon, 22 Sep 2025 06:54:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEXx9pAdGDM2xPnrvjE1D6r3ebK7x0zkJ2iy9DCd/vHOcy4w6xwtnhDOTh1k1MwJea4EmZv7na46eAs1aC39cA=
X-Received: by 2002:a17:907:26ce:b0:b04:3cd2:265b with SMTP id
 a640c23a62f3a-b2488299ad9mr1479862566b.5.1758549246613; Mon, 22 Sep 2025
 06:54:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250710090648.1711-2-quic_philber@quicinc.com> <phgvo46gljk6ck55n776cl2q3xdja3d6j4jyx3zjrkla7tch4b@7wcxe5djpujt>
In-Reply-To: <phgvo46gljk6ck55n776cl2q3xdja3d6j4jyx3zjrkla7tch4b@7wcxe5djpujt>
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Date: Mon, 22 Sep 2025 15:53:55 +0200
X-Gm-Features: AS18NWCnAIdEhfGIXV1ZvxkOA2iBHUXp7mvONCJVWkY7UmFayjho6pu8ziHRSuw
Message-ID: <CAHYGQ0xTxp0v90cpodpo2Ux7evgHjY1C9nHSYffuResT5f6cYQ@mail.gmail.com>
Subject: Re: [PATCH v10 0/4] virtio-rtc: Add device specification
To: Peter Hilber <quic_philber@quicinc.com>
Cc: virtio-comment@lists.linux.dev, Cornelia Huck <cohuck@redhat.com>, 
	Parav Pandit <parav@nvidia.com>, Jason Wang <jasowang@redhat.com>, 
	David Woodhouse <dwmw2@infradead.org>, "Ridoux, Julien" <ridouxj@amazon.com>, 
	Trilok Soni <quic_tsoni@quicinc.com>, "Michael S. Tsirkin" <mst@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: IfrFcxrCto0IbJh7_y-rjyw0L1icUa0m75kAHajcmtw_1758549247
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

@parav I think this has been voted on. Should it be merged in 1.4?

Matias

On Thu, Jul 10, 2025 at 11:16=E2=80=AFAM Peter Hilber <quic_philber@quicinc=
.com> wrote:
>
> On Thu, Jul 10, 2025 at 11:06:45AM +0200, Peter Hilber wrote:
> > This iteration of the spec fixes merge conflicts with the recently merg=
ed
> > virtio-media device and adds two missing entries in the Conformance
> > section.
> >
> > Summary
> > -------
> >
> > The RTC (Real Time Clock) device provides information about current
> > time. The device can provide different clocks, for the UTC or TAI time
> > standards, or for physical time elapsed since some past epoch. For UTC
> > clocks, the device can also indicate how leap seconds are handled. The
> > driver can read the clocks with simple or more accurate methods.
> > Optionally, the driver can set an alarm.
> >
> > The driver-side timekeeping can synchronize precisely to a local clock
> > exposed by the RTC device. If supported by the device, the driver can
> > obtain a cross-timestamp from the local clock and the system hardware
> > counter, in a way similar to the Linux kernel ptp_kvm driver [1].
> >
> > The alarm allows the driver side to be woken up from a sleep state at a
> > specific time.
>
> Could you please open a voting ballot for these changes?
>
> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/221
>
> Apparently no ballot has been opened for v9. I am now requesting one for
> the v10 (with changes as mentioned at the top).
>
> Best regards,
>
> Peter
>
> >
> > Changelog
> > ---------
> >
> > v10:
> >
> > - Add RTC clauses to the "Conformance Targets" section.
> >
> > - Fix merge conflicts with recently merged virtio-media device.
> >
> > v9:
> >
> > - Add motivation to cover letter (Michael S. Tsirkin).
> >
> > - Allow more implementation-specific behavior when alarm actions become
> >   obsolete (Matias Ezequiel Vara Larsen).
> >
> > - Define how device should not change across resets (Michael S. Tsirkin=
).
> >
> > - Document that device converts hardware counter value, accounting for
> >   device/driver differences in offset/multiplier (Michael S. Tsirkin).
> >
> > - Restrict implementation-specific id ranges to experimental
> >   implementations (Michael S. Tsirkin).
> >
> > - Mandate that only flags allowed by negotiated features may be accesse=
d
> >   (Michael S. Tsirkin).
> >
> > - State that an error-free device sets status OK for all requests from =
a
> >   well-behaved driver (Michael S. Tsirkin).
> >
> > - Change name to "Real Time Clock" in device type list (Michael S.
> >   Tsirkin).
> >
> > - Remove unneeded requirement about what to put into device-readable
> >   buffers (Matias Ezequiel Vara Larsen).
> >
> > - Reword multiple sentences and requirements (Matias Ezequiel Vara Lars=
en,
> >   Michael S. Tsirkin).
> >
> > - Move fixes which were mistakenly placed in patch 2 in v8 (Cornelia Hu=
ck).
> >
> > - Remove statement implying that device MUST NOT check that reserved fi=
elds
> >   are zero.
> >
> > v8:
> >
> > - Explicitly describe alarm enabled status, where relevant (Matias Ezeq=
uiel
> >   Vara Larsen).
> >
> > - Reword multiple sentences and requirements (Matias Ezequiel Vara Lars=
en).
> >
> > - Drop unnecessary or redundant requirements (Matias Ezequiel Vara Lars=
en).
> >
> > - Change word order from "field X" to "the X field" (Matias Ezequiel Va=
ra
> >   Larsen).
> >
> > - Change word order from "flag X" to "the X flag" or "X".
> >
> > - Move requirements to serve alarm expiration events before requirement=
s
> >   about stopping to serve (Matias Ezequiel Vara Larsen).
> >
> > v7:
> >
> > - Remove leap second and performance indications from struct
> >   virtio_rtc_resp_read_cross. Remove backing definitions.
> >
> > - Move wording change which was mistakenly placed in last patch to firs=
t
> >   patch.
> >
> > v6:
> >
> > - Make leap second status information optional if the clock smears (or
> >   might smear) leap seconds.
> >
> > - Do not use union for leap second indication.
> >
> > - Improve wording.
> >
> > - Refer to the new POSIX.1-2024 for UTC epoch definition.
> >
> > v5:
> >
> > - Change structure and wording to support adding shared memory like
> >   vmclock [2].
> >
> > - Add dedicated clock types for UTC leap second smearing (David
> >   Woodhouse).
> >
> > - Extend leap second indications.
> >
> > - Replace VIRTIO_RTC_SUBTYPE_ by VIRTIO_RTC_SMEAR_.
> >
> > - For Arm Generic Timer, only support Virtual Count Register (David
> >   Woodhouse).
> >
> > - Rename MONO clock to MONOTONIC clock.
> >
> > - Harmonize bit widths with vmclock [2].
> >
> > - Change formatting.
> >
> > v4:
> >
> > - Distinguish UTC clocks with and without leap smearing (David
> >   Woodhouse).
> >
> > - Add UTC leap second and TAI offset indication (David Woodhouse).
> >
> > - Add clock performance information (David Woodhouse).
> >
> > - Drop distinction of Arm Generic Timer virtual and physical counter.
> >
> > - Change requirements so that driver can reset alarm to clean slate, an=
d
> >   document how driver can achieve this (Cornelia Hell, Jason Wang).
> >
> > - Device should assume that driver reads clock from first vCPU (David
> >   Woodhouse).
> >
> > - Driver should read clock to confirm that alarm has expired.
> >
> > - Require driver to set unused flags to zero.
> >
> > - Require device to support all expressible alarm times.
> >
> > - Formatting and wording improvements.
> >
> > v3:
> >
> > - Address comments from Parav Pandit.
> >
> > - Add an optional alarm feature.
> >
> > - Various other changes.
> >
> > v2:
> >
> > - Address comments from Cornelia Huck.
> >
> > [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/=
commit/?id=3Da0e136d436ded817c0aade72efdefa56a00b4e5e
> > [2] https://lore.kernel.org/lkml/20240708092924.1473461-1-dwmw2@infrade=
ad.org/
> >
> >
> > Peter Hilber (4):
> >   virtio-rtc: Add initial device specification
> >   virtio-rtc: Add initial normative statements
> >   virtio-rtc: Add alarm feature
> >   virtio-rtc: Add normative statements for alarm feature
> >
> >  conformance.tex                         |   12 +-
> >  content.tex                             |    3 +-
> >  device-types/rtc/description.tex        | 1117 +++++++++++++++++++++++
> >  device-types/rtc/device-conformance.tex |   13 +
> >  device-types/rtc/driver-conformance.tex |   11 +
> >  introduction.tex                        |    6 +
> >  6 files changed, 1157 insertions(+), 5 deletions(-)
> >  create mode 100644 device-types/rtc/description.tex
> >  create mode 100644 device-types/rtc/device-conformance.tex
> >  create mode 100644 device-types/rtc/driver-conformance.tex
> >
> >
> > base-commit: c5e5810cb6cb48b673bd3247eb48490d29b1e0fb
> > --
> > 2.43.0
> >
>

