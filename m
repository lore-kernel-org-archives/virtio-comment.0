Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 034921F1909
	for <virtio-comment@lists.linux.dev>; Tue,  1 Apr 2025 11:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743506968; cv=none; b=WeZs8xdL8LE0BXEidABQ6b53SBnNPbG/OeGeIggUD42wZ3GMjkHj178+TekuoPCFZn2FZZiPOkvP7igZhKBGdxciMR2pSWlp2FGmEz9GdfBByc8Rww9BgOv3b9Uu9fMLtHwRMqBKBxEU13mHphXOno9eun27PUc7DWwzymvNAhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743506968; c=relaxed/simple;
	bh=18SIE6HHLQ9W1SlnXRIVhmKyrIKAxiCVEqsydDANXME=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=eLPWfHGWqrtp+Qz73GkHoH35ExkHW/ayn4oWQBBFpbXT8cMrXFyb/qffZRqKBiW9oanWX9cCxG1bvrvj9HyVFj6OPXaf5dft07PV1bLiqdXlsTOQ6MFDDNIr3Ht8rDFZHy30ZWeNc4T1R6gSlB/gO4/+mFfpLbYDxxvF3FGZpHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JcO8vyBq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JcO8vyBq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743506965;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m0Vbu97pe9F9bRbPGwFtt07fFtpT3xbG56Uiiaijel4=;
	b=JcO8vyBqiY91tbYDyI4yY/tBW1Ege+ARKyOSZ/UEIv2P/86f4p9/OD+GNRxg6eZN5M7z71
	TbO4ojeOg42cCQpBrIPjA1TNLiP9VYHC+ZfPOfaP78dAZUsRZt6KQvKN+zuRC2i8V1IuOS
	isizpUXOOFilIgg5lwvIOQe1qcNsKmk=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-522-5Q7ld9HVPVab840QCw8YyA-1; Tue,
 01 Apr 2025 07:29:24 -0400
X-MC-Unique: 5Q7ld9HVPVab840QCw8YyA-1
X-Mimecast-MFC-AGG-ID: 5Q7ld9HVPVab840QCw8YyA_1743506963
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B1989180AF66;
	Tue,  1 Apr 2025 11:29:23 +0000 (UTC)
Received: from f41vm.. (unknown [10.45.225.223])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 084B81955BEF;
	Tue,  1 Apr 2025 11:29:21 +0000 (UTC)
From: Sergio Lopez <slp@redhat.com>
To: virtio-comment@lists.linux.dev
Cc: mst@redhat.com,
	dmitry.osipenko@collabora.com,
	parav@nvidia.com,
	Sergio Lopez <slp@redhat.com>
Subject: [PATCH v3 1/3] shared-mem: introduce page alignment restrictions
Date: Mon, 31 Mar 2025 17:37:09 -0400
Message-ID: <20250331213711.63398-2-slp@redhat.com>
In-Reply-To: <20250331213711.63398-1-slp@redhat.com>
References: <20250331213711.63398-1-slp@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rpTJsTATLl2apNjV1NAwISn50bubEQwT3tECFTwQtn0_1743506963
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Add a subsection for page alignment restrictions and introduce the
VIRTIO_F_SHM_PAGE_SIZE feature bit.

Signed-off-by: Sergio Lopez <slp@redhat.com>
---
 content.tex    | 10 ++++++++--
 shared-mem.tex |  7 +++++++
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/content.tex b/content.tex
index c17ffa6..c8826a2 100644
--- a/content.tex
+++ b/content.tex
@@ -99,10 +99,10 @@ \section{Feature Bits}\label{sec:Basic Facilities of a Virtio Device / Feature B
 \begin{description}
 \item[0 to 23, and 50 to 127] Feature bits for the specific device type
 
-\item[24 to 41] Feature bits reserved for extensions to the queue and
+\item[24 to 42] Feature bits reserved for extensions to the queue and
   feature negotiation mechanisms, see \ref{sec:Reserved Feature Bits}
 
-\item[42 to 49, and 128 and above] Feature bits reserved for future extensions.
+\item[43 to 49, and 128 and above] Feature bits reserved for future extensions.
 \end{description}
 
 \begin{note}
@@ -872,6 +872,12 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
 	\ref{devicenormative:Basic Facilities of a Virtio Device / Feature Bits} for
 	handling features reserved for future use.
 
+  \item[VIRTIO_F_SHM_PAGE_SIZE(42)] This feature indicates that the device
+  transport provides information about the supported page size and expects the
+  driver to honor the alignment restrictions derived from it when requesting
+  mappings on the corresponding shared memory region.
+  See also \ref {sec:Basic Facilities of a Virtio Device / Shared Memory Regions / Page alignment restrictions}.
+
 \end{description}
 
 \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature Bits}
diff --git a/shared-mem.tex b/shared-mem.tex
index 6e6f6c4..dd90cb7 100644
--- a/shared-mem.tex
+++ b/shared-mem.tex
@@ -34,6 +34,13 @@ \subsection{Addressing within regions}\label{sec:Basic Facilities of a Virtio De
 The \field{shmid} may be explicit or may be inferred from the
 context of the reference.
 
+\subsection{Page alignment restrictions}\label{sec:Basic Facilities of a Virtio Device / Shared Memory Regions / Page alignment restrictions}
+
+If VIRTIO_F_SHM_PAGE_SIZE has been negotiated, when requesting
+the device to map memory into a shared memory region, the driver
+MUST obtain the page size information from the transport and honor
+the page alignment constrains derived from that page size.
+
 \devicenormative{\subsection}{Shared Memory Regions}{Basic Facilities of a Virtio
 Device / Shared Memory Regions}
 Shared memory regions MUST NOT expose shared memory regions which
-- 
2.49.0

