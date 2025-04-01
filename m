Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 139D01F930
	for <virtio-comment@lists.linux.dev>; Tue,  1 Apr 2025 13:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743514561; cv=none; b=GmXADOQDgX1tnE/5Tp3GgDhnlADvltHGm6arhuHgh9ifFZTfsAAlbD3YuNwkf+qzZwMWLVTcj6Wk1mVvuiXMiJdku7R47IP6e6Z106ZlxttzemEEoEUJ4jw92D6TTMC9iOBdpqGfyvkEsxXCaRYlk2mFr6WEDKw3ql3ojesIVW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743514561; c=relaxed/simple;
	bh=Mqvp2w35sOGMqekpbYyKKafqC+kXknfi6WQ6naCB1o4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=XCpMPEneDjBAkCQyANwYA/phowF3FYzMINEeM+opJ7vajZkQmLgqgoEdqCiulTqgyqXM5ihkMNO65djzF1zQUfGvKObdlJx9zPd+suWt9dZKyAe7C6nd87Q0R1BX/SF1cB+9RTciEedGFeUFi+GbU8sIyDV4q28dFzg4bexIZvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XAOuIb27; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XAOuIb27"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743514559;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GS9Qaq4MeQQHy0aIk/vaq/bsHAO61/voJgcvgOGURi4=;
	b=XAOuIb27gkh+tePEdXb/KBbuwfgxfb0rpKspWkoXuj1Hjt7Hn4BlV6FgsBX4mSXewqmh5V
	PXpXSWTMlt/Pnn2QwpvFE3Ol/IOBZS0ZM0ucXI2BoeqaoX6u57fCqA5EiBaz+bPFQ1b/ce
	gqMHia6WSV9Vg/CwXNUk5bXu5VPlV1g=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-387-KAIuM-3LNkS5IW-unQA-jw-1; Tue, 01 Apr 2025 09:35:57 -0400
X-MC-Unique: KAIuM-3LNkS5IW-unQA-jw-1
X-Mimecast-MFC-AGG-ID: KAIuM-3LNkS5IW-unQA-jw_1743514557
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-39123912ff0so2538274f8f.2
        for <virtio-comment@lists.linux.dev>; Tue, 01 Apr 2025 06:35:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743514556; x=1744119356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GS9Qaq4MeQQHy0aIk/vaq/bsHAO61/voJgcvgOGURi4=;
        b=J/pbrNeM2CE4fg4s5qHDnHXDO80i/N+iF/woDDLvo6Z11qbcU2xHyr/eRCA+bqpeZj
         yDIbhENdnRnni6rok8JOz19rg54dkBdU4xAiLjlzNsyy3P7gZBkcFHT/3wa7cbDqpLZz
         mafIQsAZJkTFQy/LKCkyiEPJmNjip+ZLS9ZE66EuNIKA7Qg5l7vwH9FnQi6DvpzIKKSa
         fQQ4Dt0tzqthf/4+zF7UvDgNrrqvXfjERDShSjX0GJyga4TAdwgjWyPSXhsj45moWaC3
         Ugg29fTNdwJqMIoV2Wh+RVdhwqxYY4OzzFy8+Yif+y0ecfnh78Do04i2FmfXkDq0gqca
         C6mg==
X-Gm-Message-State: AOJu0YxvGsIowXa/WufTdyf+9zlcI2xdJHTLc7OMhqlViX9JgmXzcK5X
	n0AmfBEiyXCxYt9meacQZI3JcQGAsQoi8Edntalx39ubzdV5/Dpy1WSeF8Ty2fuIiHBjUvsY3Rt
	+cd9a0x/sp8DnFcM6bPSI2mFKE7INkJrg7xNCen1Soniw0qNKxmgZl6+z+9k7G4gF2uVIYMhb3f
	9Vg7F6rgFKPjHLfU+ElnwxgyOns+xpkprlsNw/WYhdj6z9mDol
X-Gm-Gg: ASbGncvR1AiAJkFWkQYSLa1dwrkxlA2DvGRG78/t59Hw5CccnrxGyRlT3kVvoAGkGmZ
	j4+FywuQiW3DTMDnNCMJDImskh6vDBzIPVHu2MhHg171Ce0KUAu714G1xMq8gOLaFeyojwUiNiz
	Uuo1xw80l7LiSbw4rP/EhBnuZmq3S5z2bzULn1bx9IwfAjOcSllxsewz4LNv0dzrlJma7X9APFr
	nEmJiviFC/HRQbcoG+kHEp4mkUYecxxZ/OgjxtBzeXPLKgiWOnB4moodn1FubjQjjTTfqG16VZS
	OgLZnFW+lDG1x2EUo2M=
X-Received: by 2002:a05:6000:1842:b0:391:253b:405d with SMTP id ffacd0b85a97d-39c12115d7amr8991767f8f.41.1743514556074;
        Tue, 01 Apr 2025 06:35:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSOlpFIeAtu9UtzrEssFR1p5VCKqopNbFZ9bP6oNVofst2E6UzvMtYDMTVf8enV1QL2a96iA==
X-Received: by 2002:a05:6000:1842:b0:391:253b:405d with SMTP id ffacd0b85a97d-39c12115d7amr8991742f8f.41.1743514555732;
        Tue, 01 Apr 2025 06:35:55 -0700 (PDT)
Received: from localhost ([2a01:e0a:257:8c60:80f1:cdf8:48d0:b0a1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b7a4294sm13859178f8f.89.2025.04.01.06.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 06:35:55 -0700 (PDT)
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: virtio-comment@lists.linux.dev
Cc: Parav Pandit <parav@nvidia.com>,
	cohuck@redhat.com,
	mst@redhat.com,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Subject: [PATCH 01/13] conformance: Add missing virtqueue reset conformance references
Date: Tue,  1 Apr 2025 15:35:01 +0200
Message-ID: <20250401133543.801184-2-mvaralar@redhat.com>
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
X-Mimecast-MFC-PROC-ID: pQzMyLR-OXo-A88_CoZC8VD9sABQKahTDCMm__sO_y4_1743514557
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

From: Parav Pandit <parav@nvidia.com>

Add the missing references to the virtqueue reset related conformance
requirements.

Signed-off-by: Parav Pandit <parav@nvidia.com>
Reviewed-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
[CH: pushed as an editorial change]
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
(cherry picked from commit 925b42e3f72fdd113a5e4cc219b739c2c74dba23)
Signed-off-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
---
 conformance.tex | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/conformance.tex b/conformance.tex
index dc00e84..863f9c5 100644
--- a/conformance.tex
+++ b/conformance.tex
@@ -76,6 +76,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
 \item \ref{drivernormative:Basic Facilities of a Virtio Device / Device Reset}
 \item \ref{drivernormative:Basic Facilities of a Virtio Device / Device Configuration Space}
 \item \ref{drivernormative:Basic Facilities of a Virtio Device / Virtqueues}
+\item \ref{drivernormative:Basic Facilities of a Virtio Device / Virtqueues / Virtqueue Reset / Virtqueue Reset}
 \item \ref{drivernormative:Basic Facilities of a Virtio Device / Message Framing}
 \item \ref{drivernormative:Basic Facilities of a Virtio Device / Virtqueues / The Virtqueue Descriptor Table}
 \item \ref{drivernormative:Basic Facilities of a Virtio Device / Virtqueues / The Virtqueue Descriptor Table / Indirect Descriptors}
@@ -162,6 +163,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
 \item \ref{devicenormative:Basic Facilities of a Virtio Device / Feature Bits}
 \item \ref{devicenormative:Basic Facilities of a Virtio Device / Device Reset}
 \item \ref{devicenormative:Basic Facilities of a Virtio Device / Device Configuration Space}
+\item \ref{devicenormative:Basic Facilities of a Virtio Device / Virtqueues / Virtqueue Reset / Virtqueue Reset}
 \item \ref{devicenormative:Basic Facilities of a Virtio Device / Message Framing}
 \item \ref{devicenormative:Basic Facilities of a Virtio Device / Virtqueues / The Virtqueue Descriptor Table}
 \item \ref{devicenormative:Basic Facilities of a Virtio Device / Virtqueues / The Virtqueue Descriptor Table / Indirect Descriptors}
-- 
2.42.0

