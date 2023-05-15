Return-Path: <virtio-comment-return-5921-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EE0FC77B75
	for <virtio-comment@archiver.kernel.org>; Mon, 15 May 2023 20:35:32 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 5A52D1EDCC
	for <virtio-comment@archiver.kernel.org>; Mon, 15 May 2023 20:35:31 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 474439865B2
	for <virtio-comment@archiver.kernel.org>; Mon, 15 May 2023 20:35:31 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 374F2986243; Mon, 15 May 2023 20:35:31 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 57005986510
	for <virtio-comment@lists.oasis-open.org>; Mon, 15 May 2023 20:34:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684182845; x=1686774845;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mTwbkSnAutP0/s8Th/OIgXgwsk0t6sn2vjCwpk4liEU=;
        b=ZnVjYB0hIucV5dqchAwAPthU/TiSdcDgRHNMSPSAYwsp0/7xvuziK7QBwflLHgfPS0
         NXQ0ApfayU08QzN+Df/Dm0aiOq0a1dZWvGABlvK3zMYT4Z09htv9i4dJBsMl3wMoZk1R
         H+xwgXCM92uDfyB4fkcPiysQm0xdNEs4BMXJ+ex8qBJBpEqISKWo23PcPykOI8dJQ3lO
         zgi1XMHR2m+TiSGM3Vqq27zHKQ2rLsj+KRhgaoY60CxjDWQyVCxUVc18XJTX2eyqd93K
         jbIGhtQ5xOBF5BKOfm3PAH5rWr2Yaan3hikbdHlDvNrt3vflANoobdib0ywPBH8JuwQV
         62CA==
X-Gm-Message-State: AC+VfDyZrHk/lIRaRE+N3zhRktoBMnUbR1FSDkY9FeP6dWsCiU1C4UEd
	21TzlbyIxniCdku10JJUJLAAW1Dz0t7TKMqtalDky5gp9yo5TXMMzZ2kKw==
X-Google-Smtp-Source: ACHHUZ69lzDf533EgUhGHfPL+wjbXaojqvWyMI9mmV7NhMObvepFA9nsz5GRU+pq25mjTRI16IApgiok7kgYKPNNWe0=
X-Received: by 2002:a7b:c3cf:0:b0:3f4:21cf:b4a4 with SMTP id
 t15-20020a7bc3cf000000b003f421cfb4a4mr19618692wmj.20.1684182844983; Mon, 15
 May 2023 13:34:04 -0700 (PDT)
MIME-Version: 1.0
From: "T.J. Alumbaugh" <talumbau@google.com>
Date: Mon, 15 May 2023 14:33:29 -0600
Message-ID: <CABmGT5Hv6Jd_F9EoQqVMDo4w5=7wJYmS4wwYDqXK3wov44Tf=w@mail.gmail.com>
To: virtio-dev@lists.oasis-open.org, virtio-comment@lists.oasis-open.org
Content-Type: text/plain; charset="UTF-8"
Subject: [virtio-comment] [RFC PATCH 0/1] virtio-balloon: Add Working Set Reporting feature

This is a proposed spec expansion for a Working Set Reporting feature
in the balloon with driver patch here:

https://lore.kernel.org/linux-mm/20230509185419.1088297-1-yuanchu@google.com/

with device implementation here:

https://lists.gnu.org/archive/html/qemu-devel/2023-05/msg02503.html

It describes the requirements for a VIRTIO_F_WS_REPORTING feature bit
on the balloon device.

Motivation
==========
When we have a system with overcommitted memory and 1 or more VMs, we
seek to get both timely and accurate information on overall memory
utilization in order to drive appropriate reclaim activities. For
example, in some client device use cases a VM might need a significant
fraction of the overall memory for a period of time, but then enter a
quiet period that results in a large number of cold pages in the guest.

The balloon device has a number of features to assist in sharing memory
resources amongst the guests and host (e.g free page hinting, stats, free page
reporting). As mentioned in slide 12 in [1], the balloon doesn't have a good
mechanism to drive the reclaim of guest cache. Our use case includes both
typical page cache as well as "application caches" with memory that should be
discarded in times of system-wide memory pressure.

Working Set Reporting
=====================

Working Set reporting in the balloon provides:

 - an accurate picture of current memory utilization in the guest
 - event driven reporting (with configurable rate limiting) to deliver reports
   during times of memory pressure.

The reporting mechanism can be combined with a domain-specific balloon policy
to drive the separate reclaim activities in a coordinated fashion.

TODOs:
======

 - There are some small differences between this spec and the
   implementation in the data exchange protocol in the device. We wanted to
   get feedback on this diff at an early stage though, rather than get every
   piece nailed down with precision.

References:

[1] https://kvmforum2020.sched.com/event/eE4U/virtio-balloonpmemmem-managing-guest-memory-david-hildenbrand-michael-s-tsirkin-red-hat

T.J. Alumbaugh (1):
  virtio-balloon: Add Working Set Reporting feature

 device-types/balloon/description.tex | 228 ++++++++++++++++++++++++++-
 1 file changed, 227 insertions(+), 1 deletion(-)

-- 
2.40.1.606.ga4b1b128d6-goog

This publicly archived list offers a means to provide input to the
OASIS Virtual I/O Device (VIRTIO) TC.

In order to verify user consent to the Feedback License terms and
to minimize spam in the list archive, subscription is required
before posting.

Subscribe: virtio-comment-subscribe@lists.oasis-open.org
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
List help: virtio-comment-help@lists.oasis-open.org
List archive: https://lists.oasis-open.org/archives/virtio-comment/
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

