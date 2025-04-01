Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9201204685
	for <virtio-comment@lists.linux.dev>; Tue,  1 Apr 2025 13:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743514575; cv=none; b=LUi4B6loJ4hjqi9oNjfRiHU+MppuovlALZiq1FeYNfCi2Vwc5L/7FV9ghgoVL4K/9nh5fkXzUH2koNP1v3rXjbAsnAJUXjlnnDac+1EL/cdMFmru1RaQ/8R27hCcepIjOtE6O6prt6ggRG7kWZxxpheqIFmvdNO1rO38Yh5QGVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743514575; c=relaxed/simple;
	bh=zrrzEHYjmqeeLO8uQaPDg9M5Q5OA4WN0NkY8RNP46cY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=DOIT4xHp7UdYMqiCcVIMHk5slugCN62cWhwQu3EhdQBLQqPtUOpr96d2Mn73++Xc1RXU2akElnG+z5NWngcWId3msqGOdzJB/ieTFSe2tvuGtOtJKAYoCVKyIw3+Hv6fJlBsnGqCyhTx4IKxFa69kaSfBxthhyw+YRW15cnfO4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YJnjtPkm; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YJnjtPkm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743514573;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oHDgbFH1tytAqCq1exuDyMOtphHJEAzpW8t70F0Hi7s=;
	b=YJnjtPkmO9vK0upom5vDndJ1pX/pLirEq0slHAZA731q3ggMBOpwteNJ7AavvGTHmkHCmn
	WYS8t+WEb7iukLVHPjd4wgG29Oz1CwYtEju1/N+0MrlpmLJ15iC4uqDCGidZeGauGrokQE
	3zJLnfzgVif3riEx/8vRxbwuXp6IfxQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-620-0asV4Yi5Or2jxPhnqe55dQ-1; Tue, 01 Apr 2025 09:36:11 -0400
X-MC-Unique: 0asV4Yi5Or2jxPhnqe55dQ-1
X-Mimecast-MFC-AGG-ID: 0asV4Yi5Or2jxPhnqe55dQ_1743514570
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43d733063cdso47025585e9.0
        for <virtio-comment@lists.linux.dev>; Tue, 01 Apr 2025 06:36:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743514570; x=1744119370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oHDgbFH1tytAqCq1exuDyMOtphHJEAzpW8t70F0Hi7s=;
        b=sgT3U1d9ax/GsRC5jrTa1UFuq5i4yQQNbxPRobLJGpH+i0CodcDz7mAlyZxgGD1Z11
         o/NCjC3BwkMu6F66UO73e5YXEN4eR1Z6L/3Kz+F5uIXE+vx4kzcVkN97oNXytqnbwCD6
         cYGnlwtetF5IIl8+Di5JIkbARhL7tQhpGUMLT2p4CjDXlmhiU3XkUOz31nfw96QyQ2sd
         CCUF0N0JHHhP9C8bWOCVOkKB55pZQHZm0Rm5SO8XMugRsExvrwEke2kMFuBenv+s2Cmu
         6qyhpnNjjbzV+ejFfA8yz0AkVG7U1LGNWz69mxqR4F9Te0Fw/E0i7/MCGxk9L4UHmJes
         wTPg==
X-Gm-Message-State: AOJu0YxLXa2K4bmw+euxn9CiF6KQQUCZ1i6yiFzApz4N8YQr9uy0aXQR
	Ohh/LKmA7otz6p16Tk+Q4wTc37yZmAvlFTnGHLQWbPISskrYI8SVuUqB0mN2r3I2e71BC5ZRP9k
	n94SoBvejLp4hxy4Gl+lNerk3pk0/a4i45t4BOrM4vSWbYH92DNIQeBI4YOLbXUBo0AsoTV11bo
	RRulcHEp6LQIb2C36ZIz+cSMCBzyVABKTp2yKEnesgO0LqlY63
X-Gm-Gg: ASbGncu8LwRfazkCzJCV0H9zVAmw15mE0ak21SuvKpzwb8Wn/DHq6hNMSGiHrbAt37Y
	ouaoju6W6GzGOhwBgLWEoPZ3RZ27Y5pM6bc4oVUplCbsPtBFkEdVOdzizKD9oRzyQpeBUBhFUtv
	2VZIqenaGFo4BrEIQJ94T4WssDdh25ZK0Y4fQ4enfQA6QPCQGQb2MvzSArEHkbEmfZEktG+ajNO
	jpfYnP2sRIbufgMsV4vfD2vKyMB8aCWBf7l+evjaPTeEnObzseFXWZzynk4o4yQJHHoRdXqmqzl
	70k9onLMPKM5jOwLb+I=
X-Received: by 2002:a05:6000:18a8:b0:399:6d53:68d9 with SMTP id ffacd0b85a97d-39c12118aedmr11488429f8f.38.1743514570093;
        Tue, 01 Apr 2025 06:36:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFfG4UAEvK5x+KZOcVtgeC5usqTemH3fWuBQhgbCgb41ZtduxPvNG2EjVrVntJ/lYHjqp9iUQ==
X-Received: by 2002:a05:6000:18a8:b0:399:6d53:68d9 with SMTP id ffacd0b85a97d-39c12118aedmr11488400f8f.38.1743514569736;
        Tue, 01 Apr 2025 06:36:09 -0700 (PDT)
Received: from localhost ([2a01:e0a:257:8c60:80f1:cdf8:48d0:b0a1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b79e0d1sm14132996f8f.70.2025.04.01.06.36.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 06:36:08 -0700 (PDT)
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: virtio-comment@lists.linux.dev
Cc: Steffen Trumtrar <s.trumtrar@pengutronix.de>,
	cohuck@redhat.com,
	mst@redhat.com,
	parav@nvidia.com,
	Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Subject: [PATCH 13/13] virtio-net: Fix receive buffer size typo
Date: Tue,  1 Apr 2025 15:35:13 +0200
Message-ID: <20250401133543.801184-14-mvaralar@redhat.com>
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
X-Mimecast-MFC-PROC-ID: llNAh2-WqQpu6CGS6jrGc0wONqEG4ZApEwPJcKuZbgA_1743514570
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

From: Steffen Trumtrar <s.trumtrar@pengutronix.de>

The commit 00806815385340dd411cc67df3f6837935bb5e26 introduced a slight
typo in the struct virtio_net_hdr size calculation depending on
VIRTIO_NET_F_HASH_REPORT negotiation.

Without VIRTIO_NET_F_HASH_REPORT the struct is smaller than with the
feature. This mix up only occurs in one instance; sizes are correct in
all other occurences.

Fix this typo.

Fixes: 008068153853 ("virtio-net: Fix receive buffer size calculation text")
Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Reviewed-by: Parav Pandit <parav@nvidia.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Fixes: https://github.com/oasis-tcs/virtio-spec/issues/216
Link: https://lore.kernel.org/r/20250207-v1-4-topic-virtio-net-receive-buffer-fix-v1-1-efcef167d6bc@pengutronix.de
(cherry picked from commit 124fcd0e97f209aab19639e7369116d99ede22a2)
Signed-off-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
---
 device-types/net/description.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index 375faac..4494633 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -666,10 +666,10 @@ \subsubsection{Setting Up Receive Buffers}\label{sec:Device Types / Network Devi
 the IPv6 header, plus 65535 bytes of maximum IPv6 payload including any
 extension header), otherwise 1514 bytes.
 When VIRTIO_NET_F_HASH_REPORT is not negotiated, the required receive buffer
-size is either 65601 or 1526 bytes accounting for 20 bytes of
+size is either 65601 or 1526 bytes accounting for 12 bytes of
 \field{struct virtio_net_hdr} followed by receive packet.
 When VIRTIO_NET_F_HASH_REPORT is negotiated, the required receive buffer
-size is either 65609 or 1534 bytes accounting for 12 bytes of
+size is either 65609 or 1534 bytes accounting for 20 bytes of
 \field{struct virtio_net_hdr} followed by receive packet.
 
 \drivernormative{\paragraph}{Setting Up Receive Buffers}{Device Types / Network Device / Device Operation / Setting Up Receive Buffers}
-- 
2.42.0

