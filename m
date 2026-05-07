Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A0B29C33F
	for <virtio-comment@lists.linux.dev>; Thu,  7 May 2026 07:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778140320; cv=none; b=hsHF5c4c4+n8TWZgpWfJVeCYD3YpUVHZ/oUVWWrGPmM/Dkqw5TPSDpU3URAwx/e4aleXJpVYoZpBvvycyGRvKwWre6LIAAaPKWMNwdIE3sb1c15WUEzNC8Z0W3bhthc9J7mjack8Y7z1/LdoTwrUHnn2A5umxnxWh2xd1TLz7UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778140320; c=relaxed/simple;
	bh=wB7Lm57CWSBriNjy3jHmqOjii9YUFw4fTAmwftzynoA=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=d+NAWq+TBzwoD2tM9Amb6eP30VcMb8PxFcPVfwND7Lu55L6/aVmLvv8yzqsv4shNsDaXiHeiK00cUQuADW9lgaXxkolhJwGRsIr/U9lidLbglVjHyCQORa2h2conH7zSSUTdzo9xI9CioTAAXK44olkemQaP1jhLy12nje9gllk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DzBiwYZL; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DzBiwYZL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778140317;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BpEumnaM8t7dwHMywONFVO56DNyFeVZlWd5DzD2uuVY=;
	b=DzBiwYZLRiR3deJyagxMz7+RHsoU3bXPbYtAxV/hrq2jq8jq2Pp7mk19tPnIlF9x45ZlTB
	GMp7+qzNisshvZPog3hJ9pSzXBOui964v99GOfV+6rAtmnnxkK1STpvD0N8rW7HSzwjq9a
	06mdcgrjOInQiVSft5y8JQCEM2R3qhk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-365-iZqAZ4ryO1m4Nfiz7Q_f5Q-1; Thu, 07 May 2026 03:51:56 -0400
X-MC-Unique: iZqAZ4ryO1m4Nfiz7Q_f5Q-1
X-Mimecast-MFC-AGG-ID: iZqAZ4ryO1m4Nfiz7Q_f5Q_1778140315
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-44bf1ac8893so444474f8f.0
        for <virtio-comment@lists.linux.dev>; Thu, 07 May 2026 00:51:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778140315; x=1778745115;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BpEumnaM8t7dwHMywONFVO56DNyFeVZlWd5DzD2uuVY=;
        b=OKXsxPg45nSs6+5afVw/p4TPW3DaxNWKrHz3E6FP9JTaNF8Yht/UiIWtwmN9ckuzOO
         ojWGhaTNwobv/zzV3K9nQcijkcAv4woVaaDmY9b0sHapvnvYienqGW7nZRqu5CS1Bu8y
         GDwLOYtrGTTd/6W59UGklTEe6bnCM1PSVtciHA/+fuFwQx5b7IXNW0mLWG2mVgfp1/yo
         DsawY2XQcQ2uNuXI7MU90sYN2vXegF2ydkOB1tLAzJmpQLjvZYGKsLHXxp/tx0Zcb7T2
         YejI9zJZnK4u8x4fa3JUz6i/9ZPAFpnQ40pZOF3oDCjPsEWc5lpzq2fbDIZpCetF6tDZ
         8WMQ==
X-Gm-Message-State: AOJu0Yy0SLHFzs+CgnGJwQTupIU9US9Ywy3NuLY4AV4mISRWbx4uogbS
	aGTXEBBAQ1mOBtFrvu5mYpMgcCC7zQbOHvufDuXwDzRhbaLrBJOqKincMpDZidwSoN4K7dMmF+p
	+Kfpuqa25mxvAoz7dzIHi9JYLr4iZFPQb44mWO6E2demRhQprEnrrEOs+U6ITRKkOEjpyp/3Yj7
	LalQMtY+EK1m+R3cl1FSMqU/nhggPq5QjI3WfXRW6EwyYg5Q==
X-Gm-Gg: AeBDiesCnfsTSeaA1TgT2NgBNrJtpOgpmyoReWrRnAucajN0Eom3C899vi7p3QiqIjb
	iptqB1FPR70cmjG5jIpH/4yLZ5sCoTn2VnmuBcT/T+GKa/EH7HKS1/d5dzo46JGCRTludj27eeZ
	Km+CrHq+bUiAGkulEjdIosPOiYzeDfpzs5LinCso/PB1XyLicT1Q/R2WEmp2LnzdZOEwNtwjRKB
	PMTJ6t/ReVxMGkO2MJMQG8VeFzi3Gzmlt6IjrtiKRJCXURX6nkkzfYR066mNved1+riVVmT773H
	Urys+A1S54jowXKRaccoEkWY6hZIyCgT17H7CwNT2CjIr6OSMIBRIv+ZnHIMXGh/UIyja+Uhzu2
	g6UCzsG9OBooR8YaxIGDrEXeal+ze4cY1o43FdfRvciiUrqEXPmM=
X-Received: by 2002:a05:600c:8b08:b0:48a:5501:7995 with SMTP id 5b1f17b1804b1-48e51f32ca9mr117151515e9.18.1778140314996;
        Thu, 07 May 2026 00:51:54 -0700 (PDT)
X-Received: by 2002:a05:600c:8b08:b0:48a:5501:7995 with SMTP id 5b1f17b1804b1-48e51f32ca9mr117150895e9.18.1778140314448;
        Thu, 07 May 2026 00:51:54 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-48-7.inter.net.il. [80.230.48.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45052953383sm17372705f8f.13.2026.05.07.00.51.53
        for <virtio-comment@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 00:51:53 -0700 (PDT)
Date: Thu, 7 May 2026 03:51:52 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: virtio-comment@lists.linux.dev
Subject: [PATCH v4 1/3] balloon: add Security Considerations section
Message-ID: <f349753e62471783378c950a2552e02aa30e50c8.1778140241.git.mst@redhat.com>
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
X-Mimecast-MFC-PROC-ID: RBq-sNpL3du1spjABgSQdUd_THQ4UhfBEEEnOtmiW7I_1778140315
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Add Security Considerations covering information leakage (balloon
pages may contain sensitive data), free page reporting exposure,
and denial of service (malicious num_pages).

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 device-types/balloon/description.tex | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/device-types/balloon/description.tex b/device-types/balloon/description.tex
index a1d9603..a2e4a37 100644
--- a/device-types/balloon/description.tex
+++ b/device-types/balloon/description.tex
@@ -632,3 +632,31 @@ \subsubsection{Free Page Reporting}\label{sec:Device Types / Memory Balloon Devi
 If the VIRTIO_BALLOON_F_PAGE_POISON feature has been negotiated, the device
 MUST NOT modify the the content of a reported page to a value other than
 \field{poison_val}.
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
+\subsubsection{Denial of Service}\label{sec:Device Types / Memory Balloon Device / Security Considerations / Denial of Service}
+
+A malicious device could set \field{num_pages} to an
+unreasonably large value, causing the driver to surrender most
+of the guest's memory. Drivers should apply reasonable limits
+and not inflate the balloon to the point where the guest
+becomes unable to function.
-- 
MST

