Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DECE3209
	for <virtio-comment@lists.linux.dev>; Wed, 26 Feb 2025 15:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740584015; cv=none; b=QV6LGX1RClxsC5lKLXu0s/66An36MlSnKYvuYanUs0h8oTVBGACIRe2mSFbrZIE/C5MVVBmnai5xBs4j12aK9syX6p8qkR+7moy9ijxEDgvOvN6ftcmsKod8+hoE97LWNiaq88420oTzRBlI37o8wfzgDNBOZ1Dkz3lldUpJ3Ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740584015; c=relaxed/simple;
	bh=Y4NaxZM7qi6B20dFSmkFi/RblVayAsyA8Oj/SSqhdMI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:content-type; b=oC5vmPa3sIPlui+d9eHMxU+SyNkb4w1bnOAkPT18hl7gdhl1XKmkgnu7fY3fWys1jdIMQR1fUAh3Q0mhThkzimUdw2aWYLc7tRuzxFzlwhIzHD3jjprWSyjkUPjDEApQRkuKDuCtxzANM0Xn5uE/NIsNd887Y/mcoROf2Tunbrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hAx1fra7; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hAx1fra7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740584012;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Li/VWSV8RmKfS4i5wjmx/z2jz2Jpz7NukpOicbHl7qE=;
	b=hAx1fra7rrnzv/qbQfqRWc0W/j+OSOxpNh0de9L73TZPtc19TYtAo8J952XX/UCRbRbJou
	bP6WyuhOmIAAPAaKAhfVD3lYpLNgSzLU3QxXpTTQgdNhHXlTwOc1+MDieIiPv2jlaLqK35
	Hs8c6vLGHpPG2nWZRdxXWPG6bOuW7jE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-352-BA9RY-3_OjGxyri18f_zow-1; Wed, 26 Feb 2025 10:33:30 -0500
X-MC-Unique: BA9RY-3_OjGxyri18f_zow-1
X-Mimecast-MFC-AGG-ID: BA9RY-3_OjGxyri18f_zow_1740584010
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-38f29b4d4adso2818997f8f.3
        for <virtio-comment@lists.linux.dev>; Wed, 26 Feb 2025 07:33:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740584009; x=1741188809;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Li/VWSV8RmKfS4i5wjmx/z2jz2Jpz7NukpOicbHl7qE=;
        b=WQ3h58uOd0YyVhIceQVv9YSiGFfbhEfsu7/lV+/qw8hn1iAo1Z+9KsJAgXnSYB7aoU
         a54kBGT/QUUuIUY+SFWj2J5Szw3i1Xd0Bfi7jPntXt1CGUPlc2JurBVwlxZBvWljmh+b
         xcYXMZAwtCVpVzgXbMfBHiUi44pWMxP5K1P7h7h1tvXm+UEcdrTG7OuxXO8rwJs9VhKY
         QFFhVjUFzn/Yo5qXDUeSv2INdM3714+wr368MN/OfoaICdiCod/OCyz5uo2dopX0th+d
         EAr7D8iwBWFbMKLisReVaKtkdsTF8mjtRITTDXBiHOHRpEEcXOCZmZn2b4ivpEv11cFk
         FD9w==
X-Gm-Message-State: AOJu0YyEpIRBafTa2J9xQx4zQPQJLw9O2ZXe2mM4XFZk6qQ5RJoMshCs
	yRATXmxJnHnuOogLMSYWr3Upa5IWT/blMrhKkc45Ct4Dg5YEwGCd6BvWadinYGc6ZLEchlHoF/r
	mxn4RLDcOjM0imQVtHFPVwaouzsJBYuh1T+iEJ0ve8W1UScGlznoKY48cLm34tLgbmX/nqzG7ip
	o1HGx08AtdJOFXJgUYka65IEbdcwRUON0QHbU2qkWyeHw9V86i
X-Gm-Gg: ASbGncveuBglLzUlzvLkOKqWM9/lpC9pdIiE5kA9P9SCcEJz8Corw9PmLWGlHOmfOk4
	pnEVTcwPERXsG2EpcIrxemDQTHIa34e6yGZxVVEliKdUZecOw6M76LAIOq1UYpM9upYEPpKEHFm
	4dF/Lo5VNmQBFMOnoiRYRKyy2P0yenclEAGpngUCYhTY63er12P/riUofKwZVmk4OOCFwX6j1Nq
	SBJ7gJTHOODDhfRWnIO5wd7I9KwyXgELNZq3+uNpmoXiNT2xAc1u/12qp185P5DSjWpF1QZj+9g
	xVjsVgDWnaqgBx8mAk8=
X-Received: by 2002:a5d:64a2:0:b0:38d:e078:43a5 with SMTP id ffacd0b85a97d-38f6e947079mr19589032f8f.13.1740584009150;
        Wed, 26 Feb 2025 07:33:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEnoV+ruYSW7Zfm5NL/whOvf+XcghwxOSNMGo26b8KGxp66oSNlJPDZW0RLYnmmFzUsCdz9tA==
X-Received: by 2002:a5d:64a2:0:b0:38d:e078:43a5 with SMTP id ffacd0b85a97d-38f6e947079mr19588988f8f.13.1740584008592;
        Wed, 26 Feb 2025 07:33:28 -0800 (PST)
Received: from localhost ([2a01:e0a:257:8c60:80f1:cdf8:48d0:b0a1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390cd86caa8sm5923444f8f.25.2025.02.26.07.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 07:33:28 -0800 (PST)
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: virtio-comment@lists.linux.dev
Cc: cohuck@redhat.com,
	parav@nvidia.com,
	mst@redhat.com,
	Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Subject: [PATCH] README.md: add example email for TC vote request
Date: Wed, 26 Feb 2025 16:33:18 +0100
Message-ID: <20250226153318.1243033-1-mvaralar@redhat.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lU0A9OYJtPgSIrtcUK24Ct5Qg_3oSZ0wu6yGB0U02co_1740584010
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Signed-off-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
---
 README.md | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/README.md b/README.md
index c06caf6..5f76e0d 100644
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

