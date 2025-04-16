Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 271E62DFA49
	for <virtio-comment@lists.linux.dev>; Wed, 16 Apr 2025 13:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744808584; cv=none; b=QSdjdNDq8EWxwxVCXCRPCXda7FP3J+oRpkvsOEL0cfT5d7hOwSlRuujw8x6l43Q7Xu7BxxNkBGQCX9/S8e1VenoSQnaath6mu27iPN69vixctV70RuS68ZS64NgyFtB4tuhtqas4lsU/uj8pXJh9K5rXEpoYoHyM+F1bxpxtIq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744808584; c=relaxed/simple;
	bh=H5CCyksYk7GdYpULG0l23pHRZTS1AbcXYIWychs7zZs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=fP0Y/OGNVPdHApveMPDR87KNYEhnp7qgYqHi3myU686IVjnoJ6OMfsPpi89N34mhzyoRl7KLrHqOHwug7Au1sx558sqazEkPI8JQvtvJz944OgUycd+ClHIoBFDcy1LcNN3eigW4ttWNES4fKGb2TIV9lG+9aJY4LIQPJt/5WCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Q15vEN0x; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Q15vEN0x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744808581;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XpjPJ2rULUFeed7h5SIhW4CxEeX0wlxCiqF9MafMGs8=;
	b=Q15vEN0xel6V36mravFCMej2/nMyMZttXFW2MpwfP5BSsU0rcBu8Cb1EkxtM/wsvfI9xWk
	qJwQLkzOHATQRj+z83s0nykCHCZ5hbdbU4hI5u275DwaVrEEwXDaJvjVlBWb4XyD+Sp9/9
	NJHPk+oBrrZFxy+4rW1I8aWAEQGNZ7s=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-606-67cwqjmiMgi-wRT-D5bR9A-1; Wed, 16 Apr 2025 09:02:59 -0400
X-MC-Unique: 67cwqjmiMgi-wRT-D5bR9A-1
X-Mimecast-MFC-AGG-ID: 67cwqjmiMgi-wRT-D5bR9A_1744808578
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3913aea90b4so2860217f8f.2
        for <virtio-comment@lists.linux.dev>; Wed, 16 Apr 2025 06:02:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744808578; x=1745413378;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XpjPJ2rULUFeed7h5SIhW4CxEeX0wlxCiqF9MafMGs8=;
        b=NUbuP/DZaQIEALL0GNP5USb4b+s2VoUWRP2LG+Cihum8AWmZ1jd/umYPLuOyfyWvXt
         /JLnu6KQTSwMRb2cN2dyClpqQOyTRl+Pr3q2VJBqQwyoaQvpYh4XjtZX584qOGodfc+g
         DZPDZdFCBZ1gAMd/OPNG5YMmJ5snYBsWapnGKFz9hBv69ngE6DhJFpEaJEph5IlbIk+7
         U1TivlZNX3Nw8LQ+XyfNgrub6rWFtQipMq402HMvuq9eMTyTwWIUoGnS5amtE2UalP1v
         g9h16QFnspvDQqQGmJgFBaCveZTtJe3YhiERy6jxBvb8vuolvDXCMbyIda/d1YibJvAt
         GwdQ==
X-Gm-Message-State: AOJu0YyOS/2pPQKZ0nUCwNClIb4xwDLSmZaF3UhR4ah6RoKMUegZotlK
	m8BlzE4EVMWsOHVY1zwk3gxUsfGrN1o3aAPWNbsY/07+2sKoeBtihYLCYdBydjAqbp0nBxlV0V3
	ObN04p3J8dXCl0ulEOrIkDztgfOuRJ3l7YxgQF9FB/o5mjw/Zqy1d3/EGUI4nmE1g
X-Gm-Gg: ASbGncsiiIwsyL4QgvRwGPvvyuV5TsonPS9yoT14ZTqGxtnZmsExnJ5Jb8+VYFs3fAn
	h8kGr8QCiu25qjRLPqEbTcOWzPutadqbvyhQPxAO1G0UbDzsq5wPRNZmPuR34lGkBWOfcTANP5V
	6By8cW2xxGkxzqaqI807XmB1GyJAeyRP1WXhX6QMnSUbhot8O65uAURyJ/1qMvGy5GgDky3DFON
	pup3iAo9F/8xkur9gFm17b582ETR/JhCVt5sl/YwkJ53pWGd0yQcBfJMgWrSHD3Sko7gO8dqs2Q
	EKfxaA==
X-Received: by 2002:a05:6000:1863:b0:39a:ca04:3e4d with SMTP id ffacd0b85a97d-39ee5b1123amr1685904f8f.7.1744808577711;
        Wed, 16 Apr 2025 06:02:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9wsYPT+6c9+boSi57I+AtUORFG3FYwgt7pZJ6LGypzmEPKLAlN+Ns+fQSlp2s4linq0dQsA==
X-Received: by 2002:a05:6000:1863:b0:39a:ca04:3e4d with SMTP id ffacd0b85a97d-39ee5b1123amr1685488f8f.7.1744808573232;
        Wed, 16 Apr 2025 06:02:53 -0700 (PDT)
Received: from fedora ([2a01:e0a:257:8c60:80f1:cdf8:48d0:b0a1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae963c15sm17545763f8f.13.2025.04.16.06.02.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 06:02:52 -0700 (PDT)
Date: Wed, 16 Apr 2025 15:02:51 +0200
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: Peter Hilber <quic_philber@quicinc.com>
Cc: virtio-comment@lists.linux.dev, Cornelia Huck <cohuck@redhat.com>,
	Parav Pandit <parav@nvidia.com>, Jason Wang <jasowang@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	"Ridoux, Julien" <ridouxj@amazon.com>,
	Trilok Soni <quic_tsoni@quicinc.com>
Subject: Re: [PATCH v8 0/4] virtio-rtc: Add device specification
Message-ID: <Z/+qe+tyH5EGaIXq@fedora>
References: <20250306095112.1293-1-quic_philber@quicinc.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250306095112.1293-1-quic_philber@quicinc.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -hrsHvwp-n43DRxmFVDCYbU0DPXyHJZaC_ZXudqyqo0_1744808578
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Peter,

I only now had time to share my comments. I could not cover all the
patches though. These are minor changes. Apologies for the delay.

Matias

On Thu, Mar 06, 2025 at 10:51:08AM +0100, Peter Hilber wrote:
> This iteration of the spec should address multiple review findings from
> Matias Ezequiel Vara Larsen.
> 
> Summary
> -------
> 
> The RTC (Real Time Clock) device provides information about current
> time. The device can provide different clocks, for the UTC or TAI time
> standards, or for physical time elapsed since some past epoch. For UTC
> clocks, the device can also indicate how leap seconds are handled. The
> driver can read the clocks with simple or more accurate methods.
> Optionally, the driver can set an alarm.
> 
> Changelog
> ---------
> 
> v8:
> 
> - Explicitly describe alarm enabled status, where relevant (Matias Ezequiel
>   Vara Larsen).
> 
> - Reword multiple sentences and requirements (Matias Ezequiel Vara Larsen).
> 
> - Drop unnecessary or redundant requirements (Matias Ezequiel Vara Larsen).
> 
> - Change word order from "field X" to "the X field" (Matias Ezequiel Vara
>   Larsen).
> 
> - Change word order from "flag X" to "the X flag" or "X".
> 
> - Move requirements to serve alarm expiration events before requirements
>   about stopping to serve (Matias Ezequiel Vara Larsen).
> 
> v7:
> 
> - Remove leap second and performance indications from struct
>   virtio_rtc_resp_read_cross. Remove backing definitions.
> 
> - Move wording change which was mistakenly placed in last patch to first
>   patch.
> 
> v6:
> 
> - Make leap second status information optional if the clock smears (or
>   might smear) leap seconds.
> 
> - Do not use union for leap second indication.
> 
> - Improve wording.
> 
> - Refer to the new POSIX.1-2024 for UTC epoch definition.
> 
> v5:
> 
> - Change structure and wording to support adding shared memory like
>   vmclock [2].
> 
> - Add dedicated clock types for UTC leap second smearing (David
>   Woodhouse).
> 
> - Extend leap second indications.
> 
> - Replace VIRTIO_RTC_SUBTYPE_ by VIRTIO_RTC_SMEAR_.
> 
> - For Arm Generic Timer, only support Virtual Count Register (David
>   Woodhouse).
> 
> - Rename MONO clock to MONOTONIC clock.
> 
> - Harmonize bit widths with vmclock [2].
> 
> - Change formatting.
> 
> v4:
> 
> - Distinguish UTC clocks with and without leap smearing (David
>   Woodhouse).
> 
> - Add UTC leap second and TAI offset indication (David Woodhouse).
> 
> - Add clock performance information (David Woodhouse).
> 
> - Drop distinction of Arm Generic Timer virtual and physical counter.
> 
> - Change requirements so that driver can reset alarm to clean slate, and
>   document how driver can achieve this (Cornelia Hell, Jason Wang).
> 
> - Device should assume that driver reads clock from first vCPU (David
>   Woodhouse).
> 
> - Driver should read clock to confirm that alarm has expired.
> 
> - Require driver to set unused flags to zero.
> 
> - Require device to support all expressible alarm times.
> 
> - Formatting and wording improvements.
> 
> v3:
> 
> - Address comments from Parav Pandit.
> 
> - Add an optional alarm feature.
> 
> - Various other changes.
> 
> v2:
> 
> - Address comments from Cornelia Huck.
> 
> [1] https://lore.kernel.org/lkml/61364452-bdf5-4bd8-adb1-a9e6236c9d26@opensynergy.com/
> [2] https://lore.kernel.org/lkml/20240708092924.1473461-1-dwmw2@infradead.org/
> [3] https://lore.kernel.org/all/78969a39b51ec00e85551b752767be65f6794b46.camel@infradead.org/
> [4] https://lore.kernel.org/lkml/20241219204208.3160-1-quic_philber@quicinc.com/
> 
> 
> Peter Hilber (4):
>   virtio-rtc: Add initial device specification
>   virtio-rtc: Add initial normative statements
>   virtio-rtc: Add alarm feature
>   virtio-rtc: Add normative statements for alarm feature
> 
>  conformance.tex                         |    2 +
>  content.tex                             |    3 +-
>  device-types/rtc/description.tex        | 1100 +++++++++++++++++++++++
>  device-types/rtc/device-conformance.tex |   13 +
>  device-types/rtc/driver-conformance.tex |   11 +
>  introduction.tex                        |    6 +
>  6 files changed, 1134 insertions(+), 1 deletion(-)
>  create mode 100644 device-types/rtc/description.tex
>  create mode 100644 device-types/rtc/device-conformance.tex
>  create mode 100644 device-types/rtc/driver-conformance.tex
> 
> 
> base-commit: 124fcd0e97f209aab19639e7369116d99ede22a2
> -- 
> 2.43.0
> 

