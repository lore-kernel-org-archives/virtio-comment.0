Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26EFD19B595
	for <virtio-comment@lists.linux.dev>; Thu,  5 Sep 2024 13:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725543998; cv=none; b=oFwRwxnUgmg7UnGgO53pDLLfjj7whdJUWKuiDYlQeEUWRheW2gciHJ4cvcJP1d+Swz8FWY39jZn/sZMBnhS7KKD37aWfVPN1JlEEafJrwJ4eRhoXRf8aT8V5wEx5UE6XXj35oj7tTprLvKAuyorlAY/v/d71bWzi3pMb5x7GwjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725543998; c=relaxed/simple;
	bh=FFOI6HcqnJWBzznyHLUzDSeFXM5SkPnvmFXF13GZBNI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=eOLNK0IyPw4GAZZIr2Pm+D/Egyh+0xdy5HyAWTmDyJ7oX+2B0ciemIKA3hEja8Ex2QmNyW7ZLarZlqlsay3jN5Q15yuq6iZkYd67QJcgqExzmRRiznD2PocJpn1EYSLVt8DMji0canwILrx3ov4VGnufPh8LQfEUALJd0EGvQsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=a2tFoUQV; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="a2tFoUQV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725543994;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ujXA++tJZ0Q/N6lDvsSfb7K4nKL7D6w40jWMsvK0BOA=;
	b=a2tFoUQVMFGYAixeTrEp/OyTqMB3r+h9Q0pFyjcF5yfKuas8DN6HVk1XXCBS/cLFQ0Ms8m
	NkCEf4WsXo1syuuNlmLx4oOTYSrAUOrSpbBQRKC60ONFib2UeRXQGigElnVsJntcA8eb7w
	fJx4kdp0QqBZgkAFYAICLDwrgrdEkOM=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-479-gxs29fVrM6OMf7GCs1QABQ-1; Thu,
 05 Sep 2024 09:46:33 -0400
X-MC-Unique: gxs29fVrM6OMf7GCs1QABQ-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AD37819560B4;
	Thu,  5 Sep 2024 13:46:32 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.194.81])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 22BB41956052;
	Thu,  5 Sep 2024 13:46:29 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com,
	eric.auger@redhat.com,
	virtio-comment@lists.linux.dev,
	jasowang@redhat.com,
	mst@redhat.com,
	jean-philippe@linaro.org
Subject: [PATCH] virtio-iommu: Introduce lazy mode domains and IOTLB_FLUSH request
Date: Thu,  5 Sep 2024 15:46:21 +0200
Message-ID: <20240905134621.711743-1-eric.auger@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

At the moment the virtio-iommu offers MAP and UNMAP requests.
This means that if the virtio-iommu protects a device with an iotlb
we have no other choice but invalidating the device iotlb on UNMAP.
This proposal aims at allowing the decoupling of UNMAP commands
and domain IOTLB invalidations. This enables lazy mode where iotlb
invalidations are deferred and batched. In that prospect we add a
new VIRTIO_IOMMU_F_LAZY_IOTLB_FLUSH feature which, when offered
allows an endpoint to be attached to a domain in lazy mode. Alongside
we introduce a new IOTLB_FLUSH request which allows to invalidate
iotlb entries for the whole domain. When the domain is created in
lazy mode, the virtio-iommu device knows it will receive IOTLB_FLUSH
and it can avoid flushing the device IOTLB on individual UNMAPs.

On a virtio-iommu/vhost scp use case, this can improve the
performance by ~10%.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Fixes: https://github.com/oasis-tcs/virtio-spec/issues/204

---

As a side not virtio-iommu/vhost/scp use case was completely broken
on aarch64 with guests older than v6.6-rc1. The scp stalled and we got
soft-lockups on guest in viommu_iotlb_sync. It happened
295525e29a5b (“virtio_net: merge dma operations when filling mergeable buffers”)
fixed the performance issue. Without that patch and with lazy mode, we
do not observe any stalls although the perf is way worse than with the
above patch. Without lazy mode, it looks like the number of vhost iotlb
invalidation is large enough to cause serious performance issues.

This proposal can be tested with the following branches
guest branch: https://github.com/eauger/linux/tree/virtio-iommu-lazy-rfc
qemu branch: https://github.com/eauger/qemu/tree/virtio-iommu-device-lazy-rfc

This was tested with vhost. In qemu command line, you need to set ats=on
to get benefit of lazy mode.
---
 device-types/iommu/description.tex | 74 +++++++++++++++++++++++++++++-
 1 file changed, 73 insertions(+), 1 deletion(-)

diff --git a/device-types/iommu/description.tex b/device-types/iommu/description.tex
index f8cbe88..990734e 100644
--- a/device-types/iommu/description.tex
+++ b/device-types/iommu/description.tex
@@ -74,6 +74,14 @@ \subsection{Feature bits}\label{sec:Device Types / IOMMU Device / Feature bits}
   whether endpoints that are attached to a domain are in bypass
   mode.
 
+\item[VIRTIO_IOMMU_F_LAZY_IOTLB_FLUSH (7)]
+  This feature determines the capability to use deferred and batched
+  IOTLB flushes. If the feature is available, the driver can inform
+  a given domain works in lazy mode. For such domain, the device is
+  allowed to dissociate UNMAP requests from IOTLB flush operations and
+  accepts separate IOTLB flush requests that invalidate the IOTLB entries
+  for the whole domain.
+
 \end{description}
 
 \drivernormative{\subsubsection}{Feature bits}{Device Types / IOMMU Device / Feature bits}
@@ -312,6 +320,7 @@ \subsubsection{ATTACH request}\label{sec:Device Types / IOMMU Device / Device op
 };
 
 #define VIRTIO_IOMMU_ATTACH_F_BYPASS  (1 << 0)
+#define VIRTIO_IOMMU_ATTACH_F_LAZY    (1 << 1)
 \end{lstlisting}
 
 Attach an endpoint to a domain. \field{domain} uniquely identifies a
@@ -341,6 +350,18 @@ \subsubsection{ATTACH request}\label{sec:Device Types / IOMMU Device / Device op
 can set the VIRTIO_IOMMU_ATTACH_F_BYPASS flag to create a bypass
 domain. Endpoints attached to this domain are in bypass mode.
 
+When the VIRTIO_IOMMU_F_LAZY_IOTLB_FLUSH feature is available, the driver
+can set the VIRTIO_IOMMU_ATTACH_F_LAZY flag to create a lazy mode domain.
+Only such domains do support the IOTLB_FLUSH request.
+
+If the device does not offer the VIRTIO_IOMMU_F_LAZY_IOTLB_FLUSH feature and
+if the driver sets \field{flags} field to VIRTIO_IOMMU_ATTACH_F_LAZY, the
+device MAY set the request \field{status} to VIRTIO_IOMMU_S_INVAL.
+
+If several endpoints are attached to the same domain, they must be attached
+with the same value for that flag. Otherwise the device MAY set the request
+\field{status} to VIRTIO_IOMMU_S_INVAL.
+
 \drivernormative{\paragraph}{ATTACH request}{Device Types / IOMMU Device / Device operations / ATTACH request}
 
 The driver SHOULD set \field{reserved} to zero.
@@ -351,7 +372,8 @@ \subsubsection{ATTACH request}\label{sec:Device Types / IOMMU Device / Device op
 If the domain already exists and is a bypass domain, the driver
 SHOULD set the VIRTIO_IOMMU_ATTACH_F_BYPASS flag. If the domain
 exists and is not a bypass domain, the driver SHOULD NOT set the
-VIRTIO_IOMMU_ATTACH_F_BYPASS flag.
+VIRTIO_IOMMU_ATTACH_F_BYPASS flag. The same holds for the
+VIRTIO_IOMMU_ATTACH_F_LAZY flag.
 
 \devicenormative{\paragraph}{ATTACH request}{Device Types / IOMMU Device / Device operations / ATTACH request}
 
@@ -374,6 +396,10 @@ \subsubsection{ATTACH request}\label{sec:Device Types / IOMMU Device / Device op
 flag is not consistent with that domain, the device SHOULD reject
 the request and set \field{status} to VIRTIO_IOMMU_S_INVAL.
 
+If the domain already exists and the VIRTIO_IOMMU_ATTACH_F_LAZY
+flag is not consistent with that domain, the device SHOULD reject
+the request and set \field{status} to VIRTIO_IOMMU_S_INVAL.
+
 If the endpoint identified by \field{endpoint} is already attached to
 another domain, then the device SHOULD first detach it from that domain
 and attach it to the one identified by \field{domain}. In that case the
@@ -590,6 +616,11 @@ \subsubsection{UNMAP request}\label{sec:Device Types / IOMMU Device / Device ope
 This request is only available when VIRTIO_IOMMU_F_MAP_UNMAP has been
 negotiated.
 
+In case the domain is created with the VIRTIO_IOMMU_ATTACH_F_LAZY flag,
+the device is allowed to separate UNMAP from IOTLB invalidations. The driver
+must explicitly invalidate the whole domain IOTLB entries using the separate
+IOTLB_FLUSH request.
+
 \drivernormative{\paragraph}{UNMAP request}{Device Types / IOMMU Device / Device operations / UNMAP request}
 
 The driver SHOULD set the \field{reserved} field to zero.
@@ -625,6 +656,47 @@ \subsubsection{UNMAP request}\label{sec:Device Types / IOMMU Device / Device ope
 mapping, then the device SHOULD remove all mappings affected by the range
 and set the request \field{status} to VIRTIO_IOMMU_S_OK.
 
+\subsubsection{IOTLB_FLUSH request}\label{sec:Device Types / IOMMU Device / Device operations / IOTLB_FLUSH request}
+
+\begin{lstlisting}
+struct virtio_iommu_req_iotlb_flush {
+  struct virtio_iommu_req_head head;
+  le32  domain;
+  u8    reserved[4];
+  struct virtio_iommu_req_tail tail;
+};
+\end{lstlisting}
+
+Flush IOTLB entries for a given domain. This domain must have been created
+with lazy mode set (VIRTIO_IOMMU_ATTACH_F_LAZY flag set on attachment).
+
+\drivernormative{\paragraph}{IOTLB_FLUSH request}{Device Types / IOMMU Device / Device operations / IOTLB_FLUSH request}
+
+The driver SHOULD set the \field{reserved} field to zero.
+
+The driver SHOULD NOT send IOTLB_FLUSH requests on a bypass domain.
+
+The driver SHOULD NOT send IOTLB_FLUSH requests on a non lazy domain.
+
+\devicenormative{\paragraph}{IOTLB_FLUSH request}{Device Types / IOMMU Device / Device operations / UNMAP request}
+
+If the \field{reserved} field of an IOTLB_FLUSH request is not zero, the device
+MAY set the request \field{status} to VIRTIO_IOMMU_S_INVAL, in which case
+the device MAY perform the IOTLB_FLUSH operation.
+
+If the device does not offer the VIRTIO_IOMMU_F_LAZY_IOTLB_FLUSH feature and
+if the driver calls the IOTLB_FLUSH request, the device MAY set the request
+\field{status} to VIRTIO_IOMMU_S_INVAL.
+
+If \field{domain} does not exist, the device SHOULD set the request
+\field{status} to VIRTIO_IOMMU_S_NOENT.
+
+If the domain is a bypass domain, the device SHOULD reject the
+request and set \field{status} to VIRTIO_IOMMU_S_INVAL.
+
+If the domain is not a lazy domain, the device SHOULD reject the
+request and set \field{status} to VIRTIO_IOMMU_S_INVAL.
+
 \subsubsection{PROBE request}\label{sec:Device Types / IOMMU Device / Device operations / PROBE request}
 
 If the VIRTIO_IOMMU_F_PROBE feature bit is present, the driver sends a
-- 
2.41.0

