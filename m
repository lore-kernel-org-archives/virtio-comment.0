Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 316D413A3E3
	for <virtio-comment@lists.linux.dev>; Sun, 14 Jul 2024 16:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720972806; cv=none; b=Wi0/T7j8JmlzCfai+pbv31JBO1NhusHxMAaqXbcdahMnghFOhxIgx4FRbM3zAA1yFnlIbcJRbidPxp0gjSAuqPI2xn/uk6LIyA9zGBqQcyiEltj5HEudxtm5yOodtqtAXy52krgsOxMkUBDBcDp1szQ4kWibswtcBU2PDuzaK7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720972806; c=relaxed/simple;
	bh=jNY4fyJinWiqHDgJwkCNayE+AN9SCVoeAZBbMn1ClgI=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BgWxzIwSfMMUi0Ub31R5qge8Zx1WcZ79PgAm6XMoDCRTWZwB84m8opJGGeUS6HwtYtxZxAbH0oU8FhIARB30K05UNwuGN6+1F7PMv6Z4FyI/D6PpCo88BQ5g1AvdVVW45ilEv/ZA22JESo5qSYZZAnb2aKeRfFqJHpFm5YXkS/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=K4CMdXMu; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="K4CMdXMu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720972802;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=SqrNSkZV5PM89Sr4X4BISIq9uWS3RmPXHynzGrodKSU=;
	b=K4CMdXMuoZQW052SfH+erejDYkSLuLVRg3oeNI0htA/Ahx1ROyzSlBImdCMIXyrcYBBQa2
	PRdVqlW2l/7Vm6RH3ljaC2YcDAuzeAlJrKrJgeXotYTEz3fDrpNGpWoWXVUXNaenGiIU+y
	KGyBWrr605ynThJFArL4wFrI99mOD0M=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-55-b9NPRmGPOfW8QBVzs4qVyA-1; Sun, 14 Jul 2024 12:00:01 -0400
X-MC-Unique: b9NPRmGPOfW8QBVzs4qVyA-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4266edc9c85so25607605e9.2
        for <virtio-comment@lists.linux.dev>; Sun, 14 Jul 2024 09:00:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720972799; x=1721577599;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SqrNSkZV5PM89Sr4X4BISIq9uWS3RmPXHynzGrodKSU=;
        b=CWWtf1BoiSiEmSHu4o5HUb0bQbqieD1aYJCYV2Lg7rGx3xFVnQCAR+Kzph5L31ecGZ
         sXLiluvkYD8w7y74YSpwBqe/QbvS/yPe8DCg87SHemm/fEfr89qyc+fR6lqVxBBtLMSI
         SeGVVaznvbn1D6YvIatOJpzgWdSotLoYILv98jhF4n44uliWEbDAUqZzw2K7CVqU8npv
         1rUhHAf7JXzDQPuuBQMNK7QdMwNm1ueJUHYQhQraWPlERrIdfK88KknzyZH554HxGMO2
         AEQ5KRv2lmh3qv+CsmjFA8x5Fg19Xt4TOOUfIhEURlfpZ6lTn7AKZj/jLRqxFdnwXqQF
         GBdA==
X-Gm-Message-State: AOJu0Yz0vE/3O4dVlUy3bFBm0rIwX2K8eXjIordeGoMDPLhNDImf2ZES
	IRbVQPm27RedSMNEEC9PNHdab81jAxRIjJDjVDfNPeDsxhKbF8aQycrlNIHzzFjXqDJIKeDkVnZ
	4JgWIIO1ev/jGhw4a8bIak212dkkcgvjwFOd62yk4J3U5Ewq9N/74A8utxd8wC4T2VaHhCkUyai
	zBYD7zWRbsOL7R3xaMcc5udyFjBpl5p2E9rqevQmxnMA==
X-Received: by 2002:a05:600c:6d84:b0:426:61e8:fb3b with SMTP id 5b1f17b1804b1-426707f81b0mr90022485e9.27.1720972798821;
        Sun, 14 Jul 2024 08:59:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF08aL5NvrplJ88GvYrfpGmKS2S88Vd7tejlXYlkpSey9/lbYadcz5ts4l+g8wQkzqAea72uw==
X-Received: by 2002:a05:600c:6d84:b0:426:61e8:fb3b with SMTP id 5b1f17b1804b1-426707f81b0mr90022375e9.27.1720972798178;
        Sun, 14 Jul 2024 08:59:58 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:240:5146:27c:20a3:47d4:904])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4279dae5a87sm48601355e9.1.2024.07.14.08.59.56
        for <virtio-comment@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jul 2024 08:59:57 -0700 (PDT)
Date: Sun, 14 Jul 2024 11:59:55 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: virtio-comment@lists.linux.dev
Subject: [PATCH] makediff: cherry pick table env change
Message-ID: <e69cb7619afb40089440f12cd002f1af5429b090.1720972792.git.mst@redhat.com>
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

latexdiff can not cope with environment name changes.
cherry pick to avoid confusing it.

Fixes: 72a91e6 ("admin: Prepare table for multipage listing")
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 makediff.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/makediff.sh b/makediff.sh
index d6c9bcc..fde761f 100755
--- a/makediff.sh
+++ b/makediff.sh
@@ -21,6 +21,7 @@ while read -r rev; do
 	git cherry-pick --keep-redundant-commits --allow-empty `git rev-list -1 -F --grep "$rev" $newrev` || exit 1
 done << 'EOF'
 editorial: allow for longer device id table: makediff 1.3
+admin: Prepare table for multipage listing
 EOF
 
 #mv specvars.tex specvars-orig.tex
-- 
MST

