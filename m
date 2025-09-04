Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46AE7307AFC
	for <virtio-comment@lists.linux.dev>; Thu,  4 Sep 2025 14:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756995569; cv=none; b=ti/eoOncYxCpcgZSG0XGL1JTNX+ISk2ZKqnAGNhj2zbtMIQ1IOcVfhahWyciRo5optqf832o9N+wR+4HEC/I9MbXS3CgvXI8MvyCrslBxLGH2kCBZFF0EeVdRCVHWwYb1GhFeE/TXn9pnOF2kVRrjk6Xi46Hgtv88hjED1iALI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756995569; c=relaxed/simple;
	bh=y10BOY2bhipVhs6u4CV71tafCYQ+dgvqXHPNVXyu5uc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JbKJXxS61s9140Lrnicld+0ku1BhwpYFd/gYPjdQTe+TU4SRyak2exKotgfXtq5dD3gIMaBa6gvU7ko6C2QyYL7+B35AKLqQukntSZXT/0xgVbrBUBsGgZmOxT0e5xrwc7QewJBjRHU8QZ1ncy/E4cZImj+qaJpkxN0dwHX7Lz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AkhtkbyU; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AkhtkbyU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756995566;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=ryrJLkGkbnWVchG2uLLYEQrTQzr4tj9oydy9WqHdpys=;
	b=AkhtkbyUyVVX2/YarBDTszSjuDt3w7Py2DYWX+mG2P4E4/sxQhXTxKZzgyfdkeDnf3HhLu
	Hs7YLASEhekGZzN2FE1m43Fcc3/9zGYzL6UKqQFpPziGU3WYPSZG/aHLTuP8nIIxWpX3ZP
	2FZSdvo+5fRoaxdZw34GMZGdfIG+uAs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-102-8YjXzEnNPTCddyAAAhSJOQ-1; Thu, 04 Sep 2025 10:19:24 -0400
X-MC-Unique: 8YjXzEnNPTCddyAAAhSJOQ-1
X-Mimecast-MFC-AGG-ID: 8YjXzEnNPTCddyAAAhSJOQ_1756995564
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-45cb4f23156so6520515e9.2
        for <virtio-comment@lists.linux.dev>; Thu, 04 Sep 2025 07:19:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756995563; x=1757600363;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ryrJLkGkbnWVchG2uLLYEQrTQzr4tj9oydy9WqHdpys=;
        b=dDA7FU/piqmfnQEDmc6U9j6sV3tlWXYYUyOFerYGKpcK7NuGlLCT7PmraYQUwQXt5e
         Gl0m5Q8iT9pQBT8r3CjiKMg7As3cMXeWhUDuM0PiupUi0eNzk4MpJ3QxO0j+2P45o2cS
         sJY1LU4b4OGK0d32xGE5JU+RNf8umoladrjCsXsq1EZ1mKs9PcvQCaJ3n0asmsyGGP3a
         WAsphqPGYEiTxhXn2mcvk86wPXp2Xs5Xnm52UJSeZVCxaDQ+hpKVD+0HDAkRibv4SZpw
         l12NgHgEH0qBbRtccwPjzpbdH1FeHBQwE/XfMmB3M4WwLEap28nNGLToTOEws9yf+6Gs
         I1Qw==
X-Forwarded-Encrypted: i=1; AJvYcCXVD8l+83WOt+pGqMD2Zq9gNNIEqrNjCMhZBz/tua7zoK/+/fokDFst3/oklKBV+aUsJOkl99mFb7zh8bMMug==@lists.linux.dev
X-Gm-Message-State: AOJu0YzFNHFg4TcQOUBUax0aoMqWQETSscjskTumsmnGU8tMf1epV5P3
	jIbOsid3SllKPihkWSfc40IiDX46j34Fq6MvvtgkdCZo2EXUSfA2O9yKmJtb7dkbUd/CRWObIN8
	YyRek6KNbepTL5ksSCHcDPIJchIH//8aZ1P+lcapM4b/KMxZcJNV+QMHeBIFQV71ZdFkF
X-Gm-Gg: ASbGncvGmz2AseMCCgtaFmw5Dt3/VPsnHwyf1aD5icOGF3dljKjEUl4iMCi0J6w30nc
	iPk07vYfJYzkv6fHUQ1mCzzb3n+OISZJM8qopCMf8/hLSWy607L1R9/+vhRfjeR2ehFvByathIH
	XHoLnsdLuMx1MvNS/lk7EI90t27p3+AOE6DXO0lf2UiCn17iuVqxNlxZsY3EKkv+twD2xiKqwnw
	XJEB9saNcGWezfBTUKL5/KCV34BmZXpTUGOsDh9+G15fs8P+ouQAEL6M/HFQtltYg+lhxKQ3+ni
	BPDrWfhuqmUKej0uQBdG5xzWhvadxiA=
X-Received: by 2002:a05:600c:c491:b0:43c:ec4c:25b4 with SMTP id 5b1f17b1804b1-45cb50381admr64670195e9.10.1756995563498;
        Thu, 04 Sep 2025 07:19:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGj8dKOSoqZDoUMeKOpb0xF4IjxY/Jl2uTzegN2UDaeOTp7hqFfy7Kwpb6svQb/dzbeUfhNwg==
X-Received: by 2002:a05:600c:c491:b0:43c:ec4c:25b4 with SMTP id 5b1f17b1804b1-45cb50381admr64669875e9.10.1756995563081;
        Thu, 04 Sep 2025 07:19:23 -0700 (PDT)
Received: from redhat.com ([46.210.239.224])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e211346354sm1557640f8f.10.2025.09.04.07.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 07:19:22 -0700 (PDT)
Date: Thu, 4 Sep 2025 10:19:18 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: alvaro.karsz@solid-run.com, hengqi@linux.alibaba.com
Cc: brett.creeley@amd.com, parav@nvidia.com, virtio-comment@lists.linux.dev,
	virtualization@lists.linux-foundation.org
Subject: virtio net notification coalescing
Message-ID: <20250904101548-mutt-send-email-mst@kernel.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WpS373WwUT18312NehZ42EcTqnssu_76Ez2gFlZsSL0_1756995564
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi guys,
The notification coalescing feature has been in the spec
for 2 years now but it does not look like there any
implementation work still going on. Is that true? Know
of anyone working on it?

-- 
MST

