Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D7D524B4
	for <virtio-comment@lists.linux.dev>; Fri, 27 Dec 2024 04:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735272610; cv=none; b=L0lPpl9XxP5HzxohdHlV5JBj+72PFsKlFk6ySZvzwUPYo8miF80zRo2qEQtzHV7n6Y650bR+BhQoWxCGgN7QA2nIebfGa/SOQ07qXjymGSEqbtP1RDLrAKJKGTXdCjNPg6f/RptttYirIWevlOyULuQC0YlnlUqgp/PyhcvJZ8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735272610; c=relaxed/simple;
	bh=YGmGlllMz3VIo3Zfu+V58ZJZmkEMy1i9TONXiZUDRqs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=a9KRkfNgLDwsMhT1Hm5b149OaZTw1GlDqY7TQqvFDgpUQzeP08nEZMG/dR/bQG9pnrdluMr2BMwY7kCvnb8jjuvjQN1xoR83omIGn/Lk86JVQ1pMycpVyat38CigDnZFmwsyARbnQlKOLVAmCJbnSKvac7HmTwQ7b8uIVpbUfns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com; spf=pass smtp.mailfrom=daynix.com; dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b=BKSYE62I; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=daynix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b="BKSYE62I"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-21675fd60feso108732965ad.2
        for <virtio-comment@lists.linux.dev>; Thu, 26 Dec 2024 20:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1735272607; x=1735877407; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jmPBBwSkoDxRJSPSrDCq+vGRX4xLTh1d5WUDQEgqz0o=;
        b=BKSYE62IM4Wg1c5iCXCuut8Fj7rZ5YYdXmM1qtlijDwEfzRP0jSNFfTl8pvfcigzZ+
         KJL6HjyJw5tQA3ABEkRsFi7F8zX/6R/48sZeyQLgBJN7gJfkx8ih6HapWhGngeqrFvC2
         x5/i4a7eQES/jxSfuTCG2yuv5DNKysYIyHsKhv7smlrnEbBTUFWrqbOmWUOhtYshyU+V
         nzNFHPXlpZxn8ztsSQ0acCrRdZ+9h4kJEtv4SFcOce+D6atJc6Do9nmIhcgIgzRjG3oL
         E7hU4nOnD5ICbzPHGkgOLwgjgdRD5Jzb8pee3mxDUsvVSHdsdFjf/3cdr+zfGSDu5gaY
         /HFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735272607; x=1735877407;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jmPBBwSkoDxRJSPSrDCq+vGRX4xLTh1d5WUDQEgqz0o=;
        b=AJ0PcMpMhLT5jV3w9T+XN4u+XMvcWtrgy8Y9S0J0K9cUf8HFzte6juyAZKPwBJp6UZ
         OmwsswO0JUoerGBZ/Nnn/MCXcPjUD4nAjo5gGF2a21rvEouHnOv608KDq6erwPJhSPYa
         lYk4HJXvKBpMU66h//aA9VXPXTA3lGmizaW4D+GmY5Dier+JvaNpH6nDTg1sHjvGe18G
         kwCH47Z/tNkvxdf7b6golgq740PjYoz6EMJesuG+MpRf5k6zxO7uYG8rTchO5EpmFY/Z
         eETUtRgsUkvQI4a3yCrnwXimSM2fO6qxp5K237SmoJWmB/8/xKd5u082+/y50uKK+kmq
         ePjQ==
X-Gm-Message-State: AOJu0YxlJi6KlsQo+uzw+Frvq8HaGx6XajT2Il2uyU2CerDCmF6AWLgS
	iYtKCyKzgZf8Zz0IFR9iu+Z9YcNBd9Lw9oNmkJxU0oadf3YumpJMNzS7irJzHRk=
X-Gm-Gg: ASbGnctgC0ZZiy0o1FR4aziNZNJjOU4FKMm2zOPXDe2sHWh2snZjMdYi4XJWxwWMz2f
	6xJVlUuW/MLk4gQuIti+O1jzu6rVB70682fRt3W/wfL3C5pPGg3Pc9c0yQv6yEv2XI6Xee4z6fq
	Xp8X5EONppUKtTD0hhxzq+owa4+mziNGSNKAjjz1jEtnacIjKjtIUq8LY/7BC1EtKrjCWyBoX+H
	uq0nb4XgDgygKhuZnMSJ+dnlvCOlZftl8AgVXPv/Jek+X83l6ay1vNR/xjM
X-Google-Smtp-Source: AGHT+IG8V3xwMdmtxV5uYb2Pc84bXIEDEFnu43bw4Nf7g9DoVb2nWSVfA3mKXiOFRxip84Et/RaSzQ==
X-Received: by 2002:a17:903:182:b0:215:385e:921c with SMTP id d9443c01a7336-219e6f285e2mr269442045ad.51.1735272607558;
        Thu, 26 Dec 2024 20:10:07 -0800 (PST)
Received: from localhost ([157.82.207.107])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-21a1773c654sm21775855ad.29.2024.12.26.20.10.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Dec 2024 20:10:07 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Fri, 27 Dec 2024 13:08:50 +0900
Subject: [PATCH v2] virtio-net: Ignore num_buffers when unused
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241227-reserved-v2-1-de9f9b0a808d@daynix.com>
X-B4-Tracking: v=1; b=H4sIAFEobmcC/22MQQ7CIBBFr9LMWgwMFltX3sN0QWBqZyEYMKRNw
 93Frl2+n//eDpkSU4Zbt0OiwpljaICnDtxiw5ME+8aAEi8K0YhEzSjkhe9HI2d11Yga2v2daOb
 1SD2mxgvnT0zbUS7qt/6JFCWU0KOzvTHDMDp593YLvJ5dfMFUa/0CSjtuj6EAAAA=
To: virtio-comment@lists.linux.dev
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
 Parav Pandit <parav@nvidia.com>, devel@daynix.com, 
 Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mailer: b4 0.14-dev-fd6e3

If VIRTIO_NET_F_MRG_RXBUF has not been negotuated, vhost_net and QEMU
leaves num_buffers uninitialized while the specification tells to set it
to one.

Let drivers ignore the field to make them compatible with
vhost_net/QEMU, in a way similar to hdr_len field, which is also
marked as unreliable due to implementation bugs.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
Changes in v2:
- Corrected the change description to tell vhost_net and QEMU leaves
  num_buffers uninitialized where it used to tell they set it to zero.
- Restored statements that require devices to set num_buffers to one.
- Link to v1: https://lore.kernel.org/r/20241226-reserved-v1-1-39ca566889c0@daynix.com
---
 device-types/net/description.tex | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index 76585b0..70c8b31 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -863,6 +863,12 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
 This is due to various bugs in implementations.
 \end{note}
 
+If VIRTIO_NET_F_MRG_RXBUF has not been negotiated, the driver MUST ignore
+\field{num_buffers}.
+\begin{note}
+This is due to bugs in implementations.
+\end{note}
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

