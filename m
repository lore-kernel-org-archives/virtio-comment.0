Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFEBF487AE
	for <virtio-comment@lists.linux.dev>; Wed,  9 Oct 2024 09:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728464602; cv=none; b=atPfh0/YVMeU7GTx4rIFHjV47rD89PJmuSLjhEk9xygCvFctQ6cBOHpYJKDDS3zeIAsJqUThTascnmkixYWTJRZ3UazjdppsAExIpJC8uhjZpvwFzqde5teOf9AREho3M3va7mLdxnTpK3rdc412PIqsn95qnk5DIiXHnIEb1yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728464602; c=relaxed/simple;
	bh=/hw45SVrG5OFBqOtImG3xZSp5RVpSblQapR70ITfr1s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=D2i5mOOi2HZljsh/s40lVDn6bRfdXY5hnGfi+2DIu4WlIQpa6Xyc7lLesperoJoX7r0+PP/ho2w7jOKiWSoqLxHHdJxW8XmQYvmiJaJmpLDAQgA9bAnvFW5HH2RTIeSyYslmd/OHJAgysvlRrOvnnl+1XeAZK59i5JfR2c35ovk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Kmwc/D3P; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Kmwc/D3P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728464599;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=N+4NIF3PDzaCLCtsTpLtf6gSM8KqKLhfmNYbhSyGfV0=;
	b=Kmwc/D3PG6KTXdwRPXxxiurcJCmIxD5yT4J3U85fCk5yW7lL0ydgvvAFIkHZvG6HdtagF4
	0jouULgjrgs2nVgd4z2jzmHQM5gkiRuMpaGByrkiT2NqZLWU3wS7q1FJpf06z0FeC3jG6G
	CUkqYcXNh/x9MZ50AXQzKzV0DZlz4nU=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-220-kentqR1wOGas1AvSBXO32w-1; Wed,
 09 Oct 2024 05:03:16 -0400
X-MC-Unique: kentqR1wOGas1AvSBXO32w-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B44EE19560BD
	for <virtio-comment@lists.linux.dev>; Wed,  9 Oct 2024 09:03:15 +0000 (UTC)
Received: from rh-jmarcin.redhat.com (unknown [10.45.225.113])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id EA84E30001A2;
	Wed,  9 Oct 2024 09:03:13 +0000 (UTC)
From: Juraj Marcin <jmarcin@redhat.com>
To: virtio-comment@lists.linux.dev
Cc: Juraj Marcin <jmarcin@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Subject: [PATCH v2] virtio-mem: introduce VIRTIO_MEM_F_PERSISTENT_SUSPEND
Date: Wed,  9 Oct 2024 11:01:59 +0200
Message-ID: <20241009090202.10544-2-jmarcin@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Before, the behavior while suspending to a deep sleep state and waking
up was not specified. For example, in x86 QEMU VM all devices receive a
reset request during wake-up. This would lead to unplugging of all the
plugged memory blocks. Due to this, suspending is disallowed in the
Linux Kernel, when plugged memory is present and
VIRTIO_MEM_F_PERSISTENT_SUSPEND feature flag is not advertised by the
virtio-mem device.

This new flag should signal to the guest driver, that the device can
correctly suspend to a deep sleep state and then wake up without
disrupting the plugged memory blocks. This feature flag is already
supported in the Linux Kernel [1] and also supported in QEMU [2].

[1]: https://lore.kernel.org/all/20240318120645.105664-1-david@redhat.com/
[2]: https://lore.kernel.org/all/20240904103722.946194-1-jmarcin@redhat.com/

Reviewed-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Signed-off-by: Juraj Marcin <jmarcin@redhat.com>
---
v2:
- replaced "guest system" with "guest", suggested by Matias
- updated QEMU patch series link
---
 device-types/mem/description.tex | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/device-types/mem/description.tex b/device-types/mem/description.tex
index 0a6d558..9acf63f 100644
--- a/device-types/mem/description.tex
+++ b/device-types/mem/description.tex
@@ -60,6 +60,8 @@ \subsection{Feature bits}\label{sec:Device Types / Memory Device / Feature bits}
 access unplugged memory. \footnote{On platforms with memory properties that
 might get modified implicitly on memory access, this feature is expected to
 be offered by the device.}
+\item[VIRTIO_MEM_F_PERSISTENT_SUSPEND (2)] The driver can allow the guest
+to enter suspended state (deep sleep, suspend-to-RAM).
 \end{description}
 
 \subsection{Device configuration layout}\label{sec:Device Types / Memory Device / Device configuration layout}
@@ -174,6 +176,9 @@ \subsection{Device Initialization}\label{Device Types / Memory Device / Device I
 The device MUST NOT modify memory or memory properties of plugged memory
 blocks during device reset.
 
+The device SHOULD offer VIRTIO_MEM_F_PERSISTENT_SUSPEND if the platform
+supports suspending (deep sleep, suspend-to-RAM) with plugged memory blocks.
+
 \subsection{Device Operation}\label{sec:Device Types / Memory Device / Device Operation}
 
 The device notifies the driver about the amount of memory the device wants
@@ -268,6 +273,9 @@ \subsection{Device Operation}\label{sec:Device Types / Memory Device / Device Op
 memory blocks to unplug them, or it would not be able to make use of
 unplugged memory blocks after plugging them (e.g., alignment).
 
+If VIRTIO_MEM_F_PERSISTENT_SUSPEND has not been negotiated, the driver MUST NOT
+allow the guest to enter a suspended state (deep sleep, suspend-to-RAM).
+
 \devicenormative{\subsubsection}{Device Operation}{Device Types / Memory Device / Device Operation}
 
 The device MUST provide the exact same memory properties with the exact same
@@ -293,6 +301,10 @@ \subsection{Device Operation}\label{sec:Device Types / Memory Device / Device Op
 
 The device SHOULD unplug all memory blocks during system resets.
 
+If VIRTIO_MEM_F_PERSISTENT_SUSPEND has been negotiated, the device MUST NOT not
+change the state of memory blocks when suspending or when waking up from
+suspended state (deep sleep, suspend-to-RAM).
+
 \subsubsection{PLUG request}\label{sec:Device Types / Memory Device / Device Operation / PLUG request}
 
 Request to plug consecutive memory blocks that are currently unplugged.
-- 
2.46.2

