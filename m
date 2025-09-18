Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21CD7312836
	for <virtio-comment@lists.linux.dev>; Thu, 18 Sep 2025 16:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758212338; cv=none; b=Rv+yDpKU8Hy9Ihesxh5qJ7OAF2ODio8Wlge8nXt4XPhdHXvSXRVgISHuncRupevoFH1QsqdXID70nbNRD+t/1pTm67oHnOFgqj9uzofbLgn3AWmnuM1gYgVjgHFwy1uzwo/6FPxKH5d4Jgf+Lc4Mm/YIJ+87lzjLhoeP/7ZQdF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758212338; c=relaxed/simple;
	bh=yy4ZKBUyNdW0u8r9Df2Qmn2ewmYvG5B1lRN65+sSvqY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QyUOZhLJMQb1poPZ5NTqbkQYQRaD/B0dE4EBnLt3RGaxySIoT/78XdYz47yO7yV2OfwG/8zewOf18SRDhipfh/HYajuNEf+pbFo5eIv6Ase2kz1jZwJMijKfAaFb6TXXG+R0t6RYS4w3GF+7JVmNbRt7GQ6ik1lg8inbf3FbRBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XOC5+tei; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XOC5+tei"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758212334;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=fgQCVdX8IzYxOKo4e4yB4fYU3Qcu5/c3RL/AVDJGF/I=;
	b=XOC5+teiwsLWwWQCiOPI7EaJB4xItxINapFnvagC8K2+6hTXmLqPou2uUMgL9azoewMfXm
	wV0+8Z405VURVz6EPccn1WSb/8LhdwJiJJxk2ZYV9eBHklNOmEdnbD0zyhWmyYWz2Dl3fx
	NhK+FFqq4EqGDkHwhUppiIyN21yQCV0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-536-WmlZevk3MYuYDx2LtQTJtg-1; Thu, 18 Sep 2025 12:18:50 -0400
X-MC-Unique: WmlZevk3MYuYDx2LtQTJtg-1
X-Mimecast-MFC-AGG-ID: WmlZevk3MYuYDx2LtQTJtg_1758212329
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-45de13167aaso17574515e9.1
        for <virtio-comment@lists.linux.dev>; Thu, 18 Sep 2025 09:18:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758212329; x=1758817129;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fgQCVdX8IzYxOKo4e4yB4fYU3Qcu5/c3RL/AVDJGF/I=;
        b=NZ1RD8AwuaPr3eiFYLvNHxg6cxDCbVpadt3p0ZI8oM7wKjp6WfUFTx+CUy/84jyO45
         12kMp+3uuTXL1eCMMD7CUGyQ+LrQweEB/TuulvWb5FRDDnY4VLlsVJ7P9kBL0yegng7G
         8s4ARFkMks4WfBeL8ULRKeatln4ccgDLnbgKyOZx3jDItMTHlTS5ehk8pLQIGFfq8XKC
         mZlwyqf5vyPOARJ0Izbv9Yu5xsCKdn1AaDzc5Jyh2zdxzDOim7rXRw7b/kVUU6imDJfS
         i2BaKG93NVoRfk5JIyT6+ioE9k4uET0DvdHuWGcxsokwawL5wmWQp7jKTPowFJGYwjvL
         mFNQ==
X-Gm-Message-State: AOJu0Yz2BXXsAdGt1R2QArUshkbzt4woGnRob35OC4PBYKbFdgdRSvdU
	SYucclens3FoztjxTLF8llDgcxEduI4c6usswC6ztTXe1SM1eKfR6GxtLYU2in6uiwAzajJISiS
	Y23MoxBvUysg3TgJ3b+2Pf4cKI7yB7udn/hhPXTBqYOfj777TgunCRb5E2XkGbFfA9hgSLsbzMJ
	0uN9bVjhXDYOZ1uh+QzLIRsmZxXYKeNYAB701kHtrkhMu5FQ==
X-Gm-Gg: ASbGncsywBn/XNheK4If2c2BBmHHBQ83SQq9FuCgbFJpQHwr+ovUtkMSlPqgx0vORpd
	KICb1Pfp0Zi5mn09OhrAe5ChrEDFMo1xaiE2cSbAmZHOvrxbUFE62eMS1YoYLnhNqu7NJEGqz/V
	CGewl3uR54CO0H5WZQ12HYLYQOmkFpTYIAawbBxC2zOUG4ZqOSIi4rpm+Dga542U5V2Yic4oLF7
	bl2AYkBwXawAfSZxH//Bqdgs6Aub+cIwRhT6EepkPcITiObPh8nDbr1FNtuTciHEpmltgrnVs4T
	73HJzQp1lNX3lSqAm4P/GHsxAz3sW89Kbcs=
X-Received: by 2002:a05:600c:1f13:b0:459:e025:8c40 with SMTP id 5b1f17b1804b1-46202bf8382mr73921905e9.10.1758212329157;
        Thu, 18 Sep 2025 09:18:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFf3u3I4xaMtQOfSEfL1HTs4ggEq39RD7YXVEK2h2Y4LsXPqOW/RUB+8dG1jpL482uXHTSVsA==
X-Received: by 2002:a05:600c:1f13:b0:459:e025:8c40 with SMTP id 5b1f17b1804b1-46202bf8382mr73921455e9.10.1758212328619;
        Thu, 18 Sep 2025 09:18:48 -0700 (PDT)
Received: from redhat.com ([2a06:c701:73e7:4d00:2294:2331:c6cf:2fde])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ee074106f4sm4280352f8f.25.2025.09.18.09.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 09:18:48 -0700 (PDT)
Date: Thu, 18 Sep 2025 12:18:47 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: virtio-comment@lists.linux.dev
Cc: Filip Hejsek <filip.hejsek@gmail.com>,
	Maximilian Immanuel Brandtner <maxbr@linux.ibm.com>
Subject: [PATCH] virtio_console: fix order of fields cols and rows
Message-ID: <7b939d85ec0b532bae4c16bb927edddcf663bb48.1758212319.git.mst@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1Y2BRJhWzCp-pxowaulh4q9y1dO5WHQrCWVJqPA49Ms_1758212329
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Filip Hejsek pointed out the following:

The problem is that for a long time, the
Linux kernel used a different field order from what was specified in the
virtio spec. The kernel implementation was apparently merged around 2010,
while the virtio spec came in 2014, so when a previous version of this
patch series was being discussed here on the qemu-devel mailing list in
2020, it was decided that QEMU should match the Linux implementation,
and ideally, the virtio spec should be changed.

There are about 15 years' worth
of kernel versions with the swapped field order, including the kernel
currently shipped in Debian stable. The effects of the swapped dimensions
can sometimes be quite annoying - e.g. if you have a terminal with
24 rows, this will be interpreted as 24 columns, and your shell may limit
line editing to this small space, most of which will be taken by your
prompt.

While commit 5326ab737a47278dbd16ed3ee7380b26c7056ddd in Linux made it
match the spec, no one seems to have implemented it yet host side. It
seems better to just drop the change (it was only in 2 releases so far),
going back to the status quo.

Change the spec to match.

Reported-by: Filip Hejsek <filip.hejsek@gmail.com>
Cc: "Maximilian Immanuel Brandtner" <maxbr@linux.ibm.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 device-types/console/description.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/device-types/console/description.tex b/device-types/console/description.tex
index 40a2ba4..c18dc08 100644
--- a/device-types/console/description.tex
+++ b/device-types/console/description.tex
@@ -59,8 +59,8 @@ \subsection{Device configuration layout}\label{sec:Device Types / Console Device
 
 \begin{lstlisting}
 struct virtio_console_config {
-        le16 cols;
         le16 rows;
+        le16 cols;
         le32 max_nr_ports;
         le32 emerg_wr;
 };
-- 
MST

