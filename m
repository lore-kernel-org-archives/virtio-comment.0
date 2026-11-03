Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793704075;
	b=H413CZEKxv+IDIn3ElzEibik/OcLe6OfhcQyhCAcilICXDul/aaOUqKAaTYEjkkVgXPH
	 +rYkhpueCfZKg5C3kSRubA2/AH/ink0Pes9cxC/odnF6YD3tMHgqVQd2kGeEiOGotxPLU
	 30gH/qrAZ3+S3Z0lUPeyi+d0Bache6I+mrunilXxhmoheNQUtCK4RKbcl/O2Bz6VWO8YP
	 5oFvFaK/+jcTmVFLg0U4Ba82BghH4oJhUl1gcq+gxY09DUfjIBjbe+rTv3N/61F78q5QR
	 RJQNKPgqj7SB1u8zpxlvUHoaegOiZn6G+vh6yjR3XuGMLFJu1yVsz+ho6jnYy8J9vtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793704075;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Mimecast-Spam-Score:
	 X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:
	 Content-Transfer-Encoding:content-type;
	bh=JYJK7uNY3eLYLfcGax5iWIa8Cmb8fYYUx4yt5sqqo60=;
	b=GkNBPc/8m8x1SX4Tpxcm6KP32UQLweQtLeWOYbRJ0jzDwAi5hb4FIoctn1NbdZxRWoYd
	 bi0TAwuPx0ybFuFiWCwhIThQzW3sTS6pPt8KNwZNLsublIZg8W57R890QQuwyeLtv2IQo
	 6ZNHSB8U9Yiq7qQ2sRNhdXFywOboNzALCFEvEa1doI8DAfHrMsDYgfGaOs0a25QJ5ubmB
	 CRi/W2rDl6WCgjKylrir0q5Q6IEXOJomLVTMLNIcfBUk2D4RABQtMUloPBbxFz7U2jWUm
	 mNXadig9jQzlKOWjE0LB0nbKh8Wv0MT/uwnSiYyprjPKHqrmNw39YK+MoNye9HxuN1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bZgEBXHi;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA95606A324
	for <virtio-comment@lists.linux.dev>; Tue,  3 Nov 2026 11:07:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BA95606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bZgEBXHi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793704074;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=JYJK7uNY3eLYLfcGax5iWIa8Cmb8fYYUx4yt5sqqo60=;
	b=bZgEBXHiahdbTemYnvOTvlIkfZUWr+jTbuX/m1r/md7TfP/Br29xmZWBoZ0uodVpnuQtw7
	Bh9wCkfquh3qmKmlcqfQCfIRbVyDf/QJQrDdPYKnbG6svDSbWIAzESKEaDU0gKQZYsCcz9
	NcsKSSYMRANKIitrD5DITxQ3ghWuMIY=
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com
 [209.85.160.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-646-ZZXkeR5UPRiZSX21VzIoPA-1; Tue, 03 Nov 2026 06:07:33 -0500
X-MC-Unique: ZZXkeR5UPRiZSX21VzIoPA-1
X-Mimecast-MFC-AGG-ID: ZZXkeR5UPRiZSX21VzIoPA_1793704052
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-469debb526fso3968033fac.0
        for <virtio-comment@lists.linux.dev>; Tue, 03 Nov 2026 03:07:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793704052; x=1794308852;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JYJK7uNY3eLYLfcGax5iWIa8Cmb8fYYUx4yt5sqqo60=;
        b=NqTzo/M2ECb/lRbjnixo7Mk27iCJg10Y7Xqi40UQyksMpOIAmm7O7g8N26FYIZKcgn
         w9tOvC48x3PBp0mcRp2nXIAQdoJdEDpUa54PvXkHOS34XUWRP8xJIlZ/9BgxtWfLWsxP
         xE5BQey1zo05ywNeR8ybDQDF2+537z6/KbmSjX7icyWSKyBD53s/UKQfDfiDrgq4wqrk
         UfVi7T57/k0ZVjr1lmfUcpKi6j+yUVbK9DYaaNklnzXiPiuJXAyq1ErGWNFU6XTc8eWl
         kxr1zhts0NU5lzsP6rplLyuuJqz5bw/MO5msBN4Y1oSa32BlrzVHZWJMrZa89rJkgFLI
         CEFg==
X-Gm-Message-State: APuU4Z8WZo7VVxbr0fNDmn9zZuNfgy4VhQvVTPTnYEwH62/ysXZ3b8f3
	50TZo7DVWJaW/MfrJQiIbUlIVaQ0KdQnu0HcFFjhFUkOc5+PMf51yZ5jGXftoM3Pai8y3Q9VV/5
	d9UlGNXe19Z3DXEr066RXk2G1lJ/eDIVAPfJWwyc959Hyy2mw9+ro2nudohXdhCcH6Q9KbXyxGB
	Fi4RkkrgGPKHfB1hqk5TAG4yrvvQBJ5F5jkJhh520y2fb3RgaRU5eQDg==
X-Gm-Gg: AYBFou2TGFSZfcLinfRw2eY63KVbmteIilKOr7s5B1kOzOiFCfcOeMUZc/tw8210fXc
	Hdl0H4UeNRM1M13sz5iSkVqg9NB07pfPhLXTVCzzItfxE3TBzDe4LZL952nfRyhiONwhmgDwx6t
	rorG3JMYjtbW3xsjtvvujjLjwlB6Z7JBkiDndejj+k+hfHz6cmtLosQhPuWjulgc5r3oLoS2kFp
	C6HWj7Zw6D0CIq8xL5nHOaW1N9NCrE2FD6QhOKozI6/yIoG9PrW/T0lEyQbu5dqgnkrNdLo6/E/
	OaCbzOaMf/teygenBz1r/T5Yao+2jrHbwSO5UCETP6O77/euhTBdE4XhDkLlb7Yv9QuV5R/3q76
	gW1ItZ6jl1NOtGA3abAQIaoEuPpGH/hcuXWzDtyiJP6VxQaWX06E5XmMCsOT+m9rMetm8gWCpil
	tlI4pnJ2u61Uz2ArI3dKYfs9mG995eMjv+Ie8ulMWaFMItNUgoBo/wK3Mk+b8C3TA7Aw==
X-Received: by 2002:a05:6871:a863:b0:48f:e0f6:bd64 with SMTP id 586e51a60fabf-4a907823713mr7572349fac.53.1793704052198;
        Tue, 03 Nov 2026 03:07:32 -0800 (PST)
X-Received: by 2002:a05:6871:a863:b0:48f:e0f6:bd64 with SMTP id 586e51a60fabf-4a907823713mr7572334fac.53.1793704051658;
        Tue, 03 Nov 2026 03:07:31 -0800 (PST)
Received: from dbassey-thinkpadp16vgen1.tpbc.com ([2600:1009:a123:296:8d9f:a190:9048:56ec])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a92196578fsm9487853fac.7.2026.11.03.03.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 03:07:30 -0800 (PST)
From: Dorinda Bassey <dbassey@redhat.com>
To: virtio-comment@lists.linux.dev
Cc: sgarzare@redhat.com,
	aesteve@redhat.com,
	slp@redhat.com,
	Dorinda Bassey <dbassey@redhat.com>
Subject: [PATCH] virtio-gpu: Allow num_scanouts = 0 for headless mode
Date: Tue,  3 Nov 2026 12:06:23 +0100
Message-ID: <20261103110623.328004-1-dbassey@redhat.com>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Post: <mailto:virtio-comment@lists.linux.dev>
List-Help: <mailto:virtio-comment+help@lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
List-Owner: <mailto:virtio-comment+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dvDZ7mwRxmlSIOtshMqJSg7E1ujE-edecXFiVgiTmJc_1793704052
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

The specification currently requires num_scanouts minimum value
of 1, but the Linux kernel has supported num_scanouts = 0 since
commit 72122c69d71784 ("drm/virtio: Add option to disable KMS
support", 2023) for headless GPU compute workloads.

Update Section 5.7.4.1 to allow minimum value 0, aligning the
specification with existing kernel behavior.

Signed-off-by: Dorinda Bassey <dbassey@redhat.com>
---
 device-types/gpu/description.tex | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/device-types/gpu/description.tex b/device-types/gpu/description.tex
index ac3b427..83d2126 100644
--- a/device-types/gpu/description.tex
+++ b/device-types/gpu/description.tex
@@ -67,7 +67,8 @@ \subsubsection{Device configuration fields}
   Writing a '1' into a bit will clear the corresponding bit in
   \field{events_read}, mimicking write-to-clear behavior.
 \item[\field{num_scanouts}] specifies the maximum number of scanouts
-  supported by the device.  Minimum value is 1, maximum value is 16.
+  supported by the device.  A value of 0 indicates headless mode (no
+  scanout support).  Minimum value is 0, maximum value is 16.
 \item[\field{num_capsets}] specifies the maximum number of capability
   sets supported by the device.  The minimum value is zero.
 \item[\field{blob_alignment}] specifies the minimal alignment, in bytes,
-- 
2.55.0

