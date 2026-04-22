Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 674E42FF65F
	for <virtio-comment@lists.linux.dev>; Wed, 22 Apr 2026 16:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776874360; cv=none; b=Z8EUh80ilk5KM37elSh90QlelaoDP7Tq3cjPI5I9zZKU2NCeSGypE2+HF++Bd4Us8EAAuNk7U54b1ypRqlXfMB/8nDsM7Op7NSMMTx4qGcWHAr0ZdDu9B6CstVyNJNKmCkQeSJ7wNmTr5dLap4sgPPzp0CrgLV2EiV38Yg4x6eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776874360; c=relaxed/simple;
	bh=VroEpSXb2Z2Z/nWG1rt/oCKPt0Iih1jc70l8wLkXzfc=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eaVzpoTBNeSoA+qGWx6E/cWy1v44slxRuNsexeWoZJn9T3sAxRe9m/z5MTRZG3w2HnBQjHzFqKJaL9uTsEWVSb/5DBTLywpnOSgOJbSHrjZ/i9j3Mr18lg0RCxBXK0GKYjJjtZGpew/daKdlTQDgamx86ARV3IZEWTZdmiML6EE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LbUyBnF6; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LbUyBnF6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776874358;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=obS8Pa+BSNDn19fY4GJmuPBg0Y+bXW6LXjOH/sAv3K0=;
	b=LbUyBnF6kQ84tfBgQZFKmqb79ql6Ih6GYjV5CptnPyd5WvUp6UqFprml/0mTmGGBeJExDF
	mN9sQYui8IN4Qe78JQp7HDgmV2qECXdihCzdhRmSCA/T0CaQgOCBRd8gZp057pte/2wHe9
	2Xe9PGI6IMWltZnN0+v5RcKav4DNKL4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-13-18joeqehPf-tGhMGWMkCog-1; Wed, 22 Apr 2026 12:12:37 -0400
X-MC-Unique: 18joeqehPf-tGhMGWMkCog-1
X-Mimecast-MFC-AGG-ID: 18joeqehPf-tGhMGWMkCog_1776874356
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-440d0d7872aso3032862f8f.2
        for <virtio-comment@lists.linux.dev>; Wed, 22 Apr 2026 09:12:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776874355; x=1777479155;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=obS8Pa+BSNDn19fY4GJmuPBg0Y+bXW6LXjOH/sAv3K0=;
        b=GzgWlO4tjwBm6abnzRwZTjYYErSnSsA5bTeUmP38kqgmPB/RFHPaWynZqUEavpW97c
         JdVB+U80Lj98Q+jd++WyrZGgU6RAzfG//CS8yAizXxDiSTIG7xWwzaBt0bZG0jqANEG9
         3tkjds41ZvSGoRJjfik6ySqcGuGtS9bvo3lvb45eCanPlZwjhpWrsIxqK0dMM3lY9zKW
         gmB4DVnQMiZ9Iu943gJb885UElHZZyldYnKc4rpay+oCi2gVuVHOSXrgx8yqaBLnsG1V
         mHe88/V8gKHHIkUtL02KN6PW7melub5V+p9zgelifrSdRAXnyhiwx8Y/22ybehopqdmo
         sDgg==
X-Gm-Message-State: AOJu0YwoPW+epb7d+rcLixhLYUT55rFhkYCautScJ/XvhOaspHazjvs1
	Kr3Bz1/dpcNX/gAXtfCVG7qp88KrH1H588kRs0r59+ay6loQcKngyT8lre8+tRBttjA56fQ8WZn
	KM5V3e2li35GuP1R9RzHI2xr6XZ4vVyhfiepb5YezJ+CsjFQCVCmRw50SgNr86Fl7QUWUuEPJ6h
	WLjZmnKDBc/Fwt+b+uIq72pRu2pOaMP6Vbhw9MZA8PZum7Fg==
X-Gm-Gg: AeBDieuqLnA59xeSkRZV/NOLxhj/SPirh59w2zBejQXzPjYgzFAKP9k5/WyhNh0D4lP
	WT02NsUOLWNvedx4aj1++iNCXWPnuHmqYceZlDMstDgvd29PXqSaQfxoCcSCWgC0HeOBGtOk9bV
	V3R6YrVfyTDIYOnaeK4C+73gTQOALxGgOPxYwf1u+qyOK8MWqjVJ0cW8YdHGX1o6HGbOsWT/pcn
	suHZHfJi+WgPyDkKnMmWCINTVQkQ3CHmP2UMgb/RtkperqtaWr8AsEVNq46n8Do00f7KdgdVqRf
	4i1s31ghZH2kfOIHVV/s5C6RQxL4ADOmY9p+8p8juKR9H6bVhl9lBitKN+S4jsMUaDybwzxxxAg
	6WrZH5x0oe1jLPWGuzmDxp7Gf7wj7t+O3MiD9FB8CJ93t8nWZZGkMwQ==
X-Received: by 2002:a05:6000:2888:b0:43d:7b23:bc99 with SMTP id ffacd0b85a97d-43fe3dc8152mr36208338f8f.15.1776874355510;
        Wed, 22 Apr 2026 09:12:35 -0700 (PDT)
X-Received: by 2002:a05:6000:2888:b0:43d:7b23:bc99 with SMTP id ffacd0b85a97d-43fe3dc8152mr36208200f8f.15.1776874354740;
        Wed, 22 Apr 2026 09:12:34 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-25-21.inter.net.il. [80.230.25.21])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e4ffa8sm47787372f8f.35.2026.04.22.09.12.33
        for <virtio-comment@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 09:12:33 -0700 (PDT)
Date: Wed, 22 Apr 2026 12:12:32 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: virtio-comment@lists.linux.dev
Subject: [PATCH] balloon: fix PAGE_POISON feature bit description
Message-ID: <e7c84a6828472d383984ccc26af1119f4a94a0f0.1776874350.git.mst@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WJizO6ICPprPzPkuBesZsjpRWKehaSlAFj-G8_r0-U0_1776874356
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The short description only mentions deflation, but poison_val
also governs page reporting. It also calls itself a "hint"
despite the driver normative having MUST statements. Fix both.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/240
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 device-types/balloon/description.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/device-types/balloon/description.tex b/device-types/balloon/description.tex
index a1d9603..e7b957c 100644
--- a/device-types/balloon/description.tex
+++ b/device-types/balloon/description.tex
@@ -43,8 +43,8 @@ \subsection{Feature bits}\label{sec:Device Types / Memory Balloon Device / Featu
     page hinting. A virtqueue for providing hints as to what memory is
     currently free is present. Configuration field \field{free_page_hint_cmd_id}
     is valid.
-\item[ VIRTIO_BALLOON_F_PAGE_POISON(4) ] A hint to the device, that the driver
-    will immediately write \field{poison_val} to pages after deflating them.
+\item[ VIRTIO_BALLOON_F_PAGE_POISON(4) ] The driver initializes
+    deflated and reported pages with \field{poison_val}.
     Configuration field \field{poison_val} is valid.
 \item[ VIRTIO_BALLOON_F_PAGE_REPORTING(5) ] The device has support for free
     page reporting. A virtqueue for reporting free guest memory is present.
-- 
MST

