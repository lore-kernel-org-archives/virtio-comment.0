Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3917012EBC2
	for <virtio-comment@lists.linux.dev>; Thu, 13 Jun 2024 15:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718294374; cv=none; b=WN8SREtVw2c2GJX8NIfIZl+aLz6qIwAtJBXTiaHCPpGY5nugzruRkJd2zk8D761/BWmucTZK+Tmg2OrdFYA+VEHZPYV9tVfA3CsJiUnsznc34JcapLApUg2xuYHtWyB2nAULi1nUx9zzIT9eZEa8tnM1bL7vHS8reYIZja2iqqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718294374; c=relaxed/simple;
	bh=PSN1zeua1/0HUmiKy+t1QI3ooTisuZ7l1+Qde9p3YGM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=crBrrtNYCRdx/lJPLTPkpsYnXDc0tzFp5jfTxpUA+Mm5k38DDuIVs6SdczTjLxC1HlwRG5SuVqNe/GQj2LVEU+34ZfaggKRCApylZrQ15u0qlwlEL/eYdEd+3Ceo3wBpBLpXnMB9o0UE0g+k+emWGMVdOSDZfEkWMtYhH3DjFEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=B/AWlmUD; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="B/AWlmUD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718294372;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=KTTDBHBwqq0uc0b4pVuAg1IkkeDD6OiuHpplC4vCXKs=;
	b=B/AWlmUDq4adIXcvTSJJ0MHaxyIdaGnLLq0Wd3RaXnQ5MylRFXLb3HxpcFCW775rChbfZu
	5cW+cpfJPZu4XlJuoi9WggELGAGltAfuxxAvefbR4AUUXGZiFg6F2Bga43D+0eFBXLZGKB
	GEKTFscnOgMpDwrV3jSXjxMF36K83Fg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-491-0oskhw5BNe-h77MBbEFYhA-1; Thu, 13 Jun 2024 11:59:30 -0400
X-MC-Unique: 0oskhw5BNe-h77MBbEFYhA-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4210d151c5bso8884685e9.3
        for <virtio-comment@lists.linux.dev>; Thu, 13 Jun 2024 08:59:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718294369; x=1718899169;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KTTDBHBwqq0uc0b4pVuAg1IkkeDD6OiuHpplC4vCXKs=;
        b=nbZIcT+bc7uxNNwUoyWcb80geSVT056vsjY3oTbb0uUXxwVz3P5NGnymfX/sqML+um
         0z/q1A9L/prehDX5Vxute+BE1O3AF36zJ2Tfky1NZnQPNfbOk0hIkNhh4QeSPsXpu2P9
         OhQ6boLxtJxBQ5YV11uh41assj07lemO37u12hMi9iEcKXWe8LNqSSf8IQbHWGCpClRd
         abMyCv/GiW7LK7Lk2xlnwTD6QRjHxm66Kken+R9+MJGi8P9L461BcjCgeSS/yisvnBee
         Ev3RFDifmtu1OHt0R9aZbMmaE7s3Dw5eHebw06aC4KlzaT6LwPmWYErJGhlZgVtB0GRE
         7LqQ==
X-Gm-Message-State: AOJu0YyG7MrCVmhFkSMVtUBjZWptRIDFzdYRNFB4T4MM3uI9nYXBTRhK
	SzhSIw1pWmBYHAzihGdXBxdJEXUUB75tUTcyUqKUrpDNDZ+6roG7R5PYsKL+gTwBdP/Mq4TV0Jh
	Hc4t/CzlZ2Yl/11wLnUO1IDAf/XwXyZHCCA6tKO9GIgWheN3fNHHOHAH2tnzyLx2qz4F0FRPDhe
	HGF9hEDYDbBzVFohX+QdUm2NQy1iu64Ut7hFFhLz4rXIxNHAqb+7E=
X-Received: by 2002:a05:600c:4ec8:b0:421:c932:f5e1 with SMTP id 5b1f17b1804b1-42304823318mr2293155e9.2.1718294369211;
        Thu, 13 Jun 2024 08:59:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHISZSG+tvWmFly9AmWry/WrqVSYXQ3g9jyw8cpWglM8c/LA3/tum9bS/lsjrMMjbHkqP7Q+A==
X-Received: by 2002:a05:600c:4ec8:b0:421:c932:f5e1 with SMTP id 5b1f17b1804b1-42304823318mr2292945e9.2.1718294368822;
        Thu, 13 Jun 2024 08:59:28 -0700 (PDT)
Received: from fedora ([91.217.96.69])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-423034f4129sm22060375e9.14.2024.06.13.08.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 08:59:28 -0700 (PDT)
Date: Thu, 13 Jun 2024 17:59:26 +0200
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: virtio-comment@lists.linux.dev
Cc: harald.mommer@opensynergy.com, mvaralar@redhat.com, sgarzare@redhat.com
Subject: [PATCH v1] virtio-can: rephrase notification mechanism
Message-ID: <ZmsXXumHlQXnU2Wm@fedora>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Rephrase when the device may omit to notify the driver due to a status
change in a more straight-forward way.

Signed-off-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
---
* This patch applies on top of virtio-1.4, which has not been released
  yet.

v0 -> v1:
    * Rephrase commit message
---
 device-types/can/description.tex | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/device-types/can/description.tex b/device-types/can/description.tex
index 2511d9c..b13da9c 100644
--- a/device-types/can/description.tex
+++ b/device-types/can/description.tex
@@ -128,13 +128,12 @@ \subsubsection{Controller Mode}\label{sec:Device Types / CAN Device / Device Ope
 \end{lstlisting}
 
 If the transition succeeded the \field{result} is VIRTIO_CAN_RESULT_OK
-otherwise it is VIRTIO_CAN_RESULT_NOT_OK. If a status update is
-necessary, the device updates the configuration \field{status} before
-marking the request used. As the configuration \field{status} change is
-caused by a request from the driver the device is allowed to omit the
-configuration change notification here. The device marks the request
-used when the CAN controller has finalized the transition to the
-requested controller mode.
+otherwise it is VIRTIO_CAN_RESULT_NOT_OK. If a status update is necessary, the
+device updates the configuration \field{status} before marking the request
+used. The device may omit the configuration change notification when the
+configuration \field{status} change is requested by the driver. The device
+marks the request used when the CAN controller has finalized the transition to
+the requested controller mode.
 
 On transition to the STOPPED state the device cancels all CAN messages
 already pending for transmission and marks them as used with

base-commit: 37c6a406678a5ee891fdf5671298cb4fcfa517f2
-- 
2.42.0

