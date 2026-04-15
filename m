Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BAD427A916
	for <virtio-comment@lists.linux.dev>; Wed, 15 Apr 2026 14:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776264888; cv=none; b=suIlzNrN0eirroUjlmtCpL6NLyx6MfS5pnlDwEmtTUGIG1/ZvQ67RzfJUk/WUxc7VCmkoHIyEH+Gcmx9H1TrwVxbB7NStKZnV3PV+uNJxMHrv1vFe/HJywaXNLF7CtKmPXNPwkZ/RGtWziuJHiUWAVISRrBmOO/ataV06rBYjlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776264888; c=relaxed/simple;
	bh=WxwkCgIwdsjI/Y0SllYHKqfFZQNkpp6ZhMp1RXYBbkQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LznOF7alyK7dS7oeyRhCwIF0/KMEA0tEmbXY1q4kGUkt8FKAtvZIHGrNHQmly9Ce9URUiwXLVT0S+ORAEHLW44lAEVtSZKShwhFV+su6uaJrMa8wBIdsSPG2vx39fYe1n3YGeWZG2GWpFF1g7PxdjxrJGAR8064WktvjoSmf6p8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=G1oAmjcQ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="G1oAmjcQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776264886;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Et30/1icn342DaU6NJqWu9MQuETlvrxZPHmCGgsstK4=;
	b=G1oAmjcQQ5iHnLoFxCcQCH1uVnwTMbQ+ACSB0mG28dWxb6iwh160EC/Ne3QyKwoYIpcUOY
	pTBSeBJs9RIweYs3fWPSuEWIhG1j3sYeb0u2BeQfcWL9rpht6bwf9I/It68q3mk6o29sVa
	s1ZpXeAnp491E3reiLwb3sbAei+4LeA=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-659-tFhpHQMZPyCXC0KsBAc3AA-1; Wed,
 15 Apr 2026 10:54:42 -0400
X-MC-Unique: tFhpHQMZPyCXC0KsBAc3AA-1
X-Mimecast-MFC-AGG-ID: tFhpHQMZPyCXC0KsBAc3AA_1776264882
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E8F3E1955F02;
	Wed, 15 Apr 2026 14:54:41 +0000 (UTC)
Received: from localhost (unknown [10.44.24.6])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id EAF41180047F;
	Wed, 15 Apr 2026 14:54:38 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: virtio-comment@lists.linux.dev
Cc: david@kernel.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH RFC] virtio-mem: add shared/private memory property details
Date: Wed, 15 Apr 2026 18:54:35 +0400
Message-ID: <20260415145435.2023866-1-marcandre.lureau@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ylugvdsQiJBg7qGCTgnSAj6cKpa9Tppz_zFntw9HhYM_1776264882
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Add specification text for platforms where system RAM has a
shared/private property (e.g., confidential computing environments such
as AMD SEV-SNP or Intel TDX). Define the device and driver requirements
for memory state transitions during plug/unplug operations, and
guidance for VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE case.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 device-types/mem/description.tex | 37 ++++++++++++++++++++++++++++++--
 1 file changed, 35 insertions(+), 2 deletions(-)

diff --git a/device-types/mem/description.tex b/device-types/mem/description.tex
index 9acf63f..1eefea0 100644
--- a/device-types/mem/description.tex
+++ b/device-types/mem/description.tex
@@ -42,6 +42,18 @@ \section{Memory Device}\label{sec:Device Types / Memory Device}
 provides the exact same properties with the exact same semantics for
 plugged device memory as available for comparable RAM in the same configuration.
 
+In some configurations, system RAM might additionally have a shared/private
+property, indicating whether memory is accessible to both the guest and the
+host (shared) or only to the guest (private). \footnote{For example, in
+confidential computing environments such as AMD SEV-SNP or Intel TDX.
+The mechanism for converting between shared and private states is
+platform-specific; for example, it might involve dedicated CPU instructions
+or hypercalls.} The device provides unplugged memory in the shared state.
+When memory blocks are plugged, the driver is expected to convert them to
+the private state before use. Unless VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE
+has been negotiated, the driver is expected to convert them back to the
+shared state before unplugging.
+
 \subsection{Device ID}\label{sec:Device Types / Memory Device / Device ID}
 24
 
@@ -58,8 +70,9 @@ \subsection{Feature bits}\label{sec:Device Types / Memory Device / Feature bits}
 configuration is valid and corresponds to an ACPI PXM.
 \item[VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE (1)] The driver is not allowed to
 access unplugged memory. \footnote{On platforms with memory properties that
-might get modified implicitly on memory access, this feature is expected to
-be offered by the device.}
+might get modified implicitly on memory access, or on platforms with a
+shared/private memory property, this feature is expected to be offered by
+the device.}
 \item[VIRTIO_MEM_F_PERSISTENT_SUSPEND (2)] The driver can allow the guest
 to enter suspended state (deep sleep, suspend-to-RAM).
 \end{description}
@@ -176,9 +189,15 @@ \subsection{Device Initialization}\label{Device Types / Memory Device / Device I
 The device MUST NOT modify memory or memory properties of plugged memory
 blocks during device reset.
 
+On platforms with a shared/private memory property, the device MUST NOT
+change the shared/private state of memory blocks during device reset.
+
 The device SHOULD offer VIRTIO_MEM_F_PERSISTENT_SUSPEND if the platform
 supports suspending (deep sleep, suspend-to-RAM) with plugged memory blocks.
 
+The device SHOULD offer VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE if the platform
+has a shared/private memory property.
+
 \subsection{Device Operation}\label{sec:Device Types / Memory Device / Device Operation}
 
 The device notifies the driver about the amount of memory the device wants
@@ -256,6 +275,15 @@ \subsection{Device Operation}\label{sec:Device Types / Memory Device / Device Op
 If VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE has been negotiated, the driver
 MUST NOT read memory or query memory properties of unplugged memory blocks.
 
+On platforms with a shared/private memory property, the driver MUST convert
+plugged memory blocks to the private state before initializing or otherwise
+using them.
+
+On platforms with a shared/private memory property, the driver MUST convert
+memory blocks to the shared state before requesting to unplug them (for
+VIRTIO_MEM_REQ_UNPLUG_ALL, this applies to all plugged memory blocks), unless
+VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE has been negotiated.
+
 The driver MUST NOT request unplug of memory blocks while corresponding memory
 or memory properties are still in use.
 
@@ -285,6 +313,11 @@ \subsection{Device Operation}\label{sec:Device Types / Memory Device / Device Op
 The device MAY modify memory of unplugged memory blocks or reset memory
 properties of such memory blocks to platform defaults at any time.
 
+On platforms with a shared/private memory property, the device MUST provide
+unplugged memory blocks in the shared state.  If
+VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE has been negotiated, the device MUST
+convert memory blocks to the shared state after unplugging them.
+
 The device MUST NOT modify memory or memory properties of plugged memory
 blocks.
 
-- 
2.53.0

