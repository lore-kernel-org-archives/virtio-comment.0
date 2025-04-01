Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52DEF1F2C34
	for <virtio-comment@lists.linux.dev>; Tue,  1 Apr 2025 13:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743514560; cv=none; b=pjlcV2NbjhdlDr6ubxgcYcH6gR6NKX6EZmjB3pehafaPANZQhLKASPERuCR8zeEhEUmkoHwE99ATfzAdJxafnuvJ4sf7wjZcvR3UatgYiYuQd6Dqjxq9ib5m5kp4NGXi/BQrG5luq43D/2DF71XKeQ/HBjHDsMYmyt5lmLaiyz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743514560; c=relaxed/simple;
	bh=hi4whXkvQgj5Z+Jt2UacBTaExGC+hh1MhOhpSfVAldQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WsgUj4sjNdr6mq+JIUgn7RESuZrO5ZjwMdQofJjjcW2Phq6vBGM7yYc9SGMP34ol+lL8CAivPdfRjd/T8OQwJhLGNHEho0lzeWirN2gGLZYstq0zlRUi3vMpkT4jMYZT4dh1ixulVOCW+AlwTCM1+tGEqRCVmzSVA6hgOnHkhYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KU5Yuz8X; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KU5Yuz8X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743514558;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mJfBtDMQnHOe6jESLn6KxtTX550nupjnIafEOFWGthc=;
	b=KU5Yuz8XRuxQscAzOEnEbYvJLFdI5mNFVX12RyoAq4F2hgeZK0Fieryq8wcPOC5xp1TWJp
	y/RxFCHr4yb9ShC68N6xifk173KwEg/GGcIyk1Pxz+WwpcOUEpuxrOot3W5CHjX7oM9KBZ
	nm5A5SxeIXBjL0CVbmf0yTNCXlGNlMg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-471-cK3rekDXMz2qFpkKuoFwMg-1; Tue, 01 Apr 2025 09:35:57 -0400
X-MC-Unique: cK3rekDXMz2qFpkKuoFwMg-1
X-Mimecast-MFC-AGG-ID: cK3rekDXMz2qFpkKuoFwMg_1743514556
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43d209dc2d3so32762555e9.3
        for <virtio-comment@lists.linux.dev>; Tue, 01 Apr 2025 06:35:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743514555; x=1744119355;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mJfBtDMQnHOe6jESLn6KxtTX550nupjnIafEOFWGthc=;
        b=PEGlcIeyQs1HwjHrBEGUkYoSKs7yzP0pm9XhIfqZWz9huwUggTAslqTmA8xQ79Zo2r
         oMTSb1D5R6qxpUBto8JP5ujt0zgOgYNI+YNlwTD296bD5wHHLn/Pdru0d79CmHg3DriF
         MxsI/of45g3gVDB0/g4VuE6meSbDMVtGGk/oKfCbTZa9cZQLPjoAeiejz3a1QO2LCynY
         qK0nWkG249cck7TCAEyAFgrxI5IwDRkTRxQLNMpiFFJ1kj9BRZuNdmXNtUqZUCTLlw20
         Ao8T01apUG0wPrJTXx5GTIecbhWzykMudbUYUPApHrPgZ5xjCkff6bz9y2d9opQl1z8z
         KbRQ==
X-Gm-Message-State: AOJu0YyFYqMlN9hwTAgQKi1HF7Dv4pp+A4ahLrLDAj59o9UvnSebTjjP
	HRJTox90ZecLa9Ktj5Jrh+sC41yv6lccMQofwdJxlKPJkYoYLcyhkKupdyYcopDWG9AbjQbgELN
	slkHOE/hSj/KggIb3nNZoHDj3Uztu43+YFlez36oERyHnmUYQrZrVBLDcC9naxX+NrnCyMkjFaM
	c7FiuRc8uD/KCJ3oPGVbO2sk17IM/64JHIhX6/E2Tlx+6NUbI4
X-Gm-Gg: ASbGnct4Vt62HIyEmT0xm4bVWI5uMSCo+ldAphkUvPyMmGIr3dEWzweixtjb/2CFU5h
	f3SuqqqRf9MXqJ5nHtyUNYPoZfOdvoZfDPmfuobUcGe+iDS7UEjZh1t2bGxPMMeAOH48D+OhUlL
	G+vOgWnvkUwSKtLQIyCrDTxjSClvK8KIMYgI1oZbk0m6mpthkrGp3OGpTQ9qZUxDGTkOLeCtn/q
	e9Sr2LUE/1z2Q6j5+0UR4S5U+g5Cu5NarcPwSqjeS8N8LtHMTHklGnuwJlQoXzq0vHD7ywIWgWa
	Pjp6favSdUWxj39DFsg=
X-Received: by 2002:a05:600c:4fd0:b0:43c:fab3:4fad with SMTP id 5b1f17b1804b1-43ea9d8dc3fmr26378835e9.16.1743514555334;
        Tue, 01 Apr 2025 06:35:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEOK2cQgoPkUi2JLurxTx8kBXzUfY8WR7p923jJywPML882UNPO4XsmCDo1FHDR2AlySgLB6w==
X-Received: by 2002:a05:600c:4fd0:b0:43c:fab3:4fad with SMTP id 5b1f17b1804b1-43ea9d8dc3fmr26378545e9.16.1743514554873;
        Tue, 01 Apr 2025 06:35:54 -0700 (PDT)
Received: from localhost ([2a01:e0a:257:8c60:80f1:cdf8:48d0:b0a1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82efe389sm198315635e9.19.2025.04.01.06.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 06:35:54 -0700 (PDT)
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: virtio-comment@lists.linux.dev
Cc: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>,
	cohuck@redhat.com,
	mst@redhat.com,
	parav@nvidia.com
Subject: [PATCH 00/13] Backport 1.4 fixes to 1.3
Date: Tue,  1 Apr 2025 15:35:00 +0200
Message-ID: <20250401133543.801184-1-mvaralar@redhat.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Ysm5tCg-ZxmWS1mF4Qkb2153zb_K-57bn0aJy6RokN8_1743514556
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Backport commits from 1.4 branch into 1.3 in preparation for releasing
v1.3.

Haixu Cui (1):
  content: Rename SPI master to SPI controller

Martin Kröning (1):
  virtio_pci_cap64: specify offset_hi, length_hi endianness

Paolo Abeni (2):
  virtio-net: clarify NEEDS_CSUM semantic for GSO packats.
  virtio-net: clarify DATA_VALID semantic for encap protos.

Parav Pandit (8):
  conformance: Add missing virtqueue reset conformance references
  packed-ring: Change host,guest to device,driver
  description: Avoid splitting the word virtqueue
  virtio-blk: Fix data type of num_queues field
  virtio-net: Fix receive buffer size calculation text
  virtio-net: Clarify the size of the struct virtio_net_hdr for tx
  virtio-net: Annotate virtio_net_hdr as field
  gpu: editorial: Fix spelling errors

Steffen Trumtrar (1):
  virtio-net: Fix receive buffer size typo

 conformance.tex                  |  2 ++
 content.tex                      |  2 +-
 device-types/blk/description.tex |  2 +-
 device-types/gpu/description.tex |  6 ++--
 device-types/net/description.tex | 52 +++++++++++++++++++++++---------
 packed-ring.tex                  |  4 +--
 transport-pci.tex                |  4 +--
 7 files changed, 49 insertions(+), 23 deletions(-)


base-commit: b495841a8e80d12c1130f8868f4128866291142d
-- 
2.42.0

