Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F367418C335
	for <virtio-comment@lists.linux.dev>; Mon, 15 Jul 2024 14:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721053509; cv=none; b=tEMA7N8StuNz716kDFG5PQkr1DvxVwPnZYlO3DhXPfec1tltZfZSTm7uVdRlyUK1m6L/NSKTEGLzaydEu88B63omkPIKmu7LBiIagMuCZGuqIjzSaapy6c9fOe2QXN1n93w99WoEdWxlK9jrNWrCiXnMgKJLhUSxT6LD6CBPIeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721053509; c=relaxed/simple;
	bh=MR2Eo+CD9GP3NlU6y/3EtZsL69Fsk5q43FpEZtNe4G0=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sw6+xJGYTu8aH8CusekXWlDXUSDHBYUv1YM91YRrPFAfFaITRlptWrJqszmMLqVSTugQNSVdoMktg5PmVzkKP54a13OtgZTYvZM5ZUmA6MmH8JsS/cC1wHK2rklD8S2kaqYxhszKlQ9qvXIkEYmJ6Rnd+m45XrWQE+1TG9cKybE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Iwfe17P+; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Iwfe17P+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721053506;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=LxDieOamCTVIN8xoUtE/drVZc+jpH0bKCG4F3eeh4Pc=;
	b=Iwfe17P+T54QcJJV/az9jC8H/xe1W72l35DR8H2/e+OCSAFED5pbzY+pKE/75ZeN3Giu/N
	153LP4Wpu5f76Ztq9lXEi+1pAMD9G2h/HWjhogU5no4DXnuR65Xtaa3k3aNy6qGB6djmst
	X9R4BuocB+ILTBoT3ZUy2gZTf7GNOho=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-55-kemjQG2DMfKTUsXj176H2g-1; Mon, 15 Jul 2024 10:25:04 -0400
X-MC-Unique: kemjQG2DMfKTUsXj176H2g-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-426679bc120so31871175e9.1
        for <virtio-comment@lists.linux.dev>; Mon, 15 Jul 2024 07:25:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721053503; x=1721658303;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LxDieOamCTVIN8xoUtE/drVZc+jpH0bKCG4F3eeh4Pc=;
        b=ZWDjjNu/DPMh2k6w43lH/MpBw0KFwoyUY5L1ItgkZxTkYsPYJJK5MiGYSizDo0//3Y
         RWeBZPG2vkfxP1gYM8J3U8P0frAc3GFny96ruBUlY57XKMsUIPsw37vCtFV/vcUsNaPY
         Vj5w4Jy5QGh9VgjANwImOUhXH3RBKmma0NV8tPQeEWIBAaBIFcqmCPod2xras1Vsam2O
         3OyOHmWPNz2jgVErdxgVeCYz/4VvIaoevsSU5QXGRHDE7ZWzSk0/w1BQFBC3zREQg7mt
         9QG1/6429HSfS75BJW7pCqNgHgyeZX0m9/1b2vh3pHUGgkYcjCYRYnUw5frPb74OPbNV
         2a2g==
X-Gm-Message-State: AOJu0YyqycZNSaVAEMYkPxOW1c0ysY9it6TknLwg7oIUNJMS6rSgftvZ
	GYCnBeTCz4ixlJvQGrB3I4z+d7Bm/z8W26me7mIM+4ZSwODihpaGSSHdaLNvbRr7jIpj+0RjXaU
	WyjQ4NqPcxPbXFF/Njw6VCU1a/uBu0LQcpNHlzmiQlNn9oSaMsSfY0WBDIEutE/dPRNG2kpt0bq
	eHoqu5s+/azW1WzuuDKHI9vh3fzqUX2oLtinPaahQbEA==
X-Received: by 2002:a5d:56c2:0:b0:367:9287:64c1 with SMTP id ffacd0b85a97d-367cea67d54mr12142535f8f.16.1721053503461;
        Mon, 15 Jul 2024 07:25:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHEQXmL7aW7+X/KB4Zvys+u+JGRBFTgYhP3K9s46+kUIWDGS5RUuIQ/4yBlvYPTQKsfvKCPxg==
X-Received: by 2002:a5d:56c2:0:b0:367:9287:64c1 with SMTP id ffacd0b85a97d-367cea67d54mr12142511f8f.16.1721053502689;
        Mon, 15 Jul 2024 07:25:02 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:243:da88:7ff9:68fc:2f43:bcdf])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3680dab3f2esm6569125f8f.18.2024.07.15.07.25.01
        for <virtio-comment@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 07:25:02 -0700 (PDT)
Date: Mon, 15 Jul 2024 10:24:57 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: virtio-comment@lists.linux.dev
Subject: [PATCH] makediff: look in subjects only
Message-ID: <1f3f301f2e1baa87372764b9d342d04572e1c0ca.1721053494.git.mst@redhat.com>
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

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 makediff.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/makediff.sh b/makediff.sh
index fde761f..11e518a 100755
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
 admin: Prepare table for multipage listing
-- 
MST

