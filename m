Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D0156DCE1
	for <virtio-comment@lists.linux.dev>; Thu,  7 May 2026 05:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778130602; cv=none; b=L14tv4KI4AXn5pQPWQQsCffblin0DD9PtXnyDejMQScIrFxkf2MwTiVuC1l51JyykPcVc8ifQCEz0hWBUvtnqXGd734t3h1aclopzRW8wC/Blw0s2GaheIJHmw2TLLGCC2UJvurTfi7aHKV23V9L5z3Ix3NYFwrqMejm+lQcME0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778130602; c=relaxed/simple;
	bh=4pkf8GB01S50+dbnxAPhuAFqcleF5zsnpsK2/6L3y3I=;
	h=Message-ID:From:To:Date:Subject; b=OhbwPSeTW2BoLGJcDtSUxtTateOH5AchsKoPE5szDgy8VyyrIyGbdpwFKGaGIJfErChWDPIQc/ScjMjl0g28Kb2sAHRfCIKFYry7gDS+PKfTT7fkF4xcLT5Ddi1QRLE4hq25dPsEwdBBE2xrr82GtASjpXTb+S0VYJ80njNTzuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ggvPmRpU; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ggvPmRpU"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-7bf0b1a47b1so900567b3.0
        for <virtio-comment@lists.linux.dev>; Wed, 06 May 2026 22:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778130600; x=1778735400; darn=lists.linux.dev;
        h=subject:date:to:from:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cWIymFnHpFxk/H1tNN73zyaOU3jyB7CZiy8MnArxywU=;
        b=ggvPmRpUr79T8Eo9oO/8jLnsn8UBufZAl07yM1uSrFtF3R9hJWCgkRvargVgTYqNOh
         tkj8Vd5oMre93Giw5A4lrvs1kWf5KTHypEh5mW7YUSkrE+g31KJv4pwy0vZ4ao1eGzl4
         nDgAhZimt8Poe8V2TfqxnTbPM/tIjIPyFoXIoVeOvta5yOfMAin5DRUOpv/sItmqv4Rv
         rMCefFb3zSGsAY376knduNB2tFT7pnZHqV+AfC8HoN+H5ogU7hEb9sHtqLHhDs1x8Ipu
         DP0zJMYneLGtVoNiYmer5Wc8382BNgw+Fch0eHzld7n8dQ1oBvqhSEQXyRmLBCVcbvpE
         sGJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778130600; x=1778735400;
        h=subject:date:to:from:message-id:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cWIymFnHpFxk/H1tNN73zyaOU3jyB7CZiy8MnArxywU=;
        b=ItCDPea2AJFa19utr+2I2p2tS2H7+DXpWLgzrzZ0FBkkISqSl/ULfduboLGKCASRjt
         yD/FxKQfpF3iZ1KeRtZT+Kx0y2eA4CfEew6IorS/iyMY/8PWlDm7SyghxDTvckH/GMzV
         yw271B3h+MWbifwWx8LhXlnNCIgY94z1JGE2lKIIcL5/qayVXRxFk3wN6f8m1vbV7eOV
         w8qlndCpJMixbDZiS7em2/2P4ESHtrHSlOyt1mMnEYkKo4YaHvgORAbb/HvgAOTLYLrr
         hni2x+e1VfQtd5fit/e2J0f9+oNsrKLn0NAgmt8lxixdzqleOKcWgUZKzXyWJj/CX3kY
         zzVw==
X-Gm-Message-State: AOJu0YxuWwf8o2Ktu6nbsXyhLlmxvZp8jRkerc9nlTLMN64BbEW4f6LW
	8Qi9xZR6qsaNi+IlogZ2MXUdTmhhO//nHA8kzDtYRbIM8UexSoWsltjOOhcGUg==
X-Gm-Gg: AeBDievGDDJlZ4dFRUKS/Od0IMD9VlmhX7fNqlB5o6ckFuZNbw84Bpd0zu9c81KpbFO
	PJWzPVj71C+3Agazk5S57k0+7bon9GV3sealekLUFxq0V4mZqLkF94kiNFjC1wcRTlh+rfOj1S0
	kWHZNgVw8MUqri1tVJxruAyL5/swR533eviTa6pCl0Um4rakBHmTz7NmR3KD8zWz+oSNc688rJZ
	w0Cn+8BIiDcZZdDZEXTP+CprpkB7YAynNd+21Xe5B7TES0z4bUr5YL7eSxBSgb5PR4HHYhqdiv0
	xP6jyHcO0XTTab2TB4isOBKOTQ+3mbzbvZ5gQ2IrNhOzlzbvhCUaqHD0b2Vv8dVhJmdqWZ21V5N
	xKa6zPtf3FHjCqCVzGEGCx4+gtpWy+6Fj3MeY54KpaGBxPkbw7r4J3kefpmQmdvr1HwK8/bP+FN
	8SI9q1LAIPlR4VwuDUz+XreaVZXZ8RDG9ffMrrXLz5fDzR7GOM8orPgHVDPuUWmpMyxM6GgldsZ
	IuY5juOXH2T++OP/isrsd3tf3I0z1ypf49TjcDW0gVr7iFWGIaARX28zcnR
X-Received: by 2002:a05:690c:c4f1:b0:7a4:8718:8c73 with SMTP id 00721157ae682-7bdf5db7bc3mr64184257b3.9.1778130600333;
        Wed, 06 May 2026 22:10:00 -0700 (PDT)
Received: from localhost.localdomain (h69-131-150-190.cncrtn.broadband.dynamic.tds.net. [69.131.150.190])
        by smtp.gmail.com with UTF8SMTPSA id 00721157ae682-7bd7d849afesm69888487b3.49.2026.05.06.22.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 22:09:59 -0700 (PDT)
Message-ID: <69fc1ea7.050a0220.306431.9eeb@mx.google.com>
From: Demi Marie Obenour <demiobenour@gmail.com>
To: virtio-comment@lists.linux.dev
Date: Thu, 7 May 2026 00:34:19 -0400
Subject: [RFC PATCH] ring: Forbid using descriptors in two chains at once
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>

Using the same descriptor in multiple chains at once creates
difficulties.  If the descriptor is device-writeable, this is begging
for data corruption due to conflicting writes from the device.  Even if
the descriptor is device-readable, the mere possibility requires devices
to use more sophisticated internal data structures.

Require descriptors to be used in at most one chain at any given time.
Indirect descriptors can be used if support for huge batches is needed.

Signed-off-by: Demi Marie Obenour <demiobenour@gmail.com>
---
I have not checked whether this will break existing drivers, so I'm
marking this as RFC for now.
---
 packed-ring.tex | 6 ++++++
 split-ring.tex  | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/packed-ring.tex b/packed-ring.tex
index 3ee55a18d024d4da1a48d522e98ea563b9809b1c..8fd5a770c7ca4e6f60911b2861e00a273a69ea73 100644
--- a/packed-ring.tex
+++ b/packed-ring.tex
@@ -473,6 +473,12 @@ \subsection{Event Suppression Structure Format}\label{sec:Basic
 
 This implies that loops in the descriptor list are forbidden!
 
+Drivers MUST NOT include a descriptor in a chain if the
+descriptor is already part of a previous chain whose processing
+has not completed.  This implies that the total number of
+descriptors submitted to the device, but not yet processed, is
+limited by the queue size.
+
 The driver MUST place any device-writable descriptor elements after
 any device-readable descriptor elements.
 
diff --git a/split-ring.tex b/split-ring.tex
index de9403882df1e6d20e16ec983ecf0a46d39efa6b..014e279ef1da7653c7051e3a24c6169fe8d51983 100644
--- a/split-ring.tex
+++ b/split-ring.tex
@@ -223,6 +223,12 @@ \subsection{The Virtqueue Descriptor Table}\label{sec:Basic Facilities of a Virt
 Drivers MUST NOT add a descriptor chain longer than $2^{32}$ bytes in total;
 this implies that loops in the descriptor chain are forbidden!
 
+Drivers MUST NOT include a descriptor in a chain if the
+descriptor is already part of a previous chain whose processing
+has not completed.  This implies that the total number of
+descriptors submitted to the device, but not yet processed, is
+limited by the queue size.
+
 If VIRTIO_F_IN_ORDER has been negotiated, and when making a
 descriptor with VRING_DESC_F_NEXT set in \field{flags} at offset
 $x$ in the table available to the device, driver MUST set
-- 
2.54.0

