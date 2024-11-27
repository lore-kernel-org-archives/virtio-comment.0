Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B92A189905
	for <virtio-comment@lists.linux.dev>; Wed, 27 Nov 2024 09:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732700226; cv=none; b=MjZ/uDLrdKccXkZdvRlnK5WF+FQMQq2VhGOhOdFmKuOT/xaigtR9Y75GUJocpAP0WM7P5pMv+qANtlv0VhXq+cC5X1dAqKnmLFy6z39SQqDMX6h8C89vXlDXTVzDA6q9P8o4bnEgqu255l8jUiXYe1vV5/6Cl4ggakEtOOjj+5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732700226; c=relaxed/simple;
	bh=G8IWc5msjdIuNBS/rtTSQ0KZWT8gXtQ0yRB8BlbKzBE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=eqCWeQeVfAUOD6++8xeZWRho5Kfi4bmH2fJACDzgLVk2k1ZdBUASGrwfnQnIxQKJltltqacxrgdkLFgl49blrFXIWihrGhbpzz6lhh5zAPPVst2G3vVvqnfRFEa/M5Xoq2UtzYoFF4YfJ7y72vm2VGLtFCx+iQslDDSyXdHJP3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TmiyQb/b; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TmiyQb/b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732700223;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IdGrtHl5rjvaSNiwhyeBPApsmh4gZQRFZQmViFa02G0=;
	b=TmiyQb/b4tKAEqqmz2bnXQrc+wVH6DrA+aOzeHsKag8+hdolsAufzYEPPe7mrhkghUKmjg
	BjU9Yf/GDObDjQ782IXOG2LGVF4P3IgvqRIwZvOJyfdCQtAGzRpK8x/2rWnPqFWewrS4Be
	iiuv8Zuw1xDb5BmkwjUfyjdXyUd61Ho=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-103-wujKWKz7MVK7Ii10lkWrWQ-1; Wed,
 27 Nov 2024 04:37:01 -0500
X-MC-Unique: wujKWKz7MVK7Ii10lkWrWQ-1
X-Mimecast-MFC-AGG-ID: wujKWKz7MVK7Ii10lkWrWQ
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DBA3E195608D;
	Wed, 27 Nov 2024 09:37:00 +0000 (UTC)
Received: from gerbillo.redhat.com (unknown [10.39.194.173])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 88390195E480;
	Wed, 27 Nov 2024 09:36:58 +0000 (UTC)
From: Paolo Abeni <pabeni@redhat.com>
To: virtio-comment@lists.linux.dev
Cc: maxime.coquelin@redhat.com,
	Eelco Chaudron <echaudro@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	kshankar@marvell.com
Subject: [PATCH v11 2/4] virtio-net: clarify DATA_VALID  semantic for encap protos.
Date: Wed, 27 Nov 2024 10:36:41 +0100
Message-ID: <ec6fdbfba2c4fc1969d83799836ebb694a01fb30.1732699986.git.pabeni@redhat.com>
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
X-Mimecast-MFC-PROC-ID: EYs3IWqKjP8dwvdcLHMmfA15lFtKEWDOGGijay_62YE_1732700221
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

DATA_VALID allows offloading a single checksum level, leaving
unspecified which header checksum is offloaded when one or more
encapsulated protocols are present.

In such a case, the only option usable from the guest OS is
offloading the outermost checksum. That also matches the existing
implementation.

Explicitly state such the constraint, to remove any ambiguity and
make later changes more straightforward.

Signed-off-by: Paolo Abeni <pabeni@redhat.com>
---
 device-types/net/description.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index 3434a31..77bd847 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -994,8 +994,8 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
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
2.45.2

