Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19C3481FC8
	for <virtio-comment@lists.linux.dev>; Tue,  5 May 2026 16:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777997291; cv=none; b=GOY6jv51wmsEzG8hUtiAV1R15daPEOzW7B01ClZgJMwRzgjpU19m70CtyhKKzlyvVMGfmoQYowZLSGwwtqynSMfMdhwtSuIG5bshIaqvxyLmpkjvlFvyIqKCpJxY2U8MPwgR2wHb1y2Z3h23SWVW2V/ftRDFQP2XNYEPU7db1JI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777997291; c=relaxed/simple;
	bh=cPEKfSZNk+JJRkNpkSfWvitk/VLAzMA4tHfzedqYsR4=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=iyUDyECDPCvABVqh0sH5c7VGdEifblDZzZdv9nfPOYszPN9FBWYzlUoYPW5xWSvsOuHa2zQvsm3Neux89ULs4i8eTcdhKRSrR0YKxfH4Wrz+sNAy3PnTFzAoGXGP25SIhCRXfos5fGd01tGUVs6ZAgt/g8/vXyYMKQ2jfL/ObL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Av1H4z1F; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Av1H4z1F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777997289;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=U9PNi4BZoGEvFi+ZKWgRl9MJYp2tDSu44dJ+4A5eZ5U=;
	b=Av1H4z1FeChEmJBk14cIGjJisaNGFog/UWK2K3VCArlRYpPluzwyyF8LmhOTHhm9MDqz29
	paIb9x8NbTw1x/ioUNsXR7sYMPCjf5rEae+In8NPC+3kZLqg4pVgRKliUcGy9qPhYGvLF5
	iHpIZHPnm/hXKs6Tn4+gygbZ4tN2+UI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-547-AU6jI4PNOJGdW-MnxX55Gg-1; Tue, 05 May 2026 12:08:07 -0400
X-MC-Unique: AU6jI4PNOJGdW-MnxX55Gg-1
X-Mimecast-MFC-AGG-ID: AU6jI4PNOJGdW-MnxX55Gg_1777997286
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-488e097a270so32214495e9.1
        for <virtio-comment@lists.linux.dev>; Tue, 05 May 2026 09:08:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777997286; x=1778602086;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=U9PNi4BZoGEvFi+ZKWgRl9MJYp2tDSu44dJ+4A5eZ5U=;
        b=qdZIDnCHFVpZYw5eZpNU4O00WqrsR/ZxD7QhdE2aBUAX7qWvCYOfSql3cOQv7eSJsi
         7+vFOxdjCxKVkVUfZaqbOW5xcjdp9QjSKjQPm8bLsofNrxlBgSkIUlv5m/IhnPS38GZd
         w/UbH76qKhwnmCc1HnL/LTcKGc2XMRqlmgHRrETttKUrLgjoTkBIvPtQWDTQXIDZELft
         0847QRcbwYKrtQyl2VMd4lCyj+hjVoB1tNGYq0XMFOyxVKj+bfRiPN29QH/jz72y476L
         /I6x9MdsLH/YvroglSnyoC4JMi0j2GMC5zyvs5IbcEv4+062SBKj3JzAP1yAWWOi5FJc
         4BNQ==
X-Gm-Message-State: AOJu0YzBWXD2VssFYkmd/hY4NJOQK5RiPYK+9GJEWVEmci6TWILvTTEF
	exxgdjQ/ZK3hwnFAfnUUicuRdYRJ1K+xmYctPzQegdoSWE8xv8lJPQ4kJWA48jRfPOUNO8yPT3w
	lPKg+SCiWP+VEhfM4ShJLsenoVflmvjq02g/G02Mx3GvULApp3nF4udtBzg8CA1K1RbGFWcRXI3
	POD0x3OQ3rCWViZoFR2RrW+MV/ZzyeoX1h/DlTjVY9OFzKlA==
X-Gm-Gg: AeBDievF+psK3JJv4Q0So2m4HxPH7srgZIQYa9HA1/JMkP68wEnOrS28pKAqMyFAUuG
	EDcpb9RGQw9v0LRMY9AiJ5/TjXOF2lAQUi24jEdHggaeVyZwb5d0lyHCaJV9xbx6aeBrWyuG3Sj
	ZgYqc1SQysqXecs8+bc/hUf1F3eYJCttWfqNTDG9padXpjuS4X1qmy4DWiBAOtQYKKmf/Lvn1+9
	xYk6KdvAPwRrok+MFQR4lmq3TEHMgwRn3IdWozkmTZUsTZJTLfZfwDD+PaYLIWJ8AW0nl+ScxEu
	uVy/gZlO4kuYkbY+Ea/wCdnnfOzznSjIFVaFu2+dRDoZf1lz/uFFDaCXs/RKv6uopUQDY1WydcW
	UYVlJnnpIe7p0PFMPU8BmL6+B24QFiVr6bWI2j6EbIxyUoZm/7+pfo98a
X-Received: by 2002:a05:600c:45cc:b0:48a:5970:1fe1 with SMTP id 5b1f17b1804b1-48e51a6278fmr1103895e9.4.1777997285848;
        Tue, 05 May 2026 09:08:05 -0700 (PDT)
X-Received: by 2002:a05:600c:45cc:b0:48a:5970:1fe1 with SMTP id 5b1f17b1804b1-48e51a6278fmr1102695e9.4.1777997285066;
        Tue, 05 May 2026 09:08:05 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-47-179.inter.net.il. [80.230.47.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45055960902sm6145077f8f.28.2026.05.05.09.08.04
        for <virtio-comment@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 09:08:04 -0700 (PDT)
Date: Tue, 5 May 2026 12:08:03 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: virtio-comment@lists.linux.dev
Subject: [PATCH v3 1/2] balloon: add VIRTIO_BALLOON_F_DEVICE_INIT_REPORTED
Message-ID: <20d9e420296c3c27114d42fdd87cb96c54632ab8.1777995753.git.mst@redhat.com>
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
X-Mimecast-MFC-PROC-ID: c6yqSwgD3yQ3G7A93WZpISNdD07IQIo-xJrtt05kWbU_1777997286
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Add VIRTIO_BALLOON_F_DEVICE_INIT_REPORTED (bit 6): the device
initializes reported pages and signals success via the used length
of each reporting_vq element.

Add Security Considerations section covering information leakage,
data integrity, and denial of service.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/244
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 device-types/balloon/description.tex | 85 +++++++++++++++++++++++++++-
 1 file changed, 83 insertions(+), 2 deletions(-)

diff --git a/device-types/balloon/description.tex b/device-types/balloon/description.tex
index a1d9603..ce08a4a 100644
--- a/device-types/balloon/description.tex
+++ b/device-types/balloon/description.tex
@@ -49,6 +49,18 @@ \subsection{Feature bits}\label{sec:Device Types / Memory Balloon Device / Featu
 \item[ VIRTIO_BALLOON_F_PAGE_REPORTING(5) ] The device has support for free
     page reporting. A virtqueue for reporting free guest memory is present.
 
+\item[ VIRTIO_BALLOON_F_DEVICE_INIT_REPORTED(6) ] The device initializes
+    reported pages.
+
+\end{description}
+
+\subsubsection{Feature bit requirements}\label{sec:Device Types / Memory Balloon Device / Feature bits / Feature bit requirements}
+
+Some balloon feature bits require other balloon feature bits
+(see \ref{drivernormative:Basic Facilities of a Virtio Device / Feature Bits}):
+
+\begin{description}
+\item[VIRTIO_BALLOON_F_DEVICE_INIT_REPORTED] Requires VIRTIO_BALLOON_F_PAGE_REPORTING.
 \end{description}
 
 \drivernormative{\subsubsection}{Feature bits}{Device Types / Memory Balloon Device / Feature bits}
@@ -61,7 +73,8 @@ \subsection{Feature bits}\label{sec:Device Types / Memory Balloon Device / Featu
 
 If the driver is expecting the pages to retain some initialized value,
 it MUST NOT accept VIRTIO_BALLOON_F_PAGE_REPORTING unless it also
-negotiates VIRTIO_BALLOON_F_PAGE_POISON.
+negotiates VIRTIO_BALLOON_F_PAGE_POISON or
+VIRTIO_BALLOON_F_DEVICE_INIT_REPORTED.
 
 \devicenormative{\subsubsection}{Feature bits}{Device Types / Memory Balloon Device / Feature bits}
 If the device offers the VIRTIO_BALLOON_F_MUST_TELL_HOST feature
@@ -625,10 +638,78 @@ \subsubsection{Free Page Reporting}\label{sec:Device Types / Memory Balloon Devi
 Normative statements in this section apply if the
 VIRTIO_BALLOON_F_PAGE_REPORTING feature has been negotiated.
 
-If the VIRTIO_BALLOON_F_PAGE_POISON feature has not been negotiated, the
+If neither the VIRTIO_BALLOON_F_PAGE_POISON nor
+VIRTIO_BALLOON_F_DEVICE_INIT_REPORTED feature has been negotiated, the
 device MAY modify the contents of any page supplied in a report request
 before acknowledging that request by using the reporting_vq descriptor.
 
 If the VIRTIO_BALLOON_F_PAGE_POISON feature has been negotiated, the device
 MUST NOT modify the the content of a reported page to a value other than
 \field{poison_val}.
+
+\subsubsection{Device Initialized Reported Pages}\label{sec:Device Types / Memory Balloon Device / Device Operation / Device Initialized Reported Pages}
+
+When VIRTIO_BALLOON_F_DEVICE_INIT_REPORTED is negotiated, the device
+initializes reported pages by writing into each byte of the page.
+
+\drivernormative{\paragraph}{Device Initialized Reported Pages}{Device Types / Memory Balloon Device / Device Operation / Device Initialized Reported Pages}
+
+Normative statements in this section apply if the
+VIRTIO_BALLOON_F_DEVICE_INIT_REPORTED feature has been negotiated.
+
+The driver MUST NOT treat a reported page as initialized unless
+the used length covers it.
+
+\devicenormative{\paragraph}{Device Initialized Reported Pages}{Device Types / Memory Balloon Device / Device Operation / Device Initialized Reported Pages}
+
+Normative statements in this section apply if the
+VIRTIO_BALLOON_F_DEVICE_INIT_REPORTED feature has been negotiated.
+
+If VIRTIO_BALLOON_F_PAGE_POISON is also negotiated, the device
+MUST fill each initialized page with \field{poison_val}.
+
+If VIRTIO_BALLOON_F_PAGE_POISON is not negotiated, the device
+MUST fill each initialized page with zeros.
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
+to correctly initialize pages. An untrusted device can report a
+non-zero used length for VIRTIO_BALLOON_F_DEVICE_INIT_REPORTED
+without actually initializing the corresponding pages. If the
+driver treats such pages as initialized (e.g., marking them as
+zeroed), this could lead to information leakage between guest
+processes or other security violations.
+
+Drivers operating in environments with untrusted devices are
+expected to avoid negotiating
+VIRTIO_BALLOON_F_DEVICE_INIT_REPORTED, and to initialize
+all pages themselves.
+
+\subsubsection{Denial of Service}\label{sec:Device Types / Memory Balloon Device / Security Considerations / Denial of Service}
+
+A malicious device could set \field{num_pages} to an
+unreasonably large value, causing the driver to surrender most
+of the guest's memory. Drivers should apply reasonable limits
+and not inflate the balloon to the point where the guest
+becomes unable to function.
-- 
MST

