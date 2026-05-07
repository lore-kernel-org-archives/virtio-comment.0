Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5FC029C33F
	for <virtio-comment@lists.linux.dev>; Thu,  7 May 2026 07:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778140325; cv=none; b=XfCbUovG/ERCH7y+CAXPCbd5u0rt8pJJGWDR7nG6lmQac9SAp4sgKxFLWtmjrLmPKp1mC3NJ5niRW7nYSqimrbv/oHvA6zMCPRG4I9VQakZC5m7IYem5Z4eJ7cd8VtwMtG49ULunOocCAMGW1gVJzqftwzHUhu2hhwRxern0Nwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778140325; c=relaxed/simple;
	bh=g2MVWpKBPbYXAdOqyG87NMIMIsTRWznGDM11hEQyyn0=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=Hc8t9yLN/+1qfXMNUOCXocKutaIhHfk8KHXiNaz56LZKq+9F0ylHFVapnkumSiTk87wgPK3Hnq4r7NqhPqhQ9REnxfkCcz1piYXXMXVdV82BA3lHaZGm/Z+B9FCSSv66YnP6QmsUoGQj1Gqgb19GOXhDFBVsfXzivpKFOMREPwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=S3Sxz8va; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="S3Sxz8va"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778140322;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uaYDCo7dDoZdqYKCM07jdIDzrBoDFAOC15Wma8/qflQ=;
	b=S3Sxz8vaex8171jT+/zXBhemc8Yh/SUn0Z4n+2+mjuPBsS3WSYAX1F/V/BIPWlwhV9MOCp
	d6M7lffhEzwJjVCHWBAx6o0RtV3G92mTZtl55pvtSMS6Vx6HyZgUC3OZLXWcTWj5291/7S
	6Dc1fJ8myJpRKXthZoBR1paYHeSE+w4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-518-cBOl8vt8MQydU_e2fux9AA-1; Thu, 07 May 2026 03:52:00 -0400
X-MC-Unique: cBOl8vt8MQydU_e2fux9AA-1
X-Mimecast-MFC-AGG-ID: cBOl8vt8MQydU_e2fux9AA_1778140320
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-44f56d5523eso422756f8f.1
        for <virtio-comment@lists.linux.dev>; Thu, 07 May 2026 00:52:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778140319; x=1778745119;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uaYDCo7dDoZdqYKCM07jdIDzrBoDFAOC15Wma8/qflQ=;
        b=Ak7MC6Bmes2QSb0XoP150HNViaF5RqAr5IE0lHsnXHC2M08VvAE0wB2nrgk5fni6b+
         0hL2RSrE9ctgIegN8omcAqWvvVqauwqfvR37Y18509gXqNmaC668Gd8vLY8JKGvEwX/g
         IoxP72m+eueoXD9zlz/rwgsyDM918WUpkxRTLVR2Gl9iKmapJFweF7rHUZ+3ZexAfUSG
         ytgfL/XBFF3ZrUnWv9272mPJ69j6lVluZauNUdlRHMQ/1nKR066eIHlmVyVT4kntb0nK
         xPFu00ltmbiM4ol7ksw3eO4wCFhZKRPHrpHFAwE46m4PykdC3h3G/nymnwEhb0/HjssP
         GCiw==
X-Gm-Message-State: AOJu0Ywq0DoXlFFgLfWoVe//z/L746WY2bbIu+yEBBAAUX0n+d+LccQU
	tvITF/umLi7y1230Lhhif9flN5PMEQCREUpU3qR3DFyWQ+vGfW7SC3m07JyfRbssMdutkjGpk6m
	C1BEIB+yTF+n2FvVGkBKeN5ojIaPFRGY0RBfL3xddKCbepwu/6wgsm9SXQkU55aoy+Ri1WZoB9f
	eeR8RZgRR+xNWCF4YKIsuo0c2T85KIePUpg0QP0m4piSx1Bw==
X-Gm-Gg: AeBDievNYtPUMOEOp5TfDy4LPQn+HAg39/R7tdmWXj11eRHYYxW/EkPqq22aqO1w2Jm
	hD6FOBxvmc19FhqbAC+ofHVXWunOEpudANlpM6XycJetLCiTLvP14EsvlN/aXPWxWjo7LNJvIky
	UTSJnGd4sVF9qOFGhh332INdPhhVociTOUTgIrr/DmN5VjmEzLQA6ToMnIaKp9lv+Tw0Slf1dOZ
	WiP7VS2Uf6x1AcL5+oWcYt4D85U12EMgx4/9U7+gm2w1w7sK6J7s4Z1USiPNkg98YTsSmZqZL5p
	HyiHb57OJxkjCtpxFFkoYmimn8VJHQsMIpNNbQScQrtA/rQzslEvxUiLzUB1C3cYmnyx8DB8a8z
	iRO58fCwxkzCpNLpkesS7qWihLBzz8+CK5eCiGXncjpMcwcPrgmc=
X-Received: by 2002:a05:6000:2507:b0:44e:639b:7d0f with SMTP id ffacd0b85a97d-4515b61bcddmr11219602f8f.12.1778140319032;
        Thu, 07 May 2026 00:51:59 -0700 (PDT)
X-Received: by 2002:a05:6000:2507:b0:44e:639b:7d0f with SMTP id ffacd0b85a97d-4515b61bcddmr11219521f8f.12.1778140318116;
        Thu, 07 May 2026 00:51:58 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-48-7.inter.net.il. [80.230.48.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45054b02802sm18499891f8f.17.2026.05.07.00.51.57
        for <virtio-comment@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 00:51:57 -0700 (PDT)
Date: Thu, 7 May 2026 03:51:56 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: virtio-comment@lists.linux.dev
Subject: [PATCH v4 3/3] balloon: add VIRTIO_BALLOON_F_DEVICE_INIT_ON_INFLATE
Message-ID: <b29dee815f250b3332651a1a5aeabc4e49ec6914.1778140241.git.mst@redhat.com>
References: <cover.1778140241.git.mst@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <cover.1778140241.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: S2zP27cPoFGhw_usnQMTHND5devaKpRD7biwhzPuzpg_1778140320
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
 device-types/balloon/description.tex | 73 +++++++++++++++++++++++++++-
 1 file changed, 71 insertions(+), 2 deletions(-)

diff --git a/device-types/balloon/description.tex b/device-types/balloon/description.tex
index fa33105..7afdb24 100644
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
@@ -249,6 +252,10 @@ \subsection{Device Operation}\label{sec:Device Types / Memory Balloon Device / D
 and before detecting its physical number in a deflate request
 and acknowledging the deflate request.
 
+If VIRTIO_BALLOON_F_DEVICE_INIT_ON_INFLATE is negotiated, the
+device MUST NOT modify a page after reporting it as initialized
+in the bitmap.
+
 \paragraph{Legacy Interface: Device Operation}\label{sec:Device
 Types / Memory Balloon Device / Device Operation / Legacy
 Interface: Device Operation}
@@ -672,6 +679,67 @@ \subsubsection{Device Initialized Reported Pages}\label{sec:Device Types / Memor
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
+The device MUST provide an inflateq supporting at least 2 buffers.
+
+The device MUST set bit N in the bitmap to 1 if it successfully
+initialized PFN N, or to 0 otherwise. Bits not covered by the
+used length are treated as 0 by the driver.
+
+The device MAY write fewer or more bytes than $\lceil N/8 \rceil$.
+Any bits written beyond those corresponding to PFNs in the request
+MUST be set to 0.
+
+If VIRTIO_BALLOON_F_PAGE_POISON is also negotiated, the device
+MUST fill each successfully initialized page with \field{poison_val}.
+
+If VIRTIO_BALLOON_F_PAGE_POISON is not negotiated, the device
+MUST fill each successfully initialized page with zeros.
+
 \subsection{Security Considerations}\label{sec:Device Types / Memory Balloon Device / Security Considerations}
 
 In environments where the device is not trusted, such as
@@ -697,14 +765,15 @@ \subsubsection{Data Integrity}\label{sec:Device Types / Memory Balloon Device /
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

