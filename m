Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B982825A2DD
	for <virtio-comment@lists.linux.dev>; Wed, 21 May 2025 11:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747826449; cv=none; b=TR/B21eS2UvI+0IVBaR0z+tMaXEjvaXvV5NxjHoK3SCbrTEGoWhNaAIyj1nH0+zzs9DlcHXQWvwPK+7UH4HjJ0IiKhCvEqDYCXxDcMFCL7oEG4RgdI4yNjkNR/cQ0EUAngyt5a7x6+zuXgcmQmfgWLU1ByVkZOz085cjfs7qxao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747826449; c=relaxed/simple;
	bh=reQyrB2984Gzlb0vr93wVuvcV9K2rXCQ0dTvLJDqpkM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:content-type; b=HzhFH8WtgvvkorUuyq7DrTi5w/eNmIdBlxHPVgRBYtPsHxsduHk4/X6iiPrs3Igz8XMlvLrXFfEm5wZx37mS98EwNWTUIKIWBDHGS9mBgaUIbiMcr35etbITE5tsPl0zr31s5vF8mGcKO0yqZYfzT2s2/XdT6aK2O1UrIHrrCnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FevhdWVn; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FevhdWVn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747826446;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=hybPWrUJWiV/aZQJrLoA9DBnHBn6UoXKlFPrVG5l7KU=;
	b=FevhdWVnaNeVhNUTewc5PBLDy/Mj3ObHHvTMLgadiezshGcX3JkeeaAwRGt2rHUleaKVwo
	YfSb4JcsAR56iUSwKDMNAFssglHqc30kxPIMFOvabGD8WZK+ZLZbnb0MQv94J13/824JGC
	KlZfAgyBRoPaLQftM1d1KVnEtisbW0o=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-237-e5SL9AlVMzurp0aC6wIWcg-1; Wed,
 21 May 2025 07:20:43 -0400
X-MC-Unique: e5SL9AlVMzurp0aC6wIWcg-1
X-Mimecast-MFC-AGG-ID: e5SL9AlVMzurp0aC6wIWcg_1747826442
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7138A1800EC9;
	Wed, 21 May 2025 11:20:42 +0000 (UTC)
Received: from gerbillo.redhat.com (unknown [10.45.224.39])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 582A5195608F;
	Wed, 21 May 2025 11:20:38 +0000 (UTC)
From: Paolo Abeni <pabeni@redhat.com>
To: virtio-comment@lists.linux.dev
Cc: Jason Wang <jasowang@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	mst@redhat.com,
	Parav Pandit <parav@nvidia.com>,
	mvaralar@redhat.com,
	cohuck@redhat.com
Subject: [PATCH v2] virtio-net: clarify guest offloads <> features mapping
Date: Wed, 21 May 2025 13:20:31 +0200
Message-ID: <6af50c9ada76d8168d248827e4af7c44bdfa34a8.1747826378.git.pabeni@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: JNOpgB7mQwm-CG8MComXW2HT9XByGgjJzI4GixHxmx4_1747826442
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

The guest offloads, as specified by 'Setting Offloads State,' use a
64-bit wide space, while some of the corresponding virtio net features
are in the upper 64 bits of a 128-bit wide space.

Clarify the relevant mapping as somewhat implied by the current text.
Also rename the offload definitions to avoid referring to different
numeric values with the same name in the features table and in the
offload table.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/225
Signed-off-by: Paolo Abeni <pabeni@redhat.com>
---
v1 -> v2:
  - restrict the mapped range to the guest offload (Parav)
  v1: https://lore.kernel.org/virtio-comment/a30de484ff56065f56e37446e08dcdfa4850f101.1747649330.git.pabeni@redhat.com/
---
 device-types/net/description.tex | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index 1b6b54d..9712e83 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -2186,8 +2186,8 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
 #define VIRTIO_NET_F_GUEST_TSO6       8
 #define VIRTIO_NET_F_GUEST_ECN        9
 #define VIRTIO_NET_F_GUEST_UFO        10
-#define VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO  46
-#define VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_CSUM 47
+#define VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_MAPPED  46
+#define VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_CSUM_MAPPED 47
 #define VIRTIO_NET_F_GUEST_USO4       54
 #define VIRTIO_NET_F_GUEST_USO6       55
 
@@ -2205,6 +2205,9 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
 negotiation corresponding offload gets enabled to preserve backward
 compatibility.
 
+Note that device features bits in the [65 to 66] range correspond to
+offload bits in the [46 to 47] range.
+
 \drivernormative{\subparagraph}{Setting Offloads State}{Device Types / Network Device / Device Operation / Control Virtqueue / Offloads State Configuration / Setting Offloads State}
 
 A driver MUST NOT enable an offload for which the appropriate feature
-- 
2.49.0

