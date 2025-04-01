Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6C02040AD
	for <virtio-comment@lists.linux.dev>; Tue,  1 Apr 2025 13:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743514565; cv=none; b=BsEIFMJ7gX56ZR36ivH2l1tK2Gl5opnmcV09qEiP0jQvhdXGXYYgcV8oSevmpsLl419qE4sId6G3l5ar2zSRGCVgyn+6CkzwfjndFap15ja9uFMg1N5sV7/Lr1pbl47mr69ngBrs4czo1Wu+JoDbKQOTaO0XuRthyIVpbHtqdF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743514565; c=relaxed/simple;
	bh=erGfl/le6Hoq5TXyzf1FgkpuU5NTXMPpl2fCv8yQh3Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=MuxJsVbPyG5OFFAS3KxI5Wf158L7mQyR9OtykK26mjM851jQnS4U7ELudGcqYnVdja87WZyx5pxItJOo/bMdEiK1IgI4GsdJonf6/1dD/JWWjFnVjZoxt5SAzGV16osWPd9wXkpDjsBf1C4cO2kCGwbsRXdsfZ9keRlOcgkKWpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SqoAyj5k; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SqoAyj5k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743514562;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7tV4YjKUvhC+6PvO/p9N1snozasHhADYEzvTjW/AFVs=;
	b=SqoAyj5kqq9n7REJ8J6dZBS6IgSHSje7SP6VgbYc9kIQXWLEL9VNRLbByyv1HDejtZcdyd
	dc964vTsiqYeOQJz3nS34xcouYvAyq2UXP8Oui9v1z/Nh8HXlrXiqbMlVYra2r+KxmYTRf
	PM/L3l7/RMq/sGxhUMiLLsXYMEOKiXM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-349-bhXcYdntNluKIdyPHRnmFw-1; Tue, 01 Apr 2025 09:36:02 -0400
X-MC-Unique: bhXcYdntNluKIdyPHRnmFw-1
X-Mimecast-MFC-AGG-ID: bhXcYdntNluKIdyPHRnmFw_1743514561
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43e9a3d2977so18612355e9.1
        for <virtio-comment@lists.linux.dev>; Tue, 01 Apr 2025 06:36:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743514560; x=1744119360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7tV4YjKUvhC+6PvO/p9N1snozasHhADYEzvTjW/AFVs=;
        b=OhJiWSA3Rmp9W/1RiyHIYMRSb0qym1KcENq4etqEfO+2S1dU9vkI6cl6F3izzG4c1B
         ZPSDsQ0nuFSpjBE9HpFIxkS2Q6ga23ymQ3ZcyrMRFEV5IS/wjOeTzOKYyLPKpKr3nhnw
         nRe2I07OL0JCDa8/jkBWiJbsN2FEI4h0R8ZtP2QtHmFGJPcJsYSKas8BIwL8HGCe/lIN
         JqwhNwqwy8MTDB2kWd6wPqmzb9lkyDkJdF3qef7VwF2Up6MRONhfwHBzeNTy07n7Cvxa
         USukOQS7HbwsOU08DLqoXtZiFthP7EbfoItXsWNwjGonJ39YHespCyCwxT2e/07N+V+y
         YxAQ==
X-Gm-Message-State: AOJu0YwBrCgXs/lXjMV8nM/qAOoOlV41NqJo1lsXAPLciQzFsPmEBbJ9
	BXbREIiWQSmOBabm52AiuyIKsnBuwt32RVG8W7Hox2jD8YcrXSD0fUCUBefcEj0uS686s4HRF7z
	utd7l4IsMUPTKLMhJ15ChQVUHzKuyDAC3xybxJ3290wWrt8IByqRES751xUJu7tHkJWAAonZBKK
	6cyy56/3ySYhFzX8QkWP3Nfx/kT0T0beAOQ/aQImD2xsTAQ9El
X-Gm-Gg: ASbGncv0L0bW6V/As5ek3GpAc4NdxX4eggyz/LAwM49u/IfcDMkJVjcQCMaTEjXYywM
	lC5/i3+gwc6iS91ZkC9OcGEq24kLEJV3Mhqnb+wu0DzQqCzwhcR1hiNi6XXTR8d1iUyYtxcmGD+
	oUldaeeDCH3Kil9Mqk53XhQkJjvfO0xs6RQgEKjMoJpUke5OIDlmUuTKNUYB81x2siKSRdEa+Vr
	SS6SKq5PajVERXp6ARr4abd2GdNSOb1jt87MD4cFuzqLoD/q1VCssEBY8V0BhcWEXS+amGhdrq4
	cEzaWAjZCBsf31RdCgw=
X-Received: by 2002:a5d:64c5:0:b0:38f:2413:2622 with SMTP id ffacd0b85a97d-39c1211b51cmr10722214f8f.47.1743514560414;
        Tue, 01 Apr 2025 06:36:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG79dVA5Kov5oemkrcmk1Bf0sloq5awutR21kQT7CkRk0t1vYQp2tYZLBbQK3UJDAs/3+1KYQ==
X-Received: by 2002:a5d:64c5:0:b0:38f:2413:2622 with SMTP id ffacd0b85a97d-39c1211b51cmr10722189f8f.47.1743514560063;
        Tue, 01 Apr 2025 06:36:00 -0700 (PDT)
Received: from localhost ([2a01:e0a:257:8c60:80f1:cdf8:48d0:b0a1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b66a75fsm13984420f8f.41.2025.04.01.06.35.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 06:35:58 -0700 (PDT)
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: virtio-comment@lists.linux.dev
Cc: Haixu Cui <quic_haixcui@quicinc.com>,
	cohuck@redhat.com,
	mst@redhat.com,
	parav@nvidia.com,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Subject: [PATCH 04/13] content: Rename SPI master to SPI controller
Date: Tue,  1 Apr 2025 15:35:04 +0200
Message-ID: <20250401133543.801184-5-mvaralar@redhat.com>
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
X-Mimecast-MFC-PROC-ID: JiOmn9cQKlTegVZtwJdHLes87chhXeavtGipT6Go0Qo_1743514561
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

From: Haixu Cui <quic_haixcui@quicinc.com>

SPI master is an outdated term and should use SPI controller.

Signed-off-by: Haixu Cui <quic_haixcui@quicinc.com>
Reviewed-by: Viresh Kumar <viresh.kumar@linaro.org>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
(cherry picked from commit bb11bf9b25cc86c6ff02bf9f243da55b0d383a32)
Signed-off-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
---
 content.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/content.tex b/content.tex
index c17ffa6..d3fc6a4 100644
--- a/content.tex
+++ b/content.tex
@@ -737,7 +737,7 @@ \chapter{Device Types}\label{sec:Device Types}
 \hline
 44         &   ISM device \\
 \hline
-45         &   SPI master \\
+45         &   SPI controller \\
 \hline
 \end{tabular}
 
-- 
2.42.0

