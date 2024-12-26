Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE1F12B71
	for <virtio-comment@lists.linux.dev>; Thu, 26 Dec 2024 05:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735191451; cv=none; b=h4yNcmKg/OnjwJv+kSiu4YLjhBI+KEIJSy343PjUt54NLV277J81hrLit4z1PemkBuC5VRngQwx5DgBMenujuOLxYmVKHiVhbEeK4uEAPvhZ+zJ6CdEEKzVxnAomBojvuSlplwsHw5WUHfep1f6jbaTJJst/0Dal3VYD4A4iMhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735191451; c=relaxed/simple;
	bh=u/750qcEGfUwwBTTALJrduD9YsKngF4kAkZTTX1FOgY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=gaHQWqBLQyXCGOX7PokXwjJg+9WzwBdy9B1nsBxERYIJcnLIwBYpqXShNCxHKi1eBIv6lvJr43p/9NB2MaCtvBA7g0czH5TXiwIBJKxh0+6OFbLaNQWXh6cB/0cMS+Sat4bgZdu7Rg8eekuHzj15weegi+y6ZcrT2L9bNIHzyUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com; spf=pass smtp.mailfrom=daynix.com; dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b=IYyE3zqz; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=daynix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b="IYyE3zqz"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2165448243fso82854915ad.1
        for <virtio-comment@lists.linux.dev>; Wed, 25 Dec 2024 21:37:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1735191447; x=1735796247; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=it7M5gOYpaPxi2KJIqZTLDjsmYbG233wh9UoTyul2Dc=;
        b=IYyE3zqzQt3KXL/xFmOHQQR3wx4RvWbGTqFdXVwJivTgS+Lur98pINvj45sDNWrASv
         HPmeqkVijEIuVjbVChKx/cRV5uy8lo0X41GNbcRpChZpFL/MuJL1oOwl41o7NfnYSBc6
         oqhFuAdFcdwjLz9+yqoiQaBcz7XmAMVqlITTh0xk1Qv93pur2sHDHvcDN4Lqa4wXcFK1
         PIrZunlcmfCxKWq6xCRCeNlOvEXRLHuBWh726zboLjp3nxqVfJOIwqnNPLcs4w4GxrIn
         Dr/MDOI5+zrrDmdtwRoaAiD0qBdU8w/3uC85q8P4NHMM/cjORD/Wk3DUgJnYEvx35J1K
         1sWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735191447; x=1735796247;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=it7M5gOYpaPxi2KJIqZTLDjsmYbG233wh9UoTyul2Dc=;
        b=En70DirdmmlDhhpCEvaKE0f623RM1ig7PnF0WnPN9UgAnwddXWWbwagWF6wC8acCze
         JU4MwCG5lCK+zLFd9jYJEHPNmcfkf6XzxGAFm9Hw/MDvU1aWc4fOCNYg2yx8/BqpDway
         mHfHb+E4j5HFtjbBGqtqX7HYICETBXmyoe2GmgiQp/Viin5Hnt8CK2Yq+j4E9mIK3oMn
         IMzIyyzwIhmSRe8mq+wuJSpRshs087xRsA9Ql2mMdihHLUAUOrBXAsBYTq/dc3bfT2Pb
         OML+l+zBlvY9kdSy4Y+Tn1EmXNP19rHmGUeQy3Do/M0RVtki4Xka1IcSXU0cKc5ndQ8t
         Diig==
X-Gm-Message-State: AOJu0Yz8RCOWO0jClYEGFJMqxyiH5KCS4IlNR1ceiCk2QKaB9B1AywoA
	l0K2N/LnXw0kc8AWh05J/YoFYQ4Es8dB0S0CCZga4EaHEfUHanopSciXgxrgm1di/enAINdsvqC
	uXuE=
X-Gm-Gg: ASbGncukA4mu6V8/uC/sTN0pflzJOrNnkz6HFxBxq7HehW6WvvzE/U6yNnrI6NJkosQ
	3aNXurRMMeZYWl4ntONrimP4lusozmdr2DD1/fBKt7i22rUJMnnkjrZeo0ocRQdLNGnmwkuzzMC
	xHLM1GCZwOqZzJZm6u5zmm2pdmpjZV5d+qj2hl8Luo/uSA+eklg7RLxP75Rg1d6DBM/V9nC6jFB
	19fBJZEnrwEPCA7AA5gr0yIWqm1Cg1KkAU/0CJLpLvOUcLpgYPRMRqNGEnw
X-Google-Smtp-Source: AGHT+IEuAjEDAo6OuBEKlAV1hYNyMD+DvEy6lVStdPcY3NouvoDBwXq2M1CxL8We7zw7OI+sDQ9TFg==
X-Received: by 2002:aa7:888d:0:b0:725:f1ca:fd75 with SMTP id d2e1a72fcca58-72abdd3c299mr33271968b3a.2.1735191447301;
        Wed, 25 Dec 2024 21:37:27 -0800 (PST)
Received: from localhost ([157.82.207.107])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-72aad8fb941sm12092237b3a.160.2024.12.25.21.37.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Dec 2024 21:37:26 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Thu, 26 Dec 2024 14:37:17 +0900
Subject: [PATCH] virtio-net: Ignore num_buffers when unused
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241226-reserved-v1-1-39ca566889c0@daynix.com>
X-B4-Tracking: v=1; b=H4sIAIzrbGcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDIyMz3aJUoI6y1BTdFFNLM4M0Q3NjIyNjJaDygqLUtMwKsFHRsbW1ADr
 m/AJaAAAA
To: virtio-comment@lists.linux.dev
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
 Parav Pandit <parav@nvidia.com>, devel@daynix.com, 
 Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mailer: b4 0.14-dev-fd6e3

If VIRTIO_NET_F_MRG_RXBUF has not been negotuated, vhost_net and QEMU
sets num_buffers to zero while the specification tells to set it to one.

Let drivers ignore the field to make them compatible with both
vhost_net/QEMU and devices already compliant with the specification.
Also, remove statements requiring devices to set the field to one to
make vhost_net and QEMU compliant.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 device-types/net/description.tex | 26 +++++++++++---------------
 1 file changed, 11 insertions(+), 15 deletions(-)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index 76585b0..b82fe8f 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -683,15 +683,12 @@ \subsubsection{Setting Up Receive Buffers}\label{sec:Device Types / Network Devi
 
 \devicenormative{\paragraph}{Setting Up Receive Buffers}{Device Types / Network Device / Device Operation / Setting Up Receive Buffers}
 
-The device MUST set \field{num_buffers} to the number of descriptors used to
-hold the incoming packet.
+If VIRTIO_NET_F_MRG_RXBUF was negotiated, the device MUST set
+\field{num_buffers} to the number of descriptors used to hold the incoming
+packet.
 
 The device MUST use only a single descriptor if VIRTIO_NET_F_MRG_RXBUF
 was not negotiated.
-\begin{note}
-{This means that \field{num_buffers} will always be 1
-if VIRTIO_NET_F_MRG_RXBUF is not negotiated.}
-\end{note}
 
 \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network Device / Device Operation / Processing of Incoming Packets}
 \label{sec:Device Types / Network Device / Device Operation / Processing of Packets}%old label for latexdiff
@@ -704,9 +701,8 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
 Processing incoming packets involves:
 
 \begin{enumerate}
-\item \field{num_buffers} indicates how many descriptors
-  this packet is spread over (including this one): this will
-  always be 1 if VIRTIO_NET_F_MRG_RXBUF was not negotiated.
+\item If VIRTIO_NET_F_MRG_RXBUF was negogiated, \field{num_buffers} indicates
+  how many descriptors this packet is spread over (including this one).
   This allows receipt of large packets without having to allocate large
   buffers: a packet that does not fit in a single buffer can flow
   over to the next buffer, and so on. In this case, there will be
@@ -717,9 +713,9 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
   The other buffers will not begin with a struct virtio_net_hdr.
 
 \item If
-  \field{num_buffers} is one, then the entire packet will be
-  contained within this buffer, immediately following the struct
-  virtio_net_hdr.
+  VIRTIO_NET_F_MRG_RXBUF was not negotiated or \field{num_buffers} is one, then
+  the entire packet will be contained within this buffer, immediately following
+  the struct virtio_net_hdr.
 \item If the VIRTIO_NET_F_GUEST_CSUM feature was negotiated, the
   VIRTIO_NET_HDR_F_DATA_VALID bit in \field{flags} can be
   set: if so, device has validated the packet checksum.
@@ -764,9 +760,6 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
 \devicenormative{\paragraph}{Processing of Incoming Packets}{Device Types / Network Device / Device Operation / Processing of Incoming Packets}
 \label{devicenormative:Device Types / Network Device / Device Operation / Processing of Packets}%old label for latexdiff
 
-If VIRTIO_NET_F_MRG_RXBUF has not been negotiated, the device MUST set
-\field{num_buffers} to 1.
-
 If VIRTIO_NET_F_MRG_RXBUF has been negotiated, the device MUST set
 \field{num_buffers} to indicate the number of buffers
 the packet (including the header) is spread over.
@@ -863,6 +856,9 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
 This is due to various bugs in implementations.
 \end{note}
 
+If VIRTIO_NET_F_MRG_RXBUF has not been negotiated, the driver MUST ignore
+\field{num_buffers}.
+
 If neither VIRTIO_NET_HDR_F_NEEDS_CSUM nor
 VIRTIO_NET_HDR_F_DATA_VALID is set, the driver MUST NOT
 rely on the packet checksum being correct.

---
base-commit: b495841a8e80d12c1130f8868f4128866291142d
change-id: 20241226-reserved-d5960f173223

Best regards,
-- 
Akihiko Odaki <akihiko.odaki@daynix.com>

