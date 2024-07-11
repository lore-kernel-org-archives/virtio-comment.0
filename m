Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6036F8BFC
	for <virtio-comment@lists.linux.dev>; Thu, 11 Jul 2024 20:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720731414; cv=none; b=THFbrYYyvPntcHgCVljF2PFGW0jthL0fTcgq4JFA90V/ydtUo05p9cISDTPEnWdlZWuFe3lMGi6ZGo0ORgupu5b0iZuYMqNnq+0iwG87jCLnC7oZEAE/InXApBe5WRYlXkF3TPsvpN5/mCDQMSliGdgBK5/nBphJzgFsFibkAM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720731414; c=relaxed/simple;
	bh=2DlaBgifgXD8Q+2bWr9OyLoGxJip3R7Mg4fPZfF1k70=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SVi0rNa08qEV304BtTQUOrbc4MemFQ84lIWDV7u3u/DSH9Qw8CYl3ts2/7PGk8QXT884eNAwFQhpMinRXcU/Gaum0dk0rzcr4JkqdD0xLgZUd9h1UaA95LhZkL02dwbomUQaKW55fH98Us38Ytexn6J7PNbLxUl+sEczzAMYXwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KYYkUHU8; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KYYkUHU8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720731411;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=dIhiALQVC8LvS675W4dXRoUiBlJIP7aZwrMonhAFPfg=;
	b=KYYkUHU8cQ0F7fbdM+7WRK9RwpZioROJQsO9ZxOB1FofiIC5jGBw/nSvdFysjGRW7s3N3q
	l37/affocqM7QX678SKA+CHKA4iafKhmepsveJg7tgS7kihKCMBZjK6yxkpROAj+lRnBGx
	+N5VPSQG+N7fzwgqsVr6+4j8Riegog0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-205-pHDT3R6pP_KoRbrr2QJQYw-1; Thu, 11 Jul 2024 16:56:47 -0400
X-MC-Unique: pHDT3R6pP_KoRbrr2QJQYw-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-367962f0cb0so875253f8f.1
        for <virtio-comment@lists.linux.dev>; Thu, 11 Jul 2024 13:56:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720731405; x=1721336205;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dIhiALQVC8LvS675W4dXRoUiBlJIP7aZwrMonhAFPfg=;
        b=P81cYkJexekOT2RY+VgUmGuDyFnmp1GVqV+vg3LWzMaO0WXw8iFV4yRTLOsJAK9SgP
         wW+luKPtehxGtgfCf0yvyn2fentWex/lscFNueZ5QEHXYJZkvjbIOdtnzQ0CkTe9pzWZ
         FdRzY3PnhJnxLkZjidxxR5FuLLGS6EfOfBKzKN7Amq+9y6lbLUjZ/NFUmdQJ39Job396
         BJ3m5yw2qhjwUzh0NHJNw1nrSpOFxF506hGQVW35dvhAzL+BD9AakKJEzY8liu9fe5Xi
         hZbJB+J2MOZF7iWZbXKUZ1YqnTjMeC5YCoU23GvJfy5fnmvcz9BokxUS9Cxr/fsrcWM+
         WnpA==
X-Gm-Message-State: AOJu0Yxq9zPMszxgIK1CKknLjDXmML4ZwdxEI18Ycg/4UNJZ9CXChfsu
	rfgKFMqmOrWaBATo+EXAoMcMHk6cEz/Owu5b6/xU51f9QFA9/F+bPs5o2Jm9b43zqy9KeWOkU8e
	1C/kLCKmSvMggGzTblVfxaX6r5RAKSZ0bRXsAuDQHm8/kGuQ+PRYbGRZZiTp5b1+jFGIBYSuCx3
	iOBpgZqOVUfC8aS5p6AvaPpTPwDw7DV6j428Q8S7FDMw==
X-Received: by 2002:a5d:598d:0:b0:367:8a2b:7354 with SMTP id ffacd0b85a97d-367cea466c5mr9001978f8f.11.1720731405561;
        Thu, 11 Jul 2024 13:56:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHHHEAvJ5u/99tLFJ4CrtX6SZuQtOdGn/nK+cmH/q6BqeRqDn56Y1HdVycXjd2DNEQzdZ/+2w==
X-Received: by 2002:a5d:598d:0:b0:367:8a2b:7354 with SMTP id ffacd0b85a97d-367cea466c5mr9001960f8f.11.1720731404815;
        Thu, 11 Jul 2024 13:56:44 -0700 (PDT)
Received: from redhat.com ([2a02:14f:173:2166:83a4:d566:a055:a5a3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cde846dfsm8580480f8f.28.2024.07.11.13.56.43
        for <virtio-comment@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 13:56:44 -0700 (PDT)
Date: Thu, 11 Jul 2024 16:56:42 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: virtio-comment@lists.linux.dev
Subject: [PATCH] makediff: cherry pick label change
Message-ID: <216774e3fa811e0a6e994a3815f0804ddfc0bb03.1720731399.git.mst@redhat.com>
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

label changes tend to trip up makediff - this one
causes an undefined reference from deleted section.
To fix, cherry-pick it.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 makediff.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/makediff.sh b/makediff.sh
index 897eead..830a226 100755
--- a/makediff.sh
+++ b/makediff.sh
@@ -20,6 +20,7 @@ while read -r rev; do
 	echo "Applying $rev"
 	git cherry-pick --keep-redundant-commits --allow-empty `git rev-list -1 -F --grep "$rev" $newrev` || exit 1
 done << 'EOF'
+content.tex Fix Driver notifications label
 editorial: update "Computer Language Definitions" URL
 EOF
 
-- 
MST

