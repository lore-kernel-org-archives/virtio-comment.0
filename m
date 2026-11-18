Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795001585;
	b=RwQ6JvyPvJp46POvA0ZrBYQWTHqE38hpewUjgwsaeCBOZWEro0byV3WjJp/WjQw7yNWg
	 zlqTqWowGYJbJflgfN6bhLPlVslkOV6wQ/rUJG5RjgfbcmOfirEvVRGBumAabr+5p7Obg
	 bo8Suw07ft47ZCA0wiNqwFk9S3bxWpvwxeV8QBaFJZhqkgZbvNW5bT81zy5n1lEhdpI6R
	 pKllhy3IJ2GI6ZOPdzZ3DSAwcyATvy6zi3nXH8K12X1WTvtVQZBBxCBZmAAWwDUwOHyF0
	 ibnyG+qDWGSjUd1fh1jFNIAxlhPYhHTtsH0CiUihs6NRWdTNRC0qEco6kSDgVKDGdlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795001585;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Mimecast-Spam-Score:
	 X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:
	 Content-Transfer-Encoding:content-type;
	bh=ruaz0um4mSgkjPPUeftrQtue8de4mbQOX0MHYFKBfzc=;
	b=huTtizLF8I453s/DfuvEoTHnc0C1v2KBE6u/IAsFUfINNmFlIsqN+U5moejFjeJ3/UFh
	 zNdPmBn/DY7DsBtnT+xNux6ai0hYqu3Zo5tT57QETveF1bkFeMu7bqBB/Nxa64RK5T8sx
	 6u6FINgH+9fGUX343FtNX7z7Fm1AFDc9sYQ+3HnvoZAxY2X5mfWoYq0+a8SpuVZl24umQ
	 49GkK2wq8Cp4jxscJQy4yxahup6NE2XWMx2q3o6HNpxmrFzmBoC4Fs74slUAwxA3+pHSR
	 Hx5YVAIQiQlAxdB7C4w6QV6xjIxpMr4XGNeTK/Pek7BvVOoVVE2nGg+PMuoABDkfAWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=asbWCYY9;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D16E606A320
	for <virtio-comment@lists.linux.dev>; Wed, 18 Nov 2026 11:33:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D16E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=asbWCYY9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795001584;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ruaz0um4mSgkjPPUeftrQtue8de4mbQOX0MHYFKBfzc=;
	b=asbWCYY9D3qAIIW1DqxySB3PqmsxbptmZgJpMkD0R0bGKlJP6FEBHNhx7ccuwyiOKyCeIy
	NfMwZZW2t1cESGRdbPJAu1hFcCs4F3B3PqKoqEaGbjQ3nCj0JOs2aP1URJffasYblmK6Qz
	+ymdso94rvgtg/AmvpPOKLF155IisSU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-441-gnCCk2XKMle5TSDt6mHFYw-1; Wed, 18 Nov 2026 06:33:03 -0500
X-MC-Unique: gnCCk2XKMle5TSDt6mHFYw-1
X-Mimecast-MFC-AGG-ID: gnCCk2XKMle5TSDt6mHFYw_1795001582
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4bb69d84053so9040515e9.0
        for <virtio-comment@lists.linux.dev>; Wed, 18 Nov 2026 03:33:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795001582; x=1795606382;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ruaz0um4mSgkjPPUeftrQtue8de4mbQOX0MHYFKBfzc=;
        b=WTvsulr8ZtNQ+8KcRLESz+X7p0YImfIlmXa4aCK34opuldRRSqhopGxJdCT8u2neQ+
         fH2nsxsDgGtCqFlxf7kRpImlI3iBo7Kqjo/EUSYgjkclrjr43fuTpk1n+83wTcrd3L9K
         iPRI6Zyg7pGCOUS3FagrEjV4MpNimmgi/E6Gk0aU5Pd4iwa7BlVOLStzh+1EvkNnZrFQ
         vYfVlaSctOSzi2/FeYURgzEIHlCwxjGCuleqAyk3u3tqTgZ24DCCSWcdiDq8iIH+Zs+s
         nMuiNK92kusYVWt/G36HsWAufxk+KYuYJ4VBPjuWOrHfOGaFrcO2IvPWXxqW++ngnob4
         KLxQ==
X-Gm-Message-State: APuU4Z/CHbMLLZG+8V5Vj2v6RyZ8AlmCQCnJCvbsTuUskbw/v7P6iH34
	FukqaJO8Kqgj5oX2lJ6hgAQdUmgy07cLfZYD9tIu80HE29uI3QIPB91dI/iAICBKLQD6b30s18O
	MBg43PfGSXZJ85I22w033SM99ybYaln5B3Gbjo20Rt0pE0IunYoWeNCaB4+QrA6vR5vRjklG589
	U9QJvsKEtAQmksf7JD8DZdxr6/iRyxdclYD4iWkbYGqK7V/sQOoRQ=
X-Gm-Gg: AYBFou2AEZM7pQc+qTke55wQQQzMbjuesnEQgrKRFOMACZHUAZspKsBzrEuycRTPb7n
	PMDFeo06Z8xdvrY9FNNRHZ/vZrT6bIwLFhQJjnUtnnSJ4d1byFGRPXp5KITgClBgLRS86s1yGyw
	i06ajijFakTFPZMPEExOAw6k81px/4o5RCoRTumIKUgHNgbdD6G1n6/KMspmBjEOiP1djVr0nMw
	rsGzCTDlyj2ZHVbY7/Q9sLwUaeDCcTrdH186lnFCYroKWKmJXpDw6kYxE2zp3Ry8DquVR+KrKhV
	QFz2UZpXPT5ApbAA59Bpp6wj6kL9kjiGMBtWLSGGTrXDNgxjJThRHYByf90YrQ7ofkBGaC+yEpI
	yOqd5TEcEV0hxEYUKKP6QQ4WA6uN+B1uahznZvkfquff5+TTXuzlySOz8ceWR83U/+0vWfvdIMl
	AqBVuVrGR6hcSHpPxhaLTDCXeM6rBwsewPbM87xaI8gYnpR3Lca27AEKkZaLebcyQ=
X-Received: by 2002:a05:600c:4e87:b0:4a5:75d2:c104 with SMTP id 5b1f17b1804b1-4bb7da2db77mr44634555e9.22.1795001581917;
        Wed, 18 Nov 2026 03:33:01 -0800 (PST)
X-Received: by 2002:a05:600c:4e87:b0:4a5:75d2:c104 with SMTP id 5b1f17b1804b1-4bb7da2db77mr44633865e9.22.1795001581484;
        Wed, 18 Nov 2026 03:33:01 -0800 (PST)
Received: from dbassey-thinkpadp16vgen1.redhat.corp ([85.93.96.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a656095f2csm4005075f8f.40.2026.11.18.03.33.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 03:33:01 -0800 (PST)
From: Dorinda Bassey <dbassey@redhat.com>
To: virtio-comment@lists.linux.dev
Cc: slp@redhat.com,
	mhrica@redhat.com,
	aesteve@redhat.com,
	sgarzare@redhat.com,
	Dorinda Bassey <dbassey@redhat.com>
Subject: [PATCH] virtio-gpu: Add VIRTIO_GPU_CAPSET_DRM capset definition
Date: Wed, 18 Nov 2026 12:32:42 +0100
Message-ID: <20261118113242.59167-1-dbassey@redhat.com>
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
X-Mimecast-MFC-PROC-ID: xTWPvw17K4LFY-w_dMoCgeG2HDQoJXwWES6vH1dmYJQ_1795001582
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

The specification currently defines capsets 1-5, but the Linux
kernel has supported VIRTIO_GPU_CAPSET_DRM (ID 6) since commit
7214da0ed ("drm/virtio: Add DRM capset definition", July 2024).

VIRTIO_GPU_CAPSET_DRM enables DRM native context support for
direct rendering without GL/Vulkan translation layers, allowing
applications to use native DRM APIs for lower latency GPU
access and compute workloads.

Add VIRTIO_GPU_CAPSET_DRM definition with ID 6 to align the
specification with the kernel UAPI and device implementations.

Signed-off-by: Dorinda Bassey <dbassey@redhat.com>
---
 device-types/gpu/description.tex | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/device-types/gpu/description.tex b/device-types/gpu/description.tex
index ac3b427..2d7ffa6 100644
--- a/device-types/gpu/description.tex
+++ b/device-types/gpu/description.tex
@@ -542,6 +542,8 @@ \subsubsection{Device Operation: controlq}\label{sec:Device Types / GPU Device /
 	Mesa's (mostly) autogenerated Vulkan protocol.
   \item \href{https://chromium.googlesource.com/chromiumos/platform/crosvm/+/refs/heads/main/rutabaga_gfx/src/cross_domain/cross_domain_protocol.rs}{VIRTIO_GPU_CAPSET_CROSS_DOMAIN} --
 	protocol for display virtualization via Wayland proxying.
+  \item \href{https://www.kernel.org/doc/html/latest/gpu/drm-uapi.html}{VIRTIO_GPU_CAPSET_DRM} --
+	DRM native context support for direct rendering without GL/Vulkan translation.
   \end{itemize*}
 
 \begin{lstlisting}
@@ -556,6 +558,7 @@ \subsubsection{Device Operation: controlq}\label{sec:Device Types / GPU Device /
 #define VIRTIO_GPU_CAPSET_GFXSTREAM 3
 #define VIRTIO_GPU_CAPSET_VENUS 4
 #define VIRTIO_GPU_CAPSET_CROSS_DOMAIN 5
+#define VIRTIO_GPU_CAPSET_DRM 6
 struct virtio_gpu_resp_capset_info {
         struct virtio_gpu_ctrl_hdr hdr;
         le32 capset_id;
-- 
2.55.0

