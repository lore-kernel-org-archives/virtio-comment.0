Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77AF121883E
	for <virtio-comment@lists.linux.dev>; Mon, 17 Feb 2025 11:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739793159; cv=none; b=B7/8/BGAtqLDFaRR0YFleZLE4NxLpkbdoab8wq36QV8QhycSpgIliET9cfnPfNA9ADmfjx4NOQ8W/WxztLKSP6xa3s0ohZGowRDEPb3xJa4lfI5gn+7M4zcd77K7KwH0zz2Z2iptSK85+v1p2I0yMEicA6BE/RoZRbkYvJWJF50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739793159; c=relaxed/simple;
	bh=KrjS1gd1QTX9hlFj8FSERANZ23GIEgvHDcExrN3jo2c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=eex/gKmslQJmulF2GLSmVPsDZro+Ihg7yeJIPm8JVJCkks8eplRDxhC/0XGECmoqd0POXG02PxmGrIWt9lgGLGNp1gLa3HZZUC1hF0yetpibdPifCtiWJ9WWSlagWpi4Ad6/Ap6vk9qUovTZWR9/taKzRHMT46uyXGg6Va0Hk5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RN2jrjKg; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RN2jrjKg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739793156;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XxtAFlT1/fVNRqeKkdLsG74L57p999O1kLdloWwT4vk=;
	b=RN2jrjKgfxkjJwqP1E557Uicj9a3oQAUX0w2qY+bnR5ie/eRuIS4P5QXcAkLPVZrpWc5V9
	lomXinLPb9vZaQoGNSK27TOdhipspd8nSYRL5/a2ivpe4Oaeh5l65RGjx65t0iM7xX0MoQ
	pl+6FjJNG4FAyQpNWg9sfpt/xLE/EzE=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-672-oHUCGwLNO5mjw8GycqXZoA-1; Mon,
 17 Feb 2025 06:52:34 -0500
X-MC-Unique: oHUCGwLNO5mjw8GycqXZoA-1
X-Mimecast-MFC-AGG-ID: oHUCGwLNO5mjw8GycqXZoA_1739793154
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EC1801800873
	for <virtio-comment@lists.linux.dev>; Mon, 17 Feb 2025 11:52:33 +0000 (UTC)
Received: from slp-asahi.redhat.com (unknown [10.45.224.236])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C8E54300018D;
	Mon, 17 Feb 2025 11:52:32 +0000 (UTC)
From: Sergio Lopez <slp@redhat.com>
To: virtio-comment@lists.linux.dev
Cc: Sergio Lopez <slp@redhat.com>
Subject: [PATCH 2/3] transport-pci: VIRTIO_F_SHM_PAGE_SIZE support
Date: Mon, 17 Feb 2025 12:52:26 +0100
Message-ID: <20250217115227.4961-3-slp@redhat.com>
In-Reply-To: <20250217115227.4961-1-slp@redhat.com>
References: <20250217115227.4961-1-slp@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Ylv2fVNB8SLFXKSHcqQvpdbcdBwt2WujqVzVaAaz9k8_1739793154
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Introduce VIRTIO_F_SHM_PAGE_SIZE support by borrowing 8 bits from the 16
bit padding in virtio_pci_cap to hold a page_shift field which can be
used to derive the page size supported by the device.

Signed-off-by: Sergio Lopez <slp@redhat.com>
---
 transport-pci.tex | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/transport-pci.tex b/transport-pci.tex
index a5c6719..1b91d8a 100644
--- a/transport-pci.tex
+++ b/transport-pci.tex
@@ -147,7 +147,8 @@ \subsection{Virtio Structure PCI Capabilities}\label{sec:Virtio Transport Option
         u8 cfg_type;    /* Identifies the structure. */
         u8 bar;         /* Where to find it. */
         u8 id;          /* Multiple capabilities of the same type */
-        u8 padding[2];  /* Pad to full dword. */
+        u8 page_shift;  /* Page shift for this shared memory region. */
+        u8 padding[1];  /* Pad to full dword. */
         le32 offset;    /* Offset within bar. */
         le32 length;    /* Length of the structure, in bytes. */
 };
@@ -222,6 +223,13 @@ \subsection{Virtio Structure PCI Capabilities}\label{sec:Virtio Transport Option
         of a certain type. If the device type does not specify the meaning of
         this field, its contents are undefined.
 
+\item[\field{page_shift}]
+        If VIRTIO_F_SHM_PAGE_SIZE has been negotiated and \field{cfg_type} is set
+        to VIRTIO_PCI_CAP_SHARED_MEMORY_CFG, the device MUST provide the page
+        shift derived from the supported page size for this shared memory region.
+        The page shift is derived from the page size by using this formula:
+        $page size = 1 << (page shift + 12)$.
+        See also \ref {sec:Basic Facilities of a Virtio Device / Shared Memory Regions / Page alignment restrictions}.
 
 \item[\field{offset}]
         indicates where the structure begins relative to the base address associated
-- 
2.48.1

