Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 488302040B2
	for <virtio-comment@lists.linux.dev>; Tue,  1 Apr 2025 13:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743514573; cv=none; b=QVAjXiuIaSnbnR7Tdhy1I35nsw9gtiaVWh5y2xC74LTUYuYjR1UXdqACabVHwbu9vSIQvYb7GiXZCJmh+svigL+39INxVxjlV1uNDWQdWbjFloWbb8aTHSsi7KBeqhWp7FNMT38t84Cp8eKMqHaxV0AKwIBh4gasQ/b2+3C1Vsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743514573; c=relaxed/simple;
	bh=RASWBI/w3+gzG7uMvCoQV547bY/91WFm5N2QiLc2oaQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=Tx+nQ2ZqJK6AJi9L47M8RIbdG4q4l3KV9TtT1vHfhAyXGgOwKNWg+KNKM6jTrJAQzXfifQANZoWCbm95lMVelz3DIcXjqJ+H/Ocr1136gaD17H1EItM8HnbnX55TBGYEQJy2HIcUWFbGJMpRXP5itEgKBe/EIYE7NgKjOu4scM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IKHeimlT; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IKHeimlT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743514571;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DVGYkES2vl/3f+Y+5m0dvjFcORtaaJmr9xCfDbA2tjQ=;
	b=IKHeimlTe9T35pXHvInPRWB1uwRQhnW9U8eCrsVbfJ0X8p2pFBZV4BNfPxrj1bNos3klOP
	dQpsGO3A27YADDXdQv5PRBcxJtXA0rjBHGkhLgGmrkPHBTL1oQz4HnP51cgaRam0OqTer4
	8dARwWbKWz0Ciw4yAFiDX2DmfyoACXc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-508-hSFo29zlO4yhzq68sjRpLw-1; Tue, 01 Apr 2025 09:36:10 -0400
X-MC-Unique: hSFo29zlO4yhzq68sjRpLw-1
X-Mimecast-MFC-AGG-ID: hSFo29zlO4yhzq68sjRpLw_1743514569
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-39abdadb0f0so2898272f8f.0
        for <virtio-comment@lists.linux.dev>; Tue, 01 Apr 2025 06:36:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743514568; x=1744119368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DVGYkES2vl/3f+Y+5m0dvjFcORtaaJmr9xCfDbA2tjQ=;
        b=wQat7H/BixXQU30eEAB6CVgjgI66+63LR8axZIyfgwxEZXPQWzkxZ0K7T/Pt8iYgd4
         GapfhKjhafCaZeOHz2pIHLaoNib106by0dgyp4gZqC88pRyT45ObePNuOQrhlFZCGNQi
         ScBr8oXQzOXRWBs4e9i204XxH2qEup+Ce87aoNwj4AB+cOYcV/le/vIdDYiD32EelYW4
         AM9VKc102kp6yXhvqFA32Uzs91SSwdNTzPWdXmVG0arWZy5uCONMZM9v2CkI7Sxfred4
         NP3eHYQJdeD2KxFQo27z0j1c1yuhmgciLxWEy7NR0ExJHKRs6Qz93heD1jgWa0CkYsHZ
         mXqQ==
X-Gm-Message-State: AOJu0YwApU7VxnFC+CseD8PjvQZTDSui17qj8a+Dii8y0kPri8NNhdJV
	bQ3m7DM5CYRZZWXHdFBCEJ0Ns/CvlY7eMZfhezajKktCjn6tDFEtcuopHIXAKPeKAHPXeGx1oKV
	iZUENdD2ByKntZyEqX05OwtujHAj0bNCdmY1x07WUHuR9nwTPClNyDuihsqhv6NCLdKuUXGqEYq
	vEdwbLZAfjBvVFKlij5PD2myOQDzQysj4abxR5fJGijC8oiyhw
X-Gm-Gg: ASbGncuxDaNSgUK1XY9x4W8ZOIr00kiayqZ8kjaM/zL2+MI23KbGx4Z6zzByCECvczr
	cUZQ8uOhsNxMptXCguQ8qIXNkWwRBJs8bGXhqKs+QFvCVjCsu9jq5ieoNrCWL49vD9HqBcXQdW0
	bxHseWulKlE1iCO8xAF+vIIRyh1Gy2rvZIIjR5SL2LMA40cV8UlKZ7LUtRL9KF31WCN/bpjoOOP
	wDfhY+4W+pQssKg8iE0dwY72ojbX4+o+95us/OvmaF3ti6zAOGqZY9GIcYVf0CTb7uO3RzuIWTn
	+1nqpD2hNaDNdWD0A+I=
X-Received: by 2002:a5d:5f42:0:b0:38d:dd52:1b5d with SMTP id ffacd0b85a97d-39c120cb7camr9635182f8f.4.1743514568396;
        Tue, 01 Apr 2025 06:36:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6hN6kzwXDcG6Po9CZmH/o7SG9v3dQ94M+04HiegdJYL4iPCWlOhneb7aFYaMfvlbxi7yyrw==
X-Received: by 2002:a5d:5f42:0:b0:38d:dd52:1b5d with SMTP id ffacd0b85a97d-39c120cb7camr9635162f8f.4.1743514568024;
        Tue, 01 Apr 2025 06:36:08 -0700 (PDT)
Received: from localhost ([2a01:e0a:257:8c60:80f1:cdf8:48d0:b0a1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b658803sm13881134f8f.6.2025.04.01.06.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 06:36:07 -0700 (PDT)
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: virtio-comment@lists.linux.dev
Cc: Paolo Abeni <pabeni@redhat.com>,
	cohuck@redhat.com,
	mst@redhat.com,
	parav@nvidia.com,
	Jason Wang <jasowang@redhat.com>,
	Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Subject: [PATCH 12/13] virtio-net: clarify DATA_VALID semantic for encap protos.
Date: Tue,  1 Apr 2025 15:35:12 +0200
Message-ID: <20250401133543.801184-13-mvaralar@redhat.com>
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
X-Mimecast-MFC-PROC-ID: vWdurmYDkaiFy9pIVZFZZ3bzia52PQySsYLw4QxMlXk_1743514569
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

From: Paolo Abeni <pabeni@redhat.com>

DATA_VALID allows offloading a single checksum level, leaving
unspecified which header checksum is offloaded when one or more
encapsulated protocols are present.

In such a case, the only option usable from the guest OS is
offloading the outermost checksum. That also matches the existing
implementation.

Explicitly state such the constraint, to remove any ambiguity and
make later changes more straightforward.

Signed-off-by: Paolo Abeni <pabeni@redhat.com>
Reviewed-by: Jason Wang <jasowang@redhat.com>
Reviewed-by: Parav Pandit <parav@nvidia.com>
Link: https://lore.kernel.org/r/ec6fdbfba2c4fc1969d83799836ebb694a01fb30.1732699986.git.pabeni@redhat.com
(cherry picked from commit 95c085b2f16de4bcdcae9c42d7828d9b8efc7836)
Signed-off-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
---
 device-types/net/description.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index 9ea713d..375faac 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -866,8 +866,8 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
 If the VIRTIO_NET_F_GUEST_CSUM feature has been negotiated, the
 device MAY set the VIRTIO_NET_HDR_F_DATA_VALID bit in
 \field{flags}, if so, the device MUST validate the packet
-checksum (in case of multiple encapsulated protocols, one level
-of checksums is validated).
+checksum. One level of checksum is validated: in case of multiple
+encapsulated protocols the outermost one.
 
 \drivernormative{\paragraph}{Processing of Incoming
 Packets}{Device Types / Network Device / Device Operation /
-- 
2.42.0

