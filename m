Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 755CA1D88A4
	for <virtio-comment@lists.linux.dev>; Wed, 19 Nov 2025 08:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763540624; cv=none; b=RGRj+UP5Jj3jIBPjN+OvrjHrLKeJKDpIJSneAbHpvwTXwPxvRnGphxDPwOZVZPfOQn9yPCjtrEbtc7TwixgyxMPvQWoW2CIAjVgUBbsmUxy/7lEMzBwLzXF70FbBNvKS59UN1l9VL+mutlp+MEF6dFQcdqfYUiMjwqT4aF4Ga7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763540624; c=relaxed/simple;
	bh=V5REa9nQZaNZfnozTpC8JH5CqIA/V8ytxruf4v8hWFc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N9RsfVhABKrxvXbl8VCaqMu/2d7zp6pSKwnBW/mcgx6WfBAKW4rhfWSG2soXy3tQ6SRo2gbIWg6ijB+An+Q4ftLOL4ry7i1Iex6vXi0WWSrhdq+MoZy4C4zSRTwcxSZltWW3rYazmYds7uteCuFTG/1oWsYbsrzqp66WaPDVFu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QuYGjFep; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QuYGjFep"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763540621;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=MjFM3gu4sDQdJLVvPpl6kMIy8tRcNNnne3Hn/gk95jk=;
	b=QuYGjFep6uC5U9eCtVLc+Olr79GhFqsOMUZKePx4LdoHp/XQIzna+maU35kn9hTPh8bD/D
	mwV0khL/eLoYU1Mi0cHXFwn0YBXLEtJMqBc7qXverJHTPYfgpGEKZQZGcMuWB57H6cs/Rp
	I+6HQV1JRK5Xn0Q4dmGopaPj7Nmtbr4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-404-7jmT0QyRPIami-prSE8NhA-1; Wed, 19 Nov 2025 03:23:39 -0500
X-MC-Unique: 7jmT0QyRPIami-prSE8NhA-1
X-Mimecast-MFC-AGG-ID: 7jmT0QyRPIami-prSE8NhA_1763540619
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-47799717212so34439695e9.3
        for <virtio-comment@lists.linux.dev>; Wed, 19 Nov 2025 00:23:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763540618; x=1764145418;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MjFM3gu4sDQdJLVvPpl6kMIy8tRcNNnne3Hn/gk95jk=;
        b=Gy6lTPBI9vE6Iw6VjiYPAOQl1fqeLg1Jd/7Fjrf/W8WYUjRaeREeHohZbUw6QtUyVN
         akw8NfSPNng0p4DlbT1CARTdACDjQ9Vm/6L1XUBdNrVjp7bd0Kg4bUkVS0M+Pzx9sacS
         PVV2QSCTOhY7++U5X1/iZ4sS/pPXzPfYpSFgUp/GqjJWW2qLyvRkqzyArzLXEtizD/db
         M7dCAkJ3dTWmQVYAgZVQTc9StgzRIXACxQyRGAy5/XilK7Cu6eHSM9EoZrHyEUW538eG
         g4+E4yS5NH02DEXe5o2vEQYAmccp6QXGUk1Bd/5exFn5tAuSGLv8uopczZbf7qKYK908
         PvNg==
X-Gm-Message-State: AOJu0YzIFq5tmUrjOzW3J73zaAob3srwUmEOaRbTW16fT032zU19BO1l
	PnnQqxEueFVCsgBDM2Put6X5N9GMtjadQAp1eR4vTadSYcjwAYJ9ErTg/88/5eu4KWBnZRDjD/9
	c9jZkTObOI89WewZ1M9EXRj3AWrxhixQgUsaOTDe6pG1TuF4CzLB9Rb8tLliCvy6ZOASGQYiAQ0
	w1qKY1C8nuTLkBsN3btP4hLenDFnk2SKOOl6D+GCvQdlxeKA==
X-Gm-Gg: ASbGncsGUTKRmvxPJ+avqHsI4hqCa/ju3UjGgDhMsV2Zy0yR56T8uthQsWfi0woKcp8
	SyXgOd2gqIlhS8y6V4Oco0uyGdNVpZo+p6Qh7gNbK5tTGK1Wa0mZ+pE8BQf7ohQpyfE+YUuwleY
	gEk+7Z9pBdxhqj9n+uVX1k4uIEB2bFi/mJP3jINlqAxwlaj46c8+iAKKt/1CAZwL+4yK/GZ1P0K
	7wgtAk51tk0Kh5cVI9necv5wg/IH5IuSaxlLebf9POMl9zl01SUdjoH2Mx8kSR20qdKai3pW3ZV
	S7eYmG5V3S/AABbHP7O4sdbKwDp5M0XLoYGrXg1UXD2I1TLxmx7n5E+7hGLPrLWclig9glLC6ho
	ygIIemGzN/wMIrSGo5oD2P8z87RaiiQ==
X-Received: by 2002:a05:600c:6289:b0:46e:37fc:def0 with SMTP id 5b1f17b1804b1-4778fe62100mr178800095e9.9.1763540618367;
        Wed, 19 Nov 2025 00:23:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG6CXH+qRUiK0uKnJiL4QCU5pYe9OrYPsiJVfbmrl+6nzc9qhIZxEuMK/5wbZ09uHpVfNLcTg==
X-Received: by 2002:a05:600c:6289:b0:46e:37fc:def0 with SMTP id 5b1f17b1804b1-4778fe62100mr178799795e9.9.1763540617852;
        Wed, 19 Nov 2025 00:23:37 -0800 (PST)
Received: from redhat.com (IGLD-80-230-39-63.inter.net.il. [80.230.39.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a96aed1esm37243275e9.0.2025.11.19.00.23.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 00:23:37 -0800 (PST)
Date: Wed, 19 Nov 2025 03:23:35 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: virtio-comment@lists.linux.dev
Cc: Parav Pandit <parav@nvidia.com>
Subject: [PATCH] net: pad virtio_net_ff_cap_data
Message-ID: <0c8829841009a0094f24f87e013ff47e4d16721e.1763540610.git.mst@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: iEU7xtpbVFYIe7EXZ98uAVixXSu26OouD-g_HKVh4ss_1763540619
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

struct virtio_net_ff_cap_data has 4 byte fields but the size is not a
multiple of 4.  drivers can easily get it wrong since compilers tend to
add padding to align such structures.

Since we are always allowed to pad or truncate admin commands, let's do
just that here.

Fixes: 899bb0c ("virtio-net: Add flow filter capability")
Cc: "Parav Pandit" <parav@nvidia.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 device-types/net/description.tex | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index 9833d16..0b4fcac 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -3055,6 +3055,7 @@ \subsubsection{Flow filter}\label{sec:Device Types / Network Device / Device Ope
         le32 rules_per_group_limit;
         u8 last_rule_priority;
         u8 selectors_per_classifier_limit;
+        u8 reserved[2];
 };
 \end{lstlisting}
 
@@ -3071,6 +3072,8 @@ \subsubsection{Flow filter}\label{sec:Device Types / Network Device / Device Ope
 \field{selectors_per_classifier_limit} is the maximum number of selectors
 that a classifier can have.
 
+\field{reserved} is reserved and set to zero.
+
 \subparagraph{VIRTIO_NET_FF_SELECTOR_CAP}
 \label{par:Device Types / Network Device / Device Operation / Flow filter / Device and driver capabilities / VIRTIO-NET-FF-SELECTOR-CAP}
 
-- 
MST

