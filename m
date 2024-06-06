Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 572CE19D89B
	for <virtio-comment@lists.linux.dev>; Thu,  6 Jun 2024 03:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717644952; cv=none; b=Ccp5bfd+3F7/FVFdPMTohZ8w6bCYez33PZmHCKa2gLuPwAaJeVHZRORUfSpMhOt6VtLuJD5uv/Ff5XKEPDWjgqj14quTqabaBealQ3AGhvimPOi+daVWPmq0af9F0pX1pI9JDIeHOSBJgHb5pqyBzFdo7osynFY45H73StYsHW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717644952; c=relaxed/simple;
	bh=jpb5tHN4i3POvzh6d3Mg0UNgKBL3xrSOoFfKNSG+q+s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JPO2j8H8WCfSojko1IdLQp6bB/Pn+PLgnneuAsVnIur6U8Jh3rniU1Cmnj8+bsUS1FqYWY3gEMpkTQMGjsPtarduzeyLNoeiGlXfyPqIVAj54f4/FsCKw7baS2gHuUxMH7qkc6aYqZprtH21kkz3Pftn14X7MszUbF5m6gXqJXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=jpNIiBcV; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="jpNIiBcV"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1f62fae8c3cso4568885ad.3
        for <virtio-comment@lists.linux.dev>; Wed, 05 Jun 2024 20:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1717644950; x=1718249750; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CERYWMTsMF5bCR/Q/F2GfbVSBHKKcp2YTn/zy1aBoLY=;
        b=jpNIiBcVpCuDt8AKgIVFc50u85pAqFH/L0ekwN7Y9/JM2IJEQNM+jP+ipQtUgWYjg9
         zltBU5b0jLmRTWFImcNY/aXfVaYzkdZRseIvHWMzcKL9KQZQjMR+YyDnXyCmeFpUP3ku
         7jX8H5rO26Q6lETd3UmhH+w2vAV9lM7KwdCsO/heoJTZwpXT7zGN5CVVTKeqfx3F2SBi
         xhMjEGQekPRzNH0K9wHBQqgGJ1+eHyjM5YqtW8otvGdzA/v1m+pLd2ySLXBgWfNrgWF2
         vO88ib/UOc7A8L+3FGeymrTIr4xfXhcNUl7/87vAK/QqwNZwOHk5Bglhjwtwood5jy0C
         yLGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717644950; x=1718249750;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CERYWMTsMF5bCR/Q/F2GfbVSBHKKcp2YTn/zy1aBoLY=;
        b=i8ZOfcXfG1imBnNp0HPcXnKLJgEoEm/IVMzRhiowu3eDZ3tF+ZU/cQobbS0BodQiIp
         JSAVzQLJjFfPHpGyHBINDjb89Xq+V5K6huA+aYHzMTvvpuCL0qaNlBGQWzE33u4Vpx6X
         MtzI4vLzxk5i4RsCqvFcixo2w8CUu6fh5Jhwnr/5NTLgCKvSj7Lt2U6iuBu54gy6jHB0
         gVQGQvyTqBjIh6M5EYRbeiaVtDS2xx7yvGhavVYy1o4nSV1tVcJ9kdgQPSfLvApnCH1t
         /Tu+ZVEC6/revdZEiYQxkx0/0G76PM3hZe94Z8apYdoxBcUnv42EfI945+d7jEu6Uk1/
         l4Bw==
X-Gm-Message-State: AOJu0Yy6pkYx2OT2l/WEgzX+P6ZvemQPvCryFum6X2SldSi6aDuGmJiV
	CgezA23ptkSG0qSf2D0Z0dIuFJGeuZkFEbrSPiyZ1ZTIuaiK6b+w/ZzH8RGwxHRoSskwYxJE2gR
	musQ=
X-Google-Smtp-Source: AGHT+IEuufwSvVg1gXjQvUxU9fM1EqffNYX6inMknEwLYmHyEEU+kfKJUWvmXYi5RUZ4yrZU6dsbIw==
X-Received: by 2002:a17:902:ced1:b0:1f6:8235:dbbc with SMTP id d9443c01a7336-1f6a5a23fdfmr52103165ad.29.1717644950045;
        Wed, 05 Jun 2024 20:35:50 -0700 (PDT)
Received: from always-zbook.bytedance.net ([61.213.176.5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6bd76c6efsm3107135ad.94.2024.06.05.20.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 20:35:49 -0700 (PDT)
From: zhenwei pi <pizhenwei@bytedance.com>
To: virtio-comment@lists.linux.dev
Cc: david@redhat.com,
	zhenwei pi <pizhenwei@bytedance.com>
Subject: [PATCH v2 0/2] balloon: introduce 6 memory statistics
Date: Thu,  6 Jun 2024 11:35:42 +0800
Message-ID: <20240606033544.400000-1-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v1 -> v2:
- Suggested by MST, include the motivation in the commit message.
- Make the counters clear.
- Add a link for Linux VM management.

v1:
There is a previous discussion about the new memory statistics:
https://lore.kernel.org/linux-kernel/20240423034109.1552866-1-pizhenwei@bytedance.com/T/

This may be helpful to describe the usage of these counters.

zhenwei pi (2):
  balloon: introduce 6 memory statistics
  balloon: link virtual memory management URL

 device-types/balloon/description.tex | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

-- 
2.43.0

