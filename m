Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6199A27C15E
	for <virtio-comment@lists.linux.dev>; Tue,  4 Mar 2025 16:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741104691; cv=none; b=T7/je18jHo9G/fWsXvGfVICJVe62RI7bYTOMnMkkjhaQX07TNsdXACtEXy6ZwmWYwO1Y2kLsFeBuglNrKyMtw84M1LQOjLgVTd9QAerfUbFpZWm7joE4p3LqQTfgHOeZHaT/FydajkQWbZJ3t6izWZ6S2UqDkHK7HN0W9BhA8PU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741104691; c=relaxed/simple;
	bh=dySMsQ81B9B7dQKXiYRABC8FY7PBhdnP9lIaEyQwKj4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:content-type; b=pefA4xVDIfdjpLjCBNHk8c7E+21VP1QRqOCj2p7NJ0QyPA0L/3GtvBDCnBgxk9hIUrT+b6RTPrC9P6LNJr73G9hUPxVYuIXNhCotGw51qiLXJMkj5iO/G6SwN66ITcyuV38n6y2v1S7McMP0q8o12oZzxhRRWjdXl2NbmPwPs+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QP8rtCpw; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QP8rtCpw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741104688;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WPy4elQmIzEHlqtUojPHwn+vZbkkDNTFnKGbK+QX+6s=;
	b=QP8rtCpwDZfxG5MsVmFDlV9oZalJX8j4usSTgdoZpkUEHCnqBWZx74JEQSWSIvTY3NaxOH
	zdrtqu9HM8epQGheqgVVq5knhk5irVfGhTFHMmc67Sa6fTw+JE33Ct4LZ4UHT1SXDdpP/y
	kHvE9+sKNYWGYQM9dDotWXS+NeX8+FQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-593-omEzFyaPOI-4sT4aVDKoFA-1; Tue, 04 Mar 2025 11:11:22 -0500
X-MC-Unique: omEzFyaPOI-4sT4aVDKoFA-1
X-Mimecast-MFC-AGG-ID: omEzFyaPOI-4sT4aVDKoFA_1741104681
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43947a0919aso52633915e9.0
        for <virtio-comment@lists.linux.dev>; Tue, 04 Mar 2025 08:11:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741104680; x=1741709480;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WPy4elQmIzEHlqtUojPHwn+vZbkkDNTFnKGbK+QX+6s=;
        b=J0guu+FIGx9e7Yq0W1Ic/psEjbvz1ImlN3Pg+lASyq4I4G1LH+moLTmimMfQs5U0pE
         7+8d5pbIHi/vpPy23Smljhu/H0qK1u7LT9ZDnke8/+ohT3FcE0vE5Exk2dgVngWcYm3B
         0uvsq0tnYboQPsAFI6bhAwP6KMTFRdzlmR9xwYMkKA1uHE3gSNQhamc7bbxWzlBvP5SY
         rItMe611RE/sims6wqbH2lmbh0eJLTbtupqO/6HP+/y/JnHC50jCzYbQTHFW1SWBHWk4
         ovAw6DffOds8Dura6k7v2aOyCIyyQGuYqPTRcu+kNFSvYB00e/aOL1tUnicM2O/+Nykj
         NQtQ==
X-Gm-Message-State: AOJu0YwDXyd5fflSsZEH4reRSlADb8/YzmyYPA0DTaJqkicm1jyPHVU0
	tAS3txDjCtWdf3x/RRHx9CSHcJF+iWHhIEkoCIxZzoN0grU2vBSJl3tLilhHvvH7DMAhVre1/Af
	rA6qF4fmjhQZOKksB5ufUGq5OWfB23ZDQLMHFkNM6hauM5rQ4rVIuQ/H+aKCmnCC5w06pDtYOW7
	8U3m4GQa1a4SkE2qltyz4TnWCp0GFgbVaBtIInJShaP9LqwJss
X-Gm-Gg: ASbGncuRnJC9C7HNa6Pskijv1l8bQEdz5UmzQU7PyW2tEajvz3/6r8ScTw4PmsswHiJ
	Pq9WGgwLyRYtGUoQXRepkifbAxk2DkJwz1CkPl8Ixh0E50SwKbAHNj/daGOdQ1s1DVw/nD4tnOw
	YdYSuiOh7GXgGCLpTvOAqsKvEvhxd41QReGJpsSMbsih9MHtz7+DkGHJw30voz1wEnPQi6kU18o
	mI+as2+u3UGLrhJx20o+L8z9RLO/AzIcNXFvSQQ59BZOVvbB4MwHyibzL0xQClzX1sSlOHYZEV2
	EXwQ0VKl110+cfvN9GA=
X-Received: by 2002:a05:600c:4685:b0:439:a0a3:a15 with SMTP id 5b1f17b1804b1-43ba67045camr188939145e9.14.1741104680575;
        Tue, 04 Mar 2025 08:11:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHw/xVisvp99KNcwrdBcFaeaa5F0G3y2hlpfTkdhj5+1QOF5wP9b+uQk8AVvUT3Yg9SwkS8Dg==
X-Received: by 2002:a05:600c:4685:b0:439:a0a3:a15 with SMTP id 5b1f17b1804b1-43ba67045camr188938845e9.14.1741104680214;
        Tue, 04 Mar 2025 08:11:20 -0800 (PST)
Received: from localhost ([2a01:e0a:257:8c60:80f1:cdf8:48d0:b0a1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bc2d76c9esm72728955e9.26.2025.03.04.08.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 08:11:19 -0800 (PST)
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: virtio-comment@lists.linux.dev
Cc: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Subject: [PATCH] git-publish: add profile
Date: Tue,  4 Mar 2025 17:11:13 +0100
Message-ID: <20250304161113.1445602-1-mvaralar@redhat.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: y9Wi_3RnhEj8S_pcjzEqwsdW0OtWSz2x7d27bkNysF0_1741104681
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Add git-publish profile and document how to use it.

Signed-off-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
---
 .gitpublish | 3 +++
 README.md   | 9 +++++++++
 2 files changed, 12 insertions(+)
 create mode 100644 .gitpublish

diff --git a/.gitpublish b/.gitpublish
new file mode 100644
index 0000000..d412896
--- /dev/null
+++ b/.gitpublish
@@ -0,0 +1,3 @@
+[gitpublishprofile "default"]
+base = master
+to = virtio-comment@lists.linux.dev
diff --git a/README.md b/README.md
index c06caf6..39f22d4 100644
--- a/README.md
+++ b/README.md
@@ -110,6 +110,15 @@ git format-patch -o proposal1/ HEAD~1..<br>
 git send-email --to=virtio-comment@lists.linux.dev proposal1/0001-*
 </code>
 
+<dl>Optionally, you can use git-publisher to submit a patch. The procedure is the following:
+<code>
+git checkout master -b my-feature<br>
+# work on new commits, add your 'Signed-off-by' lines to each<br>
+git publish<br>
+... more work, rebase on master, ...<br>
+git publish # will send a v2<br>
+</code>
+</dl>
 <dl>
 <dt>When to use the virtio-comment mailing list:</dt>
 <dd>
-- 
2.42.0

