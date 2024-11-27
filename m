Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD74192D9C
	for <virtio-comment@lists.linux.dev>; Wed, 27 Nov 2024 09:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732700225; cv=none; b=sUfKpldTbxgersaNpoVoyAYGQ3gOY6YbdV+Pif8JyIxvZyuqUnF+jdVSQYAPOn01dokLpiPTe1l4r897jrAUF5Lg6omhdDsEd4NVk1CN64D2SnDj7yCAk2QV7B6rbWypOdbZ8w1Rd11cXi7dEl+cnyW6ZwSKYQo4+VwHGCm3t20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732700225; c=relaxed/simple;
	bh=v/OAC4tVRoNBa/XnJMJIEDRA4ptw+7Ggu17jnjC7O0w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=r7mYn2dyRZVkeh2lHTBaKPL1HOGAEVt4DRqUNV87Zh4EoUpEJjtfc6ESKEzLgqrkYsslmBIjqUd30yAm2j4OjaLla3ekx0Oc9ayUWVh1YEl0h8Zc6u5Ot1wNnzv4ib/6v573W6/tDHrXab8Lwd03vqOjIuJ4xO6BCDLcZRzcMCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PqW/9t3e; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PqW/9t3e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732700222;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9p48543i9K6Vev5t3NK1JLpCMP7JETSTHPJsegLtHp8=;
	b=PqW/9t3e37Ket+6BNLKd6UvuJVGL2r5FpZKuWvHMN0MgyVOhgEP3uA5Cf68q1S+ok+Olhj
	SYdOSIRYHqBZr2IPfMSzxkzRC+6OLj1yjd3kv+u7EGEqC4k22cwBm8IkvyAU6LRMoju3ap
	jxhrF4ltQajCjMB69S5Yz3kJ73gSYo0=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-46-A18oAazkP3GCKDXbxIj-yA-1; Wed,
 27 Nov 2024 04:36:59 -0500
X-MC-Unique: A18oAazkP3GCKDXbxIj-yA-1
X-Mimecast-MFC-AGG-ID: A18oAazkP3GCKDXbxIj-yA
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 128C91955F10;
	Wed, 27 Nov 2024 09:36:58 +0000 (UTC)
Received: from gerbillo.redhat.com (unknown [10.39.194.173])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A72A5195E480;
	Wed, 27 Nov 2024 09:36:55 +0000 (UTC)
From: Paolo Abeni <pabeni@redhat.com>
To: virtio-comment@lists.linux.dev
Cc: maxime.coquelin@redhat.com,
	Eelco Chaudron <echaudro@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	kshankar@marvell.com
Subject: [PATCH v11 1/4] virtio-net: clarify NEEDS_CSUM semantic for GSO packats.
Date: Wed, 27 Nov 2024 10:36:40 +0100
Message-ID: <81034d9f4b12f7bd7aa6f7f5266cb6d551d0823c.1732699986.git.pabeni@redhat.com>
In-Reply-To: <cover.1732699986.git.pabeni@redhat.com>
References: <cover.1732699986.git.pabeni@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: j73JsvYI2U2zRuSOVND4aWJ6rnS3PGnu8ytm7VZrb2Q_1732700218
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

The current wording is a bit unclear hinting to possible additional
nested headers. For GSO packets virtio net (currently) supports
offload for the checksum of single transport header, explicitly state
that in both the driver and device sections.

Signed-off-by: Paolo Abeni <pabeni@redhat.com>
---
 device-types/net/description.tex | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index 4e4ffdb..3434a31 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -695,6 +695,11 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
 \item the driver MUST validate the packet checksum at
 	offset \field{csum_offset} from \field{csum_start} as well as all
 	preceding offsets;
+\begin{note}
+If \field{gso_type} differs from VIRTIO_NET_HDR_GSO_NONE, \field{csum_offset}
+points to the only transport header present in the packet, and there are no
+additional preceding checksums validated by VIRTIO_NET_HDR_F_NEEDS_CSUM.
+\end{note}
 \item the driver MUST set the packet checksum stored in the
 	buffer to the TCP/UDP pseudo header;
 \item the driver MUST set \field{csum_start} and
@@ -895,7 +900,11 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
   if bit VIRTIO_NET_HDR_F_RSC_INFO is not set in \field{flags},
   then \field{csum_start} and \field{csum_offset} indicate how to calculate it
   (see Packet Transmission point 1).
-
+\begin{note}
+If \field{gso_type} differs from VIRTIO_NET_HDR_GSO_NONE, \field{csum_offset}
+points to the only transport header present in the packet, and there are no
+additional preceding checksums validated by VIRTIO_NET_HDR_F_NEEDS_CSUM.
+\end{note}
 \end{enumerate}
 
 If applicable, the device calculates per-packet hash for incoming packets as
-- 
2.45.2

