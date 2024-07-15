Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA668175AE
	for <virtio-comment@lists.linux.dev>; Mon, 15 Jul 2024 16:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721062185; cv=none; b=RbNUJA/OptnjUChv3M4KZ+MB2w/lnXa688j1ljKdV3G0uyejn58AIAtjt0eRDwJyoxW6SOM/5y8qzY6hJ4brxV4/Q20zPUCQVCMAXIIJG9QjgibIs32R1hyrgk+bTvIC834KzVqK6sKwKg1rkMjNq+A38tStOMNzRTUQcsZEQ3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721062185; c=relaxed/simple;
	bh=gaXrrHliUls+lKAFo9PJ7xzvK/cT1OZCOp/bgbYlIw4=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qfEie2/5E7Umc6TZY7emVB/7NW9Kx4Ql95s/2R/h1B+pao50bX0iewlvY7ZQ5Vcs1okiNz8sua3yquyyvkGbYNc4ek0cogTb4T9FQPBiy+vdQJpo/uqozdfBxH7t5pyF5Qe3K5I/xQF0uCRlqtB3SJ+PBeSxxjpG0BipfVZKZ0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LaBXFWc0; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LaBXFWc0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721062182;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=NRdf2ZroHLClZdSJnzTTfLc6FKGhNwvi4r4r2PQynm0=;
	b=LaBXFWc0iw2OBZUm+P8Wwj+ev1p8eHC2xI1+LL5iWLoVXdQJOQINGsB3sf908Eiml7LmCb
	QS4pKPqVSRFW6IPBhIYh3ddscDKplpPnxl2oaqC7MYbeSVlDSDkxnE1taz1kWTHQ2je//M
	PXsL22UI6rbMBQ9Umx8EkHoG5ZX1KwU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-297-Z5jAf_xbN9qPCUXzCZ2g0Q-1; Mon, 15 Jul 2024 12:49:38 -0400
X-MC-Unique: Z5jAf_xbN9qPCUXzCZ2g0Q-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-42725d3ae3eso33491605e9.3
        for <virtio-comment@lists.linux.dev>; Mon, 15 Jul 2024 09:49:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721062176; x=1721666976;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NRdf2ZroHLClZdSJnzTTfLc6FKGhNwvi4r4r2PQynm0=;
        b=hPKxcGtSy6bMr4hpHvdP0s8TAykeyAS+bGx4AAo+6X8ngNssoX2QnFBJscNS1hZh+B
         K/IjpM/lhP9sQlKkwAntK2C1VzY4jHmXQDO88THSvoSKTnPqbvgfKqoa4jRMY00R1VJZ
         jNGxZYX1Qht/3RuFqf7iDRcukEaxRhpybnFU1iiBoP/RDSyvggk4/iwfHYEsMxHHHIh1
         javG4PTg5cN0d0BlTsYxjQl2ppxoVGt4e+2uofoN/Zqae2JtmrU+mXbs73hX3jqBkZIw
         58v8CMGU3PIMNteTwLFoaVRD6g67MApuAVXa6rOctNCaf8Xtz1NHEOaWXnGsUw+qnIKa
         CeQQ==
X-Gm-Message-State: AOJu0YzWWzVtced47slT7q/k6mQ+Tf7FuaD8gGNz5ricco28J4gYVsvZ
	bngXdAI94zgDn/Tl3QCJHQBzzqgu06T/TQGuEi7B5ftD/vPFgRJEsNW4BoOWiglHCDcElkDI4Gb
	qGMWSyFCF9P/dqBWa06kekSv7Isp9H+w64ubt0r781ntjWgvV5NQ9nlrIQEZDHITmOHWN7KouhU
	CGIlUE/zD40ZPQxOqFl4LbPscRazqImXyIguKBmTBURw==
X-Received: by 2002:a05:600c:310f:b0:426:67f0:b4f3 with SMTP id 5b1f17b1804b1-427b88c82bemr1333055e9.26.1721062176774;
        Mon, 15 Jul 2024 09:49:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCg5sYyBW4Om7kFx+kM9iXq8xqGG1bHCV0EvyqSGSNakLT5dXMe1giRJDBgBL5+figwyrj0w==
X-Received: by 2002:a05:600c:310f:b0:426:67f0:b4f3 with SMTP id 5b1f17b1804b1-427b88c82bemr1332905e9.26.1721062176099;
        Mon, 15 Jul 2024 09:49:36 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:243:da88:7ff9:68fc:2f43:bcdf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427a5ef44b4sm93954815e9.42.2024.07.15.09.49.34
        for <virtio-comment@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 09:49:35 -0700 (PDT)
Date: Mon, 15 Jul 2024 12:49:29 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: virtio-comment@lists.linux.dev
Subject: [PATCH 0/9] html fixes
Message-ID: <cover.1721061782.git.mst@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

this fixes a ton of issues around makehtml
and makediff.

Michael S. Tsirkin (9):
  makediff: look in subjects only
  makediff: cherry pick table env change
  admin: switch to tabularx
  admin-cmds-device-parts: switch to tabularx
  device-parts: switch to tabularx
  admin-cmds-resource-objects: switch to tabularx
  virtio: replace xltabular with ltablex
  makediff: cherry pick switch to tabularx
  admin: get rid of _ in labels

 admin-cmds-capabilities.tex      |  8 +++---
 admin-cmds-device-parts.tex      | 18 ++++++-------
 admin-cmds-legacy-interface.tex  | 10 ++++----
 admin-cmds-resource-objects.tex  | 14 +++++-----
 admin.tex                        | 36 +++++++++++++-------------
 device-parts.tex                 | 28 ++++++++++----------
 device-types/can/description.tex |  6 ++---
 device-types/net/description.tex | 44 ++++++++++++++++----------------
 makediff.sh                      |  4 ++-
 virtio.tex                       |  2 +-
 10 files changed, 86 insertions(+), 84 deletions(-)

-- 
MST

