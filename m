Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010D634A3AC
	for <virtio-comment@lists.linux.dev>; Wed, 22 Apr 2026 16:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776874336; cv=none; b=mDcaoRXWcUGtOIio+Bb8MZ3qc8xIHHm7QuL3vQe/2/ab4ugE3ORPlWOm6EBOJ6dgBmRY2orRbpqHMW9sub6fhS1A+ztlkKHzCl5G0rNRB+0Xxt+JvXmAnNVy5qFzmDrk3NOCByIsF56dVkFzwaew1lIrl79MArQ/XJwS9igRWQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776874336; c=relaxed/simple;
	bh=Yh2Kqtbt+i5fC7sR6vrTqV3brdl1UdfGkUh0XMP1whI=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=C5CSfjWlZwhsWDqmz8vMs/Yc1hzLLkO4PibDCMgPKruaN3+B8ePzrV3airPcFguaezkErdbIDrMU2Z17WwpyrmQlNO/7S7pQadump+uZCcR1GSPKV0SpUP8ZGkb+WlNX9CHz9FEzxQJAUkqbyTcOfvzPJNS2AIb0sKlad97s1j4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZZup7e6f; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZZup7e6f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776874334;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JPsheg20ejV/IUNd93xJvdHcVzsfNhaqeFMccGdlhWc=;
	b=ZZup7e6fqXPwwCKTjcLo1c0cVoSaSjuik3xpfh8oMQhr2HqxRdiBZ1ZTRjTY2kUjnajt4T
	XR/B6TvD5mXvuZDKPw/e1Gc6N4/45WEntP5r0bY3REtJneu9ydtTPJLhZiEhv3y41WQZvF
	aO+AJisSRKXw8UkuJA0EyCoB0nC7x9o=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-473-0cWmp_PIOkSJW8yIEas4ng-1; Wed, 22 Apr 2026 12:12:12 -0400
X-MC-Unique: 0cWmp_PIOkSJW8yIEas4ng-1
X-Mimecast-MFC-AGG-ID: 0cWmp_PIOkSJW8yIEas4ng_1776874330
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-488c768a9a9so41676875e9.1
        for <virtio-comment@lists.linux.dev>; Wed, 22 Apr 2026 09:12:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776874329; x=1777479129;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JPsheg20ejV/IUNd93xJvdHcVzsfNhaqeFMccGdlhWc=;
        b=Ei5BJ993CZORtFdnXVcpo/tjMmGqBPyV1N5jtdnJTFf9AVV019Al/OjZ8zeRjTBrwJ
         O2R2UHaVWerhAMjEFRtR+wd/G4AiLhMoJWB8sPNhJL9BHq9WLMuG4PJ5QuVTSJggz2Mv
         SnLHReVtMqA3g8CY7gX+5xObIRuEYGXvNuO73E4FjjJgWuuzFG0TqXvTeyC+10Q8a0Zw
         JQILNk5KzonhJ+S+zpMAdsFl3r4MYmFR/S3qzf1W9kbazHLqlVP5/ZqWVqV2EfRQhrOg
         LyeaTogujn+w+uI/N1u0VQzCH+cJo8/QgRt2o2OUX1JJp5OD3D2VPnvL28r7kchsOgFJ
         g+Lw==
X-Gm-Message-State: AOJu0YyIhaGjtk9SQQ8Ls1ijUUvcoq9lV/wJqm8iiW5KOY8Ffi59vkfT
	/1ciQfr7lU6fGXeQvSSoQ/BgIMKve+FU3U23V9yr4LpcM4+GM+NFICImxajxlaJKhgBIzrIpFJB
	sXZAZGkP6lQde57ARMFTE9bTDbaqih1ASMv20dEQ3f0uFCUDSH85BMtnB6IjMawP040uZ6UnarW
	gkvoG0VVLTG4fmvX4bW7WCBa1ApBGfAJxAMjyVhw34KZDzSg==
X-Gm-Gg: AeBDiev+2MbmYzG+g4wpZFy3NsdAMTQn4XWFiqTPAAyLf8Z3oy4Zv/U9eHJdM1AMTcz
	/OnUgJTnYVJ9xEiLLGwtWAGjyx0R4NqVyXwo7mZiDLAFpkncAVCCQPTPPhpGOYI08jpdBeUHX69
	NaXW27wyJpxskzuyKOibMo72bvQZU2O3zzRoSi5dPpZSurc6edeISVu+h0AgEYxbiTs4SDPREL4
	a6JxYja9u7rjBj1WeyoDhY2u9+XJhRsKSWQ9tfCRfTs/x8VZviZpn0p/ObqgFUG5ZnfVFyntt4P
	+t6qIEepVI3HbN34o+LxV1J/bjaAqDzmaJx07lPI4VQ+Wbsu0cCqntWf/J2Xl7LNd/wiJ8WHWzx
	c5HpwvvMQkOid4p0v5iFBzdZ1gE8MK3SrCEIvDhj3oPNC4+Zqe0UXFw==
X-Received: by 2002:a05:600c:a08c:b0:48a:563c:c8c0 with SMTP id 5b1f17b1804b1-48a563cd176mr106098825e9.7.1776874329417;
        Wed, 22 Apr 2026 09:12:09 -0700 (PDT)
X-Received: by 2002:a05:600c:a08c:b0:48a:563c:c8c0 with SMTP id 5b1f17b1804b1-48a563cd176mr106097785e9.7.1776874328732;
        Wed, 22 Apr 2026 09:12:08 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-25-21.inter.net.il. [80.230.25.21])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb77b001sm215051185e9.3.2026.04.22.09.12.07
        for <virtio-comment@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 09:12:08 -0700 (PDT)
Date: Wed, 22 Apr 2026 12:12:06 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: virtio-comment@lists.linux.dev
Subject: [PATCH 1/2] balloon: add VIRTIO_BALLOON_F_DEVICE_INIT_REPORTED
Message-ID: <91eeb22683496a19416a3774f9484ef6e076b9fa.1776874126.git.mst@redhat.com>
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
X-Mimecast-MFC-PROC-ID: EXWzPTbzTb_wZg26IXctN1iEXUzQkygE7O_Mdog1qdA_1776874330
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

When the host processes reported pages it often naturally zeroes
them (e.g. MADV_DONTNEED), but the guest has no way to know this
and redundantly re-initializes them. Add a feature flag so the
device can report which pages it initialized.

The device may not be able to initialize every page (e.g.
unaligned regions). Use a per-entry bitmap so the device can
report non-contiguous partial success.

If PAGE_POISON is negotiated, fill with poison_val; otherwise
fill with zeros.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/242
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 device-types/balloon/description.tex        | 60 +++++++++++++++++++++
 device-types/balloon/device-conformance.tex |  1 +
 device-types/balloon/driver-conformance.tex |  1 +
 3 files changed, 62 insertions(+)

diff --git a/device-types/balloon/description.tex b/device-types/balloon/description.tex
index e7b957c..144983b 100644
--- a/device-types/balloon/description.tex
+++ b/device-types/balloon/description.tex
@@ -49,6 +49,12 @@ \subsection{Feature bits}\label{sec:Device Types / Memory Balloon Device / Featu
 \item[ VIRTIO_BALLOON_F_PAGE_REPORTING(5) ] The device has support for free
     page reporting. A virtqueue for reporting free guest memory is present.
 
+\item[ VIRTIO_BALLOON_F_DEVICE_INIT_REPORTED(6) ] The device initializes
+    reported pages. If VIRTIO_BALLOON_F_PAGE_POISON is also negotiated,
+    reported pages are filled with \field{poison_val}; otherwise, they
+    are filled with zeros. A bitmap indicating which pages were
+    successfully initialized is returned to the driver.
+
 \end{description}
 
 \drivernormative{\subsubsection}{Feature bits}{Device Types / Memory Balloon Device / Feature bits}
@@ -63,6 +69,9 @@ \subsection{Feature bits}\label{sec:Device Types / Memory Balloon Device / Featu
 it MUST NOT accept VIRTIO_BALLOON_F_PAGE_REPORTING unless it also
 negotiates VIRTIO_BALLOON_F_PAGE_POISON.
 
+The driver MUST NOT negotiate VIRTIO_BALLOON_F_DEVICE_INIT_REPORTED
+unless it also negotiates VIRTIO_BALLOON_F_PAGE_REPORTING.
+
 \devicenormative{\subsubsection}{Feature bits}{Device Types / Memory Balloon Device / Feature bits}
 If the device offers the VIRTIO_BALLOON_F_MUST_TELL_HOST feature
 bit, and if the driver did not accept this feature bit, the
@@ -632,3 +641,54 @@ \subsubsection{Free Page Reporting}\label{sec:Device Types / Memory Balloon Devi
 If the VIRTIO_BALLOON_F_PAGE_POISON feature has been negotiated, the device
 MUST NOT modify the the content of a reported page to a value other than
 \field{poison_val}.
+
+\subsubsection{Device Initialized Reported Pages}\label{sec:Device Types / Memory Balloon Device / Device Operation / Device Initialized Reported Pages}
+
+Device Initialized Reported Pages provides a mechanism for the device
+to initialize reported pages on behalf of the driver. When this feature
+is negotiated, the device fills reported pages with the appropriate
+initialization value and returns a bitmap indicating which pages were
+successfully initialized.
+
+If VIRTIO_BALLOON_F_PAGE_POISON is also negotiated, the device fills
+pages with \field{poison_val}; otherwise, the device fills pages
+with zeros.
+
+When VIRTIO_BALLOON_F_DEVICE_INIT_REPORTED is negotiated, the format
+of buffers placed in the reporting_vq is modified: the driver
+prepends a device-writable bitmap buffer before the page buffers.
+The bitmap contains one bit per page buffer, where bit N corresponds
+to the Nth page buffer in the descriptor chain. The device sets a
+bit to 1 if it successfully initialized the corresponding page, or
+0 if it did not.
+
+\drivernormative{\paragraph}{Device Initialized Reported Pages}{Device Types / Memory Balloon Device / Device Operation / Device Initialized Reported Pages}
+
+Normative statements in this section apply if the
+VIRTIO_BALLOON_F_DEVICE_INIT_REPORTED feature has been negotiated.
+
+The driver MUST prepend a device-writable bitmap buffer to each
+reporting_vq descriptor chain, before the page buffers. The bitmap
+buffer MUST be at least $\lceil N/8 \rceil$ bytes, where N is the
+number of page buffers in the descriptor chain.
+
+The driver MUST NOT treat a reported page as initialized unless the
+corresponding bit in the bitmap is set to 1.
+
+If VIRTIO_BALLOON_F_PAGE_POISON is also negotiated, the driver
+need not initialize reported pages with \field{poison_val} before
+reporting them.
+
+\devicenormative{\paragraph}{Device Initialized Reported Pages}{Device Types / Memory Balloon Device / Device Operation / Device Initialized Reported Pages}
+
+Normative statements in this section apply if the
+VIRTIO_BALLOON_F_DEVICE_INIT_REPORTED feature has been negotiated.
+
+The device MUST set bit N in the bitmap to 1 if it successfully
+initialized page buffer N, or to 0 otherwise.
+
+If VIRTIO_BALLOON_F_PAGE_POISON is also negotiated, the device
+MUST fill each successfully initialized page with \field{poison_val}.
+
+If VIRTIO_BALLOON_F_PAGE_POISON is not negotiated, the device
+MUST fill each successfully initialized page with zeros.
diff --git a/device-types/balloon/device-conformance.tex b/device-types/balloon/device-conformance.tex
index ff9ac4f..1d4df8c 100644
--- a/device-types/balloon/device-conformance.tex
+++ b/device-types/balloon/device-conformance.tex
@@ -9,4 +9,5 @@
 \item \ref{devicenormative:Device Types / Memory Balloon Device / Device Operation / Free Page Hinting}
 \item \ref{devicenormative:Device Types / Memory Balloon Device / Device Operation / Page Poison}
 \item \ref{devicenormative:Device Types / Memory Balloon Device / Device Operation / Free Page Reporting}
+\item \ref{devicenormative:Device Types / Memory Balloon Device / Device Operation / Device Initialized Reported Pages}
 \end{itemize}
diff --git a/device-types/balloon/driver-conformance.tex b/device-types/balloon/driver-conformance.tex
index f898d74..6e5ccf0 100644
--- a/device-types/balloon/driver-conformance.tex
+++ b/device-types/balloon/driver-conformance.tex
@@ -9,4 +9,5 @@
 \item \ref{drivernormative:Device Types / Memory Balloon Device / Device Operation / Free Page Hinting}
 \item \ref{drivernormative:Device Types / Memory Balloon Device / Device Operation / Page Poison}
 \item \ref{drivernormative:Device Types / Memory Balloon Device / Device Operation / Free Page Reporting}
+\item \ref{drivernormative:Device Types / Memory Balloon Device / Device Operation / Device Initialized Reported Pages}
 \end{itemize}
-- 
MST

