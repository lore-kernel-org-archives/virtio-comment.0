Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A753B48AE1C
	for <virtio-comment@lists.linux.dev>; Tue,  5 May 2026 16:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777997294; cv=none; b=nH3Zftcv41wVkFdMwYtgTNey2SaWBlnj948LAqDCx6HUUAVO231magfKfIhZd+0kv2cGnc/sznHZs8Q4j1WRbcY3Pj9lNcEWCd4+f6mm5s3q3BUFOQybxzqN22vxbxDm5p6yqAXeBujHcAqHjp+YlDFNEZ2TGbKSsy1S5CNydOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777997294; c=relaxed/simple;
	bh=TYdiRJfvlD7W0/ZUxqQCUAlPug71TWQyXOUZSyXhIGY=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=PuOZL/drsQMaEf1Z3dPdRasq7eXVVgDHIVdj3Cc7qFBcbeIZ+Za6+M1ZXlgfGVzzK2QW+z1o2+yeFSMduwPHJitUtCAbS/2SX1cMkdZSHDAn9HuuKeKQhGSmI+LTOSKSmJVf6sdiLCbBglGeBbi/+lfW4qZJ+uhfQM3MwBaMbkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=atzzxnms; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="atzzxnms"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777997291;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0niY2GDpeYWv1k+onn4dhzZNCF1iLkPsIa2o0vNrCFI=;
	b=atzzxnmsFElJYUMpxdlmyUwsE17fptoDThD/uMBAzn5R7DVqYmAPTaGzIf/qVX0wWtMUfT
	lrtmYNX8BW6cekMahP+qHp2IJbUpB/uaCnGEfiQzic0/glK2FViRf0XrZ1RZ7dpQPIgl3V
	kjMbPLUHrhwJflyBraXaeTexXXcr0lU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-563-bhRXBveWM9iCgizrpXeYdQ-1; Tue, 05 May 2026 12:08:09 -0400
X-MC-Unique: bhRXBveWM9iCgizrpXeYdQ-1
X-Mimecast-MFC-AGG-ID: bhRXBveWM9iCgizrpXeYdQ_1777997288
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-488bd1ee9e7so55690085e9.1
        for <virtio-comment@lists.linux.dev>; Tue, 05 May 2026 09:08:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777997288; x=1778602088;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0niY2GDpeYWv1k+onn4dhzZNCF1iLkPsIa2o0vNrCFI=;
        b=QAGCSAd6nfYdHxnZT/fdsLvO2X9Jat1Q03MbJTpPmjfiS1E02uzzOnHFB3tF+mMKTe
         TJG7Bqw0jXA8XMr5wdrCq4KYbsbdvfqdAL7Y3JG6+9Z6Iu+0FMDaUjrJsaetZOAKBcmr
         Jw6TlGPzaqgZ5TOhvrj0XFof3eg38pYPuQQVKWtoVAcQe4Dbq8eUbSU713Uc+9Q6GSLX
         XsepRJl3/7C9Z4fkMnxW5rSthEg4kaMnwImyL8CEtSEH5c3VKsw7hmammbTMd6izrhn+
         icbc6NsfXoAOtqdYC8bgaHo0FICSxQ6BBL6qKfG7Dl3nZdMsVzApPed1tSLyD1hoEmE/
         VHiw==
X-Gm-Message-State: AOJu0Yx02Zofh8FHvKLuLk3mnKcHlYmhRze56BicdQaOzIT7eYC8Kj2/
	TJCWfnMI39iaeRVlv+1zILGdhGugdZ/2/rXDPs8SCz1zHVWk3DOFsrbGdSIfWes88SAgAd55rEl
	9QthiwlgteS4/uJuNdFfw8lv59DJ7Bf+89VmV96RY70RNh3EfsX230qW/ledzQdcnFi7F+WNMS5
	FlF1I2LSw7/T+T2WpD1dgQDKjKk0lsW/gE9BPxOlOgDTsq3A==
X-Gm-Gg: AeBDiet0SvO8/4htECR+HgNjzNCiHv7xrO3MoflN2eBhKKMziK6ORG0hiXFMT3Bc1BC
	u8NvdpIhRMpJ/WWPjqPRsHSaBJFCdw/dkkt3G4r0m95B+h1PC1P0JqFescn4KHWfdUCqD1GHZrP
	75MdvkBi4P63EUuRp3pjM33nJ36O7tIRkUFUmbI1HajHfPVeDd+ipkG0ht4Dr4j0CUScwK2DjLh
	TrN4WfjIy+MH5vsPPx5ictV9bc9MQdBXu4zMi3XlnlSbFcKKbvjoTJ05LcFGrrIfCCw6V0ROCNT
	snxv7/iYoLt9xB/WVZ7TQ7NInthlOiJNT3F7roBI4/5YCdabIvklEf+C4IZLgpFQD1DPkMeGcV9
	UrYXO2MNI6B0VawSsDD3hEe2c504F3jB0qiS6+I9ERIS8ULjqZzels3HQ
X-Received: by 2002:a05:600c:a30a:b0:48a:9428:5522 with SMTP id 5b1f17b1804b1-48a9865ea82mr171897545e9.16.1777997287836;
        Tue, 05 May 2026 09:08:07 -0700 (PDT)
X-Received: by 2002:a05:600c:a30a:b0:48a:9428:5522 with SMTP id 5b1f17b1804b1-48a9865ea82mr171896715e9.16.1777997287136;
        Tue, 05 May 2026 09:08:07 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-47-179.inter.net.il. [80.230.47.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48d149e8a82sm22144095e9.3.2026.05.05.09.08.06
        for <virtio-comment@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 09:08:06 -0700 (PDT)
Date: Tue, 5 May 2026 12:08:05 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: virtio-comment@lists.linux.dev
Subject: [PATCH v3 2/2] balloon: add VIRTIO_BALLOON_F_DEVICE_INIT_ON_INFLATE
Message-ID: <1c3f0dc8a667b1051f08cf6f7245848b6a82841f.1777995753.git.mst@redhat.com>
References: <cover.1777995753.git.mst@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <cover.1777995753.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: f_dk_BGirRb9JSgcIs8QIRnpZi-17wzNpL9nEQargBs_1777997288
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Add VIRTIO_BALLOON_F_DEVICE_INIT_ON_INFLATE (bit 7): the device
initializes inflated pages and returns a per-page bitmap indicating
which pages were successfully initialized.

Update Security Considerations Data Integrity subsection to cover
both DEVICE_INIT_REPORTED and DEVICE_INIT_ON_INFLATE.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/242
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 device-types/balloon/description.tex | 66 +++++++++++++++++++++++++++-
 1 file changed, 64 insertions(+), 2 deletions(-)

diff --git a/device-types/balloon/description.tex b/device-types/balloon/description.tex
index ce08a4a..bce3b9e 100644
--- a/device-types/balloon/description.tex
+++ b/device-types/balloon/description.tex
@@ -52,6 +52,9 @@ \subsection{Feature bits}\label{sec:Device Types / Memory Balloon Device / Featu
 \item[ VIRTIO_BALLOON_F_DEVICE_INIT_REPORTED(6) ] The device initializes
     reported pages.
 
+\item[ VIRTIO_BALLOON_F_DEVICE_INIT_ON_INFLATE(7) ] The device initializes
+    inflated pages.
+
 \end{description}
 
 \subsubsection{Feature bit requirements}\label{sec:Device Types / Memory Balloon Device / Feature bits / Feature bit requirements}
@@ -671,6 +674,64 @@ \subsubsection{Device Initialized Reported Pages}\label{sec:Device Types / Memor
 If VIRTIO_BALLOON_F_PAGE_POISON is not negotiated, the device
 MUST fill each initialized page with zeros.
 
+\subsubsection{Device Initialized Pages on Inflate}\label{sec:Device Types / Memory Balloon Device / Device Operation / Device Initialized Pages on Inflate}
+
+When VIRTIO_BALLOON_F_DEVICE_INIT_ON_INFLATE is negotiated, the
+device initializes inflated pages and reports which pages were
+successfully initialized via a per-page bitmap.
+
+The driver appends a device-writable bitmap buffer to each inflate
+descriptor chain, after the PFN outbuf. The bitmap contains one
+bit per balloon page (4KB), where bit N corresponds to the Nth PFN
+in the inflate request (0-indexed). Bit N is stored as bit (N mod 8)
+of byte (N / 8), with bit 0 being the least significant bit.
+The device sets a bit to 1 if it successfully initialized the
+corresponding page, or 0 if it did not.
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
+corresponding inflate bitmap bit was set to 1. This overrides
+the VIRTIO_BALLOON_F_PAGE_POISON requirement to initialize
+deflated pages with \field{poison_val} for such pages.
+
+\devicenormative{\paragraph}{Device Initialized Pages on Inflate}{Device Types / Memory Balloon Device / Device Operation / Device Initialized Pages on Inflate}
+
+Normative statements in this section apply if the
+VIRTIO_BALLOON_F_DEVICE_INIT_ON_INFLATE feature has been negotiated.
+
+The device MUST set bit N in the bitmap to 1 if it successfully
+initialized PFN N, or to 0 otherwise.
+
+The device MUST set all padding bits in the last byte of the bitmap
+to 0. The device MAY write more bytes than $\lceil N/8 \rceil$ but
+MUST set all extra bits to 0.
+
+If VIRTIO_BALLOON_F_PAGE_POISON is also negotiated, the device
+MUST fill each successfully initialized page with \field{poison_val}.
+
+If VIRTIO_BALLOON_F_PAGE_POISON is not negotiated, the device
+MUST fill each successfully initialized page with zeros.
+
 \subsection{Security Considerations}\label{sec:Device Types / Memory Balloon Device / Security Considerations}
 
 In environments where the device is not trusted, such as
@@ -696,14 +757,15 @@ \subsubsection{Data Integrity}\label{sec:Device Types / Memory Balloon Device /
 When the device is untrusted, the driver cannot rely on the device
 to correctly initialize pages. An untrusted device can report a
 non-zero used length for VIRTIO_BALLOON_F_DEVICE_INIT_REPORTED
+or set bits in the VIRTIO_BALLOON_F_DEVICE_INIT_ON_INFLATE bitmap
 without actually initializing the corresponding pages. If the
 driver treats such pages as initialized (e.g., marking them as
 zeroed), this could lead to information leakage between guest
 processes or other security violations.
 
 Drivers operating in environments with untrusted devices are
-expected to avoid negotiating
-VIRTIO_BALLOON_F_DEVICE_INIT_REPORTED, and to initialize
+expected to avoid negotiating VIRTIO_BALLOON_F_DEVICE_INIT_REPORTED
+or VIRTIO_BALLOON_F_DEVICE_INIT_ON_INFLATE, and to initialize
 all pages themselves.
 
 \subsubsection{Denial of Service}\label{sec:Device Types / Memory Balloon Device / Security Considerations / Denial of Service}
-- 
MST

