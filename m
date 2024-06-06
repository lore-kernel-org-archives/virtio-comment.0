Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F158D1798C
	for <virtio-comment@lists.linux.dev>; Thu,  6 Jun 2024 03:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717644956; cv=none; b=SBdO/NRpC1umQoGYaaLRbXtBXn+KsKR5AIYQfJ6YwliJP5Hgv5gYsL1+l+9PvY4euNZds/A+lYyXH7sBU9we16squ+VaaBO97R6lAh/qhOjhqKq8XSySQbjUS/d71Ra6CP9smccyvzqGEU2JXpGOO9DwOUll35WBhPtupAlLD/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717644956; c=relaxed/simple;
	bh=vmx0PkucDL8cuxHTjxqzIbA+uKa3/uRTxLZYG7yZgbg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lzdYjoZZChfOIXwvybs4ROXAngiRSUTma7ZHkVabvcUcQDTuAXK+L9+BFcek/EQC2t2tYNNu4yS6MJc0jrk0Jt8gEnhyMsVWwArncrmoq4j2ncIrO1uKWbIOsLZLFhD72ZKTJFBIFDm8XBPymqVUnYa3FOzWqomTbadJv6D4CXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=N+nWCpM7; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="N+nWCpM7"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1f6b941844dso4107975ad.2
        for <virtio-comment@lists.linux.dev>; Wed, 05 Jun 2024 20:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1717644954; x=1718249754; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kto/U7DZapzAvhKurS7Mfijt9BCK3jfym/IF2oT6fsE=;
        b=N+nWCpM7VdS7ZQwpYYuq/hCVd2QZwXMjYwr4yMjMbpOQlcv0gPK4650kBYjfA4Bgai
         kLsqMrRYgCz4sFcHABGSY2WNytYdgi4n20pHnAGNayJnWoPoVV3bGAglVCmWRQ4SVm/n
         gcDtF71Ua3QvFM/5ghXoXN5Et/X8CTFp5Elfgq9LT2Qjl/DAXIjNODVSIi58UHqDnP1J
         +b95oOAuvkuRHSjccKVgVkx9UwQbBoTMZbnOmqam/LVXoeV1WTDd0RHdZWbyDLcFEQ1w
         L9xslmU0T6WxNJJtSYNRSei+d8EyXiUnOz95FpE8VbJxrIvvaEktx1Zjj6dk5c93hwcI
         fMHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717644954; x=1718249754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kto/U7DZapzAvhKurS7Mfijt9BCK3jfym/IF2oT6fsE=;
        b=StDsW88QC2UwH/QWP/0krWJHJYHBhvWvGGJcsnHNAofAhcBVv1C/ETdZoff+Jiv0oj
         tacP2ut2NCvVC1LPIRwOGsPqHXK0bYJHzMrNOVaG1eh5zXGDTSdhcabalQvhNyBSXDNj
         7fDYD9u1ytWtrvoEzsk4eveRXQaa9PoBEJMGmcbI7tQxtySBVpxN8worHrnRY2h7LAxs
         0V3t16QfnK6dGYfOID/hP/V+PB/Ad9+y7D8i/H1q8CsDBV1PpzdqlazUfjJkYsS3cU7Q
         b88WCyiSfdTQmifMj3MTERWeCgpRsDh8FkdBR81nHWy3k2OQX1h98ErJsWRfJy+8t24j
         1fgQ==
X-Gm-Message-State: AOJu0Yy/AQaN1g8RPmJmUw7nV7kBT45K/5YGalGuKL9zor7W5pFBXdAJ
	ZFvWbLW+SC14uXiMMILD0lsS4MNE3bvlpdRUszIZHHxvIZWJ34jzS6IW3Enc8bwd14pBObiKDto
	t65U=
X-Google-Smtp-Source: AGHT+IF4D70kSzU1yVT/MbEG38UO7t0XaSG2LbTBLNfby6eMKXpzw/sIBUBvRMtFeG8eNUyiT3pF2w==
X-Received: by 2002:a17:902:dad1:b0:1f6:7de8:6643 with SMTP id d9443c01a7336-1f6a5a28ea6mr56205715ad.38.1717644953960;
        Wed, 05 Jun 2024 20:35:53 -0700 (PDT)
Received: from always-zbook.bytedance.net ([61.213.176.5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6bd76c6efsm3107135ad.94.2024.06.05.20.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 20:35:53 -0700 (PDT)
From: zhenwei pi <pizhenwei@bytedance.com>
To: virtio-comment@lists.linux.dev
Cc: david@redhat.com,
	zhenwei pi <pizhenwei@bytedance.com>
Subject: [PATCH v2 2/2] balloon: link virtual memory management URL
Date: Thu,  6 Jun 2024 11:35:44 +0800
Message-ID: <20240606033544.400000-3-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240606033544.400000-1-pizhenwei@bytedance.com>
References: <20240606033544.400000-1-pizhenwei@bytedance.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

More and more memory statistics have been added into stats VQ, add a
link for Linux, this would be helpful to understand these counters.

Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
---
 device-types/balloon/description.tex | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/device-types/balloon/description.tex b/device-types/balloon/description.tex
index 7ef4e3f..cfe5b8c 100644
--- a/device-types/balloon/description.tex
+++ b/device-types/balloon/description.tex
@@ -425,6 +425,9 @@ \subsubsection{Memory Statistics Tags}\label{sec:Device Types / Memory Balloon D
   directly by the running task (in bytes).
 \end{description}
 
+Please see \url{https://docs.kernel.org/admin-guide/mm/concepts.html}
+for above guidance of virtual memory management on Linux.
+
 \subsubsection{Free Page Hinting}\label{sec:Device Types / Memory Balloon Device / Device Operation / Free Page Hinting}
 
 Free page hinting is designed to be used during migration to determine what
-- 
2.43.0

