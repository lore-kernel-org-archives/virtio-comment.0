Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F694D8D1
	for <virtio-comment@lists.linux.dev>; Tue,  1 Apr 2025 13:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743514570; cv=none; b=rxjJRGpaHVCb63C1L6FEZddKwALnaCLhHT2xk8vESWMZPee7bVoFU45ZndOHDpY5jz4mWhN4iXRVXDaAb89ibmXjqZb9Rs2lVyFuLPL14Od/AWsC4GjD0ePUU3Mr1WoIFhQsA2UEiZ6VmBOF8Aubsf51Abj3eviIXjbIGJc/83I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743514570; c=relaxed/simple;
	bh=pvImn/r93RxoflMTOUbAFW5PsY9SoC8gEhJZJt0W1Fc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=GBFRT+6XgKMhWEo0/4/xDYJObizufbZTv30BVIJ3Icf+GpOz/6HodNmex7h+qjLP9d7l6XY7bVv051c2iFDt4f+1cAKZiuplwcgAFnTeUBhdOPP2aPuWw6kcNN4B7+GN7YGokz2K4Dx/FY6KKscEiIDSm2p8JfiSQfCVzLThT0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YC7Injup; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YC7Injup"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743514567;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yjl1mc3GHeDhVMu78ZWHE+RF2qcYcbBHgQHZ4wxWlRk=;
	b=YC7InjupffWqOOlPjKft0uvwGWjhKzweRYc6XUaUfdcz9RjHIektWSH2eoYsmnfhVGpdsY
	0CQMNrld79G0GAaOUcYIa5eiCWkBeHbcOJY95/Z6dfJsfIBF8yXWEO+LB2EL1lIaCtmc7t
	PmRKwaFjc5n+97GHOvDPGXfs29+Lc0A=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-140-w5qYyIcgOt-pEb5AEhy1jQ-1; Tue, 01 Apr 2025 09:36:03 -0400
X-MC-Unique: w5qYyIcgOt-pEb5AEhy1jQ-1
X-Mimecast-MFC-AGG-ID: w5qYyIcgOt-pEb5AEhy1jQ_1743514562
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3912fc9861cso2253332f8f.1
        for <virtio-comment@lists.linux.dev>; Tue, 01 Apr 2025 06:36:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743514562; x=1744119362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yjl1mc3GHeDhVMu78ZWHE+RF2qcYcbBHgQHZ4wxWlRk=;
        b=X60f/ipKgE2TmkjayvdrwCxWrjxZgaO4qFPS/HWpyD4nk0lSnGs+OKvtx9MveSNzuf
         /S3tVU3UUdpkzwuwGg1+T6BXFOj6HxTwCXWsL3kldIwdaFmMZaw/UZ77K5Mgz3e2oDk6
         ZweuSNN6RwqITgmqIzSvjfAt08pPsttKGBqzxWmdrjOxsis9vYshBs+UDCHElaUehOVs
         5Hbg3OZS0fM03h/CdwKnG/WNfcdKiTutFvY45Gv1SJ7YX0liLlntuEOpgUHShIg2vLNb
         GDyc9LqbQz+IK3do0Uri6brXQRhJoij84X62GTRNzWUIaq4urwYPVE9isxSjb2kmn1wc
         WHvw==
X-Gm-Message-State: AOJu0YxZ92TJMORWcBLeFpXGlTfitfdh9mLtd7Qf+yvTRNI8qqMib2Mb
	tB2uF4KUXVUVheb/2BUHx6mPvCAshyzhna0Wb9mr3RYssg5gwgct3q5xrtUnDLVwUw7uAtLF2g6
	UoB3Ng1C5hYhGqDY4aXvVOmqq6WkGb7THmQOToD/2xprYEek/lQ3f+b2cA6+qHkz4N+mOT340cZ
	YvSh/UgYGQDQ5ijsvt7e1eDfpi5Eu+xkxV6SgopSHjPLsGL6fe
X-Gm-Gg: ASbGncu9Hj5VQpcQAWa/U16NhXhg/HFjUwh5VXBXTOilZThBqOwu4p/PYXpQxcyLRpb
	wNQhGVVoS+0uY1NRc3DL9EGMzrqZeX9lq95Imeau37jWPU3XpGpisVQdQ8QTrGi31/PLL7iyPMn
	xuGpv8D8ov/Mx9LcjPXR0l2R6xmGdJsGf2T0MO0/qQ9XdXCFFNA34qvQ/4gH8c1QM2phfKsMGUg
	HLB+OTvy8n/BQI2r80LneH2hun+p8GTQ++nQaDtGrSLIuyLKhhDpKHokQsEKrsu1YzAGMT9nRbQ
	DklJIesG4qbtE8u/+K8=
X-Received: by 2002:a5d:5f42:0:b0:391:2889:4ea4 with SMTP id ffacd0b85a97d-39c120ca29cmr11332240f8f.9.1743514561751;
        Tue, 01 Apr 2025 06:36:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IERW9Ivb8h8phunyNGnfIg68nXpem6MRiU27ZA1XjcUCO4Qf80xTkVZMMziZ2MMUk5XKnBrpA==
X-Received: by 2002:a5d:5f42:0:b0:391:2889:4ea4 with SMTP id ffacd0b85a97d-39c120ca29cmr11332217f8f.9.1743514561393;
        Tue, 01 Apr 2025 06:36:01 -0700 (PDT)
Received: from localhost ([2a01:e0a:257:8c60:80f1:cdf8:48d0:b0a1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82e6a63esm201088455e9.11.2025.04.01.06.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 06:36:00 -0700 (PDT)
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: virtio-comment@lists.linux.dev
Cc: Parav Pandit <parav@nvidia.com>,
	cohuck@redhat.com,
	mst@redhat.com,
	Max Gurtovoy <mgurtovoy@nvidia.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Subject: [PATCH 05/13] virtio-blk: Fix data type of num_queues field
Date: Tue,  1 Apr 2025 15:35:05 +0200
Message-ID: <20250401133543.801184-6-mvaralar@redhat.com>
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
X-Mimecast-MFC-PROC-ID: xl-pPzJZ9F_EXgLsgxnWww4RGgRF2SC5QzUMB3EeTws_1743514562
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

From: Parav Pandit <parav@nvidia.com>

Correct the endianness of num_queues field to be little endian.

Suggested-by: Max Gurtovoy <mgurtovoy@nvidia.com>
Reviewed-by: Max Gurtovoy <mgurtovoy@nvidia.com>
Signed-off-by: Parav Pandit <parav@nvidia.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20240521122119.2004071-1-parav@nvidia.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
(cherry picked from commit 18e47c01207b2983a7dfd1e2c7de1bdc408d391a)
Signed-off-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
---
 device-types/blk/description.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/device-types/blk/description.tex b/device-types/blk/description.tex
index f04c932..2712ada 100644
--- a/device-types/blk/description.tex
+++ b/device-types/blk/description.tex
@@ -108,7 +108,7 @@ \subsection{Device configuration layout}\label{sec:Device Types / Block Device /
         } topology;
         u8 writeback;
         u8 unused0;
-        u16 num_queues;
+        le16 num_queues;
         le32 max_discard_sectors;
         le32 max_discard_seg;
         le32 discard_sector_alignment;
-- 
2.42.0

