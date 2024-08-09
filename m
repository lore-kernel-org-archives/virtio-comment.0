Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 993E2194C86
	for <virtio-comment@lists.linux.dev>; Fri,  9 Aug 2024 14:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723212264; cv=none; b=lSIFzNmALtWyIF0mNX7qyr4cJcHd/nhkHqAQH5GvrYu6MH9tByo9k3KSvzyRX2woZGXepiBzIe5UsFUirvOXkyl7oWY4NViGlaU7dnYw3uZIwSQKDnQSU9G4IVOPWlSzfJykFuVNreUnBWKUtr8J4MfS5JJ0otzwloMbWyfgQYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723212264; c=relaxed/simple;
	bh=QA0P2ghyluGIFeYFR4EcQC/+nWguPOE+tSPDDftc+4c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=t5aUxC96JQ69fOUIhotiDlyqImC5sGG8I2OVCGlxQPN2IExlKeHitBJQJNDgc93wyISk0/RVPw7RViO58It0MqpNNUhx7AFEegMGS/m5qDU5DoWsNAYskJ3xFo+i6eOP05rft2PqJGp7yx3wOxUeGbQA8/tUjISRvs5HCzQ1wnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=U8hJLVn7; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="U8hJLVn7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723212261;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=M/kbtTEdVb4mdxl0JanrPF8+4eKkFbt9dPVbOy/Xi4c=;
	b=U8hJLVn7/oeDqqSzU33t8Cqsncm7LO464C2L2VjUWWLdunAy5xI1cRxtHPVvxCQBjDXhkw
	rkPIJpnAXu69eZUDTkJQeFhpWxPW3hDGwud4+kC/L7Hu9+5TWXQAWZa0TjV7GLbxLdAGTY
	n562hAV36PRytvxIPk/9bGxeiXU9uKE=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-630-X7KobqjNPKaFRPwECFSNzQ-1; Fri,
 09 Aug 2024 10:04:20 -0400
X-MC-Unique: X7KobqjNPKaFRPwECFSNzQ-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 823FB1955F3D
	for <virtio-comment@lists.linux.dev>; Fri,  9 Aug 2024 14:04:19 +0000 (UTC)
Received: from rh-jmarcin.redhat.com (unknown [10.45.225.121])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0BA951955D58;
	Fri,  9 Aug 2024 14:04:17 +0000 (UTC)
From: Juraj Marcin <jmarcin@redhat.com>
To: virtio-comment@lists.linux.dev
Cc: Juraj Marcin <jmarcin@redhat.com>
Subject: [PATCH] virtio-mem: introduce VIRTIO_MEM_F_PERSISTENT_SUSPEND
Date: Fri,  9 Aug 2024 16:03:56 +0200
Message-ID: <20240809140403.484556-1-jmarcin@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
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
supported in the Linux Kernel [1] and should be soon also supported in
QEMU [2].

[1]: https://lore.kernel.org/all/20240318120645.105664-1-david@redhat.com/
[2]: https://lore.kernel.org/all/20240806160756.182524-1-jmarcin@redhat.com/

Signed-off-by: Juraj Marcin <jmarcin@redhat.com>
---
 device-types/mem/description.tex | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/device-types/mem/description.tex b/device-types/mem/description.tex
index 0a6d558..5bff24c 100644
--- a/device-types/mem/description.tex
+++ b/device-types/mem/description.tex
@@ -60,6 +60,8 @@ \subsection{Feature bits}\label{sec:Device Types / Memory Device / Feature bits}
 access unplugged memory. \footnote{On platforms with memory properties that
 might get modified implicitly on memory access, this feature is expected to
 be offered by the device.}
+\item[VIRTIO_MEM_F_PERSISTENT_SUSPEND (2)] The driver can allow the guest
+system to enter suspended state (deep sleep, suspend-to-RAM).
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
+allow the guest system to enter a suspended state (deep sleep, suspend-to-RAM).
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
2.45.2

