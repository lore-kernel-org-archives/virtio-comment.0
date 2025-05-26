Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D85F1A5BAE
	for <virtio-comment@lists.linux.dev>; Mon, 26 May 2025 05:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748236526; cv=none; b=F7dmV0WslxRqlLz4Af77p9/hPyFXthKW0vGKkXSjcNJJLRubiFGnw2+bo3JAT2BDiEpdAPstqdPneJ64C8vwGN2xW7C6cu2ASkn5qsJ/U0//nfgkF2A3u+yayrRhcZzxMEzuK4EmBv3hC+MaS3fkvAZFamegV3DeXI/1MIahJIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748236526; c=relaxed/simple;
	bh=rOmRct83ooIHBLbJ00wNkkY2Ecwiaj35daOOTYkPm9k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=fiuUfDbpWYMBvk3s6UaQmvpJ9nwdS7P4RamKUqpqSHvT39+7CCv3sUz+kwdm+hpPuWG5lR0pwgdJE3AdUI5Kf0UMdrwlSJsyDx7aDEpNrdiEeP9bQmvjOujE21gJOXUnXkzerEYeuLiME6zIfJX27St2o8JhoD0eERgyZAgz334=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com; spf=pass smtp.mailfrom=daynix.com; dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b=IbnqWhbE; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=daynix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b="IbnqWhbE"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-234477e3765so5808145ad.2
        for <virtio-comment@lists.linux.dev>; Sun, 25 May 2025 22:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1748236523; x=1748841323; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ESuzN9Y6PKX+o3VYi5Er7Jid+BNDnqwA1pBWoA8Ts74=;
        b=IbnqWhbETnAFGZrpw9OmumWEvIAA9ixbTFmnFk2eCy4FwDVR3mAnPHRCAD4NVzHqxP
         pQFkLk4NgvhI6JMjbPG6adJ3pXwnHcjmPYv806Uh2CFdJy3F3x3Il6J3qfrIXI1aa72F
         6WrmY1oLNoklh1XqsG8iLjKpaAM+9bB2Hp/vILURhz+m0AYbFym/6e21LCnDCEA89Fu0
         xrZ7nsBq+b0KX8j3gWJtuIawcrxGvNXEke6f8y8pOstcGjyQsyfmly9AFM6mioB3MbZu
         MFOt8Ddp9tVOQ6rN6w+KQJVgGI5Tp9AjKg7+552lvanMi67VZfPF5nUjOGXKh8WG+o9W
         hBSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748236523; x=1748841323;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ESuzN9Y6PKX+o3VYi5Er7Jid+BNDnqwA1pBWoA8Ts74=;
        b=c0Ldev3slXkcKveNfUD0TPQ49cL53LlBBOX5vq28IGo0o0xZPTPLeCBQ4+ViWSEm1a
         GOwNPYnaHB5T2prmL8fVrE2miKebZUvN5qLN2uT12xFSs8Dr1qkHYSLTCctJCz8rGEbt
         B0uuqsbvy61cBv69IMmqrs8w1pt6k1Y+agxvs2XXVjaX6oRcVdM/Bfe6mpJ/05B9MvC3
         jeuDaIAKaG+XesHJxZD5nx+hO14hPybzqZzTnPxWC+bmXuJOTiilBQMP4oI7BrM0bp2n
         AitEp9L0IbL3Zmy1y1mpognCYswqHoGafL7zZSjAdVpb/0/py/4koqeFhDWzB7uTtJie
         VrPA==
X-Gm-Message-State: AOJu0YzXf9o+nuijU80lN/bWFJGbsmNOAufTC0p8fu0FINjW//cp8sQU
	F7Rijq1/pJ0RNpIeQqNJtqmwGshO9LW3+/UHodzW9yL2qL8PppNfWL0UEYWA9ZankQ4=
X-Gm-Gg: ASbGncsy0F1JocPtM902Hq5emkAU181GxuzcvHnhJOhf0LenASlY/yhEld+3Twe/eE+
	X62ms0cEeUiIwL6uHY5E/S1SMDV5RN59G+MpbPtQLmkgDzhisN/POYcjSzsX+KpEjFQvYaQin7e
	vBjfDsi2FUSvExwtlxRNG35aKwMhDDhYZe/1Lsom1wWaiQPe/fJTp1qJnXQS5eDkJHLBLtEw9oz
	bOGJjDJyv87qHCFdzu+gZMuay9XQXGLgRgjw819RZrlE5MWLvUy2IkcAqnxoDkNkWSgYI7InM+7
	0nHcS4+9bNRAjmaLLwiIGypM4244W5KbhlMiYJDgP60Wd6SOjX+3
X-Google-Smtp-Source: AGHT+IGTNXsbfNcRsdXU+Yq78H8suL4tXdFA2kLALpOIEl6tWBA7Feh+7erDOpJLBC/0ULY3SdCxjw==
X-Received: by 2002:a17:903:46ce:b0:223:4537:65b1 with SMTP id d9443c01a7336-23414fc9572mr135252965ad.36.1748236523491;
        Sun, 25 May 2025 22:15:23 -0700 (PDT)
Received: from localhost ([157.82.128.1])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-23448a49b13sm16435985ad.61.2025.05.25.22.15.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 May 2025 22:15:23 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Mon, 26 May 2025 14:15:19 +0900
Subject: [PATCH v4] virtio-net: Ignore num_buffers when unused
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250526-reserved-v4-1-70231a8edc79@daynix.com>
X-B4-Tracking: v=1; b=H4sIAOb4M2gC/23N0Q6CIBTG8VdxXEc7HBShq96jdUFyTC7SBo3pn
 O8eurXZ6vI74/dnZpGCp8hOxcwCJR/90OdRHgrWdLa/E/cub4aApUBUPFAWiRx3lVHQiloiSpa
 fPwO1ftxSl2venY+vIUxbOYn1+ieSBBdcmsZWSmltGjg7O/V+PDbDg62VhHtZ7yRm6ci05gZWg
 3Y/Un5kBULATsos0ToCWzkE8/3nsixvjLWiCRUBAAA=
X-Change-ID: 20241226-reserved-d5960f173223
To: virtio-comment@lists.linux.dev
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
 Parav Pandit <parav@nvidia.com>, devel@daynix.com, 
 Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mailer: b4 0.15-dev-edae6

If VIRTIO_NET_F_MRG_RXBUF has not been negotiated, vhost_net of Linux
prior to 6.14 and QEMU prior to 10.0.0 leave num_buffers uninitialized
while the specification tells to set it to one.

Let drivers ignore this field to make them compatible with old
vhost_net/QEMU, similar to the hdr_len field, which is also marked as
unreliable due to implementation bugs.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Reviewed-by: Parav Pandit <parav@nvidia.com>
---
Changes in v4:
- Noted that the mentioned bugs are fixed with newer implementation
  versions in the patch message.
- Noted that the bugs are of devices. (Parav Pandit)
- Link to v3: https://lore.kernel.org/r/20250110-reserved-v3-1-2ade0a5d2090@daynix.com

Changes in v3:
- s/MUST/SHOULD/ (Michael S. Tsirkin)
- Link to v2: https://lore.kernel.org/r/20241227-reserved-v2-1-de9f9b0a808d@daynix.com

Changes in v2:
- Corrected the change description to tell vhost_net and QEMU leaves
  num_buffers uninitialized where it used to tell they set it to zero.
- Restored statements that require devices to set num_buffers to one.
- Link to v1: https://lore.kernel.org/r/20241226-reserved-v1-1-39ca566889c0@daynix.com
---
 device-types/net/description.tex | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index 76585b0..4a2df5a 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -863,6 +863,12 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
 This is due to various bugs in implementations.
 \end{note}
 
+If VIRTIO_NET_F_MRG_RXBUF has not been negotiated, the driver SHOULD ignore
+\field{num_buffers}.
+\begin{note}
+This is due to bugs in device implementations.
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

