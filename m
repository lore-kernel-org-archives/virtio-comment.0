Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388511E1023
	for <virtio-comment@lists.linux.dev>; Mon, 31 Mar 2025 15:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743436773; cv=none; b=B86Nn1lbYdF1/hfj21GLUcjZ3fCuHYD8OOcfN5hLDKc7/JwD28FIcYMJAi76+enWglYBPu+Ec+M6EZgwsbqkghPF+0pJwnWhnkjdPzsi+ufxS7aYNbZ/L+EplZPgTaQELDY0i8VMCnU1SNe4Gke0sBuJ8BgoRGGk/nEA3XrGOio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743436773; c=relaxed/simple;
	bh=sjv556o46kuItzvwTRIH/9fEstwSvL5dzNUL7mClZrg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=daxItCAFvGK/8b60vc7sWaSDARUsW39yrgLxQn6b1uQNeFYG4S5O4qMAHTnuLnA1iUjrpK43wKuLxnZx2MmJ4gdHj6zkMkfDN4HxsCtgvKR1VkvkRnUDt45gcIwONVEF4Vg2Lcu/uQz6gi8rllGSUUflfDmf2CDZKk8VtH4d1/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MBoOszNU; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MBoOszNU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743436771;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cjGf/QdOpDgwfwM3MICHubweKxobEvCoKChJjD7Bnew=;
	b=MBoOszNU9xPlJ8L+J9vQsVGmbwqy3MeWOOHTa+Whaa1ohjSyCtFU/1lPdXVmajHOxlEb41
	LP8AtOFkx5kJHv8xNNozTpOjEU9S/L6kqrQPrjEBVWc3vG4gKaHWgVbZdcSddjhfCK5iIE
	SlALONPQVI4a3mKO+dNcuchZZAPBwLs=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-655-XqdUBtMMNOuW_Ou64jCI-w-1; Mon,
 31 Mar 2025 11:59:28 -0400
X-MC-Unique: XqdUBtMMNOuW_Ou64jCI-w-1
X-Mimecast-MFC-AGG-ID: XqdUBtMMNOuW_Ou64jCI-w_1743436767
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 010E419560B7;
	Mon, 31 Mar 2025 15:59:27 +0000 (UTC)
Received: from f41vm.. (unknown [10.45.224.27])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 259251801747;
	Mon, 31 Mar 2025 15:59:24 +0000 (UTC)
From: Sergio Lopez <slp@redhat.com>
To: virtio-comment@lists.linux.dev
Cc: dmitry.osipenko@collabora.com,
	parav@nvidia.com,
	mst@redhat.com,
	Sergio Lopez <slp@redhat.com>
Subject: [PATCH v2 2/3] transport-pci: introduce page_shift field for SHM
Date: Mon, 31 Mar 2025 11:05:47 -0400
Message-ID: <20250331150548.50595-3-slp@redhat.com>
In-Reply-To: <20250331150548.50595-1-slp@redhat.com>
References: <20250331150548.50595-1-slp@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Fx7RSmiBAutq9_JOPDtpaktPzJQv3grUpMHZlDnMZFo_1743436767
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Borrowing 8 bits from the 16 bit padding in virtio_pci_cap to hold
a page_shift field which is used to derive the page size supported
by the device.

Signed-off-by: Sergio Lopez <slp@redhat.com>
---
 transport-pci.tex | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/transport-pci.tex b/transport-pci.tex
index a5c6719..efb174a 100644
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
+        If \field{cfg_type} is set to VIRTIO_PCI_CAP_SHARED_MEMORY_CFG, the
+        device MUST provide the page shift derived from the supported page size
+        for this shared memory region. The page shift is derived from the page
+        size by using this formula:
+        $page size = 1 << (page shift + 12)$.
+        See also \ref {sec:Basic Facilities of a Virtio Device / Shared Memory Regions / Page alignment restrictions}.
 
 \item[\field{offset}]
         indicates where the structure begins relative to the base address associated
-- 
2.49.0

