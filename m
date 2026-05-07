Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0608229C33F
	for <virtio-comment@lists.linux.dev>; Thu,  7 May 2026 07:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778140322; cv=none; b=S8X9HvjAqghAFaRVwtMkuwI1sxZq6RPCiAPDithfGnJjrGWCB0JU/VUEHJ9zpvMN2UtFXQW4+yRKyqWxCuvu1CY5dYKvnJDKvh9WgvHmtPyXPlHkMkYowQX7NcGjDL0TH4JM18IyOGIjc+r5YKREPgqt7ou1+I9zlbUffxffzUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778140322; c=relaxed/simple;
	bh=4efl8DNHZch4/ys1bn7dy0cXoHdU7grCS13iHZvfrBg=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=ZV7yvtmg0rXhjZRlfS1n576Gsq2MFuHj0R3zxkqAtdF7mwO4IUg039nGCapcMIRdWhWqleT65fr11ji1fYS2lKR4aXWI42d0cBGjuEKu+dWfDUYEOS35pZZ22yCwJL8EeIZQMnlr6CeDOjamF/8rMNgkXTYCRavbfBjqufquqGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cmhjo40l; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cmhjo40l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778140320;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LjcASV5lYdmOVg/ONky39662Qm46/Po2ETUPJa7AKI8=;
	b=cmhjo40lLhHW1dP97+Ty32esKRQvJRJycQ3oQBTdK1hAKGCM31lXkrBPe5F1ON8K020Ys8
	mOD15Ss7xU9EimYh6+0TQLT1/m+KB+0r9Cur8PPQFUfqqSEZONejxuYQNfgn+Tn+cUwrUl
	NHjFvrhevwc0kGxMDlpQ4GMc0GZj/7I=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-477-mNMlXTR8NXuRHlNdN5YY0g-1; Thu, 07 May 2026 03:51:58 -0400
X-MC-Unique: mNMlXTR8NXuRHlNdN5YY0g-1
X-Mimecast-MFC-AGG-ID: mNMlXTR8NXuRHlNdN5YY0g_1778140318
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-486fa07f2bbso2976085e9.2
        for <virtio-comment@lists.linux.dev>; Thu, 07 May 2026 00:51:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778140317; x=1778745117;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LjcASV5lYdmOVg/ONky39662Qm46/Po2ETUPJa7AKI8=;
        b=Rg51fG83RIXkC97hoNXAv718sVXHOBDwIluaU/aaVnIwiupZOlnQGiTba4ujDfopSI
         r48wezktqhr+3aCQ+IPDaWMczwKYV3ASxW6HTGRgt3odJRuwgTVj8b549IgvgdWrZt+4
         yBPXf0SKISgZRJhFY3JpL561+lvjPdghbDmENnXuMmpXpOOVO46tgSyjuUbMGhEBO6RV
         QoU3rsDpvw2qcl1fTqe43eyRKxkOJj+5OCiAFr7MFrlKjPqGK7OkrC8GQb+ooARzOmM0
         ZSlL8qS1f3VDcCPlu98y7DS4eSmpM/pV62Qk4W33rC96SMyTY8qBorOS76F/Kh9rpoIp
         LWbg==
X-Gm-Message-State: AOJu0YwnsQfROWEAtaV8CgeKyPLW17dXNgXkgFro/0csIysExPNpyaiq
	TKXTSn10/0M6o5N2YUPgb1hWpEwZ3c7TcbNvLLXv1/Iu4xbX6qr3YBq6xqM/fWD2J5gUEcRIjiR
	UeOzgMfQ3XEr2dkMpz3gcKkxddE3D/gB/SbdmzAHYJb1e6y4s0LZ6IBfUJras9KeEkZU8d7aDvX
	DdHnIrGPjf74a8fsX2yWFNgJhH2X/EFpBNqcIo5rH8JX76ug==
X-Gm-Gg: AeBDievKHGFW584Uzou7BxAJSPhYuo/AFfo9i7cFS8Tu7VToh830aOHpJ9PUbUa53yk
	38NquwJrTP9mRmmakm7vPezpJflj+VE5suS9H8eRxOJ7xdwZOA3lgiNRqPqSGRSleuO9BUQ6BT6
	4yFJG+QzI9GWGxv2c7IpfXxLpfw+sMlCpvl7u92eUzFy9pWNdgWHt//h+tqt/Fug8itM/rBYVje
	Aydvfv7mVAwUiLP/kmv2g7kLWvztzrbY4u5G2O3vDSH0wJZM6XxyZUyZRAQLnbzYgG9DCRdgy1T
	M5E7gIL4B72zeEUk3xS7q54M/cNka2fo7q7MWLzYyDvSktmANg3pqwNaD7dBBHbkL1V/yfdo3RS
	fxRvpCaGiSwQNZh9Wc4Up9TWVxcUsUCDaFFD+DPkCZgCxO5pRbajvyQlLVPqzqA==
X-Received: by 2002:a05:600c:a0d:b0:488:a824:fe04 with SMTP id 5b1f17b1804b1-48e51f457dfmr112908165e9.26.1778140317086;
        Thu, 07 May 2026 00:51:57 -0700 (PDT)
X-Received: by 2002:a05:600c:a0d:b0:488:a824:fe04 with SMTP id 5b1f17b1804b1-48e51f457dfmr112907285e9.26.1778140316228;
        Thu, 07 May 2026 00:51:56 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-48-7.inter.net.il. [80.230.48.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e5382a327sm189733315e9.0.2026.05.07.00.51.55
        for <virtio-comment@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 00:51:55 -0700 (PDT)
Date: Thu, 7 May 2026 03:51:54 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: virtio-comment@lists.linux.dev
Subject: [PATCH v4 2/3] balloon: add VIRTIO_BALLOON_F_DEVICE_INIT_REPORTED
Message-ID: <80ac17abeb1f1ee51352a179f94eb3fea7731809.1778140241.git.mst@redhat.com>
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
X-Mimecast-MFC-PROC-ID: 5XFhna4ct6UixFISTW7aJZ8DUOfMTkX-2s5kEffu5Kg_1778140318
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Add VIRTIO_BALLOON_F_DEVICE_INIT_REPORTED (bit 6): the device
initializes reported pages by writing into each byte of the page.

Add Feature bit requirements subsection.
Add Data Integrity security text for DEVICE_INIT_REPORTED.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/244
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 device-types/balloon/description.tex | 60 ++++++++++++++++++++++++++--
 1 file changed, 57 insertions(+), 3 deletions(-)

diff --git a/device-types/balloon/description.tex b/device-types/balloon/description.tex
index a2e4a37..fa33105 100644
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
@@ -603,7 +616,8 @@ \subsubsection{Free Page Reporting}\label{sec:Device Types / Memory Balloon Devi
 Normative statements in this section apply if the
 VIRTIO_BALLOON_F_PAGE_REPORTING feature has been negotiated.
 
-If the VIRTIO_BALLOON_F_PAGE_POISON feature has not been negotiated, then
+If neither the VIRTIO_BALLOON_F_PAGE_POISON nor
+VIRTIO_BALLOON_F_DEVICE_INIT_REPORTED feature has been negotiated, then
 the driver MUST treat all reported pages as uninitialized memory.
 
 If the VIRTIO_BALLOON_F_PAGE_POISON feature has been negotiated, the
@@ -625,7 +639,8 @@ \subsubsection{Free Page Reporting}\label{sec:Device Types / Memory Balloon Devi
 Normative statements in this section apply if the
 VIRTIO_BALLOON_F_PAGE_REPORTING feature has been negotiated.
 
-If the VIRTIO_BALLOON_F_PAGE_POISON feature has not been negotiated, the
+If neither the VIRTIO_BALLOON_F_PAGE_POISON nor
+VIRTIO_BALLOON_F_DEVICE_INIT_REPORTED feature has been negotiated, the
 device MAY modify the contents of any page supplied in a report request
 before acknowledging that request by using the reporting_vq descriptor.
 
@@ -633,6 +648,30 @@ \subsubsection{Free Page Reporting}\label{sec:Device Types / Memory Balloon Devi
 MUST NOT modify the the content of a reported page to a value other than
 \field{poison_val}.
 
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
 \subsection{Security Considerations}\label{sec:Device Types / Memory Balloon Device / Security Considerations}
 
 In environments where the device is not trusted, such as
@@ -653,6 +692,21 @@ \subsubsection{Information Leakage}\label{sec:Device Types / Memory Balloon Devi
 reporting, may make page contents accessible to the device. Memory
 statistics reporting exposes guest memory usage patterns.
 
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
 \subsubsection{Denial of Service}\label{sec:Device Types / Memory Balloon Device / Security Considerations / Denial of Service}
 
 A malicious device could set \field{num_pages} to an
-- 
MST

