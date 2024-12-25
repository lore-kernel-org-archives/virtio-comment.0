Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869E114831F
	for <virtio-comment@lists.linux.dev>; Wed, 25 Dec 2024 06:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735107724; cv=none; b=HzocrMydySDp3qC1ji69hQ9namE3w7/rQkFpSbut68qGRI5YndmyY4JYmFgjZ1/+IyHqgrMqJw7YTwd/OaM6UIU81h2o34Rh6oHY6mXbJAXJUKcmg0sl+0GyNfQhw1IdF5AS8Ee9yxO6bVp1/9lomEonbVZIproPmViWsa3DJ+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735107724; c=relaxed/simple;
	bh=N43GTefhVnsakddskLyaJwslea9g9J3+hy8xf/YiXRk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=kg+8FgxF7XSqK+ZK1CpfIzjIdX2QdpWhAuvNXio+U9tyfyEt9QWgVxjDTd0CtMECFuI5RpSp4udnl5CXlyL6HBoMLObA/gOpMYnNncPSSWpaQQNIpy6+QfdAKruEGRDmi/KWe+D1RwGGwI7+4T8wEIX/p7XB+ZcldnW4GWysFJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com; spf=pass smtp.mailfrom=daynix.com; dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b=GedtAMOf; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=daynix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b="GedtAMOf"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2166f1e589cso72544325ad.3
        for <virtio-comment@lists.linux.dev>; Tue, 24 Dec 2024 22:22:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1735107722; x=1735712522; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Asbs8Pr5QjqRsL4KEH28ZNlWV5Jt90ZnTE1SkanYNAo=;
        b=GedtAMOfhmwiwZXE8RVJf6bcLw2YgLLsWsEmaPUR2Ih7Or9Jffh1j2CarQlGMNMGfB
         kv7aU7Rbb5pHVL4Zx5YccP8R9OL3GycSFFqD5j46VOOiyjh+APGvlN7rkVWsHYOy+I1v
         CpASyKx0sUVJz41a12GLWqleqM+3XCMLbjsseYDXIjelOJMB3JpJqkdcEunUlGzunird
         fefsHEIdbxo9d9AhIFEAmqvXpuBTG/SJraQZPaEU4urgsINXRuWSxZ3pDP0uwLAfDuLz
         TFs8uFHQmi0sC6T/XNPr9X+7w8MTr8SnNPvNVG1Bvz1+DbcnnFQc7NiCsh5fziQ72mVC
         YH0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735107722; x=1735712522;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Asbs8Pr5QjqRsL4KEH28ZNlWV5Jt90ZnTE1SkanYNAo=;
        b=FBPTuni4mdds+VcfJdvQJ2z7mAy3e6+Rm3ZXrTsu7KdIIjW73uaZfcGUuwngku/dEb
         dfaRIjlkF/GKv0cx0qWjpe+Zc0I8B7OKx0R8dpHcTcU67nkkPFlQUo5PaK41mCdtUijx
         BG4X1gKwetMT2Is42PYQnuNgEbXWevxS5nyPxXQ8scF6RA1piBUxSucOTYfNR8Mfk2Ps
         8u2+oOh4GKnkP4FGDLhQ6w2DS3/caiIWos7PLrmaDAVjzLaE2lhsMZyj0srOW91+3h+o
         oRxYuYzuzvUJfLVdL4xDoDd1Yw3UJGK3MUwxMG9oiAibNtGoOBd+x7EsnP380u4j/jlX
         IkXg==
X-Gm-Message-State: AOJu0YxvZN2KCRZCgX0o3sTymR9mQbEoUM7bndx9GIS8J27USKtYEPGq
	IOJmI2OI9n/W9vJ/o6sQrpVz2AvxHe1oAUaJe6eglrgG+BKK+dWypZyArOsT1bo=
X-Gm-Gg: ASbGncv5UAixbv6VtPrrStN6OSiBSHlcvb2wMtKmhM8OqnLtqjRg+d187CFg2SDLa/n
	IzbuFmTQZEfrVLmP4wyBC/1qh4252PEP/x+2jx6DkQw+ZhtRaMvergNqMLSceFFEMcmpumFifTz
	AQBvJ+kN4dr9RWxajhnfEIC3vhl5xSvW2c5dnnedtO8Nnk4ck5LU3Pw+aKkWx3vFNk7ziAsc4P2
	l44DNW3GyiF5Jv/BXHPRK1gfAspoQ6T8A7noHDnyZZph/SEFa6A5wThrPio
X-Google-Smtp-Source: AGHT+IElioWU0FWwJwswZMYgGnP8dhCQk7Jxm7lRh8+72/+qVE2AB76fngRYVgsDt3gDeVS0BXqprg==
X-Received: by 2002:a17:903:94f:b0:215:5ea2:654b with SMTP id d9443c01a7336-219e6e8c916mr321627665ad.1.1735107721694;
        Tue, 24 Dec 2024 22:22:01 -0800 (PST)
Received: from localhost ([157.82.207.107])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-219dc970c8fsm99011885ad.60.2024.12.24.22.22.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Dec 2024 22:22:01 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Wed, 25 Dec 2024 15:21:59 +0900
Subject: [PATCH] virtio-net: Change num_buffers value
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241225-buffers-v1-1-712e839e8ad1@daynix.com>
X-B4-Tracking: v=1; b=H4sIAIaka2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDIyNT3aTStLTUomJdY8NEyxTzpJSUNAtjJaDqgqLUtMwKsEnRsbW1AKf
 iKFJZAAAA
To: virtio-comment@lists.linux.dev
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
 devel@daynix.com, Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mailer: b4 0.14-dev-fd6e3

Linux's vhost_net and QEMU sets num_buffers to zero when
VIRTIO_NET_F_MRG_RXBUF is not negotiated. Change the specification to
reflect this reality.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 device-types/net/description.tex | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index 76585b0..f916e74 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -683,15 +683,14 @@ \subsubsection{Setting Up Receive Buffers}\label{sec:Device Types / Network Devi
 
 \devicenormative{\paragraph}{Setting Up Receive Buffers}{Device Types / Network Device / Device Operation / Setting Up Receive Buffers}
 
-The device MUST set \field{num_buffers} to the number of descriptors used to
-hold the incoming packet.
+If VIRTIO_NET_F_MRG_RXBUF is not negotiated, the device MUST set
+\field{num_buffers} to zero.
+
+If VIRTIO_NET_F_MRG_RXBUF is negotiated, the device MUST set \field{num_buffers}
+to the number of descriptors used to hold the incoming packet.
 
 The device MUST use only a single descriptor if VIRTIO_NET_F_MRG_RXBUF
 was not negotiated.
-\begin{note}
-{This means that \field{num_buffers} will always be 1
-if VIRTIO_NET_F_MRG_RXBUF is not negotiated.}
-\end{note}
 
 \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network Device / Device Operation / Processing of Incoming Packets}
 \label{sec:Device Types / Network Device / Device Operation / Processing of Packets}%old label for latexdiff
@@ -704,9 +703,8 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
 Processing incoming packets involves:
 
 \begin{enumerate}
-\item \field{num_buffers} indicates how many descriptors
-  this packet is spread over (including this one): this will
-  always be 1 if VIRTIO_NET_F_MRG_RXBUF was not negotiated.
+\item If VIRTIO_NET_F_MRG_RXBUF is negotiated, \field{num_buffers} indicates
+  how many descriptors this packet is spread over (including this one).
   This allows receipt of large packets without having to allocate large
   buffers: a packet that does not fit in a single buffer can flow
   over to the next buffer, and so on. In this case, there will be
@@ -716,10 +714,9 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
   descriptors.
   The other buffers will not begin with a struct virtio_net_hdr.
 
-\item If
-  \field{num_buffers} is one, then the entire packet will be
-  contained within this buffer, immediately following the struct
-  virtio_net_hdr.
+\item If VIRTIO_NET_F_MRG_RXBUF is not negotiated or \field{num_buffers} is one,
+  then the entire packet will be contained within this buffer, immediately
+  following the struct virtio_net_hdr.
 \item If the VIRTIO_NET_F_GUEST_CSUM feature was negotiated, the
   VIRTIO_NET_HDR_F_DATA_VALID bit in \field{flags} can be
   set: if so, device has validated the packet checksum.
@@ -765,7 +762,7 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
 \label{devicenormative:Device Types / Network Device / Device Operation / Processing of Packets}%old label for latexdiff
 
 If VIRTIO_NET_F_MRG_RXBUF has not been negotiated, the device MUST set
-\field{num_buffers} to 1.
+\field{num_buffers} to zero.
 
 If VIRTIO_NET_F_MRG_RXBUF has been negotiated, the device MUST set
 \field{num_buffers} to indicate the number of buffers

---
base-commit: b495841a8e80d12c1130f8868f4128866291142d
change-id: 20241225-buffers-31a9d7bddf83

Best regards,
-- 
Akihiko Odaki <akihiko.odaki@daynix.com>

