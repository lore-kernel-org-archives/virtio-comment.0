Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945197F490
	for <virtio-comment@lists.linux.dev>; Tue, 21 May 2024 14:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716300773; cv=none; b=gQFbK0y+rGYnxIZDoGFzcubVnHDidANJ1exwSnZsj4XkDxW6K5Ayj3QTt/ppvaSROuJr8bkNiPGlqJ3LPrL4dfrRk8oYDKCCJU3hI7LnYhgsbsbXcxflXXpnvIS9Nuc0q17VpddffVU1VbVPNSdYSo/4chInagvkR2LfXD5dh0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716300773; c=relaxed/simple;
	bh=ZfFX+jHQ403UD/xGYI0qpO9ijYnR8eO0yjOsWa/S1k8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RW/TDHYuBQj2oPqB997kpUwacgkr8eBObqlDutDoGzJ/xRlsGsDTaJa/YBp3hm9F/uT/lxdVIaOBN02IidNRZeLObdoM+dfPZaaes6XJClXKo2l1B3veXW974woFi1r7j8pec4laWm572rQlntHHaMjKxy5HXGtfGxGyhpTa3J4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ad+9rArT; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ad+9rArT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716300770;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=idMqshsm9yvK5UtSLcTaDN7vxyLHyVLifZukVue9uJw=;
	b=Ad+9rArT6FtAgUOIC1LF16xwWoVVvyupX9v4heJacp0IWpxDv8u6io6qWIP8Y3C5Mjk7yh
	yJfSAPqDxyP13kpMGgL+9dG3utBPr67wlYG/WqjNWS9uQGVruMkxU2eLPwSpV15chHBi7v
	8sjv058/8wCOFqOJdZunfr0Jxc0rsqY=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-510-Tzwn4NgANwS08C8-438_-g-1; Tue, 21 May 2024 10:12:49 -0400
X-MC-Unique: Tzwn4NgANwS08C8-438_-g-1
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6a0e1d67928so161161576d6.3
        for <virtio-comment@lists.linux.dev>; Tue, 21 May 2024 07:12:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716300769; x=1716905569;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=idMqshsm9yvK5UtSLcTaDN7vxyLHyVLifZukVue9uJw=;
        b=qLxfZQrY4zPsuKVPF/fF/WpfqlRhQJkHs3gd3Dvx6CeB2rQsjOI1NH1fBSHlHmJuO4
         QzCyT6SrVrLN/djv7AQArVJMRH+hGzSlPXiWiEoIuS9zvK/4Am103P1h8hzNi6WQzPKI
         b8izt+1Z8P06i2HlMbSaFzvmJ9XDTdN3xIO7/wCONhjyfDatxLGSSg4yU8EQtCtDXX2D
         kUxFlG+JihVAi/LgCovnJPNqy8tAA8c6GMy4OTHOpEhJ4EtI0EHWix/TaO2QQ9I3yvzh
         E9Hf0bFcdWDgPzUK/wlNSf7IUKMQDkGRGrfH8bPmSM3pVjk6W7T99Wj0tAWa55qhCKI1
         2WhA==
X-Gm-Message-State: AOJu0YxXUlZTuUix+IsbFweri/FZS5ZUV24Dcs2lyPKjiJ9jxo5nfxBC
	3DzjXWeJMai5D2eUIDIcEKdPUOonpx2lkO8lmD5UyHXk2JSR8xjuTEWIjSg60WCvhy1lMTXQxgY
	cRnlYm6lMvWoFW8Xc0jC75GyrWFJCgF4hMTFFWXZK6YsC9LXGTiOVzUu8GjrYDfm7sIVVTONnC5
	Z+HdpYpt20PufHrJ6zbGXIwaDqyzYr4f5XN5sG8PWe8L63tDGhgak=
X-Received: by 2002:a05:6214:3a85:b0:6a0:936e:4f93 with SMTP id 6a1803df08f44-6a168243ff1mr396577696d6.60.1716300768857;
        Tue, 21 May 2024 07:12:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFE3ikCsNEdEy10l1MnH8F0WIn6Wc1T3HYWOY8ulhhBnWBAi6G0Yx9qB6fZW/+2OrONXg5VIg==
X-Received: by 2002:a05:6214:3a85:b0:6a0:936e:4f93 with SMTP id 6a1803df08f44-6a168243ff1mr396577326d6.60.1716300768378;
        Tue, 21 May 2024 07:12:48 -0700 (PDT)
Received: from fedora (lmontsouris-659-1-55-176.w193-248.abo.wanadoo.fr. [193.248.58.176])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6a15f1cddd9sm123303456d6.75.2024.05.21.07.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 07:12:48 -0700 (PDT)
Date: Tue, 21 May 2024 16:12:45 +0200
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: virtio-comment@lists.linux.dev
Cc: harald.mommer@opensynergy.com, mvaralar@redhat.com
Subject: [PATCH] virtio-can: rephrase notification mechanism
Message-ID: <Zkyr3eaCOctSn7BD@fedora>
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

Rephrase the notification mechanism.

Signed-off-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
---
* This patch applies on top of virtio-1.4, which has not been released
  yet.
---
 device-types/can/description.tex | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/device-types/can/description.tex b/device-types/can/description.tex
index 2511d9c..2931aa9 100644
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
+used. The device may omit the configuration change notification as the
+configuration \field{status} change is requested by the driver. The device
+marks the request used when the CAN controller has finalized the transition to
+the requested controller mode.
 
 On transition to the STOPPED state the device cancels all CAN messages
 already pending for transmission and marks them as used with

base-commit: 37c6a406678a5ee891fdf5671298cb4fcfa517f2
-- 
2.42.0

