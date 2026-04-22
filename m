Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A382FF65F
	for <virtio-comment@lists.linux.dev>; Wed, 22 Apr 2026 16:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776874341; cv=none; b=Epgp+2ShuK2mKCpFjfnQkKfISEshYrkqzP6PjD5x1hwFsnJ+aUJ0A27WVvlVIwY2JhyJQZXHaeaJ379jqmaTiauXsrelmRLPlClELSSZsz3B04hYc7c5H5zn8ni1U9j3DcXFRWXQqh7v2EqEZM5izPbZfk3AHBQobmThm7DCzIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776874341; c=relaxed/simple;
	bh=sACFUr65WfL7WcSl6fH2erNH7Gsw7QqIdK0/Tsesqkw=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=rTmSm9QgRgC8L7BBr9nTCngh6PnmyS8eQ/oTmvhbVKX0+csCa8uBTkCWRIwtvmzcU/sdOWAgYwDjuUKVxkZGn9rNDNlp7mFNRl+uMSGSB/E+tn6iioqzZP69ZX8ddaq00Pk3bnGLS4OOTETQlt5FDRFNhUM6roG9HWYpMs4lh/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bQTynO/C; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bQTynO/C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776874339;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oJKVHtgKOeD2kUkVPpTXNl8s2jJoWkvNdm2JHR3j4LY=;
	b=bQTynO/CAJQV7Ck7ZqbKiEiqOg2VVbYilBlkxYtkmwWzeyzqSathCaO24rm8jzigill53S
	ijRU6xvYjCA3S64rF6u2973cbmYFTLsl71M3YFvW1iE2TIVNrTuFaasoLb+1voT42dJ7E3
	0WDEMyh3ZvAnV5HzWQKmaD+8IeItU78=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-212-PyyYxzWRMKSqn2UvEilA5Q-1; Wed, 22 Apr 2026 12:12:13 -0400
X-MC-Unique: PyyYxzWRMKSqn2UvEilA5Q-1
X-Mimecast-MFC-AGG-ID: PyyYxzWRMKSqn2UvEilA5Q_1776874333
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-43d70c27214so3896106f8f.3
        for <virtio-comment@lists.linux.dev>; Wed, 22 Apr 2026 09:12:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776874332; x=1777479132;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oJKVHtgKOeD2kUkVPpTXNl8s2jJoWkvNdm2JHR3j4LY=;
        b=Vv1qbNjEMYd5FPeYy1k0LP2sCyns9nfgML5YUfPGqqaFq1PcZlJe8Y3H74kv8OOHxc
         iUAixYuIVw1nkngri6v2dXiijC8VlhT3pQ/Umsx39tZg0iLUy4RiBjQ0YL7NiEZGgKBA
         G+azVQLK1Lni3PTIkdsHVYJDleIk7U9Dr1dYOkEholwHzzdCkVe+jt//JlmCzvIRQMh4
         Oqx/zht6yIk2TFv8ZloVXTkzZmR6prc2EYIoBvrBBJBHZ260Ld203NxwGOJxY1JIy6Lq
         8DNzmHLHmv2/04ZkaEhDEjoufTV8lvBTTtiZMl73MSqbUaemoF3Kk6ASw/c0k1IY5wYT
         pA7g==
X-Gm-Message-State: AOJu0YyRS9fLOg3ONwRxPpazpySp9pUB9IIURADWpNVt/om9rsNy+1A/
	SIuKDy3XUUdwmv8FskUIWZNBF2zOwIIMYqkjC5wtrQ4Nahc0IAPsRN+Nmzy8pAsnCk0tbuqk538
	stfjdLEiwvpMUrEKQ0lGbY5dQq877ZsBjqMJpz5NU5FKnNq3rZiJzthqOYJIAGZqQ+gCcaKWDcW
	NMjgPgvelx0Dd+5UmDjLAhizQhIqd9kUyb9rxT+hyrAMoG/g==
X-Gm-Gg: AeBDiesh2nDX6YRvYmLBUZfXhMsFIlxRw0EiKP2kSXeuz7UBoF3DU2VNuUVxaEsr25i
	dGp83q+/xArep9a2VbqFYkmCRejmwwtIL7dR4EN0sFVZKndqHC+b40qVXJQcA4EdyYIHrqfbhbx
	jP35LpAX4/z7k4wsD6BlNLecTgCju71887qedBX1NVZGAfavPqK71P+5y70jQLqzNSlkHTWu9Mw
	VOAeMyFXmsq36UJn0OdNNGOVTW3DBoyGg0DtkOJexmcNmd0QUXLkMqpDlI1yc0H+0Dz3pGWsN46
	vnUH6ddcqtZRPaxVJ2zy9Aw7a98xrpO/x9u72E/UtL6LIFxxqME2XGe7TlOwDm7VoL1MXvpB2TV
	ZWesS4rD1t7m9E+hKgm1CrroGIUPcGIaEcOB3Rx5AfW+ApIHJKiyZVg==
X-Received: by 2002:a05:600c:8a08:b0:488:a82f:bb9b with SMTP id 5b1f17b1804b1-488ff369a1cmr245637855e9.30.1776874332241;
        Wed, 22 Apr 2026 09:12:12 -0700 (PDT)
X-Received: by 2002:a05:600c:8a08:b0:488:a82f:bb9b with SMTP id 5b1f17b1804b1-488ff369a1cmr245637165e9.30.1776874331643;
        Wed, 22 Apr 2026 09:12:11 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-25-21.inter.net.il. [80.230.25.21])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb74c68asm143362945e9.3.2026.04.22.09.12.09
        for <virtio-comment@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 09:12:11 -0700 (PDT)
Date: Wed, 22 Apr 2026 12:12:08 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: virtio-comment@lists.linux.dev
Subject: [PATCH 2/2] balloon: add VIRTIO_BALLOON_F_DEVICE_INIT_DEFLATED
Message-ID: <24ed09fb89c1a48b39fc812b765bea10763860ef.1776874126.git.mst@redhat.com>
References: <cover.1776874126.git.mst@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <cover.1776874126.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: E2_T1gWt-gVK2b3XDV2p-cLxRHftJCaH_fBD-cjIxLY_1776874333
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Same idea as DEVICE_INIT_REPORTED but for deflation.
The device has been holding these pages since inflate, so
it can guarantee initialization of all of them. Make this
all-or-nothing: the device must not offer the feature if it
cannot initialize every page.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/242
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 device-types/balloon/description.tex        | 48 +++++++++++++++++++++
 device-types/balloon/device-conformance.tex |  1 +
 device-types/balloon/driver-conformance.tex |  1 +
 3 files changed, 50 insertions(+)

diff --git a/device-types/balloon/description.tex b/device-types/balloon/description.tex
index 144983b..7470763 100644
--- a/device-types/balloon/description.tex
+++ b/device-types/balloon/description.tex
@@ -55,6 +55,12 @@ \subsection{Feature bits}\label{sec:Device Types / Memory Balloon Device / Featu
     are filled with zeros. A bitmap indicating which pages were
     successfully initialized is returned to the driver.
 
+\item[ VIRTIO_BALLOON_F_DEVICE_INIT_DEFLATED(7) ] The device initializes
+    deflated pages before returning them to the driver. If
+    VIRTIO_BALLOON_F_PAGE_POISON is also negotiated, deflated pages
+    are filled with \field{poison_val}; otherwise, they are filled
+    with zeros.
+
 \end{description}
 
 \drivernormative{\subsubsection}{Feature bits}{Device Types / Memory Balloon Device / Feature bits}
@@ -692,3 +698,45 @@ \subsubsection{Device Initialized Reported Pages}\label{sec:Device Types / Memor
 
 If VIRTIO_BALLOON_F_PAGE_POISON is not negotiated, the device
 MUST fill each successfully initialized page with zeros.
+
+\subsubsection{Device Initialized Deflated Pages}\label{sec:Device Types / Memory Balloon Device / Device Operation / Device Initialized Deflated Pages}
+
+Device Initialized Deflated Pages provides a mechanism for the device
+to initialize deflated pages before returning them to the driver. When
+this feature is negotiated, the device fills all deflated pages with
+the appropriate initialization value before acknowledging the deflate
+request.
+
+If VIRTIO_BALLOON_F_PAGE_POISON is also negotiated, the device fills
+pages with \field{poison_val}; otherwise, the device fills pages
+with zeros.
+
+\drivernormative{\paragraph}{Device Initialized Deflated Pages}{Device Types / Memory Balloon Device / Device Operation / Device Initialized Deflated Pages}
+
+Normative statements in this section apply if the
+VIRTIO_BALLOON_F_DEVICE_INIT_DEFLATED feature has been negotiated.
+
+The driver MUST NOT assume deflated pages are initialized until
+the device has acknowledged the deflate request.
+
+The driver MAY use deflated pages without initializing them, as they
+are guaranteed to be initialized once the deflate request is
+acknowledged.
+
+If VIRTIO_BALLOON_F_PAGE_POISON is also negotiated, the driver
+need not initialize deflated pages with \field{poison_val},
+as the device has already done so.
+
+\devicenormative{\paragraph}{Device Initialized Deflated Pages}{Device Types / Memory Balloon Device / Device Operation / Device Initialized Deflated Pages}
+
+Normative statements in this section apply if the
+VIRTIO_BALLOON_F_DEVICE_INIT_DEFLATED feature has been negotiated.
+
+The device MUST fill all deflated pages with the initialization value
+before acknowledging the deflate request.
+
+If VIRTIO_BALLOON_F_PAGE_POISON is also negotiated, the device
+MUST fill each deflated page with \field{poison_val}.
+
+If VIRTIO_BALLOON_F_PAGE_POISON is not negotiated, the device
+MUST fill each deflated page with zeros.
diff --git a/device-types/balloon/device-conformance.tex b/device-types/balloon/device-conformance.tex
index 1d4df8c..dfa00c2 100644
--- a/device-types/balloon/device-conformance.tex
+++ b/device-types/balloon/device-conformance.tex
@@ -10,4 +10,5 @@
 \item \ref{devicenormative:Device Types / Memory Balloon Device / Device Operation / Page Poison}
 \item \ref{devicenormative:Device Types / Memory Balloon Device / Device Operation / Free Page Reporting}
 \item \ref{devicenormative:Device Types / Memory Balloon Device / Device Operation / Device Initialized Reported Pages}
+\item \ref{devicenormative:Device Types / Memory Balloon Device / Device Operation / Device Initialized Deflated Pages}
 \end{itemize}
diff --git a/device-types/balloon/driver-conformance.tex b/device-types/balloon/driver-conformance.tex
index 6e5ccf0..c35f6fa 100644
--- a/device-types/balloon/driver-conformance.tex
+++ b/device-types/balloon/driver-conformance.tex
@@ -10,4 +10,5 @@
 \item \ref{drivernormative:Device Types / Memory Balloon Device / Device Operation / Page Poison}
 \item \ref{drivernormative:Device Types / Memory Balloon Device / Device Operation / Free Page Reporting}
 \item \ref{drivernormative:Device Types / Memory Balloon Device / Device Operation / Device Initialized Reported Pages}
+\item \ref{drivernormative:Device Types / Memory Balloon Device / Device Operation / Device Initialized Deflated Pages}
 \end{itemize}
-- 
MST

