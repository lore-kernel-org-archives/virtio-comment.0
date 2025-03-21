Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14CA1E7C05
	for <virtio-comment@lists.linux.dev>; Fri, 21 Mar 2025 07:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742540491; cv=none; b=aZCRkFm/zMmGVRWWyX+NFpoZLquf3bcVKj7v9m9uuPdF2foReuIB3MiI05Cn6rzTIi4+CmTZukK8tN0f+YlGbeLOMrbqK1J6kXR+JBEHa5ZqBeBkLX2KIuPZsmhcD3NmnpDmYmCqPma/1sU9qhwdF1WNw413k1Dq5UwNUNjIvWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742540491; c=relaxed/simple;
	bh=muipbQ7Lkz1KxI9izFgySQspWk+deBC9Y3KJJcUx3pc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=tKZ5Sh5U2UH7zx0ZmZAm0q2VBvZGpNW4n/xIVeaLnc8rVeQHvFnSU+WFeacepUWNFN7VhceeiK6ir/ahgLhNVUYHzsWY7A+C6u51kYUUViU9pV79LW4yKg7NAEZXauiqJ3tUupSDG0BVx0YIvnEuOsqOZrmYKRacYjcDHMGas/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com; spf=pass smtp.mailfrom=daynix.com; dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b=097NX8ZF; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=daynix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b="097NX8ZF"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-22398e09e39so33112805ad.3
        for <virtio-comment@lists.linux.dev>; Fri, 21 Mar 2025 00:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1742540489; x=1743145289; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Eoz/n6p/8pTkgnGF8SI8o2U5CAREZ7JoZMbljMZKTC0=;
        b=097NX8ZFNw1Ny/NTHVz4dHbJzgMRcVuzRhRS6xXpsE7kE5ulj0dTOKR/MN+PSxR3Z7
         xiyXDToFxLCm9+CtAXgT7AXIE8KmFeNOIAAFRaAkwmpe3D01JG9ioM6BFTBuwukd8bXV
         JEeSv3sEiCsC6RDpsOo6i1mwr9OItIoshffB2XD7AJQk+934LZ/yYchWKuPiMBKpMXis
         DALvc+LDtHetXraQFfXPeRlZeCdl7CyT61dIeEMc0A/oEQmhPiRz4OuZJFP+g0HQOM7f
         9NPetbabW2DcHFDnqsrheQTWe2T2YwUiBbw5SZ1k3hJEP1UkTqIeuHZSW6PstA9nYdal
         x3gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742540489; x=1743145289;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Eoz/n6p/8pTkgnGF8SI8o2U5CAREZ7JoZMbljMZKTC0=;
        b=jZg+vzdk7dC41AxNXvjMWzheEGPbVZ2iiqvNHUDhqtKswOCbdIsDnhtwtpEqUiHEry
         JCCgAMm9Mghf4Wcks7bdyWTNPeyQs9uSFrd94NKujUr80Lrzsv3qoOR02ysGlBiLwkk3
         u20OIYjddZOUnVqYyYkS2uVAu1oCW2i9r3F9B7f4mISzoN5uuCTSBKQdhl1OlcH9gLKu
         bDZm9+fv8MomicEvHPw85cJsnAWiQRYd1y77Vd9sbPFbCRBzhU0PuXI5rzeOcVHfuT9q
         VW7DDb4T0a8Jj1WJy/m8mX2RyAoWjubb/99sDRUKemJGEm7cYBPCAMGq3MPrPyv0sg6m
         ALIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtoUslCvk2N1cue7kiZz178gwNbm1A5QEBtMrGLaq5K/DBl84yrGjD99T5sUh1mDjvxpj7byPCNBSdxvcp9g==@lists.linux.dev
X-Gm-Message-State: AOJu0YxbHZEadGa2x1HjpPijzx3oYj7W0ZJV2C09EwFQztcPZHsWgdRL
	x2l8HiH+/+ewOlkhChdOKcquiCEUODJjzAtX52ykyKwD5pjp2cDPNzv4mKekx48=
X-Gm-Gg: ASbGncsc642y58IXI2GBxo03tKc0SRt8JliB+HhhQENH+L+eA5LB+U+7gm/1MQBVMk+
	oRBYBQPJpD3AiSQF4k9jRgFF6iCYS/3Nd1xwyeGHJbpfSS1hQf7PmCUBWHAZ+IdEDsuagBjIN7q
	beXCbSYO3gehSCioDd92F8R60OhfQ1jWld52bveRoK9osAvdseG2KR2HeFgO7V6Yjgal02fLLIJ
	s1d1xVAZY1IExr6xeM4UWocvnxNf0qFFtohdNWZNEhymtiqeSkLd76aKaihlwGsKjUQxve06Zcy
	qKGEn4nZBvHt6a37msAJbmrlsnWF/FD/8romBpbQLzTFWIou
X-Google-Smtp-Source: AGHT+IHxC7cqcRT2zOFm25SplI1RpvQaP9dFkqBeZhstHSHW55BwR6bVojnmgU6aY5ijlJW/TVo0tQ==
X-Received: by 2002:a17:902:f68c:b0:223:37b8:c213 with SMTP id d9443c01a7336-22780e3fcfdmr25391005ad.52.1742540489065;
        Fri, 21 Mar 2025 00:01:29 -0700 (PDT)
Received: from localhost ([157.82.207.107])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-227811da347sm9226915ad.161.2025.03.21.00.01.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Mar 2025 00:01:28 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Fri, 21 Mar 2025 16:01:23 +0900
Subject: [PATCH] virtio-net: Update the max_tx_vq description
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250321-tx-v1-1-dd21fbdedf7a@daynix.com>
X-B4-Tracking: v=1; b=H4sIAMIO3WcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDYyND3ZIKXXOLVBOTZFODRANjUyWgwoKi1LTMCrAh0bG1tQB8nPS0VAA
 AAA==
X-Change-ID: 20250321-tx-78e44c50a035
To: Jason Wang <jasowang@redhat.com>, virtio-comment@lists.linux.dev
Cc: devel@daynix.com, Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mailer: b4 0.15-dev-edae6

The previous description said:
> A driver sets \field{max_tx_vq} to inform a device how many transmit
> virtqueues it may use (transmitq1\ldots transmitq \field{max_tx_vq}).

However, it also controls how many receive virtqueues a device MAY use.
Copy the description of the virtqueue_pairs field of struct
virtio_net_ctrl_mq_pairs_set, which also has the identical semantics, to
clarify that.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 device-types/net/description.tex | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index 76585b0..5178191 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -1578,7 +1578,9 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
 
 Field \field{indirection_table} is an array of receive virtqueues ids.
 
-A driver sets \field{max_tx_vq} to inform a device how many transmit virtqueues it may use (transmitq1\ldots transmitq \field{max_tx_vq}).
+Field \field{max_tx_vq} specifies the number of the transmit and receive queues
+to be used up to \field{max_virtqueue_pairs}; subsequently, transmitq1\ldots
+transmitqn and receiveq1\ldots receiveqn where n=\field{max_tx_vq} MAY be used.
 
 Fields \field{hash_key_length} and \field{hash_key_data} define the key to be used in hash calculation.
 

---
base-commit: b495841a8e80d12c1130f8868f4128866291142d
change-id: 20250321-tx-78e44c50a035

Best regards,
-- 
Akihiko Odaki <akihiko.odaki@daynix.com>

