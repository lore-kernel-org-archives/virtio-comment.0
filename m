Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E62C309DA0
	for <virtio-comment@lists.linux.dev>; Tue, 14 Oct 2025 04:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415775; cv=none; b=eAuIk0lrbhpySlYV2QOXxZEXIXQEW4rzs7sV0rmMRJOdwcKKE3DayXHm/i9tTJ0WEI0Z8LtDzG5SNaSd6ILHDLD/Qtu3JDHX2rHGUyQMX8X8KqE093+YcMLznjFQa/5wnvMmHsRQKwtNqkpfCsV5lhpwCCfS68UY2RbqvrTSFfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415775; c=relaxed/simple;
	bh=PNGwGEUvC/ttSbGOny4dTKFNQUY/myd+Rc2bLbg1QGU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-type; b=IrHhAbOhT5p+RDgywfpqwV+MrgoKrl11OL9qMt3LpejfGw8ESHvjyK1T4fROOmJ3fuDIY+jwJYY7L3uwjJ1CU1ZSojOJCgSdo5EQaj8tMGl/EQDbceZiN/8WNmlEEZ69ZopABqtV+kyX0cQRrzIlCNVyf7JRv20ucc5DzR89rgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PO+PPo24; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PO+PPo24"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760415772;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=952vaX8q1CO/kii5IYmSGxQRKlx1ZKYQdoYHsxliwCo=;
	b=PO+PPo24ZFdKZWRyYtAZjabCZgN5xxSF3oNcqHqNbMtsj2rTOpTOkG08i9HufoJ2hOoHs3
	ofefRxn8yArCUrXFLQIwG7oJWgKqh7gDm+Jd56Xvmq6dWZirlzmvApk7Qmg6OjfIQ16OXB
	GtfN+AfQaRUWtdksOt3BHCtvvLT7JNw=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-641-qrOeBW8mN5m_brwS-iKhSg-1; Tue,
 14 Oct 2025 00:22:50 -0400
X-MC-Unique: qrOeBW8mN5m_brwS-iKhSg-1
X-Mimecast-MFC-AGG-ID: qrOeBW8mN5m_brwS-iKhSg_1760415769
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 91D7E1800451;
	Tue, 14 Oct 2025 04:22:49 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.72.112.244])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id DCE3F1800446;
	Tue, 14 Oct 2025 04:22:46 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: virtio-comment@lists.linux.dev,
	mst@redhat.com
Cc: lulu@redhat.com,
	nguyenlienviet@google.com,
	Jason Wang <jasowang@redhat.com>
Subject: [PATCH] virtio-net: introduce TSO limit feature
Date: Tue, 14 Oct 2025 12:22:43 +0800
Message-ID: <20251014042243.22087-1-jasowang@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kMgbVLHRSbIcSoHyuKE2TMCnneNpGLQdPMiIp4qF7ic_1760415769
X-Mimecast-Originator: redhat.com
Content-type: text/plain
Content-Transfer-Encoding: 8bit

This patch introduces TSO limit feature which allows the device to
advertise:

- Maximum TCP length of a TSO packet or inner TSO packet when UDP
  tunnel is support
- Maximum number of segment that can be produced by the device after
  segmentation of TSO or inner TSO packet of a UDP tunnel

This is a must to implement TCP jumbogram, as networking stack needs
to know the limitation of the device in order to produce TSO packet as
large as possible.

And it would also help for the case where host has a different TSO
limitation than the assumption (for example, Linux assumes 64K to be
the maximum number of segs and payload length).

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 device-types/net/description.tex | 46 ++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index 415c7fd..e56df75 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -146,6 +146,9 @@ \subsection{Feature bits}\label{sec:Device Types / Network Device / Feature bits
  when VIRTIO_NET_F_IPSEC is negotiated. When a device offers IPsec feature, it SHOULD
  also offer the VIRTIO_NET_F_OUT_NET_HEADER feature.
 
+\item[VIRTIO_NET_F_HOST_TSO_LIMIT(71)] Device limits the maximum TCP
+  length and the number of segments when performing TCP segmentation.
+
 \end{description}
 
 \subsubsection{Feature bit requirements}\label{sec:Device Types / Network Device / Feature bits / Feature bit requirements}
@@ -184,6 +187,7 @@ \subsubsection{Feature bit requirements}\label{sec:Device Types / Network Device
 \item[VIRTIO_NET_F_VQ_NOTF_COAL] Requires VIRTIO_NET_F_CTRL_VQ.
 \item[VIRTIO_NET_F_HASH_TUNNEL] Requires VIRTIO_NET_F_CTRL_VQ along with VIRTIO_NET_F_RSS or VIRTIO_NET_F_HASH_REPORT.
 \item[VIRTIO_NET_F_RSS_CONTEXT] Requires VIRTIO_NET_F_CTRL_VQ and VIRTIO_NET_F_RSS.
+\item[VIRTIO_NET_F_HOST_TSO_LIMIT] Requires VIRTIO_NET_F_HOST_TSO4 or VIRTIO_NET_F_HOST_TSO6
 \end{description}
 
 \begin{note}
@@ -220,6 +224,8 @@ \subsection{Device configuration layout}\label{sec:Device Types / Network Device
         le16 rss_max_indirection_table_length;
         le32 supported_hash_types;
         le32 supported_tunnel_types;
+        le32 tso_max_size;
+        le32 tso_max_segs;
 };
 \end{lstlisting}
 
@@ -276,6 +282,19 @@ \subsection{Device configuration layout}\label{sec:Device Types / Network Device
 Encapsulation types are defined in \ref{sec:Device Types / Network Device / Device Operation / Processing of Incoming Packets /
 Hash calculation for incoming packets / Encapsulation types supported/enabled for inner header hash}.
 
+The following field, \field{tso_max_size} only exists if
+VIRTIO_NET_F_HOST_TSO_LIMIT is set.
+It specifies the maximum TCP length of a TSO packet that the
+device can process. When VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO is set,
+it specifies the maximum inner TCP length of a UDP tunnel TSO packet
+that the device can process.
+
+The following field, \field{tso_max_segs} only exists if
+VIRTIO_NET_F_HOST_TSO_LIMIT is set.
+It specifies the maximum number of segments that can be produced by
+the device after performing segmentation on TSO packet or a UDP tunnel
+TSO packet (when VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO is set).
+
 \devicenormative{\subsubsection}{Device configuration layout}{Device Types / Network Device / Device configuration layout}
 
 The device MUST set \field{max_virtqueue_pairs} to between 1 and 0x8000 inclusive,
@@ -326,6 +345,17 @@ \subsection{Device configuration layout}\label{sec:Device Types / Network Device
 The device SHOULD NOT offer VIRTIO_NET_F_CTRL_RX_EXTRA if it
 does not offer VIRTIO_NET_F_CTRL_VQ.
 
+If VIRTIO_NET_F_HOST_TSO_LIMIT and VIRTIO_NET_F_MTU have been
+negotiated, the device SHOULD set \field{tso_max_size} so that a TCP
+segment that fully utilizes the configured MTU can be processed by TSO
+(e.g., for IPv4 without options: at least \field{mtu} - 20; for IPv6
+without extension headers: at least \field{mtu} - 40). This
+recommendation does not account for IPv4 options or IPv6 extension
+headers, which reduce the effective segment size.
+
+If VIRTIO_NET_F_HOST_TSO_LIMIT has been negotiated, the device MUST
+set \field{tso_max_segs} to at least 64.
+
 \drivernormative{\subsubsection}{Device configuration layout}{Device Types / Network Device / Device configuration layout}
 
 The driver MUST NOT write to any of the device configuration fields.
@@ -379,6 +409,22 @@ \subsubsection{Legacy Interface: Device configuration layout}\label{sec:Device T
 which provided a way for drivers to update the MAC without
 negotiating VIRTIO_NET_F_CTRL_MAC_ADDR.
 
+If the driver negotiates VIRTIO_NET_F_HOST_TSO_LIMIT, it MUST NOT
+transmit TSO packets with TCP length exceeding \field{tso_max_size}.
+
+If the driver negotiates both VIRTIO_NET_F_HOST_TSO_LIMIT and
+VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO, it MUST NOT transmit UDP tunnel TSO
+packets with inner TCP length exceeding \field{tso_max_size}.
+
+If the driver negotiates VIRTIO_NET_F_HOST_TSO_LIMIT, it MUST NOT
+transmit TSO packets with \field{gso_size} that would cause the device
+to generate more than \field{tso_max_segs} segments.
+
+If the driver negotiates both VIRTIO_NET_F_HOST_TSO_LIMIT and
+VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO, it MUST NOT transmit UDP tunnel TSO
+packets with \field{gso_size} that would cause the device to generate
+more than \field{tso_max_segs} segments.
+
 \subsection{Device Initialization}\label{sec:Device Types / Network Device / Device Initialization}
 
 A driver would perform a typical initialization routine like so:
-- 
2.42.0

