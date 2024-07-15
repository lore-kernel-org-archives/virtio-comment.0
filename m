Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F6631CF92
	for <virtio-comment@lists.linux.dev>; Mon, 15 Jul 2024 16:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721062185; cv=none; b=vEks+WWsZt9MDmbeBFqD2SfzevzYJurNOS3oSH7/cfQe7yJ5+VhmV5RNeodcaWquojbF/vqGMoa90RPTvnMugghkhIazlhdow3vvRfhrinPBWiwwazI2tKxyuxjkefUtYIWyWientHyeVqdOq6y0FgXTjR4wDwREjgD/FpAqgVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721062185; c=relaxed/simple;
	bh=PX9v7QnjDsq9kCDfUKzR94ONlpKVy6mdFDqfuAQTq8Y=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=p6bDrgdYH3USRBi1Gz84Np96AVNyGkjfVls5q1WvjftcXrjUXndFjt5pN4zzc7fD1SY1pIRMn0MnJLZtbt6Dw7QfGQSIr341tx6hTZO+5dwar8jnnpRotGq6MixH7CjXpL3q+lhNFiCqQIu3ky+Nm8TmSQzFarfL4P1YXZzD1ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hKUUeuvT; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hKUUeuvT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721062183;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NXf/JuT872UAvcmg3tKUobqpUTgSr8ElfGE68keetxs=;
	b=hKUUeuvTnqBcQ5pqZry4L3FvoQGrGTumACWmr8XpUHlo+eYfX+Ss1usw3MUqSmqqZLMMNi
	Ob140hsdVFvFENZZifCzGxr0219tiFNUA+ErQOZEQrCyl0ejkczh9lXWliFY6xTN3W8zcQ
	fXeFZdyKXCVf3iKMyCtoa+635zFmQ+8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-612-3SXMKQAZMe-wigsGMK3KoQ-1; Mon, 15 Jul 2024 12:49:41 -0400
X-MC-Unique: 3SXMKQAZMe-wigsGMK3KoQ-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4279837c024so32385105e9.2
        for <virtio-comment@lists.linux.dev>; Mon, 15 Jul 2024 09:49:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721062179; x=1721666979;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NXf/JuT872UAvcmg3tKUobqpUTgSr8ElfGE68keetxs=;
        b=lqpJoasXouix7h4GJXhSF+ZmQzOzvxzH5t5HGkryGtzUgvuVxMSXah9NlORhhGl0bV
         BRISn1vzUJ7TV0MjxNGPx6h/PSeBTlaswaPnI9UTuTjOwY9ir3ncqR56X2gy/hlT9ttn
         n86xMEz4OjsI1lwclOMLkoZyxmxPV2oVgVWhOLeWYSV4oKJ+XXF6JrwmE6KDxd+iVcEA
         it9hAWhLqsamRTBHxIB+3JrKtwSSjKjFd0bAscFGbu4EHYFgCYjPgUS0toFdmgbc8Fmr
         n/1a074j0vhRgs88f3Y7QYKgsBuIvnCJlhf6nj/wQuZn5/Z1bAOUIXN/O77NO2LY+LTl
         c1WQ==
X-Gm-Message-State: AOJu0Yz6geyLkXE0V2PGHNCUlFEh20DL/ULgNQpwQO16dBgU6z8BCXdm
	iEkipJxyp1IEdn5oIu1IMm6NNpWfT8taeD12hLv4/IY8zs3UtbPGug3lzwIHMrtL0+lJniOld0U
	MQEpaAsloXxJN261F7zl414EzAj4CKcCiUD5WZw5d0AkJFPB3EKh2WejM7gEO4RciP90R2fmVFs
	TU/lsD681SevKmLOjJmTnH4TgcZ/qW7zl837js4CPH4A==
X-Received: by 2002:a05:600c:1d11:b0:426:5f02:7b05 with SMTP id 5b1f17b1804b1-427b8892cf6mr1541895e9.2.1721062179697;
        Mon, 15 Jul 2024 09:49:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEODeeL+/1PGg+h2eOcSP95VUh4MAMzUpvUg73rnpaKtqtGd/mDrN2SYLDE/pAw94v8iFunnA==
X-Received: by 2002:a05:600c:1d11:b0:426:5f02:7b05 with SMTP id 5b1f17b1804b1-427b8892cf6mr1541635e9.2.1721062179049;
        Mon, 15 Jul 2024 09:49:39 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:243:da88:7ff9:68fc:2f43:bcdf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427a5ef460csm94787005e9.44.2024.07.15.09.49.37
        for <virtio-comment@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 09:49:38 -0700 (PDT)
Date: Mon, 15 Jul 2024 12:49:36 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: virtio-comment@lists.linux.dev
Subject: [PATCH 1/9] makediff: look in subjects only
Message-ID: <1130700f4ae71a93d9887af35cf105731219f057.1721062136.git.mst@redhat.com>
References: <cover.1721061782.git.mst@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <cover.1721061782.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

We currently use rev-list with -F to find commits.
This helps if commit subject has any special characters
but means that pattern can apply anywhere in the line.
In particular, a common Fixes: (hash) "subject" pattern
we started using implies that fixups are picked up
instead of the commit.

For now, just switch to using regexp (dropping -F)
and add "^" in front to only look for the string at
beginning of the line.

We'll worry about more elaborate logic later, if it's ever
needed.

Message-Id: <1f3f301f2e1baa87372764b9d342d04572e1c0ca.1721053494.git.mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 makediff.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/makediff.sh b/makediff.sh
index d6c9bcc..f98fa33 100755
--- a/makediff.sh
+++ b/makediff.sh
@@ -18,7 +18,7 @@ cd "${cur}/old"
 git checkout $oldrev
 while read -r rev; do
 	echo "Applying $rev"
-	git cherry-pick --keep-redundant-commits --allow-empty `git rev-list -1 -F --grep "$rev" $newrev` || exit 1
+	git cherry-pick --keep-redundant-commits --allow-empty `git rev-list -1 --grep "^$rev" $newrev` || exit 1
 done << 'EOF'
 editorial: allow for longer device id table: makediff 1.3
 EOF
-- 
MST

