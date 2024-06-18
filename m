Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C8013A272
	for <virtio-comment@lists.linux.dev>; Tue, 18 Jun 2024 08:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718698750; cv=none; b=BOascvs01ymvlywJWV9v1NXdqA9mtaypAn94rmxBtNxVRg9eXnpCTqhfwSzMtaeWo2llYrTA4AAKsmnLBgQivnTDVwR1lGvk6crpS3HMyPSQI2c3tRMuJQOUCUGDNtXZlj3n/HSRdKDhT7Rezo+1LqSiz3tSNEkThb8aglMQC6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718698750; c=relaxed/simple;
	bh=Nsl19jd5IKnHtGpW4kkJW4IbGUNac/S+8xVpeTcVHB4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UhWijrCjh6WBaw/3gq4u4bB7q4Mjzim+hfxM2aKB/kMxOR0PNhJFN2JVsPQPMhyZBo8Yaw5aeP24XcCvE+DZJvfH6RL3xMvoLbUYjWqJ6uG93LkQF/R1vWrKmD7qXLPmax0BohnW3XR6Oe2Pm/pj6SEgsQ6z5R5jK4/NnM2sCo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Mao4QpCE; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Mao4QpCE"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1f717b3f2d8so43712695ad.1
        for <virtio-comment@lists.linux.dev>; Tue, 18 Jun 2024 01:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718698748; x=1719303548; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k12yptNyz7NhmCVXBegSaSHlVhI0jyXYPJJhxc4Y7W8=;
        b=Mao4QpCEktvs9TvNa+KX1zILgivGnirlar4z/ZS9FNX6Ax4Ay7VrhK99fDOYYk4+Iu
         1sqgfKal6FO7b7mEvO7RMgC9XEBcROX/Sqat3vEltvf/IBoZAgIXYAczaJDWgeTRO2HS
         zLowyJe51yMJgNn5zo0zJ4i6doLL2bcZbHpTU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718698748; x=1719303548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k12yptNyz7NhmCVXBegSaSHlVhI0jyXYPJJhxc4Y7W8=;
        b=Tsba3vEsmdcIEHy3VZXQxQRWopy/4F3nUG0ZxFqSIqS9L/HS6DZXS1K0XD+M+4wUjC
         uA550iqSBtDE30/NigbqJsro7K58ejaC1QgEcq7WXkJ6AwF6Wc+alRUi817bUoH2PMhx
         6BdOzmcJxEXJkwqw5uNXHsBsxvZou5x+sK4I6IJsJ27IaBJIaQsbqT9DJTLn0xkwH0rh
         CgD/9l+FRdusaC33JNx4/ihM0Sg6XKQoT2Olj6VFSi5PHE2D9zarvvTPrxW3k6Awit1y
         0yFoxL4nnChj58hlDS8i9l7RwZ9oBvYKsRIzK4GPfIycdol5sGIzpKjygXerErdDZUye
         puZg==
X-Gm-Message-State: AOJu0YykTNyoy/f/yxP4rKgpIX5uBgDrOlKimabZylBPd3Q1Zs/84f0K
	8m0qseXyMc3H2U4xJU2dB2rjKOYPYcoY4+UtzdUFNue4AVLYj7kq8fmo40nFJsZA3N9m6jQPb3G
	Vng==
X-Google-Smtp-Source: AGHT+IFwHjllEtz4cIczaefgQxoS8Zm+bVrp21YlcRWw0M1RzUT7FvAyl6zXtjTExy5QPQULyBIQmw==
X-Received: by 2002:a17:902:d510:b0:1f6:ee7b:6ecf with SMTP id d9443c01a7336-1f98b28f021mr29152865ad.34.1718698747796;
        Tue, 18 Jun 2024 01:19:07 -0700 (PDT)
Received: from keiichiw1.c.googlers.com.com (122.235.124.34.bc.googleusercontent.com. [34.124.235.122])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855f1dedasm92381725ad.248.2024.06.18.01.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 01:19:07 -0700 (PDT)
From: Keiichi Watanabe <keiichiw@chromium.org>
To: virtio-comment@lists.linux.dev
Cc: keiichiw@chromium.org,
	uekawa@chromium.org,
	takayas@chromium.org,
	dverkamp@chromium.org,
	tytso@google.com
Subject: [PATCH 1/1] virito-blk: Support NOSPC error
Date: Tue, 18 Jun 2024 17:18:58 +0900
Message-ID: <20240618081858.2795400-2-keiichiw@chromium.org>
X-Mailer: git-send-email 2.45.2.627.g7a2c4fd464-goog
In-Reply-To: <20240618081858.2795400-1-keiichiw@chromium.org>
References: <20240618081858.2795400-1-keiichiw@chromium.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a status code to indicate that the storage is full on the virtio-blk
device side.

This is useful in scenarios where a virtio-blk disk image is provided on a
sparse disk and the host storage is full.
In this scenario, the driver cannot create a new file to the disk image
because the sparse disk cannot be expanded.
However, if the host have a service that clean up host stroage regularly
by wiping cache files, the guest may want to retry the request.
For this type of special handling, this error should have a separate
error code in virito-blk.

Signed-off-by: Keiichi Watanabe <keiichiw@chromium.org>
---
 device-types/blk/description.tex | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/device-types/blk/description.tex b/device-types/blk/description.tex
index f04c932..5a34bd5 100644
--- a/device-types/blk/description.tex
+++ b/device-types/blk/description.tex
@@ -532,12 +532,14 @@ \subsection{Device Operation}\label{sec:Device Types / Block Device / Device Ope
 
 The final \field{status} byte is written by the device: either
 VIRTIO_BLK_S_OK for success, VIRTIO_BLK_S_IOERR for device or driver
-error or VIRTIO_BLK_S_UNSUPP for a request unsupported by device:
+error, VIRTIO_BLK_S_UNSUPP for a request unsupported by device or
+VIRTIO_BLK_S_NOSPC for an error that device doesn't have enough space.
 
 \begin{lstlisting}
 #define VIRTIO_BLK_S_OK        0
 #define VIRTIO_BLK_S_IOERR     1
 #define VIRTIO_BLK_S_UNSUPP    2
+#define VIRTIO_BLK_S_NOSPC     7
 \end{lstlisting}
 
 The status of individual segments is indeterminate when a discard or write zero
@@ -567,10 +569,11 @@ \subsection{Device Operation}\label{sec:Device Types / Block Device / Device Ope
 Requests of type VIRTIO_BLK_T_OUT, VIRTIO_BLK_T_ZONE_OPEN,
 VIRTIO_BLK_T_ZONE_CLOSE, VIRTIO_BLK_T_ZONE_FINISH, VIRTIO_BLK_T_ZONE_APPEND,
 VIRTIO_BLK_T_ZONE_RESET or VIRTIO_BLK_T_ZONE_RESET_ALL may be completed by the
-device with VIRTIO_BLK_S_OK, VIRTIO_BLK_S_IOERR or VIRTIO_BLK_S_UNSUPP
-\field{status}, or, additionally, with  VIRTIO_BLK_S_ZONE_INVALID_CMD,
-VIRTIO_BLK_S_ZONE_UNALIGNED_WP, VIRTIO_BLK_S_ZONE_OPEN_RESOURCE or
-VIRTIO_BLK_S_ZONE_ACTIVE_RESOURCE ZBD-specific status codes.
+device with VIRTIO_BLK_S_OK, VIRTIO_BLK_S_IOERR, VIRTIO_BLK_S_UNSUPP or
+VIRTIO_BLK_S_NOSPC \field{status}, or, additionally, with
+VIRTIO_BLK_S_ZONE_INVALID_CMD, VIRTIO_BLK_S_ZONE_UNALIGNED_WP,
+VIRTIO_BLK_S_ZONE_OPEN_RESOURCE or VIRTIO_BLK_S_ZONE_ACTIVE_RESOURCE ZBD-specific
+status codes.
 
 Besides the request status, VIRTIO_BLK_T_ZONE_APPEND requests return the
 starting sector of the appended data back to the driver. For this reason,
-- 
2.45.2.627.g7a2c4fd464-goog

