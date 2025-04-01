Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF3020409F
	for <virtio-comment@lists.linux.dev>; Tue,  1 Apr 2025 13:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743514563; cv=none; b=XE79NItp8oTRbhx3JXemfSG5nB+zz+FymkUajOIxfOJMXBwjPDujpEz9g6rGtrU9cNW+r/pfKutoj6OvyGadF/Nxu7Lgxoe6wWMJ4oml49qIS9rjfPfh1sXteVTi+FL4T/rT/kUCKyHdwHeYgjvib6JJPZFO7vSkwZ4uQGtfg70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743514563; c=relaxed/simple;
	bh=39DwvVSPA0mgkbau6M7hqY9tuO4TZZmkAbdmQGC1mfo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=BYQPXbW1iC33gwTwBOkFdFO2YiN2anBTn32zB5Fo6vYZH3wD1xPzeKX0LIjlDOABLi/k37WEqkE1DsMlUKGlv4JohQYa+CIM0UrwB6V7afiLcWZqmFEMI4RRkN6TyEqNUPXOliboLMzGk/qH+KNlWHjxyi5/fEA74NWbtAql5fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=S4MxrZ5+; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="S4MxrZ5+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743514560;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c8gGdESZUuht0QDJBHgHaD1UnOFbz9jLnNijkn1K/dk=;
	b=S4MxrZ5+ik4fQU4Dt9orTpxqJ+qGJ2QZgzAVGooRJ3pPWrwwpFK9NOZytfQR4cLvr/TgLr
	t4OqSLZ1ZTvOKLZakx/E5QiO/DPJHl10nqNnrU4R4XLYjVuCne3BD0EeYuZayQQf/Xzr7X
	ThWqqwgTyv5uPJG9ELWpAqXZ9BGeiik=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-91-oehzSY72OlC8z98XzIpmKQ-1; Tue, 01 Apr 2025 09:35:59 -0400
X-MC-Unique: oehzSY72OlC8z98XzIpmKQ-1
X-Mimecast-MFC-AGG-ID: oehzSY72OlC8z98XzIpmKQ_1743514558
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-391459c0395so2271520f8f.2
        for <virtio-comment@lists.linux.dev>; Tue, 01 Apr 2025 06:35:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743514558; x=1744119358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c8gGdESZUuht0QDJBHgHaD1UnOFbz9jLnNijkn1K/dk=;
        b=N+cr6CK3ZnrxfGeKhiwj8oaKMKR7DOhiAgTxJUx9FGRa9CJmRkfYsSelgNQtc8Qjw+
         YJkur7DtBHn2OwttQlvQUe36oMV1oo4Ua+IGyI7faSel4A8PnRTRA+1TTDqRiNi2y+k3
         XD1gzTubjqGeipUD/yDLLXKar0KhbicS18mqaD8MPE7GPOF8xE32HjaIaYuZ6U2u9pBv
         kl8VUeEdt+5jpt+KL5ab5va7uhvvgmoAg+dBvIo4AJhF9iIeUUskMpvCXJmDkbvYSq01
         W64MF7YV12R2nYXqxz23AJIOegBKTbeFBSkCNcw/0HG/QjKfu8M9IwzjvPHa0vfJBYkH
         C3dw==
X-Gm-Message-State: AOJu0Yxunj96TjFtWElzh81SthZZ1gzGUbKNWtlfvICin01LQOOkdwN/
	BiBmJjttReaps/8Hoky7iapOz0zZAIVhLuCHDwLCneHrq4hiX804vvbBGUzM/zmCfiFpZ4e4lrZ
	V/2Do5K6LUdkqMXuViI9gFOBN4tHdTwP9QxUa54vU08JOjHlSe0uXj12RU3q6f+sSJz22cIkNPV
	iY9i3wXF8zRX7LPhBs626feP41gr9TASh8BD7AK9n2ezxfH7bv
X-Gm-Gg: ASbGncuONW2dl7DPzPl52HxhzTXv9qTcB+h2zvsPOM5y9KQ3ZE/QU9P1e5H3IoDoJS0
	QGmXl/ofxDB4Q6oijPPniuzIFFk3a4omldYkvVJsfjO0XGI0oVhcom3DSVFUCpzvXe6MMnQTLg9
	yMAVV9EfKtOTVm2jbgy4vxdoytttm6/hMxoqzyYNORG0cd5xLpVHK5tGWDqplgTJtFA32uI5WOS
	9f8bbvqRAGaDV65tdxh677kXWQdbd38mKyofSFvq8x2GxVguA+W32weK03f30b2uRsI9kUJyzp+
	OJILehUOiI+1klbl6NA=
X-Received: by 2002:a05:6000:401e:b0:391:43cb:43fa with SMTP id ffacd0b85a97d-39c12119c56mr9726077f8f.51.1743514557839;
        Tue, 01 Apr 2025 06:35:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEuvjPo1VrHFO220rKvPwlL6SLi1HbTZVccNr2i5h52R0P0MRQAYzkQEg6orynvP6tzk6bUlA==
X-Received: by 2002:a05:6000:401e:b0:391:43cb:43fa with SMTP id ffacd0b85a97d-39c12119c56mr9726057f8f.51.1743514557471;
        Tue, 01 Apr 2025 06:35:57 -0700 (PDT)
Received: from localhost ([2a01:e0a:257:8c60:80f1:cdf8:48d0:b0a1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b658838sm13934812f8f.5.2025.04.01.06.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 06:35:56 -0700 (PDT)
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: virtio-comment@lists.linux.dev
Cc: Parav Pandit <parav@nvidia.com>,
	cohuck@redhat.com,
	mst@redhat.com,
	Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Subject: [PATCH 02/13] packed-ring: Change host,guest to device,driver
Date: Tue,  1 Apr 2025 15:35:02 +0200
Message-ID: <20250401133543.801184-3-mvaralar@redhat.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20250401133543.801184-1-mvaralar@redhat.com>
References: <20250401133543.801184-1-mvaralar@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: O5gllv7wlf-jFX009GwyWjMX1uzSzBm3YCpHmKUnQPI_1743514558
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

From: Parav Pandit <parav@nvidia.com>

Rest of the packed ring description already uses the device
and driver terminology. Change the introductory line as well from
host and guest to device and driver respectively.

Signed-off-by: Parav Pandit <parav@nvidia.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
[CH: pushed as an editorial update]
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
(cherry picked from commit 68d5cc4fe4081a49235885005647b095b7965c0b)
Signed-off-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
---
 packed-ring.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/packed-ring.tex b/packed-ring.tex
index 9eeb382..2bb66de 100644
--- a/packed-ring.tex
+++ b/packed-ring.tex
@@ -2,7 +2,7 @@ \section{Packed Virtqueues}\label{sec:Basic Facilities of a Virtio Device / Pack
 
 Packed virtqueues is an alternative compact virtqueue layout using
 read-write memory, that is memory that is both read and written
-by both host and guest.
+by both the device and the driver.
 
 Use of packed virtqueues is negotiated by the VIRTIO_F_RING_PACKED
 feature bit.
-- 
2.42.0

