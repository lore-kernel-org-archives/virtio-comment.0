Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F3FA21E098
	for <virtio-comment@lists.linux.dev>; Thu, 20 Mar 2025 11:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742471024; cv=none; b=XLSt/SQzMNWYgNcWe2ofYarXF1hIMd3zXLUHugClXIPSiGLeRL0ADUu0gBdBtuE1BHIc2vrYlc8y9gW52fDFG7r+o8/yjyaucvJfRPnFaWVmA9hkf731F7S9f5SXWijRRGpjnk4A3/Ehhhz2bsQDJ6oZp0iXl+o6dC6+yhJcFbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742471024; c=relaxed/simple;
	bh=J/qLx/Cma9wd1wUOCQWIa5qTTB0L4FbuzEKNwp/0c9o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:content-type; b=nWPf4sKghO2IEml89wMNSvKd7awSLgFRPZWGkC9Hdno3qL11HmQcXy2LTiLbDTEpA36JPxhJbVo5YLEUlMlyR0QI8y1JkKAl3B5BV8aSjsGnCqVpupjXueOEJ5m3DZKIuwirwOymoW4ntHfxHdIci2QEfzUwNG/jn2MR8aex0Z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JL8XSDDZ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JL8XSDDZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742471021;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8/kgBG/0AMPOgDydkyyRF4CGCx10th+qQaBXE+E4/kw=;
	b=JL8XSDDZpyQjLsE8G4AmVrC3mXk6DfVNK1aDQgsYrSxzFJ5Bvk70ZATUfddl/vUYU5T9aq
	BocwrwjP1poOc7eYgDmVBCQgwX3zCRop7yaTNl952RO3LNxidbdvZwo6y1AklaqI+1m8E1
	5zuXvYd1gpewuYnsORDqD9zWCE9BoRA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-99-UhbfT5jhO7-cprVR5XP5cQ-1; Thu, 20 Mar 2025 07:43:40 -0400
X-MC-Unique: UhbfT5jhO7-cprVR5XP5cQ-1
X-Mimecast-MFC-AGG-ID: UhbfT5jhO7-cprVR5XP5cQ_1742471019
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-39135d31ca4so384235f8f.1
        for <virtio-comment@lists.linux.dev>; Thu, 20 Mar 2025 04:43:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742471019; x=1743075819;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8/kgBG/0AMPOgDydkyyRF4CGCx10th+qQaBXE+E4/kw=;
        b=SnMDdmjWhNculePLh6hLZWgqkYhDJFgfVsfoknoPjZsGBSZ9009+JzPWJYd38NUz3m
         dsh3iwXnndyVUBwu8TrGT1xFTEvD93h61lBt/qCU+zeN+dp2Bs8lGc1JewfYS7EexQ7E
         6A4kQ8/uJz8H+Sx1v0tyKXWfYfOka/WcII5YDST01VIzUX0iyxjCMgknUEJ0qeWKZEP/
         gnG3akekhbii/GcBdunCDl68x1W7I1WfJRUOcVQo+8U/UQ6BMZ1A9tZC0/m4MmgkzmrX
         uAR+p12PDlizWi7eLTBBcdUA+xsIvjH1kTGUmOK2XZhdgCwFNI2W+e4Uk9BOdvfNZ60u
         A9CA==
X-Gm-Message-State: AOJu0Yydw9B3yQKfqEBKSzh4wwqmfpLdXHSDFs3ggnx3TKfKM9scdsGx
	z0P4sVHk0MRobvRLthNithhnb8ER79tfSJMHVHFYgo7QhJVM66caePH4kjsG0p+GZspFYoEDhF0
	Yp2Awkl7yYaWrD/hjUWi8lFMNyQBaL1XuHZji+cICl9Rgf28oRSt4F++a03hqwTIPN7BwGPSBlv
	3spEEeUrHZB32/MS6ldXBB1kHqHGLO5DMG4TSTNCpby3Kg+OHf
X-Gm-Gg: ASbGncur14ytervNAINzUec7NlooOEcBEL6X58xoXsqxpQ55xL+lkRfUp6/fdIzQoPq
	8Gd2TjiXFUL4RsjUZikaPUbcA8DsxJF5GdLAMtTJmTkn5Px5HFr4XtLuQ7iskdPOWtcz0m962Ha
	uZb8tVZ5IkEaVKkviEM05/XJiQNfJAJFVtvWDe538o8ohODyWSqUZOrJhq+nY9UfSJyokTU7FC6
	7ciDPkYln3rJIpf7u7hLJtiS7CDDr1SJZ2/a3y/eAUOZeTzT1TXZExSky3AhrAH7Y9XqkzT2fsv
	Xu6q/zQh4scGyHIhkQ0=
X-Received: by 2002:a05:6000:186f:b0:390:e535:8750 with SMTP id ffacd0b85a97d-39979576d8cmr2311573f8f.9.1742471018948;
        Thu, 20 Mar 2025 04:43:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/LVfwNA3SY6VNrNZQM67QqETAtANrJlXyEg1vJnkIV/tYn0T19VEoCEuth8vIaX56MLGI2g==
X-Received: by 2002:a05:6000:186f:b0:390:e535:8750 with SMTP id ffacd0b85a97d-39979576d8cmr2311553f8f.9.1742471018454;
        Thu, 20 Mar 2025 04:43:38 -0700 (PDT)
Received: from localhost ([2a01:e0a:257:8c60:80f1:cdf8:48d0:b0a1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c83b748bsm23909714f8f.39.2025.03.20.04.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 04:43:38 -0700 (PDT)
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: virtio-comment@lists.linux.dev
Cc: cohuck@redhat.com,
	parav@nvidia.com,
	mst@redhat.com,
	Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Subject: [PATCH v5] README.md: add example email for TC vote request
Date: Thu, 20 Mar 2025 12:43:26 +0100
Message-ID: <20250320114326.2075821-1-mvaralar@redhat.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dlkmBId9XXqsi4z3_zXXZtHb_xqXQnfdiBVJTzUzMYc_1742471019
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Signed-off-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
---
v4 -> v5: drop subject and only leave body
v3 -> v4: add "[]"
v2 -> v3: use "()"
v1 -> v2: add Subject and To
---
 README.md | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/README.md b/README.md
index c06caf6..0be389e 100644
--- a/README.md
+++ b/README.md
@@ -206,7 +206,13 @@ The mail requesting the vote should include the following, on a line by itself:<
 <code>
 Fixes: https://github.com/oasis-tcs/virtio-spec/issues/NNN
 </code>
-(NNN is the issue number)</li>
+(NNN is the issue number)<br>
+For example, you can use the following template when requesting the TC vote:<br>
+<code>
+Could please open a voting ballot for these changes?<br>
+<br>
+Fixes: https://github.com/oasis-tcs/virtio-spec/issues/NNN<br>
+</code></li>
 <li>Please make sure to allow time for review between posting a comment
 and asking for a vote. </li>
 </ol>

base-commit: 124fcd0e97f209aab19639e7369116d99ede22a2
-- 
2.42.0

