Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 402B88BFC
	for <virtio-comment@lists.linux.dev>; Thu, 11 Jul 2024 20:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720731343; cv=none; b=fqpJe9EYQ/9w1hb0wmRvplq8If2Iq71g5aP51PyUgXVxOIQw6Tkym7fmsrxaA4JsaRMyQzHYeaBkTr6Sj1juTFwMBU7nmefBdNyZZDqHDviFkxiTzBG0MP3zOkdxfZpOxOWaOFTYWrqotO9eOIsqzDYKWFp3QicSri/2KyzHxyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720731343; c=relaxed/simple;
	bh=ZBcHcZmJzU5lPbU8u1n6nGPTTCPS1nA02PaBneHFD5Y=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ry0c2lSjoCaM8nJHudnZl79HnApq42qNm6g1sAh1/DfvKTvZbVhpuVjYZaaGMR2LBrmkBfKz0H9hHgkFNlUO5uGFM07+Oh+6yKkEk+0JViRyQlLSCdbP6Cx3CiXbnA+G4CYLoXq0CpGo+WaGcLZhLseQ5zjebqxdb28wPCmxZjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gMlAI1E4; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gMlAI1E4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720731341;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=UbQ0QBN0r5j2W4trV9dBXRIRweAyotv3OLS/8m92VNQ=;
	b=gMlAI1E4SCHz5WATa3B0fzs7POlmHwhtLGRKwUxvptbB3hMu/hWOTK/9h2fGTAs43SCs2Y
	4n2l2WGwvxhCSBB2MWY+X7XKLWYlW4A0QT6AEMltmR57WWFynbzmF+vUF7jw4dy0SWEIU5
	Dtm5BpYP8OkLO/z0tuw8D4qP3rYbCqo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-112--pBS-f6nPHuuB25LMl1a1g-1; Thu, 11 Jul 2024 16:55:37 -0400
X-MC-Unique: -pBS-f6nPHuuB25LMl1a1g-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-42674318a4eso11670495e9.1
        for <virtio-comment@lists.linux.dev>; Thu, 11 Jul 2024 13:55:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720731336; x=1721336136;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UbQ0QBN0r5j2W4trV9dBXRIRweAyotv3OLS/8m92VNQ=;
        b=WLt74KlniuJz30S78a9ZEJ0hHRSpxtr4SFDvtyz7AP/ykS8y2isDNKKDsyk46aPPkr
         73ZKwa/P/FYghUAa/xvEQFgDSnb8YLf+v96Qfhdz4NZqBxKyA7kj/rsobZMlHXRcGOyg
         HxEBPmOuxRv0gqaGkHMFp3SUPh+NdMxXGFyz8xENBnWBGeR7nH5IehwXzAKzMs1dDqiy
         9Ux4ptBWa+W49Ufcyn5BmjdFt3hk+lCSDKlCgpLG4D0eEIuT5Mf47a0Yi4nWj6Z1LItB
         4kIb5KdFtEDk8XWtEhwBax6Fq4YZjX1zPsSID4bwyjiDCI5SpeV7ZUy9wkZwd/DUxP9k
         TmDA==
X-Gm-Message-State: AOJu0YypUQ7KwS7oyRWeAn3c67paX8Um1gAxSGPpw2LWj/acymZAqN3I
	YVKSYlEDP80v9BoUskj9qdlNRWUmaB/f2Iu5U8ej2/xughc4CEANq3lgx65g7vKQl5wLGX/0jyq
	82EZQaT06YXB1dqOLJdHIoMAecITWTjxG0P2EpMg9VLJR9OFx/VesjzXkKYcTEixEf06MzY4X1i
	RkeAbOSrJNhO/ARrj9SwPB9ZClart4X/9qz5A6FYPViw==
X-Received: by 2002:a05:600c:4aa9:b0:426:5b44:2be7 with SMTP id 5b1f17b1804b1-426707cea49mr85101765e9.10.1720731336162;
        Thu, 11 Jul 2024 13:55:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHO41BuWg+K2+1l9Jm0BTZILABz9lGfiaUz34gd/VTLdzOiYwGSwYO9mDaAB6CJNqVdZb2/fg==
X-Received: by 2002:a05:600c:4aa9:b0:426:5b44:2be7 with SMTP id 5b1f17b1804b1-426707cea49mr85101605e9.10.1720731335383;
        Thu, 11 Jul 2024 13:55:35 -0700 (PDT)
Received: from redhat.com ([2a02:14f:173:2166:83a4:d566:a055:a5a3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4279f2d7489sm490505e9.44.2024.07.11.13.55.33
        for <virtio-comment@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 13:55:34 -0700 (PDT)
Date: Thu, 11 Jul 2024 16:55:32 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: virtio-comment@lists.linux.dev
Subject: [PATCH] transport-mmio: fix up makediff from 1.2
Message-ID: <fc98549666e0fe74e890a7a62ca71248e709712b.1720731329.git.mst@redhat.com>
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

we fixed a typo in label name: in the diff old links become
undefined. Add the old label back for now, we can drop it
down the road.

Fixes: ca97719 ("transport-mmio: Fix spellings and white spaces")
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 transport-mmio.tex | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/transport-mmio.tex b/transport-mmio.tex
index ae5fb37..94a93a1 100644
--- a/transport-mmio.tex
+++ b/transport-mmio.tex
@@ -44,6 +44,7 @@ \subsection{MMIO Device Register Layout}\label{sec:Virtio Transport Options / Vi
 
 \begin{longtable}{p{0.2\textwidth}p{0.7\textwidth}}
   \caption {MMIO Device Register Layout}
+  \label{tab:Virtio Trasport Options / Virtio Over MMIO / MMIO Device Register Layout} %for makediff
   \label{tab:Virtio Transport Options / Virtio Over MMIO / MMIO Device Register Layout} \\
   \hline
   \mmioreg{Name}{Function}{Offset from base}{Direction}{Description}
@@ -431,6 +432,7 @@ \subsection{Legacy interface}\label{sec:Virtio Transport Options / Virtio Over M
 
 \begin{longtable}{p{0.2\textwidth}p{0.7\textwidth}}
   \caption {MMIO Device Legacy Register Layout}
+  \label{tab:Virtio Trasport Options / Virtio Over MMIO / MMIO Device Legacy Register Layout} %for makediff
   \label{tab:Virtio Transport Options / Virtio Over MMIO / MMIO Device Legacy Register Layout} \\
   \hline
   \mmioreg{Name}{Function}{Offset from base}{Direction}{Description}
-- 
MST

