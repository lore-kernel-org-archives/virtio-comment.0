Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A48F156F20
	for <virtio-comment@lists.linux.dev>; Wed, 16 Apr 2025 15:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744818216; cv=none; b=jKskfEhd3F4GL5p5Bw2KaJbnvIoSrTwNegE6qVSN76cLQDTzhBPjKuT9wZQN1fzquHRyNJDoxFtUFzT7hgnXGJYvz1R8Lf1Hxt63dW9VADQ2SAu9eF79oado4NgeSGv3VK3H6T3cEqCPcrfO8uiCbOTgHg0YGW3CA6WJaKSkuks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744818216; c=relaxed/simple;
	bh=q0JTitLyQiOHV+TJs7lLCCuA2k6TwXoziDnDRP8nHgQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=CBIeFnr4GzV/wT5ZnG8GCD2AV0nrSl1ABXmdGo5+2rQJFO8dllW582hEZoo9HkuhKjjOttgqRIwRWeZwo3iOpLYLlbG6TT+msOwHnZKhi9KQ24Wd3yzlPjHx8pKqR2yV8KC0MNiDtOnkTDE4O9LrkwIU/qCSLlRKvhgQMw4OlFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FRBhLoBJ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FRBhLoBJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744818213;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/+/JFMcRPxMtbGMwRkdiuiKFRkeuXtsbRNuNPEXYx88=;
	b=FRBhLoBJqS/AelIknAPvZZcdDlgv1//J0sahc31mb1SbfV3MgXTp0f3ibDM6hNv/hVekE2
	m32SxSERk6Cb6WmgOrseEtU46qTzi6z0dsvFxLA373lfAA3V8jkSxk9LgjIdeBcUAJjpHt
	eSLE5344cTrWei1GGtA4oV4D46Q7e6E=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-279-vgXfAfrZP4C4D9n9f5kj7g-1; Wed, 16 Apr 2025 11:43:29 -0400
X-MC-Unique: vgXfAfrZP4C4D9n9f5kj7g-1
X-Mimecast-MFC-AGG-ID: vgXfAfrZP4C4D9n9f5kj7g_1744818209
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-39c30f26e31so4670143f8f.3
        for <virtio-comment@lists.linux.dev>; Wed, 16 Apr 2025 08:43:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744818208; x=1745423008;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/+/JFMcRPxMtbGMwRkdiuiKFRkeuXtsbRNuNPEXYx88=;
        b=ATobDwJlykyutMPENWQwcPPo0DXepC/CRnj1InAD7lbrxC6gdK5GG8wANs6FXJe8Tc
         PBx7g++BE2BXtM7pK+QkYITR8m7psSSBgSWnqW6gywrifOw7AlUn3hxSt7H1qlL42rPD
         9yzxajYOqboYCakj61Qt7TTlNZDPprL8NzYK/mbKclILe1jZPYQ4luyRxYoq2Z+zoRbc
         T6R1PMNkvzkNBlDDqC4lK4XftX5kRuFxi0hHQCabeNwwIWxDigcCk5eP2rWiuPrWoLac
         h5xB0LclN4OvT5dUkAEufS6fAsLmXTFm7BxUQlA5laat6Z1ALvzOeUXDgrnGmAcK+wes
         Hipg==
X-Gm-Message-State: AOJu0YymwKprwfXFZ/OlPo4lGtJMImHIkKNEeIA3Z4QqDvMY6jLRmsrU
	lk+PkB87RKpV9TrsoTWPmlWwAZL89D40dlTzXIJ1TE7SriGzg63HByiB82sSXI62XNsWX6rZRmN
	U8isPSMRYS2Wf3zVJg25FPTQ9lz5jPWYB8mCzsqSbkeCMJVgrHXkW8nF25BSrslrN
X-Gm-Gg: ASbGncs1tspdjZTSRMpH7dshs5cBCmvn12iC3j7qJmoA+HlxZhzfp3QcUNwXk4MmE8M
	mCeKiiywcKC0xZmy71VDe2TTD9iEg4eC2iLcybcKeY0kny7w+2DbPFB2vXt1uw+/8fNl+h/6CSG
	PUlp1b7c33WcsQ3V+O/pSYLu4afDP8N8W0anXGd2F8AVq9jmcVpmD6RFpxfUmRGAMPli51aCDIB
	ejLOcW64fAjs7d4oYpREgdLPnFuJQWbsUxXDcv1JMpDgWEtn63NTTrg+wcF8wDCFQN01pHflw3e
	4y03dw==
X-Received: by 2002:a5d:5848:0:b0:39c:2678:302e with SMTP id ffacd0b85a97d-39ee5b99257mr2531072f8f.45.1744818208538;
        Wed, 16 Apr 2025 08:43:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEG2s0kOWMUoFNsuxEm1HEsF2y2m/i4jiuhjtFHzoyze1UBVAtrWvrnLbysf0biBKUNi1X23w==
X-Received: by 2002:a5d:5848:0:b0:39c:2678:302e with SMTP id ffacd0b85a97d-39ee5b99257mr2531042f8f.45.1744818208095;
        Wed, 16 Apr 2025 08:43:28 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae9640bcsm17326118f8f.1.2025.04.16.08.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 08:43:27 -0700 (PDT)
Date: Wed, 16 Apr 2025 11:43:25 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Hilber <quic_philber@quicinc.com>
Cc: virtio-comment@lists.linux.dev, Cornelia Huck <cohuck@redhat.com>,
	Parav Pandit <parav@nvidia.com>, Jason Wang <jasowang@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	"Ridoux, Julien" <ridouxj@amazon.com>,
	Trilok Soni <quic_tsoni@quicinc.com>,
	Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Subject: Re: [PATCH v8 0/4] virtio-rtc: Add device specification
Message-ID: <20250416114208-mutt-send-email-mst@kernel.org>
References: <20250306095112.1293-1-quic_philber@quicinc.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250306095112.1293-1-quic_philber@quicinc.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: r6GIVzQSYxWo5_eKg2n0fR6VyIBgB_kAiHvksP4W-xY_1744818209
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline



Good work. I sent some comments but they are pretty minor. Thanks!

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

A bit more text on the motivation, when to do you intend to use this
device, would be good.


> Changelog
> ---------

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

