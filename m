Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1221F2C34
	for <virtio-comment@lists.linux.dev>; Tue,  1 Apr 2025 13:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743514564; cv=none; b=b7N8JMacqFOiVgT2QoNwFpCENXDBJE0SmWezT+uw/szZjtXbQU4lBmACJiS4XU8dvgXQQei9wc7WoXddY05MjFOI/hhL8FIr33s4vaBKsh1ZnetsSMzGtSyhVhmI3TXTSsz8UBIV2KMX0g4E8LKR4xos02Jn8Nnbh2ecUNz+Qpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743514564; c=relaxed/simple;
	bh=pgn/u22zJjhsCdnzfGy6SVu2Ji+NmLKWHELehxwWj0c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=f4NNvwMuDQvnlv20JnbGiY6uxZlM1S+W/g6sJWQ4SuwNUdxYwJt3Ne00QOqVomhZ1JzGAkB6m5ubPJUdiJFzzThAi25Xan/UkkqUyhoWe6FYgcuu+3RFo+70xCddZWfHZIQGGnRO1+Q0velcC6xbCp6DSi+ec7/1I8ZM77kfzlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ERuTj4yC; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ERuTj4yC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743514561;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5yWI2iB4q31sO3wkRHSXY3dYE+AxzvSw65kA7oqUa0E=;
	b=ERuTj4yCpzdgiZriTu8wUIc57qPpMdS0VjY9QPT8jwkEKLMnk9e0PfbaCSKNNPe9vE4iCG
	D2WY9FvSezRi0KuNwJwDNFX8WbbnGoajzo8v69Ihp6rA/snV/rptC7IGdpgz0ndS7MJFl9
	0xhvlSkT3SZQ1BQxZZti6cH2gKEVYnw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-527-CdAzy7riM1-cANNs2gzGig-1; Tue, 01 Apr 2025 09:36:00 -0400
X-MC-Unique: CdAzy7riM1-cANNs2gzGig-1
X-Mimecast-MFC-AGG-ID: CdAzy7riM1-cANNs2gzGig_1743514559
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-391315098b2so2427007f8f.2
        for <virtio-comment@lists.linux.dev>; Tue, 01 Apr 2025 06:36:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743514558; x=1744119358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5yWI2iB4q31sO3wkRHSXY3dYE+AxzvSw65kA7oqUa0E=;
        b=msPU5S5m6JgKg0mAgOHuGg9Cz9TLEXE3ZyxEjles+Zp4ER14mqzZSKEpDshwS+UCdI
         r/Bv55FJZIQ2JdAMFNXVM0VMn5+nXRgZpq/uiCAor4te39zZJDs6PDuD6UVU4Wo0RwRH
         edVQmRzFfXALw9XfuG3Ya94iphK3UNPlV1uHv6v5IO+xjp0MeIpfl9iy1GQWc03m3zLg
         jPNGL//AJSXZ/e22ui6Hor1goT65B8aHaPq7Ekmq3j6bD2Z01jgCJ57o72clxQ9/Fy4I
         l9q5jgQBs9iEX+e1BVjUqXKGWERjG+2Ka6RvL6BRL+J8idVekjfxw76e2linPoIp20kr
         6prQ==
X-Gm-Message-State: AOJu0YzkxoGWZ+wYzJ/4+LNW+rBCRcCp1yo5F7FoLDM8GpDg9XZ/a/4R
	OOg6Ufm87XHh5IcSlzZC3bLLTb5Skm/NDuhhrmndlvmN75IgunuEfaTSpf9GPiBEjU7UpP5NWAa
	e3Hl/oWjbCAS14aPiiXUkt1hbu47X+LbB2n4myrR25rUj/tlFLdSxSeWhVPtvpXuAGTsrva6i3D
	Q7t+4J2loVGNgADe542uYOA6j29EDGWVxkwTklo0+u1ShBIGs+
X-Gm-Gg: ASbGncvGY6A/b4ROX+/SAhJqGd/nnR7f0nxLNer1gqVQvoj8QxdAZLz08sXrcF6+U33
	5mmgIdRseEJQLWNehGc2QQyvyTnOm4IFpZtd0P+B95XrBGgLtEHGDpYKNvjEWwJmSTcqxiBD7CS
	ECLAwfjR72yCh4+xUDi1Xi3vhsvL4LpArYpZm5is1qMdXv9r7AioIHtELiNXE7U613NHHV9h4aM
	B+h/ETYrENGlfS5V86w29Ld7j1bmquoYovGpWnMFkeB8NDx/JYXWKzoFzNBRMG7knQwScYK7dnX
	AnVRd/BUSe+b7OREMf8=
X-Received: by 2002:a05:6000:18af:b0:39a:c9d9:877b with SMTP id ffacd0b85a97d-39c120e3539mr10637487f8f.27.1743514558635;
        Tue, 01 Apr 2025 06:35:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwGVREvUjGwkZOBS/J+UsrA3/nlAawQuE3JJIgY0l2xBNKdMampKDooXjZtii/kQLNtLSvBw==
X-Received: by 2002:a05:6000:18af:b0:39a:c9d9:877b with SMTP id ffacd0b85a97d-39c120e3539mr10637459f8f.27.1743514558258;
        Tue, 01 Apr 2025 06:35:58 -0700 (PDT)
Received: from localhost ([2a01:e0a:257:8c60:80f1:cdf8:48d0:b0a1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b79e311sm14255486f8f.78.2025.04.01.06.35.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 06:35:57 -0700 (PDT)
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: virtio-comment@lists.linux.dev
Cc: Parav Pandit <parav@nvidia.com>,
	cohuck@redhat.com,
	mst@redhat.com,
	Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Subject: [PATCH 03/13] description: Avoid splitting the word virtqueue
Date: Tue,  1 Apr 2025 15:35:03 +0200
Message-ID: <20250401133543.801184-4-mvaralar@redhat.com>
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
X-Mimecast-MFC-PROC-ID: HCuDTlYAokCRY4TdBekbqcpqlDjM-gFqsbtTW8nVnzg_1743514559
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

From: Parav Pandit <parav@nvidia.com>

Don't split the word virtqueue.

Signed-off-by: Parav Pandit <parav@nvidia.com>
[CH: applied as editorial]
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
(cherry picked from commit 4cb03b12dc951f0152cd2cd9c79b24492e174e43)
Signed-off-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
---
 device-types/gpu/description.tex | 2 +-
 packed-ring.tex                  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/device-types/gpu/description.tex b/device-types/gpu/description.tex
index 4435248..66e4873 100644
--- a/device-types/gpu/description.tex
+++ b/device-types/gpu/description.tex
@@ -190,7 +190,7 @@ \subsubsection{Device Operation: Configure mouse cursor}
 
 \subsubsection{Device Operation: Request header}\label{sec:Device Types / GPU Device / Device Operation / Device Operation: Request header}
 
-All requests and responses on the virt queues have a fixed header
+All requests and responses on the virtqueues have a fixed header
 using the following layout structure and definitions:
 
 \begin{lstlisting}
diff --git a/packed-ring.tex b/packed-ring.tex
index 2bb66de..3ee55a1 100644
--- a/packed-ring.tex
+++ b/packed-ring.tex
@@ -194,7 +194,7 @@ \subsection{Scatter-Gather Support}
 
 The device limits the number of descriptors in a list through a
 transport-specific and/or device-specific value. If not limited,
-the maximum number of descriptors in a list is the virt queue
+the maximum number of descriptors in a list is the virtqueue
 size.
 
 \subsection{Next Flag: Descriptor Chaining}
-- 
2.42.0

