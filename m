Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8CF1F2C34
	for <virtio-comment@lists.linux.dev>; Tue,  1 Apr 2025 13:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743514569; cv=none; b=Km7EIWKNN57MjAuTN0vbvF5AMKaLQiRE0dnlidJjG7uSXd36tP+F0K3fimWKPLLKonZa90YX1cROpe2LyCBjEspoMJvQvnod1i9hboi3f8t7wNjdjBLHlSpYBuHzhRiu/iLk9yJSYFWEJrEkcfw+npBEdm6NAc8kieHPVoX/8w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743514569; c=relaxed/simple;
	bh=je9F1lskpdj0kO2mCKuKleX1E+zvIXZSDUQQReMTuag=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=d/mxPNMnJwwtcWhpu+bY9JIODR1sl61MN/dG50MPyHQUckDvAg3V4ME366WVSKaBBSXCgzayoMs2jlEidXF538E+T5Q3j38l66Fzor9c553tsd3TfbRMFSgWSmBm+kC6HAdR8s7M+ERTrBDw9MtT7eFv9XeHyV8eZqf+6hUKTEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ggQV0NkS; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ggQV0NkS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743514566;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xJwSSScrxrC6P4QBsjbpK7poEyV241xwVP/1xF4Yc6s=;
	b=ggQV0NkS7X14F7XmecWOPJJwkE4HR1ZwtnuNsSnXWeW9sm2ldlQ5Z3fwlAZlSHsr66tUyT
	p6FrNi+AP71N2RXu6rhEum04EdC2JfjFLagJTUEmcCm9Kk0lSn/F9dqyPt3LqEmWiXQfjp
	Di00u8KHn2+AApA9DKcgmEoQIs2256o=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-259-uAGyArS1P_ONAlEm3ENSyA-1; Tue, 01 Apr 2025 09:36:04 -0400
X-MC-Unique: uAGyArS1P_ONAlEm3ENSyA-1
X-Mimecast-MFC-AGG-ID: uAGyArS1P_ONAlEm3ENSyA_1743514563
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-39131851046so2656986f8f.0
        for <virtio-comment@lists.linux.dev>; Tue, 01 Apr 2025 06:36:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743514563; x=1744119363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xJwSSScrxrC6P4QBsjbpK7poEyV241xwVP/1xF4Yc6s=;
        b=RB4EoAs5UMVpFaoPRakBdju1nSQMsCW/URmYZlfJN0nV6kLvFRYnEOO+OViyLmdkiZ
         xABthJ2/ak4Puikrgg6McWKV/mB64qzqo7/Q+wHO16PFxi0Q6OHWI3W1eDNW1gpnny36
         NNLNzOOuGzZI+H+tWeAFrTZesoKopkdTOmFWqBLHWGOgHiauAW9VULRo6BUsKhQWfmIB
         94ynWlrztuWBa2FClWTCLSluVtMa2Nl4+hyBUY81I8SXOUHG9z6N2N+fd9xNoYcAewN5
         KAb9hvBp8rzPHBgCKKvQBWX5owtf0AuQCMRVw9WsZBRqDVQ8/Wu+kX04LwkqTKH0qVGn
         ENPQ==
X-Gm-Message-State: AOJu0Yz2CKNhlnQmzwpP3ZMMbRgL0TL+TDhTqnYyE5bzZkssYESOgI14
	oB3RJ1EDUsOSWNfEEkFHYU49cdAcdhypa9T4Er7IxwHOfcf1u0U0dDQKLrDM5yGeJF8JpqggrD0
	bWz/RA23mjgq+qSDbnQeckXh5cV3/Rm67zlDXBY3Y4J7F743xu72jZg6pqkBosZ0IGx8JLyK6fQ
	qHlSf8s3N5ut4hOPqSnMd8KrDFKhz752iLWSAZqTv23UMMyxya
X-Gm-Gg: ASbGncvL6AcN0/4ToCTNd3d7RPf0DxE1IwbI+KKd7XLLZE/SPj6ODoCsDL3PUrRX/tq
	vQTiDTFN+f9kXbmHy+0rAILY5EAQ/oiSpR07dWKf9kwnrURQD5KXXUyr/XtHGC8i0n+lrLpsrA+
	uRMn1q3tNcXugUwVIrSzJWIar178VT2kdjSPtOAIBnSDpuT+jYrDR5BKj4dlLUQ5AS5ZZ06d3HB
	1GNxb7iwfKnIXdqmu12yjzgnUiorpH+O4Mj5xxXbPsNTjrC+lDnSGfNV4Hc4/ke+F2714t//ZgM
	zYEDC0f2F/h0q7Q3aIY=
X-Received: by 2002:a05:6000:178c:b0:391:29f:4f87 with SMTP id ffacd0b85a97d-39c1211c8f4mr9445066f8f.49.1743514562640;
        Tue, 01 Apr 2025 06:36:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNqcpFt37UH49VenQ2+Gs7ACzq7REEIg5LBdQ08f5q8wzliONNiPkGcqh6j5+QbhXBUrQzXg==
X-Received: by 2002:a05:6000:178c:b0:391:29f:4f87 with SMTP id ffacd0b85a97d-39c1211c8f4mr9445041f8f.49.1743514562179;
        Tue, 01 Apr 2025 06:36:02 -0700 (PDT)
Received: from localhost ([2a01:e0a:257:8c60:80f1:cdf8:48d0:b0a1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b79e467sm14227961f8f.79.2025.04.01.06.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 06:36:01 -0700 (PDT)
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: virtio-comment@lists.linux.dev
Cc: Parav Pandit <parav@nvidia.com>,
	cohuck@redhat.com,
	mst@redhat.com,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Subject: [PATCH 06/13] virtio-net: Fix receive buffer size calculation text
Date: Tue,  1 Apr 2025 15:35:06 +0200
Message-ID: <20250401133543.801184-7-mvaralar@redhat.com>
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
X-Mimecast-MFC-PROC-ID: 8szfnYJE6T6-0K4ep7PGlUy6-NSpi48bMvZ35WgyyMg_1743514563
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

From: Parav Pandit <parav@nvidia.com>

Receive buffer size calculation is based on the following
negotiated features.

The text has wrong calculation for IPv6 and also it has missed
VIRTIO_NET_F_HASH_REPORT.

The problem of igorance of VIRTIO_NET_F_HASH_REPORT is reported
in [1], however fix for ipv6 payload length must also be
considered.

Since for the both the fixes touching same requirements, a
new issue is created as [2].

This patch brings following fixes.

1. Fix annotating struct virtio_net_hdr as field
2. Fix receive buffer calculation for guest GSO cases to consider
   ipv6 payload length
3. small grammar corrections for article
4. reword the requirement to consider the virtio_ndr_hdr which is
   depends on the negotiated feature, hence first clarify the
   struct virtio_net_hdr size

[1] https://github.com/oasis-tcs/virtio-spec/issues/170
[2] https://github.com/oasis-tcs/virtio-spec/issues/183

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/170
Fixes: https://github.com/oasis-tcs/virtio-spec/issues/183
Reviewed-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Signed-off-by: Parav Pandit <parav@nvidia.com>
Message-Id: <20240606102014.2103986-2-parav@nvidia.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
(cherry picked from commit 00806815385340dd411cc67df3f6837935bb5e26)
Signed-off-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
---
 device-types/net/description.tex | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index 76585b0..0c7d361 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -654,10 +654,15 @@ \subsubsection{Setting Up Receive Buffers}\label{sec:Device Types / Network Devi
 If the VIRTIO_NET_F_GUEST_TSO4, VIRTIO_NET_F_GUEST_TSO6,
 VIRTIO_NET_F_GUEST_UFO, VIRTIO_NET_F_GUEST_USO4 or VIRTIO_NET_F_GUEST_USO6
 features are used, the maximum incoming packet
-will be to 65550 bytes long (the maximum size of a
-TCP or UDP packet, plus the 14 byte ethernet header), otherwise
-1514 bytes.  The 12-byte struct virtio_net_hdr is prepended to this,
-making for 65562 or 1526 bytes.
+will be 65589 bytes long (14 bytes of Ethernet header, plus 40 bytes of
+the IPv6 header, plus 65535 bytes of maximum IPv6 payload including any
+extension header), otherwise 1514 bytes.
+When VIRTIO_NET_F_HASH_REPORT is not negotiated, the required receive buffer
+size is either 65601 or 1526 bytes accounting for 20 bytes of
+\field{struct virtio_net_hdr} followed by receive packet.
+When VIRTIO_NET_F_HASH_REPORT is negotiated, the required receive buffer
+size is either 65609 or 1534 bytes accounting for 12 bytes of
+\field{struct virtio_net_hdr} followed by receive packet.
 
 \drivernormative{\paragraph}{Setting Up Receive Buffers}{Device Types / Network Device / Device Operation / Setting Up Receive Buffers}
 
@@ -666,18 +671,25 @@ \subsubsection{Setting Up Receive Buffers}\label{sec:Device Types / Network Devi
   \begin{itemize}
     \item If VIRTIO_NET_F_GUEST_TSO4, VIRTIO_NET_F_GUEST_TSO6, VIRTIO_NET_F_GUEST_UFO,
 	VIRTIO_NET_F_GUEST_USO4 or VIRTIO_NET_F_GUEST_USO6 are negotiated, the driver SHOULD populate
-      the receive queue(s) with buffers of at least 65562 bytes.
+      the receive queue(s) with buffers of at least 65609 bytes if
+      VIRTIO_NET_F_HASH_REPORT is negotiated, and of at least 65601 bytes if not.
     \item Otherwise, the driver SHOULD populate the receive queue(s)
-      with buffers of at least 1526 bytes.
+      with buffers of at least 1534 bytes if VIRTIO_NET_F_HASH_REPORT
+      is negotiated, and of at least 1526 bytes if not.
   \end{itemize}
 \item If VIRTIO_NET_F_MRG_RXBUF is negotiated, each buffer MUST be at
-least the size of the struct virtio_net_hdr.
+least size of \field{struct virtio_net_hdr},
+i.e. 20 bytes if VIRTIO_NET_F_HASH_REPORT is negotiated, and 12 bytes if not.
 \end{itemize}
 
 \begin{note}
 Obviously each buffer can be split across multiple descriptor elements.
 \end{note}
 
+When calculating the size of \field{struct virtio_net_hdr}, the driver
+MUST consider all the fields inclusive up to \field{padding_reserved},
+i.e. 20 bytes if VIRTIO_NET_F_HASH_REPORT is negotiated, and 12 bytes if not.
+
 If VIRTIO_NET_F_MQ is negotiated, each of receiveq1\ldots receiveqN
 that will be used SHOULD be populated with receive buffers.
 
-- 
2.42.0

