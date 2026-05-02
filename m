Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3F4263C8F
	for <virtio-comment@lists.linux.dev>; Sat,  2 May 2026 14:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777731533; cv=none; b=YevsB4o1rFbl0nCKak8KOxVg8a8LPZu83b5Qaq1/BEG8ZH4auyNkzJfVg818LIRit2T3zpq2f+YP+qx0/lXqOdfD7naKzHo3jpLb/M/r/T4HwxqnwLayfcXR7Ez3YzIDn97/LqvVVPOl+eHvmo/GrCCc+Eqcz8HBIqCKmxgwFcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777731533; c=relaxed/simple;
	bh=hLsgJEuiGT1YuMKtIwb+QVSFhjWWTXPzD7BpcOaiwuA=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JbpuzIS/JxYyd8UmxOTjw2MMSG9wleCrxU8m4qwFZUU3uIzLHz24C9uDZ/5YcuLKSzBE3A2oP4TaBq2lUNZmKRf1+6rFHDkfoqlKJaiHjpWs2/+VMimqeLKGsnFuoizfMQSlpECFZfCDpQMB0htPqHqu9JRHxza9ZHbGFoqxWos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=h6A28TQ/; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="h6A28TQ/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777731530;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=lHJJ0GS9gUVjCkw0nbMZrKZNkL9YU1fPEsD0dvD6Ecg=;
	b=h6A28TQ/xbgYr3D0R1xjipsYquvdEQixG6Wg/tdCHceKM9YozGiSdFq9HBbZj/LQf3wCuF
	AwFRMvLtrH8eHur0gTq8PupyqKqlODEKVKOYwfgLfjUcd0x5rvM6cedoemM7Lrqq4lGhkh
	HrN1Uw9HW58zE8oaExq86lsl0kr9iwc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-93-3ISqmTYXNXCQPpLemiwpQA-1; Sat, 02 May 2026 10:18:49 -0400
X-MC-Unique: 3ISqmTYXNXCQPpLemiwpQA-1
X-Mimecast-MFC-AGG-ID: 3ISqmTYXNXCQPpLemiwpQA_1777731528
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-48a7994e8ddso27942945e9.0
        for <virtio-comment@lists.linux.dev>; Sat, 02 May 2026 07:18:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777731528; x=1778336328;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lHJJ0GS9gUVjCkw0nbMZrKZNkL9YU1fPEsD0dvD6Ecg=;
        b=Bnyk4ie/EsY4JiSS3Abvku+JACOjZBMfm6VsOEhYZ0WeUoL1cfBPoMOtyVYl1l9fYd
         Nt+Morq7mCt/LUtlUW/+8G8hmxVl2nZIAafR1iesknJAl7vnKF8zjSbz7ILrXAPMnoF0
         GOETv814YgpNJ/Osxftbr8Kblgd7bJAF+n7gQeizjp3bg/8Mh8DkHG55cbABC0Zt2voz
         L+N1Bu3B0uiPO93DSkTBmLbQVXufnz2i0eZh8VcquvJAQmgc9I3l+xSHy7A6fBqF+KdM
         hJHB/J0DhIlqzaT+3f5UsYxVjg7nzqF3DuXVitGc/T7ZfwTC0eQjmW1ZSI+VaAI42B9b
         GVoA==
X-Gm-Message-State: AOJu0YwfqYBLKdMUOn/zUBAqoERGjByYO9LUZkWSfHPEXFtA0LTVxCsN
	Vhys9K0ozK1LwooDjnKzrESdQs4uGPtWzzZFehpPhORNSv5J5I4z3pumbZ1bAKdQvdT0wVmXmd7
	5ohdU5As85kVxIEo/2Emw519319g4UNnwYVmLbbUXO1oXsixREo0No259udpLKL+rx+XiuSFKta
	Hfh4CEn0QrzdyAjmKlazla6Jjh/8nJhiGZ4324gfuusb0CxQ==
X-Gm-Gg: AeBDies6F75rh6Yrd6Q+Fdh/1Yie1R4N0yzic1OEEQgyiN7NEZ8EPVwIMFZ+rXcwVCX
	DVUZVDtbZPOjEkpzkhnKcX9aq20f+VsoUXRkzXSAZJ2fqWygwVs5f98VtfDtcyKr9CtEYeD268D
	cyHw0r6ut0Jw5Ic2FC+4B4ub6s4T3VO+JShLI+dRCeCwaJ48WfOwR1Xurnh8MH2PbQAax8Xweao
	ndcWofMEsvwBdN0C7DKBOg/L5u4MJg5KIWsgPAK/CxZBFx7SY6QjQV/3hHbk2qi0zX3GRIU4AmJ
	ftii6iO7uPU8DEcUaoK5zTzjojyhs6oDXw1BYZUKPVtpyN8p/HFL2LcSpp4JU0Hb7KE++LvT8cw
	6BeYGaT/CPV+GbUjKHlkm0Y9Z
X-Received: by 2002:a05:600c:348a:b0:488:c744:49b with SMTP id 5b1f17b1804b1-48a98637f79mr47975775e9.7.1777731527913;
        Sat, 02 May 2026 07:18:47 -0700 (PDT)
X-Received: by 2002:a05:600c:348a:b0:488:c744:49b with SMTP id 5b1f17b1804b1-48a98637f79mr47975425e9.7.1777731527104;
        Sat, 02 May 2026 07:18:47 -0700 (PDT)
Received: from redhat.com ([109.183.97.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a820c865esm185896285e9.5.2026.05.02.07.18.46
        for <virtio-comment@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 07:18:46 -0700 (PDT)
Date: Sat, 2 May 2026 10:18:45 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: virtio-comment@lists.linux.dev
Subject: [PATCH v2] balloon: add VIRTIO_BALLOON_F_DEVICE_INIT_ON_INFLATE and
 Security Considerations
Message-ID: <9c69b992c3dd83dfef3db92cd86b2fd8a0730d48.1777731396.git.mst@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4Z_9-bmS34nS4itD9-7URrrPlSGRLScpqbEplQ4IJkY_1777731528
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Add VIRTIO_BALLOON_F_DEVICE_INIT_ON_INFLATE (bit 6): the device
initializes inflated pages and returns a per-page bitmap indicating
which pages were successfully initialized.

When negotiated, the driver appends a device-writable bitmap buffer
to each inflate descriptor chain. Bit N corresponds to PFN N.
The device sets a bit to 1 if it successfully initialized the page.

Also add Security Considerations section for the balloon device,
covering information leakage and data integrity concerns with
untrusted devices.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/242
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Assisted-by: Claude:claude-opus-4-6
---

Changes from v1:
- reporting does not need a feature bit! we already have all info
- in practice hypervisors zero (unmap) on inflate. change spec to
  match


 content.tex                                 |  28 ++++--
 device-types/balloon/description.tex        | 100 ++++++++++++++++++++
 device-types/balloon/device-conformance.tex |   2 +
 device-types/balloon/driver-conformance.tex |   2 +
 4 files changed, 125 insertions(+), 7 deletions(-)

diff --git a/content.tex b/content.tex
index 5de811f..0f4d662 100644
--- a/content.tex
+++ b/content.tex
@@ -39,7 +39,7 @@ \section{\field{Device Status} Field}\label{sec:Basic Facilities of a Virtio Dev
 \item[DRIVER_OK (4)] Indicates that the driver is set up and ready to
   drive the device.
 
-\item[FEATURES_OK (8)] Indicates that the driver has acknowledged all the
+\item[FEATURES_OK (8)] Indicates that the driver has accepted all the
   features it understands, and feature negotiation is complete.
 
 \item[SUSPEND (16)] When VIRTIO_F_SUSPEND is negotiated, indicates that the
@@ -89,13 +89,16 @@ \section{Feature Bits}\label{sec:Basic Facilities of a Virtio Device / Feature B
 
 Each virtio device offers all the features it understands.  During
 device initialization, the driver reads this and tells the device the
-subset that it accepts.  The only way to renegotiate is to reset
-the device.
+subset that it accepts.  The device validates this subset and
+either completes the negotiation successfully (the last subset of features
+that the driver accepted is considered negotiated then) or fails,
+leaving the feature negotiation incomplete. Once the negotiation is
+complete, the only way to renegotiate is to reset the device.
 
 This allows for forwards and backwards compatibility: if the device is
 enhanced with a new feature bit, older drivers will not write that
 feature bit back to the device.  Similarly, if a driver is enhanced with a feature
-that the device doesn't support, it see the new feature is not offered.
+that the device doesn't support, it will see that the new feature is not offered.
 
 Feature bits are allocated as follows:
 
@@ -189,8 +192,8 @@ \subsection{Legacy Interface: A Note on Feature
 
 Transitional Drivers MUST detect Legacy Devices by detecting that
 the feature bit VIRTIO_F_VERSION_1 is not offered.
-Transitional devices MUST detect Legacy drivers by detecting that
-VIRTIO_F_VERSION_1 has not been acknowledged by the driver.
+Transitional devices MUST detect Legacy drivers, e.g. by detecting that
+VIRTIO_F_VERSION_1 has not been accepted by the driver.
 
 In this case device is used through the legacy interface.
 
@@ -314,6 +317,11 @@ \section{Device Configuration Space}\label{sec:Basic Facilities of a Virtio Devi
 greater than the specified 8-bit size.
 \end{note}
 
+\drivernormative{\subsection}{Device Configuration Space}{Basic Facilities of a Virtio Device / Device Configuration Space}
+Before reading a device-specific configuration field that is
+conditional on a feature bit, the driver SHOULD first accept
+that feature bit.
+
 \devicenormative{\subsection}{Device Configuration Space}{Basic Facilities of a Virtio Device / Device Configuration Space}
 The device MUST allow reading of any device-specific configuration
 field before FEATURES_OK is set by the driver.  This includes fields which are
@@ -530,7 +538,13 @@ \section{Device Initialization}\label{sec:General Initialization And Device Oper
 \item\label{itm:General Initialization And Device Operation /
 Device Initialization / Read feature bits} Read device feature bits, and write the subset of feature bits
    understood by the OS and driver to the device.  During this step the
-   driver MAY read (but MUST NOT write) the device-specific configuration fields to check that it can support the device before accepting it.
+   driver MAY read (but MUST NOT write) the device-specific configuration
+   fields to check that it can support the device before setting FEATURES_OK.
+   The driver SHOULD accept feature bits before reading configuration
+   fields conditional on them.  The driver MAY then accept a different
+   subset of feature bits (e.g., deciding, based on the configuration
+   fields, not to use a certain feature), tell the device about the
+   updated subset, and repeat this process.
 
 \item\label{itm:General Initialization And Device Operation / Device Initialization / Set FEATURES-OK} Set the FEATURES_OK status bit.  The driver MUST NOT accept
    new feature bits after this step.
diff --git a/device-types/balloon/description.tex b/device-types/balloon/description.tex
index e7b957c..7be9bb4 100644
--- a/device-types/balloon/description.tex
+++ b/device-types/balloon/description.tex
@@ -49,6 +49,12 @@ \subsection{Feature bits}\label{sec:Device Types / Memory Balloon Device / Featu
 \item[ VIRTIO_BALLOON_F_PAGE_REPORTING(5) ] The device has support for free
     page reporting. A virtqueue for reporting free guest memory is present.
 
+\item[ VIRTIO_BALLOON_F_DEVICE_INIT_ON_INFLATE(6) ] The device initializes
+    inflated pages and returns a per-page bitmap indicating which pages
+    were successfully initialized. If VIRTIO_BALLOON_F_PAGE_POISON is
+    also negotiated, pages are filled with \field{poison_val}; otherwise,
+    they are filled with zeros.
+
 \end{description}
 
 \drivernormative{\subsubsection}{Feature bits}{Device Types / Memory Balloon Device / Feature bits}
@@ -632,3 +638,97 @@ \subsubsection{Free Page Reporting}\label{sec:Device Types / Memory Balloon Devi
 If the VIRTIO_BALLOON_F_PAGE_POISON feature has been negotiated, the device
 MUST NOT modify the the content of a reported page to a value other than
 \field{poison_val}.
+
+\subsubsection{Device Initialized Pages on Inflate}\label{sec:Device Types / Memory Balloon Device / Device Operation / Device Initialized Pages on Inflate}
+
+When VIRTIO_BALLOON_F_DEVICE_INIT_ON_INFLATE is negotiated, the
+device initializes inflated pages and reports which pages were
+successfully initialized via a per-page bitmap.
+
+The driver appends a device-writable bitmap buffer to each inflate
+descriptor chain, after the PFN outbuf. The bitmap contains one
+bit per balloon page (4KB), where bit N corresponds to the Nth PFN
+in the inflate request. The device sets a bit to 1 if it
+successfully initialized the corresponding page, or 0 if it did
+not.
+
+If VIRTIO_BALLOON_F_PAGE_POISON is also negotiated, the device fills
+pages with \field{poison_val}; otherwise, the device fills pages
+with zeros.
+
+When the driver later deflates these pages, it may skip
+initialization for pages that were marked as initialized in the
+inflate bitmap.
+
+\drivernormative{\paragraph}{Device Initialized Pages on Inflate}{Device Types / Memory Balloon Device / Device Operation / Device Initialized Pages on Inflate}
+
+Normative statements in this section apply if the
+VIRTIO_BALLOON_F_DEVICE_INIT_ON_INFLATE feature has been negotiated.
+
+The driver MUST append a device-writable bitmap buffer to each
+inflate descriptor chain. The bitmap buffer MUST be at least
+$\lceil N/8 \rceil$ bytes, where N is the number of PFNs in the
+inflate request.
+
+The driver MUST NOT treat an inflated page as initialized unless
+the corresponding bit in the bitmap is set to 1.
+
+The driver MAY skip initializing a deflated page if the
+corresponding inflate bitmap bit was set to 1.
+
+\devicenormative{\paragraph}{Device Initialized Pages on Inflate}{Device Types / Memory Balloon Device / Device Operation / Device Initialized Pages on Inflate}
+
+Normative statements in this section apply if the
+VIRTIO_BALLOON_F_DEVICE_INIT_ON_INFLATE feature has been negotiated.
+
+The device MUST set bit N in the bitmap to 1 if it successfully
+initialized PFN N, or to 0 otherwise.
+
+If VIRTIO_BALLOON_F_PAGE_POISON is also negotiated, the device
+MUST fill each successfully initialized page with \field{poison_val}.
+
+If VIRTIO_BALLOON_F_PAGE_POISON is not negotiated, the device
+MUST fill each successfully initialized page with zeros.
+
+\subsection{Security Considerations}\label{sec:Device Types / Memory Balloon Device / Security Considerations}
+
+In environments where the device is not trusted, such as
+confidential computing, the balloon device presents several
+security concerns.
+
+\subsubsection{Information Leakage}\label{sec:Device Types / Memory Balloon Device / Security Considerations / Information Leakage}
+
+When the driver inflates the balloon, the addresses of the pages
+are communicated to the device. On some systems, the page contents
+themselves are also accessible to the device. These pages may
+contain sensitive data from previous use by the guest. In systems
+where the device is untrusted, the driver should sanitize pages
+before inflating them.
+
+Free page hinting and free page reporting similarly expose
+information about which pages are free, and in the case of
+reporting, may make page contents accessible to the device. Memory
+statistics reporting exposes guest memory usage patterns.
+
+\subsubsection{Data Integrity}\label{sec:Device Types / Memory Balloon Device / Security Considerations / Data Integrity}
+
+When the device is untrusted, the driver cannot rely on the device
+to correctly initialize pages. An untrusted device may return
+unsanitized or malicious data on deflation, or may set bits in the
+VIRTIO_BALLOON_F_DEVICE_INIT_ON_INFLATE bitmap without actually
+initializing the corresponding pages. If the driver treats such
+pages as initialized (e.g., marking them as zeroed), this could
+lead to information leakage between guest processes or other
+security violations.
+
+Drivers operating in environments with untrusted devices should
+not negotiate VIRTIO_BALLOON_F_DEVICE_INIT_ON_INFLATE, and should
+initialize all pages themselves.
+
+\subsubsection{Denial of Service}\label{sec:Device Types / Memory Balloon Device / Security Considerations / Denial of Service}
+
+A malicious device could set \field{num_pages} to an
+unreasonably large value, causing the driver to surrender most
+of the guest's memory. Drivers should apply reasonable limits
+and not inflate the balloon to the point where the guest
+becomes unable to function.
diff --git a/device-types/balloon/device-conformance.tex b/device-types/balloon/device-conformance.tex
index ff9ac4f..dfa00c2 100644
--- a/device-types/balloon/device-conformance.tex
+++ b/device-types/balloon/device-conformance.tex
@@ -9,4 +9,6 @@
 \item \ref{devicenormative:Device Types / Memory Balloon Device / Device Operation / Free Page Hinting}
 \item \ref{devicenormative:Device Types / Memory Balloon Device / Device Operation / Page Poison}
 \item \ref{devicenormative:Device Types / Memory Balloon Device / Device Operation / Free Page Reporting}
+\item \ref{devicenormative:Device Types / Memory Balloon Device / Device Operation / Device Initialized Reported Pages}
+\item \ref{devicenormative:Device Types / Memory Balloon Device / Device Operation / Device Initialized Deflated Pages}
 \end{itemize}
diff --git a/device-types/balloon/driver-conformance.tex b/device-types/balloon/driver-conformance.tex
index f898d74..c35f6fa 100644
--- a/device-types/balloon/driver-conformance.tex
+++ b/device-types/balloon/driver-conformance.tex
@@ -9,4 +9,6 @@
 \item \ref{drivernormative:Device Types / Memory Balloon Device / Device Operation / Free Page Hinting}
 \item \ref{drivernormative:Device Types / Memory Balloon Device / Device Operation / Page Poison}
 \item \ref{drivernormative:Device Types / Memory Balloon Device / Device Operation / Free Page Reporting}
+\item \ref{drivernormative:Device Types / Memory Balloon Device / Device Operation / Device Initialized Reported Pages}
+\item \ref{drivernormative:Device Types / Memory Balloon Device / Device Operation / Device Initialized Deflated Pages}
 \end{itemize}
-- 
MST

