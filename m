Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40AF91C1F22
	for <virtio-comment@lists.linux.dev>; Tue, 11 Mar 2025 17:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741712681; cv=none; b=Km0pUB4If3Tou/O41HqP5QygA7lTSgodPdY5eybOGT30pCbgk8H3dERmOdBcgTjS/PCzb3SvbGdlGoFjZCriTQeY4kfdRtav+A2xp/haozHxifnpWSZZSU9sUHMif/4TRrcarOZsZBdzBtxXIDRlHMrLhjiIEFmX35yY/zFp9c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741712681; c=relaxed/simple;
	bh=8rMBNahN2/T/ooIxlfCDr2gRqWsXMW94EqyB74jCWfU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:content-type; b=rH+7XFAfEQTTJ3PeWvOgu/qJ5UX7HAZf9gjmIyD+2PT1x6J5eVKh5p38g4ByfiwACSkfy04HsmivII2pp10JFdZId900A/3+NTyBTChWRHgx3t5UB/76Or0zC4oxrgwA4PjJwkeSdJ9LlS5s8yvG1YfEyGOM5zpIDyfQ5fxm4Q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eT7rhS2K; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eT7rhS2K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741712677;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=019tLGHBaSk7a844T5srwc8nR8/GXzPeYvZBdJSLVVY=;
	b=eT7rhS2KonRFDM4q69NfcmJ+zRk9JuVtoHzMwREFP2WS9KIYboqH+/j+vVHyRE3qErE+fz
	UVan8/yKy1TF40QFRjCNoa+nGi+Z1W5sIy5xNN/sx7jLS8/Z5yeyl7HewUIQOvQJ8HZwH9
	rLyaa2fasl+/msKx4ADdSs6/PKBIoXg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-650-a2Lb_DwrMTK76LIuYOREMw-1; Tue, 11 Mar 2025 13:04:36 -0400
X-MC-Unique: a2Lb_DwrMTK76LIuYOREMw-1
X-Mimecast-MFC-AGG-ID: a2Lb_DwrMTK76LIuYOREMw_1741712676
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4394c489babso28885655e9.1
        for <virtio-comment@lists.linux.dev>; Tue, 11 Mar 2025 10:04:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741712675; x=1742317475;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=019tLGHBaSk7a844T5srwc8nR8/GXzPeYvZBdJSLVVY=;
        b=kExm8mcZSZqe4OwzC7w5vMLkfD51GeFjeBxHECLCHt/uNeIi6fcu1pcMwbJr5l6o8l
         fh6uuzqSZ2o3kR9hmhajO0VUg7yNto3sbNSgO2YqFAfWmxweagWHvwa8MCrP8ClRrlJi
         rwQE97tp9HXB3D3cRtr0UaSoxut0BkjXhhoV79NQerosALMCjzuTfFPh/JqMIkkiaFDL
         0Qa06BhslwpQVeFRFG6y/AaMozslPIGL/aF9OPCFmU76weou1rPemgUaf1UTUHpLuTbN
         o0nJlym1JyKXG+zuPqwYWw5ua8vdibl3bL4UR3YguFhAj+Pzu9p3y/blAXYh7fm3D2qd
         o7bw==
X-Gm-Message-State: AOJu0YwcJ1monNuqyV30UGHFnPzXEePBmCa3y2n/7PgRFQ0zihZQM0Le
	z8yAv+osTxm/IpmyUazSouxRviJattnCGI3kuisKwE/2WX/ZCowPw/r92Hn5g3FwGTPEL51eDv8
	Ic+St20PFm/1NXztswJGEKkldW8rfthtMBDLe1/cSkUrI82N/UOV30/c1D1OLia/pPx8X6n+bHL
	Q7aawvXTSaySD043Z+0SlMBwKgNdqM5W3mruHu91jXlp3mukSN
X-Gm-Gg: ASbGncu4rn2Z/4AoQetI10qI4zym0J8Nvapdq/SSnuso+IYgZ4fbrZBd93ri66Jd5L/
	BWPmAg8J6FWQavYbXhfhHcXeouI37GvG3ou67etnYpg41K7voCxO1A534GB/CH2zrxQUxCYJZKs
	XyJz5t3RixBaJoGrRMmxe+/bWyFbCyZMEOvGg4i6aj/sPHpazO3M1Rm7jMZkV/jcOCr9jchLoou
	oF/gTo8sZHUcnc4mHkXWcFCPc0d/NdUBfY1ASndEWG++FzRbRlqvrmTUp+V3Sm+qS1XzUlHodWk
	TjvyveIqkuhXCAX4w1M=
X-Received: by 2002:a05:600c:19cc:b0:43d:4e9:27ff with SMTP id 5b1f17b1804b1-43d04e92a66mr37123575e9.7.1741712675066;
        Tue, 11 Mar 2025 10:04:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHiS9gBn2EXLvWMiiSeO55WL1VRZih10RrkiGvgzYvCfTO3WFgfSaKrTDIdYDdFsKJAgnAmyg==
X-Received: by 2002:a05:600c:19cc:b0:43d:4e9:27ff with SMTP id 5b1f17b1804b1-43d04e92a66mr37122995e9.7.1741712674471;
        Tue, 11 Mar 2025 10:04:34 -0700 (PDT)
Received: from localhost ([2a01:e0a:257:8c60:80f1:cdf8:48d0:b0a1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d0953d60bsm3148685e9.6.2025.03.11.10.04.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 10:04:33 -0700 (PDT)
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: virtio-comment@lists.linux.dev
Cc: cohuck@redhat.com,
	parav@nvidia.com,
	mst@redhat.com,
	Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Subject: [PATCH v3] README.md: add example email for TC vote request
Date: Tue, 11 Mar 2025 18:03:52 +0100
Message-ID: <20250311170352.1737287-1-mvaralar@redhat.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: KNamHU-qXXGeF8W_hLJkrWk9M8gRIjs9TGb8VMr6pp0_1741712676
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Signed-off-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
---
v2 -> v3: use "()"
v1 -> v2: add Subject and To
---
 README.md | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/README.md b/README.md
index c06caf6..8e7e6b5 100644
--- a/README.md
+++ b/README.md
@@ -206,7 +206,16 @@ The mail requesting the vote should include the following, on a line by itself:<
 <code>
 Fixes: https://github.com/oasis-tcs/virtio-spec/issues/NNN
 </code>
-(NNN is the issue number)</li>
+(NNN is the issue number)<br>
+For example, you can use the following template when requesting the TC vote:<br>
+<code>
+Subject: PATCH (description of changes)<br>
+To: virtio-comment@lists.linux.dev<br>
+
+Could please open a voting ballot for these changes?
+
+Fixes: https://github.com/oasis-tcs/virtio-spec/issues/NNN
+</code></li>
 <li>Please make sure to allow time for review between posting a comment
 and asking for a vote. </li>
 </ol>

base-commit: 124fcd0e97f209aab19639e7369116d99ede22a2
-- 
2.42.0

