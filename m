Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 382383128D7
	for <virtio-comment@lists.linux.dev>; Thu,  7 May 2026 07:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778140318; cv=none; b=DxIBMNbPuerePUdg9JkppcNG9tAVICDWdaiKtTBK0/UGzfzoJlwA91BR610wADxOWqrUlGutiyt7hoFWMPrno+81kinyDkbwG/WVNB4lhRCAGxWGiiNT1WedgLHmGe5VjegT1UgARbfycPAnboNdBj8LNlgGnROJbdL37fX9rxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778140318; c=relaxed/simple;
	bh=YPoJxOuvM2A9TaVrvSVQrUmc0lfmMtzT6Khmp43fj04=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iLF0ylgob6sAZwD41y9lkLvrhg7R2f5WFzvFvNIHvPJUYzsOvZStxtsN2HSjJg0xKZ477fdv+0UbDMBRzRVHVl/V2E8zyiMlGz6qfYnb8cYa/eUvm+Mv14w3iTKRWj2uLXus4b9HMVb4kTPuEEhtgoJABccP/xvkxq3+wgAieeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hIwZ8GGq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hIwZ8GGq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778140316;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=m+DIzfqfk2GCm4SZ2OMcUMt4skwsxYxN35yjRqVnSW8=;
	b=hIwZ8GGqudtwnRhc9aRB/qP6uDU6hUa0uX4Xh6jlgPa65P1c7OihuEAQR8lIU5WoQ0jkAx
	B0Ga82fjWBzLDd2WXAxr4eFocOYm8IU7ABMbC+Dp52/uiPiZavSUzCZ4tSjllf5px8TGkP
	/9ordDb8IfC+rAoz4aSrar3rC/d+mOw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-62-mFZNvuJoO4C9e0E6tsoNUA-1; Thu, 07 May 2026 03:51:54 -0400
X-MC-Unique: mFZNvuJoO4C9e0E6tsoNUA-1
X-Mimecast-MFC-AGG-ID: mFZNvuJoO4C9e0E6tsoNUA_1778140314
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-4411a69f565so501941f8f.2
        for <virtio-comment@lists.linux.dev>; Thu, 07 May 2026 00:51:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778140313; x=1778745113;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m+DIzfqfk2GCm4SZ2OMcUMt4skwsxYxN35yjRqVnSW8=;
        b=mRAGlH3I/SecIFz430bGquRnT98B3864rPW3dBvEpDMNo6EAdJJg47WAxMHjvcNjyL
         /9oFtRy8KjH2ii+yE35rhTQPhrqYWsGz0+1y6mrjWcQtUI+HqDerzzXv4gMil7gCxO3x
         W8P19adiny2NNBUuUTj9c+bw1MsfZPdbIFvESo6ER93Nd8RPVmeMJYH/vtcJExNxpVlD
         dgU88WG9yHX3rOmsDTYIyeFN/fUwHQJfz0+j7kvtZimckrnzrf/VOWOLm2goiXvb1fkC
         C+xOVMWvsy+DS2phEs25cGqgx4aS2jvS17LUM9Ly7bjENFhj1d/hABPr2ZGYdsHOUWzy
         /n7A==
X-Gm-Message-State: AOJu0YyjkPbamh6Gpky9/hMCtnsaL9JwJ8F4y9cxFJeB4DpxqJgG39dF
	ZAmLZO+HqOH9IAWKoEdYEXwko8/SFZeJXcGqweWM42C4LgQcsB7h4XIbdMDarAiVR1DYBHxFKYe
	+W9dXxF7hj30zvKt/D30Z23lm4gcpgvRyYyVWV9/MQeEBu1wbFV2Bp8ljVC95i8f+RQTgYWGUQ0
	hgHrnQiZkE6oi4LjRBVwDZUD9Wg38v3exSQIR/Dx1nu7Yh1g==
X-Gm-Gg: AeBDietIfEF/nicb4tfw9ZOmCLaSZEt8ag0SvtIbR1b7iSfdV/O3Zy/NFbl54Hy5ZuY
	Hbot+4FdYiWw+2pxeanHrxZQrn2bs+MvcvRjf81N4Fg6HKf8yiyIS1cIQJB27GMF8L08IsObItW
	qozBsJNG/xtuDzDdSvG5XsWFUCUMZl7smU3aiftIx1mDXk+vojT27N6gCkcvplgJXKNL+6R/OgX
	kzX8eXC9x2XvNK6O8LacMTU6sBsUhyx3coLod+FYQWiEXZX949ObFkKFMzMuOlUhMkSg97M3E6+
	9iHPHp701t7ncDSzSLD7R5OGkwIdU2zvCDn1GRW+NSkj90rtv3kTps9ZM96TL8xSrge83lRtgbV
	wsIbEpGXsK2+K+AASdePRvlqQnuO38ekPxGuTQScE70pKpWJjAY0=
X-Received: by 2002:a05:6000:1acb:b0:446:96b1:f53 with SMTP id ffacd0b85a97d-4515cf11d6amr11558576f8f.26.1778140313248;
        Thu, 07 May 2026 00:51:53 -0700 (PDT)
X-Received: by 2002:a05:6000:1acb:b0:446:96b1:f53 with SMTP id ffacd0b85a97d-4515cf11d6amr11558518f8f.26.1778140312627;
        Thu, 07 May 2026 00:51:52 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-48-7.inter.net.il. [80.230.48.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4505285e765sm17530174f8f.10.2026.05.07.00.51.51
        for <virtio-comment@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 00:51:52 -0700 (PDT)
Date: Thu, 7 May 2026 03:51:50 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: virtio-comment@lists.linux.dev
Subject: [PATCH v4 0/3] balloon: DEVICE_INIT_REPORTED and
 DEVICE_INIT_ON_INFLATE
Message-ID: <cover.1778140241.git.mst@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Xb4Uas-Xg0TXlk9gxRv56kKLwZS1C4H7UEm31eF7MnE_1778140314
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Once a page gets out of balloon (on deflate, or on access for
reporting) the Linux guest inits it before giving it to app.
It's a waste - the page is already inited by the host.

Add balloon support for skipping that, that provides significant
performance gains.

This adds two new feature bits for the balloon device that allow the
device to signal that it has initialized (zeroed or poison-filled) pages
on behalf of the driver.

The variant with poison does not really seem useful, so I am still
trying to figure out whether we should simply outlaw it.

Implementation:
QEMU: https://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git balloon
Linux: https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git balloon

Tested with QEMU + Linux guest: 232ms -> 51ms (-78%) for 256MB
page allocation in a 2GB VM.

Changes since v3 (insights after implementing):
- Added Security Considerations
- ON_INFLATE bitmap: allow device to write fewer or more bytes.
- Restore "or 0 otherwise" from v2 for failed PFNs within written bytes.
- Device MUST NOT modify a page after reporting it as initialized.
- Device MUST provide inflateq supporting at least 2 buffers.
- Qualify driver "MUST treat as uninitialized" rule with
  DEVICE_INIT_REPORTED (matching the device-side condition).

Changes since v2:
- I realized we can't really avoid a new feature bit:
  poison is a promise from driver to initialize pages.
- added clarifications for poison
- lots of other changes

Changes v1->v2:
- reporting can actually just utilize used length to see what
  was initialized! so we do not need a bitmap for that.
- qemu really needs a way to skip init for some pages.
  Add that to inflate path.
  Add security considerations (for coco).

Michael S. Tsirkin (3):
  balloon: add Security Considerations section
  balloon: add VIRTIO_BALLOON_F_DEVICE_INIT_REPORTED
  balloon: add VIRTIO_BALLOON_F_DEVICE_INIT_ON_INFLATE

 device-types/balloon/description.tex | 157 ++++++++++++++++++++++++++-
 1 file changed, 154 insertions(+), 3 deletions(-)

--
MST

Michael S. Tsirkin (3):
  balloon: add Security Considerations section
  balloon: add VIRTIO_BALLOON_F_DEVICE_INIT_REPORTED
  balloon: add VIRTIO_BALLOON_F_DEVICE_INIT_ON_INFLATE

 device-types/balloon/description.tex | 157 ++++++++++++++++++++++++++-
 1 file changed, 154 insertions(+), 3 deletions(-)

-- 
MST

