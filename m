Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8737935957
	for <virtio-comment@lists.linux.dev>; Mon, 19 May 2025 10:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747649564; cv=none; b=fgoIOE/OnO0OV7YUUv7Qx9XuPT8c7p+jNppU4Mq5n3J+ds1CpXwRSVzEvSDdCimJ7V9A6q7FlmJVB9dH2joKvIe86vEsCH9sz7SuaBF3P3U3b+DNnNxuxvxnlBGHSAQ3KLIQ0I1Rhk+ENd6syLJSUwBXuDQpWoI/DrSkMJlnM6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747649564; c=relaxed/simple;
	bh=BD5yo1mriI1EZQG+KF1XmnfxDsZpSTKrTSQdW9jgWhQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:content-type; b=Yn/QBMeZr2DjT1IR7U7ZDdnIgE+JFYjch55mCT9dYfTFDPukK+EtL1FkEXdeusBYsgTZkubDTytOAgSIgty/UgKNUi6bmODleie4rr5ow2qK9b8HbLEdvNEUW3hCkI0Vd4/UD5h6+R6nf88Vpb3dMWIuZepPNIcHQp0maaOudwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=X+XHf+mn; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="X+XHf+mn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747649561;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=R7UhbgnpUA+iEVU/0RMRxMq/bmDsWDf7tTiMVCUx9ck=;
	b=X+XHf+mnGGgXiUJhO1Hj0qvWVdw2WVdAr4k527t/D+zVglAsHUqM4dyRfjlh+jU41L7fua
	NcW+6cLGwiNX8RdgdLr9bmqxqMHWTHSTLEJWJ9uBxSfyufBJghxgCUmcRYG+r833xjtEZH
	8ro+Yfxw5IfTE8M2GiZPOLAv7It3fco=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-664-E1S6cmWYOKOXoN2so3nqbw-1; Mon,
 19 May 2025 06:12:37 -0400
X-MC-Unique: E1S6cmWYOKOXoN2so3nqbw-1
X-Mimecast-MFC-AGG-ID: E1S6cmWYOKOXoN2so3nqbw_1747649557
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DCC681955DB5;
	Mon, 19 May 2025 10:12:36 +0000 (UTC)
Received: from gerbillo.redhat.com (unknown [10.44.32.252])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 96B4D30001AB;
	Mon, 19 May 2025 10:12:32 +0000 (UTC)
From: Paolo Abeni <pabeni@redhat.com>
To: virtio-comment@lists.linux.dev
Cc: Jason Wang <jasowang@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	mst@redhat.com,
	Parav Pandit <parav@nvidia.com>,
	mvaralar@redhat.com,
	cohuck@redhat.com
Subject: [PATCH] virtio-net: clarify guest offloads <> features mapping
Date: Mon, 19 May 2025 12:12:16 +0200
Message-ID: <a30de484ff56065f56e37446e08dcdfa4850f101.1747649330.git.pabeni@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: o51fQn6AH_AK3OyUdMsKsKzbL30hsXutFITWk2UUyxc_1747649557
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

Signed-off-by: Paolo Abeni <pabeni@redhat.com>
---
 device-types/net/description.tex | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index 1b6b54d..8c501bc 100644
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
 
+Note that device features bits in the [65 to 68] range correspond to
+offload bits in the [46 to 49] range.
+
 \drivernormative{\subparagraph}{Setting Offloads State}{Device Types / Network Device / Device Operation / Control Virtqueue / Offloads State Configuration / Setting Offloads State}
 
 A driver MUST NOT enable an offload for which the appropriate feature
-- 
2.49.0

