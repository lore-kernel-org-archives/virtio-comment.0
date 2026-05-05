Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E343D481FC8
	for <virtio-comment@lists.linux.dev>; Tue,  5 May 2026 16:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777997289; cv=none; b=hPH8fQAcaM06GVmp/KQQoaShCZ4BjphUKknzbLfXDBb0Fwy8EADZCGUozKRxvA2yHpn5d7LTGe/TZHWDFj7VNsfCMLMDglQXyegKo2IU65tvERIwPdK3xjpfraLYbZQwO2W4JOxvgOsyHYj+gpzXSr4VWsv6pE9Fh6ATyvtizh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777997289; c=relaxed/simple;
	bh=SxWIiuyCcsJFZdcsadSL5NXowynVMvhlmeoBZBtLTP4=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=txp5Ao81hzfVHYHrDhRgaVpzrQ3jfYZbtQCy2Iyyb1SFcnRWmnZGn3gJY0DlFjpsZpPxGVdU/KpOLVpsUT9esVjmPB+J2p/TtYBe0s5lLHg/HK4DA7MPfLlrYUpelQL1eMM7tBxJT2/2bgtbMCFh0PawfRQfLHbwxQPyyM/g6NA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UpnFZ1cV; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UpnFZ1cV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777997286;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=rhIWRR+CQik4kDy63j1CD+jdK84X6Tu47uRJIPsjKx0=;
	b=UpnFZ1cVJCoYM75Im+NM1RVhRXXUNn7NzmkadOJ6zSsS67VS5kwYr8cejxr8iI7B+wJPMy
	ceEpynLJ72m98x24+UhJB91oDMP2vt/IsbVJue3zVSYN5pF7tQbznLaEJmDofJCMyWhoHE
	Oc3WncQfJDDr82oidnOaIFuB5r9xIA4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-607-okFAirakPiWRoviL4Y7emQ-1; Tue, 05 May 2026 12:08:05 -0400
X-MC-Unique: okFAirakPiWRoviL4Y7emQ-1
X-Mimecast-MFC-AGG-ID: okFAirakPiWRoviL4Y7emQ_1777997284
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-48a589c7879so94375e9.1
        for <virtio-comment@lists.linux.dev>; Tue, 05 May 2026 09:08:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777997284; x=1778602084;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rhIWRR+CQik4kDy63j1CD+jdK84X6Tu47uRJIPsjKx0=;
        b=Q81Q7K03UVCOj3rUh05//mKGnX+BXyph3DfJMZOz4iochmH3Ph4GJCovmAd5eaD8TO
         dkNNF10ar0PIP+Wk4FdaUoAf3bi1estajEn71sxff5sQFod+NOvtru6q+2oYnnnfMYep
         maDTxcJlnEQQwSocQ1WrfK5N4jA6Oa23iio6+XpfxtHYS8rX0NGO9P3QzwvLN0MQ20ju
         yzWahs5rUCU8XJKHaqo0FC1XVrf6bt7GKD9A4dnArqZPF5dg6zYA1Ff7lPViBOdDVLcX
         3PN3hjOfN4cFLidmwSmJsh77FVEp9u9SusUkwXoOc9t+eWV48kptTNGuYmxEqOlvEqFU
         W4sw==
X-Gm-Message-State: AOJu0YxF0dqlrTq8WPP116phtHUBK5oeAwQJtb/CBS3Kac+Wj301mDjQ
	v1utXb0b71yeYVfUTyCumoD23VJqfb1GD4DVJK17VLmjw1iWWAX3a+aiLO7z8JVYEfthNY0t9cB
	Xm1vsr1BJmGk9pymMqMOOibkL3iannmE5EQaocIYkBDltLpie3eKRdZ9U86CWERz4VDJYjFyZpB
	vVqNA3LapmwpUwG0w10lRYIUd/Yd79XuXUQRTiIvgml6GS0g==
X-Gm-Gg: AeBDievZKeSy72uZYvyADp6dl8IQcaTmEToJbCd9oGmwFvidl7z7VRdaE9nu4aTSKd3
	XmRut7cDRA+4mhcAA1XIf5qR5TheJ+zjAa1imw+/X4CF4bJkFR4QHCLl5c7A2JqAWCYMWNfV0tD
	/BNraoukUOlT7pVpOppAmStw7UM6KxOBiSPpaPCIkIbYTcs4aKsTihInFv8cHDb2JhBh9u+s+PL
	EHD/1/hB2X964nqgk7kl2EraWwtFOXD42nrm2bs5buQqXXG8kYYIU7EfBkSaP4ENFzAQHjGJOLp
	nu8CiD7qoCZsH31MMTmgiEDSnTPS3dJIiNzavkEgvuAeqBOuElPEnQRdNWqGapaAVer2EDf1DKX
	yQPKpF0KVsFeYUZFywZIfDPsm6an5KILAHDPGP3IQmAwpp+PWi4sZsnmw
X-Received: by 2002:a05:600c:3152:b0:489:1d7a:4537 with SMTP id 5b1f17b1804b1-48d1422bafamr70422325e9.3.1777997283699;
        Tue, 05 May 2026 09:08:03 -0700 (PDT)
X-Received: by 2002:a05:600c:3152:b0:489:1d7a:4537 with SMTP id 5b1f17b1804b1-48d1422bafamr70421345e9.3.1777997283025;
        Tue, 05 May 2026 09:08:03 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-47-179.inter.net.il. [80.230.47.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8ebc4201sm577928725e9.15.2026.05.05.09.08.02
        for <virtio-comment@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 09:08:02 -0700 (PDT)
Date: Tue, 5 May 2026 12:08:01 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: virtio-comment@lists.linux.dev
Subject: [PATCH v3 0/2] balloon: DEVICE_INIT_REPORTED and
 DEVICE_INIT_ON_INFLATE
Message-ID: <cover.1777995753.git.mst@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OHeA3tM5zU_F_dNAjzeTbCaiOb9r_fWhXjS4CV5u8_M_1777997284
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


Old implementations (new ones will be posted ASAP):
QEMU: https://lore.kernel.org/all/cover.1777824548.git.mst@redhat.com
Linux: https://lore.kernel.org/all/cover.1777803445.git.mst@redhat.com

Tested with QEMU + Linux guest: 232ms -> 51ms (-78%) for 256MB
page allocation in a 2GB VM.

Changes since v2:
- I realized we can't really avoid a new feature bit:
  poison is a promise from driver to initialize pages.
- lots of other changes

Changes v1->v2:
- reporting can actually just utilize used length to see what
  was initialized! so we do not need a bitmap for that.
- qemu really needs a way to skip init for some pages.
  Add that to inflate path.
  Add security considerations (for coco).

Michael S. Tsirkin (2):
  balloon: add VIRTIO_BALLOON_F_DEVICE_INIT_REPORTED
  balloon: add VIRTIO_BALLOON_F_DEVICE_INIT_ON_INFLATE

 device-types/balloon/description.tex | 147 ++++++++++++++++++++++++++-
 1 file changed, 145 insertions(+), 2 deletions(-)

--
MST

