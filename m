Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C9C2040B2
	for <virtio-comment@lists.linux.dev>; Tue,  1 Apr 2025 13:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743514568; cv=none; b=O/SNsW3m8IJL8AtlKSeh+v6KPiVdY+mkFLhI3j3TYLG78HOg8REqssC/GXyKTyJDkmDlgqPUcwCyLGpcuwfUM1PgrpoBVtr/SAN1Nilnb258sUq/J9Xr8ADW3pdoeZKDP14j18KUGgcjkUnCWlU1gSJlM7vUZxp62YOZ9EUSxpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743514568; c=relaxed/simple;
	bh=Kd9CY7inpH6W7NWQBjElIZVs9FnD/j8fTRUVG1qL1pU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=mqXPQbYC39OZPkZS/hoZU1QFVu/yrOd+/inbPX6F5wrvAmCcfySJ15EZwwG09NgyfGI3LUwvB/j4tFCiBPRmRkavSGL8oV8esGLry8ENtbCk5lwL7kCNhbnAdsZfMn+nPjNW8c0QWD0cNGlVJULfHtQw6KRBPo4AUx9TfCZtMm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HIHoFaaH; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HIHoFaaH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743514566;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tzwRvR0Lthf6X4iEM73+gbsDbZ+9v43Dzu897c4kvv8=;
	b=HIHoFaaH3rWHRodrXkwfE1pQpvJbfva3uP/F6FLdUwOULkR3fDH/vndtNdqf2oVeBsk+Yk
	fEpexugvaCHYhatXnYVR0Jz60jyybvXseE5FE2pavvlZH12L17w1/AU2SNnl+RBEd7WyBv
	jL94t6qmr2ia3gztFRAFY+rMIbjShIM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-633-bWjh-V9VMgWNmxGkRSYixQ-1; Tue, 01 Apr 2025 09:36:05 -0400
X-MC-Unique: bWjh-V9VMgWNmxGkRSYixQ-1
X-Mimecast-MFC-AGG-ID: bWjh-V9VMgWNmxGkRSYixQ_1743514565
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43cf172ffe1so51740015e9.3
        for <virtio-comment@lists.linux.dev>; Tue, 01 Apr 2025 06:36:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743514564; x=1744119364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tzwRvR0Lthf6X4iEM73+gbsDbZ+9v43Dzu897c4kvv8=;
        b=JMkHhe5B00w0v2gXrnL6xb9kmWMUIZySl5q4LiIeTuIY5+MAA/I91bEnf1jfM3DQ+D
         /Pue01XT6fWPbspHcx7kriMlzNaOAVrSjyNaOsAweq3qV/IOLa96fogn/iAIK4eDB3e5
         wUkfk0ekehyYMSIbOQb8JVSIdsNXFpeQXzJFidIaTn2VyNhhGgA8fSRC20ERv8UHvP7z
         O3ygsJra5rZkOpRm6lF9B10W6YKnjloWGfkAhPr0t5baGf+mqA7q0JWFaV2OvC2rW+9z
         9fnZuU5cLTNng8ew4b6PJKKQlDiEcueNRCmlZBxqy4dEjo100Ea77e6FCfLWxzAG0RIM
         xRMw==
X-Gm-Message-State: AOJu0Yz2MRkS1+OUpkfABIpXKi71MZ2hpbO9IiBwRvTH4h+ZbjYQIRS+
	Fi0jkH9T7w5ohh6z2TLfNbhkNj1HydQzQisV+PAeCUCYaj1HIp1WpsriDJWZhNU9gshBWLScKAB
	rA4QLw9sC/Lh3lxfofuqWsrWgsAZOIQnokfNElbR23N7pEMekfQ0IbthCxvi5CSZeaEK1sKdFN7
	7y6Fe5jolz2cFXi0fpCe3/9U2OJ2Do0HSpLDgo4k5S1yzgGGV9
X-Gm-Gg: ASbGncup4jwZLNawveeR9H9OwAnm7XtmId0/k4El+vttlwySINEtMCkt2/Sd06Jk7KS
	Tt845q0SdQPVZAlS/gnyqFThgbuNtMXHdXRvkX3pLCS9h69Fxtm15M1f9tM5oZdH9LTd75ouaSp
	WVMxbRTKlqGhfxMoyMx+W8zW+UCjAhr4a9nAeGFQKeRRuyL5+r8C8g0Gkhx0fApDTWkM0q4aHJy
	uJsscaf5ukev3BdUz0SyyY08ALoUeatmDe8kuJIFPbZ23wAh5K7x3Be+bbkz5UwPin0zR7cRD7Z
	mzoDe5ReWUzgGLNHGe4=
X-Received: by 2002:a05:6000:4387:b0:39c:266c:400a with SMTP id ffacd0b85a97d-39c266c40f0mr1638322f8f.50.1743514564237;
        Tue, 01 Apr 2025 06:36:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGzEeWcafpuGwrfOtaU7em/XYWwc5JBdtlHZQwFHCkXaHTFzT+P2hosH6TyFsJC9eZzt28FNQ==
X-Received: by 2002:a05:6000:4387:b0:39c:266c:400a with SMTP id ffacd0b85a97d-39c266c40f0mr1638298f8f.50.1743514563742;
        Tue, 01 Apr 2025 06:36:03 -0700 (PDT)
Received: from localhost ([2a01:e0a:257:8c60:80f1:cdf8:48d0:b0a1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b66ab86sm14549778f8f.51.2025.04.01.06.36.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 06:36:02 -0700 (PDT)
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: virtio-comment@lists.linux.dev
Cc: Parav Pandit <parav@nvidia.com>,
	cohuck@redhat.com,
	mst@redhat.com,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Subject: [PATCH 07/13] virtio-net: Clarify the size of the struct virtio_net_hdr for tx
Date: Tue,  1 Apr 2025 15:35:07 +0200
Message-ID: <20250401133543.801184-8-mvaralar@redhat.com>
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
X-Mimecast-MFC-PROC-ID: wG7qbXStUEf1hHk6iQZ6avJ-DFtqM0gS4nNC99UYdfk_1743514565
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

From: Parav Pandit <parav@nvidia.com>

The feature VIRTIO_NET_F_HASH_REPORT only applies to the receive side.
However, when VIRTIO_NET_F_HASH_REPORT feature was introduced, it was
not clarified that the size of the struct virtio_net_hdr on the packet
transmission also uses higher size when VIRTIO_NET_F_HASH_REPORT is
negotiated.

Explicitly clarify this.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/183
Reviewed-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Signed-off-by: Parav Pandit <parav@nvidia.com>
Message-Id: <20240606102014.2103986-3-parav@nvidia.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
(cherry picked from commit bf0fdf8ba828b694a22c44d45cb3fd34cf813e99)
Signed-off-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
---
 device-types/net/description.tex | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index 0c7d361..7f9ed38 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -525,6 +525,9 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
 
 \drivernormative{\paragraph}{Packet Transmission}{Device Types / Network Device / Device Operation / Packet Transmission}
 
+For the transmit packet buffer, the driver MUST use the size of the
+structure \field{struct virtio_net_hdr} same as the receive packet buffer.
+
 The driver MUST set \field{num_buffers} to zero.
 
 If VIRTIO_NET_F_CSUM is not negotiated, the driver MUST set
-- 
2.42.0

